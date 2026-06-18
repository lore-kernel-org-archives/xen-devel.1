Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40AACD98ED
	for <xen-devel@archiver.kernel.org>; Thu, 18 Jun 2026 09:57:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1340889.1601564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wa9Ud-0002ZL-4C; Thu, 18 Jun 2026 09:57:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340889.1601564; Thu, 18 Jun 2026 09:57:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wa9Uc-0002ZD-VV; Thu, 18 Jun 2026 09:57:02 +0000
Received: by outflank-mailman (input) for mailman id 1340889;
 Thu, 18 Jun 2026 09:57:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19eda2989b1000701b@swg.vates.tech>)
 id 1wa9Ua-0002Z7-P4
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 09:57:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wa9UZ-00DjGG-Hw
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 11:56:59 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19eda2989b1000701b@swg.vates.tech>)
 id 6a33c0e2-e002-0a2a0a5209dd-0a2a450bce3c-34
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 11:56:59 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19eda2989b1000701b@swg.vates.tech>)
 id 6a33c0ea-212f-0a2a450b0019-b9ff1c1291db-3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 11:56:58 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19eda2989b1000701b.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 09:56:55 +0000
Received: from [192.168.1.200] (lfbn-mon-1-1130-120.w90-48.abo.wanadoo.fr
 [90.48.233.120]) (Authenticated sender: thierry.escande)
 by mail2.vates.fr (Postfix) with ESMTPSA id 3108886352;
 Thu, 18 Jun 2026 11:56:55 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=1oSqQO92kVJaL1D7ZjgX8J1hSAlMu0qldiz8mHRpxlI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=jmX9iue8qRCqIKevP8n4kGEc/gxw2ZQR/p3Y4UtMNxgh2S1KDeEPK72GbSEARmE2Y8QdfWMz+
 y5tmBEfy0Pblr1htkSv+DgxJUzUaWulJ3obKibUJT3haizYRMWVKTZvMnWHscQuby4riZVHO+Xm
 eqcd2cewCFfRidtF/vKb/hEA47lyCQsWC3NeeuUSmFnSg+JSWWbmAYrLCvBJNebRR5dntxgSVKa
 VHNjHt81VTF9CNGZyCmbwNrLQbxCBKiMuoCalIWNs+x3M77ihWYsDzBT2iFvrhBuE4HXsvkQutz
 2I1zTb2ukVHwmosw57aydCLrt1D9DztQR5wTzYfOwxEg==
X-Zone-Loop: bb7ca66fc1a71218dc37167b255668c160072ec9397f
x-campaign-type: default
x-transaction-id: 3a0ff052-8a00-415d-8cc6-35dea044b22c
x-swg-uid: 01-c766a112-5b37-4ec5-ac0e-b1f1271405c8
X-Mailer: Sweego
Message-ID:
 <1781776615.8631fc262581453bbf619ec5b2062170.19eda2989b1000701b@vates.tech>
x-swg-bid: 1781776615.8631fc262581453bbf619ec5b2062170.19eda2989b1000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Thu, 18 Jun 2026 11:56:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/17] libacpi: new DSDT ACPI table for Q35
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Alexey Gerasimenko <x1917x@gmail.com>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-3-thierry.escande@vates.tech>
 <afCJTdlBPPyWEejk@macbook.local>
 <1781258461.8631fc262581453bbf619ec5b2062170.19ebb4721b0000701b@vates.tech>
 <aiwIgrerH933SPbC@macbook.local>
Content-Language: en-US
From: Thierry Escande <thierry.escande@vates.tech>
In-Reply-To: <aiwIgrerH933SPbC@macbook.local>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.627.e81b99b46dedd7b2.19eda29879e.f5988e80fdcc8b6d=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781776615327
X-purgate-ID: tlsNG-42698a/1781776619-21B86F3B-B0B5547C/0/0
X-purgate-type: clean
X-purgate-size: 1231

---=Part.627.e81b99b46dedd7b2.19eda29879e.f5988e80fdcc8b6d=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 6/12/26 15:24, Roger Pau Monn=C3=A9 wrote:
> On Fri, Jun 12, 2026 at 12:01:00PM +0200, Thierry Escande wrote:
>>
>> On 4/28/26 12:17, Roger Pau Monn=C3=A9 wrote:
>>
>> Well, the iasl compiler doesn't support the defined() directive (at
>> least the latest Debian version from 2025) so I'll rather use something
>> like:
>>
>> #define MACHINE_TYPE MACHINE_TYPE_XXX
>>
>> #if MACHINE_TYPE =3D=3D MACHINE_TYPE_XXX
>>  =2E=2E=2E
>> #elif MACHINE_TYPE =3D=3D MACHINE_TYPE_YYY
>>  =2E=2E=2E
>> #endif
>=20
> Oh, I see, I wasn't aware of it not supporting defined() when #ifdef
> is available=2E  Kind of weird to support one but not the other=2E
>=20

And there's more fun: The iasl compiler complains about multiline
comments when enclosed within #if #endif directives=2E Sometimes it's a
warning about nested comments, sometimes it produces errors=2E

Regards,



-- 
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vat=
es solutions

web: https://vates=2Etech
---=Part.627.e81b99b46dedd7b2.19eda29879e.f5988e80fdcc8b6d=---

