Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE56606A31A
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 12:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=KZ+bAEqD
Received: from list by lists.xenproject.org with outflank-mailman.1464626.1675461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMPhH-0004AU-Kw; Thu, 29 Oct 2026 12:57:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464626.1675461; Thu, 29 Oct 2026 12:57:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMPhH-0004AN-Hp; Thu, 29 Oct 2026 12:57:35 +0000
Received: by outflank-mailman (input) for mailman id 1464626;
 Thu, 29 Oct 2026 12:57:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xMPhG-0004AH-I6
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 12:57:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMPhF-00DZEH-Mk
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 13:57:33 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a187bca9f9000f79f@swg.vates.tech>)
 id 6ae342b5-e002-0a2a0a5209dd-0a2a4506e00e-22
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 13:57:33 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a187bca9f9000f79f@swg.vates.tech>)
 id 6ae342bd-195a-0a2a45060019-b9ff1c23a6ff-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 13:57:33 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a187bca9f9000f79f.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 29 Oct 2026 12:57:30 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id CDB848320C;
 Thu, 29 Oct 2026 13:57:29 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=+70eyE3X6IsSBex8TdzPcAkuLluLxz5+DRwG0WXzX+I=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=KZ+bAEqD75pOYtlJjAy3GTwGDd1j0rv+Yxn17fow9O1y2MmeE7Wse+GLIy/FeQI4hroEG9lsj
 E5DfnRUCbTgTlPG0/PRRJAL74dQN8MyFDdFMLtBz1SfZYtcqw6/PiVsLesxwj1LD8bhncR06tK4
 hAQISt9doc3G7TrMh/xIlrr7vijtiBqohQUBLD4Veab1hHiHMNMOkOu9XhrXNc+WAfvDP5hZb1H
 f5zzX+2Au7DlukNpB7dsuUyxYNuJiyJiodKmQ9DfAd8j75X2M157PvSgukTXRtvNxN5rqFt92a1
 kTOOLoM7AfRligerTDUQp19DBhxSoysFVaVeBXTqetIA==
X-Zone-Loop: 54ae748d6f19ceba5a5ee13a9de816fb145ea567b517
x-campaign-type: default
x-transaction-id: ff76729d-898d-4710-9284-4c9e0718f428
x-swg-uid: 01-84da4322-ba3c-41f3-9e97-869232345588
X-Mailer: Sweego
Message-ID:
 <1793278650.8631fc262581453bbf619ec5b2062170.1a187bca9f9000f79f@vates.tech>
x-swg-bid: 1793278650.8631fc262581453bbf619ec5b2062170.1a187bca9f9000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Thu, 29 Oct 2026 13:57:29 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/vlapic: Don't change ICR on x2APIC SELF_IPI write
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <1793023450.8631fc262581453bbf619ec5b2062170.1a178869cb4000f79f@vates.tech>
 <a1099c1c-8ceb-4275-b7ef-b6c541624c8a@suse.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <a1099c1c-8ceb-4275-b7ef-b6c541624c8a@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cRIqAiRTBpkpGa5LXnR00jHG"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793278649937
X-purgate-ID: tlsNG-16d1c6/1793278653-1EAC277B-D936BDBD/10/78276251493
X-purgate-type: spam
X-purgate-size: 8745
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------cRIqAiRTBpkpGa5LXnR00jHG
Content-Type: multipart/mixed; boundary="------------8nVVyAKIErrmnQ00ViOV5uCb";
 protected-headers="v1"; hp="clear"
Message-ID: <c80614ac-e1e7-4563-861b-4da166694e8a@vates.tech>
Date: Thu, 29 Oct 2026 13:57:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/vlapic: Don't change ICR on x2APIC SELF_IPI write
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <1793023450.8631fc262581453bbf619ec5b2062170.1a178869cb4000f79f@vates.tech>
 <a1099c1c-8ceb-4275-b7ef-b6c541624c8a@suse.com>
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
In-Reply-To: <a1099c1c-8ceb-4275-b7ef-b6c541624c8a@suse.com>

