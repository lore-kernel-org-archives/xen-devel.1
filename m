Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BF7606A88E
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 15:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=UYiTlD5x
Received: from list by lists.xenproject.org with outflank-mailman.1484065.1687414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9v8-00012q-2M; Wed, 11 Nov 2026 15:07:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484065.1687414; Wed, 11 Nov 2026 15:07:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9v7-00012j-Vn; Wed, 11 Nov 2026 15:07:29 +0000
Received: by outflank-mailman (input) for mailman id 1484065;
 Wed, 11 Nov 2026 15:07:28 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9v6-00012b-1p
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:07:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9v5-00F0Yo-35
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 16:07:27 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af484ae-e002-0a2a0a5209dd-0a2a4509b60a-2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:07:27 +0100
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af484ae-be1a-0a2a45090019-d155dd2dd57d-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:07:27 +0100
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-48e47347279so2117464f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 07:07:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4988bdef64dsm10098338f8f.20.2026.11.11.07.07.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 07:07:25 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794409646; x=1795014446; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DwtAcY4BBg/KuGzoMGl20WMUAxNRUBF8IwZZ3J/fmRE=;
        b=UYiTlD5x5TaNTCPhSkfartt1cP5LFKVHbFqcIZwP6CYTrIpnJ/wBMMhM7cLFdunx2f
         N2AFVXhu08dku+lOpJiGa+ER2fnD9KEfRjaAdbxOn6FnDjh1nCmvlSevyaBzZxKot2ZG
         0qAy1TB5Agx1YTdt8VziVA1FKyL9Wk5bQoLKXqvMWuoK96ZFYIzbF/UrBHWSwft3iaMe
         K2y1lUI2vSv8LvQhOMC2zsK2BuDA/GvbNBG5c34HG6UL+npLlCMHAGYZKSQknDlb2lzo
         +rEVfJNC3EWyVWWeRg24Olh8g/RypZOSZ+INrLCR0M8e8XDkxq25f+LVxLmuJLtx/MgL
         Sw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794409646; x=1795014446;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DwtAcY4BBg/KuGzoMGl20WMUAxNRUBF8IwZZ3J/fmRE=;
        b=uJpnDOS3D5jpy6wZWAaXN2KFpE+SrWvuqmOFUc6Ag9N0qgxYW48Co6g9mADZgw6MM/
         jz3Esdli779yq+DwMFFSBe4VgelKDRHfdWbttZdejjCfmtaWrIRzsOC0/3ZW0UJCQl4G
         HSm9q3N+NrXiOFwSNmgvcHrdHV3uxxOOsHVrBNxYHWhDvYrx2JYT3Skco7um2o5LwB+2
         I7SVh/PL7z5L+a3gBglVGSsSAnK+12nh34BGEqTiDAT6eDhm90lmVYfYo+muWYmIeaJV
         RtWYz6SmpW7RmPjV3bOfmVCydia7GE9YuCxc6iSIgGO3y1NN2tFAOqGDw9JbLaKhM+9r
         WHeA==
X-Gm-Message-State: APuU4Z+rw8eGbu4TVdYKTOJcjmInHjnd0kstFOLztS+9DwfL4IkdAUeE
	/N5raKvrBSAdxQliv29Ka4K7IQrxt0o+Dv1FWgd7ulskWL0vqeypP0/+mCVg5mHCBWn93ZSBkXO
	pVGhxpQ==
