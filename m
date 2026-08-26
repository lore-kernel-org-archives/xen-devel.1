Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92CCC5DF97
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2026 11:49:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399820.1635788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzC8H-0008Ra-3V; Wed, 26 Aug 2026 11:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399820.1635788; Wed, 26 Aug 2026 11:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzC8G-0008RT-WE; Wed, 26 Aug 2026 11:49:29 +0000
Received: by outflank-mailman (input) for mailman id 1399820;
 Wed, 26 Aug 2026 11:49:27 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wzC8F-0008QJ-QC
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 11:49:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzC8E-00H6sA-E1
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 13:49:26 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8ed2c2-bab6-0a2a0a5309dd-0a2a4509bd18-10
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 13:49:26 +0200
Received: from [209.85.208.43] (helo=mail-ed1-f43.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8ed2c6-be1a-0a2a45090019-d155d02bd5f6-3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 13:49:26 +0200
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-6a18e24ad25so1134635a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 04:49:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a5deac24f1sm3779661a12.23.2026.08.26.04.49.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 04:49:24 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787744966; x=1788349766; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ss+YAR07JAD2fP8Xw057WPMldxuT1tgMd9itna7uDYs=;
        b=S+nmjldk/NDQYpCuR+yofeIGw0OFY3vZFArRTjUlOgDHVPJHg0UemMmFHPkZfYlrm3
         O7v/vZfxEXgycXGtlER7daPpPRsyGD9ZzaLOCLLVkKNv1BJsdodn6NaO1Md80OKlraVc
         OZxBg4ni0YBz79Sd96DunC01D++gy+7nt8NIX140NRzCZNQ2pPJG/HbSuDr0eyTmnZvE
         ti+bAiz2zpE1tfsYFEKbu6hcOb5l2/sNDbyRlV9LPaD2mJfbVeJtxc33DCcpn7YEi2BF
         2QZu04ItCzfY0GN1XA6/Qm+LVIExlV92UikmBNRcRkLX5DNCe3F5UuTO9UE44JyOhbv2
         93TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787744966; x=1788349766;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ss+YAR07JAD2fP8Xw057WPMldxuT1tgMd9itna7uDYs=;
        b=BS1Y1gOfHIRVyC/3zbp9ZkEG152oVVRMoBIRDHioIneBn7NUrLmQW/tu33Z/fdM6HB
         mF0taakQ3WoEKg36YxbESOG2ilrZbyF5QhnfapvDsRuWNQHh1iteBlVXrNnav1yW2BGs
         iiWJVRfCZS9LpMQtsHblJwHSL7rswYjOhoe84tRQwvZK2W9yuOlygNzArznw5ld8c1Xb
         tqXOhgJy6mzskNfjePYregQPy96SmC+BrjirrNHzphNGEQHIeogxxIjmFwXRjI2JfWNl
         C57bh4ZbgEb6/LgeYpS3VgR1L2O91VkYI7rwwqQrx02XKnpePh22wh3RrxZ/AjXuOKYH
         cq8A==
X-Gm-Message-State: AFuF++kMlbqdnd/BNxNuKqGgGp9uA+N4zoSY0OPr7Cjtck2yuesQofh3
	AJu20vdVwqrYOpghPEyrn9i9A1eF5W/QVKl006usrVz2URbxrNAQDJJIoeUZE1sSOvJj39WG8Ze
	GEZUGgw==
X-Gm-Gg: AR+sD12LZIdDR07uFsCeUBUTJFufHi06MZoNiNosjdaXZmsLg/a52fwQrp4sNFb2bSU
	mejFw4kwlUVGgjb3YIWD/l3js50MngGsCgdxLhoWMAYX8V6Ak2mQHoRcfoZMvNazCE7mKOBjZqg
	0GhvOTykCF4y7tcj9YPWnbZqPL2gFK9ZeyZPIZ4bGZdDycd5IlCBG7H13RkC33fH3hDFDTiCID9
	75BG9nibs79mfNRsa93TLoaVmGzYFmdJhYRuNaP2wESUnzOOz+Fjw6qlfzDNo5lrt0G4SE5jmzR
	danr2kPUUd25RiWzcYTHGE9FZ1gR2u4v6FLOPpmH1/Iw5dkBRKxKnIqE1Iz/kFyvFHS/fqwWGqz
	VbHOov4SPQz1v4cR06dLz2M6w8xktLrwlPGw8+WIJsOHblJAdwymPwxpcIkOsGgedDyTWnqZ8RS
	ci620DybebwQWOihzb7hH8kiJCj1gqeDGu3+KsUbA0QL/dx5/0RtaK1Y5zhSwK+U9FelpJtFSVm
	vhGrbVlr30ZNoZj8Fz5evb+sxb5wexUVQuA3oN/4GQCAD8N4QAKN3HnTziDiBLp
X-Received: by 2002:a05:6402:210d:b0:6a4:2ee:5c6d with SMTP id 4fb4d7f45d1cf-6a5df5e3966mr8005779a12.6.1787744965646;
        Wed, 26 Aug 2026 04:49:25 -0700 (PDT)
Message-ID: <53e4e1d5-ccb6-4400-b440-7ec9a7273ac8@suse.com>
Date: Wed, 26 Aug 2026 13:49:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: replace a few more is_hvm_*() by is_pv_*()
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1787744966-FD469034-A51DA306/0/0
X-purgate-type: clean
X-purgate-size: 7657

Along the lines of [1]. Both (respectively negated) can be used
interchangeably when no system domains are (potentially) involved.

For gtime_to_gtsc():
- with !is_hvm_domain() and HVM=n the conditional but not its body would
  disappear,
- with is_pv_domain() and PV=n, the conditional and its body will
  disappear.
Then mirror the change to gtsc_to_gtime() for consistency.

For mem_sharing_control() vm_event_toggle_singlestep(), as VM_EVENT /
MEM_SHARING depend on HVM anyway, the !is_hvm() form can't ever become
compile-time constant, while the is_pv() form can. Same for PoD code,
HVM-specific pieces of shadow/{common,multi}.c, and everything in
shadow/hvm.c.

[1] https://lists.xen.org/archives/html/xen-devel/2026-08/msg01156.html

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Pretty likely there are more instances of this pattern that could do with
using the opposite predicate. However, e.g. further is_{hvm,pv}() uses in
time.c look to be asking for a little more trickery to benefit both PV=n
and HVM=n (not at the same time, of course).

As to system domains, and as previously pointed out: is_pv_domain() is odd
there for the PV=n case. With PV=y it returns true there, while with PV=n
it yields false.

--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1509,7 +1509,7 @@ static inline int mem_sharing_control(st
 {
     if ( enable )
     {
-        if ( unlikely(!is_hvm_domain(d) || !cpu_has_vmx) )
+        if ( unlikely(is_pv_domain(d) || !cpu_has_vmx) )
             return -EOPNOTSUPP;
 
         if ( unlikely(!hap_enabled(d)) )
--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -353,7 +353,7 @@ void p2m_pod_get_mem_target(const struct
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
 
-    ASSERT(is_hvm_domain(d));
+    ASSERT(!is_pv_domain(d));
 
     pod_lock(p2m);
     lock_page_alloc(p2m);
@@ -1432,7 +1432,7 @@ bool p2m_pod_active(const struct domain
     struct p2m_domain *p2m;
     bool res;
 
-    if ( !is_hvm_domain(d) )
+    if ( is_pv_domain(d) )
         return false;
 
     p2m = p2m_get_hostp2m(d);
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -171,7 +171,7 @@ void shadow_promote(struct domain *d, mf
     {
         page->shadow_flags = 0;
 #ifdef CONFIG_HVM
-        if ( is_hvm_domain(d) )
+        if ( !is_pv_domain(d) )
             page->pagetable_dying = false;
 #endif
     }
@@ -1520,7 +1520,7 @@ int sh_remove_all_mappings(struct domain
                    mfn_x(gmfn), gfn_x(gfn),
                    page->count_info, page->u.inuse.type_info,
                    is_special_page(page),
-                   (is_hvm_domain(d) && is_ioreq_server_page(d, page)));
+                   (!is_pv_domain(d) && is_ioreq_server_page(d, page)));
     }
 
     paging_unlock(d);
@@ -2318,7 +2318,7 @@ void shadow_teardown(struct domain *d, b
     d->arch.paging.mode &= ~PG_log_dirty;
 
 #ifdef CONFIG_HVM
-    if ( is_hvm_domain(d) && d->arch.hvm.dirty_vram.sh )
+    if ( !is_pv_domain(d) && d->arch.hvm.dirty_vram.sh )
     {
         xfree(d->arch.hvm.dirty_vram.sh->sl1ma);
         xfree(d->arch.hvm.dirty_vram.sh->dirty_bitmap);
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -315,7 +315,7 @@ const struct x86_emulate_ops *shadow_ini
     const struct vcpu *curr = current;
     unsigned long addr;
 
-    ASSERT(is_hvm_vcpu(curr));
+    ASSERT(!is_pv_vcpu(curr));
 
     memset(sh_ctxt, 0, sizeof(*sh_ctxt));
 
@@ -361,7 +361,7 @@ void shadow_continue_emulation(struct sh
 {
     unsigned long addr, diff;
 
-    ASSERT(is_hvm_vcpu(current));
+    ASSERT(!is_pv_vcpu(current));
 
     /*
      * We don't refetch the segment bases, because we don't emulate
@@ -1217,7 +1217,7 @@ void shadow_vram_get_mfn(mfn_t mfn, unsi
     unsigned long gfn;
     struct sh_dirty_vram *dirty_vram = d->arch.hvm.dirty_vram.sh;
 
-    ASSERT(is_hvm_domain(d));
+    ASSERT(!is_pv_domain(d));
 
     if ( !dirty_vram /* tracking disabled? */ ||
          !(l1f & _PAGE_RW) /* read-only mapping? */ ||
@@ -1247,7 +1247,7 @@ void shadow_vram_put_mfn(mfn_t mfn, unsi
     unsigned long gfn;
     struct sh_dirty_vram *dirty_vram = d->arch.hvm.dirty_vram.sh;
 
-    ASSERT(is_hvm_domain(d));
+    ASSERT(!is_pv_domain(d));
 
     if ( !dirty_vram /* tracking disabled? */ ||
          !(l1f & _PAGE_RW) /* read-only mapping? */ ||
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -601,7 +601,7 @@ _sh_propagate(struct vcpu *v,
         sflags &= ~_PAGE_RW;
 
 #ifdef CONFIG_HVM
-    if ( unlikely(level == 1) && is_hvm_domain(d) )
+    if ( unlikely(level == 1) && !is_pv_domain(d) )
     {
         struct sh_dirty_vram *dirty_vram = d->arch.hvm.dirty_vram.sh;
 
@@ -2240,7 +2240,7 @@ static int cf_check sh_page_fault(
 #ifdef CONFIG_HVM
             /* Magic MMIO marker: extract gfn for MMIO address */
             ASSERT(sh_l1e_is_mmio(sl1e));
-            ASSERT(is_hvm_vcpu(v));
+            ASSERT(!is_pv_vcpu(v));
             gpa = gfn_to_gaddr(sh_l1e_mmio_get_gfn(sl1e)) | (va & ~PAGE_MASK);
             perfc_incr(shadow_fault_fast_mmio);
             SHADOW_PRINTK("fast path mmio %#"PRIpaddr"\n", gpa);
@@ -2562,7 +2562,7 @@ static int cf_check sh_page_fault(
     /* Need to hand off device-model MMIO to the device model */
     if ( p2mt == p2m_mmio_dm )
     {
-        ASSERT(is_hvm_vcpu(v));
+        ASSERT(!is_pv_vcpu(v));
 
         sh_audit_gw(v, &gw);
         gpa = guest_walk_to_gpa(&gw);
@@ -2589,7 +2589,7 @@ static int cf_check sh_page_fault(
      * CR0.WP is clear, we must emulate faulting supervisor writes to
      * allow the guest to write through read-only PTEs.  Emulate if the
      * fault was a non-user write to a present page.  */
-    if ( is_hvm_domain(d)
+    if ( !is_pv_domain(d)
          && unlikely(!hvm_wp_enabled(v))
          && regs->error_code == (PFEC_write_access|PFEC_page_present)
          && mfn_valid(gmfn) )
@@ -3718,7 +3718,7 @@ static void cf_check sh_pagetable_dying(
     unsigned long l3gfn;
     mfn_t l3mfn;
 
-    ASSERT(is_hvm_domain(d));
+    ASSERT(!is_pv_domain(d));
 
     gcr3 = v->arch.hvm.guest_cr[3];
     /* fast path: the pagetable belongs to the current context */
@@ -3794,7 +3794,7 @@ static void cf_check sh_pagetable_dying(
     mfn_t smfn, gmfn;
     p2m_type_t p2mt;
 
-    ASSERT(is_hvm_domain(d));
+    ASSERT(!is_pv_domain(d));
 
     gmfn = get_gfn_query(d, _gfn(gpa >> PAGE_SHIFT), &p2mt);
     paging_lock(d);
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -2867,7 +2867,7 @@ custom_param("tsc", tsc_parse);
 
 uint64_t gtime_to_gtsc(const struct domain *d, uint64_t time)
 {
-    if ( !is_hvm_domain(d) )
+    if ( is_pv_domain(d) )
     {
         if ( time < d->arch.vtsc_offset )
             return -scale_delta(d->arch.vtsc_offset - time,
@@ -2880,7 +2880,7 @@ uint64_t gtime_to_gtsc(const struct doma
 #ifdef CONFIG_HVM
 uint64_t gtsc_to_gtime(const struct domain *d, uint64_t tsc)
 {
-    ASSERT(is_hvm_domain(d));
+    ASSERT(!is_pv_domain(d));
     return scale_delta(tsc, &d->arch.vtsc_to_ns);
 }
 #endif /* CONFIG_HVM */
--- a/xen/arch/x86/vm_event.c
+++ b/xen/arch/x86/vm_event.c
@@ -65,7 +65,7 @@ void vm_event_toggle_singlestep(struct d
                          VM_EVENT_FLAG_FAST_SINGLESTEP)) )
         return;
 
-    if ( !is_hvm_domain(d) )
+    if ( is_pv_domain(d) )
         return;
 
     ASSERT(atomic_read(&v->vm_event_pause_count));

