Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29C80C282CE
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 09:52:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0379C20870
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 09:52:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0379C20870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDQwk-0001bf-HW; Mon, 08 Apr 2019 09:52:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=p7a1=SK=citrix.com=prvs=9940f4835=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hDQwj-0001ba-Hp
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 09:52:09 +0000
X-Inumbo-ID: f8684994-59e3-11e9-92d7-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f8684994-59e3-11e9-92d7-bc764e045a96;
 Mon, 08 Apr 2019 09:52:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,324,1549929600"; d="scan'208";a="88497351"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: George Dunlap <George.Dunlap@citrix.com>, Anthony Perard
 <anthony.perard@citrix.com>
Thread-Topic: [Xen-devel] PCI Device Subtree Change from Traditional to
 Upstream
Thread-Index: AQHTlgX0Q1s93AFOR0OZODoaFYtXIKOE0R+AgAACzwCAASL44IKum4mAgAAie4A=
Date: Mon, 8 Apr 2019 09:51:57 +0000
Message-ID: <770e1db433024ef78e296d284d050ab8@AMSPEX02CL02.citrite.net>
References: <c8ed6851-70c1-500d-5d66-1e8a6b7133c5@steadfast.net>
 <20180103175759.GA1905@perard.uk.xensource.com>
 <3a19395e-c52f-bbfd-5986-ba56cc10c767@steadfast.net>
 <20180104125217.GB1905@perard.uk.xensource.com>
 <10c96acc-9bb5-713b-93c9-60f06c84bfd5@citrix.com>
 <20180125180439.GC2183@perard.uk.xensource.com>
 <2b101965-dfeb-61a2-ab15-8fb75330e536@citrix.com>
 <b96b8dcec4944918a41c60ab63bdf841@AMSPEX02CL03.citrite.net>
 <eefdc065-6557-a5a7-e0c5-f941ce6a6911@citrix.com>
