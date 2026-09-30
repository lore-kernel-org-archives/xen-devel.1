Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F58ECA5FC7
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 14:31:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437371.1656257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBvKo-0002sA-T3; Wed, 30 Sep 2026 14:31:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437371.1656257; Wed, 30 Sep 2026 14:31:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBvKo-0002s2-Pm; Wed, 30 Sep 2026 14:31:02 +0000
Received: by outflank-mailman (input) for mailman id 1437371;
 Wed, 30 Sep 2026 14:31:01 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f2b9c8270003f66@swg.vates.tech>)
 id 1xBvKn-0002rd-5W
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 14:31:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBvKl-00HTTN-06
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:30:59 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f2b9c8270003f66@swg.vates.tech>)
 id 6abd1d17-e002-0a2a0a5209dd-0a2a4503da90-30
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 16:30:58 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f2b9c8270003f66@swg.vates.tech>)
 id 6abd1d22-fae8-0a2a45030019-b9ff1c23b2a9-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 16:30:58 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0f2b9c8270003f66.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 30 Sep 2026 14:30:56 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id E7F57820E7;
 Wed, 30 Sep 2026 16:30:55 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=Me1XFca3ubZ6PxC86s+z5heZwqXP+QOJAzsS4FAlCNA=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=qzHDpT6gQA6CrjIb3aO2TUgDZsae0dkk+j6ET2TBfTwQph1KasWHw/g3WGoc28XVfKzuJKBPY
 26d4q+zC9yiCAYJpsDabFDAyZDc4Zbp2yE1N7fypa8QuBZ8DZCWp12vzXOBPENsU2+/N0XFmutx
 fbv6KdEks/X5vCKCdaiAoW7EaIwU0LEPtV4LO7KdZUy7npQh7xpcqUox4C1zjhnZjOyJep0kec0
 zik6Ufn0Wko2t9fDah+4SQZ66jimBOY1eU1+mdx1uf6DD2beUAYXnes+AtrcBCNxkZxSO2gO47K
 xw+Ulo2ios2BEI+bqsvax2BOv1UgRV1QFoNF5YNdDGmA==
X-Zone-Loop: 4b89e37c5005c18a620b08b5abd9dea8925ad337cdf1
x-campaign-type: default
x-transaction-id: 2f8afac4-54a9-425b-9b20-72415a5b679b
x-swg-uid: 01-a5446b79-8f81-4604-9edc-72b397adf0fd
X-Mailer: Sweego
Message-ID:
 <1790778656.8631fc262581453bbf619ec5b2062170.1a0f2b9c8270003f66@vates.tech>
x-swg-bid: 1790778656.8631fc262581453bbf619ec5b2062170.1a0f2b9c8270003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 30 Sep 2026 16:30:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] vm_event: svm: Don't BUG() when enabling intercept on
 hypervisor MSR
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <1790250881.8631fc262581453bbf619ec5b2062170.1a0d344933500072c4@vates.tech>
 <1790250991.8631fc262581453bbf619ec5b2062170.1a0d3463da200072c4@vates.tech>
 <1abe6540-e92a-4d11-90e0-a3c13c9b0a97@suse.com>
 <1790773030.8631fc262581453bbf619ec5b2062170.1a0f263ed240003f66@vates.tech>
 <ee526731-509d-4802-8470-2dec9c5700b7@suse.com>
 <1790775549.8631fc262581453bbf619ec5b2062170.1a0f28a5dec0003f66@vates.tech>
 <232f5f5f-a87d-4407-8175-ed164c9e1a74@suse.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <232f5f5f-a87d-4407-8175-ed164c9e1a74@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------iVJVUez3OjTfpiPpBRRmxfPd"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790778656084
X-purgate-ID: tlsNG-33051d/1790778658-6F4C74E9-F01153A5/0/0
X-purgate-type: clean
X-purgate-size: 9924

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------iVJVUez3OjTfpiPpBRRmxfPd
Content-Type: multipart/mixed; boundary="------------wJZ1B0r4sgSuI1EEripEs0YR";
 protected-headers="v1"; hp="clear"
Message-ID: <d8b80905-8e11-4d8e-b560-d60514b3b3ac@vates.tech>
Date: Wed, 30 Sep 2026 16:30:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] vm_event: svm: Don't BUG() when enabling intercept on
 hypervisor MSR
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <1790250881.8631fc262581453bbf619ec5b2062170.1a0d344933500072c4@vates.tech>
 <1790250991.8631fc262581453bbf619ec5b2062170.1a0d3463da200072c4@vates.tech>
 <1abe6540-e92a-4d11-90e0-a3c13c9b0a97@suse.com>
 <1790773030.8631fc262581453bbf619ec5b2062170.1a0f263ed240003f66@vates.tech>
 <ee526731-509d-4802-8470-2dec9c5700b7@suse.com>
 <1790775549.8631fc262581453bbf619ec5b2062170.1a0f28a5dec0003f66@vates.tech>
 <232f5f5f-a87d-4407-8175-ed164c9e1a74@suse.com>
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
In-Reply-To: <232f5f5f-a87d-4407-8175-ed164c9e1a74@suse.com>

