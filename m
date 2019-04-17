Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EB3FC282DA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 20:21:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDFBA206BA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 20:21:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="SYFOtxil"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDFBA206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGr2z-0008N2-Dj; Wed, 17 Apr 2019 20:20:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CUiA=ST=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hGr2z-0008Mx-35
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 20:20:45 +0000
X-Inumbo-ID: 46eb2ada-614e-11e9-92d7-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 46eb2ada-614e-11e9-92d7-bc764e045a96;
 Wed, 17 Apr 2019 20:20:44 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DD620206BA;
 Wed, 17 Apr 2019 20:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555532443;
 bh=Q6+E+XpjwbKjaW8qgj+MRODrNDvwgSYnGsl6QhGNYTg=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=SYFOtxil0gwGwSGgBDai/v8QYUdJAPk45z2FJ2HDW9IppJu3xlD2tUS+uCBEpTH0E
 nUWwwDMGzuKHFB7kslWEh/Z79uXnziNbf+PxxL4wAtTizEouKYoCh+Yo/5VIwPWyQh
 mfmElyqjSm77EWvD+EQvMD7i+6L6UdS01QtD4MoU=
Date: Wed, 17 Apr 2019 13:20:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190327184531.30986-4-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.10.1904171320300.1370@sstabellini-ThinkPad-X260>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-4-julien.grall@arm.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 03/12] xen/arm: zynqmp: Fix header guard for
 xilinx-zynqmp-eemi.h
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
Message-ID: <20190417202042.WsjviIq0J3GOtjnb43NL_hfkdWeJtPiqon9SczkahkQ@z>

T24gV2VkLCAyNyBNYXIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSBoZWFkZXIgZ3Vh
cmQgZm9yIHhpbGlueC16eW5xbXAtZWVtaS5oIGlzIG5vdCBmb2xsb3dlZCBieSBhICNkZWZpbmUK
PiBvZiB0aGUgbWFjcm8gdXNlZCBpbiB0aGUgZ3VhcmQuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVs
aWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkFja2VkLWJ5OiBTdGVmYW5vIFN0YWJl
bGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgoKPiAtLS0KPiAgeGVuL2luY2x1ZGUvYXNt
LWFybS9wbGF0Zm9ybXMveGlsaW54LXp5bnFtcC1lZW1pLmggfCAyICstCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4v
aW5jbHVkZS9hc20tYXJtL3BsYXRmb3Jtcy94aWxpbngtenlucW1wLWVlbWkuaCBiL3hlbi9pbmNs
dWRlL2FzbS1hcm0vcGxhdGZvcm1zL3hpbGlueC16eW5xbXAtZWVtaS5oCj4gaW5kZXggNzJhYWRm
N2E0NC4uY2YyNWE5MDE0ZCAxMDA2NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL3BsYXRm
b3Jtcy94aWxpbngtenlucW1wLWVlbWkuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vcGxh
dGZvcm1zL3hpbGlueC16eW5xbXAtZWVtaS5oCj4gQEAgLTEyLDcgKzEyLDcgQEAKPiAgICovCj4g
IAo+ICAjaWZuZGVmIF9fQVNNX0FSTV9QTEFURk9STVNfWllOUU1QX0gKPiAtI2RlZmluZSBfX0FT
TV9BU01fUExBVEZPUk1TX1pZTlFNUF9ICj4gKyNkZWZpbmUgX19BU01fQVJNX1BMQVRGT1JNU19a
WU5RTVBfSAo+ICAKPiAgI2luY2x1ZGUgPGFzbS9wcm9jZXNzb3IuaD4KPiAgI2luY2x1ZGUgPGFz
bS9zbWNjYy5oPgo+IC0tIAo+IDIuMTEuMAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
