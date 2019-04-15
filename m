Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A495C10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 21:57:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3178206BA
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 21:57:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="icH1Wui6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3178206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hG9aa-0007Al-Ce; Mon, 15 Apr 2019 21:56:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Ip/=SR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hG9aZ-0007Ag-8C
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 21:56:31 +0000
X-Inumbo-ID: 527db000-5fc9-11e9-92d7-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 527db000-5fc9-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 21:56:29 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6314F20854;
 Mon, 15 Apr 2019 21:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555365358;
 bh=UJg1h2+oUGpFqCaROoxNMBIccIORvHYKe3vKeGFLbao=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=icH1Wui62Zm+guPc8lYyvyIzDczNVK/kpSpT//QOIozvEjc1WpJZRBzEGw6iqhyXQ
 QxIHw8MkMhvlrNQzJLju2bNV8cCuNTR09XkLXlaC8Tcn6TmQlOGFz8FOcC6A/Funrf
 uepFDBAdjMLhPqbNWtuhEKjCK6YCtde/+dlVq4yw=
Date: Mon, 15 Apr 2019 14:55:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190218113600.9540-2-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.10.1904151453080.29275@sstabellini-ThinkPad-X260>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-2-julien.grall@arm.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH for-next 1/9] xen/arm: Use mfn_to_pdx
 instead of pfn_to_pdx when possible
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
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190415215557.4Qx_W1CRlKsgdy_OLilaDiBptyHm5fL0oR2wnNFdic4@z>