--------------8nVVyAKIErrmnQ00ViOV5uCb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMjgvMTAvMjAyNiDDoCAxMjoxNiwgSmFuIEJldWxpY2ggYSDDqWNyaXTCoDoNCj4gT24g
MjYuMTAuMjAyNiAxNTowMywgVGVkZHkgQXN0aWUgd3JvdGU6DQo+PiBUaGUgSW50ZWwgU0RN
IChWb2wgM0EtMTMuMTIuMTEsIEp1bmUgMjAyNikgc2F5cw0KPj4NCj4+PiBUaGUgc2VtYW50
aWNzIG9mIHNlbmRpbmcgYSBzZWxmLUlQSSB2aWEgdGhlIFNFTEYgSVBJIHJlZ2lzdGVyDQo+
Pj4gYXJlIGlkZW50aWNhbCB0byBzZW5kaW5nIGEgc2VsZiB0YXJnZXRlZCBlZGdlIHRyaWdn
ZXJlZCBmaXhlZA0KPj4+IGludGVycnVwdCB3aXRoIHRoZSBzcGVjaWZpZWQgdmVjdG9yLg0K
Pj4NCj4+IEhvd2V2ZXIsIHRoaXMgZG9lc24ndCByZXF1aXJlIGFsdGVyaW5nIHRoZSBJQ1Ig
cmVnaXN0ZXIuDQo+PiBPbiBtb3N0IEludGVsIHByb2Nlc3NvcnMgKGF0IGxlYXN0IENvcmUv
UC1Db3JlKSwgaXQgZG9lcyBhbHRlciBJQ1IsDQo+PiBidXQgaXQncyBub3QgdGhlIGNhc2Ug
b24gQU1EIGFuZCBBdG9tL0UtQ29yZSBvbmVzLCBhbmQgQVBJQ3YgU2VsZi1JUEkNCj4+IGFw
cGVhcnMgdG8gZm9sbG93IGEgc2ltaWxhciBiZWhhdmlvci4NCj4+DQo+PiBGb3IgY29uc2lz
dGVuY3ksIGFkanVzdCB0aGUgWGVuIGJlaGF2aW9yIHRvIHNlbmQgdGhlIFNlbGYtSVBJDQo+
PiBkaXJlY3RseSBpbnN0ZWFkIG9mIGVtdWxhdGluZyBpdCBieSBtb2RpZnlpbmcgSUNSIHJl
Z2lzdGVyLg0KPj4NCj4+IEl0IGFsc28gY2xhcmlmeSB0aGUgbG9naWMuDQo+Pg0KPj4gQXNz
aXN0ZWQtYnk6IENsYXVkZSBGYWJsZSA1LjENCj4+IFNpZ25lZC1vZmYtYnk6IFRlZGR5IEFz
dGllIDx0ZWRkeS5hc3RpZUB2YXRlcy50ZWNoPg0KPiANCj4gUmV2aWV3ZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gDQo+IEhvd2V2ZXIsIC4uLg0KPiANCj4+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdmxhcGljLmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9odm0vdmxhcGljLmMNCj4+IEBAIC05NzAsMTEgKzk3MCwxMyBAQCBpbnQgdmxhcGljX2Fw
aWN2X3dyaXRlKHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBpbnQgb2Zmc2V0KQ0KPj4gICAN
Cj4+ICAgICAgIGlmICggdmxhcGljX3gyYXBpY19tb2RlKHZsYXBpYykgKQ0KPj4gICAgICAg
ew0KPj4gLSAgICAgICAgaWYgKCBvZmZzZXQgIT0gQVBJQ19TRUxGX0lQSSApDQo+PiAtICAg
ICAgICAgICAgcmV0dXJuIFg4NkVNVUxfVU5IQU5ETEVBQkxFOw0KPiANCj4gLi4uIHdoeSB0
aGUgZXh0cmEgY2h1cm4gaGVyZT8gVGhlIG92ZXJhbGwgaHVuayBoZXJlIC4uLg0KPiANCj4+
ICsgICAgICAgIGlmICggb2Zmc2V0ID09IEFQSUNfU0VMRl9JUEkgKQ0KPj4gKyAgICAgICAg
ew0KPj4gKyAgICAgICAgICAgIHZsYXBpY19pcGkodmxhcGljLCBBUElDX0RFU1RfU0VMRiB8
ICh2YWwgJiBBUElDX1ZFQ1RPUl9NQVNLKSwgMCk7DQo+PiArICAgICAgICAgICAgcmV0dXJu
IFg4NkVNVUxfT0tBWTsNCj4+ICsgICAgICAgIH0NCj4+ICAgDQo+PiAtICAgICAgICBvZmZz
ZXQgPSBBUElDX0lDUjsNCj4+IC0gICAgICAgIHZhbCA9IEFQSUNfREVTVF9TRUxGIHwgKHZh
bCAmIEFQSUNfVkVDVE9SX01BU0spOw0KPj4gKyAgICAgICAgcmV0dXJuIFg4NkVNVUxfVU5I
QU5ETEVBQkxFOw0KPj4gICAgICAgfQ0KPj4gICANCj4+ICAgICAgIHZsYXBpY19yZWdfd3Jp
dGUodiwgb2Zmc2V0LCB2YWwpOw0KPiANCj4gLi4uIGNvdWxkIGJlDQo+IA0KPiBAQCAtOTcz
LDggKzk3Myw4IEBAIGludCB2bGFwaWNfYXBpY3Zfd3JpdGUoc3RydWN0IHZjcHUgKnYsIHVu
c2lnbmVkIGludCBvZmZzZXQpDQo+ICAgICAgICAgICBpZiAoIG9mZnNldCAhPSBBUElDX1NF
TEZfSVBJICkNCj4gICAgICAgICAgICAgICByZXR1cm4gWDg2RU1VTF9VTkhBTkRMRUFCTEU7
DQo+ICAgDQo+IC0gICAgICAgIG9mZnNldCA9IEFQSUNfSUNSOw0KPiAtICAgICAgICB2YWwg
PSBBUElDX0RFU1RfU0VMRiB8ICh2YWwgJiBBUElDX1ZFQ1RPUl9NQVNLKTsNCj4gKyAgICAg
ICAgdmxhcGljX2lwaSh2bGFwaWMsIEFQSUNfREVTVF9TRUxGIHwgKHZhbCAmIEFQSUNfVkVD
VE9SX01BU0spLCAwKTsNCj4gKyAgICAgICAgcmV0dXJuIFg4NkVNVUxfT0tBWTsNCj4gICAg
ICAgfQ0KPiAgIA0KPiAgICAgICB2bGFwaWNfcmVnX3dyaXRlKHYsIG9mZnNldCwgdmFsKTsN
Cj4gDQo+IE11Y2ggY2xvc2VyIHRvIC4uLg0KPiANCj4+IEBAIC0xMDUwLDkgKzEwNTIsOCBA
QCBpbnQgZ3Vlc3Rfd3Jtc3JfeDJhcGljKHN0cnVjdCB2Y3B1ICp2LCB1aW50MzJfdCBtc3Is
IHVpbnQ2NF90IHZhbCkNCj4+ICAgICAgIGNhc2UgQVBJQ19TRUxGX0lQSToNCj4+ICAgICAg
ICAgICBpZiAoIHZhbCAmIH5BUElDX1ZFQ1RPUl9NQVNLICkNCj4+ICAgICAgICAgICAgICAg
cmV0dXJuIFg4NkVNVUxfRVhDRVBUSU9OOw0KPj4gLSAgICAgICAgb2Zmc2V0ID0gQVBJQ19J
Q1I7DQo+PiAtICAgICAgICB2YWwgPSBBUElDX0RFU1RfU0VMRiB8ICh2YWwgJiBBUElDX1ZF
Q1RPUl9NQVNLKTsNCj4+IC0gICAgICAgIGJyZWFrOw0KPj4gKyAgICAgICAgdmxhcGljX2lw
aSh2bGFwaWMsIEFQSUNfREVTVF9TRUxGIHwgKHZhbCAmIEFQSUNfVkVDVE9SX01BU0spLCAw
KTsNCj4+ICsgICAgICAgIHJldHVybiBYODZFTVVMX09LQVk7DQo+PiAgIA0KPj4gICAgICAg
Y2FzZSBBUElDX0VPSToNCj4+ICAgICAgIGNhc2UgQVBJQ19FU1I6DQo+IA0KPiAuLi4gdGhp
cyBodW5rIHRoZW4uIChJIG1heSB0YWtlIHRoZSBsaWJlcnR5IG9mIG1ha2luZyB0aGF0IGFk
anVzdG1lbnQgd2hpbGUNCj4gY29tbWl0dGluZywgdW5sZXNzIHlvdSBwcm92aWRlIGEgcmVh
c29uIGZvciB0aGUgYmlnZ2VyIGNoYW5nZS4pDQo+IA0KDQpObyBzdHJvbmcgb3BpbmlvbiBv
biBpdCBub3Igc3BlY2lmaWMgcmVhc29uLg0KDQpUbyBtZSwgZ2l2ZW4gdGhhdCB3ZSBkb24n
dCB1cGRhdGUgSUNSIGFueW1vcmUgYW5kIG5vIGxvbmdlciBuZWVkIHRvIA0KZmFsbHRocm91
Z2ggdGhlIHJlc3Qgb2YgdGhlIHJlZ2lzdGVyIHdyaXRlIGxvZ2ljLCB3ZSBjYW4gaW52ZXJ0
IHRoZSANCmNoZWNrIHRvIGhpZ2hsaWdodCB0aGUgU0VMRl9JUEkgY2FzZS4NCg0KPiBKYW4N
Cg0KVGVkZHkNCg==

