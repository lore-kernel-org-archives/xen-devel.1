Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BC3C79F99
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 20:04:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412393.1642880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x423L-0004Ot-HX; Tue, 08 Sep 2026 20:04:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412393.1642880; Tue, 08 Sep 2026 20:04:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x423L-0004Om-Dl; Tue, 08 Sep 2026 20:04:23 +0000
Received: by outflank-mailman (input) for mailman id 1412393;
 Tue, 08 Sep 2026 20:04:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0829f022d000c4f3@swg.vates.tech>)
 id 1x423K-0004Oc-9E
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 20:04:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x423E-009vFo-M2
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 22:04:21 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0829f022d000c4f3@swg.vates.tech>)
 id 6aa06a04-bab6-0a2a0a5309dd-0a2a4505ac68-48
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 22:04:16 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0829f022d000c4f3@swg.vates.tech>)
 id 6aa06a40-4cb1-0a2a45050019-b9ff1c12a4fd-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 22:04:16 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0829f022d000c4f3.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 08 Sep 2026 20:04:13 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 14EDF82029;
 Tue,  8 Sep 2026 22:04:13 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=N7xmxj6HVlgvPHf7dm+GRrZU1J+ZJ/dHwrlkB7bLXGg=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=TOouHHc9R/wuX9Bf3FjQi8P9eISnIOr6uaoqRNVyD+7AtOfyxQKHg54Wfp1ZkUzg3B3z4xnLW
 WmtOaO+T/41tRsa6YaQ9LzST9HaC2tENbwqM1HutGjkGxoKzNO6MJSvIx7aU9/1s5Xi8F15G0Fk
 v9yFTqLKiCnoIJpYX+kCfElpIOycwDPmOpRshchG46WYZcL59RxauKNlYisB3eUZqKVSBT5ikh7
 94setz/aNb8ExDWa+gXkZ6IP2Kmmdtvz/WRpceh6W5Suzooa7TGIqLID2nPOYGN3lkL0zB1LYWT
 5P22ZNVNA0wJ35g30CHJFI0pcoEXIWKh962NpJky7LPw==
X-Zone-Loop: 4a65d638a1bce82a569e2c87bc3381c0340c8cfc3fd2
x-campaign-type: default
x-transaction-id: 3864bc44-3248-4405-98c1-6c06768968b0
x-swg-uid: 01-a6b4dfd6-0846-4897-8780-d4958ee44c84
X-Mailer: Sweego
Message-ID:
 <1788897854.8631fc262581453bbf619ec5b2062170.1a0829f022d000c4f3@vates.tech>
x-swg-bid: 1788897854.8631fc262581453bbf619ec5b2062170.1a0829f022d000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Tue, 8 Sep 2026 22:04:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/ucode: Work around Granite Rapids erraturm GNR98
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <20260908171525.3196765-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20260908171525.3196765-1-andrew.cooper3@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------lk9BpKF28q5HqSgKEZ79QwkS"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788897853195
X-purgate-ID: tlsNG-c201ff/1788897856-247132A1-1B70EB86/0/0
X-purgate-type: clean
X-purgate-size: 9213

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------lk9BpKF28q5HqSgKEZ79QwkS
Content-Type: multipart/mixed; boundary="------------pjG0quQQ5qAZwmFDT2wXZmFG";
 protected-headers="v1"; hp="clear"
Message-ID: <46d1bd3d-aae1-4cd1-bda9-b31e376a44df@vates.tech>
Date: Tue, 8 Sep 2026 22:04:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/ucode: Work around Granite Rapids erraturm GNR98
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <20260908171525.3196765-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20260908171525.3196765-1-andrew.cooper3@citrix.com>

