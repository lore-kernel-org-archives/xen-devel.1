Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE04B606A31A
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 15:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=I+gzWmRo
Received: from list by lists.xenproject.org with outflank-mailman.1464829.1675649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMRvw-0003nd-Ld; Thu, 29 Oct 2026 15:20:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464829.1675649; Thu, 29 Oct 2026 15:20:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMRvw-0003nW-II; Thu, 29 Oct 2026 15:20:52 +0000
Received: by outflank-mailman (input) for mailman id 1464829;
 Thu, 29 Oct 2026 15:20:51 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xMRvu-0003nQ-H1
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 15:20:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMRvt-00GV1X-Tl
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 16:20:49 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1883fc6a5000f79f@swg.vates.tech>)
 id 6ae3643f-e002-0a2a0a5209dd-0a2a450bdc42-36
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 16:20:49 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1883fc6a5000f79f@swg.vates.tech>)
 id 6ae36451-b7e8-0a2a450b0019-b9ff1c22aa2b-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 16:20:49 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1883fc6a5000f79f.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 29 Oct 2026 15:20:43 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 9ADE281B60;
 Thu, 29 Oct 2026 16:20:42 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=XT/9kz4AnqLJK7s6axTpeDwmHhfQUrR3yatWmy939T4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=I+gzWmRomU0BSmj81ak1u9gGw97739i4Wb3w8D5Wn84ra412ZrkV54m+scivWMrp/pUfO8Gl1
 54N79vIzbQxuXMEdHag1VZ/e4Jei/UaVYoNydVEwMVmdx0W8bCA04IpvtPvx/WwUBguf1o71W0Y
 mmWgb+6GiZYdHc0M4fuZJM0mfX0Lhgs+HymemosRdjNhCNDmW7ei26cwOiVTQT67sALplT/5mYz
 UGYPg/Nr6oAE3NjfGzeBFcFmm3nx5fDltBMFgzt0Wtbf1Xr+Vvb3dbe7dKY1zpIdiTr6NV8yPPl
 qhvLx/USEK7SeFQbnlVjgzxxs8OSolb17MZYLBHD8zEg==
X-Zone-Loop: 2e0166678e26cc68daac6ca06cfeaaf9c049911eab1c
x-campaign-type: default
x-transaction-id: 36b410de-f828-4df1-9309-8ed3d7bf8453
x-swg-uid: 01-76ef4c33-ea2d-4eb3-ba5c-4232ad9d9c6d
X-Mailer: Sweego
Message-ID:
 <1793287243.8631fc262581453bbf619ec5b2062170.1a1883fc6a5000f79f@vates.tech>
x-swg-bid: 1793287243.8631fc262581453bbf619ec5b2062170.1a1883fc6a5000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Thu, 29 Oct 2026 16:20:42 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] common: Convert !test_bit(_VPF_down) into
 is_vcpu_online()
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <1793282364.8631fc262581453bbf619ec5b2062170.1a187f55469000f79f@vates.tech>
 <482334fd-1b21-4541-a903-a9e7434daffe@suse.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <482334fd-1b21-4541-a903-a9e7434daffe@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------AszZnxG0BWLO03M0oL5Zt4vr"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793287242830
X-purgate-ID: tlsNG-42698a/1793287249-AACDF9EA-1C39FC96/10/78276251493
X-purgate-type: spam
X-purgate-size: 5991
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------AszZnxG0BWLO03M0oL5Zt4vr
Content-Type: multipart/mixed; boundary="------------wW0y1k0AiAb6vPSUuH8q4PEf";
 protected-headers="v1"; hp="clear"
Message-ID: <e3fc69c4-29c6-4249-ae2a-206cdf630e57@vates.tech>
Date: Thu, 29 Oct 2026 16:20:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] common: Convert !test_bit(_VPF_down) into
 is_vcpu_online()
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <1793282364.8631fc262581453bbf619ec5b2062170.1a187f55469000f79f@vates.tech>
 <482334fd-1b21-4541-a903-a9e7434daffe@suse.com>
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
In-Reply-To: <482334fd-1b21-4541-a903-a9e7434daffe@suse.com>

