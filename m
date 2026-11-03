Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17789606A31B
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 17:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=nfjqiOfq
Received: from list by lists.xenproject.org with outflank-mailman.1470336.1679066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOIKo-0007fz-Pg; Tue, 03 Nov 2026 17:30:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470336.1679066; Tue, 03 Nov 2026 17:30:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOIKo-0007fq-Me; Tue, 03 Nov 2026 17:30:10 +0000
Received: by outflank-mailman (input) for mailman id 1470336;
 Tue, 03 Nov 2026 17:30:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xOIKm-0007f5-VU
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 17:30:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOIKm-004Jxu-Bw
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 18:30:08 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea19f0-8faa-0a2a0a5109dd-0a2a450ce9fa-42
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:08 +0100
Received: from [52.101.84.142]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a1f-f479-0a2a450c0019-3465548eaae8-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:08 +0100
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by DBBPR03MB10511.eurprd03.prod.outlook.com (2603:10a6:10:53d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 17:30:05 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 17:30:05 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c2QqHc5MkqXUphEPcA0+lmEgsiiDaSCrMLjJ+M3bfa+odS1f/OUu/z/bo2+WxgFktnvRy5h+OlcZudDZijH4me6Yq219Jx7NlzAJ+u1v5UhoLJry9rn0PQSxc6v5DVivI48Zj8nzOmy6/lLNqkzW7CyeRSDRe1F0ab2z182tU7dwuUkM5ilbAFKhJyVSwXroBow8FdlTWaE7dUvEwWVYg8w7js6lB5OFKnxYMzX3Eb9r68q8SoYfUoVTLWILdYDAzs5n6m6BkbdnJVqSJYYkWHgkI0bH/NtsB/Y0EC0VVxnvPNUJWQIcZiwwINeI3ppRsIjCniQnXm3chJy0UV5Elw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3DU40BiABrQdxhbK/eF3/53alfkL2YUAEvmS1HsPuWA=;
 b=EmnPXZXDiXUefJ+HJMyiowWnOFridmGyHvkZiHh8baYW6DD6hMv27XT4oZw27zXNLgN5sF5oKmTNgsP+Mc4O/eQTkTAJDTTvPj6sLtzIxzouViJx0svGnuxEENmCaqhNphwvkaMP/HLnrKHvQr0suFCjv3ve+3edPPNk5LyXA2ur7KcGEdQVxXQEFJK9pQPYkZiDFqUNRJV/LDKFgV/8TQSdcmrHOONXOPigFtVStHxIXsjWNknpfiy7WFIOmOVvhzWPehicZyfPkbUOWRBcRWvbFhtHwyT27ymjyZwxhOdd9LBjX2DDp/biK5Jbf3ZyVtj0Cto0rz4GOe22B7PkxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3DU40BiABrQdxhbK/eF3/53alfkL2YUAEvmS1HsPuWA=;
 b=nfjqiOfqu/NBNd+Zfc1YiBxpevuXFRAg4jxjnl9E3nx69ECInfafXOYM15Mu05Xpj28fAOVk2j3G7ntg+RlLixvBySnxXLN5nZkUfwsj1KkPeWDgCH9/pD5TQ91pGU81xYk0FbSyfT44M3yqvQZZkynuXkWDAQRmMDep+rSUTs7NPu2Vh9ekJfqLjiA/Y9yqRNThERocQHve0EteM7X1tXrjqq0YNhZLeed2aM60R4W3h6Xh4kbd1zz3/ISuvreFXl73fa688c977rH5PXAQ/M/5LQ88ZpGNxdqwfUFZA6mz5ZKNT6cZntcZ7gtAYzEMoiMHB7hyyQ0L/6Uoqm+yjg==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jean-Philippe Brucker <jean-philippe@linaro.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Joerg Roedel <jroedel@suse.de>, Nicolin Chen <nicolinc@nvidia.com>, Will
 Deacon <will@kernel.org>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH v5 01/22] xen/arm: smmuv3: Maintain a SID->device structure