T24gTW9uLCAxOCBGZWIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IG1mbl90b19wZHggYWRk
cyBtb3JlIHNhZmV0eSB0aGFuIHBmbl90b19wZHguIFJlcGxhY2UgYWxsIGJ1dCBvbiBwbGFjZSBp
bgo+IHRoZSBBcm0gY29kZSB0byB1c2UgdGhlIGZvcm1lci4KClRoaXMgaXMgZ29vZCBidXQgbWF5
YmUgd2UgY2FuIGdvIGV2ZW4gZnVydGhlci4KCllvdSBzaG91bGQgYWxzbyBiZSBhYmxlIHRvIHJl
cGxhY2Ugb25lIGNhbGwgc2l0ZSBvZiBwZm5fdG9fcGR4IGluCm1mbl92YWxpZCBhbmQgdGhlIG9u
ZSBpbiBtYWRkcl90b192aXJ0LiBTb21ldGhpbmcgbGlrZSB0aGlzOgoKCmRpZmYgLS1naXQgYS94
ZW4vaW5jbHVkZS9hc20tYXJtL21tLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL21tLmgKaW5kZXgg
ZWFmYTI2Zi4uYjM0NTVlYSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oCisr
KyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaApAQCAtMjA5LDcgKzIwOSw3IEBAIHN0YXRpYyBp
bmxpbmUgdm9pZCBfX2lvbWVtICppb3JlbWFwX3djKHBhZGRyX3Qgc3RhcnQsIHNpemVfdCBsZW4p
CiAvKiBYWFggLS0gYWNjb3VudCBmb3IgYmFzZSAqLwogI2RlZmluZSBtZm5fdmFsaWQobWZuKSAg
ICAgICAgKHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAog
ICAgIHVuc2lnbmVkIGxvbmcgX19tX2ZfbiA9IG1mbl94KG1mbik7ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXAotICAgIGxpa2VseShwZm5fdG9fcGR4KF9fbV9mX24pID49
IGZyYW1ldGFibGVfYmFzZV9wZHggJiYgX19tZm5fdmFsaWQoX19tX2ZfbikpOyBcCisgICAgbGlr
ZWx5KG1mbl90b19wZHgobWZuKSA+PSBmcmFtZXRhYmxlX2Jhc2VfcGR4ICYmIF9fbWZuX3ZhbGlk
KF9fbV9mX24pKTsgXAogfSkKIAogLyogQ29udmVydCBiZXR3ZWVuIG1hY2hpbmUgZnJhbWUgbnVt
YmVycyBhbmQgcGFnZS1pbmZvIHN0cnVjdHVyZXMuICovCkBAIC0yNTMsNyArMjUzLDcgQEAgc3Rh
dGljIGlubGluZSB2b2lkICptYWRkcl90b192aXJ0KHBhZGRyX3QgbWEpCiAjZWxzZQogc3RhdGlj
IGlubGluZSB2b2lkICptYWRkcl90b192aXJ0KHBhZGRyX3QgbWEpCiB7Ci0gICAgQVNTRVJUKHBm
bl90b19wZHgobWEgPj4gUEFHRV9TSElGVCkgPCAoRElSRUNUTUFQX1NJWkUgPj4gUEFHRV9TSElG
VCkpOworICAgIEFTU0VSVChtZm5fdG9fcGR4KG1hZGRyX3RvX21mbihtYSkpIDwgKERJUkVDVE1B
UF9TSVpFID4+IFBBR0VfU0hJRlQpKTsKICAgICByZXR1cm4gKHZvaWQgKikoWEVOSEVBUF9WSVJU
X1NUQVJUIC0KICAgICAgICAgICAgICAgICAgICAgbWZuX3RvX21hZGRyKHhlbmhlYXBfbWZuX3N0
YXJ0KSArCiAgICAgICAgICAgICAgICAgICAgICgobWEgJiBtYV92YV9ib3R0b21fbWFzaykgfAoK
Cgo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IC0tLQo+ICB4ZW4vYXJjaC9hcm0vbW0uYyAgICAg
ICAgfCAyICstCj4gIHhlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaCB8IDYgKysrLS0tCj4gIDIgZmls
ZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vbW0uYyBiL3hlbi9hcmNoL2FybS9tbS5jCj4gaW5kZXggMDFhZTJj
Y2NjMC4uYmU1MzM4YmI0YyAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vbW0uYwo+ICsrKyBi
L3hlbi9hcmNoL2FybS9tbS5jCj4gQEAgLTg4Niw3ICs4ODYsNyBAQCB2b2lkIF9faW5pdCBzZXR1
cF9mcmFtZXRhYmxlX21hcHBpbmdzKHBhZGRyX3QgcHMsIHBhZGRyX3QgcGUpCj4gICAgICBpbnQg
aTsKPiAgI2VuZGlmCj4gIAo+IC0gICAgZnJhbWV0YWJsZV9iYXNlX3BkeCA9IHBmbl90b19wZHgo
cHMgPj4gUEFHRV9TSElGVCk7Cj4gKyAgICBmcmFtZXRhYmxlX2Jhc2VfcGR4ID0gbWZuX3RvX3Bk
eChtYWRkcl90b19tZm4ocHMpKTsKPiAgICAgIC8qIFJvdW5kIHVwIHRvIDJNIG9yIDMyTSBib3Vu
ZGFyeSwgYXMgYXBwcm9wcmlhdGUuICovCj4gICAgICBmcmFtZXRhYmxlX3NpemUgPSBST1VORFVQ
KGZyYW1ldGFibGVfc2l6ZSwgbWFwcGluZ19zaXplKTsKPiAgICAgIGJhc2VfbWZuID0gYWxsb2Nf
Ym9vdF9wYWdlcyhmcmFtZXRhYmxlX3NpemUgPj4gUEFHRV9TSElGVCwgMzI8PCgyMC0xMikpOwo+
IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL21tLmggYi94ZW4vaW5jbHVkZS9hc20t
YXJtL21tLmgKPiBpbmRleCBlYWZhMjZmNTZlLi43YjZhYWY1ZTNmIDEwMDY0NAo+IC0tLSBhL3hl
bi9pbmNsdWRlL2FzbS1hcm0vbW0uaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaAo+
IEBAIC0yMjUsNyArMjI1LDcgQEAgc3RhdGljIGlubGluZSB2b2lkIF9faW9tZW0gKmlvcmVtYXBf
d2MocGFkZHJfdCBzdGFydCwgc2l6ZV90IGxlbikKPiAgLyogQ29udmVydCBiZXR3ZWVuIGZyYW1l
IG51bWJlciBhbmQgYWRkcmVzcyBmb3JtYXRzLiAgKi8KPiAgI2RlZmluZSBwZm5fdG9fcGFkZHIo
cGZuKSAoKHBhZGRyX3QpKHBmbikgPDwgUEFHRV9TSElGVCkKPiAgI2RlZmluZSBwYWRkcl90b19w
Zm4ocGEpICAoKHVuc2lnbmVkIGxvbmcpKChwYSkgPj4gUEFHRV9TSElGVCkpCj4gLSNkZWZpbmUg
cGFkZHJfdG9fcGR4KHBhKSAgICBwZm5fdG9fcGR4KHBhZGRyX3RvX3BmbihwYSkpCj4gKyNkZWZp
bmUgcGFkZHJfdG9fcGR4KHBhKSAgICBtZm5fdG9fcGR4KG1hZGRyX3RvX21mbihwYSkpCj4gICNk
ZWZpbmUgZ2ZuX3RvX2dhZGRyKGdmbikgICBwZm5fdG9fcGFkZHIoZ2ZuX3goZ2ZuKSkKPiAgI2Rl
ZmluZSBnYWRkcl90b19nZm4oZ2EpICAgIF9nZm4ocGFkZHJfdG9fcGZuKGdhKSkKPiAgI2RlZmlu
ZSBtZm5fdG9fbWFkZHIobWZuKSAgIHBmbl90b19wYWRkcihtZm5feChtZm4pKQo+IEBAIC0yNTMs
NyArMjUzLDcgQEAgc3RhdGljIGlubGluZSB2b2lkICptYWRkcl90b192aXJ0KHBhZGRyX3QgbWEp
Cj4gICNlbHNlCj4gIHN0YXRpYyBpbmxpbmUgdm9pZCAqbWFkZHJfdG9fdmlydChwYWRkcl90IG1h
KQo+ICB7Cj4gLSAgICBBU1NFUlQocGZuX3RvX3BkeChtYSA+PiBQQUdFX1NISUZUKSA8IChESVJF
Q1RNQVBfU0laRSA+PiBQQUdFX1NISUZUKSk7Cj4gKyAgICBBU1NFUlQobWZuX3RvX3BkeChtYWRk
cl90b19tZm4obWEpKSA8IChESVJFQ1RNQVBfU0laRSA+PiBQQUdFX1NISUZUKSk7Cj4gICAgICBy
ZXR1cm4gKHZvaWQgKikoWEVOSEVBUF9WSVJUX1NUQVJUIC0KPiAgICAgICAgICAgICAgICAgICAg
ICBtZm5fdG9fbWFkZHIoeGVuaGVhcF9tZm5fc3RhcnQpICsKPiAgICAgICAgICAgICAgICAgICAg
ICAoKG1hICYgbWFfdmFfYm90dG9tX21hc2spIHwKPiBAQCAtMzAxLDcgKzMwMSw3IEBAIHN0YXRp
YyBpbmxpbmUgc3RydWN0IHBhZ2VfaW5mbyAqdmlydF90b19wYWdlKGNvbnN0IHZvaWQgKnYpCj4g
ICAgICBBU1NFUlQodmEgPCB4ZW5oZWFwX3ZpcnRfZW5kKTsKPiAgCj4gICAgICBwZHggPSAodmEg
LSBYRU5IRUFQX1ZJUlRfU1RBUlQpID4+IFBBR0VfU0hJRlQ7Cj4gLSAgICBwZHggKz0gcGZuX3Rv
X3BkeChtZm5feCh4ZW5oZWFwX21mbl9zdGFydCkpOwo+ICsgICAgcGR4ICs9IG1mbl90b19wZHgo
eGVuaGVhcF9tZm5fc3RhcnQpOwo+ICAgICAgcmV0dXJuIGZyYW1lX3RhYmxlICsgcGR4IC0gZnJh
bWV0YWJsZV9iYXNlX3BkeDsKPiAgfQo+ICAKPiAtLSAKPiAyLjExLjAKPiAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
