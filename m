Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C924B606A328
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 10:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=a70EnVyZ
Received: from list by lists.xenproject.org with outflank-mailman.1474401.1681535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOun6-0001Ia-Kt; Thu, 05 Nov 2026 10:33:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474401.1681535; Thu, 05 Nov 2026 10:33:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOun6-0001IT-I5; Thu, 05 Nov 2026 10:33:56 +0000
Received: by outflank-mailman (input) for mailman id 1474401;
 Thu, 05 Nov 2026 10:33:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOun5-0001IN-Uw
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 10:33:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOun5-00HPCb-3h
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 11:33:55 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aec5b87-2eae-0a2a0a5409dd-0a2a450781ce-40
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 11:33:55 +0100
Received: from [40.93.201.58]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aec5b91-b4ea-0a2a45070019-285dc93aff32-4
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 11:33:54 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by PH8PR03MB7272.namprd03.prod.outlook.com (2603:10b6:510:251::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 10:33:51 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 10:33:50 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iz3RgHB4FGxx7ELBiqjb81sZFZTJQvNmwuj+GYB4eKqrbTMnwHNpgLRc369punfNF5uGV7KQz2Bp9axcdIRQyzALh3qIH8cmh6Mzf37zYzqRmoF0JSHnBGWCncJU3/241TvFGvO8d2Rgmba1Zn4esWw2RzVqv9dLcNPNqha3DekESSXP7tAsDUg12W9RAZdiaQ9vVFQJtIdX/vi7WnYowjOK+zXNNnF4lRLd8ynE3h5HnvMCvCDwPQntBvAgFo2jR+zrExOxrZ9JO+6drGlMydPrTpkEbNxqBpRDH/bQqzdZRm9tfJZsQEuM+pkD05Zbs97nvJ1eS59+RP0DrVKBNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKX+41IYFCzMQGH9G/FCabIrzjJVwXwjzMApee5D0gs=;
 b=UMI0sbFXk0csHqGkYFGdt4PGOqeZqJ7pmN5YW25ceJ+ViymaELfylBonBLenhoI0NtEY2p9OeoyhyOKSuira63puulBM3x7StqxytbeG8Tnv9SERZVDgTL8lHm4xTPHxWM9ToEQcErxfO4XAc1ltX89pIPO1jH5zCubcMtgjaI5S6ZJQ1aKILdOWijw85UYWUhcvE5tmnYyQDRGDHabOMt1XIhZQrT51XcC3mFx5OtI0H2Jm4wHp31t+OBCg2qGIeWLNy3Iyv2GyFCwiYtgDI5BCSIfLcF+9P//+U+aEqBoD/WXeKAU7yOG7zzzg+asTBNSsxtFBRhI2PHo+k+EIWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKX+41IYFCzMQGH9G/FCabIrzjJVwXwjzMApee5D0gs=;
 b=a70EnVyZENjlX0k6Pl9N1hZfjcffiSjLTJyIssgwe2TICd3EdphlK2+w6b2M8aD4uK/M7atLIpZPzm68lZpGfS3y/Yyd6iLFGDJnK0KfxBqfcPcziAD0uS9jULUOYAwcu6xyN85+Cqw7+ORVVbBtQbLpwfEtcRMZniSWGNjcoog=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: "dmukhin@ford.com" <dmukhin@ford.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, "jason.andryuk@amd.com"
	<jason.andryuk@amd.com>, "jbeulich@suse.com" <jbeulich@suse.com>,
	"roger@xenproject.org" <roger@xenproject.org>, "teddy.astie@vates.tech"
	<teddy.astie@vates.tech>, "dmukhin@xen.org" <dmukhin@xen.org>
Subject: Re: [PATCH v1 24/28] x86/hvm: avic: ensure SVM AVIC is disabled with
 nested guest
Thread-Topic: [PATCH v1 24/28] x86/hvm: avic: ensure SVM AVIC is disabled with
 nested guest
Thread-Index: AQHdbMXxDi7qjLhoDUuiCr7Mk5ZX/7cfRdBN
Date: Thu, 5 Nov 2026 10:33:50 +0000
Message-ID:
 <CH8PR03MB82746AFEBD404CB6FC86084AF0772@CH8PR03MB8274.namprd03.prod.outlook.com>
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-25-dmukhin@ford.com>
In-Reply-To: <20261105013347.719392-25-dmukhin@ford.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR03MB8274:EE_|PH8PR03MB7272:EE_
x-ms-office365-filtering-correlation-id: 7dc91c38-46b2-40c4-092d-08df3b284844
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|38070700021|56012099006|261021121427099003|261102123227099003|261022105027099003|5023799004|4143699003|11063799006|261022075727099003|261026121527099003|261026140227099003|261009223027099003|261028144727099003|22082099003|18002099003|10067099003;
x-microsoft-antispam-message-info:
 3CImdKBZqhVYPgBlKMed0rXeVqRQbkeEA1nC0L6Qpy3EOJZeic5e6PsLgNMSRs/e8GDRVMOem4sbsY6Tjs452aIHh86tfGjRm2ffmoGZcdrEgqlAu/6Gz9zIZ8gXu/uSwGe6e+cNDgNvaefL9dUwwjc1qyAtK84Sdr7Lu7l/5EtVvBGZ7gh0RDmK3Zfsl82jUJsj9tVY18n3lgy7LNxLj8ocTX0w9Xw9Mrnct77tE2+kjHeH9fp0xf4n+EdAsMX5kwFOtX+OfwH2BTJJoMZrs+u6Unf9ta/laU1tNk78Mhwfv5dyroyk7SZNTULrPBCeUDSnNF+SKwXO9LajZ715ZwCbGVt7UqQCvlbuvQ7B3/aqM6jLuQzQxLPzvaPAAXdHIkX33hYj7qXktS+gaAli54P9rHCWV5vocz+1oc/c7rZ/G9SfKLipUxDYRBU222gewtBySWt47Isr+RGw7hEpNEV9pkfzT+z+ex4/OsFR62mKdbqk6zhBQ82CB2kOKJSi9S7jV+EnUmFAnxhPccMOyqS3loVcxPgtcWhZ18z0QO9tnhFgxe8L+HyVkZQ3OYoyMTD56ql0PnjNukT/6pfgK0DVwolGvekHOgsWu0wHuZ4eVJcxDlduA98IU1MRF+drUP40Fyn4rdPCyzeWjDtoyieZ9ScLRaegS6ia45zvrZ9u/3VyhHI+31i5MNQor0bRdQGmuS6qPsBarZ34ZwYY/QphCD7wD5226oKvdGS8X3s=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(56012099006)(261021121427099003)(261102123227099003)(261022105027099003)(5023799004)(4143699003)(11063799006)(261022075727099003)(261026121527099003)(261026140227099003)(261009223027099003)(261028144727099003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?96OFSRLR1GYm06SubF2EYUx6iny/E5oX/lm0vgjASt3nFAWii7cuTSDGKZ?=
 =?iso-8859-1?Q?2YzAPexm7+rdVZKNHIJLKp11aV1OVlG4Hc0EdT5lyJj9Nl9l7I0m74lje+?=
 =?iso-8859-1?Q?5r57YfCGrsTjnHZCCLnU4PQ0c0azEwJbFDkZ9c+DnjncsFyxLZaQ2a7BTW?=
 =?iso-8859-1?Q?tngMYIHxBZfJq/+CIf93XWO/wQkGL7AhV2hJ3iLC1xycV5rqzwyQJN2gds?=
 =?iso-8859-1?Q?lOn/5XYPnJ8EvUFF65ApMHzBzAANXGyUmEXa+JygsngQpjMYuQoBV+UCqv?=
 =?iso-8859-1?Q?2Sn2/8Ev87a1DW7SCIRedePxDzFKLve/DMbRVWNl7JQFedBjB/CR0IBv4i?=
 =?iso-8859-1?Q?FTXrM/h6NLsarlD30wksunTujxpq4en56OtvEMIoq/P4h1mLOGMd2oyiHT?=
 =?iso-8859-1?Q?w+VUR3oe2Ri7VS7g5qw5rXDyt9mtRHzpWaEJZ5toeihLMlQq1PQN8oAgbT?=
 =?iso-8859-1?Q?yWN9tPbBBdRW0ddqtU6vFzlnNVA2RNh3IV7B4bWYJ9+Mexwsm11VW355qe?=
 =?iso-8859-1?Q?CZEfskYPMdypY7Hro5VmJsW8QbtBhCVL4/fFGwU4uslfJXYmEwkKtbuW3g?=
 =?iso-8859-1?Q?RmxfRC3CKtoCUA9gKR1xDFaYHl0OYT7XZ4MiT5G4/76GRGGITUAXWvdiDK?=
 =?iso-8859-1?Q?TphsEYtrLqHNIT1XzaXF8yWE0Ust3MJUn99wHmS8rA0z+wTRAYS21jtPWm?=
 =?iso-8859-1?Q?UPE196oTd6JGjI5LVeN7TX2qPPsZeAG3CrSxJzX+n25vf8esvM2bjq5IlP?=
 =?iso-8859-1?Q?6XpsFEmoeoMICfWqsWg44FClE36dFrmz69EvdGQFN553Ol5lYZ93nUMjPo?=
 =?iso-8859-1?Q?fz023PSN/r5EowGRwStpdbZgBFrScnER/ACfT0gzrygIEslXDrJoJWELGI?=
 =?iso-8859-1?Q?sIBjqpcSXT/ouPiUwHcKSXzk9+K19t6DFEcDfffHcJBsbcKIVHoYufvReZ?=
 =?iso-8859-1?Q?ptVDM14I6sQNAIWlWqcd0XNHJWrnSOgMmKD+ZZB3bsSG6H0zPtS3fMndPO?=
 =?iso-8859-1?Q?3JeKnjrXPOGdIo/JhzFx2WYbXP8Rw4jCFij3S7vzsZldet0WCOvAtbXZCl?=
 =?iso-8859-1?Q?Uy18nDwKeM0QTFsY33bIgPAXTPlysk0nkoxTxKrrxUvEEc6Mxr5jzGPMFn?=
 =?iso-8859-1?Q?2i6Iyyt72TiLrr9QkPIy+wi/sS2Vjx+jnm+6I1NxJLp18pVYNiM0XxkMl5?=
 =?iso-8859-1?Q?wiSbfkMdNyGHVSr1Bu4zcLgEw74CDHf0RkkBCNc83C/1pBZ0xNMuQWpl+m?=
 =?iso-8859-1?Q?K2IPSzcFmNR5t8NjZ90cSIVNEn5aFtAJ0RcdUnKk6XgOYy6Bay1w62diAG?=
 =?iso-8859-1?Q?DhnD/T8m+X97KCIT6pvrAMH61PEn3rC7OZwxm2MUH0yghRwNn2rGBII5V/?=
 =?iso-8859-1?Q?bM6L6tSvta9fUq/c0aTsxzawkpYwOk6lE60GvVpN2W4E87fkGmuSd7j8L2?=
 =?iso-8859-1?Q?59SnU5Kj6z5GSsfXeHvYMkfNYewvYQgnhxOw3zGBA6vnzN1mK1hjM/GWNK?=
 =?iso-8859-1?Q?hB1L1FNknEjghYzxTGV0bj9yDcXCnCKlyLdSr+pR7Yu2QLvWn2Nh6SAF/J?=
 =?iso-8859-1?Q?s97OZFFMOZLB/qcLPin1K9RQSLlERQ0ISP8QWmO6SVlg3GeoriZux49A6O?=
 =?iso-8859-1?Q?REVYiUTgEBiE0nCCj4M87kQuY3cSpYMwaGCrjTXzAwOYvAaxSR6C/Nbcx5?=
 =?iso-8859-1?Q?nwgmfysU1oJw5eOTiGbHDu/SWTfNh6R/F5iU6aQ4vwgG9vQFjXoRiz+/iW?=
 =?iso-8859-1?Q?TZwx2JjLJ9KJRDGcAxwU+fjyoup2+JoHgVRYzGiv/gJJMjFvUICOfgfK5p?=
 =?iso-8859-1?Q?La8NNVtxDA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dc91c38-46b2-40c4-092d-08df3b284844
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2026 10:33:50.6772
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +NwrK+CU17F/3gijchy5EZ7a8xR0x2eyYo0H336dV98AkBtG5JVjzyUBbC9JBU+IIkBwR8xTFVMhpI4/ngOc5EEtlvDskrG+8fkMJ2Pr3UA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB7272
X-purgate-ID: tlsNG-ef75cf/1793874835-3C817AE4-4F8CBE48/10/78276251493
X-purgate-type: spam
X-purgate-size: 2509
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> on behalf of dmu=
khin@ford.com <dmukhin@ford.com>=0A=
> Sent: Thursday, November 05, 2026 01:33=0A=
> To: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>=0A=
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; jason.andryuk@amd.com <jas=
on.andryuk@amd.com>; jbeulich@suse.com <jbeulich@suse.com>; roger@xenprojec=
t.org <roger@xenproject.org>; teddy.astie@vates.tech <teddy.astie@vates.tec=
h>; dmukhin@xen.org <dmukhin@xen.org>; Denis Mukhin <dmukhin@ford.com>=0A=
> Subject: [PATCH v1 24/28] x86/hvm: avic: ensure SVM AVIC is disabled with=
 nested guest=0A=
>=0A=
>=0A=
> From: Denis Mukhin <dmukhin@ford.com>=0A=
>=0A=
> AVIC in nested virtualization environment is not supported as of yet.=0A=
>=0A=
> Ensure there will be no problems in any production environments if AVIC=
=0A=
> got enabled in nested guest by short-circuiting logic in=0A=
> svm_avic_create_vmcb().=0A=
>=0A=
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>=0A=
> ---=0A=
> =A0xen/arch/x86/hvm/svm/avic.c | 9 +++++++++=0A=
> =A01 file changed, 9 insertions(+)=0A=
>=0A=
> diff --git a/xen/arch/x86/hvm/svm/avic.c b/xen/arch/x86/hvm/svm/avic.c=0A=
> index 37a857f28d14..e19489bd485c 100644=0A=
> --- a/xen/arch/x86/hvm/svm/avic.c=0A=
> +++ b/xen/arch/x86/hvm/svm/avic.c=0A=
> @@ -4,6 +4,7 @@=0A=
> =A0 */=0A=
> =A0=0A=
> =A0#include <asm/hvm/emulate.h>=0A=
> +#include <asm/hvm/nestedhvm.h>=0A=
> =A0#include <asm/msr.h>=0A=
> =A0#include <asm/p2m.h>=0A=
> =A0#include <xen/param.h>=0A=
> @@ -170,6 +171,14 @@ static bool avic_vcpu_supported(struct vcpu *v)=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0 return false;=0A=
> =A0=A0=A0=A0 }=0A=
> =A0=0A=
> +=A0=A0=A0 if ( nestedhvm_enabled(d) && nestedhvm_vcpu_in_guestmode(v) )=
=0A=
> +=A0=A0=A0 {=0A=
> +=A0=A0=A0=A0=A0=A0=A0 gprintk(XENLOG_WARNING,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "%pv: AVIC: nested guest i=
s not supported\n",=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 v);=0A=
> +=A0=A0=A0=A0=A0=A0=A0 return false;=0A=
> +=A0=A0=A0 }=0A=
> +=0A=
> =A0=A0=A0=A0 id =3D GET_xAPIC_ID(vlapic_reg_read(v, APIC_ID));=0A=
> =A0=A0=A0=A0 if ( id > AVIC_MAX_PHYSICAL_ID )=0A=
> =A0=A0=A0=A0 {=0A=
=0A=
Does this actually work? This function is mostly called from=0A=
svm_vcpu_initialise() and the vCPU is never in guest mode there (i.e. L2).=
=0A=
=0A=
You could probably just drop the second part of the if condition.=0A=
=0A=
Ross=

