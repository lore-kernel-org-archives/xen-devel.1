Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81AFC44501
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 13:35:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1364056.1615422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkMFa-0005xN-2G; Thu, 16 Jul 2026 13:35:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1364056.1615422; Thu, 16 Jul 2026 13:35:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkMFZ-0005xG-Vg; Thu, 16 Jul 2026 13:35:41 +0000
Received: by outflank-mailman (input) for mailman id 1364056;
 Thu, 16 Jul 2026 13:35:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f6b23cedf000edb5@swg.vates.tech>)
 id 1wkMFX-0005xA-Jc
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 13:35:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkMFW-006flC-T0
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 15:35:39 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f6b23cedf000edb5@swg.vates.tech>)
 id 6a58de21-bab6-0a2a0a5309dd-0a2a4502ea00-42
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 15:35:38 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f6b23cedf000edb5@swg.vates.tech>)
 id 6a58de2a-6ca4-0a2a45020019-b9ff1c129e61-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 15:35:38 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f6b23cedf000edb5.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 16 Jul 2026 13:35:36 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id CC44F823E6;
 Thu, 16 Jul 2026 15:35:35 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=cWgAouQsB56tdya9xW1J+VD1EitauzLiFRhIPCJzsZQ=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=slBZxe8yKQZFqJVHRnrHj4726RoLVw6LWxUvH36xELHCxvOwkbp015q6a1QvCNI90rNs/9nK9
 7FgZ3WRpLX5C62Mb90OAZQ+8O4JeUDFS9U3Ynml4jaTzwaRc2phuHJnEca5eSM6Ow4/pnXwS3oa
 zRwF3shAFrkABWqIemzPs00x4h5Bnpw60QrOb4rN0qzjTgaL3qiB+vQyTAc+xWvTkEz2xr+LwD0
 2IlNVp0T11XVcjQS20pz1JFNYmKwybkAd38YnUqvhS4w+R3FwQHzbPTXhpomgoa60G7iW3l7uJV
 cloMF5uKGASMdP0/rTWnohojgV2m3kBLYh+8yp02QFtg==
X-Zone-Loop: 6036213d976c757496570ce6a34eb7c6601cabb2c0b9
x-campaign-type: default
x-transaction-id: 84312875-886b-4eaf-8e4d-55a93a74db44
x-swg-uid: 01-b513e3bd-3b7c-4df2-b13b-b298c22dfd94
X-Mailer: Sweego
Message-ID:
 <1784208936.8631fc262581453bbf619ec5b2062170.19f6b23cedf000edb5@vates.tech>
x-swg-bid: 1784208936.8631fc262581453bbf619ec5b2062170.19f6b23cedf000edb5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Thu, 16 Jul 2026 15:35:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: V{,P}{COMPRESS,EXPAND}* can (wrongly) trigger
 assertion
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <43b0c3d2-49cb-4759-a111-8fe083c723b6@suse.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <43b0c3d2-49cb-4759-a111-8fe083c723b6@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tUyC3E5Hejw0QS0y7zyS5kER"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1784208935958
X-purgate-ID: tlsNG-720697/1784208938-F2CB22AC-99F91CEC/0/0
X-purgate-type: clean
X-purgate-size: 7843

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------tUyC3E5Hejw0QS0y7zyS5kER
Content-Type: multipart/mixed; boundary="------------7NEZfsOGakBKE9JHNmIiElmc";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Message-ID: <b9391fb5-630c-45c7-bdd7-3f59f34c8758@vates.tech>
Subject: Re: [PATCH] x86emul: V{,P}{COMPRESS,EXPAND}* can (wrongly) trigger
 assertion
References: <43b0c3d2-49cb-4759-a111-8fe083c723b6@suse.com>
In-Reply-To: <43b0c3d2-49cb-4759-a111-8fe083c723b6@suse.com>

--------------7NEZfsOGakBKE9JHNmIiElmc
Content-Type: multipart/mixed; boundary="------------a3F74mggivaHAjDtoL6tpIFO"

