Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F7EC54F54
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2026 14:48:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1379232.1623994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpoXO-0007rZ-FX; Fri, 31 Jul 2026 14:48:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1379232.1623994; Fri, 31 Jul 2026 14:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpoXO-0007rN-C3; Fri, 31 Jul 2026 14:48:38 +0000
Received: by outflank-mailman (input) for mailman id 1379232;
 Fri, 31 Jul 2026 14:48:36 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fb8a5ecef000e099@swg.vates.tech>)
 id 1wpoXM-0007oQ-IB
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 14:48:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpoXL-00HAWc-VJ
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 16:48:35 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fb8a5ecef000e099@swg.vates.tech>)
 id 6a6cb5c0-bab6-0a2a0a5309dd-0a2a45089240-8
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 16:48:35 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fb8a5ecef000e099@swg.vates.tech>)
 id 6a6cb5c3-f659-0a2a45080019-b9ff1c228db7-3
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 16:48:35 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fb8a5ecef000e099.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 31 Jul 2026 14:48:29 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 047AC80D94;
 Fri, 31 Jul 2026 16:48:28 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=YUE52s2EBU/AFHc4SGqgCz7TeilxbdJQ/4q71M7ZhBU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=IiIKJa43k+Uk0SRySYUzfLhOlKRUE9IXwas0/q5dubjAqTgAG/SmNTd670/zHDi9fOHLxA6K7
 ka5epZJw+HewXlhF9wHoZOtdHXM707TIUfzBQDCytRrbo3+M/tS2hpDlpuBkcKwCluSp8Q7RnNE
 SEWT61RKx1dmO/MxdlQf5RnHDnEjk9ETL3/AZmMzB5rcpaE+9n05W6upTB8Wv+DpPo32ZSWaUEK
 Oo8XOqvT2RIYwihfbbmnmJwQr45qAicrtkZMHqvlF4O3K3S4LMgQif7avgERRa6CFGQwQ1lpE4+
 SbWHTChBDuEUvADBea12v6itL257ZzjTEoKHEHD9sleA==
X-Zone-Loop: 8f695a037b9b5dfdd1b4df4d63d1ee8dbcc55ce5c16e
x-campaign-type: default
x-transaction-id: 984c073c-636e-4ad2-94cd-b86a471c4f2d
x-swg-uid: 01-a33e294a-0733-40de-a5f3-a1bf59031496
X-Mailer: Sweego
Message-ID:
 <1785509309.8631fc262581453bbf619ec5b2062170.19fb8a5ecef000e099@vates.tech>
x-swg-bid: 1785509309.8631fc262581453bbf619ec5b2062170.19fb8a5ecef000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Tim Deegan <tim@xen.org>
Subject: [RFC PATCH v2 4/5] x86/hvm: Transition to needs_tlb_flush logic, use per-domain ASID
Date: Fri, 31 Jul 2026 16:46:22 +0200
In-Reply-To: <1785509179.8631fc262581453bbf619ec5b2062170.19fb8a3efe8000e099@vates.tech>
References: <1785509179.8631fc262581453bbf619ec5b2062170.19fb8a3efe8000e099@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.1902.d6e2b0de82b0333e.19fb8a5eb68.d9f4fc1aecb1f2d9=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1785509309288
X-purgate-ID: tlsNG-c1860d/1785509315-CD94A87B-124C2F63/0/0
X-purgate-type: clean
X-purgate-size: 44782

---=Part.1902.d6e2b0de82b0333e.19fb8a5eb68.d9f4fc1aecb1f2d9=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Change the ASID model where all vCPU of a domain share the same ASID
as required by AMD SEV and broadcast TLB flushing features (AMD INVLPGB)=
=2E

ASID 1 is reserved as a placeholder for "no domain ASID", and used when
either ASID are not supported or no more ASID is available for use=2E
In this case, we always flush the TLB when from and to such domain's
vCPU=2E

Moreover, centralize the TLB flushing logic to use needs_tlb_flush, if
a full TLB flush needs to be performed for the vCPU, either through
SVM tlb_control or VMX invvpid before entering the guest=2E

As a result, drop ASID tickling logic, which is now redundant with the
needs_tlb_flush mechanism introduced previously=2E Also take the opportuni=
ty
to drop some now unused helpers now that FLUSH_HVM_ASID_CORE is dropped=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
This patch is particularly hard to split as the required changes needs
to come all at once=2E

Some questions :=20
 - On Intel, with "ASID disabled", should we distinguish between using sen=
tinel
   "VPID=3D1" (with single-context flush of VPID=3D1) with disabling VPID =
(through
   SECONDARY_EXEC_ENABLE_VPID) which implies flushing all VPID=3D0 (Xen/PV=
 ones) TLB
   entries on vmenter ?
   Of course, hardware without VPID support can't use VPID=3D1 and will be=
have with
   VPID disabled=2E

 - I tested it on both Intel and AMD platforms without much issues, but di=
dn't
   performed tests with nested virt which has tricky interactions with the=
se
   changes=2E

 docs/misc/xen-command-line=2Epandoc      |   2 +-
 xen/arch/x86/flushtlb=2Ec                |  22 +---
 xen/arch/x86/hvm/asid=2Ec                | 169 +++++++++++--------------
 xen/arch/x86/hvm/emulate=2Ec             |   2 +-
 xen/arch/x86/hvm/hvm=2Ec                 |  14 +-
 xen/arch/x86/hvm/nestedhvm=2Ec           |   7 +-
 xen/arch/x86/hvm/svm/asid=2Ec            |  67 +++++++---
 xen/arch/x86/hvm/svm/nestedsvm=2Ec       |   2 +-
 xen/arch/x86/hvm/svm/svm=2Ec             |  35 +++--
 xen/arch/x86/hvm/svm/svm=2Eh             |   4 -
 xen/arch/x86/hvm/vmx/vmcs=2Ec            |   6 +-
 xen/arch/x86/hvm/vmx/vmx=2Ec             |  66 +++++-----
 xen/arch/x86/hvm/vmx/vvmx=2Ec            |   4 +-
 xen/arch/x86/include/asm/flushtlb=2Eh    |   7 -
 xen/arch/x86/include/asm/hvm/asid=2Eh    |  30 ++---
 xen/arch/x86/include/asm/hvm/domain=2Eh  |   1 +
 xen/arch/x86/include/asm/hvm/hvm=2Eh     |  15 +--
 xen/arch/x86/include/asm/hvm/svm=2Eh     |   5 +
 xen/arch/x86/include/asm/hvm/vcpu=2Eh    |  10 +-
 xen/arch/x86/include/asm/hvm/vmx/vmx=2Eh |   4 +-
 xen/arch/x86/mm/hap/hap=2Ec              |   9 +-
 xen/arch/x86/mm/p2m=2Ec                  |   6 +-
 xen/arch/x86/mm/paging=2Ec               |   2 +-
 xen/arch/x86/mm/shadow/multi=2Ec         |  12 +-
 24 files changed, 241 insertions(+), 260 deletions(-)

diff --git a/docs/misc/xen-command-line=2Epandoc b/docs/misc/xen-command-l=
ine=2Epandoc
index 1c711fa980=2E=2Ef59c14d447 100644
--- a/docs/misc/xen-command-line=2Epandoc
+++ b/docs/misc/xen-command-line=2Epandoc
@@ -208,7 +208,7 @@ to appropriate auditing by Xen=2E  Argo is disabled by=
 default=2E
 > Default: `true`
=20
 Permit Xen to use Address Space Identifiers=2E  This is an optimisation w=
hich
-tags the TLB entries with an ID per vcpu=2E  This allows for guest TLB fl=
ushes
+tags the TLB entries with an ID per domain=2E  This allows for guest TLB =
flushes
 to be performed without the overhead of a complete TLB flush=2E
=20
 ### async-show-all (x86)
