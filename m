Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D63E606A328
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 17:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=SEIuyTyX
Received: from list by lists.xenproject.org with outflank-mailman.1470339.1679075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOIKz-0007zh-5R; Tue, 03 Nov 2026 17:30:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470339.1679075; Tue, 03 Nov 2026 17:30:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOIKz-0007zR-2U; Tue, 03 Nov 2026 17:30:21 +0000
Received: by outflank-mailman (input) for mailman id 1470339;
 Tue, 03 Nov 2026 17:30:20 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xOIKy-0007ye-0n
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 17:30:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOIKx-00F76l-DV
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 18:30:19 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a27-bab6-0a2a0a5309dd-0a2a4504a610-2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:19 +0100
Received: from [52.101.66.101]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a2b-b57f-0a2a45040019-34654265ae0f-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:19 +0100
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by DBBPR03MB10511.eurprd03.prod.outlook.com (2603:10a6:10:53d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 17:30:17 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 17:30:17 +0000
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
 b=KaZvUNUbNrxl4BmX/UA5tCFMzCCB4Np7EVsctLPr6OnyGG0MloUiHFlv7kX3LoO2TXUHhPlS6jQlBdDklTw/nVfmeP1qxlFcXAOV8TJz1+TCkIezPgu7/L6MEfaGsnwMDQ4Wu2fdwukAfqGpF8YHWXuGvbp6APxH6hkiA9/Flj3e/tmO/PNBX2PDjQcw6WE6g0p5Nc5Ddjiye94psNiVkROWNUwJQ37XH2LWftVc4Ev7/mKhw4WI/oMJNDdR/Oi1pgP87b8GAMlZ+pN86tbcOSI2clH7TtLOpAs6Di/n1gLPuCwnj8uX8E3A+OEx77qCMJgpIau808QRS7elx/jUgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3WBix1D/fYogCNulWhra/ZqXkGiEn7FPuBmxMty0cEo=;
 b=gHaYPSNDgSg+Ox0eINzEhCh5sGhD96GaBo/e118ASM/78fpBTIzdrDOkRIOAk09RbphnNwYLgjdleaYNB2SZ71SArT5/tSwW/zew85avxugK+FckMLJx7ZqxOPdrrlZLAFpJbVX6D4Nif/oIdU1gdiigPH3NHS8h2+hnzaCrSO3kjoXyGMVudGmkJyZuGgW7Y9xz1xJQRqXjMnNoF+0zYNR7yy5wfnEGFHYqCa8at6pEjpYO0Azb45k2engu4+mZzMhWr1zxTOp4NC6W2c9vosXzE3L6XI4dY7jyuKUhncOxS9asmMId24yHn25DFwOJPZQObpqoeEwWIv4dT6rPrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3WBix1D/fYogCNulWhra/ZqXkGiEn7FPuBmxMty0cEo=;
 b=SEIuyTyXyXrT+/UxKvdnjI+EOWQfcThCO2ky/LAnX8YR9pbKoy3ZWRJnE/QiE+gkr1oiObEiQSCacFhRBx6Znp39WF9C4wx30eE/OtxgoIGZV31DYwBKHGMDDhgDQkGI/Dhu/DhSBTmRPmE84FfCB92+GfE1aAXOx7MWmdvjntLwt2fRri/KYYsW1Tux78vdbOwFr3JDslQJh3kqboprAx24/xkJFZn4FWp8KAbhWnNjEciyDkc0RMgImw7OBWxkK8ywApGyAY7ruM0dBGXey8COJTh6mYOycakYZ8Zy9g6qdRuek0cAirfwGpNsZiXZmJYja91GFgfG83ZYzvd2Qw==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH v5 02/22] xen/arm: smmuv3: Add support for stage-1 and nested
 stage translation
Thread-Topic: [PATCH v5 02/22] xen/arm: smmuv3: Add support for stage-1 and
 nested stage translation
