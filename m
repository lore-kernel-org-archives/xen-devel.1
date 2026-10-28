Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AAE606A31A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 07:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=UNtSdqoE
Received: from list by lists.xenproject.org with outflank-mailman.1462879.1673852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLy8h-0000F7-Sy; Wed, 28 Oct 2026 07:32:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462879.1673852; Wed, 28 Oct 2026 07:32:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLy8h-0000F0-Q0; Wed, 28 Oct 2026 07:32:03 +0000
Received: by outflank-mailman (input) for mailman id 1462879;
 Wed, 28 Oct 2026 07:32:02 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1xLy8e-0000Eu-R1
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 07:32:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLy8e-00A4CR-3J
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 08:32:00 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6ae1a4e0-2eae-0a2a0a5409dd-0a2a4508af18-48
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 08:31:58 +0100
Received: from [52.101.228.81]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6ae1a4e7-f659-0a2a45080019-3465e4511c92-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 08:31:53 +0100
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYWP286MB3349.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2da::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 07:31:48 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 07:31:47 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dR4SjWXKZXOaEKA74iZ5X7HQNzv5c6bnM9hsJFExBMcEoR6EU8/pTiN3GiP10TVZZ+5NO1ODqn6LlFPyuv8I0tZyxPzYR/YEl59vw7CHjIOtGkclo3l2KA4UAMEA2KXObb+lF7A4QQwlb6lUyx6Dwk3hGTdH0aG7xazuceKmurWstDijLBoYouxOu9twevJ9YWqTlmEkUSByaudM/MFOhtbh6QRDUDaWlRJKpZZAsMMWnY7P/ScXgKhuG5u29vBjPQbspvoD5R++WDCvQi1Q29r7sbMOyJKGWWhW/9oaYengO8nBLCEtAZp1l5P80fZnLaDYPnZIs/PySvlJ7z8Zwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bkPJNooUByqU1llh1Tj+YKR75Xu3gUPpvsmUpTdn8zk=;
 b=C5/+IHVHb3OhD0utBR0samWxxvI5y/J9Uh9EpaHTDa5/mLii6N98m/FWVDwHunuBoxV5fzcUhoI/BIfW4iEubBcIkHasR7ifBB9l6o155vARyhydfbNPZn3vdxvdjtb+U1znA2IugdPOPcQIgZgczRzrBYyRVcdOdWBxaQoXR4D+5+xXgR8asAIQ3P45vLCrzXwqwFvk0r4NuGqTN8dD0t/IMBHqZI0kT7RJC1Zkgqr43zmghNDUysrLTzKHVjaPdjZkSE/7AO2SQRci8SEpYtazlVIIuDQTJndI1BK+UP3qzfKneXUWmAbRTqq3My2ks1nQUcAnrUroKF2qreSKeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkPJNooUByqU1llh1Tj+YKR75Xu3gUPpvsmUpTdn8zk=;
 b=UNtSdqoE2kTmZM8O6Y8lQGm+abcbNz32jY4V06hRzjqFmVU/Uuxi32GWUrY2smpcrwn7kNUIZeLvemS0tj13KQfO5ELBLHbmHzGS1UuZoRp8Rw0d7GY2Xt7MBoNVd/ucFI8BKv3zmjHGN2RWK8d6qHnzUTkjrM3NojvZG4zFm04=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"michal.orzel@amd.com" <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: RE: [PATCH] xen/arm: Fix sibling mask setup to only include online
 CPUs
Thread-Topic: [PATCH] xen/arm: Fix sibling mask setup to only include online
 CPUs
Thread-Index: AQHdYt8WC0CZ/VfzZUWl8UFycAlt/LcSkMeQ
Date: Wed, 28 Oct 2026 07:31:47 +0000
Message-ID:
 <OS9P286MB72226476375CFFE4A1D7118C826F2@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20261023110925.128195-1-taka@valinux.co.jp>
 <87h5i6r2rg.fsf@epam.com>
