Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BC7606A31D
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 10:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cEsy794N
Received: from list by lists.xenproject.org with outflank-mailman.1463036.1674013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM0mf-0007VC-LG; Wed, 28 Oct 2026 10:21:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463036.1674013; Wed, 28 Oct 2026 10:21:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM0mf-0007V5-Ii; Wed, 28 Oct 2026 10:21:29 +0000
Received: by outflank-mailman (input) for mailman id 1463036;
 Wed, 28 Oct 2026 10:21:28 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xM0md-0007Uz-Sq
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 10:21:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xM0mc-00DH77-U1
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 11:21:26 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae1cc9c-2eae-0a2a0a5409dd-0a2a450ada42-40
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 11:21:26 +0100
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae1cca6-f2d2-0a2a450a0019-d155dd2af1da-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 11:21:26 +0100
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-48c4649b35bso670957f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 03:21:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebd48fasm27389762f8f.31.2026.10.28.03.21.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 03:21:25 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793182886; x=1793787686; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tyc0V9SqxKacP2ySrL85ZyvPr6HLsaDHIgje4Lsqn2U=;
        b=cEsy794NfOrES9nXILqbPNgInE6Q3J8SgKs3w4J8Smkz2YJmaVCt7XCK+AwtukmUXi
         yXUbFfkxip3lWj7amB/DGHI1qPXacBkbwU5d43DqKaOZoIi41w2j4g6Kr3nSzPNOgBG+
         fTRvQXfxJv3Mx8F3dM4897i0pgzRGikKadGqUu8/dzk0bPQSrumlQGqGVO5KSrztIaOy
         IzCT7IGIJgikxrM3+WsrIfl2F8+pdh03xS5/JA3OccItjLcJ/XmtSg292cqm4GJAx+/R
         ZnZEP9EWi3je7tOSZo2fhQYDMnxJjZGhcWpnJ7UR9XgWACo+yRv5kSRENAJpaI0C70De
         2Ogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793182886; x=1793787686;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tyc0V9SqxKacP2ySrL85ZyvPr6HLsaDHIgje4Lsqn2U=;
        b=uYnFjXeLCdS+RWqx+Gq+QETbadTGxd0JEGohFSebYx75UWBsisQND8zXMl7upyh2nT
         BEREh2x7jgvx/v+iY0t8mhjaRJs1CVkbqAO5zqEkmRbPGA+WjWsmORXf6rfW2ZQOE6mJ
         jcxLiesMOyYLvIIz7xCJKclhJ6NS9fuZO/RFHhpYglgEhb1LzzBRWY69oBqVHfwuTojD
         buCojCvhuxZkSomVcKCLmCPBC9rPl5baf5N/ubeRPv9B9AL2zb1kDwh0EvuN3LdZs7h+
         hEwHsqvCFtAvL/+j6gdZllm9oPkWNEE+fIqOb8qNGh4sxjn1xIb9GUKEEKFSlt8x0YGe
         8sxA==
X-Forwarded-Encrypted: i=1; AKwUvBwLoqEj5T49E9w8HNzuThnVGwkr+B8FgXOpUHibns6qTP0LNNXk0nNbyw+xERzfh6Lrb8drc8mF/Ew=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLAkjZItapq+7+DE2CZq9wm8Dx14K/pvkdl2xXeHeVowpwP2YFJ
	J+fmefT1Hov/IjA9YcKhNm7Y/aQoye7Xu/X7GTyIPiFXSKIxvuCg6iJT+COzSgYG5A==