diff --git a/xen/arch/x86/flushtlb=2Ec b/xen/arch/x86/flushtlb=2Ec
index 5e2ed50ec9=2E=2E478a3f4962 100644
--- a/xen/arch/x86/flushtlb=2Ec
+++ b/xen/arch/x86/flushtlb=2Ec
@@ -13,6 +13,7 @@
 #include <xen/softirq=2Eh>
 #include <asm/cache=2Eh>
 #include <asm/flushtlb=2Eh>
+#include <asm/hvm/hvm=2Eh>
 #include <asm/invpcid=2Eh>
 #include <asm/nops=2Eh>
 #include <asm/page=2Eh>
@@ -119,7 +120,6 @@ void switch_cr3_cr4(struct vcpu *v, unsigned long cr3,=
 unsigned long cr4)
=20
     if ( tlb_clk_enabled )
         t =3D pre_flush();
-    hvm_flush_guest_tlbs();
=20
     old_cr4 =3D read_cr4();
     ASSERT(!(old_cr4 & X86_CR4_PCIDE) || !(old_cr4 & X86_CR4_PGE));
@@ -224,9 +224,6 @@ unsigned int flush_area_local(const void *va, unsigned=
 int flags)
             do_tlb_flush();
     }
=20
-    if ( flags & FLUSH_HVM_ASID_CORE )
-        hvm_flush_guest_tlbs();
-
     if ( flags & (FLUSH_CACHE_EVICT | FLUSH_CACHE_WRITEBACK) )
     {
         const struct cpuinfo_x86 *c =3D &current_cpu_data;
@@ -316,18 +313,13 @@ void cache_writeback(const void *addr, unsigned int =
size)
     asm volatile ("sfence" ::: "memory");
 }
=20
-unsigned int guest_flush_tlb_flags(const struct domain *d)
-{
-    bool shadow =3D paging_mode_shadow(d);
-    bool asid =3D is_hvm_domain(d) && (cpu_has_svm || shadow);
-
-    return (shadow ? FLUSH_TLB : 0) | (asid ? FLUSH_HVM_ASID_CORE : 0);
-}
-
 void guest_flush_tlb_mask(const struct domain *d, const cpumask_t *mask)
 {
-    unsigned int flags =3D guest_flush_tlb_flags(d);
+    struct vcpu *v;
+
+    if ( paging_mode_shadow(d) )
+        flush_tlb_mask(mask);
=20
-    if ( flags )
-        flush_mask(mask, flags);
+    for_each_vcpu(d, v)
+        v->arch=2Eneeds_tlb_flush =3D true;
 }
diff --git a/xen/arch/x86/hvm/asid=2Ec b/xen/arch/x86/hvm/asid=2Ec
index 935cae3901=2E=2E1a21125161 100644
--- a/xen/arch/x86/hvm/asid=2Ec
+++ b/xen/arch/x86/hvm/asid=2Ec
@@ -5,138 +5,115 @@
  * Copyright (c) 2009, Citrix Systems, Inc=2E
  */
=20
+#include <xen/errno=2Eh>
 #include <xen/init=2Eh>
 #include <xen/lib=2Eh>
 #include <xen/param=2Eh>
-#include <xen/sched=2Eh>
-#include <xen/smp=2Eh>
-#include <xen/percpu=2Eh>
+#include <xen/spinlock=2Eh>
+#include <xen/xvmalloc=2Eh>
+
+#include <asm/bitops=2Eh>
 #include <asm/hvm/asid=2Eh>
=20
 /* Xen command-line option to enable ASIDs */
 static bool __read_mostly opt_asid_enabled =3D true;
 boolean_param("asid", opt_asid_enabled);
=20
+bool __read_mostly asid_enabled =3D false;
+static unsigned long __ro_after_init *asid_bitmap;
+static unsigned long __ro_after_init asid_count;
+static DEFINE_SPINLOCK(asid_lock);
+
 /*
- * ASIDs partition the physical TLB=2E  In the current implementation ASI=
Ds are
- * introduced to reduce the number of TLB flushes=2E  Each time the guest=
's
- * virtual address space changes (e=2Eg=2E due to an INVLPG, MOV-TO-{CR3,=
 CR4}
- * operation), instead of flushing the TLB, a new ASID is assigned=2E  Th=
is
- * reduces the number of TLB flushes to at most 1/#ASIDs=2E  The biggest
- * advantage is that hot parts of the hypervisor's code and data retain i=
n
- * the TLB=2E
- *
  * Sketch of the Implementation:
+ * ASIDs are assigned uniquely per domain and doesn't change during the l=
ifecycle of the
+ * domain=2E Once vcpus are initialized and are up, we assign the same AS=
ID to all vcpus
+ * of that domain at the first VMRUN=2E In order to process a TLB flush o=
n a vcpu, we set
+ * needs_tlb_flush to schedule a TLB flush for the next VMRUN (e=2Eg usin=
g tlb control=20
+ * field of VMCB)=2E
  *
- * ASIDs are a CPU-local resource=2E  As preemption of ASIDs is not possi=
ble,
- * ASIDs are assigned in a round-robin scheme=2E  To minimize the overhea=
d of
- * ASID invalidation, at the time of a TLB flush,  ASIDs are tagged with =
a
- * 64-bit generation=2E  Only on a generation overflow the code needs to
- * invalidate all ASID information stored at the VCPUs with are run on th=
e
- * specific physical processor=2E  This overflow appears after about 2^80
- * host processor cycles, so we do not optimize this case, but simply dis=
able
- * ASID useage to retain correctness=2E
+ * We reserve ASID=3D1 as being the ASID used when none other is availabl=
e (or with asid
+ * use disabled)=2E Multiples domains may use this ASID, thus we need to =
systematically
+ * flush the TLB for this one when switching between vCPUs with ASID=3D1=
=2E
  */
