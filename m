Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34BD606A31A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 09:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=TWbpOjnr
Received: from list by lists.xenproject.org with outflank-mailman.1462984.1673958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM07B-0006B1-GL; Wed, 28 Oct 2026 09:38:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462984.1673958; Wed, 28 Oct 2026 09:38:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM07B-0006As-De; Wed, 28 Oct 2026 09:38:37 +0000
Received: by outflank-mailman (input) for mailman id 1462984;
 Wed, 28 Oct 2026 09:38:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a181e021b2000f79f@swg.vates.tech>)
 id 1xM078-00069U-WD
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 09:38:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xM078-009Tts-4w
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 10:38:34 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a181e021b2000f79f@swg.vates.tech>)
 id 6ae1c28e-bab6-0a2a0a5309dd-0a2a4502bc08-42
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 10:38:33 +0100
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a181e021b2000f79f@swg.vates.tech>)
 id 6ae1c299-6ca4-0a2a45020019-b9ff1c128959-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 10:38:33 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a181e021b2000f79f.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 28 Oct 2026 09:38:31 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 0CB6F81D19;
 Wed, 28 Oct 2026 10:38:31 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=PPf7A+aEfn7JkqvA4t57I1tJGRIJz2np38/i7rFYbAE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=TWbpOjnrwmr+3HWV3x4/mdvf+44vwYudnwrplhEqHJ7wDiHqks/13pUvsSg52+qd1IZXItfVm
 39dyf/1vrTFEu4Xx8xzPW8vcTb2IqCS4XK00YXgvuR0O/vVCi98nF6/x65KYno9msxnqXvmxZlk
 27Ja/xWjXBIhgFWsgVlsPOGMLytrzPeUggScmiaDfoyYDmC66ijfF5BnFWuA1FemV/ql+NxV7Uq
 i1FmHqi7dxSxaP+DujdTPiNYlt0X69PxWCZUeE/rmSLSowLilHmxv3U0Cx13/YDjMKhDej4Cw0Y
 HQqMHu/A1ZazP0R1Dfe2eBDTT4lrxuJaOpOXkEkd9H5g==
X-Zone-Loop: e3d3afb166c0a788c4c5aa3dabd53eed17e7a8e02680
x-campaign-type: default
x-transaction-id: 20c83a94-96c5-49cc-9797-b55f11fd46a9
x-swg-uid: 01-bd4ac6f4-ec93-4c31-afb6-0db54a37726e
X-Mailer: Sweego
Message-ID:
 <1793180312.8631fc262581453bbf619ec5b2062170.1a181e021b2000f79f@vates.tech>
x-swg-bid: 1793180312.8631fc262581453bbf619ec5b2062170.1a181e021b2000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Wed, 28 Oct 2026 10:38:30 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] tools/libs/guest: reject non-zero reserved fields
 in PAGE_DATA
To: Marcus Granado <marcus.granado@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Frediano Ziglio <freddy77@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>
References: <20261020200238.1815766-1-marcus.granado@citrix.com>
 <20261020200238.1815766-2-marcus.granado@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20261020200238.1815766-2-marcus.granado@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Pc66tAo0acgYaobCTayKz733"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793180311224
X-purgate-ID: tlsNG-720697/1793180313-317CA2AC-22D868B3/0/0
X-purgate-type: clean
X-purgate-size: 6952
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Pc66tAo0acgYaobCTayKz733
Content-Type: multipart/mixed; boundary="------------iRnwqgWgIP7gj3fLJW03EYqX";
 protected-headers="v1"; hp="clear"
Message-ID: <1cf0078f-e343-4bbb-b0f1-f6a317c48983@vates.tech>
Date: Wed, 28 Oct 2026 10:38:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] tools/libs/guest: reject non-zero reserved fields
 in PAGE_DATA
