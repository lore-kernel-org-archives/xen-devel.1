Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D16C54F51
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 11:49:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375569.1622700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp2mv-0002uo-BE; Wed, 29 Jul 2026 11:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375569.1622700; Wed, 29 Jul 2026 11:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp2mv-0002uh-7j; Wed, 29 Jul 2026 11:49:29 +0000
Received: by outflank-mailman (input) for mailman id 1375569;
 Wed, 29 Jul 2026 11:49:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wp2mt-0002ub-AI
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 11:49:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp2ms-00HMbZ-Ft
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 13:49:26 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fadb53164000e099@swg.vates.tech>)
 id 6a69e8b9-2eae-0a2a0a5409dd-0a2a450aa092-36
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 13:49:26 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fadb53164000e099@swg.vates.tech>)
 id 6a69e8c5-f2d2-0a2a450a0019-b9ff1c239c63-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 13:49:25 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fadb53164000e099.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 29 Jul 2026 11:49:20 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 387488324E;
 Wed, 29 Jul 2026 13:49:20 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=nhwkFL+Vm1VhkGG32ZWF0YDP9sHNxn+GbwkuTf5UlaM=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=CFQTYlibGwv29OwaQFwdbqrSF00zthOWo3WTQ1Zxx7PSYJIXLDsiPW0kPiUJY2Ko8zmyoOrfd
 ZHl9jsRUx2J8HBxvA36J7h54A3Ecw5ZDk0V3zUjNzgabSG8BK+FOV7sVbgc/pSzoMrz499vicjv
 wIFzmt10U/mkQDEI5IXsyLYh+miX1zCsCT/eDT6b6aQ+o1ClntSCMnejN3wCkd4GFKotFODPmxU
 84OyUTpQZmMz7Z15kgoAxcwuysm8WxviXQI4sZF1W1Fqoml9F03w/oyZAQKGOjuIjFNf6DMihCo
 A3uXu/9d0uG86yuHsxNS1XncD565Jxnq5Wm1NxYA+UjA==
X-Zone-Loop: b46a30af3a5d36e44e62266020f81485fd0dfbf079cd
x-campaign-type: default
x-transaction-id: f95b4d50-07ff-49c1-9992-b553c29ada30
x-swg-uid: 01-e3c2f700-966a-46fc-9cbe-4bf1781c8d29
X-Mailer: Sweego
Message-ID:
 <1785325760.8631fc262581453bbf619ec5b2062170.19fadb53164000e099@vates.tech>
x-swg-bid: 1785325760.8631fc262581453bbf619ec5b2062170.19fadb53164000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 29 Jul 2026 13:49:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tools/ocaml: Fill arch_config for ARM in
 domain_getinfo{,list}()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Julian Vetter <julian.vetter@vates.tech>,
 Andrii Sultanov <andriy.sultanov@vates.tech>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20260728154830.67734-1-andrew.cooper3@citrix.com>
 <20260728154830.67734-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260728154830.67734-3-andrew.cooper3@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PFWvAyowB9eOfZItKnuErFLi"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1785325760374
X-purgate-ID: tlsNG-4011c0/1785325765-53ED2CFC-807895C1/10/73395122804
X-purgate-type: spam
X-purgate-size: 7532

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PFWvAyowB9eOfZItKnuErFLi
Content-Type: multipart/mixed; boundary="------------EqBmYZTjneX4A50KSdmRRxR0";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Julian Vetter <julian.vetter@vates.tech>,
 Andrii Sultanov <andriy.sultanov@vates.tech>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Message-ID: <2d70c2d9-f3d9-4591-82cc-310213c9083d@vates.tech>
Subject: Re: [PATCH 2/2] tools/ocaml: Fill arch_config for ARM in
 domain_getinfo{,list}()
References: <20260728154830.67734-1-andrew.cooper3@citrix.com>
 <20260728154830.67734-3-andrew.cooper3@citrix.com>
In-Reply-To: <20260728154830.67734-3-andrew.cooper3@citrix.com>

--------------EqBmYZTjneX4A50KSdmRRxR0
Content-Type: multipart/mixed; boundary="------------y2mSGaPn13FBOXl0FV0VSMQv"

