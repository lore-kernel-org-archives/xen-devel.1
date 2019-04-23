Return-Path: <SRS0=MgWH=SZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 148EEC10F03
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 17:06:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D597A21850
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 17:06:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="kzTSDLON"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D597A21850
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIyrz-0005Vv-RT; Tue, 23 Apr 2019 17:06:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DWbD=SZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hIyry-0005Vq-DG
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 17:06:10 +0000
X-Inumbo-ID: 1665d460-65ea-11e9-8706-2bd621f57437
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1665d460-65ea-11e9-8706-2bd621f57437;
 Tue, 23 Apr 2019 17:06:08 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B075821850;
 Tue, 23 Apr 2019 17:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556039168;
 bh=i2JIjq6aZqmQv7kstuBZrccA+R9sQNWobjLeh+18V/c=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=kzTSDLONeEaMkdNJaBpJTVTxUi+JRdWZL1srIKm1BwEa7hE/v6ODhR8nbhgBcoPV2
 D1k5kEj+JoiESav7hOBHHdfBDpl5MVGxwuicWbeF+Db629CAgchY99DQ5GTJJFMwrX
 j/5/0K6m7DUqpkm5w+odQmi4iMADi08L+czZz7Jo=
Date: Tue, 23 Apr 2019 10:05:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Juergen Gross <jgross@suse.com>
In-Reply-To: <20190423105457.17502-4-jgross@suse.com>
Message-ID: <alpine.DEB.2.10.1904230955190.24598@sstabellini-ThinkPad-X260>
References: <20190423105457.17502-1-jgross@suse.com>
 <20190423105457.17502-4-jgross@suse.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 3/3] xen/swiotlb: remember having called
 xen_create_contiguous_region()
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
Cc: sstabellini@kernel.org, konrad.wilk@oracle.com,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAyMyBBcHIgMjAxOSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBJbnN0ZWFkIG9mIGFs
d2F5cyBjYWxsaW5nIHhlbl9kZXN0cm95X2NvbnRpZ3VvdXNfcmVnaW9uKCkgaW4gY2FzZSB0aGUK
PiBtZW1vcnkgaXMgRE1BLWFibGUgZm9yIHRoZSB1c2VkIGRldmljZSwgZG8gc28gb25seSBpbiBj
YXNlIGl0IGhhcyBiZWVuCj4gbWFkZSBETUEtYWJsZSB2aWEgeGVuX2NyZWF0ZV9jb250aWd1b3Vz
X3JlZ2lvbigpIGJlZm9yZS4KPiAKPiBUaGlzIHdpbGwgYXZvaWQgYSBsb3Qgb2YgeGVuX2Rlc3Ry
b3lfY29udGlndW91c19yZWdpb24oKSBjYWxscyBmb3IKPiA2NC1iaXQgY2FwYWJsZSBkZXZpY2Vz
Lgo+IAo+IEFzIHRoZSBtZW1vcnkgaW4gcXVlc3Rpb24gaXMgb3duZWQgYnkgc3dpb3RsYi14ZW4g
dGhlIFBHX293bmVyX3ByaXZfMQo+IGZsYWcgb2YgdGhlIGZpcnN0IGFsbG9jYXRlZCBwYWdlIGNh
biBiZSB1c2VkIGZvciByZW1lbWJlcmluZy4KCkFsdGhvdWdoIHRoZSBwYXRjaCBsb29rcyBPSywg
dGhpcyBzZW50ZW5jZSBwdXp6bGVzIG1lLiBXaHkgZG8geW91IHNheQp0aGF0IHRoZSBtZW1vcnkg
aW4gcXVlc3Rpb24gaXMgb3duZWQgYnkgc3dpb3RsYi14ZW4/IEJlY2F1c2UgaXQgd2FzCnJldHVy
bmVkIGJ5IHhlbl9hbGxvY19jb2hlcmVudF9wYWdlcz8gQm90aCB0aGUgeDg2IGFuZCB0aGUgQXJt
CmltcGxlbWVudGF0aW9uIHJldHVybiBmcmVzaCBuZXcgbWVtb3J5LCBoZW5jZSwgaXQgc2hvdWxk
IGJlIHNhZmUgdG8gc2V0CnRoZSBQYWdlT3duZXJQcml2MSBmbGFnPwoKTXkgY29uY2VybiB3aXRo
IHRoaXMgYXBwcm9hY2ggaXMgd2l0aCB0aGUgc2VtYW50aWNzIG9mIFBHX293bmVyX3ByaXZfMS4K
SXMgYSBwYWdlIG1hcmtlZCB3aXRoIFBHX293bmVyX3ByaXZfMSBvbmx5IHN1cHBvc2VkIHRvIGJl
IHVzZWQgYnkgdGhlCm93bmVyPwoKCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jIHwgOSArKysr
KystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYyBiL2RyaXZlcnMveGVu
L3N3aW90bGIteGVuLmMKPiBpbmRleCA0M2I2ZTY1YWUyNTYuLmE3MmYxODFkOGUyMCAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jCj4gKysrIGIvZHJpdmVycy94ZW4vc3dp
b3RsYi14ZW4uYwo+IEBAIC0zMjEsNiArMzIxLDcgQEAgeGVuX3N3aW90bGJfYWxsb2NfY29oZXJl
bnQoc3RydWN0IGRldmljZSAqaHdkZXYsIHNpemVfdCBzaXplLAo+ICAJCQl4ZW5fZnJlZV9jb2hl
cmVudF9wYWdlcyhod2Rldiwgc2l6ZSwgcmV0LCAoZG1hX2FkZHJfdClwaHlzLCBhdHRycyk7Cj4g
IAkJCXJldHVybiBOVUxMOwo+ICAJCX0KPiArCQlTZXRQYWdlT3duZXJQcml2MSh2aXJ0X3RvX3Bh
Z2UocmV0KSk7Cj4gIAl9Cj4gIAltZW1zZXQocmV0LCAwLCBzaXplKTsKPiAgCXJldHVybiByZXQ7
Cj4gQEAgLTM0NCw5ICszNDUsMTEgQEAgeGVuX3N3aW90bGJfZnJlZV9jb2hlcmVudChzdHJ1Y3Qg
ZGV2aWNlICpod2Rldiwgc2l6ZV90IHNpemUsIHZvaWQgKnZhZGRyLAo+ICAJLyogQ29udmVydCB0
aGUgc2l6ZSB0byBhY3R1YWxseSBhbGxvY2F0ZWQuICovCj4gIAlzaXplID0gMVVMIDw8IChvcmRl
ciArIFhFTl9QQUdFX1NISUZUKTsKPiAgCj4gLQlpZiAoKGRldl9hZGRyICsgc2l6ZSAtIDEgPD0g
ZG1hX21hc2spICYmCj4gLQkgICAgIVdBUk5fT04ocmFuZ2Vfc3RyYWRkbGVzX3BhZ2VfYm91bmRh
cnkocGh5cywgc2l6ZSkpKQo+IC0JCXhlbl9kZXN0cm95X2NvbnRpZ3VvdXNfcmVnaW9uKHBoeXMs
IG9yZGVyKTsKPiArCWlmIChQYWdlT3duZXJQcml2MSh2aXJ0X3RvX3BhZ2UodmFkZHIpKSkgewo+
ICsJCWlmICghV0FSTl9PTihyYW5nZV9zdHJhZGRsZXNfcGFnZV9ib3VuZGFyeShwaHlzLCBzaXpl
KSkpCj4gKwkJCXhlbl9kZXN0cm95X2NvbnRpZ3VvdXNfcmVnaW9uKHBoeXMsIG9yZGVyKTsKPiAr
CQlDbGVhclBhZ2VPd25lclByaXYxKHZpcnRfdG9fcGFnZSh2YWRkcikpOwo+ICsJfQo+ICAKPiAg
CXhlbl9mcmVlX2NvaGVyZW50X3BhZ2VzKGh3ZGV2LCBzaXplLCB2YWRkciwgKGRtYV9hZGRyX3Qp
cGh5cywgYXR0cnMpOwo+ICB9CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
