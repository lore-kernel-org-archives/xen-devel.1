Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF6AC55184
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 00:27:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382713.1626036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrPTS-0008OT-Pn; Wed, 05 Aug 2026 00:27:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382713.1626036; Wed, 05 Aug 2026 00:27:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrPTS-0008OM-N9; Wed, 05 Aug 2026 00:27:10 +0000
Received: by outflank-mailman (input) for mailman id 1382713;
 Wed, 05 Aug 2026 00:27:09 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wrPTQ-0008OF-Fs
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 00:27:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrPTP-005IWg-Dy
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 02:27:07 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a7282fb-e002-0a2a0a5209dd-0a2a4502b432-30
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 02:27:06 +0200
Received: from [52.101.125.91]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a728357-6ca4-0a2a45020019-34657d5b7ba0-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 02:27:05 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYCP286MB3435.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:302::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Wed, 5 Aug
 2026 00:26:59 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0270.017; Wed, 5 Aug 2026
 00:26:59 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=esolb2vq6t57XywXG5KcqiqOkUn1VICFSYPFlFwC2LA/FF0PU0NKYV+k606xZJkIt5AMJ1d/JGYITQpwz2FRRYmBRrsKmuFZ0xWIV9NUceTpH/K5oaGO/a1HnN0lxgPatcWR+u3UBBh5TQBmPIT5ntQ/CJhzkaUJUUwnalhydkzCfMyVL0iy1sqGqHur+MkcZvZOAgn0FiAJyfKyKXT8uTmbAcESP32ictmt0AEl67zR60+EmnJG/oRYXa4bKK/VizkhhIMgxNnX2Q+miIRD//BXpE5g7OWCL2EUsADsZQxcpxYwq014NAQrNt9OnHAxiZAo5jKrETJ8nB3/WTYs9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQVNDcQbHIfCeMMPt/2Aw42fIIpin4DpaN8TSJP3ahA=;
 b=LArhckNG8QGOxH49rfjcGkG8dN2CKwMLiM+CFX6AcdG2ZIm8/K9ng6u7U07DzIqlSZIs2F1XiV1kiIVMxTr7FQPMEvP9chUsXHAbxMSLQ9rQ1LZiSmS/bJlrZ80IMPsEDjrl0L/RGu6DKVu6DH+jyo/rJZq+OEXbT5Hv7S7KfDSvmjMfCDrQlHjj+nfqDhGy7RATG3cLI0bMNIzyFvUB3SJ0DbxYREOhUdYG0LwtLANPVotuCeoFwj63BNw6Xd/baZswQrrn45TvLjwNkKDmO/Fw8A6Y4er4cvtFmcHYaadNpI0/H3Kv/j2Lk7dQQlENZ0QKs48WWfbt0K8XjvEQIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQVNDcQbHIfCeMMPt/2Aw42fIIpin4DpaN8TSJP3ahA=;
 b=jh9B9u+St2alfoVDHL8JyVOfMNaS4c9+hIZHks2CRc+B5l2FA5cdedlGaZkAmqOudx6L2Z6d2tK/KD9esNAKAio5WzGC1kuq5elXVUTq6bPFTv5yUQiMZ3PkFsE9tvnegqecICtc7n7/XGXqDV/+hxCAWsal1Q8JAq8a/lFakzU=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v5 0/4] xen/arm: Device Tree based CPU topology support
Thread-Topic: [PATCH v5 0/4] xen/arm: Device Tree based CPU topology support
Thread-Index: AQHdD+8pDj0XO3cy2kSCxVJYrFPzTbaELD+AgAqVLsA=
Date: Wed, 5 Aug 2026 00:26:59 +0000
Message-ID:
 <OS9P286MB722290CF69591CA6BA3B937F82D32@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260709220552.646462-1-taka@valinux.co.jp>
 <07327966-7E81-44CA-A1EA-F227C1C9EA51@arm.com>
