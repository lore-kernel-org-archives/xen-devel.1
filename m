Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4436BC61DBD
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 07:00:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401589.1637133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzqZN-0001JZ-28; Fri, 28 Aug 2026 07:00:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401589.1637133; Fri, 28 Aug 2026 07:00:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzqZM-0001JP-VG; Fri, 28 Aug 2026 07:00:08 +0000
Received: by outflank-mailman (input) for mailman id 1401589;
 Fri, 28 Aug 2026 07:00:07 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wzqZL-0001D7-Li
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 07:00:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzqZL-002GzA-2A
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 09:00:07 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9131f4-bab6-0a2a0a5309dd-0a2a450180c6-28
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 09:00:06 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9131f6-5984-0a2a45010019-d155802cd5b9-3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 09:00:06 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so5494255e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 00:00:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b94dd2517sm26945855e9.7.2026.08.28.00.00.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2026 00:00:05 -0700 (PDT)
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
        d=suse.com; s=google; t=1787900406; x=1788505206; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=glK8r2X1HDZrfZbkA9pEuF32dcf5dlBYeyJpXiQwXoQ=;
        b=XVyogzra0xEzrNKpQSj4tzdlahWELG75zxU+xCE/aeIiStWTF1x3sfjQFvnqJ12WP8
         KOX+VeP5KC+WgWJtawBpYDNce2TGgR7g+mDD0nLokPMj69qMfp4GtQLpHOHRdF5MtsBs
         /18O/P+C/6Neel2D/kGRjLR08r1TaTlyx5EwQApj4o92chBzpNfDDWiYgAIHB28uVp45
         XtaItEY0rREYakSjihiksr0UPwoOEK0v1ofJpSTSDK4vXaObjq1ERNPd0h8xpc5CAv06
         ebsWYZEPMOX65cDeZ1MkEauYqVMYosAV6SLsiRp2KOJ0AHsqDSeqEGIq+wZLJ8O9wh5z
         S8FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787900406; x=1788505206;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=glK8r2X1HDZrfZbkA9pEuF32dcf5dlBYeyJpXiQwXoQ=;
        b=OfKMeCDfn8FKto8U0Sn8mayQagTD3ZQW7vx7VYUsVBQ2V8snNFB9VBiyNVgXvd4gRW
         um2KzN+x8qa9rIxBfZf2hmvKzy1WC2Yh+Nji3UmBL7/tBFa9S8MiP0INMaj4gsEr+QAD
         ohL9FtMsxQYPvKZx9qS29sh10efB3t9+SeAlLu47izGfXUsf3VkVGlxSibVVo6UQYDYe
         A7CIoFRVqgy4dBBC0Db+j20cbQmVPw1WBy0aYb3vLrHdqjDz1kLRj+t1OklBl9blye+Q
         ZMkIp4U07qvO6XNWmH4v+SWxT9oa+bWPQQD8yNad5fh7k0FcFHK4lM0qDa53flJIFkuQ
         9rhQ==
X-Gm-Message-State: AFuF++nih3Yj7K9gPriljc6wEN32kP5U3CiAZr2lTZVz7Cg9UfpmAFaO
	veFWE0Iq//6UFLvufC/7SlSH45HD9DCKL/dVQ6xsbdTQd2yFlHwTbXJKeSbGiTctDimFWg+Syab
	UB/Etxw==
X-Gm-Gg: AR+sD12xaw9owJjOSJ9NLQnE/8je/0FGdDt6fwCcwTgzKzhsRHOgfXQWGhQbtgcOIY2
	g+PinZsLSYINnow3/C01bU5RO+y7YV7dGX3cdXuSKEpcBhY/dk/mhDi4XpFd01cjlntdkcloooz
	BUE2lncYG0cHH9JLqBLrNE1xb4ktT/b51Rs8hZ/Rz6aUiyKr23TeNUC4GX8AX+P1L6bgi7osp/I
	0jn4oIQDxFTuneq4G0TC9XjzY2KvAH4/5jmB1HKTBxTAdNulzSoLf/4u+9sweI746v8IXfyAaM6
	2xnIMTXYPB4WtAXCk1jvSHsjIPrrnMQ+jC+jN58hh9rslWapxZ2p2FnJ/45zGZ0YTlorEo7c3VG
	933+SRZRIdfjqRgTFffw4mQi/YiaAqPwMBZtLih9mEgyNB5mfmqTAMuCbJ87KDQef79VeO2K75R
	WJMshuVcB2X7He0/UCnMdLXKro76WhyLc6NwkzqyqljEcT+AnZ462YCu7ViCgvTS73zb9thb1KR
	N0SgNo+1Q4r0bvINMy3342n22WX8KTU/Sh8+qemowmsDaR8pZ+z3my0iXKTI04=
X-Received: by 2002:a05:600c:698c:b0:499:adb5:e7b2 with SMTP id 5b1f17b1804b1-49b91c3ddc7mr81316065e9.11.1787900406113;
        Fri, 28 Aug 2026 00:00:06 -0700 (PDT)
Message-ID: <12b3dd09-7249-47cd-8c66-e0efc1611b14@suse.com>
Date: Fri, 28 Aug 2026 09:00:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 02/12] x86/mm: pagetable_dying() is HVM+SHADOW_PAGING only
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
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
In-Reply-To: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1787900406-BF66C757-ECD8ED89/0/0
X-purgate-type: clean
X-purgate-size: 1249

The referenced commit didn't go far enough, leaving a Misra rule 2.1
(unreachable code) violation: The function lacks "noreturn" in this
configuration. Since with SHADOW_PAGING=n paging_mode_shadow() is compile-
time-constant false, the compiler can DCE the call site. Hence we can
avoid building the function itself altogether.

No functional change.

Fixes: 2fb2dee1ac62 ("x86/mm: pagetable_dying() is HVM-only")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -872,22 +872,18 @@ int paging_enable(struct domain *d, u32
 }
 #endif
 
-#ifdef CONFIG_HVM
+#if defined(CONFIG_HVM) && defined(CONFIG_SHADOW_PAGING)
 /* Called from the guest to indicate that a process is being torn down
  * and therefore its pagetables will soon be discarded */
 void pagetable_dying(paddr_t gpa)
 {
-#ifdef CONFIG_SHADOW_PAGING
     struct vcpu *curr = current;
 
     ASSERT(paging_mode_shadow(curr->domain));
 
     curr->arch.paging.mode->shadow.pagetable_dying(gpa);
-#else
-    BUG();
-#endif
 }
-#endif /* CONFIG_HVM */
+#endif /* HVM && SHADOW_PAGING */
 
 /* Print paging-assistance info to the console */
 void paging_dump_domain_info(struct domain *d)


