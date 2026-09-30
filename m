Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5EABCA5FAC
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 13:39:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437282.1656132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBuWe-0005Sz-Oi; Wed, 30 Sep 2026 13:39:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437282.1656132; Wed, 30 Sep 2026 13:39:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBuWe-0005Ss-LE; Wed, 30 Sep 2026 13:39:12 +0000
Received: by outflank-mailman (input) for mailman id 1437282;
 Wed, 30 Sep 2026 13:39:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f28a5dec0003f66@swg.vates.tech>)
 id 1xBuWd-0005Sh-9W
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 13:39:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBuWc-005Izv-MU
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 15:39:10 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f28a5dec0003f66@swg.vates.tech>)
 id 6abd10fa-e002-0a2a0a5209dd-0a2a4503b066-6
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 15:39:10 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0f28a5dec0003f66@swg.vates.tech>)
 id 6abd10fe-fae8-0a2a45030019-b9ff1c228033-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 15:39:10 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0f28a5dec0003f66.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 30 Sep 2026 13:39:09 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id B2AE4829EF;
 Wed, 30 Sep 2026 15:39:08 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=U1q3wZV+ObJtJCwD4i+xCL1hsM8xtwybwfS4scqVVcY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Mb78yPUK04CgogkKOm8sB6XwXY78ocEHV2+GgeqPyzI4/JSyhIxT6UoZ2dsPk4aUJe7aQzYSl
 GMWQV8CSrInfh+ygS+RP9FFK3BFYDIcRufFcMKJ/Pq6i/lvnTupt+Oy3zpCAZ4hBzBZkUVA8hbp
 FdtLCtkEfWvac6lreWWy/bYej+HEgRIpp4PS+7lK6MKYPQYxnM1q5KhIuwO8pFoMCkJy1JE8fWr
 eSTWakhVV7XqnKGMn8IP5CFAdMcWWekkVfkfGHM+GyjA790dXTl1z4aUl6eAjOY0shNQpPPOP4x
 0mUOvsZ1cQm5RABeEdqUv+SOOBMLaoNkK8X+iczutL4w==
X-Zone-Loop: 62308f08344694e678520f5c79b5d97e2ac3cc4d65b1
x-campaign-type: default
x-transaction-id: d6f770d1-fcef-4d2a-be7b-64f9d6cf873d
x-swg-uid: 01-61380902-af9b-4968-80d8-0594d6793390
X-Mailer: Sweego
Message-ID:
 <1790775549.8631fc262581453bbf619ec5b2062170.1a0f28a5dec0003f66@vates.tech>
x-swg-bid: 1790775549.8631fc262581453bbf619ec5b2062170.1a0f28a5dec0003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 30 Sep 2026 15:39:08 +0200
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
In-Reply-To: <ee526731-509d-4802-8470-2dec9c5700b7@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6udVsDQDx3IRyJbekRuS0UIH"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790775548843
X-purgate-ID: tlsNG-33051d/1790775550-6FCC34E9-2A311062/0/0
X-purgate-type: clean
X-purgate-size: 9398

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6udVsDQDx3IRyJbekRuS0UIH
Content-Type: multipart/mixed; boundary="------------RIqfq6bkYX1JhcIDY4Nom5ju";
 protected-headers="v1"; hp="clear"
Message-ID: <99728249-92a1-4124-b8de-9ef9b0ea9507@vates.tech>
Date: Wed, 30 Sep 2026 15:39:08 +0200
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
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <ee526731-509d-4802-8470-2dec9c5700b7@suse.com>

