Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA83606A31E
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 07:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=H8m2l5Yk
Received: from list by lists.xenproject.org with outflank-mailman.1500628.1696695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVkaI-0005CM-0a; Tue, 24 Nov 2026 07:04:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500628.1696695; Tue, 24 Nov 2026 07:04:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVkaH-0005CD-RK; Tue, 24 Nov 2026 07:04:57 +0000
Received: by outflank-mailman (input) for mailman id 1500628;
 Tue, 24 Nov 2026 07:04:56 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVkaG-0005C7-Cw
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 07:04:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVkaE-008FHj-6Y
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 08:04:54 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b053714-bab6-0a2a0a5309dd-0a2a4503dabe-10
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 08:04:53 +0100
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b053715-fae8-0a2a45030019-d155802cc58e-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 08:04:53 +0100
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4bb5b8ef642so35423835e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 23:04:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8538b2c5sm411534195e9.5.2026.11.23.23.04.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2026 23:04:53 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795503893; x=1796108693; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oGDED30vuQuGViVrSNDR+E4SUwIUrpzIyTq/78xEuCM=;
        b=H8m2l5YkPsLU8pk+oxdOtjd4wWMwnM0DDDtsEzJbLHkbIEfeVCbW43NCIsBFcViiO/
         AYiR71rz1Al9baomp4wzT1gItdqWFO2k+DvARJP+RMzwTZcDRqQ+zNbLqDpsy2QJTMkJ
         QOgaERN8t8mUKqVhJbrhL6hKVfeMSdkxcbkRpGboZUJiHJ/+Kp9wMjUI+OPS6N84bIN8
         9cxbxBIP/PA2FVJ4nvTALIwBjr2PsFl12VzHqzW9mAcBA4kpgpGPHJzuQ0NckSh4vUnM
         sVE3k400mT0j9SNbegINLndDHzkkfOHdCma0eIudQyx+wLMBbraq6XBlQWd62I/XQb0e
         pODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503893; x=1796108693;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oGDED30vuQuGViVrSNDR+E4SUwIUrpzIyTq/78xEuCM=;
        b=yKfmoNJ1WaM2acGR/1Mrh3KYp02iPXh8ZF19YdgkSh19ejZhDS1SC8FIiFSTZsSZ6y
         y2cMv6wulLCTGjVKh5PCPnsY4d14IX9DEwSiz3Se7H+CNNSS/Xcxa62/OJetctYANUz2
         teVm5CJ+5rS3y9XRbwRVqRF7IyKox29SKK4W/2HadizNsoyY3dVUPoQW1Ov6q8eiMuvh
         yAackOl9oqWIDkeEgwOlBcf9dmkzLpvfpVgWyU7BDvDWbucMexouUvOk/pVR4BROtUMJ
         sgog5z6mhuafaVdbcbX8JUIxPm+ULhUkCBZZaz4yqcgygh0Nd4GZ8FbuKBIgw86kqwx/
         0kPA==
X-Gm-Message-State: APuU4Z+8n9XjAJzwsqlXkl/xRjNxhT7ynXTr5TIEW64Mbzz8r2HytoGA
	SWIegYcTn2Lk3PSWUBsOlMwCQ3EHIA25kMcJ0oT89UFu3pPwg8t/nutntqyXUrE/8FDGtr6th4r
	F5GnsKg==
X-Gm-Gg: AZFdTZfEWTfGpNPzrwMrWnZFMkBrgdC5rGsCCXYJ1/L93PF2wk+O9+D2JQ0PchD7Kn5
	Z8ofbFBg7+Chxa7bUhfSdXYMJkhloB6Ohl/vsWOrKBtGrPLb9F/qAHFtLmDjp355+mu5p7NT015
	6o1ebL2g/PXnHaC/Uy+trFrgKA3rxbKJVo3Qt/9dKlp7LMvc2O/3RJprtyFFVJwzGY3dhzGnvGC
	/OVH25y8APt5xS89Gkt4s4rFzBcVLjALPOH4+jBBC9BXHnPRAc9Voj8xX1qok1q3KKLg1GuC3aY
	3j7BCS8+pH+rEoRRb71CQNiMddIMEesCphhOHLid+/fV6byhL0m/PdfLPH9ljbZwFGE13h2t1a2
	b3LEJ2SFwdnKqeKL5XlEkOoAfX2foUk/rQ89hkLgFEnFatgy9kMnaM8BhY94dQvGaWzmLRtKmze
	ofsXtwTuJcIvpGS6ev8a3zGcUmfIT+nKbOEh91K6o3qMt9waq/07No7CkdJdJK/PKw84WxjhedG
	aAcYc7NK3aP1EGFzgsPJcWPmEOLWXZQyiIi6+RYpeEeCP5jXO7L7ca9Sdp7mtyGlMsSXDplCGrA
	uWgd8z8RXLNCP6ZQtFXim5ujoLZ293abXt9RZpY3Kz9sy0C3c44HMAwota5reUDx55YLP1jAHxk
	+hDOhAie7+gO7tDyMDfg=
