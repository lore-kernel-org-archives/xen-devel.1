Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AF5606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 21:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=NTIdlWjR
Received: from list by lists.xenproject.org with outflank-mailman.1462580.1673613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLoNL-0006oa-Rq; Tue, 27 Oct 2026 21:06:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462580.1673613; Tue, 27 Oct 2026 21:06:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLoNL-0006ni-N8; Tue, 27 Oct 2026 21:06:31 +0000
Received: by outflank-mailman (input) for mailman id 1462580;
 Tue, 27 Oct 2026 21:06:30 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xLoNJ-0006LO-MR
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 21:06:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLoNJ-005OFk-2l
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 22:06:29 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ae11224-bab6-0a2a0a5309dd-0a2a45048502-30
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 22:06:29 +0100
Received: from [52.101.65.143]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ae11254-b57f-0a2a45040019-3465418fbeaa-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 22:06:28 +0100
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by PAVPR03MB9573.eurprd03.prod.outlook.com
 (2603:10a6:102:302::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Tue, 27 Oct
 2026 21:06:27 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 21:06:27 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tWGfpj2G0xRSTcZuZfnxDb0mk5h502pScavdxQjIt8Tj2H2b8DFs4aX0qq1sSxylW0pl8KQoXUsUBP7xDqDGOxPdlGMkhFdI4YdcekAt2eAGJi8LuxAKGRrlWzS9BobE69xcAYyRDKGi9VIH8qPLVl2heUEMopUuG6eyPqs7EBwEPhIzh5cQkv2JcznAlmhUiwo+UH9qSjy4qWpVbBIrVghZK3hh8nq4YXi1mxwI2sWon8pCpIAubJLDcwJsXnyzvveRWhcJAqaqwBYLQbKf7RmFHhOTETFkox8l0CV24dL0HIn0hm41mOmNTiH2N5FwAMTpCKtY1d0Y1LlWr6kMHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/6MV74rIhh8XGalMTquS7ei+eHrk33o7L0PNoZVBG8=;
 b=VZ/ddsSwcG31eQHFsDXBFG9Wgf8DDyJync0NywYgjm17rgRBOPAv5yqj2mESgQ+vYnHHQcF8SQVv4ZsJFcGoPxZqsoB4qov+iONAkScr1fyjuchA88OF1Dk6zn47ejlZdLAC1FrZP9/FOw828M3NbFYVevqrkRwKndPfZ/U6w/UqfHC2fumQK2bqF6+iuOd9l2LO7VK3r9BWFRTXxKJ3m6FGmSfot6DPSf/IbZZaHOQxTCEa5InIgGu1KPD498j9ZiJSZXxnVKqGck/iJrU74XYwfGG+ZUqZxUsSJDRRG8iSD23LOgqcayYL3guw6Dap/LWwmcEskr6SjV691rRfIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/6MV74rIhh8XGalMTquS7ei+eHrk33o7L0PNoZVBG8=;
 b=NTIdlWjRIvvbsNO+vw4TvKJtwY6vrf5ZKtDaN2NstYEzKZd7JM8DIttIB6EyLWgzsOuYKk+rPb6suYmmP2fmHO80o6YCpYgprV7SPr+gj+1IPNZ20E9jnaWREhClC95R7Gw0MqDxST3vzlJKKhhQx7tKjFZViUAj9A4X33rzJ6cwz3+ktv2PRq1AaSrRdULYE/BWu/KsI7QHqoCL53QqZpHJEoLeJBWZ4rmzdkvCxLjAnYCJqBUPDPsYN1b5o7VdOyHOubNNcPZXRs4p5dPm3s3gPvK31D+Gcd9OjL894dULY2eLhHsxTBIpFz669mTAuV8Qa3iBSX99/qU2K8h9KA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v13 09/14] iommu/ipmmu-vmsa: Implement suspend/resume callbacks