--------------pjG0quQQ5qAZwmFDT2wXZmFG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMDgvMDkvMjAyNiDDoCAxOToxNSwgQW5kcmV3IENvb3BlciBhIMOpY3JpdMKgOg0KPiBC
bG9jayBsb2FkcyB3aGljaCBhcmUga25vd24gdG8gaGFuZyB0aGUgc3lzdGVtLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4NCj4gLS0tDQo+IENDOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IEND
OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlckB4ZW5wcm9qZWN0Lm9yZz4NCj4gQ0M6IFRlZGR5
IEFzdGllIDx0ZWRkeS5hc3RpZUB2YXRlcy50ZWNoPg0KPiANCj4gQSBtb3JlIGNvbXBsZXRl
IHNvbHV0aW9uIGlzIGluIHRoZSB3b3JrcywgYnV0IGl0J3MgdGFrZW4gNCBtb250aHMgdG8g
Z2V0IHRoaXMNCj4gbXVjaCBwdWJsaXNoZWQuLi4NCj4gDQo+IHYzOg0KPiAgICogRG91Ymxl
IFhFTkxPR19XQVJOSU5HDQo+IA0KPiB2MjoNCj4gICAqIENvcnJlY3QgdGhlIHNpZ24gb2Yg
dGhlIGNwdV9zaWctPnJldiBjaGVjay4NCj4gICAqIEV4cGFuZCB0aGUgY29tbWVudCB0byBl
eHBsYWluIHdoeSB3ZSBhcmUgbm90IGZvbGxvd2luZyB3aGF0IEdOUjk4IHNheXMuDQo+IC0t
LQ0KPiAgIHhlbi9hcmNoL3g4Ni9jcHUvbWljcm9jb2RlL2ludGVsLmMgfCA0MCArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgNDAgaW5zZXJ0
aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9jcHUvbWljcm9jb2Rl
L2ludGVsLmMgYi94ZW4vYXJjaC94ODYvY3B1L21pY3JvY29kZS9pbnRlbC5jDQo+IGluZGV4
IGM0NWIwMGM2YjAzMy4uODZjYmZiNzk4MTYwIDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC94
ODYvY3B1L21pY3JvY29kZS9pbnRlbC5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvbWlj
cm9jb2RlL2ludGVsLmMNCj4gQEAgLTI3LDYgKzI3LDcgQEANCj4gICAjaW5jbHVkZSA8eGVu
L3N0cmluZy5oPg0KPiAgICNpbmNsdWRlIDx4ZW4veG1hbGxvYy5oPg0KPiAgIA0KPiArI2lu
Y2x1ZGUgPGFzbS9pbnRlbC1mYW1pbHkuaD4NCj4gICAjaW5jbHVkZSA8YXNtL21zci5oPg0K
PiAgICNpbmNsdWRlIDxhc20vcHJvY2Vzc29yLmg+DQo+ICAgI2luY2x1ZGUgPGFzbS9zeXN0
ZW0uaD4NCj4gQEAgLTI3Myw2ICsyNzQsNDQgQEAgc3RhdGljIGJvb2wgbWljcm9jb2RlX2Zp
dHNfY3B1KGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKm1jKQ0KPiAgICAgICByZXR1
cm4gZmFsc2U7DQo+ICAgfQ0KPiAgIA0KPiArc3RhdGljIGJvb2wgbWljcm9jb2RlX3NhZmVf
dG9fbG9hZChjb25zdCBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICptYykNCj4gK3sNCj4gKyAg
ICBzdHJ1Y3QgY3B1X3NpZ25hdHVyZSAqY3B1X3NpZyA9ICZ0aGlzX2NwdShjcHVfc2lnKTsN
Cj4gKw0KPiArICAgIC8qDQo+ICsgICAgICogVHJlYXQgcHJlLXByb2R1Y3Rpb24gYXMgYWx3
YXlzIHNhZmUgLSBhbnlvbmUgdXNpbmcgcHJlLXByb2R1Y3Rpb24NCj4gKyAgICAgKiBtaWNy
b2NvZGUga25vd3Mgd2hhdCB0aGV5IGFyZSBkb2luZywgYW5kIGNhbiBrZWVwIGFueSByZXN1
bHRpbmcgcGllY2VzLg0KPiArICAgICAqLw0KPiArICAgIGlmICggKGludCljcHVfc2lnLT5y
ZXYgPCAwIHx8IG1jLT5yZXYgPCAwICkNCj4gKyAgICAgICAgcmV0dXJuIHRydWU7DQo+ICsN
Cj4gKyAgICAvKg0KPiArICAgICAqIEdOUjk4IHN0YXRlcyB0aGF0IEdyYW5pdGUgUmFwaWRz
IHN5c3RlbXMgaGFuZyB3aGVuIGxvYWRpbmcgbmV3IHVjb2RlIG9uDQo+ICsgICAgICogc3Vm
ZmljaWVudGx5IG9sZCBmaXJtd2FyZS4gIEdOUjEwMSByZXRyb2FjdGl2ZWx5IHN0YXRlcyB0
aGF0IG9uZSB1Y29kZQ0KPiArICAgICAqIGhhZCBhbiBpbmNvcnJlY3QgbWluaW11bSByZXZp
c2lvbiBmaWVsZCwgaW4gbGlnaHQgb2YgZGlzY292ZXJpbmcgR05SOTguDQo+ICsgICAgICoN
Cj4gKyAgICAgKiBCb3RoIGFyZSBpbmNvbXBsZXRlIHN0YXRlbWVudHMgb2YgdGhlIHByb2Js
ZW0uDQo+ICsgICAgICoNCj4gKyAgICAgKiBBdCB0aGUgdGltZSBvZiB3cml0aW5nIChBdWd1
c3QgMjAyNiksIHRoZSBiZWxpZXZlZCBzYWZlIHNlcXVlbmNlIGlzOg0KPiArICAgICAqICAg
MHgwMTAwMDM3MCAtPiBbMHgwMTAwMDM4MC4uLjB4MDEwMDAzZjNdIC0+IDB4MDEwMDA0MDUg
LT4gYW55IGxhdGVyDQo+ICsgICAgICoNCj4gKyAgICAgKiBEaXNhbGxvdyBrbm93bi11bnNh
ZmUgbG9hZHMgd2hpbGUgcGVybWl0dGluZyBiZWxpZXZlZC1zYWZlIGxvYWRzLiAgRm9yDQo+
ICsgICAgICogR05SLCB0aGlzIGFsbG93cyBtdWx0aS1ob3AgbG9hZGluZyB0byBnZXQgdXAg
dG8gdGhlIGxhdGVzdC4NCj4gKyAgICAgKi8NCj4gKyAgICBpZiAoIGJvb3RfY3B1X2RhdGEu
dmZtID09IElOVEVMX0dSQU5JVEVSQVBJRFNfWCAmJg0KPiArICAgICAgICAgYm9vdF9jcHVf
ZGF0YS5zdGVwcGluZyA9PSAxICYmIChjcHVfc2lnLT5wZiAmIDB4OTUpICYmDQo+ICsgICAg
ICAgICAoKGNwdV9zaWctPnJldiA8IDB4MDEwMDAzODAgJiYgbWMtPnJldiA+PSAweDAxMDAw
NDA1KSB8fA0KPiArICAgICAgICAgIChjcHVfc2lnLT5yZXYgPCAweDAxMDAwNDA1ICYmIG1j
LT5yZXYgPiAgMHgwMTAwMDQwNSkpICkNCj4gKyAgICB7DQo+ICsgICAgICAgIHByaW50a19v
bmNlKFhFTkxPR19XQVJOSU5HICJtaWNyb2NvZGU6IEdyYW5pdGUgUmFwaWRzIGVycmF0dW0g
R05SOTggZGV0ZWN0ZWQuICBTa2lwcGluZyB1Y29kZSAweCUwOHhcbiINCj4gKyAgICAgICAg
ICAgICAgICAgICAgWEVOTE9HX1dBUk5JTkcgIm1pY3JvY29kZTogRmlybXdhcmUgdXBkYXRl
IHJlY29tbWVuZGVkXG4iLA0KPiArICAgICAgICAgICAgICAgICAgICBtYy0+cmV2KTsNCj4g
KyAgICAgICAgcmV0dXJuIGZhbHNlOw0KPiArICAgIH0NCj4gKw0KPiArICAgIHJldHVybiB0
cnVlOw0KPiArfQ0KPiArDQo+ICAgc3RhdGljIGludCBjZl9jaGVjayBpbnRlbF9jb21wYXJl
KA0KPiAgICAgICBjb25zdCBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpvbGQsIGNvbnN0IHN0
cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKm5ldykNCj4gICB7DQo+IEBAIC0zNjUsNiArNDA0LDcg
QEAgc3RhdGljIHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKmNmX2NoZWNrIGludGVsX3Vjb2Rl
X3BhcnNlKA0KPiAgICAgICAgICAgICogb25lIHdpdGggaGlnaGVyIHJldmlzaW9uLg0KPiAg
ICAgICAgICAgICovDQo+ICAgICAgICAgICBpZiAoIG1pY3JvY29kZV9maXRzX2NwdShtYykg
JiYNCj4gKyAgICAgICAgICAgICBtaWNyb2NvZGVfc2FmZV90b19sb2FkKG1jKSAmJg0KPiAg
ICAgICAgICAgICAgICAoIXNhdmVkIHx8IGNvbXBhcmVfcmV2aXNpb25zKHNhdmVkLT5yZXYs
IG1jLT5yZXYpID09IE5FV19VQ09ERSkgKQ0KPiAgICAgICAgICAgICAgIHNhdmVkID0gbWM7
DQo+ICAgDQoNClJldmlld2VkLWJ5OiBUZWRkeSBBc3RpZSA8dGVkZHkuYXN0aWVAdmF0ZXMu
dGVjaD4NCg0KVGVkZHkNCg==