--------------a3F74mggivaHAjDtoL6tpIFO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMTYvMDcvMjAyNiDDoCAxMjo0NSwgSmFuIEJldWxpY2ggYSDDqWNyaXTCoDoNCj4gQUZM
IGhhcyBwb2ludGVkIG91dCB0aGF0IHRoZSBvcF9ieXRlcy1pcy1ub3QtMCBhc3NlcnRpb24g
aW4gY29tbW9uIFNJTUQNCj4gaGFuZGxpbmcgY2FuIHRyaWdnZXIgZm9yIHRoZXNlIGluc25z
LiBJbmRlZWQgd2hlbiB0aGUgKHJlbGV2YW50IHBhcnQgb2YpDQo+IHRoZSBjb250cm9sbGlu
ZyBtYXNrIHJlZ2lzdGVyIGlzIDAsIG5vIG1lbW9yeSBpcyBhY2Nlc3NlZCBhdCBhbGwuIExl
YXZlDQo+IG9wX2J5dGVzIHVuYWx0ZXJlZCBpbiB0aGlzIGNhc2UsIHRvIGVuZ2FnZSB0aGUg
c2hvcnQtY2lyY3VpdGluZyBpbiBjb21tb24NCj4gU0lNRCBoYW5kbGluZyB3aGVuIGZhdWx0
X3N1cHByZXNzaW9uIGlzIHRydWUgYW5kIG9wX2J5dGVzIGlzIDAuDQo+IA0KPiBXaGlsZSB0
aGVyZSBhbHNvIGNvcnJlY3QgYSByZWxhdGVkIHR5cG8gaW4gdGhlIHRlc3QgaGFybmVzcy4N
Cj4gDQo+IEZpeGVzOiA2NWY4MmQ0Y2UxZWEgKCJ4ODZlbXVsOiBzdXBwb3J0IEFWWDUxMntG
LF9WQk1JMn0gY29tcHJlc3MvZXhwYW5kIGluc25zIikNCj4gU2lnbmVkLW9mZi1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiAtLS0NCj4gSW4gYSByZWxlYXNlIGJ1
aWxkLCBkdWUgdG8gb3BfbWFzayBiZWluZyAwIHdoZW4gbiBpcyAwLCB0aGUgc2hvcnQtY2ly
Y3VpdA0KPiBtZW50aW9uZWQgd2lsbCBwcmV2ZW50IGFueSBkYW1hZ2UuDQo+IA0KPiAtLS0g
YS90b29scy90ZXN0cy94ODZfZW11bGF0b3IvcHJlZGljYXRlcy5jDQo+ICsrKyBiL3Rvb2xz
L3Rlc3RzL3g4Nl9lbXVsYXRvci9wcmVkaWNhdGVzLmMNCj4gQEAgLTE5NDYsNyArMTk0Niw3
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZXZleCB7DQo+ICAgICAgIHsgeyAweDgzIH0sIDIs
IFQsIFIsIHBmeF82NiwgVzEsIExuIH0sIC8qIHZwbXVsdGlzaGlmdHFiICovDQo+ICAgICAg
IHsgeyAweDg4IH0sIDIsIFQsIFIsIHBmeF82NiwgV24sIExuIH0sIC8qIHZwZXhwYW5kcHtz
LGR9ICovDQo+ICAgICAgIHsgeyAweDg5IH0sIDIsIFQsIFIsIHBmeF82NiwgV24sIExuIH0s
IC8qIHZwZXhwYW5ke2QscX0gKi8NCj4gLSAgICB7IHsgMHg4YSB9LCAyLCBULCBXLCBwZnhf
NjYsIFduLCBMbiB9LCAvKiB2cGNvbXByZXNzcHtzLGR9ICovDQo+ICsgICAgeyB7IDB4OGEg
fSwgMiwgVCwgVywgcGZ4XzY2LCBXbiwgTG4gfSwgLyogdmNvbXByZXNzcHtzLGR9ICovDQo+
ICAgICAgIHsgeyAweDhiIH0sIDIsIFQsIFcsIHBmeF82NiwgV24sIExuIH0sIC8qIHZwY29t
cHJlc3N7ZCxxfSAqLw0KPiAgICAgICB7IHsgMHg4ZCB9LCAyLCBGLCBSLCBwZnhfNjYsIFdu
LCBMbiB9LCAvKiB2cGVybXtiLHd9ICovDQo+ICAgICAgIHsgeyAweDhmIH0sIDIsIEYsIFIs
IHBmeF82NiwgVzAsIExuIH0sIC8qIHZwc2h1ZmJpdHFtYiAqLw0KPiAtLS0gYS94ZW4vYXJj
aC94ODYveDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuYw0KPiArKysgYi94ZW4vYXJjaC94ODYv
eDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuYw0KPiBAQCAtNjIzNiw5ICs2MjM2LDExIEBAIHg4
Nl9lbXVsYXRlKA0KPiAgICAgICAgICAgICAgIEFTU0VSVChvcF9ieXRlcyA9PSBuICogZWxl
bV9ieXRlcyk7DQo+ICAgICAgICAgICAgICAgb3BfbWFzayAmPSB+MFVMTCA+PiAoNjQgLSBu
KTsNCj4gICAgICAgICAgICAgICBuID0gaHdlaWdodDY0KG9wX21hc2spOw0KPiAtICAgICAg
ICAgICAgb3BfYnl0ZXMgPSBuICogZWxlbV9ieXRlczsNCj4gICAgICAgICAgICAgICBpZiAo
IG4gKQ0KPiArICAgICAgICAgICAgew0KPiArICAgICAgICAgICAgICAgIG9wX2J5dGVzID0g
biAqIGVsZW1fYnl0ZXM7DQo+ICAgICAgICAgICAgICAgICAgIG9wX21hc2sgPSB+MFVMTCA+
PiAoNjQgLSBuKTsNCj4gKyAgICAgICAgICAgIH0NCj4gICAgICAgICAgIH0NCj4gICAgICAg
ICAgIGdvdG8gc2ltZF96bW07DQo+ICAgDQo+IA0KDQpUaGF0IGxvb2tzIGxpa2UgYSBiaXQg
b2YgYSBoYWNrIGluIG15IHVuZGVyc3RhbmRpbmcuDQpJcyB0aGVyZSBhbnl0aGluZyBzcGVj
aWZpYyBwcmV2ZW50aW5nIHRoZSBjb21tb24gU0lNRCBsb2dpYyBmcm9tIA0KYWNjZXB0aW5n
IG9wX2J5dGVzIGJlaW5nIDAgPyBPdGhlcndpc2UsIHdlIHJpc2sgc2VlaW5nIHNpbWlsYXIg
aXNzdWVzIA0Kd2l0aCBvdGhlciBpbnN0cnVjdGlvbnMgKGZ1dHVyZSBvciBjdXJyZW50KS4N
Cg==
--------------a3F74mggivaHAjDtoL6tpIFO
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------a3F74mggivaHAjDtoL6tpIFO--