X-Gm-Gg: AYBFou1eNvWgrxB+hNTucsUGmIdnyOH8YjK7GGSdsjmVAxp08GQERIvn85wF4ur+CDi
	9flYV+WE7MFpqYz2c1tp/S817j8FB20iTZemRm3HgKld+o28+qYpkf3IA99pufz5DHcGT71gOqG
	f+KHjxYbBnl06ICQ80sYTToqPTSdHx7pBfBbydnQJDTPxsq7HDuaTCaZgONUGSjWX4H3jw97jby
	h+71Xlc8E8qZCideke85A/X+SwImr56nlLHBC+3u2P+v7VLF0qIEatiYF49iCZGOBVjdi0soS+F
	eSYb48NxrX8kOP9PWpvq6WgEi5mKFy4lm0SGLlsuNFRmNl5/SBP6RqmVE7UM/TVkzhUpNPYd9ML
	tXSNYlLo2TXR1q+/sit+2f1NwU8TNd3oCOF5czY0MK+RVv1aS5cG7vpqYphf5o/VbJaVQYH+v36
	fP295ngEW+eTYOWxp9Ar9wlErVIFT+qYUW+4jVCSgVaj8+CKIxoZRsXSQKavL9h6RG1weujhzZS
	OzVsH5RymIjRQjrPYeg5uU7Zoou3xVyJ7fzYbyhqE+z8Q9XUWIpl0Ife8o9bgfYQ6UMc/2oDIp1
	WzZGki292nutZM0laZyug+2dNxuYlobhEOfcQNckPP6t6m1XZaFdZ1GuXHWdk/HMwGh8bPiw0wk
	K+a2UVHPhWa9xAO0CXg==
X-Received: by 2002:a05:6000:2892:b0:486:e707:42eb with SMTP id ffacd0b85a97d-48e5d468078mr4877423f8f.33.1793182886145;
        Wed, 28 Oct 2026 03:21:26 -0700 (PDT)
Message-ID: <d8398805-fc62-4e22-a970-514e1ff8f5f6@suse.com>
Date: Wed, 28 Oct 2026 11:21:25 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] tests/x86: Introduce a userspace test harness for
 x86_decode_lite()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261015210530.786604-1-andrew.cooper3@citrix.com>
 <20261015210530.786604-3-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <20261015210530.786604-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1793182886-506CECFC-97AC7EC0/10/78276251493
X-purgate-type: spam
X-purgate-size: 8232
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 15.10.2026 23:05, Andrew Cooper wrote:
> All the interesting behaviour is in insns.S.
> 
> There are 4 interesting cases; "not an instruction we tolerate", and one we do
> tolerate, split by no relation, disp8 or disp32.  The DECL()/END() macros

DYM "relocation" here?

> --- /dev/null
> +++ b/tools/tests/x86-decode-lite/Makefile
> @@ -0,0 +1,56 @@
> +XEN_ROOT = $(CURDIR)/../../..
> +include $(XEN_ROOT)/tools/Rules.mk
> +
> +TARGET :=
> +
> +# Clang IAS doesn't like the convenience macros we use
> +$(call cc-option-add,CFLAGS,CC,-no-integrated-as)
> +
> +# Binutils around 2.30 have mutually exclusive expectations of instruction
> +# suffix validities compared to later versions.  Among the distro we test,
> +# this only excludes Ubuntu 18.04.

This is liable to go stale; 18.04's lifetime can't be all that much anymore.
I'd suggest to keep just the first sentence.

