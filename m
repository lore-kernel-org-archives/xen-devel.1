Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBEA606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 13:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=B4aXz69q
Received: from list by lists.xenproject.org with outflank-mailman.1503488.1699207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWZjR-0007dB-AH; Thu, 26 Nov 2026 13:41:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1503488.1699207; Thu, 26 Nov 2026 13:41:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWZjR-0007d4-61; Thu, 26 Nov 2026 13:41:49 +0000
Received: by outflank-mailman (input) for mailman id 1503488;
 Thu, 26 Nov 2026 13:41:47 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWZjP-0007cc-8g
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 13:41:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWZjO-00CSdg-L2
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 14:41:46 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b083710-2eae-0a2a0a5409dd-0a2a45098ce2-36
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 14:41:46 +0100
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b08371a-be1a-0a2a45090019-d155dd33d834-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 14:41:46 +0100
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-498f5fa5103so4186649f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 05:41:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6bb98b4dsm41338467f8f.53.2026.11.26.05.41.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2026 05:41:45 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Cc:Content-Language:References:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795700506; x=1796305306; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:cc
         :content-language:references:to:from:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YWTNRorQkm9m/1VL2Iu5cgfPQ/8FHY7xSZLou/Hnqoc=;
        b=B4aXz69qdQvJK0KrvIIocjl9jvSf3WSaHt2b5BeOaWY3h1Gw5NP3BNKdHCAF69HHcI
         1I02H5NFk5sFqhZYNV/10IgQloXIVLM4X5VQwxHT7fRSpI+BWocNDasY6iEHR+cpwxAL
         JJAFtrnuYoDD0vaKe0hBXCDayyw2sN70333fm9K7FBgc2YoLDTRq++pYFKyIr5v9wmG/
         2HR8SMEDVt9VSkkqkyOwaSpit8yYjbNlhZaswzxbTaH1e34oiw9d3UD8PtsJ6KbB23MZ
         NuL4JmlJyArtn1gnCZl85P4fjqs02zXklIQxeVZfX+5lPNmNVSdh2sA0//8H+Tgzjoy/
         3IKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795700506; x=1796305306;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:cc
         :content-language:references:to:from:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YWTNRorQkm9m/1VL2Iu5cgfPQ/8FHY7xSZLou/Hnqoc=;
        b=y1j7hwyu7kevdoWeliwkMuLQ8OzrOa+VoYdT3d/2E4bxHuaF16vWawhwWcZySckLmu
         UG8ykaty12kREf72joFIkG6V8LReiD3AwmpFCJm9qIXpUQ42sj8LVHlTNXs+gljSRRJu
         cHSNTLnr0IJrcsb+VN6wuIQKSb0WI8hIWWfpsJ3CBhllj9V+/W86jNggyc0oauy46A++
         9bmbK4NcG791OvHxa3Iz0Dq3LJb9S1TkdOSPUIYqZ5uQ+qmA1Wh5EUq7BuYNZsmKbX9a
         vf5kAbxmTjm76WIumhwFwBLoMYxpkrYia8s/98FfBGMg8uIhIBvXtYF4hDwkc9/Lr6h/
         ODGA==
X-Gm-Message-State: APuU4Z8gOoLqivAHr5SZug8atgUQ7m47cFDnG6Shmw3t15dk0kCQgYqn
	TN1/+39Lyq/iWNd5e1lRnAWDkBczXcV0JVzzurXJgHzLswKeLAFwya7lStsQ8T30B5pc0XMwzwU
	q27uq0g==