--------------8nVVyAKIErrmnQ00ViOV5uCb--

--------------cRIqAiRTBpkpGa5LXnR00jHG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmrjQrkFAwAAAAAACgkQZg+p0QLLz9AT
gQv/emNE3RRH3EsGP3DrrR5JxeBWggY5l030K/AorXS4BiMU8S5r3W0ELhK+9LtAMa/3htI8y4PO
EPEFCgV0F/XCzWWegzDVuGiAjF+dp/42l529N7Gkp+6hfx50WKY95iitlEa8X64jXqoKAIDhTPob
/j67F/+vFQ+xzKn/mFIKinMmbO9rIGtg2nACd2+4ufyTMngh4E8Vpzw6VVjgDMO8GR2/fix0uCMp
WwH0goDETEvKhm/mGXFCUACKgW7xkl4YaBQRpiHE59OjR35XebFba2NLknhDjFJvxHE0c+aEF/7q
XGA99LuUJOOnR3sW6UUM3rqZI2vN6k6owuz8VOMOfHD1z/VruYTE+rtbOzsssg/So3GqNYg9U1Gj
fHMhd3HC+0ng/ISKUjm/vo0ZNItfazU4VJl/TM2WYClHbGYd3JtvkEnrurnesGErCbBWRtsvsOMI
T+dy0ljysDB66N3OSsaMdgrGVvH3DjJSkzzhl7UJyenU8FMRryvfdDq6nYSD
=UiBj
-----END PGP SIGNATURE-----

--------------cRIqAiRTBpkpGa5LXnR00jHG--

