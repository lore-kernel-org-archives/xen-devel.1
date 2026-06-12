Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCB5CD98CE
	for <xen-devel@archiver.kernel.org>; Fri, 12 Jun 2026 10:43:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1336598.1598430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXzLj-0003ex-8r; Fri, 12 Jun 2026 10:42:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336598.1598430; Fri, 12 Jun 2026 10:42:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXzLj-0003eq-6M; Fri, 12 Jun 2026 10:42:55 +0000
Received: by outflank-mailman (input) for mailman id 1336598;
 Fri, 12 Jun 2026 10:42:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wXzLi-0003ek-ED
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 10:42:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXzLh-005ERF-5c
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 12:42:53 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a2be2a5-2eae-0a2a0a5409dd-0a2a45019916-26
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:42:53 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a2be2ac-c1f2-0a2a45010019-d1558033e87c-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:42:53 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-490c0c92cffso5329215e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 03:42:53 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ea7c0960sm50754075e9.3.2026.06.12.03.42.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jun 2026 03:42:51 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781260972; x=1781865772; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4vboWpWqeVau85TStrcyd91/xUZBn9uHrUQYRfatDuk=;
        b=c/WPcNCP7q5ae40pri8YxFS10IV76gUUS5s+O7bVBo8qOBZXFu4KWnUvpq1jjqFdSB
         nwiBIPWQvxZ+TxK2s5o2cGsPtwba8lUNY74s9b96qYyBNvxFwspoQzZ3f7gO1/qWJgjL
         IeeV3OMe6Kz68llGMpwFv2hB4n+gBq10N941S9to3xD6L99jk6Ja0NxNGJmldeEB4qsc
         WDMGHxmvQGrM0Gk8TXooR0cVF6UD7m1YwG+P6ekpxeUe+d/yQbwxGa6v0TeFRCwu6Aak
         nHqK3J6JKGx6CwpjdtfmMFTkZz0njIMm4luYuh3pzRqITskBvDZuD7y40HmkUNfOsyqJ
         +XWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781260972; x=1781865772;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4vboWpWqeVau85TStrcyd91/xUZBn9uHrUQYRfatDuk=;
        b=X3fCLB7uMn+cuL94cpch53ekz7FrBZRWCrf+57FH7LW9O0XitsDg1HKS96EHB6QHyV
         xp7SiaGlkRj/KFXRxWAFZ9c618LLjM8huABaUTNfUY0LuoQ07CC7lkrf5gJoFoaapoEf
         yPex3ahnOackbgUZIpZ3N4cUjJIzpti2Y/hYb9C87ohLuG5FH7CRBWd09wL0pmQyX764
         hDHVqBWoeCMLAH7LSsLLJLjcpw5DeLATqknp3M3mN231XeUSrn1z0MG/QVaFob0Whoks
         Lb2eWm1JaouP4fc/dkpU28pLG4iSCN2TCsBqFUIKSP0joCw0hF0yhEVanG7JxXd283jG
         84cg==
X-Forwarded-Encrypted: i=1; AFNElJ8mAsWjcWKHlUpnixn1+Zqnoi1BSzssCX8n/gzLtA5zQGsfd0oxVoWavt0AuXJNoblj2p7DqznsTlA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzmIoxjX763cDxPrTLESEwxcfGx9TbGVh4kdVQQToal2y+3dx5g
	lKncFcwtmSvwk1dAweGLAyvrqcVTajjHncLeZPHZK8T3X60hM1kJ/rGe
X-Gm-Gg: Acq92OFiuR2VoNOF3zB4O15mNb/TBcJPvrgeW74Fbc5/Mwlg8TCDouNnXxmklTU3fPL
	qPnmooLviBaP/JsfiP2z12g05y0TcvdqztBDR/D4Gwd3uNJ+j48gqmSUzGNq26JIrYPiRA7hTig
	g0cvjbImqWmh+xPEKChYRhVzG9OZV4DxidAm1jXmsRKc8Yaep6RUrDLWub+7Imlz5f1F8W1cKbc
	l0m4H1SQRcRB/loO82qCzWLzF13tTXcxXjkYwTdcfr8kTmWkghLY2oQgw/OsbipRtUd39ZsloCF
	qQOikyvNzBwiI+ENCJZCH+5efmcPOPpj67gzjYR7JhVjE337Z516a3FA+brSMd/p8FUUm6L+uOb
	v+veOqYiBj9dlfg3B70GNlA5KTTE++WN/4h2cp9Oh2Z/Wynj201ckqB0tUD75aFbzklBwn2GF+M
	1YLVk40A+Onc2gchpBooYQLvZWM0ZA+Xdj3MlkFXVpgY6uAzNyW5KFykso2+B9D39sAjNRgQErx
	Y3eoA==
X-Received: by 2002:a7b:cb87:0:b0:491:a220:6e48 with SMTP id 5b1f17b1804b1-491a2206e91mr8314515e9.32.1781260972327;
        Fri, 12 Jun 2026 03:42:52 -0700 (PDT)
Message-ID: <84915e98-f17c-46d8-891d-2b963e9f2bd6@gmail.com>
Date: Fri, 12 Jun 2026 12:42:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.23] xen/kexec: Drop the obsolete v1 hypercall
 implementation
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Kevin Lampis <kevin.lampis@citrix.com>
References: <20260612102727.3121098-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260612102727.3121098-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1781260973-AFF50FF4-31134F69/10/73395122804
X-purgate-type: spam
X-purgate-size: 2934



On 6/12/26 12:27 PM, Andrew Cooper wrote:
> The v1 interface was declared obsolete in Xen 4.4 (2013) when kexec in Xen was
> overhauled.
> 
> The only known user of the v1 interface was the classic-xen fork of Linux.
> Linux PVOps does not interact with Xen kexec directly, delegating it entirely
> to userspace (i.e. kexec-tools).  Xen support in kexec-tools was part of this
> work, and uses the "new" interface.
> 
> As such, there's no way to test changes to the interface any more.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Kevin Lampis <kevin.lampis@citrix.com>
> 
> For 4.23, but I'd like to get this into my for-next branch nowish so other
> work can be rebased over it.
> 
> This patch will need rebasing over release activities in CHANGELOG.md but
> that's easy to do.
> 
> Bloat-o-meter reports:
>    add/remove: 1/3 grow/shrink: 0/4 up/down: 152/-1431 (-1279)
>    Function                                     old     new   delta
>    kexec_swap_images                              -     152    +152
>    symbols_sorted_offsets                     69592   69576     -16
>    symbols_offsets                            53668   53652     -16
>    symbols_names                             135309  135272     -37
>    do_kexec_op_internal                        2038    1994     -44
>    kexec_do_unload.isra                         170       -    -170
>    kexec_load_slot                              510       -    -510
>    kexec_do_load_v1                             638       -    -638
> ---
>   CHANGELOG.md               |   8 ++
>   xen/common/kexec.c         | 241 +------------------------------------
>   xen/include/public/kexec.h |  45 +------
>   xen/include/xlat.lst       |   1 -
>   4 files changed, 13 insertions(+), 282 deletions(-)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 5cf19372a361..5c1113ab61af 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -4,6 +4,14 @@ Notable changes to Xen will be documented in this file.
>   
>   The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   
> +## [4.23.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
> +
> +### Removed
> + - On x86:
> +   - The kexec "v1" interface, which was declared obsolete in Xen 4.4 (2013).
> +     The only know user was the classic-xen fork of Linux.  This does not
> +     affect Xen kexec support in the kexec-tools package.

LGTM:

Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com> # CHANGELOG.md

Thanks.

~ Oleksii

