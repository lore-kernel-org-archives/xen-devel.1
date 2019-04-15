Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9333C10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 22:25:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6ECE820663
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 22:25:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0gAlS5Zk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6ECE820663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGA2k-0001iT-Mj; Mon, 15 Apr 2019 22:25:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Ip/=SR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hGA2k-0001iO-4s
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 22:25:38 +0000
X-Inumbo-ID: 6400e215-5fcd-11e9-92d7-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6400e215-5fcd-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 22:25:36 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C253C20663;
 Mon, 15 Apr 2019 22:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555367106;
 bh=EkGMK4GPvY6YeoH3wzM5sJkB6h/1uGBAhQFMcYo/g30=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=0gAlS5ZkKnJNNvX+h7GAdatYCKNrr65iPTUNVfKSncB75RFzlqc0DosEp5aVO2NJz
 sakhywMUB/lYq8C8XP75ARm8FUmvrJ9tNIzwEuZti2uY4KVM57AyXVsuNn1N+og+h7
 7SMeME4uw9k/aLAzi22C33dAyqGUDzaFYcaWIGuc=
Date: Mon, 15 Apr 2019 15:25:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <b92d3ffc-0dd9-ddfb-cee0-664f61ee2ff9@arm.com>
Message-ID: <alpine.DEB.2.10.1904151522330.29275@sstabellini-ThinkPad-X260>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-2-julien.grall@arm.com>
 <alpine.DEB.2.10.1904151453080.29275@sstabellini-ThinkPad-X260>
 <b92d3ffc-0dd9-ddfb-cee0-664f61ee2ff9@arm.com>
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190415222505.43KwIjmyIL0WsjvlqBZJRRNIFVU695eWqUG3E_Evfzc@z>