In-Reply-To: <07327966-7E81-44CA-A1EA-F227C1C9EA51@arm.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|TYCP286MB3435:EE_
x-ms-office365-filtering-correlation-id: f978a03f-c5ea-46c6-a78b-08def288438f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|56012099006|4143699003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 GU8LUra/Xo+Wk3gHBPN5jFkS/ELuIIGSNHKRfzMKi3dy8BmTEw9W+SmFvF7Yf6ugj5g9z/lFM1Hwe16W2wT4Ln38wjvbEVzy5ltfED4+bU8YWgNOr5yfBD7Xs66o/j9pl2D5yHveJxOzT8jHrSg5HpVno6ky8Y/jvdqBluMUgibxWeV867amnOk7vThpo48Xbtj1gYQFEhs9enQCxfL7K77dTdmeKT8U9XlxPetXqtut1dbgNnTNGi5l41EikhJiY/tY+ck0k7cM7WDWkS8MR8VMAG20i1d7AdLbVPxbRdCxxtP5Rr+axmVQ2efHsCCMvbodhBlY8oZAobLcHVZN8HaSViTvvrj3J4lGoDgf2xuFvO+dkPIvfpysEySHTKMzLQ3nPztqNeJfmWlkESLeD5yxrZlJRBmKWkZ5ubp7jOimstXC4tYLtytoyjMQ3wmqJ0zTuSHuxrEeWFKAOt1dajgZ6dBMzvrAg658w5Bh3VqjFp/sr5lQah73v3Hb8a1zQRHOTcTpPCVLXcJAWZ9ByFqQP75w6D0bpr1Y37qSyoO6hx5NXxIz8WanD4iau3JLlmidby2auz3FTwbOQYSWqoyiMi8sy9eHSekhP34ALJuh9Eko8DtrPVfwNkbNiwAWjBnR0e66DPNizBXlVzKumkceWLPG1L6hV3cR3rMP/V0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?qdqRQlUW/TH8qXJnoNL7B28qGcyNAdXVJiHtqBg+RP+aXsZD7dyMQt/Txcrt?=
 =?us-ascii?Q?EihGfJ/CwMq8w0I8w+kBZu7BhXZVz4OGiz4KTIoNr1yAOJI1fJTcdytxxMoO?=
 =?us-ascii?Q?u/TcSeLKSGLX70bsW76z539E0HuFn2x5GrPxupTTB3ETzZGA1FWtcxswyn72?=
 =?us-ascii?Q?PyCE2YjmdepAuOVcuDkWCyIQv/5u4WURjZjCkMsezNW8DqKc7CBaMaSCMjYm?=
 =?us-ascii?Q?sAAmQ5cunKMspqBPQyGxiFdhdvIVujDdHEXHiTo2xsfMyuU7XWMy1LyVwNqT?=
 =?us-ascii?Q?0g+UYOq7foVMW7CbXJDzfUagSrW1Ks6MLDZUaKj9hdb58VrTKccZvit9ooEA?=
 =?us-ascii?Q?/LYrWuXuR7X5RXM1NU4o+/6L12xbDYQdH8YVGFXSQ+vfTXKYFqyIS6PvYoTp?=
 =?us-ascii?Q?ETGTwKpgQvTByowu9QkCdsqRmXmDn92gLULh0vg7kMGukIXoDeShZy8W29oE?=
 =?us-ascii?Q?15zE4/yI8AVt0bq5oeH2BeOt9GnvTjhGjvj9FWXbKGZL53uXPf6tzKYvc3cc?=
 =?us-ascii?Q?xGZj+UjpYZ3rTcQf6osYUX7xGM1UX3Qq4LmKIO8V5dYF662WwhLGFusLW4dV?=
 =?us-ascii?Q?3Bu0CNuAk20LxKaD3xcABw3E/hNZ39mpgbEss0hhDSTKSK38xW3HCYKkpc0Z?=
 =?us-ascii?Q?1cWDw4GaYukOkN3vegqhIfhXnFTOcGuerolY2BcvSdR62rjwNAWyu8uHpbiz?=
 =?us-ascii?Q?OfdVaHoNhMVNf33lmHWIekWZj1IcLnij9lGjWWJ55PN0kqfxZDpL2oOLvg52?=
 =?us-ascii?Q?KZRgJNQKuXE+jUqin+PQfI7EFIwPvTyuci2zoXjEr3ELs2nUAbXU2tp9lMdV?=
 =?us-ascii?Q?k4cIgtyNK/2cB/myG4lxVuB8KEhRg/JjqK9feSx/HtUOR/CNe3nHNd1DcBpD?=
 =?us-ascii?Q?+CtG+hGpo2uUT5B7KM3cBChj6cka6gO4diTwdAAoUTLKWk4TNyw1SHUmzWL6?=
 =?us-ascii?Q?XYsBw/RSnJlFOCVxQG2YOYH/osl0q3LWhGDQVKKQepnCDUukoBeJyZpNBJOu?=
 =?us-ascii?Q?dSqd0QSnxkmoprNpFnk4IDK6dXf3d8AJMdDLPnVhDvirHd07zS+vQyC6Pie7?=
 =?us-ascii?Q?PgXR1497oDHnKr1bT5UPndwQnrUSzy/ncLZ2CqPDOU6ga0nrXoxrj5Cktcl7?=
 =?us-ascii?Q?X9fCJbP+Inm3sUIf7fz+wI1II1BZzvJYfzZnBvVxSK3AP3i2t56Xx1uCS4B2?=
 =?us-ascii?Q?mXI0R+dFHwArpCqmDMKp+g9f3XpWFryDOBLDold4JKNKZQMOMZ1NFkZ+6Xp8?=
 =?us-ascii?Q?sfTtrsT8/n+GlmEv6dv4x/6yOGPcrjC87FzPXxKkOEoPOXkTOhPmZhBeaxe9?=
 =?us-ascii?Q?8xzagqHpmtmGY5i52ddmZVe3VojAq42W9p6E5xFHfekKrEvbPgJ4YOLE1Dsc?=
 =?us-ascii?Q?WiiYYs3OzqUqm455RIJnAv0r/l5z8nIULtrXM1yladJ5H2AMKSpKal1DjNTg?=
 =?us-ascii?Q?gk5HLFdENfPN19nHNfvhbY8GOs52gcyiU5amWjI+IfnKWNOogmrw5+cUvXD8?=
 =?us-ascii?Q?nKeY6IP5Da+yEN9mHUvtJSLgv7jLBkDXwHUI7oxSszWffNwHhP/dg7BCULxV?=
 =?us-ascii?Q?AG09HlPGW3yf0gMEvXgneOn6aBzHrtyrIvQnBYBYdiLPrXDTDFgaqQ/59UMP?=
 =?us-ascii?Q?bBdqALEvejyTh5rMr6v+RDOPRGvFnG9fN2gVRFxgnraWCtCbWK+ddNZcMvnO?=
 =?us-ascii?Q?LsWcQ08931GMezdiSSwkKV6k9gDefhaFeHPxUMwKfvOnyUa/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f978a03f-c5ea-46c6-a78b-08def288438f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2026 00:26:59.5967
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HGpGs8CsioxzgJG2YnONHamVYg430ui9bbHCkiDkRFUtswFBj7B+IMs0w2WkEmuhMD4yGR4hahtBFyiSKc5byg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3435
X-purgate-ID: tlsNG-720697/1785889625-F20A82AC-B1588DA5/0/0
X-purgate-type: clean
X-purgate-size: 453

Hi,

> Hi Hirokazu,
>=20
> Please use the add_maintainers.pl script before sending to make sure the =
right maintainers
> are in copy of your patches otherwise some might miss your patches.

Okay, I will make sure to use the add_maintainers.pl script.

> https://xen.readthedocs.io/en/latest/contribute-xen/submit-patch.html#ste=
p-2-use-add-maintainers-pl-or-get-maintainer-pl
>=20
> Cheers
> Bertrand

Thank you,
Hirokazu Takahashi.

