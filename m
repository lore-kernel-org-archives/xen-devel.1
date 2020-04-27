Return-Path: <SRS0=2tZV=6L=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0BECC54FCB
	for <xen-devel@archiver.kernel.org>; Mon, 27 Apr 2020 13:00:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C4BC206BF
	for <xen-devel@archiver.kernel.org>; Mon, 27 Apr 2020 13:00:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="UjNBJk4a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C4BC206BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT3MC-0007Ql-2N; Mon, 27 Apr 2020 12:59:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oTJa=6L=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jT3MA-0007Qg-SF
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 12:59:30 +0000
X-Inumbo-ID: ee5870c0-8886-11ea-b9cf-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee5870c0-8886-11ea-b9cf-bc764e2007e4;
 Mon, 27 Apr 2020 12:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587992370;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=nc+ZiMNFYJW8OIa0ORxshgyGsoDs2vZyXDpv4+xPoOc=;
 b=UjNBJk4aWK0zZf3c8u5qHGzeFE579Vl6OKGIYmaZzHOqeQX0wmw5IRYU
 dHqhVVkljJWF/2+ikaqGKFdYrYBN6IgGPhnR8MYeoBQDY/HJ0+SLrhUM8
 aVEOFFEXUUb8lGJ5cfYq/cM5J+cwQlf5CNTSOc7f6/IwRmx+qRobNu6KX A=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ZwvWdwgWnd+9EzfoTUuAOIANHIVr10hEtBYsA/jQDLNX75wNgBIP6xnPQR6cXSQwI9PZTY9Zry
 i6wqmGQSwJiM5zYuFK6ibVjpwGr9uWBf+o5hlhdRD9Q8yIOSjwKEf8RNFP7FocgOvtDQ+7yILR
 tqDwDVhG9tlI/O1a3YjEg+Kp8slWd1SdG9nUe+6EnKqyeRJZn6oI5XrEdKRRSxav9fuklbSSXm
 mb9UUcQE8m6LSXsjRQvQRsGJR+x/UoNiJmR8Sjt+HHtVIChI7Cr56BrXdqebeU0vSEdToL1/nL
 UrQ=
X-SBRS: 2.7
X-MesageID: 16313416
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,324,1583211600"; d="scan'208";a="16313416"
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
Subject: Re: [PATCH v2 1/1] golang/xenlight: add NameToDomid and DomidToName
 util functions
Thread-Topic: [PATCH v2 1/1] golang/xenlight: add NameToDomid and DomidToName
 util functions
Thread-Index: AQHWGeTLlIhJvo8WaUufFBMrVdiAt6iM0gqA
Date: Mon, 27 Apr 2020 12:59:25 +0000
Message-ID: <59C12770-F12A-45B7-AB62-8BB3A0DC96D8@citrix.com>
References: <cover.1587682041.git.rosbrookn@ainfosec.com>
 <73e709cf0a87f3728de438e4a3b849462fd098ac.1587682041.git.rosbrookn@ainfosec.com>
