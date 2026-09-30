Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C432CA5FC5
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 20:43:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437891.1656832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xC18l-0004rJ-Id; Wed, 30 Sep 2026 20:42:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437891.1656832; Wed, 30 Sep 2026 20:42:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xC18l-0004rC-Fe; Wed, 30 Sep 2026 20:42:59 +0000
Received: by outflank-mailman (input) for mailman id 1437891;
 Wed, 30 Sep 2026 20:42:58 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f40e54cd0003f66@swg.vates.tech>)
 id 1xC18k-0004r6-5G
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 20:42:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xC18i-00AmTO-W9
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 22:42:57 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f40e54cd0003f66@swg.vates.tech>)
 id 6abd73e7-e002-0a2a0a5209dd-0a2a4501d0de-48
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 22:42:56 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f40e54cd0003f66@swg.vates.tech>)
 id 6abd7450-5984-0a2a45010019-b9ff1c229729-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 22:42:56 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0f40e54cd0003f66.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 30 Sep 2026 20:42:55 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 1C9DA80A47;
 Wed, 30 Sep 2026 22:42:54 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=JS75m146Jm1RmmNY3DnqcLJFkd2RAlbIfPFM3CarXxo=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=CJfWHSzzHFA2knkjl6VUE/QYWaH5iQk7udlSJln6yQEVGN24z5MNk+7Ao9XM9S/Iek8233k0N
 t7euzK8MjabL8ffhlWFApiz6kC8CjceAhgkmfPhrgvYbfQlj8SASGNJnU/wVq49txtgxzGqU3TI
 b14Rh2NkL4cIBP0YSwqOYoUf2SSpspC90lsnZHbj21FOxI5lVu1lzPkWoHaFotX7IZX+dg7Xtgu
 0g238DXd1+4LzY7NSuJ5JhQAhFoN3iTgCYICwW34hQ6isZ7eCeHq5lOTror3SJ+j5q3S9YEJNc1
 wb75zqg0q66kgdC/o6gNAJibYonSkme0N6MKIUY5bKnw==
X-Zone-Loop: 4f7e0703e2da18c7c662bcfef11206a81e73a9422a15
x-campaign-type: default
x-transaction-id: c062c83f-48fb-46ae-928d-514cd9e2c134
x-swg-uid: 01-4ea279b6-fa3c-4008-be0a-c41c2bd925cd
X-Mailer: Sweego
Message-ID:
 <1790800975.8631fc262581453bbf619ec5b2062170.1a0f40e54cd0003f66@vates.tech>
x-swg-bid: 1790800975.8631fc262581453bbf619ec5b2062170.1a0f40e54cd0003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 30 Sep 2026 22:42:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: restrict XENFEAT_pae_pgdir_above_4gb setting to
 PV guests
To: Roger Pau Monne <roger@xenproject.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20260930191104.78141-1-roger@xenproject.org>
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
In-Reply-To: <20260930191104.78141-1-roger@xenproject.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------prhZZv3VGvjw54VZfpXxrpBP"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790800974279
X-purgate-ID: tlsNG-d62444/1790800976-BEA66757-64C9B25F/0/0
X-purgate-type: clean
X-purgate-size: 7181

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------prhZZv3VGvjw54VZfpXxrpBP
Content-Type: multipart/mixed; boundary="------------VHYo4V0ACExnSDuunVcEa2VX";
 protected-headers="v1"; hp="clear"
Message-ID: <71bc6d8d-ccfc-4546-a8cc-951d2c35ebf9@vates.tech>
Date: Wed, 30 Sep 2026 22:42:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: restrict XENFEAT_pae_pgdir_above_4gb setting to
 PV guests
To: Roger Pau Monne <roger@xenproject.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20260930191104.78141-1-roger@xenproject.org>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20260930191104.78141-1-roger@xenproject.org>

