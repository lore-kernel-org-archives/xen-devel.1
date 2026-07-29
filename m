Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0DFC53200
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 18:41:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1376581.1623251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp9Df-0007Tn-9P; Wed, 29 Jul 2026 18:41:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1376581.1623251; Wed, 29 Jul 2026 18:41:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp9Df-0007Tg-6i; Wed, 29 Jul 2026 18:41:31 +0000
Received: by outflank-mailman (input) for mailman id 1376581;
 Wed, 29 Jul 2026 18:41:29 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wp9Dd-0007Ta-H4
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 18:41:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp9Dc-006eL3-II
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 20:41:28 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a6a4915-2eae-0a2a0a5409dd-0a2a4501a6ba-46
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 20:41:28 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a6a4958-5984-0a2a45010019-d155dd33c5d1-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 20:41:28 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-47640541585so1004787f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 11:41:28 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4976bd7bab1sm72339775e9.13.2026.07.29.11.41.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2026 11:41:27 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785350488; x=1785955288; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u+HrQhJ0fyKm/rHlqD13wNcFAAxZUfw1+gdNCsPTc0M=;
        b=OZHTSDT0A1g86TLTrv61OTRCla8zpOncNVUlqnK3gfo4e+16uF1ArcfEReEu9RV5Bs
         rUV+NWT95TfobNX4XCQ1nvOO9lx3ETFg8mHYaAY3dNcc24/SZuMI27+q9uEaOd/mfqhh
         47Zv0/ynARo//mnvDzfViGk5HT3yXtBQk0i5yo//He5X3+Wr7q0Rl1BKGJmafcwX3+UK
         dDONpV6i9US2mMcYwr10HlFFuSHdFbinvVD0eCtFKbUf07+dwRGweJePNx1O7Rxiz137
         Xo7VO+hXbJnQFifk+uLZ2saqUtlUKJCHCSRSWXIvjM8rP84tHxKyO7uW8CxzS05wulU7
         JSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785350488; x=1785955288;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u+HrQhJ0fyKm/rHlqD13wNcFAAxZUfw1+gdNCsPTc0M=;
        b=fzC4uhLsasH2+mKN1Dkh7yKx0tnzcUUw6j0SSjWw7t+FfG7huDHDXi23HXG7il1zYC
         Rm0T1vQaW93XTw44s+KXUE0AcuqZ3iW51QxULvN3SMoxTEgOg0bqIHtiiToR8d69LDsq
         ktgWF3iH5bGpO48e2nuPx1SLg6VIFWwX/OS9Ojl2t5e4dSIpD6JZQ9p7Dwuspa/uXmbF
         hvuFhO6JM3JoVMgCzwTLZCTw5tFSbyCJHDDR5kDYb2T1Ewj1U8HStNCRiiBrAkguvC2q
         29UHfRxHlEgbi1UQN3ZO3VD+0+ETEVIfA8Ynt3T7hKa9vQd4rrJVf4Rt9DKcDON0pgEU
         htvQ==
X-Forwarded-Encrypted: i=1; AHgh+RqF6kG4Vhhi4Nbs0MDeVDs/BY1ILgmX0w9xyWZ2vscNFmnGmPii6/gUtwsP5A3C/QfpOnh+xtFBv1Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YybqmWiRf32UoFAhD9E9lzRP/Xgw/HHWUxo5o92SW4uGrbr2YgK
	4LIwB1WZ0hkmDEEAw/YljIOVgoSk7iWMA6X0iDKn5IZ81o6MKIWd0iWV
X-Gm-Gg: AR+sD10aRDINloJfUbnRfbsmStTKwPBOoPiLQ9FWiX/JjQaapMy6k3RyGpbtAC1z/2y
	S7FQWnVsWbqwh1RB2CQzm1qwr1f6d7Kvs9va2yRIwsjvO6ALlFveylDQQvNOTTXpn1Q72+IpGZO
	g2GxDr+V3sAIAUteW28Smh4LpJAuuk8A7CLvrNrCPV+nmtHUGkQzL1y/CyEieqz+0NLq/cBlb1o
	8fYDz0kKRsN58ky2tY5T9gJBtPCyG5vAhCyV8TZ8rteIeD/IV/zSCncfmMXWmJBLKz/NNTzNnN/
	q1AfOf4Nye63F2o/Z3QgtGTx/SgF96DCrNcIcoPkD7SHywMstH4dUsIHX+9YaHGrIjusEejhiBe
	XzRLCbO7KG6xhFVJmNoqvFBa34MUtidEGMVgryf6f97fzyQ9RrUDxlm03AnWrj4h2Ygcyc5dpax
	a1+xAYNjhaqR3Xgp1zSgv1y7ElTSoMajt56duHeCi4sQ4KKsuFEh5JeOiV7GAaoCTMfXvEg7Uqu
	KqAY+2iUaZoYvNE09RQm4UPtR16O+sOz/SnzL3xTGP/+lSXDN546w==
X-Received: by 2002:a05:600c:1d16:b0:495:6022:5a20 with SMTP id 5b1f17b1804b1-496c657f4c9mr73881635e9.33.1785350487982;
        Wed, 29 Jul 2026 11:41:27 -0700 (PDT)
Message-ID: <9520f870-ae7f-4024-9682-12857b4b8275@gmail.com>
Date: Wed, 29 Jul 2026 20:41:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] SUPPOT: Define support lifetime
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20260729161529.164017-1-andrew.cooper3@citrix.com>
 <20260729161529.164017-3-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260729161529.164017-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1785350488-BDA7E757-A15AEDE1/10/73395122804
X-purgate-type: spam
X-purgate-size: 1457



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
> For 4.22 only.
> ---
>   SUPPORT.md | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 7c42de4c1602..b945fc83afde 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -9,13 +9,13 @@ for the definitions of the support status levels etc.
>   
>   # Release Support
>   
> -    Xen-Version: 4.22-rc
> -    Initial-Release: n/a
> -    Supported-Until: TBD
> -    Security-Support-Until: Unreleased - not yet security-supported
> +    Xen-Version: 4.22
> +    Initial-Release: 2026-07-30
> +    Supported-Until: 2029-07-30
> +    Security-Support-Until: 2031-07-30
>   
>   Release Notes
> -: <a href="https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes">RN</a>
> +: <a href="https://wiki.xenproject.org/wiki/Xen_Project_4.22_Release_Notes">RN</a>
>   
>   # Feature Support
>   

With fixing commit message s/SUPPOT/SUPPORT:
  Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

