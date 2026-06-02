Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219AFCD6E57
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2026 19:22:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1325387.1590869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUUgX-0003TL-1X; Tue, 02 Jun 2026 19:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325387.1590869; Tue, 02 Jun 2026 19:21:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUUgW-0003TE-UX; Tue, 02 Jun 2026 19:21:56 +0000
Received: by outflank-mailman (input) for mailman id 1325387;
 Tue, 02 Jun 2026 19:21:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wUUgV-0003T8-IM
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 19:21:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUUgU-004X5A-S6
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 21:21:54 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1f2d2a-5cb7-0a2a0a5109dd-0a2a450ace04-38
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 21:21:54 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1f2d52-56b3-0a2a450a0019-d155dd34e03a-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 21:21:54 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-46015dc517aso1775540f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 12:21:54 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f35eae5sm1416682f8f.33.2026.06.02.12.21.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 12:21:53 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780428114; x=1781032914; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dW/JdpSkmYJ8o+HCqZK1Bdu3oOZlTDFNLL6JBTzcd34=;
        b=XA1zcVyR9HW21NkNR6sjYaKxhkoL+tHy52V9GLvI0TwPZq59IywcjeHGRUeB1QOY7y
         2VOZNWzOSFE5ZYUPSz343SRXNMDGXMA+8RsqDdM5YdYiQzxbuf0sRcHflB7l2eO7vme+
         LwofFYSVWaFpo8ot1yBmQfZ4okxByelU3xYXAjm5eBcuGvxE3itbcA5zCNMfvc2xbWaj
         GFOpHuBm2+D2WX+Vejmt8wJ4QsQRxCM5spzvzQ2H5T1VSB+OiKbWIjNDvpcImuojgoeH
         0kE1AvpVqD6eldxCRS+WhWARVnp4znyVWoSSLwbCDkgHyCk66gwY4yFcITTUIuzVtEUa
         q6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780428114; x=1781032914;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dW/JdpSkmYJ8o+HCqZK1Bdu3oOZlTDFNLL6JBTzcd34=;
        b=p4GU2lKGlRcx2PqR3FhmP2ovQTIXN15bgGHBdB9y+Hq4Lq7bXVXFjxAoP5mGRmYR2C
         BcxZbAf1MkxixWs7Ovcez+hDjkmKRIAkO8/nOKV7N9fZsFlN+V2zXFCXkeu8UiWGeVXO
         +g4srTFlsFAOzJYM2EB06OZ+Vok9n6NEnpIAG5dz9JFr1NFGZyhg+3nnH6NPZm4XJFNT
         1oXYGMaUJyVQwGItSj19GqkXbhO5jI24Zr6e8V+mAK80UK2k5ZvbcctAFnh/cyiHvQNI
         EXioSm3WHtIA9Sh3IhtCLydxwfMZMbHean9CrJb7ikUG2WfsHkhlHcCHS+8Ju1IW372e
         eu5Q==
X-Forwarded-Encrypted: i=1; AFNElJ+Ed+cqMG3o74O+IyareP61sPnN2sx/ViV1D1wHtdZN/+3U/Nrzm3LBjHfTTNr8eRZ74h7E0w7zXOU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJ1lBy83ioO2rxZO5BwpEhXR2HwlbrxsPbSgVE5DrIu4mSzdB3
	FRtD6IPPyu97E2GWfOkOHLB2ymQL/8nG+iNlWQMobv33lWq+YVe8EFMssg22eA==
X-Gm-Gg: Acq92OGIHfplaglb5hD442nA+4SGgBBlVuEVNMczXeNZ54EbuSRRSk7rQ1xnSYHqjJi
	WWZhvAM4/8FBpWaCcm3vwCwluKmeyOeNSRP17fCaNV2sMAaahb9OzYzKiAgmpnWpyWTuc+13YL/
	pGZeAzSRJ6RF7dupMFLbYMu39gb0j8rzNH/EkQu2CpMWbGIWF2qvolyEAgfiw0i+7TBxhhE+aCy
	T4ow+Kc8hwl3VA+DzZ6TVn2zVqxaQf3aC/LzsN9QZ9K6/xkHfuNO4h+4reECQfbkt1DvPd5Ctcg
	xM6CbZkArAE6C+ba/4gmbdb/7vlldSTyu8FEZ3z9eEY+KhEfYM0irI1/VLFyXgOfPUIIdmOi2O1
	RAsPlsxr4sCLIQwVbfBUal8gOeCbke0/E08EK6jGJseHaGnU3S/In5/T153k0Wtw9hrIcq6HMUX
	UC2pRkc6tVgKGJF19vyuGqwVnz18pUPG+JREbBf5WgiZ5JMu4mX2+hAJ2cYiyo9iV+eyVba0q6g
	i2F8sZLSJKrD9gf
X-Received: by 2002:a5d:670c:0:b0:45e:f5bf:6c25 with SMTP id ffacd0b85a97d-4601f62c38dmr652287f8f.32.1780428114125;
        Tue, 02 Jun 2026 12:21:54 -0700 (PDT)
Message-ID: <17af7606-c388-4d82-b219-cd45d2c19827@gmail.com>
Date: Tue, 2 Jun 2026 21:21:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] x86/fred: Enable FRED by default on AMD systems
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
References: <20260602164519.2634144-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260602164519.2634144-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1780428114-713638B7-F755C7B2/10/73395122804
X-purgate-type: spam
X-purgate-size: 1087



On 6/2/26 6:45 PM, Andrew Cooper wrote:
> FRED is now believed to be complete for AMD systems, and has had its tyres
> kicked by both XenServer and AMD.  Enable FRED by default on capable AMD
> systems (Zen6 and later).
> 
> Support on Intel is still not yet complete.  Leave it as tech preview and not
> security supported.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Teddy Astie <teddy.astie@vates.tech>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

> 
> The issue on Intel is to do with virtualisation of MSR_SPEC_CTRL for PV
> guests, and is waiting on the resolution of a question I've asked Intel.
> ---
>   docs/misc/xen-command-line.pandoc | 6 +++---
>   xen/arch/x86/traps-setup.c        | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 

Don't we want than add that to CHANGELOG.md that FRED is now enabled by 
default?

Thanks.

~ Oleksii

