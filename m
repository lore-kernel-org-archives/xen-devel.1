Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0E7606A31A
	for <xen-devel@archiver.kernel.org>; Sat, 31 Oct 2026 10:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=GtiaMwcd
Received: from list by lists.xenproject.org with outflank-mailman.1466685.1676494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xN6k9-0007fZ-Vq; Sat, 31 Oct 2026 10:55:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1466685.1676494; Sat, 31 Oct 2026 10:55:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xN6k9-0007fR-SY; Sat, 31 Oct 2026 10:55:25 +0000
Received: by outflank-mailman (input) for mailman id 1466685;
 Sat, 31 Oct 2026 10:55:23 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1919984c0000403d@swg.vates.tech>)
 id 1xN6k7-0007fL-CH
 for xen-devel@lists.xenproject.org; Sat, 31 Oct 2026 10:55:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xN6k6-0041mw-Me
 for xen-devel@lists.xenproject.org; Sat, 31 Oct 2026 11:55:22 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1919984c0000403d@swg.vates.tech>)
 id 6ae5c8f4-e002-0a2a0a5209dd-0a2a4507bdd4-22
 for <xen-devel@lists.xenproject.org>; Sat, 31 Oct 2026 11:55:22 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1919984c0000403d@swg.vates.tech>)
 id 6ae5c919-b4ea-0a2a45070019-b9ff1c23a669-3
 for <xen-devel@lists.xenproject.org>; Sat, 31 Oct 2026 11:55:22 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1919984c0000403d.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 31 Oct 2026 10:55:19 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 95A9C81EBC;
 Sat, 31 Oct 2026 11:55:18 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=x3pGT8nMRCOwXEKiDdVRn0R4zMk+72E3EA8kyetHXsA=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=GtiaMwcdCyzElf84T9JoX72UMljlDEV4SBS1kcPSGJsWBAq+YZTvm+p73xKQjOPyYc0MUdqxj
 b35hplAH/7eLb8eYAhwHC/3Mlp2Al+PcqK8dxwFfWV9afAuuBr+hG/fEQCshxK9ROgcavF2yJ4K
 ARkxdBMsAlimzew2kPYFJO+qePXFHy1yc5vDwgZa/7wC4T03MnMQgmXnWrXQrcVkBYkpkEGD7WQ
 ixED33D5WtKYAa4Fb+Zia60uEEv5eUmIkRvCQrryhcKvXezpFux8aoDZFVBa6e10eSwi4sdOw/9
 f6s19zFQU4KIe1ah1uH+WFMrDtSgKsZTa7tU1zgdrhSA==
X-Zone-Loop: dfc7d27d9ece9065b9045ad0ad62608c4874d6075fb6
x-campaign-type: default
x-transaction-id: 7e7a8603-f85d-476e-b4dc-d4c21fc7daa8
x-swg-uid: 01-2be8cd43-d47a-42f5-a21f-0bed95d484e6
X-Mailer: Sweego
Message-ID:
 <1793444119.8631fc262581453bbf619ec5b2062170.1a1919984c0000403d@vates.tech>
x-swg-bid: 1793444119.8631fc262581453bbf619ec5b2062170.1a1919984c0000403d
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Sat, 31 Oct 2026 11:55:17 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] IOMMU: record the flushes skipped under
 iommu_dont_flush_iotlb
To: Luca Di Maio <luca@edera.dev>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20261030165031.2560020-1-luca@edera.dev>
 <20261030165031.2560020-2-luca@edera.dev>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20261030165031.2560020-2-luca@edera.dev>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------p5VK3GaO0TPWYBJVW5PXafJA"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793444118841
X-purgate-ID: tlsNG-ef75cf/1793444122-360C5AE4-8243BE27/0/0
X-purgate-type: clean
X-purgate-size: 10628
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------p5VK3GaO0TPWYBJVW5PXafJA
Content-Type: multipart/mixed; boundary="------------KSSnjw4vfNvorwyZIFbFQZsf";
 protected-headers="v1"; hp="clear"
Message-ID: <db5368b3-d3ab-40e4-8a62-5a6b29482fab@vates.tech>
Date: Sat, 31 Oct 2026 11:55:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] IOMMU: record the flushes skipped under
 iommu_dont_flush_iotlb
To: Luca Di Maio <luca@edera.dev>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20261030165031.2560020-1-luca@edera.dev>
 <20261030165031.2560020-2-luca@edera.dev>
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
In-Reply-To: <20261030165031.2560020-2-luca@edera.dev>