=20
-/* Per-CPU ASID management=2E */
-struct hvm_asid_data {
-   uint64_t core_asid_generation;
-   uint32_t next_asid;
-   uint32_t max_asid;
-   bool disabled;
-};
-
-static DEFINE_PER_CPU(struct hvm_asid_data, hvm_asid_data);
-
-void hvm_asid_init(unsigned int nasids)
+int __init hvm_asid_init(unsigned long nasids)
 {
-    static int8_t __ro_after_init g_disabled =3D -1;
-    struct hvm_asid_data *data =3D &this_cpu(hvm_asid_data);
+    ASSERT(nasids);
=20
-    data->max_asid =3D nasids - 1;
-    data->disabled =3D !opt_asid_enabled || (nasids <=3D 1);
+    asid_count =3D nasids;
+    asid_enabled =3D opt_asid_enabled && (nasids > 1);
=20
-    if ( g_disabled < 0 )
-    {
-        g_disabled =3D data->disabled;
-        printk("HVM: ASIDs %sabled\n", data->disabled ? "dis" : "en");
-    }
-    else if ( g_disabled !=3D data->disabled )
-        printk("HVM: CPU%u: ASIDs %sabled\n", smp_processor_id(),
-               data->disabled ? "dis" : "en");
+    asid_bitmap =3D xvzalloc_array(unsigned long, BITS_TO_LONGS(asid_coun=
t + 1));
+    if ( !asid_bitmap )
+        return -ENOMEM;
=20
-    /* Zero indicates 'invalid generation', so we start the count at one=
=2E */
-    data->core_asid_generation =3D 1;
+    printk("HVM: ASIDs %sabled (count=3D%lu)\n", asid_enabled ? "en" : "d=
is", asid_count);
=20
-    /* Zero indicates 'ASIDs disabled', so we start the count at one=2E *=
/
-    data->next_asid =3D 1;
-}
+    /* ASID 0 and 1 are reserved, mark it as permanently used */
+    set_bit(0, asid_bitmap);
+    set_bit(1, asid_bitmap);
=20
-void hvm_asid_flush_vcpu_asid(struct hvm_vcpu_asid *asid)
-{
-    write_atomic(&asid->generation, 0);
+    return 0;
 }
=20
-void hvm_asid_flush_vcpu(struct vcpu *v)
+int hvm_asid_alloc(struct hvm_asid *asid)
 {
-    hvm_asid_flush_vcpu_asid(&v->arch=2Ehvm=2En1asid);
-    hvm_asid_flush_vcpu_asid(&vcpu_nestedhvm(v)=2Env_n2asid);
-}
+    unsigned long new_asid;
=20
-void hvm_asid_flush_core(void)
-{
-    struct hvm_asid_data *data =3D &this_cpu(hvm_asid_data);
+    if ( !asid_enabled )
+    {
+        asid->asid =3D 1;
+        return 0;
+    }
=20
-    if ( data->disabled )
-        return;
+    spin_lock(&asid_lock);
+    new_asid =3D find_first_zero_bit(asid_bitmap, asid_count);
+    if ( new_asid > asid_count )
+        return -ENOSPC;
=20
-    if ( likely(++data->core_asid_generation !=3D 0) )
-        return;
+    set_bit(new_asid, asid_bitmap);
=20
-    /*
-     * ASID generations are 64 bit=2E  Overflow of generations never happ=
ens=2E
-     * For safety, we simply disable ASIDs, so correctness is established=
; it
-     * only runs a bit slower=2E
-     */
-    printk("HVM: ASID generation overrun=2E Disabling ASIDs=2E\n");
-    data->disabled =3D 1;
+    asid->asid =3D new_asid;
+    spin_unlock(&asid_lock);
+    return 0;
 }
=20
-bool hvm_asid_handle_vmenter(struct hvm_vcpu_asid *asid)
+int hvm_asid_alloc_range(struct hvm_asid *asid, unsigned long min, unsign=
ed long max)
 {
-    struct hvm_asid_data *data =3D &this_cpu(hvm_asid_data);
+    unsigned long new_asid;
+   =20
+    if ( WARN_ON(min >=3D asid_count) )
+        return -EINVAL;
=20
-    /* On erratum #170 systems we must flush the TLB=2E=20
-     * Generation overruns are taken here, too=2E */
-    if ( data->disabled )
-        goto disabled;
+    if ( !asid_enabled )
+        return -EOPNOTSUPP;
=20
-    /* Test if VCPU has valid ASID=2E */
-    if ( read_atomic(&asid->generation) =3D=3D data->core_asid_generation=
 )
-        return 0;
+    spin_lock(&asid_lock);
+    new_asid =3D find_next_zero_bit(asid_bitmap, asid_count, min);
+    if ( new_asid > max || new_asid > asid_count )
+        return -ENOSPC;
=20
-    /* If there are no free ASIDs, need to go to a new generation */
-    if ( unlikely(data->next_asid > data->max_asid) )
-    {
-        hvm_asid_flush_core();
-        data->next_asid =3D 1;
-        if ( data->disabled )
-            goto disabled;
-    }
+    set_bit(new_asid, asid_bitmap);
=20
-    /* Now guaranteed to be a free ASID=2E */
-    asid->asid =3D data->next_asid++;
-    write_atomic(&asid->generation, data->core_asid_generation);
+    asid->asid =3D new_asid;
+    spin_unlock(&asid_lock);
+    return 0;
+}
=20
-    /*
-     * When we assign ASID 1, flush all TLB entries as we are starting a =
new
-     * generation, and all old ASID allocations are now stale=2E=20
-     */
-    return (asid->asid =3D=3D 1);
+void hvm_asid_free(struct hvm_asid *asid)
+{
+    ASSERT( asid->asid );
=20
- disabled:
-    asid->asid =3D 0;
-    return 0;
+    if ( !asid_enabled || asid->asid =3D=3D 1 )
+        return;
+
+    ASSERT( asid->asid < asid_count );
+
+    spin_lock(&asid_lock);
+    WARN_ON(!test_bit(asid->asid, asid_bitmap));
+    clear_bit(asid->asid, asid_bitmap);
+    spin_unlock(&asid_lock);
 }
=20
 /*
diff --git a/xen/arch/x86/hvm/emulate=2Ec b/xen/arch/x86/hvm/emulate=2Ec
index 2efb1d4f08=2E=2E259a2b0caf 100644
--- a/xen/arch/x86/hvm/emulate=2Ec
+++ b/xen/arch/x86/hvm/emulate=2Ec
@@ -2655,7 +2655,7 @@ static int cf_check hvmemul_tlb_op(
     case x86emul_invpcid:
         if ( x86emul_invpcid_type(aux) !=3D X86_INVPCID_INDIV_ADDR )
         {
-            hvm_asid_flush_vcpu(current);
+            current->arch=2Eneeds_tlb_flush =3D true;
             break;
         }
         aux =3D x86emul_invpcid_pcid(aux);
diff --git a/xen/arch/x86/hvm/hvm=2Ec b/xen/arch/x86/hvm/hvm=2Ec
index a75ccb57bf=2E=2E283dcad691 100644
--- a/xen/arch/x86/hvm/hvm=2Ec
+++ b/xen/arch/x86/hvm/hvm=2Ec
@@ -715,6 +715,10 @@ int hvm_domain_initialise(struct domain *d,
     if ( rc )
         goto fail2;
=20
+    rc =3D hvm_asid_alloc(&d->arch=2Ehvm=2Easid);
+    if ( rc )
+        goto fail2;
+
     rc =3D alternative_call(hvm_funcs=2Edomain_initialise, d);
     if ( rc !=3D 0 )
         goto fail2;
@@ -795,7 +799,7 @@ void hvm_domain_destroy(struct domain *d)
         list_del(&ioport->list);
         xfree(ioport);
     }
-
+    hvm_asid_free(&d->arch=2Ehvm=2Easid);
     destroy_vpci_mmcfg(d);
 }
=20
@@ -1613,7 +1617,7 @@ int hvm_vcpu_initialise(struct vcpu *v)
     int rc;
     struct domain *d =3D v->domain;
=20
-    hvm_asid_flush_vcpu(v);
+    v->arch=2Eneeds_tlb_flush =3D true;
=20
     spin_lock_init(&v->arch=2Ehvm=2Etm_lock);
     INIT_LIST_HEAD(&v->arch=2Ehvm=2Etm_list);
@@ -4085,6 +4089,11 @@ static void hvm_s3_resume(struct domain *d)
     }
 }
=20
+int hvm_flush_tlb(const unsigned long *vcpu_bitmap)
+{
+    return current->domain->arch=2Epaging=2Eflush_tlb(vcpu_bitmap);
+}
+
 static int hvmop_flush_tlb_all(void)
 {
     if ( !is_hvm_domain(current->domain) )
@@ -5461,4 +5470,3 @@ int hvm_copy_context_and_params(struct domain *dst, =
struct domain *src)
  * indent-tabs-mode: nil
  * End:
  */
-
diff --git a/xen/arch/x86/hvm/nestedhvm=2Ec b/xen/arch/x86/hvm/nestedhvm=
=2Ec
index bddd77d810=2E=2E61e866b771 100644
--- a/xen/arch/x86/hvm/nestedhvm=2Ec
+++ b/xen/arch/x86/hvm/nestedhvm=2Ec
@@ -12,6 +12,7 @@
 #include <asm/hvm/nestedhvm=2Eh>
 #include <asm/event=2Eh>  /* for local_event_delivery_(en|dis)able */
 #include <asm/paging=2Eh> /* for paging_mode_hap() */
+#include <asm/hvm/asid=2Eh>
=20
 static unsigned long *shadow_io_bitmap[3];
=20
@@ -36,13 +37,11 @@ nestedhvm_vcpu_reset(struct vcpu *v)
     hvm_unmap_guest_frame(nv->nv_vvmcx, 1);
     nv->nv_vvmcx =3D NULL;
     nv->nv_vvmcxaddr =3D INVALID_PADDR;
-    nv->nv_flushp2m =3D 0;
+    nv->nv_flushp2m =3D true;
     nv->nv_p2m =3D NULL;
     nv->stale_np2m =3D false;
     nv->np2m_generation =3D 0;
=20
-    hvm_asid_flush_vcpu_asid(&nv->nv_n2asid);
-
     alternative_vcall(hvm_funcs=2Enhvm_vcpu_reset, v);
=20
     /* vcpu is in host mode */
@@ -86,7 +85,7 @@ static void cf_check nestedhvm_flushtlb_ipi(void *info)
      * This is cheaper than flush_tlb_local() and has
      * the same desired effect=2E
      */
-    hvm_asid_flush_core();
+    WARN_ON(hvm_flush_tlb(NULL));
     vcpu_nestedhvm(v)=2Env_p2m =3D NULL;
     vcpu_nestedhvm(v)=2Estale_np2m =3D true;
 }
diff --git a/xen/arch/x86/hvm/svm/asid=2Ec b/xen/arch/x86/hvm/svm/asid=2Ec
index 53aa5d0512=2E=2E44d2138895 100644
--- a/xen/arch/x86/hvm/svm/asid=2Ec
+++ b/xen/arch/x86/hvm/svm/asid=2Ec
@@ -1,39 +1,46 @@
 /* SPDX-License-Identifier: GPL-2=2E0-only */
 /*
- * asid=2Ec: handling ASIDs in SVM=2E
+ * asid=2Ec: handling ASIDs/VPIDs=2E
  * Copyright (c) 2007, Advanced Micro Devices, Inc=2E
  */
=20
+#include <xen/cpumask=2Eh>
+
 #include <asm/amd=2Eh>
 #include <asm/hvm/nestedhvm=2Eh>
 #include <asm/hvm/svm=2Eh>
+#include <asm/processor=2Eh>
=20
 #include "svm=2Eh"
 #include "vmcb=2Eh"
=20
-void svm_asid_init(const struct cpuinfo_x86 *c)
+void __init svm_asid_init(void)
 {
-    unsigned int nasids =3D 0;
+    unsigned int cpu, nasids =3D cpuid_ebx(0x8000000aU);
+
+    if ( !nasids )
+        nasids =3D 1;
=20
-    /* Check for erratum #170, and leave ASIDs disabled if it's present=
=2E */
-    if ( !cpu_has_amd_erratum(c, AMD_ERRATUM_170) )
-        nasids =3D cpuid_ebx(0x8000000aU);
+    for_each_present_cpu(cpu)
+    {
+        /* Check for erratum #170, and leave ASIDs disabled if it's prese=
nt=2E */
+        if ( cpu_has_amd_erratum(&cpu_data[cpu], AMD_ERRATUM_170) )
+        {
+            printk(XENLOG_WARNING "Disabling ASID due to errata 170 on CP=
U%u\n", cpu);
+            nasids =3D 1;
+        }
+    }
=20
-    hvm_asid_init(nasids);
+    BUG_ON(hvm_asid_init(nasids));
 }
=20
 /*
- * Called directly before VMRUN=2E  Checks if the VCPU needs a new ASID,
- * assigns it, and if required, issues required TLB flushes=2E
+ * Called directly at the first VMRUN/VMENTER of a vcpu to assign the ASI=
D/VPID=2E
  */
-void svm_asid_handle_vmrun(void)
+void svm_vcpu_assign_asid(struct vcpu *v)
 {
-    struct vcpu *curr =3D current;
-    struct vmcb_struct *vmcb =3D curr->arch=2Ehvm=2Esvm=2Evmcb;
-    struct hvm_vcpu_asid *p_asid =3D
-        nestedhvm_vcpu_in_guestmode(curr)
-        ? &vcpu_nestedhvm(curr)=2Env_n2asid : &curr->arch=2Ehvm=2En1asid;
-    bool need_flush =3D hvm_asid_handle_vmenter(p_asid);
+    struct vmcb_struct *vmcb =3D v->arch=2Ehvm=2Esvm=2Evmcb;
+    struct hvm_asid *p_asid =3D &v->domain->arch=2Ehvm=2Easid;
=20
     /* ASID 0 indicates that ASIDs are disabled=2E */
     if ( p_asid->asid =3D=3D 0 )
@@ -44,11 +51,31 @@ void svm_asid_handle_vmrun(void)
         return;
     }
=20
-    if ( vmcb_get_asid(vmcb) !=3D p_asid->asid )
-        vmcb_set_asid(vmcb, p_asid->asid);
+    /* In case ASIDs are disabled, as ASID =3D 0 is reserved, guest can u=
se 1 instead=2E */
+    vmcb_set_asid(vmcb, asid_enabled ? p_asid->asid : 1);
+}
+
+/* Call to make a TLB flush at the next VMRUN=2E */
+void svm_vcpu_set_tlb_control(struct vcpu *v)
+{
+    struct vmcb_struct *vmcb =3D v->arch=2Ehvm=2Esvm=2Evmcb;
+
+    /*
+     * If the vcpu is already running, the tlb control flag may not be
+     * processed and will be cleared at the next VMEXIT, which will undo
+     * what we are trying to do=2E
+     */
+    WARN_ON(v !=3D current && v->is_running);
+
+    vmcb->tlb_control =3D
+        cpu_has_svm_flushbyasid ? TLB_CTRL_FLUSH_ASID : TLB_CTRL_FLUSH_AL=
L;
+}
+
+void svm_vcpu_clear_tlb_control(struct vcpu *v)
+{
+    struct vmcb_struct *vmcb =3D v->arch=2Ehvm=2Esvm=2Evmcb;
=20
-    /* We can't rely on TLB_CTRL_FLUSH_ASID as all ASIDs are stale here=
=2E */
-    vmcb->tlb_control =3D need_flush ? TLB_CTRL_FLUSH_ALL : TLB_CTRL_NO_F=
LUSH;
+    vmcb->tlb_control =3D TLB_CTRL_NO_FLUSH;
 }
=20
 /*
diff --git a/xen/arch/x86/hvm/svm/nestedsvm=2Ec b/xen/arch/x86/hvm/svm/nes=
tedsvm=2Ec
index b06124c2c9=2E=2Ec712b98256 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm=2Ec
+++ b/xen/arch/x86/hvm/svm/nestedsvm=2Ec
@@ -5,6 +5,7 @@
  *
  */
=20
+#include <asm/hvm/asid=2Eh>
 #include <asm/hvm/support=2Eh>
 #include <asm/hvm/svm=2Eh>
 #include <asm/hvm/nestedhvm=2Eh>
@@ -633,7 +634,6 @@ nsvm_vcpu_vmentry(struct vcpu *v, struct cpu_user_regs=
 *regs,
     if ( svm->ns_asid !=3D vmcb_get_asid(ns_vmcb))
     {
         nv->nv_flushp2m =3D 1;
-        hvm_asid_flush_vcpu_asid(&vcpu_nestedhvm(v)=2Env_n2asid);
         svm->ns_asid =3D vmcb_get_asid(ns_vmcb);
     }
=20
diff --git a/xen/arch/x86/hvm/svm/svm=2Ec b/xen/arch/x86/hvm/svm/svm=2Ec
index 38c61db1d7=2E=2Ee9026e0ae5 100644
--- a/xen/arch/x86/hvm/svm/svm=2Ec
+++ b/xen/arch/x86/hvm/svm/svm=2Ec
@@ -27,6 +27,7 @@
 #include <asm/hvm/nestedhvm=2Eh>
 #include <asm/hvm/support=2Eh>
 #include <asm/hvm/svm=2Eh>
+#include <asm/hvm/asid=2Eh>
 #include <asm/i387=2Eh>
 #include <asm/idt=2Eh>
 #include <asm/iocap=2Eh>
@@ -137,14 +138,17 @@ static void cf_check svm_update_guest_cr(
         if ( !nestedhvm_enabled(v->domain) )
         {
             if ( !(flags & HVM_UPDATE_GUEST_CR3_NOFLUSH) )
-                hvm_asid_flush_vcpu(v);
+                v->arch=2Eneeds_tlb_flush =3D true;
         }
         else if ( nestedhvm_vmswitch_in_progress(v) )
             ; /* CR3 switches during VMRUN/VMEXIT do not flush the TLB=2E=
 */
         else if ( !(flags & HVM_UPDATE_GUEST_CR3_NOFLUSH) )
-            hvm_asid_flush_vcpu_asid(
-                nestedhvm_vcpu_in_guestmode(v)
-                ? &vcpu_nestedhvm(v)=2Env_n2asid : &v->arch=2Ehvm=2En1asi=
d);
+        {
+            if (nestedhvm_vcpu_in_guestmode(v))
+                vcpu_nestedhvm(v)=2Env_flushp2m =3D true;
+            else
+                v->arch=2Eneeds_tlb_flush =3D true;
+        }
         break;
     case 4:
         value =3D HVM_CR4_HOST_MASK;
@@ -952,8 +956,7 @@ static void noreturn cf_check svm_do_resume(void)
         v->arch=2Ehvm=2Esvm=2Elaunch_core =3D smp_processor_id();
         hvm_migrate_timers(v);
         hvm_migrate_pirqs(v);
-        /* Migrating to another ASID domain=2E  Request a new ASID=2E */
-        hvm_asid_flush_vcpu(v);
+        v->arch=2Eneeds_tlb_flush =3D true;
     }
=20
     if ( !vcpu_guestmode && !vlapic_hw_disabled(vlapic) )
@@ -980,13 +983,14 @@ void asmlinkage svm_vmenter_helper(void)
=20
     ASSERT(hvmemul_cache_disabled(curr));
=20
-    svm_asid_handle_vmrun();
-
     TRACE_TIME(TRC_HVM_VMENTRY |
                (nestedhvm_vcpu_in_guestmode(curr) ? TRC_HVM_NESTEDFLAG : =
0));
=20
     svm_sync_vmcb(curr, vmcb_needs_vmsave);
=20
+    if ( test_and_clear_bool(curr->arch=2Eneeds_tlb_flush) )
+        svm_vcpu_set_tlb_control(curr);
+
     vmcb->rax =3D regs->rax;
     vmcb->rip =3D regs->rip;
     vmcb->rsp =3D regs->rsp;
@@ -1107,6 +1111,8 @@ static int cf_check svm_vcpu_initialise(struct vcpu =
*v)
         return rc;
     }
=20
+    svm_vcpu_assign_asid(v);
+
     return 0;
 }
