Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC547C282CE
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 09:20:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A50BF20883
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 09:20:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A50BF20883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDQRV-0006cE-Ge; Mon, 08 Apr 2019 09:19:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OZ3N=SK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hDQRT-0006c9-UK
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 09:19:51 +0000
X-Inumbo-ID: 75f1c26e-59df-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 75f1c26e-59df-11e9-92d7-bc764e045a96;
 Mon, 08 Apr 2019 09:19:50 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 08 Apr 2019 03:19:49 -0600
Message-Id: <5CAB123102000078002253E1@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 08 Apr 2019 03:19:45 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <nmanthey@amazon.de>
References: <1552567811-5301-1-git-send-email-nmanthey@amazon.de>
 <1552567811-5301-5-git-send-email-nmanthey@amazon.de>
 <ac21008a-3d74-2836-79fe-fbc39ca154ac@citrix.com>
 <cfb267a7-3529-c683-c12f-94445def2a9d@amazon.de>
In-Reply-To: <cfb267a7-3529-c683-c12f-94445def2a9d@amazon.de>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH L1TF v10 4/8] is_hvm/pv_domain: block
 speculation
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
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Martin Pohlack <mpohlack@amazon.de>, wipawel@amazon.de,
 Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>,
 "Martin Mazein\(amazein\)" <amazein@amazon.de>,
 xen-devel <xen-devel@lists.xenproject.org>, Bjoern Doebel <doebel@amazon.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190408091945.t8bs0OQboEG1iAphdW-nTD1bx-5yxJsquNmxZhaB-64@z>