In-Reply-To: <87h5i6r2rg.fsf@epam.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|TYWP286MB3349:EE_
x-ms-office365-filtering-correlation-id: 4ad4eb28-87b3-4d4a-36f4-08df34c5867a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|261026140227099003|38070700021|4143699003|56012099006|261026121527099003|261021121427099003|261021123027099003|261022105027099003|10067099003|261022075727099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 S+RHAPZSynIXshzfyA4/aInVnoxUhc3r+3A7+U6sYwezDNHd9NWV+KUkj4fFaZthTOJgti/d4PVJIFqeqXSSInfIIgSM03Yx9l1nLAr1E/caykzH9rVus67lI33R8Wqe7SYYhNBIogpyVxV8wMKUZMFwFUO9nwrOQPtfHb3CMJbOobMVMks7iz+wwH0sgBQTkulOZiLR3QxiqfLImp1sXAixCgyaydoAQf8s+RFYIOoK1uYO4qu2Ft7E4ab8xNHoI2FXWKnjAjEWL3JpBltAP9KkXKEay1nvmStpriKYvwBJ2+2Wtua1dv+yD9N0RY6C74ZiRquA5RRHSVsLqZV5mXRSM10Fz1M08t+AgqHJvB8yok3a3wSDkgdgDw1rQN7wt5g6RFK62PbesDHtGDe9dBzV7IolGZQptFNDMN7FGrN/kuikYpypvpWjktQ/CS1T4a8BK4RJh9m3jOjxRrRbiCQE8d7xP4TIgoEiYI2a1l9e6tsujHNJb73toOMX/j085e15zkO71OQHxYc7uBv74pVzL3giuSiGO6MFySpbvXKmum/WfyGkqdKmf0bLYqjM8ZkYtCWr/jrMTyRTlMDgAbxl+wzBkYXnV+NdKOBReqCQ0Jw7rxIiJjijgquVRCH1ilLhGEvtVP/b3QdFtTyd6YP9QrtV2VlUllHKLguy44qXRFpmyZYn735gk7AM37ADTW9LgMN05GKVXE1w/U40F2BdQ35k5b19XnyDcGsY9eY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(261026140227099003)(38070700021)(4143699003)(56012099006)(261026121527099003)(261021121427099003)(261021123027099003)(261022105027099003)(10067099003)(261022075727099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?QCXhGwhKfL2RUaLsM4Sx68GHfYNSlNZXRxvhmB0ZE6ID0C4VA0a7GlhRUWPN?=
 =?us-ascii?Q?UdChpT84gXZeToR/tTSbKPf14ks9a/+keu3lTh0MQssyDMtM+m3/2rVVb5tq?=
 =?us-ascii?Q?Wy0pTkZxxOQhKaiUv+ZikVmlclC2VGMv9zDZpwra+rMdSX0SwVmNJ0XTPG02?=
 =?us-ascii?Q?HajQPesYPEigaynswnHEmhYQRPMuCb8JrhY1a6N7GTqYzf1ucDYoPnJAIHyU?=
 =?us-ascii?Q?wmrrRWxA1nOvkVRxzgWLrz3vnYcQWmz0rx8oOQZy6CQw3Omz4f+e3J+6ZqeC?=
 =?us-ascii?Q?qxPfEwAFCRiDBYmx4uiViSDj401MJ0IgAPQ2X/7sbB5ZVJzC4gqtuuz8/s8R?=
 =?us-ascii?Q?ciflBopMk3TlUDR6aJkauABuGOpvEV2rx1YWA3PCJg7SDNTIoIv1/kbEVFEa?=
 =?us-ascii?Q?61ggRORqJ5IE62yw0U5CYkgi224d0CHsELNTbZLlz6qQEIBr1dJE4Rltjl/y?=
 =?us-ascii?Q?flEuDvKK4554OzT/iw/zy+eIJ97Hh+0BoE19rXMbUeA3X2c5z0Ydl4YQOwGL?=
 =?us-ascii?Q?c0SRc6Awsay1TobAGI28FVIiaqo/3ruDKgMt7Xj0mfrHFJCPkOel0BHr10Am?=
 =?us-ascii?Q?m0EZ1wpImVF9ezyN+RQ0sbh+TBry1MvGy/YjDMC3l45cphz8PnDowRJhqa95?=
 =?us-ascii?Q?GloeDtC+edfkGKgxaUUcnA/V0Bu4qU5mZ6zhRiwgD+IUOG661cYNjWmnOAEa?=
 =?us-ascii?Q?8VxYXHvk/0VtFyZRKbpYZMKekqH/Pa8m8MlLAJAce8FGI1FnH15bmRUedcVc?=
 =?us-ascii?Q?5CgrwL6OsFI4ToqHi+0zq5Jek69AyMVvZoVWGYVJx8M1RkaqkFOzKszBbhyO?=
 =?us-ascii?Q?nrkpWezVU/2L008MDhais2LAmyhRIJPAaTxK6T6qJjAJ6XSbt8ZpkjdE6QV8?=
 =?us-ascii?Q?YIzWPJU68Sclwxwso4tx6igNVuXRpyL3wrnjPcFhuJ7R1e46o1l27C9QUn7/?=
 =?us-ascii?Q?aSXy3Gg4am3vd9O+JOyggPVGEDsXyi0N7PIdfptjdR0384IfC0jGvjUoJcM6?=
 =?us-ascii?Q?FZLkGXqPHRDeJA9FiDs/NHuonyIn08otcOYvCufPLC9L/z3jkjh3k2An5to4?=
 =?us-ascii?Q?VKyyYWQdqSMEmKhOagAX2RgFi+Vpeurl1CR3yu9pIXVcntdKcBNakq8LVB3q?=
 =?us-ascii?Q?PofEdqnFAEsNBqxdM0BZmNDgphFCkL/3Y/0dBlbXo6mVpv0dLd4VZSnFyU0e?=
 =?us-ascii?Q?idxM0kPZMTm9dE7NGJr6u1ikVO9CbXGYhtfrdRq9t54WjSMyuMVRdju5lYIj?=
 =?us-ascii?Q?e5+QOXvikS3OEX7JW8OtDCWt3OaeF1uPrcFx4U+BN0KyiDUaBrN45M+ZJEWi?=
 =?us-ascii?Q?qfsCjYrqS8nrxBgAbr7ZAOYo7OJIk3VvbWYBjGYBtJPJI6r6ZU3JL7Ob3uL+?=
 =?us-ascii?Q?XebfSXrdDfSLAr2pSnLaZZkzIUboaOm5mowSj9JAWFDbjzT6CqvfJmrfKha0?=
 =?us-ascii?Q?++pSFYqJtYgI7hFpiJ5f/Wp2okFVne84U7Z3xuW/0NbQ1fvo62vXFCOhzmf7?=
 =?us-ascii?Q?TdYBaWWJSAYVa0Yj9gsHOqdHoL7U+/ce0IcmC1E9+fg6RNTIOgM76/zdXm8Y?=
 =?us-ascii?Q?sWar4KrJkHlLX3NHGA+Nln5KN6xO4cux3Vi6E4frak54BrESpn0IQojDhHjV?=
 =?us-ascii?Q?Hs4XTgAqD+Dmdd74IJWbUlvige4E3awq4oUGZN147ZQvlf/40rvJNyQVsXuC?=
 =?us-ascii?Q?lH0o0hND9IlWl6MUc7LA6Eu5/yF9kVt0YMZnXQXh0rmtFEnS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad4eb28-87b3-4d4a-36f4-08df34c5867a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2026 07:31:47.9084
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ppwwESo7/LPujsb9AWSfQ5JAuCx11ZaXLUO+h93pz3BsNIKVGfw9BTJK5G1Qmp+FLxrYxI7a/nxAyP8sl6zkjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB3349
X-purgate-ID: tlsNG-c1860d/1793172718-D6F5F87B-732C85A8/0/0
X-purgate-type: clean
X-purgate-size: 1938
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Volodymyr,

> -----Original Message-----
> From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> Sent: Wednesday, October 28, 2026 11:13 AM
> To: Hirokazu Takahashi <taka@valinux.co.jp>
> Cc: xen-devel@lists.xenproject.org; michal.orzel@amd.com; Stefano Stabell=
ini
> <sstabellini@kernel.org>; Julien Grall <julien@xen.org>; Bertrand Marquis
> <bertrand.marquis@arm.com>
> Subject: Re: [PATCH] xen/arm: Fix sibling mask setup to only include onli=
ne
> CPUs
>=20
> Hello Hirokazu-san,
>=20
> Hirokazu Takahashi <taka@valinux.co.jp> writes:
>=20
> > Populate the CPU sibling map only with CPUs that are brought
> > online. Currently, all CPUs in cpu_possible_map are added,
> > which leaves CPUs that failed to boot in the sibling masks and
> > may lead the scheduler to make incorrect decisions.
>=20
> I think that this is a scheduler issue then. A CPU has siblings
> regardless of if they are running or not. Also, your change will affect
> CPU Hotplug functionality, as with your patch sibling mask will change
> in runtime. But partially - only in cpu_up, but not on cpu_down. I am
> not sure that schedulers can handle updates to siblings mask in runtime.
>=20
> Could you please elaborate how it affects scheduler behaviour right now?

In x86 Xen, __cpu_disable() is called in the cpu_down() path, where the tar=
get
CPU is removed from the CPU sibling map (via remove_siblinginfo()).
I think ARM64 Xen should follow suit.

> > Fixes: 701190abb3d5 ("xen/arm: Set correct per-cpu cpu_core_mask")
> > Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
> > ---
> >  xen/arch/arm/smpboot.c | 18 +++++++++++++++---
> >  1 file changed, 15 insertions(+), 3 deletions(-)
> >
> > diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> > index 8c9072f3c1..2d01896cf0 100644
> > --- a/xen/arch/arm/smpboot.c
> > +++ b/xen/arch/arm/smpboot.c

Thank you,
Hirokazu Takahashi.

