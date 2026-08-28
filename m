Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10EBEC61DB9
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 07:03:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401626.1637178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzqcf-0004Qn-FX; Fri, 28 Aug 2026 07:03:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401626.1637178; Fri, 28 Aug 2026 07:03:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzqcf-0004Qg-Cj; Fri, 28 Aug 2026 07:03:33 +0000
Received: by outflank-mailman (input) for mailman id 1401626;
 Fri, 28 Aug 2026 07:03:32 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wzqce-0004QO-0k
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 07:03:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzqcd-00BSfo-Dk
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 09:03:31 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9132bd-e002-0a2a0a5209dd-0a2a4508880e-16
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 09:03:31 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9132be-f659-0a2a45080019-d155dd35e805-3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 09:03:26 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-482e4998d28so416562f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 00:03:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b92679be5sm33489005e9.3.2026.08.28.00.03.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2026 00:03:25 -0700 (PDT)
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
        d=suse.com; s=google; t=1787900606; x=1788505406; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xgIaJ540DVn9gMAwDjHqVBhyS2+4Ub8sOGYDzk1OFhQ=;
        b=HLZF3tFGyAn4piaLpUP+9hkBHKaGqAwZCwSYzqi/Q93BFK63tkssEpYz4leYsm/KCF
         7C3CkHVEV/iYP6aw9OWs2gR6HTxT/k2R6tIV/KFwYKczAiy1K6rJsNg+Jv66/rG1IJpy
         VWmBiruVxCrimUb9ShvbSgcyzPiTheROUxh/s26OU+Dg6ebj4HdGq6F4uSMd61N4bbms
         JYcIfWUboBJqFjkg12wl3s0Qc9IYWbPnZz+ocfUd8z2zg6odGjTZJMyABBOAriPfWciH
         ZGMDX+lIXy+kCFfQJBH0zZKzkNLlxXVn1arLvAqRp5xrc04RTkLXdT1/Qk7JjuddYre0
         eUnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787900606; x=1788505406;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xgIaJ540DVn9gMAwDjHqVBhyS2+4Ub8sOGYDzk1OFhQ=;
        b=U6bNBpgDXfoVhx9U8s+NET4bI1HPwbVfek36PaMAn1IWfablO6xheHyubEwm5xWw2v
         09B1I87PL05c04KPlKq/DZfASaMwHoW9gVkqzqp5798Bvk9qaTV3frzvEwv0cULJgGEi
         VMwd+Ke+Y09b4jMPkMwTMVsKgj59RG7+Pe+d1K+Qwio9clB+iJnwcytC5K66VpdJRq9x
         CIC0HjIKq88eck2ZCRw4MXg3EC1PkMIprAyk0CvNAbQQ0Gcrj5jEyeyvIqKquAGwStDm
         l06//+fA6XylvjKwgk7DdnHt7fZCC0AZ3y0YdCkczbbmGSMSxZ/7LEt+LemDg3qs009M
         FcaQ==
X-Gm-Message-State: AFuF++mfvtEi6XJkWiqvOkHqQRpYxwDij/EZ4Qy4ocWZ2XpqSrCm1nCD
	eTq4jYKvNGAdeuRAbShCDobh+oMZLdT/pgw/ZK/imZCRwnsdBL2giIwHg9ty2jj0296x5J8zd6a
	Xg6Fajg==
X-Gm-Gg: AR+sD10OHhOMUeT+6ljKKtzhj6xD4zcO6v/EM4epidVi1SncI5hr38BvMUg7FSUMHdA
	9EFlmVagR4VHorRYLbkhGxHDGMVzj9ln33oWNL3K1KWuQ8i5/t9MSk++eB8Dh9I6mD6X7nK45Aq
	B+43hMiBC+o+XKkRNGUDNy697vMkaDsXBf6Y01ye96jCrXSWsQDqli96X9q9IPXq7VLsfeyKHwZ
	GWyWOfGjmAjDQNgv1CLj6rvOZ19YGTuy5YJFvQurVci8mKJ9Y1QJ0i0pUAnH1uglBlxuSvaW+pv
	h57Qo6eno40EF7+pAcMkp5eB6JFx8CITarKxEqnPnPWyz1OgW36FSm6uMOOl1c0e5P1+J38eSeS
	DT4j4aTJ4XYFK4ylR5s6HO0ehRevI1Xt8WDT+LyGolhrWxKRBqDyicsfjItpm9za85He0Q8DjKy
	Mvvg4ihe/BZ0EFtu0ROQ6ia0yHaQS6nhq6n5XybJlKCAlvk4kNwF9BYo3xCl1FNLwOdUlcHfVZc
	fwFWuw/bJfEvoW0jjqDh/CU8xuXLmAPgz0MIz3omw7spgv7oMLd
X-Received: by 2002:a05:600c:870c:b0:499:dc34:bdc with SMTP id 5b1f17b1804b1-49b91c1c401mr75871115e9.1.1787900606073;
        Fri, 28 Aug 2026 00:03:26 -0700 (PDT)
Message-ID: <6e98181c-459c-4c45-b8c0-c427e3c0bbc8@suse.com>
Date: Fri, 28 Aug 2026 09:03:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 07/12] altp2m: address Misra 2.1 rule violation
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
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
X-purgate-ID: tlsNG-c1860d/1787900606-D6D4087B-D3067CFC/0/0
X-purgate-type: clean
X-purgate-size: 937

The stub altp2m_vcpu_idx() is recognized as "noreturn" function lacking
respective annotation (or having a return statement), which hence is deemed
unreachable code by Misra / Eclair. All call sites are guarded by
altp2m_active() checks, hence an inline function isn't needed. A
declaration will suffice, with call sites then getting DCE-d.

No functional change.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/asm-generic/altp2m.h
+++ b/xen/include/asm-generic/altp2m.h
@@ -14,13 +14,8 @@ static inline bool altp2m_active(const s
     return false;
 }
 
-/* Alternate p2m VCPU */
-static inline unsigned int altp2m_vcpu_idx(const struct vcpu *v)
-{
-    /* Not implemented on GENERIC, should not be reached. */
-    BUG();
-    return 0;
-}
+/* Alternate p2m VCPU - placeholder on GENERIC */
+unsigned int altp2m_vcpu_idx(const struct vcpu *v);
 
 #endif /* __ASM_GENERIC_ALTP2M_H */
 


