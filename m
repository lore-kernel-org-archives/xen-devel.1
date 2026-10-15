Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780A3CC6B33
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 09:40:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450133.1665643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHHwY-0001p0-VJ; Thu, 15 Oct 2026 09:40:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450133.1665643; Thu, 15 Oct 2026 09:40:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHHwY-0001ot-Q2; Thu, 15 Oct 2026 09:40:10 +0000
Received: by outflank-mailman (input) for mailman id 1450133;
 Thu, 15 Oct 2026 09:40:08 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xHHwW-0001nh-Fe
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 09:40:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHHwV-007OTd-RF
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 11:40:07 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ad09f76-e002-0a2a0a5209dd-0a2a45098e10-2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 11:40:07 +0200
Received: from [52.101.66.81]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ad09f77-be1a-0a2a45090019-3465425145ae-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 11:40:07 +0200
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by GV2PR03MB10950.eurprd03.prod.outlook.com (2603:10a6:150:278::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 09:40:02 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0496.021; Thu, 15 Oct 2026
 09:40:02 +0000
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
 b=F8cfpAgkHHP/T3X+kz7gspjvDn+c5xnkaKLRVfYrA0Mh06vWJEwTM9P3SNv6jIqdvzIZqundNr0vgegZLH2tKbPwoizNdG6CAA7ZFGtoTH9xVdFKsqXV2+s94o9JqzpDj6f/Q3at6UO4MSvjMRdpNTRk+TfQnuWGj5LiCbckdGH1Lf9xW6/txcfZLfDjrLLSHiyK6ybF0lSva02zk/NKO0dGaTyZWtjFz9VN+OPlpsPmWTSn5KLvgp08lT17+ogEcdOwkr2xlzoUdKueIo2zMrp5TGgxbY7ODwYJj6Se4wu+dfIGoSsrVL5h8w7ngZtO3usSvtUeQIgVsHFvkT6Gug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qLwOKCk319JEUbJ18BOpIQFKqtrtS/iFw1pAJT5wfAY=;
 b=n0DFJL4xGcjgP+XFRYkNsxcVzYQ1mWk8jPc89VNEghcnm1azbbDGoUAjca1DZb+XN6FwELDKmRl3YddLdQFsYpV1KBVGuy8Q0IBkiYF3H9AMLNdhJym+sFLXMap5E1Cdc9JXcz8emgqfpuXztC1KDnvhb/TO/FzZIT0guu0tfNIC7eRxFEbyjSEi/abb2nzKXq43gjcwKF6laiyNRWu8ZN4O7C5hbNDAr0L0zD5/73K/pf34iz+MhtLVGtXCaqTqQ1L+az2/cPa1T5IWtOkGoGBqj3Xf65uxFvP5iHOvtOEvp6YvDKey/ZknfkOmpFmOsfxgEkUbyPormC8OVOz8xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qLwOKCk319JEUbJ18BOpIQFKqtrtS/iFw1pAJT5wfAY=;
 b=bKCuCUPyIO0krsCcCmd/m4jB5cIq1tC34kDz41OV5I3mIHaT1OUltt0pM8feLB/REO1C9U7DPwaHdEDl7+fv3EYwetWOC0JV3MyLfOHVFgMltljKRuID88wNCKTEyAwWjPgk9HaEs7KVAnsrVMWF5u0NIkzXgqDQYleinnrLhttqZ1aCU6x/WXeVIKHhDd5iPq0QexWAPEzjWjMgceCZ6FSTYeRYYJ5d8kidfLwnKbpibPqRWgWOmqiths+oniOZNI1rG78C10i6bMEyE9EKm5+/CzvC1gtXjNXurUJoDTa2SeMhv5jOtME8bo0rONNkp+VqSWki9IW52GbHhwbwjg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <bb82e0e3-8d11-4bf7-87ea-3c936449df77@epam.com>
Date: Thu, 15 Oct 2026 11:40:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/22] xen/arm: vsmmuv3: Add dummy support for virtual
 SMMUv3 for guests
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.com>
References: <cover.1791328190.git.milan_djokic@epam.com>
 <2094abe1b6faba477e771390bf47921f80e7e0e7.1791328190.git.milan_djokic@epam.com>
 <a2cd2c05-00fe-4b50-a4fa-e316677cd31e@gmail.com>
