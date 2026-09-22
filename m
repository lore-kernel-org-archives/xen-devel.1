Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A7C9C982FE
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 14:09:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428925.1651845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x91BD-0006aA-PS; Tue, 22 Sep 2026 14:09:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428925.1651845; Tue, 22 Sep 2026 14:09:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x91BD-0006a3-Mf; Tue, 22 Sep 2026 14:09:07 +0000
Received: by outflank-mailman (input) for mailman id 1428925;
 Tue, 22 Sep 2026 14:09:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1x91BC-0006Zs-Ui
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 14:09:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x91BB-00GDSZ-8O
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 16:09:05 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab28bfd-8faa-0a2a0a5109dd-0a2a4505b952-18
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 16:09:05 +0200
Received: from [52.101.66.116]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab28c00-4cb1-0a2a45050019-34654274a410-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 16:09:05 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by BESPR03MB911401.eurprd03.prod.outlook.com (2603:10a6:b10:105::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 14:09:02 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 14:09:02 +0000
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
 b=t031A90k+vH8hNurADh6bEyuf/JmZhng3PB0+kEq0tdsYxQFOq3MKgZgKijhqbejT7gIGcghXLHX3mPp1pc6Rt9IAATPfFRaA+Ku7Dt7UaR45CWpY+phUc6F5y4XggWgSjykFwoOfLZhUvW3dcK+V0LIfpZD8/9TLN3O1rmtS6WoJU6R88g/aVRhaCX27eVb9iayL4Uhu1bt7/Db8ce43dxeHbPuvBuhCVHM1ysm0nH6YNI+yNXfTMPM/RuT3FwFXjeo5CS4gZib4lxO4T8dugyF7t2wPHMJIpdBcTFPfXmV0ENyRpBQUaQvuyKilKfzbTkkoHz2+uGA3k1qiUNMcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6L1/7un1Y1Bx4nCZhJxjl/opiga05Fw0y4Br9uixXM=;
 b=B0YTlF5V7x/3s3YPjhIDuLHRpJ81xnKLUhg9PDYQiO4qZkVVz+LUVwQWw4X3umvqlerkV7xO5nr2yJMw652ncGSrCBwVRHvHHRsmjDjth4x/c6IiZc2vTHwnKADz4jKnCYyGYq8FdN6ezytC/iehqbKB6MklRHZt9MZrYqgsyPMD3ChV1O/4pG0xGHalfHQKiMebQy20atatb6zMZpC3ek4BX97sptPlVIXwoeygh81R74DWx2pVHLeqNoLfgibd9XUixT+XQPJJ1kogItXd4LrAGs+pekt7/ny9tBVYGh/6m7gxZzFKHAtwX3B/QkzB9ph65atcnD2i3NZpwMvkHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6L1/7un1Y1Bx4nCZhJxjl/opiga05Fw0y4Br9uixXM=;
 b=oAmNx2rHDqui6JvIAS6psmiOEHhNmhCdufcXY+ct2H8r91OeQ83bIGQRR/2u0pVeUVmsrojz0Uu8cjynD0jYGBauU+GWJy3cJu7djtR9rjHws+3yEDFXQnjYUSLn4pMP8OX+pe0tuNCHyhlEsDMz83z2XqvG8Th8huIPXCDfPRnmOliv5kj1TRymK+t2KIGAw5aIqQBGVmmtPm/YqNSL7uLW3xgi/viINpxqGvsCUq6D9C8CnuSILrsl0MyslNs6y9uSgPseaiINI+M7MkD8I1zt9UjlCzbsm6mnrT6i2Aacr5UtLlReBK2w8g81mabvvT9GT5OMCGo27k10JtDMjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Date: Tue, 22 Sep 2026 17:08:58 +0300
From: Mykola Kvach <mykola_kvach@epam.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Luca Fancellu <luca.fancellu@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 4/4] xen/arm: its: handle dma-noncoherent on GIC and
 ITS nodes