X-Gm-Gg: AZFdTZeiKoZLYe2dzhsdwHwq+floct6xPSfAWdraBo3zngRDnm+koWFlYMKKnx6qmDA
	cH2xHYTwbGUW7QaCeAfvCoy0VzKUS75AIq7ksR17lq3NI4AAB7yDRfvTMgiL8qiQKke54wK98rp
	JCEgzvMCJbU6DAUv3DHbv4euxGvROY6aZJ9RNaCLJnaOoOP8XkoMe+x0muv6XnIk2bv9Q5GXMTe
	9hhkdvRDdFtjMGEa0GHe/doyYvgvBBecx7kFpM20PkDYg3GqeZE/uDgoCwTBcJd1UEmYoFJPNR9
	RG9u35LEqAiqZ8BY56yyCnhbDQNEa138UW1HEOkYly7Gm0ql9dgGZ5mHEFT4ROFnXjp303YSrXF
	UuQmwmP1vddgka2fxMz+2b9NFKpZsIhK6W+DaVQo46Z10IWviZbc6fd0OQ8SmIsoYOgVwOtFmZj
	v/opF3wyKfvEiR+FtFVTGILcg+RTHA4v/HLyeJt6v8Z985BXz+Eix+QlJmTmCCuM6HdLXmjm8u+
	VoR1OhmpPOuHXtOJ7eEdhdZW5SxTiOMSY+D50YVKNR/NLxrbNwIUrukHTfPkcL0joCWFZLCiLCx
	FQcISlpiwzsI3Qv+C/F0fK/HCQEfmw2KF/k/6HyPOiu6aWIe48fHoHwm51lmDx7rwb/gGMdIex+
	Zid6YuXQl6aYavU12
X-Received: by 2002:adf:e183:0:b0:4a7:790c:4a56 with SMTP id ffacd0b85a97d-4abb5cc17dcmr37305079f8f.33.1795700506003;
        Thu, 26 Nov 2026 05:41:46 -0800 (PST)
Message-ID: <d8b8908d-3491-4be4-b661-859a78e6dfe6@suse.com>
Date: Thu, 26 Nov 2026 14:41:45 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 11/13] x86/HVM: introduce hvm_load_vcpu_instance()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1ea6d02b-8fba-4b1e-969c-033d6a7be233@suse.com>
Content-Language: en-US
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
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
In-Reply-To: <1ea6d02b-8fba-4b1e-969c-033d6a7be233@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1795700506-3B2DC034-7D1E627A/10/78276251493
X-purgate-type: spam
X-purgate-size: 12149
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use this to remove open-coding of domain_vcpu().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
lapic_load_{hidden,regs}() are left alone, as I fear analysis tools would
otherwise pick on the missing NULL checks.