To: Marcus Granado <marcus.granado@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Frediano Ziglio <freddy77@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>
References: <20261020200238.1815766-1-marcus.granado@citrix.com>
 <20261020200238.1815766-2-marcus.granado@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 xsDNBGn5sK8BDACuzSrrTjpVf4ay06OYB6yY0J1PqKffihoNMtrQRZjAHxoAPC7LTBVHV/XO
 Zw5HJc+9R71z1JV+iYg6z3jPziGKzX8Fj3ZXlzJPmpf1PuETH3KdbvtJT4ny+OGntnJntUoR
 KRPhTirr6yNeBk/637O3CQXjtqFUPZnko8OI/o1yawIBhJJAWicutjkkUgd28Bh6HV9EIumH
 tCBgn5/1A/fpm9624MMgYLsA8qjC4XsoovQvFCaO8HEhvfzrrTZHjn/nPeB9SigxIxXW8YaT
 VqMdqul07o72m3eA2mf+LMu9a04FX/d4wbxBLtELm+1jIrbtyaFZEMOLv/haSiS/Lj3btJH/
 EoucejoZ5SH49ksmVAmKOLktOaTQ8b2gEvP7iaKiIiszCCtOSRohr+2GvDsDeLvVZnlR3I+S
 PhHar7TPKjFz0G3DPNolyjXywNqOAMpomSPi8lSwjAFsxOtQbcck/qRGRSNk4DAmH70pA+89
 MXfQXZ3qt1Q01B1+sU0I8xsAEQEAAc0kVGVkZHkgQXN0aWUgPHRlZGR5LmFzdGllQHZhdGVz
 LnRlY2g+wsENBBMBCAA3FiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmn5sK8FCQWjmoACGwME
 CwkIBwUVCAkKCwUWAgMBAAAKCRBmD6nRAsvP0ID6DACGOktArFbLKHNzuyOVCskwfUZPla6Z
 pd3GZ8r61SrAKePIr2BnpgPkd0hV3bSRkRLIrgjzR2NRCzfp0x0HfuhcYfAYPR46XHTvjaJE
 v99sT/vGUG1BZguYDOScSEpgSNaNlYum3RKZbMuROxdK8G+YHccJY8PvWSq2K2yiae2KGiAv
 1yjnZxug9/PtDfX8vQFUSg2w1ukRDf50wvDohN1zUQfFtofOP2xCRsDZiHAlQ0pF+aUjXQhP
 eP3IdpfWc8cyRLXF06Rk46YMYCytweGtGdHcqAfrVthl84129ZPN422k/voW0sm14gjYlGcT
 UwgnYlFRk2FLq0QeKEDcS0aj3o3EVAQCrayoGzi1pnlIKE3PRGUcUzjGVvzQ/po24gOjwba9
 Egr/Wmu3MQlx/7A8zT5QBzF/n+RYdLNQ0Eu6YnUwf0Z1uieqNaon+olyIRFiLb/hCZHO6ekN
 f5vrm2clHUbQAYaPQebknujoKBo6ZLHg0WM1gZS01Gz+aUpKsUfOwM0EafmwsAEMAKiQiZa3
 yQMmc/h3sDbfVHPSiBA4IMI/NAB7IotzPHq1GzCpsoVILAhF/INbWjxJ3DbVf+en3/FvdVZg
 2S38xtnth0njNdlVKpyxm054phKjbdoFDwaknWolS4hrddTmetSG5/52AjtmPFtlXAk0NmLv
 fJnW3seXVQbgM7sW/MNXPP5UKDpkGnLhnvej+GU0s3109sJeXT5ImVdphFs9cvyZyBT9t1Pb
 Rowv58EgV0zE4hbAeVkULAbxFV5b/ExTjjGVHoX7CVhWxvCiTqCUoXZRkUE9C3FnkzEFRkKb
 Yu6NCfiHfEyB3Xyg9hfdrRgjMRq907zCof+nDtWxGz1MSEuvTj1g9GZ049Bennqzjc/Q+0ov
 XoK4jm+Py0FiUGUaA6yhexficjH+kCR/xDbVnWrMhSLB4AuTBT9HjfZI6gk3uYLhoT8Pig4/
 eVtR2Q1wZIJsFToR6ofGuyECwFcs+PUXN7fmGRSiPXgjAr/zIUBdW0VWCE3OGPNqtRk2E5s6
 IQARAQABwsD8BBgBCAAmFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmn5sLAFCQWjmoACGwwA
 CgkQZg+p0QLLz9DncQwAg76IehTemLIfrB8T9WIBZrI4kUV7G7a4rjiVoUiHYN5QwhnbZnsa
 JDlt+Ezoqy/510eo2bCSzvW5xXYPgyjcuOPwgQo1Qp764QxyX6rld2f2RcWkDuBHun55ZWXj
 by8o21ginPRwruBVYY5rVf3DV1iBu4NurUeHtyFk/dS0XTOQi2wVUb17sW/+ybCEokdVacZG
 zOqP/OmwHrF8ylXlXnhQq6e3r+J+T8fuoGJelm/CJiMwyP6cEWE8sxVqX/iqwjwUYkuOCpE+
 lOWSvdNHgoEkWR0RXBPQjnGmLKbfTl/QDXLk6NP2/r9uxm2HL6Ei3QJKSEdrp+XZaVnk/Off
 O485NOTKwGOxyWb006cTMh53xPkAJFQu4Tvdj+odsHz88jqw5wfPG0BYWx0I/FspYj7N9kZR
 8ULR9nX0LvpzJ/kB4NgHIUt8YtIL6ZSfM2dbF7fKzvx1UqFfvozJZwFzfEieJLXa4nlGgR6D
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20261020200238.1815766-2-marcus.granado@citrix.com>

