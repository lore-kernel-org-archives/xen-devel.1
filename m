Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77911C79F82
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 13:04:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412017.1642500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3vUf-0007yZ-0B; Tue, 08 Sep 2026 13:04:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412017.1642500; Tue, 08 Sep 2026 13:04:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3vUe-0007yS-TT; Tue, 08 Sep 2026 13:04:08 +0000
Received: by outflank-mailman (input) for mailman id 1412017;
 Tue, 08 Sep 2026 13:04:07 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3vUd-0007xu-Os
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 13:04:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3vUd-004Zhk-5J
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 15:04:07 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa007bd-8faa-0a2a0a5109dd-0a2a450b8ee4-26
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 15:04:07 +0200
Received: from [209.85.208.176] (helo=mail-lj1-f176.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa007c6-b7e8-0a2a450b0019-d155d0b0d453-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 15:04:07 +0200
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-39c74c469e8so29495451fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 06:04:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485885bfe14sm36519258f8f.35.2026.09.08.06.04.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 06:04:05 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788872646; x=1789477446; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=N4ehEHAnD16Wpc4/Cpl1nzW0/o6yLO83VsoudM0AX+E=;
        b=StqUffyYbC8vWMRWtrFhFKzJYaDcrQ5u+KPMsBxhltwXgCptzdFXZGt4aFCSwVFUmS
         lCaqwQpuiFF9YZuEr3wdmVAT0KgvSJM8mR7nApmr//ZbHS88Ma1iRcVfsc41hBhhPQ9r
         gxM+k6RR2RKWVmk4lTKso8Y75rYpjtcbvmzsh/wI+QQqe+0TwAekfjjCakEV8YsTG4sA
         5XNpjiq1eiO7k5/XomfDdGUGnnmbFAFFsx1USmdRpEyaWcpauiymejXDCoQfix2xLMJT
         80PKCoT0JxznrnEj394vt+YHu9GKKnN06V2e4zdpKgAlqX1gAUGG7HGj6txOnYnHvQtf
         8NNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872646; x=1789477446;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=N4ehEHAnD16Wpc4/Cpl1nzW0/o6yLO83VsoudM0AX+E=;
        b=qd3prFamnMPRUtSlGLbAq+FAl0m7xgBW4ZCbIOdt+eCKyll3u/4A63jvoQO+vNrmai
         9TAMwN8xt4lSQXUaSz8lxAh5fs/9yP9E3sMA8D5pyIcKkQbvNM8SyLqR8Lp4gedV/Rtd
         iETft/4SLTedliKAQpyOeiy7Bp5ygol0F6keIbPlLFlitv2W0kWG8U2PP76NjpIu3NKO
         43w9sFZYOsK/o5PurU9IpEJe9xx1R/YlCHcyHmuCX18u7zd3ZckY+gDFboiZao5GRkmZ
         aWUV7+Uwjpx5w6iG1PZcOywnbn49HK4xo2k60e678yXVwEUZfGBS8W+IyIfiX/d9R4Rj
         nehA==
X-Gm-Message-State: AFuF++m7cjp66oq+nS6SQemWgDx0LlfJ9ofHDiA0W4R06R44rIsmA9BA
	Bhb2ZHqWaCGlLAnyuVMjL8yNEElrrSt2BByYyRPIdD9sHCgjCvGZd0h18uOoXqzFAOx8aQewvHw
	T0GbRGA==
X-Gm-Gg: AYBFou1C65f7WP5PF7RakbIslw3JJpBVLSyKK9XOvkltoYJggaHJnWjAQZKwjokHYbQ
	byrbfBEqp+uGvFFwPfwaM0rSnOLzNgVeLEC+Pdk10Bio6IrTDhyUj6cDZ9FZCgU4FIi5ENjF/3Q
	nL1qUltIWLbG1HvKw+SuxFP4tt3lLK3SCvZC/pD6NzsE+zBU+7Cvi2jX1U8j4XXUJHySKxbxaHG
	Pn5E2OcYNVk5BTk+E+XabRILSxHt+VmbRB0N9FJpoLmOc90SvsaFKQHAzj/2zY/W9ArJhpEfjc6
	gpCsSR9k4+ZFAAjlKb3kkFnF7XS1bYO/nSht/DachY3eG6x44FWILzGvBlH8FasyFPHYVFJEJfq
	fIigoayyjMElk5kINara3Mn6r9ahWiGVyVWJIULE0RpWWEsOrbwlKBQtJtSDdp9Cnv1k7vnQYZ5
	ibtODAM/L8oWGzHPhWeq+suXUQRdwE4xocwjpMZBlpB2sSt1hUz/vQITfYGG8snAOsFUW4HfXj4
	HLQOdDWS/ZbiEWCRdGB6+WqUwAtektei8/adFkOAtj0hG+WOcutCqr7eFQP2wY=
X-Received: by 2002:a05:651c:a11a:20b0:3a3:7681:6d6e with SMTP id 38308e7fff4ca-3a3768174ebmr19166161fa.23.1788872646239;
        Tue, 08 Sep 2026 06:04:06 -0700 (PDT)
Message-ID: <20d7bba5-33d2-48c0-963e-7ed24e014e21@suse.com>
Date: Tue, 8 Sep 2026 15:04:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 6/6] x86/HVM: drop vector parameter from .pi_update_irte()
 hook
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <eb5925e4-2409-452c-8768-4ca6717eb156@suse.com>
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
In-Reply-To: <eb5925e4-2409-452c-8768-4ca6717eb156@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1788872647-AB4D39EA-10A8BAFC/0/0
X-purgate-type: clean
X-purgate-size: 2804