T24gTW9uLCAxNSBBcHIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDQv
MTUvMTkgMTA6NTUgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IE9uIE1vbiwgMTgg
RmViIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+ID4gbWZuX3RvX3BkeCBhZGRzIG1vcmUg
c2FmZXR5IHRoYW4gcGZuX3RvX3BkeC4gUmVwbGFjZSBhbGwgYnV0IG9uIHBsYWNlIGluCj4gPiA+
IHRoZSBBcm0gY29kZSB0byB1c2UgdGhlIGZvcm1lci4KPiA+IAo+ID4gVGhpcyBpcyBnb29kIGJ1
dCBtYXliZSB3ZSBjYW4gZ28gZXZlbiBmdXJ0aGVyLgo+ID4gCj4gPiBZb3Ugc2hvdWxkIGFsc28g
YmUgYWJsZSB0byByZXBsYWNlIG9uZSBjYWxsIHNpdGUgb2YgcGZuX3RvX3BkeCBpbgo+ID4gbWZu
X3ZhbGlkIGFuZCB0aGUgb25lIGluIG1hZGRyX3RvX3ZpcnQuIFNvbWV0aGluZyBsaWtlIHRoaXM6
Cj4gPiAKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaCBiL3hl
bi9pbmNsdWRlL2FzbS1hcm0vbW0uaAo+ID4gaW5kZXggZWFmYTI2Zi4uYjM0NTVlYSAxMDA2NDQK
PiA+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaAo+ID4gKysrIGIveGVuL2luY2x1ZGUv
YXNtLWFybS9tbS5oCj4gPiBAQCAtMjA5LDcgKzIwOSw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBf
X2lvbWVtICppb3JlbWFwX3djKHBhZGRyX3Qgc3RhcnQsCj4gPiBzaXplX3QgbGVuKQo+ID4gICAv
KiBYWFggLS0gYWNjb3VudCBmb3IgYmFzZSAqLwo+ID4gICAjZGVmaW5lIG1mbl92YWxpZChtZm4p
ICAgICAgICAoewo+ID4gXAo+ID4gICAgICAgdW5zaWduZWQgbG9uZyBfX21fZl9uID0gbWZuX3go
bWZuKTsKPiA+IFwKPiA+IC0gICAgbGlrZWx5KHBmbl90b19wZHgoX19tX2ZfbikgPj0gZnJhbWV0
YWJsZV9iYXNlX3BkeCAmJgo+ID4gX19tZm5fdmFsaWQoX19tX2ZfbikpOyBcCj4gPiArICAgIGxp
a2VseShtZm5fdG9fcGR4KG1mbikgPj0gZnJhbWV0YWJsZV9iYXNlX3BkeCAmJiBfX21mbl92YWxp
ZChfX21fZl9uKSk7Cj4gPiBcCj4gCj4gVGhpcyBpcyBxdWl0ZSB1bmRlc2lyYWJsZSwgeW91IHdp
bGwgZW5kIHVwIHRvIGV2YWx1YXRlIG1mbiB0d2ljZSBoZXJlLgoKWWVzIHlvdSBhcmUgcmlnaHQK
Cgo+IFRoZSBvdGhlciBzb2x1dGlvbiBpcyB0byB0dXJuIF9tX2ZfbiB0byBhbiBtZm5fdCBidXQg
dGhlbiBpdCBkb2VzIG1ha2UgbXVjaAo+IGRpZmZlcmVuY2UgYXMgeW91IHdvdWxkIG5lZWQgdG8g
dXNlIGEgbWZuX3gobWZuKSBpbiB0aGUgY29kZS4KCkkgdGhpbmsgdGhhdCB3b3VsZCBiZSBiZXR0
ZXIKCgo+ID4gICB9KQo+ID4gICAgIC8qIENvbnZlcnQgYmV0d2VlbiBtYWNoaW5lIGZyYW1lIG51
bWJlcnMgYW5kIHBhZ2UtaW5mbyBzdHJ1Y3R1cmVzLiAqLwo+ID4gQEAgLTI1Myw3ICsyNTMsNyBA
QCBzdGF0aWMgaW5saW5lIHZvaWQgKm1hZGRyX3RvX3ZpcnQocGFkZHJfdCBtYSkKPiA+ICAgI2Vs
c2UKPiA+ICAgc3RhdGljIGlubGluZSB2b2lkICptYWRkcl90b192aXJ0KHBhZGRyX3QgbWEpCj4g
PiAgIHsKPiA+IC0gICAgQVNTRVJUKHBmbl90b19wZHgobWEgPj4gUEFHRV9TSElGVCkgPCAoRElS
RUNUTUFQX1NJWkUgPj4gUEFHRV9TSElGVCkpOwo+ID4gKyAgICBBU1NFUlQobWZuX3RvX3BkeCht
YWRkcl90b19tZm4obWEpKSA8IChESVJFQ1RNQVBfU0laRSA+PiBQQUdFX1NISUZUKSk7Cj4gPiAg
ICAgICByZXR1cm4gKHZvaWQgKikoWEVOSEVBUF9WSVJUX1NUQVJUIC0KPiA+ICAgICAgICAgICAg
ICAgICAgICAgICBtZm5fdG9fbWFkZHIoeGVuaGVhcF9tZm5fc3RhcnQpICsKPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAoKG1hICYgbWFfdmFfYm90dG9tX21hc2spIHwKPiA+IAo+IAo+IEkgZmFp
bCB0byBzZWUgd2hhdCB0aGlzIGNodW5rIGFkZHMgY29tcGFyZSB0byB0aGUgZXhpc3Rpbmcgb25l
Li4uCj4gCj4gPiA+IEBAIC0yNTMsNyArMjUzLDcgQEAgc3RhdGljIGlubGluZSB2b2lkICptYWRk
cl90b192aXJ0KHBhZGRyX3QgbWEpCj4gPiA+ICAgI2Vsc2UKPiA+ID4gICBzdGF0aWMgaW5saW5l
IHZvaWQgKm1hZGRyX3RvX3ZpcnQocGFkZHJfdCBtYSkKPiA+ID4gICB7Cj4gPiA+IC0gICAgQVNT
RVJUKHBmbl90b19wZHgobWEgPj4gUEFHRV9TSElGVCkgPCAoRElSRUNUTUFQX1NJWkUgPj4KPiA+
ID4gUEFHRV9TSElGVCkpOwo+ID4gPiArICAgIEFTU0VSVChtZm5fdG9fcGR4KG1hZGRyX3RvX21m
bihtYSkpIDwgKERJUkVDVE1BUF9TSVpFID4+Cj4gPiA+IFBBR0VfU0hJRlQpKTsKPiA+ID4gICAg
ICAgcmV0dXJuICh2b2lkICopKFhFTkhFQVBfVklSVF9TVEFSVCAtCj4gPiA+ICAgICAgICAgICAg
ICAgICAgICAgICBtZm5fdG9fbWFkZHIoeGVuaGVhcF9tZm5fc3RhcnQpICsKPiA+ID4gICAgICAg
ICAgICAgICAgICAgICAgICgobWEgJiBtYV92YV9ib3R0b21fbWFzaykgfAo+IC4uLiBoZXJlLgoK
VGhhdCdzIHdlaXJkLiBJIHRoaW5rIGBwYXRjaCcgZGlkbid0IGFwcGx5IGNvbXBsZXRlbHkgdGhl
IHBhdGNoIHRvIG15CnRyZWUuIEdyZWF0IHlvdSBhbHJlYWR5IGhhdmUgaXQuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
