Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5262BC44529
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2026 08:21:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367593.1617321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wm5ie-0000xp-7G; Tue, 21 Jul 2026 08:20:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367593.1617321; Tue, 21 Jul 2026 08:20:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wm5ie-0000xi-2d; Tue, 21 Jul 2026 08:20:52 +0000
Received: by outflank-mailman (input) for mailman id 1367593;
 Tue, 21 Jul 2026 08:20:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f83c35cd4000edb5@swg.vates.tech>)
 id 1wm5ic-0000xW-IH
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 08:20:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wm5ib-00BqCc-VP
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 10:20:49 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f83c35cd4000edb5@swg.vates.tech>)
 id 6a5f2bd5-2eae-0a2a0a5409dd-0a2a450cb358-20
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 10:20:49 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f83c35cd4000edb5@swg.vates.tech>)
 id 6a5f2be1-f479-0a2a450c0019-b9ff1c129cdf-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 10:20:49 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f83c35cd4000edb5.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 21 Jul 2026 08:20:46 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 9F84981BAC;
 Tue, 21 Jul 2026 10:20:45 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=ueTna9TTIxkIRQ/87Pl5aGz4oj7cC06w6VrMIBh9wUg=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=l0gHLtoeBEYh4/55fFQ4uAen6dGjTlYi/TgjMO9ToY1kUx1EZTViidIR6PdedW0a66JQpeXmN
 xUuLXQvXfMr5pLNzikzON24dkijdMLP3CCGtyDC2KH/BSCEbMy0NlzgkkL4/2If0exYAzDCOmYc
 WID7rSb0BlVbMWqquGFrWAkc3DD+sP+RHePMAHIYqGjlFRiyOaJMkQrnMefnSfeC7NRhxZBRTy0
 68TXkNZmBXHWVlNLENTlTfKZWdFvqmzujfYhN9rbdChApHcFC50VfhBNFMr+stj9nJhMFX6IXt9
 PizTxJpkgtXwEhVhJySfcRvhLTIDEep2nfbEuIFDFamQ==
X-Zone-Loop: 665ee316efe1282b3b3cfcedcd811a7019c7173031cb
x-campaign-type: default
x-transaction-id: cbe2014d-cc8e-472c-955d-3118fbe78c82
x-swg-uid: 01-0108ff8d-86a1-4ae9-ae2d-8411ec538e1e
X-Mailer: Sweego
Message-ID:
 <1784622046.8631fc262581453bbf619ec5b2062170.19f83c35cd4000edb5@vates.tech>
x-swg-bid: 1784622046.8631fc262581453bbf619ec5b2062170.19f83c35cd4000edb5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Tue, 21 Jul 2026 10:20:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/6] tools/migration: introduce PAGE_DATA_LZ4 stream
 record type
To: Marcus Granado <marcus.granado@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Frediano Ziglio <freddy77@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20260720154832.1907401-1-marcus.granado@citrix.com>
 <20260720154832.1907401-2-marcus.granado@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20260720154832.1907401-2-marcus.granado@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0UC0aOajDo2UabxkaSj3I9eB"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1784622045833
X-purgate-ID: tlsNG-d25034/1784622049-016C6A5B-6664DDB5/0/0
X-purgate-type: clean
X-purgate-size: 12407

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0UC0aOajDo2UabxkaSj3I9eB
Content-Type: multipart/mixed; boundary="------------1hw18fBG0LlOEUPVDT3CRXYm";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Marcus Granado <marcus.granado@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Frediano Ziglio <freddy77@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Message-ID: <1c37d9c4-0950-4fea-9bfe-7f7691da6cef@vates.tech>
Subject: Re: [PATCH v1 1/6] tools/migration: introduce PAGE_DATA_LZ4 stream
 record type
References: <20260720154832.1907401-1-marcus.granado@citrix.com>
 <20260720154832.1907401-2-marcus.granado@citrix.com>
In-Reply-To: <20260720154832.1907401-2-marcus.granado@citrix.com>

--------------1hw18fBG0LlOEUPVDT3CRXYm
Content-Type: multipart/mixed; boundary="------------SEitb5PUUuWyMHgAsgRn908j"