X-Received: by 2002:a05:600c:19d0:b0:4bb:65ed:b55c with SMTP id 5b1f17b1804b1-4bb88824b18mr282116285e9.33.1795503893393;
        Mon, 23 Nov 2026 23:04:53 -0800 (PST)
Message-ID: <bde76aca-0011-47ab-820a-65f3b7d6bb55@suse.com>
Date: Tue, 24 Nov 2026 08:04:52 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/HVM: re-work PIC interrupt acceptance
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
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1795503893-6C8DD4E9-21185E26/10/78276251493
X-purgate-type: spam
X-purgate-size: 3989
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

AI reports that the vlapic_hw_disabled() in vlapic_accept_pic_intr() is
wrong: In that mode __vlapic_accept_pic_intr() means to return true, which
that early check defeats. AI's suggestion to use has_vlapic() instead
(despite it noting that all checking needs to be in sync between
vlapic_accept_pic_intr() and vlapic_adjust_i8259_target()) isn't quite
right, though - all other checks want to be in __vlapic_accept_pic_intr().

Put the has_vlapic() there first, together with the hardware-disabled
check.

The has_vioapic() check there was similarly placed wrongly: Without any
IO-APIC, PIC interrupts can still go through the LAPIC (typically LVT0).
Therefore cover merely the redir entry 0 checking by that check.

The IO-APIC and LVT0 checks really could come in either order.

While there constify pointers and have the helper function return bool.

Fixes: 302a8519fb85 ("x86/vlapic: fixes for HVM code when running without a vlapic")
Reported-by: Roger Pau Monné <roger.pau@amd.com>
Fixes: 5fe65b5eafc8 ("x86/HVM: add more checks verifying that PIT/PIC/IOAPIC are emulated")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Alternative (functionally identical) code structure could be

    /* LAPIC absent or fully disabled? */
    if ( !has_vlapic(d) || vlapic_hw_disabled(vlapic) )
        return true;

    /* LAPIC software-disabled? */
    if ( vlapic_disabled(vlapic) )
        return false;

    if ( has_vioapic(d) )
    {
        ...

This is functionally identical because in software-disabled mode all LVTs
have their mask bits set, without it being possible to clear them. I.e.
the final "return" will always produce "false" in that case.

--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1269,37 +1269,40 @@ void vlapic_tdt_msr_set(struct vlapic *v
                 vlapic->hw.tdt_msr, guest_tsc);
 }
 
-static int __vlapic_accept_pic_intr(struct vcpu *v)
+static bool __vlapic_accept_pic_intr(const struct vcpu *v)
 {
-    struct domain *d = v->domain;
-    struct vlapic *vlapic = vcpu_vlapic(v);
-    uint32_t lvt0 = vlapic_get_reg(vlapic, APIC_LVT0);
-    union vioapic_redir_entry redir0;
+    const struct domain *d = v->domain;
+    const struct vlapic *vlapic = vcpu_vlapic(v);
 
     ASSERT(has_vpic(d));
 
-    if ( !has_vioapic(d) )
-        return 0;
-
-    redir0 = domain_vioapic(d, 0)->redirtbl[0];
-
     /* We deliver 8259 interrupts to the appropriate CPU as follows. */
-    return ((/* IOAPIC pin0 is unmasked and routing to this LAPIC? */
-             ((redir0.fields.delivery_mode == dest_ExtINT) &&
-              !redir0.fields.mask &&
-              redir0.fields.dest_id == VLAPIC_ID(vlapic) &&
-              !vlapic_disabled(vlapic)) ||
-             /* LAPIC has LVT0 unmasked for ExtInts? */
-             ((lvt0 & (APIC_DM_MASK | APIC_LVT_MASKED)) == APIC_DM_EXTINT) ||
-             /* LAPIC is fully disabled? */
-             vlapic_hw_disabled(vlapic)));
+
+    /* LAPIC absent or fully disabled? */
+    if ( !has_vlapic(d) || vlapic_hw_disabled(vlapic) )
+        return true;
+
+    if ( has_vioapic(d) && vlapic_enabled(vlapic) )
+    {
+        union vioapic_redir_entry redir0 = domain_vioapic(d, 0)->redirtbl[0];
+
+        /* IOAPIC pin0 is unmasked and routing to this LAPIC? */
+        if ( redir0.fields.delivery_mode == dest_ExtINT &&
+             !redir0.fields.mask &&
+             redir0.fields.dest_id == VLAPIC_ID(vlapic) )
+            return true;
+    }
+
+    /* LAPIC has LVT0 unmasked for ExtInts? */
+    return (vlapic_get_reg(vlapic, APIC_LVT0) &
+            (APIC_DM_MASK | APIC_LVT_MASKED)) == APIC_DM_EXTINT;
 }
 
 int vlapic_accept_pic_intr(struct vcpu *v)
 {
     bool target, accept = false;
 
-    if ( vlapic_hw_disabled(vcpu_vlapic(v)) || !has_vpic(v->domain) )
+    if ( !has_vpic(v->domain) )
         return 0;
 
     target = v == v->domain->arch.hvm.i8259_target;

