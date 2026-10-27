Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CF6606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 23:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=Qh0YDb3H
Received: from list by lists.xenproject.org with outflank-mailman.1462771.1673771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLqzI-00031k-Ao; Tue, 27 Oct 2026 23:53:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462771.1673771; Tue, 27 Oct 2026 23:53:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLqzI-00031d-7h; Tue, 27 Oct 2026 23:53:52 +0000
Received: by outflank-mailman (input) for mailman id 1462771;
 Tue, 27 Oct 2026 23:53:50 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xLqzG-00031X-Gz
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 23:53:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLqzE-009EGn-QQ
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 00:53:48 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ae13982-2eae-0a2a0a5409dd-0a2a45038b0c-2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 00:53:48 +0100
Received: from [52.101.72.103]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ae1398c-fae8-0a2a45030019-346548678a98-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 00:53:48 +0100
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by BESPR03MB255357.eurprd03.prod.outlook.com
 (2603:10a6:b10:12a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 23:53:45 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 23:53:45 +0000
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
 b=PKdSEMFnBzO5OoVsZAr7NjGW5OD2qUOpDhtHmLaRFKffETwupQxHCRouuvYHE39Q/aJzRpk3XXjjFhCi6b5pPXTAbXNHoz+GSdWb6InHCyN2FUC368cWwgHZUqJK8mGp4dCM4oKbfOA67nUw/GBXAjHJMQUrYzYPpdMx7Lndu3nAKlT2w/zujy9x2Do4HDSRPKn3L19aot5lX3SHYCrI5UkhM4wj43fEUp6+Tx6haf8ek4HYccbbdQGUvs7sjfG4zqneib11aAAs2ZUQserCLF/NwS9DV6K0fQ36mTlh7BF7vFFWhXoLead5B4g7u9uvedrK40dYqgAE1Ki/sx4gSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=byJ9sFmz24t4mtqdkmgsDp+GwT4BJiF9LkfjFfCoY0U=;
 b=vIZevLxj1kC9OX2a+z+j4mfrdMRDNF0TJsejHBwypw0wlPeYzwGHhMVIMgBvOWhakL1AAZarlqhIP4Xz1tuw8AwJcYwWPFBG6tflsF2iDIYLq9vPqEVMFxagQfaEhxteXFU0XSQjQDIAaFtaESHi85h1S+2qcYYtDD5JSyMBqqtJXMDXvw1+INDt2NYT7SQxhucsS92X6fXG/VO/mKo/qO2Qpadc5G5e+GsDSKhCEys6TUR9/xUqj7QzHEU8h/QJ/4bw0UJEA0guffXAA1VTksddTshOhhc9uHlpEWsfrP+e5h3bs7J26MpSGGZ+qtj/l5G9RkI7BoI5/lpjhpfEig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=byJ9sFmz24t4mtqdkmgsDp+GwT4BJiF9LkfjFfCoY0U=;
 b=Qh0YDb3HbUjkQndFsA6HcZMbZe4qJJpkSlJGvTQV9J2bdm4tK6K24zZStIABwTtcDQl9gHHqE0IqLic+dQh75qUD6fV5qVXOVIR7jhCeFWRDV3s5k2KJBevFkn/Ie7J1hcFSYh5Uh69WWGoGXv9bXyAl7lc6lF86lDlZlSmzKus3pBKGiCsBxAzEJW6uNyhm62QEfE4epGAwK3mstDJu0X1pRLm3G/cLXw/VHwIOwi0mLgS3DvYMpNt0wKoK/ra6w2QCEKWAALD4Ka0xJZhJhe7fpGjVJSWpO/3pAdtuEu2FzsblawHpgkDkZjmbBFcZqURztf8wNrYLHrFUxsC4Qg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
	Rahul Singh <rahul.singh@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] arm/smmuv3: clean stream tables for non-coherent hardware
