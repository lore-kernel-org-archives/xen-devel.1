Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03803C43218
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 15:17:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C43EA206BA
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 15:17:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9qXt03e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C43EA206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hK2bU-0008Qn-Ae; Fri, 26 Apr 2019 15:17:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TPdi=S4=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hK2bT-0008Qi-JP
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 15:17:31 +0000
X-Inumbo-ID: 67d583c7-6836-11e9-843c-bc764e045a96
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 67d583c7-6836-11e9-843c-bc764e045a96;
 Fri, 26 Apr 2019 15:17:30 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id k2so3240575lje.10
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2019 08:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7tRgs7i8knYum+owhxAPnyIB304ljqtvtYY8e3kIR/Y=;
 b=W9qXt03eMsXPrBbvR7nDQK67aKj/MhgmP+/7CrJFMl0hD1rV2jldSBQ0+/Umq77jOL
 j6XzJWgYDKswIWrJRp3m7iBwMKM4grqyzxoPhRXUuX6PSH70+EcA32GuOQh11eY60LY9
 Zx3NwXfwurcHqzqr4W1IrJb0p/JlXHOykkVYZvnLhvpACUBbiKgFg2qRXBxNy33WhbGC
 Sy3PtMAaVugbS9VsTliOKYC/Y7wK/fEtjHrgJLUUjwZe+/ahsH4wYSiMpKCHITk3Fqqq
 TgsuGGq1NBgEdY0ezzB7or64Os56gzfmx1qmCqoWQBrCsWRBbZpE/Hc305Eez5Ll0KjN
 CqJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7tRgs7i8knYum+owhxAPnyIB304ljqtvtYY8e3kIR/Y=;
 b=Rfou/VYJEoBmhFSHsarQpWdxeQgLS43unBlO/kQMQDYfp12VncFWg8ke7ilmAW9+GF
 Z36b+ru+kMo3g+YZ3iSEXp7/+nhwY0+HM1jJHlxdrZ8tiIHgtonMWK6VDmaXM31A1fYe
 RWfGg8rREeLSf9xrh3PJDyhInPezXSjUKveWPQHP1qek0IdFiLR0EvwWEAvv1cP+ds/z
 usLP5lqSKN4HYrD5/kZCSqoVT/Rg136kuEOkYkrgybX73s11ghT/kdqe3dXeVHwhocBs
 BK735Th339wR857ZNh6DaXz0GSQntTYYWbmSRnGSH7Y/o5U1eYs6lU1MjfqtFoivUBuI
 SaoQ==
X-Gm-Message-State: APjAAAVanvK4sqvQ1qSWlTvfggMLNzhITDOBh9vlIILkMtdOSmYrzbfN
 R0mVLLGndK4PcoLK6NLZYgc=
X-Google-Smtp-Source: APXvYqym3TXFd4RcvIHez7V6Ua87T1A32+PQTKDUkqXqLLxfscMv1a7G8wj4APE27HjHbuhxyAVwlA==
X-Received: by 2002:a2e:84ce:: with SMTP id q14mr13789588ljh.80.1556291848557; 
 Fri, 26 Apr 2019 08:17:28 -0700 (PDT)
Received: from [10.17.180.55] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 j24sm2815037lfh.28.2019.04.26.08.17.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Apr 2019 08:17:26 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190417175815.16905-1-julien.grall@arm.com>
 <20190417175815.16905-7-julien.grall@arm.com>
 <4de7931e-27e0-be57-51e0-f2807aeff7bd@gmail.com>
 <d700c117-80b6-45c7-38f8-6193f92e2a63@arm.com>
 <122d7f0f-d209-6a7a-8092-64985797b383@gmail.com>
 <0308fa00-070f-cc98-2ef4-f109d94aa8b8@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <2bbefbd9-b838-3581-810a-c4739d7d9713@gmail.com>
Date: Fri, 26 Apr 2019 18:17:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <0308fa00-070f-cc98-2ef4-f109d94aa8b8@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 6/7] xen/arm: tlbflush: Rework TLB helpers
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
Message-ID: <20190426151725.MP2An3xJjN8jzPcZZrmDySAmjMrIFRouuSY_MG4hfKA@z>

CgpPbiAyNi4wNC4xOSAxNzowNiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDI2
LzA0LzIwMTkgMTQ6NDksIEFuZHJpaSBBbmlzb3Ygd3JvdGU6Cj4+Cj4+Cj4+IE9uIDI1LjA0LjE5
IDIzOjQyLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBJIGFtIG5vdCBzdXJlIHdoeSBJIHVzZSBB
LmsgYmVjYXVzZSB0aGlzIGlzIGEgcHJldHR5IG9sZCBzcGVjLgo+PiBJIGRpZCBtZWFuIHRoYXQg
QS5rLiBpcyBub3QgcHVibGljbHkgYXZhaWxhYmxlLCBldmVuIG5vdywgc28gaXQgaXMgbm90IHF1
aXRlIHJpZ2h0IHRvIHJlZmVyIHN1Y2ggYSBkb2N1bWVudCwgYXQgbGVhc3Qgd2l0aG91dCBtZW50
aW9uaW5nIGl0IGlzIGludGVybmFsCj4gUGxlYXNlIGF2b2lkIHRvIHRha2UgbXkgd29yZHMgb3V0
IG9mIGNvbnRleHQuLi4gQXMgeW91IHJlYWQgdGhlIHNlbnRlbmNlIGFib3ZlLCB5b3UgcHJvYmFi
bHkgbm90aWNlZCB0aGF0IEEuayB3YXMgcHVibGlzaGVkIHdpdGggZGVmZWN0cyBpbiBpdCBhbmQg
cHJvYmFibHkgdGhlIHJlYXNvbnMgd2h5IGl0IGNhbid0IGJlIGZvdW5kIHRvZGF5Lgo+IAo+IEkg
ZG93bmxvYWQgYWxsIG15IHNwZWNzIGZyb20gcHVibGljIHdlYnNpdGUgdG8gYXZvaWQgcG90ZW50
aWFsIGRpc2Nsb3N1cmUgb2YgaW50ZXJuYWwgY29udGVudC4gSWYgeW91IGxvb2sgYXQgR29vZ2xl
LCB0aGUgc3BlYyB3YXMgYWN0dWFsbHkgcHVibGljIGF0IHNvbWUgcG9pbnQgKHNlZSBbMV0gZm9y
IGluc3RhbmNlKS4KCkkgdW5kZXJzdGFuZCB0aGF0LiBCdXQgbm93LCBhdCB0aGlzIHBhdGNoIHB1
YmxpY2F0aW9uIGFuZCByZXZpZXcgbW9tZW50LCB0aGUgQS5rLiBkb2N1bWVudCBpcyBub3QgYXZh
aWxhYmxlLiBBbmQgaXMgYSBiaXQgY29uZnVzaW5nLgoKPiBJbiB3aGF0IHlvdSBxdW90ZSwgSSBt
ZXJlbHkgcG9pbnRlZCBvdXQgdGhhdCBJIHNob3VsZCBub3QgaGF2ZSB1c2VkIGl0IGJlY2F1c2Ug
aXQgaXMgcHJldHR5IG9sZCAofjIgYW5kIGhhbGYgeWVhcnMpLgoKUmVmZXJyaW5nIHRoZSBtb3N0
IHVwLXRvLWRhdGUgZG9jdW1lbnQgaXMgYWx3YXkgYSBnb29kIGNob2ljZS4KCi0tIApTaW5jZXJl
bHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
