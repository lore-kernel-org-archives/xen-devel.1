Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B37DC88E59
	for <xen-devel@archiver.kernel.org>; Sat, 12 Sep 2026 15:19:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1418811.1646518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5PVV-0000uQ-Ah; Sat, 12 Sep 2026 15:19:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1418811.1646518; Sat, 12 Sep 2026 15:19:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5PVV-0000uJ-7k; Sat, 12 Sep 2026 15:19:09 +0000
Received: by outflank-mailman (input) for mailman id 1418811;
 Sat, 12 Sep 2026 15:19:08 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1x5PVT-0000uD-Un
 for xen-devel@lists.xenproject.org; Sat, 12 Sep 2026 15:19:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x5PVT-008RIY-BZ
 for xen-devel@lists.xenproject.org; Sat, 12 Sep 2026 17:19:07 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6aa56d54-8faa-0a2a0a5109dd-0a2a45088ccc-6
 for <xen-devel@lists.xenproject.org>; Sat, 12 Sep 2026 17:19:07 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6aa56d6b-f659-0a2a45080019-a237832f9664-3
 for <xen-devel@lists.xenproject.org>; Sat, 12 Sep 2026 17:19:07 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 9B9354EE0097;
 Sat, 12 Sep 2026 17:19:06 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1789226347;
	b=iUrDSMC74cO5fN28iRhreFSW2d3E86DsXTCf5JA43hm67QfyTzb2xN50zWlTok7ZUJxm
	 mzDU10ToAtPlEUymCqsRUOlpT+c2iOhX6AS6hWMgmc3HO6AlGJSN8R1fZAEduTZ8qquTS
	 I7zhZCZS4oRoX+nF3TYBN4MsX5cYCzGkXGfduen1F4F2oUuFEYJHv4ExbJXToT2zbs5ud
	 m4v6b86O2eB2TKdibGxVN2L7BrQNfRbI2nLNq9BvOUhFELpVDeGntDQmd6GIyEGjTRHJQ
	 R0PJlbw32tcqOVAu82anIaBgt2GgckaOToIZ3snxxis2zph6qhwN5V7K5arYpbF3m11QC
	 ibyfFJL0Sm/sWCpebuNa8Jni7e6Q6tRKYoJS1L5mV7LwvBL/SbFuN4k9Ptw/M/7SFZHFi
	 jIyG1pANxcH08xOmBaYnKivqoCyBtlEvZFKboTm4hrSJQUe5UEn4WvLDggIeWJ7BdaVMd
	 6dAOQaukKelj6nC4ea3sOboBzfHxGWsfK2F9chKIeiwqCWJ1mMh/mFy6sxN2JR835dXL/
	 WiDqKCr6kTYYv9rkOv02BoySetjEZ6gu/8oEGYPymBworF1LVBE9QXSrJ6xu/SZFZ/UKA
	 bXCCAvNsLawZIStJCwb/fjTA4HC0v0uLb3EECKb5MIopfKbMhQasah3NhYoYN+M=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789226347;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=CI1LScU60Qem93FxM837FcjNQm4bgRcPvDdHg5ZULys=;
	b=Ls8RdDDvZwwWMItVsOS4BL/8Vav/3LCbLy5xeQHZ5klnqYNesa0mIrJPVT7TNQNeSb5l
	 YHqcyeJOgvy8888MnC+g7AORPPCQ72wQnuD8KiJANqGP2RbhJrg7Cdqch8AsbTNxSu5XO
	 qYSKvfPBtd3gkgwswUEUkAsZ9E7QJDcQXC6+pRvqW1A0FfdL1yNOf7fnI94vgLEwsyyno
	 MQ+ndDLcZZXHtOb9Ixgo3nNLMohgfYmCalcFjwT0CCkKa73PKWUBY8i/5itVSj5So5xsP
	 PEgKScOyHa15FQLiXRZCZknsRs+dR/lcILItL2W7dERruTR3fvNb8+Q0nFrqnAMgQmlnQ
	 pBdj7z/1FiDG3whU7GU9QuYkPkVNlxuCBpcXctVNdPi25OKS+RpQJaEk5Y3Gy3lUtek4T
	 N120oCFwYkiGAF8kzMcgAai7ShDKeW3uZ5GF4fg54zbYpzMdPQjOLFuNEnBcWC4zxRlTp
	 QWoK6iYZbBJ1DuNFdL6eJVB7EKnITdB37imZ+P2IcmGjf6rN6XndoQl3gECOHMPIVVlPw
	 phcXDoUMr9IZ3jsKhtXIHyYmXwG3iSEGW2PmrSz4YxiTitRraTb/SBDWbFFZLfO5pXrTZ
	 Wy1wPhnUjrlI3ZyKzOc6okO793wMWmSOOozPrcuY+CeaH7QmDnb9S4gV0l89Gks=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Sat, 12 Sep 2026 17:19:06 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Subject: Re: [PATCH 2/4] Eclair: relax long <-> function-pointer conversion
 deviation
