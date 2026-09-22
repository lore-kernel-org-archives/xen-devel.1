Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BC1C982F1
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 09:57:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428447.1651275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8xF1-0003IM-4R; Tue, 22 Sep 2026 09:56:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428447.1651275; Tue, 22 Sep 2026 09:56:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8xF1-0003IE-1E; Tue, 22 Sep 2026 09:56:47 +0000
Received: by outflank-mailman (input) for mailman id 1428447;
 Tue, 22 Sep 2026 09:56:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x8xEz-0003I1-4T
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 09:56:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8xEx-005Ec8-Px
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 11:56:43 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab250db-8faa-0a2a0a5109dd-0a2a4506b934-2
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 11:56:43 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab250db-195a-0a2a45060019-4a7de14cbb0b-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 11:56:43 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-4843f22dc83so2833160f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 02:56:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48862774543sm4224894f8f.11.2026.09.22.02.56.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 02:56:42 -0700 (PDT)
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
        d=suse.com; s=google; t=1790071003; x=1790675803; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TROsMyFOjYUy/gyXB882VmN50PjnTVwwmj/TjE1k1Os=;
        b=bXSJV6LafcX/jcJ/tCwyAfyA/EL6s3K3F/EZ6qXC+HnnN1o4Gqa/tvNAvKdwiWVKfc
         sKThEu4FMKCjBH0/RWVdrzgfyVUOgRjGAo0SnjIHQjIZCwbqeTy8bNWGUfcBiI5loxUQ
         IuhSkioG3jUGxFBK69U46ATEd7DSb33n2E3G7dnmcAPQ0FBgx1Sz+jVG8Qg1Xf60LLgH
         eAccI6Mf1YnHBivGPYnGw7WUUUzEe33QiarkPjB/DIhahLj9MUxrMHITYjL050yY3fcA
         HtQXAmcQt0Gv58xDRWxRI1DxBTHCqX0Tkhmw2Gc/z8oL2E24O0/v6BaO0KC3nee25JQw
         wmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790071003; x=1790675803;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TROsMyFOjYUy/gyXB882VmN50PjnTVwwmj/TjE1k1Os=;
        b=u4gy8VdNvlMJVFiLx22Zp5e1SeOl0OVlIl/8BFUFeD9Fpko4WNt1kFlTztYS9wzyRU
         J2tyExPiQAeiV5QBmhU+uvq13ymzpZV+gTV68oQkcsVgJBukuntIsfkPwef1jESQcJic
         LhOc4gxJAVLaEqX7SDVIV5Pu3e13uvzJfSUlR4+p3Ysek+781DP0SGuCGZN2tiCdoiGU
         O9kPOSSH26kBynYAR5tEc4emj2O0eQnK2zN6vWhgJB7kANomyDTwGbkIJvpyDBnJQRMU
         hOmkk7e4kyaD6WW0jv2bptceXx57GSiKk/RwL6/QzNo2Q0MW75qPDnfKrWR7pbeMg4We
         VDOA==
X-Gm-Message-State: AFuF++lCLTs+YnA1Xonc9NJkgvpDtdudSMMMgChzq9uOZVpYz4o0jEMa
	nmGa26pYtjJDg+0WiD6oG1p29h+x5j6c5/jaAlR7g1b0NlEBBARV0koAPlQIllxX+O70pB3STFr
	Iriv5fA==
X-Gm-Gg: AYBFou0WZA9Q+auJt2uIwsSi8Oqf/8hTZ/yqndquWqzdMj1WNhQ4j+RA68VyjHKlrNk
	4uJsY5x/FcaLTyzkJNgurBpJO8WrWonBgV13Y6j6Ztkd100uaBWjNXjPfwjdhmSmNT3jvP+ues9
	VZp24vT4OJOh8lw1s43fqhHIjOeXAdwXtd/42hKVXZkda5udBoDDPEyU3hfifTGBVBl2S1lwGEw
	vXeqgZx+bb0AbiyHq2g5dVBcCHalsEZHSlkwLVmDUeyz20hCD1wUt0mulDQWB8wolQswNlDD7Mn
	FEq9OxUVUOGXQBBPpv3+dtPUNXG/6CxxAZZm8tVkl4P1jcPGuDMYsQ1GEKt+2Cjy/QqeIy78dUo
	K57RwTnKCVLX4oszFqHawtcvbw5/fc4G+tJfpcKkG1jjL+xtmGuYh4qDkfnPpJpKpOjw8jlc37r
	iHmDQr2F7PVzsgEUDdPGLgi+qmqbx/HQ1HATQwjZwjxuwrv0D4ucihmmJ463OirI25SU9VLLEU0
	BjVODP7rDQX5DSMBsN7E2SDjgat3AY8PYkDfZcFmwsEkIPb+/R9aN5BBrq/Pg==
X-Received: by 2002:a05:6000:4b14:b0:487:f18:9a3e with SMTP id ffacd0b85a97d-4871e3aa52fmr18678967f8f.43.1790071002602;
        Tue, 22 Sep 2026 02:56:42 -0700 (PDT)
Message-ID: <8b679f4c-17e6-49ef-8a7d-390e10452904@suse.com>
Date: Tue, 22 Sep 2026 11:56:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] Arm: split xen-syms linking rule
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <153fd1b8-810a-4091-84d5-5395d83f2ee9@suse.com>
 <ddb77049-3a85-42b0-aa96-ee9a8ce500de@suse.com>
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
In-Reply-To: <ddb77049-3a85-42b0-aa96-ee9a8ce500de@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1790071003-F7ECC77B-CA4F5B5C/0/0
X-purgate-type: clean
X-purgate-size: 1598

On 08.09.2026 14:28, Jan Beulich wrote:
> Doing so, besides (hopefully) adding clarity (not the least by way of
> [re-]using pattern rules where possible), also avoids explicit recursive
> $(MAKE) invocations.
> 
> By re-using the generic rules introduced when the respective x86 rule was
> split,
> - the .map file now isn't created after the final binary anymore,
> - --strip-debug is passed to $(LD) during early linking passes (for
>   consistency the option is also explicitly added to the optional linking
>   pass rule),
> - CONFIG_{SUPPRESS_DUPLICATE_SYMBOL_WARNINGS,ENFORCE_UNIQUE_SYMBOLS} are
>   now properly respected.
> Orphan section checking, otoh, is getting suppressed for now, until the
> about a dozen warnings which would result have been taken care of.

Similarly, for randconfig, I had to suppress ENFORCE_UNIQUE_SYMBOLS=y for
the time being, with the incremental patch below. I'm about to submit a
patch to undo that (by first fixing the collisions).

As per
https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2870284545
the issues were:

Arm64:
Duplicate symbol 'head.o#fail' (a0000200544 != a0000200178)

Arm32:
Duplicate symbol 'head.o#fail' (200178 != 200650)

Jan

--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -91,6 +91,9 @@ include scripts/Makefile.link
 # Suppress orphan section checking for the time being.
 orphan-handling-y :=
 
+# Downgrade duplicate symbol errors to warnings for the time being.
+syms-warn-dup-$(CONFIG_ENFORCE_UNIQUE_SYMBOLS) := --warn-dup
+
 .PHONY: include
 include:
 