Message-ID: <arKLSFu8CiiKJAOB@EPUAKYIW02F7>
Mail-Followup-To: "Orzel, Michal" <michal.orzel@amd.com>, 
	Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Luca Fancellu <luca.fancellu@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1779922874.git.mykola_kvach@epam.com>
 <43b0e8f6b25588ba1cfc22d367e5ed6b303a4978.1779922874.git.mykola_kvach@epam.com>
 <af30caf6-b740-4c03-a429-d8e2f39ef4b3@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <af30caf6-b740-4c03-a429-d8e2f39ef4b3@amd.com>
X-ClientProxiedBy: WA1PEPF00005B8A.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::63b) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|BESPR03MB911401:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e2122b3-5c3b-4af6-4704-08df18b30de1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10067099003|56012099006|18002099003|22082099003|5023799004|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	Tii/RZ2g8ODGiMHk1ZAa2JW3Rb5b5VvOTDaSs1jBgSN7vu7GwBBhZMWXVC5BqX5U9SyObJ3fiYLkybDPwd3R3uKjIvKkB9HwFb981lURMUAYgYOHMgFf6eAcELOvKtT/Fx95cEqOe3MUqfeDqSOc7VLsx5sBfPOt3PzZfoxiVZai0RuhMLT6J3zKncsEmi7zzfYgp0mmFmAr9oOVCrFh3tMAYndUlQq2f5MODCVV/hDEsk6VHBYiRVDtcc8KUFC9ZmJQzvoIRKJo/36N4vxbyXPP0HliWm7sCbckDg56VVPut7pJmayHZVIBrerFz1ZVfvgr645ZcVSQMlGuysGOSp3Yg+riI//zNXCgXpSD9CKY3eZ7qGEDeKbuysH5mnx/TNbxVXDO4uCQLarJVgedIYD3R89tliikDXuaKt+0dlo7PR6chYAFDFIbqZnVlu++i+6Zo4NM1i/trBFQFtRVb5zSrmAVFTTWEJK08f3K8bTjs7pfdXDJa63NrMK28GAghGzWpZDTIarJ4VUysiLR4bTt7KqmTHs4HcxqltNF6hEkezgt1bvZOTQT+keGzZ/IKJdqLuTLJ3s/BSK502F2eT1hDJvbYQxdUb0irfpv8v8dujbRrdjVvFElF6X/zmvD8Gf4zaboMKi0GyOI/7QWhGgPLwvH6rQyn/S4kpymYbM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(56012099006)(18002099003)(22082099003)(5023799004)(4143699003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHJWWXBqZFMvYi9FNVN4QmZhM3ZnQW1KUnBjV2hwdTM0b0llNXdrZ0RXOVZ1?=
 =?utf-8?B?NkUrYkdXWXNvWFFnSitKKzNkU0tKTllTcDNLczhQQWZKaEtweDk1SS9ENDZN?=
 =?utf-8?B?ZDhkNEpDTmU5ZldjejZvN2FRdjVtR1RzTW5waG9NaGoxWkVhRTljUWJlbE9y?=
 =?utf-8?B?d2V1NlB1b3htRzdtSkxxRjNGWnMyNDJScGhQU25WeVNjanZocXVUWDhiTkVY?=
 =?utf-8?B?WHVEU3NXOU1ucUpNOS8zWm9IUVMwZE02NXhXNlI4VEVPNmprSlRMbW1sZXVT?=
 =?utf-8?B?aW9SZUlFOTEySTF6Qzg3eE5LYkRxU0FRT2loRTRUT2FrenUwWE9nMEJ6cVhS?=
 =?utf-8?B?YURTZUJKSmpRWWc1cW8xMWpmbjZGdHVnSmt2Sk1VN0sveHR6aU9jaG50Si9U?=
 =?utf-8?B?bnZEQXlqVmoyQ0QxUUU4YnZVUnpaQ3FrZlliUEE1TFBQVW5Pa3d2Z1F6Nmxp?=
 =?utf-8?B?TWl4NEI3dUkxdVZ5TjNWU1hPRis1Mk40YXhqNGVxeENtYStQOGpuUXliVUZY?=
 =?utf-8?B?SjZDeldvbDVqekRjRE16K3NVbGxZbWhSbzBONXR4dHJRVTk2ZVlWRHpwMzl5?=
 =?utf-8?B?Sk9lR2tUajY0RTBXSXIxOE5GVUc3a2lRUStmRUlXUUtFbVFORzdHbk9YWUVy?=
 =?utf-8?B?ZHZHM2V6NGQ4ZEMwZklnZEpDV29oSlpFdGhLSktIdUtJTW0zcm9PdWdubTRU?=
 =?utf-8?B?a21kaklDOEFaWk5ieDJuUzVpWVFDRUZRUDR2YTRuU2JLWlRNQit5aUFMaGtD?=
 =?utf-8?B?cS9lQm1pcW5aeDBMcmNCdHFuZS9FYnJJQlA4SlNleURoY2FTNmZoaEV3MGFG?=
 =?utf-8?B?bTlsQTlxdlMyRGZieWZFbnZUOUNHS1BRV2twSDVQRk5HOG51RU9hK1dvaVJ2?=
 =?utf-8?B?bkNza250eDBlalJ2TGFiUEhIRVo2QmVzdEUzTDJwYjFnaFUxSEQxY2ZQNE9h?=
 =?utf-8?B?ODBkV2Q0aEs4OE90VFZMR244ZElTYUZxWjlJNWowMVJsU0RPV1pXOTlWN3Nw?=
 =?utf-8?B?Q3JoZlJncURzZURpUDF0dksvUFpkMGNnWFh6aWxiZXhpczFmbU5pYXI4ck9T?=
 =?utf-8?B?U3JjbU9IRjNnUGxrOVlVQ2F1bDN5dTI3MEw1eS9SMEROZ3FHb0d6dUZRWUdB?=
 =?utf-8?B?ZExoL2NiKzN2S2twTkdiRjRRZzM1cG0rZ2s2SUF2ZnNxVDZid3BHRFhSSmlr?=
 =?utf-8?B?OEVTOTJhaG8yWi9QUFVBUWlFQ0ZGMzY3UW5EdUdCMHRqNUdhVEVXSmk3Q3lP?=
 =?utf-8?B?RmRXOFk0dkVwbkdrUnpGSEdlZWFzS2VmN2hnWkRsZ2U3dVcxS3ZTR1NLYmx1?=
 =?utf-8?B?U1B4ZWo1d2s0Zjh0MFZhb2l5ZUhtSE5pOU1sRHV0akdKeU1Kc0JYR1NDYzV5?=
 =?utf-8?B?Tlc2TEgxaE9HYWdiNzhzZ3Z6UmNmalNRa3U0am1OYVFwbnBPaEVnM09EQkNY?=
 =?utf-8?B?V1ZzbjBERm93UlRmaXU5WnBVdmcxdTY4MVNpdFZZVmY4d2l4OUJnSzd2NlZT?=
 =?utf-8?B?S3VOcWtXS3duOXp0d0hZR0pCVGdoVkF3Mk9PR3BISmtLb2xBN2VuUDFuK0I2?=
 =?utf-8?B?RGx1MzdMUUt0Q0wxenF2dTBFZ3l0OEdmbWV6NXJOckx0aVFhUDdtNlBYSW5J?=
 =?utf-8?B?R3FNN3dhSTU5ZUcwZDJLOGZYdEEyUldrODlsZW52b28xOVZWczJvNFI0WFpR?=
 =?utf-8?B?YThRazZjT2MrbkdPZWpMQVZ6T3JtNmJBdzB3RTdKSGZ4N1dpTDNtdUpnL0Zu?=
 =?utf-8?B?aEhPQ2d3OGpPTnh1MndOTHgzOFUwaURPL0tCZjlROUtQb3ZqTU1ZZXZ3R2wv?=
 =?utf-8?B?UG1KWkpTTmtLcE5ua0NiMFhhREpjYVZQMXFmUHYwaHZ1RHowdkU0UWNyTERM?=
 =?utf-8?B?WEVDMC9IZS9BT1FTaTY4MkQzdXYvbEtrR08wRkF0VDVUSUlER2U5NHhkUEQw?=
 =?utf-8?B?YlBvN2xCOEJETzRwa2NMREhWYW9rQzZ4TFpHN1dXbkJ4RVVmY0NXeHFmU2Rz?=
 =?utf-8?B?Q1ppYTRtRVJUQXpoZkVLN3h2bTlib2NrKytQU1NnbGZUdHJMa2RseFI0d04r?=
 =?utf-8?B?ZEJ1ZWNxVUdaR2lLSUFrdmROSTVlTmFpU1dMVldwaHlqeSttUUgzTmJENjh1?=
 =?utf-8?B?aW9rclQ2TDd5YjhpSXJFeHFOME5zMWo3QWZ4dEdpcGorOHBoTEpBa04yQWxy?=
 =?utf-8?B?dlVlN1VVbGt5dmVLdkFyVmZVamwrOTJsWDZ4NnY2MVgwL1NkeHJJTkFvSXZF?=
 =?utf-8?B?c0tiV09Tc0pJOEd6UjVGTUFNWXQ4QzVSZFRsY0MwaUNwZFpTUGgraDBMQ2kv?=
 =?utf-8?B?Z2JnTFdFdmh2WlNiUkZZcWRFblRCWVdxaGhZSWJKOHpNZ1hrUWVVZz09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e2122b3-5c3b-4af6-4704-08df18b30de1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 14:09:02.3537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5nEdXQTa5ohR/4xgnu9MFrPsoqI38y20pwGZ8BGd9m+WRo4rZIPHZtiGjrfyY2L2Hi6sXvkUi4cSfkIGB1dHog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR03MB911401