--------------iRnwqgWgIP7gj3fLJW03EYqX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMjAvMTAvMjAyNiDDoCAyMjowNSwgTWFyY3VzIEdyYW5hZG8gYSDDqWNyaXTCoDoNCj4g
QSBQQUdFX0RBVEEgcmVjb3JkIGhhcyB0d28gcmVzZXJ2ZWQgZmllbGRzOiB0aGUgMzItYml0
IGZpZWxkIGFmdGVyDQo+IGNvdW50LCBhbmQgYml0cyA1OS01MiBvZiBlYWNoIHBmbiBlbnRy
eS4gIGxpYnhlbmd1ZXN0IGlnbm9yZXMgYm90aCBvbg0KPiByZXN0b3JlLCBhcyB0aGUgc3Bl
Y2lmaWNhdGlvbidzIGdlbmVyYWwgcnVsZSBmb3IgcmVzZXJ2ZWQgZmllbGRzDQo+IHJlcXVp
cmVzLCB3aGlsZSB0aGUgUHl0aG9uIHN0cmVhbSB2YWxpZGF0b3INCj4gKHRvb2xzL3B5dGhv
bi94ZW4vbWlncmF0aW9uL2xpYnhjLnB5KSByZWplY3RzIGJvdGguDQo+IA0KPiBBIHJlY2Vp
dmVyIHdoaWNoIGlnbm9yZXMgZWl0aGVyIGZpZWxkIGNhbiBzaWxlbnRseSBtaXNyZWFkIGEg
cmVjb3JkDQo+IHdoaWNoIHVzZXMgaXQgdG8gY2hhbmdlIGhvdyB0aGUgcmVjb3JkJ3MgY29u
dGVudHMgYXJlIG9yZ2FuaXNlZC4NCj4gDQo+IFJlamVjdCBhIFBBR0VfREFUQSByZWNvcmQg
d2l0aCBlaXRoZXIgZmllbGQgbm9uLXplcm8uICBRdWFsaWZ5IHRoZQ0KPiBzcGVjaWZpY2F0
aW9uJ3MgZ2VuZXJhbCBydWxlIHNvIHRoYXQgYSByZWNvcmQgY2FuIG92ZXJyaWRlIGl0LCBy
ZXF1aXJlDQo+IHJlamVjdGlvbiBvZiBib3RoIHJlc2VydmVkIGZpZWxkcywgYW5kIGJ1bXAg
dGhlIHNwZWNpZmljYXRpb24ncw0KPiByZXZpc2lvbi4NCj4gDQo+IFRoaXMgZGVsaWJlcmF0
ZWx5IHRpZ2h0ZW5zIHJlc3RvcmUuICBFdmVyeSBsaWJ4ZW5ndWVzdCBzaW5jZSBYZW4gNC42
LA0KPiBhbmQgY29udmVydC1sZWdhY3ktc3RyZWFtLCB3cml0ZXMgYm90aCBmaWVsZHMgYXMg
emVybywgc28gbm8gc3RyZWFtDQo+IHRoZXkgcHJvZHVjZSBpcyByZWplY3RlZC4NCj4gDQo+
IEJhY2twb3J0OiA0LjE3Kw0KPiBSZXBvcnRlZC1ieTogVGVkZHkgQXN0aWUgPHRlZGR5LmFz
dGllQHZhdGVzLnRlY2g+DQo+IEFzc2lzdGVkLWJ5OiBDbGF1ZGU6Y2xhdWRlLW9wdXMtNS01
DQo+IFNpZ25lZC1vZmYtYnk6IE1hcmN1cyBHcmFuYWRvIDxtYXJjdXMuZ3JhbmFkb0BjaXRy
aXguY29tPg0KPiAtLS0NCj4gDQo+IE5vdGVzOg0KPiAgICAgIENoYW5nZXMgaW4gdjI6DQo+
ICAgICAgLSBOZXcgcGF0Y2gsIGFmdGVyIFRlZGR5IEFzdGllIHBvaW50ZWQgb3V0IG9uIHYx
IHRoYXQgaWdub3JpbmcgcmVzZXJ2ZWQNCj4gICAgICAgIGZpZWxkcyBkb2VzIG5vdCBoZWxw
IGEgZnV0dXJlIGZpZWxkIHdoaWNoIGNoYW5nZXMgaG93IHRoZSByZWNvcmQncw0KPiAgICAg
ICAgY29udGVudHMgYXJlIG9yZ2FuaXNlZC4NCj4gDQo+ICAgZG9jcy9zcGVjcy9saWJ4Yy1t
aWdyYXRpb24tc3RyZWFtLnBhbmRvYyB8IDExICsrKysrKysrLS0tDQo+ICAgdG9vbHMvbGli
cy9ndWVzdC94Z19zcl9yZXN0b3JlLmMgICAgICAgICB8IDE1ICsrKysrKysrKysrKysrKw0K
PiAgIHRvb2xzL2xpYnMvZ3Vlc3QveGdfc3Jfc3RyZWFtX2Zvcm1hdC5oICAgfCAgNSArKyst
LQ0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMo
LSkNCj4gDQpSZXZpZXdlZC1ieTogVGVkZHkgQXN0aWUgPHRlZGR5LmFzdGllQHZhdGVzLnRl
Y2g+DQo=