--------------wJZ1B0r4sgSuI1EEripEs0YR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMzAvMDkvMjAyNiDDoCAxNjowNCwgSmFuIEJldWxpY2ggYSDDqWNyaXTCoDoNCj4gT24g
MzAuMDkuMjAyNiAxNTozOSwgVGVkZHkgQXN0aWUgd3JvdGU6DQo+PiBMZSAzMC8wOS8yMDI2
IMOgIDE1OjA4LCBKYW4gQmV1bGljaCBhIMOpY3JpdMKgOg0KPj4+IE9uIDMwLjA5LjIwMjYg
MTQ6NTcsIFRlZGR5IEFzdGllIHdyb3RlOg0KPj4+PiBMZSAzMC8wOS8yMDI2IMOgIDExOjE2
LCBKYW4gQmV1bGljaCBhIMOpY3JpdMKgOg0KPj4+Pj4gT24gMjQuMDkuMjAyNiAxMzo1Niwg
VGVkZHkgQXN0aWUgd3JvdGU6DQo+Pj4+Pj4gc3ZtX21zcmJpdHMoKSBvbmx5IGNvdmVyIE1T
UnMgaW4gdGhlIHJhbmdlcyBzcGVjaWZpZWQgaW4gQVBNIGFuZCByZXR1cm5zDQo+Pj4+Pj4g
TlVMTCBmb3IgYWxsIHRoZSBvdGhlciBvbmVzIChpLmUgaHlwZXJ2aXNvciByYW5nZSksIHdo
aWNoIHRyaWdnZXJzIHRoZQ0KPj4+Pj4+IEJVR19PTigpIHRoYXQgZm9sbG93cy4NCj4+Pj4+
Pg0KPj4+Pj4+IEFQTSBzcGVjaWZpZXMgdGhhdCBNU1Igb3V0c2lkZSB0aGUgYXJjaGl0ZWN0
dXJhbCBhbmQgQU1EIHNwZWNpZmljIHJhbmdlcw0KPj4+Pj4+IGFyZSB1bmNvbmRpdGlvbmFs
bHkgaW50ZXJjZXB0ZWQsIGhlbmNlIGRvbid0IHJlcXVpcmUgYW55IHNwZWNpZmljIGhhbmRs
aW5nDQo+Pj4+Pj4gYnkgU1ZNIGxvZ2ljLCBmaXggdGhpcyBieSBpZ25vcmluZyBjYXNlcyB3
aGVuIG1zcl9iaXQgaXMgTlVMTC4NCj4+Pj4+Pg0KPj4+Pj4+IFRoaXMgaXMgb25seSByZWFj
aGFibGUgd2l0aCBDT05GSUdfVk1fRVZFTlQgdXNpbmcgWEVOX0RPTUNUTF9NT05JVE9SX0VW
RU5UX01PVl9UT19NU1INCj4+Pj4+PiB0byBjb25maWd1cmUgYSBNU1IgaW50ZXJjZXB0IGlu
IHRoZSBoeXBlcnZpc29yIHJhbmdlICgweDQwMDAwMDAw4oCTMHg0MDAwMWZmZikuDQo+Pj4+
Pg0KPj4+Pj4gSGVuY2UgaW1vIGl0IGlzIHdyb25nIHRvIGRyb3AgdGhlIHNhbml0eSBjaGVj
ayBhbHRvZ2V0aGVyLiBTZWUgYmVsb3cuDQo+Pj4+Pg0KPj4+Pj4gQWxzbywgbml0OiBEZXNj
cmlwdGlvbiBsaW5lcyB3YW50IGxpbWl0aW5nIHRvIDc1IGNoYXJzLg0KPj4+Pj4NCj4+Pj4+
PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYw0KPj4+Pj4+ICsrKyBiL3hlbi9h
cmNoL3g4Ni9odm0vc3ZtL3N2bS5jDQo+Pj4+Pj4gQEAgLTIzNyw3ICsyMzcsOSBAQCB2b2lk
IHN2bV9pbnRlcmNlcHRfbXNyKHN0cnVjdCB2Y3B1ICp2LCB1aW50MzJfdCBtc3IsIGludCBm
bGFncykNCj4+Pj4+PiAgICAgICAgIGNvbnN0IHN0cnVjdCBkb21haW4gKmQgPSB2LT5kb21h
aW47DQo+Pj4+Pj4gICAgIA0KPj4+Pj4+ICAgICAgICAgbXNyX2JpdCA9IHN2bV9tc3JiaXQo
di0+YXJjaC5odm0uc3ZtLm1zcnBtLCBtc3IpOw0KPj4+Pj4+IC0gICAgQlVHX09OKG1zcl9i
aXQgPT0gTlVMTCk7DQo+Pj4+Pj4gKyAgICBpZiAoIG1zcl9iaXQgPT0gTlVMTCApDQo+Pj4+
Pj4gKyAgICAgICAgcmV0dXJuOw0KPj4+Pj4NCj4+Pj4+IEltbyB0aGUgZnVuY3Rpb24gd2Fu
dHMgdG8gcmV0dXJuIGFuIGVycm9yIGhlcmUsIHdoaWNoIGFsbCBjYWxsZXJzDQo+Pj4+PiBl
eGNlcHQgdGhlIG9uZSB5b3UgbWVudGlvbiBjaGVjay4gSS5lLiB0aGUgQlVHX09OKCkgd291
bGQgYmUgbW92ZWQNCj4+Pj4+IG91dCB0byBtb3N0IGNhbGxlcnMgKGFsdGVybmF0aXZlbHkg
dGhlIG9uZSBjYWxsZXIgY291bGQgcmFuZ2UtY2hlY2sNCj4+Pj4+IHRoZSBNU1IgaXRzZWxm
KS4gUmlnaHQgbm93IGZvciBpbnRyb3NwZWN0aW9uIGludGVyY2VwdHMgY2FuIG9ubHkgYmUN
Cj4+Pj4+IGVuYWJsZWQsIGhlbmNlIHdoeSBmb3IgdGhhdCB1c2UgImFsbCBvdGhlciBNU1Jz
IGFyZSBpbnRlcmNlcHRlZA0KPj4+Pj4gYW55d2F5IiBpcyBmaW5lLiBTdXBwb3NlIHRoZSBp
bnZlcnNlIG9wZXJhdGlvbiB3b3VsZCBiZSBwb3NzaWJsZSBhcw0KPj4+Pj4gd2VsbDogVGhl
biBpbmRpY2F0aW5nICJzdWNjZXNzIiBiYWNrIHRvIHRoZSBjYWxsZXIgd2hlbiBhY2Nlc3Nl
cyB0bw0KPj4+Pj4gdGhlIHJlcXVlc3RlZCBNU1IgYXJlIHN0aWxsIGludGVyY2VwdGVkIHdv
dWxkIGJlIHdyb25nLg0KPj4+Pj4NCj4+Pj4NCj4+Pj4gSUlVQywgeW91J3JlIHN1Z2dlc3Rp
bmcgdG8gcmVwb3J0IHRvIHRoZSBjYWxsZXIgdGhhdCB0aGUgaGFyZHdhcmUNCj4+Pj4gZG9l
c24ndCBjb3ZlciBpdCwgc3VjaCBhcyB3ZSBjYW4gZGV0ZWN0IGNhc2VzIHdoZXJlIHdlIGFj
Y2lkZW50YWxseSBwYXNzDQo+Pj4+IGEgYm9ndXMgTVNSIGluZGV4IHRoYXQgaXMgb3V0c2lk
ZSBvZiBoYXJkd2FyZSByYW5nZXMuDQo+Pj4+DQo+Pj4+IEluIHRoZSBWTSBpbnRyb3NwZWN0
aW9uIGNhc2UsIHdlIGNvdWxkIGlnbm9yZSBpdCBzaW5jZSB3ZSdyZSBvbmx5DQo+Pj4+IGlu
dGVyZXN0ZWQgb24gaW50ZXJjZXB0cywgd2hlcmUgb3V0c2lkZSBoYXJkd2FyZSByYW5nZXMg
d291bGQgYWx3YXlzIGJlDQo+Pj4+IGludGVyY2VwdGVkLg0KPj4+Pg0KPj4+PiBEaWQgSSBn
b3QgdGhlIGlkZWEgY29ycmVjdGx5ID8NCj4+Pg0KPj4+IFllcy4gSnVzdCB0aGF0IHRoZSBt
b3JlIEkgdGhpbmsgYWJvdXQgaXQsIHRoZSBtb3JlIEkgcHJlZmVyIHRoZSBhbHRlcm5hdGl2
ZQ0KPj4+IHRoYXQgSSBhbHNvIG1lbnRpb25lZC4gTm90IHRoZSBsZWFzdCBiZWNhdXNlIGl0
J3MgbGVzcyBjaHVybi4NCj4+Pg0KPj4NCj4+IE9uZSBvZiB0aGUgaWRlYSB3b3VsZCBiZSB0
byBjaGVjayBtb25pdG9yZWRfbXNyKCkgKHNvbWV3aGF0IGxpa2Ugd2hhdA0KPj4geW91IHBy
b3Bvc2VkIGZvciBWTVgpIHNvIHRoYXQgdGhlIFZNIGV2ZW50IGNhc2UgaXMgY292ZXJlZCwg
YnV0IHdlDQo+PiBBU1NFUlQgKG9yIEJVR19PTiA/KSBpbiB0aGUgb3RoZXIgY2FzZXMgaWYg
d2UgcGFzcyBhIHVuZXhwZWN0ZWQgTVNSIHRvDQo+PiB0aGlzIGZ1bmN0aW9uLg0KPj4NCj4+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYyBiL3hlbi9hcmNoL3g4
Ni9odm0vc3ZtL3N2bS5jDQo+PiBpbmRleCA3MWU0ODM1MWYyLi5iZTg2NmI5MDU1IDEwMDY0
NA0KPj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMNCj4+ICsrKyBiL3hlbi9h
cmNoL3g4Ni9odm0vc3ZtL3N2bS5jDQo+PiBAQCAtMjM2LDcgKzIzNiwxMiBAQCB2b2lkIHN2
bV9pbnRlcmNlcHRfbXNyKHN0cnVjdCB2Y3B1ICp2LCB1aW50MzJfdA0KPj4gbXNyLCBpbnQg
ZmxhZ3MpDQo+PiAgICAgICAgY29uc3Qgc3RydWN0IGRvbWFpbiAqZCA9IHYtPmRvbWFpbjsN
Cj4+DQo+PiAgICAgICAgbXNyX2JpdCA9IHN2bV9tc3JiaXQodi0+YXJjaC5odm0uc3ZtLm1z
cnBtLCBtc3IpOw0KPj4gLSAgICBCVUdfT04obXNyX2JpdCA9PSBOVUxMKTsNCj4+ICsgICAg
aWYgKCAhbXNyX2JpdCApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIEFTU0VSVChtb25pdG9y
ZWRfbXNyKGQsIG1zcikpOw0KPj4gKyAgICAgICAgcmV0dXJuOw0KPj4gKyAgICB9DQo+IA0K
PiBKdXN0IHRoYXQgQVNTRVJUKCkgb25seSBjb3ZlcnMgZGVidWcgYnVpbGRzIGFuZCBCVUdf
T04oKSBpcyB0b28gaGVhdnkgb24NCj4gcmVsZWFzZSBvbmVzOiBUaGVyZSdzIG5vIHJlYXNv
biB0byBraWxsIGFuIGVudGlyZSBob3N0IGJlY2F1c2Ugb2YgdGhpcy4NCg0KU28gd2Ugc2hv
dWxkIGRvIFdBUk5fT04oKSB0aGVuID8NCg0KPiANCj4gSmFuDQoNClRlZGR5DQo=