Pj4+IE9uIDA1LjA0LjE5IGF0IDIwOjI5LCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiBP
biA0LzUvMTkgMTc6MzQsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IE9uIDE0LzAzLzIwMTkgMTI6
NTAsIE5vcmJlcnQgTWFudGhleSB3cm90ZToKPj4+IFdoZW4gY2hlY2tpbmcgZm9yIGJlaW5nIGFu
IGh2bSBkb21haW4sIG9yIFBWIGRvbWFpbiwgd2UgaGF2ZSB0byBtYWtlCj4+PiBzdXJlIHRoYXQg
c3BlY3VsYXRpb24gY2Fubm90IGJ5cGFzcyB0aGF0IGNoZWNrLCBhbmQgZXZlbnR1YWxseSBhY2Nl
c3MKPj4+IGRhdGEgdGhhdCBzaG91bGQgbm90IGVuZCB1cCBpbiBjYWNoZSBmb3IgdGhlIGN1cnJl
bnQgZG9tYWluIHR5cGUuCj4+Pgo+Pj4gVGhpcyBpcyBwYXJ0IG9mIHRoZSBzcGVjdWxhdGl2ZSBo
YXJkZW5pbmcgZWZmb3J0Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IE5vcmJlcnQgTWFudGhleSA8
bm1hbnRoZXlAYW1hem9uLmRlPgo+Pj4gQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KPj4+Cj4+PiAtLS0KPj4+ICB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCB8IDYgKysr
Ky0tCj4+PiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
Pj4+Cj4+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmggYi94ZW4vaW5jbHVk
ZS94ZW4vc2NoZWQuaAo+Pj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgKPj4+ICsrKyBi
L3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCj4+PiBAQCAtOTIyLDcgKzkyMiw4IEBAIHZvaWQgd2F0
Y2hkb2dfZG9tYWluX2Rlc3Ryb3koc3RydWN0IGRvbWFpbiAqZCk7Cj4+PiAgCj4+PiAgc3RhdGlj
IGlubGluZSBib29sIGlzX3B2X2RvbWFpbihjb25zdCBzdHJ1Y3QgZG9tYWluICpkKQo+Pj4gIHsK
Pj4+IC0gICAgcmV0dXJuIElTX0VOQUJMRUQoQ09ORklHX1BWKSA/IGQtPmd1ZXN0X3R5cGUgPT0g
Z3Vlc3RfdHlwZV9wdiA6IGZhbHNlOwo+Pj4gKyAgICByZXR1cm4gSVNfRU5BQkxFRChDT05GSUdf
UFYpCj4+PiArICAgICAgICAgICA/IGV2YWx1YXRlX25vc3BlYyhkLT5ndWVzdF90eXBlID09IGd1
ZXN0X3R5cGVfcHYpIDogZmFsc2U7Cj4+PiAgfQo+Pj4gIAo+Pj4gIHN0YXRpYyBpbmxpbmUgYm9v
bCBpc19wdl92Y3B1KGNvbnN0IHN0cnVjdCB2Y3B1ICp2KQo+Pj4gQEAgLTk1Myw3ICs5NTQsOCBA
QCBzdGF0aWMgaW5saW5lIGJvb2wgaXNfcHZfNjRiaXRfdmNwdShjb25zdCBzdHJ1Y3QgdmNwdSAK
PiAqdikKPj4+ICAjZW5kaWYKPj4+ICBzdGF0aWMgaW5saW5lIGJvb2wgaXNfaHZtX2RvbWFpbihj
b25zdCBzdHJ1Y3QgZG9tYWluICpkKQo+Pj4gIHsKPj4+IC0gICAgcmV0dXJuIElTX0VOQUJMRUQo
Q09ORklHX0hWTSkgPyBkLT5ndWVzdF90eXBlID09IGd1ZXN0X3R5cGVfaHZtIDogZmFsc2U7Cj4+
PiArICAgIHJldHVybiBJU19FTkFCTEVEKENPTkZJR19IVk0pCj4+PiArICAgICAgICAgICA/IGV2
YWx1YXRlX25vc3BlYyhkLT5ndWVzdF90eXBlID09IGd1ZXN0X3R5cGVfaHZtKSA6IGZhbHNlOwo+
Pj4gIH0KPj4gVW5mb3J0dW5hdGVseSwgdGhpcyBicmVha3MgdGhlIGxpdmVwYXRjaCBidWlsZCwg
aW4gYSByYXRoZXIgaW5zaWRpb3VzCj4+IHdheS4gIFRoZSBhc20gaW5zaWRlIGV2YWx1YXRlX25v
c3BlYygpIGZvcmNlcyB0aGVzZSBvdXQtb2YtbGluZS4KPj4KPj4gRHVwbGljYXRlIHN5bWJvbCAn
ZG9tY3RsLmMjaXNfcHZfZG9tYWluLmlzcmEuMCcgKGZmZmY4MmQwODAyNzAzOTAgIT0KPj4gZmZm
ZjgyZDA4MDM2YTAwNSkKPj4KPj4gT24gZm9yY2luZyB0aGVzZSB0byBiZSBhbHdheXNfaW5saW5l
LCB0aGUgbmV4dCBiaXQgb2YgYnJlYWthZ2Ugb2NjdXJzIGF0Ogo+Pgo+PiBEdXBsaWNhdGUgc3lt
Ym9sICdkb21jdGwuYyNpc19wdl8zMmJpdF9kb21haW4nIChmZmZmODJkMDgwMjcwMjcwICE9Cj4+
IGZmZmY4MmQwODAzNmEwMDApCj4+Cj4+IHdoaWNoIG1lYW5zIHdlIG5vdyBoYXZlIGEgZ29vc2Ug
Y2hhc2Ugb2YgdGhyb3dpbmcgYWx3YXlzX2lubGluZSB0aHJvdWdoCj4+IHRoZSBjb2RlLgo+Pgo+
PiBJJ20gZ29pbmcgdG8gaGF2ZSB0byByZXZlcnQgdGhpcyBpbiBYZW5TZXJ2ZXIsIGVzcGVjaWFs
bHkgc2VlaW5nIGFzCj4+IE9TU1Rlc3QgaXMgY3VycmVudGx5IG91dCBvZiBhY3Rpb24sIHdoaWNo
IEFGQUlDVCwgbWFrZXMgWGVuU2VydmVyJ3MKPj4gdGVzdGluZyB0aGUgb25seSBhdXRvbWF0aWMg
dGVzdGluZyB3aGljaCBzdGFnaW5nIGlzIGdldHRpbmcuCj4+Cj4+IEkgYWxzbyBuZWVkIHRvIHNl
ZSBhYm91dCB1cHN0cmVhbWluZyBvdXQgbG9jYWwgcGF0Y2ggd2hpY2ggY2F1c2VzIHRoZQo+PiBi
dWlsZCB0byBwcm9wZXJseSBmYWlsIGluIGNhc2VzIHdoaWNoIHdlIGtub3cgd2lsbCBicmVhayB0
aGUgYWJpbGl0eSB0bwo+PiBidWlsZCBsaXZlcGF0Y2hlcy4KPiAKPiBJIHNlZSwgdGhhbmtzIGZv
ciB0aGUgcG9pbnRlci4gSSBndWVzcyB0aGUgYnVpbGQgb25seSBmYWlscyBpbiBjYXNlIHlvdQo+
IHBhdGNoIHNvbWUgZnVuY3Rpb24gdGhhdCBuZWVkcyBvbmUgb2YgdGhlIHR3bz8gSW4gY2FzZSB5
b3UgaGF2ZQo+IHNvbWV0aGluZyB0aGF0IHJlcHJvZHVjZXMgdGhlIHByb2JsZW0sIGFuZCBjYW4g
YmUgc2hhcmVkLCB3ZSBtaWdodCBoYXZlCj4gYSBsb29rLiBUaGFua3MhCgpJIHRvbyBkaWQgbm90
aWNlIHRoZSBpc3N1ZSB3aGlsZSBjb21taXR0aW5nIHlvdXIgcGF0Y2hlcywgc28gdGhlcmUncwpu
byBzcGVjaWFsIHNldHVwIG5lZWRlZCAobWlnaHQgYmUgY29tcGlsZXIgdmVyc2lvbiBkZXBlbmRl
bnQsCnRob3VnaCkuIEkgbWVyZWx5IGZhaWxlZCB0byBtYWtlIHRoZSBjb25uZWN0aW9uIHRvIGxp
dmUtcGF0Y2hpbmcsIG9yCmVsc2UgSSB3b3VsZCBoYXZlIHJlZnJhaW5lZCBmcm9tIHB1c2hpbmcg
dGhlIGNoYW5nZXMuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