--------------KSSnjw4vfNvorwyZIFbFQZsf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMzAvMTAvMjAyNiDDoCAxNzo1MywgTHVjYSBEaSBNYWlvIGEgw6ljcml0wqA6DQo+IFdo
aWxlIGlvbW11X2RvbnRfZmx1c2hfaW90bGIgaXMgc2V0LCBpb21tdV9sZWdhY3lfdW5tYXAo
KSBhbmQgdGhlDQo+IHNoYXJlZC1FUFQgcGF0aCBvZiBlcHRfc2V0X2VudHJ5KCkgc2tpcCB0
aGVpciBJT1RMQiBmbHVzaCBhbmQgZHJvcCB0aGUNCj4gZmxhZ3MgaXQgd291bGQgaGF2ZSB1
c2VkLiBBY2N1bXVsYXRlIHRoZW0gaW4gdGhlIHBlci1DUFUNCj4gaW9tbXVfc2tpcHBlZF9m
bHVzaF9mbGFncywgc28gdGhhdCBhIGNhbGxlciBkZWZlcnJpbmcgdGhlIGZsdXNoIGNhbg0K
PiBpc3N1ZSBpdCB3aXRoIHRoZSBzYW1lIGZsYWdzLiBUaGUgbmV4dCBwYXRjaCBkb2VzIHNv
IGZvciBncmFudCB1bm1hcHMuDQo+IA0KPiBVc2UgYSB1aW50OF90LCBhcyBhIGZpeGVkIHdp
ZHRoIGlzIG1lYW50OiBhIGJ5dGUgaG9sZHMgZXZlcnkgZmxhZyBhbmQNCj4gZml0cyBpbiB0
aGUgcGFkZGluZyBhZnRlciBpb21tdV9kb250X2ZsdXNoX2lvdGxiLCBzbyB0aGUgcGVyLUNQ
VSBkYXRhDQo+IHRoYXQgZm9sbG93cyBkb2Vzbid0IG1vdmUuDQo+IA0KPiBBc3Npc3RlZC1i
eTogQ2xhdWRlIENvZGU6Y2xhdWRlLW9wdXMtNS01DQo+IFNpZ25lZC1vZmYtYnk6IEx1Y2Eg
RGkgTWFpbyA8bHVjYUBlZGVyYS5kZXY+DQo+IA0KPiAtLS0NCj4gICB4ZW4vYXJjaC94ODYv
bW0vcDJtLWVwdC5jICAgICAgIHwgIDQgKysrKw0KPiAgIHhlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL2lvbW11LmMgfCAxMiArKysrKysrKysrKy0NCj4gICB4ZW4vaW5jbHVkZS94ZW4vaW9t
bXUuaCAgICAgICAgIHwgIDEgKw0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9t
bS9wMm0tZXB0LmMgYi94ZW4vYXJjaC94ODYvbW0vcDJtLWVwdC5jDQo+IGluZGV4IDIwNGJk
YjA1NGEuLjFhODdiMjVkOTQgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0t
ZXB0LmMNCj4gKysrIGIveGVuL2FyY2gveDg2L21tL3AybS1lcHQuYw0KPiBAQCAtOTgxLDYg
Kzk4MSwxMCBAQCBvdXQ6DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAoaW9tbXVfZmxhZ3MgPyBJT01NVV9GTFVTSEZfYWRkZWQgOiAwKSB8DQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAodnRkX3B0ZV9wcmVzZW50ID8gSU9NTVVf
RkxVU0hGX21vZGlmaWVkDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDogMCkpOw0KPiArICAgICAgICBlbHNlIGlmICggaW9tbXVf
dXNlX2hhcF9wdChkKSApDQo+ICsgICAgICAgICAgICB0aGlzX2NwdShpb21tdV9za2lwcGVk
X2ZsdXNoX2ZsYWdzKSB8PQ0KPiArICAgICAgICAgICAgICAgIChpb21tdV9mbGFncyA/IElP
TU1VX0ZMVVNIRl9hZGRlZCA6IDApIHwNCj4gKyAgICAgICAgICAgICAgICAodnRkX3B0ZV9w
cmVzZW50ID8gSU9NTVVfRkxVU0hGX21vZGlmaWVkIDogMCk7DQo+ICAgICAgICAgICBlbHNl
IGlmICggbmVlZF9pb21tdV9wdF9zeW5jKGQpICkNCj4gICAgICAgICAgICAgICByYyA9IGlv
bW11X2ZsYWdzID8NCj4gICAgICAgICAgICAgICAgICAgaW9tbXVfbGVnYWN5X21hcChkLCBf
ZGZuKGdmbiksIG1mbiwgMXVsIDw8IG9yZGVyLCBpb21tdV9mbGFncykgOg0KDQpXZSBub3cg
aGF2ZQ0KDQooaW9tbXVfZmxhZ3MgPyBJT01NVV9GTFVTSEZfYWRkZWQgOiAwKSB8DQoodnRk
X3B0ZV9wcmVzZW50ID8gSU9NTVVfRkxVU0hGX21vZGlmaWVkIDogMCkNCg0KZHVwbGljYXRl
ZCBpbiAyIGRpZmZlcmVudCAoYWRqYWNlbnQpIHBsYWNlcywgSSB0aGluayB3ZSBzaG91bGQg
Y29sbGFwc2UgDQppdCBpbiBhIHZhcmlhYmxlLiBpLmUgc29tZXRoaW5nIGxpa2UNCg0KdW5z
aWduZWQgbG9uZyBmbHVzaF9mbGFncyA9DQogICAgIChpb21tdV9mbGFncyA/IElPTU1VX0ZM
VVNIRl9hZGRlZCA6IDApIHwNCiAgICAgKHZ0ZF9wdGVfcHJlc2VudCA/IElPTU1VX0ZMVVNI
Rl9tb2RpZmllZCA6IDApOw0KDQpCdXQgbW9yZSBnZW5lcmFsbHksIGdpdmVuIHRoYXQgaW9t
bXVfZG9udF9mbHVzaF9pb3RsYiBpcyBvbmx5IA0Kc2V0L2NsZWFyZWQgaW4gcGF0aHMgdGhh
dCBjaGVjayBpdCAoZGlyZWN0bHkgb3IgaW5kaXJlY3RseSksIHdoYXQgYWJvdXQgDQptb3Zp
bmcgdGhpcyBsb2dpYyBpbnRvIGlvbW11X2lvdGxiX2ZsdXNoKCkgdG8gYmUgc3VwcHJlc3Nl
ZCBieSANCmlvbW11X2RvbnRfZmx1c2hfaW90bGIgKGFuZCBpZiBzdXBwcmVzc2VkLCB8PSB0
aGUgDQppb21tdV9za2lwcGVkX2ZsdXNoX2ZsYWdzIGluc3RlYWQpID8NCg0KVGhhdCB3b3Vs
ZCBnZXQgcmlkIG9mIGEgbG90IG9mIGR1cGxpY2F0ZWQgbG9naWMuDQoNCj4gZGlmZiAtLWdp
dCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMgYi94ZW4vZHJpdmVycy9wYXNz
dGhyb3VnaC9pb21tdS5jDQo+IGluZGV4IDRiMjJlY2ZlNjUuLjcwZWU0NWFmYjkgMTAwNjQ0
DQo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMNCj4gKysrIGIveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYw0KPiBAQCAtNjQsNiArNjQsMTEgQEAgYm9v
bCBfX3JlYWRfbW9zdGx5IGlvbW11X2hhcF9wdF9zaGFyZSA9IHRydWU7DQo+ICAgYm9vbCBf
X3JlYWRfbW9zdGx5IGlvbW11X2RlYnVnOw0KPiAgIA0KPiAgIERFRklORV9QRVJfQ1BVKGJv
b2wsIGlvbW11X2RvbnRfZmx1c2hfaW90bGIpOw0KPiArLyoNCj4gKyAqIEEgYnl0ZSBob2xk
cyBldmVyeSBJT01NVV9GTFVTSEZfKiwgYW5kIGZpdHMgaW4gdGhlIGFsaWdubWVudCBwYWRk
aW5nIHRoZQ0KPiArICogYm9vbCBhYm92ZSBsZWF2ZXMsIGluc3RlYWQgb2Ygc2hpZnRpbmcg
dGhlIHBlci1DUFUgZGF0YSB0aGF0IGZvbGxvd3MuDQo+ICsgKi8NCj4gK0RFRklORV9QRVJf
Q1BVKHVpbnQ4X3QsIGlvbW11X3NraXBwZWRfZmx1c2hfZmxhZ3MpOw0KPiAgIA0KDQpmbHVz
aF9mbGFncyBpbiBpb3RsYl9mbHVzaCBpcyB1bnNpZ25lZCBpbnQgaW4gaW9tbXVfaW90bGJf
Zmx1c2goKSwgc28gSSANCndvdWxkIHVzZSBpdCBoZXJlIGFzIHdlbGwgaW5zdGVhZCBvZiB1
aW50OF90Lg0KDQo+ICAgc3RhdGljIGludCBfX2luaXQgY2ZfY2hlY2sgcGFyc2VfaW9tbXVf
cGFyYW0oY29uc3QgY2hhciAqcykNCj4gICB7DQo+IEBAIC00NTgsNyArNDYzLDEyIEBAIGlu
dCBpb21tdV9sZWdhY3lfdW5tYXAoc3RydWN0IGRvbWFpbiAqZCwgZGZuX3QgZGZuLCB1bnNp
Z25lZCBsb25nIHBhZ2VfY291bnQpDQo+ICAgICAgIHVuc2lnbmVkIGludCBmbHVzaF9mbGFn
cyA9IDA7DQo+ICAgICAgIGludCByYyA9IGlvbW11X3VubWFwKGQsIGRmbiwgcGFnZV9jb3Vu
dCwgMCwgJmZsdXNoX2ZsYWdzKTsNCj4gICANCj4gLSAgICBpZiAoICF0aGlzX2NwdShpb21t
dV9kb250X2ZsdXNoX2lvdGxiKSAmJiAhcmMgKQ0KPiArICAgIGlmICggdGhpc19jcHUoaW9t
bXVfZG9udF9mbHVzaF9pb3RsYikgKQ0KPiArICAgIHsNCj4gKyAgICAgICAgQlVJTERfQlVH
X09OKElPTU1VX0ZMVVNIRl9hbGwgPiBVSU5UOF9NQVgpOw0KPiArICAgICAgICB0aGlzX2Nw
dShpb21tdV9za2lwcGVkX2ZsdXNoX2ZsYWdzKSB8PSBmbHVzaF9mbGFnczsNCj4gKyAgICB9
DQo+ICsgICAgZWxzZSBpZiAoICFyYyApDQo+ICAgICAgICAgICByYyA9IGlvbW11X2lvdGxi
X2ZsdXNoKGQsIGRmbiwgcGFnZV9jb3VudCwgZmx1c2hfZmxhZ3MpOw0KPiAgIA0KPiAgICAg
ICByZXR1cm4gcmM7DQo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaCBi
L3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oDQo+IGluZGV4IDM3YzRhMWRjODIuLjAyOGY0MWJj
MTUgMTAwNjQ0DQo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oDQo+ICsrKyBiL3hl
bi9pbmNsdWRlL3hlbi9pb21tdS5oDQo+IEBAIC01MDEsNiArNTAxLDcgQEAgdm9pZCBpb21t
dV9kZXZfaW90bGJfZmx1c2hfdGltZW91dChzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgcGNp
X2RldiAqcGRldik7DQo+ICAgICogdGhlIGNhbGxlci4NCj4gICAgKi8NCj4gICBERUNMQVJF
X1BFUl9DUFUoYm9vbCwgaW9tbXVfZG9udF9mbHVzaF9pb3RsYik7DQo+ICtERUNMQVJFX1BF
Ul9DUFUodWludDhfdCwgaW9tbXVfc2tpcHBlZF9mbHVzaF9mbGFncyk7DQo+ICAgDQo+ICAg
Ym9vbCBhcmNoX2lvbW11X3VzZV9wZXJtaXR0ZWQoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCk7
DQo+ICAgDQoNCg==

