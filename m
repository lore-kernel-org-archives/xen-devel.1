Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB524C10F03
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 10:20:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4278214AE
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 10:20:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4278214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJbUI-0007T1-L8; Thu, 25 Apr 2019 10:20:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJbUH-0007Sw-Vw
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 10:20:18 +0000
X-Inumbo-ID: b867a48f-6743-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b867a48f-6743-11e9-843c-bc764e045a96;
 Thu, 25 Apr 2019 10:20:17 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 25 Apr 2019 04:20:16 -0600
Message-Id: <5CC189DC0200007800228F84@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 25 Apr 2019 04:20:12 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <5CAF2D310200007800226974@prv1-mh.provo.novell.com>
 <5CAF36E202000078002269BE@prv1-mh.provo.novell.com>
 <3d520753-510d-69b2-b2f0-0965bc14cc6b@arm.com>
In-Reply-To: <3d520753-510d-69b2-b2f0-0965bc14cc6b@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
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
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425102012.iYT63yoE48mgwdSN3E-31aNNZozPpbmTdpAQmyZccEI@z>

Pj4+IE9uIDI0LjA0LjE5IGF0IDEzOjUxLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDExLzA0LzIwMTkgMTM6NDUsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiAtLS0gYS94ZW4vY29t
bW9uL2NvcmVfcGFya2luZy5jCj4+ICsrKyBiL3hlbi9jb21tb24vY29yZV9wYXJraW5nLmMKPiAK
PiAKPiBbLi4uXQo+IAo+PiArYm9vbCBjb3JlX3BhcmtpbmdfcmVtb3ZlKHVuc2lnbmVkIGludCBj
cHUpCj4gCj4gU29tZXRoaW5nIGxvb2tzIHdyb25nLiBUaGlzIGZ1bmN0aW9uIGlzIGltcGxlbWVu
dGVkIGluIGNvbW1vbiBjb2RlIGJ1dC4uLgo+IAo+PiArewo+PiArICAgIHVuc2lnbmVkIGludCBp
Owo+PiArICAgIGJvb2wgZm91bmQgPSBmYWxzZTsKPj4gKwo+PiArICAgIHNwaW5fbG9jaygmYWNj
b3VudGluZ19sb2NrKTsKPj4gKwo+PiArICAgIGZvciAoIGkgPSAwOyBpIDwgY3VyX2lkbGVfbnVt
czsgKytpICkKPj4gKyAgICAgICAgaWYgKCBjb3JlX3BhcmtpbmdfY3B1bnVtW2ldID09IGNwdSAp
Cj4+ICsgICAgICAgIHsKPj4gKyAgICAgICAgICAgIGZvdW5kID0gdHJ1ZTsKPj4gKyAgICAgICAg
ICAgIC0tY3VyX2lkbGVfbnVtczsKPj4gKyAgICAgICAgICAgIGJyZWFrOwo+PiArICAgICAgICB9
Cj4+ICsKPj4gKyAgICBmb3IgKCA7IGkgPCBjdXJfaWRsZV9udW1zOyArK2kgKQo+PiArICAgICAg
ICBjb3JlX3BhcmtpbmdfY3B1bnVtW2ldID0gY29yZV9wYXJraW5nX2NwdW51bVtpICsgMV07Cj4+
ICsKPj4gKyAgICBzcGluX3VubG9jaygmYWNjb3VudGluZ19sb2NrKTsKPj4gKwo+PiArICAgIHJl
dHVybiBmb3VuZDsKPj4gK30KPj4gKwo+PiAgIHVpbnQzMl90IGdldF9jdXJfaWRsZV9udW1zKHZv
aWQpCj4+ICAgewo+PiAgICAgICByZXR1cm4gY3VyX2lkbGVfbnVtczsKPj4gLS0tIGEveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9zbXAuaAo+PiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L3NtcC5oCj4+
IEBAIC02Myw2ICs2Myw3IEBAIGxvbmcgY3B1X3VwX2hlbHBlcih2b2lkICpkYXRhKTsKPj4gICBs
b25nIGNwdV9kb3duX2hlbHBlcih2b2lkICpkYXRhKTsKPj4gICAKPj4gICBsb25nIGNvcmVfcGFy
a2luZ19oZWxwZXIodm9pZCAqZGF0YSk7Cj4+ICtib29sIGNvcmVfcGFya2luZ19yZW1vdmUodW5z
aWduZWQgaW50IGNwdSk7Cj4gCj4gVGhlIHByb3RvdHlwZSBpcyBkZWNsYXJlZCBpbiBhc20teDg2
L3NtcC5oLiBBY3R1YWxseSwgaXQgc2VlbXMgYWxsIHRoZSBmdW5jdGlvbiAKPiBleHBvcnRlZCBp
biBjb3JlX3BhcmtpbmcuYyBoYXZlIHRoZWlyIHByb3RvdHlwZSBkZWNsYXJlZCBpbiBhc20teDg2
L3NtcC5oLgoKSSd2ZSBub3RpY2VkIHRoaXMgdG9vLCBidXQgdGhpcyBpcyBub3QgYW4gdW5jb21t
b24gdGhpbmcgKGhlbmNlCnRoZSBDT1JFX1BBUktJTkcgS2NvbmZpZyBzZXR0aW5nKS4gVmFyaW91
cyBzdWNoIGluc3RhbmNlCmhhdmUgYmVlbiBlbGltaW5hdGVkIHNpbmNlIHRoZSBpbnRyb2R1Y3Rp
b24gb2YgQXJtIHN1cHBvcnQsCmJ1dCBvdGhlcnMgcmVtYWluLiBJdCdzIG5vdCB0aGUgcHVycG9z
ZSBvZiB0aGlzIHNlcmllcyB0byBjbGVhbgp1cCB0aGlzIGFzcGVjdCwgb3IgLi4uCgo+IFRoaXMg
cmFpc2VzIHRoZSBxdWVzdGlvbiBvZiB3aGV0aGVyIGl0IG1ha2VzIHNlbnNlIHRvIGhhdmUgY29y
ZV9wYXJraW5nLmMgaW4gCj4gY29tbW9uLiBJZiBpdCBtYWtlcyBzZW5zZSwgdGhlbiB0aGUgcHJv
dG90eXBlIHNob3VsZCBiZSBkZWNsYXJlZCBpbiAKPiBpbmNsdWRlL3hlbi4KCi4uLiB0byBkZWNp
ZGUgd2hldGhlciB0aGUgLmMgZmlsZSBvciB0aGUgZGVjbGFyYXRpb25zIHNob3VsZCBtb3ZlLgpQ
ZXJzb25hbGx5IEkgdGhpbmsgdGhpcyBpcyBnZW5lcmljIGVub3VnaCBhIGNvbmNlcHQgdGhhdCB0
aGUgLmMKc2hvdWxkIHJlbWFpbiB3aGVyZSBpdCBpcywgaW4gd2hpY2ggY2FzZSB3ZSdkIGxpa2Vs
eSB3YW50IHRvIGdhaW4KYSB4ZW4vY29yZS1wYXJraW5nLmggYXQgc29tZSBwb2ludC4KCkphbgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
