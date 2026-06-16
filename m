Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D9ACD98E1
	for <xen-devel@archiver.kernel.org>; Tue, 16 Jun 2026 13:18:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1339217.1600360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZTgE-0004q5-5q; Tue, 16 Jun 2026 13:18:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339217.1600360; Tue, 16 Jun 2026 13:18:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZTgE-0004py-2x; Tue, 16 Jun 2026 13:18:14 +0000
Received: by outflank-mailman (input) for mailman id 1339217;
 Tue, 16 Jun 2026 13:18:12 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ed0950324000701b@swg.vates.tech>)
 id 1wZTgB-0004pr-IQ
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 13:18:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZTgA-003spM-VN
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 15:18:10 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ed0950324000701b@swg.vates.tech>)
 id 6a314d0a-5cb7-0a2a0a5109dd-0a2a4509cf88-36
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 15:18:10 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ed0950324000701b@swg.vates.tech>)
 id 6a314d12-2497-0a2a45090019-b9ff1c12b57b-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 15:18:10 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ed0950324000701b.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 16 Jun 2026 13:18:07 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 60FF486020;
 Tue, 16 Jun 2026 15:18:06 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=xN1VW5t1L2pPZeEA4IpMCrfEe9RUP1owd3LPXnC1ykU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=ZsS7jBvx3hWxoRFoQ0gIs2G/6GtqFPMtwdJ1jWvCyBtg+QxiG2KNBCKyd751kSsND4PznVDAz
 sNyP/IjY345MqEKDF3M11k8DPTwuBHdieG7xBlBUBShJ/jBf6gNpTbsB2PTP8xZmLi5IA3RZTWz
 Tcd2EDWUb+C/mYYSUaIgUWR+Mj+04yQ1wJOU9uxfkXK+LzF5wFMtoqy8pXfisvzTk8JW4Bwurag
 XUGNO/TBYpVV5x+6HE+CrRot4O2i+6riZIh/h6pwGVPnIKBDVkxk068qALoISeti8X0A3UbbNZZ
 d5qrDIh1hC/jxut8WvvjUKcWdaRiRJmQg82PkrjbkwSw==
X-Zone-Loop: 6c97fcd2f2dc644ea5c61a530f28a5fde278af0d8a31
x-campaign-type: default
x-transaction-id: c625d8f4-8c41-4fb0-b0f1-366da5a65c29
x-swg-uid: 01-ed072440-bc9f-455c-86f0-1b5750ef6840
X-Mailer: Sweego
Message-ID:
 <1781615887.8631fc262581453bbf619ec5b2062170.19ed0950324000701b@vates.tech>
x-swg-bid: 1781615887.8631fc262581453bbf619ec5b2062170.19ed0950324000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Tue, 16 Jun 2026 15:18:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] efi: Skip FPU save / restore if using idle vCPU
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20260616130051.3359801-1-ross.lagerwall@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20260616130051.3359801-1-ross.lagerwall@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6YUkAkzRm3QABjkgQSZTp6he"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781615886536
X-purgate-ID: tlsNG-bad1c0/1781615890-36D77A53-6D600D95/0/0
X-purgate-type: clean
X-purgate-size: 8254

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6YUkAkzRm3QABjkgQSZTp6he
Content-Type: multipart/mixed; boundary="------------3MXlkGP3kv0UftxvSE20h7CV";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <6484c11f-77ef-478e-adb9-5695044fcc84@vates.tech>
Subject: Re: [PATCH] efi: Skip FPU save / restore if using idle vCPU
References: <20260616130051.3359801-1-ross.lagerwall@citrix.com>
In-Reply-To: <20260616130051.3359801-1-ross.lagerwall@citrix.com>

--------------3MXlkGP3kv0UftxvSE20h7CV
Content-Type: multipart/mixed; boundary="------------0L4v2nEp9R2Vtj5bhMEWM0ip"