--------------SEitb5PUUuWyMHgAsgRn908j
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMjAvMDcvMjAyNiDDoCAxNzo1MSwgTWFyY3VzIEdyYW5hZG8gYSDDqWNyaXTCoDoNCj4g
QWxsb2NhdGUgYSBuZXcgbWlncmF0aW9uIHN0cmVhbSByZWNvcmQgdHlwZSBSRUNfVFlQRV9Q
QUdFX0RBVEFfTFo0DQo+ICgweDAwMDAwMDEzKSB0byB0cmFuc21pdCBQQUdFX0RBVEEgd2hl
biBwYXlsb2FkIGlzIExaNC1jb21wcmVzc2VkLiBUaGUNCj4gcmVjb3JkIHVzZSB0aGUgc2Ft
ZSB4Y19zcl9yZWNfcGFnZV9kYXRhX2hlYWRlciBhcyBSRUNfVFlQRV9QQUdFX0RBVEENCj4g
YnV0IHRoZSBwYWdlIGRhdGEgc2VjdGlvbiB0eXBlIGNoYW5nZXMgZnJvbSBwYWdlX2RhdGEg
dG8gZGF0YV9sejQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXJjdXMgR3JhbmFkbyA8bWFy
Y3VzLmdyYW5hZG9AY2l0cml4LmNvbT4NCj4gLS0tDQo+ICAgZG9jcy9zcGVjcy9saWJ4Yy1t
aWdyYXRpb24tc3RyZWFtLnBhbmRvYyB8IDcxICsrKysrKysrKysrKysrKystDQo+ICAgdG9v
bHMvbGlicy9ndWVzdC94Z19zcl9jb21tb24uYyAgICAgICAgICB8ICA0ICsNCj4gICB0b29s
cy9saWJzL2d1ZXN0L3hnX3NyX3N0cmVhbV9mb3JtYXQuaCAgIHwgMTMgKysrKw0KPiAgIHRv
b2xzL3B5dGhvbi94ZW4vbWlncmF0aW9uL2xpYnhjLnB5ICAgICAgfCA5MCArKysrKysrKysr
KysrKysrKysrKy0NCj4gICB0b29scy9weXRob24veGVuL21pZ3JhdGlvbi90ZXN0cy5weSAg
ICAgIHwgOTkgKysrKysrKysrKysrKysrKysrKysrKystDQo+ICAgNSBmaWxlcyBjaGFuZ2Vk
LCAyNzEgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9kb2NzL3NwZWNzL2xpYnhjLW1pZ3JhdGlvbi1zdHJlYW0ucGFuZG9jIGIvZG9jcy9zcGVj
cy9saWJ4Yy1taWdyYXRpb24tc3RyZWFtLnBhbmRvYw0KPiBpbmRleCAxMzE5Y2UxZjFlLi43
NDY5Yzk1MTM5IDEwMDY0NA0KPiAtLS0gYS9kb2NzL3NwZWNzL2xpYnhjLW1pZ3JhdGlvbi1z
dHJlYW0ucGFuZG9jDQo+ICsrKyBiL2RvY3Mvc3BlY3MvbGlieGMtbWlncmF0aW9uLXN0cmVh
bS5wYW5kb2MNCg0KLi4uDQoNCj4gK1BBR0VfREFUQV9MWjQNCj4gKy0tLS0tLS0tLS0tLS0N
Cj4gKw0KPiArQSBQQUdFX0RBVEFfTFo0IHJlY29yZCBjYXJyaWVzIGV4YWN0bHkgdGhlIHNh
bWUgaW5mb3JtYXRpb24gYXMgYQ0KPiArUEFHRV9EQVRBIHJlY29yZCwgYnV0IHdpdGggdGhl
IHBhZ2UgY29udGVudHMgTFo0LWNvbXByZXNzZWQuICBUaGUgc2F2ZXINCj4gK21heSBlbWl0
IGl0IGluIHBsYWNlIG9mIGEgUEFHRV9EQVRBIHJlY29yZCB3aGVuIExaNCBjb21wcmVzc2lv
biBoYXMgYmVlbg0KPiArcmVxdWVzdGVkLg0KPiArDQoNCldvdWxkIGl0IGJlIHByZWZlcmFi
bGUgdG8gbWFrZSB0aGlzIHN0cnVjdHVyZSBtb3JlIGdlbmVyaWMsIGkuZSANClBBR0VfREFU
QV9DT01QUkVTU0VELCBhcyBJJ20gbm90IHN1cmUgaXQncyB3aXNlIHRvIHJlc3RyaWN0IHRv
IG9ubHkgTFo0IA0KKHNvbWVvbmUgbWF5IHdhbnQgdG8gYWRkIHN1cHBvcnQgZm9yIGUuZyB6
c3RkIG9yIGFub3RoZXIgYWxnb3JpdGhtIA0Kd2l0aG91dCBoYXZpbmcgdG8gY2hhbmdlIHRo
ZSBmb3JtYXQpID8NCg0KPiArICAgICAwICAgICAxICAgICAyICAgICAzICAgICA0ICAgICA1
ICAgICA2ICAgICA3IG9jdGV0DQo+ICsgICAgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQo+ICsgICAgfCBjb3VudCAoQykgICAgICAgICAg
ICAgfCAocmVzZXJ2ZWQpICAgICAgICAgICAgICB8DQo+ICsgICAgKy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQo+ICsgICAgfCBwZm5bMF0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8DQo+ICsgICAgKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQo+ICsg
ICAgLi4uDQo+ICsgICAgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0rDQo+ICsgICAgfCBwZm5bQy0xXSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8DQo+ICsgICAgKy0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQo+ICsgICAgfCBjbGVuWzBdICAgfCBwYWdlX2Rh
dGFfbHo0WzBdLi4uICAgICAgICAgICAgICAgICB8DQo+ICsgICAgKy0tLS0tLS0tLS0tKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQo+ICsgICAgLi4uDQo+ICsg
ICAgKy0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0r
DQo+ICsgICAgfCBjbGVuW04tMV0gfCBwYWdlX2RhdGFfbHo0W04tMV0uLi4gICAgICAgICAg
ICAgICB8DQo+ICsgICAgLi4uDQo+ICsgICAgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQo+ICsNCj4gKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICtG
aWVsZCAgICAgICBEZXNjcmlwdGlvbg0KPiArLS0tLS0tLS0tLS0gLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gK2NvdW50ICAg
ICAgIE51bWJlciBvZiBwYWdlcyBkZXNjcmliZWQgaW4gdGhpcyByZWNvcmQuDQo+ICsNCj4g
K3BmbiAgICAgICAgIEFuIGFycmF5IG9mIGNvdW50IFBGTnMgYW5kIHRoZWlyIHR5cGVzLCB3
aXRoIHRoZSBzYW1lDQo+ICsgICAgICAgICAgICBsYXlvdXQgYW5kIHBhZ2UgdHlwZXMgYXMg
aW4gYSBQQUdFX0RBVEEgcmVjb3JkLg0KPiArDQo+ICtkYXRhX2x6NCAgICBUaGUgY29tcHJl
c3NlZCBwYWdlIGNvbnRlbnRzLCBhcyBvbmUgc3ViLWJsb2NrIHBlciBwYWdlDQo+ICsgICAg
ICAgICAgICBzZXQgYXMgcHJlc2VudCBpbiB0aGUgcGZuIGFycmF5LCBpbiBwZm4tYXJyYXkg
b3JkZXIgKGkuZS4NCj4gKyAgICAgICAgICAgIE4gc3ViLWJsb2Nrcywgd2l0aCBOIGFzIGlu
IGEgUEFHRV9EQVRBIHJlY29yZDogTiA8PSBDKS4NCj4gKyAgICAgICAgICAgIEVhY2ggc3Vi
LWJsb2NrIGlzIGEgYHVpbnQxNmAgbGl0dGxlLWVuZGlhbiBsZW5ndGggYGNsZW5gDQo+ICsg
ICAgICAgICAgICBmb2xsb3dlZCBieSBlaXRoZXIgYW4gTFo0IGJsb2NrIG9yIGEgcmF3IHBh
Z2UuICBXaGVuDQo+ICsgICAgICAgICAgICBgY2xlbiA+IDBgLCBwYWdlX2RhdGFfbHo0IGlz
IGBjbGVuYCBvY3RldHMgb2YgYSByYXcgTFo0DQo+ICsgICAgICAgICAgICBibG9jayAocGVy
IHRoZSBMWjQgYmxvY2sgZm9ybWF0KSB3aG9zZSBkZWNvbXByZXNzZWQgb3V0cHV0DQo+ICsg
ICAgICAgICAgICBpcyBvbmUgcGFnZV9zaXplIHBhZ2UuICBXaGVuIGBjbGVuID09IDBgLCBw
YWdlX2RhdGFfbHo0IGlzDQo+ICsgICAgICAgICAgICBwYWdlX3NpemUgb2N0ZXRzIG9mIGEg
cmF3LCB1bmNvbXByZXNzZWQgcGFnZS4NCj4gKyAgICAgICAgICAgIEEgY29tcHJlc3NlZCBg
Y2xlbmAgaXMgYXQgbW9zdCBwYWdlX3NpemUgLSAxLCBvY2N1cHlpbmcNCj4gKyAgICAgICAg
ICAgIG9ubHkgdGhlIGxvdyAxMiBiaXRzOyB0aGUgdG9wIDQgYml0cyBhcmUgcmVzZXJ2ZWQg
Zm9yDQo+ICsgICAgICAgICAgICBmdXR1cmUgdXNlIGFuZCBtdXN0IGJlIDAuDQo+ICstLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KPiArDQo+ICtUaGUgYGNvdW50YCAoQykgYW5kIGBwZm5gIGZpZWxkcyBh
cmUgaWRlbnRpY2FsIGluIG1lYW5pbmcgYW5kDQo+ICtjb25zdHJhaW50cyB0byB0aG9zZSBv
ZiBhIFBBR0VfREFUQSByZWNvcmQsIGFuZCBOICh0aGUgbnVtYmVyIG9mDQo+ICtwcmVzZW50
IHBhZ2VzLCBOIDw9IEMpIGlzIGFzIGRlZmluZWQgdGhlcmUuICBVbmxpa2UgUEFHRV9EQVRB
LCBhDQo+ICtQQUdFX0RBVEFfTFo0IHJlY29yZCBhbHdheXMgaGFzIE4gPj0gMSAoYXQgbGVh
c3Qgb25lIHN1Yi1ibG9jayk6DQo+ICt0aGUgc2F2ZXIgZW1pdHMgdGhlIExaNCB2YXJpYW50
IG9ubHkgd2hlbiB0aGVyZSBpcyBwYWdlIGRhdGEgdG8NCj4gK2NvbXByZXNzLCBhbmQgYSBy
ZXN0b3Jpbmcgc2lkZSByZWplY3RzIGEgUEFHRV9EQVRBX0xaNCByZWNvcmQgd2l0aA0KPiAr
TiA9PSAwLiAgV2hlbiBhIGJhdGNoIGhhcyBubyBwcmVzZW50IHBhZ2VzIChhbGwgcGZucyBv
ZiBpbnZhbGlkDQo+ICt0eXBlcykgdGhlIHNhdmVyIGVtaXRzIGEgcGxhaW4gUEFHRV9EQVRB
IHJlY29yZCBpbnN0ZWFkLg0KPiArDQo+ICtQQUdFX0RBVEFfTFo0IGlzIGEgX21hbmRhdG9y
eV8gcmVjb3JkOiBhIHJlc3RvcmluZyBzaWRlIHRoYXQgZG9lcyBub3QNCj4gK3N1cHBvcnQg
aXQgbXVzdCBmYWlsIHRoZSBtaWdyYXRpb24uDQo+ICsNCg0KVGhlIGlubGluZSBjbGVuIGF0
IHRoZSBiZWdpbm5pbmcgb2YgcGFnZV9kYXRhX2x6NCBmZWVscyBhIGJpdCBvZGQgdG8gbWUs
IA0Kb3IgYXQgbGVhc3QsIGEgYml0IGluY29uc2lzdGVudCB3aXRoIGhvdyBwZm5zIGFyZSBh
cnJhbmdlZC4gSSB0aGluayANCnNvbWV0aGluZyBsaWtlIGkuZQ0KDQoxLiBjb3VudCBhbmQg
KHJlc2VydmVkKQ0KMi4gcGZuWzBdIC4uLiBwZm5bQy0xXQ0KMy4gY2xlblswXSAuLi4gY2xl
bltOLTFdDQo0LiBwYWdlX2RhdGFfbHo0WzBdIC4uLiBwYWdlX2RhdGFfbHo0W04tMV0NCg0K
d291bGQgYmUgYmV0dGVyLg0KDQpUaG91Z2gsIGFzaWRlIHRoYXQsIEknbSBub3Qgc3VyZSBo
YXZpbmcgc2VwYXJhdGUgY29tcHJlc3NlZCBibG9jayBmb3IgDQplYWNoIHBhZ2UgaXMgYSBn
b29kIGlkZWEuIENvbXByZXNzaW9uIGlzIG1vcmUgZWZmaWNpZW50IHdoZW4gcHJvY2Vzc2lu
ZyANCmxhcmdlciBibG9ja3MsIExaNCBkb2N1bWVudHMgYSA2NCBLQiBkZWR1cGxpY2F0aW9u
IHdpbmRvdyAob2YgdGhlIHBhc3QgDQpieXRlcykgWzFdLg0KDQpJbiBteSBvcGluaW9uLCBp
dCBtYXkgYmUgcHJlZmVyYWJsZSB0byBoYXZlIG9uZSBsYXJnZSBibG9jayB3aXRoIGFsbCB0
aGUgDQpwYWdlIGRhdGFzIChjb3ZlcmluZyB1cCB0byBNQVhfQkFUQ0hfU0laRT0xMDI0IHBh
Z2VzKSByYXRoZXIgdGhhbiBoYXZpbmcgDQp0byB1bmNvbXByZXNzIGluZGl2aWR1YWwgYmxv
Y2tzLiBXaGljaCBpbiB0aGUgZW5kIHdvdWxkIHJlbW92ZSB0aGUgbmVlZCANCnRvIGhhdmUg
aW5kaXZpZHVhbCBjbGVuW25dLg0KDQpXaGF0IGRvIHlvdSB0aGluayA/DQoNClsxXSANCmh0
dHBzOi8vZ2l0aHViLmNvbS9sejQvbHo0L2Jsb2IvZGV2L2RvYy9sejRfQmxvY2tfZm9ybWF0
Lm1kI2NvbXByZXNzaW9uLXRlY2huaXF1ZXMNCi4uLg0KDQo+IA0KPiBiYXNlLWNvbW1pdDog
YTdmZDdkNGNiZDVlNzkzZDMxZDYxYzI1ZTA4NTI2YjMzMGVkZDdmOA0KDQpUZWRkeQ0K
--------------SEitb5PUUuWyMHgAsgRn908j
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------SEitb5PUUuWyMHgAsgRn908j--

