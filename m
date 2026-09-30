Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D754CA5FAC
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 12:57:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437211.1656039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBts7-0004AI-19; Wed, 30 Sep 2026 12:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437211.1656039; Wed, 30 Sep 2026 12:57:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBts6-0004AB-Ue; Wed, 30 Sep 2026 12:57:18 +0000
Received: by outflank-mailman (input) for mailman id 1437211;
 Wed, 30 Sep 2026 12:57:18 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f263ed240003f66@swg.vates.tech>)
 id 1xBts5-0004A1-SR
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 12:57:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBts4-00B5Yh-5V
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 14:57:16 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f263ed240003f66@swg.vates.tech>)
 id 6abd071d-2eae-0a2a0a5409dd-0a2a45089480-44
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 14:57:16 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f263ed240003f66@swg.vates.tech>)
 id 6abd072b-f659-0a2a45080019-b9ff1c22b717-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 14:57:16 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0f263ed240003f66.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 30 Sep 2026 12:57:10 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 0F74781CED;
 Wed, 30 Sep 2026 14:57:09 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=WVTFvFn4eXES9gEI+4OizjT57eoY/I4tZff/vozAyiw=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=rVrkUFCRI3nO0K1Nsb6L+B2CPbhFjrrYgKNSUUfqp68tb9UQy66Kb0SSeq+1LlBNdgs6KFZFC
 q8N4I4Gh6LgLKeSdd42fmcbKa+jFfTxmcWe4S5YWxMYUd0+Vr2GbFDPe0r2ptqCoatFeLBeicZ3
 LgGJjEywwjl17g6aMznn7JDDD6tkoBqcCf0WNemH6kplYK7MWivLdFU3E10xV2lsRjC7g/opj+7
 oiLVOjHTbRSliQ7qH0/Yvzcg2c8OaF+Txbv2xhavriuWeO+71bd96pE4DTdMNJelMmTRXcSKawX
 QLKAqbUuQ1iqu5Xjyyr7dB8uf/Z5EZhi+cbNQXkNwU/w==
X-Zone-Loop: 7e1c5b6c4b8c34e224d126d23f02255c9143b05af755
x-campaign-type: default
x-transaction-id: 4d03ddfc-0ed0-434a-b3a8-a7e8cec97ae7
x-swg-uid: 01-751cdb93-9de7-4f59-8a5c-67442bf59a0a
X-Mailer: Sweego
Message-ID:
 <1790773030.8631fc262581453bbf619ec5b2062170.1a0f263ed240003f66@vates.tech>
x-swg-bid: 1790773030.8631fc262581453bbf619ec5b2062170.1a0f263ed240003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 30 Sep 2026 14:57:08 +0200
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
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <1abe6540-e92a-4d11-90e0-a3c13c9b0a97@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------TFa60vayQtPvdrRZ07uC7EFS"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790773029175
X-purgate-ID: tlsNG-c1860d/1790773036-D554C87B-CC9EA4F6/0/0
X-purgate-type: clean
X-purgate-size: 7696

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------TFa60vayQtPvdrRZ07uC7EFS
Content-Type: multipart/mixed; boundary="------------DiOLRnC01HcBuIetBoChVQ50";
 protected-headers="v1"; hp="clear"
Message-ID: <a97b86d6-6147-4867-8219-9a87787cf498@vates.tech>
Date: Wed, 30 Sep 2026 14:57:08 +0200
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
In-Reply-To: <1abe6540-e92a-4d11-90e0-a3c13c9b0a97@suse.com>

