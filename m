Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0ABBC4321A
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 09:55:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7F322084F
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 09:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7F322084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJxZu-00074B-Ti; Fri, 26 Apr 2019 09:55:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uGF6=S4=zhaoxin.com=fionali-oc@srs-us1.protection.inumbo.net>)
 id 1hJxZt-000745-J5
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 09:55:33 +0000
X-Inumbo-ID: 6b9d7831-6809-11e9-843c-bc764e045a96
Received: from ZXSHCAS2.zhaoxin.com (unknown [203.148.12.82])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6b9d7831-6809-11e9-843c-bc764e045a96;
 Fri, 26 Apr 2019 09:55:30 +0000 (UTC)
Received: from zxbjmbx3.zhaoxin.com (10.29.252.165) by ZXSHCAS2.zhaoxin.com
 (10.28.252.162) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1261.35; Fri, 26 Apr
 2019 17:55:25 +0800
Received: from zxbjmbx1.zhaoxin.com (10.29.252.163) by zxbjmbx3.zhaoxin.com
 (10.29.252.165) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1261.35; Fri, 26 Apr
 2019 17:55:24 +0800
Received: from zxbjmbx1.zhaoxin.com ([fe80::b41a:737:a784:b70d]) by
 zxbjmbx1.zhaoxin.com ([fe80::b41a:737:a784:b70d%16]) with mapi id
 15.01.1261.035; Fri, 26 Apr 2019 17:55:24 +0800
From: FionaLi-oc <FionaLi-oc@zhaoxin.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH 2/2 v2] x86/acpi: Improve suspend and resume process for
 Zhaoxin CPU
Thread-Index: AQHU9o0GhOqy759m7U2qn/A3g9nFGaZMYHSAgAABBICAAANeAIAAAVaAgAHW8+A=
Date: Fri, 26 Apr 2019 09:55:24 +0000
Message-ID: <c6c11c59c5914e62bcf8f07dc3c6a0fa@zhaoxin.com>
References: <1555663857-4173-1-git-send-email-fionali-oc@zhaoxin.com>
 <5CC1B46B0200007800229134@prv1-mh.provo.novell.com>
 <89dcdf84-214d-d100-e2a1-8bd151f215bd@citrix.com>
 <5CC1B818020000780022916A@prv1-mh.provo.novell.com>
 <b4952c32-0162-7d92-ab11-825daae4dd06@citrix.com>
In-Reply-To: <b4952c32-0162-7d92-ab11-825daae4dd06@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.29.8.62]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 2/2 v2] x86/acpi: Improve suspend and resume
 process for Zhaoxin CPU
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 "Cobe Chen\(BJ-RD\)" <CobeChen@zhaoxin.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190426095524.KEdj1rdZBze4Bbk6CA1twe-Uf-UFg5pqUMiY6Imp1m0@z>

