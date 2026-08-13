Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B0BC5CFDB
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 10:57:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389791.1630416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuT7L-0001yp-EM; Thu, 13 Aug 2026 10:56:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389791.1630416; Thu, 13 Aug 2026 10:56:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuT7L-0001yi-B2; Thu, 13 Aug 2026 10:56:59 +0000
Received: by outflank-mailman (input) for mailman id 1389791;
 Thu, 13 Aug 2026 10:56:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wuT7K-0001yc-Ay
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 10:56:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuT7J-000d1j-JR
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 12:56:57 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7da2dd-bab6-0a2a0a5309dd-0a2a450bbd6c-46
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 12:56:57 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7da2f9-b7e8-0a2a450b0019-d155802ee492-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 12:56:57 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4953de5be0aso14071745e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 03:56:57 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49981b03e70sm65595265e9.3.2026.08.13.03.56.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2026 03:56:56 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1786618617; x=1787223417; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w8tZY1MJk7duy9iK7oKaGRxHeYhvpqf9/RuUCJ7FDHs=;
        b=mEQroc2NKz6oWg1hqsKN9/7vCm6MOK9045FBYWmPfkW7cXtnFFYtRvLYB8duvzuPgi
         xC6rrQ/T3ygTc1ViirsF504g9Mf99yNo9iKFNenutbwRGOLpnSilZSng8+c42I88Z1kn
         CFsIO2TfOSMjuXHWyGt6031f79GKDmub2XDrf0A1C2Wg3M1leBp8AZ6OHdayi8AT8B6G
         6YHjsJY9gfOpRROXXZRrDFHQg4h2Dc7yfS/yEUhu0Y36Wg8u5UFhdHztgTLEZTiHdv7r
         4KbR95QksKN3FgM5XSNL34d3bqw2QafEeXXF/GLqV9az/1VeMS65I2IW2I2+MaHYnJm0
         5VyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786618617; x=1787223417;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w8tZY1MJk7duy9iK7oKaGRxHeYhvpqf9/RuUCJ7FDHs=;
        b=lr0W8S1PJKyV78aY1PiaaY5VX+AupjF0LL0fICFp1CgvSN8d7QpnzqWgTWAW4NeqRH
         IE+UW8KH5ItDzKmJNw1VpFTKSXTDCWuNb10kL9dOHo/m6BL6qeNABIsuwMif33nXpVQy
         8rn+uNs9d1vTey8slV1yCDOfBrdxSrHmYcm+7IIHFGIxdnw50u3vvPnR4+SaebT2/eTr
         dsuryaE1tlhsjiNd8Ljh6S8mM0zdFxsBeFrefX1IxpBNvy4rrabBwtoowM/IU0GEYB9u
         VPVC8uOpyDQXFImmx76X+EcL7/p48ncuRJTClOjRrnJrPlL61Zq3NiT6PJ270qyUvk6G
         TyUg==
X-Gm-Message-State: AOJu0Ywjr8pL8395SA8mbDaDYA62XwT+WpIQNxpuUsfM9CsMwc0mM+lY
	/jL8P9Fe4T/H31myGB4yQars/OZssIxDOkDTL4idMWrzR6P6Q6rqfirY
X-Gm-Gg: AR+sD10Eje7y6klV7Po2zKX6m/LaUOhc6p5DAV3OsNKoExGV8/6bdqfaww7rda/BTE0
	Grf17oVkPq7JpTOdT93dQ8JWJ+VEbZ/Xr/8EMjGgubnB8ERV84OYcSzxNjJBvOXv4lyMt35Hix3
	CbYY61jdd1X125EMKPsSCcobnWTF/dtp5TMSSo4zHsjswXtqgUIYUMcLXRaYYCTRqdm1ybozbuz
	jVL2fX+4n9t2nT11pRE4lw/XmhDHcqPvSQ0P2KfgUO+1EhE4xI9UVHEY/b0GNmWsMjbvG2wgry7
	gSmq/CSVgG3cLynJSRRJQNwkeZn3gqLxbVT1JKC8TaEbveaA1CRZL+oSWuR+gxKxP/+MnRADxZJ
	HTpCGlsudnlceW0jvZXqrlIW/L7zfuKLhp8FApZWxoDLc1L9+QpIXw7RH0u3XPXMMWdFVpgbmb+
	eQlkUs7I5VHZFS7hjIz2Pf1OsUjAYKSouz70B3iLd8h6e0CW3if8bWRLtoZ2HCR5+ChCH/FYwh2
	aVIF4YYrvGX3BXchuCZJebUc04BiXbQZsYE4wNT9cwn79kmddEslg==
X-Received: by 2002:a05:600c:4690:b0:499:7410:545 with SMTP id 5b1f17b1804b1-4998218ee77mr56335695e9.12.1786618616905;
        Thu, 13 Aug 2026 03:56:56 -0700 (PDT)
Message-ID: <fa8d8a9d-04ce-4ce8-80e0-8164fea774ff@gmail.com>
Date: Thu, 13 Aug 2026 12:56:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/17] xen/riscv: add IMSIC state save/restore
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <5e3df9ea4bafc5666d1885dfd40f534f8349879e.1784560663.git.oleksii.kurochko@gmail.com>
 <1786613430.8631fc262581453bbf619ec5b2062170.19ffa7577c9000c4f3@vates.tech>
 <9724c838-6713-4f29-89ab-54f50ec4fe8e@gmail.com>
 <82011389-489e-4076-9d3a-8c393e4a8e76@suse.com>
 <bf2c9455-dd88-444a-8a94-a3a519d951e2@gmail.com>
 <a88930bc-e11a-4da1-b545-9474b5295d84@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <a88930bc-e11a-4da1-b545-9474b5295d84@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1786618617-A82F49EA-6ED33CAD/10/73395122804
X-purgate-type: spam
X-purgate-size: 735



On 8/13/26 12:44 PM, Jan Beulich wrote:
>>> Also, can both of you please adjust Roger's email address when replying?
>> Could you please clarify what is wrong with it? For example, in this
>> patch series:
>>     [PATCH v2 0/2] vpci: allow unaligned accesses by the hardware domain
>>
>> This one is used: Roger Pau Monne<roger@xenproject.org>
> Whereas in your mail it was still Roger Pau Monné<roger.pau@citrix.com>.
> When you originally posted the series, that was still correct. But in the
> meantime it has changed (and I expect sending mail to the old address
> wouldn't reach him anymore).

Thank for claryfing, that e-mail was added by ./add_mainterners.pl so it 
returns incorrect e-mail...


~ Oleksii