Thread-Index: AQHda7j+0OKnWXqhjk2GUMK3mkLmTQ==
Date: Tue, 3 Nov 2026 17:30:17 +0000
Message-ID:
 <8b40ccc2707fbf02f3d6b1ba48db19c7467af321.1793726692.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: 9f5b366b-b883-4ee2-ecb4-08df39d0208e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|38070700021|261022075727099003|11063799006|56012099006|261009223027099003|261022105027099003|261021121427099003|261021123027099003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|10067099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info:
 4tRYMU0T1OU2nV7b8DvtcqcrqehB/4w8UePkVd98yRFL1aUgEjxvKAoFtM+B800txEDusbSI1q4RrzUl4Sb3wZft7mA72Yw+d8D2pgxnrJXq1VwxtyX1MC9zcycUB+1kJDTPtAtmu7odOZt1L58RcTv+RDRw4qOWgE4sk5a04C2Fj6EZiqPGZSLW5AqfUgltfP4F/gwSP+U1/2QyIcNfZMZOU8NVwT8R/LC0DVBvUQpYexQZ9MrKlfpKH1TaJeyxgvRYIVuyWUsyDKKcI/dwHDeQtPfXKt//9XSRP1wbu42pmhm2UItTVA3mlyTIC6nmynveqvQslkGKBYBm+u5DFYDSMksVmtMSTjvGMPbcDdye+1V+yJIad84TZPvoisY2VmO+W1OloE+2dEJ5GyYLwx6y+9fXvFTtMt6rpxN791wzTX0OGEitMz6/ibAWZlyS/EYH2SBuWbUmsmbELm65JeTi5THrjoJX0ZI38ZE5TgFLMvjSk/2zTnqAublPX7CkYyC3iUBsEJjHCshn3eENrYt1YKI803w0v/dgOOpmYp63CXmQvHm77NjnroxdY2UGLJ2R3Kjj37wAg1IXLnJKtQ9+yweVpo+qvcBtp+BvxMUxdGzYz4rDTwSLv97ihJuIyyoWpk4K04gGVoU3tw/jOzjMmjfeo7XQnj5iLcgOJjOVAKfmesUOcucXtX/HyCxhJq+ey0JqEyYluWADjUqizEmPUTHw79X/od9kic2ccTM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(261022075727099003)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(261021121427099003)(261021123027099003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?iU7409APEpqjxq6rg5rBKGM1sNJJ6Gwbag+nZaO/Jqhu7woREVJXmgaJZU?=
 =?iso-8859-1?Q?lu/BzFzFGCKK+jUfGlJtekbfaCOxfQUxQQyq5NooUesmfhzyU31fq7uNew?=
 =?iso-8859-1?Q?Mi4yV4O0E3ckcJfHeJJ5BL7G7rKcrQEEQUQJsUeozFnE4ewU80LoGcv3cF?=
 =?iso-8859-1?Q?FMAe3xRwD42bHYHMjGBsk50Z04qEn+q9Swq/eiu/Ha94+oAx/z34b4P5RI?=
 =?iso-8859-1?Q?lQLTrtOvDVCVzeAYeDZAvY9JtV0qwvyuINyhMC3JeN0kD5AnRSok2/w2ak?=
 =?iso-8859-1?Q?cEOBKnb3kjv82cz95fRH+9p80ZPB3gOctqUt5gvfRPiCVifgx10uM5Y6ig?=
 =?iso-8859-1?Q?bZeb5oGpUR1M3s7NJNmqMgGgcKFK8Xhcb6fUwKwCuTo+bXcpZDMKQ8rgbd?=
 =?iso-8859-1?Q?z99VY0oiVutbaYoHbSlCx8pp+OM9PelBsnjAZGscs9ZnS3yna+aDBvcr5S?=
 =?iso-8859-1?Q?PKooGndKsrZ18fJ9gUR6RRceOxkKNbzdQnT7wrYhN+0agEH0cskVMucZbk?=
 =?iso-8859-1?Q?Hm0uJDITOr/rk77WfR0yM6f3da6Ypn2LeTEPwgekJ1NCTDjzOiW/9/5yM4?=
 =?iso-8859-1?Q?iNXu7ISvj8GBK4v2GIJlgbvFdbp2AGHGwEeHlFis7ompCi7x614Qs55bDP?=
 =?iso-8859-1?Q?XeuSFrMD1CqlIlpMgFih1aIrLo4cKQEMcoKiBCappxBkzaznMTZtWCd8JZ?=
 =?iso-8859-1?Q?pWTYgRvSqZrzL8Dz0rAN0cVM/p3sy6//QY8pMj1U55rnm3/UnxRUAEig0q?=
 =?iso-8859-1?Q?RUqAhOxI5/zQWvxOMhW+6zSXSf/oVchTjKffEQjqNqBMhPH58999EeTOu+?=
 =?iso-8859-1?Q?6kJupcmFcxg9QsAmNsLp16L16SOZQe3VCdkZrblVkDdcTaGHjdmFJeHEp1?=
 =?iso-8859-1?Q?QEq8PyYb3DAZVwjVuR+w88xzTqgY2nejcduQuV3U3rIam7MMP5k8irf3gY?=
 =?iso-8859-1?Q?s5uurTOl83/2iL5+kxHP52tTlAksdzjgka66mP/wj4KEoER0ujjU8EYLeS?=
 =?iso-8859-1?Q?mwxX6bJb8UWIWLGbzNrJZp1/o8YHgrYiAcn21ysOxowbJah1lZDPWFWOCg?=
 =?iso-8859-1?Q?+fbUCmaeANpfq49BDJ1wtUe+m7XgQiVrFDrIkX5y8JhMPe79EsH6RrbfZQ?=
 =?iso-8859-1?Q?Dhc9JkEMmW4J5MHbTHRQci3iB8meD+McpxMqtokuM0KMWdB/mFN7FCZsD8?=
 =?iso-8859-1?Q?pDo9pcwW4/ojeo85suxGLUw76E1LP82G0yTnduIwtbvr70XZu8lz2nXZW7?=
 =?iso-8859-1?Q?zopn/CrGA8EgwtlBa/wdkFwPZ7JmccZSxOTCs27rZxHWX6rMy3rhxBW8Bu?=
 =?iso-8859-1?Q?UhK5BUxGxqJhJ3AUH4Pl6WBITI05ckvIGm35tViazKgnch2LwcAY95TpOf?=
 =?iso-8859-1?Q?OTgmL12khd/ikqLh9dqnuw+JAniZ4znnHv2UQ/JzAHJwqPnP9qdKN+44rd?=
 =?iso-8859-1?Q?vJhAc/qgUJaPMonpLCNIicSjyCPgMKMnHHkjmpVqTU1CzFUBEA7NsO7dn1?=
 =?iso-8859-1?Q?G3Ciql5kZ7CPjsnpr5/InmOpU9rLFeEbbFJLw1A+cQ0Ehresi4KR4V+ORG?=
 =?iso-8859-1?Q?5nL6cbT+/Eu2aS56V4wZ1xZ7l3LTijLWlvM+/O9va4lrfPtVyl1BrEai8k?=
 =?iso-8859-1?Q?CPto23gD3PBX1A4/XoA0mzxxqIhs9HzDl/yTiKj5N/6+Dr3fP07cO/wCW7?=
 =?iso-8859-1?Q?rPtsB8pr74Yvez5tJKqpH60q0VHQXt0f/dFBdxxvH1Diz2OSKqi0vSJRfs?=
 =?iso-8859-1?Q?PpWWAbgm5Ko0omqAuEbcOjqlWtcJ/LBOFnzoZcWt9FLUtgNJRI/H0j24He?=
 =?iso-8859-1?Q?bk7Q8GTsLw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f5b366b-b883-4ee2-ecb4-08df39d0208e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 17:30:17.1870
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XE1Mq66tnv77Mb3woVtwnD8npoHhr/slTU5a8XmWAe0xtENZglKQHZSqnazQbFmRGSUn0WMsATl7NIBFXELOlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10511
X-purgate-ID: tlsNG-ebf023/1793727019-518D1B50-7CF808BE/0/0
X-purgate-type: clean
X-purgate-size: 7586
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Rahul Singh <rahul.singh@arm.com>