--------------pjG0quQQ5qAZwmFDT2wXZmFG--

--------------lk9BpKF28q5HqSgKEZ79QwkS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmqgajwFAwAAAAAACgkQZg+p0QLLz9CR
yAv/c9eMD08r3jUu5VYvAUiieLJHm86f39+3fplUOLasf8eWXjLb0U+AIa/oSzAvcJt3vt8envEE
2p51xOd+wQErgV2rXjPidL5ge19VbUQndzvvwdgTm8daZaZXLZhB8IMAkk3iSVloLSJReNKOUSfX
yUqYbmkr4WBARGrZQUAoRwCVuiuhpsgZ133dX9OTfezKVSC8BuqK99TjLZii8Lap83NeaHo18Xdf
1MhiGw3mBChbvozSRyTu30sbgTIhthGNoVz2F8tmzXDvET+HpgWxjiI/jPBqXvZmAM0IujSgDCxh
8sWhRsRVvMTRodHmPAi1mDCMvsC4xUS1ZG4kYwAy3D03i4QOFkcSFe7iX+UU6E50L3LJzMA9IDhW
EtI7aaxMrb7ePZUMt1O8ysZIcGnmoaSqR4lzS+OZqKL8jxx5p1LQNs0dFAFrzcM/7jW0KtOXz42/
dzZDm29pqHAl5X7bNrHrQ/SFaR1kMeVykHYyZVRt/JIniIOXvbYl6Zh7O9L0
=Dkcu
-----END PGP SIGNATURE-----

--------------lk9BpKF28q5HqSgKEZ79QwkS--

