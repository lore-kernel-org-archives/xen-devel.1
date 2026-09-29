Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D10CA5FA1
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 12:11:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436420.1655086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBWfL-0008DJ-Sa; Tue, 29 Sep 2026 12:10:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436420.1655086; Tue, 29 Sep 2026 12:10:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBWfL-0008D8-Ml; Tue, 29 Sep 2026 12:10:35 +0000
Received: by outflank-mailman (input) for mailman id 1436420;
 Tue, 29 Sep 2026 12:10:35 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xBWfK-0008D2-KW
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 12:10:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBWfJ-002BnL-OY
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 14:10:33 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6abbaab7-8faa-0a2a0a5109dd-0a2a4503cd80-10
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 14:10:33 +0200
Received: from [40.107.159.133]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6abbaab8-fae8-0a2a45030019-286b9f85e659-3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 14:10:33 +0200
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by PA1PR03MB11182.eurprd03.prod.outlook.com
 (2603:10a6:102:556::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 12:10:25 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 12:10:25 +0000
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
 b=gi8/IOHwDhseeznsI3eizJy64+gdtpFDXVJsobL9uf1MsoLlLpabZPhoH7Y/qrPeIMNxGSBxkfVYf8SljPD1mOe4n9FBKV41XnwLlz/8kuVpZHiQvM5pVnYF16qUmoU/VQ23PTEkhugajEvMuJddslF9X8zZ8BzwkQg0JPMLSd0Lrff0308Z6J+wRZlpKl3IFVY7toBc1FnkhP00+SB8A4nuQ5aYhcokZI+lbC88ZzRKMf/T5NdY3lJ0ZJgrOhxuyVmEZohyAwClCJ+MvoBCz3gt8hQDjDuHf0/Hn8xmjT1fKaAKb+Aiq3D1k6mftJ9iFFdaex9GEMtjZu3OdFMZ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=swzHZNCDbNJ3dhjllKUYlpELmGKZwRwuWUNfXeP6G1M=;
 b=vVf7w1vWK24pJntSwolB09UpmNSEukSY3SuB4d5h49SmyEFPCJiQ8SIO2qNcos326jiF3BHVT/Ja8nNJNO6YN1sUxPPdez/ZcEPFxUX3YZiI7WdhOVf2t2G1vEZ4drI29y5/5IfqSI8QmwkIMoV8sbVGZyZIPnGTO2ksyz/hQtbzmrJXAa7ldmkPczTFQt45HEmjentEFyS61EdAFxcx4trfBzIG9Asczqry8lCTic4lnpi8ZJro9A6D9O7i55SKsv2CXSbkFcQvxpn+dCvzDvyMxi4FKpM61X6gM375JfD+B32w+op7iYcR9VWtY0LDNmeN5BCAfJFHFrgz5ecogA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swzHZNCDbNJ3dhjllKUYlpELmGKZwRwuWUNfXeP6G1M=;
 b=V7JfUvA91q+MVwIdVeJFweSlqFgH/MeLmKevmvGYNWmEsqwI533si++m8u4xYIX0c6O0pLpOIxPasje9NvyZmoXY1+OC3uFCnciSKJC9GwgryLl+MfxRvK+tG6+r/tT0lgOlXeZ541urwRjToLt9sHdvhAQIbnXLMtq2tPf5oZTCrjh+npWcUGItKt+kUkAB7oyBsfOE78P/kgd4X6vLGYy7AHLlmkN8d5S5T0zgm1gXUAaEjm9ZZpdyGzxNy9rD+slOnZS1PpvDKbIt8eOvbkxeJ7dRQa+S/g+MJcbJ/Vp9Aw6aUU55pursvXJ0+u6HkT+b3bgB+1F1Q8FoSXFqmA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v6] xen/arm: derive GIC CPU interface ID fields from the vGIC