--------------1hw18fBG0LlOEUPVDT3CRXYm--

--------------0UC0aOajDo2UabxkaSj3I9eB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmpfK90FAwAAAAAACgkQZg+p0QLLz9Aw
Fgv+JRZeDD38rBEGX1m1zYFkbqgIJ3i+dp5yJ8mub1TMtGV4O0DQjPOzKwa8s3jBhz9HbRFts++R
y767hJQc9QkH7PqmVMIUOL0VTR1boSna5gRSqG8VsSen8fTniaSQBobTABjDWEHnqOnNy2d7C/nT
RPdGNRK683G8ON3+XWQkTt2Mu3qTtJk735TRFQgxQIRQrsl5OXdI8NvfsMve5RbJWauFuql37tvu
LCxP3CzmnSVxinlUTTXSIa3qcCj4TH/nJGV+cW9pg3MwJPSbZEsopBHHO+CHhTI+3Rjphkyx3cA3
Px3pWR/E25xg3ymZMrzkXEsiUNGM8/CGlacSF+v0vjEGRiWdspPE/PxSWo4Ma8T9BdGYRglNBIUV
2HDFLmpwXGsoSP0XuQvYG0tg6behDPZe2RmzQGM4lnctPDbOtyqIZb18QUt0T8J7wQTanHgFsqtb
IBUsmnXU50Gpq9l+erVwvrOJv10UL2NTWPOkalEJo/QvfYU56omlrqOuGWxy
=lAnz
-----END PGP SIGNATURE-----

--------------0UC0aOajDo2UabxkaSj3I9eB--

