Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B21C10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 22:04:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB85A206BA
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 22:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB85A206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hG9hh-00080J-9n; Mon, 15 Apr 2019 22:03:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GzYx=SR=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hG9hf-00080C-L4
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 22:03:51 +0000
X-Inumbo-ID: 59341b1e-5fca-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 59341b1e-5fca-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 22:03:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72D9FEBD;
 Mon, 15 Apr 2019 15:03:49 -0700 (PDT)
Received: from [10.37.12.102] (unknown [10.37.12.102])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E5BB33F68F;
 Mon, 15 Apr 2019 15:03:48 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-2-julien.grall@arm.com>
 <alpine.DEB.2.10.1904151453080.29275@sstabellini-ThinkPad-X260>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <b92d3ffc-0dd9-ddfb-cee0-664f61ee2ff9@arm.com>
Date: Mon, 15 Apr 2019 23:03:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.10.1904151453080.29275@sstabellini-ThinkPad-X260>
Content-Language: en-US
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
Cc: xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190415220347.LKqmPblugRE_Ch9Z8DmVYSCj0dn_fThz1SKzYctGoCo@z>

SGksCgpPbiA0LzE1LzE5IDEwOjU1IFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24g
TW9uLCAxOCBGZWIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBtZm5fdG9fcGR4IGFkZHMg
bW9yZSBzYWZldHkgdGhhbiBwZm5fdG9fcGR4LiBSZXBsYWNlIGFsbCBidXQgb24gcGxhY2UgaW4K
Pj4gdGhlIEFybSBjb2RlIHRvIHVzZSB0aGUgZm9ybWVyLgo+IAo+IFRoaXMgaXMgZ29vZCBidXQg
bWF5YmUgd2UgY2FuIGdvIGV2ZW4gZnVydGhlci4KPiAKPiBZb3Ugc2hvdWxkIGFsc28gYmUgYWJs
ZSB0byByZXBsYWNlIG9uZSBjYWxsIHNpdGUgb2YgcGZuX3RvX3BkeCBpbgo+IG1mbl92YWxpZCBh
bmQgdGhlIG9uZSBpbiBtYWRkcl90b192aXJ0LiBTb21ldGhpbmcgbGlrZSB0aGlzOgo+IAo+IAo+
IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL21tLmggYi94ZW4vaW5jbHVkZS9hc20t
YXJtL21tLmgKPiBpbmRleCBlYWZhMjZmLi5iMzQ1NWVhIDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNs
dWRlL2FzbS1hcm0vbW0uaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaAo+IEBAIC0y
MDksNyArMjA5LDcgQEAgc3RhdGljIGlubGluZSB2b2lkIF9faW9tZW0gKmlvcmVtYXBfd2MocGFk
ZHJfdCBzdGFydCwgc2l6ZV90IGxlbikKPiAgIC8qIFhYWCAtLSBhY2NvdW50IGZvciBiYXNlICov
Cj4gICAjZGVmaW5lIG1mbl92YWxpZChtZm4pICAgICAgICAoeyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gICAgICAgdW5zaWduZWQgbG9uZyBfX21fZl9u
ID0gbWZuX3gobWZuKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4g
LSAgICBsaWtlbHkocGZuX3RvX3BkeChfX21fZl9uKSA+PSBmcmFtZXRhYmxlX2Jhc2VfcGR4ICYm
IF9fbWZuX3ZhbGlkKF9fbV9mX24pKTsgXAo+ICsgICAgbGlrZWx5KG1mbl90b19wZHgobWZuKSA+
PSBmcmFtZXRhYmxlX2Jhc2VfcGR4ICYmIF9fbWZuX3ZhbGlkKF9fbV9mX24pKTsgXAoKVGhpcyBp
cyBxdWl0ZSB1bmRlc2lyYWJsZSwgeW91IHdpbGwgZW5kIHVwIHRvIGV2YWx1YXRlIG1mbiB0d2lj
ZSBoZXJlLgoKVGhlIG90aGVyIHNvbHV0aW9uIGlzIHRvIHR1cm4gX21fZl9uIHRvIGFuIG1mbl90
IGJ1dCB0aGVuIGl0IGRvZXMgbWFrZSAKbXVjaCBkaWZmZXJlbmNlIGFzIHlvdSB3b3VsZCBuZWVk
IHRvIHVzZSBhIG1mbl94KG1mbikgaW4gdGhlIGNvZGUuCgo+ICAgfSkKPiAgIAo+ICAgLyogQ29u
dmVydCBiZXR3ZWVuIG1hY2hpbmUgZnJhbWUgbnVtYmVycyBhbmQgcGFnZS1pbmZvIHN0cnVjdHVy
ZXMuICovCj4gQEAgLTI1Myw3ICsyNTMsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgKm1hZGRyX3Rv
X3ZpcnQocGFkZHJfdCBtYSkKPiAgICNlbHNlCj4gICBzdGF0aWMgaW5saW5lIHZvaWQgKm1hZGRy
X3RvX3ZpcnQocGFkZHJfdCBtYSkKPiAgIHsKPiAtICAgIEFTU0VSVChwZm5fdG9fcGR4KG1hID4+
IFBBR0VfU0hJRlQpIDwgKERJUkVDVE1BUF9TSVpFID4+IFBBR0VfU0hJRlQpKTsKPiArICAgIEFT
U0VSVChtZm5fdG9fcGR4KG1hZGRyX3RvX21mbihtYSkpIDwgKERJUkVDVE1BUF9TSVpFID4+IFBB
R0VfU0hJRlQpKTsKPiAgICAgICByZXR1cm4gKHZvaWQgKikoWEVOSEVBUF9WSVJUX1NUQVJUIC0K
PiAgICAgICAgICAgICAgICAgICAgICAgbWZuX3RvX21hZGRyKHhlbmhlYXBfbWZuX3N0YXJ0KSAr
Cj4gICAgICAgICAgICAgICAgICAgICAgICgobWEgJiBtYV92YV9ib3R0b21fbWFzaykgfAo+IAoK
SSBmYWlsIHRvIHNlZSB3aGF0IHRoaXMgY2h1bmsgYWRkcyBjb21wYXJlIHRvIHRoZSBleGlzdGlu
ZyBvbmUuLi4KCj4+IEBAIC0yNTMsNyArMjUzLDcgQEAgc3RhdGljIGlubGluZSB2b2lkICptYWRk
cl90b192aXJ0KHBhZGRyX3QgbWEpCj4+ICAgI2Vsc2UKPj4gICBzdGF0aWMgaW5saW5lIHZvaWQg
Km1hZGRyX3RvX3ZpcnQocGFkZHJfdCBtYSkKPj4gICB7Cj4+IC0gICAgQVNTRVJUKHBmbl90b19w
ZHgobWEgPj4gUEFHRV9TSElGVCkgPCAoRElSRUNUTUFQX1NJWkUgPj4gUEFHRV9TSElGVCkpOwo+
PiArICAgIEFTU0VSVChtZm5fdG9fcGR4KG1hZGRyX3RvX21mbihtYSkpIDwgKERJUkVDVE1BUF9T
SVpFID4+IFBBR0VfU0hJRlQpKTsKPj4gICAgICAgcmV0dXJuICh2b2lkICopKFhFTkhFQVBfVklS
VF9TVEFSVCAtCj4+ICAgICAgICAgICAgICAgICAgICAgICBtZm5fdG9fbWFkZHIoeGVuaGVhcF9t
Zm5fc3RhcnQpICsKPj4gICAgICAgICAgICAgICAgICAgICAgICgobWEgJiBtYV92YV9ib3R0b21f
bWFzaykgfAouLi4gaGVyZS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