Content-Language: en-US
From: Milan Djokic <milan_djokic@epam.com>
In-Reply-To: <a2cd2c05-00fe-4b50-a4fa-e316677cd31e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIUP296CA0097.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:35c::17) To AS2PR03MB9587.eurprd03.prod.outlook.com
 (2603:10a6:20b:595::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB9587:EE_|GV2PR03MB10950:EE_
X-MS-Office365-Filtering-Correlation-Id: 74db33a0-b137-4c83-5729-08df2aa0493b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|6133799003|18002099003|22082099003|260925021911599003|260925021311599003|260925022911599003|10067099003|11063799006|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	EejPYL76xHY+Sdab3ADtAENzICOm4uOCjFRwZvs3hIaWX9fcSXn/UKo2CX10hl/oQY5DM75j6nH9tKdwAN3HD+zPYSgPRQIAi6aMXIPn78YzQG0NSz6tTh4L2t+QC+cxSpHIsA4LZlhOfUocXfgXQh0jpCfYD+XKB/pOoSam87XUMpMi5XCYvmJUorT9ymmwc1VMy/8tRxmqwDDOt/cKYBUx5fDeGTmIKCi8zNpDI9AQ+EL0OWIu8yc/Pjt0rHmD4mdZikes4gxy+XIdCB6mc93SFQiQnn2Jm9pRwm/5mdf7bFcr4ZZdffgkNV6aP6BSkodKjf9ENbZFIjn3O/vbNOheg0djZsVEyy7nBx9nNXfG1MFYazTzPinbhmE70gNjn+M/cdGCIBU4tjSRAkvOKtNxibLlNLZGNzWxSgU9cL/MJhtdKRFML0m/ZsyU9ALm0hlImmDpZ+59+ut5SGFzrw7RvfS26TCzEfxvKPUz/suTY5ZhQzuUjvMbnPSvlS60SATocwC10y7S2V0B1/W2GODJxNcvAdwcG85+dHWVOcTOzo7vL3wX8KKCnRGlFKAPxouf8cQcuPvJUkf148xByNl4HElwSU7QjcruRBlkTP370HHJe9tiuvvhbP3QljNN803qRMv9rtpBccMxWgiSiZlnLhFNegtbuwrg0n9UWHA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(18002099003)(22082099003)(260925021911599003)(260925021311599003)(260925022911599003)(10067099003)(11063799006)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkR3cFMxUWVsc1hiMUtuUDVSL3hYTE1Pb05tMDloWXNPYmVEemVoN0grb05q?=
 =?utf-8?B?a2R6N0F5dnBtYmdiV2oyZlh1bnhJZlNzSEFRWEpEc2M4aGIxcytUZVBNSEMr?=
 =?utf-8?B?bENPSU1RNjR2bU42K0Z4MktKbHI2VnpLc2I4RUNHd2VUbng4RDQwdmkwSms1?=
 =?utf-8?B?R2FNanFUdVRweWhtYkNzSldLYndnYUMvdUtMV2dDWW1PNWNreVhvWklXV2pO?=
 =?utf-8?B?NzFyYWdsRnZvc0MxbTkwcVRHbU9hajRsR1lIUVBHbG9Yd3grUCtSRnRIalIw?=
 =?utf-8?B?YjVkVVhJWSs5UVdEdGZ6bXcyY1dEMzRjRTM0alptTzEzS1JGK3NwSlI4ejlR?=
 =?utf-8?B?UnNaVnRuQThpQldGcmh0N0docDBWQjRtRkJScHJ5TnhLT0dwMFRJSWNyaklQ?=
 =?utf-8?B?ZitFcjFzMFdseUVKZm02UUIzVitUd21PQ2VWOWRHUnNVS0RYcjVmQlIvTUlk?=
 =?utf-8?B?N3Q0c2Zwa0x5WlI3Vm1paWZtMG1NV1NBOERzeERuUWppNWJrSForYW04UWVQ?=
 =?utf-8?B?T0VveHJaYlZ0WGxyYTdHY3RjYzNnNW15T0cwaGtqczhwdFJwT2NoMmxtTSti?=
 =?utf-8?B?M1lFRlR4Zm9nQlFoUC9US3g2V1EvT1F5bjRUZXRlNVNZUjhRS1pkTC9yanhN?=
 =?utf-8?B?amFWRXJQSkZjOEVXMnR3aVZuRUdaVkFhZ0xKcjdlVzVEODd4M1R5T0dqMS9j?=
 =?utf-8?B?eWh2NGVuWmdyZDdCeGdTeGkzRlNTcWVFeEk3N1VGY1YyTnptZWswcE45a1hX?=
 =?utf-8?B?ZjA1Zlc3Q3J3TFdyMjVYT0QramFEeXhvZjlOWWlGM1VOY2djazNLRFN4YmhG?=
 =?utf-8?B?R2h6dTBYQUJsaXR2QmlHQVVKVmJTOEM3VHJienptd2kvWTE2NncrVjU1YU45?=
 =?utf-8?B?b2hNNGFscWV0dC9saytJeExVdEdyK0lKUlRybURlejNMczJZc2ZHR1ZWWnBO?=
 =?utf-8?B?SWZKclJvemVGQUJjWDFDZnhMVEgwcGNsa2JXTHo2LzczVUpKblA1M3lSRGxT?=
 =?utf-8?B?dWs5aWVFd0tVR3BrOHQ2RnI2a04xVlJiaktoM1lKVEVUTzhtZXJPREJJNEJH?=
 =?utf-8?B?OU8xdE5VMGkwLzNVSDZtTE5INmFVcUlVV0p1TWlPWk5paE01c1VnZ1hSNkRB?=
 =?utf-8?B?V2VVTUFLN3J4S1k0NzJKQW9Yamt3KzZHRDZJb2tHZFR0NWlvQ0xqMnA5Mkd6?=
 =?utf-8?B?bDNPaU9RNHNNT0VKVWNMNTJnd3F3WGVuZTlNcW13b2k4UzRRV0U5bVFUK25H?=
 =?utf-8?B?bGx6MzNkOTJ0dCsvdmhnUm1vWHF5cXpRV3JHZUVSWkJLKzVjSkdRUldnNGd2?=
 =?utf-8?B?ZGdSWW1VdGpBcllRR3NocVlrTlR4cTJtYnVRK0RRbnhlSlJLeS91aHpteDRx?=
 =?utf-8?B?TjVVVjRXTERoRTRLWDgzZEkrSG4ranphMkVWTTcrdzBBMlZXZ3Z3a1p4SGZ3?=
 =?utf-8?B?MzVwczZES1NJSHUwWmQ1aEpjWVpJdGJHRDNySmJ3OEt2MlhNSHlXRElxd0Vv?=
 =?utf-8?B?a3ROWTA4eG9OdUt2WUI2RkZvZzBPcmh3QW9VVis5UTN5R1cyS2lqVkRVeFp5?=
 =?utf-8?B?c3I5M2x3bDhReFBxbTJVQXV5SHBUdUMyT1g4K2VtcittbEtVdkdIcmJmbmVv?=
 =?utf-8?B?QmhLdGhrRDcwbENzN3hTZ0gva3dKUUxWanRDU2dGUDdCNTJFUnZ5UWJ5ZzFV?=
 =?utf-8?B?a2x1V3poVndQY2FrRW5EWU9iSmdqVGptb0NJaFMyelhSRWE0SWJ0SEVkMDJZ?=
 =?utf-8?B?cWlMUlZxUXVIM3BiVWNuTzBnL2RkK2lRdFAyL3p5elhMQnpYeEwvTG9iNTR4?=
 =?utf-8?B?YlJieTNwUHdlYVlKTnJFLzFXZWdZN1lSNU1pNGx0WEw4VHEvOUZPdEN2U0F4?=
 =?utf-8?B?SkQzMTRDT3VpTUtOMS9YOGpFeSs4VThmL0JjVXViUDZxNHliSWc1SlNuelNk?=
 =?utf-8?B?UGtLVmUyZGhBL3dBVnJGQnNUclNhYUd0aHhyUG1XUnB2SzFHck82NzZXT3Z0?=
 =?utf-8?B?QjlpVkpreC9RRlQzRGlteHJWdGhZWTZKVDFmMUZkdzI5dGFhRTlWdEUwTm5C?=
 =?utf-8?B?ZkRPaVNGMnBOMFBTTnpNT0l1YUtqYTJhNk45K01OUDVJbFkrOUNQMkV0ckdy?=
 =?utf-8?B?NUhrN3YzcHNBNGJmYUViNncrTVphUGVNRFlIdVNjb1llOCt4bkI3VkhwZ3Bx?=
 =?utf-8?B?elJTcUxlcnlodFRsc2NIY3EyczZsQm9HV2YwNTVKRDRiTHBiZlNqa1BzWmd3?=
 =?utf-8?B?YjZydG5ubGZtdlM3QVZPQkZRZVIwaGNGZkRYa2dMZjZJWFpNakl6dDNhME0r?=
 =?utf-8?B?NTFKRFpHSVZmWUkyOWlYb2tjb05jVWxsbDBnMGEybzNPNkk5ZXg2QT09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74db33a0-b137-4c83-5729-08df2aa0493b
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 09:40:02.3288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZDGOkdnkbmBloNzC+N878ELnBFiuCPXLtKy9talw0RdHW3mBpBwMi2E4/s0x3jza58uUuWKJ0qgiDPTP/lJljA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB10950
X-purgate-ID: tlsNG-bad1c0/1792057207-3B0DD034-D96BEBEA/0/0
X-purgate-type: clean
X-purgate-size: 17320

Hi Oleksandr,

On 10/11/26 16:06, Oleksandr Tyshchenko wrote:
> 
> 
> On 10/7/26 03:06, Milan Djokic wrote:
> 
> Hello Milan
> 
>> From: Rahul Singh <rahul.singh@arm.com>
>>
>> domain_viommu_init() will be called during domain creation and will add
>> the dummy trap handler for virtual IOMMUs for guests.
>>
>> A host IOMMU list will be created when host IOMMU devices are probed
>> and this list will be used to create the IOMMU device tree node for
>> dom0. For dom0, 1-1 mapping will be established between vIOMMU in dom0
>> and physical IOMMU.
>>
>> For domUs, the 1-N mapping will be established between domU and physical
>> IOMMUs. A new area has been reserved in the arm guest physical map at
>> which the emulated vIOMMU node is created in the device tree.
>>
>> Also set the vIOMMU type to vSMMUv3 to enable vIOMMU framework to call
>> vSMMUv3 domain creation/destroy functions.
>>
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
>> ---
>>    xen/arch/arm/domain.c                  |   6 +-
>>    xen/arch/arm/include/asm/domain.h      |   5 ++
>>    xen/arch/arm/include/asm/viommu.h      |  36 ++++++++
>>    xen/drivers/passthrough/Kconfig        |   8 ++
>>    xen/drivers/passthrough/arm/Makefile   |   1 +
>>    xen/drivers/passthrough/arm/smmu-v3.c  |   7 ++
>>    xen/drivers/passthrough/arm/viommu.c   |  83 ++++++++++++++++-
>>    xen/drivers/passthrough/arm/vsmmu-v3.c | 118 +++++++++++++++++++++++++
>>    xen/drivers/passthrough/arm/vsmmu-v3.h |  20 +++++
>>    xen/include/public/arch-arm.h          |   5 ++
>>    10 files changed, 287 insertions(+), 2 deletions(-)
>>    create mode 100644 xen/drivers/passthrough/arm/vsmmu-v3.c
>>    create mode 100644 xen/drivers/passthrough/arm/vsmmu-v3.h
>>
>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>> index 5c411a2310..003a8d45b9 100644
>> --- a/xen/arch/arm/domain.c
>> +++ b/xen/arch/arm/domain.c
>> @@ -672,7 +672,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>>            return -EINVAL;
>>        }
>>    
>> -    if ( config->arch.viommu_type != XEN_DOMCTL_CONFIG_VIOMMU_NONE )
>> +    if ( config->arch.viommu_type != XEN_DOMCTL_CONFIG_VIOMMU_NONE &&
>> +         config->arch.viommu_type != viommu_get_type() )
>>        {
>>            dprintk(XENLOG_INFO,
>>                    "vIOMMU type requested not supported by the platform or Xen\n");
>> @@ -728,6 +729,9 @@ int arch_domain_create(struct domain *d,
>>    
>>        count += domain_vpci_get_num_mmio_handlers(d);
>>    
>> +    if ( config->arch.viommu_type != XEN_DOMCTL_CONFIG_VIOMMU_NONE )
>> +        count += domain_viommu_get_num_mmio_handlers(d);
>> +
>>        if ( (rc = domain_io_init(d, count + MAX_IO_HANDLER)) != 0 )
>>            goto fail;
>>    
>> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
>> index c3d2c4981f..70af0bf8b7 100644
>> --- a/xen/arch/arm/include/asm/domain.h
>> +++ b/xen/arch/arm/include/asm/domain.h
>> @@ -102,6 +102,11 @@ struct arch_domain
>>    #ifdef CONFIG_MPU
>>        uint8_t v8r_el1_msa;
>>    #endif
>> +
>> +#ifdef CONFIG_ARM_VIRTUAL_IOMMU
>> +    struct list_head viommu_list;     /* List of virtual IOMMUs */
>> +#endif
>> +
>>    }  __cacheline_aligned;
>>    
>>    struct arch_vcpu
>> diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/asm/viommu.h
>> index 95f82d9cf5..287595068b 100644
>> --- a/xen/arch/arm/include/asm/viommu.h
>> +++ b/xen/arch/arm/include/asm/viommu.h
>> @@ -3,9 +3,23 @@
>>    #define __ARCH_ARM_VIOMMU_H__
>>    
>>    #include <xen/lib.h>
>> +#include <xen/list.h>
>>    #include <xen/types.h>
>>    #include <public/xen.h>
>>    
>> +/* data structure for each hardware IOMMU */
>> +struct host_iommu {
>> +    struct list_head entry;
>> +    /* IOMMU DT node used to establish virtual to physical IOMMU/SID mapping */
>> +    const struct dt_device_node *dt_node;
>> +    /* Used for dom0 vIOMMU instantiation (1-1 MMIO regions mappings) */
>> +    paddr_t addr;
>> +    /* Used for dom0 vIOMMU instantiation (1-1 MMIO regions mappings) */
>> +    paddr_t size;
>> +    /* Used for dom0 EVTQ and GERROR interrupts (1-1 IRQ mapping) */
>> +    uint32_t irq;
>> +};
>> +
>>    struct viommu_ops {
>>        /*
>>         * Called during domain construction if toolstack requests to enable
>> @@ -32,9 +46,15 @@ struct viommu_desc {
>>    
>>    #ifdef CONFIG_ARM_VIRTUAL_IOMMU
>>    
>> +extern struct list_head host_iommu_list;
>> +
>>    int domain_viommu_init(struct domain *d, uint8_t viommu_type);
>>    int viommu_relinquish_resources(struct domain *d);
>>    uint8_t viommu_get_type(void);
>> +void add_to_host_iommu_list(paddr_t addr, paddr_t size,
>> +                            const struct dt_device_node *node);
>> +void set_cur_viommu(const struct viommu_desc *desc);
>> +unsigned int domain_viommu_get_num_mmio_handlers(struct domain *d);
>>    
>>    #else
>>    
>> @@ -56,6 +76,22 @@ static inline int viommu_relinquish_resources(struct domain *d)
>>        return 0;
>>    }
>>    
>> +static inline void __init add_to_host_iommu_list(paddr_t addr, paddr_t size,
>> +                                          const struct dt_device_node *node)
>> +{
>> +    return;
>> +}
>> +
>> +static inline unsigned int domain_viommu_get_num_mmio_handlers(struct domain *d)
>> +{
>> +    return 0;
>> +}
>> +
>> +static inline void __init set_cur_viommu(const struct viommu_desc *desc)
>> +{
>> +    return;
>> +}
>> +
>>    #endif /* CONFIG_ARM_VIRTUAL_IOMMU */
>>    
>>    #endif /* __ARCH_ARM_VIOMMU_H__ */
>> diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
>> index a92cfbea98..40d072822f 100644
>> --- a/xen/drivers/passthrough/Kconfig
>> +++ b/xen/drivers/passthrough/Kconfig
>> @@ -40,6 +40,14 @@ config ARM_VIRTUAL_IOMMU
>>    	help
>>    	  Support virtual IOMMU infrastructure to implement vIOMMU.
>>    
>> +config VIRTUAL_ARM_SMMU_V3
>> +	bool "ARM Ltd. Virtual SMMUv3 Support (UNSUPPORTED)"
>> +	depends on ARM_SMMU_V3 && ARM_VIRTUAL_IOMMU
>> +	help
>> +	 Support for implementations of the virtual ARM System MMU architecture
>> +	 version 3. Virtual SMMUv3 is unsupported feature and should not be used
>> +	 in production.
>> +
>>    endif
>>    
>>    config AMD_IOMMU
>> diff --git a/xen/drivers/passthrough/arm/Makefile b/xen/drivers/passthrough/arm/Makefile
>> index c3783188e3..c8f0a5f802 100644
>> --- a/xen/drivers/passthrough/arm/Makefile
>> +++ b/xen/drivers/passthrough/arm/Makefile
>> @@ -3,3 +3,4 @@ obj-$(CONFIG_ARM_SMMU) += smmu.o
>>    obj-$(CONFIG_IPMMU_VMSA) += ipmmu-vmsa.o
>>    obj-$(CONFIG_ARM_SMMU_V3) += smmu-v3.o
>>    obj-$(CONFIG_ARM_VIRTUAL_IOMMU) += viommu.o
>> +obj-$(CONFIG_VIRTUAL_ARM_SMMU_V3) += vsmmu-v3.o
>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
>> index bd0689664b..21b82eba85 100644
>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>> @@ -93,6 +93,7 @@
>>    #include <asm/platform.h>
>>    
>>    #include "smmu-v3.h"
>> +#include "vsmmu-v3.h"
>>    
>>    #define ARM_SMMU_VTCR_SH_IS		3
>>    #define ARM_SMMU_VTCR_RGN_WBWA		1
>> @@ -2829,6 +2830,9 @@ static int __init arm_smmu_device_probe(struct platform_device *pdev)
>>    	list_add(&smmu->devices, &arm_smmu_devices);
>>    	spin_unlock(&arm_smmu_devices_lock);
>>    
>> +	/* Add to host IOMMU list to initialize vIOMMU for dom0 */
>> +	add_to_host_iommu_list(ioaddr, iosize, dev_to_dt(pdev));
>> +
>>    	return 0;
>>    
>>    
>> @@ -3181,6 +3185,9 @@ static __init int arm_smmu_dt_init(struct dt_device_node *dev,
>>    
>>    	platform_features &= smmu->features;
>>    
>> +	/* Set vIOMMU type to SMMUv3 */
>> +	vsmmuv3_set_type();
>> +
>>    	return 0;
>>    }
>>    
>> diff --git a/xen/drivers/passthrough/arm/viommu.c b/xen/drivers/passthrough/arm/viommu.c
>> index 0c0efd668e..3401e4f7d9 100644
>> --- a/xen/drivers/passthrough/arm/viommu.c
>> +++ b/xen/drivers/passthrough/arm/viommu.c
>> @@ -2,12 +2,54 @@
>>    
>>    #include <xen/errno.h>
>>    #include <xen/init.h>
>> +#include <xen/irq.h>
>>    #include <xen/types.h>
>> +#include <xen/sched.h>
>>    
>>    #include <asm/viommu.h>
>>    
>> +/* List of all host IOMMUs */
>> +LIST_HEAD(host_iommu_list);
>> +
>>    /* Struct to hold the vIOMMU ops and vIOMMU type */
>>    static const struct viommu_desc __ro_after_init *cur_viommu;
>> +static bool host_iommu_list_incomplete;
>> +
>> +/* Common function for adding to host_iommu_list */
>> +void __init add_to_host_iommu_list(paddr_t addr, paddr_t size,
>> +                            const struct dt_device_node *node)
>> +{
>> +    struct host_iommu *iommu_data;
>> +    int irq;
>> +
>> +    iommu_data = xzalloc(struct host_iommu);
>> +    if ( !iommu_data )
>> +    {
>> +        host_iommu_list_incomplete = true;
>> +        printk(XENLOG_WARNING
>> +               "vIOMMU: Cannot allocate memory for host IOMMU data\n");
>> +        return;
>> +    }
>> +
>> +    iommu_data->addr = addr;
>> +    iommu_data->size = size;
>> +    iommu_data->dt_node = node;
>> +    irq = platform_get_irq(node, 0);
>> +    if ( irq < 0 )
>> +    {
>> +        host_iommu_list_incomplete = true;
>> +        printk(XENLOG_WARNING
>> +               "vIOMMU: disabling support because IOMMU @0x%"PRIx64
>> +               " has no usable IRQ (%d)\n", addr, irq);
>> +        xfree(iommu_data);
>> +        return;
>> +    }
>> +    iommu_data->irq = irq;
>> +
>> +    printk("vIOMMU: Found IOMMU @0x%"PRIx64"\n", addr);
>> +
>> +    list_add_tail(&iommu_data->entry, &host_iommu_list);
>> +}
>>    
>>    int domain_viommu_init(struct domain *d, uint8_t viommu_type)
>>    {
>> @@ -33,12 +75,51 @@ int viommu_relinquish_resources(struct domain *d)
>>    
>>    uint8_t viommu_get_type(void)
>>    {
>> -    if ( !cur_viommu )
>> +    if ( !cur_viommu || host_iommu_list_incomplete ||
>> +         list_empty(&host_iommu_list) )
>>            return XEN_DOMCTL_CONFIG_VIOMMU_NONE;
>>    
>>        return cur_viommu->viommu_type;
>>    }
>>    
>> +void __init set_cur_viommu(const struct viommu_desc *desc)
>> +{
>> +    if ( cur_viommu && (cur_viommu != desc) )
>> +    {
>> +        printk("WARNING: Cannot set vIOMMU, already set to a different value\n");
>> +        return;
>> +    }
>> +
>> +    cur_viommu = desc;
>> +}
>> +
>> +unsigned int domain_viommu_get_num_mmio_handlers(struct domain *d)
>> +{
>> +    if ( is_hardware_domain(d) )
>> +    {
>> +        struct host_iommu *hw_iommu;
>> +        int count = 0;
>> +
>> +        /*
>> +        * For hardware domain, vIOMMU per pIOMMU is exposed. Number of
>> +        * regions required for the configuration space is equal to number of
>> +        * host IOMMUs.
>> +        */
>> +        list_for_each_entry(hw_iommu, &host_iommu_list, entry)
>> +        {
>> +            count++;
>> +        }
>> +
>> +        return count;
>> +    }
>> +
>> +    /*
>> +     * For unpriviliged domains, single vIOMMU is exposed and requires one
>> +     * region to cover the configuration space.
>> +     */
>> +    return 1;
>> +}
>> +
>>    /*
>>     * Local variables:
>>     * mode: C
>> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrough/arm/vsmmu-v3.c
>> new file mode 100644
>> index 0000000000..ea3b5bb34d
>> --- /dev/null
>> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
>> @@ -0,0 +1,118 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
>> +
>> +#include <xen/param.h>
>> +#include <xen/sched.h>
>> +#include <asm/mmio.h>
>> +#include <asm/viommu.h>
>> +
>> +struct virt_smmu {
>> +    struct      domain *d;
>> +    struct      list_head viommu_list;
>> +};
>> +
>> +static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
>> +                              register_t r, void *priv)
>> +{
>> +    BUG_ON("unimplemented");
>> +    return IO_HANDLED;
>> +}
>> +
>> +static int vsmmuv3_mmio_read(struct vcpu *v, mmio_info_t *info,
>> +                             register_t *r, void *priv)
>> +{
>> +    BUG_ON("unimplemented");
>> +    return IO_HANDLED;
>> +}
>> +
>> +static const struct mmio_handler_ops vsmmuv3_mmio_handler = {
>> +    .read  = vsmmuv3_mmio_read,
>> +    .write = vsmmuv3_mmio_write,
>> +};
>> +
>> +static int vsmmuv3_init_single(struct domain *d, paddr_t addr, paddr_t size)
>> +{
>> +    struct virt_smmu *smmu;
>> +
>> +    smmu = xzalloc(struct virt_smmu);
>> +    if ( !smmu )
>> +        return -ENOMEM;
>> +
>> +    smmu->d = d;
>> +
>> +    register_mmio_handler(d, &vsmmuv3_mmio_handler, addr, size, smmu);
>> +
>> +    /* Register the vIOMMU to be able to clean it up later. */
>> +    list_add_tail(&smmu->viommu_list, &d->arch.viommu_list);
>> +
>> +    return 0;
>> +}
>> +
>> +static int domain_vsmmuv3_init(struct domain *d)
>> +{
>> +    int ret;
>> +
>> +    INIT_LIST_HEAD(&d->arch.viommu_list);
>> +
>> +    if ( is_hardware_domain(d) )
> 
> 
> Looking over other device emulations in Xen (vpl011, vgic, etc.), I see
> that the host (hardware) MMIO range is also exposed to direct-mapped
> domains, as there might be a non-hwdom 1:1 domain. Xen even has a
> specific macro for that: domain_use_host_layout. Here, however, the
> guest MMIO range will be exposed to a regular direct-mapped domain. Is
> there a specific reason for that (is this intentional)?
> 

No, this wasn't intentional. I'll update the implementation to use the 
host MMIO range for direct-mapped domains, consistent with the other 
device emulations in Xen.

> 
>> +    {
>> +        struct host_iommu *hw_iommu;
>> +
>> +        list_for_each_entry(hw_iommu, &host_iommu_list, entry)
>> +        {
>> +            ret = vsmmuv3_init_single(d, hw_iommu->addr, hw_iommu->size);
>> +            if ( ret )
>> +                return ret;
>> +        }
>> +    }
>> +    else
>> +    {
>> +        ret = vsmmuv3_init_single(d, GUEST_VSMMUV3_BASE, GUEST_VSMMUV3_SIZE);
>> +        if ( ret )
>> +            return ret;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int vsmmuv3_relinquish_resources(struct domain *d)
>> +{
>> +    struct virt_smmu *pos, *temp;
>> +
>> +    /* Cope with uninitialized vIOMMU */
>> +    if ( list_head_is_null(&d->arch.viommu_list) )
>> +        return 0;
>> +
>> +    list_for_each_entry_safe(pos, temp, &d->arch.viommu_list, viommu_list )
>> +    {
>> +        list_del(&pos->viommu_list);
>> +        xfree(pos);
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct viommu_ops vsmmuv3_ops = {
>> +    .domain_init = domain_vsmmuv3_init,
>> +    .relinquish_resources = vsmmuv3_relinquish_resources,
>> +};
>> +
>> +static const struct viommu_desc vsmmuv3_desc = {
>> +    .ops = &vsmmuv3_ops,
>> +    .viommu_type = XEN_DOMCTL_CONFIG_VIOMMU_SMMUV3,
>> +};
>> +
>> +void __init vsmmuv3_set_type(void)
>> +{
>> +    const struct viommu_desc *desc = &vsmmuv3_desc;
>> +
>> +    set_cur_viommu(desc);
>> +}
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.h b/xen/drivers/passthrough/arm/vsmmu-v3.h
>> new file mode 100644
>> index 0000000000..9f4c86abd5
>> --- /dev/null
>> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.h
>> @@ -0,0 +1,20 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
>> +#ifndef __ARCH_ARM_VSMMU_V3_H__
>> +#define __ARCH_ARM_VSMMU_V3_H__
>> +
>> +#include <asm/viommu.h>
>> +
>> +#ifdef CONFIG_VIRTUAL_ARM_SMMU_V3
>> +
>> +void vsmmuv3_set_type(void);
>> +
>> +#else
>> +
>> +static inline void __init vsmmuv3_set_type(void)
>> +{
>> +    return;
>> +}
>> +
>> +#endif /* CONFIG_VIRTUAL_ARM_SMMU_V3 */
>> +
>> +#endif /* __ARCH_ARM_VSMMU_V3_H__ */
>> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
>> index a1491f9cf7..8863e2e457 100644
>> --- a/xen/include/public/arch-arm.h
>> +++ b/xen/include/public/arch-arm.h
>> @@ -335,6 +335,7 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>>    #define XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_VMSA    2
>>    
>>    #define XEN_DOMCTL_CONFIG_VIOMMU_NONE   0
>> +#define XEN_DOMCTL_CONFIG_VIOMMU_SMMUV3 1
>>    
>>    struct xen_arch_domainconfig {
>>        /* IN/OUT */
>> @@ -463,6 +464,10 @@ typedef uint64_t xen_callback_t;
>>    #define GUEST_GICV3_GICR0_BASE     xen_mk_ullong(0x03020000) /* vCPU0..127 */
>>    #define GUEST_GICV3_GICR0_SIZE     xen_mk_ullong(0x01000000)
>>    
>> +/* vsmmuv3 MMIO mappings */
>> +#define GUEST_VSMMUV3_BASE     xen_mk_ullong(0x04040000)
>> +#define GUEST_VSMMUV3_SIZE     xen_mk_ullong(0x00020000)
>> +
>>    /*
>>     * 256 MB is reserved for VPCI configuration space based on calculation
>>     * 256 buses x 32 devices x 8 functions x 4 KB = 256 MB
> 

BR,
Milan


