Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C1CC43218
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 18:01:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8433120717
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 18:01:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uU2syoo3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8433120717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJigF-00069D-4t; Thu, 25 Apr 2019 18:01:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+mKo=S3=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hJigD-00068f-Km
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 18:01:05 +0000
X-Inumbo-ID: 1747b556-6784-11e9-843c-bc764e045a96
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1747b556-6784-11e9-843c-bc764e045a96;
 Thu, 25 Apr 2019 18:01:04 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id h21so415437ljk.13
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2019 11:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B+zVI5/+b+v5ksC7cuE9jDsmPNHg4fX6jexJESLuYZ4=;
 b=uU2syoo3HRv3JUr2B9hRnjxnX3ZEniUoSZdMEMi9+hPQau2eQLUcsWbPZ0YwG5q9jg
 wUnx1ZuDSvkSl4hPz50aKAphuDsRYvmG2z8+fTXjWnc3Ulgq42ynfSrfhDpDGJNiJ52I
 Yp8RhfyCQ2W7+iSNyDbWYk936pSFd5JL0uuF5AUyudzy/Jh5VD/fx8IEz/mpaM2DPcda
 zcgnYaaTtUoBaEdO80OXqIiM7DdzN6/5kPDFmPCmWPIHwzxajSYwFWY0EcFDV0V1/2dF
 aJMLFryqm8qtauCBe4s4ras5t8wnETribZKz6sHMqNAGdDE+IkOIcEaq6dObr7yjNhNV
 3gQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B+zVI5/+b+v5ksC7cuE9jDsmPNHg4fX6jexJESLuYZ4=;
 b=qwcAJBp/AAW5JaIu4WZE68FAD/poj2aJZVz9AHCZEqoqwLgwCSek7wsf9YwOnYNiAb
 e6B4aHfv08wxBAsgrwTRlDPMShjunC9OibxL3rOrF2wtYhxS7fJo8IuHF1xofLWZdaYw
 ED5bEXlWTTfh5x3kh+JA6fdiK03ZzHZlgzSKTVMx78RDdY3iJBlesMJMeXG9exSCRSHj
 /vsUM20EngYDDbI5OBjtI2Xuzel+3X9jy9fK3h4kID6Ph50d2qf0nBj72VjaLH0BclE2
 HeLYs1FPbqJOop8Adp469BChsqOAf8lu1E0tTykG+hXZqx5z0YFxXLIyd0Fc8m7qv3o0
 eOkA==
X-Gm-Message-State: APjAAAWsMiVeSyiqdjDzVCAuy85XigKCYDE5BMmT0adPQC17pKWeZbZQ
 23eeq3qg3herA9P6MISeBcw=
X-Google-Smtp-Source: APXvYqx0keeahlqr01dSrWDz6Z1VLMwGWVbwiH4Fz625PyZiipBk698zoKF0F+NDzPjNIAt1HbVG0Q==
X-Received: by 2002:a2e:74f:: with SMTP id i15mr5334593ljd.156.1556215263057; 
 Thu, 25 Apr 2019 11:01:03 -0700 (PDT)
Received: from [10.17.180.55] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 v14sm2116632ljj.44.2019.04.25.11.01.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Apr 2019 11:01:02 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190417175815.16905-1-julien.grall@arm.com>
 <20190417175815.16905-6-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <45000e50-c511-35d4-ebe3-b95653e4a9f4@gmail.com>
Date: Thu, 25 Apr 2019 21:01:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190417175815.16905-6-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 5/7] xen/arm: Gather all TLB flush helpers
 in tlbflush.h
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
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org,
 Andrii_Anisov@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425180101.hEgLY7PcFR-RblL_iCmFtmVlwaCTrEw8K7feh9Ds1bY@z>

CgpPbiAxNy4wNC4xOSAyMDo1OCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEF0IHRoZSBtb21lbnQs
IFRMQiBoZWxwZXJzIGFyZSBzY2F0dGVyZWQgaW4gMiBoZWFkZXJzOiBwYWdlLmggKGZvcgo+IFhl
biBUTEIgaGVscGVycykgYW5kIHRsYmZsdXNoLmggKGZvciBndWVzdCBUTEIgaGVscGVycykuCj4g
Cj4gVGhpcyBwYXRjaCBpcyBnYXRoZXJpbmcgYWxsIG9mIHRoZW0gaW4gdGxiZmx1c2guIFRoaXMg
d2lsbCBoZWxwIHRvCj4gdW5pZm9ybWl6ZSBhbmQgdXBkYXRlIHRoZSBsb2dpYyBvZiB0aGUgaGVs
cGVycyBpbiBmb2xsb3ctdXAgcGF0Y2hlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKUmV2aWV3ZWQtYnk6IEFuZHJpaSBBbmlzb3YgPGFu
ZHJpaV9hbmlzb3ZAZXBhbS5jb20+CgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
