Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE708C282DA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 20:26:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C50A20693
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 20:26:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="pk5wbWM6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C50A20693
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGr8Y-0000Co-Cf; Wed, 17 Apr 2019 20:26:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CUiA=ST=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hGr8X-0000Ci-GJ
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 20:26:29 +0000
X-Inumbo-ID: 13e7b747-614f-11e9-92d7-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 13e7b747-614f-11e9-92d7-bc764e045a96;
 Wed, 17 Apr 2019 20:26:27 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 16DA420693;
 Wed, 17 Apr 2019 20:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555532787;
 bh=wDlqr3p7+sSU6fQfKp0hzSSKcSUMojBID0rGQFoG520=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=pk5wbWM65k8I8V6+Bz77CygaqXFraBzcBhzh/qHhsTUeq8hwz9CrnLpZvimpUFTJ8
 Kf/pdQ7PZ90X4yQrkH4urHdI/zZZuVoUy/cLDiK2PK3n0sa8uxg0GHfLAQX4sWAiA2
 zH3ek1qK+2nW5NqjsMd77t2yR5d07/P9FkYDnpic=
Date: Wed, 17 Apr 2019 13:26:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190327184531.30986-7-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.10.1904171326200.1370@sstabellini-ThinkPad-X260>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-7-julien.grall@arm.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 06/12] xen/arm64: sysreg: Implement the
 32-bit helpers using the 64-bit helpers
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
Message-ID: <20190417202626.1wN1rEp5yvfZ0SFn7lT2BnP-w9D7kozTfxHq4yNlQes@z>

T24gV2VkLCAyNyBNYXIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IENsYW5nIGlzIHBpY2tp
ZXIgdGhhbiBHQ0MgZm9yIHRoZSByZWdpc3RlciBzaXplIGluIGFzbSBzdGF0ZW1lbnQuIEl0Cj4g
ZXhwZWN0cyB0aGUgcmVnaXN0ZXIgc2l6ZSB0byBtYXRjaCB0aGUgdmFsdWUgc2l6ZS4KPiAKPiBU
aGUgaW5zdHJ1Y3Rpb25zIG1zci9tcnMgYXJlIGV4cGVjdGluZyBhIDY0LWJpdCByZWdpc3Rlci4g
VGhpcyBtZWFucyB0aGUKPiBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgMzItYml0IGhlbHBlcnMgaXMg
bm90IGNvcnJlY3QuIFRoZSBlYXNpZXN0Cj4gc29sdXRpb24gaXMgdG8gaW1wbGVtZW50IHRoZSAz
Mi1iaXQgaGVscGVycyB1c2luZyB0aGUgNjQtYml0IGhlbHBlcnMuCj4gCj4gU2lnbmVkLW9mZi1i
eTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KClJldmlld2VkLWJ5OiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgoKPiAtLS0KPiAgeGVuL2lu
Y2x1ZGUvYXNtLWFybS9hcm02NC9zeXNyZWdzLmggfCAxMSArKystLS0tLS0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS94ZW4vaW5jbHVkZS9hc20tYXJtL2FybTY0L3N5c3JlZ3MuaCBiL3hlbi9pbmNsdWRlL2FzbS1h
cm0vYXJtNjQvc3lzcmVncy5oCj4gaW5kZXggMDg1ODVhOTY5ZS4uYzYwMDI5ZDM4ZiAxMDA2NDQK
PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL2FybTY0L3N5c3JlZ3MuaAo+ICsrKyBiL3hlbi9p
bmNsdWRlL2FzbS1hcm0vYXJtNjQvc3lzcmVncy5oCj4gQEAgLTU5LDE0ICs1OSw5IEBACj4gIAo+
ICAvKiBBY2Nlc3MgdG8gc3lzdGVtIHJlZ2lzdGVycyAqLwo+ICAKPiAtI2RlZmluZSBSRUFEX1NZ
U1JFRzMyKG5hbWUpICh7ICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gLSAgICB1aW50MzJf
dCBfcjsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+IC0gICAgYXNt
IHZvbGF0aWxlKCJtcnMgICUwLCAiX19zdHJpbmdpZnkobmFtZSkgOiAiPXIiIChfcikpOyAgICAg
ICAgIFwKPiAtICAgIF9yOyB9KQo+IC0jZGVmaW5lIFdSSVRFX1NZU1JFRzMyKHYsIG5hbWUpIGRv
IHsgICAgICAgICAgICAgICAgICAgIFwKPiAtICAgIHVpbnQzMl90IF9yID0gdjsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gLSAgICBhc20gdm9sYXRpbGUoIm1zciAiX19z
dHJpbmdpZnkobmFtZSkiLCAlMCIgOiA6ICJyIiAoX3IpKTsgICAgICAgXAo+IC19IHdoaWxlICgw
KQo+ICsjZGVmaW5lIFJFQURfU1lTUkVHMzIobmFtZSkgKCh1aW50MzJfdClSRUFEX1NZU1JFRzY0
KG5hbWUpKQo+ICsKPiArI2RlZmluZSBXUklURV9TWVNSRUczMih2LCBuYW1lKSBXUklURV9TWVNS
RUc2NCgodWludDY0X3QpdiwgbmFtZSkKPiAgCj4gICNkZWZpbmUgV1JJVEVfU1lTUkVHNjQodiwg
bmFtZSkgZG8geyAgICAgICAgICAgICAgICAgICAgXAo+ICAgICAgdWludDY0X3QgX3IgPSB2OyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAtLSAKPiAyLjExLjAKPiAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
