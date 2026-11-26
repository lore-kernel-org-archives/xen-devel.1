Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47536606A33D
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 13:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=fV8P4XMZ
Received: from list by lists.xenproject.org with outflank-mailman.1503503.1699223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWZkE-00006q-N6; Thu, 26 Nov 2026 13:42:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1503503.1699223; Thu, 26 Nov 2026 13:42:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWZkE-00006j-K7; Thu, 26 Nov 2026 13:42:38 +0000
Received: by outflank-mailman (input) for mailman id 1503503;
 Thu, 26 Nov 2026 13:42:37 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWZkD-00006Y-Cd
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 13:42:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWZkC-00GvyJ-PC
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 14:42:36 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b083742-bab6-0a2a0a5309dd-0a2a4504dd80-38
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 14:42:36 +0100
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b08374c-b57f-0a2a45040019-d155802cb132-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 14:42:36 +0100
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4a2153c8525so56880765e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 05:42:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853b216esm663452485e9.12.2026.11.26.05.42.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2026 05:42:35 -0800 (PST)
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
        d=suse.com; s=google; t=1795700556; x=1796305356; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:cc
         :content-language:references:to:from:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=or8W2qkB22tPBuEGqin/oU2LgT4N5zex2/Ai5RsXC9k=;
        b=fV8P4XMZYLrCNOp5XNFgLsiil2ndkbIQqtsE798aOy2xyPY+PUC7GCbF4ftDPwUgRE
         0BSAK1uncUQPFWvafYTNvs5ywOgHmI4tnCUNGdtBcwrD/oSb8j4HbLQq7H+bvVotN6i8
         xLTU5xbe5V1MAczCfKpHOcx11ubcJLyk7MB2WY/UCyE+ehDOyH6iKscRLcu0V1uszcMb
         fb99WBVtEkdY6aE63t6Ix0F/wcaiFBlg9zxmsZvsZqB3De9WigaHez1lMcTb5kXOFZpZ
         5vD8qRFdvyd9l9uFqju83GqGmtOKcqQg7nIed1PXsW0Y6L9iqa6Vi4j7QWibtc+jFKEn
         3UxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795700556; x=1796305356;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:cc
         :content-language:references:to:from:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=or8W2qkB22tPBuEGqin/oU2LgT4N5zex2/Ai5RsXC9k=;
        b=xLh7oXDQrWdk03n8Vy1mdawQGUuWUm2CVm9x7r3U8IpAt6R6KRS3kOqpGTZQ1Gp55N
         RE6DvZLOzqorWTCuHcRWVSdNvFjSNDbeVYRW7TYWw7zkkAUmkC+5FGi8e64eF4CgY/IU
         6jwdtyHQdIAIowOOANHkD9vsDYVORxE+J/9v0pAdU8aWi+EBOdTLSZN7bu4RYdOOPHjt
         tTeobPPcHDFXtzWiDLCizVgZbgkNokDSDsS7/Ws3JlmoaWsj5QoSwnnGuInsDKT9l8NC
         KGgREGWDMFEk7jOJgE5NA3IXjj6w1pBS6TqbSjnljh6lVFtBkiQRg++mW5J0p4lF+t7+
         oGfw==
X-Gm-Message-State: APuU4Z+JTC8XmqgOixOfFLBVqDMIPDARiIVSRlaAOr9aMuw4g5pl+mYO
	AFUmm5arE3wfl1UDCkKEv/UrgtaM0/Cr3xOh7a34SsMfuGo0MUSK14TdtuYhkHB5DkupTB3zKrN
	q0Kat/Q==
X-Gm-Gg: AZFdTZdBPxS9lkr4c53Kj9VkdjEbSAAoA1c5NlJhwWZeVdNXpkjYZY8NEe0dhfOwGGA
	17ryzywlYUd6ScMXDw78BwLSNmnN3HMAJFmg+5HlIEQfKbDkYriXuEWNRb9EQEbtT7O4V+QFE1V
	ezABHHSPLDHXo3eFTjo9Llk8+MFf0rEyNBqke4JCef3XRZ29VuWVyEgFwsvoRu5axYbRQjlDIMM
	GVbioK1qpIZ7SzSRa+cy7xgjxBa76tSj4RDHO3WzFulA53bQyfuuvK7dFYUjUCNtB3L49rHKHAk
	XcVMt37udpY8lMr3NCoAuuJRbqsjzaM4e4wNgJtXzf7Lz5RhvqliLyTrGY3Gib2Stm25p3IRaVo
	oadwVwBHPEFACzzNb6qLHMkj5+1iYRiq8SQsnwFMLd3uu0V2HnniNrxJ8SQmnGBQ9sNowO0tDCC
	tNLsKnFBPi85JXkR0janWXVD+has7IKpiEfTbg6+j2+DXts8Sl7JRNrIYPJQ+6Hu/DSalGaeBKY
	rTKQmdimrgkyRDg8eSR4wZwnuLSyRfP3HKz2vo61ZGpFMVUzeYwzeCd9rHRHjiHyu77wr9lNnVp
	REaUN8N0hSufYEEbH+AYm0WiKmBxQ/ISXA9Yx9Z+kGYzUOduh1hPeFCLPyaVgpEhYdRP+V0LRIi
	tk8hXjb+iN9mLVZ/K