--------------iRnwqgWgIP7gj3fLJW03EYqX--

--------------Pc66tAo0acgYaobCTayKz733
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmrhwpYFAwAAAAAACgkQZg+p0QLLz9C8
tgv+NxU21ESexyupIIDBcalitRb7HJdb/EPUmSf64VLSPHWiX4yVirQ43FDRjMn8FDHRvrbPhW69
sacnHqj/yCJaf2+oTBSvbcu1StxJoHACBurfWhXEk8O2//gHLU+rqZsRmZi7tGwYTGbtFnq1pQaB
Nwrs0AKsTBVPOGWNg+nusQKiIp8lwtt2L0xxqSyfrYarmyMLYBbP79s8ocSyh20a4mB6FK8KpZUk
1tUL6PRfcfXCsRN0BtsjXXr0hQnwBH6Bto2GeGuuIJHxmvMdkvsa8bARdTUAoHKKQ2fKhTvoUhtE
YRZUx8DeYrHwQ647G5rVyt5isZgasSM2gW/hvZ0HBX7MoaU081MwXUCEGf76wTHEAsqdJs+zTjb5
f7CcyKjE6/9Rhu/Z0sMb688JC25O/6dX2KFDI5Cbq9ydxfRHfvIniGMAQEFtVw8wTLu/hBlfalrR
nfbz3/GdD8frRnit8XqGcSYMNHbUDrUXIv0KMfzJSYCjUZdJHQKxAVrFtK9u
=N53G
-----END PGP SIGNATURE-----

--------------Pc66tAo0acgYaobCTayKz733--

