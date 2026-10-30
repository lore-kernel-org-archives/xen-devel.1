Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6859606A31C
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 13:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=kKciUV1I
Received: from list by lists.xenproject.org with outflank-mailman.1465659.1676134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMmb1-0007mj-OS; Fri, 30 Oct 2026 13:24:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465659.1676134; Fri, 30 Oct 2026 13:24:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMmb1-0007mX-JJ; Fri, 30 Oct 2026 13:24:39 +0000
Received: by outflank-mailman (input) for mailman id 1465659;
 Fri, 30 Oct 2026 13:24:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xMmb1-0007jy-42
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 13:24:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xMmb1-00000004Gqi-0249;
 Fri, 30 Oct 2026 13:24:38 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xMmb0-00000007k4Z-27Yf;
 Fri, 30 Oct 2026 13:24:38 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=fv865zl5JzNvZdc+vUmKul0mo11ea8d5CxR8YPF0vJw=; b=kKciUV1IgKBlLSTfpR19gwsPcB
	X428zkaf64a7toiZDT+UuSp6x0jaDrEkLmn0oO103AbDc++owXVp16pjF/xJKnUM0HO3wzuVLvHfl
	L2zypsFEsXy7IlJrlc0+I5vZw3zG8m9G/WSAHW6FPHKakE443Up+geD0mTerMNHZwjQs=;
From: Roger Pau Monne <roger@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 2/2] x86/hvm: sync APs TSC with the BSP at creation only
Date: Fri, 30 Oct 2026 14:24:19 +0100
Message-ID: <20261030132419.84264-3-roger@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030132419.84264-1-roger@xenproject.org>
References: <20261030132419.84264-1-roger@xenproject.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The current logic syncs the APs' TSC with the BSP both at reset and when
setting the vCPU state.  This doesn't match hardware behavior, where APs
are only in sync at platform start.

Move the TSC sync so it's done in hvm_vcpu_initialise(), that's called a
single time at vCPU creation.  This matches the hardware behavior.
INIT-SIPI and VCPUOP_initialise no longer re-sync a vCPU's TSC to vCPU 0's.

On migration the TSC offset for offline vCPUs is not transferred
(hvm_save_cpu_ctxt() skips offline vCPUs).  To avoid an unexpected skew
synchronize offline vCPUs with the first online vCPU, taking into account
the TSC_ADJUST value.

The clearing of TSC_ADJUST is also made consistent with hardware behavior:
clear it on S3 resume, but not across an INIT-SIPI or VCPUOP_initialise.
Additionally, on S3 resume start all vCPUs from a shared TSC reading, so
they are in sync.

Fixes: c31f8336e64e ("[HVM] Initialise AP TSC to same as BP TSC.")
Fixes: 6e0336351ed9 ("x86: Implement TSC adjust feature for HVM guest")
Signed-off-by: Roger Pau Monné <roger@xenproject.org>
---
 xen/arch/x86/hvm/domain.c |  5 -----
 xen/arch/x86/hvm/hvm.c    | 19 +++++++++++--------
 xen/arch/x86/hvm/save.c   | 34 ++++++++++++++++++++++++++++++++--
 xen/arch/x86/time.c       |  5 ++---
 4 files changed, 45 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/hvm/domain.c b/xen/arch/x86/hvm/domain.c
index 978d8b222256..71f49ec7ce9f 100644
--- a/xen/arch/x86/hvm/domain.c
+++ b/xen/arch/x86/hvm/domain.c
@@ -312,11 +312,6 @@ int arch_set_info_hvm_guest(struct vcpu *v, const struct vcpu_hvm_context *ctx)
     hvm_set_segment_register(v, x86_seg_es, &es);
     hvm_set_segment_register(v, x86_seg_tss, &tr);
 
-    /* Sync AP's TSC with BSP's. */
-    v->arch.hvm.cache_tsc_offset =
-        d->vcpu[0]->arch.hvm.cache_tsc_offset;
-    hvm_set_tsc_offset(v, v->arch.hvm.cache_tsc_offset);
-
     paging_update_paging_modes(v);
 
     hvmemul_cancel(v);
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index ef9c7cd05777..81e90cc8fc8e 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1667,6 +1667,12 @@ int hvm_vcpu_initialise(struct vcpu *v)
         /* Init guest TSC to start from zero. */
         hvm_set_guest_tsc(v, 0);
     }