Date: Wed, 28 Oct 2026 01:53:35 +0200
Message-ID: <d54203457d68a3c6f8f311035a8e66468bb3a96b.1793138347.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P250CA0018.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::23) To DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0302MB9208:EE_|BESPR03MB255357:EE_
X-MS-Office365-Filtering-Correlation-Id: bce4e7fa-7d9d-4e55-79e1-08df3485898b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|6133799003|18002099003|56012099006|261022075727099003|11063799006|10067099003|261009223027099003|261021123027099003|261021121427099003|261022105027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	rX7FS6fctSbEZaOIS5Aw/+oTWcQeHlrd7DYmLF3pj3gqJ9a9E3JMZVZDqGJkIZ0TsIRojP78XmFyfcRNKNR5ucQOAi/Y20q/9WWuUcr51CS5aTzP/D2xP+tluj/CEQAA/mA/dKX0ucglP/Reuw+1PVylwcb2IFHbBXSXWJ56kYt463zgZl48i/cpOvKINGU8J2M7fQIJS9UXY18EWCzs+shDZwg9iKz8ZYbc7EJByOEogojwPSzTjJEewjQ9XXgtNql0ABFoYpDiE+Pjxy4kqCtU6r0XZp61bi9kSpiOPZXQN+cCRB73RrWZ4Crnk2kPNjXx76BSI1Lv67flV1PKS9VxME2IfxeYrWwbEuR07Two17U7B8GxhcepjNIXz3ggYaa1/e/KswdM+j7ycghC0Y7k6pVEsALJ0d/2l6H5hg/DkPufXi2xRw3yVFOKh7kqO0FbmyInhmGTSp2QVAip3yfoBt4fq2UuANpD/9CbjS5pkLgNn8I5HZ0CrfGL6uI09GyByTCGp+P85pBvvdg8fHV7cT9DJOw8GgbLv/MXwme/0G5RraipkKb5oqE5ZJ0PueuUXhueJiI19wBwXmTNHk9Q5VKZTlRXd97QFwotHLwuOeU9iKQYG/pgQ5AxESL4I3fpJW/mtqlRJ5tR1YLBGSqdICuoywff2LgqpqjsVi8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(6133799003)(18002099003)(56012099006)(261022075727099003)(11063799006)(10067099003)(261009223027099003)(261021123027099003)(261021121427099003)(261022105027099003)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HXy27RQ0VNoF6Vm5thfiXv3J9U8V274oMrgCLHTC+lMhAXY5Xve4VVxYh/w7?=
 =?us-ascii?Q?go9YbC4Wwh/o/kpd8tc5dy0Z6oS4Uy728hhhgSQQTgXxWjyqt4a/A5JFcRaE?=
 =?us-ascii?Q?PduSxHfV07ZfM/oqYNpmj0eYNnlp2oVaqM7BaQbTKhJulSpfxUQ1PsKTRPej?=
 =?us-ascii?Q?7L0N9Xx6D+ZgQlHzfC0a02udvqbMmd1rKT27IicB+RFQ6+hxOjioHoRPXmm7?=
 =?us-ascii?Q?QgVIjkyEuJN+7aS2SP8rkjpKgVPGK8lbE7efYX2LeSbHTvbj68nKm6j+thS2?=
 =?us-ascii?Q?68zfrlvpfk1MFDdUvpKBfpW7p1ZV80ynP07fjD7Vds5K7sFzhGGyHkqMuj5j?=
 =?us-ascii?Q?bRuAiOe4wxviFDX3CAl8Yp3QRZwSwR8DgwzF8vfmrgXf+P7K3beNAMTs29Gx?=
 =?us-ascii?Q?cmCCLV12i5de4mU36/wBbWRFkw2NpLyLR9eEFCXov+uHIkhVDMto8BtKGf+J?=
 =?us-ascii?Q?JMc1EkRPIYVxZEnWVo04KDSdAt0aboF+GMs9S1rb+x1wOek5d2DT94YseAsj?=
 =?us-ascii?Q?o5gzxX5fztqKM//63Htxpl9Qw/8UYuuXqdnubg3YRNCfuEaV0gf1iReAWchw?=
 =?us-ascii?Q?emNY0faqMePqbilWuRl/fb2F0/zMk8ylMGQQIuHnojV0MaLfRscitmlQ5u1V?=
 =?us-ascii?Q?4aKZk6XlZxBwZZ47TF+mcLkqFHs9G2WGBEW0Xd7P3vLz/D8opqMPJfr3szt3?=
 =?us-ascii?Q?h7uC89Nl21TwraGSlA3OLQGo5qwj4XyLe9ecZaNEY8Ju5/4ePKqxDcytPGuT?=
 =?us-ascii?Q?61YB2ZGd48cCCHucdop88a9CMlA1AX8duzaNvU7GLUC+giQj0qZyAK9+qpZx?=
 =?us-ascii?Q?wWBBJfyA1B4FgCUFldRFJY+Gdn+kejcUIOt30O8Ht2ivZRLBzhC4lYPs/Brb?=
 =?us-ascii?Q?gMb2puDmOX0PVvqN7hq5ujv9kg9cEgNtjb49qzM41c7UqJf+FXBZVnyeBhTT?=
 =?us-ascii?Q?L/O0DY7dKPb0j2hXpJkSbMTDAHQgnVefzGuBuHxCb7BPDa7lSrV5tG3W09nt?=
 =?us-ascii?Q?PzFE8wQapmTqiQ/qidmLMfRmHZS+HZku7ZKT/UZmg/FFz7Vg3ZkbMlCYKVRV?=
 =?us-ascii?Q?agiXqif0b/C6MDiBrIfwBZLHsU5FmMyJEs+Zs7hWbR8gDOtJ2sRuO3uk7jil?=
 =?us-ascii?Q?LG7+997aUiMTkUgY8BOKIQcHckxR+yGrI1Rr97oglaqEwE3hswAxGY9kwnZD?=
 =?us-ascii?Q?EN5cR+lcebU7F03EXBZ6C8Cxji+z5EUmLXNGaQccnA9rRM8lj38EqwTyYpR2?=
 =?us-ascii?Q?DR9kRP5jghQR0vu+KDM13vXKY34/eFivv8iH1b7k2kE9Fkurk6VKGkQvzwhX?=
 =?us-ascii?Q?K8AA6Gwu/4gIcNr8zkQzlVZ5YbcbMmg6Szb0PZELFyiOY3uPhGrIjXD2w0If?=
 =?us-ascii?Q?Jxxu6zAMcwp4eQc9o/00sVMLhHtSRjgjMZpiu6STz1ba04OQ/WvzWe+ejMY0?=
 =?us-ascii?Q?Ns1tE1ob56eXQTfxCDWIZaAQ8f2ByPBkNqRQlvee2P2SR35iAhkhcoa+4z7g?=
 =?us-ascii?Q?6E01Aqmd9N0js36ClXcePxZVbBlyTFQ6273AYQ4SpK+ilHP4H59tDpn4jSC+?=
 =?us-ascii?Q?GcHAOUTGuH1LmL9Qpw9rFlDceAjkgUCh8D3MQtA0QqWRPlNRFK3zIoDYvhsi?=
 =?us-ascii?Q?VqJr8EuCeXD4AiAmq/mumKKcgU2DbS1mBOv65kmA/gso4oa0vB4UxrLbbuu7?=
 =?us-ascii?Q?IxCH7E+HV060AeW98udH1s6gbNNmIksGIy4Jm2ptBB4lDEqRswAvGaUe+oKJ?=
 =?us-ascii?Q?iJMjqMgNCA=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bce4e7fa-7d9d-4e55-79e1-08df3485898b
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 23:53:45.3923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MJl75ssYTh04tHa4m1BxbXj1RwfENaB2OoNOeCWmDLHraHFO0tdjC7x9kU42q0LuBi81makFsk5nqXp1Slopog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR03MB255357
X-purgate-ID: tlsNG-33051d/1793145228-75C804E9-BF27B8CF/0/0
X-purgate-type: clean
X-purgate-size: 3445
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Xen's dmam_alloc_coherent() returns cacheable memory. A non-coherent
SMMU cannot see writes that remain in the CPU cache.

