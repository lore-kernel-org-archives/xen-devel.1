Return-Path: <SRS0=kbZc=SS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7802EC10F13
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 22:07:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D85720880
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 22:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D85720880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGWEh-0007dH-8G; Tue, 16 Apr 2019 22:07:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jU7w=SS=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hGWEg-0007dC-0E
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 22:07:26 +0000
X-Inumbo-ID: 03df948b-6094-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 03df948b-6094-11e9-92d7-bc764e045a96;
 Tue, 16 Apr 2019 22:07:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BF3615A2;
 Tue, 16 Apr 2019 15:07:24 -0700 (PDT)
Received: from [10.37.12.51] (unknown [10.37.12.51])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4EA623F59C;
 Tue, 16 Apr 2019 15:07:23 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190128155909.14289-1-julien.grall@arm.com>
 <alpine.DEB.2.10.1904161444520.1370@sstabellini-ThinkPad-X260>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <1ba05c55-5449-98a9-713b-d932a1f21b4c@arm.com>
Date: Tue, 16 Apr 2019 23:07:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.10.1904161444520.1370@sstabellini-ThinkPad-X260>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-next] xen/arm: irq: Don't use
 _IRQ_PENDING when handling host interrupt
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
Cc: xen-devel@lists.xenproject.org, andre.przywara@arm.com,
 andrii.anisov@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190416220721.fV7AxR21QK1DUl_7o41umDr4PdKK6GAP_3zHuPJuRCU@z>

