Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A9CC10F11
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 11:52:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4CF1218D2
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 11:52:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4CF1218D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJGQz-0007Zr-Bm; Wed, 24 Apr 2019 11:51:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8RIj=S2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hJGQy-0007Zm-RD
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 11:51:28 +0000
X-Inumbo-ID: 4a8a1714-6687-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 4a8a1714-6687-11e9-92d7-bc764e045a96;
 Wed, 24 Apr 2019 11:51:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACAD9A78;
 Wed, 24 Apr 2019 04:51:26 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 184F63F238;
 Wed, 24 Apr 2019 04:51:24 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <5CAF2D310200007800226974@prv1-mh.provo.novell.com>
 <5CAF36E202000078002269BE@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <3d520753-510d-69b2-b2f0-0965bc14cc6b@arm.com>
Date: Wed, 24 Apr 2019 12:51:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CAF36E202000078002269BE@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] core-parking: interact with runtime
 SMT-disabling
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190424115123.EftdQAuz45mkGFJ0Jh5ZuG6scFJ50uiTizjBf-_lVnE@z>

SGkgSmFuLAoKT24gMTEvMDQvMjAxOSAxMzo0NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gLS0tIGEv
eGVuL2NvbW1vbi9jb3JlX3BhcmtpbmcuYwo+ICsrKyBiL3hlbi9jb21tb24vY29yZV9wYXJraW5n
LmMKCgpbLi4uXQoKPiArYm9vbCBjb3JlX3BhcmtpbmdfcmVtb3ZlKHVuc2lnbmVkIGludCBjcHUp
CgpTb21ldGhpbmcgbG9va3Mgd3JvbmcuIFRoaXMgZnVuY3Rpb24gaXMgaW1wbGVtZW50ZWQgaW4g
Y29tbW9uIGNvZGUgYnV0Li4uCgo+ICt7Cj4gKyAgICB1bnNpZ25lZCBpbnQgaTsKPiArICAgIGJv
b2wgZm91bmQgPSBmYWxzZTsKPiArCj4gKyAgICBzcGluX2xvY2soJmFjY291bnRpbmdfbG9jayk7
Cj4gKwo+ICsgICAgZm9yICggaSA9IDA7IGkgPCBjdXJfaWRsZV9udW1zOyArK2kgKQo+ICsgICAg
ICAgIGlmICggY29yZV9wYXJraW5nX2NwdW51bVtpXSA9PSBjcHUgKQo+ICsgICAgICAgIHsKPiAr
ICAgICAgICAgICAgZm91bmQgPSB0cnVlOwo+ICsgICAgICAgICAgICAtLWN1cl9pZGxlX251bXM7
Cj4gKyAgICAgICAgICAgIGJyZWFrOwo+ICsgICAgICAgIH0KPiArCj4gKyAgICBmb3IgKCA7IGkg
PCBjdXJfaWRsZV9udW1zOyArK2kgKQo+ICsgICAgICAgIGNvcmVfcGFya2luZ19jcHVudW1baV0g
PSBjb3JlX3BhcmtpbmdfY3B1bnVtW2kgKyAxXTsKPiArCj4gKyAgICBzcGluX3VubG9jaygmYWNj
b3VudGluZ19sb2NrKTsKPiArCj4gKyAgICByZXR1cm4gZm91bmQ7Cj4gK30KPiArCj4gICB1aW50
MzJfdCBnZXRfY3VyX2lkbGVfbnVtcyh2b2lkKQo+ICAgewo+ICAgICAgIHJldHVybiBjdXJfaWRs
ZV9udW1zOwo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvc21wLmgKPiArKysgYi94ZW4vaW5j
bHVkZS9hc20teDg2L3NtcC5oCj4gQEAgLTYzLDYgKzYzLDcgQEAgbG9uZyBjcHVfdXBfaGVscGVy
KHZvaWQgKmRhdGEpOwo+ICAgbG9uZyBjcHVfZG93bl9oZWxwZXIodm9pZCAqZGF0YSk7Cj4gICAK
PiAgIGxvbmcgY29yZV9wYXJraW5nX2hlbHBlcih2b2lkICpkYXRhKTsKPiArYm9vbCBjb3JlX3Bh
cmtpbmdfcmVtb3ZlKHVuc2lnbmVkIGludCBjcHUpOwoKVGhlIHByb3RvdHlwZSBpcyBkZWNsYXJl
ZCBpbiBhc20teDg2L3NtcC5oLiBBY3R1YWxseSwgaXQgc2VlbXMgYWxsIHRoZSBmdW5jdGlvbiAK
ZXhwb3J0ZWQgaW4gY29yZV9wYXJraW5nLmMgaGF2ZSB0aGVpciBwcm90b3R5cGUgZGVjbGFyZWQg
aW4gYXNtLXg4Ni9zbXAuaC4KClRoaXMgcmFpc2VzIHRoZSBxdWVzdGlvbiBvZiB3aGV0aGVyIGl0
IG1ha2VzIHNlbnNlIHRvIGhhdmUgY29yZV9wYXJraW5nLmMgaW4gCmNvbW1vbi4gSWYgaXQgbWFr
ZXMgc2Vuc2UsIHRoZW4gdGhlIHByb3RvdHlwZSBzaG91bGQgYmUgZGVjbGFyZWQgaW4gaW5jbHVk
ZS94ZW4uCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