X-Received: by 2002:a05:600c:a11:b0:4a2:e0c:2b0a with SMTP id 5b1f17b1804b1-4bb888120famr431148455e9.16.1795700556208;
        Thu, 26 Nov 2026 05:42:36 -0800 (PST)
Message-ID: <9b299f1d-eee2-402e-bab0-c0ae346d49b4@suse.com>
Date: Thu, 26 Nov 2026 14:42:35 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 13/13] x86/domctl: use domain_vcpu() to handle various sub-ops
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
X-purgate-ID: tlsNG-ebf023/1795700556-510DDB50-A209150F/10/78276251493
X-purgate-type: spam
X-purgate-size: 2946
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If for nothing else, then to reduce the number of open-coded d->vcpu[]
accesses.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -573,11 +573,10 @@ long arch_do_domctl(
 
     case XEN_DOMCTL_sendtrigger:
     {
-        struct vcpu *v;
+        struct vcpu *v = domain_vcpu(d, domctl->u.sendtrigger.vcpu);
 
         ret = -ESRCH;
-        if ( domctl->u.sendtrigger.vcpu >= d->max_vcpus ||
-             (v = d->vcpu[domctl->u.sendtrigger.vcpu]) == NULL )
+        if ( !v )
             break;
 
         switch ( domctl->u.sendtrigger.trigger )
@@ -789,11 +788,10 @@ long arch_do_domctl(
     case XEN_DOMCTL_get_ext_vcpucontext:
     {
         struct xen_domctl_ext_vcpucontext *evc = &domctl->u.ext_vcpucontext;
-        struct vcpu *v;
+        struct vcpu *v = domain_vcpu(d, evc->vcpu);
 
         ret = -ESRCH;
-        if ( (evc->vcpu >= d->max_vcpus) ||
-             ((v = d->vcpu[evc->vcpu]) == NULL) )
+        if ( !v )
             break;
 
         if ( domctl->cmd == XEN_DOMCTL_get_ext_vcpucontext )
@@ -912,15 +910,14 @@ long arch_do_domctl(
 
     case XEN_DOMCTL_debug_op:
     {
-        struct vcpu *v;
+        struct vcpu *v = domain_vcpu(d, domctl->u.debug_op.vcpu);
 
         ret = -EOPNOTSUPP;
         if ( !IS_ENABLED(CONFIG_HVM) )
             break;
 
         ret = -EINVAL;
-        if ( (domctl->u.debug_op.vcpu >= d->max_vcpus) ||
-             ((v = d->vcpu[domctl->u.debug_op.vcpu]) == NULL) )
+        if ( !v )
             break;
 
         ret = -EINVAL;
@@ -943,15 +940,14 @@ long arch_do_domctl(
     case XEN_DOMCTL_getvcpuextstate:
     {
         struct xen_domctl_vcpuextstate *evc = &domctl->u.vcpuextstate;
-        struct vcpu *v;
+        struct vcpu *v = domain_vcpu(d, evc->vcpu);
         uint32_t offset = 0;
 
 #define PV_XSAVE_HDR_SIZE (2 * sizeof(uint64_t))
 #define PV_XSAVE_SIZE(xcr0) (PV_XSAVE_HDR_SIZE + xstate_uncompressed_size(xcr0))
 
         ret = -ESRCH;
-        if ( (evc->vcpu >= d->max_vcpus) ||
-             ((v = d->vcpu[evc->vcpu]) == NULL) )
+        if ( !v )
             goto vcpuextstate_out;
 
         ret = -EINVAL;
@@ -1148,7 +1144,7 @@ long arch_do_domctl(
     {
         struct xen_domctl_vcpu_msrs *vmsrs = &domctl->u.vcpu_msrs;
         struct xen_domctl_vcpu_msr msr = {};
-        struct vcpu *v;
+        struct vcpu *v = domain_vcpu(d, vmsrs->vcpu);
         static const uint32_t msrs_to_send[] = {
             MSR_SPEC_CTRL,
             MSR_INTEL_MISC_FEATURES_ENABLES,
@@ -1161,8 +1157,7 @@ long arch_do_domctl(
         uint32_t nr_msrs = ARRAY_SIZE(msrs_to_send);
 
         ret = -ESRCH;
-        if ( (vmsrs->vcpu >= d->max_vcpus) ||
-             ((v = d->vcpu[vmsrs->vcpu]) == NULL) )
+        if ( !v )
             break;
 
         ret = -EINVAL;