X-purgate-ID: tlsNG-c201ff/1790086145-72AB72A1-E5801670/0/0
X-purgate-type: clean
X-purgate-size: 6170

On Fri, Jul 31, 2026 at 10:39:54AM +0200, Orzel, Michal wrote:
> 
> 
> On 28-May-26 02:25, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> > 
> > The DT dma-noncoherent property describes the bus coherency of the device
> > represented by the node. On an ITS subnode, that is memory accessed by that
> > ITS, so add GICV3_QUIRK_MEM_NC_NS to the corresponding host_its before
> > programming GITS tables and allocating ITTs.
> > 
> > When the property is present on the top-level GIC node, it describes the
> > Redistributor side of the LPI path. Collect it in
> > gicv3_lpi_init_host_lpis() and apply it only to the host LPI policy used
> > for GICR_PROPBASER and GICR_PENDBASER setup.
> > 
> > Do not inherit the property between parent and child nodes: ITS-node
> > non-coherency does not change the global host LPI policy, and GIC-node
> > non-coherency does not change per-ITS quirk_flags.
> > 
> > ACPI is left unchanged; this patch only consumes the DT dma-noncoherent
> > property.
> > 
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in v2:
> > - Split v1's dma-noncoherent handling into explicit ITS-node and GIC-node
> >   scopes.
> > - Apply an ITS subnode property only to the matching host_its quirk_flags.
> > - Collect the top-level GIC property from gic-v3-lpi.c before host LPI
> >   allocations use host_lpi_flags.
> > ---
> >  xen/arch/arm/gic-v3-its.c | 21 +++++++++++++++++++--
> >  xen/arch/arm/gic-v3-lpi.c | 22 +++++++++++++++++++++-
> >  2 files changed, 40 insertions(+), 3 deletions(-)
> > 
> > diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> > index e055914763..606b127487 100644
> > --- a/xen/arch/arm/gic-v3-its.c
> > +++ b/xen/arch/arm/gic-v3-its.c
> > @@ -134,6 +134,21 @@ static const struct its_quirk *__init gicv3_its_find_quirk(
> >      return NULL;
> >  }
> >  
> > +static void __init gicv3_its_collect_fw_attrs(struct host_its *hw_its)
> > +{
> > +    /*
> > +     * An ITS subnode property describes memory transactions made by that ITS.
> > +     * Do not inherit it into the global host LPI/Redistributor policy.
> > +     */
> > +    if ( !hw_its->dt_node ||
> > +         !dt_property_read_bool(hw_its->dt_node, "dma-noncoherent") )
> > +        return;
> > +
> > +    hw_its->quirk_flags |= GICV3_QUIRK_MEM_NC_NS;
> > +    printk("GICv3: ITS @%#"PRIpaddr" marked dma-noncoherent\n",
> > +           hw_its->addr);
> > +}
> > +
> >  static void __init gicv3_its_collect_quirks(struct host_its *hw_its)
> >  {
> >      const struct its_quirk *quirk = gicv3_its_find_quirk(hw_its);
> > @@ -144,6 +159,8 @@ static void __init gicv3_its_collect_quirks(struct host_its *hw_its)
> >          gicv3_lpi_update_host_flags(quirk->lpi_flags);
> >          printk("GICv3: enabling workaround for ITS: %s\n", quirk->desc);
> >      }
> > +
> > +    gicv3_its_collect_fw_attrs(hw_its);
> >  }
> >  
> >  uint64_t gicv3_mem_get_cacheability(uint32_t flags)
> > @@ -578,7 +595,7 @@ static int gicv3_disable_its(struct host_its *hw_its)
> >      return -ETIMEDOUT;
> >  }
> >  
> > -static int gicv3_its_init_single_its(struct host_its *hw_its)
> > +static int __init gicv3_its_init_single_its(struct host_its *hw_its)
> These __init additions have nothing to do with dma-noncoherent and
> are not mentioned in the commit message. They belong with patch 2/4,
> which is where the callees became __init.