Xen SMMUv3 driver only supports stage-2 translation. Add support for
Stage-1 translation that is required to support nested stage
translation.

In true nested mode, both s1_cfg and s2_cfg will coexist.
Let's remove the union. When nested stage translation is setup, both
s1_cfg and s2_cfg are valid.

We introduce a new smmu_domain abort field that will be set
upon guest stage-1 configuration passing. If no guest stage-1
config has been attached, it is ignored when writing the STE.

arm_smmu_write_strtab_ent() is modified to write both stage
fields in the STE and deal with the abort field.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/drivers/passthrough/arm/smmu-v3.c | 98 +++++++++++++++++++++++----
 xen/drivers/passthrough/arm/smmu-v3.h | 10 +++
 2 files changed, 96 insertions(+), 12 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthroug=
h/arm/smmu-v3.c
index d49085b38f..ecfa7e4723 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -683,8 +683,10 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_=
master *master, u32 sid,
 	 * 3. Update Config, sync
 	 */
 	u64 val =3D le64_to_cpu(dst[0]);
-	bool ste_live =3D false;
+	bool s1_live =3D false, s2_live =3D false, ste_live =3D false;
+	bool abort, translate =3D false;
 	struct arm_smmu_device *smmu =3D NULL;
+	struct arm_smmu_s1_cfg *s1_cfg =3D NULL;
 	struct arm_smmu_s2_cfg *s2_cfg =3D NULL;
 	struct arm_smmu_domain *smmu_domain =3D NULL;
 	struct arm_smmu_cmdq_ent prefetch_cmd =3D {
@@ -699,30 +701,57 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu=
_master *master, u32 sid,
 		smmu =3D master->smmu;
 	}
