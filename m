Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066F4C88E77
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 08:23:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1422455.1647857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6kvL-000813-V6; Wed, 16 Sep 2026 08:23:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1422455.1647857; Wed, 16 Sep 2026 08:23:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6kvL-00080w-SI; Wed, 16 Sep 2026 08:23:23 +0000
Received: by outflank-mailman (input) for mailman id 1422455;
 Wed, 16 Sep 2026 08:23:22 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1x6kvJ-00080q-Pn
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 08:23:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6kvF-001jlh-JM
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 10:23:17 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6aaa51ea-e002-0a2a0a5209dd-0a2a4506d892-48
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 10:23:17 +0200
Received: from [52.101.53.23]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6aaa51f4-195a-0a2a45060019-34653517907f-3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 10:23:17 +0200
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by SA1PR03MB7147.namprd03.prod.outlook.com (2603:10b6:806:336::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 08:23:14 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 08:23:14 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CNvIdsGjYpropUhIAlAb3AboTwf+JVFbuAO2C2I9MMdxRri/OPFIoKyOoYyncMQsnlquA+hS5ErUSD+3PfXiXXMX0qM3SvHHecIq7XMSGQWpRYQ8xnOeW9BxfCtWvKLn0IE5ZXe+HVED/r+qEnF/ApAMQUKrOXMhqvCM/tN+DlVZiKRNuVQbVuojQdzu8fMSX9lICbJtAKvJ0qsTBvbWLNM+pgZs9yLOtYa/u3yGz+dlkC6KW/4DiQIsutuPDVKofxyjLcN4nw4W+W1COTn2VwtarSMKyD7TJUsu7pSTbdrN+DeF89vzLtKXUgCxsR6dxkz4E7bMWlcG5SXZErrowg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7B3fv3RhboLg99eykgwSnE5v+dtq2chUexLkyAwo+8c=;
 b=PTfklA+y55uUHRsS5Xpr6jJWPc9ToDiyOWlC3rHSbbuTOcj0BANqVs1hbTFLbN4JKfSpMTA7TJ7AbHZCp2iY0oV5dtAQtRpL1KnDdRwKvIytkS1Ir/HwQ4b9kZTae+GY9k7tZO/a+RdZSp+XJn4CyBEul0G0zZNw6MAdpyc03MnCzrJaaBtCG4bNgqUstNbC6L1ufveE050lXMFKnYH+u22fGdjfXL5Qcr9vmfQc0uzfQG25vRRUiHNAuXyeaG4+TpAEjD75n3vHWibaUg9WGALPtV2TxcsD1q7NBBoeiO8Q+2fumd24eaStl4Np2We+E73u44dzh+W5Ff8fxJGJUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7B3fv3RhboLg99eykgwSnE5v+dtq2chUexLkyAwo+8c=;
 b=xxrX3ZZh7bGf8LEdrBuzsiXYfT/JHmNgA2nCW2beu0Hq0Sidf6Ij3zLjKW7V+wfznDdohJf0QR1nRQldnE4Q6KFUB5uYehtVC81Q08GoZsvvhIVZDt4lUbN0JKeUo8C/ccuP1KLyOBKQ3O6VwyMoPgv+L4GcrmHSRTdxAyNlkvM=
From: Kevin Lampis <kevin.lampis@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "teddy.astie@vates.tech" <teddy.astie@vates.tech>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 3/7] x86: extend update_intpte() to support atomic
 get-and-update
Thread-Topic: [PATCH v2 3/7] x86: extend update_intpte() to support atomic
 get-and-update
Thread-Index: AQHdQWMYYuOEW7sUTEmdu2MmKUu4LbbJV30AgAaz+PaAAK8QAIAAK46o
Date: Wed, 16 Sep 2026 08:23:14 +0000
Message-ID:
 <BY1PR03MB7996E6B84145F4A368D611B2F3B92@BY1PR03MB7996.namprd03.prod.outlook.com>
References: <20260910203113.462943-1-kevin.lampis@citrix.com>
 <20260910203113.462943-4-kevin.lampis@citrix.com>
 <0aedfbad-29ae-4083-89b4-5c662398553d@citrix.com>
 <BY1PR03MB79965A43641C02BC2267E5A8F3BA2@BY1PR03MB7996.namprd03.prod.outlook.com>
 <2516df18-b239-4bf8-9f89-f1811515e5d8@suse.com>