--------------DiOLRnC01HcBuIetBoChVQ50
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMzAvMDkvMjAyNiDDoCAxMToxNiwgSmFuIEJldWxpY2ggYSDDqWNyaXTCoDoNCj4gT24g
MjQuMDkuMjAyNiAxMzo1NiwgVGVkZHkgQXN0aWUgd3JvdGU6DQo+PiBzdm1fbXNyYml0cygp
IG9ubHkgY292ZXIgTVNScyBpbiB0aGUgcmFuZ2VzIHNwZWNpZmllZCBpbiBBUE0gYW5kIHJl
dHVybnMNCj4+IE5VTEwgZm9yIGFsbCB0aGUgb3RoZXIgb25lcyAoaS5lIGh5cGVydmlzb3Ig
cmFuZ2UpLCB3aGljaCB0cmlnZ2VycyB0aGUNCj4+IEJVR19PTigpIHRoYXQgZm9sbG93cy4N
Cj4+DQo+PiBBUE0gc3BlY2lmaWVzIHRoYXQgTVNSIG91dHNpZGUgdGhlIGFyY2hpdGVjdHVy
YWwgYW5kIEFNRCBzcGVjaWZpYyByYW5nZXMNCj4+IGFyZSB1bmNvbmRpdGlvbmFsbHkgaW50
ZXJjZXB0ZWQsIGhlbmNlIGRvbid0IHJlcXVpcmUgYW55IHNwZWNpZmljIGhhbmRsaW5nDQo+
PiBieSBTVk0gbG9naWMsIGZpeCB0aGlzIGJ5IGlnbm9yaW5nIGNhc2VzIHdoZW4gbXNyX2Jp
dCBpcyBOVUxMLg0KPj4NCj4+IFRoaXMgaXMgb25seSByZWFjaGFibGUgd2l0aCBDT05GSUdf
Vk1fRVZFTlQgdXNpbmcgWEVOX0RPTUNUTF9NT05JVE9SX0VWRU5UX01PVl9UT19NU1INCj4+
IHRvIGNvbmZpZ3VyZSBhIE1TUiBpbnRlcmNlcHQgaW4gdGhlIGh5cGVydmlzb3IgcmFuZ2Ug
KDB4NDAwMDAwMDDigJMweDQwMDAxZmZmKS4NCj4gDQo+IEhlbmNlIGltbyBpdCBpcyB3cm9u
ZyB0byBkcm9wIHRoZSBzYW5pdHkgY2hlY2sgYWx0b2dldGhlci4gU2VlIGJlbG93Lg0KPiAN
Cj4gQWxzbywgbml0OiBEZXNjcmlwdGlvbiBsaW5lcyB3YW50IGxpbWl0aW5nIHRvIDc1IGNo
YXJzLg0KPiANCj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5jDQo+PiArKysg
Yi94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYw0KPj4gQEAgLTIzNyw3ICsyMzcsOSBAQCB2
b2lkIHN2bV9pbnRlcmNlcHRfbXNyKHN0cnVjdCB2Y3B1ICp2LCB1aW50MzJfdCBtc3IsIGlu
dCBmbGFncykNCj4+ICAgICAgIGNvbnN0IHN0cnVjdCBkb21haW4gKmQgPSB2LT5kb21haW47
DQo+PiAgIA0KPj4gICAgICAgbXNyX2JpdCA9IHN2bV9tc3JiaXQodi0+YXJjaC5odm0uc3Zt
Lm1zcnBtLCBtc3IpOw0KPj4gLSAgICBCVUdfT04obXNyX2JpdCA9PSBOVUxMKTsNCj4+ICsg
ICAgaWYgKCBtc3JfYml0ID09IE5VTEwgKQ0KPj4gKyAgICAgICAgcmV0dXJuOw0KPiANCj4g
SW1vIHRoZSBmdW5jdGlvbiB3YW50cyB0byByZXR1cm4gYW4gZXJyb3IgaGVyZSwgd2hpY2gg
YWxsIGNhbGxlcnMNCj4gZXhjZXB0IHRoZSBvbmUgeW91IG1lbnRpb24gY2hlY2suIEkuZS4g
dGhlIEJVR19PTigpIHdvdWxkIGJlIG1vdmVkDQo+IG91dCB0byBtb3N0IGNhbGxlcnMgKGFs
dGVybmF0aXZlbHkgdGhlIG9uZSBjYWxsZXIgY291bGQgcmFuZ2UtY2hlY2sNCj4gdGhlIE1T
UiBpdHNlbGYpLiBSaWdodCBub3cgZm9yIGludHJvc3BlY3Rpb24gaW50ZXJjZXB0cyBjYW4g
b25seSBiZQ0KPiBlbmFibGVkLCBoZW5jZSB3aHkgZm9yIHRoYXQgdXNlICJhbGwgb3RoZXIg
TVNScyBhcmUgaW50ZXJjZXB0ZWQNCj4gYW55d2F5IiBpcyBmaW5lLiBTdXBwb3NlIHRoZSBp
bnZlcnNlIG9wZXJhdGlvbiB3b3VsZCBiZSBwb3NzaWJsZSBhcw0KPiB3ZWxsOiBUaGVuIGlu
ZGljYXRpbmcgInN1Y2Nlc3MiIGJhY2sgdG8gdGhlIGNhbGxlciB3aGVuIGFjY2Vzc2VzIHRv
DQo+IHRoZSByZXF1ZXN0ZWQgTVNSIGFyZSBzdGlsbCBpbnRlcmNlcHRlZCB3b3VsZCBiZSB3
cm9uZy4NCj4gDQoNCklJVUMsIHlvdSdyZSBzdWdnZXN0aW5nIHRvIHJlcG9ydCB0byB0aGUg
Y2FsbGVyIHRoYXQgdGhlIGhhcmR3YXJlIA0KZG9lc24ndCBjb3ZlciBpdCwgc3VjaCBhcyB3
ZSBjYW4gZGV0ZWN0IGNhc2VzIHdoZXJlIHdlIGFjY2lkZW50YWxseSBwYXNzIA0KYSBib2d1
cyBNU1IgaW5kZXggdGhhdCBpcyBvdXRzaWRlIG9mIGhhcmR3YXJlIHJhbmdlcy4NCg0KSW4g
dGhlIFZNIGludHJvc3BlY3Rpb24gY2FzZSwgd2UgY291bGQgaWdub3JlIGl0IHNpbmNlIHdl
J3JlIG9ubHkgDQppbnRlcmVzdGVkIG9uIGludGVyY2VwdHMsIHdoZXJlIG91dHNpZGUgaGFy
ZHdhcmUgcmFuZ2VzIHdvdWxkIGFsd2F5cyBiZSANCmludGVyY2VwdGVkLg0KDQpEaWQgSSBn
b3QgdGhlIGlkZWEgY29ycmVjdGx5ID8NCg0KPiBBbHNvLCBuaXQ6IFdlIGdlbmVyYWxseSBw
cmVmZXIgIW1zcl9iaXQgb3ZlciBtc3JfYml0ID09IE5VTEwuDQoNCk9rDQoNCj4gDQo+IEph
bg0KDQpUZWRkeQ0K

