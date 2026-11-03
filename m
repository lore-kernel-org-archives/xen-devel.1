Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9845C606A328
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 17:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=r1HP7Uz9
Received: from list by lists.xenproject.org with outflank-mailman.1470346.1679120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOIL8-0000pb-SU; Tue, 03 Nov 2026 17:30:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470346.1679120; Tue, 03 Nov 2026 17:30:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOIL8-0000op-Lu; Tue, 03 Nov 2026 17:30:30 +0000
Received: by outflank-mailman (input) for mailman id 1470346;
 Tue, 03 Nov 2026 17:30:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xOIL7-0000bH-8t
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 17:30:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOIL6-004K2A-La
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 18:30:28 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a19-2eae-0a2a0a5409dd-0a2a4502a8a8-34
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:28 +0100
Received: from [40.107.159.77]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6aea1a34-6ca4-0a2a45020019-286b9f4d6e3f-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:30:28 +0100
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by DBBPR03MB10511.eurprd03.prod.outlook.com (2603:10a6:10:53d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 17:30:26 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 17:30:26 +0000
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
 b=W14mesI05BiFKICP33fSbsIh9ZPMpsWWZZkniYtPQSCMAo9yRfYNMoJWj6XcmqvEy6tQvuHgMjDfR2pFjKlSFW+y/v5UGWiXjCRwdvo2urJP0b3cClnvDEBVlba4Ot6von6AocqzDEvhUiPmVMpWPUjVTzi9N2coK7hhXBdnw/8hIFNUPyHmG2EQf/2rI3Wd7EgnzNZxHvh2zLa3cIWpB+NphnImaZzbOcUBB/kYSJAt94P0tUJtIJ4EZTZNhpgNy+8pKyVVOtYzBoXiJxJB9tvnKdNhIVXHaVyjRjoHjKZkj95PMovcw3nLxs+EcAdsFXRDzU4ttbXbilIuuQz47Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3FDWPZewPZczmNvTclszGd+TynYKyefP1NUzaXsHj64=;
 b=oeFklmPoXqYnTGDhK40Ffyt1FDi5zIax9Jmy/cQa0FYWi5iYmb3iHL9jtSBZTelPxUEOuqAEWf6AQYET23+L8b6s514kkILraKSbwBJuguvbZPULDTqMiAo5iSdNITlTyNZjfaQI59RGdFJ0+0aJHxR2t1wMZ8HSWjDsQkQ5VVWDlwDTR1HnjENATLihqlHtVGAKU6fPJxDJnXj5p976+55BEYG37xW0D6xo4MEFgHqtIeItlDUFUdEG4fOAMYhizJ7WDGNNspy9t4uMy3eS0AJqA3UyHwrVsGJWe43D6VrQ62MF9ZgauycjN8zkXmQyFOpsmquIXLkCyRHVqUzqBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FDWPZewPZczmNvTclszGd+TynYKyefP1NUzaXsHj64=;
 b=r1HP7Uz9Wc3yN01bZlWMVcnEspzy2ikuWsfI1Qo+1t+5uQTXX5qw+VkM59ta/rlVl+GxbF++XagxTqO2OAS6I4Jvvf1U3C1lCKHsna6pzLISZ29nf2CXrgEbHW1y+YBWBIU5s22dkPKGekTtjwEeeHyKZLxwubewmrpTHbc5Kdc3F9x/8LwDA/dAzyzs6K+Qsln6Fx9fwM6bS8+ncXnn6EsMQGXizZsEv/wc80wPrH9YNbz6lYFDs4j4LLU2ORUMfy+eTvhjzK2wgwcLwWDX+hbqtKIWFypbxiejf2qKGEyWzBcbzaGdfVyzSRcIyIHkNAY3ZXeqpY7U7fnt9M/VKA==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Milan Djokic <milan_djokic@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Rahul Singh <rahul.singh@arm.com>,
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>
Subject: [PATCH v5 07/22] xen/arm: smmuv3: Extend HW features detection and
 apply errata
Thread-Topic: [PATCH v5 07/22] xen/arm: smmuv3: Extend HW features detection
 and apply errata
Thread-Index: AQHda7kDiSsEJx339UGYLb3uJ6HI1w==
Date: Tue, 3 Nov 2026 17:30:26 +0000
Message-ID:
 <6a25a02d52ad58d406200ebbe9aa17ca0e997104.1793726692.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: 4ec6f1ff-b15e-4977-b8ed-08df39d025fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|38070700021|260925021911599003|260925022911599003|260925021311599003|261022075727099003|11063799006|56012099006|261009223027099003|261022105027099003|261021121427099003|261021123027099003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 OIoLGuOjnkvQgnCamr7/ZVAVz9mtdw3/gjpuWt/F/T69PF59kOF2RCQwoI9VVaWpzrzu4iCfF1Czx5kPNIC/o0KSjYXRsGa8N2b5bfDRo2HLvIS7tl+idL4mU04bS5q5+F3I4N+l6Kr0awT0XkkpXtKqcRDiLFItI/HkhGKt6TCeLPLjxyuZd4dmk9LrM2RCkLksGpZgxGm18KdcjLU4w4UzTDRKBJnOtjTy+jErcTBnGT7Qxyscfwo6phxGS6La7MA4KNCVR3Ln+4oARXIUujqrxlXbwDPN8367VHto6tHHRfdNpI91r8zspMDGbVZ6Hbwo00MidadvNXkK+WAxSEfj0Hj9Zgk2R5gGgAQuUAN1alUWavVXZM4VcKVc7T2YiXWisZNSIqItaW2A7VEHq4QYYs5fshm3xYwfraNvckLe/lxxic3edQpaajbfGX6o5tKEC8nkGO0lTgzfnF0y62YfbfsT21T84kBgZI5GooXPN329cGtSvJshPKw4O8ZFYi1MbER5uPLUTBYVEnzyxpLXNUksJ/YKPiAUBgpuNduR5sX27knybBuICQ02044CAlByqeXU4DYArBLnWCDLNRQdhTvLhWQi16vh4/f1zpH95EK16t9Q6qqX63i6mEkhahdqtGWPnCpE49HAwIjPzHDMpYam41yv9Xez4zwduyw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(260925021911599003)(260925022911599003)(260925021311599003)(261022075727099003)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(261021121427099003)(261021123027099003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?rNjz1tlYxDgP4skeBDUGugn7wAhvSpJmTXycYsGXkja4aYf6XEI68mWvWZ?=
 =?iso-8859-1?Q?1oS5pVFBbwVicdi0f2n3J5q0BSrlELEqLWLlUolLKM5MsMbhP3GhvJHnPd?=
 =?iso-8859-1?Q?dzw4XQ1xoYLYquFt2i0IHhlmb6shTLRBYJRMyRj7PncLOj1WscAU2rrJQf?=
 =?iso-8859-1?Q?DhTXkLV+/6DCvWyPxET/V6ib+vUjsomKxkqQT34hjzJIPkGELUXoES6C/W?=
 =?iso-8859-1?Q?c48E1Ty2fa/eD8S6ofTje70nZoT4bmHKuM5dhxKKBp9UrtBbm0GwFd5iAR?=
 =?iso-8859-1?Q?aOQJ7g/GyLr752fxMF23eGcflKkJSj5vEmlQyQgxanYqnP71ci60KvT6Di?=
 =?iso-8859-1?Q?rB6fcxHNRLhMeuy4IFpl4ijjYgW5nnJIVrNqE1Ti1G41mJwDzENn4NQrdi?=
 =?iso-8859-1?Q?TGZBzWfJg9ieIGL9T8D8Iqh32zfK1PsJVbQE8PqCSC3VGSIhCs+/tjjjyq?=
 =?iso-8859-1?Q?rO7IPoAUDYy/sKDfYYeHGl9DJmOACsY31HN6Xzc5hJF83UoKMgjG1OPZyM?=
 =?iso-8859-1?Q?2UpYxFuL1M5ayqOdLCro3AAu8HB1RmAuKXjaw0EeHMD5i/f/TtGRk8T+Ab?=
 =?iso-8859-1?Q?5/tzj5xODGRS5HCJ1W+9rxEHy98UIbXLDiCD3XVw6C03iT+mBsqHGwWx2c?=
 =?iso-8859-1?Q?yoMNS0SOQwiw2yFosHOlzn2a6mttNyrQjKnohJmhv5tEoCTak9vRq+FgHD?=
 =?iso-8859-1?Q?PMDaXpY1zaxbxr3l4HIcaDJkM7IFCFC8z/SW58S0JF/qiaiBsFzf7EkVA2?=
 =?iso-8859-1?Q?ffdijIOaF32+O5lJtba+UC7Wxax2CkHZrXfxKFGGadDeKztiGXQc5Ei3MN?=
 =?iso-8859-1?Q?x2NcAPOoC0frkvGPwEXCv+SBYg+rmvnpCgMDO/9RHZ5fmCS9l7uNEoOUpb?=
 =?iso-8859-1?Q?fk0y3LiCjIWc/ArGW7m7r8QrCyFvzskG3a2w0/RzHkwiVKVrlxdNnt35w1?=
 =?iso-8859-1?Q?TyjdshBo6iRzQ57k68pRh5ihPcmDbjzoZSoqwkrNgJKFps8ZqpQTq584ur?=
 =?iso-8859-1?Q?3wiI43DF0orV9g0Y/dXfrdGj+R5ryiBbyJzRj679tSDOfr3y0v31HAF3tf?=
 =?iso-8859-1?Q?q4qVKP5agsowSpsy+s5IWlCCXGDG9eTzva5KyY6R4C64xgA22EfXszgblN?=
 =?iso-8859-1?Q?Bsis6UOMwofDxy1aKfW6UoRYyz9LyLMoSJq0hLRpn24CDEJS/SMJDRC+t6?=
 =?iso-8859-1?Q?A79XRIhf1aJ+wORMSLcOAcKiRH1lSbZUH085n5G9eLIEAeKfDKiWiFqi1y?=
 =?iso-8859-1?Q?2BV+jg1IoRWNO3W/AmRUcSNSGbhoG7JUS+9WtSBVw4k+xo5vRofXsIkMTc?=
 =?iso-8859-1?Q?Iyg9D5YtFffWODbPkEF2br4MPbq1bxhanWS5B0rYxsyJIi/obn/aswEYJ3?=
 =?iso-8859-1?Q?L7EFJHkR1wZm/BeTQULP5chH9TvdBu5rwsy43oYu2LlVBkJ6fWVtsLxIgR?=
 =?iso-8859-1?Q?e+mLzkGeYqSaSgsBzqCU4nXXHmogzQQcQE7OkS4Iijjid3/CwQEjFn5HQh?=
 =?iso-8859-1?Q?i/oskG58Dvp2+aJOcP8rv/M96RhzYNOR/C8WhmV0tuBLAigBu//+0ToZzz?=
 =?iso-8859-1?Q?h4/pXOA8oW691Mxv8vJlp7er3Iyn+vgJVJr1uZx4sU2ULRuKRhXAVjDBGd?=
 =?iso-8859-1?Q?VvoKbBcZkZDbIWLmKyJ8uI3G/kHCP0PeZvHrE4BCWJf9YPAofpv0Qfdx2K?=
 =?iso-8859-1?Q?o5ZHOhxYn7GzIL3ObXC6DHhNnJDjlu8LYHK1H1jqtrWWPOSnpKUY2e4EA1?=
 =?iso-8859-1?Q?+MaPD7K7pHTfhoeEI2GqSq8mEuj1I1krdFHYjSFFCMH11RsY0kPEeCsvbb?=
 =?iso-8859-1?Q?rlsSfHZ1cg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ec6f1ff-b15e-4977-b8ed-08df39d025fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 17:30:26.2840
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QU8oiH65jKI8G68vBE2JnVX2zSBwTq0qJ7hz20cst/rVUVdUTwQlCTkRCzMT9kbwbPxo6ISGnmCYFbeKRvyM+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10511
X-purgate-ID: tlsNG-720697/1793727028-66EB32AC-BA098F94/0/0
X-purgate-type: clean
X-purgate-size: 15259
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Backport Linux commits 4bbd63eb685b and fd86b5944215, adapted to the
Xen SMMUv3 implementation, applying errata workarounds to prevent
nesting on MMU-600 and MMU-700 products.

Detect IOMMU hardware features and store them in the IOMMU host list
for each probed SMMUv3 device, allowing the emulated IOMMU to advertise
features supported by the physical IOMMU.

Linux commits:

  4bbd63eb685b ("iommu/arm-smmu-v3: Work around MMU-600 erratum 1076982")
  fd86b5944215 ("iommu/arm-smmu-v3: Add explicit feature for nesting")

Link: https://lore.kernel.org/all/08adbe3d01024d8382a478325f73b56851f76e49.=
1683731256.git.robin.murphy@arm.com/
Link: https://lore.kernel.org/all/136c3f4a3a84cc14a5a1978ace57dfd3ed67b688.=
1683731256.git.robin.murphy@arm.com/
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 4b=
bd63eb685b
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git fd=
86b5944215

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/arch/arm/include/asm/viommu.h      |  8 ++-
 xen/drivers/passthrough/arm/smmu-v3.c  | 81 +++++++++++++++++++++++--
 xen/drivers/passthrough/arm/smmu-v3.h  | 32 ++++++++--
 xen/drivers/passthrough/arm/viommu.c   |  4 +-
 xen/drivers/passthrough/arm/vsmmu-v3.c | 83 ++++++++++++++++++++++++--
 5 files changed, 191 insertions(+), 17 deletions(-)

diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/asm/v=
iommu.h
index 287595068b..844cf34d56 100644
--- a/xen/arch/arm/include/asm/viommu.h
+++ b/xen/arch/arm/include/asm/viommu.h
@@ -12,6 +12,8 @@ struct host_iommu {
     struct list_head entry;
     /* IOMMU DT node used to establish virtual to physical IOMMU/SID mappi=
ng */
     const struct dt_device_node *dt_node;
+    /* Physical IOMMU device structure used to detect supported features *=
/
+    const void *iommu;
     /* Used for dom0 vIOMMU instantiation (1-1 MMIO regions mappings) */
     paddr_t addr;
     /* Used for dom0 vIOMMU instantiation (1-1 MMIO regions mappings) */
@@ -52,7 +54,8 @@ int domain_viommu_init(struct domain *d, uint8_t viommu_t=
ype);
 int viommu_relinquish_resources(struct domain *d);
 uint8_t viommu_get_type(void);
 void add_to_host_iommu_list(paddr_t addr, paddr_t size,
-                            const struct dt_device_node *node);
+                            const struct dt_device_node *node,
+                            const void *iommu);
 void set_cur_viommu(const struct viommu_desc *desc);
 unsigned int domain_viommu_get_num_mmio_handlers(struct domain *d);
=20
@@ -77,7 +80,8 @@ static inline int viommu_relinquish_resources(struct doma=
in *d)
 }
=20
 static inline void __init add_to_host_iommu_list(paddr_t addr, paddr_t siz=
e,
-                                          const struct dt_device_node *nod=
e)
+                                          const struct dt_device_node *nod=
e,
+                                          const void *iommu)
 {
     return;
 }
diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthroug=
h/arm/smmu-v3.c
index b85ad730db..d2dfb06cae 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -2509,6 +2509,37 @@ err_free_irqs:
 	return ret;
 }
=20
+static void arm_smmu_device_iidr_probe(struct arm_smmu_device *smmu)
+{
+	u32 reg;
+	unsigned int implementer, productid, variant, revision;
+
+	reg =3D readl_relaxed(smmu->base + ARM_SMMU_IIDR);
+	implementer =3D FIELD_GET(IIDR_IMPLEMENTER, reg);
+	productid =3D FIELD_GET(IIDR_PRODUCTID, reg);
+	variant =3D FIELD_GET(IIDR_VARIANT, reg);
+	revision =3D FIELD_GET(IIDR_REVISION, reg);
+
+	switch (implementer) {
+	case IIDR_IMPLEMENTER_ARM:
+		switch (productid) {
+		case IIDR_PRODUCTID_ARM_MMU_600:
+			/* Arm erratum 1076982 */
+			if (variant =3D=3D 0 && revision <=3D 2)
+				smmu->features &=3D ~ARM_SMMU_FEAT_SEV;
+			/* Arm erratum 1209401 */
+			if (variant < 2)
+				smmu->features &=3D ~ARM_SMMU_FEAT_NESTING;
+			break;
+		case IIDR_PRODUCTID_ARM_MMU_700:
+			/* Arm errata 2268618, 2812531 */
+			smmu->features &=3D ~ARM_SMMU_FEAT_NESTING;
+			break;
+		}
+		break;
+	}
+}
+
 static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 {
 	u32 reg;
@@ -2597,8 +2628,10 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_=
device *smmu)
 	switch (FIELD_GET(IDR0_TTF, reg)) {
 	case IDR0_TTF_AARCH32_64:
 		smmu->ias =3D 40;
+		smmu->features |=3D ARM_SMMU_FEAT_TTF_AARCH32_64;
 		fallthrough;
 	case IDR0_TTF_AARCH64:
+		smmu->features |=3D ARM_SMMU_FEAT_TTF_AARCH64;
 		break;
 	default:
 		dev_err(smmu->dev, "AArch64 table format not supported!\n");
@@ -2607,6 +2640,8 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_d=
evice *smmu)
=20
 	/* ASID/VMID sizes */
 	smmu->vmid_bits =3D reg & IDR0_VMID16 ? 16 : 8;