I'll move the ITS __init annotations out of this patch and into the
replacement first patch, so they precede the init-only quirk collectors

> 
> >  {
> >      uint64_t reg;
> >      int i, ret;
> > @@ -1221,7 +1238,7 @@ static void gicv3_its_acpi_init(void)
> >  
> >  #endif
> >  
> > -int gicv3_its_init(void)
> > +int __init gicv3_its_init(void)
> >  {
> >      struct host_its *hw_its;
> >      int ret;
> > diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
> > index 35f93e4756..c6f17b9b2d 100644
> > --- a/xen/arch/arm/gic-v3-lpi.c
> > +++ b/xen/arch/arm/gic-v3-lpi.c
> > @@ -7,7 +7,9 @@
> >   * Copyright (C) 2016,2017 - ARM Ltd
> >   */
> >  
> > +#include <xen/acpi.h>
> >  #include <xen/cpu.h>
> > +#include <xen/device_tree.h>
> >  #include <xen/lib.h>
> >  #include <xen/mm.h>
> >  #include <xen/param.h>
> > @@ -101,6 +103,20 @@ void __init gicv3_lpi_update_host_flags(uint32_t flags)
> >      host_lpi_flags |= flags;
> >  }
> >  
> > +static void __init gicv3_lpi_collect_fw_attrs(void)
> > +{
> > +    /*
> > +     * A top-level GIC node property describes the Redistributor side of the
> > +     * LPI path. Do not inherit it into per-ITS policy.
> > +     */
> > +    if ( !acpi_disabled ||
> > +         !dt_property_read_bool(dt_interrupt_controller, "dma-noncoherent") )
> > +        return;
> > +
> > +    gicv3_lpi_update_host_flags(GICV3_QUIRK_MEM_NC_NS);
> > +    printk("GICv3: GIC node marked dma-noncoherent for host LPI tables\n");
> > +}
> > +
> >  static union host_lpi *gic_get_host_lpi(uint32_t plpi)
> >  {
> >      union host_lpi *block;
> > @@ -442,7 +458,7 @@ integer_param("max_lpi_bits", max_lpi_bits);
> >   * to the page with the actual "union host_lpi" entries. Our LPI limit
> >   * avoids excessive memory usage.
> >   */
> > -int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits)
> > +int __init gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits)
> >  {
> >      unsigned int nr_lpi_ptrs;
> >      int rc;
> > @@ -450,6 +466,10 @@ int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits)
> >      /* We rely on the data structure being atomically accessible. */
> >      BUILD_BUG_ON(sizeof(union host_lpi) > sizeof(unsigned long));
> >  
> > +    gicv3_lpi_collect_fw_attrs();
> > +    if ( host_lpi_flags )
> > +        printk("GICv3: host LPI workaround flags: %#x\n", host_lpi_flags);
> Every contributor to host_lpi_flags already prints its own line -
> "enabling workaround for ITS: %s" from the quirk path. Please drop this one.

I'll drop the aggregate host-LPI-flags message and keep the per-source
diagnostics.

Best regards,
Mykola