In-Reply-To: <eefdc065-6557-a5a7-e0c5-f941ce6a6911@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] PCI Device Subtree Change from Traditional to
 Upstream
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
Cc: Kevin Stange <kevin@steadfast.net>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190408095157.jcQNbcDiTlhvy8fblyybYHEOAkgOIMga84dzF2Pb5wc@z>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHZW9yZ2UgRHVubGFwIFttYWls
dG86Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tXQ0KPiBTZW50OiAwOCBBcHJpbCAyMDE5IDEwOjQ3
DQo+IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsgQW50aG9ueSBQ
ZXJhcmQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+DQo+IENjOiBLZXZpbiBTdGFuZ2UgPGtl
dmluQHN0ZWFkZmFzdC5uZXQ+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3Vi
amVjdDogUmU6IFtYZW4tZGV2ZWxdIFBDSSBEZXZpY2UgU3VidHJlZSBDaGFuZ2UgZnJvbSBUcmFk
aXRpb25hbCB0byBVcHN0cmVhbQ0KPiANCj4gT24gMS8yNi8xOCAxMDozOCBBTSwgUGF1bCBEdXJy
YW50IHdyb3RlOg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBY
ZW4tZGV2ZWwgW21haWx0bzp4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZ10g
T24gQmVoYWxmDQo+ID4+IE9mIEdlb3JnZSBEdW5sYXANCj4gPj4gU2VudDogMjUgSmFudWFyeSAy
MDE4IDE4OjE1DQo+ID4+IFRvOiBBbnRob255IFBlcmFyZCA8YW50aG9ueS5wZXJhcmRAY2l0cml4
LmNvbT4NCj4gPj4gQ2M6IEtldmluIFN0YW5nZSA8a2V2aW5Ac3RlYWRmYXN0Lm5ldD47IHhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsNCj4gPj4gR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1
bmxhcEBjaXRyaXguY29tPg0KPiA+PiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gUENJIERldmlj
ZSBTdWJ0cmVlIENoYW5nZSBmcm9tIFRyYWRpdGlvbmFsIHRvDQo+ID4+IFVwc3RyZWFtDQo+ID4+
DQo+ID4+IE9uIDAxLzI1LzIwMTggMDY6MDQgUE0sIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiA+
Pj4gT24gVGh1LCBKYW4gMjUsIDIwMTggYXQgMDU6NTQ6MzZQTSArMDAwMCwgR2VvcmdlIER1bmxh
cCB3cm90ZToNCj4gPj4+PiBPbiAwMS8wNC8yMDE4IDEyOjUyIFBNLCBBbnRob255IFBFUkFSRCB3
cm90ZToNCj4gPj4+Pj4gRnJvbTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJp
eC5jb20+DQo+ID4+Pj4+IFN1YmplY3Q6IFtQQVRDSF0gbGlieGxfZG06IEV4cGxpY2l0bHkgcHV0
IHhlbi1wbGF0Zm9ybSBkZXZpY2Ugb24gUENJIHNsb3QNCj4gPj4gMw0KPiA+Pj4+Pg0KPiA+Pj4+
PiBJbiBvcmRlciB0byBkbyB0aGF0LCB3ZSBkb24ndCB1c2UgeGVuZnYgbWFjaGluZSBhbnltb3Jl
IGFuZCBleHBsaWNpdHkNCj4gPj4+Pj4gYWRkIHRoZSBwbGF0Zm9ybSBkZXZpY2Ugb24gdGhlIGNv
bW1hbmQgbGluZS4NCj4gPj4+Pj4NCj4gPj4+Pj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJB
UkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+DQo+ID4+Pj4NCj4gPj4+PiBBbnRob255LA0K
PiA+Pj4+DQo+ID4+Pj4gSXQgc2VlbXMgbGlrZSB3ZSBtaWdodCB3YW50IHRvIGFkZCB0aGUgYWJp
bGl0eSB0byBzcGVjaWZ5IHdoaWNoIHNsb3Qgd2UNCj4gPj4+PiB3YW50IHRoZSB4ZW4tcGxhdGZv
cm0gZGV2aWNlIHRvIG9jY3VweS4gSXMgaXQgd29ydGggdGhpbmtpbmcgb2YgdGhlIGJlc3QNCj4g
Pj4+PiB3YXkgdG8gYWRkIGEgcGF0Y2ggbGlrZSB0aGlzIHVwc3RyZWFtPw0KPiA+Pj4NCj4gPj4+
IEkgdGhpbmsgdGhhdCB3b3VsZCBiZSBuaWNlIGZvciBwZW9wbGUgd2hvIHN3aXRjaCBmcm9tIHFl
bXUtdHJhZCB0bw0KPiA+Pj4gUUVNVS4gVGhlIG9ubHkgcXVlc3Rpb24gdGhhdCByZW1haW4gaXMs
IGhvdyB0byBuYW1lIHRoZSB4bCBjb25maWcNCj4gPj4+IG9wdGlvbj8gIFRoZSByZXN0IGlzIHRv
IHNpbXBseSB0YWtlIG15IGxpYnhsIHBhdGNoIGFuZCBtYWtlIGl0IHVzZQ0KPiA+Pj4gdGhlIG5l
dyBjb25maWcgb3B0aW9uLg0KPiA+Pg0KPiA+PiBXZWxsIHRoZSBvdGhlciBoYWxmIHdvdWxkIGJl
IHRvIG1ha2Ugc3VyZSBzb21ldGhpbmcgbGlrZSB0aGlzIGRvZXNuJ3QNCj4gPj4gaGFwcGVuIGJ5
IGFjY2lkZW50IGluIHRoZSBmdXR1cmUgLS0gaS5lLiwgdGhhdCBubyBmdXR1cmUgY2hhbmdlcyBp
biBRRU1VDQo+ID4+IHdpbGwgYWNjaWRlbnRhbGx5IG1vdmUgaXQgYXdheSBmcm9tIHdoYXRldmVy
IHRoZSBjdXJyZW50IHNsb3QgaXMgbm93Lg0KPiA+Pg0KPiA+DQo+ID4gSU1PLCBpdCB3b3VsZCBi
ZSBiZXN0IGlmIGxpYnhsIHNwZWNpZmllZCB0aGUgYnVzIHRvcG9sb2d5IGV4YWN0bHkgKGkuZS4g
c3BlY2lmaWVkIGRldmZuIGZvcg0KPiBldmVyeXRoaW5nIHRoYXQgYXBwZWFycyBvbiB0aGUgYnVz
KS4gSWYgd2UsIGFzIEkgaG9wZSwgbWFrZSBhIG1vdmUgdG8gaGF2aW5nIFhlbiByYXRoZXIgdGhh
biBRRU1VIG93bg0KPiB0aGUgdG9wb2xvZ3kgdGhlbiB0aGlzIHNob3VsZCBob3BlZnVsbHkgZW5z
dXJlIGF0IGxlYXN0IHNvbWUgZGVncmVlIG9mIGZvcndhcmQgY29tcGF0aWJpbGl0eS4NCj4gDQo+
IElzIHRoaXMgb24gYW55Ym9keSdzIHJhZGFyPyAgSXQgc2VlbXMgbGlrZSB0aGlzIHdvdWxkbid0
IGJlIGEgaHVnZQ0KPiBhbW91bnQgb2Ygd29yaywgYW5kIGl0IHdvdWxkIHByZXZlbnQgdGhpcyBz
b3J0IG9mIGNvbXBhdGliaWxpdHkgaXNzdWUgaW4NCj4gdGhlIGZ1dHVyZS4NCg0KVGhpcyB2ZXJ5
IHRvcGljIGNhbWUgdXAgaW4gcmVsYXRpb24gdG8gdGhlIFhBUEkgdG9vbHN0YWNrIGxhc3Qgd2Vl
ay4gSXQgd291bGQgZGVmaW5pdGVseSBiZSBnb29kIHRvIGhhdmUgY29tbW9uYWxpdHkgd2l0aCBs
aWJ4bCBvbiB0aGlzIGJ1dCBJJ20gbm90IGF3YXJlIG9mIGFueW9uZSB3b3JraW5nIG9uIHRoaXMu
DQoNCiAgUGF1bA0KDQo+IA0KPiAgLUdlb3JnZQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
