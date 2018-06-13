From: Manuel Bouyer <bouyer@antioche.eu.org>
Subject: Re: 4.11.0 RC1 panic
Date: Wed, 13 Jun 2018 10:57:36 +0200
Message-ID: <20180613085736.GA8026@mail.soc.lip6.fr>
References: <5B1CF56502000078001326FB@prv1-mh.provo.novell.com>
 <20180610105728.GA3492@antioche.eu.org>
 <5B1F7CEF02000078001CA402@prv1-mh.provo.novell.com>
 <20180612113905.GA25889@mail.soc.lip6.fr>
 <20180612153844.GB17270@mail.soc.lip6.fr>
 <20180612205540.GA9392@mail.soc.lip6.fr>
 <5B1FB0E5020000F903B0F0C2@prv1-mh.provo.novell.com>
 <5B1FE90D020000F804A5F2B5@prv1-mh.provo.novell.com>
 <5B20335B0200008603B30F33@prv1-mh.provo.novell.com>
 <5B20D0C102000078001CABB9@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="M9NhX3UHpAaciwkO"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=otbb=i7=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1fT1b4-0005Qp-9w
 for xen-devel@lists.xenproject.org; Wed, 13 Jun 2018 08:57:42 +0000
Content-Disposition: inline
In-Reply-To: <5B20D0C102000078001CABB9@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 13, 2018 at 02:07:29AM -0600, Jan Beulich wrote:
> 
> (XEN) Assertion '!page->linear_pt_count' failed at mm.c:596
> 
> In fact, there's no assertion with that expression anywhere I could
> see. Do you have any local patches in place?

Yes, 2 of them from you (the first one is where the assert is). See attached.

> In any event, to take
> care of the other assertion you've hit below an updated debugging
> patch. I hope I didn't overlook any further (cascade) ones.

Will rebuild with it, I'll keep you informed.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=patch-tmp

(besides a more reliable confirmation - or otherwise - that this indeed
is an issue with 32-bit guests only).

While I think I have ruled out the TLB flush time stamp setting still
happening too early / wrongly in certain cases, there's a small
debugging patch that I would hope could help prove this one or the
other way (see below).

Btw: You've said earlier that there wouldn't be a domain number in
the panic message. However,

(XEN) RFLAGS: 0000000000010246   CONTEXT: hypervisor (d14v3)

has it (at the end: domain 14, vCPU 3). Just in case this helps
identifying further useful pieces of information.

Jan

--- xen/arch/x86/mm.c.orig
+++ xen/arch/x86/mm.c
@@ -578,7 +578,11 @@ static inline void set_tlbflush_timestam
      */
     if ( !(page->count_info & PGC_page_table) ||
          !shadow_mode_enabled(page_get_owner(page)) )
+    {
+        /* NB: This depends on WRAP_MASK in flushtlb.c to be <= 0xffff. */
+        ASSERT(!page->linear_pt_count);
         page_set_tlbflush_timestamp(page);
+    }
 }
 
 const char __section(".bss.page_aligned.const") __aligned(PAGE_SIZE)



--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=patch-tmp2

$NetBSD: $

Commit df8234fd2c ("replace vCPU's dirty CPU mask by numeric ID") was
too lax in two respects: First of all it didn't consider the case of a
vCPU not having a valid dirty CPU in the descriptor table TLB flush
case. This is the issue Manual has run into with NetBSD.

Additionally reads of ->dirty_cpu for other than the current vCPU are at
risk of racing with scheduler actions, i.e. single atomic reads need to
be used there. Obviously the non-init write sites then better also use
atomic writes.

Having to touch the descriptor table TLB flush code here anyway, take
the opportunity and switch it to be at most one flush_tlb_mask()
invocation.

Reported-by: Manuel Bouyer <bouyer@antioche.eu.org>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- xen/arch/x86/domain.c.orig
+++ xen/arch/x86/domain.c
@@ -1631,7 +1631,7 @@ static void __context_switch(void)
      */
     if ( pd != nd )
         cpumask_set_cpu(cpu, nd->dirty_cpumask);
-    n->dirty_cpu = cpu;
+    write_atomic(&n->dirty_cpu, cpu);
 
     if ( !is_idle_domain(nd) )
     {
@@ -1687,7 +1687,7 @@ static void __context_switch(void)
 
     if ( pd != nd )
         cpumask_clear_cpu(cpu, pd->dirty_cpumask);
-    p->dirty_cpu = VCPU_CPU_CLEAN;
+    write_atomic(&p->dirty_cpu, VCPU_CPU_CLEAN);
 
     per_cpu(curr_vcpu, cpu) = n;
 }
--- xen/arch/x86/mm.c.orig
+++ xen/arch/x86/mm.c
@@ -1202,11 +1202,23 @@ void put_page_from_l1e(l1_pgentry_t l1e,
              unlikely(((page->u.inuse.type_info & PGT_count_mask) != 0)) &&
              (l1e_owner == pg_owner) )
         {
+            cpumask_t *mask = this_cpu(scratch_cpumask);
+
+            cpumask_clear(mask);
+
             for_each_vcpu ( pg_owner, v )
             {
-                if ( pv_destroy_ldt(v) )
-                    flush_tlb_mask(cpumask_of(v->dirty_cpu));
+                unsigned int cpu;
+
+                if ( !pv_destroy_ldt(v) )
+                    continue;
+                cpu = read_atomic(&v->dirty_cpu);
+                if ( is_vcpu_dirty_cpu(cpu) )
+                    __cpumask_set_cpu(cpu, mask);
             }
+
+            if ( !cpumask_empty(mask) )
+                flush_tlb_mask(mask);
         }
         put_page(page);
     }
@@ -2979,13 +2991,18 @@ static inline int vcpumask_to_pcpumask(
 
         while ( vmask )
         {
+            unsigned int cpu;
+
             vcpu_id = find_first_set_bit(vmask);
             vmask &= ~(1UL << vcpu_id);
             vcpu_id += vcpu_bias;
             if ( (vcpu_id >= d->max_vcpus) )
                 return 0;
-            if ( ((v = d->vcpu[vcpu_id]) != NULL) && vcpu_cpu_dirty(v) )
-                __cpumask_set_cpu(v->dirty_cpu, pmask);
+            if ( (v = d->vcpu[vcpu_id]) == NULL )
+                continue;
+            cpu = read_atomic(&v->dirty_cpu);
+            if ( is_vcpu_dirty_cpu(cpu) )
+                __cpumask_set_cpu(cpu, pmask);
         }
     }
 }
--- xen/include/xen/sched.h.orig
+++ xen/include/xen/sched.h
@@ -795,10 +795,15 @@ static inline int vcpu_runnable(struct v
              atomic_read(&v->domain->pause_count));
 }
 
-static inline bool vcpu_cpu_dirty(const struct vcpu *v)
+static inline bool is_vcpu_dirty_cpu(unsigned int cpu)
 {
     BUILD_BUG_ON(NR_CPUS >= VCPU_CPU_CLEAN);
-    return v->dirty_cpu != VCPU_CPU_CLEAN;
+    return cpu != VCPU_CPU_CLEAN;
+}
+
+static inline bool vcpu_cpu_dirty(const struct vcpu *v)
+{
+    return is_vcpu_dirty_cpu(v->dirty_cpu);
 }
 
 void vcpu_block(void);




--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--M9NhX3UHpAaciwkO--