Date: Tue, 27 Oct 2026 23:05:58 +0200
Message-ID: <3f8f4ecf30d38d589c2d08f5b2676bda93f8d880.1793129971.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793129971.git.mykola_kvach@epam.com>
References: <cover.1793129971.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0223.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::6) To DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0302MB9208:EE_|PAVPR03MB9573:EE_
X-MS-Office365-Filtering-Correlation-Id: 611fc1c6-8d38-4a15-b7fa-08df346e2a3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|261026121527099003|261022075727099003|11063799006|5023799004|56012099006|261009223027099003|261021123027099003|261021121427099003|261022105027099003|22082099003|18002099003|6133799003|10067099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	JSFdbEdVmGYn3Jui5eGZM1FC9XKKs4n5TXUZLmnPaXu05MPBFKsn917nlzoRlNMJm0/SeCVqSKijv7DulaNiQaYX2zr7QyXRiBLakfZQIvZDhN4f9gPN373oB34BryVp2JlwQqpG4iFLccaZA3m08tb7wmnrDMREoH1xOMsYzokzx6B+801C8WL/Jm0jnCqk1oza31Ej5XxiDiDeBIALbDjLIjU7/1PrWoPfWpWTbUIiXuPQy+FNjmB5UTmEbhJPaEFSZWSok9+oK4+4NSiXqkgH/fBedr7NOraPIUtPUftHXM70JRU9my668vMX7uVHJKXI62eIkd4yIcbmEXc93j9Rnpkuol+dlTukpt9eVn3IWmLrQGjy9NYJehyXYCneSp9W3ayxNocqnx1VqyMp0Qe+a0Ac79er89T+LQDVXJ6zXYdRliVwXmJOSCLxhPKq8lmMGKVr3hdJ8MpcKHm3U7p7vbYPYYP7xwLMeT6hDL9kv7M42N8aYrheccwGWvRFeDXGjdN4UqzTPEAPptD0xmIhP4rwZ0ampMAZA81VAEEI3NZ1E0KXdp/2ovvEaNAAS0llbqgcvyKvlvVkr2TFJ0XeRm2urFq/KX60pMNGtHqPX5oBi37s3H/GroED2YYQfQQP5XSDFjBz0IH53OWseROJUc+/lu1Jw+nR5tKtm+s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(261026121527099003)(261022075727099003)(11063799006)(5023799004)(56012099006)(261009223027099003)(261021123027099003)(261021121427099003)(261022105027099003)(22082099003)(18002099003)(6133799003)(10067099003)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y445bxpIcvYMbqRO4cKjIwmbk/MTsZfXIEzsltLPS0IM52eELo2PVlZNF0ws?=
 =?us-ascii?Q?gbZD30jILfrUcmMGPldbtceR74MP7HGDiJv1AYAeyGOWFaJl/HY9sjF1pE3i?=
 =?us-ascii?Q?mV6EcytnNsLWFdX0Eebsbs9Cms2J3AjWKtE6fzVX0mVaBEnsaoYcTikizAih?=
 =?us-ascii?Q?ca7isjlhxas6qB4FyAi5/zrGXP2kU6GUsUa29aVVKGOUq806ScAAE4v4G5R0?=
 =?us-ascii?Q?1WXb2E07pyd8Apgx/LdjfbRrl9slKQms47rhKYkXjg+Qo3GL918/RWdrYM3r?=
 =?us-ascii?Q?rGuuapTMpsP3xhoXXj4NDD+8CujS7P/LXWJ/bw5FanwayaLTzbEcodkrHaXg?=
 =?us-ascii?Q?WTWK60NanmLOinaDCuP6DXfwc2TT8sXz8O89/Mqn2hkIMOTpjGaIkpg1GHrv?=
 =?us-ascii?Q?zDxYShuHAkj8V9dCz13MVn6bRMHqPFdeZEygQ3/MsoCtXl5kk/WRfGHwmJ/E?=
 =?us-ascii?Q?sLYqsIUjOmfx+nWoUJtBPaogTxVes5YglJHQoF7XSmu91TgIssoCftc8U6Lb?=
 =?us-ascii?Q?irPOettIgpSpJsCccEG8jibvWbm0oziBRKVzGxZ1YFNVkbfV+TzM4h8FrzYI?=
 =?us-ascii?Q?rAfQMQu0n/DawudbQ+yp/mNI6RjggCAQembHARky6YSe/MiFmCG8ygtLkAcO?=
 =?us-ascii?Q?I7c9sUIOTP5D+hrCW4mTRNXHIFPY/pWXpXWX1h5GGfpP+SM1efrL5JcLQyj9?=
 =?us-ascii?Q?ACsovsNJRvw72+vqT0XCS8FPoTCWUku39EpMRLvYdx0+zI4iOUdKxbmk8G9c?=
 =?us-ascii?Q?SulqdjRQkgKuiQ3zdjwPnCc2cQkLxN3TW7vfimhWKXTzTsr9JXruk+xeft0F?=
 =?us-ascii?Q?wdoRrhKq5+hj/DcsxAWE/VNxtiPQ0sQt6BChsa1NL7lAohdSQ8SpKvlL0/Va?=
 =?us-ascii?Q?ITOPcmFAv6zFp8gU1jxmjZXzyUJ4AWfbcCP4DXblxqrE8Oswo+l+hc+9DDaF?=
 =?us-ascii?Q?EENk6N32WStCaFiZbLt6DScgJ8SRbwUS5PwnqJ54T70x9ueXGcLqtGPVBrYp?=
 =?us-ascii?Q?/53rg1AbnZSQhAXlDEGEvlFz3lpQspJwJ6SPq50gNFA3YEOgSeaqH4ZVmtTS?=
 =?us-ascii?Q?uYaalriYhHlISkSP47SR9Lf9stovihAqy2s6vYJgnO+QO3z9WGeQ7qYcuOdZ?=
 =?us-ascii?Q?zH4YMecElUHChQFkpgShKMblxBDgvavEovUyEeUyJEH40emxzxZ0xJ/0PP5g?=
 =?us-ascii?Q?xl9oUOFiWmiD0BOqzQGKRckbHI1VgXXsj5S6Z+Z1+ZnNTCgrOWtzhiwb1Jas?=
 =?us-ascii?Q?8ziup62riG4xReGfjRMCoqW7bjTM5kbn1vlgxhT/TNV1F3NBu6nW8ClOQVFf?=
 =?us-ascii?Q?Q4Kbt8vpWqiy0bpUIRzqQlOPC/6VVja7HFcQKS8xyQ5+tOw8DJBglrl1UWxH?=
 =?us-ascii?Q?HvBvBJTOzy3sExzME16/BQo9TRLX+4Md7XWXW19OxNB1eZCHqxa0LzT069Qg?=
 =?us-ascii?Q?meL2CUgmImYsx6Jp57YlDsKehvgzWTlvfPhrS9URmXrdENyHk3DdKW0/HWjl?=
 =?us-ascii?Q?8Pcvk8Diz4MuJrGFM951NI7wEdSMw0vzwyhWZvHU+OyvSJACOm5WtN5I8BUE?=
 =?us-ascii?Q?qwbRXVQQHoxaPmdVRySIXOomRQl88XAnCFqSZJTsrIvSzHHNJqGcH8CjFbnW?=
 =?us-ascii?Q?SjvrN1Ls4wUVMf1qk0PUJaZc9V5Qpni7qTkVQM0SeYx7eUaD0VztvlUuOQGE?=
 =?us-ascii?Q?OULKQp1aQbDpPtjRhMmESEPtYaXC1djBOdSNL+bG6k8h9cQImSVO+As1q/pi?=
 =?us-ascii?Q?h7lqEUtJmQ=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 611fc1c6-8d38-4a15-b7fa-08df346e2a3b
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 21:06:27.0461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eQlurBOLrRsCuxZBH7LH7xrQkw8knmRCZJ9e/DJr/pPbvlXTsLilmL8Psy/l6S1idWlxsVCZUJF2kcfnrhPgaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9573
X-purgate-ID: tlsNG-ebf023/1793135189-526CAB50-0A84E958/0/0
X-purgate-type: clean
X-purgate-size: 14548
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Store and restore active context and micro-TLB registers.

