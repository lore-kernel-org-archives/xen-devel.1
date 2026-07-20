Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBD4C44515
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 10:39:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366504.1616393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wllOi-0008Nh-2R; Mon, 20 Jul 2026 10:38:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366504.1616393; Mon, 20 Jul 2026 10:38:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wllOh-0008Na-W7; Mon, 20 Jul 2026 10:38:55 +0000
Received: by outflank-mailman (input) for mailman id 1366504;
 Mon, 20 Jul 2026 10:38:54 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f7f1b601a000edb5@swg.vates.tech>)
 id 1wllOg-0008NU-SF
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 10:38:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wllOg-00FV1c-8n
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 12:38:54 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f7f1b601a000edb5@swg.vates.tech>)
 id 6a5dfab5-5cb7-0a2a0a5109dd-0a2a450180b0-26
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 12:38:54 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f7f1b601a000edb5@swg.vates.tech>)
 id 6a5dfabd-5984-0a2a45010019-b9ff1c128647-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 12:38:54 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f7f1b601a000edb5.001 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 20 Jul 2026 10:38:48 +0000
Received: from [192.168.1.61] (155.223.66.37.rev.sfr.net [37.66.223.155])
 (Authenticated sender: ngoc-tu.dinh@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id B64A182A31;
 Mon, 20 Jul 2026 12:38:47 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=okqhS3ncypQscsAQfGNyz7YH94LWDDUZ4XA86uE4s6o=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=pes6mzaUwGJpj9MUzCg3YrUevfDTSw0XuGSyxJFYNBGDnbWlhh08Qfr9tom2yOoqoNU6Hkkhd
 vRaHhHFr73pWIzSAJqBGL9wbKMP7Lkq3Mb2ID/TGU9WmkAfH4s+RW9ZEn9d+7h8UyAZTV9iwAIc
 vgmlXZdTJQAjWiiUSxsbOXQ2ckJqEJade2bT72aoWi5uNHkrCM21mTx/34Kqgw7ogZv9G1Z47di
 GKEIEww7XwQHyota9+zY/FK8rWxbn0vTLc5quXFaI22KB5u65ZnXZE0D3OkgFYAVdqW6Q7+4pG8
 2KkppLPeTFDFJCsgZyHT9zvBmNfch1LKynmC5tWTDkGQ==
X-Zone-Loop: ee1620ba6c6df00591ae9c2b43a20dff21abe9c49c30
x-campaign-type: default
x-transaction-id: c54e6ba5-aa51-49f7-bad9-b5371eccb6a6
x-swg-uid: 01-571445ba-4ecc-4ad9-9c6c-bc4f6393fdee
X-Mailer: Sweego
Message-ID:
 <1784543928.8631fc262581453bbf619ec5b2062170.19f7f1b601a000edb5@vates.tech>
x-swg-bid: 1784543928.8631fc262581453bbf619ec5b2062170.19f7f1b601a000edb5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 20 Jul 2026 12:38:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] {libxl,xl}: Add xl trigger debug
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <1784539531.8631fc262581453bbf619ec5b2062170.19f7ed8472c000edb5@vates.tech>
 <1784539672.8631fc262581453bbf619ec5b2062170.19f7eda70d8000edb5@vates.tech>
 <2b954e31-0551-4706-ab56-f24a8380b527@suse.com>
Content-Language: en-US
From: Tu Dinh <ngoc-tu.dinh@vates.tech>
In-Reply-To: <2b954e31-0551-4706-ab56-f24a8380b527@suse.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.db1.e8ed7a4bb37c1131.19f7f1b5e01.6b326f6231e2d8c3=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1784543927809
X-purgate-ID: tlsNG-d62444/1784543934-BE867757-483945B9/0/0
X-purgate-type: clean
X-purgate-size: 2371

---=Part.db1.e8ed7a4bb37c1131.19f7f1b5e01.6b326f6231e2d8c3=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 20/07/2026 12:29, J=C3=BCrgen Gro=C3=9F wrote:
> On 20=2E07=2E26 11:27, Tu Dinh wrote:
>> Use XEN_DOMCTL_SENDTRIGGER_DEBUG to allow printing diagnostics
>> information of a specific domain=2E
>>
>> Signed-off-by: Tu Dinh <ngoc-tu=2Edinh@vates=2Etech>
>> ---
>> =C2=A0 tools/libs/light/libxl_domain=2Ec=C2=A0 | 4 ++++
>> =C2=A0 tools/libs/light/libxl_types=2Eidl | 1 +
>> =C2=A0 tools/xl/xl_cmdtable=2Ec=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 2 +-
>> =C2=A0 3 files changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/libs/light/libxl_domain=2Ec b/tools/libs/light/=20
>> libxl_domain=2Ec
>> index 37fcd92871=2E=2E2d8290dbfa 100644
>> --- a/tools/libs/light/libxl_domain=2Ec
>> +++ b/tools/libs/light/libxl_domain=2Ec
>> @@ -2190,6 +2190,10 @@ int libxl_send_trigger(libxl_ctx *ctx, uint32_t=
=20
>> domid,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case LIBXL_TRIGGER_S3RESUME:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 domain_s3_resume=
(ao, egc, domid); /* must be last */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return AO_INPROG=
RESS;
>> +=C2=A0=C2=A0=C2=A0 case LIBXL_TRIGGER_DEBUG:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D xc_domain_send_trigg=
er(ctx->xch, domid,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XEN_DOMC=
TL_SENDTRIGGER_DEBUG,=20
>> vcpuid);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>=20
> You are sending VIRQ_DEBUG only to one vcpu=2E Wouldn't it make sense to=
 add
> the capability to send it to all vcpus of a domain?
>=20
>=20
> Juergen

It's a current limitation of xl trigger that it can only send triggers=20
to 1 vcpu at a time=2E Perhaps a special vcpuid value could be defined for=
=20
this purpose, then xl trigger can use this value when "all" is specified=
=20
on the command line?


-- 
Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates =
solutions

web: https://vates=2Etech
---=Part.db1.e8ed7a4bb37c1131.19f7f1b5e01.6b326f6231e2d8c3=---