--------------wW0y1k0AiAb6vPSUuH8q4PEf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMjkvMTAvMjAyNiDDoCAxNToxMSwgSmFuIEJldWxpY2ggYSDDqWNyaXTCoDoNCj4gT24g
MjkuMTAuMjAyNiAxNDo1OCwgVGVkZHkgQXN0aWUgd3JvdGU6DQo+PiBEbyB0aGUgc2FtZSBm
b3IgdGVzdF9iaXQoX1ZQRl9kb3duKSBpbnRvICFpc192Y3B1X29ubGluZSgpLg0KPj4NCj4+
IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRlZGR5IEFz
dGllIDx0ZWRkeS5hc3RpZUB2YXRlcy50ZWNoPg0KPiANCj4gUmV2aWV3ZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gd2l0aCBvbmUgbml0IGFkZHJlc3NlZCAo
Y2FuIGxpa2VseSBiZSBkb25lIHdoaWxlIGNvbW1pdHRpbmcpOg0KPiANCj4+IEBAIC0xOTUs
NyArMTk1LDcgQEAgc3RhdGljIGludDMyX3QgZG9fcHNjaV8wXzJfYWZmaW5pdHlfaW5mbyhy
ZWdpc3Rlcl90IHRhcmdldF9hZmZpbml0eSwNCj4+ICAgICAgICAgICB2ID0gZC0+dmNwdVt2
Y3B1aWRdOw0KPj4gICANCj4+ICAgICAgICAgICBpZiAoICggKCB2LT5hcmNoLnZtcGlkciAm
IHRtYXNrICkgPT0gdGFyZ2V0X2FmZmluaXR5ICkNCj4+IC0gICAgICAgICAgICAgICAgJiYg
KCAhdGVzdF9iaXQoX1ZQRl9kb3duLCAmdi0+cGF1c2VfZmxhZ3MpICkgKQ0KPj4gKyAgICAg
ICAgICAgICAgICAmJiAoIGlzX3ZjcHVfb25saW5lKHYpICkgKQ0KPiANCj4gV2l0aCB0aGlz
IHRoZSBwYXJlbnRoZXNlcyBhbHNvIHdhbnQgdG8gZ28gYXdheS4gV2l0aCB0aGVtIHRoZSBz
dHJheSBleHRyYQ0KPiBibGFua3MgdGhlbiB3aWxsIGFsc28gZGlzYXBwZWFyIChhdCBsZWFz
dCBmcm9tIHRoZSBsaW5lIGJlaW5nIHRvdWNoZWQpLg0KPiANCg0KTG9va3MgZ29vZCB0byBt
ZS4NCg0KPiBKYW4NCg0KVGVkZHkNCg==

--------------wW0y1k0AiAb6vPSUuH8q4PEf--

--------------AszZnxG0BWLO03M0oL5Zt4vr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmrjZEoFAwAAAAAACgkQZg+p0QLLz9BF
8gv7B8iooNoTOgZta9QN2sqzt2vN4In2e2btnEK37GOUyW3QCpk9WtBGDsi63c2L4grImSIQ4Z07
/Z1i7sJ6AdND/uQzlXgjvbWPQ7Z2VTLF8M3Cp2TfiHrOuZY18pkoDQxiLXEK53EhVXuGCljAQ5AB
UDlBSfFi3NbqtRguHfzWV5kq76NCYw0v96gHQ4WDN3dTpCYv4x7bkhiIjIkhFbC8/F6csvM3pUMq
T4mjv9RJ+m5J5PdcwEzV9UXjyiCADh/SQetSAhuIEQXTbHeG+9Plq/Vdf+2CyQ0sbVsZyQUFrB9T
UjDcSSvXrbpHw6vTODR7vhQP2NK46+Xg313vKCVlkbhEaqBbXVB5WCtM7im+JZnXI/VYybJiv3Hj
+wSAh/jXtMZb9QJo6CfoZK4qetOj4H53mBr7ELvcQxK6OmfG0wjSYuzkCJNtAwUSNjFTXMfJs6C/
wTVX0lef3ArX9k97mfSe7uIuN56cwLQhDLBUZWShAZPgAIjhdygEBDmu62Hk
=iKc3
-----END PGP SIGNATURE-----

--------------AszZnxG0BWLO03M0oL5Zt4vr--