--------------DiOLRnC01HcBuIetBoChVQ50--

--------------TFa60vayQtPvdrRZ07uC7EFS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmq9ByQFAwAAAAAACgkQZg+p0QLLz9Bm
ywv7BTFMbdLXBL7MmX2D77qVU+4g9VbiSRCYmG3f1t4e94D5SOk5IZUKYQUeN3Y0L+k1a/m2aW65
dh1SqX+VDKO2gaWxr9/VBGAL2lTV44qmW8CqnuoncuGjhMtCgSYkjrtpaRRxyTULRW9G8UVsifZo
WHhWuh/xxt9XsSIYjP56M3iimH2kiQ9i+dFaHnBe41Nv/9di1px7wFFA+hcOLZbzFvWfHL5rueTw
4CTj9ESqPB00lDKkIqA1tBnzjajb17H3nWbsEdWr3v/TOHexvExXQH2gbk8OaNsbL+T+JlDeurlH
lrIMdqCAROvtVRR3GH37ZBQYPwIv736w3J3dLNgSmpRHwDY2Ke4AhIfrANhb1whYarGNoCnFnPaT
rHtP2UzKH0eSZyx/84DM6JI1uZfcXVCWR7crOp/QMGd3CtVkf1dE4dvuD/J7RG4rBKMsde4uh1kA
nWb6VhSeqh4RPQPBTeq4EAeXz2o/PJXBaSL7rDGVghiLKRNYR0sMnFlKflET
=lUbu
-----END PGP SIGNATURE-----

--------------TFa60vayQtPvdrRZ07uC7EFS--