=20
@@ -1532,9 +1538,6 @@ static int _svm_cpu_up(bool bsp)
     /* check for erratum 383 */
     svm_init_erratum_383(c);
=20
-    /* Initialize core's ASID handling=2E */
-    svm_asid_init(c);
-
     /* Initialize OSVW bits to be used by guests */
     svm_host_osvw_init();
=20
@@ -2289,7 +2292,7 @@ static void svm_invlpga_intercept(
 {
     svm_invlpga(linear,
                 (asid =3D=3D 0)
-                ? v->arch=2Ehvm=2En1asid=2Easid
+                ? v->domain->arch=2Ehvm=2Easid=2Easid
                 : vcpu_nestedhvm(v)=2Env_n2asid=2Easid);
 }
=20
@@ -2311,8 +2314,8 @@ static bool cf_check is_invlpg(
=20
 static void cf_check svm_invlpg(struct vcpu *v, unsigned long linear)
 {
-    /* Safe fallback=2E Take a new ASID=2E */
-    hvm_asid_flush_vcpu(v);
+    /* Schedule a tlb flush on the VCPU=2E */
+    v->arch=2Eneeds_tlb_flush =3D true;
 }
=20
 static bool cf_check svm_get_pending_event(
@@ -2482,6 +2485,8 @@ const struct hvm_function_table * __init start_svm(v=
oid)
     svm_function_table=2Ecaps=2Ehap_superpage_2mb =3D true;
     svm_function_table=2Ecaps=2Ehap_superpage_1gb =3D cpu_has_page1gb;
=20
+    svm_asid_init();
+
     return &svm_function_table;
 }
=20
@@ -2539,6 +2544,8 @@ void asmlinkage svm_vmexit_handler(void)
                    (vlapic_get_reg(vlapic, APIC_TASKPRI) & 0x0F));
     }