Date: Tue, 29 Sep 2026 15:10:16 +0300
Message-ID: <56a85d63e850a2f7af087304f9d89cf1feee2aaa.1790679927.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1PEPF00005B9E.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::629) To DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0302MB9208:EE_|PA1PR03MB11182:EE_
X-MS-Office365-Filtering-Correlation-Id: d46c7929-11fa-4556-cf9e-08df1e22a4ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|10067099003|11063799006|56012099006|5023799004|260925022911599003|260925021311599003|260925021911599003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	V3Ac+0P7QrHglohjeLZmVc+oKaHhJygiFv3OhVgLehofj7tDzj+az+nzhu2H0SJbekTxUJH7M5s7wiBblCZDdYb3AiVas3quYT2iR6/Dh/DrOS83yEQ/ER+XRfxBrAVXPEfyQiC59MbmW6HukF06yINltIIDmiX+ORsRJ8crNPWolgQ64qxFk//bKf/xkAxSQLkVI20oaiVlqIsGuIpAhSyNe9/MXDk57BYf8x3zVHlatJhxLnIrV0JOIWoOKUb8DBLi8YD5WexXxPs/ZOmxfmAByBRxPVHD+uynQzRKFadkhmSxrJYgIMNuj8e5XXipDvE8reteiS0fiRL8zm7tFU2+NQsBjqBONZovnYZTn2ghzL9eunddpV9iFMJAAKq0oG8myGfTxRvdGV9FbIpkkh8pQaP6lR24Cf5BF/tJP1nHDT9oYhdVympDmVE+ZQA0noqAtDIQP5y48ZmioZRIsYPEy2PeeHnom+5ulNODT0My5gNSue6gnJXBtKcJTEl2xoU+jSkIfMATj0nZtritUVUXze85/hq42dB1WaUBoH/SxD5gCY1/qYj0LvCmJJFA05ZXAGBg0r2LkzE9jxGv1zU0yuPIouCfatEJrovl+XqmqWH63qeU0ybV0qULLdDI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(11063799006)(56012099006)(5023799004)(260925022911599003)(260925021311599003)(260925021911599003)(6133799003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ctay+txmMJnd5QnfThvV8oWmV5BNAzeH60fB82ljtNsNmatoLkekEeNwnBqf?=
 =?us-ascii?Q?6iXk8yYAdtoS4qSuuUjNZBZGE9crQ4W+KJgetkS7afTsfvWZM0NL/uqF96a7?=
 =?us-ascii?Q?Vd2Q3a9aU6BYkeXbgchCG0jyiHDkrklOWLjUHjI89ws35U7+8ivQISkyB7Kw?=
 =?us-ascii?Q?7hXVZDsyhIyJxO5/9ricWiWBq4i0KEgV1wVxW1Li1E0KzRxXGdo3ah6g4JN8?=
 =?us-ascii?Q?ASEUquenmYmRCBTSxo7tm+QkBNxGbJ93XP+BAbnlzc1fVtIhxwcuSxC9rh+n?=
 =?us-ascii?Q?OKAkdTA7BAnXSogoKrxqYprTJAUJVQRL9K6I5ea99UnbvZ09kzU+biRn3VO0?=
 =?us-ascii?Q?FqGCLxlOGdONu8KAxTc18fDIv0GZ6n2Jzmh4MX0eVOfnfh8Aqs5Z9AwIBEfJ?=
 =?us-ascii?Q?4Fq/lwnX0Nrl7YxdluOQZQ2DXqxxxAI8rdXWoHH7YOMmFm8lIpLqcqcRubwR?=
 =?us-ascii?Q?x2RU027z0D4OlM3lD4AihvHSw28fFe/s+Q6OX+NON8ZVsHj2AHZlfGnFtGG6?=
 =?us-ascii?Q?7kj15yfCfTtDGAOgnXw+EeCt8eujosKe+l8zvsxnzMsPIWJhklBd8qKlA+Ys?=
 =?us-ascii?Q?Ti8EDIZN0UdAdrBmLtnA1SXv3KZBvAywpoW8+Cdk4QwByEkdqVCyPJ3OHwqL?=
 =?us-ascii?Q?/7euYwhk2rFRB6EaGsaFfHLDRVpxf37Gz+BVbQvOzwdEcBpnVYip7mzGNi6U?=
 =?us-ascii?Q?CCExZooy+g2mznOIkykD0gwdz1WCi+0MFCqhj9Qm2wyR6jCMQs924PvPUA1x?=
 =?us-ascii?Q?oZsgzYLFvU/o5SG362rTG8aZcvgzs8hExtOBoO2H5KTnErKkc4BlUzX1wnb/?=
 =?us-ascii?Q?FpQNAE6h0dvtGyfzsMYoMDUzuJt3wJuj4Dh0kuseVvG/ANWo5G7IcBLx7D9c?=
 =?us-ascii?Q?LTZGE+nx/gyQ3+Xj9x9AbyVmX62NgTnJozRuzdjzryklvF+nybXWpKWTcnbv?=
 =?us-ascii?Q?btvjklPVa6jFjPhFL/bNlw0/9UXK/2UfJn0TGyjGhdHQMD55N3Fly1ZPqMit?=
 =?us-ascii?Q?xAiOZK1n6jPNM4WLPpYS8heFonBuyFaTJ/s1djc7OUt0cAZHlaMuoHacM/7c?=
 =?us-ascii?Q?aVpD1r7Rfv1PaMBHB1WQ6PviQ2ODcMKJoJtxfIL8Ca7fEH5FF6TyaZnb2l8J?=
 =?us-ascii?Q?8XHRurKJOq9JjFrscIWq/lyC9J5muqPsnb0Il0hEx6U6E5wUdYAbp4X3qc/d?=
 =?us-ascii?Q?xXfKdxYgrfhyRlJssXXocvxR4xLEvy0HAo2Owk9w1IXWbNY0tScVlwJtAuGa?=
 =?us-ascii?Q?cnW2y9BsCN8+vb/qCA+Fd1xCzHhMfw8cKFtt8pvsQSmAaR9KVGWKfArsbbdp?=
 =?us-ascii?Q?ZvI6V3HVz4BVBCtiDjbMSKE9wkZz+JUmbWu1rDQqI3p4/0BLelh2mg18KAEG?=
 =?us-ascii?Q?7IWHojehiaC3oiIBkc6mFLVfRnjBNoSzMTvF8m0yxM8BASB4k4W1gLPtS06Y?=
 =?us-ascii?Q?oC0SFWqaqRJoPPzOuFHqwl8qSX2u9ZmkLsWG0L+tFfKtvf152SeLPeKMbiox?=
 =?us-ascii?Q?KIQfpFO1Yk2Rkpo/ATLHWasdGnct5y/jIN5F2+oRoUF6kMVM+vW6+3G6m9Iu?=
 =?us-ascii?Q?RqssUeAqGveMEOyCKCtLyomndrePiGksMOJrvC6avFdjtUxlnGajpd2ky/Xc?=
 =?us-ascii?Q?jMnHi1GLq3BRJ0DVW+H738L5gBSpvu72WdknW+B6DGvHSSGu/hemM2zK4D1K?=
 =?us-ascii?Q?ZnagvDg/HKiaRmiquDoYOFvKDDhGBjMoAMDiHZrhlaFbWTq44i0Dgd0oh1i4?=
 =?us-ascii?Q?FBLdftFaUg=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d46c7929-11fa-4556-cf9e-08df1e22a4ed
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 12:10:25.6208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IH/N6Xhb3XcgDDhDms41V9BUlWWtoO1FXwZEzhUNqWQuuR7IC4Oojike5CJ/PT8xnolPsXbJtydhQaok/W5rJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR03MB11182
X-purgate-ID: tlsNG-33051d/1790683833-6D6D64E9-D1E80C5F/0/0
X-purgate-type: clean
X-purgate-size: 8275