+	if (reg & IDR0_ASID16)
+		smmu->features |=3D ARM_SMMU_FEAT_ASID_16;
=20
 	/* IDR1 */
 	reg =3D readl_relaxed(smmu->base + ARM_SMMU_IDR1);
@@ -2646,12 +2681,18 @@ static int arm_smmu_device_hw_probe(struct arm_smmu=
_device *smmu)
 	smmu->evtq.max_stalls =3D FIELD_GET(IDR5_STALL_MAX, reg);
=20
 	/* Page sizes */
-	if (reg & IDR5_GRAN64K)
+	if (reg & IDR5_GRAN64K) {
 		smmu->pgsize_bitmap |=3D SZ_64K | SZ_512M;
-	if (reg & IDR5_GRAN16K)
+		smmu->features |=3D ARM_SMMU_FEAT_GRAN64K;
+	}
+	if (reg & IDR5_GRAN16K) {
 		smmu->pgsize_bitmap |=3D SZ_16K | SZ_32M;
-	if (reg & IDR5_GRAN4K)
+		smmu->features |=3D ARM_SMMU_FEAT_GRAN16K;
+	}
+	if (reg & IDR5_GRAN4K) {
 		smmu->pgsize_bitmap |=3D SZ_4K | SZ_2M | SZ_1G;
+		smmu->features |=3D ARM_SMMU_FEAT_GRAN4K;
+	}
=20
 	/* Input address size */
 	if (FIELD_GET(IDR5_VAX, reg) =3D=3D IDR5_VAX_52_BIT)
