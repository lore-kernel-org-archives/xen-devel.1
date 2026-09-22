Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C525C982F1
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 10:57:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428629.1651519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8yBn-0006n5-Ng; Tue, 22 Sep 2026 10:57:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428629.1651519; Tue, 22 Sep 2026 10:57:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8yBn-0006my-Kn; Tue, 22 Sep 2026 10:57:31 +0000
Received: by outflank-mailman (input) for mailman id 1428629;
 Tue, 22 Sep 2026 10:57:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1x8yBm-0006mo-MR
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 10:57:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8yBm-00GxKi-3E
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 12:57:30 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ab25f07-e002-0a2a0a5209dd-0a2a4505e312-32
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 12:57:30 +0200
Received: from [52.101.70.99]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ab25f19-4cb1-0a2a45050019-34654663423e-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 12:57:30 +0200
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com (2603:10a6:803:113::29)
 by DB3PR03MB10189.eurprd03.prod.outlook.com (2603:10a6:10:43c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 10:57:21 +0000
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48]) by VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48%3]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 10:57:21 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QYt6ukm3+hA4xe+h2s3UNMypxsI2Hx80Xju2eR/E2st0urD7ubWmv8EqcKkPrkdsvD9oq5Qx0KQ9FrKtYFhxbkmLYS2UAFIQsgoid3GZTBAmIhytUPdvAPVOJPAfSNJUavO47wBVGlDqxTS3GB+L7qTxutb7LPIPJJp0nuUUhCNDDlMMaCLu+MOG0ikTpvwlSc558vD6b+xUGIkbku1JdiKDtRgh33i+yCJLuRx8bRyhoXVvkHXEZWHNasp5AnrUkbMErpTX6EkgqY+sRx+cC8jL5OeKWBGa39k6k62l8a9K+AgPNH15AEaMv9o+77ad3hJj/MHiSu1kpClfzgXoYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uaOefTgiUQBwZzauMDtdjPiXvVgb18Z1289qApiz8uk=;
 b=vXpvtHkAl4tXYe1j11kG8yuT3eIX5Exkj+twNOGO7NCMLRfMD+vYRbmlsq0eqknTZj0oqMZwKv9e0q82rZRelZSWxTlg6kYGHX33YnL2dkzJN2NHAbt9Hz7bXHhQxykNdxu+NEBrsaDmZVXGF2KCAmRAUWzrXA7UrYD80vAT+/6Cb8Sh5KuPg+mimvzMN2NZlGOgvrIVarGOeL5uTcS995tHLzlS1w1AATb+ZEpHhBNfsxejsm+PR2K0Ms/uHEruITJmFcYZ0XJpPlGlW3JownmiRP1xMtmnCcd3zIRxttaBfyjMPBNfHsZEJvfol40zz8JEOoJcf76wNONFE69TPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uaOefTgiUQBwZzauMDtdjPiXvVgb18Z1289qApiz8uk=;
 b=rRv5sEruEokLFBaSh5oLrSTtFe/9pYq9M0VLAHPtCs4F8ktme1Jy9PjC/fmcvf6XAUTgJ4UPjtOqbwpvH3V7qQmxXtASUf2hE4v7kwa6TdYrFqKJ4ltoQ+pE9GhmjIsFtBWm+dHM6KAbRlJhgx/TTW49H8sLq1xD9D0kwaY6zfziSU5UP6YhKZeli9+7/rzGlKrejf50SeeAgrCvPkxa6at4MYRMruDJ1OljuZfA1lcyGus6HvniHyR0nAVZhEwoWVcAmLg9WUgNUS/orty+c+zhuHmoAdFVwVHWzpCUaLZYDy9TYgHj7jf7K9N40PgxZFzgujc4wjTyfUAHw8bBCA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Nicola
 Vetrini <nicola.vetrini@bugseng.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger@xenproject.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: Re: [PATCH 09/14] ACPI: address a Misra rule 11.8 violation in Arm
 code
Thread-Topic: [PATCH 09/14] ACPI: address a Misra rule 11.8 violation in Arm
 code
Thread-Index: AQHdOqUePUfY0zBPU0K0F/hx5odMHA==
Date: Tue, 22 Sep 2026 10:57:21 +0000
Message-ID: <87y0ct5zan.fsf@epam.com>
References: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
	<f6362f01-0057-476e-ba7b-b0bd8154c86e@suse.com>	<87qzim6p5i.fsf@epam.com>
	<8fd025af-f429-488e-9977-aec3fea2e78b@suse.com>
In-Reply-To: <8fd025af-f429-488e-9977-aec3fea2e78b@suse.com> (Jan Beulich's
	message of "Tue, 22 Sep 2026 08:47:48 +0200")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR03MB6078:EE_|DB3PR03MB10189:EE_