X-Gm-Gg: AYBFou0akHQ+7g0DzceQ11+HzExCrQsvkBZJgZwvQwsiY54CcVHqHAqU7pXX73Gv0Ww
	x8Pjq7jstiz5Ju3LAsa2FPcBYQtJrH42QdgkBn6MIYf8AecdL9JBGNMVkJ0giwmJfPLR1yG/LNV
	LAGZzYnId2cYI7q+lKs12TuQucXYKN2kMW4CEE7b0UISlrNbK4vFeYR3jC4mk+lN/ED9oOBoJ/4
	yvJb0oBl3PstRqBGU05HOVfvAGcadE3SsS8YmM38J6vh6mMXN67KZj/6M8siw8b1qmtrwEIGH+a
	9QAzBhVKK0UUmNTv+ysdcGNQqKwajsXFvbswyUfa0X6OmxhancoMeBCPkoW8fSDY6suaiB9j0AT
	td5AUSjcdcUkTHW0rETnyTmND6Nsp8YHVJwXHCUwr0F4yX5p4qWCXAGbqs7ZLMYWU3Y3v2xOGMN
	vtmrDq9f7ukaCN7fxf2iK8XvFmFj8u63DcemJz/WQzl1qRkBCDvsXHVHkWusZoD/3InFugqxsBc
	B+IFg+qe51v2o8WKneOXAPL6D5N9Y2Jt+q/UIRVkdLnhgkcOGRFWWrZHwbKa/Iv5jTPOQ2jDoGg
	pOhsvtApWhIoHvB4Zvu901GOPbC25R7J+Bw+vCP+powOqgks85bk5tTL31FtdQ4rvXX3/KrOioL
	Jb8ubuR/60fRf9s8nu+eh9n4TQUw5RDIJn22rFNk=
X-Received: by 2002:a5d:5f52:0:b0:498:b92a:2f7 with SMTP id ffacd0b85a97d-499c7dff0dbmr4496612f8f.30.1794409646363;
        Wed, 11 Nov 2026 07:07:26 -0800 (PST)
Message-ID: <ffa820a7-5d1e-4e64-ab21-9e1583311abb@suse.com>
Date: Wed, 11 Nov 2026 16:07:25 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 01/28] x86/xstate: re-size save area when CPUID policy
 changes
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <0407294d-d605-41f3-a16b-1505d897ef3f@suse.com>
Content-Language: en-US
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
In-Reply-To: <0407294d-d605-41f3-a16b-1505d897ef3f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1794409647-3AEDE034-3D96EB42/10/78276251493
X-purgate-type: spam
X-purgate-size: 5916
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

vCPU-s get maximum size areas allocated initially. Hidden (and in
particular default-off) features may allow for a smaller size area to
suffice.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: Re-base.
v2: Use 1ul instead of 1ull. Re-base.
---
This could be further shrunk if we used XSAVEC / if we really used
XSAVES, as then we don't need to also cover the holes. But since we
currently use neither of the two in reality, this would require more
work than just adding the alternative size calculation here.

Seeing that both vcpu_init_fpu() and cpu_policy_updated() are called
from arch_vcpu_create(), I'm not sure we really need this two-stage
approach - the slightly longer period of time during which
v->arch.xsave_area would remain NULL doesn't look all that problematic.
But since xstate_alloc_save_area() gets called for idle vCPU-s, it has
to stay anyway in some form, so the extra code churn may not be worth
it.