--------------y2mSGaPn13FBOXl0FV0VSMQv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMjgvMDcvMjAyNiDDoCAxNzo1MCwgQW5kcmV3IENvb3BlciBhIMOpY3JpdMKgOg0KPiBG
cm9tOiBKdWxpYW4gVmV0dGVyIDxqdWxpYW4udmV0dGVyQHZhdGVzLnRlY2g+DQo+IA0KPiBB
ZGQgdGhlIG1pc3NpbmcgQVJNIGxvZ2ljLCBwb3B1bGF0aW5nIHhlbl9hcm1fYXJjaF9kb21h
aW5jb25maWcNCj4gZnJvbSB0aGUgcmF3IHhjX2RvbWFpbmluZm9fdCB0aGUgc2FtZSB3YXkg
dGhlIHg4NiBicmFuY2ggZG9lcyBmb3INCj4geGVuX3g4Nl9hcmNoX2RvbWFpbmNvbmZpZy4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IEp1bGlhbiBWZXR0ZXIgPGp1bGlhbi52ZXR0ZXJAdmF0
ZXMudGVjaD4NCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4NCg0KUmV2aWV3ZWQtYnk6IFRlZGR5IEFzdGllIDx0ZWRkeS5hc3Rp
ZUB2YXRlcy50ZWNoPg0KDQo+IC0tLQ0KPiBDQzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4NCj4gQ0M6IEFuZHJpaSBTdWx0YW5vdiA8YW5kcml5LnN1bHRh
bm92QHZhdGVzLnRlY2g+DQo+IENDOiBHdWlsbGF1bWUgVGhvdXZlbmluIDxndWlsbGF1bWUu
dGhvdXZlbmluQHZhdGVzLnRlY2g+DQo+IENDOiBKdWxpYW4gVmV0dGVyIDxqdWxpYW4udmV0
dGVyQHZhdGVzLnRlY2g+DQo+IENDOiBPbGVrc2lpIEt1cm9jaGtvIDxvbGVrc2lpLmt1cm9j
aGtvQGdtYWlsLmNvbT4NCj4gLS0tDQo+ICAgdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJs
X3N0dWJzLmMgfCAxNiArKysrKysrKysrKysrKy0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE0
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdG9v
bHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsX3N0dWJzLmMgYi90b29scy9vY2FtbC9saWJzL3hj
L3hlbmN0cmxfc3R1YnMuYw0KPiBpbmRleCA0NDFlMWQ4M2NmZWMuLmZiOTgzNzA5MDY2ZiAx
MDA2NDQNCj4gLS0tIGEvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsX3N0dWJzLmMNCj4g
KysrIGIvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsX3N0dWJzLmMNCj4gQEAgLTQ0NCw5
ICs0NDQsMjEgQEAgc3RhdGljIHZhbHVlIGFsbG9jX2RvbWFpbmluZm8oeGNfZG9tYWluaW5m
b190ICogaW5mbykNCj4gICANCj4gICAJU3RvcmVfZmllbGQocmVzdWx0LCAxNSwgdG1wKTsN
Cj4gICANCj4gLSNpZiBkZWZpbmVkKF9faTM4Nl9fKSB8fCBkZWZpbmVkKF9feDg2XzY0X18p
DQo+ICsjaWYgZGVmaW5lZChfX2FybV9fKSB8fCBkZWZpbmVkKF9fYWFyY2g2NF9fKQ0KPiAg
IA0KPiAtCXRhZyA9IDE7IC8qIHRhZyB4ODYgKi8NCj4gKwl0YWcgPSAwOyAvKiB0YWcgQVJN
ICovDQo+ICsNCj4gKyAgICAgICAgLyogeGVuX2FybV9hcmNoX2RvbWFpbmNvbmZpZyAqLw0K
PiArICAgICAgICBhcmNoX2NvbmZpZyA9IGNhbWxfYWxsb2NfdHVwbGUoMyk7DQo+ICsgICAg
ICAgIEZpZWxkKGFyY2hfY29uZmlnLCAwKSA9IFZhbF9pbnQoaW5mby0+YXJjaF9jb25maWcu
Z2ljX3ZlcnNpb24pOw0KPiArICAgICAgICBGaWVsZChhcmNoX2NvbmZpZywgMSkgPSBWYWxf
aW50KGluZm8tPmFyY2hfY29uZmlnLm5yX3NwaXMpOw0KPiArDQo+ICsJdG1wID0gY2FtbF9j
b3B5X2ludDMyKGluZm8tPmFyY2hfY29uZmlnLmNsb2NrX2ZyZXF1ZW5jeSk7DQo+ICsgICAg
ICAgIEZpZWxkKGFyY2hfY29uZmlnLCAyKSA9IHRtcDsNCj4gKw0KPiArI2VsaWYgZGVmaW5l
ZChfX2kzODZfXykgfHwgZGVmaW5lZChfX3g4Nl82NF9fKQ0KPiArDQo+ICsgICAgICAgIHRh
ZyA9IDE7IC8qIHRhZyB4ODYgKi8NCj4gICANCj4gICAJLyoNCj4gICAJICogZW11bGF0aW9u
X2ZsYWdzOiB4ODZfYXJjaF9lbXVsYXRpb25fZmxhZ3MgbGlzdDsNCg0KVGVkZHkNCg==
--------------y2mSGaPn13FBOXl0FV0VSMQv
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------y2mSGaPn13FBOXl0FV0VSMQv--

--------------EqBmYZTjneX4A50KSdmRRxR0--

--------------PFWvAyowB9eOfZItKnuErFLi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmpp6L8FAwAAAAAACgkQZg+p0QLLz9BB
/Av+NI9l3NzyWOP8nBphMOK3XrHD+sbDwbIJa4EMoL36p49hNcV6AAWfz4KImDs5a5R93fzZeD+9
cv0XqbgkcsngCi1lOOQoKYwrvAfgIW42Q7HOJwZ/+isk8bAdgY1qYEzt9wl5BgTEAq0ltrtlXfng
9vIeWmkLk+R1saTNI0s0mY42N+dzFrsg8zVWFbONf+aePtdzHImA3SU9CzErP1xbQ5KGVQDET8lO
NPEdZl2FF9bnDJJP/UM5iKGT+XG2S8AzS7q6puXFebfpIvD/uv8AeRUlh797yI9pUvS6K8nFeCdS
JRxf2sAwHAv/5rTPchv7qu/+xcwaIB9Hhf9Xq79BFH+kz4/qDrPNlaPkSS3VfUL5HeyLyo/RVDhu
70GUWaHOIazpc4S3yZTXhcfz28bF37KKTgYIuqmqgV5yEuzVmyWhLfV+UXL2EIUuwhFap+zJuovk
N253hPF4tR7UUDb9ja/2DZD6eor1r33FInZE9ReqYDJl/mphoIpQh1XyDmY7
=Ct9x
-----END PGP SIGNATURE-----

--------------PFWvAyowB9eOfZItKnuErFLi--