x-ms-office365-filtering-correlation-id: f4e3107a-cd95-4bf9-12ff-08df18984717
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|1800799024|376014|7416014|23010399003|366016|38070700021|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 RfqDIyvYGD5uNf4IqQUaeiWOWdvwqrBUM3XvWsh9JfK+NQGPJ+gX/OlFBHGBoYXcpQezUZHvxFBC852OCGQIR7vi/Pb+u9segtLoVzJ/LLyLMY7Ybc7BpTmVf3mppVb2sO9Q8rRKxOztHaP58+YBmUt4AFEQ96DZWCVH6pdNTDEL19RbTvUVl+2yKiba0Zah9iCr3hHfxinPR7mo+nUBaNlGrzVG7sTEmJRDIG1ToMI35FDhvx08hzMgS5rnn15zdKJj70dJlJCi6vDBgmjQ0L8w0EV3IxOPquSKvCrUK5xEoifC2Y29w3OEYOaImf5QHg1DIZfYTu/Rdt6k+ZHsBoi1C9lEKaWH43JudaEbebSE+P/bwc0sl0afab1Ln8+5E7xnSOeWrv0o+wZB/ecPGkAOyU21aZHHZoHStnxPzUqxbmPQzqra1QfaeKLqRwtBh91Gk6nxvS+nggmOVZeDhRgdfmwMY28tpMP4VT0ZcTufWp+9pPeUcpjQofIjqI6ZDbYlRk4d3wbLI5VLZ8tSlv8j1RvnFpwmz1WkbZeAXkVinjwg1ioYrc3huRnxDHu9LrotxmwIlzFU1+sK6YvhNPdWRYxBBwADuj4E9bnLvYBRxLC/G27cHUdjv043It2czmMdy06gC27pfyOKB1pf29YM/lqR9qg23+C/YEkOeM7x0FZhYfGG9ZDLEgXRjrNFwJ1jjFMnO99keAVnXUCWKwKQQvKYvJ5hLtKt/6w2KY0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR03MB6078.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(1800799024)(376014)(7416014)(23010399003)(366016)(38070700021)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?AfTBI+VV/scDJLElWdKL81+l8zYX1kpleurUfflmt/Sq64S/pYMFw/FdEk?=
 =?iso-8859-1?Q?CSc+3KkPmxKTSPR3WDOZbcqHZL4+2JQ26ChAfNITFAF6fhGuC0pS9bIUlO?=
 =?iso-8859-1?Q?9Y2h+0BixBcUiROJ+OwHILDvxLW1HmeiIXcqzbsyCW3Ee2kc3OeG4ve3M3?=
 =?iso-8859-1?Q?u7yKdjJTYXZZCmGJ1Pvu1J+FASdg1Pol20LQEJmEJvtval8i0w2VgwYxW0?=
 =?iso-8859-1?Q?IF3s7Xfy86Ru5xs829R3/0QhBZUqOvaIKokHnGO4ACVH1rmlJwnpDeqNYf?=
 =?iso-8859-1?Q?cLbSIyfQjBElyge3wBNpaw6rqbCkNh0eMWiB2AkB0iTeI2pu6QMhLtairZ?=
 =?iso-8859-1?Q?0RZHEOJjCGfjn6BBUH8xwNP8eeIVe4WlAlB95Erk4Q5iE9ejI17b7Gfruk?=
 =?iso-8859-1?Q?GlFFMSGoZKjPDKu1uZjypkP8tjr4zvzbRzewHxax3D3pmib4yL2FQZH5p0?=
 =?iso-8859-1?Q?6f7QMCh1faolk+qW7olBR7GDKBsWxHpLpxUvVnxjxz/dquzpLghONIuX3v?=
 =?iso-8859-1?Q?OgZDzZBHAJK2GFQvm+ajdAdpuoNm+m5MNJCuQbb9fu/LecFrNVyXmC+rPN?=
 =?iso-8859-1?Q?B4zKUAmtOZw5gnKDLkF3y4euo72f9PfjRIQVfLqAq2auxh6l9UIJ9EUVHC?=
 =?iso-8859-1?Q?Fabv3DXDTeAzQKtmFHPor4k1yegsQzTraYGE+fpzm8VMTDGAMDKF//Igdl?=
 =?iso-8859-1?Q?GIif+zxICnbQWKXRP9lvNV/zs6s96vte5TToFN1GbNOlbH6Z4kk3eCRQ//?=
 =?iso-8859-1?Q?vtJi+nDE7gso85f7vg1MjtE3YnvRLJ0FnSSqzyplDEUNW23si8Lx2yIuoH?=
 =?iso-8859-1?Q?169NIUgzYNgV2DBOCCDhdrUy2nT2nIMuJvGAkDC04D++ytjrGcWP48dGVM?=
 =?iso-8859-1?Q?S8A5gZdl6yigt9LPLH8xwQzTzkyCw4UW4yvc9BL6TiJ9sHT3EE+7iQJ+1s?=
 =?iso-8859-1?Q?MYuHalvGLhI9MFO1JGDuupKRgBJcpqZVPBN8sRGREksYG3/Bq0yT9qsvEv?=
 =?iso-8859-1?Q?U1BrI+JHfQiN4dbhtLy5lTNX0W3tgiVIN4eGH7Q3nkxD6WxFo1ML/eVkqp?=
 =?iso-8859-1?Q?1bwsrrlBRc4nu9Uup8zqUi1iPYhPp+B1mLYag3P2uC2ZwCEl742XeVBlSz?=
 =?iso-8859-1?Q?vXdvbyvwkl2VU7uNg9cKhC5XP0ChHlMHJ9ghnDnOY3ZCbOmXLgPIaLB2nN?=
 =?iso-8859-1?Q?3N/Y9P5pNIailewc/4f3yisSmUiW2+/XvOuFhcSbMQMmLV8hodTBnCtqiI?=
 =?iso-8859-1?Q?8P9R5HwBTDTcunp8LF9wBCo3Kaw+97eI1ROQcnLi/bBf1z1YiNMSUAzH64?=
 =?iso-8859-1?Q?5kRRvuAX3hNwft60eQ727inedngW+erMMVjgT/01bYqCK9Fi6bYJmVtr+E?=
 =?iso-8859-1?Q?/a1799V/ywZjvdk4eUqy46O1JcQ7hVptZ3QbKrKmWk6gSil4EwM39aV8vk?=
 =?iso-8859-1?Q?menhjMm5acjUH/m5ayDfXyorwg6vBynxGjddRYzs7LF96mWKuc44zbp1xb?=
 =?iso-8859-1?Q?2fhruFfSqfcmAbZmpTEF6YuJMrE/bflXD1VEV8BHcMibabwFtpAwbSqZXl?=
 =?iso-8859-1?Q?Wt5WULF4s2ffJQ7askwH/K0/Di3jH0a1SkBAiU1badK4oIDWVtG9ZfX14F?=
 =?iso-8859-1?Q?J1DToH5GbDpd+stXINGgC6g1mHRmMH00qEbeUwgCDrCSG8UHubbJ1ty0/i?=
 =?iso-8859-1?Q?r2+7aQGMxKCHTpV8R3iw97yLPfnEv2XDRbX+y8flYVnaeEskrt93RQ1iH6?=
 =?iso-8859-1?Q?wkmSNSPXOzeQD54UWHTmjQ0Q2ySG3I3Y2cO6kLUzHj9IQc+9tbetQn2lq1?=
 =?iso-8859-1?Q?YSvIN0VQ282V0nKlm7pkxhH3BFJAysM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6078.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4e3107a-cd95-4bf9-12ff-08df18984717
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 10:57:21.6163
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 20iVXIVqG9yEA7aWAwm7k/yx7PpX9GIQ36FOcUT1i44qFuWQ8mV5C1G2H9OAYoFYyKLArNDdAwep2BGlSO/E0RWAbkxryufVnSVpjnEOCac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR03MB10189
X-purgate-ID: tlsNG-c201ff/1790074650-716AD2A1-4CDBC1E8/0/0
X-purgate-type: clean
X-purgate-size: 1642