=20
-	if (smmu_domain)
-		s2_cfg =3D &smmu_domain->s2_cfg;
+	if (smmu_domain) {
+		switch (smmu_domain->stage) {
+		case ARM_SMMU_DOMAIN_S1:
+			s1_cfg =3D &smmu_domain->s1_cfg;
+			break;
+		case ARM_SMMU_DOMAIN_NESTED:
+			s1_cfg =3D &smmu_domain->s1_cfg;
+			fallthrough;
+		case ARM_SMMU_DOMAIN_S2:
+			s2_cfg =3D &smmu_domain->s2_cfg;
+			break;
+		default:
+			break;
+		}
+		translate =3D s1_cfg || s2_cfg;
+	}
=20
 	if (val & STRTAB_STE_0_V) {
 		switch (FIELD_GET(STRTAB_STE_0_CFG, val)) {
 		case STRTAB_STE_0_CFG_BYPASS:
 			break;
+		case STRTAB_STE_0_CFG_S1_TRANS:
+			s1_live =3D true;
+			break;
 		case STRTAB_STE_0_CFG_S2_TRANS:
-			ste_live =3D true;
+			s2_live =3D true;
+			break;
+		case STRTAB_STE_0_CFG_NESTED:
+			s1_live =3D true;
+			s2_live =3D true;
 			break;
 		case STRTAB_STE_0_CFG_ABORT:
-			BUG_ON(!disable_bypass);
 			break;
 		default:
 			BUG(); /* STE corruption */
 		}
 	}
=20
+	ste_live =3D s1_live || s2_live;
+
 	/* Nuke the existing STE_0 value, as we're going to rewrite it */
 	val =3D STRTAB_STE_0_V;
=20
 	/* Bypass/fault */
-	if (!smmu_domain || !(s2_cfg)) {
-		if (!smmu_domain && disable_bypass)
+	if (!smmu_domain)
+		abort =3D disable_bypass;
+	else
+		abort =3D smmu_domain->abort;
+
+	if (abort || !translate) {
+		if (abort)
 			val |=3D FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_ABORT);
 		else
 			val |=3D FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_BYPASS);
@@ -740,7 +769,32 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_=
master *master, u32 sid,
 		return;
 	}
=20
+	if (ste_live) {
+		/* First invalidate the live STE */
+		dst[0] =3D cpu_to_le64(STRTAB_STE_0_CFG_ABORT);
+		arm_smmu_sync_ste_for_sid(smmu, sid);
+	}
+
+	if (s1_cfg) {
+		dst[1] =3D cpu_to_le64(
+			 FIELD_PREP(STRTAB_STE_1_S1DSS, STRTAB_STE_1_S1DSS_SSID0) |
+			 FIELD_PREP(STRTAB_STE_1_S1CIR, STRTAB_STE_1_S1C_CACHE_WBRA) |
+			 FIELD_PREP(STRTAB_STE_1_S1COR, STRTAB_STE_1_S1C_CACHE_WBRA) |
+			 FIELD_PREP(STRTAB_STE_1_S1CSH, ARM_SMMU_SH_ISH) |
+			 FIELD_PREP(STRTAB_STE_1_STRW, STRTAB_STE_1_STRW_NSEL1));
+
+		if (smmu->features & ARM_SMMU_FEAT_STALLS &&
+		   !(smmu->features & ARM_SMMU_FEAT_STALL_FORCE))
+			dst[1] |=3D cpu_to_le64(STRTAB_STE_1_S1STALLD);
+
+		val |=3D (s1_cfg->s1ctxptr & STRTAB_STE_0_S1CTXPTR_MASK) |
+			FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S1_TRANS) |
+			FIELD_PREP(STRTAB_STE_0_S1CDMAX, s1_cfg->s1cdmax) |
+			FIELD_PREP(STRTAB_STE_0_S1FMT, s1_cfg->s1fmt);
+	}
+
 	if (s2_cfg) {
+		u64 vttbr =3D s2_cfg->vttbr & STRTAB_STE_3_S2TTB_MASK;
 		u64 strtab =3D
 			 FIELD_PREP(STRTAB_STE_2_S2VMID, s2_cfg->vmid) |
 			 FIELD_PREP(STRTAB_STE_2_VTCR, s2_cfg->vtcr) |
@@ -750,12 +804,19 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu=
_master *master, u32 sid,
 			 STRTAB_STE_2_S2PTW | STRTAB_STE_2_S2AA64 |
 			 STRTAB_STE_2_S2R;
=20
-		BUG_ON(ste_live);
+		if (s2_live) {
+			u64 s2ttb =3D le64_to_cpu(dst[3]) & STRTAB_STE_3_S2TTB_MASK;
+			BUG_ON(s2ttb !=3D vttbr);
+		}
+
 		dst[2] =3D cpu_to_le64(strtab);
=20
-		dst[3] =3D cpu_to_le64(s2_cfg->vttbr & STRTAB_STE_3_S2TTB_MASK);
+		dst[3] =3D cpu_to_le64(vttbr);
=20
 		val |=3D FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S2_TRANS);
