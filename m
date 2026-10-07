Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE4FCA5FF1
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 11:59:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442259.1659836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEQIl-0001k8-2D; Wed, 07 Oct 2026 11:59:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442259.1659836; Wed, 07 Oct 2026 11:59:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEQIk-0001k1-V2; Wed, 07 Oct 2026 11:59:14 +0000
Received: by outflank-mailman (input) for mailman id 1442259;
 Wed, 07 Oct 2026 11:59:13 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1163b4a7d0003f66@swg.vates.tech>)
 id 1xEQIi-0001jt-RW
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 11:59:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEQIh-00CQ4C-QS
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 13:59:11 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1163b4a7d0003f66@swg.vates.tech>)
 id 6ac6340e-2eae-0a2a0a5409dd-0a2a4507ed40-8
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 13:59:11 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1163b4a7d0003f66@swg.vates.tech>)
 id 6ac6340f-b4ea-0a2a45070019-b9ff1c22af61-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 13:59:11 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1163b4a7d0003f66.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 07 Oct 2026 11:59:06 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 02EA782388;
 Wed,  7 Oct 2026 13:59:05 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=tVc3zRgmDIOuP2JV7CZKp5R4gCp9SFNVyZHsnrd3Wm0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=P9SNCCFHUf4O5jdzEceiSPbVNG+Q2SCLt6+RkhI5zexCt7g/pTX27/oC//FT8bFjlhLRDnKxs
 PsSJfigDTw3NrtVtcy3Zsc4eoKfLCnKiaUceNwQ/0Q9TrL4KSoLcLu5rN51FthirjXiB+ryj7Br
 sLbqAPKwS86IuewUUDij9z96wpzINKYX+geuZnUvz4ZsuNeL3G58bNTHodp6xYZ0ti4NcqACnHz
 FYOuiGNzuJd3V53YjqP5H0PxtuwRsAyoXWTTY5E9XE6nhy98U828itdjXIUCDMhgA/T3mR0Ynoi
 K+qKRviseT1qtJI2wXBiBb5kuSJmc0q2pY8YJ2KtUr5A==
X-Zone-Loop: d688e437cafd28e1079eb9061beb36ad0b68a70c8241
x-campaign-type: default
x-transaction-id: 6777d653-77e1-4c36-b90d-f657b87c2ffd
x-swg-uid: 01-fb820b22-1ddf-4d79-80bb-e7d86c0231b4
X-Mailer: Sweego
Message-ID:
 <1791374346.8631fc262581453bbf619ec5b2062170.1a1163b4a7d0003f66@vates.tech>
x-swg-bid: 1791374346.8631fc262581453bbf619ec5b2062170.1a1163b4a7d0003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 7 Oct 2026 13:59:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] xen/riscv: always preset A/D bits in G-stage PTEs
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Zheng Zhang <zhangzheng@iscas.ac.cn>,
 xen-devel@lists.xenproject.org, Baptiste Le Duc <baptiste.le-duc@vates.tech>
References: <1791215925.8631fc262581453bbf619ec5b2062170.1a10cc9f7c20003f66@vates.tech>
 <1791216017.8631fc262581453bbf619ec5b2062170.1a10ccb5ec20003f66@vates.tech>
 <793b6d0d-68ca-4f9d-8ca5-c37f2c013478@suse.com>
 <4a0b0d62-c312-43c1-908a-fcff7c081149@gmail.com>
 <4fa78acf-4de9-48bc-aea8-fed774d80cfa@suse.com>
 <a4db81fc-03ec-4521-8424-7c9486ec9be2@gmail.com>
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
In-Reply-To: <a4db81fc-03ec-4521-8424-7c9486ec9be2@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------yK1TrqNChZZZM4x4ILmMMtCG"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791374346259
X-purgate-ID: tlsNG-ef75cf/1791374351-364DBAE4-575C653C/0/0
X-purgate-type: clean
X-purgate-size: 8178

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------yK1TrqNChZZZM4x4ILmMMtCG
Content-Type: multipart/mixed; boundary="------------l1VK03TfshMeovI68YfiQXRP";
 protected-headers="v1"; hp="clear"
Message-ID: <9f170b09-7868-4352-adc2-df22f439e819@vates.tech>
Date: Wed, 7 Oct 2026 13:59:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] xen/riscv: always preset A/D bits in G-stage PTEs
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Zheng Zhang <zhangzheng@iscas.ac.cn>,
 xen-devel@lists.xenproject.org, Baptiste Le Duc <baptiste.le-duc@vates.tech>