Thread-Topic: [PATCH v5 01/22] xen/arm: smmuv3: Maintain a SID->device
 structure
Thread-Index: AQHda7j2+ITlFPDXdUibDA/6hjTgXQ==
Date: Tue, 3 Nov 2026 17:30:04 +0000
Message-ID:
 <9a738e6cf9c913131239a2518cda3fa9b3b3f53f.1793726692.git.milan_djokic@epam.com>
References: <cover.1793726692.git.milan_djokic@epam.com>
In-Reply-To: <cover.1793726692.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB9587:EE_|DBBPR03MB10511:EE_
x-ms-office365-filtering-correlation-id: 6a8289a4-75bb-43ba-f8f0-08df39d01945
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|38070700021|261022075727099003|11063799006|56012099006|261009223027099003|261022105027099003|261021121427099003|261021123027099003|261021135927099003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|10067099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info:
 wydYI5b82iDkhCZt5LwF7YwZTRUQTqTzJKBcgS7KU5OQfABNvCivgW01JeQG4ZY6LYgoNyQwusy8PMn99rTsmn/TBZS9E4Lh783yazirpSCD+7bAQTRoc5/934epKFLibMEyqF4rKJguqRD9FLXQMP5LTtDsFA1FPAxGovI9qPJvTKNq6IOblG9G3d+qbJ9uPo7n0RsZY71IFp+SgVHDurXHNK+nCHeoVENTPdLtF6vFF3sIm0vy5RyufOS47nI7rM2h4qb3hqBckmwvZlMTGfu6PIjqnW4BwK4SEYeD+26O21PAgNoVhHJPfZ3R6XzPbcVSYUkDkeGQdtzvhGTkTma1Np7Vmxh3vcZXj+p86p1s4H/eEGq/4UswRQcGpJd4QYpAAYe/U1rrk315Mn833vEbXUndkR3xg0ALU5llmChn9me8deehRMOO96BqspJH3HpqZB6d8tdy5VAxQtOZm+1FKmHEe91W5/u/DWMMxYlX6Eopc8cDudxwOzMHrkJeWBycDOcCeSzWJKqr+2+cmNR4DM+7Tm4x4WJ3EOBeWRHq+OyAedc1LHlAfNdmh/VON8/nteUPKpLJ9pJuiCHTkUO/tVY/vq6+NzfQhwlgB3m2lhMgicYD/2bL5aLYqEIBFsux+Da8+CrKUEwdoO+JylNxT0RQlBxTwwI6yIX9Xvs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(38070700021)(261022075727099003)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(261021121427099003)(261021123027099003)(261021135927099003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?50ROC3u3HxvbtNtxx5DJV5Yyl1n8MgHLYPMBIjMjyxMjoVdgWYS7wzqdVV?=
 =?iso-8859-1?Q?LSq6vnTAngooNlF0Ihqa7228RD57UB2hhIxnGDmuWp4c1oaE0zrENSMp7x?=
 =?iso-8859-1?Q?OlWORzllJ2UFU8sEh2PMXHi0lm/liYi4xbgzG3t7v5+7DGRZ2NexpTlIQM?=
 =?iso-8859-1?Q?pVNNqFslAVUB44f3cHdcXdtNW5d3ngRAzAZHP8JYe6qbNMzJtZRx6EMo+E?=
 =?iso-8859-1?Q?pcMv3Q834sRM/BoE2RqfBRmW9J8RnNE4rqEP5SB+TGN1OAXjMTZVIDXZah?=
 =?iso-8859-1?Q?l1bbf/NC8ADdTbG4CU+yNDcy0fj4uHEcaNKMS1GHZyMGAbydzhjvFQifxm?=
 =?iso-8859-1?Q?fPul9e3Q9pFaUp84K+0SaqCQQfceoUtfydHVmLXwtVnJi5eToMxbbescRl?=
 =?iso-8859-1?Q?8NF0nNFOrZkN6YpEdj3T8o15GY6kJ0lvu2GomfDD3Rc8toXbnw6W2HeMxI?=
 =?iso-8859-1?Q?VRqmLE3meXcKk3ANUzwEDdCyKp3iX59bSnXY/KimX+8QjDMqzzV3QSrrMp?=
 =?iso-8859-1?Q?dmtLLYzqhcVji4DJIuFkJInrf8PeyU87TW3B3E4sIJRQUfuOhPXL0wbWsf?=
 =?iso-8859-1?Q?0CKZLFiRK3j8E1W53qNc93+NpiTNc6Aca7szXb/XV32XJn8n8UX/xHx8nZ?=
 =?iso-8859-1?Q?K3dWbWBA8heQwW4a5xEWujP1P5NkiNGrNFG3pnEWAjYquzg6KT0PdgUqt4?=
 =?iso-8859-1?Q?ot53gw7eV5HsqJrM95Z2e5Nf+Dh444wckuy68Ikn1pPCjl+SYy9bakz2ty?=
 =?iso-8859-1?Q?TsR3IrikXmMBH//EG5nh11UdCZivr0g/oJcimLoReY1D02ZGRJNp7klJBi?=
 =?iso-8859-1?Q?IO/1t2Xcn+NC8h3I5JKqZ+3OUaNaZjFDgfU9FA3ed72QBB4tk42I+w60Hj?=
 =?iso-8859-1?Q?BDJxDVTmH/3RL0zWSOOdC61GtGNW0/wfOB8pL3VNEvl1BKn0ooDsY614+3?=
 =?iso-8859-1?Q?GC8jGSHux5OMNlfludYR8DGBr5GD6Mk46Xj1OrWPeK2HlnaNM8yB+3yVHH?=
 =?iso-8859-1?Q?+LC93VVBNBHftOhNH+A/Z+BLsPeX4ZyFlHSjeXHJt0Z9oqjTrumxNGkZoU?=
 =?iso-8859-1?Q?czgwnK31YE8E0adfkZxr3yPBgc7WARdeK+VpGk+7qZX7lJNMIPCfJTcELZ?=
 =?iso-8859-1?Q?qW1MrMXgIJTx23z3cS3yOsY97/gPHgxWWE6HfrduNV4dpqOqwXsud2fBHv?=
 =?iso-8859-1?Q?OKeYw95t7x2D+wmTwm/58tlomojnPrr2axutSrhuMISW4J3teHznDmGiSH?=
 =?iso-8859-1?Q?Z7Ova6Rv7+gdvL5ckzeFB4dyVNK3nysbEfn+hSulwEXJubWG/WV1puWeW+?=
 =?iso-8859-1?Q?15gpvKNie484FNB6PIhCzXZM/q52ax2QUCDRYlon0U7E1bL01k8RwKmLeR?=
 =?iso-8859-1?Q?FW7V7WpBYVHsMX9e+h3ZUFDbgwd8aUQUbP/EGwrFHP6APd1mUidsP8QtOV?=
 =?iso-8859-1?Q?usKFBxOaCZBDBuFKg2Ngy0rw/c76GsMcPP++Z2sKEGqOYhHOWCFNr8lueu?=
 =?iso-8859-1?Q?2JRAy4F7omXbE0iegzf3g9BngvsSHb2PzbA9Psck2D7CZZGIKMCcxiQS6O?=
 =?iso-8859-1?Q?ljs065mI8dNWurZzaT+47Xdd97xNONcuEZy0RQMNBdcD7XgIv0ai9L8i9x?=
 =?iso-8859-1?Q?yS9iawa/D6ZcC3cZDEY2s70fxiCW4vEC9rRzK3GHZC30RN/F3EUJXr+4t0?=
 =?iso-8859-1?Q?+QEc0epkHuFc44XtnZeBepBRQ8nPcrbf/hpa62dy0ogzFkH/TIzxLmuik/?=
 =?iso-8859-1?Q?353Q/AaWG64Y0hkI40hzy8c8FTY4lCskLcNBBXzAUfA9eUbbldVszYqush?=
 =?iso-8859-1?Q?RwIqvnA+gQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a8289a4-75bb-43ba-f8f0-08df39d01945
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 17:30:04.9644
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6AhOp6uhc5cTWl4/yVkebvMGLKON2JA5QQX7yIu+ogS8kMwW/2QRwBgeR9UOaPID5o4hkIEAi3K4h/cmJ2JJdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10511
X-purgate-ID: tlsNG-d25034/1793727008-002F0A5B-3095740C/0/0
X-purgate-type: clean
X-purgate-size: 9873
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Backport Linux commits cdf315f907d4 and b00d24997a11, adapted to the Xen
SMMUv3 implementation.

When handling faults from the event or PRI queue, we need to find the
struct device associated with a SID. Add an rb_tree to keep track of
SIDs.

Also handle duplicate SIDs, as bridged PCI devices may have multiple
streams with the same SID.

The backport is adapted to Xen's SMMUv3 driver structure and types.
Fixes are also included in the master insertion rollback
and teardown paths to correctly handle partially
inserted stream entries and avoid leaving stale rb_tree nodes.

Linux commits:

  cdf315f907d4 ("iommu/arm-smmu-v3: Maintain a SID->device structure")
  b00d24997a11 ("iommu/arm-smmu-v3: Fix iommu_device_probe bug due to dupli=
cated stream ids")

Link: https://lore.kernel.org/r/20210401154718.307519-8-jean-philippe@linar=
o.org
Link: https://lore.kernel.org/r/20250415185620.504299-1-nicolinc@nvidia.com
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git cd=
f315f907d4
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git b0=
0d24997a11

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/drivers/passthrough/arm/smmu-v3.c | 177 ++++++++++++++++++++++----
 xen/drivers/passthrough/arm/smmu-v3.h |  13 +-
 2 files changed, 163 insertions(+), 27 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthroug=
h/arm/smmu-v3.c
index 232df2421c..d49085b38f 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -809,6 +809,27 @@ static int arm_smmu_init_l2_strtab(struct arm_smmu_dev=
ice *smmu, u32 sid)
 	return 0;
 }
=20
+__maybe_unused
+static struct arm_smmu_master *
+arm_smmu_find_master(struct arm_smmu_device *smmu, u32 sid)
+{
+	struct rb_node *node;
+	struct arm_smmu_stream *stream;
+
+	node =3D smmu->streams.rb_node;
+	while (node) {
+		stream =3D rb_entry(node, struct arm_smmu_stream, node);
+		if (stream->id < sid)
+			node =3D node->rb_right;
+		else if (stream->id > sid)
+			node =3D node->rb_left;
+		else
+			return stream->master;
+	}
+
+	return NULL;
+}
+
 /* IRQ and event handlers */
 static void arm_smmu_evtq_tasklet(void *dev)
 {
@@ -1042,8 +1063,8 @@ static int arm_smmu_atc_inv_master(struct arm_smmu_ma=
ster *master,
 	if (!master->ats_enabled)
 		return 0;
=20
-	for (i =3D 0; i < master->num_sids; i++) {
-		cmd->atc.sid =3D master->sids[i];
+	for (i =3D 0; i < master->num_streams; i++) {
+		cmd->atc.sid =3D master->streams[i].id;
 		arm_smmu_cmdq_issue_cmd(master->smmu, cmd);
 	}
=20
@@ -1271,13 +1292,13 @@ static void arm_smmu_install_ste_for_dev(struct arm=
_smmu_master *master)
 	int i, j;
 	struct arm_smmu_device *smmu =3D master->smmu;
=20
-	for (i =3D 0; i < master->num_sids; ++i) {
-		u32 sid =3D master->sids[i];
+	for (i =3D 0; i < master->num_streams; ++i) {
+		u32 sid =3D master->streams[i].id;
 		__le64 *step =3D arm_smmu_get_step_for_sid(smmu, sid);
=20
 		/* Bridged PCI devices may end up with duplicated IDs */
 		for (j =3D 0; j < i; j++)
-			if (master->sids[j] =3D=3D sid)
+			if (master->streams[j].id =3D=3D sid)
 				break;
 		if (j < i)
 			continue;
@@ -1486,6 +1507,123 @@ static bool arm_smmu_sid_in_range(struct arm_smmu_d=
evice *smmu, u32 sid)
=20
 	return sid < limit;
 }
+
+static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
+				  struct arm_smmu_master *master)
+{
+	int i;
+	int ret =3D 0;
+	struct arm_smmu_stream *new_stream, *cur_stream;
+	struct rb_node **new_node, *parent_node =3D NULL;
+	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(master->dev);
+	bool *insert;
+
+	master->streams =3D _xzalloc_array(sizeof(*master->streams), sizeof(void =
*),
+					fwspec->num_ids);
+	if (!master->streams)
+		return -ENOMEM;
+
+	insert =3D _xzalloc_array(sizeof(bool), sizeof(bool *),
+					fwspec->num_ids);
+	if (!insert) {
+		xfree(master->streams);
+		master->streams =3D NULL;
+		return -ENOMEM;
+	}
+
+	master->num_streams =3D fwspec->num_ids;
+
+	mutex_lock(&smmu->streams_mutex);
+	for (i =3D 0; i < fwspec->num_ids; i++) {
+		u32 sid =3D fwspec->ids[i];
+		insert[i] =3D false;
+
+		new_stream =3D &master->streams[i];
+		new_stream->id =3D sid;
+		new_stream->master =3D master;
+		RB_CLEAR_NODE(&new_stream->node);
+
+		/*
+		 * Check the SIDs are in range of the SMMU and our stream table
+		 */
+		if (!arm_smmu_sid_in_range(smmu, sid)) {
+			ret =3D -ERANGE;
+			break;
+		}
+
+		/* Ensure l2 strtab is initialised */
+		if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB) {
+			ret =3D arm_smmu_init_l2_strtab(smmu, sid);
+			if (ret)
+				break;
+		}
+
+		/* Insert into SID tree */
+		insert[i] =3D true;
+		new_node =3D &(smmu->streams.rb_node);
+		while (*new_node) {
+			cur_stream =3D rb_entry(*new_node, struct arm_smmu_stream,
+					      node);
+			parent_node =3D *new_node;
+			if (cur_stream->id > new_stream->id) {
+				new_node =3D &((*new_node)->rb_left);
+			} else if (cur_stream->id < new_stream->id) {
+				new_node =3D &((*new_node)->rb_right);
+			} else if (cur_stream->master =3D=3D master) {
+				/* Bridged PCI devices may end up with duplicated IDs */
+				insert[i] =3D false;
+				break;
+			}
+			else {
+				dev_warn(master->dev,
+					 "stream %u already in tree\n",
+					 cur_stream->id);
+				ret =3D -EINVAL;
+				insert[i] =3D false;
+				break;
+			}
+		}
+		if (ret)
+			break;
+
+		if(insert[i]) {
+			rb_link_node(&new_stream->node, parent_node, new_node);
+			rb_insert_color(&new_stream->node, &smmu->streams);
+		}
+	}
+
+	if (ret) {
+		for (i--; i >=3D 0; i--)
+			if (insert[i])
+				rb_erase(&master->streams[i].node, &smmu->streams);
+		xfree(master->streams);
+		master->streams =3D NULL;
+	}
+	mutex_unlock(&smmu->streams_mutex);
+
+	xfree(insert);
+
+	return ret;
+}
+
+static void arm_smmu_remove_master(struct arm_smmu_master *master)
+{
+	int i;
+	struct arm_smmu_device *smmu =3D master->smmu;
+	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(master->dev);
+
+	if (!smmu || !master->streams)
+		return;
+
+	mutex_lock(&smmu->streams_mutex);
+	for (i =3D 0; i < fwspec->num_ids; i++)
+		if(!RB_EMPTY_NODE(&master->streams[i].node))
+			rb_erase(&master->streams[i].node, &smmu->streams);
+	mutex_unlock(&smmu->streams_mutex);
+
+	xfree(master->streams);
+}
+
 /* Forward declaration */
 static struct arm_smmu_device *arm_smmu_get_by_dev(const struct device *de=
v);
 static int arm_smmu_assign_dev(struct domain *d, u8 devfn, struct device *=
dev,
@@ -1552,7 +1690,7 @@ static int arm_smmu_remove_device(uint8_t devfn, stru=
ct device *dev)
=20
 static int arm_smmu_add_device(u8 devfn, struct device *dev)
 {
-	int i, ret;
+	int ret;
 	struct arm_smmu_device *smmu;
 	struct arm_smmu_master *master;
 	struct iommu_fwspec *fwspec;
@@ -1561,7 +1699,6 @@ static int arm_smmu_add_device(u8 devfn, struct devic=
e *dev)
 	if ( dev_is_pci(dev) )
 	{
 		struct pci_dev *pdev =3D dev_to_pci(dev);
-		int ret;
 			=09
 		/* Ignore calls for phantom functions */
 		if ( devfn !=3D pdev->devfn )
@@ -1589,26 +1726,11 @@ static int arm_smmu_add_device(u8 devfn, struct dev=
ice *dev)
=20
 	master->dev =3D dev;
 	master->smmu =3D smmu;
-	master->sids =3D fwspec->ids;
-	master->num_sids =3D fwspec->num_ids;
 	dev_iommu_priv_set(dev, master);
=20
-	/* Check the SIDs are in range of the SMMU and our stream table */
-	for (i =3D 0; i < master->num_sids; i++) {
-		u32 sid =3D master->sids[i];
-
-		if (!arm_smmu_sid_in_range(smmu, sid)) {
-			ret =3D -ERANGE;
-			goto err_free_master;
-		}
-
-		/* Ensure l2 strtab is initialised */
-		if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB) {
-			ret =3D arm_smmu_init_l2_strtab(smmu, sid);
-			if (ret)
-				goto err_free_master;
-		}
-	}
+	ret =3D arm_smmu_insert_master(smmu, master);
+	if (ret)
+		goto err_free_master;
=20
 	/*
 	 * Note that PASID must be enabled before, and disabled after ATS:
@@ -1655,6 +1777,8 @@ static int arm_smmu_add_device(u8 devfn, struct devic=
e *dev)
 	return 0;
=20
 err_free_master:
+	arm_smmu_disable_pasid(master);
+	arm_smmu_remove_master(master);
 	xfree(master);
 	dev_iommu_priv_set(dev, NULL);
 	return ret;
@@ -1853,6 +1977,9 @@ static int __init arm_smmu_init_structures(struct arm=
_smmu_device *smmu)
 {
 	int ret;
=20
+	mutex_init(&smmu->streams_mutex);
+	smmu->streams =3D RB_ROOT;
+
 	ret =3D arm_smmu_init_queues(smmu);
 	if (ret)
 		return ret;
diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthroug=
h/arm/smmu-v3.h
index ab07366294..ab1f29f6c7 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.h
+++ b/xen/drivers/passthrough/arm/smmu-v3.h
@@ -639,6 +639,15 @@ struct arm_smmu_device {
 	struct tasklet		evtq_irq_tasklet;
 	struct tasklet		priq_irq_tasklet;
 	struct tasklet		combined_irq_tasklet;
+
+	struct rb_root		streams;
+	struct mutex		streams_mutex;
+};
+
+struct arm_smmu_stream {
+	u32							id;
+	struct arm_smmu_master		*master;
+	struct rb_node				node;
 };
=20
 /* SMMU private data for each master */
@@ -647,8 +656,8 @@ struct arm_smmu_master {
 	struct device			*dev;
 	struct arm_smmu_domain		*domain;
 	struct list_head		domain_head;
-	u32				*sids;
-	unsigned int			num_sids;
+	struct arm_smmu_stream		*streams;
+	unsigned int				num_streams;
 	bool				ats_enabled;
 };
=20
--=20
2.43.0