Xen exposes ID_AA64PFR0_EL1.GIC and ID_PFR1.GIC from domain_cpuinfo,
which is initialized from the sanitized host CPU feature state. This
does not necessarily match the virtual interrupt controller configured
for a domain.

A vGICv2 domain can therefore observe a nonzero GIC field when the host
supports the GIC system register interface, even though Xen disables that
interface for the domain. On a GICv4.1-capable host, a vGICv3 domain can
observe encoding 0b0011, although Xen exposes only its vGICv3 model.

Derive the fields from the domain's vGIC version instead. Expose 0b0000
for vGICv2 and 0b0001 for vGICv3. This covers ID_AA64PFR0_EL1 and the
ID_PFR1_EL1 alias in AArch64 state, as well as ID_PFR1 accessed through
CP15 in AArch32 state. Leave the alias unchanged when AArch32 is
unavailable.

Fixes: 07b9acea116e ("xen/arm: Add handler for ID registers on arm64")
Fixes: 8f81064a07c6 ("xen/arm: Add handler for cp15 ID registers")
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v6:
- Define shared GIC field encodings in asm/sysregs.h and use them in
  vreg_id_reg_set_gic_field().
- Keep the encodings unsigned and include asm/sysregs.h explicitly.

Changes in v5:
- Fold the vGIC version mapping into the shared ID register helper.
- Use the vreg_ and VREG_ prefixes for the helper and field width.
- Cosmetic changes after review

