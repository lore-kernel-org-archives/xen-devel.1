Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5A1C61DB9
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 14:32:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400678.1636269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzb9b-0005bN-C5; Thu, 27 Aug 2026 14:32:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400678.1636269; Thu, 27 Aug 2026 14:32:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzb9b-0005bD-8J; Thu, 27 Aug 2026 14:32:31 +0000
Received: by outflank-mailman (input) for mailman id 1400678;
 Thu, 27 Aug 2026 14:32:29 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wzb9Z-0005BE-EK
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 14:32:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzb9Y-00Bhds-R8
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 16:32:28 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a904a70-2eae-0a2a0a5409dd-0a2a4503e56a-28
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 16:32:28 +0200
Received: from [52.101.66.115]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a904a7c-fae8-0a2a45030019-3465427316e5-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 16:32:28 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AS8PR03MB6742.eurprd03.prod.outlook.com (2603:10a6:20b:295::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 14:32:27 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 14:32:27 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZriI0Jig/PJCbuQ7/Aw2aGN6P3KMI9A7cU/efEWT9qzTSRwglW12g664tjbohGji1yGHXG5s8oVOryHVbNUEWAATMRR9R8cAg2R7uMsb9C/hmWaD9Vnh79doZr0LvA+m6ONZkC/Cg79eeAWwK+B/x3XwsNmvEW/f6W8J30/6mpRJV7btKLjZg4mNbJzMPwdw0XzlG84zu0KkYxGOuvUEiT4uU01+nsdlv0wFCygeABhGrR9qyzTz1M1eaZGXoLP0X0cHp6p0HqLVsNWWMovA82rA5HPkVYXjqQGXMGz1us/wR9bIvvj1j9XFebcIklHjUS/VhNNxlt3Fxu7nopdYfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hMlbOayQe38CqlIr8+dJvSe7ICFcj440kGZXZ+TcuZI=;
 b=ITFvtmO5L9CpI1pHdSX/XQLJEUIDreDEcQhPEscZ81Lo2INTJ73Sv/gIA2W2CYtRxHfXYWtL/A9rkhKLQHPrz5LeP8tF/WTP95Els+d9m/29OiPxkjalU4dOrCuV0nffkCTPTG8QB8aCiRdjEr/1KGekXVrJCXYht+hDPBs0Y44ivmogGg7xz20ISafLCf/ZDIyjCGVhm4kizJwBlBV8K9I8hOD6Px/HWkZVBA5s5PnihyhPDFZUWbiYiVij2V9mtWjk7zu/EJUcram7gQCuj/92MKzzfII6YjV41852sSgEdbWai2pvmGKlkUrHmHcwnp1YUhNOQ56uvZ9l+7u7Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMlbOayQe38CqlIr8+dJvSe7ICFcj440kGZXZ+TcuZI=;
 b=HlXtXKxZwXD5S1o89zfVGXutD26Pn3qSfCEV7dGF4x2RvT2x8LD5hs8yiRGnGef6t0TyxG01ELfMABupWugEYsEkps/sOPgWie7EfKPxtxlMs3lOBIsRJ5PnTnCW69zYbqLVns+keo8PQnEZTwanakL0ihcDQL2+Lld/ae1kyD+pzC3ekG59IQ1lz3xpsXBB7w0KsDSKDYabdC0DAJeeimCNAvpSBS6SHWwsYQexQJCEngdHyRXwautlij9pGzv35QVPDiTKcwtVnwYZzB8N+zeKhL5lYSDhC6sqt91yw1aE4eRoXw67Cemf3UrMd1HrT7GbmFEB91t41gpd2xhRuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v12 05/13] xen/arm: gic-v3: add ITS suspend/resume support