=20
+    svm_vcpu_clear_tlb_control(v);
+
     exit_reason =3D vmcb->exitcode;
=20
     if ( hvm_long_mode_active(v) )
diff --git a/xen/arch/x86/hvm/svm/svm=2Eh b/xen/arch/x86/hvm/svm/svm=2Eh
index cfa411ad5a=2E=2E901354e914 100644
--- a/xen/arch/x86/hvm/svm/svm=2Eh
+++ b/xen/arch/x86/hvm/svm/svm=2Eh
@@ -12,12 +12,8 @@
 #include <xen/types=2Eh>
=20
 struct cpu_user_regs;
-struct cpuinfo_x86;
 struct vcpu;
=20
-void svm_asid_init(const struct cpuinfo_x86 *c);
-void svm_asid_handle_vmrun(void);
-
 unsigned long *svm_msrbit(unsigned long *msr_bitmap, uint32_t msr);
 void __update_guest_eip(struct cpu_user_regs *regs, unsigned int inst_len=
);
=20
diff --git a/xen/arch/x86/hvm/vmx/vmcs=2Ec b/xen/arch/x86/hvm/vmx/vmcs=2Ec
index 8e52ef4d49=2E=2E3916ae4468 100644
--- a/xen/arch/x86/hvm/vmx/vmcs=2Ec
+++ b/xen/arch/x86/hvm/vmx/vmcs=2Ec
@@ -20,6 +20,7 @@
 #include <asm/current=2Eh>
 #include <asm/flushtlb=2Eh>
 #include <asm/hvm/hvm=2Eh>
+#include <asm/hvm/asid=2Eh>
 #include <asm/hvm/io=2Eh>
 #include <asm/hvm/nestedhvm=2Eh>
 #include <asm/hvm/vmx/vmcs=2Eh>
@@ -778,8 +779,6 @@ static int _vmx_cpu_up(bool bsp)
=20
     this_cpu(vmxon) =3D 1;
=20
-    hvm_asid_init(cpu_has_vmx_vpid ? (1u << VMCS_VPID_WIDTH) : 0);
-
     if ( cpu_has_vmx_ept )
         ept_sync_all();
=20
@@ -1903,7 +1902,7 @@ void cf_check vmx_do_resume(void)
          */
         v->arch=2Ehvm=2Evmx=2Ehostenv_migrated =3D 1;
=20
-        hvm_asid_flush_vcpu(v);
+        v->arch=2Eneeds_tlb_flush =3D true;
     }
=20
     debug_state =3D v->domain->debugger_attached
@@ -2116,7 +2115,6 @@ void vmcs_dump_vcpu(struct vcpu *v)
          (SECONDARY_EXEC_ENABLE_VPID | SECONDARY_EXEC_ENABLE_VM_FUNCTIONS=
) )
         printk("Virtual processor ID =3D 0x%04x VMfunc controls =3D %016l=
x\n",
                vmr16(VIRTUAL_PROCESSOR_ID), vmr(VM_FUNCTION_CONTROL));
-
     vmx_vmcs_exit(v);
 }
=20
diff --git a/xen/arch/x86/hvm/vmx/vmx=2Ec b/xen/arch/x86/hvm/vmx/vmx=2Ec
index 269ca56433=2E=2Ea531145218 100644
--- a/xen/arch/x86/hvm/vmx/vmx=2Ec
+++ b/xen/arch/x86/hvm/vmx/vmx=2Ec
@@ -25,6 +25,7 @@
 #include <asm/fsgsbase=2Eh>
 #include <asm/gdbsx=2Eh>
 #include <asm/guest-msr=2Eh>
+#include <asm/hvm/asid=2Eh>
 #include <asm/hvm/emulate=2Eh>
 #include <asm/hvm/hvm=2Eh>
 #include <asm/hvm/monitor=2Eh>
