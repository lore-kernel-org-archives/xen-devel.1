Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35A3AC282DA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 20:35:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3207217F4
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 20:35:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="mymUnsld"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3207217F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGrHP-0001QP-53; Wed, 17 Apr 2019 20:35:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CUiA=ST=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hGrHN-0001QK-FS
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 20:35:37 +0000
X-Inumbo-ID: 5aa19068-6150-11e9-9e71-f773a13c9e70
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5aa19068-6150-11e9-9e71-f773a13c9e70;
 Wed, 17 Apr 2019 20:35:36 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3B86E217F4;
 Wed, 17 Apr 2019 20:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555533335;
 bh=aePhElk4keX4rtT3mQDH5YLvGaH/QQQuOcLwrb3i8yU=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=mymUnsldEf645BrX/je9T55Z5mo+FwSX7Px6Puv8sivBjBq9EFY7FqAmaxr00qeC9
 nzN11JoPVjmGm6wGpuStEh8jhyx3rOpBttiVMX+KzLWpeWFLbqn99bOmmQWtko9Z+p
 D/4RrRTqpbHL1U+ui7pN5ag3hZocBGZ/3S0haOCQ=
Date: Wed, 17 Apr 2019 13:35:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190327184531.30986-13-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.10.1904171335190.1370@sstabellini-ThinkPad-X260>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-13-julien.grall@arm.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 12/12] xen/arm64: __cmpxchg and __cmpxchg_mb
 should always be inline
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
Cc: Artem_Mygaiev@epam.com, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, Andrii_Anisov@epam.com, Oleksandr_Tyshchenko@epam.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190417203534.ccmcc-C0Jky7LZlvYUxI5srJt1Z1K4xoLhuabLNf6sM@z>

T24gV2VkLCAyNyBNYXIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEN1cnJlbnRseSBfX2Nt
cHhjaGdfbWIgYW5kIF9fY21weGNoZyBhcmUgb25seSBtYXJrZWQgaW5saW5lLiBUaGUKPiBjb21w
aWxlciBpcyBmcmVlIHRvIGRlY2lkZSB0byBub3QgaG9ub3IgdGhlIGlubGluZS4gVGhpcyB3aWxs
IHJlc3VsdCB0bwo+IGdlbmVyYXRlIGNvZGUgdXNlIF9fYmFkX2NtcHhjaGcgYW5kIGxlYWQgYSBs
aW5rIGZhaWx1cmUuCj4gCj4gVGhpcyB3YXMgY2F1Z2h0IGJ5IENsYW5nIDguMC4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKUmV2aWV3ZWQt
Ynk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCgo+IC0tLQo+
ICB4ZW4vaW5jbHVkZS9hc20tYXJtL2FybTY0L2NtcHhjaGcuaCB8IDEwICsrKysrKy0tLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZm
IC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9hcm02NC9jbXB4Y2hnLmggYi94ZW4vaW5jbHVk
ZS9hc20tYXJtL2FybTY0L2NtcHhjaGcuaAo+IGluZGV4IGFlNDJiMmY1ZmYuLjM1OTI3MTE3M2Ug
MTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9hcm02NC9jbXB4Y2hnLmgKPiArKysg
Yi94ZW4vaW5jbHVkZS9hc20tYXJtL2FybTY0L2NtcHhjaGcuaAo+IEBAIC02Myw4ICs2Myw5IEBA
IHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBfX3hjaGcodW5zaWduZWQgbG9uZyB4LCB2b2xh
dGlsZSB2b2lkICpwdHIsIGludCBzaXplCj4gIAo+ICBleHRlcm4gdm9pZCBfX2JhZF9jbXB4Y2hn
KHZvbGF0aWxlIHZvaWQgKnB0ciwgaW50IHNpemUpOwo+ICAKPiAtc3RhdGljIGlubGluZSB1bnNp
Z25lZCBsb25nIF9fY21weGNoZyh2b2xhdGlsZSB2b2lkICpwdHIsIHVuc2lnbmVkIGxvbmcgb2xk
LAo+IC0JCQkJICAgICAgdW5zaWduZWQgbG9uZyBuZXcsIGludCBzaXplKQo+ICtzdGF0aWMgYWx3
YXlzX2lubGluZSB1bnNpZ25lZCBsb25nIF9fY21weGNoZyh2b2xhdGlsZSB2b2lkICpwdHIsCj4g
KwkJCQkJICAgICB1bnNpZ25lZCBsb25nIG9sZCwKPiArCQkJCQkgICAgIHVuc2lnbmVkIGxvbmcg
bmV3LCBpbnQgc2l6ZSkKPiAgewo+ICAJdW5zaWduZWQgbG9uZyBvbGR2YWwgPSAwLCByZXM7Cj4g
IAo+IEBAIC0xMzcsOCArMTM4LDkgQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIF9fY21w
eGNoZyh2b2xhdGlsZSB2b2lkICpwdHIsIHVuc2lnbmVkIGxvbmcgb2xkLAo+ICAJcmV0dXJuIG9s
ZHZhbDsKPiAgfQo+ICAKPiAtc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIF9fY21weGNoZ19t
Yih2b2xhdGlsZSB2b2lkICpwdHIsIHVuc2lnbmVkIGxvbmcgb2xkLAo+IC0JCQkJCSB1bnNpZ25l
ZCBsb25nIG5ldywgaW50IHNpemUpCj4gK3N0YXRpYyBhbHdheXNfaW5saW5lIHVuc2lnbmVkIGxv
bmcgX19jbXB4Y2hnX21iKHZvbGF0aWxlIHZvaWQgKnB0ciwKPiArCQkJCQkJdW5zaWduZWQgbG9u
ZyBvbGQsCj4gKwkJCQkJCXVuc2lnbmVkIGxvbmcgbmV3LCBpbnQgc2l6ZSkKPiAgewo+ICAJdW5z
aWduZWQgbG9uZyByZXQ7Cj4gIAo+IC0tIAo+IDIuMTEuMAo+IAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