Date: Thu, 27 Aug 2026 17:31:53 +0300
Message-ID: <1d14b9ad58e88f19450999a6c2ce476ed31531e3.1787838455.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787838455.git.mykola_kvach@epam.com>
References: <cover.1787838455.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA0P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::15) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|AS8PR03MB6742:EE_
X-MS-Office365-Filtering-Correlation-Id: a59995c7-07b1-489a-c0eb-08df04480464
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|10067099003|6133799003|3023799007|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	+nGucR34CHaK7xpAQsVcvz5xp3GkKP+7U9izTB+U49VYZ9bozTjT4sIhh+9SvmkOpRz7leP+NEtEaH+Sg8sMoRP8uq5gAM3s3YDFE1Om/6J6O9W/ca2lPoTPn9xLV9ND2hyRPZ4Zm3IBshC/hWQgd5k/O9PL+NaF24ZfxcwMP+6w0n9hPal6wAc/T83Rr4iaEJh5qLRDj+cXIoEreojmL//BZfKCqwr9LfhmM79flc8abylb/adG4eOmLGJFYtMf2R3Oxnj27MbVCV1kKABCsZ7ax6LeYudzlnPEE3Q7u5ZLD/4tAlSDFU1ngEmyKcfBJksbkjW7CKNwfBtZaV4zoPSKXb/GXZrkrsMMKciUMj5+euTenN1wNkD8EBV7rZ+FGad6ODPUIIMYQOXuZ1dfTIDyu4cwLKgZDPV+82TASZc/hTrae4cFh5IxppLo/OB4PVOg284TE1OeY30/jYMk9TMaR/139mXCy7GXtm9uqGExmbN5XKNkFpcrNGOTYoCHtodLB5DngicY+QJqTQGuAzUoQsTlPl/ENHDnluIamzPhDE8ertcCK5d1jABmY2rekSfegYn2ClATg+4gBOlaEfFs9ZnIsgHaG3fABf29YMk31hw7FjxVJpx5ywFeyFJ0xfZipmuQ9SjBn6v0+Qj5mNzjg5udpaq2WLiCysIEsBo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZOqfYy7ldZVEh4BIVP2rojKCXSd1SEpZ8GVt+65CM2yG0+bM84GYdllC7t6K?=
 =?us-ascii?Q?WrTmWE+IQ+mD2KSpDVJSD6pp2Uk2iINgB3o1LoRKEg4R7IzSylbmdbCnEkRL?=
 =?us-ascii?Q?C+tV4+x+io33I4sHoJf4X82W2rIou5kDi4Hkp3J2Jvfq9dWjvT7icNjSf+yC?=
 =?us-ascii?Q?mY6gWLyvU6KIjdliw4cUNIGuX9fHC9CwsxwWMhRZaAFOS9VU5pwGUD+8HBns?=
 =?us-ascii?Q?A1CnXTELzc/GM6LJvz7m9xX01hmolfybywuBhsy0J31FwzIc1SUmZod+oIj6?=
 =?us-ascii?Q?JRoLjzipMZeqO8nCW/Xk+NClwIr3yAkbmVslGEKESOI49p7M8+gMo0Y1gT4D?=
 =?us-ascii?Q?0P/0bHUHirv5sX38TN4GTaPfVmMwpv62S5J95H8oY3YH+wnvOdzqeZIjFOVS?=
 =?us-ascii?Q?/RXKocyDvnFG9OB9nZTKKD4io6V76cmAAgC1B2NvDCv+ITqnsEhCJpFzkCkZ?=
 =?us-ascii?Q?eO+sEjIzGwYm9bnGQgiqSRK5EeHbwMYgtNUQFC3RIbFf4Q3r7+1e45tOzyqF?=
 =?us-ascii?Q?CuBsLU9SDHmjPSEzftQB7RISACxUctJ8JldYr/hfi+P8jM/pJINnAbiQDpOh?=
 =?us-ascii?Q?9a+9kd8BGT1JZfVtsToq5fTP5d8O4jW1x68RnV7Ti5FEfuTi2GDJpt2iULhl?=
 =?us-ascii?Q?rekM3WyZSrKrjf2qcE0JWfqALeqQ/hOC2SkARP7IRfKMJMfDdBW6ZGWYF9B3?=
 =?us-ascii?Q?QCCBEsFzOx7E6X2LRnzqKLwfq2xpoGt6DVsxJJi0ZGpZu7NINEPDp9+hYHAe?=
 =?us-ascii?Q?ZGNln9cVa+13kd/ktjTh5HcYodoeV/2zCox8nz/rQSr9wzBIiVECTdKzOmWR?=
 =?us-ascii?Q?y54YWbv5kH/4n7dO979/xyBD5dR067GfzPsVGwBCTJHGwdwn8xPg2pjh7m3d?=
 =?us-ascii?Q?PPBp21nEkT8nXCq2KF5Pa76tXwGm4FinjSbYBGyvF+OH78V9673gW1x5qD0X?=
 =?us-ascii?Q?WGV+lQ+ooYaOehhZZCwERuIExH18M2nJavZ+JR/Z5QfmgKmK29fSXt1zp3qp?=
 =?us-ascii?Q?hKt6Db9VoU48EljiliyOKw3LIZ7hmN/5MwnUrYaklolh+JTH0NBJEMMveFks?=
 =?us-ascii?Q?uLH09/+1KpRU2ivU1St9gqwZ3kutq2UR8AsiSVIaAyj8VhsKLK9TpMRYoTux?=
 =?us-ascii?Q?Q8DzwTDosAcrnQZKWK6bw8DVCLy9uMZDsbOCqgF8j2oQ8TL0TM1NwTRYNdE3?=
 =?us-ascii?Q?4+qU+zfOMhFMTDiQ4oMGS89NVRYXYXNOxtjxkPSN+MOSaO508GmoOY6+hq7p?=
 =?us-ascii?Q?16XJ4LYLGzcbKLgm4q48gzkkThWXaE683EteTZpbo/anxMDVKuFcjZbnLWbj?=
 =?us-ascii?Q?uCpvjoYVyNZ1cGav8DSIaY0wins2KJhy5AbD6n2rkVMZ/vai6wU6vQznJCtZ?=
 =?us-ascii?Q?kF4UtDBbtjplgmRdDpPc9S4d/IoSMRKKO4HBokgu3R8hKIwPIhK2aCO8ibSX?=
 =?us-ascii?Q?HSkaA5+urElK/IIZKTDsIhH09VkGBhbi/t/jwkuWqzRS94F6gVXTmKXHwhz+?=
 =?us-ascii?Q?XPvhjn0rWfu1UUZBEOeLlmh0Fwvk/FgPf+TROVzZpvAhp+keDeKGjFIA72wv?=
 =?us-ascii?Q?tng5i5BR+x+KfOFg0q6fPG1NrlYsuq5zELa0I4HZ25Cz9BElpHRrRZQFXTlw?=
 =?us-ascii?Q?GJ2uw3Q6G5tLtzsdB7kU5zHBYMu81cyBegEoy9qDzvuJxPrORBjxGrfl2LZs?=
 =?us-ascii?Q?yIUbCrvVDv6aYQDgKw7j1q85yejO1qtObIGtwA6T0LJJHv96dW9gWrqDBjN2?=
 =?us-ascii?Q?lTz/o8IyAA=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a59995c7-07b1-489a-c0eb-08df04480464
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 14:32:26.9171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0+fEh5B1OdB0lk0kHecO0vT6SyqvYu46pYQKrv7ucKF8aXyWxZNaaZqS1Eeo3jUCue84MmO8vXxAovaG5HwBdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6742
X-purgate-ID: tlsNG-33051d/1787841148-764FC4E9-F1492407/0/0
X-purgate-type: clean
X-purgate-size: 11113