@@ -834,6 +835,18 @@ static void cf_check vmx_cpuid_policy_changed(struct =
vcpu *v)
         vmx_update_secondary_exec_control(v);
     }
=20
+    if ( asid_enabled )
+    {
+        v->arch=2Ehvm=2Evmx=2Esecondary_exec_control |=3D SECONDARY_EXEC_=
ENABLE_VPID;
+        vmx_update_secondary_exec_control(v);
+    }
+    else
+    {
+        v->arch=2Ehvm=2Evmx=2Esecondary_exec_control &=3D ~SECONDARY_EXEC=
_ENABLE_VPID;
+        vmx_update_secondary_exec_control(v);
+    }
+
+
     /*
      * We can safely pass MSR_SPEC_CTRL through to the guest, even if STI=
BP
      * isn't enumerated in hardware, as SPEC_CTRL_STIBP is ignored=2E
@@ -1510,7 +1523,7 @@ static void cf_check vmx_handle_cd(struct vcpu *v, u=
nsigned long value)
             vmx_set_msr_intercept(v, MSR_IA32_CR_PAT, VMX_MSR_RW);
=20
             wbinvd();               /* flush possibly polluted cache */
-            hvm_asid_flush_vcpu(v); /* invalidate memory type cached in T=
LB */
+            v->arch=2Eneeds_tlb_flush =3D true; /* invalidate memory type=
 cached in TLB */
             v->arch=2Ehvm=2Evmx=2Ecache_mode =3D CACHE_MODE_NO_FILL;
         }
         else
@@ -1519,7 +1532,7 @@ static void cf_check vmx_handle_cd(struct vcpu *v, u=
nsigned long value)
             vmx_set_guest_pat(v, *pat);
             if ( !is_iommu_enabled(v->domain) || iommu_snoop )
                 vmx_clear_msr_intercept(v, MSR_IA32_CR_PAT, VMX_MSR_RW);
-            hvm_asid_flush_vcpu(v); /* no need to flush cache */
+            v->arch=2Eneeds_tlb_flush =3D true;
         }
     }
 }
@@ -1871,7 +1884,7 @@ static void cf_check vmx_update_guest_cr(
         __vmwrite(GUEST_CR3, v->arch=2Ehvm=2Ehw_cr[3]);
=20
         if ( !(flags & HVM_UPDATE_GUEST_CR3_NOFLUSH) )
-            hvm_asid_flush_vcpu(v);
+            v->arch=2Eneeds_tlb_flush =3D true;
         break;
=20
     default:
@@ -3168,6 +3181,8 @@ const struct hvm_function_table * __init start_vmx(v=
oid)
     lbr_tsx_fixup_check();
     ler_to_fixup_check();
=20
+    BUG_ON(hvm_asid_init(cpu_has_vmx_vpid ? (1u << VMCS_VPID_WIDTH) : 1))=
;
+
     return &vmx_function_table;
 }
=20
@@ -4931,9 +4946,7 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_=
user_regs *regs)
 {
     struct vcpu *curr =3D current;
     struct domain *currd =3D curr->domain;
-    u32 new_asid, old_asid;
-    struct hvm_vcpu_asid *p_asid;
-    bool need_flush;
+    struct hvm_asid *p_asid;
=20
     ASSERT(hvmemul_cache_disabled(curr));
=20
@@ -4949,33 +4962,9 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu=
_user_regs *regs)
     if ( nestedhvm_vcpu_in_guestmode(curr) )
         p_asid =3D &vcpu_nestedhvm(curr)=2Env_n2asid;
     else
-        p_asid =3D &curr->arch=2Ehvm=2En1asid;
-
-    old_asid =3D p_asid->asid;
-    need_flush =3D hvm_asid_handle_vmenter(p_asid);
-    new_asid =3D p_asid->asid;
-
-    if ( unlikely(new_asid !=3D old_asid) )
-    {
-        __vmwrite(VIRTUAL_PROCESSOR_ID, new_asid);
-        if ( !old_asid && new_asid )
-        {
-            /* VPID was disabled: now enabled=2E */
-            curr->arch=2Ehvm=2Evmx=2Esecondary_exec_control |=3D
-                SECONDARY_EXEC_ENABLE_VPID;
-            vmx_update_secondary_exec_control(curr);
-        }
-        else if ( old_asid && !new_asid )
-        {
-            /* VPID was enabled: now disabled=2E */
-            curr->arch=2Ehvm=2Evmx=2Esecondary_exec_control &=3D
-                ~SECONDARY_EXEC_ENABLE_VPID;
-            vmx_update_secondary_exec_control(curr);
-        }
-    }
+        p_asid =3D &currd->arch=2Ehvm=2Easid;
=20
-    if ( unlikely(need_flush) )
-        vpid_sync_all();
+    __vmwrite(VIRTUAL_PROCESSOR_ID, p_asid->asid);
=20
     if ( paging_mode_hap(curr->domain) )
     {
@@ -4984,12 +4973,18 @@ bool asmlinkage vmx_vmenter_helper(const struct cp=
u_user_regs *regs)
         unsigned int inv =3D 0; /* None =3D> Single =3D> All */
         struct ept_data *single =3D NULL; /* Single eptp, iff inv =3D=3D =
1 */
=20
+        if ( test_and_clear_bool(curr->arch=2Eneeds_tlb_flush)  )
+        {
+            inv =3D 1;
+            single =3D ept;
+        }
+
         if ( cpumask_test_cpu(cpu, ept->invalidate) )
         {
             cpumask_clear_cpu(cpu, ept->invalidate);
=20
             /* Automatically invalidate all contexts if nested=2E */
-            inv +=3D 1 + nestedhvm_enabled(currd);
+            inv =3D 1 + nestedhvm_enabled(currd);
             single =3D ept;
         }
=20
@@ -5018,6 +5013,11 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu=
_user_regs *regs)
             __invept(inv =3D=3D 1 ? INVEPT_SINGLE_CONTEXT : INVEPT_ALL_CO=
NTEXT,
                      inv =3D=3D 1 ? single->eptp          : 0);
     }
+    else /* Shadow paging */
+    {
+        if ( test_and_clear_bool(curr->arch=2Eneeds_tlb_flush) )
+            vpid_sync_vcpu_context(curr);
+    }
=20
  out:
     if ( unlikely(curr->arch=2Ehvm=2Evmx=2Elbr_flags & LBR_FIXUP_MASK) )
diff --git a/xen/arch/x86/hvm/vmx/vvmx=2Ec b/xen/arch/x86/hvm/vmx/vvmx=2Ec
index e4cdfe55c1=2E=2E5c0e1226c4 100644
--- a/xen/arch/x86/hvm/vmx/vvmx=2Ec
+++ b/xen/arch/x86/hvm/vmx/vvmx=2Ec
@@ -1253,7 +1253,7 @@ static void virtual_vmentry(struct cpu_user_regs *re=
gs)
=20
         if ( nvmx->guest_vpid !=3D new_vpid )
         {
-            hvm_asid_flush_vcpu_asid(&vcpu_nestedhvm(v)=2Env_n2asid);
+            v->arch=2Eneeds_tlb_flush =3D true;
             nvmx->guest_vpid =3D new_vpid;
         }
     }
@@ -2052,7 +2052,7 @@ static int nvmx_handle_invvpid(struct cpu_user_regs =
*regs)
     case INVVPID_INDIVIDUAL_ADDR:
     case INVVPID_SINGLE_CONTEXT:
     case INVVPID_ALL_CONTEXT:
-        hvm_asid_flush_vcpu_asid(&vcpu_nestedhvm(current)=2Env_n2asid);
+        hvm_flush_tlb(NULL);
         break;
     default:
         vmfail(regs, VMX_INSN_INVEPT_INVVPID_INVALID_OP);