Changes in v4:
- Explain why ID_PFR1_EL1 is left unchanged without AArch32 EL0 support.
- Move all ID_PFR1_*_SHIFT definitions to the common asm/sysregs.h and
  remove the unused cpregs.h includes from the ARM64 files.
- Return explicit unsigned GIC field values to avoid MISRA C Rule 10.3.

Changes in v3:
- Add direct dependencies for the shared ID register helpers.
- Move ID_PFR1_GIC_SHIFT to the common CP15 register header.
- Apply cosmetic fixes from review.

Changes in v2:
- Share the GIC ID field helpers between the AArch64 and AArch32 paths.
- Parenthesize the individual ASSERT conditions.
- Preserve ID_PFR1_EL1.GIC when AArch32 is unavailable.
- Target master instead of the 4.22 release.

v1: https://patchew.org/Xen/ba4f779d68c54efc80c4a566dca38ac2e6f9a073.1783675708.git.mykola._5Fkvach@epam.com/
---
 xen/arch/arm/arm64/vsysreg.c             | 21 ++++++++++++++++++++-
 xen/arch/arm/include/asm/arm64/sysregs.h |  9 ---------
 xen/arch/arm/include/asm/sysregs.h       | 13 +++++++++++++
 xen/arch/arm/include/asm/vreg.h          | 22 ++++++++++++++++++++++
 xen/arch/arm/vcpreg.c                    | 12 +++++++++++-
 5 files changed, 66 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
index 66f4f23bb3..d8f380ccb7 100644
--- a/xen/arch/arm/arm64/vsysreg.c
+++ b/xen/arch/arm/arm64/vsysreg.c
@@ -299,7 +299,22 @@ void do_sysreg(struct cpu_user_regs *regs,
      * to identify the processor features
      */
     GENERATE_TID3_INFO(ID_PFR0_EL1, pfr32, 0)
-    GENERATE_TID3_INFO(ID_PFR1_EL1, pfr32, 1)
+    case HSR_SYSREG_ID_PFR1_EL1:
+    {
+        register_t guest_reg_value = domain_cpuinfo.pfr32.bits[1];
+
+        /*
+         * Preserve the sanitized ID_PFR1_EL1 value when AArch32 EL0
+         * is not supported, as for the other AArch32 ID registers.
+         */
+        if ( cpu_feature64_has_el0_32(&domain_cpuinfo) )
+            guest_reg_value = vreg_id_reg_set_gic_field(guest_reg_value,
+                                                        ID_PFR1_GIC_SHIFT,
+                                                        v->domain);
+
+        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
+                                  guest_reg_value);
+    }
     GENERATE_TID3_INFO(ID_PFR2_EL1, pfr32, 2)
 
     case HSR_SYSREG_ID_DFR0_EL1:
@@ -362,6 +377,10 @@ void do_sysreg(struct cpu_user_regs *regs,
             guest_reg_value |= (sysval << ID_AA64PFR0_SVE_SHIFT) & mask;
         }
 
+        guest_reg_value = vreg_id_reg_set_gic_field(guest_reg_value,
+                                                    ID_AA64PFR0_GIC_SHIFT,
+                                                    v->domain);
+
         return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
                                   guest_reg_value);
     }
diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
index f3c11d871e..f6ece8f972 100644
--- a/xen/arch/arm/include/asm/arm64/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/sysregs.h
@@ -438,15 +438,6 @@
 #define MVFR1_FPDNAN_SHIFT           4
 #define MVFR1_FPFTZ_SHIFT            0
 
-#define ID_PFR1_GIC_SHIFT            28
-#define ID_PFR1_VIRT_FRAC_SHIFT      24
-#define ID_PFR1_SEC_FRAC_SHIFT       20
-#define ID_PFR1_GENTIMER_SHIFT       16
-#define ID_PFR1_VIRTUALIZATION_SHIFT 12
-#define ID_PFR1_MPROGMOD_SHIFT       8
-#define ID_PFR1_SECURITY_SHIFT       4
-#define ID_PFR1_PROGMOD_SHIFT        0
-
 #define MVFR2_FPMISC_SHIFT           4
 #define MVFR2_SIMDMISC_SHIFT         0
 