--------------RIqfq6bkYX1JhcIDY4Nom5ju
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMzAvMDkvMjAyNiDDoCAxNTowOCwgSmFuIEJldWxpY2ggYSDDqWNyaXTCoDoNCj4gT24g
MzAuMDkuMjAyNiAxNDo1NywgVGVkZHkgQXN0aWUgd3JvdGU6DQo+PiBMZSAzMC8wOS8yMDI2
IMOgIDExOjE2LCBKYW4gQmV1bGljaCBhIMOpY3JpdMKgOg0KPj4+IE9uIDI0LjA5LjIwMjYg
MTM6NTYsIFRlZGR5IEFzdGllIHdyb3RlOg0KPj4+PiBzdm1fbXNyYml0cygpIG9ubHkgY292
ZXIgTVNScyBpbiB0aGUgcmFuZ2VzIHNwZWNpZmllZCBpbiBBUE0gYW5kIHJldHVybnMNCj4+
Pj4gTlVMTCBmb3IgYWxsIHRoZSBvdGhlciBvbmVzIChpLmUgaHlwZXJ2aXNvciByYW5nZSks
IHdoaWNoIHRyaWdnZXJzIHRoZQ0KPj4+PiBCVUdfT04oKSB0aGF0IGZvbGxvd3MuDQo+Pj4+
DQo+Pj4+IEFQTSBzcGVjaWZpZXMgdGhhdCBNU1Igb3V0c2lkZSB0aGUgYXJjaGl0ZWN0dXJh
bCBhbmQgQU1EIHNwZWNpZmljIHJhbmdlcw0KPj4+PiBhcmUgdW5jb25kaXRpb25hbGx5IGlu
dGVyY2VwdGVkLCBoZW5jZSBkb24ndCByZXF1aXJlIGFueSBzcGVjaWZpYyBoYW5kbGluZw0K
Pj4+PiBieSBTVk0gbG9naWMsIGZpeCB0aGlzIGJ5IGlnbm9yaW5nIGNhc2VzIHdoZW4gbXNy
X2JpdCBpcyBOVUxMLg0KPj4+Pg0KPj4+PiBUaGlzIGlzIG9ubHkgcmVhY2hhYmxlIHdpdGgg
Q09ORklHX1ZNX0VWRU5UIHVzaW5nIFhFTl9ET01DVExfTU9OSVRPUl9FVkVOVF9NT1ZfVE9f
TVNSDQo+Pj4+IHRvIGNvbmZpZ3VyZSBhIE1TUiBpbnRlcmNlcHQgaW4gdGhlIGh5cGVydmlz
b3IgcmFuZ2UgKDB4NDAwMDAwMDDigJMweDQwMDAxZmZmKS4NCj4+Pg0KPj4+IEhlbmNlIGlt
byBpdCBpcyB3cm9uZyB0byBkcm9wIHRoZSBzYW5pdHkgY2hlY2sgYWx0b2dldGhlci4gU2Vl
IGJlbG93Lg0KPj4+DQo+Pj4gQWxzbywgbml0OiBEZXNjcmlwdGlvbiBsaW5lcyB3YW50IGxp
bWl0aW5nIHRvIDc1IGNoYXJzLg0KPj4+DQo+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0v
c3ZtL3N2bS5jDQo+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5jDQo+Pj4+
IEBAIC0yMzcsNyArMjM3LDkgQEAgdm9pZCBzdm1faW50ZXJjZXB0X21zcihzdHJ1Y3QgdmNw
dSAqdiwgdWludDMyX3QgbXNyLCBpbnQgZmxhZ3MpDQo+Pj4+ICAgICAgICBjb25zdCBzdHJ1
Y3QgZG9tYWluICpkID0gdi0+ZG9tYWluOw0KPj4+PiAgICANCj4+Pj4gICAgICAgIG1zcl9i
aXQgPSBzdm1fbXNyYml0KHYtPmFyY2guaHZtLnN2bS5tc3JwbSwgbXNyKTsNCj4+Pj4gLSAg
ICBCVUdfT04obXNyX2JpdCA9PSBOVUxMKTsNCj4+Pj4gKyAgICBpZiAoIG1zcl9iaXQgPT0g
TlVMTCApDQo+Pj4+ICsgICAgICAgIHJldHVybjsNCj4+Pg0KPj4+IEltbyB0aGUgZnVuY3Rp
b24gd2FudHMgdG8gcmV0dXJuIGFuIGVycm9yIGhlcmUsIHdoaWNoIGFsbCBjYWxsZXJzDQo+
Pj4gZXhjZXB0IHRoZSBvbmUgeW91IG1lbnRpb24gY2hlY2suIEkuZS4gdGhlIEJVR19PTigp
IHdvdWxkIGJlIG1vdmVkDQo+Pj4gb3V0IHRvIG1vc3QgY2FsbGVycyAoYWx0ZXJuYXRpdmVs
eSB0aGUgb25lIGNhbGxlciBjb3VsZCByYW5nZS1jaGVjaw0KPj4+IHRoZSBNU1IgaXRzZWxm
KS4gUmlnaHQgbm93IGZvciBpbnRyb3NwZWN0aW9uIGludGVyY2VwdHMgY2FuIG9ubHkgYmUN
Cj4+PiBlbmFibGVkLCBoZW5jZSB3aHkgZm9yIHRoYXQgdXNlICJhbGwgb3RoZXIgTVNScyBh
cmUgaW50ZXJjZXB0ZWQNCj4+PiBhbnl3YXkiIGlzIGZpbmUuIFN1cHBvc2UgdGhlIGludmVy
c2Ugb3BlcmF0aW9uIHdvdWxkIGJlIHBvc3NpYmxlIGFzDQo+Pj4gd2VsbDogVGhlbiBpbmRp
Y2F0aW5nICJzdWNjZXNzIiBiYWNrIHRvIHRoZSBjYWxsZXIgd2hlbiBhY2Nlc3NlcyB0bw0K
Pj4+IHRoZSByZXF1ZXN0ZWQgTVNSIGFyZSBzdGlsbCBpbnRlcmNlcHRlZCB3b3VsZCBiZSB3
cm9uZy4NCj4+Pg0KPj4NCj4+IElJVUMsIHlvdSdyZSBzdWdnZXN0aW5nIHRvIHJlcG9ydCB0
byB0aGUgY2FsbGVyIHRoYXQgdGhlIGhhcmR3YXJlDQo+PiBkb2Vzbid0IGNvdmVyIGl0LCBz
dWNoIGFzIHdlIGNhbiBkZXRlY3QgY2FzZXMgd2hlcmUgd2UgYWNjaWRlbnRhbGx5IHBhc3MN
Cj4+IGEgYm9ndXMgTVNSIGluZGV4IHRoYXQgaXMgb3V0c2lkZSBvZiBoYXJkd2FyZSByYW5n
ZXMuDQo+Pg0KPj4gSW4gdGhlIFZNIGludHJvc3BlY3Rpb24gY2FzZSwgd2UgY291bGQgaWdu
b3JlIGl0IHNpbmNlIHdlJ3JlIG9ubHkNCj4+IGludGVyZXN0ZWQgb24gaW50ZXJjZXB0cywg
d2hlcmUgb3V0c2lkZSBoYXJkd2FyZSByYW5nZXMgd291bGQgYWx3YXlzIGJlDQo+PiBpbnRl
cmNlcHRlZC4NCj4+DQo+PiBEaWQgSSBnb3QgdGhlIGlkZWEgY29ycmVjdGx5ID8NCj4gDQo+
IFllcy4gSnVzdCB0aGF0IHRoZSBtb3JlIEkgdGhpbmsgYWJvdXQgaXQsIHRoZSBtb3JlIEkg
cHJlZmVyIHRoZSBhbHRlcm5hdGl2ZQ0KPiB0aGF0IEkgYWxzbyBtZW50aW9uZWQuIE5vdCB0
aGUgbGVhc3QgYmVjYXVzZSBpdCdzIGxlc3MgY2h1cm4uDQo+IA0KDQpPbmUgb2YgdGhlIGlk
ZWEgd291bGQgYmUgdG8gY2hlY2sgbW9uaXRvcmVkX21zcigpIChzb21ld2hhdCBsaWtlIHdo
YXQgDQp5b3UgcHJvcG9zZWQgZm9yIFZNWCkgc28gdGhhdCB0aGUgVk0gZXZlbnQgY2FzZSBp
cyBjb3ZlcmVkLCBidXQgd2UgDQpBU1NFUlQgKG9yIEJVR19PTiA/KSBpbiB0aGUgb3RoZXIg
Y2FzZXMgaWYgd2UgcGFzcyBhIHVuZXhwZWN0ZWQgTVNSIHRvIA0KdGhpcyBmdW5jdGlvbi4N
Cg0KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5jIGIveGVuL2FyY2gv
eDg2L2h2bS9zdm0vc3ZtLmMNCmluZGV4IDcxZTQ4MzUxZjIuLmJlODY2YjkwNTUgMTAwNjQ0
DQotLS0gYS94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYw0KKysrIGIveGVuL2FyY2gveDg2
L2h2bS9zdm0vc3ZtLmMNCkBAIC0yMzYsNyArMjM2LDEyIEBAIHZvaWQgc3ZtX2ludGVyY2Vw
dF9tc3Ioc3RydWN0IHZjcHUgKnYsIHVpbnQzMl90IA0KbXNyLCBpbnQgZmxhZ3MpDQogICAg
ICBjb25zdCBzdHJ1Y3QgZG9tYWluICpkID0gdi0+ZG9tYWluOw0KDQogICAgICBtc3JfYml0
ID0gc3ZtX21zcmJpdCh2LT5hcmNoLmh2bS5zdm0ubXNycG0sIG1zcik7DQotICAgIEJVR19P
Tihtc3JfYml0ID09IE5VTEwpOw0KKyAgICBpZiAoICFtc3JfYml0ICkNCisgICAgew0KKyAg
ICAgICAgQVNTRVJUKG1vbml0b3JlZF9tc3IoZCwgbXNyKSk7DQorICAgICAgICByZXR1cm47
DQorICAgIH0NCisNCiAgICAgIG1zciAmPSAweDFmZmY7DQoNCiAgICAgIGlmICggZmxhZ3Mg
JiBNU1JfSU5URVJDRVBUX1JFQUQgKQ0KDQpJbiB0aGUgIUNPTkZJR19WTV9FVkVOVCwgdGhh
dCB3aWxsIHVuY29uZGl0aW9uYWxseSB0cmlnZ2VyIHRoZSBBU1NFUlQgaWYgDQp3ZSBnZXQg
dGhlcmUuDQoNCj4gSmFuDQoNClRlZGR5DQo=