@@ -2684,15 +2725,46 @@ static int arm_smmu_device_hw_probe(struct arm_smmu=
_device *smmu)
 		fallthrough;
 	case IDR5_OAS_48_BIT:
 		smmu->oas =3D 48;
+		smmu->features |=3D ARM_SMMU_FEAT_OAS_48_BIT;
 		break;
 	}
=20
 	smmu->oas =3D min_t(unsigned long, PADDR_BITS, smmu->oas);
 	smmu->ias =3D max(smmu->ias, smmu->oas);
=20
+	switch (smmu->oas) {
+	case 32:
+		smmu->features |=3D ARM_SMMU_FEAT_OAS_32_BIT;
+		break;
+	case 36:
+		smmu->features |=3D ARM_SMMU_FEAT_OAS_36_BIT;
+		break;
+	case 40:
+		smmu->features |=3D ARM_SMMU_FEAT_OAS_40_BIT;
+		break;
+	case 42:
+		smmu->features |=3D ARM_SMMU_FEAT_OAS_42_BIT;
+		break;
+	case 44:
+		smmu->features |=3D ARM_SMMU_FEAT_OAS_44_BIT;
+		break;
+	case 48:
+		smmu->features |=3D ARM_SMMU_FEAT_OAS_48_BIT;
+		break;
+	case 52:
+		smmu->features |=3D ARM_SMMU_FEAT_OAS_52_BIT;
+		break;
+	}
+
 	/* Xen: Set maximum Stage-2 input size supported by the SMMU. */
 	p2m_restrict_ipa_bits(smmu->ias);