diff --git a/xen/arch/x86/include/asm/flushtlb=2Eh b/xen/arch/x86/include/=
asm/flushtlb=2Eh
index 345677eb72=2E=2E081e5a1188 100644
--- a/xen/arch/x86/include/asm/flushtlb=2Eh
+++ b/xen/arch/x86/include/asm/flushtlb=2Eh
@@ -125,12 +125,6 @@ void switch_cr3_cr4(struct vcpu *v, unsigned long cr3=
, unsigned long cr4);
 #define FLUSH_VCPU_STATE 0x1000
  /* Flush the per-cpu root page table */
 #define FLUSH_ROOT_PGTBL 0x2000
-#if CONFIG_HVM
- /* Flush all HVM guests linear TLB (using ASID/VPID) */
-#define FLUSH_HVM_ASID_CORE 0x4000
-#else
-#define FLUSH_HVM_ASID_CORE 0
-#endif
 #if defined(CONFIG_PV) || defined(CONFIG_SHADOW_PAGING)
 /*
  * Adding this to the flags passed to flush_area_mask will prevent using =
the
@@ -190,7 +184,6 @@ void flush_area_mask(const cpumask_t *mask, const void=
 *va,
=20
 static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache)=
 {}
=20
-unsigned int guest_flush_tlb_flags(const struct domain *d);
 void guest_flush_tlb_mask(const struct domain *d, const cpumask_t *mask);
=20
 #endif /* __FLUSHTLB_H__ */
diff --git a/xen/arch/x86/include/asm/hvm/asid=2Eh b/xen/arch/x86/include/=
asm/hvm/asid=2Eh
index 25ba57e768=2E=2Eb6df5cda35 100644
--- a/xen/arch/x86/include/asm/hvm/asid=2Eh
+++ b/xen/arch/x86/include/asm/hvm/asid=2Eh
@@ -8,25 +8,25 @@
 #ifndef __ASM_X86_HVM_ASID_H__
 #define __ASM_X86_HVM_ASID_H__
=20
+#include <xen/stdbool=2Eh>
+#include <xen/stdint=2Eh>
=20
-struct vcpu;
-struct hvm_vcpu_asid;
+struct hvm_asid {
+  uint32_t asid;
+};
=20
-/* Initialise ASID management for the current physical CPU=2E */
-void hvm_asid_init(unsigned int nasids);
+#ifdef CONFIG_HVM
+extern bool asid_enabled;
+#else
+#define asid_enabled (false)
+#endif
=20
-/* Invalidate a particular ASID allocation: forces re-allocation=2E */
-void hvm_asid_flush_vcpu_asid(struct hvm_vcpu_asid *asid);
+/* Initialise ASID management distributed across all CPUs=2E */
+int hvm_asid_init(unsigned long nasids);
=20
-/* Invalidate all ASID allocations for specified VCPU: forces re-allocati=
on=2E */
-void hvm_asid_flush_vcpu(struct vcpu *v);
-
-/* Flush all ASIDs on this processor core=2E */
-void hvm_asid_flush_core(void);
-
-/* Called before entry to guest context=2E Checks ASID allocation, return=
s a
- * boolean indicating whether all ASIDs must be flushed=2E */
-bool hvm_asid_handle_vmenter(struct hvm_vcpu_asid *asid);
+int hvm_asid_alloc(struct hvm_asid *asid);
+int hvm_asid_alloc_range(struct hvm_asid *asid, unsigned long min, unsign=
ed long max);
+void hvm_asid_free(struct hvm_asid *asid);
=20
 #endif /* __ASM_X86_HVM_ASID_H__ */
=20
diff --git a/xen/arch/x86/include/asm/hvm/domain=2Eh b/xen/arch/x86/includ=
e/asm/hvm/domain=2Eh
index dd7fa96aad=2E=2E194343d9bf 100644
--- a/xen/arch/x86/include/asm/hvm/domain=2Eh
+++ b/xen/arch/x86/include/asm/hvm/domain=2Eh
@@ -140,6 +140,7 @@ struct hvm_domain {
     } write_map;
=20
     struct hvm_pi_ops pi_ops;