+    else
+    {
+        /* Start in step with vCPU 0, as all CPUs do at power-on. */
+        v->arch.hvm.cache_tsc_offset = d->vcpu[0]->arch.hvm.cache_tsc_offset;
+        hvm_set_tsc_offset(v, v->arch.hvm.cache_tsc_offset);
+    }
 
     return 0;
 
@@ -4021,13 +4027,6 @@ void hvm_vcpu_reset_state(struct vcpu *v, uint16_t cs, uint16_t ip)
     hvm_set_segment_register(v, x86_seg_gdt, &reg);
     hvm_set_segment_register(v, x86_seg_idt, &reg);
 
-    /* Sync AP's TSC with BSP's. */
-    v->arch.hvm.cache_tsc_offset =
-        v->domain->vcpu[0]->arch.hvm.cache_tsc_offset;
-    hvm_set_tsc_offset(v, v->arch.hvm.cache_tsc_offset);
-
-    v->arch.hvm.msr_tsc_adjust = 0;
-
     paging_update_paging_modes(v);
 
     v->arch.flags |= TF_kernel_mode;
@@ -4079,9 +4078,13 @@ static void hvm_s3_resume(struct domain *d)
     if ( test_and_clear_bool(d->arch.hvm.is_s3_suspended) )
     {
         struct vcpu *v;
+        uint64_t at_tsc = rdtsc();
 
         for_each_vcpu( d, v )
-            hvm_set_guest_tsc(v, 0);
+        {
+            v->arch.hvm.msr_tsc_adjust = 0;
+            hvm_set_guest_tsc_fixed(v, 0, at_tsc);
+        }
         domain_unpause(d);
     }
 }
diff --git a/xen/arch/x86/hvm/save.c b/xen/arch/x86/hvm/save.c
index 8ab64057064e..65ebfd384d69 100644
--- a/xen/arch/x86/hvm/save.c
+++ b/xen/arch/x86/hvm/save.c
@@ -289,6 +289,7 @@ int hvm_load(struct domain *d, bool real, hvm_domain_context_t *h)
 {
     const struct hvm_save_header *hdr;
     struct hvm_save_descriptor *desc;
+    struct vcpu *v;
     int rc;
 
     if ( d->is_dying )
@@ -302,8 +303,6 @@ int hvm_load(struct domain *d, bool real, hvm_domain_context_t *h)
     rc = arch_hvm_check(d, hdr);
     if ( real )
     {
-        struct vcpu *v;
-
         ASSERT(!rc);
 
         /*
@@ -341,6 +340,37 @@ int hvm_load(struct domain *d, bool real, hvm_domain_context_t *h)
             /* Reset cursor for hvm_load(, true, ). */
             if ( !real )
                 h->cur = 0;
+            else
+            {
+                const struct vcpu *base = NULL;
+
+                /*
+                 * Offline vCPUs have no CPU record.  Adjust the TSC offset
+                 * based on the first online vCPU, taking into account
+                 * TSC_ADJUST which is saved regardless of whether the vCPU is
+                 * offline.
+                 */
+                for_each_vcpu(d, v)
+                    if ( !test_bit(_VPF_down, &v->pause_flags) )
+                    {
+                        base = v;
+                        break;
+                    }
+
+                if ( !base )
+                    return 0;
+
+                for_each_vcpu(d, v)
+                    if ( test_bit(_VPF_down, &v->pause_flags) )
+                    {
+                        v->arch.hvm.cache_tsc_offset =
+                            base->arch.hvm.cache_tsc_offset -
+                            base->arch.hvm.msr_tsc_adjust +
+                            v->arch.hvm.msr_tsc_adjust;
+                        hvm_set_tsc_offset(v, v->arch.hvm.cache_tsc_offset);
+                    }
+            }
+
             return 0;
         }
 
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index f37fddc61e47..79c7123c0a5b 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -3087,9 +3087,8 @@ int tsc_set_info(struct domain *d,
              * set_tsc_offset() is called from hvm_vcpu_initialise() before
              * tsc_set_info(). New vtsc mode may require recomputing TSC
              * offset.
-             * We only need to do this for BSP during initial boot. APs will
-             * call set_tsc_offset() later from hvm_vcpu_reset_state() and they
-             * will sync their TSC to BSP's sync_tsc.
+             * We only need to do this for BSP during initial boot.  APs copy
+             * vCPU 0's offset when created in hvm_vcpu_initialise().
              */
             d->arch.hvm.sync_tsc = rdtsc();
             hvm_set_tsc_offset(d->vcpu[0],
-- 
2.55.0


