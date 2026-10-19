Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434ADCCF2E4
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 08:59:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1454008.1667472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIjDL-0002px-PK; Mon, 19 Oct 2026 08:59:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454008.1667472; Mon, 19 Oct 2026 08:59:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIjDL-0002pq-Mg; Mon, 19 Oct 2026 08:59:27 +0000
Received: by outflank-mailman (input) for mailman id 1454008;
 Mon, 19 Oct 2026 08:59:27 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1xIjDL-0002pk-12
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 08:59:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xIjDK-00Aw5B-Dm
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 10:59:26 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6ad5dbdd-bab6-0a2a0a5309dd-0a2a4504d906-46
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 10:59:26 +0200
Received: from [52.101.69.87]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6ad5dbee-b57f-0a2a45040019-3465455754ea-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 10:59:26 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by BESPR03MB911498.eurprd03.prod.outlook.com
 (2603:10a6:b10:109::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 08:59:23 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 08:59:23 +0000
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
 b=DrMzcHifj+1+vbgJsrbo5ksbtEA4K4D5pSH4G7NNegBQ1eUuYekV0oiF6sMuOo8PgNi5ZkHgq9whLcS35Q/FrJE9cyP41PNqhqMPsWxb3oN0ZBqZyilwaekrdiB8v5MoIIkidmhNMB8bch99jXhQKmzla2cCT4wfhbHAg2HxDh7OV7kLourN2tE4EYzvN26UV+nz/xIYw05dOAdx9bvX2TITr7aiNzMsZU0M1zcWnIBNaRXPyF93aAQLxSJ8mvLohwdA4j8pP8eC6Q1p3vHHsJewcShKCgWIrIBNLijbcUR6fgFIGBTdIpUtTkyO8i0U/dWDG6FOhUwgs7vIjAKpYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sH4kTxF+BQMlIy/y9w/d+JkjyjOKGLMjkmkpX/++0R4=;
 b=B7qYRbACh9UnK81kHdgvMcZ2VPJkUbz/0wtx1ah0VuKQra0AnCVjxf/5JAjO6OANc55fTUMLpEmZcyrdq41z2CPXmIoTFLFJN4IoDo/ORzX8/9e4gRNrXxH4lLq1EyP4t/bz52rDcNj76MLYyGtbmJ5X5Y0IV67TjtgU2fD3swQngu2LAYjCeFKUp2X4Kmmi32EWVQhxYKqzOi72iOpXJc7HEEzxBD6UNBe0wb7majUG0TxYXrKYGRrUEa1CFFiEU2yCAy1tkUzRfr/JM5C5QCiuEtRfVxPEKx9qvPRp/bCOdVEe08AetDMwo8h0lXL4GHemsRKMLjGPUPr4mb3qgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sH4kTxF+BQMlIy/y9w/d+JkjyjOKGLMjkmkpX/++0R4=;
 b=g9VO9QMOkJeb0IYkVEi/CoaJdRyr/N7DhWcJWNEZ3RqSwHnYQDIJbY6CQ97UaLWHOkV+asvcn+ewzE+snLxm01TODnk3izPRb6lsgo0K6WjfwVAlHoLpipPE3Sts1rxhZxHArpdJQMBo4EdszltHyYaODwFQNnYJMS9okYmKWkDALjSvarjG0UA3B8LguqEg74s2Y9lwfHXmwNao3oVz7eULKfstOgdNV9Eo+MmjZnojIHRZjljo3kmc7uidwWAbMHQMyo47+D7mpmExWeVhzN7qEqWn6IGtxDZrSfCDpTmEgSov/cNN9qUFGQAKm1t3iHRqb1tgNWuVMzQwExdnOw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Rahul Singh <rahul.singh@arm.com>
Subject: [PATCH v5] xen/arm: smmuv3: Add support for removing devices
Thread-Topic: [PATCH v5] xen/arm: smmuv3: Add support for removing devices
Thread-Index: AQHdX6gi8viU2M73vEaKXA5NzGRTmQ==
Date: Mon, 19 Oct 2026 08:59:23 +0000
Message-ID:
 <5bf81a2b31f182d1339e89fb65e445bc20b1a865.1792400044.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|BESPR03MB911498:EE_
x-ms-office365-filtering-correlation-id: 8ecbdcfa-f17f-4e5c-4aef-08df2dbf4541
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|38070700021|56012099006|260925021911599003|260925022911599003|11063799006|261009223027099003|260925021311599003|10067099003|18002099003|6133799003;
x-microsoft-antispam-message-info:
 BNHJhPAzGAG7USU8y1b7/Hg8uj3mUp+UQtsi/SqQG/9VGALwm1SVnSe3R5mUR1XXaaYsN5uE0OgW9NtVJ4Nd+F9ZAPtLOMBxSt5zsu4HW4dL5kqwAHpYDsaeE7+GblY63UnXLOtnIdMYpKU/QD38uNA00fEqMWHz7OlrEnLBz6EqkXMd6drux8SQcFg4mzz5eJm8I83+srYfrcZHZGCatv8ftj0Ld7FxhlvxuAlxsKneNC1CiPRVgyuSrVh7Xd7n40z+UTlK3iM6U1l9lJOHltRVf6aQFFox+mCEyHtxsuN++rkentwBgx+PGwFPvmZoDGW/aZeIrQtud7KNjm9INlQxrMvwNHTMbTEqnkPNofSO5rYD8j0yUdTmM1/TZo7LWJgvu0Y1Jvt+7x70tRgN8vLDwZYS6NN0NkasjfRnqEkmhA2jvIHRriDmdrcZChrCJMfujDequzPnTLAE4BxI3iMInqt4Fxk6HAX7UwRN2yvY1O96OO6lt/elKQv0ePNfxRuIjg7LQRGO7XBDKZ+K5QsFjJL2aSB3xIZa21Bgf7s/4GAS6418zAJQlpwd4wktDcpVMK8TweecGflZhsCa9LjUYxbR/zjvdQV4i+dkk36B8XaH8mowHF8+R9Ak4X76XhER6vRH8NXpTUeZG7b83XQ9K8mccOkKPf8WK1dJ9oc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(38070700021)(56012099006)(260925021911599003)(260925022911599003)(11063799006)(261009223027099003)(260925021311599003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?SFtcWMPcUgHq7/7o04ADry/NnF1aK6uXCVa9Z7hPWJnMI+y0+zGCJI6v23?=
 =?iso-8859-1?Q?rRL5DOAaSnqiW96Xfc2AZ0K64nWUau0rIZC4tcwdqCeyIdQt9nCX+JF1fi?=
 =?iso-8859-1?Q?Xeub4eyB/YO8VA8patxu/DmRAbugyot2tarGGic03eo+uTjw7lAoBfvQO1?=
 =?iso-8859-1?Q?oWs8XZCX3DgxPleOq/GbyxLmGjjblZ0xGdUWyjNrimY5AXZv2Lmf1BjWs1?=
 =?iso-8859-1?Q?aH4ILvluq6gGOcmGDh/4UMfPM+imCo6H+NmB0ZBbCF+sEJVUSi0ZT2UBxK?=
 =?iso-8859-1?Q?XluiHCrgYpCpSoXOY5f2ImcnWPy+PLSXEBNAhQTR5TS/TXEPazHyLxgoZZ?=
 =?iso-8859-1?Q?oZfSNtNRMSgpbiqAHJOvUQFZ1+8VW5XUgm+YdDNDvBFWmnxijD2B3PEmSc?=
 =?iso-8859-1?Q?6hGTSH4JZcyB2bMKRJED6sXWggWrrsPIlU1xo9W54HXVgu5iciKj/LA5d2?=
 =?iso-8859-1?Q?5XWa51yLYQWX3vd+ai3ZwD88dyTodu0PO5ZUqCaOzvSvTX6GiTB1OxVu/p?=
 =?iso-8859-1?Q?Wi8FaJ++BEmlc2Hvr6AjjgWx+aqUX74FyCtZ5FvZffhiAQKiiltzMj2FKd?=
 =?iso-8859-1?Q?e6WsYHVLGUOXJbUQhFPiDn3AxdKfkp0VwGd6Cw5t+/nZSqujNB1i2pqDA7?=
 =?iso-8859-1?Q?rQDPmkWnHr5raTPyy4enx4XsYAbXvWlA0Qm6dJH59oPGOZb4q2j1nTIf7Z?=
 =?iso-8859-1?Q?hSa33NILKXsGHwofUvjFtzS05c8ePiDYKwpEQrRnV2TA2VkcpFYzeGLy2h?=
 =?iso-8859-1?Q?BBS0OIXVXmfAHSvO8dRZTm20CHOB4E5CXyFPV4RXpRp63u7lmYQJYzIk7C?=
 =?iso-8859-1?Q?cCEGJWyish9EnizrttXSDjaD2dX9LI8z9aNETBp12JyHKaQ3M5+GIXSTtt?=
 =?iso-8859-1?Q?19qnc2ytwNdQxxo0Uf6ACJlY1+h6L5HsoyaMl9l5zcZW3qRtAuexZNGyw3?=
 =?iso-8859-1?Q?elWI7eMJnABWP6YSNcNROVk6oaGurhnqAzIh59uOezRDIh0wIdUm1eYtGq?=
 =?iso-8859-1?Q?kVgjKIEEWxpmtWZk+E6hLjDVFxmamekgTjwPnqB5SehiiQs7YfYoVF58wX?=
 =?iso-8859-1?Q?E/1fXkDl6FfltKHpQQaq39VJJGm2gSbtqKKoqJw3B2l1clkllQBmEUoWXM?=
 =?iso-8859-1?Q?a0LwtPO/C2tDgIxd940kIYVQkRiU6iEPbUIzl0OiiB+WhfreuU0UHSG9Yn?=
 =?iso-8859-1?Q?8gHk5PuT90Eli+NdKhiaSsk6cyOtALNHPfAaDrnDWJKOkyj3Ft6ckE+Bay?=
 =?iso-8859-1?Q?qc2aElYjYn8ziKXFKkR6QvfmP8S/UzH2eLg5oXk5QgA21+jkeADR6WvoBu?=
 =?iso-8859-1?Q?w8fdJFdEuaVssFN8gJlaLigTYsiJj1NSrISI/NcrYpOZ/Wu+65/kQeuvFh?=
 =?iso-8859-1?Q?JzKX1A3Lf7vHhIMgkxuDdoNFtKAgltAfVV+us6FAcUgRABH/WBJbKbuFPY?=
 =?iso-8859-1?Q?aJAoziquipEtuylvSIOTyARNfVV9XdCn0pHdrEFa66kJa7gbLXnesIK7mt?=
 =?iso-8859-1?Q?w6Zu30WEJ31xFww4KNbaLVRp8A4Vulw2pZQwglMhV/n3cNeo8NMqQbQ2i2?=
 =?iso-8859-1?Q?2oJbtNiPqEejBSqh076osbUL40Hz8mJcVigqMUFqEer6nGljAVRnRsEJnk?=
 =?iso-8859-1?Q?HY68XFViqUe8p6iuK6wQBH0It4dsWgUBcvv/FB9qqsBoBr7yeC6nbg160J?=
 =?iso-8859-1?Q?Fs7PvNJNCkIhClfuAm/xSmlj2VSzFpXZawBu364SsesLWhP+rRY5T5BMc1?=
 =?iso-8859-1?Q?FtIqGtm3BarUnatDI8CAQ+08jHA8PT9Pg7zlTn3V6q2TCHxsbjPd0Oh3v3?=
 =?iso-8859-1?Q?89/pgI63ng=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ecbdcfa-f17f-4e5c-4aef-08df2dbf4541
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2026 08:59:23.3451
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cKKDDiD33PCxtxLZHU0vKj8qMkf0YwokFsIxtGZHIB2i01rdMH1DRU5MOEQBtYEso8d1FAEbwqqTGgDoFIVavg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR03MB911498
X-purgate-ID: tlsNG-ebf023/1792400366-538C1B50-84501B9C/0/0
X-purgate-type: clean
X-purgate-size: 6382

Allow for removing devices from SMMUv3. arm_smmu_deassign_dev handles
most of the work by disabling ATS and zeroing STEs. Additionally, unset
the dt_device_is_protected flag and free no longer needed smmu_master.
Free iommu_fwspec for PCI devices only, for DT devices it is handled by
generic IOMMU layer.

Rework dt_device_set_protected to accept a boolean parameter, update
callsites.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---

Tested on QEMU with SRIOV series[1] by repeatedly enabling/disabling
VFs.

[1]: https://patchew.org/Xen/cover.1772806036.git.mykyta._5Fpoturai@epam.co=
m/

V4->V5:
* drop dead domain lookup on the DT path
* remove assert on  arm_smmu_deassign_dev error
* drop redundant IS_ENABLED(CONFIG_HAS_PCI)
* fix indentation

V3->V4:
* s/u8/uint8_t/
* assert pcidevs_locked
* assert deassignment is only reachable by PCI
* fix build error with HAS_PCI=3Dn

V2->V3:
* free fwspec for pci devices
* remove testing note from commit message

V1->V2:
* check for phantom functions
* simplify pci/dt device split
* improve error handling
* don't try to free master for unprotected devices
* rework dt_device_set_protected
---
 xen/drivers/passthrough/arm/ipmmu-vmsa.c |  2 +-
 xen/drivers/passthrough/arm/smmu-v3.c    | 72 +++++++++++++++++++++++-
 xen/drivers/passthrough/arm/smmu.c       |  4 +-
 xen/include/xen/device_tree.h            |  5 +-
 4 files changed, 77 insertions(+), 6 deletions(-)

diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthr=
ough/arm/ipmmu-vmsa.c
index fa9ab9cb13..0648f9b407 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -1367,7 +1367,7 @@ static int ipmmu_add_device(u8 devfn, struct device *=
dev)
         }
=20
         /* Let Xen know that the master device is protected by an IOMMU. *=
/
-        dt_device_set_protected(dev_to_dt(dev));
+        dt_device_set_protected(dev_to_dt(dev), true);
     }
 #ifdef CONFIG_HAS_PCI
     if ( dev_is_pci(dev) )
diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthroug=
h/arm/smmu-v3.c
index bf153227db..e1af615985 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -1493,6 +1493,75 @@ static int arm_smmu_assign_dev(struct domain *d, u8 =
devfn, struct device *dev,
 static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn,
 				 struct device *dev);
=20
+static int arm_smmu_remove_device(uint8_t devfn, struct device *dev)
+{
+	struct arm_smmu_master *master;
+	struct iommu_fwspec *fwspec;
+	struct domain *d =3D NULL;
+
+	fwspec =3D dev_iommu_fwspec_get(dev);
+	if ( !fwspec )
+		return -ENODEV;
+
+	master =3D dev_iommu_priv_get(dev);
+	if ( !master )
+		return -ENODEV;
+
+#ifdef CONFIG_HAS_PCI
+	if ( dev_is_pci(dev) )
+	{
+		struct pci_dev *pdev =3D dev_to_pci(dev);
+
+		/* Ignore calls for phantom functions */
+		if ( devfn !=3D pdev->devfn )
+			return 0;
+
+		ASSERT(pcidevs_locked());
+
+		d =3D pdev->domain;
+	}
+	else
+#endif
+	{
+		if ( !dt_device_is_protected(dev_to_dt(dev)) )
+		{
+			dev_err(dev, "Not added to SMMUv3\n");
+			return -ENODEV;
+		}
+
+		dt_device_set_protected(dev_to_dt(dev), false);
+	}
+
+	if ( d )
+	{
+		/*
+		 * For DT devices, iommu_remove_dt_device() returns -EBUSY if the
+		 * device is still assigned, so d is always NULL on the DT path.
+		 */
+		ASSERT(dev_is_pci(dev));
+
+		if ( arm_smmu_deassign_dev(d, devfn, dev) )
+			dev_err(dev, "Removing anyway\n");
+	}
+
+	arm_smmu_disable_pasid(master);
+
+	dev_info(dev, "Removed master device (SMMUv3 %s StreamIds %u)\n",
+		 dev_name(fwspec->iommu_dev), fwspec->num_ids);
+
+	xfree(master);
+	dev_iommu_priv_set(dev, NULL);
+
+	/*
+	 * For DT devices the fwspec is freed by iommu subsystem, but for PCI
+	 * devices we need to free it here
+	 */
+	if ( dev_is_pci(dev) )
+		iommu_fwspec_free(dev);
+
+	return 0;
+}
+
 static int arm_smmu_add_device(u8 devfn, struct device *dev)
 {
 	int i, ret;
@@ -1571,7 +1640,7 @@ static int arm_smmu_add_device(u8 devfn, struct devic=
e *dev)
 		}