References: <1791215925.8631fc262581453bbf619ec5b2062170.1a10cc9f7c20003f66@vates.tech>
 <1791216017.8631fc262581453bbf619ec5b2062170.1a10ccb5ec20003f66@vates.tech>
 <793b6d0d-68ca-4f9d-8ca5-c37f2c013478@suse.com>
 <4a0b0d62-c312-43c1-908a-fcff7c081149@gmail.com>
 <4fa78acf-4de9-48bc-aea8-fed774d80cfa@suse.com>
 <a4db81fc-03ec-4521-8424-7c9486ec9be2@gmail.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <a4db81fc-03ec-4521-8424-7c9486ec9be2@gmail.com>

--------------l1VK03TfshMeovI68YfiQXRP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMDcvMTAvMjAyNiDDoCAxMzozNSwgT2xla3NpaSBLdXJvY2hrbyBhIMOpY3JpdMKgOg0K
PiBBbHNvIEkgYW0gbG9va2luZyBhdCBoZW52Y2ZnIHJlZ2lzdGVyIHdoaWNoIHdlIGNvdWxk
IGFjY2VzcyBpbiBIUy1tb2RlIA0KPiBhbmQgaXQgYWxzbyBoYXMgQURVRSBiaXQgYW5kIHRo
ZSBkZXNjcmlwdGlvbiBmb3IgaXQgaXMgdGhlIGZvbGxvd2luZzoNCj4gYGBgDQo+IElmIHRo
ZSBTdmFkdSBleHRlbnNpb24gaXMgaW1wbGVtZW50ZWQsIHRoZSBBRFVFIGJpdCBjb250cm9s
cyB3aGV0aGVyIA0KPiBoYXJkd2FyZSB1cGRhdGluZyBvZiBQVEUgQS9EIGJpdHMgaXMgZW5h
YmxlZCBmb3IgVlMtc3RhZ2UgYWRkcmVzcyANCj4gdHJhbnNsYXRpb24uIFdoZW4gQURVRT0x
LCBoYXJkd2FyZSB1cGRhdGluZyBvZiBQVEUgQS9EIGJpdHMgaXMgZW5hYmxlZCANCj4gZHVy
aW5nIFZTLXN0YWdlIGFkZHJlc3MgdHJhbnNsYXRpb24sIGFuZCB0aGUgaW1wbGVtZW50YXRp
b24gYmVoYXZlcyBhcyANCj4gdGhvdWdoIHRoZSBTdmFkZSBleHRlbnNpb24gd2VyZSBub3Qg
aW1wbGVtZW50ZWQgZm9yIFZTLW1vZGUgYWRkcmVzcyANCj4gdHJhbnNsYXRpb24uIFdoZW4g
QURVRT0wLCB0aGUgaW1wbGVtZW50YXRpb24gYmVoYXZlcyBhcyB0aG91Z2ggU3ZhZGUgDQo+
IHdlcmUgaW1wbGVtZW50ZWQgZm9yIFZTLXN0YWdlIGFkZHJlc3MgdHJhbnNsYXRpb24uIElm
IFN2YWR1IGlzIG5vdCANCj4gaW1wbGVtZW50ZWQsIEFEVUUgaXMgcmVhZC1vbmx5IHplcm8N
Cj4gYGBgDQo+IA0KPiBTbywgYXQgc29tZSBwb2ludCwgd2UgY291bGQgdmVyaWZ5IGhvdyBP
cGVuU0JJIGNvbmZpZ3VyZWQgdGhlIGhhcmR3YXJlIA0KPiBhbmQgY29tcGFyZSBpdCB3aXRo
IHdoYXQgaXMgc3BlY2lmaWVkIGluIHRoZSBEVFMgZmlsZS4NCj4gDQo+IFRoZSBvbmx5IHBy
b2JsZW0gaXMgaG93IHRvIGludGVycHJldCB0aGlzIHBhcnQ6IOKAnElmIFN2YWR1IGlzIG5v
dCANCj4gaW1wbGVtZW50ZWQsIEFEVUUgaXMgcmVhZC1vbmx5IHplcm8u4oCdIFRoZSBzcGVj
IGRvZXMgbm90IGV4cGxpY2l0bHkgc3RhdGUgDQo+IHRoYXQgU3ZhZGUgd2lsbCBiZSB1c2Vk
IGluIHRoaXMgY2FzZSwgYnV0IGxvZ2ljYWxseSwgaXQgc2VlbXMgdGhhdCBpZiANCj4gU3Zh
ZHUgaXMgbm90IGltcGxlbWVudGVkLCB0aGUgaW1wbGVtZW50YXRpb24gaGFzIG5vIG90aGVy
IGNob2ljZSBidXQgdG8gDQo+IHByb3ZpZGUgU3ZhZGUgYW5kIHNvIGJhc2ljYWxseSB3ZSBj
b3VsZCBkZXRlY3QgaWYgU3ZhZGUgaXMgdXNlZCBiYXNlZCANCj4gb25seSBvbiBBRFVFIGJp
dC4NCj4gDQoNClRvIG15IHVuZGVyc3RhbmRpbmcsIHdoZW4gIVN2YWRlICYmICFTdmFkdSBB
RFVFIGJpdCBkb2Vzbid0IGV4aXN0IGFuZCBpcyANCk1CWi4gVGhhdCBkb2Vzbid0IGltcGx5
IFN2YWRlIHNlbWFudGljcyBtdXN0IGJlIHVuY29uZGl0aW9uYWxseSBhcHBsaWVkLCANCmJ1
dCB0aGUgY29udHJhcnkgKG90aGVyd2lzZSwgaXQgd291bGQgY29udHJhZGljdCB0aGUgbWFp
biBzcGVjKS4NCg0KQUlVSSwgU3ZhZHUgJiYgIVN2YWRlIGJlaGF2ZXMgdGhlIHNhbWUgYXMg
U3ZhZHUgJiYgU3ZhZGUsIGFzIGluIHRoaXMgDQpjYXNlLCBBRFVFIG1hbmRhdGUgdGhlIFBU
RSBBL0Qgc2NoZW1lIHRoYXQgaXMgZWZmZWN0aXZlLg0KSWYgYnkgZGVmYXVsdCBBRFVFIGlz
IDAsIHRoZW4gd2UgaGF2ZSBTdmFkZSBzZW1hbnRpY3MgYnkgZGVmYXVsdCBpbiANCnByYWN0
aWNlLCBidXQgdGhhdCBjYW4gKCptYXliZSopIGJlIG9wdGVkLW91dC4NCg0KSXQgY291bGQg
YmUgaW50ZXJlc3RpbmcgdG8gY2hlY2sgaWYgdGhlIFA1NTAgaGFzIFN2YWR1ICYmICFTdmFk
ZSwgYXMgaXQgDQptYXkgZXhwbGFpbiB3aHkgU3ZhZGUgc2VtYW50aWNzIGFyZSBlZmZlY3Rp
dmUgd2hpbGUgbm90IGhhdmluZyBTdmFkZSANCmV4dGVuc2lvbi4NCg0KPiBJZiB3ZSBhY2Nl
cHQgdGhpcyBhc3N1bXB0aW9uLCB3ZSBjb3VsZCBmdWxseSB2ZXJpZnksIGluIEhTLW1vZGUs
IGJvdGggDQo+IHdoYXQgaXMgc3BlY2lmaWVkIGluIHRoZSBEVFMgYW5kIGhvdyBPcGVuU0JJ
IGNvbmZpZ3VyZWQgdGhlIGhhcmR3YXJlLiANCj4gVGhpcyB3b3VsZCBhbGxvdyB1cyB0byBy
ZXF1aXJlIHVzZXJzIHRvIHByb3ZpZGUgYSBwcm9wZXIgRFRTIHdpdGggdGhlIEEvIA0KPiBE
IGJpdHMgdXBkYXRlIHNjaGVtZSBjb3JyZWN0bHkgc3BlY2lmaWVkLg0KPiANCj4gfiBPbGVr
c2lpDQoNClRlZGR5DQo=

