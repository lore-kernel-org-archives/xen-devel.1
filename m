Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00029C10F0E
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 18:24:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C177020643
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 18:24:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="SRG31pKi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C177020643
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hHBhY-0004oQ-7S; Thu, 18 Apr 2019 18:24:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tnl2=SU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hHBhW-0004oJ-DM
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 18:23:58 +0000
X-Inumbo-ID: 20d4c64e-6207-11e9-92d7-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 20d4c64e-6207-11e9-92d7-bc764e045a96;
 Thu, 18 Apr 2019 18:23:57 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 21F5620643;
 Thu, 18 Apr 2019 18:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555611836;
 bh=W/PnzW4CBmiOGYnSkK/ySmGtMoEAtAWhlHJscTBhASw=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=SRG31pKi7mTys+zqYcVsKnsyd8vfZjgVIJBouMEoA76/JHQMRo8Yot0FWN+DgOhHn
 b8AApXPEB01IcuXG772KWW1siagKRYILWUu9J9QPXUFBVrVZmyzB8NKjBj1kAxZqcG
 5qDWXYHQYipRmF22rKIWUfaKjSgWG/xxqvFIEAO0=
Date: Thu, 18 Apr 2019 11:23:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <970bfa4e-192e-967a-b211-16dee9cb7ed8@arm.com>
Message-ID: <alpine.DEB.2.10.1904181104360.1370@sstabellini-ThinkPad-X260>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-8-julien.grall@arm.com>
 <alpine.DEB.2.10.1904171327100.1370@sstabellini-ThinkPad-X260>
 <970bfa4e-192e-967a-b211-16dee9cb7ed8@arm.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 07/12] xen/arm: cpuerrata: Match register
 size with value size in check_workaround_*
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
 Stefano Stabellini <sstabellini@kernel.org>, Andrii_Anisov@epam.com,
 Oleksandr_Tyshchenko@epam.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190418182355.jyVvzirOvY1QL1jthuqt6GZMdf4nyLP9YHGRSJ3Uesw@z>

T24gV2VkLCAxNyBBcHIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDQv
MTcvMTkgOToyOCBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gT24gV2VkLCAyNyBN
YXIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiBDbGFuZyBpcyBwaWNraWVyIHRoYW4g
R0NDIGZvciB0aGUgcmVnaXN0ZXIgc2l6ZSBpbiBhc20gc3RhdGVtZW50LiBJdAo+ID4gPiBleHBl
Y3RzIHRoZSByZWdpc3RlciBzaXplIHRvIG1hdGNoIHRoZSB2YWx1ZSBzaXplLgo+ID4gPiAKPiA+
ID4gVGhlIGFzbSBzdGF0ZW1lbnQgZXhwZWN0cyBhIDMyLWJpdCAocmVzcC4gNjQtYml0KSB2YWx1
ZSBvbiBBcm0zMgo+ID4gPiAocmVzcC4gQXJtNjQpIHdoZXJlYXMgdGhlIHZhbHVlIGlzIGEgYm9v
bGVhbiAoQ2xhbmcgY29uc2lkZXIgdG8gYmUKPiA+ID4gMzItYml0KS4KPiA+ID4gCj4gPiA+IEl0
IHdvdWxkIGJlIHBvc3NpYmxlIHRvIGltcG9zZSAzMi1iaXQgcmVnaXN0ZXIgZm9yIGJvdGggYXJj
aGl0ZWN0dXJlCj4gPiA+IGJ1dCB0aGlzIHJlcXVpcmUgdGhlIGNvZGUgdG8gdXNlIF9fT1AzMi4g
SG93ZXZlciwgaXQgZG9lcyBub3QgcmVhbGx5Cj4gPiA+IGltcHJvdmUgdGhlIGFzc2VtYmx5IGdl
bmVyYXRlZC4gSW5zdGVhZCwgcmVwbGFjZSBzd2l0Y2ggdGhlIHZhcmlhYmxlCj4gPiA+IHRvIHVz
ZSByZWdpc3Rlcl90Lgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxq
dWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICAgeGVuL2luY2x1ZGUvYXNtLWFy
bS9jcHVlcnJhdGEuaCB8IDIgKy0KPiA+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9h
c20tYXJtL2NwdWVycmF0YS5oCj4gPiA+IGIveGVuL2luY2x1ZGUvYXNtLWFybS9jcHVlcnJhdGEu
aAo+ID4gPiBpbmRleCA1NWRkZmRhMjcyLi44OGVmM2NhOTM0IDEwMDY0NAo+ID4gPiAtLS0gYS94
ZW4vaW5jbHVkZS9hc20tYXJtL2NwdWVycmF0YS5oCj4gPiA+ICsrKyBiL3hlbi9pbmNsdWRlL2Fz
bS1hcm0vY3B1ZXJyYXRhLmgKPiA+ID4gQEAgLTE0LDcgKzE0LDcgQEAgc3RhdGljIGlubGluZSBi
b29sIGNoZWNrX3dvcmthcm91bmRfIyNlcnJhdHVtKHZvaWQpCj4gPiA+IFwKPiA+ID4gICAgICAg
ICAgIHJldHVybiBmYWxzZTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAo+ID4gPiAgICAgICBlbHNlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ICAgICAgIHsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gLSAgICAgICAgYm9v
bCByZXQ7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4g
PiA+ICsgICAgICAgIHJlZ2lzdGVyX3QgcmV0OyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ICAgICAgICAgICBhc20gdm9sYXRp
bGUgKEFMVEVSTkFUSVZFKCJtb3YgJTAsICMwIiwgICAgICAgICAgICAgICAgIFwKPiA+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIm1vdiAlMCwgIzEiLCAgICAgICAgICAg
ICAgICAgXAo+ID4gCj4gPiBUaGlzIGlzIE9LLiBDb3VsZCB5b3UgcGxlYXNlIGFsc28gY2hhbmdl
IHRoZSByZXR1cm4gc3RhdGVtZW50IGJlbG93Pwo+ID4gTWF5YmUgc29tZXRoaW5nIGxpa2U6Cj4g
PiAKPiA+ICAgIHJldHVybiB1bmxpa2VseSghIXJldCk7Cj4gV2h5PyBUaGUgY29tcGlsZXIgd2ls
bCBpbXBsaWNpdGx5IGNvbnZlcnQgdGhlIGludCB0byBib29sLiAwIHdpbGwgdHVybiB0bwo+IGZh
bHNlLCBhbGwgdGhlIG90aGVyIHdpbGwgYmUgdHJ1ZS4KPiAKPiBXZSBhY3R1YWxseSBiZWVuIGFj
dGl2ZWx5IHJlbW92aW5nICEhIHdoZW4gdGhlIHR5cGUgaXMgYm9vbCAoc2VlIHRoZSBleGFtcGxl
Cj4gaW4gZ2V0X3BhZ2VkX2ZyYW1lIGluIGNvbW1vbi9ncmFudF90YWJsZS5jKS4KClJlYWxseT8g
VG9vIGJhZCwgSSBsb3ZlZCB0aGUgZXhwbGljaXQgY29udmVyc2lvbnMgdG8gYm9vbC4gVGhpcyBp
cyBhCm1hdHRlciBvZiBjb2RlIHN0eWxlLCBub3QgY29ycmVjdG5lc3MsIHNvIHVzdWFsbHkgSSB3
b3VsZG4ndCBjYXJlIG11Y2guCkJ1dCBJIHdlbnQgdG8gcmVhZCBNSVNSQS1DIHRvIGZpZ3VyZSBv
dXQgaWYgdGhlcmUgYXJlIGFueSBkaWZmZXJlbmNlcwpmcm9tIHRoYXQgcG9pbnQgb2Ygdmlldy4g
RnJvbSBSdWxlIDEwLjMsIGl0IGxvb2tzIGxpa2UgaXQgaXMgbm90CmNvbXBsaWFudCwgYmVjYXVz
ZSB0aGV5IHNheSB0aGF0OgoKICBib29sX3QgYmxhID0gMDsKCmlzIG5vdCBNSVNSQS1DIGNvbXBs
aWFudC4gV2hpbGU6CgogIGludCBjID0gMTsKICBib29sX3QgYmxhID0gYyA9PSAwOwoKaXMgY29t
cGxpYW50LiBTbywgaWYgSSByZWFkIHRoaXMgcmlnaHQ6CgogIHJldHVybiAhIXJldCAvL2NvbXBs
aWFudAogIHJldHVybiByZXQ7ICAvL25vdCBjb21wbGlhbnQKCkkgYW0gbm90IDEwMCUgc3VyZSB0
aG91Z2guCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
