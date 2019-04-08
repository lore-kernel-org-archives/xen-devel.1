Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8553EC282DD
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 06:17:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 517B120880
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 06:17:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ClpryB+z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 517B120880
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDNaa-0000ms-7Z; Mon, 08 Apr 2019 06:17:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+VUF=SK=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1hDNaY-0000mn-K7
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 06:17:02 +0000
X-Inumbo-ID: eb71524f-59c5-11e9-92d7-bc764e045a96
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id eb71524f-59c5-11e9-92d7-bc764e045a96;
 Mon, 08 Apr 2019 06:17:01 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id q66so10080550ljq.7
 for <xen-devel@lists.xenproject.org>; Sun, 07 Apr 2019 23:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=POXtVBy5BSbnfnKmYq80Yc2/k/FX8u0JjI+SD6G5V0U=;
 b=ClpryB+zz/ldY28/hjRyTYvkiU3pZtp40QbASAkv8q9Pw6FiXt7ADFfk+ItFZSkl4k
 HTWipVgt/mKPEatTBNhQ5OvGdoxkLOXGwu+ZALei9WIfQkczyFM4z8cNf1FxUf/YPAhC
 XVMFv7Ua9+6gVmNsYqvVmsynDYuS9hEp1Ua6laZ6IR0/C4oOUJ0d68rDZHKf6Hnwgg3C
 9YTynpSa6RcN0W609aFfPfRqwQvrQTKDiWfeMFTOtS0888wleByFeRR066zW4IAtUI1a
 UDO9NQOKhdD1VyHsJD7Oz6R4sRq1jg+yKRfDivYoN35YbwYfGj46Hz5xloOg6Jy6GHKV
 iWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=POXtVBy5BSbnfnKmYq80Yc2/k/FX8u0JjI+SD6G5V0U=;
 b=JO5R3w37R6U2ibdyJVishbtpyraaMnmvqKxpSpJ7aDqA5HJ4twUYHigs1NIZQC+uv9
 1QHIe5flUaCCu5vaZ+6qc54uEWooC1010vmynzl+zb1jVpCHB9BVQBvx4O/g4xVQPYNS
 Et9twEKwuKyMYUIVmCe/7/ymzRc1Vbuf4vbDewN30PzNyq2WVraf/+4WEoVmhHDM1iM5
 EWHg9PJHF8y3YaKxZk/9vPX3FWNQe09gKRBdW9E7FIv/kMMXhwKRTDoqX0hMvuTS42ki
 3Yia571osLy7uDKSVb00ixinHr4TJ3F+GlMkTicInpIsI9ydGJLjhPwH74lWFtACEsrO
 8xIw==
X-Gm-Message-State: APjAAAWKYWYzuXSAwqKfpFymlDkn/d/ZKmsg3AehSvZZq2kroQ1DYUjZ
 wLx5uuKrkIDaBA9lpX6pWtg=
X-Google-Smtp-Source: APXvYqwV6LVKUYHETjj8q8nXCTatAVp4XTK0JFt8L3y/4Bl2/FAM4SeBlpqUHyP6dlndK7gIGGoMtg==
X-Received: by 2002:a2e:74f:: with SMTP id i15mr9539553ljd.156.1554704219160; 
 Sun, 07 Apr 2019 23:16:59 -0700 (PDT)
Received: from [10.17.182.20] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 b14sm6329289ljf.53.2019.04.07.23.16.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 07 Apr 2019 23:16:58 -0700 (PDT)
To: "Oleksandr_Andrushchenko@epam.com" <Oleksandr_Andrushchenko@epam.com>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 konrad.wilk@oracle.com, boris.ostrovsky@oracle.com, mchehab@kernel.org,
 linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
 koji.matsuoka.xm@renesas.com, hverkuil@xs4all.nl
References: <20190322073742.14639-1-andr2000@gmail.com>
 <20190322073742.14639-2-andr2000@gmail.com>
 <aa30b072-2ed2-beb6-39a2-94c1220f5d43@suse.com>
 <05d63963-e433-4e3b-5313-37befe4a572f@gmail.com>
From: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <4fe07393-ad09-a2eb-474c-7b52bc188859@gmail.com>
Date: Mon, 8 Apr 2019 09:16:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <05d63963-e433-4e3b-5313-37befe4a572f@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 1/1] cameraif: add ABI for para-virtual
 camera
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190408061657.f58mt1NXdba3LXMiGaqtM8JBR8vLUzTu6p8o40R4aok@z>

Ck9uIDQvMi8xOSA4OjM3IEFNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPiBPbiA0
LzEvMTkgOTozNSBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24gMjIvMDMvMjAxOSAwODoz
NywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4+PiBGcm9tOiBPbGVrc2FuZHIgQW5k
cnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+Cj4+Pgo+Pj4gVGhp
cyBpcyB0aGUgQUJJIGZvciB0aGUgdHdvIGhhbHZlcyBvZiBhIHBhcmEtdmlydHVhbGl6ZWQKPj4+
IGNhbWVyYSBkcml2ZXIgd2hpY2ggZXh0ZW5kcyBYZW4ncyByZWFjaCBtdWx0aW1lZGlhIGNhcGFi
aWxpdGllcyBldmVuCj4+PiBmYXJ0aGVyIGVuYWJsaW5nIGl0IGZvciB2aWRlbyBjb25mZXJlbmNp
bmcsIEluLVZlaGljbGUgSW5mb3RhaW5tZW50LAo+Pj4gaGlnaCBkZWZpbml0aW9uIG1hcHMgZXRj
Lgo+Pj4KPj4+IFRoZSBpbml0aWFsIGdvYWwgaXMgdG8gc3VwcG9ydCBtb3N0IG5lZWRlZCBmdW5j
dGlvbmFsaXR5IHdpdGggdGhlCj4+PiBmaW5hbCBpZGVhIHRvIG1ha2UgaXQgcG9zc2libGUgdG8g
ZXh0ZW5kIHRoZSBwcm90b2NvbCBpZiBuZWVkIGJlOgo+Pj4KPj4+IDEuIFByb3ZpZGUgbWVhbnMg
Zm9yIGJhc2UgdmlydHVhbCBkZXZpY2UgY29uZmlndXJhdGlvbjoKPj4+IMKgIC0gcGl4ZWwgZm9y
bWF0cwo+Pj4gwqAgLSByZXNvbHV0aW9ucwo+Pj4gwqAgLSBmcmFtZSByYXRlcwo+Pj4gMi4gU3Vw
cG9ydCBiYXNpYyBjYW1lcmEgY29udHJvbHM6Cj4+PiDCoCAtIGNvbnRyYXN0Cj4+PiDCoCAtIGJy
aWdodG5lc3MKPj4+IMKgIC0gaHVlCj4+PiDCoCAtIHNhdHVyYXRpb24KPj4+IDMuIFN1cHBvcnQg
c3RyZWFtaW5nIGNvbnRyb2wKPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVz
aGNoZW5rbyAKPj4+IDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KPj4gUmV2aWV3
ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiBUaGFuayB5b3UsIGlzIGl0
IGdvb2QgZm9yIGluY2x1c2lvbiBpbiBYZW4/CnBpbmcKPj4KPj4gSnVlcmdlbgo+Pgo+CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