=20
 		/* Let Xen know that the master device is protected by an IOMMU. */
-		dt_device_set_protected(dev_to_dt(dev));
+		dt_device_set_protected(dev_to_dt(dev), true);
 	}
=20
 	dev_info(dev, "Added master device (SMMUv3 %s StreamIds %u)\n",
@@ -2867,6 +2936,7 @@ static const struct iommu_ops arm_smmu_iommu_ops =3D =
{
 	.unmap_page		=3D arm_iommu_unmap_page,
 	.dt_xlate		=3D arm_smmu_dt_xlate,
 	.add_device		=3D arm_smmu_add_device,
+	.remove_device		=3D arm_smmu_remove_device,
 };
=20
 static __init int arm_smmu_dt_init(struct dt_device_node *dev,
diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/a=
rm/smmu.c
index d63c901551..4d2f71f152 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -825,7 +825,7 @@ static int arm_smmu_dt_add_device_legacy(struct arm_smm=
u_device *smmu,
 	if ( !dev_is_pci(dev) )
 	{
 		/* Xen: Let Xen know that the device is protected by an SMMU */
-		dt_device_set_protected(dev_node);
+		dt_device_set_protected(dev_node, true);
 	}
=20
 	for (i =3D 0; i < fwspec->num_ids; ++i) {
@@ -862,7 +862,7 @@ static int arm_smmu_dt_remove_device_legacy(struct arm_=
smmu_device *smmu,
=20
 	if ( !dev_is_pci(dev) )
 		/* Protected by dt_host_lock and dtdevs_lock as caller holds these locks=
. */
-		dev_node->is_protected =3D false;
+		dt_device_set_protected(dev_node, false);
=20
 	kfree(master);
 	return 0;
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 06d7643622..76ae1e674a 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -300,9 +300,10 @@ static inline domid_t dt_device_used_by(const struct d=
t_device_node *device)
     return device->used_by;
 }
=20
-static inline void dt_device_set_protected(struct dt_device_node *device)
+static inline void dt_device_set_protected(struct dt_device_node *device,
+                                           bool protected)
 {
-    device->is_protected =3D true;
+    device->is_protected =3D protected;
 }
=20
 static inline bool dt_device_is_protected(const struct dt_device_node *dev=
ice)
--=20
2.55.0