=20
+	if ((smmu->features & ARM_SMMU_FEAT_TRANS_S1) &&
+		(smmu->features & ARM_SMMU_FEAT_TRANS_S2))
+		smmu->features |=3D ARM_SMMU_FEAT_NESTING;
+
+	arm_smmu_device_iidr_probe(smmu);
+
 	dev_info(smmu->dev, "ias %lu-bit, oas %lu-bit (features 0x%08x)\n",
 		 smmu->ias, smmu->oas, smmu->features);
 	return 0;
@@ -2887,9 +2959,8 @@ static int __init arm_smmu_device_probe(struct platfo=
rm_device *pdev)
 	spin_lock(&arm_smmu_devices_lock);
 	list_add(&smmu->devices, &arm_smmu_devices);
 	spin_unlock(&arm_smmu_devices_lock);
-
 	/* Add to host IOMMU list to initialize vIOMMU for dom0 */
-	add_to_host_iommu_list(ioaddr, iosize, dev_to_dt(pdev));
+	add_to_host_iommu_list(ioaddr, iosize, dev_to_dt(pdev), (void *) smmu);
=20
 	return 0;
=20
diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthroug=
h/arm/smmu-v3.h
index f302c69d02..4a912be740 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.h
+++ b/xen/drivers/passthrough/arm/smmu-v3.h
@@ -60,6 +60,16 @@
 #define IDR5_VAX			GENMASK(11, 10)
 #define IDR5_VAX_52_BIT			1
