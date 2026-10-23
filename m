Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C24B606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 23:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=M2vGRv4N
Received: from list by lists.xenproject.org with outflank-mailman.1459760.1671484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKP3A-0003Zg-RI; Fri, 23 Oct 2026 23:51:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1459760.1671484; Fri, 23 Oct 2026 23:51:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKP3A-0003ZY-NQ; Fri, 23 Oct 2026 23:51:52 +0000
Received: by outflank-mailman (input) for mailman id 1459760;
 Fri, 23 Oct 2026 23:51:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a16b2d7d1b000f79f@swg.vates.tech>)
 id 1xKP38-0003ZS-QY
 for xen-devel@lists.xen.org; Fri, 23 Oct 2026 23:51:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xKP37-006w85-St
 for xen-devel@lists.xen.org; Sat, 24 Oct 2026 01:51:49 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a16b2d7d1b000f79f@swg.vates.tech>)
 id 6adbf297-bab6-0a2a0a5309dd-0a2a45098b6e-46
 for <xen-devel@lists.xen.org>; Sat, 24 Oct 2026 01:51:49 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a16b2d7d1b000f79f@swg.vates.tech>)
 id 6adbf315-be1a-0a2a45090019-b9ff1c239191-3
 for <xen-devel@lists.xen.org>; Sat, 24 Oct 2026 01:51:49 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a16b2d7d1b000f79f.002 for <xen-devel@lists.xen.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 23 Oct 2026 23:51:45 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id EEB24832EA;
 Sat, 24 Oct 2026 01:51:43 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=t12f/kfcIuS1UuvlAAZxEViATrpNcezPK1lXDq1jo2E=;
 h=from:subject:date:message-id:to:mime-version:content-type:in-reply-to:references:feedback-id;
 b=M2vGRv4NmbcAlKStAOPy1u7f/qT933dP20a32IAYI6tQlTxG2ibq0xa6r6ldJwUwrgtLeiycN
 qKlWj1belXU2EloayTfOer5zR/mZcyT6RNbdS4LR+d50PDR0dj3QmO34g7ADjkDTVbieCSTb6Xp
 ts3EgF3kUKt8x1IjjysurnTptzn0MjxPo7mUxPk3jadMde5PJYeAbO/hSlrg6VJ3I05KBU3I5/I
 FiucyiFL/eWVnLTkmxKHUEILX3EwKvx+niTy5CxiAkMA5wlcbgXPguaPA5lUJ3ZtOM4oJyvg/ZM
 UfNIi+oUZkDI1SVhmvvDOe8F7/3Rd8qwpNyVEpvndjZA==
X-Zone-Loop: 77e2b26aa9bc97a31ab9dc03eb913de7b2037acdd1c4
x-campaign-type: default
x-transaction-id: 78f5c49d-f7aa-4786-a4e4-8eeb2b215132
x-swg-uid: 01-5beb4dc9-497d-470c-88fa-8b0ee6f5657f
X-Mailer: Sweego
Message-ID:
 <1792799505.8631fc262581453bbf619ec5b2062170.1a16b2d7d1b000f79f@vates.tech>
x-swg-bid: 1792799505.8631fc262581453bbf619ec5b2062170.1a16b2d7d1b000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Sat, 24 Oct 2026 01:51:43 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Xen BUG at mce_amd.c:100 (mc_ec2type) on Zen 3; host left
 wedged, no reboot
To: Peter Deggendorfer <pd@cortex-media.de>, xen-devel@lists.xen.org
References: <b9a98b3b-d11e-4463-ac80-4145ca991925@cortex-media.de>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <b9a98b3b-d11e-4463-ac80-4145ca991925@cortex-media.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HPs9k0OqWo0pZdNOODfPs53f"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792799504065
X-purgate-ID: tlsNG-bad1c0/1792799509-BD0CD034-2BB586DC/0/0
X-purgate-type: clean
X-purgate-size: 10817
X-Spam-Status: No, score=-4.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------HPs9k0OqWo0pZdNOODfPs53f
Content-Type: multipart/mixed; boundary="------------OdHE2kakfN399lAiUZJYVsx5";
 protected-headers="v1"; hp="clear"
Message-ID: <e238b2b2-e115-4aae-acf9-2daa067f7dd7@vates.tech>
Date: Sat, 24 Oct 2026 01:51:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Xen BUG at mce_amd.c:100 (mc_ec2type) on Zen 3; host left
 wedged, no reboot
