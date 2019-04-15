Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBEAFC10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 17:28:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF10820656
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 17:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF10820656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hG5P6-0003ov-GG; Mon, 15 Apr 2019 17:28:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/xrN=SR=citrix.com=prvs=001d99114=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hG5P4-0003oo-LE
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 17:28:22 +0000
X-Inumbo-ID: dc798d65-5fa3-11e9-92d7-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id dc798d65-5fa3-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 17:28:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,354,1549929600"; d="scan'208";a="88856149"
From: George Dunlap <George.Dunlap@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Thread-Topic: [PATCH v2 1/2] x86/mem_sharing: reorder when pages are unlocked
 and released
Thread-Index: AQHU8WjyucbxmRoWxka0Dg3udJHQZqY9OWSAgAAC0ICAACChAA==
Date: Mon, 15 Apr 2019 17:28:08 +0000
Message-ID: <F6EF77CA-6EF8-4B5A-AEA7-C6284D371ECD@citrix.com>
References: <20190412194712.1602-1-tamas@tklengyel.com>
 <3c3ff047-5026-8b4a-c980-822fb730eaea@citrix.com>
 <CABfawhnkt8i5VYEp2ySes9oBc6=pvrU-vcQ7G0UiuVNpW+g1QQ@mail.gmail.com>
In-Reply-To: <CABfawhnkt8i5VYEp2ySes9oBc6=pvrU-vcQ7G0UiuVNpW+g1QQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.8)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <69C4026E6C571D42967BABFD1BF56DED@citrix.com>
MIME-Version: 1.0
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
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190415172808.tR5X7HjwTrhoCP97JiYfwMAn5eMLvztwptO1gG40yz0@z>

