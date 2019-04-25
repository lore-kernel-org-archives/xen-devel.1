Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1E21C10F03
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 11:11:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A94B217FA
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 11:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A94B217FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJcI2-0003FF-VT; Thu, 25 Apr 2019 11:11:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJcI1-0003F9-7l
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 11:11:41 +0000
X-Inumbo-ID: e5b6d48b-674a-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e5b6d48b-674a-11e9-843c-bc764e045a96;
 Thu, 25 Apr 2019 11:11:39 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 25 Apr 2019 05:11:38 -0600
Message-Id: <5CC195E70200007800228FFA@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 25 Apr 2019 05:11:35 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <george.dunlap@citrix.com>
References: <20190412194712.1602-1-tamas@tklengyel.com>
 <3c3ff047-5026-8b4a-c980-822fb730eaea@citrix.com>
 <CABfawhnkt8i5VYEp2ySes9oBc6=pvrU-vcQ7G0UiuVNpW+g1QQ@mail.gmail.com>
 <F6EF77CA-6EF8-4B5A-AEA7-C6284D371ECD@citrix.com>
In-Reply-To: <F6EF77CA-6EF8-4B5A-AEA7-C6284D371ECD@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2 1/2] x86/mem_sharing: reorder when pages
 are unlocked and released
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
 Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425111135.MhzpYLUcQYzS9ad6z-TnrLonsdiGcVu9DcaykPx_hms@z>