In-Reply-To: <2516df18-b239-4bf8-9f89-f1811515e5d8@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY1PR03MB7996:EE_|SA1PR03MB7147:EE_
x-ms-office365-filtering-correlation-id: 11c0e00a-dc2e-44d2-e124-08df13cbc0b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|10067099003|6133799003|4143699003|8096899003|56012099006|11063799006|38070700021;
x-microsoft-antispam-message-info:
 5MpPTaGnc3en+YoCWuEkB5W/TGuw7ZDzyNKnv3+P/D0WWvvYIjoqBg18psMEWAMmzIT1FBoUm362P8Cvi348VQksoNRJwCmZgQa/MHW0Vx0h0UfaFMxs0XmnuYhxhorajGr9PoQRrVtmV1TBdbMWOQlWbCYKunptw4BGjcArgM7I2rYam2PJ2oQvSoqE7XL4uEM4jYDo2vud8aT2l3xFvEzagHFKcCAeH7tE7jwaw8DSME+7+I4B9jhuLahKIC+tLdyttLTkgh05L+YIopvBtad6i1qG4XF6r8qHkyf2PuVAktv5TwwjzPjhx7aw69nCbED3Clqj7/dHndbux3hHoq1X79j5TUBBTQun5Wv/uv3Feh/m0sKFTxZKartm1F0MnaQSkvPEklQQ9FoUHUwl9q6e4es1ZDUglBeq3qVZxOM8VsBNnyjcYQJHFPMYzwx1LKfLAmzbtN5kV6wX61mdrXuxvjnxb5sKWi+4+5ZJPzfxtzgf+416I7Mrf8oBC0WNAd1wMfjx1UD0LR9+SpumPj/5utS/wP7ClTyusWWIqJQbLV2usnIbnPqmhGQcHR9n8GRgz15CL2svrinWy0+MyJz2QneB33i2kMYlgeOsraSHU9t3iik5RVfX/EELHh+5j4vrKz+wuKHSTZt2wT4d4fo2PD1oMxVoxVX5dZyBnTFYP+964eJ/WEVmie6j83i2Kym0kAQnYwyXLTM+e0m0+xp8pw7WxseQIolrlOeYKNI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(10067099003)(6133799003)(4143699003)(8096899003)(56012099006)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?2sGWyM5RvFEtu5qvZaHaPP/Y+otOEPVBVvPhJGh1+zsUtdB3azy7EnOS3k?=
 =?iso-8859-1?Q?BWfG6SOBTR2pzt6I9vfSXCOAenx2ze/b5OnakxpMl9aQbJbw1JWDwnseiH?=
 =?iso-8859-1?Q?h9UG6a0bccRDg3C25BUIsAd6/mXT5MU0uZcS+8upEWfS2tCzb9wG2X6qgi?=
 =?iso-8859-1?Q?no3DEDq96JBdOBtPQMhI9YxIoizNWUZeAz+rbtkbszibr8eYm50bliojZI?=
 =?iso-8859-1?Q?U6LYu8mKUSFn3WosbJcpP7mU85BVINqnQSsBceAXufVZ6l5YAtGIwscVeS?=
 =?iso-8859-1?Q?qKO1Tf93UEbs+NyAV1BD1M5Xb2XqRaqKEN/MFjYze2pG2loIcvDmQsoBtt?=
 =?iso-8859-1?Q?b7Q6JfyThvaTZBlhT1CpwIMFycaxqufkiUkeeO7uCXM6qh002561rh+e9x?=
 =?iso-8859-1?Q?ukqmSugDWELGiRX1ERRORScujxeojvf0rAaO+mYs1uLB7yXUXOm1ne1XQV?=
 =?iso-8859-1?Q?8bxsT2p4gxtM2UiAy06BjiNLdH2YFyfeQSFR1qyp/7eET5afh7IMtIMDb1?=
 =?iso-8859-1?Q?X0h5sYe9K2Wr+ARwz+DzepSI9COwdxBV5sksSCi/YgvWgLsOQLVohK1WYR?=
 =?iso-8859-1?Q?nkeg/r9RmxuTGI0V4msPWTW6/0v30dsazEbHvmN8IULQJ5A/xbEeJ3+XU8?=
 =?iso-8859-1?Q?w8wP049T9gTToJbSK7I1p8f3/DJepZFUxrCQPJWInyZ22/7R8fl5HA+K9a?=
 =?iso-8859-1?Q?FZ0FkEgEJCrPK5ETSogIUDwNNPer29ReW9jXfhxSdeLvnAYp57iEwZ+TOS?=
 =?iso-8859-1?Q?2ZaIRQ7cyh0CDQv/OoLKckx4naYFY6Bh7+DUb/cDsZPRDMg9th6fmE+YpU?=
 =?iso-8859-1?Q?RTalexUFWs+LuuyTRHjVPvTTc7JytnXxuKfiC0jb1o8BwJVFF7cepnr/zR?=
 =?iso-8859-1?Q?BV7RG7neYCujwtDVwlp2ue+mwmpptPqqKC7GTdUwDtoX7xZ/7df715bJcT?=
 =?iso-8859-1?Q?iUDCa70tJ1MEw4/AyBjVaAvfvrU01GPOyR7zQ1Eo2cARNi2DIRY+33Scoo?=
 =?iso-8859-1?Q?vyoeFBuHtK3xzYhD0VKv+vyl81OAUJpTT9xLLTlbsIDBWCC/WSG0REv1Ci?=
 =?iso-8859-1?Q?4lAm886bHUSueQCkgCTFCmOjtnPoZnq4tgeR2V0k2F/9sUBIlmrNEpldag?=
 =?iso-8859-1?Q?SG6FbMM5cg82tl4H35O/ALPmgzssAEBZY2QM8NUP1cpfize4Ke33guuj6+?=
 =?iso-8859-1?Q?aAm+6ag6obVOWjjwJMGUjsKkB2mG7OOrOMVHvR7YHwFrBwlTYyyrKMtQMb?=
 =?iso-8859-1?Q?9uncrlsZOZ0EPFBJEIksLSiFsmBCvgGDOxTCQudI8/ID+IoJAKuWW8W0uy?=
 =?iso-8859-1?Q?Fp4oBCOUfbTAPSZDA+eKYrV6jl0h15zmpc+o4y2KVmkZYKOpOmbU+kjZVm?=
 =?iso-8859-1?Q?z7/rXplj3Ij0E/B6TORiT5oJqq9VWHIl/Sfocygl+PQB0+GHR83gOeGUVr?=
 =?iso-8859-1?Q?ZvtYPpoS6dFOiprIhRuMmoc+UJCHiI+EJ8fy9H2srwCblqxW1uw+6plU/C?=
 =?iso-8859-1?Q?+v6vNO0MBgHm7pCMYh5HV/A9fWnKEa8ws2EEyni+UgF7AaLLDyZSPaL+Er?=
 =?iso-8859-1?Q?W6mKGTi5IN5GeJqvAQQET8Zi1IFU9FASDBduHItk8CrXc7p4idZROXhS7A?=
 =?iso-8859-1?Q?oxlgHxcPbR5cXIPDB+HibRqaXMxFft4Q4k7RV9wZpgJlDD2cXTzxHAURQM?=
 =?iso-8859-1?Q?oBJZBH6+Ar2l6BKaV+KiW/q0sh33WFL1AKBwt4H51Z9wOvs+g1Sqhu2vMu?=
 =?iso-8859-1?Q?WzGvuT2hYjohguSRn1X/Puj27uou3JPaweV0IzK4vykcRs?=