+	} else {
+		dst[2] =3D 0;
+		dst[3] =3D 0;
 	}
=20
 	if (master->ats_enabled)
@@ -1254,8 +1315,18 @@ static int arm_smmu_domain_finalise(struct iommu_dom=
ain *domain,
 {
 	int ret;
 	struct arm_smmu_domain *smmu_domain =3D to_smmu_domain(domain);
+	struct arm_smmu_device *smmu =3D smmu_domain->smmu;
+
+	if (!(smmu->features & ARM_SMMU_FEAT_TRANS_S2)) {
+		smmu_domain->stage =3D ARM_SMMU_DOMAIN_ABORT;
+		return 0;
+	}
=20
-	/* Restrict the stage to what we can actually support */
+	/*
+	 * Default to stage-2 support and initialize it. Stage-1 will be
+	 * initialized during guest config attachment, if nested or stage-1
+	 * mode is required
+	 */
 	smmu_domain->stage =3D ARM_SMMU_DOMAIN_S2;
=20
 	ret =3D arm_smmu_domain_finalise_s2(smmu_domain, master);
@@ -2454,11 +2525,14 @@ static int arm_smmu_device_hw_probe(struct arm_smmu=
_device *smmu)
 		break;
 	}
=20
+	if (reg & IDR0_S1P)
+		smmu->features |=3D ARM_SMMU_FEAT_TRANS_S1;
+
 	if (reg & IDR0_S2P)
 		smmu->features |=3D ARM_SMMU_FEAT_TRANS_S2;
=20
-	if (!(reg & IDR0_S2P)) {
-		dev_err(smmu->dev, "no stage-2 translation support!\n");
+	if (!(reg & (IDR0_S1P | IDR0_S2P))) {
+		dev_err(smmu->dev, "no translation support!\n");
 		return -ENXIO;
 	}
=20
diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthroug=
h/arm/smmu-v3.h
index ab1f29f6c7..f302c69d02 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.h
+++ b/xen/drivers/passthrough/arm/smmu-v3.h
@@ -197,6 +197,7 @@
 #define STRTAB_STE_0_CFG_BYPASS		4
 #define STRTAB_STE_0_CFG_S1_TRANS	5
 #define STRTAB_STE_0_CFG_S2_TRANS	6
+#define STRTAB_STE_0_CFG_NESTED		7
=20
 #define STRTAB_STE_0_S1FMT		GENMASK_ULL(5, 4)
 #define STRTAB_STE_0_S1FMT_LINEAR	0
@@ -391,6 +392,7 @@ enum arm_smmu_domain_stage {
 	ARM_SMMU_DOMAIN_S2,
 	ARM_SMMU_DOMAIN_NESTED,
 	ARM_SMMU_DOMAIN_BYPASS,
+	ARM_SMMU_DOMAIN_ABORT,
 };
=20
 /* Xen specific code. */
@@ -549,6 +551,12 @@ struct arm_smmu_strtab_l1_desc {
 	dma_addr_t			l2ptr_dma;
 };
=20
+struct arm_smmu_s1_cfg {
+	u64				s1ctxptr;
+	u8				s1fmt;
+	u8				s1cdmax;
+};
+
 struct arm_smmu_s2_cfg {
 	u16				vmid;
 	u64				vttbr;
@@ -669,6 +677,8 @@ struct arm_smmu_domain {
 	atomic_t			nr_ats_masters;
=20
 	enum arm_smmu_domain_stage	stage;
+	bool			abort;
+	struct arm_smmu_s1_cfg	s1_cfg;
 	struct arm_smmu_s2_cfg	s2_cfg;
=20
 	/* Xen domain associated with this SMMU domain */
--=20
2.43.0