On Orange Pi 5 (RK3588S), NVMe initialization failed with C_BAD_STREAMID
for SID 0x4100 while the CPU saw a populated L1 descriptor.

Clean new stream tables before use and updated STEs before the existing
configuration invalidations. Clean the L2 table before writing its L1
pointer, then clean the pointer. Skip these cache operations on coherent
SMMUs.

See Arm IHI 0070G.b, sections 3.15 and 3.21.3.1.

Fixes: 452ddbe3592b ("xen/arm: smmuv3: Add support for SMMUv3 driver")
Assisted-by: Codex:GPT-6.1
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/drivers/passthrough/arm/smmu-v3.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index bf153227db..a396e2b9e0 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -637,6 +637,14 @@ static int arm_smmu_cmdq_issue_sync(struct arm_smmu_device *smmu)
 }
 
 /* Stream table manipulation functions */
+static void arm_smmu_clean_strtab(struct arm_smmu_device *smmu,
+				const void *ptr, size_t size)
+{
+	/* Xen's dmam_alloc_coherent() returns cacheable memory. */
+	if (!(smmu->features & ARM_SMMU_FEAT_COHERENCY))
+		(void)clean_dcache_va_range(ptr, size);
+}
+
 static void
 arm_smmu_write_strtab_l1_desc(__le64 *dst, struct arm_smmu_strtab_l1_desc *desc)
 {
@@ -735,8 +743,11 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
 		 * The SMMU can perform negative caching, so we must sync
 		 * the STE regardless of whether the old value was live.
 		 */
-		if (smmu)
+		if (smmu) {
+			arm_smmu_clean_strtab(smmu, dst,
+					      STRTAB_STE_DWORDS * sizeof(*dst));
 			arm_smmu_sync_ste_for_sid(smmu, sid);
+		}
 		return;
 	}
 