Content-Type: multipart/alternative;
	boundary="_000_BY1PR03MB7996E6B84145F4A368D611B2F3B92BY1PR03MB7996namp_"
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11c0e00a-dc2e-44d2-e124-08df13cbc0b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2026 08:23:14.2412
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4nZu7E9aeGtxbk0jfmi4tXQRNoSJqeKJ/7avmYG7vrTQF4kZ1pJXhE5c7fzZK6ClDNA9wIoPUhvMy3W785HuqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7147
X-purgate-ID: tlsNG-16d1c6/1789546997-1F4C977B-2740B61D/0/0
X-purgate-type: clean
X-purgate-size: 7226

--_000_BY1PR03MB7996E6B84145F4A368D611B2F3B92BY1PR03MB7996namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

>The "flag set, pointer non-NULL" case wouldn't hit the "return 0" path

Correct.

But what about the "flag not set" case. When PTE_UPDATE_SWAP is not set the=
n
UPDATE_ENTRY may return 0.

If UPDATE_ENTRY() returns 0 then mod_l1_entry() will give
the wrong ol1e value to put_page_from_l1e().

    static int mod_l1_entry( ... )
    {
        ...
        ol1e =3D UPDATE_ENTRY(l1, pl1e, ol1e, ...);
        ...
        put_page_from_l1e(ol1e, pt_dom);
        ...
    }

I think mod_l1_entry may need to store a copy of ol1e incase UPDATE_ENTRY()
returns 0. Or add some extra if/else around every call to UPDATE_ENTRY() to
only assign ol1e if we know we're on the new PTE_UPDATE_SWAP path.

And the mod_l{2,3,4}_entry() functions will probably have to do the same th=
ing
too so I just wanted to get some input first.

--_000_BY1PR03MB7996E6B84145F4A368D611B2F3B92BY1PR03MB7996namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&gt;The &quot;flag set, pointer non-NULL&quot; case wouldn't hit the &quot;=
return 0&quot; path</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Correct.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
But what about the &quot;flag not set&quot; case. When PTE_UPDATE_SWAP is n=
ot set then</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
UPDATE_ENTRY may return 0.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
If UPDATE_ENTRY() returns 0 then mod_l1_entry() will give</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
the wrong ol1e value to put_page_from_l1e().</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; static int mod_l1_entry( ... )</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; {</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; ...</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; ol1e =3D UPDATE_ENTRY(l1, pl1e, ol1e, ...);</di=
v>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; ...</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; put_page_from_l1e(ol1e, pt_dom);</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; ...</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp; }</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I think mod_l1_entry may need to store a copy of ol1e incase UPDATE_ENTRY()=
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
returns 0. Or add some extra if/else around every call to UPDATE_ENTRY() to=
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
only assign ol1e if we know we're on the new PTE_UPDATE_SWAP path.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
And the mod_l{2,3,4}_entry() functions will probably have to do the same th=
ing</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
too so I just wanted to get some input first.</div>
<div id=3D"appendonsend"></div>
<div id=3D"divRplyFwdMsg"></div>
</body>
</html>

--_000_BY1PR03MB7996E6B84145F4A368D611B2F3B92BY1PR03MB7996namp_--

