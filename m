Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6EC606A6B7
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 22:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=EO2eOkx0
Received: from list by lists.xenproject.org with outflank-mailman.1498558.1696239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUWv7-0000PL-2w; Fri, 20 Nov 2026 22:17:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1498558.1696239; Fri, 20 Nov 2026 22:17:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUWv7-0000PE-0O; Fri, 20 Nov 2026 22:17:25 +0000
Received: by outflank-mailman (input) for mailman id 1498558;
 Fri, 20 Nov 2026 22:17:24 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1fb091aa10007c6e@swg.vates.tech>)
 id 1xUWv5-0000P8-Gf
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 22:17:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUWv4-009EDX-TX
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 23:17:22 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1fb091aa10007c6e@swg.vates.tech>)
 id 6b00c69a-bab6-0a2a0a5309dd-0a2a45048eba-36
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 23:17:22 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1fb091aa10007c6e@swg.vates.tech>)
 id 6b00c6f2-b57f-0a2a45040019-b9ff1c23adc5-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 23:17:22 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1fb091aa10007c6e.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 20 Nov 2026 22:17:20 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 58B0880D91;
 Fri, 20 Nov 2026 23:17:19 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=DE2biiuLrGbbkA9Kf4H9UMRdhZrvHBFr07ERKzfc/FA=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=EO2eOkx0TElkVGDUgYPTw7n7Mh00FYpBiy0sT19ZnvhUQO6vq6Z8AUIIcb9rhVH/CJR+V3P7Z
 ne4ElC+4gnSW7PAi+QKgogeucdPRr6anp7xpGVgnZlF53oR5s0X7bz+UhkiHAmwS9nKZyonaTR+
 JWFvKW1a2JHi7E0t587VSL9E02oA8TPVPhxxhXFJvaR2WVGws+BXe6aLsYjK+EfJobv6uexERlv
 bq6Shf1u5wk+9HK3Y9K63eyOfFEBTRopLzZehVXSZgeQUnxpxRm0iblE78GHM6zn3pRxwf5fPnC
 1ibeO8XGCh+QEzbCtx1K26dHr3gHgktz5Ha/hTYvSeTA==
X-Zone-Loop: 528bc4c04531bbf0b840e903c1cec486955e33d6fb50
x-campaign-type: default
x-transaction-id: 93848610-30ac-4995-8a05-6cbf9ad1ccb9
x-swg-uid: 01-0588c6f2-d684-47a0-b09e-70bfa0746598
X-Mailer: Sweego
Message-ID:
 <1795213040.8631fc262581453bbf619ec5b2062170.1a1fb091aa10007c6e@vates.tech>
x-swg-bid: 1795213040.8631fc262581453bbf619ec5b2062170.1a1fb091aa10007c6e
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Fri, 20 Nov 2026 23:17:18 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/nestedsvm: Inject #UD for not-intercepted VMMCALL
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Jason Andryuk <jason.andryuk@amd.com>
References: <20261120111111.1794822-1-ross.lagerwall@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20261120111111.1794822-1-ross.lagerwall@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------sV9wHEyLqspfDtDwm1svBC6P"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1795213039527
X-purgate-ID: tlsNG-ebf023/1795213042-C22D4B50-6551A612/0/0
X-purgate-type: clean
X-purgate-size: 6997
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------sV9wHEyLqspfDtDwm1svBC6P
Content-Type: multipart/mixed; boundary="------------f7u608qvmXJ4xJXV5WrSrmlU";
 protected-headers="v1"; hp="clear"
Message-ID: <e5ce32e3-a849-4f4d-9b67-77d0d11a0f7f@vates.tech>
Date: Fri, 20 Nov 2026 23:17:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/nestedsvm: Inject #UD for not-intercepted VMMCALL
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Jason Andryuk <jason.andryuk@amd.com>
References: <20261120111111.1794822-1-ross.lagerwall@citrix.com>
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
In-Reply-To: <20261120111111.1794822-1-ross.lagerwall@citrix.com>