--------------l1VK03TfshMeovI68YfiQXRP--

--------------yK1TrqNChZZZM4x4ILmMMtCG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmrGNAkFAwAAAAAACgkQZg+p0QLLz9DJ
8gv/TsFbkq7CdD6MPOX7I3ftXbFEtXZcrt85lIeszXmN/lhNDoQQT17nL6S7ZjUwuVjm8kmbEQj5
ssIg5wJ3KJVY3+SQSXimYZN2re1oOJOGHA2T6PGYIqdNIJMF3QI9f1ZZbbpzWmuRasdyIsNL5sLa
xq/TUEu7LA4ayeq2SH1vrUfzcVrq/uvuZ1OqVpNAyKYQWGYOPAkrciPJeOeJcsUs7B5d8qW3mTJv
Q80hplNjLuaOjYEz+fGFqW6Yt0yj8q/J4bAJTCe478d67IUo1MURCIM+5+x6fgSzt+bbbVxUEuoc
Z3tq6FY5HXKrTPT/LpRLdHEwgV9a6UokFqVMGiKYMkjUcncdl8V0Xu0Anoxrjcp4Xj5JRy8cPW5n
fdA89McsX8LiQEUYx5C2B1endLTghhzwDSmPHW6u8pdHZypMO2F5U0vo1027RKS0+HSpv/rv860o
JuEt/HDkCmNKH9qTkN55dTC37TeRWFx2UTzLRgk3zUKPBTjidNyjC76p2Les
=VrXC
-----END PGP SIGNATURE-----

--------------yK1TrqNChZZZM4x4ILmMMtCG--