--- a/xen/arch/x86/cpu/mcheck/vmce.c
+++ b/xen/arch/x86/cpu/mcheck/vmce.c
@@ -364,15 +364,14 @@ static int cf_check vmce_save_vcpu_ctxt(
 
 static int cf_check vmce_load_vcpu_ctxt(struct domain *d, hvm_domain_context_t *h)
 {
-    unsigned int vcpuid = hvm_load_instance(h);
-    struct vcpu *v;
+    struct vcpu *v = hvm_load_vcpu_instance(d, h);
     struct hvm_vmce_vcpu ctxt;
     int err;
 
-    if ( vcpuid >= d->max_vcpus || (v = d->vcpu[vcpuid]) == NULL )
+    if ( !v )
     {
         dprintk(XENLOG_G_ERR, "HVM restore: dom%d has no vcpu%u\n",
-                d->domain_id, vcpuid);
+                d->domain_id, hvm_load_instance(h));
         err = -EINVAL;
     }
     else
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -804,14 +804,13 @@ static int cf_check hvm_save_tsc_adjust(
 
 static int cf_check hvm_load_tsc_adjust(struct domain *d, hvm_domain_context_t *h)
 {
-    unsigned int vcpuid = hvm_load_instance(h);
-    struct vcpu *v;
+    struct vcpu *v = hvm_load_vcpu_instance(d, h);
     struct hvm_tsc_adjust ctxt;
 
-    if ( vcpuid >= d->max_vcpus || (v = d->vcpu[vcpuid]) == NULL )
+    if ( !v )
     {
         dprintk(XENLOG_G_ERR, "HVM restore: dom%d has no vcpu%u\n",
-                d->domain_id, vcpuid);
+                d->domain_id, hvm_load_instance(h));
         return -EINVAL;
     }
 
@@ -1018,18 +1017,16 @@ unsigned long hvm_cr4_guest_valid_bits(c
 static int cf_check hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
 {
     const struct cpu_policy *p = d->arch.cpu_policy;
-    unsigned int vcpuid = hvm_load_instance(h);
-    struct vcpu *v;
+    struct vcpu *v = hvm_load_vcpu_instance(d, h);
     struct hvm_hw_cpu ctxt;
     struct segment_register seg;
     const char *errstr;
     unsigned long valid;
 
-    /* Which vcpu is this? */
-    if ( vcpuid >= d->max_vcpus || (v = d->vcpu[vcpuid]) == NULL )
+    if ( !v )
     {
         dprintk(XENLOG_G_ERR, "HVM restore: dom%u has no vcpu%u\n",
-                d->domain_id, vcpuid);
+                d->domain_id, hvm_load_instance(h));
         return -EINVAL;
     }
 
@@ -1267,19 +1264,17 @@ CHECK_FIELD_(struct, xsave_hdr, reserved
 static int cf_check hvm_load_cpu_xsave_states(
     struct domain *d, hvm_domain_context_t *h)
 {
-    unsigned int vcpuid, size;
+    unsigned int size;
     int err;
-    struct vcpu *v;
+    struct vcpu *v = hvm_load_vcpu_instance(d, h);
     struct hvm_hw_cpu_xsave *ctxt;
     const struct hvm_save_descriptor *desc;
     unsigned int i, desc_start, desc_length;
 
-    /* Which vcpu is this? */
-    vcpuid = hvm_load_instance(h);
-    if ( vcpuid >= d->max_vcpus || (v = d->vcpu[vcpuid]) == NULL )
+    if ( !v )
     {
         dprintk(XENLOG_G_ERR, "HVM restore: dom%d has no vcpu%u\n",
-                d->domain_id, vcpuid);
+                d->domain_id, hvm_load_instance(h));
         return -EINVAL;
     }
 
@@ -1298,14 +1293,14 @@ static int cf_check hvm_load_cpu_xsave_s
     {
         printk(XENLOG_G_WARNING
                "HVM%d.%d restore: not enough data left to read xsave descriptor\n",
-               d->domain_id, vcpuid);
+               d->domain_id, v->vcpu_id);
         return -ENODATA;
     }
     if ( desc->length + sizeof (*desc) > h->size - h->cur)
     {
         printk(XENLOG_G_WARNING
                "HVM%d.%d restore: not enough data left to read %u xsave bytes\n",
-               d->domain_id, vcpuid, desc->length);
+               d->domain_id, v->vcpu_id, desc->length);
         return -ENODATA;
     }
     if ( desc->length < offsetof(struct hvm_hw_cpu_xsave, save_area) +
@@ -1313,7 +1308,7 @@ static int cf_check hvm_load_cpu_xsave_s
     {
         printk(XENLOG_G_WARNING
                "HVM%d.%d restore mismatch: xsave length %u < %zu\n",
-               d->domain_id, vcpuid, desc->length,
+               d->domain_id, v->vcpu_id, desc->length,
                offsetof(struct hvm_hw_cpu_xsave,
                         save_area) + XSTATE_AREA_MIN_SIZE);
         return -EINVAL;
@@ -1331,7 +1326,7 @@ static int cf_check hvm_load_cpu_xsave_s
         printk(XENLOG_G_WARNING
                "HVM%d.%d restore: inconsistent xsave state (feat=%#"PRIx64
                " accum=%#"PRIx64" xcr0=%#"PRIx64" bv=%#"PRIx64" err=%d)\n",
-               d->domain_id, vcpuid, ctxt->xfeature_mask, ctxt->xcr0_accum,
+               d->domain_id, v->vcpu_id, ctxt->xfeature_mask, ctxt->xcr0_accum,
                ctxt->xcr0, ctxt->save_area.xsave_hdr.xstate_bv, err);
         return err;
     }
@@ -1350,13 +1345,13 @@ static int cf_check hvm_load_cpu_xsave_s
             {
                 printk(XENLOG_G_WARNING
                        "HVM%d.%u restore mismatch: xsave length %#x > %#x (non-zero data at %#x)\n",
-                       d->domain_id, vcpuid, desc->length, size, i);
+                       d->domain_id, v->vcpu_id, desc->length, size, i);
                 return -EOPNOTSUPP;
             }
         }
         printk(XENLOG_G_WARNING
                "HVM%d.%u restore mismatch: xsave length %#x > %#x\n",
-               d->domain_id, vcpuid, desc->length, size);
+               d->domain_id, v->vcpu_id, desc->length, size);
         /* Rewind desc_length to ignore the extraneous zeros. */
         desc_length = size;
     }