To: Peter Deggendorfer <pd@cortex-media.de>, xen-devel@lists.xen.org
References: <b9a98b3b-d11e-4463-ac80-4145ca991925@cortex-media.de>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <b9a98b3b-d11e-4463-ac80-4145ca991925@cortex-media.de>

--------------OdHE2kakfN399lAiUZJYVsx5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMjMvMTAvMjAyNiDDoCAxMjoyMCwgUGV0ZXIgRGVnZ2VuZG9yZmVyIGEgw6ljcml0wqA6
DQo+IEhleSBYZW4gVGVhbSwNCj4gDQo+IEknbSBoaXR0aW5nIGEgcmVwcm9kdWNpYmxlIGh5
cGVydmlzb3IgcGFuaWMgaW4gdGhlIEFNRCBub24tZmF0YWwgTUNFDQo+IHBvbGxpbmcgcGF0
aCBvbiBhIFJ5emVuIDkgNTk1MFggKFplbiAzKS4gRWlnaHQgb2NjdXJyZW5jZXMgc2luY2UN
Cj4gMjAyNi0wOS0wOSwgYmV0d2VlbiAxMiBob3VycyBhbmQgMiB3ZWVrcyBhcGFydCwgYWx3
YXlzIENQVSAyLg0KPiANCj4gRW52aXJvbm1lbnQNCj4gLS0tLS0tLS0tLS0NCj4gWGVuOsKg
IMKgNC4yMC40LXByZSAoRGViaWFuIDQuMjAuMysxMjctZ2M0MjM3NGExMDUtMCtkZWIxM3Ux
KSwgYW5kIHN0aWxsDQo+ICDCoCDCoCDCoCDCoHByZXNlbnQgaW4gNC4yMC41LXByZSAoRGVi
aWFuIDQuMjAuNCszOS1nZjFlMTMyMWM4Ny0wK2RlYjEzdTEpDQo+IGRvbTA6wqAgTGludXgg
Ni4xMi4xMTErZGViMTMtYW1kNjQgKERlYmlhbiB0cml4aWUpLCBQViwgMzIgdkNQVXMNCj4g
Q1BVOsKgIMKgQU1EIEZhbWlseSAyNSAoMHgxOSkgTW9kZWwgMzMgKDB4MjEpIFN0ZXBwaW5n
IDIsIFJ5emVuIDkgNTk1MFgsDQo+ICDCoCDCoCDCoCDCoG1pY3JvY29kZSAweDBhMjAxMjEw
DQo+IENtZGxpbmU6IGRvbTBfbWVtPTQwOTZNLG1heDo0MDk2TSB1Y29kZT1zY2FuIGNvbnNv
bGVfdGltZXN0YW1wcz1kYXRlbXMNCj4gDQo+IFRoZSBwYW5pYw0KPiAtLS0tLS0tLS0NCj4g
KFhFTikgWzIwMjYtMTAtMTkgMDg6NTg6MTguNzI3XSBYZW4gQlVHIGF0IGFyY2gveDg2L2Nw
dS9tY2hlY2svIA0KPiBtY2VfYW1kLmM6MTAwDQo+IChYRU4pIENQVTrCoCDCoCAyDQo+IChY
RU4pIFJJUDrCoCDCoCBlMDA4Ols8ZmZmZjgyZDA0MDI4YTY1MD5dIG1jZV9hbWQuYyNtY19l
YzJ0eXBlLnBhcnQuMCswLzB4MTANCj4gKFhFTikgcmJ4OiAwMDAwMDAwMDAwMDAwNDQ1wqAg
wqByMTI6IDAwMDAwMDAwMDAwMDAwMTHCoCDCoHIxNTogMDAwMDAwMDAwMDAwMDQ0Ng0KPiAo
WEVOKSBYZW4gY29kZSBhcm91bmQgPGZmZmY4MmQwNDAyOGE2NTA+Og0KPiAoWEVOKcKgIDkw
IDkwIDkwIDkwIDkwIDkwIDkwIDkwIDwwZj4gMGIgOTAgOTAgOTAgOTAgOTAgOTAgOTAgOTAg
OTAgOTAgOTAgOTANCj4gKFhFTikgWGVuIGNhbGwgdHJhY2U6DQo+IChYRU4pwqAgwqAgWzxm
ZmZmODJkMDQwMjhhNjUwPl0gUiBtY2VfYW1kLmMjbWNfZWMydHlwZS5wYXJ0LjArMC8weDEw
DQo+IChYRU4pwqAgwqAgWzxmZmZmODJkMDQwMjhhNjk5Pl0gUyBtY19hbWRfcmVjb3ZlcmFi
bGVfc2NhbisweDM5LzB4NDANCj4gKFhFTinCoCDCoCBbPGZmZmY4MmQwNDAyOGNmZGQ+XSBT
IG1jaGVja19tY2FfbG9nb3V0KzB4NDJkLzB4ODQwDQo+IChYRU4pwqAgwqAgWzxmZmZmODJk
MDQwMjhhMzVjPl0gUyBhbWRfbm9uZmF0YWwuYyNtY2VfYW1kX2NoZWNrcmVncysweDFjLzB4
MTAwDQo+IChYRU4pwqAgwqAgWzxmZmZmODJkMDQwMjQwZThjPl0gUyBzbXBfY2FsbF9mdW5j
dGlvbl9pbnRlcnJ1cHQrMHg0Yy8weDkwDQo+IChYRU4pwqAgwqAgWzxmZmZmODJkMDQwMzEy
M2Q1Pl0gUyBkb19JUlErMHgyYTUvMHg2NTANCj4gKFhFTinCoCDCoCBbPGZmZmY4MmQwNDAy
MDE5MTU+XSBTIGNvbW1vbl9pbnRlcnJ1cHQrMHgxMzUvMHgxNTANCj4gKFhFTinCoCDCoCBb
PGZmZmY4MmQwNDAyODgzY2E+XSBTIGNwdV9pZGxlLmMjYWNwaV9pZGxlX2RvX2VudHJ5KzB4
OGEvMHgxNDANCj4gKFhFTinCoCDCoCBbPGZmZmY4MmQwNDAyODg3Y2Y+XSBTIGNwdV9pZGxl
LmMjYWNwaV9wcm9jZXNzb3JfaWRsZSsweDFlZi8weDY1MA0KPiAoWEVOKcKgIMKgIFs8ZmZm
ZjgyZDA0MDMwMmNmMT5dIFMgZG9tYWluLmMjaWRsZV9sb29wKzB4YzEvMHgxMzANCj4gKFhF
TikgUGFuaWMgb24gQ1BVIDINCj4gDQo+IFRoZSBvdXRsaW5lZCBtY19lYzJ0eXBlLnBhcnQu
MCBjb250YWlucyBub3RoaW5nIGJ1dCB0aGUgdWQyLCBzbyB0aGlzIGlzDQo+IHRoZSAidW5y
ZWFjaGFibGUiIGRlZmF1bHQgYnJhbmNoIG9mIG1jX2VjMnR5cGUoKSAtLSB0aGUgZXh0ZW5k
ZWQgZXJyb3INCj4gY29kZSBtYXRjaGVzIG5vbmUgb2YgTUNfRUNfVExCX1RZUEUsIE1DX0VD
X01FTV9UWVBFLCBNQ19FQ19CVVNfVFlQRS4NCj4gDQo+IEFjcm9zcyB0aGUgZWlnaHQgb2Nj
dXJyZW5jZXMsIHIxMiBhcHBlYXJzIHRvIGJlIHRoZSBiYW5rIGluZGV4IGZyb20gdGhlDQo+
IGxvb3AgaW4gbWNoZWNrX21jYV9sb2dvdXQoKSwgd2l0aCByYnggPT0gMHg0MDEgKyA0ICog
cjEyIChNQ2lfU1RBVFVTKQ0KPiBhbmQgcjE1ID09IHJieCArIDEuIFRocmVlIGRpZmZlcmVu
dCBiYW5rcyBhcmUgaW52b2x2ZWQ6IDEwLCAxNyBhbmQgMjMuDQo+IA0KPiBOb3QgYSBoYXJk
d2FyZSBkZWZlY3QNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IC0gU3RhcnRlZCB3aXRo
aW4gZGF5cyBvZiB1cGdyYWRpbmcgdHdvIGhvc3RzIGZyb20gRGViaWFuIGJvb2t3b3JtDQo+
ICDCoCAoWGVuIDQuMTcpIHRvIHRyaXhpZSAoWGVuIDQuMjApLiBUaGV5IGhhZCBydW4gMyB5
ZWFycyBvbiA0LjE3IHdpdGggbm8NCj4gIMKgIGluY2lkZW50Lg0KPiAtIFRocmVlIGRpZmZl
cmVudCBiYW5rcywgc28gbm90IGEgc2luZ2xlIGZhaWxpbmcgYmxvY2suDQo+IC0gVXBkYXRp
bmcgdG8gdGhlIGN1cnJlbnQgRGViaWFuIHBhY2thZ2UgKDQuMjAuNS1wcmUsIGJ1aWx0IDIw
MjYtMTAtMTYpDQo+ICDCoCBjaGFuZ2VkIG5vdGhpbmcuDQo+IA0KPiBQb3NzaWJseSByZWxh
dGVkOiA1MzI5ODhkY2NjMTkgKCJ4ODYvbWNoZWNrOiBmaXggbWNhX2FsbGJhbmtzDQo+IHVw
ZGF0aW5nIikuDQo+IA0KPiBBbHNvIHBvc3NpYmx5IHJlbGF0ZWQgb24gdGhlIExpbnV4IHNp
ZGU6IDA0MjJiMDdiYzRjMiAoIng4Ni9tY2UvYW1kOg0KPiBGaWx0ZXIgYm9ndXMgaGFyZHdh
cmUgZXJyb3JzIG9uIFplbjMgY2xpZW50cyIpLCB3aGVyZSBib2d1cyBNQ0EgdmFsdWVzDQo+
IG9uIFplbiAzIGFyZSBmaWx0ZXJlZCByYXRoZXIgdGhhbiB0cmVhdGVkIGFzIGVycm9ycy4N
Cj4gaHR0cHM6Ly9yYXRhdG9za3IucnVuL3N0YWJsZS8yMDI2LzA0LzcxNDM5MDUNCj4gDQo+
IERpYWdub3N0aWNzIC8gd29ya2Fyb3VuZA0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0N
Cj4gbWNlX3ZlcmJvc2l0eT12ZXJib3NlIHlpZWxkcyBub3RoaW5nIHVzZWZ1bC4NCj4gbWF4
X2NzdGF0ZT0xIG1hZGUgbm8gZGlmZmVyZW5jZS4gbWNlPWZhbHNlIGlzIHRoZSBvbmx5IHRo
aW5nIHRoYXQgc3RvcHMNCj4gaXQsIGFuZCBpdCBpcyB3aGF0IEknbSBydW5uaW5nIG5vdy4N
Cj4gDQo+IE9uZSBtb3JlIHRoaW5nOiB0aGUgaG9zdCBkb2VzIG5vdCBhY3R1YWxseSByZWJv
b3QgYWZ0ZXIgdGhlIHBhbmljLg0KPiAiUmVib290IGluIGZpdmUgc2Vjb25kcyIgaXMgcHJp
bnRlZCwgYnV0IHRoZSByaW5nIGJ1ZmZlciBjb250aW51ZXMgd2l0aA0KPiBub3JtYWwgYWN0
aXZpdHkgbWludXRlcyBsYXRlciBhbmQgdGhlIHJlbWFpbmluZyAzMSBDUFVzIGtlZXAgcnVu
bmluZy4NCj4gQ1BVIDIgc3RheXMgd2VkZ2VkLCBhbmQgInhsIGRlYnVnLWtleXMgdCIgdGhl
biBoYW5ncy4gQWZ0ZXJ3YXJkcyBkb20wDQo+IGFuZCBndWVzdCB2Q1BVcyBzdGFydCBsb3Np
bmcgdGltZXIgaW50ZXJydXB0cyBwZXJtYW5lbnRseSAoUkNVIHN0YWxscw0KPiB3aXRoIGEg
ZnJvemVuIHRpbWVyLXNvZnRpcnEgY291bnQgd2hpbGUgZHludGlja3Mga2VlcHMgYWR2YW5j
aW5nKSwgc28NCj4gVk1zIGhhbmcgc2lsZW50bHkgaG91cnMgb3IgZGF5cyBsYXRlci4NCj4g
DQo+IA0KPiBJJ3ZlIGF0dGFjaGVkIHRoZSBmdWxsIHhsIGRtZXNnIGxvZyBvZiB0aGUgbGFz
dCBjcmFzaCwgYW5kIEknbSBoYXBweQ0KPiB0byBwcm92aWRlIG1vcmUgaWYgbmVlZGVkLiBJ
IGNhbiBhbHNvIHRlc3QgcGF0Y2hlcy4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciB3b3JrLCBh
bmQgdGhhbmtzIGluIGFkdmFuY2UgZm9yIHRha2luZyBhIGxvb2suDQo+IA0KPiBQZXRlcg0K
DQpDb3VsZCBiZSByZWxhdGVkLiBJIGp1c3Qgb2JzZXJ2ZWQgYSBteXN0ZXJpb3VzIG1jZSBy
ZXBvcnQgb24gbXkgTGludXggDQpzeXN0ZW0gZG1lc2cgKFplbiAzIENQVSBhcyB3ZWxsLCBS
eXplbiA3IDU3MDBYM0QpDQoNCj4gWzM5MjMwLjQ4MTgwOV0gW0hhcmR3YXJlIEVycm9yXTog
U3lzdGVtIEZhdGFsIGVycm9yLg0KPiBbMzkyMzAuNDgxODEzXSBbSGFyZHdhcmUgRXJyb3Jd
OiBDUFU6MSAoMTk6MjE6MikgTUMxMl9TVEFUVVNbT3ZlcnxVRXxNaXNjVnxBZGRyVnxQQ0N8
U3luZFZ8VUVDQ3xEZWZlcnJlZHxQb2lzb258U2NydWJdOiAweGZmZmZmZmZmYjg2MTY4OTAN
Cj4gWzM5MjMwLjQ4MTgyM10gW0hhcmR3YXJlIEVycm9yXTogRXJyb3IgQWRkcjogMHgwMDAw
MDAwMDAwMDAwMDAwDQo+IFszOTIzMC40ODE4MjVdIFtIYXJkd2FyZSBFcnJvcl06IElQSUQ6
IDB4MDAwMDAwMDAwMDAwMDAwMCwgU3luZHJvbWU6IDB4MDAwMDAwMDAwMDAwMDAwMA0KPiBb
MzkyMzAuNDgxODMwXSBbSGFyZHdhcmUgRXJyb3JdOiBCYW5rIDEyIGlzIHJlc2VydmVkLg0K
PiBbMzkyMzAuNDgxODMyXSBbSGFyZHdhcmUgRXJyb3JdOiBjYWNoZSBsZXZlbDogUkVTViwg
dHg6IElOU04NCg0KSXQgc2VlbXMgdG8gYmUgbm9uLXNlbnNlLCBhbmQgdGhlIHN5c3RlbSBp
cyBzdGlsbCB1cCBhcyBpZiBub3RoaW5nIA0KaGFwcGVuZWQuIE5vICNNQyBnb3QgZW1pdHRl
ZC4NCg0KVGVkZHkNCg==