> --- /dev/null
> +++ b/tools/tests/x86-decode-lite/insns.S
> @@ -0,0 +1,711 @@
> [...]
> +sib:
> +        /* Mod=0, Reg=0, RM=4, SIB S=3, I=0, B {0..f} */
> +        _ add %al, (%rax, %rax, 8)
> +        _ add %al, (%rcx, %rax, 8)
> +        _ add %al, (%rdx, %rax, 8)
> +        _ add %al, (%rbx, %rax, 8)
> +        _ add %al, (%rsp, %rax, 8)
> +        _ add %al, (    , %rax, 8) /* "none", %rbp encoded with mod=1/2 */
> +        _ add %al, (%rsi, %rax, 8)
> +        _ add %al, (%rdi, %rax, 8)
> +        _ add %al, (%r8,  %rax, 8)
> +        _ add %al, (%r9,  %rax, 8)
> +        _ add %al, (%r10, %rax, 8)
> +        _ add %al, (%r11, %rax, 8)
> +        _ add %al, (%r12, %rax, 8)
> +        _ rex.b add %al,(,%rax, 8) /* "none", %r13 encoded with mod=1/2 */
> +        _ add %al, (%r14, %rax, 8)
> +        _ add %al, (%r15, %rax, 8)
> +
> +        /* Mod=1, Reg=0, RM=4, SIB S=3, I=0, B {0..f} */
> +        _ add %al, 0x01(%rax, %rax, 8)
> +        _ add %al, 0x01(%rcx, %rax, 8)
> +        _ add %al, 0x01(%rdx, %rax, 8)
> +        _ add %al, 0x01(%rbx, %rax, 8)
> +        _ add %al, 0x01(%rsp, %rax, 8)
> +        _ add %al, 0x01(%rbp, %rax, 8)
> +        _ add %al, 0x01(%rsi, %rax, 8)
> +        _ add %al, 0x01(%rdi, %rax, 8)
> +        _ add %al, 0x01(%r8,  %rax, 8)
> +        _ add %al, 0x01(%r9,  %rax, 8)
> +        _ add %al, 0x01(%r10, %rax, 8)
> +        _ add %al, 0x01(%r11, %rax, 8)
> +        _ add %al, 0x01(%r12, %rax, 8)
> +        _ add %al, 0x01(%r13, %rax, 8)
> +        _ add %al, 0x01(%r14, %rax, 8)
> +        _ add %al, 0x01(%r15, %rax, 8)
> +
> +        /* Mod=2, Reg=0, RM=4, SIB S=3, I=0, B {0..f} */
> +        _ add %al, 0x7f000001(%rax, %rax, 8)
> +        _ add %al, 0x7f000001(%rcx, %rax, 8)
> +        _ add %al, 0x7f000001(%rdx, %rax, 8)
> +        _ add %al, 0x7f000001(%rbx, %rax, 8)
> +        _ add %al, 0x7f000001(%rsp, %rax, 8)
> +        _ add %al, 0x7f000001(%rbp, %rax, 8)
> +        _ add %al, 0x7f000001(%rsi, %rax, 8)
> +        _ add %al, 0x7f000001(%rdi, %rax, 8)
> +        _ add %al, 0x7f000001(%r8,  %rax, 8)
> +        _ add %al, 0x7f000001(%r9,  %rax, 8)
> +        _ add %al, 0x7f000001(%r10, %rax, 8)
> +        _ add %al, 0x7f000001(%r11, %rax, 8)
> +        _ add %al, 0x7f000001(%r12, %rax, 8)
> +        _ add %al, 0x7f000001(%r13, %rax, 8)
> +        _ add %al, 0x7f000001(%r14, %rax, 8)
> +        _ add %al, 0x7f000001(%r15, %rax, 8)
> +
> +        /* Mod=0, Reg=0, RM=4, SIB S=3, I=4, B {0..f} */
> +        _ add %al, (%rax, %riz, 8)
> +        _ add %al, (%rcx, %riz, 8)
> +        _ add %al, (%rdx, %riz, 8)
> +        _ add %al, (%rbx, %riz, 8)
> +        _ add %al, (%rsp, %riz, 8)
> +        _ add %al, (    , %riz, 8) /* %rbp encoded with mod=1/2 */
> +        _ add %al, (%rsi, %riz, 8)
> +        _ add %al, (%rdi, %riz, 8)
> +        _ add %al, (%r8,  %riz, 8)
> +        _ add %al, (%r9,  %riz, 8)
> +        _ add %al, (%r10, %riz, 8)
> +        _ add %al, (%r11, %riz, 8)
> +        _ add %al, (%r12, %riz, 8)
> +        _ rex.b add %al,(,%riz, 8) /* %r13 encoded with mod=1/2 */
> +        _ add %al, (%r14, %riz, 8)
> +        _ add %al, (%r15, %riz, 8)
> +
> +        /* Mod=1, Reg=0, RM=4, SIB S=3, I=4, B {0..f} */
> +        _ add %al, 0x01(%rax, %riz, 8)
> +        _ add %al, 0x01(%rcx, %riz, 8)
> +        _ add %al, 0x01(%rdx, %riz, 8)
> +        _ add %al, 0x01(%rbx, %riz, 8)
> +        _ add %al, 0x01(%rsp, %riz, 8)
> +        _ add %al, 0x01(%rbp, %riz, 8)
> +        _ add %al, 0x01(%rsi, %riz, 8)
> +        _ add %al, 0x01(%rdi, %riz, 8)
> +        _ add %al, 0x01(%r8,  %riz, 8)
> +        _ add %al, 0x01(%r9,  %riz, 8)
> +        _ add %al, 0x01(%r10, %riz, 8)
> +        _ add %al, 0x01(%r11, %riz, 8)
> +        _ add %al, 0x01(%r12, %riz, 8)
> +        _ add %al, 0x01(%r13, %riz, 8)
> +        _ add %al, 0x01(%r14, %riz, 8)
> +        _ add %al, 0x01(%r15, %riz, 8)
> +
> +        /* Mod=2, Reg=0, RM=4, SIB S=3, I=4, B {0..f} */
> +        _ add %al, 0x7f000001(%rax, %riz, 8)
> +        _ add %al, 0x7f000001(%rcx, %riz, 8)
> +        _ add %al, 0x7f000001(%rdx, %riz, 8)
> +        _ add %al, 0x7f000001(%rbx, %riz, 8)
> +        _ add %al, 0x7f000001(%rsp, %riz, 8)
> +        _ add %al, 0x7f000001(%rbp, %riz, 8)
> +        _ add %al, 0x7f000001(%rsi, %riz, 8)
> +        _ add %al, 0x7f000001(%rdi, %riz, 8)
> +        _ add %al, 0x7f000001(%r8,  %riz, 8)
> +        _ add %al, 0x7f000001(%r9,  %riz, 8)
> +        _ add %al, 0x7f000001(%r10, %riz, 8)
> +        _ add %al, 0x7f000001(%r11, %riz, 8)
> +        _ add %al, 0x7f000001(%r12, %riz, 8)
> +        _ add %al, 0x7f000001(%r13, %riz, 8)
> +        _ add %al, 0x7f000001(%r14, %riz, 8)
> +        _ add %al, 0x7f000001(%r15, %riz, 8)
> +
> +
> +.macro alu_ops op

