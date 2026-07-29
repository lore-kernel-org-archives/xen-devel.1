Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E21B9C53219
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 18:42:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1376587.1623260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp9Ee-0007vh-HO; Wed, 29 Jul 2026 18:42:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1376587.1623260; Wed, 29 Jul 2026 18:42:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp9Ee-0007va-Ep; Wed, 29 Jul 2026 18:42:32 +0000
Received: by outflank-mailman (input) for mailman id 1376587;
 Wed, 29 Jul 2026 18:42:31 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wp9Ed-0007vU-9V
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 18:42:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp9Ec-006eRY-Mg
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 20:42:30 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a6a498a-2eae-0a2a0a5409dd-0a2a4501a010-14
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 20:42:30 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a6a4996-5984-0a2a45010019-d155802bf117-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 20:42:30 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-49548aebcd8so9605225e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 11:42:30 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fb6ac44bcsm9742918f8f.11.2026.07.29.11.42.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2026 11:42:29 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785350550; x=1785955350; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2sEYiUl//U3W46jmvJEBaeaZ6i8ztzCYa77aFex3tFc=;
        b=mcXjRFONDDwCgxCHvAmnm+nT2vQ1ZmqxfJeCkrRa2kbg0Qt/+gbvT9Us1ct3UHDF21
         X9XwBb28ZKbiCbKcgbjSAg7TfRZJYxa/C9cohunQlsFuFiQHrhz9CFY+r8UiAi14O8Pg
         +kyZTXytVsqzNBIV3xilXeB8xZxXdyn0rx97sbbEmYTw52lC+u/frTRZYjonVBjt906c
         lFnaATKF6Txd/9vEsX5AVxR6Z/X1J5VJRWIvuz7Gd+xfZ4nIGzsbXsi+axXn+PdqTmMY
         4W7E156SQ5cBZ8eBxHrS08BMfealGhvZ2eKE1hbcj2+ZhzaS2WR0VFjbwUNLkkNFzfRS
         BOXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785350550; x=1785955350;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2sEYiUl//U3W46jmvJEBaeaZ6i8ztzCYa77aFex3tFc=;
        b=gmq6Blwh9ZZUSQaom2dhI+VOxVHNMZAuouDt2NfDqToUaapKeXYmAVdbv17yaYfroB
         0f5nrYX3qaqXIwlTY9sdfj1dBYd11Qr6GCqsv38eRpwur2cKuJtAcBuJKleRKcDjsgoD
         Hez+2Nw97Db+AKQ7ZwAB+LcW2HolPlB3eSW+KMJCcft1rNrbGAi6Pmb1Iq7+jnaNIPjq
         dOdteK0Oi5OqmXJ9IDZ731bIC/bNgEkOtfOqeP4mwbcEwfkMfGLpGMrk1lWwWZES50Eh
         NL9/Vv6kXiFVHGuvLa33bEfDvcB5JgJyPd7xHx4zis/79EeBr521sQRwSEQ0LfeUSEQT
         uFQA==
X-Forwarded-Encrypted: i=1; AHgh+Rr0jXHM2f4dgMlwFJAz0hze21wHbN/MCYSaHvAb7EcEN8+Qb5rZC3sXKfaRQZpuzibjpfcS5vJawxg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwUGcDdGMnb3g4uu1HCDF0PCFEItyzRy9C2nmnlSoqoDhrGQIIH
	dVN9ZKWnm0ke1wX8WJMkAOSn5OJUhwp4ChOui3tY8xBNWygDeCDsFHFL
X-Gm-Gg: AR+sD10i0v0sS//hkQbRs10vPbo1Dm3SWeqJ3Yjzlofb0H4kjyhgY4GJqESIDDzIDxL
	zzGjzSoIQBdGjV313CpiGS8CU/9el4RED7aUSuX9PSAZn4YEEo5SQ1SV7GPF/vsYLKTN81IWhuX
	kPpm4Fdvhw2vnVbYx/dLk5baymhc/FhHV1PNx2/Q0nzHtcu6nPsibRsz7Oeb4Scn7ZUUu+j/5s6
	kVntLnumZiVBjx2GQbiOtioKjYK9eUejQ7FfbJ/gnzDb8g8yg4lbirrVHK/giI1RKH8WFp8Z5av
	6fRAuYcavDZ6K+GfPIYMQUJzrXSGkabdpW17S05a+2x5R+UVMRtPJgUtYSxQEeiH6F7caBzhjYX
	cjmvX65cmxgmWNiB4SFRitO3IXnHQZS+7xliAlHb2QtUF3KYX8Zadw+dNRi9evNSECfoMUJV4qf
	KN4JzLkg4sZ8cVa7VfvY34j2eX8Q7znT7h17BXpUQxjg8Wah9fWGqgAmvUOlq84ET8GpBcQIwC8
	2nojLSEavu4gJw7wnwlAW2c2NRM51cRSIF/wHXgyag=
X-Received: by 2002:a05:600c:34c2:b0:493:aab3:c09c with SMTP id 5b1f17b1804b1-496c657ec5cmr91035135e9.28.1785350550024;
        Wed, 29 Jul 2026 11:42:30 -0700 (PDT)
Message-ID: <8a990f8a-c210-4100-b6fc-50a9c703ee70@gmail.com>
Date: Wed, 29 Jul 2026 20:42:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] CHANGELOG: Set release date for 4.22
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20260729161529.164017-1-andrew.cooper3@citrix.com>
 <20260729161529.164017-2-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260729161529.164017-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1785350550-BCB45757-0CF94B63/10/73395122804
X-purgate-type: spam
X-purgate-size: 1328



On 7/29/26 6:15 PM, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger@xenproject.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> For staging and backport into 4.22
> ---
>   CHANGELOG.md | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 1435855615ae..6f879c97962d 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -4,7 +4,7 @@ Notable changes to Xen will be documented in this file.
>   
>   The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   
> -## [4.22.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
> +## [4.22.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - 2026-07-30
>   
>   ### Changed
>    - Users of XEN_DOMCTL_createdomain/xc_domain_create() must now pass DOMID_ANY

Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
(if it still makes sense considering that it is already in staging)

Thanks.

~ Oleksii

