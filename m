Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 182D7C54F51
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 11:47:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375562.1622690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp2kN-0002Jn-Vh; Wed, 29 Jul 2026 11:46:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375562.1622690; Wed, 29 Jul 2026 11:46:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp2kN-0002Jg-SX; Wed, 29 Jul 2026 11:46:51 +0000
Received: by outflank-mailman (input) for mailman id 1375562;
 Wed, 29 Jul 2026 11:46:50 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fadb2d454000e099@swg.vates.tech>)
 id 1wp2kM-0002Ja-92
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 11:46:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp2kL-00A8wQ-Lp
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 13:46:49 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fadb2d454000e099@swg.vates.tech>)
 id 6a69e828-bab6-0a2a0a5309dd-0a2a4506ec46-10
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 13:46:49 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fadb2d454000e099@swg.vates.tech>)
 id 6a69e829-195a-0a2a45060019-b9ff1c2283f3-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 13:46:49 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fadb2d454000e099.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 29 Jul 2026 11:46:45 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 26C5180FA4;
 Wed, 29 Jul 2026 13:46:45 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=niuzni8HprkTeMS2ky6SWUgDm9ed9hJ180k8/X0Ie6s=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=eYKkey8TyOUHnTbJ+jptxSPIi3JTFd1y+W0PTZZGQGO4CEEvCJ/q8WOnxyhO8ooxMrBM/DxGj
 squG/1K6di6zyNRYSShjz67FuunKqNiJak6oi/Jr2plpeYxE3tk/Rq2Uh74102z0NWoWKl8Km//
 +lWqKm7BqNohz8BVpx3+c2F6ZybVnPh8Z2USlfXnDIgSkmXhftzlkKTdEWr3natpCIoc/ydm8uE
 LTTv+fWEXjGUug2fsnlhtGK3RHAKOy76/XHCuWh/eX9XjKBIDlR5kx3nk1FTiHkkuTWIUjotOy6
 GddsgyoUzKsGNiuXsG0u74dcmOIssmcH3oSvhIZBA9ag==
X-Zone-Loop: 28e585e24ee679df89918143b2ccc4620344241d016d
x-campaign-type: default
x-transaction-id: c9669ce3-2c7b-4009-8b81-90c8291f1f9f
x-swg-uid: 01-3880eb5d-9598-4e36-8ea6-f36f0b9b1cbd
X-Mailer: Sweego
Message-ID:
 <1785325606.8631fc262581453bbf619ec5b2062170.19fadb2d454000e099@vates.tech>
x-swg-bid: 1785325606.8631fc262581453bbf619ec5b2062170.19fadb2d454000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 29 Jul 2026 13:46:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] tools/ocaml: Fix crash in
 Xenctrl.domain_getinfo{,list} on ARM
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Julian Vetter <julian.vetter@vates.tech>,
 Andrii Sultanov <andriy.sultanov@vates.tech>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20260728154830.67734-1-andrew.cooper3@citrix.com>
 <20260728154830.67734-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260728154830.67734-2-andrew.cooper3@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8sQzzrI09qI4iylqGVeMcYtm"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1785325605298
X-purgate-ID: tlsNG-16d1c6/1785325609-F480577B-C86EF3D3/0/0
X-purgate-type: clean
X-purgate-size: 6544

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8sQzzrI09qI4iylqGVeMcYtm
Content-Type: multipart/mixed; boundary="------------b6BtqicTZPrIk6tvhvhfNCiq";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Julian Vetter <julian.vetter@vates.tech>,
 Andrii Sultanov <andriy.sultanov@vates.tech>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Message-ID: <98d9faf7-ecf2-4c19-b44f-35f12b5f55ea@vates.tech>
Subject: Re: [PATCH 1/2] tools/ocaml: Fix crash in
 Xenctrl.domain_getinfo{,list} on ARM
References: <20260728154830.67734-1-andrew.cooper3@citrix.com>
 <20260728154830.67734-2-andrew.cooper3@citrix.com>
In-Reply-To: <20260728154830.67734-2-andrew.cooper3@citrix.com>

--------------b6BtqicTZPrIk6tvhvhfNCiq
Content-Type: multipart/mixed; boundary="------------qIJoIFq0X8hBTMxf1KGE2D54"

