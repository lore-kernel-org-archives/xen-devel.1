Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 281FEC10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 22:42:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F03142075B
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 22:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F03142075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGAJF-0003Pm-OL; Mon, 15 Apr 2019 22:42:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GzYx=SR=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hGAJD-0003Ph-Q4
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 22:42:39 +0000
X-Inumbo-ID: c571417b-5fcf-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id c571417b-5fcf-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 22:42:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E88C80D;
 Mon, 15 Apr 2019 15:42:08 -0700 (PDT)
Received: from [10.37.12.102] (unknown [10.37.12.102])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD9763F68F;
 Mon, 15 Apr 2019 15:42:07 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-2-julien.grall@arm.com>
 <alpine.DEB.2.10.1904151453080.29275@sstabellini-ThinkPad-X260>
 <b92d3ffc-0dd9-ddfb-cee0-664f61ee2ff9@arm.com>
 <alpine.DEB.2.10.1904151522330.29275@sstabellini-ThinkPad-X260>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <c3e5008c-7dd2-61b5-bec1-287b310a471c@arm.com>
Date: Mon, 15 Apr 2019 23:42:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.10.1904151522330.29275@sstabellini-ThinkPad-X260>
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
Message-ID: <20190415224205.-WgXUddphNezktIe6oHncxpoMI8wxLRmz1aS1E-f_uo@z>

SGksCgpPbiA0LzE1LzE5IDExOjI1IFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24g
TW9uLCAxNSBBcHIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSwKPj4KPj4gT24gNC8x
NS8xOSAxMDo1NSBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+Pj4gT24gTW9uLCAxOCBG
ZWIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+IG1mbl90b19wZHggYWRkcyBtb3JlIHNh
ZmV0eSB0aGFuIHBmbl90b19wZHguIFJlcGxhY2UgYWxsIGJ1dCBvbiBwbGFjZSBpbgo+Pj4+IHRo
ZSBBcm0gY29kZSB0byB1c2UgdGhlIGZvcm1lci4KPj4+Cj4+PiBUaGlzIGlzIGdvb2QgYnV0IG1h
eWJlIHdlIGNhbiBnbyBldmVuIGZ1cnRoZXIuCj4+Pgo+Pj4gWW91IHNob3VsZCBhbHNvIGJlIGFi
bGUgdG8gcmVwbGFjZSBvbmUgY2FsbCBzaXRlIG9mIHBmbl90b19wZHggaW4KPj4+IG1mbl92YWxp
ZCBhbmQgdGhlIG9uZSBpbiBtYWRkcl90b192aXJ0LiBTb21ldGhpbmcgbGlrZSB0aGlzOgo+Pj4K
Pj4+Cj4+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oIGIveGVuL2luY2x1
ZGUvYXNtLWFybS9tbS5oCj4+PiBpbmRleCBlYWZhMjZmLi5iMzQ1NWVhIDEwMDY0NAo+Pj4gLS0t
IGEveGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oCj4+PiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJt
L21tLmgKPj4+IEBAIC0yMDksNyArMjA5LDcgQEAgc3RhdGljIGlubGluZSB2b2lkIF9faW9tZW0g
KmlvcmVtYXBfd2MocGFkZHJfdCBzdGFydCwKPj4+IHNpemVfdCBsZW4pCj4+PiAgICAvKiBYWFgg
LS0gYWNjb3VudCBmb3IgYmFzZSAqLwo+Pj4gICAgI2RlZmluZSBtZm5fdmFsaWQobWZuKSAgICAg
ICAgKHsKPj4+IFwKPj4+ICAgICAgICB1bnNpZ25lZCBsb25nIF9fbV9mX24gPSBtZm5feChtZm4p
Owo+Pj4gXAo+Pj4gLSAgICBsaWtlbHkocGZuX3RvX3BkeChfX21fZl9uKSA+PSBmcmFtZXRhYmxl
X2Jhc2VfcGR4ICYmCj4+PiBfX21mbl92YWxpZChfX21fZl9uKSk7IFwKPj4+ICsgICAgbGlrZWx5
KG1mbl90b19wZHgobWZuKSA+PSBmcmFtZXRhYmxlX2Jhc2VfcGR4ICYmIF9fbWZuX3ZhbGlkKF9f
bV9mX24pKTsKPj4+IFwKPj4KPj4gVGhpcyBpcyBxdWl0ZSB1bmRlc2lyYWJsZSwgeW91IHdpbGwg
ZW5kIHVwIHRvIGV2YWx1YXRlIG1mbiB0d2ljZSBoZXJlLgo+IAo+IFllcyB5b3UgYXJlIHJpZ2h0
Cj4gCj4gCj4+IFRoZSBvdGhlciBzb2x1dGlvbiBpcyB0byB0dXJuIF9tX2ZfbiB0byBhbiBtZm5f
dCBidXQgdGhlbiBpdCBkb2VzIG1ha2UgbXVjaAo+PiBkaWZmZXJlbmNlIGFzIHlvdSB3b3VsZCBu
ZWVkIHRvIHVzZSBhIG1mbl94KG1mbikgaW4gdGhlIGNvZGUuCj4gCj4gSSB0aGluayB0aGF0IHdv
dWxkIGJlIGJldHRlcgoKSSBzaG91bGQgaGF2ZSBwcm9iYWJseSBzYWlkIHRoYXQgSSBoYXZlbid0
IGRvbmUgdGhhdCBpbiB0aGUgcGF0Y2ggCmJlY2F1c2UgYWRkaW5nIHRoZSBtZm5feCguLi4pIGlz
IGJyZWFjaGVkIHRoZSA4MC1jaGFyYWN0ZXJzIGxpbWl0LiBTbyB3ZSAKd291bGQgbmVlZCB0byBz
cGxpdCB0aGUgbGluZS4KCkkgZG9uJ3QgcmVhbGx5IHRoaW5rIHRoaXMgd2lsbCBtYWtlIGVhc2ll
ciB0byByZWFkIHRoZSBjb2RlIGluIHRoaXMgY29udGV4dC4KCkkgYW0gY3VyaW91cyB0byBrbm93
IGhvdyB0aGlzIHdvdWxkIG1ha2UgaXQgYmV0dGVyLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFs
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
