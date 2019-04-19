Return-Path: <SRS0=iVlm=SV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1DE3C282E2
	for <xen-devel@archiver.kernel.org>; Fri, 19 Apr 2019 23:20:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C038A2171F
	for <xen-devel@archiver.kernel.org>; Fri, 19 Apr 2019 23:20:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="raqWIJ9W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C038A2171F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hHcnq-0002bb-QI; Fri, 19 Apr 2019 23:20:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4FrJ=SV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hHcnp-0002bW-GR
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2019 23:20:17 +0000
X-Inumbo-ID: b07cd0b2-62f9-11e9-92d7-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b07cd0b2-62f9-11e9-92d7-bc764e045a96;
 Fri, 19 Apr 2019 23:20:16 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 480C52171F;
 Fri, 19 Apr 2019 23:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555716013;
 bh=Z+JRIXfwKYAYKAG+qOevEhp6NHl92Jo7fnffLtb/EeA=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=raqWIJ9W6U+UoknngW4pCKKDt3JhNJlchSZmdUGArv3M6RE3JoSYDTYGeMBs97O53
 R8QRsPuwbifacCGzZAFIzJ45vjuzUwT99yIJerM8aBzh6Js7ILtoT8C7A17bQhxG1u
 mRBRe6EpyJkNeZYKi+MWA6H7kM48w4vJhjgf49u8=
Date: Fri, 19 Apr 2019 16:20:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <c3716c11-6d87-4f2d-25d7-3d83537a9ca7@arm.com>
Message-ID: <alpine.DEB.2.10.1904191618390.1370@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1902261501020.20689@sstabellini-ThinkPad-X260>
 <1551222427-21749-1-git-send-email-sstabellini@kernel.org>
 <c3716c11-6d87-4f2d-25d7-3d83537a9ca7@arm.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 1/6] xen: extend XEN_DOMCTL_memory_mapping
 to handle cacheability
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 andrew.cooper3@citrix.com, JBeulich@suse.com,
 Stefano Stabellini <stefanos@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190419232003.9ERut87CPBoh1TOsrl6LBUjWYa1qikCXln6LYvNXt0k@z>

T24gV2VkLCAyNyBGZWIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gMi8yNi8xOSAxMTowNyBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gUmV1
c2UgdGhlIGV4aXN0aW5nIHBhZGRpbmcgZmllbGQgdG8gcGFzcyBjYWNoZWFiaWxpdHkgaW5mb3Jt
YXRpb24gYWJvdXQKPiA+IHRoZSBtZW1vcnkgbWFwcGluZywgc3BlY2lmaWNhbGx5LCB3aGV0aGVy
IHRoZSBtZW1vcnkgc2hvdWxkIGJlIG1hcHBlZCBhcwo+ID4gbm9ybWFsIG1lbW9yeSBvciBhcyBk
ZXZpY2UgbWVtb3J5ICh0aGlzIGlzIHdoYXQgd2UgaGF2ZSB0b2RheSkuCj4gPiAKPiA+IEFkZCBh
IGNhY2hlYWJpbGl0eSBwYXJhbWV0ZXIgdG8gbWFwX21taW9fcmVnaW9ucy4gMCBtZWFucyBkZXZp
Y2UKPiA+IG1lbW9yeSwgd2hpY2ggaXMgd2hhdCB3ZSBoYXZlIHRvZGF5Lgo+ID4gCj4gPiBPbiBB
Uk0sIG1hcCBkZXZpY2UgbWVtb3J5IGFzIHAybV9tbWlvX2RpcmVjdF9kZXYgKGFzIGl0IGlzIGFs
cmVhZHkgZG9uZQo+ID4gdG9kYXkpIGFuZCBub3JtYWwgbWVtb3J5IGFzIHAybV9yYW1fcncuCj4g
PiAKPiA+IE9uIHg4NiwgcmV0dXJuIGVycm9yIGlmIHRoZSBjYWNoZWFiaWxpdHkgcmVxdWVzdGVk
IGlzIG5vdCBkZXZpY2UgbWVtb3J5Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0
YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+Cj4gPiBDQzogSkJldWxpY2hAc3VzZS5jb20K
PiA+IENDOiBhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tCj4gPiAtLS0KPiA+ICAgeGVuL2FyY2gv
YXJtL2dpYy12Mi5jICAgICAgICAgICAgfCAgMyArKy0KPiA+ICAgeGVuL2FyY2gvYXJtL3AybS5j
ICAgICAgICAgICAgICAgfCAxOSArKysrKysrKysrKysrKysrKy0tCj4gPiAgIHhlbi9hcmNoL2Fy
bS9wbGF0Zm9ybXMvZXh5bm9zNS5jIHwgIDQgKystLQo+ID4gICB4ZW4vYXJjaC9hcm0vcGxhdGZv
cm1zL29tYXA1LmMgICB8ICA4ICsrKystLS0tCj4gPiAgIHhlbi9hcmNoL2FybS92Z2ljLXYyLmMg
ICAgICAgICAgIHwgIDIgKy0KPiA+ICAgeGVuL2FyY2gvYXJtL3ZnaWMvdmdpYy12Mi5jICAgICAg
fCAgMiArLQo+ID4gICB4ZW4vYXJjaC94ODYvaHZtL2RvbTBfYnVpbGQuYyAgICB8ICA3ICsrKysr
LS0KPiA+ICAgeGVuL2FyY2gveDg2L21tL3AybS5jICAgICAgICAgICAgfCAgNiArKysrKy0KPiA+
ICAgeGVuL2NvbW1vbi9kb21jdGwuYyAgICAgICAgICAgICAgfCAgOCArKysrKy0tLQo+ID4gICB4
ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jICAgICAgICB8ICAzICsrLQo+ID4gICB4ZW4vaW5jbHVk
ZS9wdWJsaWMvZG9tY3RsLmggICAgICB8ICA0ICsrKy0KPiA+ICAgeGVuL2luY2x1ZGUveGVuL3Ay
bS1jb21tb24uaCAgICAgfCAgMyArKy0KPiA+ICAgMTIgZmlsZXMgY2hhbmdlZCwgNDkgaW5zZXJ0
aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9h
cm0vZ2ljLXYyLmMgYi94ZW4vYXJjaC9hcm0vZ2ljLXYyLmMKPiA+IGluZGV4IGU3ZWIwMWYuLjFl
YTNkYTIgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vZ2ljLXYyLmMKPiA+ICsrKyBiL3hl
bi9hcmNoL2FybS9naWMtdjIuYwo+ID4gQEAgLTY5MCw3ICs2OTAsOCBAQCBzdGF0aWMgaW50IGdp
Y3YyX21hcF9od2Rvd25fZXh0cmFfbWFwcGluZ3Moc3RydWN0IGRvbWFpbgo+ID4gKmQpCj4gPiAg
ICAgICAgICAgICByZXQgPSBtYXBfbW1pb19yZWdpb25zKGQsIGdhZGRyX3RvX2dmbih2Mm1fZGF0
YS0+YWRkciksCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQRk5fVVAodjJt
X2RhdGEtPnNpemUpLAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtYWRkcl90
b19tZm4odjJtX2RhdGEtPmFkZHIpKTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgbWFkZHJfdG9fbWZuKHYybV9kYXRhLT5hZGRyKSwKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgQ0FDSEVBQklMSVRZX0RFVk1FTSk7Cj4gPiAgICAgICAgICAgaWYgKCByZXQg
KQo+ID4gICAgICAgICAgIHsKPiA+ICAgICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgIkdJ
Q3YyOiBNYXAgdjJtIGZyYW1lIHRvIGQlZCBmYWlsZWQuXG4iLAo+ID4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL2FybS9wMm0uYyBiL3hlbi9hcmNoL2FybS9wMm0uYwo+ID4gaW5kZXggMzBjZmIwMS4u
NWI4ZmNjNSAxMDA2NDQKPiA+IC0tLSBhL3hlbi9hcmNoL2FybS9wMm0uYwo+ID4gKysrIGIveGVu
L2FyY2gvYXJtL3AybS5jCj4gPiBAQCAtMTA2OCw5ICsxMDY4LDI0IEBAIGludCB1bm1hcF9yZWdp
b25zX3AybXQoc3RydWN0IGRvbWFpbiAqZCwKPiA+ICAgaW50IG1hcF9tbWlvX3JlZ2lvbnMoc3Ry
dWN0IGRvbWFpbiAqZCwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgZ2ZuX3Qgc3RhcnRfZ2Zu
LAo+ID4gICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIG5yLAo+ID4gLSAgICAg
ICAgICAgICAgICAgICAgIG1mbl90IG1mbikKPiA+ICsgICAgICAgICAgICAgICAgICAgICBtZm5f
dCBtZm4sCj4gPiArICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgY2FjaGVfcG9saWN5KQo+
IAo+IFJhdGhlciB0aGFuIGV4dGVuZGluZyBtYXBfbW1pb19yZWdpb25zLCBJIHdvdWxkIHByZWZl
ciBpZiB3ZSBraWxsIHRoaXMKPiBmdW5jdGlvbiAoYW5kIHVubWFwX21taW9fbW1pb19yZWdpb25z
KSBhbmQgaW5zdGVhZCB1c2UgbWFwX3JlZ2lvbnNfcDJtdC4KPiAKPiBUaGlzIG1lYW5zIHRoZSBj
b252ZXJzYXRpb24gdG8gcDJtdCBzaG91bGQgYmUgZG9uZSBpbiB0aGUgRE9NQ1RMIGhhbmRsaW5n
LgoKbWFwX3JlZ2lvbnNfcDJtdCBpcyBhbiBhcm0gc3BlY2lmaWMgZnVuY3Rpb24uIG1hcF9tbWlv
X3JlZ2lvbnMgaXMgdGhlCmNvbW1vbiBmdW5jdGlvbiBhY3Jvc3MgeDg2IGFuZCBhcm0sIGNhbGxl
ZCBmcm9tIGNvbW1vbiBjb2RlLgoKCj4gPiAgIHsKPiA+IC0gICAgcmV0dXJuIHAybV9pbnNlcnRf
bWFwcGluZyhkLCBzdGFydF9nZm4sIG5yLCBtZm4sIHAybV9tbWlvX2RpcmVjdF9kZXYpOwo+ID4g
KyAgICBwMm1fdHlwZV90IHQ7Cj4gPiArCj4gPiArICAgIHN3aXRjaCAoIGNhY2hlX3BvbGljeSAp
Cj4gPiArICAgIHsKPiA+ICsgICAgY2FzZSBDQUNIRUFCSUxJVFlfTUVNT1JZOgo+ID4gKyAgICAg
ICAgdCA9IHAybV9yYW1fcnc7Cj4gPiArICAgICAgICBicmVhazsKPiA+ICsgICAgY2FzZSBDQUNI
RUFCSUxJVFlfREVWTUVNOgo+ID4gKyAgICAgICAgdCA9IHAybV9tbWlvX2RpcmVjdF9kZXY7Cj4g
PiArICAgICAgICBicmVhazsKPiA+ICsgICAgZGVmYXVsdDoKPiA+ICsgICAgICAgIHJldHVybiAt
RU5PU1lTOwo+IAo+IFdlIHRlbmQgdG8gdXNlIEVPUE5PVFNVUFAgaW4gc3VjaCBhIGNhc2UuCgpZ
ZXMsIE9LCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