Instead of cpu_policy_xcr0_max(), cpu_policy_xstates() may be the
interface to use here. But it remains to be determined whether the
xcr0_accum field is meant to be inclusive of XSS (in which case it would
better be renamed) or exclusive. Right now there's no difference as we
don't support any XSS-controlled features.

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -290,13 +290,17 @@ void update_guest_memory_policy(struct v
  * Called during vcpu construction, and each time the toolstack changes the
  * CPU policy configuration for the domain.
  */
-static void cpu_policy_updated(struct vcpu *v)
+static int __must_check cpu_policy_updated(struct vcpu *v)
 {
-    if ( is_hvm_vcpu(v) )
+    int rc = xstate_update_save_area(v);
+
+    if ( !rc && is_hvm_vcpu(v) )
         hvm_cpuid_policy_changed(v);
+
+    return rc;
 }
 
-void domain_cpu_policy_changed(struct domain *d)
+int domain_cpu_policy_changed(struct domain *d)
 {
     const struct cpu_policy *p = d->arch.cpu_policy;
     struct vcpu *v;
@@ -454,17 +458,22 @@ void domain_cpu_policy_changed(struct do
 
     /* Nested doesn't have the necessary processing, yet. */
     if ( nestedhvm_enabled(d) && (p->feat.user_msr || p->feat.msr_imm) )
-        return /*-EINVAL*/;
+        return -EINVAL;
 
     for_each_vcpu ( d, v )
     {
-        cpu_policy_updated(v);
+        int rc = cpu_policy_updated(v);
+
+        if ( rc )
+            return rc;
 
         /* If PMU version is zero then the guest doesn't have VPMU */
         if ( boot_cpu_data.vendor == X86_VENDOR_INTEL &&
              p->basic.pmu_version == 0 )
             vpmu_destroy(v);
     }
+
+    return 0;
 }
 
 unsigned int arch_domain_struct_memflags(void)
@@ -562,7 +571,7 @@ int arch_vcpu_create(struct vcpu *v)
     {
         vpmu_initialise(v);
 
-        cpu_policy_updated(v);
+        rc = cpu_policy_updated(v);
     }
 
     return rc;
@@ -936,11 +945,11 @@ int arch_domain_create(struct domain *d,
      */
     d->arch.x87_fip_width = cpu_has_fpu_sel ? 0 : 8;
 
-    domain_cpu_policy_changed(d);
-
     d->arch.msr_relaxed = config->arch.misc_flags & XEN_X86_MSR_RELAXED;
 
-    return 0;
+    rc = domain_cpu_policy_changed(d);
+    if ( !rc )
+        return 0;
 
  fail:
     d->is_dying = DOMDYING_dead;
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -87,7 +87,7 @@ static int update_domain_cpu_policy(stru
     recalculate_cpuid_policy(d);
 
     /* Recalculate relevant dom/vcpu state now the policy has changed. */
-    domain_cpu_policy_changed(d);
+    ret = domain_cpu_policy_changed(d);
 
  out:
     /* Free whichever struct is not installed in struct domain. */
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -692,7 +692,7 @@ struct guest_memory_policy
 void update_guest_memory_policy(struct vcpu *v,
                                 struct guest_memory_policy *policy);
 
-void domain_cpu_policy_changed(struct domain *d);
+int __must_check domain_cpu_policy_changed(struct domain *d);
 
 bool update_secondary_system_time(struct vcpu *v,
                                   struct vcpu_time_info *u);
--- a/xen/arch/x86/include/asm/xstate.h
+++ b/xen/arch/x86/include/asm/xstate.h
@@ -109,6 +109,7 @@ void compress_xsave_states(struct vcpu *
 /* extended state init and cleanup functions */
 void xstate_free_save_area(struct vcpu *v);
 int xstate_alloc_save_area(struct vcpu *v);
+int xstate_update_save_area(struct vcpu *v);
 void xstate_init(struct cpuinfo_x86 *c);
 unsigned int xstate_uncompressed_size(uint64_t xcr0);
 unsigned int xstate_compressed_size(uint64_t xstates);
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -575,6 +575,40 @@ int xstate_alloc_save_area(struct vcpu *
     return 0;
 }
 
+int xstate_update_save_area(struct vcpu *v)
+{
+    unsigned int i, size, old;
+    struct xsave_struct *save_area;
+    uint64_t xcr0_max = cpu_policy_xcr0_max(v->domain->arch.cpuid);
+
+    ASSERT(!is_idle_vcpu(v));
+
+    if ( !cpu_has_xsave )
+        return 0;
+
+    if ( v->arch.xcr0_accum & ~xcr0_max )
+        return -EBUSY;
+
+    for ( size = old = XSTATE_AREA_MIN_SIZE, i = 2; i < xstate_features; ++i )
+    {
+        if ( xcr0_max & (1ul << i) )
+            size = max(size, xstate_offsets[i] + xstate_sizes[i]);
+        if ( v->arch.xcr0_accum & (1ul << i) )
+            old = max(old, xstate_offsets[i] + xstate_sizes[i]);
+    }
+
+    save_area = _xvrealloc(v->arch.xsave_area, size, __alignof(*save_area));
+    if ( !save_area )
+        return -ENOMEM;
+
+    ASSERT(old <= size);
+    memset((void *)save_area + old, 0, size - old);
+
+    v->arch.xsave_area = save_area;
+
+    return 0;
+}
+
 void xstate_free_save_area(struct vcpu *v)
 {
     XVFREE(v->arch.xsave_area);