Handle system suspend/resume for GICv3 with an ITS present so LPIs keep
working after firmware powers the GIC down.

Save and restore the ITS CTLR, CBASER and BASER registers. On resume,
re-establish the collection mapping only when the collection is held in
the ITS itself. Memory-backed collections are restored through the
restored GITS_BASER tables and must not be remapped unconditionally.

Add list_for_each_entry_continue_reverse() in list.h for the ITS suspend
error path that needs to roll back partially saved state.

Based on Linux commit dba0bc7b76dc:
"irqchip/gic-v3-its: Add ability to save/restore ITS state".
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in V10:
- Replay MAPC on resume only for collections held in the ITS itself, as
  indicated by GITS_TYPER.HCC. Memory-backed collections are restored
  through GITS_BASER and are no longer remapped unconditionally.
- Make the current Xen col_id == cpu assumption explicit in the ITS
  resume path.
- Use "unpredictable" instead of "undefined" in the CBASER/BASER restore
  comment.

Changes in V9:
- fix the ITS suspend/resume coding-style nits;
- preserve the saved GITS_CTLR state while masking the read-only
  QUIESCENT bit.

Changes in V8:
- Reword the CBASER/CWRITER comment to match Xen and drop the stale Linux
  cmd_write reference.
- Clarify the list_for_each_entry_continue_reverse() comment.
- Factor out per-ITS helpers for collection setup and resume.
- Restore each ITS and re-establish its collection mapping in the same
  loop, so a failed ITS resume is not followed by MAPC/SYNC on that
  un-restored instance.
