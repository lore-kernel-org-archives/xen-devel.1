Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98E3C44501
	for <xen-devel@archiver.kernel.org>; Fri, 10 Jul 2026 08:32:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1358897.1612741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi6eC-0002ou-HX; Fri, 10 Jul 2026 08:31:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358897.1612741; Fri, 10 Jul 2026 08:31:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi6eC-0002on-EL; Fri, 10 Jul 2026 08:31:48 +0000
Received: by outflank-mailman (input) for mailman id 1358897;
 Fri, 10 Jul 2026 08:31:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wi6eB-0002oh-GP
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 08:31:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wi6e9-0068DB-T6
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 10:31:45 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a50ade4-5cb7-0a2a0a5109dd-0a2a4509a4b0-32
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 10:31:45 +0200
Received: from [40.107.162.74]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a50adf1-b440-0a2a45090019-286ba24acae3-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 10:31:45 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by PA4PR03MB7518.eurprd03.prod.outlook.com (2603:10a6:102:107::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 08:31:44 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%4]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 08:31:44 +0000
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
 b=wMpE6MFBzo97MT+aUuYgsLUghr+M9Y9yXp1/n4D2TwCzu9GW2/yCldNFNkfqGBFTVENj3HpV0Kr0Mrfo0qjmLQ5mBmIkrmEI0RXubPOIcjTYJ1qJJL68z6ZQaa2QouosijE2/fgfhWt75TlqIm+VDybbAmOKxOGDeNziPbJ6diXZW5LEhglRLanulmCiWt+b5K0fmGmS80DHReEh1s3FJ7VJGYaqW7jd5x0gWLPZmD/VE6VyQp80usEgX+z2hO6Ns2dO7h5Q4E0+/oSK3uzy+FkFRcdkhSwVtbUspwq3j3TtC6ffJDWVYycS7W+t6sM2EYvAozXUmTNjdHn/MD2bxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=njYmxRByqxvj8zB9Sro/i12/XrQGCj0Q7a3fR9R1pDw=;
 b=yU3onzZHOkv54d2AjdwYQ1UND/T3s+mbEchevDySJ8fFqoISrCqim0GNgvN7uXT3nJLls8+2NWtMMY2YE95rJw3hLQeeeySZTckR5zU3Uoqm83CDa8qg02xPLqw6VqX0qIkn9lW5oxWr0LNRYuYcBSVPcUxz0Yx2zUmgz8/di/HhIpDICQj0Vyb0TpiRH2t6zWKQU2qPMYtODZcxGUcO5KetFPCdVhxV2T3a3BqAO/KvEEBaHFuGcpeFfbWsoD0QjLYcq2ODf+DiU8/jXA7Ijbt471NJ4LLNEQO3NkrppL5z75KinLGYu5zrJr68XIIau8uJwZ4YdgRlTgbnhzMCdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=njYmxRByqxvj8zB9Sro/i12/XrQGCj0Q7a3fR9R1pDw=;
 b=DQsGkmQ010H0/37ku709iYKfW2xYyPFhY234Lp4ZJyz0YBIBopMPfFxTsc/452Zos4rXMNjFYfbR+o8QBa/I6cGo7qyaYqHE9+l25mZV2KOZHu7VpBvEbCTVZAfUomYJRb9GU06HFGc02vdEK6KXNroaNDgVRLfaHafqqIKxVGEu8w95Abyb5xp2fcOz50CM2SeVQM5pkGWZ8oKqcul/wMWNxbTC4fXr9d//AusyfemouJYCv77XZ5b9pQuW8vtHoWeFABRMH63zBMdg8uSxGgW+jDyy7gXHcbNtUDgVhD4RDCjlrrZ3TUapWDdHYm+0GoKV3LfGP5a+ipCyGvfZ9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH for-4.22 0/2] xen/arm: Fix eSPI IRQ indexing issues