@@ -1365,14 +1360,14 @@ static int cf_check hvm_load_cpu_xsave_s
     {
         printk(XENLOG_G_WARNING
                "HVM%d.%u restore: compressed xsave state not supported\n",
-               d->domain_id, vcpuid);
+               d->domain_id, v->vcpu_id);
         return -EOPNOTSUPP;
     }
     else if ( desc_length != size )
     {
         printk(XENLOG_G_WARNING
                "HVM%d.%u restore mismatch: xsave length %#x != %#x\n",
-               d->domain_id, vcpuid, desc_length, size);
+               d->domain_id, v->vcpu_id, desc_length, size);
         return -EINVAL;
     }
     /* Checking finished */
@@ -1481,15 +1476,15 @@ static int cf_check hvm_save_cpu_msrs(st
 
 static int cf_check hvm_load_cpu_msrs(struct domain *d, hvm_domain_context_t *h)
 {
-    unsigned int i, vcpuid = hvm_load_instance(h);
-    struct vcpu *v;
+    unsigned int i;
+    struct vcpu *v = hvm_load_vcpu_instance(d, h);
     const struct hvm_save_descriptor *desc;
     struct hvm_msr *ctxt;
 
-    if ( vcpuid >= d->max_vcpus || (v = d->vcpu[vcpuid]) == NULL )
+    if ( !v )
     {
         dprintk(XENLOG_G_ERR, "HVM restore: dom%d has no vcpu%u\n",
-                d->domain_id, vcpuid);
+                d->domain_id, hvm_load_instance(h));
         return -EINVAL;
     }
 
@@ -1499,21 +1494,21 @@ static int cf_check hvm_load_cpu_msrs(st
     {
         printk(XENLOG_G_WARNING
                "HVM%d.%d restore: not enough data left to read MSR descriptor\n",
-               d->domain_id, vcpuid);
+               d->domain_id, v->vcpu_id);
         return -ENODATA;
     }
     if ( desc->length + sizeof (*desc) > h->size - h->cur)
     {
         printk(XENLOG_G_WARNING
                "HVM%d.%d restore: not enough data left to read %u MSR bytes\n",
-               d->domain_id, vcpuid, desc->length);
+               d->domain_id, v->vcpu_id, desc->length);
         return -ENODATA;
     }
     if ( desc->length < HVM_CPU_MSR_SIZE(1) )
     {
         printk(XENLOG_G_WARNING
                "HVM%d.%d restore mismatch: MSR length %u < %zu\n",
-               d->domain_id, vcpuid, desc->length, HVM_CPU_MSR_SIZE(1));
+               d->domain_id, v->vcpu_id, desc->length, HVM_CPU_MSR_SIZE(1));
         return -EINVAL;
     }
 
