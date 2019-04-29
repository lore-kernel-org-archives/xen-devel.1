Return-Path: <SRS0=aeBS=S7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2190C43219
	for <xen-devel@archiver.kernel.org>; Mon, 29 Apr 2019 12:55:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7EB42063F
	for <xen-devel@archiver.kernel.org>; Mon, 29 Apr 2019 12:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7EB42063F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL5oL-0000Zo-9I; Mon, 29 Apr 2019 12:55:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gpsw=S7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hL5oK-0000Zi-QJ
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 12:55:08 +0000
X-Inumbo-ID: 03b39543-6a7e-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 03b39543-6a7e-11e9-843c-bc764e045a96;
 Mon, 29 Apr 2019 12:55:07 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 29 Apr 2019 06:55:06 -0600
Message-Id: <5CC6F4270200007800229FA8@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 29 Apr 2019 06:55:03 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CC6DE8F0200007800229E9A@prv1-mh.provo.novell.com>
In-Reply-To: <5CC6DE8F0200007800229E9A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH RFC 1/9] x86/IRQ: deal with move-in-progress
 state in fixup_irqs()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Igor Druzhinin <igor.druzhinin@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190429125503.LqEmmXFzp8tYcJ-a6pnaEEmD9WWhxRAH_NHXif_TdRg@z>

Pj4+IE9uIDI5LjA0LjE5IGF0IDEzOjIyLCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+IFJG
QzogSSd2ZSBzZWVuIHRoZSBuZXcgQVNTRVJUKCkgaW4gaXJxX21vdmVfY2xlYW51cF9pbnRlcnJ1
cHQoKSB0cmlnZ2VyLgo+ICAgICAgSSdtIHByZXR0eSBzdXJlIHRoYXQgdGhpcyBhc3NlcnRpb24g
dHJpZ2dlcmluZyBtZWFucyBzb21ldGhpbmcgZWxzZQo+ICAgICAgaXMgd3JvbmcsIGFuZCBoYXMg
YmVlbiBldmVuIHByaW9yIHRvIHRoaXMgY2hhbmdlIChhZGRpbmcgdGhlCj4gICAgICBhc3NlcnRp
b24gd2l0aG91dCBhbnkgb2YgdGhlIG90aGVyIGNoYW5nZXMgaGVyZSBzaG91bGQgYmUgdmFsaWQg
aW4KPiAgICAgIG15IHVuZGVyc3RhbmRpbmcpLgoKU28gSSB0aGluayB3aGF0IGlzIG1pc3Npbmcg
aXMgdXBkYXRpbmcgb2YgdmVjdG9yX2lycSAuLi4KCj4gQEAgLTIzOTEsNiArMjQwMSwyNCBAQCB2
b2lkIGZpeHVwX2lycXMoY29uc3QgY3B1bWFza190ICptYXNrLCBiCj4gICAgICAgICAgICAgIGNv
bnRpbnVlOwo+ICAgICAgICAgIH0KPiAgCj4gKyAgICAgICAgLyoKPiArICAgICAgICAgKiBJbiBv
cmRlciBmb3IgdGhlIGFmZmluaXR5IGFkanVzdG1lbnQgYmVsb3cgdG8gYmUgc3VjY2Vzc2Z1bCwg
d2UKPiArICAgICAgICAgKiBuZWVkIF9fYXNzaWduX2lycV92ZWN0b3IoKSB0byBzdWNjZWVkLiBU
aGlzIGluIHBhcnRpY3VsYXIgbWVhbnMKPiArICAgICAgICAgKiBjbGVhcmluZyBkZXNjLT5hcmNo
Lm1vdmVfaW5fcHJvZ3Jlc3MgaWYgdGhpcyB3b3VsZCBvdGhlcndpc2UKPiArICAgICAgICAgKiBw
cmV2ZW50IHRoZSBmdW5jdGlvbiBmcm9tIHN1Y2NlZWRpbmcuIFNpbmNlIHRoZXJlJ3Mgbm8gd2F5
IGZvciB0aGUKPiArICAgICAgICAgKiBmbGFnIHRvIGdldCBjbGVhcmVkIGFueW1vcmUgd2hlbiB0
aGVyZSdzIG5vIHBvc3NpYmxlIGRlc3RpbmF0aW9uCj4gKyAgICAgICAgICogbGVmdCAodGhlIG9u
bHkgcG9zc2liaWxpdHkgdGhlbiB3b3VsZCBiZSB0aGUgSVJRcyBlbmFibGVkIHdpbmRvdwo+ICsg
ICAgICAgICAqIGFmdGVyIHRoaXMgbG9vcCksIHRoZXJlJ3MgdGhlbiBhbHNvIG5vIHJhY2Ugd2l0
aCB1cyBkb2luZyBpdCBoZXJlLgo+ICsgICAgICAgICAqCj4gKyAgICAgICAgICogVGhlcmVmb3Jl
IHRoZSBsb2dpYyBoZXJlIGFuZCB0aGVyZSBuZWVkIHRvIHJlbWFpbiBpbiBzeW5jLgo+ICsgICAg
ICAgICAqLwo+ICsgICAgICAgIGlmICggZGVzYy0+YXJjaC5tb3ZlX2luX3Byb2dyZXNzICYmCj4g
KyAgICAgICAgICAgICAhY3B1bWFza19pbnRlcnNlY3RzKG1hc2ssIGRlc2MtPmFyY2guY3B1X21h
c2spICkKPiArICAgICAgICB7Cj4gKyAgICAgICAgICAgIHJlbGVhc2Vfb2xkX3ZlYyhkZXNjKTsK
PiArICAgICAgICAgICAgZGVzYy0+YXJjaC5tb3ZlX2luX3Byb2dyZXNzID0gMDsKPiArICAgICAg
ICB9CgouLi4gaGVyZSBhbmQgaW4gdGhlIHNvbWV3aGF0IHNpbWlsYXIgbG9naWMgcGF0Y2ggMiBp
bnNlcnRzIGEgZmV3IGxpbmVzCnVwLiBJJ20gYWJvdXQgdG8gdHJ5IHRoaXMgb3V0LCBidXQgZ2l2
ZW4gaG93IHJhcmVseSBJJ3ZlIHNlZW4gdGhlCnByb2JsZW0gdGhpcyB3aWxsIHRha2UgYSB3aGls
ZSB0byBmZWVsIGNvbmZpZGVudCAoaWYsIG9mIGNvdXJzZSwgaXQgaGVscHMKaW4gdGhlIGZpcnN0
IHBsYWNlKS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