Date: Fri, 10 Jul 2026 11:31:30 +0300
Message-ID: <cover.1783671887.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1PEPF00005B93.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::631) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|PA4PR03MB7518:EE_
X-MS-Office365-Filtering-Correlation-Id: b763f364-de12-4310-1102-08dede5dac40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|56012099006|11063799006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	afTGIJn7SvP3aeYXaLL67nghKv0YPVfXVa8LTjsy+jigIU6FrE0N6UXt/OvtQCYg23sWUI0Wza7rAIM0mEDkmwCyyVEllhXdpCY+p66rSsUQBCLgJa2YOi8iGGQ0r+pn4bx8RdAjN40FJKdmZJwibDJYYHwElW3Z7lVOsRGawslbjQQl+oo90/HLwl1Dw2gaXUaH8nicmk3vawSV/I34SmZkkGcOuhrXiXk2W60qJZdMWSeHe1bvaFflk8Ov+abVxgWhkatEdYIprjmcBbaHd1g2zVR4XhaV4l92q9TnD5vKahdxOsrGPQF8UsNm2U/ilg37G9uVPxWlRvoCysh4DuEJyMLoIqj5SwVW44bKkLQt6EEJ9X8L/tQT3WaZwId8Q+xBhxHMewhYE12XoV8IVTuB9knU7L4hZAecCRVXYdq+mr0ItqNPSOFOgZV1H5inRL9mp0oaTYtY7V3yfavrrjJvZOUcJW5BiG6MbefaQWNoGD+2J1C6qhOwBl4CaPXE8mdIfa1CFgvmn4PPTh+kVMN8rtL8nLSQukGs9jdKhejsWjycFsMMdo/8potiU8iMlEMcuJQw5VnLsCbiAnFAJBD6hGnaoSJII6OvHHnyq5z9UebhZp7CL2TI7VqlBEB5LZUheynPP9Qx4NDYYe3dvKsb96T2Iavbg2vVNRlmZ5E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(56012099006)(11063799006)(6133799003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M2JNzgj3wogufgfb1YxEJpG6YauH7fFkNsCw7aZPUjLVzWyRWFrTJ/IT5d53?=
 =?us-ascii?Q?mUizPihMw5YSYFBC6yifXB3BY6m6sBt8C5+OMku71ALW3iIXQ9nvPY3QBY3F?=
 =?us-ascii?Q?SyiG8veBMUrj+/eMgDDZ/liowJMJDlCZEifes6cgrsqySnxPcfUd+stMLA5e?=
 =?us-ascii?Q?u25Ys08D8WyCdxoLc3D5VY50n7dbMsLQ2gsRW0iUert+Z3NffMNaiOGTQ72b?=
 =?us-ascii?Q?lr2n6/9z0gRXj8gLAkB75/UDJMFwMq3G7loIFF5uSn88OGunK8v+1lq1D3zW?=
 =?us-ascii?Q?JBNJX+rSCtdCkVFNbS6eanQoj6sxxV/vhneMe7+/T8kD/a52ta/VJD6Znr/k?=
 =?us-ascii?Q?kQOcMiyg+8yOHy260oWXXfxekpiYoFIxwMD5BoWWHnVdc0dvDDuxml2IlHB0?=
 =?us-ascii?Q?SQbo/IB8KYvFZrpxHSgTSf5Z5lhbPJ+EEJWOFNwLVpr3bsi/QzgHa4+d95bh?=
 =?us-ascii?Q?FlNmfpzV16zrs0dlWj1Fhh/iJIYAaE9/pZavYpDLLsGNjafFC33hWlQsidsr?=
 =?us-ascii?Q?a/tdjUYowzIISaQk4oBZH6yAomPUdsMhoqrFYfVCai7d44oEKnGW09EMqxQg?=
 =?us-ascii?Q?2Pf8aTAM/oUYVWh/ZNnJ/mG9e21aY6q02pKa1P53lz6J96HcXBuQKyg1kqWz?=
 =?us-ascii?Q?spkWEiCrauATp2525SU39rDgfs6km9RuSph8rbj7ks0FxhCKf3B3mVqCW05L?=
 =?us-ascii?Q?ko37LZ/dTnZgV04HNty++SCiNyv6c2TZqLCRaJ5o59hvavvtv8H5oPEv2IZD?=
 =?us-ascii?Q?ANuvl4JEvmeDTCmKV8mb427yCAYPTBJhktG7wi0ReuZSMqNAd+IAd/r43eIE?=
 =?us-ascii?Q?ktJTXnZSPgzb0eTg81gW8GmnzbSPque9Oaeam0mz3M1UKfa/odoVRnlN+/Ri?=
 =?us-ascii?Q?/ZbgmAq+4B00/cCkaSrk4gagxMNyukqRX44fc/3N8Fuc9Ghan4/GkLYbh0iY?=
 =?us-ascii?Q?aIK+7ufV87wV3EhghbMuUcbPOasREVUb4+pXtaX8M0THlaU0PrHYwjZr07ir?=
 =?us-ascii?Q?50XoyR49A92UZwbRWGBhlVod7jcnQnAde2zsr/Xgj/MhNAnod0O7GWZ7vypJ?=
 =?us-ascii?Q?0WKmg+m3k/enUGXS+/2Xg5Ti3VHiiLZB7sv0hY4KF2vIAItXFRmehj3b4Sui?=
 =?us-ascii?Q?vQCN9f82KNvJlVq+E9fJStcag+SYSKF8Nql7vZ3zcrCvXuFpPfP/MD0brPl8?=
 =?us-ascii?Q?JgdRJC7jWSA7091q423Dd5RUyBraZh/YgJoz5o6RvPDQZC5RaYR2B+VAdZSB?=
 =?us-ascii?Q?P+qJQp+COY45hPnV1JU7d94ZczHipe39lsMYp6dn/NEKgJApZjSLxdC4sfy+?=
 =?us-ascii?Q?nEYlvneNqp2HhCdMaqNFpdBB+45ixLJ4+8Nul5PWGas7nayklIBj+P8uHGrF?=
 =?us-ascii?Q?gBuwxCMcKJttds7WXseWmCdC5wKzE6fzEykGJYvpB7NYC2uoqKiyMe3xjIyK?=
 =?us-ascii?Q?dSG5VwLN23czaorRL5J6FutyesQCQBKEiLmxp5l4kqh+cLdxG60NZ2hfHn5L?=
 =?us-ascii?Q?pyaGuWdFKkesBrZ4YeC6STPyQ53Bm+GVL9N2JR2gJ9o5/TOBlt+COv+v7jqT?=
 =?us-ascii?Q?3M+BgLKE+p3eRLIrs8VgiXYOAYYrw1NHiqMimS3SRXAqxSwrDYHZFFEbmaM2?=
 =?us-ascii?Q?TDR07P0Ev+Q+rq9yObeHTTxXd3JJICi1o5lBHAdvqdtTHnutY9qb6CushEMf?=
 =?us-ascii?Q?Vw/26krx4QNvXts/Y1yd5Zd411faPShwqs1vCTzcha+LSHdm5pezEA9l8HqX?=
 =?us-ascii?Q?PXZBqrAbDA=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b763f364-de12-4310-1102-08dede5dac40
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 08:31:43.8930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3i5a79GKPoMzZJOqZTZQudEJY5myrkyBWweWqn1IsIQLM5CKtJT+fNdrtrRmBRHvWglvnDcZXd+QS74BpodhVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7518
X-purgate-ID: tlsNG-bad1c0/1783672305-5C344A0B-E5C3A448/0/0
X-purgate-type: clean
X-purgate-size: 1300

This small series fixes two eSPI-related indexing issues in the Arm
interrupt and classic vGIC paths.

With GICv3 eSPI support enabled, Xen exposes a sparse architectural
INTID namespace: regular SPIs occupy the traditional range, while eSPIs
start at INTID 4096. Some paths were still treating that namespace as if
it mapped directly to dense internal arrays or bitmaps.

Patch 1 prevents sparse INTIDs in the gap between regular SPIs and eSPIs
from reaching irq_to_desc() and being used as dense irq_desc[] indices.

Patch 2 fixes classic vGIC eSPI allocation bookkeeping: reserve used the
compressed allocation bitmap index for eSPIs, while free still used the
raw virtual INTID.

Both patches are intentionally small and keep the existing eSPI mapping
model.

Tested with:
- CONFIG_GICV3_ESPI=y build
- CONFIG_GICV3_ESPI=n build
- FVP boot with 64 eSPIs
- pre-fix reproduction using a fake DT interrupt for INTID 3000
- post-fix smoke boot to Linux dom0

Mykola Kvach (2):
  xen/arm: validate IRQs before descriptor lookup
  xen/arm: vgic: free eSPIs using the bitmap index

 xen/arch/arm/gic.c  |  2 --
 xen/arch/arm/irq.c  |  9 +++++++--
 xen/arch/arm/vgic.c | 27 ++++++++++++++++-----------
 3 files changed, 23 insertions(+), 15 deletions(-)

-- 
2.43.0