Hi Jan,

Jan Beulich <jbeulich@suse.com> writes:

> On 22.09.2026 03:38, Volodymyr Babchuk wrote:
>> Jan Beulich <jbeulich@suse.com> writes:
>>> Outside of drivers/acpi/tables/ (which is excluded from Eclair reportin=
g
>>> for dubious reasons), arch/arm/acpi/domain_build.c is the only user of
>>> ACPI_COMPARE_NAME(). Make the macro const correct, at the expense of
>>> introducing a "const" variant of ACPI_CAST_PTR(), and at the expense of
>>=20
>> I think you can avoid adding ACPI_CAST_PTR() by providing a const
>> type. Like this:
>>=20
>> +#define ACPI_COMPARE_NAME(a, b)         (*ACPI_CAST_PTR (const u32, a) =
=3D=3D \
>> +                                         *ACPI_CAST_PTR (const u32, b))
>
> I don't think so. You did notice ...
>
>>> --- a/xen/include/acpi/acmacros.h
>>> +++ b/xen/include/acpi/acmacros.h
>>> @@ -103,6 +103,7 @@
>>>   * Pointer manipulation
>>>   */
>>>  #define ACPI_CAST_PTR(t, p)             ((t *) (acpi_uintptr_t) (p))
>>> +#define ACPI_CAST_CPTR(t, p)            ((const t *) (const acpi_uintp=
tr_t) (p))
>
> ... this, I assume. On the surface it looks odd, because one would expect
> acpi_uintptr_t to be a scalar type, like uintptr_t is. But it isn't:
>
> #ifndef acpi_uintptr_t
> #define acpi_uintptr_t                  void *
> #endif

Well, that was unexpected. Talk about principle of least surprise...

>
> The only alternative I see (somewhat more risky overall) would be to
> introduce
>
> #define acpi_uintptr_t                  uintptr_t

What are the risks? I'd really prefer to have fewer gotchas in the code.


--=20
WBR, Volodymyr=

