Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B9BDC43218
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 15:09:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8DB720675
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 15:09:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d13GSCKX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8DB720675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hK2T3-0007Wy-5g; Fri, 26 Apr 2019 15:08:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TPdi=S4=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hK2T1-0007Ws-7O
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 15:08:47 +0000
X-Inumbo-ID: 2f1920ca-6835-11e9-843c-bc764e045a96
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2f1920ca-6835-11e9-843c-bc764e045a96;
 Fri, 26 Apr 2019 15:08:45 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id i68so2600988lfi.10
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2019 08:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZunPH2Hotadf+hDcMWMAXt1vSjrl43bdN0BFxcT/sSc=;
 b=d13GSCKXGiHBRoX7OlCpS1NszzwnA5WYb74d1kYF7Led4dKaWNrUPNnizGQv+fk3JT
 J5zdCcOkKRplnG08UKfo/0FeGrKsJW4hY/3zNT5s0dSFuoi6z+bJJ9/vHOjhmeshLjZo
 9oLgvJtbPzNwP25ZGviLaJc/0e4kf18GJ6/ZW10uFED50gg2lcY0yZOUjp1vIzt2t5iS
 j+rmFd2QRTgsZgcIs631YfuW3v9vUF3edm3ErKp5lvLls2DDivWq3gu36YoVEVO4NjVd
 Q6IERhZK4T5UYA86B+dwztNqPvHM2JM6mTDE8nI5emf3WT/p4lR+UhYKuE8kh95Pf+vH
 eYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZunPH2Hotadf+hDcMWMAXt1vSjrl43bdN0BFxcT/sSc=;
 b=OUVxSV3i8wJz+gpss3PqEbm4zBIlaQp+WTa2YKIbi+ibCM7I5LPH+uBxat+KRLfBO8
 kzBSxihK8jE3zMcW8dKTe5Kftjfd5zq3UWXWurm2RaKwmUAwvXb4Z8GXwVStvN33oZbZ
 b/EIkFC9xAUYe77fvmUqUZuhReEPUlUKSPo7b+r2r0Uo4tR0RPP5NISCbHIGRHqDxkyN
 VVPSdJFrPTZVyzptGOq4lKZsr5LPmfjn0iBssomY7NLow1ifEmQiIwbVBWfH3f6RXNsE
 M+DHjQMMGEj8HMQkYxNB1cnUEzrIVxCVl5RjxlVGcUDizDIbLiVBCW+p4AYPKZtxCfzP
 rNhw==
X-Gm-Message-State: APjAAAVTqMEV9Jgt3re2aNKDIq2dt0wi40lZEEi0gqIXJ1Sl8Nc6dOP6
 vK67Rn2B71z4HqX9PI6beCg=
X-Google-Smtp-Source: APXvYqxI1Jphpn1wu2aKQ51hw6AaU7x+yqb2uG67v952s9TQQkBUrZBGJ3GE9guE4qpy6EKbmrm5BA==
X-Received: by 2002:ac2:54b4:: with SMTP id w20mr24455161lfk.149.1556291323683; 
 Fri, 26 Apr 2019 08:08:43 -0700 (PDT)
Received: from [10.17.180.55] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 m28sm5603139lfc.71.2019.04.26.08.08.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Apr 2019 08:08:41 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190417175815.16905-1-julien.grall@arm.com>
 <20190417175815.16905-3-julien.grall@arm.com>
 <3fa56715-823e-985b-384c-dc8342d77364@gmail.com>
 <fb22f2a1-f3a6-a962-a9ba-54c22e5c7d2a@arm.com>
 <4e365b84-122d-e613-ceaa-e2df8c865262@gmail.com>
 <eb656a28-7910-c65a-bf50-1c62494f5acd@gmail.com>
 <7c231a06-bac3-1a76-2fc8-73042a900953@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <0bce7c0c-12cd-d532-0441-21d6448db73f@gmail.com>
Date: Fri, 26 Apr 2019 18:08:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <7c231a06-bac3-1a76-2fc8-73042a900953@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/7] xen/arm: Remove
 flush_xen_text_tlb_local()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>,
 nd <nd@arm.com>, "Andrii_Anisov@epam.com" <Andrii_Anisov@epam.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190426150840.LQ7KrYT04N4lAhkv9yg1UzStGvImzAV_F1oju9iiATY@z>

CgpPbiAyNi4wNC4xOSAxNzozMSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhvd2V2ZXIsIHNwZWFr
aW5nIHdpdGggTWFyayBSdXRsYW5kLCBpdCB3b3VsZCBiZSBiZXN0IHRvIGtlZXAgdGhlIHNlcXVl
bmNlIHN1Z2dlc3QgaW4gdGhpcyBwYXRjaC4gU28gU0NUTFJfRUwyLldYTiBpcyB2aXNpYmxlIGJl
Zm9yZSB0aGUgZmx1c2ggYW5kIHRoZSBmbHVzaCB3aWxsIGVuc3VyZSBhbGwgY3VycmVudCBlbnRy
aWVzIGFyZSByZW1vdmVkLiBTbyBub25lIG9mIHRoZSBlbnRyaWVzIHNob3VsZCBoYXZlIFdYTiBj
bGVhcmVkLgo+IAo+IFNvIEkgd2lsbCBrZWVwIHRoaXMgcGF0Y2ggYXMgaXMuCgpBbmQgaXQgaXMg
cmlnaHQgZnJvbSBteSBwb2ludCBvZiB2aWV3LgoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNv
di4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