--------------0L4v2nEp9R2Vtj5bhMEWM0ip
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMTYvMDYvMjAyNiDDoCAxNTowNCwgUm9zcyBMYWdlcndhbGwgYSDDqWNyaXTCoDoNCj4g
VGhlIHJlY2VudCBjaGFuZ2VzIHRvIHJlbW92ZSBsYXp5IEZQVSBzdXBwb3J0IG1lYW4gdGhh
dA0KPiB2Y3B1X3tzYXZlLHJlc3RvcmV9X2ZwdSBwZXJmb3JtIHRoZSBhY3Rpb24gdW5jb25k
aXRpb25hbGx5LiBUaGlzIHRyaXBzDQo+IHRoZSBhc3NlcnQgd2hlbiBjYWxsaW5nIHRoZXNl
IGZ1bmN0aW9ucyBmcm9tIGFuIGlkbGUgdkNQVSBhcyBtaWdodA0KPiBoYXBwZW4gd2hlbiBj
YWxsaW5nIGFuIEVGSSBydW50aW1lIGZ1bmN0aW9uLiBUaGVyZSBpcyBubyBuZWVkIHRvDQo+
IHNhdmUvcmVzdG9yZSB0aGUgRlBVIGluIHRoYXQgY2FzZSBzbyBza2lwIHRoZSBjYWxscyBp
ZiB1c2luZyB0aGUgaWRsZQ0KPiB2Q1BVLg0KPiANCj4gRml4ZXM6IGRiYTQ0ZTA1MTIwOSAo
Ing4NjogUmVtb3ZlIGZ1bGx5X2VhZ2VyX2ZwdSIpDQo+IEZpeGVzOiA0Yjk4NTFjNjQ1MjIg
KCJ4ODY6IFJlbW92ZSBmcHVfaW5pdGlhbGlzZWQvZnB1X2RpcnR5IikNCj4gUmVwb3J0ZWQt
Ynk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEB2YXRlcy50ZWNoPg0KPiBTdWdn
ZXN0ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2lnbmVkLW9m
Zi1ieTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+DQo+IC0t
LQ0KPiANCj4gQW55dGhvbnksIGNhbiB5b3UgY2hlY2sgaWYgdGhpcyBmaXhlcyBib290IG9u
IHlvdXIgbWFjaGluZT8NCj4gDQo+ICAgeGVuL2NvbW1vbi9lZmkvcnVudGltZS5jIHwgOSAr
KysrKystLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZWZpL3J1bnRpbWUuYyBi
L3hlbi9jb21tb24vZWZpL3J1bnRpbWUuYw0KPiBpbmRleCBhMjNmYTc1ZTM3NDAuLjc3MTM2
NzZjZTI4OCAxMDA2NDQNCj4gLS0tIGEveGVuL2NvbW1vbi9lZmkvcnVudGltZS5jDQo+ICsr
KyBiL3hlbi9jb21tb24vZWZpL3J1bnRpbWUuYw0KPiBAQCAtODgsNiArODgsNyBAQCBzdHJ1
Y3QgZWZpX3JzX3N0YXRlIGVmaV9yc19lbnRlcih2b2lkKQ0KPiAgICAgICBzdGF0aWMgY29u
c3QgdTE2IGZjdyA9IEZDV19ERUZBVUxUOw0KPiAgICAgICBzdGF0aWMgY29uc3QgdTMyIG14
Y3NyID0gTVhDU1JfREVGQVVMVDsNCj4gICAgICAgc3RydWN0IGVmaV9yc19zdGF0ZSBzdGF0
ZSA9IHsgLmNyMyA9IDAgfTsNCj4gKyAgICBzdHJ1Y3QgdmNwdSAqY3VyciA9IGN1cnJlbnQ7
DQo+ICAgDQo+ICAgICAgIGlmICggbWZuX2VxKGVmaV9sNF9tZm4sIElOVkFMSURfTUZOKSAp
DQo+ICAgICAgICAgICByZXR1cm4gc3RhdGU7DQo+IEBAIC05OCw3ICs5OSw4IEBAIHN0cnVj
dCBlZmlfcnNfc3RhdGUgZWZpX3JzX2VudGVyKHZvaWQpDQo+ICAgICAgICAqLw0KPiAgICAg
ICBzeW5jX2xvY2FsX2V4ZWNzdGF0ZSgpOw0KPiAgICAgICBzdGF0ZS5jcjMgPSByZWFkX2Ny
MygpOw0KPiAtICAgIHZjcHVfc2F2ZV9mcHUoY3VycmVudCk7DQo+ICsgICAgaWYgKCAhaXNf
aWRsZV92Y3B1KGN1cnIpICkNCj4gKyAgICAgICAgdmNwdV9zYXZlX2ZwdShjdXJyKTsNCj4g
ICAgICAgYXNtIHZvbGF0aWxlICggImZuY2xleDsgZmxkY3cgJTAiIDo6ICJtIiAoZmN3KSAp
Ow0KPiAgICAgICBhc20gdm9sYXRpbGUgKCAibGRteGNzciAlMCIgOjogIm0iIChteGNzcikg
KTsNCj4gICANCj4gQEAgLTEwNyw3ICsxMDksNyBAQCBzdHJ1Y3QgZWZpX3JzX3N0YXRlIGVm
aV9yc19lbnRlcih2b2lkKQ0KPiAgICAgICAvKiBwcmV2ZW50IGZpeHVwX3BhZ2VfZmF1bHQo
KSBmcm9tIGRvaW5nIGFueXRoaW5nICovDQo+ICAgICAgIGlycV9lbnRlcigpOw0KPiAgIA0K
PiAtICAgIGlmICggaXNfcHZfdmNwdShjdXJyZW50KSAmJiAhaXNfaWRsZV92Y3B1KGN1cnJl
bnQpICkNCj4gKyAgICBpZiAoIGlzX3B2X3ZjcHUoY3VycikgJiYgIWlzX2lkbGVfdmNwdShj
dXJyKSApDQo+ICAgICAgIHsNCj4gICAgICAgICAgIHN0cnVjdCBkZXNjX3B0ciBnZHRfZGVz
YyA9IHsNCj4gICAgICAgICAgICAgICAubGltaXQgPSBMQVNUX1JFU0VSVkVEX0dEVF9CWVRF
LA0KPiBAQCAtMTU5LDcgKzE2MSw4IEBAIHZvaWQgZWZpX3JzX2xlYXZlKHN0cnVjdCBlZmlf
cnNfc3RhdGUgKnN0YXRlKQ0KPiAgICAgICB9DQo+ICAgICAgIGlycV9leGl0KCk7DQo+ICAg
ICAgIHNwaW5fdW5sb2NrKCZlZmlfcnNfbG9jayk7DQo+IC0gICAgdmNwdV9yZXN0b3JlX2Zw
dShjdXJyKTsNCj4gKyAgICBpZiAoICFpc19pZGxlX3ZjcHUoY3VycikgKQ0KPiArICAgICAg
ICB2Y3B1X3Jlc3RvcmVfZnB1KGN1cnIpOw0KPiAgIH0NCj4gICANCj4gICB1bnNpZ25lZCBs
b25nIGVmaV9nZXRfdGltZSh2b2lkKQ0KDQpSZXZpZXdlZC1ieTogVGVkZHkgQXN0aWUgPHRl
ZGR5LmFzdGllQHZhdGVzLnRlY2g+DQoNClRlZGR5DQo=
--------------0L4v2nEp9R2Vtj5bhMEWM0ip
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------0L4v2nEp9R2Vtj5bhMEWM0ip--