diff --git a/xen/arch/arm/include/asm/sysregs.h b/xen/arch/arm/include/asm/sysregs.h
index f6af987ef5..9cd36671a4 100644
--- a/xen/arch/arm/include/asm/sysregs.h
+++ b/xen/arch/arm/include/asm/sysregs.h
@@ -9,6 +9,19 @@
 # error "unknown ARM variant"
 #endif
 
+#define ID_PFR1_GIC_SHIFT            28
+#define ID_PFR1_VIRT_FRAC_SHIFT      24
+#define ID_PFR1_SEC_FRAC_SHIFT       20
+#define ID_PFR1_GENTIMER_SHIFT       16
+#define ID_PFR1_VIRTUALIZATION_SHIFT 12
+#define ID_PFR1_MPROGMOD_SHIFT       8
+#define ID_PFR1_SECURITY_SHIFT       4
+#define ID_PFR1_PROGMOD_SHIFT        0
+
+/* GIC field encodings, common to ID_PFR1{,_EL1} and ID_AA64PFR0_EL1 */
+#define ID_PFR_GIC_NI                0x0U
+#define ID_PFR_GIC_V3                0x1U
+
 #ifndef __ASSEMBLER__
 
 #include <asm/alternative.h>
diff --git a/xen/arch/arm/include/asm/vreg.h b/xen/arch/arm/include/asm/vreg.h
index 387ce76e7e..f363067912 100644
--- a/xen/arch/arm/include/asm/vreg.h
+++ b/xen/arch/arm/include/asm/vreg.h
@@ -4,11 +4,33 @@
 #ifndef __ASM_ARM_VREG__
 #define __ASM_ARM_VREG__
 
+#include <xen/bitops.h>
+#include <xen/bug.h>
+#include <xen/sched.h>
+
+#include <asm/gic.h>
+#include <asm/sysregs.h>
+
 typedef bool (*vreg_reg64_fn_t)(struct cpu_user_regs *regs, uint64_t *r,
                                    bool read);
 typedef bool (*vreg_reg_fn_t)(struct cpu_user_regs *regs, register_t *r,
                                    bool read);
 
+#define VREG_ID_REG_GIC_WIDTH 4
+
+static inline register_t vreg_id_reg_set_gic_field(register_t val,
+                                                   unsigned int shift,
+                                                   const struct domain *d)
+{
+    register_t mask = GENMASK(shift + VREG_ID_REG_GIC_WIDTH - 1, shift);
+    enum gic_version vgic_ver = d->arch.vgic.version;
+    register_t id_pfr_gic = vgic_ver == GIC_V3 ? ID_PFR_GIC_V3 : ID_PFR_GIC_NI;
+
+    ASSERT((vgic_ver == GIC_V2) || (vgic_ver == GIC_V3));
+
+    return (val & ~mask) | (id_pfr_gic << shift);
+}
+
 static inline bool vreg_emulate_cp32(struct cpu_user_regs *regs, union hsr hsr,
                                      vreg_reg_fn_t fn)
 {
diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
index 3c315be9fd..15ccde71da 100644
--- a/xen/arch/arm/vcpreg.c
+++ b/xen/arch/arm/vcpreg.c
@@ -316,7 +316,17 @@ void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
      * to identify the processor features
      */
     GENERATE_TID3_INFO(ID_PFR0, pfr32, 0)
-    GENERATE_TID3_INFO(ID_PFR1, pfr32, 1)
+    case HSR_CPREG32(ID_PFR1):
+    {
+        register_t guest_reg_value = domain_cpuinfo.pfr32.bits[1];
+
+        guest_reg_value = vreg_id_reg_set_gic_field(guest_reg_value,
+                                                    ID_PFR1_GIC_SHIFT,
+                                                    v->domain);
+
+        return handle_ro_read_val(regs, regidx, cp32.read, hsr, 1,
+                                  guest_reg_value);
+    }
     GENERATE_TID3_INFO(ID_PFR2, pfr32, 2)
 
     case HSR_CPREG32(ID_DFR0):
-- 
2.53.0