It's redundant with the struct pirq * being passed, and the vector field
in struct msi_desc wanting to be cleared can be derived from v (and hence
pi_desc) being NULL.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -395,7 +395,7 @@ void vmx_pi_hooks_deassign(struct domain
  * when guest changes MSI/MSI-X information.
  */
 static int cf_check vmx_pi_update_irte(const struct vcpu *v,
-                                       const struct pirq *pirq, uint8_t gvec)
+                                       const struct pirq *pirq)
 {
     const struct pi_desc *pi_desc = v ? &v->arch.hvm.vmx.pi_desc : NULL;
     struct irq_desc *desc;
@@ -414,7 +414,7 @@ static int cf_check vmx_pi_update_irte(c
         goto unlock_out;
     }
     msi_desc->pi_desc = pi_desc;
-    msi_desc->gvec = gvec;
+    msi_desc->gvec = pi_desc ? pirq_dpci(pirq)->gmsi.gvec : 0;
     msg = msi_desc->msg;
 
     spin_unlock_irq(&desc->lock);
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -220,8 +220,7 @@ struct hvm_function_table {
     void (*sync_pir_to_irr)(struct vcpu *v);
     bool (*test_pir)(const struct vcpu *v, uint8_t vector);
     void (*handle_eoi)(uint8_t vector, int isr);
-    int (*pi_update_irte)(const struct vcpu *v, const struct pirq *pirq,
-                          uint8_t gvec);
+    int (*pi_update_irte)(const struct vcpu *v, const struct pirq *pirq);
     void (*update_vlapic_mode)(struct vcpu *v);
 
     /*Walk nested p2m  */
@@ -835,9 +834,9 @@ static inline void hvm_set_nonreg_state(
 }
 
 static inline int hvm_pi_update_irte(const struct vcpu *v,
-                                     const struct pirq *pirq, uint8_t gvec)
+                                     const struct pirq *pirq)
 {
-    return alternative_call(hvm_funcs.pi_update_irte, v, pirq, gvec);
+    return alternative_call(hvm_funcs.pi_update_irte, v, pirq);
 }
 
 static inline void hvm_update_vlapic_mode(struct vcpu *v)
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -388,7 +388,7 @@ int pt_irq_create_bind(
         /* Use interrupt posting if it is supported. */
         if ( iommu_intpost )
         {
-            rc = hvm_pi_update_irte(vcpu, info, pirq_dpci->gmsi.gvec);
+            rc = hvm_pi_update_irte(vcpu, info);
 
             if ( rc )
             {
@@ -686,7 +686,7 @@ int pt_irq_destroy_bind(
             what = "bogus";
     }
     else if ( pirq_dpci && pirq_dpci->gmsi.posted )
-        hvm_pi_update_irte(NULL, pirq, 0);
+        hvm_pi_update_irte(NULL, pirq);
 
     if ( pirq_dpci && (pirq_dpci->flags & HVM_IRQ_DPCI_MAPPED) &&
          list_empty(&pirq_dpci->digl_list) )


