Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B54FFC43219
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 14:16:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 828AC206C1
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 14:16:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MnChcI9q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 828AC206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hK1dN-0003VY-Rb; Fri, 26 Apr 2019 14:15:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TPdi=S4=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hK1dM-0003VT-DV
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 14:15:24 +0000
X-Inumbo-ID: baaf6c13-682d-11e9-843c-bc764e045a96
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id baaf6c13-682d-11e9-843c-bc764e045a96;
 Fri, 26 Apr 2019 14:15:23 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id k2so3046727lje.10
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2019 07:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yTvSVavzV7ExI8Y4kBsdpYnYqKISKmtKGBebuxNYfBQ=;
 b=MnChcI9qajoxbhibLJWNzGKQbzrhU2lwrhfumjOw/skmq1U8wALKL5QPU0IoSQiyFR
 L6TaYRqSJG1O2YjHKKCRCB4m80p+Et4TOtbmf5vIxHPrR6hmooIOtNd6Nn2V9DKefVVN
 HMdXJryhpxu5K5UlYXrGoC2gbXVeJfm8CZ3pxUeoPxy5HpNQmNZXoYMpSiG6iaXIgL4h
 RVm8DWcFHWYGpCzRPo0cTd4iNBLUwuN/kWaUZ7RlEd6GS/CsdBwH5EhgJ5euBGxO4Wja
 6Ko0aNmYIxIpD3GlpQwXErPMyOnoPXgrTN/KqX44oa5FIo2QsKuGIEU7CsDpcp4mHgO7
 /KNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yTvSVavzV7ExI8Y4kBsdpYnYqKISKmtKGBebuxNYfBQ=;
 b=RbYFdVogJJzTQyV8vtUUvdOwcMg+e4zFoP6tqtFiuSj289SsulBa8D1B2mvo22imXB
 lS+4VfSXO9rh2nUX3+hhQzWZk4ZyQ/7OYXXNVeI9FhCBA9j1YVoeQ5YcOeTcxRbq/3PK
 q/mwzfGDob8u2BSzNvM7MrLHj93sfWTdN30ZEhCJwfCUSPAkwwzQpfpllTaGMPpsdRiu
 HuAZWrwMhDUmtlDZq4d/AIehg8jt8wtLCGDBHhFMArftx3BM78aN7zQGYTHXxDbfoZy3
 1VqShpBzP/9PGBoniZ5ZA9geoCFON7uC6+DmTCUPMLHFJaNoA/NNBYLg7tg6+WW9olPr
 5jdA==
X-Gm-Message-State: APjAAAXmxtZ29LMHVCHQ2hxj+zD907mAcAJ1987PVO8H4R4jz+nH0Cdf
 ax3SJ6FD7BgYGe5a2DkQ//M=
X-Google-Smtp-Source: APXvYqwibvvUJmlmkr5cLN3BTJYnreOUmMPEKIK06tJcu277yjz8KqDv14vKu4pQn1ouv2gQyZh8ig==
X-Received: by 2002:a2e:a0c4:: with SMTP id f4mr7363949ljm.100.1556288122096; 
 Fri, 26 Apr 2019 07:15:22 -0700 (PDT)
Received: from [10.17.180.55] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 g8sm5678898lfg.4.2019.04.26.07.15.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Apr 2019 07:15:20 -0700 (PDT)
From: Andrii Anisov <andrii.anisov@gmail.com>
To: Julien Grall <Julien.Grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190417175815.16905-1-julien.grall@arm.com>
 <20190417175815.16905-3-julien.grall@arm.com>
 <3fa56715-823e-985b-384c-dc8342d77364@gmail.com>
 <fb22f2a1-f3a6-a962-a9ba-54c22e5c7d2a@arm.com>
 <4e365b84-122d-e613-ceaa-e2df8c865262@gmail.com>
Message-ID: <eb656a28-7910-c65a-bf50-1c62494f5acd@gmail.com>
Date: Fri, 26 Apr 2019 17:15:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <4e365b84-122d-e613-ceaa-e2df8c865262@gmail.com>
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
Message-ID: <20190426141519.ZrFivdcQth26aIcaF5bCEK51HdH0MUf_48YpX-eyFAo@z>

SnVsaWVuLAoKU29ycnksIHJlcGx5IGZvcm1hdCBpcyBicm9rZW4uIEl0IHNob3VsZCBiZSBhcyBm
b2xsb3dpbmc6CgpPbiAyNi4wNC4xOSAxNjo1MCwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPj4gVG8g
YmUgaG9uZXN0LCBJIGFtIG5vdCBlbnRpcmVseSBzdXJlIHdoZXRoZXIgdGhlIGlzYigpIGlzIG5l
Y2Vzc2FyeQo+PiBoZXJlLiBBdCB3b3JzdCwgYW4gZW50cnkgb2YgYW4gZXhpc3RpbmcgbWFwcGlu
Z3MgaXMgbm90IGNhY2hlZCB3aXRoIHRoZQo+PiBTQ1RMUl9FTDIuV1hOIHNldC4gVGhpcyBtYXkg
b25seSBkZWZlciB0aGUgcHJvYmxlbSBpcyBhbiBlbnRyeSBpcwo+PiBpbmNvcnJlY3RseSBjb25m
aWd1cmVkIGJlZm9yZSB0aGUgZmx1c2guIFRoaXMgaXMgZG9uZSBlYXJseSBhdCBib290IChhbmQK
Pj4gd2lsbCBiZSBkb25lIG11Y2ggZWFybGllciBpbiBbMV0pLgoKCldlbGwsIGZvbGxvd2luZyB0
aGlzIGxvZ2ljIHdlIG1heSBmaW5pc2ggd2l0aCBUTEIgZmx1c2ggaXMgbm90IG5lZWRlZCBoZXJl
IGF0IGFsbC4gQmVjYXVzZSBlbnRyaWVzLCBhbHJlYWR5IHJlYWNoZWQgVExCLCB3ZXJlIGNvbmZp
Z3VyZWQgYmVmb3JlLCBhbmQgYXJlIGJlbGlldmVkIHZhbGlkLiBBbGwgdGhlIG5leHQgd2lsbCBo
YXZlIFdYTiBzZXQuCkJ1dCBpbiB0aGlzIGNhc2UsIElTQiBpcyBuZWVkZWQgYXMgYW4gZXhhY3Qg
cG9pbnQgZnJvbSB3aGljaCBhbGwgbmV3IFRMQiBlbnRyaWVzIHdpbGwgaGF2ZSBXWE4uCgoKPj4g
U28gSSBhbSBraW5kIG9mIHRlbXB0ZWQgdG8gZHJvcCB0aGUKPj4gaXNiKCkgaGVyZS4KCi0tIApT
aW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