--------------3MXlkGP3kv0UftxvSE20h7CV--

--------------6YUkAkzRm3QABjkgQSZTp6he
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmoxTQ4FAwAAAAAACgkQZg+p0QLLz9CD
Xwv/crGQ4qdWCITdzDgf8YvspoqSD9FdnLrZFODgWAJ35l0fhMDUIj0o45BsZm+zUYDoM7qaNcxi
daQ2dTLG4o+17t4z0/QG1hTxA4/L37ckQmC0CYJavs8EeL4ia26O//XV9T9ADju4ye8u1L5Ib0Jj
dOYDvGYoZCyStXXC56NaH9OAw6GLGY02VjzNHNd1Yxy3uptcwPRfotr0vYBENdduOLo0nkNU3EEA
jqUXorSwXT3VvW4YxEufcEfulElOnIA18mOfVARoB7apRCHI0xCz68B0VFCOR2IxeW8t7+JV+Vcu
MovQAYJ4oLrEUe6T8eIo+ipvlrWj48TaqL8Q2nVwM2h9m1o0se5O59G8fjG8rdfc8xvVh2CgL5RB
wHjB90nNizRuiMhSfaifkuBUNta/5+ZST33OgV2BHmNNfNzUfN8dW9PuU7PjISGXsgpZsg9Gy8z2
FlOqmIHw9q9bqR6ag4ReJYre6YSnCqv+WlQRTiTYHpRIulZVhZTLpzz0YyRx
=xVIP
-----END PGP SIGNATURE-----

--------------6YUkAkzRm3QABjkgQSZTp6he--