On resume, restore Root IPMMU context state before restoring Cache IPMMU
micro-TLB state. Cache IPMMUs select Root contexts through their micro-TLB
configuration, so restoring Cache micro-TLBs before the Root context
registers are restored can expose stale or uninitialized context state.

Tested only on H3ULCB (R-Car Gen3).

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in V13:
- State that suspend/resume was tested only on H3ULCB (R-Car Gen3).

Changes in V10:
- Iterate over registered IPMMUs in reverse order during resume so Root IPMMU
  context state is restored before Cache IPMMU micro-TLB state.

Changes in V9:
- set dt_device_set_protected() only after ipmmu_alloc_ctx_suspend()
  succeeds, so DT devices do not remain protected on allocation failure.

Changes in V7:
- moved suspend context allocation before pci stuff
---
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 323 +++++++++++++++++++++--
 1 file changed, 308 insertions(+), 15 deletions(-)

diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index fa9ab9cb13..2e54fa63d6 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -71,6 +71,8 @@
 })
 #endif
 
+#define dev_dbg(dev, fmt, ...)    \
+    dev_print(dev, XENLOG_DEBUG, fmt, ## __VA_ARGS__)
 #define dev_info(dev, fmt, ...)    \
     dev_print(dev, XENLOG_INFO, fmt, ## __VA_ARGS__)
 #define dev_warn(dev, fmt, ...)    \
@@ -130,6 +132,24 @@ struct ipmmu_features {
     unsigned int imuctr_ttsel_mask;
 };
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+struct ipmmu_reg_ctx {
+    unsigned int imttlbr0;
+    unsigned int imttubr0;
+    unsigned int imttbcr;
+    unsigned int imctr;
+};
+
+struct ipmmu_vmsa_backup {
+    struct device *dev;
+    unsigned int *utlbs_val;
+    unsigned int *asids_val;
+    struct list_head list;
+};
+
+#endif
+
 /* Root/Cache IPMMU device's information */
 struct ipmmu_vmsa_device {
     struct device *dev;
@@ -142,6 +162,9 @@ struct ipmmu_vmsa_device {
     struct ipmmu_vmsa_domain *domains[IPMMU_CTX_MAX];
     unsigned int utlb_refcount[IPMMU_UTLB_MAX];
     const struct ipmmu_features *features;
+#ifdef CONFIG_SYSTEM_SUSPEND
+    struct ipmmu_reg_ctx *reg_backup[IPMMU_CTX_MAX];
+#endif
 };
 
 /*
@@ -547,6 +570,249 @@ static void ipmmu_domain_free_context(struct ipmmu_vmsa_device *mmu,
     spin_unlock_irqrestore(&mmu->lock, flags);
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+static DEFINE_SPINLOCK(ipmmu_devices_backup_lock);
+static LIST_HEAD(ipmmu_devices_backup);
+
+static struct ipmmu_reg_ctx root_pgtable[IPMMU_CTX_MAX];
+
+static uint32_t ipmmu_imuasid_read(struct ipmmu_vmsa_device *mmu,
+                                   unsigned int utlb)
+{
+    return ipmmu_read(mmu, ipmmu_utlb_reg(mmu, IMUASID(utlb)));
+}
+
+static void ipmmu_utlbs_backup(struct ipmmu_vmsa_device *mmu)
+{
+    struct ipmmu_vmsa_backup *backup_data;
+
+    dev_dbg(mmu->dev, "Handle micro-TLBs backup\n");
+
+    spin_lock(&ipmmu_devices_backup_lock);
+
+    list_for_each_entry( backup_data, &ipmmu_devices_backup, list )
+    {
+        struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(backup_data->dev);
+        unsigned int i;
+
+        if ( to_ipmmu(backup_data->dev) != mmu )
+            continue;
+
+        for ( i = 0; i < fwspec->num_ids; i++ )
+        {
+            unsigned int utlb = fwspec->ids[i];
+
+            backup_data->asids_val[i] = ipmmu_imuasid_read(mmu, utlb);
+            backup_data->utlbs_val[i] = ipmmu_imuctr_read(mmu, utlb);
+        }
+    }
+
+    spin_unlock(&ipmmu_devices_backup_lock);
+}
+
+static void ipmmu_utlbs_restore(struct ipmmu_vmsa_device *mmu)
+{
+    struct ipmmu_vmsa_backup *backup_data;
+
+    dev_dbg(mmu->dev, "Handle micro-TLBs restore\n");
+
+    spin_lock(&ipmmu_devices_backup_lock);
+
+    list_for_each_entry( backup_data, &ipmmu_devices_backup, list )
+    {
+        struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(backup_data->dev);
+        unsigned int i;
+
+        if ( to_ipmmu(backup_data->dev) != mmu )
+            continue;
+
+        for ( i = 0; i < fwspec->num_ids; i++ )
+        {
+            unsigned int utlb = fwspec->ids[i];
+
+            ipmmu_imuasid_write(mmu, utlb, backup_data->asids_val[i]);
+            ipmmu_imuctr_write(mmu, utlb, backup_data->utlbs_val[i]);
+        }
+    }
+
+    spin_unlock(&ipmmu_devices_backup_lock);
+}
+
+static void ipmmu_domain_backup_context(struct ipmmu_vmsa_domain *domain)
+{
+    struct ipmmu_vmsa_device *mmu = domain->mmu->root;
+    struct ipmmu_reg_ctx *regs = mmu->reg_backup[domain->context_id];
+
+    dev_dbg(mmu->dev, "Handle domain context %u backup\n", domain->context_id);
+
+    regs->imttlbr0 = ipmmu_ctx_read_root(domain, IMTTLBR0);
+    regs->imttubr0 = ipmmu_ctx_read_root(domain, IMTTUBR0);
+    regs->imttbcr  = ipmmu_ctx_read_root(domain, IMTTBCR);
+    regs->imctr    = ipmmu_ctx_read_root(domain, IMCTR);
+}
+
+static void ipmmu_domain_restore_context(struct ipmmu_vmsa_domain *domain)
+{
+    struct ipmmu_vmsa_device *mmu = domain->mmu->root;
+    struct ipmmu_reg_ctx *regs = mmu->reg_backup[domain->context_id];
+
+    dev_dbg(mmu->dev, "Handle domain context %u restore\n", domain->context_id);
+
+    ipmmu_ctx_write_root(domain, IMTTLBR0, regs->imttlbr0);
+    ipmmu_ctx_write_root(domain, IMTTUBR0, regs->imttubr0);
+    ipmmu_ctx_write_root(domain, IMTTBCR,  regs->imttbcr);
+    ipmmu_ctx_write_all(domain,  IMCTR,    regs->imctr | IMCTR_FLUSH);
+}
+
+/*
+ * Xen: Unlike Linux implementation, Xen uses a single driver instance
+ * for handling all IPMMUs. There is no framework for ipmmu_suspend/resume
+ * callbacks to be invoked for each IPMMU device. So, we need to iterate
+ * through all registered IPMMUs performing required actions.
+ *
+ * Also take care of restoring special settings, such as translation
+ * table format, etc.
+ */
+static int __must_check ipmmu_suspend(void)
+{
+    struct ipmmu_vmsa_device *mmu;
+
+    if ( !iommu_enabled )
+        return 0;
+
+    printk(XENLOG_DEBUG "ipmmu: Suspending...\n");
+
+    spin_lock(&ipmmu_devices_lock);
+
+    list_for_each_entry( mmu, &ipmmu_devices, list )
+    {
+        if ( ipmmu_is_root(mmu) )
+        {
+            unsigned int i;
+
+            for ( i = 0; i < mmu->num_ctx; i++ )
+            {
+                if ( !mmu->domains[i] )
+                    continue;
+                ipmmu_domain_backup_context(mmu->domains[i]);
+            }
+        }
+        else
+            ipmmu_utlbs_backup(mmu);
+    }
+
+    spin_unlock(&ipmmu_devices_lock);
+
+    return 0;
+}
+
+static void ipmmu_resume(void)
+{
+    struct ipmmu_vmsa_device *mmu;
+
+    if ( !iommu_enabled )
+        return;
+
+    printk(XENLOG_DEBUG "ipmmu: Resuming...\n");
+
+    spin_lock(&ipmmu_devices_lock);
+
+    /*
+     * IPMMUs are registered with list_add(), with Root IPMMU probed first.
+     * Walk backwards to restore Root contexts before Cache micro-TLBs.
+     */
+    list_for_each_entry_reverse( mmu, &ipmmu_devices, list )
+    {
+        uint32_t reg;
+
+        /* Do not use security group function */
+        reg = IMSCTLR + mmu->features->control_offset_base;
+        ipmmu_write(mmu, reg, ipmmu_read(mmu, reg) & ~IMSCTLR_USE_SECGRP);
+
+        if ( ipmmu_is_root(mmu) )
+        {
+            unsigned int i;
+
+            /* Use stage 2 translation table format */
+            reg = IMSAUXCTLR + mmu->features->control_offset_base;
+            ipmmu_write(mmu, reg, ipmmu_read(mmu, reg) | IMSAUXCTLR_S2PTE);
+
+            for ( i = 0; i < mmu->num_ctx; i++ )
+            {
+                if ( !mmu->domains[i] )
+                    continue;
+                ipmmu_domain_restore_context(mmu->domains[i]);
+            }
+        }
+        else
+            ipmmu_utlbs_restore(mmu);
+    }
+
+    spin_unlock(&ipmmu_devices_lock);
+}
+
+static int ipmmu_alloc_ctx_suspend(struct device *dev)
+{
+    struct ipmmu_vmsa_backup *backup_data;
+    unsigned int *utlbs_val, *asids_val;
+    struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+
+    utlbs_val = xzalloc_array(unsigned int, fwspec->num_ids);
+    if ( !utlbs_val )
+        return -ENOMEM;
+
+    asids_val = xzalloc_array(unsigned int, fwspec->num_ids);
+    if ( !asids_val )
+    {
+        xfree(utlbs_val);
+        return -ENOMEM;
+    }
+
+    backup_data = xzalloc(struct ipmmu_vmsa_backup);
+    if ( !backup_data )
+    {
+        xfree(utlbs_val);
+        xfree(asids_val);
+        return -ENOMEM;
+    }
+
+    backup_data->dev = dev;
+    backup_data->utlbs_val = utlbs_val;
+    backup_data->asids_val = asids_val;
+
+    spin_lock(&ipmmu_devices_backup_lock);
+    list_add(&backup_data->list, &ipmmu_devices_backup);
+    spin_unlock(&ipmmu_devices_backup_lock);
+
+    return 0;
+}
+
+#ifdef CONFIG_HAS_PCI
+static void ipmmu_free_ctx_suspend(struct device *dev)
+{
+    struct ipmmu_vmsa_backup *backup_data, *tmp;
+
+    spin_lock(&ipmmu_devices_backup_lock);
+
+    list_for_each_entry_safe( backup_data, tmp, &ipmmu_devices_backup, list )
+    {
+        if ( backup_data->dev == dev )
+        {
+            list_del(&backup_data->list);
+            xfree(backup_data->utlbs_val);
+            xfree(backup_data->asids_val);
+            xfree(backup_data);
+            break;
+        }
+    }
+
+    spin_unlock(&ipmmu_devices_backup_lock);
+}
+#endif /* CONFIG_HAS_PCI */
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 static int ipmmu_domain_init_context(struct ipmmu_vmsa_domain *domain)
 {
     uint64_t ttbr;
@@ -559,6 +825,9 @@ static int ipmmu_domain_init_context(struct ipmmu_vmsa_domain *domain)
         return ret;
 
     domain->context_id = ret;
+#ifdef CONFIG_SYSTEM_SUSPEND
+    domain->mmu->root->reg_backup[ret] = &root_pgtable[ret];
+#endif
 
     /*
      * TTBR0
@@ -615,6 +884,9 @@ static void ipmmu_domain_destroy_context(struct ipmmu_vmsa_domain *domain)
     ipmmu_ctx_write_root(domain, IMCTR, IMCTR_FLUSH);
     ipmmu_tlb_sync(domain);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+    domain->mmu->root->reg_backup[domain->context_id] = NULL;
+#endif
     ipmmu_domain_free_context(domain->mmu->root, domain->context_id);
 }
 
@@ -1338,10 +1610,11 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
     struct iommu_fwspec *fwspec;
 
 #ifdef CONFIG_HAS_PCI
+    int ret;
+
     if ( dev_is_pci(dev) )
     {
         struct pci_dev *pdev = dev_to_pci(dev);
-        int ret;
 
         if ( devfn != pdev->devfn )
             return 0;
@@ -1358,17 +1631,24 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
     if ( !to_ipmmu(dev) )
         return -ENODEV;
 
-    if ( !dev_is_pci(dev) )
+    if ( !dev_is_pci(dev) && dt_device_is_protected(dev_to_dt(dev)) )
     {
-        if ( dt_device_is_protected(dev_to_dt(dev)) )
-        {
-            dev_err(dev, "Already added to IPMMU\n");
-            return -EEXIST;
-        }
+        dev_err(dev, "Already added to IPMMU\n");
+        return -EEXIST;
+    }
 
-        /* Let Xen know that the master device is protected by an IOMMU. */
-        dt_device_set_protected(dev_to_dt(dev));
+#ifdef CONFIG_SYSTEM_SUSPEND
+    if ( ipmmu_alloc_ctx_suspend(dev) )
+    {
+        dev_err(dev, "Failed to allocate context for suspend\n");
+        return -ENOMEM;
     }
+#endif
+
+    /* Let Xen know that the master device is protected by an IOMMU. */
+    if ( !dev_is_pci(dev) )
+        dt_device_set_protected(dev_to_dt(dev));
+
 #ifdef CONFIG_HAS_PCI
     if ( dev_is_pci(dev) )
     {
@@ -1377,26 +1657,28 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
         struct pci_host_bridge *bridge;
         struct iommu_fwspec *fwspec_bridge;
         unsigned int utlb_osid0 = 0;
-        int ret;
 
         bridge = pci_find_host_bridge(pdev->seg, pdev->bus);
         if ( !bridge )
         {
             dev_err(dev, "Failed to find host bridge\n");
-            return -ENODEV;
+            ret = -ENODEV;
+            goto free_suspend_ctx;
         }
 
         fwspec_bridge = dev_iommu_fwspec_get(dt_to_dev(bridge->dt_node));
         if ( fwspec_bridge->num_ids < 1 )
         {
             dev_err(dev, "Failed to find host bridge uTLB\n");
-            return -ENXIO;
+            ret = -ENXIO;
+            goto free_suspend_ctx;
         }
 
         if ( fwspec->num_ids < 1 )
         {
             dev_err(dev, "Failed to find uTLB");
-            return -ENXIO;
+            ret = -ENXIO;
+            goto free_suspend_ctx;
         }
 
         rcar4_pcie_osid_regs_init(bridge);
@@ -1405,7 +1687,7 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
         if ( ret < 0 )
         {
             dev_err(dev, "No unused OSID regs\n");
-            return ret;
+            goto free_suspend_ctx;
         }
         reg_id = ret;
 
@@ -1420,7 +1702,7 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
         {
             rcar4_pcie_osid_bdf_clear(bridge, reg_id);
             rcar4_pcie_osid_reg_free(bridge, reg_id);
-            return ret;
+            goto free_suspend_ctx;
         }
     }
 #endif
@@ -1429,6 +1711,13 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
              dev_name(fwspec->iommu_dev), fwspec->num_ids);
 
     return 0;
+#ifdef CONFIG_HAS_PCI
+ free_suspend_ctx:
+#ifdef CONFIG_SYSTEM_SUSPEND
+    ipmmu_free_ctx_suspend(dev);
+#endif
+    return ret;
+#endif
 }
 
 static int ipmmu_iommu_domain_init(struct domain *d)
@@ -1490,6 +1779,10 @@ static const struct iommu_ops ipmmu_iommu_ops =
     .unmap_page      = arm_iommu_unmap_page,
     .dt_xlate        = ipmmu_dt_xlate,
     .add_device      = ipmmu_add_device,
+#ifdef CONFIG_SYSTEM_SUSPEND
+    .suspend         = ipmmu_suspend,
+    .resume          = ipmmu_resume,
+#endif
 };
 
 static __init int ipmmu_init(struct dt_device_node *node, const void *data)
-- 
2.53.0