SGkgU3RlZmFubywKCk9uIDQvMTYvMTkgMTA6NTEgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBNb24sIDI4IEphbiAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IFdoaWxlIFNQ
SXMgYXJlIHNoYXJlZCBiZXR3ZWVuIENQVSwgaXQgaXMgbm90IHBvc3NpYmxlIHRvIHJlY2VpdmUg
dGhlCj4+IHNhbWUgaW50ZXJydXB0cyBvbiBhIGRpZmZlcmVudCBDUFUgd2hpbGUgdGhlIGludGVy
cnVwdCBpcyBpbiBhY3RpdmUKPj4gc3RhdGUuIFRoZSBkZWFjdGl2YXRpb24gb2YgdGhlIGludGVy
cnVwdCBpcyBkb25lIGF0IHRoZSBlbmQgb2YgdGhlCj4+IGhhbmRsaW5nLgo+Pgo+PiBUaGlzIG1l
YW5zIHRoZSBfSVJRX1BFTkRJTkcgbG9naWMgaXMgdW5lY2Vzc2FyeSBvbiBBcm0gYXMgYSBzYW1l
Cj4+IGludGVycnVwdCBjYW4gbmV2ZXIgY29tZSB1cCB3aGlsZSBpbiB0aGUgbG9vcC4gU28gcmVt
b3ZlIGl0IHRvCj4+IHNpbXBsaWZ5IHRoZSBpbnRlcnJ1cHQgaGFuZGxlIGNvZGUuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4+IC0tLQo+
PiAgIHhlbi9hcmNoL2FybS9pcnEuYyB8IDMyICsrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygt
KQo+Pgo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2lycS5jIGIveGVuL2FyY2gvYXJtL2ly
cS5jCj4+IGluZGV4IGM1MWNmMzMzY2UuLjM4Nzc2NTdhNTIgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9h
cmNoL2FybS9pcnEuYwo+PiArKysgYi94ZW4vYXJjaC9hcm0vaXJxLmMKPj4gQEAgLTE5OSw2ICsx
OTksNyBAQCBpbnQgcmVxdWVzdF9pcnEodW5zaWduZWQgaW50IGlycSwgdW5zaWduZWQgaW50IGly
cWZsYWdzLAo+PiAgIHZvaWQgZG9fSVJRKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzLCB1bnNp
Z25lZCBpbnQgaXJxLCBpbnQgaXNfZmlxKQo+PiAgIHsKPj4gICAgICAgc3RydWN0IGlycV9kZXNj
ICpkZXNjID0gaXJxX3RvX2Rlc2MoaXJxKTsKPj4gKyAgICBzdHJ1Y3QgaXJxYWN0aW9uICphY3Rp
b247Cj4+ICAgCj4+ICAgICAgIHBlcmZjX2luY3IoaXJxcyk7Cj4+ICAgCj4+IEBAIC0yNDIsMzUg
KzI0MywyMiBAQCB2b2lkIGRvX0lSUShzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywgdW5zaWdu
ZWQgaW50IGlycSwgaW50IGlzX2ZpcSkKPj4gICAgICAgICAgIGdvdG8gb3V0X25vX2VuZDsKPj4g
ICAgICAgfQo+PiAgIAo+PiAtICAgIHNldF9iaXQoX0lSUV9QRU5ESU5HLCAmZGVzYy0+c3RhdHVz
KTsKPj4gLQo+PiAtICAgIC8qCj4+IC0gICAgICogU2luY2Ugd2Ugc2V0IFBFTkRJTkcsIGlmIGFu
b3RoZXIgcHJvY2Vzc29yIGlzIGhhbmRsaW5nIGEgZGlmZmVyZW50Cj4+IC0gICAgICogaW5zdGFu
Y2Ugb2YgdGhpcyBzYW1lIGlycSwgdGhlIG90aGVyIHByb2Nlc3NvciB3aWxsIHRha2UgY2FyZSBv
ZiBpdC4KPj4gLSAgICAgKi8KPj4gLSAgICBpZiAoIHRlc3RfYml0KF9JUlFfRElTQUJMRUQsICZk
ZXNjLT5zdGF0dXMpIHx8Cj4+IC0gICAgICAgICB0ZXN0X2JpdChfSVJRX0lOUFJPR1JFU1MsICZk
ZXNjLT5zdGF0dXMpICkKPj4gKyAgICBpZiAoIHRlc3RfYml0KF9JUlFfRElTQUJMRUQsICZkZXNj
LT5zdGF0dXMpICkKPj4gICAgICAgICAgIGdvdG8gb3V0Owo+IAo+IEl0IGlzIGEgZ29vZCBpZGVh
IHRvIHJlbW92ZSB0aGUgSVJRX1BFTkRJTkcgbG9naWMsIHRoYXQgaXMgT0suCj4gCj4gCj4gSG93
ZXZlciwgYXJlIHdlIHN1cmUgdGhhdCB3ZSB3YW50IHRvIHJlbW92ZSB0aGUgX0lSUV9JTlBST0dS
RVNTIGNoZWNrCj4gdG9vPyBJUlEgaGFuZGxlcnMgc2hvdWxkbid0IGJlIGNhbGxlZCB0d2ljZSBp
biBhIHJvdy4gR2l2ZW4gdGhhdAo+IF9JUlFfSU5QUk9HUkVTUyBjYW4gYmUgc2V0IG1hbnVhbGx5
IChnaWN2Ml9zZXRfYWN0aXZlX3N0YXRlKSBpdCBzZWVtcyBpdAo+IHdvdWxkIGJlIGEgZ29vZCBp
ZGVhIHRvIGtlZXAgdGhlIGNoZWNrIGFueXdheT8KCnNldF9hY3RpdmVfc3RhdGUgaXMgb25seSB1
c2VkIGJ5IHRoZSB2R0lDIHRvIHJlcGxpY2F0ZSBzdGF0ZSBmcm9tIG9mIHRoZSAKdmlydHVhbCBp
bnRlcnJ1cHQgdG8gdGhlIHBoeXNpY2FsIGludGVycnVwdC4gV2UgZG9uJ3QgaGF2ZSB0aGUgdmly
dHVhbCAKaW50ZXJydXB0IGluIHRoaXMgcGF0aCAoc2VlIGFib3ZlKS4KCkFueSBvdGhlciB1c2Vy
IChlLmcgaW50ZXJydXB0cyByb3V0ZWQgdG8gWGVuKSB3b3VsZCBiZSBwcmV0dHkgYnJva2VuLiBB
dCAKYmVzdCB5b3Ugd291bGQgYnJlYWsgdGhlIGludGVycnVwdCBmbG93LiBBdCB3b3JzdCwgeW91
IG1heSBuZXZlciByZWNlaXZlIAp0aGUgaW50ZXJydXB0IGFnYWluLgoKU28gSSB0aGluayB3ZSBj
YW4gZHJvcCBfSVJRX1BST0dSRVNTIGhlcmUuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
