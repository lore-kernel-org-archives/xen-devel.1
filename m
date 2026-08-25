Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5527FC61DB6
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2026 07:39:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399075.1635286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wylke-0004Fx-V4; Tue, 25 Aug 2026 07:39:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399075.1635286; Tue, 25 Aug 2026 07:39:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wylke-0004Fq-S4; Tue, 25 Aug 2026 07:39:20 +0000
Received: by outflank-mailman (input) for mailman id 1399075;
 Tue, 25 Aug 2026 07:39:19 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1wylkc-0004Fi-Qp
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 07:39:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wylka-00EVdH-2b
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 09:39:16 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6a8d4697-e002-0a2a0a5209dd-0a2a450387e8-44
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 09:39:16 +0200
Received: from [52.101.65.96]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 6a8d46a3-fae8-0a2a45030019-346541600823-3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 09:39:15 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DU4PR03MB10717.eurprd03.prod.outlook.com
 (2603:10a6:10:580::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 07:39:12 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 07:39:11 +0000
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
 b=Nrw3vmonMJAZojqvURj4wcvelSv6rdXOhR19Pe+nYWfxYwK3a7zJPSm7TX+3q5QG5g/rYmRMeueLkj185eTde2IqOJXJq/3lFFwFSHo1Mn/99Oxq58apeqlEHAfY+4s+HEILwEiXs/6HeYGnVr++A5hDv31mxp6IocaZ20Uty17HTI9zpLx47GpEvJkENh37bQqsXXqsZ43ZyJOq6Zw8lGerk05eUnAt9w/6D2T+IixCGlrQFxcIKyQCNM7IGFadAnIUI7VD1gBoihj1KIwc4E84ed8WNF/kMN6lXrJY8wTAJuWHGJ/FQACKuPOQD/9aLVtg04nPPMGCwgeiYauVRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+TPth6n2kKy+a6Rmzs5qWLzPCLDtD1Tl3cujxRxaLKo=;
 b=fQrJELPC7giL30Z63zJqye8uOr77fC687HdllK80RGvtPCXt2N7wDsK96D4FEd/IwYlvmPuCo3VY6koLjaSY0daYdmcbii/VfiDapRSGcts0yLY4txfWCtt6Qk4m858JNioLJpmtGCg2ym3yTWD9KxGBr0atMM2wRp5fhvGy5RMrHq6SITYcCzqVemFCniTXOJtHkNxGP946/z9f1xj1Gei/4C+mhbePMCTRvhE2vazltb5lXyABLdZKbCtZjHZuV2BrcqAahUwmbyva7UPWEhZkaLgYhcpVwpP8BN/RF8I2m6jAhNSg2PkynHMKnMP1yzY7DAn7yqNLG713DL8RZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+TPth6n2kKy+a6Rmzs5qWLzPCLDtD1Tl3cujxRxaLKo=;
 b=Dlrkpa/6DGyRyFEVsLh928o/Ozfv29OjLUqn/L+oBCe+9L8xGSFurgxy7zZtOxf8xqAs78vTPrtn4Mu0DQedV7I7JTSGzHOVAqRbtBVpoYGuOV1eiP1FOMFpdcN1VfYFup1G8dtXM4vigLQA3uqEVfVTuo43c0+P9bQh2aox3KIsn+MoMUe5kI5b6yj1jotKHzCNDcNuV8GCS4wYbOB8NZSH9gp4Lkcy1l1QaSmmmGos3EsB666ds/JWnLFBoXw4UdFB8a+etcxRQkkkTz5gFh4oy/76uXIU8VRUjBDoNGecHO+B2/ONlV+tGc5GDXktxoeuuR/GwznmQerxXjJaTQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Rahul Singh <rahul.singh@arm.com>,
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
Subject: [PATCH v4] xen/arm: smmuv3: Add support for removing devices
Thread-Topic: [PATCH v4] xen/arm: smmuv3: Add support for removing devices
Thread-Index: AQHdNGTRISDv+UsXckyT4/28tjPeAA==
Date: Tue, 25 Aug 2026 07:39:10 +0000
Message-ID:
 <56e7734d60ad8cca4279a71b4beb21ca51250386.1787303836.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DU4PR03MB10717:EE_
x-ms-office365-filtering-correlation-id: b9266c6c-0ac1-43eb-0ef2-08df027bf451
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|38070700021|6133799003|56012099006|10067099003|11063799006|18002099003;
x-microsoft-antispam-message-info:
 3eFVAoewuKuIsuwAXizEfBGCU/XRwW5NdjCFqhljGJ6lgsbKmpmnBcXqTHnawjniyaqGCGihcYbaGcgyUYrrVC+b+keF6U/7j31Kgegl20yodbTq4jtJ0x3T0T/KUUVwEXI6/x022azqT004F8WkM7eijwoBFY1HGE1zUqUztPkxnpjZUrEqBgjQkYEItkOAMGgjFf2e79/xGSOZHrTWuQ/FWyTFvluTTR75h6RRQx5VGsvaMe2NvGytBgY5W2sRlvmPSr1IRDSnXcwzJjPAME41a5Jbx1dR4gF15kQ3yV2wjgc6y/2Y4uCiNmvZtxo5XS8jkrb9/JqZpyC+wHOErIc0H1WxZPCcwChtF88x4KK9fujVswkTWmnxuiSI0h2Kh59PPK6aNyUw+2nCNXbdrzRpeR8gu6+mIM56EveH78gIxlJTYP02jm3GMR1ZSVOD+KeO7N3v7C2yY36vOGo/sTsEtYvvcLUT4ig1U40127kKoiqkvuKS2X3z1KitN1NsQ7Y+Ewq9THOUJJhhjTiIN0pIFJTQT98HRJQkUthJE2Sm4OW7QgOdZ0tv1kRHGn1KDydkgeexPj7f/pYUWRKIYuLt32Sc/ZYjHNTsNz0wgtpDFDBS9WWVTU702DoVJmBCzeZOBMN4HsfZX54mQtc2QYwb9UjViW6rmo8a2H0DwOo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(38070700021)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?0xgk+Kk0XM0sKz2eowk8+RgwUU45X0LtqDkHtEIslpSCvWDZBha+bz/5iZ?=
 =?iso-8859-1?Q?MKCBTJkLP/fRhqHgllEq3nbsB6wWwIisfJEEkjsi3ybYq8Zg1sHp9Ydog9?=
 =?iso-8859-1?Q?ff8QD3kxekQPvnFqM1PePwUhiW2x2Qu96MzjqeU/M76BHgJqZ7dqxARh2V?=
 =?iso-8859-1?Q?X5DPOJOE9G4HsVstSGEx7f0ZC+rnAGK5lcFsjcz353g7dhzWtje80EqRy1?=
 =?iso-8859-1?Q?WAV/uMScuQ5meUBExtmPirRyfC5k6WWvPmFbCEoq/Tb8CidmsaC2Y5I6R8?=
 =?iso-8859-1?Q?i1RBVvh/WPAu1hVhMxm8VJWht4NZudS1JKdSIBWW5qMvNRRJos29HOBevq?=
 =?iso-8859-1?Q?koSjf622q6Gw58vPZOAxQN7/f1bJU+y/qZbUJPrrkJMeYfohaiwfNCXxA1?=
 =?iso-8859-1?Q?anLSSz6i783sxGYBS9W2h5CA8Uo1aR1YrzakdSNtli/2q5SgvUyRVYBCCN?=
 =?iso-8859-1?Q?QlXDInmO32bkpG6iTjxpqydo3BEEIDH4Z4d8TvxS6qcWEQzkr0YBXEpSdg?=
 =?iso-8859-1?Q?6NaCe+RX18YN/8dSYqgSqpjlfsGYD2qBuaoyAw+cz9IYVVYu0uTGNKyvBr?=
 =?iso-8859-1?Q?zdYefje76L1XZg6xe18d9DVHn6mA+tytNDgtX6Ljy+3E0Tc+sxctqz4Inq?=
 =?iso-8859-1?Q?s66aljpyjEAttEobRX0H6TUX+aIGLTcBZqbGNQmfLaZDZIgJE2483ddkh1?=
 =?iso-8859-1?Q?ZcV/8WKeofdKGKKxd0glGv6K4csaNOpeUNoDPZnnQ7kGG93PabIfWl/vHC?=
 =?iso-8859-1?Q?SQU8nArO2Hc3eYQtWGAQUFHLpgumdIK+xzutxd8rXnFXeVbOGljfZAtqZ3?=
 =?iso-8859-1?Q?6HY7oIcFCPZpk4xh8tatPiWXWvjMi1Y1/YdVODX4ZHhF4TDSSL40scvC5E?=
 =?iso-8859-1?Q?NesVPUlKQAb5IKSc2PDlYhu7lLKK/GvLnaa5dD8O8LlYW/ULJWKCEU3Lxr?=
 =?iso-8859-1?Q?wBuKHZ3mgn428mWQIccIwIPaum/i9sk5OlJ+CGG/7P9UIbxJ0tzLGd3Qdl?=
 =?iso-8859-1?Q?4vOTcWCBAC10dJrraBqJTtw0EQ2uwyvWju1l+Hz22B/rOh4sDrB6RHZjQq?=
 =?iso-8859-1?Q?Q53u9tW/BGcTl6WMT8bxAYx3HT/9oHfhsJpLkeWKXlKMi7d1i3f11SX4dG?=
 =?iso-8859-1?Q?fCEkA2E0HR5CPZVt10S9lOAVCCwaI6fkbvBtfL6GAR6GZpD71Iyqem3tds?=
 =?iso-8859-1?Q?CUf3ZIRqwQeT7KaFzqExCZvwq7tvJLcNeb2sBYfzcvit8DHHQwtUMwnOCC?=
 =?iso-8859-1?Q?uYa+UaLKit6FJR3loJwItOrCsT/T2+ikIRWV34cfdrD19VM1oCboYnLHzn?=
 =?iso-8859-1?Q?Iz18C8h/WXWQeBWwel6PgaXpsWrbtva1dOs5Rjs1/GlMTjNA6jPwAiimk1?=
 =?iso-8859-1?Q?xa9y8Vt8u5Kdc8uvC2w6jta7oIvrgqqgQLzh8b0DDDCSiN8Ic60hvtnEh2?=
 =?iso-8859-1?Q?eURmjoum3fmMNn12kH/gdhHv+MRKvmp2/DskKzTWR5/vol2p7iT03gsAum?=
 =?iso-8859-1?Q?S4Kg6rrkToLUHplkiqyNF+4t/FTTzkm5SObvOFm5U6SDjrETRpGMXlgCTx?=
 =?iso-8859-1?Q?H9JQS0tNJoEWMuDGhSeTQGVFpimcrioQD+wv4Z1hUpGBrnRPO9nzlWic8D?=
 =?iso-8859-1?Q?GVxVat4Hz2wFNIjUSYd0KYMmip5BlWyM/zE0u7fqAmlA4gg9YpCgi9/7lA?=
 =?iso-8859-1?Q?hXoFbqYBZWI2YHAI8kzHaoRjdsGgWU+pujyMlFG9XB2kixuM7goTyw9m2y?=
 =?iso-8859-1?Q?kVKle805HdpYqHeRhsUFaUnHS2pnbP4/XdkusV7amPoxtcbS+lIVm008JV?=
 =?iso-8859-1?Q?ObBKsLfr6WwMJkRgTuWI3Amd+2V1IMc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9266c6c-0ac1-43eb-0ef2-08df027bf451
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2026 07:39:11.2583
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kflpUuYwVmaoQC/g4ZjSnH/lXh4YZZz1IUavaZ96yl1wsDhNZ6re88jss2SL2a+tJ5bnTWC5mcqB2IRw3U465g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB10717
X-purgate-ID: tlsNG-33051d/1787643555-778C54E9-7C830563/0/0
X-purgate-type: clean
X-purgate-size: 6393

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
 xen/drivers/passthrough/arm/smmu-v3.c    | 77 +++++++++++++++++++++++-
 xen/drivers/passthrough/arm/smmu.c       |  4 +-
 xen/include/xen/device_tree.h            |  5 +-
 4 files changed, 82 insertions(+), 6 deletions(-)

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
index bf153227db..3578f36259 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -1493,6 +1493,80 @@ static int arm_smmu_assign_dev(struct domain *d, u8 =
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
+		if ( master->domain && master->domain->d )
+			d =3D master->domain->d;
+	}
+
+	if ( d )
+	{
+		int ret;
+
+		/*
+		 * For DT devices, iommu_remove_dt_device() returns -EBUSY if the
+		 * device is still assigned, so d is always NULL on the DT path.
+		 */
+		ASSERT(dev_is_pci(dev));
+
+		ret =3D arm_smmu_deassign_dev(d, devfn, dev);
+		/* This should never fail because we already checked the domain */
+		ASSERT(!ret);
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
+	if ( IS_ENABLED(CONFIG_HAS_PCI) && dev_is_pci(dev) )
+	    iommu_fwspec_free(dev);
+
+	return 0;
+}
+
 static int arm_smmu_add_device(u8 devfn, struct device *dev)
 {
 	int i, ret;
@@ -1571,7 +1645,7 @@ static int arm_smmu_add_device(u8 devfn, struct devic=
e *dev)
 		}
=20
 		/* Let Xen know that the master device is protected by an IOMMU. */
-		dt_device_set_protected(dev_to_dt(dev));
+		dt_device_set_protected(dev_to_dt(dev), true);
 	}
=20
 	dev_info(dev, "Added master device (SMMUv3 %s StreamIds %u)\n",
@@ -2867,6 +2941,7 @@ static const struct iommu_ops arm_smmu_iommu_ops =3D =
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