Pj4+IE9uIDE1LjA0LjE5IGF0IDE5OjI4LCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPj4gT24gQXByIDE1LCAyMDE5LCBhdCA0OjMxIFBNLCBUYW1hcyBLIExlbmd5ZWwgPHRhbWFz
QHRrbGVuZ3llbC5jb20+IHdyb3RlOgo+PiBPbiBNb24sIEFwciAxNSwgMjAxOSBhdCA5OjIxIEFN
IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBPbiA0
LzEyLzE5IDg6NDcgUE0sIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPj4+PiBQYXRjaCAwNTAyZTBh
ZGFlMiAieDg2OiBjb3JyZWN0IGluc3RhbmNlcyBvZiBQR0NfYWxsb2NhdGVkIGNsZWFyaW5nIiBp
bnRyb2R1Y2VkCj4+Pj4gZ3JhYmJpbmcgZXh0cmEgcmVmZXJlbmNlcyBmb3IgcGFnZXMgdGhhdCBk
cm9wIHJlZmVyZW5jZXMgdGllZCB0byBQR0NfYWxsb2NhdGVkLgo+Pj4+IEhvd2V2ZXIsIHRoZSB3
YXkgdGhlc2UgZXh0cmEgcmVmZXJlbmNlcyB3ZXJlIGdyYWJiZWQgd2VyZSBpbmNvcnJlY3QsIHJl
c3VsdGluZwo+Pj4+IGluIGJvdGggc2hhcmVfcGFnZXMgYW5kIHVuc2hhcmVfcGFnZXMgZmFpbGlu
Zy4KPj4+IAo+Pj4gV2h5PyAgSXMgY2Qgbm90IHRoZSBvd25lciBvZiB0aGUgcGFnZT8KPj4gCj4+
IEl0J3Mgbm90LCBkb21fY293IGlzLgo+PiAKPj4+PiBAQCAtMTAwMiw3ICs5OTQsMTAgQEAgc3Rh
dGljIGludCBzaGFyZV9wYWdlcyhzdHJ1Y3QgZG9tYWluICpzZCwgZ2ZuX3Qgc2dmbiwgc2hyX2hh
bmRsZV90IHNoLAo+Pj4+ICAgICAvKiBGcmVlIHRoZSBjbGllbnQgcGFnZSAqLwo+Pj4+ICAgICBp
Zih0ZXN0X2FuZF9jbGVhcl9iaXQoX1BHQ19hbGxvY2F0ZWQsICZjcGFnZS0+Y291bnRfaW5mbykp
Cj4+Pj4gICAgICAgICBwdXRfcGFnZShjcGFnZSk7Cj4+Pj4gLSAgICBwdXRfcGFnZShjcGFnZSk7
Cj4+Pj4gKwo+Pj4+ICsgICAgQVNTRVJUKHB1dF9jb3VudCk7Cj4+Pj4gKyAgICB3aGlsZSAoIHB1
dF9jb3VudC0tICkKPj4+PiArICAgICAgICBwdXRfcGFnZV9hbmRfdHlwZShjcGFnZSk7Cj4+PiAK
Pj4+IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBpbiB0aGUgc3Bpcml0IG9mIHRoZSBmaXggaW4gMDUw
MmUwYWRhZTI7IHRoZSBpZGVhCj4+PiB0aGVyZSBzZWVtcyB0byBoYXZlIGJlZW4gdG8gbWFrZSBz
dXJlIHRoYXQgY3BhZ2UgYmVsb25ncyB0byB0aGUgcmlnaHQKPj4+IGRvbWFpbiwgYW5kIHRoYXQg
dGhlIG93bmVyc2hpcCBkb2Vzbid0IGNoYW5nZS4gIElmIHN1Y2ggYSByYWNlIC8gbWlzdGFrZQo+
Pj4gd2VyZSBwb3NzaWJsZSBiZWZvcmUgdGhhdCBjaGFuZ2UsIHN1Y2ggYSByYWNlIC8gbWlzdGFr
ZSB3b3VsZCBiZQo+Pj4gcG9zc2libGUgYWZ0ZXIgdGhpcyBjaGFuZ2UsIHdvdWxkbid0IGl0Pwo+
PiAKPj4gSSBkb24ndCBoYXZlIGFuIGFuc3dlciB0byB5b3VyIHF1ZXN0aW9uLiBBRkFJVSB0aGlz
IGlzIGp1c3QgdG8gZW5zdXJlCj4+IHRoYXQgdGhlIHBhZ2UgaXNuJ3QgZHJvcHBlZCBiZWZvcmUg
dGVzdF9hbmRfY2xlYXJfYml0IGlzIHVzZWQgb24gdGhlCj4+IHBhZ2UuCj4gCj4gUmlnaHQsIGJ1
dCB3aHkgd291bGQgdGhhdCBiZSBhIGJhZCB0aGluZz8KPiAKPiBJIHRoaW5rIGl04oCZcyB0byBh
dm9pZCByYWNlcyBsaWtlIHRoaXM6Cj4gCj4gUDE6IEdldHMgcG9pbnRlciB0byBwYWdlIEEsIG93
bmVkIGJ5IGRvbWFpbiBNCj4gUDI6IEdldHMgcG9pbnRlciB0byBwYWdlIEEsIG93bmVkIGJ5IGRv
bWFpbiBNCj4gUDI6IHRlc3RfYW5kX2NsZWFyX2JpdChQR0NfYWxsb2NhdGVkKSBzdWNjZWVkcwo+
IFAyOiBwdXRfcGFnZSgpCj4gICAtPiBwYWdlIGZyZWVkCj4gICAtPiBQYWdlIHJlLWFsbG9jYXRl
ZCB0byBkb21haW4gTgo+IFAxOiB0ZXN0X2FuZF9jbGVhcl9iaXQoUEdDX2FsbG9jYXRlZCkgc3Vj
Y2VlZHMKPiBQMTogcHV0X3BhZ2UoKSAKPiAgIC0+IHBhZ2UgZnJlZWQgIyMKPiAKPiBOb3cgUDEg
aW5jb3JyZWN0bHkg4oCcZnJlZXPigJ0gYSBwYWdlIG93bmVkIGJ5IGRvbWFpbiBOLgo+IAo+IElm
IGJvdGggUDEgYW5kIFAyIGNhbGwgZ2V0X3BhZ2UoQSwgTSkgZmlyc3QsIGFuZCBkcm9wIHRoYXQg
cmVmZXJlbmNlIAo+IGFmdGVyd2FyZHMsIHRoaXMgcmFjZSBjYW7igJl0IGhhcHBlbi4KPiAKPiBK
YW4sIHlvdeKAmXJlIHRoZSBhdXRob3Igb2YgdGhhdCBwYXRjaCDigJQgaXMgdGhhdCBub3QgdGhl
IGNhc2U/CgpZZXMgaW5kZWVkLCB0aGF0J3Mgd2h5IEkgZGlkIGFkZCB0aGUgZXh0cmEgZ2V0X3Bh
Z2UoKSAobm90CnJlYWxpemluZyB0aGUgb3duaW5nIGRvbWFpbiBpcyB0aGUgd3Jvbmcgb25lKS4K
CkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