DQoNCj4gT24gQXByIDE1LCAyMDE5LCBhdCA0OjMxIFBNLCBUYW1hcyBLIExlbmd5ZWwgPHRhbWFz
QHRrbGVuZ3llbC5jb20+IHdyb3RlOg0KPiANCj4gT24gTW9uLCBBcHIgMTUsIDIwMTkgYXQgOToy
MSBBTSBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOg0KPj4g
DQo+PiBPbiA0LzEyLzE5IDg6NDcgUE0sIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToNCj4+PiBQYXRj
aCAwNTAyZTBhZGFlMiAieDg2OiBjb3JyZWN0IGluc3RhbmNlcyBvZiBQR0NfYWxsb2NhdGVkIGNs
ZWFyaW5nIiBpbnRyb2R1Y2VkDQo+Pj4gZ3JhYmJpbmcgZXh0cmEgcmVmZXJlbmNlcyBmb3IgcGFn
ZXMgdGhhdCBkcm9wIHJlZmVyZW5jZXMgdGllZCB0byBQR0NfYWxsb2NhdGVkLg0KPj4+IEhvd2V2
ZXIsIHRoZSB3YXkgdGhlc2UgZXh0cmEgcmVmZXJlbmNlcyB3ZXJlIGdyYWJiZWQgd2VyZSBpbmNv
cnJlY3QsIHJlc3VsdGluZw0KPj4+IGluIGJvdGggc2hhcmVfcGFnZXMgYW5kIHVuc2hhcmVfcGFn
ZXMgZmFpbGluZy4NCj4+IA0KPj4gV2h5PyAgSXMgY2Qgbm90IHRoZSBvd25lciBvZiB0aGUgcGFn
ZT8NCj4gDQo+IEl0J3Mgbm90LCBkb21fY293IGlzLg0KPiANCj4+PiBAQCAtMTAwMiw3ICs5OTQs
MTAgQEAgc3RhdGljIGludCBzaGFyZV9wYWdlcyhzdHJ1Y3QgZG9tYWluICpzZCwgZ2ZuX3Qgc2dm
biwgc2hyX2hhbmRsZV90IHNoLA0KPj4+ICAgICAvKiBGcmVlIHRoZSBjbGllbnQgcGFnZSAqLw0K
Pj4+ICAgICBpZih0ZXN0X2FuZF9jbGVhcl9iaXQoX1BHQ19hbGxvY2F0ZWQsICZjcGFnZS0+Y291
bnRfaW5mbykpDQo+Pj4gICAgICAgICBwdXRfcGFnZShjcGFnZSk7DQo+Pj4gLSAgICBwdXRfcGFn
ZShjcGFnZSk7DQo+Pj4gKw0KPj4+ICsgICAgQVNTRVJUKHB1dF9jb3VudCk7DQo+Pj4gKyAgICB3
aGlsZSAoIHB1dF9jb3VudC0tICkNCj4+PiArICAgICAgICBwdXRfcGFnZV9hbmRfdHlwZShjcGFn
ZSk7DQo+PiANCj4+IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBpbiB0aGUgc3Bpcml0IG9mIHRoZSBm
aXggaW4gMDUwMmUwYWRhZTI7IHRoZSBpZGVhDQo+PiB0aGVyZSBzZWVtcyB0byBoYXZlIGJlZW4g
dG8gbWFrZSBzdXJlIHRoYXQgY3BhZ2UgYmVsb25ncyB0byB0aGUgcmlnaHQNCj4+IGRvbWFpbiwg
YW5kIHRoYXQgdGhlIG93bmVyc2hpcCBkb2Vzbid0IGNoYW5nZS4gIElmIHN1Y2ggYSByYWNlIC8g
bWlzdGFrZQ0KPj4gd2VyZSBwb3NzaWJsZSBiZWZvcmUgdGhhdCBjaGFuZ2UsIHN1Y2ggYSByYWNl
IC8gbWlzdGFrZSB3b3VsZCBiZQ0KPj4gcG9zc2libGUgYWZ0ZXIgdGhpcyBjaGFuZ2UsIHdvdWxk
bid0IGl0Pw0KPiANCj4gSSBkb24ndCBoYXZlIGFuIGFuc3dlciB0byB5b3VyIHF1ZXN0aW9uLiBB
RkFJVSB0aGlzIGlzIGp1c3QgdG8gZW5zdXJlDQo+IHRoYXQgdGhlIHBhZ2UgaXNuJ3QgZHJvcHBl
ZCBiZWZvcmUgdGVzdF9hbmRfY2xlYXJfYml0IGlzIHVzZWQgb24gdGhlDQo+IHBhZ2UuDQoNClJp
Z2h0LCBidXQgd2h5IHdvdWxkIHRoYXQgYmUgYSBiYWQgdGhpbmc/DQoNCkkgdGhpbmsgaXTigJlz
IHRvIGF2b2lkIHJhY2VzIGxpa2UgdGhpczoNCg0KUDE6IEdldHMgcG9pbnRlciB0byBwYWdlIEEs
IG93bmVkIGJ5IGRvbWFpbiBNDQpQMjogR2V0cyBwb2ludGVyIHRvIHBhZ2UgQSwgb3duZWQgYnkg
ZG9tYWluIE0NClAyOiB0ZXN0X2FuZF9jbGVhcl9iaXQoUEdDX2FsbG9jYXRlZCkgc3VjY2VlZHMN
ClAyOiBwdXRfcGFnZSgpDQogIC0+IHBhZ2UgZnJlZWQNCiAgLT4gUGFnZSByZS1hbGxvY2F0ZWQg
dG8gZG9tYWluIE4NClAxOiB0ZXN0X2FuZF9jbGVhcl9iaXQoUEdDX2FsbG9jYXRlZCkgc3VjY2Vl
ZHMNClAxOiBwdXRfcGFnZSgpIA0KICAtPiBwYWdlIGZyZWVkICMjDQoNCk5vdyBQMSBpbmNvcnJl
Y3RseSDigJxmcmVlc+KAnSBhIHBhZ2Ugb3duZWQgYnkgZG9tYWluIE4uDQoNCklmIGJvdGggUDEg
YW5kIFAyIGNhbGwgZ2V0X3BhZ2UoQSwgTSkgZmlyc3QsIGFuZCBkcm9wIHRoYXQgcmVmZXJlbmNl
IGFmdGVyd2FyZHMsIHRoaXMgcmFjZSBjYW7igJl0IGhhcHBlbi4NCg0KSmFuLCB5b3XigJlyZSB0
aGUgYXV0aG9yIG9mIHRoYXQgcGF0Y2gg4oCUIGlzIHRoYXQgbm90IHRoZSBjYXNlPw0KDQpDb3Vs
ZCBhIHNpbWlsYXIgcmFjZSB0byB0aGUgYWJvdmUgb2NjdXIgaW4gdGhpcyBjb2RlPyAgSXQgbG9v
a3MgbGlrZSBpdCBjb3VsZCBoYXZlIGJlZm9yZSAwNTAyZTBhZGFlMiBmb3Igc3VyZSwgc2luY2Ug
YWxsIHJlZmVyZW5jZXMgYW5kIGxvY2tzIHdlcmUgZHJvcHBlZC4gIEl04oCZcyBub3QgY2xlYXIg
dG8gbWUgd2hldGhlciBtZW1fc2hhcmluZ19wYWdlX2xvY2soKSB3aWxsIHByb3RlY3QgYWdhaW5z
dCBvd25lcnNoaXAgY2hhbmdlcy4NCg0KKklmKiB0aGF0IGFzc2VydGlvbiB5b3UgYWRkZWQgaXMg
YWx3YXlzIHRydWUsIHRoYXQgdGhlcmUgaXMgYWx3YXlzIGF0IGxlYXN0IG9uZSByZWZlcmVuY2Ug
aW4gdGhlIHJtYXAgdGhhdCB3aWxsIGJlIGhlbGQ7ICphbmQqIHRob3NlIHJlZmVyZW5jZXMgYXJl
IGFsd2F5cyDigJxoZWxk4oCdIG9uIGJlaGFsZiBvZiBkb21fY293LCB0aGVuIEkgdGhpbmsgeW91
ciB2ZXJzaW9uIHdpbGwgcHJvYmFibHkgYmUgc2FmZSAoYXMgdGhlIHJlZmVyZW5jZSBpbiB0aGUg
cm1hcCB3aWxsIHByZXZlbnQgaXQgZnJvbSBjaGFuZ2luZyBvd25lcnNoaXAgdW50aWwgdGhlIGZp
bmFsIHB1dF9wYWdlX2FuZF90eXBlKCkpLiAgQnV0IGlmICMyIGV2ZXIgZmFsc2UgZm9yIGFueSBy
ZWFzb24gKGV2ZW4gZHVlIHRvIGEgYnVnIGluIFhlbiksIHRoZW4gdGhpcyB3aWxsIG9wZW4gdXAg
YSBwb3RlbnRpYWwgc2VjdXJpdHkgaXNzdWUgKHNpbmNlIEFTU0VSVCgpcyBkb27igJl0IHRyaWdn
ZXIgaW4gcHJvZHVjdGlvbiBjb2RlKS4NCg0KQSBjb3VwbGUgb2Ygb3B0aW9uczoNCiogTWFrZSBp
dCBhIEJVR19PTigpOyB0aGF0IHdvdWxkIGNoYW5nZSBhIHBvdGVudGlhbCBwcml2aWxlZ2UgZXNj
YWxhdGlvbiBpbnRvIGEgRG9TDQoqIE9ubHkgY2xlYXIgUEdDX2FsbG9jYXRlZCBpZiBwdXRfY291
bnQgPiAwLiAgVGhpcyBjaGFuZ2VzIGEgcG90ZW50aWFsIHByaXZpbGVnZSBlc2NhbGF0aW9uIGlu
dG8gYSBzbG93IG1lbW9yeSBsZWFrDQoqIElmIHB1dF9jb3VudCA9PSAwLCBncmFiIGFuIGV4dHJh
IHJlZmVyZW5jZSBhbmQgZHJvcCBpdCBhZnRlcndhcmRzICh3aXRoIGFuIEFTU0VSVF9VTlJFQUNI
QUJMRSgpIHRvIGhlbHAgY2F0Y2ggZXJyb3JzIGVhcmx5KS4gIFRoaXMgYXZvaWRzIGFueSBYU0Es
IGJ1dCBtYWtlcyB0aGUgY29kZSBhIGJpdCB1Z2xpZXIuDQoqIExlYXZlIHRoZSBjb2RlIGFzIGl0
IGlzOyBqdXN0IGNoYW5nZSB0aGUgZ2V0X3BhZ2UoKSB0byBncmFiYmluZyBkb21fY293IHJhdGhl
ciB0aGFuIGNkLiAgVGhpcyBhdm9pZHMgYW55IFhTQSwgYnV0IGFkZHMgYW4gZXh0cmEgZ2V0IC8g
cHV0IHBhZ2Ugd2hpY2ggd2lsbCBiZSBwdXJlIG92ZXJoZWFkIGluIHRoZSBjb21tb24gY2FzZS4N
Cg0KVGhvdWdodHM/DQoNCiAtR2VvcmdlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