--------------wJZ1B0r4sgSuI1EEripEs0YR--

--------------iVJVUez3OjTfpiPpBRRmxfPd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmq9HR8FAwAAAAAACgkQZg+p0QLLz9Ce
oAv/SveyALsqdtY5Udmu0wtmXit42mWuRmjCTHgOw1zPuMWGce+MjzOUPXahi6txJzxyFcpnGFk8
uKg0AJnfkJ3dt/cgSGnv2WN+8vq26l2KBgJABAw2RAFfw/4jAngo4N3jGCOrAGAn5bQNxNCf1BPl
Q4LIxRBStz2W9WbHYf7ZbFP3TfX2Et+A8iHeIoNr4ruG1j8hamxAhx7Q7TI5Jky3ogesqYIZVilJ
qVQnNXr2BcKGX8KfH1Iq6z6ZqxVIISOjiuQPHBgXOzHdT+7bwyJ3wAoV2QuQWlb+K1tzz9bUJhF9
5ZGXiE7+HWW3bH8w9ikt0GCvw/Ow9CTCrlsAdMEvvvgoEmF/TeVeCfFIw9KCw+XhEcPepLqoJieQ
Yo4+wQ+4JzEdfF0ouN6bs6ALxeZI9Uy6uG7RI2LresGGmMNbeEyF8TTokRwG+V8XbKSfN26Gm7/I
+6gb2PZuckvFEAoGMU4ug2pg4vnROConglCWRQnROGrBdZWY7Mfm9GIS9UZv
=Y5Lt
-----END PGP SIGNATURE-----

--------------iVJVUez3OjTfpiPpBRRmxfPd--