--------------OdHE2kakfN399lAiUZJYVsx5--

--------------HPs9k0OqWo0pZdNOODfPs53f
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmrb8w8FAwAAAAAACgkQZg+p0QLLz9Bz
LAwAhmaPo8n7iu56ZRT2uBL5xu4VlWSgl88dUlfr4PlOWwOMis8qMXV/1kLNOG/eslmOMmYMTxlh
zK+mZv0va+T0RPFwffrOv4+h0oLYsD1RqygO/FOUeEgmXDsV5OWhQYsl1eupEMyP0V7tCJ8QVKqu
LkScv9vufhl7S1MFiiPnmkGNwiYabhvNnM8a8Vp2ri/UoRR7aDFJfmocWkAgq2lanzONP3GJ/LuV
08L6KBKMJt18B1cfRgNqzSF+AeRKjFV9ukigtLEo7zPTNCOV1XBifovkIh4ypiwDuYVrMa+IPwT7
t5AVM0L1z2tac+cBRLZ/Qcat4KJ9ifucead6sWsmSulRkK0DyA0WVOzhbg3wfASL6r7ek/UyoGlS
Q+7AAW+qACtzvo1m7s+uucS+1ad9gjQF8tU34pAYsbHZcywXINxJCIls57gsNN5+t+Y0PsYwByDf
u/rnlgBTRz6YKEjFaDVIsJ+hf/usD0HRgAglx4Y3IiV/HDvI3lMwZHlPNE05
=RdYB
-----END PGP SIGNATURE-----

--------------HPs9k0OqWo0pZdNOODfPs53f--