Nit: Can we avoid double blank lines, please?

> +onebyte_row_6x:
> +        /*pusha,popa,bound --> not supported */
> +        _ movsxd (%rax), %eax
> +        _ movslq (%rax), %rax

What about the (odd) 16-bit form? Decoding wise it's identical between AMD
and Intel.

> +        _ fs nop
> +        _ gs nop
> +        _ data16 nop
> +        /* addr32 --> not supported */
> +        _ pushq $0x7f000001
> +        _ pushw $0x7f01
> +        _ rex.w pushq $0x7f000001

Maybe also

        _ data16 rex.w pushq $0x7f000001

?

> +        _ imul $0x7f01, %ax, %ax
> +        _ imul $0x7f000001, %eax, %eax
> +        _ imul $0x7f000001, %rax, %rax
> +        _ pushq $0
> +        _ pushw $0
> +        _ rex.w pushq $0

Same here then.

> +onebyte_row_Fx:
> +        _ lock addb $0, (%rax)
> +        n "icebp" .byte 0xf1
> +        _ repne nop
> +        _ repe nop
> +        _ hlt
> +        _ cmc
> +        _ test $0, %cl /* Grp3, /0 has extra Imm{8,} */
> +        _ not %cl
> +        _ test $0x7f01, %cx
> +        _ not %cx
> +        _ test $0x7f000001, %ecx
> +        _ not %ecx
> +        _ test $0x7f000001, %rcx
> +        _ not %rcx
> +        _ clc
> +        _ stc
> +        _ cli
> +        _ sti
> +        _ cld
> +        _ std
> +        _ inc %cl /* Grp4 */
> +        _ dec %cl
> +        _ inc %ecx /* Grp5 */
> +        _ dec %ecx

Any reason you use register operands up to here, but then ...

> +        _ call *(%rax)

... a memory one here and ...

> +        _ lcall *(%rax)
> +        _ jmp *(%rax)

... here?

> +        _ ljmp *(%rax)
> +        _ push (%rax)

(I realize the assembler can't easily be told to encode this with a ModR/M
byte when used with a register operand.)

Again preferably with the above addressed (but explicitly also with some / all
left as is, except perhaps the double blank line one):
Acked-by: Jan Beulich <jbeulich@suse.com>

> +twobyte_row_2x:
> +        _ mov %cr0, %rax
> +        _ mov %dr0, %rax
> +        _ mov %rax, %cr0
> +        _ mov %rax, %dr0

I guess as we don't mean to use odd encodings of these (ModR/M.mod != 3),
there's no value in trying to test (and support) such.

> +twobyte_row_4x:
> +        _ cmovo (%rax), %eax
> +        _ cmovg (%rax), %eax
> +
> +/* twobyte_row_8x: --> Jcc disp32 */

Hmm, noticing only here: You do not foresee a need to support VMREAD/VMWRITE?

Jan