- panic in case when resume of an ITS failed
- cleanup baser cache during suspend
---
 xen/arch/arm/gic-v3-its.c             | 146 ++++++++++++++++++++++++--
 xen/arch/arm/gic-v3.c                 |  11 +-
 xen/arch/arm/include/asm/gic_v3_its.h |  28 +++++
 xen/include/xen/list.h                |  14 +++
 4 files changed, 189 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index 7560d46c6d..dd53209865 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -335,6 +335,22 @@ static int its_send_cmd_inv(struct host_its *its,
     return its_send_command(its, cmd);
 }
 
+static int gicv3_its_setup_collection_single(struct host_its *its,
+                                             unsigned int cpu)
+{
+    int ret;
+
+    ret = its_send_cmd_mapc(its, cpu, cpu);
+    if ( ret )
+        return ret;
+
+    ret = its_send_cmd_sync(its, cpu);
+    if ( ret )
+        return ret;
+
+    return gicv3_its_wait_commands(its);
+}
+
 /* Set up the (1:1) collection mapping for the given host CPU. */
 int gicv3_its_setup_collection(unsigned int cpu)
 {
@@ -343,15 +359,7 @@ int gicv3_its_setup_collection(unsigned int cpu)
 
     list_for_each_entry(its, &host_its_list, entry)
     {
-        ret = its_send_cmd_mapc(its, cpu, cpu);
-        if ( ret )
-            return ret;
-
-        ret = its_send_cmd_sync(its, cpu);
-        if ( ret )
-            return ret;
-
-        ret = gicv3_its_wait_commands(its);
+        ret = gicv3_its_setup_collection_single(its, cpu);
         if ( ret )
             return ret;
     }
@@ -1211,6 +1219,126 @@ int gicv3_its_init(void)
     return 0;
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+int gicv3_its_suspend(void)
+{
+    struct host_its *its;
+    int ret;
+
+    list_for_each_entry( its, &host_its_list, entry )
+    {
+        unsigned int i;
+        void __iomem *base = its->its_base;
+
+        /*
+         * By the time Xen reaches gic_suspend(), every domain is already in
+         * SHUTDOWN_suspend, so ITS-targeting interrupt sources are expected
+         * to have been quiesced by the owning OS before SYSTEM_SUSPEND.
+         */
+        /* Preserve saved GITS_CTLR state, excluding read-only QUIESCENT. */
+        its->suspend_ctx.ctlr = readl_relaxed(base + GITS_CTLR) &
+                                ~GITS_CTLR_QUIESCENT;
+        ret = gicv3_disable_its(its);
+        if ( ret )
+        {
+            writel_relaxed(its->suspend_ctx.ctlr, base + GITS_CTLR);
+            goto err;
+        }
+
+        its->suspend_ctx.cbaser = readq_relaxed(base + GITS_CBASER);
+
+        for ( i = 0; i < GITS_BASER_NR_REGS; i++ )
+        {
+            uint64_t baser = readq_relaxed(base + GITS_BASER0 + i * 8);
+
+            its->suspend_ctx.baser[i] = 0;
+
+            if ( !(baser & GITS_VALID_BIT) )
+                continue;
+
+            its->suspend_ctx.baser[i] = baser;
+        }
+    }
+
+    return 0;
+
+ err:
+    list_for_each_entry_continue_reverse( its, &host_its_list, entry )
+        writel_relaxed(its->suspend_ctx.ctlr, its->its_base + GITS_CTLR);
+
+    return ret;
+}
+
+static int gicv3_its_resume_single(struct host_its *its, unsigned int cpu)
+{
+    void __iomem *base = its->its_base;
+    unsigned int i;
+    int ret;
+    uint64_t typer;
+    unsigned int col_id = cpu; /* Xen currently uses col_id == cpu. */
+
+    /*
+     * Make sure that the ITS is disabled. If it fails to quiesce,
+     * don't restore it since writing to CBASER or BASER<n>
+     * registers is unpredictable according to the GIC v3 ITS
+     * Specification.
+     */
+    WARN_ON(readl_relaxed(base + GITS_CTLR) & GITS_CTLR_ENABLE);
+    ret = gicv3_disable_its(its);
+    if ( ret )
+        return ret;
+
+    writeq_relaxed(its->suspend_ctx.cbaser, base + GITS_CBASER);
+
+    /*
+     * Writing CBASER resets CREADR to 0, so reset CWRITER to
+     * keep the command queue pointers aligned.
+     */
+    writeq_relaxed(0, base + GITS_CWRITER);
+
+    /* Restore GITS_BASER from the value cache. */
+    for ( i = 0; i < GITS_BASER_NR_REGS; i++ )
+    {
+        uint64_t baser = its->suspend_ctx.baser[i];
+
+        if ( !(baser & GITS_VALID_BIT) )
+            continue;
+
+        writeq_relaxed(baser, base + GITS_BASER0 + i * 8);
+    }
+
+    writel_relaxed(its->suspend_ctx.ctlr, base + GITS_CTLR);
+
+    typer = readq_relaxed(base + GITS_TYPER);
+
+    /*
+     * Only collections with IDs below HCC are held in the ITS itself
+     * and lose their state across an ITS reset/power loss. Memory-backed
+     * collections are restored by restoring GITS_BASER and must not be
+     * remapped here.
+     */
+    if ( col_id < GITS_TYPER_HCC(typer) )
+        return gicv3_its_setup_collection_single(its, cpu);
+
+    return 0;
+}
+
+void gicv3_its_resume(void)
+{
+    struct host_its *its;
+    unsigned int cpu = smp_processor_id();
+    int ret;
+
+    list_for_each_entry( its, &host_its_list, entry )
+    {
+        ret = gicv3_its_resume_single(its, cpu);
+        if ( ret )
+            panic("GICv3: ITS@%"PRIpaddr": failed to restore during resume: %d\n",
+                   its->addr, ret);
+    }
+}
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 038bf41142..6b025c023d 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -2186,10 +2186,14 @@ static int gicv3_suspend(void)
     if ( ret )
         goto out_enable_iface;
 
-    ret = gicv3_disable_redist();
+    ret = gicv3_its_suspend();
     if ( ret )
         goto out_enable_iface;
 
+    ret = gicv3_disable_redist();
+    if ( ret )
+        goto out_its_resume;
+
     /* Save GICR configuration */
     gicv3_redist_wait_for_rwp();
 
@@ -2229,6 +2233,9 @@ static int gicv3_suspend(void)
 
     return 0;
 
+ out_its_resume:
+    gicv3_its_resume();
+
  out_enable_iface:
     if ( gicv3_enable_redist() )
         panic("GICv3: Failed to re-enable redistributor after suspend abort\n");
@@ -2355,6 +2362,8 @@ static void gicv3_resume(void)
 
     gicv3_redist_wait_for_rwp();
 
+    gicv3_its_resume();
+
     WRITE_SYSREG(gicv3_ctx.cpu.sre_el2, ICC_SRE_EL2);
     isb();
 
diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/asm/gic_v3_its.h
index fc5a84892c..0f8cb16e41 100644
--- a/xen/arch/arm/include/asm/gic_v3_its.h
+++ b/xen/arch/arm/include/asm/gic_v3_its.h
@@ -43,6 +43,11 @@
 #define GITS_CTLR_QUIESCENT             BIT(31, UL)
 #define GITS_CTLR_ENABLE                BIT(0, UL)
 
+#define GITS_TYPER_HCC_SHIFT            24
+#define GITS_TYPER_HCC_MASK             0xffUL
+#define GITS_TYPER_HCC(r)               (((r) >> GITS_TYPER_HCC_SHIFT) & \
+                                                 GITS_TYPER_HCC_MASK)
+
 #define GITS_TYPER_PTA                  BIT(19, UL)
 #define GITS_TYPER_DEVIDS_SHIFT         13
 #define GITS_TYPER_DEVIDS_MASK          (0x1fUL << GITS_TYPER_DEVIDS_SHIFT)