=20
+#define ARM_SMMU_IIDR			0x18
+#define IIDR_PRODUCTID			GENMASK(31, 20)
+#define IIDR_VARIANT			GENMASK(19, 16)
+#define IIDR_REVISION			GENMASK(15, 12)
+#define IIDR_IMPLEMENTER		GENMASK(11, 0)
+
+#define IIDR_IMPLEMENTER_ARM		0x43b
+#define IIDR_PRODUCTID_ARM_MMU_600	0x483
+#define IIDR_PRODUCTID_ARM_MMU_700	0x487
+
 #define ARM_SMMU_CR0			0x20
 #define CR0_ATSCHK			(1 << 4)
 #define CR0_CMDQEN			(1 << 3)
@@ -603,10 +613,24 @@ struct arm_smmu_device {
 #define ARM_SMMU_FEAT_COHERENCY		(1 << 8)
 #define ARM_SMMU_FEAT_TRANS_S1		(1 << 9)
 #define ARM_SMMU_FEAT_TRANS_S2		(1 << 10)
-#define ARM_SMMU_FEAT_STALLS		(1 << 11)
-#define ARM_SMMU_FEAT_HYP		(1 << 12)
-#define ARM_SMMU_FEAT_STALL_FORCE	(1 << 13)
-#define ARM_SMMU_FEAT_VAX		(1 << 14)
+#define ARM_SMMU_FEAT_NESTING	    (1 << 11)
+#define ARM_SMMU_FEAT_STALLS		(1 << 12)
+#define ARM_SMMU_FEAT_HYP		(1 << 13)
+#define ARM_SMMU_FEAT_STALL_FORCE	(1 << 14)
+#define ARM_SMMU_FEAT_VAX		(1 << 15)
+#define ARM_SMMU_FEAT_ASID_16		(1 << 16)
+#define ARM_SMMU_FEAT_TTF_AARCH64		(1 << 17)
+#define ARM_SMMU_FEAT_TTF_AARCH32_64	(1 << 18)
+#define ARM_SMMU_FEAT_GRAN64K	(1 << 19)
+#define ARM_SMMU_FEAT_GRAN16K	(1 << 20)
+#define ARM_SMMU_FEAT_GRAN4K	(1 << 21)
+#define ARM_SMMU_FEAT_OAS_32_BIT	(1 << 22)
+#define ARM_SMMU_FEAT_OAS_36_BIT	(1 << 23)
+#define ARM_SMMU_FEAT_OAS_40_BIT	(1 << 24)
+#define ARM_SMMU_FEAT_OAS_42_BIT	(1 << 25)
+#define ARM_SMMU_FEAT_OAS_44_BIT	(1 << 26)
+#define ARM_SMMU_FEAT_OAS_48_BIT	(1 << 27)
+#define ARM_SMMU_FEAT_OAS_52_BIT	(1 << 28)
 	u32				features;
=20
 #define ARM_SMMU_OPT_SKIP_PREFETCH	(1 << 0)
diff --git a/xen/drivers/passthrough/arm/viommu.c b/xen/drivers/passthrough=
/arm/viommu.c
index 2b16f11017..b4b91ab1cb 100644
--- a/xen/drivers/passthrough/arm/viommu.c
+++ b/xen/drivers/passthrough/arm/viommu.c
@@ -18,7 +18,8 @@ static bool host_iommu_list_incomplete;
=20
 /* Common function for adding to host_iommu_list */
 void __init add_to_host_iommu_list(paddr_t addr, paddr_t size,
-                            const struct dt_device_node *node)
+                            const struct dt_device_node *node,
+                            const void *iommu)
 {
     struct host_iommu *iommu_data;
     int irq;
@@ -46,6 +47,7 @@ void __init add_to_host_iommu_list(paddr_t addr, paddr_t =
size,
         return;
     }
     iommu_data->irq =3D irq;
+    iommu_data->iommu =3D iommu;
=20
     printk("vIOMMU: Found IOMMU @0x%"PRIx64"\n", addr);
=20
diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrou=
gh/arm/vsmmu-v3.c
index 7540c6fc54..e3ef68d193 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.c
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
@@ -6,9 +6,13 @@
 #include <asm/mmio.h>
 #include <asm/viommu.h>
=20
+#include "smmu-v3.h"
+#include "vsmmu-v3.h"
+
 struct virt_smmu {
     struct      domain *d;
     struct      list_head viommu_list;
+    uint32_t    features;
 };
=20
 static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
@@ -30,7 +34,8 @@ static const struct mmio_handler_ops vsmmuv3_mmio_handler=
 =3D {
     .write =3D vsmmuv3_mmio_write,
 };
=20
-static int vsmmuv3_init_single(struct domain *d, paddr_t addr, paddr_t siz=
e)
+static int vsmmuv3_init_single(struct domain *d, paddr_t addr, paddr_t siz=
e,
+                               uint32_t features)
 {
     struct virt_smmu *smmu;
=20
@@ -39,6 +44,7 @@ static int vsmmuv3_init_single(struct domain *d, paddr_t =
addr, paddr_t size)
         return -ENOMEM;
=20
     smmu->d =3D d;
+    smmu->features =3D features;
=20
     register_mmio_handler(d, &vsmmuv3_mmio_handler, addr, size, smmu);
=20
@@ -51,23 +57,90 @@ static int vsmmuv3_init_single(struct domain *d, paddr_=
t addr, paddr_t size)
 static int domain_vsmmuv3_init(struct domain *d)
 {
     int ret;
+    struct host_iommu *hw_iommu;
+    const struct arm_smmu_device *smmu;
+
+    if ( list_head_is_null(&host_iommu_list) )
+        return -ENODEV;
+
+    /*
+    * Check physical IOMMUs for Stage-1 and nesting support.
+    * vIOMMU exposure is rejected if Stage-1 is not supported or
+    * if both Stage-1 and Stage-2 are supported but nesting is
+    * disabled, e.g. due to hardware errata.
+    */
+    list_for_each_entry(hw_iommu, &host_iommu_list, entry)
+    {
+        smmu =3D (const struct arm_smmu_device *)hw_iommu->iommu;
+
+        if ( !(smmu->features & ARM_SMMU_FEAT_TRANS_S1) )
+        {
+            printk(XENLOG_G_ERR
+                "vSMMUv3: Stage-1 translation not supported by HW IOMMU\n"=
);
+            return -EINVAL;
+        }
+
+        if ( (smmu->features & ARM_SMMU_FEAT_TRANS_S2) &&
+             !(smmu->features & ARM_SMMU_FEAT_NESTING) )
+        {
+            printk(XENLOG_G_ERR
+                "vSMMUv3: Nesting not supported by HW IOMMU\n");
+            return -EINVAL;
+        }
+    }
=20
     INIT_LIST_HEAD(&d->arch.viommu_list);
=20
     if ( domain_use_host_layout(d) )
     {
-        struct host_iommu *hw_iommu;
-
         list_for_each_entry(hw_iommu, &host_iommu_list, entry)
         {
-            ret =3D vsmmuv3_init_single(d, hw_iommu->addr, hw_iommu->size)=
;
+            smmu =3D (const struct arm_smmu_device *) hw_iommu->iommu;
+            ret =3D vsmmuv3_init_single(d, hw_iommu->addr, hw_iommu->size,
+                                      smmu->features);
             if ( ret )
                 return ret;
         }
     }
     else
     {
-        ret =3D vsmmuv3_init_single(d, GUEST_VSMMUV3_BASE, GUEST_VSMMUV3_S=
IZE);
+        /*
+         * Require: For non-hardware domains, features must be uniform acr=
oss
+         * physical SMMUs to avoid advertising features that are unsupport=
ed by
+         * certain units.
+         */
+        uint32_t features;
+        hw_iommu =3D list_first_entry(&host_iommu_list, struct host_iommu,=
 entry);
+        smmu =3D (const struct arm_smmu_device *) hw_iommu->iommu;
+        features =3D smmu->features;
+        list_for_each_entry(hw_iommu, &host_iommu_list, entry)
+        {
+            smmu =3D (const struct arm_smmu_device *) hw_iommu->iommu;
+
+            if ( smmu->features !=3D features )
+            {
+                printk(XENLOG_G_ERR
+                       "vSMMUv3: Unsupported HW layout: physical SMMUs mus=
t " \
+                       "have a uniform set of features\n");
+                return -EINVAL;
+            }
+        }
+
+        /*
+         * Reject vIOMMU exposure to non-hardware
+         * domains if the physical SMMU does not support stage-2
+         * (stage-1-only mode is supported for direct-mapped domains only)
+         */
+        if ( !(features & ARM_SMMU_FEAT_TRANS_S2) )
+        {
+            printk(XENLOG_G_ERR
+                   "vSMMUv3: Physical SMMU must support stage-2 translatio=
n "
+                   "for non-hardware domains.\n");
+            return -EINVAL;
+        }
+
+        ret =3D vsmmuv3_init_single(d, GUEST_VSMMUV3_BASE, GUEST_VSMMUV3_S=
IZE,
+                                  features);
         if ( ret )
             return ret;
     }
--=20
2.43.0