@@ -762,8 +773,10 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
 		dst[1] |= cpu_to_le64(FIELD_PREP(STRTAB_STE_1_EATS,
 						 STRTAB_STE_1_EATS_TRANS));
 
+	arm_smmu_clean_strtab(smmu, dst, STRTAB_STE_DWORDS * sizeof(*dst));
 	arm_smmu_sync_ste_for_sid(smmu, sid);
 	write_atomic(&dst[0], cpu_to_le64(val));
+	arm_smmu_clean_strtab(smmu, dst, sizeof(*dst));
 	arm_smmu_sync_ste_for_sid(smmu, sid);
 
 	/* It's likely that we'll want to use the new STE soon */
@@ -805,7 +818,11 @@ static int arm_smmu_init_l2_strtab(struct arm_smmu_device *smmu, u32 sid)
 	}
 
 	arm_smmu_init_bypass_stes(desc->l2ptr, 1 << STRTAB_SPLIT);
+	/* Clean the L2 table before writing the L1 pointer. */
+	arm_smmu_clean_strtab(smmu, desc->l2ptr, size);
 	arm_smmu_write_strtab_l1_desc(strtab, desc);
+	arm_smmu_clean_strtab(smmu, strtab,
+			      STRTAB_L1_DESC_DWORDS * sizeof(__le64));
 	return 0;
 }
 
@@ -1700,6 +1717,9 @@ static int arm_smmu_init_l1_strtab(struct arm_smmu_device *smmu)
 		strtab += STRTAB_L1_DESC_DWORDS << 3;
 	}
 
+	arm_smmu_clean_strtab(smmu, cfg->strtab,
+		cfg->num_l1_ents * STRTAB_L1_DESC_DWORDS * sizeof(__le64));
+
 	return 0;
 }
 
@@ -1766,6 +1786,7 @@ static int arm_smmu_init_strtab_linear(struct arm_smmu_device *smmu)
 	cfg->strtab_base_cfg = reg;
 
 	arm_smmu_init_bypass_stes(strtab, cfg->num_l1_ents);
+	arm_smmu_clean_strtab(smmu, strtab, size);
 	return 0;
 }
 
-- 
2.53.0


