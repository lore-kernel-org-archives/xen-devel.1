Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E3DC44539
	for <xen-devel@archiver.kernel.org>; Wed, 22 Jul 2026 09:16:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1368247.1617701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmT3p-00044O-FU; Wed, 22 Jul 2026 09:16:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1368247.1617701; Wed, 22 Jul 2026 09:16:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmT3p-00044H-C5; Wed, 22 Jul 2026 09:16:17 +0000
Received: by outflank-mailman (input) for mailman id 1368247;
 Wed, 22 Jul 2026 09:16:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f891c6ba6000edb5@swg.vates.tech>)
 id 1wmT3n-00044B-Mk
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2026 09:16:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmT3m-00F5HR-SO
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2026 11:16:14 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f891c6ba6000edb5@swg.vates.tech>)
 id 6a608a59-2eae-0a2a0a5409dd-0a2a450882fe-14
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 11:16:14 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f891c6ba6000edb5@swg.vates.tech>)
 id 6a608a5d-f659-0a2a45080019-b9ff1c239ecd-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 11:16:14 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f891c6ba6000edb5.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 22 Jul 2026 09:16:08 +0000
Received: from [192.168.1.61] (155.223.66.37.rev.sfr.net [37.66.223.155])
 (Authenticated sender: ngoc-tu.dinh@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 26A6082138;
 Wed, 22 Jul 2026 11:16:08 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=iPH49BMAeYwH6Y+pdq8cbuLOuAMAh/HrdCOR5G3R8mU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=RMP3HUncQzxC1p/I0JuZKEZERaAheHkIJ0a29bncnDEQqav4Vc2sq/0B+VAGlZohmFt6NiR/s
 uBolYhA+729m0IlmgXw65rGBX5QtLS0EdwxpP0T6UXdiVzFuMTPjCE12OtPiOdjTVwBEEd2Bnds
 +iCYhb68Fvm8O6T7BL9c9mdMb+9Lu4jrpRK+G4l76SAaELmQu9VUyf2YnfNjscsCR8+1bcavoeR
 HLpxkypUpc9R6d49Kgyv2NC3c+p1r614wjt7sbzBY8wSI/vAYxHxu+clQyqwZiMMMzkCAOb0wBY
 xQCAXP5gRDqqco+eXx2hxKOT1SMrf0wuVHt2vKpZVCtA==
X-Zone-Loop: b88d0a23ac9c37bd47c161cbef502fe8c3bf096a81bf
x-campaign-type: default
x-transaction-id: 5b04b22b-dc4e-4036-8395-86a8c420fcd0
x-swg-uid: 01-aa54d355-1598-493a-8f5c-5bfc07328c86
X-Mailer: Sweego
Message-ID:
 <1784711769.8631fc262581453bbf619ec5b2062170.19f891c6ba6000edb5@vates.tech>
x-swg-bid: 1784711769.8631fc262581453bbf619ec5b2062170.19f891c6ba6000edb5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 22 Jul 2026 11:16:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xenstore-paths: Allow subnet prefix in IP address
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <1780912172.8631fc262581453bbf619ec5b2062170.19ea6a32f2f000701b@vates.tech>
 <681d6703-6310-4ad0-a270-b5e677ee5811@suse.com>
 <acf12262-c1ee-4989-a702-d8fa7e8659ec@suse.com>
Content-Language: en-US
From: Tu Dinh <ngoc-tu.dinh@vates.tech>
In-Reply-To: <acf12262-c1ee-4989-a702-d8fa7e8659ec@suse.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.ff1.31363d9feef829a4.19f891c68eb.e2812e0b04d73cd5=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1784711768299
X-purgate-ID: tlsNG-c1860d/1784711774-CCF4F87B-5555B1BE/0/0
X-purgate-type: clean
X-purgate-size: 3723

---=Part.ff1.31363d9feef829a4.19f891c68eb.e2812e0b04d73cd5=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 22/07/2026 10:49, J=C3=BCrgen Gro=C3=9F wrote:
> On 22=2E07=2E26 09:14, Jan Beulich wrote:
>> On 08=2E06=2E2026 11:49, Tu Dinh wrote:
>>> In the guest-reported IP address in xenstore, it's useful to know whic=
h
>>> subnet it belongs to=2E
>>>
>>> Add a specification for the IPv6 host address/prefix format specified =
by
>>> RFC 4291=2E
>>>
>>> For the IPv4 address/prefix notation, as there seems to be no equivale=
nt
>>> RFC specifying the host address/prefix format, specify it ourselves=2E
>>>
>>> Signed-off-by: Tu Dinh <ngoc-tu=2Edinh@vates=2Etech>
>>
>> Btw, even if get_maintainer=2Epl doesn't say so, it would help to Cc th=
e
>> maintainer of the component the doc for which is being modified=2E
>=20
> Indeed=2E
>=20
> I'm sharing Teddy's concerns=2E We just don't know who are potential=20
> consumers
> of those Xenstore nodes=2E I know of at least three large SUSE customers=
=20
> using
> Xen having written tooling accessing Xenstore=2E
>=20
> What about adding another node for the prefix, like
>=20
>  =C2=A0 ~/attr/vif/$DEVID/ipv4/$INDEX/prefix =3D INTEGER
>=20

Okay, I'll try adding that=2E

>=20
> Juergen
>=20
>>
>> Jan
>>
>>> --- a/docs/misc/xenstore-paths=2Epandoc
>>> +++ b/docs/misc/xenstore-paths=2Epandoc
>>> @@ -78,12 +78,12 @@ VALUES are strings and can take the following form=
s:
>>> =C2=A0 * MAC_ADDRESS -- 6 integers, in hexadecimal form, separated by =
':',
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 specifying an IEEE 802=2E3 ethernet=
 MAC address=2E
>>> -* IPV4_ADDRESS -- 4 integers, in decimal form, separated by '=2E',
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 specifying an IP version 4 address as des=
cribed
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IETF RFC 791=2E
>>> -* IPV6_ADDRESS -- Up to 8 integers, in hexadecimal form, separated
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 by ':', specifying an IP version 6 addres=
s as
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 described in IETF RFC 4291=2E
>>> +* IPV4_ADDRESS -- An IP version 4 address as specified by IETF RFC 79=
1,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 optionally appended with a "/prefix" valu=
e=20
>>> representing the
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prefix length of the host address's subne=
t, with=20
>>> "prefix"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 being a decimal integer in the range of 0=
 to 32=2E
>>> +* IPV6_ADDRESS -- An IP version 6 address or abbreviated "address/=20
>>> prefix"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 combination as specified by IETF RFC 4291=
 and RFC=20
>>> 5952=2E
>>> =C2=A0 Additional TAGS may follow as a comma separated set of the foll=
owing
>>> =C2=A0 tags enclosed in square brackets=2E
>>
>=20



-- 
Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates =
solutions

web: https://vates=2Etech
---=Part.ff1.31363d9feef829a4.19f891c68eb.e2812e0b04d73cd5=---