QW5kcmV377yMDQpEbyBJIG5lZWQgdG8gc3VibWl0IGEgdjMgd2l0aCBjcHVfaGFzX3NlcCBiYXNl
ZCBzb2x1dGlvbj8gT3IgZG8geW91IGRlYWwgd2l0aCBpdD8NCg0KPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPg0KPiBTZW50OiBUaHVyc2RheSwgQXByaWwgMjUsIDIwMTkgOTo0MiBQTQ0KPiBUbzogSmFu
IEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPjsgRmlvbmFMaS1vYyA8RmlvbmFMaS1vY0B6aGFv
eGluLmNvbT4NCj4gQ2M6IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBX
ZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPjsNCj4geGVuLWRldmVsIDx4ZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmc+OyBDb2JlIENoZW4oQkotUkQpDQo+IDxDb2JlQ2hlbkB6aGFveGlu
LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzIgdjJdIHg4Ni9hY3BpOiBJbXByb3ZlIHN1
c3BlbmQgYW5kIHJlc3VtZSBwcm9jZXNzIGZvcg0KPiBaaGFveGluIENQVQ0KPiANCj4gT24gMjUv
MDQvMjAxOSAxNDozNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+ID4+Pj4gT24gMjUuMDQuMTkgYXQg
MTU6MjUsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4gPj4gT24gMjUvMDQv
MjAxOSAxNDoyMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+ID4+Pj4+PiBPbiAxOS4wNC4xOSBhdCAx
MDo1MCwgPGZpb25hbGktb2NAemhhb3hpbi5jb20+IHdyb3RlOg0KPiA+Pj4+IC0tLSBhL3hlbi9h
cmNoL3g4Ni94ODZfNjQvdHJhcHMuYw0KPiA+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni94ODZfNjQv
dHJhcHMuYw0KPiA+Pj4+IEBAIC0zMzQsNyArMzM0LDggQEAgdm9pZCBzdWJhcmNoX3BlcmNwdV90
cmFwc19pbml0KHZvaWQpDQo+ID4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgKHVuc2lnbmVkIGxvbmcpbHN0YXJfZW50ZXIpOw0KPiA+Pj4+ICAgICAgc3R1Yl92YSArPSBv
ZmZzZXQ7DQo+ID4+Pj4NCj4gPj4+PiAtICAgIGlmICggYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9y
ICYgKFg4Nl9WRU5ET1JfSU5URUwgfA0KPiBYODZfVkVORE9SX0NFTlRBVVIpDQo+ID4+ICkNCj4g
Pj4+PiArICAgIGlmICggYm9vdF9jcHVfZGF0YS54ODZfdmVuZG9yICYNCj4gPj4+PiArICAgICAg
ICAoWDg2X1ZFTkRPUl9JTlRFTCB8IFg4Nl9WRU5ET1JfQ0VOVEFVUiB8DQo+ID4+Pj4gKyBYODZf
VkVORE9SX1NIQU5HSEFJKSApDQo+ID4+Pj4gICAgICB7DQo+ID4+Pj4gICAgICAgICAgLyogU1lT
RU5URVIgZW50cnkuICovDQo+ID4+Pj4gICAgICAgICAgd3Jtc3JsKE1TUl9JQTMyX1NZU0VOVEVS
X0VTUCwgc3RhY2tfYm90dG9tKTsNCj4gPj4+IEhvdyBpcyB0aGlzIGh1bmsgcmVsYXRlZCB0byB0
aGUgdGl0bGUgb2YgdGhlIGNoYW5nZT8gSSB0aGluayB0aGUNCj4gPj4+IHRpdGxlIHdhbnRzIHRv
IGJlIGFkanVzdGVkLg0KPiA+Pj4NCj4gPj4+IEZ1cnRoZXJtb3JlIGZvciBhbGwgb2YgdGhlIGNo
YW5nZXMgZG9uZSwgd291bGRuJ3Qgd2UgYmV0dGVyIHN3aXRjaA0KPiA+Pj4gdG8gdXNlIGNwdV9o
YXNfc2VwPyBpbml0X2FtZCgpIGFzIHdlbGwgYXMgZGVmYXVsdF9pbml0KCkgYWxyZWFkeQ0KPiA+
Pj4gY2xlYXIgdGhpcyBmbGFnLiBBbmRyZXcsIHRob3VnaHRzPw0KPiA+PiBJIHdvbmRlcmVkIGV4
YWN0bHkgdGhhdCBhZnRlciBxdWV1aW5nIHRoaXMgcGF0Y2gsIGJ1dCBkaWRuJ3QgZ2V0DQo+ID4+
IGFyb3VuZCB0byBleHBlcmltZW50aW5nLg0KPiA+Pg0KPiA+PiBXZSBoYXZlIHRvIGJlIGEgbGl0
dGxlIGNhcmVmdWwgd2l0aCB0aGUgb3JkZXJpbmcgb2Ygb3BlcmF0aW9ucy4NCj4gPj4gY3B1X2hh
c19zZXAgaXMgdmlzaWJsZSBpbiBDUFVJRCBidXQgbmVlZHMgY2xvYmJlcmluZyBpbiBBTUQvSHln
b24NCj4gPj4gYmVmb3JlIGNwdV9oYXNfc2VwIGlzIHNhZmUgdG8gdXNlIChhbHRob3VnaCBmb3Ig
dGhlIE1TUnMsIGl0IHNob3VsZCBiZSBzYWZlKS4NCj4gPiB0cmFwX2luaXQoKSAoYW5kIGhlbmNl
IHBlcmNwdV90cmFwc19pbml0KCkpIHJ1bnMgYWZ0ZXIsIGluIHBhcnRpY3VsYXIsDQo+ID4gaW5p
dF9zcGVjdWxhdGlvbl9taXRpZ2F0aW9ucygpLCB3aGljaCBtZWFucyBhbGwgZmVhdHVyZSBjb2xs
ZWN0aW9uIGFuZA0KPiA+IG1hc3NhZ2luZyBtdXN0IGhhdmUgaGFwcGVuZWQuIFNvIHVubGVzcyB5
b3UgZXhwbGljaXRseSBzYXkgb3RoZXJ3aXNlLA0KPiA+IEknZCBsaWtlIHRvIGFzayBGaW9uYUxp
IHRvIHN1Ym1pdCBhIHYyIHdpdGggdGhhdCBjaGFuZ2UgKGFuZCB3aXRoIHRoZQ0KPiA+IG90aGVy
IGNvc21ldGljIGFkanVzdG1lbnRzIGNhcnJpZWQgb3V0KS4NCj4gDQo+IEknbGwgZHJvcCB0aGlz
IHBhdGNoIGZyb20geDg2LW5leHQuwqAgT3ZlcmFsbCwgSSB0aGluayBhIGNwdV9oYXNfc2VwIGJh
c2VkDQo+IHNvbHV0aW9uIHdvdWxkIGJlIHByZWZlcmFibGUuDQo+IA0KPiB+QW5kcmV3DQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
