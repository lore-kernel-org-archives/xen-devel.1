Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F6EE81A3D
	for <xen-devel@archiver.kernel.org>; Mon, 16 Feb 2026 15:52:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1234314.1537607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs0tF-00052Q-LL; Mon, 16 Feb 2026 15:52:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234314.1537607; Mon, 16 Feb 2026 15:52:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs0tF-00052J-Ii; Mon, 16 Feb 2026 15:52:01 +0000
Received: by outflank-mailman (input) for mailman id 1234314;
 Mon, 16 Feb 2026 15:52:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFbs=AU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vs0tE-00052B-CI
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 15:52:00 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 691d7379-0b4f-11f1-b163-2bf370ae4941;
 Mon, 16 Feb 2026 16:51:52 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso49922645e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 07:51:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48371a21cbesm131157855e9.5.2026.02.16.07.51.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 07:51:51 -0800 (PST)
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
X-Inumbo-ID: 691d7379-0b4f-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771257111; x=1771861911; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sf0ltGRVLvfI7yHqoX7gifHUKoRDWrHBbWORd5IiUys=;
        b=Lu7A327EyXYwF+/FkqA/5ETWn0EGTiiUaeHEZQQIj/i1l+XnaB5AOXqx0KE07ASDGL
         00a+QiqZAedpegb5fgdcnjhkz7ysSCw8dzEytrKOXSxcxrbb6kc4WTk2E8BTpL8AXNXn
         r0Loz0IyBzfAZNaB3kqgwLUU0eZ/Ebq7+HI9pQGy4FxsYpG+8MWTPWEZFz5AbCF5VOX1
         pm4ReDhfvS40j/B4nbS2MXdtDbgtUkDLs7oBpPVYU4GxsF+G699+tXy7j0THdEcieWHa
         julSzawNd4n9dxK9TEx83Uh+iInmhjLMDLb0jiDFvRASgB+ATePcmxjQee25iC+f/ZGn
         5S7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771257111; x=1771861911;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sf0ltGRVLvfI7yHqoX7gifHUKoRDWrHBbWORd5IiUys=;
        b=CtUCNdurceKnrq+4EUQypHmhgfB9yTnKhGhIxv9kI3Y+lX9J3UoT3UJyK0Yiw+TVbX
         KcCTI0CAum/5SHeRtxTInC09OqsAaAOB6ulgu8xyNDW4ecSHN+VlM47t6zTGrdXFoJTd
         2tSV/2Xqhcwp2gkD5wvvQOIjhkoBl3fwp7gHJm1ayWGHU0vkQZRnzP1xR8JhsFLEKA2A
         P4+SAUmfJgu6fIAXvDX7KttAYC8NYkLcS+cqzd3pJFUVv+z3JE9bRSE0aeYzIIvbBYv4
         QCRrrmAjxssQ+7/JO3/X42NkV29z3B3A5S1Aclr0vr1qPuPdsRIJZ4eXAg/OpBsluHqc
         i4tQ==
X-Gm-Message-State: AOJu0YyGg4ETj1+g4N7mhzU6lnz0hVH7BGjUnYqHqNv16wFyPxV5/Da4
	leWdtrsDtIzijLVUywzYDhIHs6Ma+OZl5kHN1ByyYDeIr4oGhX9Kdvd9YWWGbSW1U0KOnqdoEwO
	7fVE=
X-Gm-Gg: AZuq6aL+HSDGC4eokPj7Ds6CBa7AMLxKoueFd7g3QdAKYpyn3svHImncg7DRzrlEpkJ
	ystUdtX/0XUTpVqzWP97sA2Eh56xjQY7UgmxhX+IBpdM3Li86hhG0VkRb7OkX191FP8An5dfHpa
	IJEOPHUS50B0ZQ8QLaMzaDhUUQttTJ5ZlifbuhuXdZ4DUgd+mQ+32ajJ5F/SKGyQNQMmiCPS2iK
	JF/z+w2AJ0cpKba7OUad1Q465ecI2DYZCOAU6+0sZId0P+0LHr9jTtsft1KyKc0s80dVMRmH5KR
	hCxpzVUrw4FtZ8uMkZiytsjxaV7WkOcF/Y6USamGfYiW+uMvuQH3Skl6lEd/R4VCHGnPfuQvq+z
	O0It0i4etneyGQ/X2HDxO0G/0YjA4EGgGeq9iZya4EFXGVNTTsWCO5ko2Fxx5DRPU9hgaRnHB94
	MpflMjjCgbL1GdKIk48o999zOY/yGRnGaMk9cCRZtXA3ogZmswrl7cnR6kM9LlzcSPd4HVeDPIm
	8rLB88XsjRkYtA=
X-Received: by 2002:a05:600c:4f8f:b0:47d:333d:99c with SMTP id 5b1f17b1804b1-48378db0cd3mr149471145e9.18.1771257111281;
        Mon, 16 Feb 2026 07:51:51 -0800 (PST)
Message-ID: <528578e1-6374-4fd0-9f67-0769afd2e1c6@suse.com>
Date: Mon, 16 Feb 2026 16:51:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] domain: move vmtrace_alloc_buffer() invocation in
 vcpu_create()
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

The label used upon the function failing is wrong. Instead of correcting
the label, move the invocation up a little, to also avoid it altogether
for the idle domain (where ->vmtrace_size would be zero, and hence the
function would bail right away anyway).

Fixes: 217dd79ee292 ("xen/domain: Add vmtrace_size domain creation parameter")
Reported-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -493,14 +493,14 @@ struct vcpu *vcpu_create(struct domain *
         set_bit(_VPF_down, &v->pause_flags);
         vcpu_info_reset(v);
         init_waitqueue_vcpu(v);
+
+        if ( vmtrace_alloc_buffer(v) != 0 )
+            goto fail_wq;
     }
 
     if ( sched_init_vcpu(v) != 0 )
         goto fail_wq;
 
-    if ( vmtrace_alloc_buffer(v) != 0 )
-        goto fail_wq;
-
     if ( arch_vcpu_create(v) != 0 )
         goto fail_sched;
 