--------------qIJoIFq0X8hBTMxf1KGE2D54
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMjgvMDcvMjAyNiDDoCAxNzo0OSwgQW5kcmV3IENvb3BlciBhIMOpY3JpdMKgOg0KPiBU
aGUgU3RvcmVfZmllbGQocmVzdWx0LCAxNiwgYXJjaF9jb25maWcpIHNpdHMgaW5zaWRlIGFu
IGlmZGVmIHg4NiwgbWVhbmluZw0KPiB0aGF0IG9uIG90aGVyIGFyY2h0aWVjdHVyZXMgdGhl
IHBvaW50ZXIgaXMgbm90IGZpbGxlZCBpbi4gIFRoZSBPY2FtbCBydW50aW1lDQo+IHRoZW4g
ZmFsbHMgb3ZlciBhIE5VTEwgcG9pbnRlciAocmVhbGx5IHRoZSBWYWxfdW5pdCB1c2VkIHRv
IGluaXRpYWxpc2UNCj4gJ3Jlc3VsdCcpIHdoZW4gdGhlIGxheW91dCBpbiB0aGUgaGVhcCBk
b2Vzbid0IG1hdGNoIHRoZSB0eXBlIHN5c3RlbS4NCj4gDQo+IFJlYXJyYW5nZSBhbGxvY19k
b21haW5pbmZvKCkgdG8gYXZvaWQgdGhpcy4gIFNpbWlsYXJseSB0bw0KPiBwaHlzaW5mb19h
cmNoX2NhcHMoKSwgcmFpc2UgYW4gZXhjZXB0aW9uIGlmIHRoZSBhcmNoaXRlY3R1cmUgY29k
ZSBoYXNuJ3QNCj4gZmlsbGVkIGluIGFuIGFwcHJvcHJpYXRlIHRhZy4gIE1vdmUgdGhlIHNl
dHVwIG9mIGFyY2hfZG9tYWluY29uZmlnIHRvIGJlDQo+IGNvbW1vbiBsb2dpYy4NCj4gDQo+
IEluIG9yZGVyIHRvIHNpbXBsaWZ5IHRoZSBhZGRpdGlvbiBvZiBvdGhlciBhcmNoaXRlY3R1
cmVzLCByZW1vdmUgdGhlDQo+IGFyY2hfY29uZmlnIHZhcmlhYmxlIChyZXN1aW5nIHRtcCBh
cyBpdCdzIHRvdWNoZWQgZXhhY3RseSBvbmNlKSwgYW5kIHJlbmFtZQ0KPiB4ODZfYXJjaF9j
b25maWcgdG8gYmUgYXJjaF9jb25maWcgc28gZWFjaCBhcmNoaXRlY3R1cmUgY2FuIGZpbGwg
aW4gYSBzdWl0YWJsZQ0KPiBvbmUgd2l0aG91dCBuZWVkaW5nIG1vcmUgbG9jYWwgdmFyaWFi
bGVzLg0KPiANCj4gUmVwb3J0ZWQtYnk6IEp1bGlhbiBWZXR0ZXIgPGp1bGlhbi52ZXR0ZXJA
dmF0ZXMudGVjaD4NCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4NCg0KUmV2aWV3ZWQtYnk6IFRlZGR5IEFzdGllIDx0ZWRkeS5h
c3RpZUB2YXRlcy50ZWNoPg0KDQpJIGd1ZXNzIHRoYXQgcmVxdWlyZXMgdGhlIE9DYW1sIHVz
ZXIgc2lkZSB0byBiZSBhcHByb3ByaWF0ZWx5IHBhdGNoZWQgdG8gDQpub3QgZ2V0IGRhdGEg
aW4gdGhlIHdyb25nIG9yZGVyID8NCg0KVGVkZHkNCg==
--------------qIJoIFq0X8hBTMxf1KGE2D54
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------qIJoIFq0X8hBTMxf1KGE2D54--

--------------b6BtqicTZPrIk6tvhvhfNCiq--

--------------8sQzzrI09qI4iylqGVeMcYtm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmpp6CQFAwAAAAAACgkQZg+p0QLLz9Ci
NQwAhQ7pBiuTDDDs7BoLE7GyPuZsHOUT5il3khVByrHl+nBnfVHkf+6O3vMuJ2EGrWEqWS5/NuHx
2c/UYjXPWEAP964d78Uqj7UjCdZW69jJrrdHWynquX72gpCXuA538VVWGninocKZuiv2MYQY8ePz
kuiju9/HApgDFEyCslth+Sy8GufPKxH+ZyenowSsfMAJ+7xbKQi/V7SOeI1atFHWsdDsk9i91z3U
8u1Io0INF1KbJ4XetkDavgmWgVFb+xN40A6mw+1IpRdBqAzHfJjqYg0YfEs7n7btb3uanbom++nF
ABTMJLUNuPTV0+S9PvPSgjrIvmpuFGcAnyQTcNRylm3xXi1RuL19AyJ6oWr+evsd4xQocGid43Uj
nwm1RG0owAbcUpdIylWh3gK9/saCAAGLn306MQFYlQNXYf/LD/H7mk7k1rhy4XRfsMvniYJZF/Li
8cvyI2MSfFw/kLPgnkFkyv6ZBsvGMHX7IXDqCJkPpwn4MS69D+F8TbFqen+o
=ipYy
-----END PGP SIGNATURE-----

--------------8sQzzrI09qI4iylqGVeMcYtm--

