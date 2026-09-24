Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B44C98311
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 10:00:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1431980.1653611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9gFB-00006K-Jy; Thu, 24 Sep 2026 09:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1431980.1653611; Thu, 24 Sep 2026 09:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9gFB-00006D-GZ; Thu, 24 Sep 2026 09:59:57 +0000
Received: by outflank-mailman (input) for mailman id 1431980;
 Thu, 24 Sep 2026 09:59:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alex.brett@citrix.com>) id 1x9gFA-000067-2t
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 09:59:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9gF9-004jZt-Cf
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 11:59:55 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alex.brett@citrix.com>)
 id 6ab4f495-e002-0a2a0a5209dd-0a2a4502dcfa-36
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 11:59:55 +0200
Received: from [40.107.208.22]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alex.brett@citrix.com>)
 id 6ab4f499-6ca4-0a2a45020019-286bd01662e0-3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 11:59:54 +0200
Received: from CH7PR03MB7859.namprd03.prod.outlook.com (2603:10b6:610:24f::20)
 by LV8PR03MB7447.namprd03.prod.outlook.com (2603:10b6:408:187::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Thu, 24 Sep
 2026 09:59:39 +0000
Received: from CH7PR03MB7859.namprd03.prod.outlook.com
 ([fe80::967:59c2:d16:1fcf]) by CH7PR03MB7859.namprd03.prod.outlook.com
 ([fe80::967:59c2:d16:1fcf%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 09:59:38 +0000
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
 b=gN0onTk0sFH9Ev1ZLYuy3wNISazA+oxMqmouaOSgvVjJP/w0U+LDEGbfgd4a8Ke3tTIEXEkc8m/pizKKvtsml4hETB3UaDC1GtnnbBzqPJoML2IjRqUNbKtpakTFMyDkJQr2sTKxeYCVFfZolnItqmudyPMtCF3G+I6mvpq00fPnqTkYmV6nLrbUG0AHH3aOeGNyEJTOIdRuyMT9hdQaGcEr7Eb/pTVIZRwbfUgEmR7VA792fsyPJiVlDh02fn4JR7P50L/vT8U7suyagtp4m8ubDWcZZpssxOS0YHG+deiX2Up2XPbBLhx6ptdrlLhAEC0z31ex/8R8j6DSxuuloA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=roiavHcKqhBCze3i54BYoCG/anwhCeZEQ4CiwzLncz8=;
 b=FnDBvCskzr8KXCKwMNE3x+FKnIGW1/QKlqxPIkVVlGPaI5lZi/2qZFMSofn4q1L8yXWTtO0WQoXvcYszAu4VedTxxtLi4ew9Gbgz2RWGJ69EsJXOJa0dDy1rApAkfcqqj16LvEsf1RuHTZBueI86rB2RX/ghficDDgEQXb4fiR5ZeFBZBJOKVbXQ4NBpo2n8/XFhxpjVQue8OoYGy/ftreKukkZCssVpLB7cbVrWbY0YvUvi1o2E210rba++VE1ab7hSsY/nv/wVN2SyV5XXwsRJ+KhoiNrPcrwCf0i3dYPP7kvA6xqg9keuT58VvJ3lE0GkYaQ/wGXmzGIy+J/Zhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=roiavHcKqhBCze3i54BYoCG/anwhCeZEQ4CiwzLncz8=;
 b=J3WoEIfxKzsvyY1hYadP3Xl+hsAMweFh7dDEdI27DYjDdmIxNpnuliJX56ew5NrrZFpbhiPcaDK8TGDYqJM3/5vgKmDTEgcl+q7tfHxGwGQP4e4zvJPWbd+kGMCkVCaqXx4UCJ9jYfAlNGU0MnmOm8Ak/LwAoHF1RkJ0ON6CcV8=
From: Alex Brett <alex.brett@citrix.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Updates to Security Policy
Thread-Topic: Updates to Security Policy
Thread-Index: AQHdTAT75JUOq4hc+kK5Rpl1wLOZ7g==
Date: Thu, 24 Sep 2026 09:59:38 +0000
Message-ID:
 <CH7PR03MB7859C97A009F3C992196B129E3812@CH7PR03MB7859.namprd03.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH7PR03MB7859:EE_|LV8PR03MB7447:EE_
x-ms-office365-filtering-correlation-id: 15565d4c-221a-4211-d889-08df1a228be6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|38070700021|10067099003|11063799006|56012099006|18002099003;
x-microsoft-antispam-message-info:
 Ev9nsEytTi2uiFEwj+7fg+M9keyrG9ywMwidj30/y0Tqogagfx89evsZDldoa0FNpIA+bmgGQJ8f/wSsg3HVzGf2XIGVy7+CfBTAem0A7OV+OJfXPViFES/7AuFn2bO1se5Q3rYG/MeyFG1Nk1D7HCGRVFuikfmiuU9UBhK0Cuc2Y4KAok7rmlue7wfJXFKgEH6slhtOpN1xYP0Pfyd8cokTzxcN9i76lXeCcRGOyfPpnEk4xz3CRwfYGUUTvDwGdOgSrzTDiP3mUXozsLDlm9T3Oh9I1BR280POyTMOinubclIuwmSzN+8ivHKtMt68S8lxfEniX4Kzv7gKv09AoTQuqWbLPaET6/q2hPYKzimoYz3ikVoUBWLme6618Y4VZUe7RxeQu5SDbmHlivVpw3q8sKVvYreVKVrvgi2qkcpfMdOySFjGHf7RtCk7TA5vEwvMXviJnv4KzO3IfzspL6jpXKV9Hu48sMgf/XUPGVcLQrkgqHfgxaOwvOppgpQlVCFU4dCR3CeW3WcjzthnfonHffhrjbxIW6Q8IbLwPBslF9oVSJH0Y9jOjKw0px5XtciwRd26FosUt74X41nMy6KvjYbjSigTJHZ15VNa91rh1rx9Rwpq94CnzfOHOpnYCZXIUA9z9R6pUPpLmm7VAoTw4X0rpGh72Dg8pD1JAq4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7859.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ZdxK9+diVU9BjTSA4v6T7LL/dbWYXE3YPcak/n/3XYJxZUZFkUjnkdt7tY?=
 =?iso-8859-1?Q?3LINGH/b2X5fJqqc8B7dBA6UrjgQe2GaxMxK+e3grMZPi2VI3Pa+IP3Y+5?=
 =?iso-8859-1?Q?AQW9XruIas8ki+fxG1oSz8Fgtos1LiL1oWIYlmhzIKdBGnwPOIgd/Jpmdl?=
 =?iso-8859-1?Q?RcuJ46EmsTiuvhlfYuLtfiYUziT6mVQkXm46sFjcTzlHilN6n4SMxikVuh?=
 =?iso-8859-1?Q?YGDXdyzcuH+Tw9eLypn64i3RQkWhe4KsVOEYeyDCx+lTmbt5jQNelLI5SI?=
 =?iso-8859-1?Q?FB3vC36Jm7iMLAhrXnVbuNg1oZaJa6XD049RpdFHZJmCM0CSJTXS9ZFzqt?=
 =?iso-8859-1?Q?c1mc7Q54dZNbLm2Aj42fZ9wOfIdwST9bj8N9xIocQsc6mdgXnWl83FOaGh?=
 =?iso-8859-1?Q?jsIYWXES/mwS0bBq4j3n2o+LLqR/KEFB0AcuBx6NncUCwFhbijYELPyRpu?=
 =?iso-8859-1?Q?2tgM152Ba8KrQNKx5B3Lh0PjgBOscLaIaNq+/pRTmDpjBNvfj9I8TdNqgC?=
 =?iso-8859-1?Q?PWfzSHZLTWwzOmNR8TGPypBF+jWa9V74MuXAyUdIzTxte/GjIFGNB/OpAs?=
 =?iso-8859-1?Q?H0Osp4WXptH6mLJuvgWmn9N6Y7j63oZS0O75D3B2G2X+rgJBP9Jqx/lPF1?=
 =?iso-8859-1?Q?DHoWE61rntl/4Mdtw8JkRGpEqwy8Bb8mLkKLwFiPGU1AwDP/qwxgC593db?=
 =?iso-8859-1?Q?kOKx2U84Irgdl6x3uuH3OukSQeJC0rojg4u7FRx5nvqqH0HbaDprlvSjAI?=
 =?iso-8859-1?Q?HmHCsiPOMDtLGgbC/SbhsdXIQiC3ajswVsKivxpyMEhjF2seyN7wia+vVN?=
 =?iso-8859-1?Q?ntiQ/SiDMCWSy66hJzrQ34mFRolO+Ow1cCwtAZmxH4BVpSz/4M0wTitgu2?=
 =?iso-8859-1?Q?pFNd+YpNeSXdiJAVq2tcBac4TEYSYrjHnoW8Lh7vdDOus2O90F5XloCWim?=
 =?iso-8859-1?Q?dM1yTS/rBGPAOqcIzLwAVKF5txziYlr7Ie1GfebQaSU1lSFSjFVuzCPj3b?=
 =?iso-8859-1?Q?5WGg2vXmhLMYwGVISxLdNyfNJ2FNRhTzw26xVPLrLKdAHNGo1hPr89Gkh1?=
 =?iso-8859-1?Q?a7XauytnR+hRDpvuNkAqkiQr0pzCxjzK4LhGUKPaGxX4w8xWnjUJwr+f/F?=
 =?iso-8859-1?Q?6oy8d252HvaZ2Ry7crJrCJyqFxs6+AOq8SZLzvWKXD1jKSYPqcC2GLDq/c?=
 =?iso-8859-1?Q?rgd1R8OurGB/GYL74xJJZQmk4RY/FL2yGOdU1Y/1aFQwz4RdHbIRsZIJ5A?=
 =?iso-8859-1?Q?w8wFFvKHOJSbGrJgnRh4cmrl0M005UspRDTX+manO2XHlpIjSX57YreyzK?=
 =?iso-8859-1?Q?LAUK+03rDTASFurhBVOxHJ2hebafvXcokkKYcaQZpX4K5Pz2zqj5V8BrX7?=
 =?iso-8859-1?Q?t5YmrCOqQxs0iIf/b9xa5GHHNJ7Khza4/f2pSNSDKigCIOG6sLOYvBuZKU?=
 =?iso-8859-1?Q?VDB2M3iMSF/j+/UjlGpGRDwl6qzSsxfSBnz/7bgbhYVraCH03JPqJCgu7u?=
 =?iso-8859-1?Q?y6DpT+R79n1+XU9HjMnGLHe6UAmLdgoj6siasPfOPbgPThLCY65B5sFFqo?=
 =?iso-8859-1?Q?Q1DCL12Jmu3frDM6UYuuUhjzVAiyP8lYwLTTap0NnX4CIlS4Y1RFSn/nsV?=
 =?iso-8859-1?Q?t4ccONT5vrwaowVUlRdpput7BTMfvYW2/OXrJC/1Jh0BzwXm9v3sPI5o96?=
 =?iso-8859-1?Q?O0x8b+QegaT1yIKXToDfVF2+W1eftneL5zZfS/DIp+h3bTD1oSIMBMBu2F?=
 =?iso-8859-1?Q?xOCsJTl3YUkpM+q5J7KezQ4tvkK9jI4rwmbfDu6HNDJVoHdhKii82c7PTW?=
 =?iso-8859-1?Q?JILw6qzCWw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7859.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15565d4c-221a-4211-d889-08df1a228be6
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2026 09:59:38.8009
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XiCEdrpC6ZoOLj+gW2GJgIhrybuhaaD8EQap3+L0/cIxpUZdZ0/ugw1QPhNEP2NgQ21VEjOiIPVm5FYrY9nnPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB7447
X-purgate-ID: tlsNG-720697/1790243995-660A82AC-CD799038/0/0
X-purgate-type: clean
X-purgate-size: 475

https://gitlab.com/xen-project/websites/www-xenproject-org/-/merge_requests=
/107=0A=
=0A=
As discussed during a design session at Xen Summit in Munich on September 1=
7, 2026, I have raised a merge request to www-xenproject-org with a draft o=
f the discussed minor updates to the security policy.=0A=
=0A=
(Not reproducing the patch here to avoid mixing email and merge request wor=
kflows)=0A=
=0A=
Kind Regards,=0A=
Alex Brett=0A=
Chief Engineer, XenServer=