--------------RIqfq6bkYX1JhcIDY4Nom5ju--

--------------6udVsDQDx3IRyJbekRuS0UIH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmq9EPwFAwAAAAAACgkQZg+p0QLLz9Am
WwwAmtBRUU0sYtOU2xhQZqyIFiCg0JdyztEGjC8a5CyGKrzQtj7e664I8n6/JjN3hTuUtQX41wD+
q4WbIY8geVtw0ncjuxMZ6L5LmqW0gIAvqLnpYV20WMLjTvoH9OMNlp+SoKxrKt8XAkXETI2Fcu+f
zmlVomlIAO+o698MNS3mKmKrvkpRAQKdjgeespi2u681lLUOHmqoW8F6P3zeumq1cfY7yeDNUgNT
OIgZV3StboKAnmRb3DomQHJtMdO3++j8x6bxG1qjp02NBTCWx3l9Y4A/Q93vP3AX7CN1XMgaK0Ng
TQUDfo44YaVX9i9YndU+okUOabCQvCIaOAvMEgIU0gf0ISwPa+Z20DUG7xOTY3p1tTxjrRIYt/9W
T6Br/GeDe939xSGWWOCpmWxXll4C/1q6LjumSbQsizvssr2paqPnEeYDhAtiSNT9u7/fAM3j9iP+
RZAVU64/p4mvUKz94PU27hrQbZo/gfviTi4y6kGwS349f9G1IzQapkkt7yKw
=hAGw
-----END PGP SIGNATURE-----

--------------6udVsDQDx3IRyJbekRuS0UIH--