+    struct hvm_asid asid;
=20
     union {
         struct vmx_domain vmx;
diff --git a/xen/arch/x86/include/asm/hvm/hvm=2Eh b/xen/arch/x86/include/a=
sm/hvm/hvm=2Eh
index e7c1364802=2E=2E935d9e7548 100644
--- a/xen/arch/x86/include/asm/hvm/hvm=2Eh
+++ b/xen/arch/x86/include/asm/hvm/hvm=2Eh
@@ -274,6 +274,8 @@ int hvm_domain_initialise(struct domain *d,
 void hvm_domain_relinquish_resources(struct domain *d);
 void hvm_domain_destroy(struct domain *d);
=20
+int hvm_flush_tlb(const unsigned long *vcpu_bitmap);
+
 int hvm_vcpu_initialise(struct vcpu *v);
 void hvm_vcpu_destroy(struct vcpu *v);
 void hvm_vcpu_down(struct vcpu *v);
@@ -497,17 +499,6 @@ static inline void hvm_set_tsc_offset(struct vcpu *v,=
 uint64_t offset)
     alternative_vcall(hvm_funcs=2Eset_tsc_offset, v, offset);
 }
=20
-/*
- * Called to ensure than all guest-specific mappings in a tagged TLB are=
=20
- * flushed; does *not* flush Xen's TLB entries, and on processors without=
 a=20
- * tagged TLB it will be a noop=2E
- */
-static inline void hvm_flush_guest_tlbs(void)
-{
-    if ( hvm_enabled )
-        hvm_asid_flush_core();
-}
-
 static inline unsigned int
 hvm_get_cpl(struct vcpu *v)
 {
@@ -901,8 +892,6 @@ static inline int hvm_cpu_up(void)
=20
 static inline void hvm_cpu_down(void) {}
=20
-static inline void hvm_flush_guest_tlbs(void) {}
-
 static inline void hvm_invlpg(const struct vcpu *v, unsigned long linear)
 {
     ASSERT_UNREACHABLE();
diff --git a/xen/arch/x86/include/asm/hvm/svm=2Eh b/xen/arch/x86/include/a=
sm/hvm/svm=2Eh
index a35a61273b=2E=2E1877bb149a 100644
--- a/xen/arch/x86/include/asm/hvm/svm=2Eh
+++ b/xen/arch/x86/include/asm/hvm/svm=2Eh
@@ -9,6 +9,11 @@
 #ifndef __ASM_X86_HVM_SVM_H__
 #define __ASM_X86_HVM_SVM_H__
=20
+void svm_asid_init(void);
+void svm_vcpu_assign_asid(struct vcpu *v);
+void svm_vcpu_set_tlb_control(struct vcpu *v);
+void svm_vcpu_clear_tlb_control(struct vcpu *v);
+
 /*
  * PV context switch helpers=2E  Prefetching the VMCB area itself has bee=
n shown
  * to be useful for performance=2E
diff --git a/xen/arch/x86/include/asm/hvm/vcpu=2Eh b/xen/arch/x86/include/=
asm/hvm/vcpu=2Eh
index 2a14fa0a63=2E=2E8ad2ab2910 100644
--- a/xen/arch/x86/include/asm/hvm/vcpu=2Eh
+++ b/xen/arch/x86/include/asm/hvm/vcpu=2Eh
@@ -9,6 +9,7 @@
 #define __ASM_X86_HVM_VCPU_H__
=20
 #include <xen/tasklet=2Eh>
+#include <asm/hvm/asid=2Eh>
 #include <asm/hvm/vlapic=2Eh>
 #include <asm/hvm/vmx/vmcs=2Eh>
 #include <asm/hvm/vmx/vvmx=2Eh>
@@ -16,11 +17,6 @@
 #include <asm/mtrr=2Eh>
 #include <public/hvm/ioreq=2Eh>
=20
-struct hvm_vcpu_asid {
-    uint64_t generation;
-    uint32_t asid;
-};
-
 struct hvm_vcpu_io {
     /*
      * HVM emulation:
@@ -76,7 +72,7 @@ struct nestedvcpu {
     bool stale_np2m; /* True when p2m_base in VMCx02 is no longer valid *=
/
     uint64_t np2m_generation;
=20
-    struct hvm_vcpu_asid nv_n2asid;
+    struct hvm_asid nv_n2asid;
=20
     bool nv_vmentry_pending;
     bool nv_vmexit_pending;
@@ -140,8 +136,6 @@ struct hvm_vcpu {
     /* (MFN) hypervisor page table */
     pagetable_t         monitor_table;
=20
-    struct hvm_vcpu_asid n1asid;
-
     u64                 msr_tsc_adjust;
=20
     union {
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx=2Eh b/xen/arch/x86/inclu=
de/asm/hvm/vmx/vmx=2Eh
index 08854c36ca=2E=2Ee0d4389f20 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx=2Eh
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx=2Eh
@@ -463,7 +463,7 @@ static inline void vpid_sync_vcpu_context(const struct=
 vcpu *v)
     if ( unlikely(!cpu_has_vmx_vpid_invvpid_single_context) )
         type =3D INVVPID_ALL_CONTEXT;
=20
-    __invvpid(type, v->arch=2Ehvm=2En1asid=2Easid, 0);
+    __invvpid(type, v->domain->arch=2Ehvm=2Easid=2Easid, 0);
 }
=20
 static inline void vpid_sync_vcpu_gva(struct vcpu *v, unsigned long gva)
@@ -484,7 +484,7 @@ static inline void vpid_sync_vcpu_gva(struct vcpu *v, =
unsigned long gva)
     if ( unlikely(!cpu_has_vmx_vpid_invvpid_single_context) )
         type =3D INVVPID_ALL_CONTEXT;
=20
-    __invvpid(type, v->arch=2Ehvm=2En1asid=2Easid, (u64)gva);
+    __invvpid(type, v->domain->arch=2Ehvm=2Easid=2Easid, (u64)gva);
 }
=20
 static inline void vpid_sync_all(void)
diff --git a/xen/arch/x86/mm/hap/hap=2Ec b/xen/arch/x86/mm/hap/hap=2Ec
index 5ccb80bda5=2E=2E156734d3e0 100644
--- a/xen/arch/x86/mm/hap/hap=2Ec
+++ b/xen/arch/x86/mm/hap/hap=2Ec
@@ -27,6 +27,7 @@
 #include <asm/p2m=2Eh>
 #include <asm/domain=2Eh>
 #include <xen/numa=2Eh>
+#include <asm/hvm/asid=2Eh>
 #include <asm/hvm/nestedhvm=2Eh>
 #include <public/sched=2Eh>
=20
@@ -750,18 +751,16 @@ static bool cf_check flush_tlb(const unsigned long *=
vcpu_bitmap)
         if ( !flush_vcpu(v, vcpu_bitmap) )
             continue;
=20
-        hvm_asid_flush_vcpu(v);
-
         cpu =3D read_atomic(&v->dirty_cpu);
         if ( cpu !=3D this_cpu && is_vcpu_dirty_cpu(cpu) && v->is_running=
 )
             __cpumask_set_cpu(cpu, mask);
     }
=20
+    guest_flush_tlb_mask(d, mask);
+
     /*
      * Trigger a vmexit on all pCPUs with dirty vCPU state in order to fo=
rce an
-     * ASID/VPID change and hence accomplish a guest TLB flush=2E Note th=
at vCPUs
-     * not currently running will already be flushed when scheduled becau=
se of
-     * the ASID tickle done in the loop above=2E
+     * ASID/VPID flush and hence accomplish a guest TLB flush=2E
      */
     on_selected_cpus(mask, NULL, NULL, 0);
=20
diff --git a/xen/arch/x86/mm/p2m=2Ec b/xen/arch/x86/mm/p2m=2Ec
index 027b9ae69b=2E=2E9879b4840b 100644
--- a/xen/arch/x86/mm/p2m=2Ec
+++ b/xen/arch/x86/mm/p2m=2Ec
@@ -1440,7 +1440,7 @@ p2m_flush(struct vcpu *v, struct p2m_domain *p2m)
     ASSERT(v->domain =3D=3D p2m->domain);
     vcpu_nestedhvm(v)=2Env_p2m =3D NULL;
     p2m_flush_table(p2m);
-    hvm_asid_flush_vcpu(v);
+    v->arch=2Eneeds_tlb_flush =3D true;
 }
=20
 void
@@ -1499,7 +1499,7 @@ static void assign_np2m(struct vcpu *v, struct p2m_d=
omain *p2m)
=20
 static void nvcpu_flush(struct vcpu *v)
 {
-    hvm_asid_flush_vcpu(v);
+    v->arch=2Eneeds_tlb_flush =3D true;
     vcpu_nestedhvm(v)=2Estale_np2m =3D true;
 }
=20
@@ -1619,7 +1619,7 @@ void np2m_schedule(int dir)
             if ( !np2m_valid )
             {
                 /* This vCPU's np2m was flushed while it was not runnable=
 */
-                hvm_asid_flush_core();
+                curr->arch=2Eneeds_tlb_flush =3D true;
                 vcpu_nestedhvm(curr)=2Env_p2m =3D NULL;
             }
             else
diff --git a/xen/arch/x86/mm/paging=2Ec b/xen/arch/x86/mm/paging=2Ec
index 14ab7defd8=2E=2E06053d9a06 100644
--- a/xen/arch/x86/mm/paging=2Ec
+++ b/xen/arch/x86/mm/paging=2Ec
@@ -938,7 +938,7 @@ void paging_update_nestedmode(struct vcpu *v)
     else
         /* TODO: shadow-on-shadow */
         v->arch=2Epaging=2Enestedmode =3D NULL;
-    hvm_asid_flush_vcpu(v);
+    v->arch=2Eneeds_tlb_flush =3D true;
 }
=20
 int __init paging_set_allocation(struct domain *d, unsigned int pages,
diff --git a/xen/arch/x86/mm/shadow/multi=2Ec b/xen/arch/x86/mm/shadow/mul=
ti=2Ec
index 1b0477ed2b=2E=2E107d0829f2 100644
--- a/xen/arch/x86/mm/shadow/multi=2Ec
+++ b/xen/arch/x86/mm/shadow/multi=2Ec
@@ -81,12 +81,6 @@ const char *const fetch_type_names[] =3D {
=20
 static pagetable_t cf_check sh_update_cr3(struct vcpu *v, bool noflush);
=20
-/* Helper to perform a local TLB flush=2E */
-static void sh_flush_local(const struct domain *d)
-{
-    flush_local(guest_flush_tlb_flags(d));
-}
-
 #if GUEST_PAGING_LEVELS >=3D 4 && defined(CONFIG_PV32)
 #define ASSERT_VALID_L2(t) \
     ASSERT((t) =3D=3D SH_type_l2_shadow || (t) =3D=3D SH_type_l2h_shadow)
@@ -2945,7 +2939,8 @@ static bool cf_check sh_invlpg(struct vcpu *v, unsig=
ned long linear)
     if ( mfn_to_page(sl1mfn)->u=2Esh=2Etype
          =3D=3D SH_type_fl1_shadow )
     {
-        sh_flush_local(v->domain);
+        flush_tlb_local();
+        v->arch=2Eneeds_tlb_flush =3D true;
         return false;
     }
=20
@@ -3160,7 +3155,8 @@ sh_update_linear_entries(struct vcpu *v)
      * linear pagetable to read a top-level shadow page table entry=2E Bu=
t,
      * without this change, it would fetch the wrong value due to a stale=
 TLB=2E
      */
-    sh_flush_local(d);
+    flush_tlb_local();
+    v->arch=2Eneeds_tlb_flush =3D true;
 }
=20
 static pagetable_t cf_check sh_update_cr3(struct vcpu *v, bool noflush)
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.1902.d6e2b0de82b0333e.19fb8a5eb68.d9f4fc1aecb1f2d9=---