@@ -1525,7 +1520,7 @@ static int cf_check hvm_load_cpu_msrs(st
     {
         printk(XENLOG_G_WARNING
                "HVM%d.%d restore mismatch: MSR length %u != %zu\n",
-               d->domain_id, vcpuid, desc->length,
+               d->domain_id, v->vcpu_id, desc->length,
                HVM_CPU_MSR_SIZE(ctxt->count));
         return -EOPNOTSUPP;
     }
--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -735,15 +735,15 @@ static int cf_check hvm_save_mtrr_msr(st
 
 static int cf_check hvm_load_mtrr_msr(struct domain *d, hvm_domain_context_t *h)
 {
-    unsigned int vcpuid = hvm_load_instance(h), i;
-    struct vcpu *v = domain_vcpu(d, vcpuid);
+    unsigned int i;
+    struct vcpu *v = hvm_load_vcpu_instance(d, h);
     struct mtrr_state *m;
     struct hvm_hw_mtrr hw_mtrr;
 
     if ( !v )
     {
         dprintk(XENLOG_G_ERR, "HVM restore: dom%d has no vcpu%u\n",
-                d->domain_id, vcpuid);
+                d->domain_id, hvm_load_instance(h));
         return -EINVAL;
     }
 
--- a/xen/arch/x86/hvm/viridian/viridian.c
+++ b/xen/arch/x86/hvm/viridian/viridian.c
@@ -1152,14 +1152,13 @@ static int cf_check viridian_save_vcpu_c
 static int cf_check viridian_load_vcpu_ctxt(
     struct domain *d, hvm_domain_context_t *h)
 {
-    unsigned int vcpuid = hvm_load_instance(h);
-    struct vcpu *v;
+    struct vcpu *v = hvm_load_vcpu_instance(d, h);
     struct hvm_viridian_vcpu_context ctxt;
 
-    if ( vcpuid >= d->max_vcpus || (v = d->vcpu[vcpuid]) == NULL )
+    if ( !v )
     {
         dprintk(XENLOG_G_ERR, "HVM restore: dom%d has no vcpu%u\n",
-                d->domain_id, vcpuid);
+                d->domain_id, hvm_load_instance(h));
         return -EINVAL;
     }
 
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1577,16 +1577,17 @@ static void lapic_load_fixup(struct vlap
 }
 
 
-static int lapic_check_common(const struct domain *d, unsigned int vcpuid)
+static int lapic_check_common(const struct domain *d,
+                              const hvm_domain_context_t *h)
 {
     if ( !has_vlapic(d) )
         return -ENODEV;
 
     /* Which vlapic to load? */
-    if ( !domain_vcpu(d, vcpuid) )
+    if ( !hvm_load_vcpu_instance(d, h) )
     {
         dprintk(XENLOG_G_ERR, "HVM restore: dom%d has no vCPU %u\n",
-                d->domain_id, vcpuid);
+                d->domain_id, hvm_load_instance(h));
         return -EINVAL;
     }
 
@@ -1596,9 +1597,8 @@ static int lapic_check_common(const stru
 static int cf_check lapic_check_hidden(const struct domain *d,
                                        hvm_domain_context_t *h)
 {
-    unsigned int vcpuid = hvm_load_instance(h);
     struct hvm_hw_lapic s;
-    int rc = lapic_check_common(d, vcpuid);
+    int rc = lapic_check_common(d, h);
 
     if ( rc )
         return rc;
@@ -1638,10 +1638,9 @@ static int cf_check lapic_load_hidden(st
 static int cf_check lapic_check_regs(const struct domain *d,
                                      hvm_domain_context_t *h)
 {
-    unsigned int vcpuid = hvm_load_instance(h);
     int rc;
 
-    if ( (rc = lapic_check_common(d, vcpuid)) )
+    if ( (rc = lapic_check_common(d, h)) )
         return rc;
 
     if ( !hvm_get_entry(LAPIC_REGS, h) )
--- a/xen/arch/x86/include/asm/hvm/save.h
+++ b/xen/arch/x86/include/asm/hvm/save.h
@@ -6,8 +6,8 @@
 #ifndef __XEN_HVM_SAVE_H__
 #define __XEN_HVM_SAVE_H__
 
-#include <xen/types.h>
 #include <xen/init.h>
+#include <xen/sched.h>
 #include <public/xen.h>
 #include <public/hvm/save.h>
 
@@ -97,6 +97,13 @@ static inline unsigned int hvm_load_inst
     return d->instance;
 }
 
+/* Unmarshalling: Wrapper around the above for per-vCPU instances. */
+static inline struct vcpu *hvm_load_vcpu_instance(
+    const struct domain *d, const struct hvm_domain_context *h)
+{
+    return domain_vcpu(d, hvm_load_instance(h));
+}
+
 /* Handler types for different types of save-file entry. 
  * The save handler may save multiple instances of a type into the buffer;
  * the load handler will be called once for each instance found when