--------------f7u608qvmXJ4xJXV5WrSrmlU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMjAvMTEvMjAyNiDDoCAxMjoxMSwgUm9zcyBMYWdlcndhbGwgYSDDqWNyaXTCoDoNCj4g
UmF0aGVyIHRoYW4gYWx3YXlzIGZvcndhcmRpbmcgVk1NQ0FMTCB0byBMMSwgZm9sbG93IHRo
ZSBBUE0gVm9sIDIgUmV2DQo+IDMuNDYgMTUuMTggIlZNTUNBTEwgSW5zdHJ1Y3Rpb24iIGFu
ZCBpbmplY3QgI1VEIGZvciBhIG5vdC1pbnRlcmNlcHRlZA0KPiBWTU1DQUxMLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5j
b20+DQo+IC0tLQ0KPiAgIHhlbi9hcmNoL3g4Ni9odm0vc3ZtL25lc3RlZHN2bS5jIHwgMyAt
LS0NCj4gICB4ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYyAgICAgICB8IDcgKysrKysrLQ0K
PiAgIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL25lc3RlZHN2bS5jIGIv
eGVuL2FyY2gveDg2L2h2bS9zdm0vbmVzdGVkc3ZtLmMNCj4gaW5kZXggMzY2MTc4ZmY1NGE3
Li43YmM1NzEwYzgyOTQgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL25l
c3RlZHN2bS5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL25lc3RlZHN2bS5jDQo+
IEBAIC0xMjYxLDkgKzEyNjEsNiBAQCBuZXN0ZWRzdm1fY2hlY2tfaW50ZXJjZXB0cyhzdHJ1
Y3QgdmNwdSAqdiwgc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsDQo+ICAgICAgICAgICAg
ICAgcmV0dXJuIE5FU1RFREhWTV9WTUVYSVRfSE9TVDsNCj4gICAgICAgICAgIHJldHVybiBO
RVNURURIVk1fVk1FWElUX0lOSkVDVDsNCj4gICANCj4gLSAgICBjYXNlIFZNRVhJVF9WTU1D
QUxMOg0KPiAtICAgICAgICAvKiBBbHdheXMgbGV0IHRoZSBndWVzdCBoYW5kbGUgVk1NQ0FM
TC9WTUNBTEwgKi8NCj4gLSAgICAgICAgcmV0dXJuIE5FU1RFREhWTV9WTUVYSVRfSU5KRUNU
Ow0KPiAgICAgICBkZWZhdWx0Og0KPiAgICAgICAgICAgYnJlYWs7DQo+ICAgICAgIH0NCj4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5jIGIveGVuL2FyY2gveDg2
L2h2bS9zdm0vc3ZtLmMNCj4gaW5kZXggYmZjYTFlZGE0YWY1Li5lZjQyZDVlYjk4MWQgMTAw
NjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5jDQo+ICsrKyBiL3hlbi9h
cmNoL3g4Ni9odm0vc3ZtL3N2bS5jDQo+IEBAIC0yOTI0LDkgKzI5MjQsMTQgQEAgdm9pZCBh
c21saW5rYWdlIHN2bV92bWV4aXRfaGFuZGxlcih2b2lkKQ0KPiAgICAgICAgICAgYnJlYWs7
DQo+ICAgDQo+ICAgICAgIGNhc2UgVk1FWElUX1ZNTUNBTEw6DQo+ICsgICAgICAgIGlmICgg
dmNwdV9ndWVzdG1vZGUgKQ0KPiArICAgICAgICB7DQo+ICsgICAgICAgICAgICBodm1faW5q
ZWN0X2h3X2V4Y2VwdGlvbihYODZfRVhDX1VELCBYODZfRVZFTlRfTk9fRUMpOw0KPiArICAg
ICAgICAgICAgYnJlYWs7DQo+ICsgICAgICAgIH0NCj4gKw0KPiAgICAgICAgICAgaWYgKCAo
aW5zbl9sZW4gPSBzdm1fZ2V0X2luc25fbGVuKHYsIElOU1RSX1ZNQ0FMTCkpID09IDAgKQ0K
PiAgICAgICAgICAgICAgIGJyZWFrOw0KPiAtICAgICAgICBCVUdfT04odmNwdV9ndWVzdG1v
ZGUpOw0KPiAgICAgICAgICAgVFJBQ0UoVFJDX0hWTV9WTU1DQUxMLCByZWdzLT5lYXgpOw0K
PiAgIA0KPiAgICAgICAgICAgaWYgKCBodm1faHlwZXJjYWxsKHJlZ3MpID09IEhWTV9IQ0FM
TF9jb21wbGV0ZWQgKQ0KDQpSZXZpZXdlZC1ieTogVGVkZHkgQXN0aWUgPHRlZGR5LmFzdGll
QHZhdGVzLnRlY2g+DQoNClRlZGR5DQo=

--------------f7u608qvmXJ4xJXV5WrSrmlU--

--------------sV9wHEyLqspfDtDwm1svBC6P
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmsAxu4FAwAAAAAACgkQZg+p0QLLz9Dv
3Av/XlpJk/0XFaOWtMF3XmWQwmc3QiTCQxmBCFScszMN9kHttYLAvejZ3JBnRpw6P/JjJC+UqYAc
zs8Qy7C1d48nMERqer1jIzD9w70C3xuCbBF2McGWeCEZC442knvartaNn2iFOyOS4OGZOC54Aig2
neYfYtmlSeTU1yVrYjec6r9nu/mhidqO7cx55dkwEM3DKIQXOUX16m7gqvc+0XD6cUWhcMA0BeqT
wC0edeXrpWHzQgTB5liqc0GMuiIOPfTmMcIcPL8AOUZk7MvzolnzktMps6l8rPQiugORFms+m0kP
Os2xy0Xnd49oSVNIXolImb1yGN65vWR78G79YaDIuDpO1NEIOmRF5PGcQNIrK+OWLVJaWYbQpLss
2syVzBVL7EEb4uFi8Y7oxpBd+8vXWpmt7MXiDbrEQyxvphqlSwX2H7N+nk/egWpNiVX2ND54lb+x
+wUr7DzcO52mVRVQcSoz+jT0WO+sr4WPRqNedHrY+JiXfYRzRe6ZObpxVbci
=mcZO
-----END PGP SIGNATURE-----

--------------sV9wHEyLqspfDtDwm1svBC6P--