--------------VHYo4V0ACExnSDuunVcEa2VX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMzAvMDkvMjAyNiDDoCAyMToxNCwgUm9nZXIgUGF1IE1vbm5lIGEgw6ljcml0wqA6DQo+
IFhFTkZFQVRfcGFlX3BnZGlyX2Fib3ZlXzRnYiBpcyBvbmx5IHVzZWQgYnkgMzJiaXQgUFYg
Z3Vlc3RzLCBoZW5jZSBsaW1pdA0KPiBpdHMgc2V0dGluZyBpbiBYRU5WRVJfZ2V0X2ZlYXR1
cmVzIHRvIHRoZSBpc19wdl9kb21haW4oKSBndWFyZGVkIHNlY3Rpb24sDQo+IHdpdGggdGhl
IHJlc3Qgb2YgdGhlIFBWIHNwZWNpZmljIGZlYXR1cmVzLg0KPiANCj4gTm8gZnVuY3Rpb25h
bCBjaGFuZ2UgaW50ZW5kZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlckB4ZW5wcm9qZWN0Lm9yZz4NCj4gLS0tDQo+ICAgeGVuL2NvbW1vbi9rZXJu
ZWwuYyB8IDYgKysrLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2tlcm5lbC5j
IGIveGVuL2NvbW1vbi9rZXJuZWwuYw0KPiBpbmRleCBmNGJiZDg4MThmYTguLjk1Y2Y1Njgy
NzMxNyAxMDA2NDQNCj4gLS0tIGEveGVuL2NvbW1vbi9rZXJuZWwuYw0KPiArKysgYi94ZW4v
Y29tbW9uL2tlcm5lbC5jDQo+IEBAIC02NzcsOCArNjc3LDYgQEAgbG9uZyBkb194ZW5fdmVy
c2lvbihpbnQgY21kLCBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIGFyZykNCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAoMVUgPDwgWEVORkVBVF92Y3B1X3RpbWVfcGh5c19h
cmVhKSB8DQo+ICAgI2VuZGlmDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgKDFVIDw8
IFhFTkZFQVRfcnVuc3RhdGVfcGh5c19hcmVhKTsNCj4gLSAgICAgICAgICAgIGlmICggVk1f
QVNTSVNUKGQsIHBhZV9leHRlbmRlZF9jcjMpICkNCj4gLSAgICAgICAgICAgICAgICBmaS5z
dWJtYXAgfD0gKDFVIDw8IFhFTkZFQVRfcGFlX3BnZGlyX2Fib3ZlXzRnYik7DQo+ICAgICAg
ICAgICAgICAgaWYgKCBwYWdpbmdfbW9kZV90cmFuc2xhdGUoZCkgKQ0KPiAgICAgICAgICAg
ICAgICAgICBmaS5zdWJtYXAgfD0NCj4gICAgICAgICAgICAgICAgICAgICAgICgxVSA8PCBY
RU5GRUFUX3dyaXRhYmxlX3BhZ2VfdGFibGVzKSB8DQo+IEBAIC02OTIsNyArNjkwLDkgQEAg
bG9uZyBkb194ZW5fdmVyc2lvbihpbnQgY21kLCBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZv
aWQpIGFyZykNCj4gICAgICAgICAgICAgICBpZiAoIGlzX3B2X2RvbWFpbihkKSApDQo+ICAg
ICAgICAgICAgICAgICAgIGZpLnN1Ym1hcCB8PSAoMVUgPDwgWEVORkVBVF9tbXVfcHRfdXBk
YXRlX3ByZXNlcnZlX2FkKSB8DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAo
MVUgPDwgWEVORkVBVF9oaWdobWVtX2Fzc2lzdCkgfA0KPiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAoMVUgPDwgWEVORkVBVF9nbnR0YWJfbWFwX2F2YWlsX2JpdHMpOw0KPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoMVUgPDwgWEVORkVBVF9nbnR0YWJfbWFw
X2F2YWlsX2JpdHMpIHwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKFZNX0FT
U0lTVChkLCBwYWVfZXh0ZW5kZWRfY3IzKSA/DQo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAoMVUgPDwgWEVORkVBVF9wYWVfcGdkaXJfYWJvdmVfNGdiKSA6IDApOw0KPiAg
ICAgICAgICAgICAgIGVsc2UNCj4gICAgICAgICAgICAgICAgICAgZmkuc3VibWFwIHw9ICgx
VSA8PCBYRU5GRUFUX2h2bV9zYWZlX3B2Y2xvY2spIHwNCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICgxVSA8PCBYRU5GRUFUX2h2bV9jYWxsYmFja192ZWN0b3IpIHwNCg0K
UmV2aWV3ZWQtYnk6IFRlZGR5IEFzdGllIDx0ZWRkeS5hc3RpZUB2YXRlcy50ZWNoPg0KDQpU
ZWRkeQ0K

--------------VHYo4V0ACExnSDuunVcEa2VX--

--------------prhZZv3VGvjw54VZfpXxrpBP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmq9dE0FAwAAAAAACgkQZg+p0QLLz9De
qwv9EQvnpe3BV1B07/49HA2tRidqPEoUDJKQxigqv65OZlTc7jiAAT79z3egDWZ12AzR3e0DC51b
XDm3t2BTccxuaOj0iuHbgemcCPLB9WOfq7S8s12633js9u3wZAqF24/jOC3hN9ZgQgP1mm/0rn59
5GPUNO0AX9y3dhO/NUchUqz12aV3JzAapq9t/TeO+uIcrY5jq7YAqMBpSaek64/cf+/FqQPSso3K
O9+23dPLyOBGMEEmNCV0X00yg5bdySKyKseISceLZQpmVKXklVg4MYhBiVV7hiX4g91POnrrAMhh
dQxI6vCuFTI2666b0/emqKLGi07S4o7MWYmAgy9UXpu8G7cS6QoAFF8BeqFr05etpgke1AxR1rfz
3ndnYIvy5DQosxGje4jM8BF2QMF4pYMbM478jhsyy6x94Gw6/xQDJQUc3E3IudYghT393LG1XoMG
r5J+VovBs/9vxe3YLEON+UwRcCoh2XkiBDYOLh5KYOMASXMoNBGYWa7hlIud
=kkcm
-----END PGP SIGNATURE-----

--------------prhZZv3VGvjw54VZfpXxrpBP--