In-Reply-To: <73e709cf0a87f3728de438e4a3b849462fd098ac.1587682041.git.rosbrookn@ainfosec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.60.0.2.5)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <22A51F5E6C95384495B8EA5989CB86B1@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gQXByIDI0LCAyMDIwLCBhdCA0OjAyIEFNLCBOaWNrIFJvc2Jyb29rIDxyb3Nicm9v
a25AZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IE1hbnkgZXhwb3J0ZWQgZnVuY3Rpb25zIGluIHhl
bmxpZ2h0IHJlcXVpcmUgYSBkb21pZCBhcyBhbiBhcmd1bWVudC4gTWFrZQ0KPiBpdCBlYXNpZXIg
Zm9yIHBhY2thZ2UgdXNlcnMgdG8gdXNlIHRoZXNlIGZ1bmN0aW9ucyBieSBhZGRpbmcgd3JhcHBl
cnMNCj4gZm9yIHRoZSBsaWJ4bCB1dGlsaXR5IGZ1bmN0aW9ucyBsaWJ4bF9uYW1lX3RvX2RvbWlk
IGFuZA0KPiBsaWJ4bF9kb21pZF90b19uYW1lLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTmljayBS
b3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4NCj4gLS0tDQo+IHRvb2xzL2dvbGFuZy94
ZW5saWdodC94ZW5saWdodC5nbyB8IDM4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0N
Cj4gMSBmaWxlIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28gYi90b29scy9n
b2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28NCj4gaW5kZXggNmI0ZjQ5MjU1MC4uZDFkMzBiNjNl
MSAxMDA2NDQNCj4gLS0tIGEvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvDQo+ICsr
KyBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbw0KPiBAQCAtMjEsMTMgKzIxLDEz
IEBAIHBhY2thZ2UgeGVubGlnaHQNCj4gI2NnbyBMREZMQUdTOiAtbHhlbmxpZ2h0IC1seWFqbCAt
bHhlbnRvb2xsb2cNCj4gI2luY2x1ZGUgPHN0ZGxpYi5oPg0KPiAjaW5jbHVkZSA8bGlieGwuaD4N
Cj4gKyNpbmNsdWRlIDxsaWJ4bF91dGlscy5oPg0KPiANCj4gc3RhdGljIGNvbnN0IGxpYnhsX2No
aWxkcHJvY19ob29rcyBjaGlsZHByb2NfaG9va3MgPSB7IC5jaGxkb3duZXIgPSBsaWJ4bF9zaWdj
aGxkX293bmVyX21haW5sb29wIH07DQo+IA0KPiB2b2lkIHhlbmxpZ2h0X3NldF9jaGxkcHJvYyhs
aWJ4bF9jdHggKmN0eCkgew0KPiAJbGlieGxfY2hpbGRwcm9jX3NldG1vZGUoY3R4LCAmY2hpbGRw
cm9jX2hvb2tzLCBOVUxMKTsNCj4gfQ0KPiAtDQo+ICovDQo+IGltcG9ydCAiQyINCj4gDQo+IEBA
IC03NSw2ICs3NSwxMCBAQCB2YXIgbGlieGxFcnJvcnMgPSBtYXBbRXJyb3Jdc3RyaW5new0KPiAJ
RXJyb3JGZWF0dXJlUmVtb3ZlZDogICAgICAgICAgICAgICAiRmVhdHVyZSByZW1vdmVkIiwNCj4g
fQ0KPiANCj4gK2NvbnN0ICgNCj4gKwlEb21pZEludmFsaWQgRG9taWQgPSBeRG9taWQoMCkNCg0K
Tm90IHRvIGJlIGEgc3RpY2tsZXIsIGJ1dCBhcmUgd2UgcG9zaXRpdmUgdGhhdCB0aGlzIHdpbGwg
YWx3YXlzIHJlc3VsdCBpbiB0aGUgc2FtZSB2YWx1ZSBhcyBDLklOVkFMSURfRE9NSUQ/DQoNClRo
ZXJlIGFyZSBzb21lIGZ1bmN0aW9ucyB0aGF0IHdpbGwgcmV0dXJuIElOVkFMSURfRE9NSUQsIG9y
IGFjY2VwdCBJTlZBTElEX0RPTUlEIGFzIGFuIGFyZ3VtZW50LiAgVXNlcnMgb2YgdGhlIGB4ZW5s
aWdodGAgcGFja2FnZSB3aWxsIHByZXN1bWFibHkgbmVlZCB0byBjb21wYXJlIGFnYWluc3QgdGhp
cyB2YWx1ZSBhbmQvb3IgcGFzcyBpdCBpbi4NCg0KSXQgc2VlbXMgbGlrZSB3ZSBjb3VsZDoNCg0K
MS4gUmVseSBvbiBsYW5ndWFnZSBsYXd5ZXJpbmcgdG8ganVzdGlmeSBvdXIgYXNzdW1wdGlvbiB0
aGF0IF5Eb21pZCgwKSB3aWxsIGFsd2F5cyBiZSB0aGUgc2FtZSBhcyBDIOKAnH4w4oCdDQoNCjIu
IE9uIG1hcnNoYWxsaW5nIGludG8gLyBvdXQgb2YgQywgY29udmVydCBDLklOVkFMSURfRE9NSUQg
dG8gRG9taWRJbnZhbGlkDQoNCjMuIFNldCBEb21pZCA9IEMuSU5WQUxJRF9ET01JRA0KDQpJZiB5
b3XigJlyZSBjb25maWRlbnQgaW4geW91ciBsYW5ndWFnZSBsYXd5ZXJpbmcgc2tpbGxzLCBJIGNv
dWxkIGFjY2VwdCAjMTsgYnV0IEnigJlkIHByZWZlciBhIGNvbW1lbnQgd2l0aCBzb21lIHNvcnQg
b2YgcmVmZXJlbmNlLiAgQnV0IGlmIGl0IHdlcmUgbWUgSeKAmWQganVzdCBnbyB3aXRoICMzOyBw
YXJ0aWN1bGFybHkgZ2l2ZW4gdGhhdCB0aGlzIHZhbHVlIGNvdWxkIHRoZW9yZXRpY2FsbHkgY2hh
bmdlIChsaWJ4bCBoYXMgYSBzdGFibGUgQVBJLCBub3QgYSBzdGFibGUgQUJJKS4NCg0KRXZlcnl0
aGluZyBlbHNlIGxvb2tzIGdvb2QuDQoNCklmIHlvdSB3YW50IEkgY291bGQgcy9+RG9taWQoMCkv
Qy5JTlZBTElEX0RPTUlELzsgbXlzZWxmLCBhZGQgbXkgUi1iIGFuZCBjaGVjayBpdCBpbi4NCg0K
IC1HZW9yZ2UNCg0K