In-Reply-To: <fca27ac3-95c9-4177-a9cd-673f07230889@suse.com>
References: <6d212d60-5c0b-4909-996d-5d6a4906b7e1@suse.com>
 <fca27ac3-95c9-4177-a9cd-673f07230889@suse.com>
Message-ID: <43e412de9e5165f33c572841bfc58dc9@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1789226347-D437587B-3E9E04CA/0/0
X-purgate-type: clean
X-purgate-size: 2931

On 2026-09-03 13:43, Jan Beulich wrote:
> What is true for unsigned long is also true for plain/signed long, thus
> also taking care of two instances of __x86_return_thunk() being cast to
> long.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Some nits below:

> 
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -368,17 +368,17 @@ constant expressions are required.\""
>  # Series 11
>  #
> 
> --doc_begin="The conversion from a function pointer to unsigned long or 
> (void *) does not lose any information, provided that the target type 
> has enough bits to store it."
> +-doc_begin="The conversion from a function pointer to [unsigned] long 
> or (void *) does not lose any information, provided that the target 
> type has enough bits to store it."
>  -config=MC3A2.R11.1,casts+={safe,
>    "from(type(canonical(__function_pointer_types)))
> -   &&to(type(canonical(builtin(unsigned 
> long)||pointer(builtin(void)))))
> +   &&to(type(canonical(builtin(long)||builtin(unsigned 
> long)||pointer(builtin(void)))))
>     &&relation(definitely_preserves_value)"
>  }

could be canonical(builtin(long||unsigned long))||pointer(builtin(void))

>  -doc_end
> 
> --doc_begin="Conversion from unsigned long or (void *) to a function 
> pointer can restore full information, provided that the source type has 
> enough bits to restore it."
> +-doc_begin="Conversion from [unsigned] long or (void *) to a function 
> pointer can restore full information, provided that the source type has 
> enough bits to restore it."
>  -config=MC3A2.R11.1,casts+={safe,
> -  "from(type(canonical(builtin(unsigned 
> long)||pointer(builtin(void)))))
> +  "from(type(canonical(builtin(long)||builtin(unsigned 
> long)||pointer(builtin(void)))))
>     &&to(type(canonical(__function_pointer_types)))
>     &&relation(definitely_preserves_value)"
>  }

Same as above

> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -432,8 +432,8 @@ maintainers if you want to suggest a cha
>       - All conversions to integer types are permitted if the 
> destination
>         type has enough bits to hold the entire value. Conversions to 
> bool
>         and void* are permitted. Conversions from 'void noreturn 
> (*)(...)'
> -       to 'void (*)(...)' are permitted. Conversions from unsigned 
> long or
> -       '(void *)' to a function pointer are permitted.
> +       to 'void (*)(...)' are permitted. Conversions from [unsigned] 
> long
> +       or '(void *)' to a function pointer are permitted.
>         Example::
> 
>             unsigned long func_addr = (unsigned long)&some_function;

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