@@ -129,6 +134,13 @@ struct host_its {
     spinlock_t cmd_lock;
     void *cmd_buf;
     unsigned int flags;
+#ifdef CONFIG_SYSTEM_SUSPEND
+    struct suspend_ctx {
+        uint32_t ctlr;
+        uint64_t cbaser;
+        uint64_t baser[GITS_BASER_NR_REGS];
+    } suspend_ctx;
+#endif
 };
 
 /* Map a collection for this host CPU to each host ITS. */
@@ -204,6 +216,11 @@ uint64_t gicv3_its_get_cacheability(void);
 uint64_t gicv3_its_get_shareability(void);
 unsigned int gicv3_its_get_memflags(void);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+int gicv3_its_suspend(void);
+void gicv3_its_resume(void);
+#endif
+
 #else
 
 #ifdef CONFIG_ACPI
@@ -271,6 +288,17 @@ static inline int gicv3_its_make_hwdom_dt_nodes(const struct domain *d,
     return 0;
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+static inline int gicv3_its_suspend(void)
+{
+    return 0;
+}
+
+static inline void gicv3_its_resume(void)
+{
+}
+#endif
+
 #endif /* CONFIG_HAS_ITS */
 
 #endif
diff --git a/xen/include/xen/list.h b/xen/include/xen/list.h
index 98d8482dab..2aab274157 100644
--- a/xen/include/xen/list.h
+++ b/xen/include/xen/list.h
@@ -535,6 +535,20 @@ static inline void list_splice_init(struct list_head *list,
          &(pos)->member != (head);                                        \
          (pos) = list_entry((pos)->member.next, typeof(*(pos)), member))
 
+/**
+ * list_for_each_entry_continue_reverse - iterate backwards from the given point
+ * @pos:    the type * to use as a loop cursor.
+ * @head:   the head for your list.
+ * @member: the name of the list_head within the struct.
+ *
+ * Iterate over list of given type backwards, starting from the element previous
+ * to the current one in list order.
+ */
+#define list_for_each_entry_continue_reverse(pos, head, member)           \
+    for ((pos) = list_entry((pos)->member.prev, typeof(*(pos)), member);  \
+         &(pos)->member != (head);                                        \
+         (pos) = list_entry((pos)->member.prev, typeof(*(pos)), member))
+
 /**
  * list_for_each_entry_from - iterate over list of given type from the
  *                            current point
-- 
2.43.0