--------------KSSnjw4vfNvorwyZIFbFQZsf--

--------------p5VK3GaO0TPWYBJVW5PXafJA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmrlyRYFAwAAAAAACgkQZg+p0QLLz9Ae
8gv/YCHvY2+Im05LNE/OE5DKykwnuXqu7GyAmtJP3NBJEouQV5Xo3y5gOUylYxRGM2j5dy+6R7qX
v5tJGsJCJ2vhXUOdFkobzIXQwaPLBtiulCOBDN81hQWFDA35EEFCW46x7mflrpLJjsoEoDQ3DxvO
kyq2zN1SzEYdnwg3I5rsuJw8+nXbeTzkcyfWtYHsAiQme4Ti+q448G7hLgmGCiduXL8KCF/zyTok
vcElxdZm/QfAsNtzm2jXt+A7t7QG+mDsFBvyU+NYQJWh2dj/LxQLYwEdNVKujuNPqYgqmQEnd9jF
Y9WPOgVHb1QpGJ3y3V1tYeY/KDYiGS2nHejK5hx2mWCuN7kSzqG4uLC7eb6FRCkL3oyyox6id7iT
27HXHFVjeFliLKXf3DPw2KbVXBTxmn+tN+EgcCGT70sMbzeXIYx4eiHsPz0O0vFEVDJ8SJr7Z+ZL
N/mvq8jpokRpBwQ6m6gckAK3a+3Zy+pDOYtVsXlPWQd6K0F8lGFwmgEzFWw/
=unaX
-----END PGP SIGNATURE-----

--------------p5VK3GaO0TPWYBJVW5PXafJA--