--------------7NEZfsOGakBKE9JHNmIiElmc--

--------------tUyC3E5Hejw0QS0y7zyS5kER
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmpY3icFAwAAAAAACgkQZg+p0QLLz9CB
kwv/aye6WxO31H/AyxXh+ZEcpRD1ze1nBYRX09x+oMx2JxRIoq3YRD7vjht2IYDjfUCvRMhjlEsC
ejc7ckwCTTzg4ptFpmqSct11JzBGqC13f7CjZ3andMWDx+6KWSIxrTFxThreHKtgD7hPIEak5uEo
BHTKewkzstbkGHfq3uwxuXAXqKJKv1MKKi66T5nwN2phKa8at5eIMEVJpgKtuIgZxJjneWg54pK0
9IqJpW7tO41W/LZG7iLuyEHmC5QAH3qjVDx8CcC3JtbDWwebGL/qvO5S+IFoF+6o/j2otpBmTYtv
y23HHe7eg6k/LQUNEH5JoQZ71T1wW7szxXrGYSQ6Em1wMiuiacG3fk2r82dcI5yMJwYvGbLC9J3C
HQyK0UrAMiNkUlajg4kTTusypOOAEMyYwdTOxaMQxygxsskXFolg54AhRIxU7iJppeRVXZWtmg+k
OlxsXCyj6ncXWfCXfES3lCOLEe5aQ5UncfXmPEhrgSO3Wt6ko92vvR2vAyVe
=hBqG
-----END PGP SIGNATURE-----

--------------tUyC3E5Hejw0QS0y7zyS5kER--

