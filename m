Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1602606A324
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 09:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=unNmwU2b
Received: from list by lists.xenproject.org with outflank-mailman.1455215.1668782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ6Jo-00010d-LQ; Tue, 20 Oct 2026 09:39:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455215.1668782; Tue, 20 Oct 2026 09:39:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJ6Jo-00010U-I3; Tue, 20 Oct 2026 09:39:40 +0000
Received: by outflank-mailman (input) for mailman id 1455215;
 Tue, 20 Oct 2026 09:39:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xJ6Jm-0000ww-EX
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 09:39:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJ6Jl-00CgDe-RH
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 11:39:37 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ad736cd-8faa-0a2a0a5109dd-0a2a450188f2-20
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 11:39:37 +0200
Received: from [52.101.65.122]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ad736d9-5984-0a2a45010019-3465417ac47b-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 11:39:37 +0200
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by BESPR03MB911377.eurprd03.prod.outlook.com
 (2603:10a6:b10:106::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 09:39:34 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0522.013; Tue, 20 Oct 2026
 09:39:34 +0000
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
 b=BhZ5yRXvwFLcK+tDhvI+94aShrNWVBuupxibGtTJljvAFiaUW9hbcwl8lkiMvEaWS1kY+S1MJv6SQG8KT1UZQ6eMygazETwE40/1OW0mK5uN0axoCdWwycaLatb1HJRcHvmWbJN0DrGqeqG5MpeNSZe9v2ghbOiMT51a8/bIO5FLt5fOI6Xv7MDRmQW7FSkZw/Vt8B7egvuRPT6X6LkUyJzkEnbZJxjxFNyU0sVSvEkEMkzrH9IF0XYg2NguphfaxLP3QAkZodzUx9LcLYZ47qc0cwtnYBJEdMICy9g5xf1C+8TphkqV0oQ/j9Vk9UB81KfEw9eoH4sGpcELeVascg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eG3bWNE9IXXA6p9ws4tzCLKJumsCa58Moj1A2q7tPnQ=;
 b=IKh/mkJdHQb025csTxq3OvCAEX0yeIgD/n3UERG+RVlgm4HaQje0/UnlmmWndr8JequTvh6iFinVof+4pMS/WDYZeEgRdXmIXrd/wcpk5Upo0w8IPSga4OlBM0HjXcbUSFhvxP21/lQuEWPiSc9UWVPk4LNRkvFdkViRI2fa9LKLaFIKXKO74mgr5GClkGQw2zdMGIlxdRGVoOz7qU20/dsX/b2PbwJWdwHg3iTnFpsLTqgkbZYQxK8UAwaMtvM/aVm3wfYJZtSu/yqdHailzQexavACYxFG97xQtrOWVGGa71JYKG6slk43S8MFNguL4jMN3Dvwkm/yqTlRVC8Hxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eG3bWNE9IXXA6p9ws4tzCLKJumsCa58Moj1A2q7tPnQ=;
 b=unNmwU2bM51/dJKQE8+sL1Psc3gvj9zrMvMiInLn0fyfjXDxWgbnJPN9rfD2PiZAXsWQaz3nlS23yltu+a9hjpWFhT47ETRHjauBmbb9qQ4WVfP/IwdK2FaAA7CSN0Vt1qA8pXhQzcEqnA+3IDWOi1d/jksb3AvPxcrJL496cqO5x2WOqnI4s7q5l/xrZ/yrMrTkmqKR7wALqXC2xCvRjiO5n6S3tPYXoZANK5vRsjnGCEsZE2n5heRJGynS7218oTWdDbbHWAECnL/pWLjUv9IgehF5xKpmBIVg0InH52upR3pJWLw1uchsIJ3b+wA7Exq6A1aBhuYHdttkY8c4qw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <4090edd7-03d1-466a-9b06-e724b93c5b3d@epam.com>
Date: Tue, 20 Oct 2026 12:39:33 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 08/13] iommu/ipmmu-vmsa: Implement suspend/resume
 callbacks
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Mykola Kvach <xakep.amatop@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>
References: <cover.1787838455.git.mykola_kvach@epam.com>
 <1f036e7ad5ad6efba635ca029b0fab133300603a.1787838455.git.mykola_kvach@epam.com>
 <CAGeoDV8wSQo9NLD-P5+mm7R9TkkBpxdE1W0wAKawgGBnXgMdmg@mail.gmail.com>
 <EDBCD237-FAB6-462B-9C32-F461880A193C@arm.com>
Content-Language: en-US
From: Mykola_Kvach <mykola_kvach@epam.com>
In-Reply-To: <EDBCD237-FAB6-462B-9C32-F461880A193C@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0017.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::16) To DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0302MB9208:EE_|BESPR03MB911377:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e6736cf-266d-495c-0acf-08df2e8e0cc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|6133799003|18002099003|22082099003|3023799007|11063799006|4143699003|10067099003|5023799004|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	0TSNrJdr+6W72YliT7gEg3CmYX+PzV+/DUGx69tjFsXvIGzrat11yPjVTWpfha98C7TdU0X20XQkk+a0xcipxNgynw1KFHDB8F5tiCMwEO3quJz3hduycl5+L4xk39SmQ5OC9wcOw2S+Y72Dl8OMVChKg6h/FzOOH4eo3KzF82iiQz2o0OBuDGb76ASeR55d2lqbBzJPUE4pleDERy2PH+DsKTm3kaXmvVVhpB1NI/874Ct4dzH/9REnmrBzNFl6j2tpaG5YJGZgell0/5uA146GuitB7tyorcs1A8I3Y9Oasi4CQ6i84yYbIA2WmmkfpAPeLyct77nGu4t1Uj1KHBP7vaQjvFMfNBCgswUYgJwJoTYfvfacsJLLOLhHhYS/xMfBMKgJTnLO05xDHqYDwhKX+PuxnxSdepuOcgmfuHFjV7uTMGtLatSSUM76v18V+MjPcfiyxGAa9TRWlRPRBPSrww88VzmlXIaWD1pDiXoaooEzuZIzMUTH6VGZtp/g2cE7XWscwB65EimuzqS5AD3hLvjgcz2Vc0SZikXNqRTEr/3tCZMOk7zBCmtS3UM+dw3lNV6fC0FfyVPVY4EGrqf4n11+2hCxHpQLtxhxIoWs1LHZ3iuvKZSq906m3dgw+sUJyXoh7cICitzoXHqmS+bJ36CwX10Lp5+5r5jjVEo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(18002099003)(22082099003)(3023799007)(11063799006)(4143699003)(10067099003)(5023799004)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M293MHRRdU9ybHE2ZEZ5d1gvL3UzYlhGN2hWd1dxMFAya1hnMTJROUJUUS9h?=
 =?utf-8?B?UVYzcW9FTEczYitqQ2RyczJtL0tTVGU3YlZKZmM1d3FjQmxxZWNZZWRKOVRn?=
 =?utf-8?B?NE9HaWhqbElvL2lpTGcxaHFHZHpQMHdGN0lGYVRHR1Y1dGdzWEo1VGhDV0VF?=
 =?utf-8?B?SUw0Tm1hNW43SlJ6a0NsRGJKZlppbG5EZG9UQXhtdFlObTN0QVpHaW1sTTZZ?=
 =?utf-8?B?cVVCdTJISnN3alFrZGxPN2FNWThreHRHb2I5YzBkcG8xdTZnQVJQbWV0bmth?=
 =?utf-8?B?Z1RpWUZ2S2E1VTBxWlBvSVk0bGpaSHJDQnNRQmNDRk1wUjdtRW1WQVdva1N2?=
 =?utf-8?B?Q1l3S2NqanAzZ0Jja1VXZ2lOaDhXWlZkcmxCSVQ0cXhacTJXa1dYR200Tkl1?=
 =?utf-8?B?azVpRzNqYUo0ZGlLdE1OK2NjK3Brak42YVUyeTA5UlBBQVJCRWw5NmdqTXMv?=
 =?utf-8?B?SkZUR3AzN283eTJ5RHhibkdESWUyQ3A4aTJVV29RWVlVb1MrV1lObmVWaXdQ?=
 =?utf-8?B?NGxxdzFYb3pUKzUyUDFxM2UzaXJBRSswYVpRKytncEkrUFhaYUlsWXUrU0FC?=
 =?utf-8?B?eTFvQnZvS21EakRETGZiT0tkVzdzMnVQMUpTcG5ZeHpSdEQrU3hqZDJLZGNn?=
 =?utf-8?B?MG4xWXE5c0xGalV0RTVWTXNac2kyZHFheTkxeEdSQnNVYk8yUi9UMWc4aUky?=
 =?utf-8?B?T3VQangzSmxZdEcxcjlpZ1l5L253eGJER2xpVjNpSG8rUmhHNWtSY0lXeHBl?=
 =?utf-8?B?TXdvOVJQRXpCeDN2ajV4d080dFZpRVRPb1k0WkoxR0pXUENWVEl0N09ZV3B0?=
 =?utf-8?B?RHl6eHVsQ0JVemRWQTM0Vll0TzVudWE4VzBCQUZyV3BHSTMxSnRJc3pOVjVY?=
 =?utf-8?B?L1YzekVmQWRmd3Z4MEJPeFozbm9vOFdINzN0QzJFY2FBZlVQRTZqRkRKS1NL?=
 =?utf-8?B?dWxsUXJZcFdRNmllcTMzUW52TFcySGwxV0pDa3lwbWIvaU5Sb3gwSkFTckpt?=
 =?utf-8?B?Qkpsanp1S1V1Sk9ZMEhSWk5mSW43TmRyQWt2YXRmQm1ERXlYWjhCSnFveDhY?=
 =?utf-8?B?Ri96cjZwQURXWTJNMWh5QWdiZ094eG51TGRnSUVGVFI4OU1zSUQ4M25RRW9Y?=
 =?utf-8?B?aXpyWllhUGRhdXRnWTljTU9zazhnaU13TlBCUnBsOEliZFl6bi96M0NRKyt5?=
 =?utf-8?B?RGVrc2QrY2pNdkJqenY3MjBaSGxuaFY3TE92aE94eDJ5N2ZYekJ4Qld2RURW?=
 =?utf-8?B?MFZRc3R2bzZSMm5pZk0yMzJFZC9zak1UVW4xZDc0SDhvT0k0Ymk5Smc0SXVj?=
 =?utf-8?B?Y1ZSS0s4bU5ZUkxaMjZWZ1JISWxjQW13MUFiU2d1c05PTHc0VTFjUGFiejQv?=
 =?utf-8?B?cFdtOVNaamc4Tmw4TytpMmRvZ1ZqVTNycnAzVlE5SmIwbURsL3ZBL2o0bFBH?=
 =?utf-8?B?ZXQ3azhiTnNRZlFNb2dIOVR1MWJCSUtnZmZscFFnaFcvSy9GUVZCUlNRMTY0?=
 =?utf-8?B?ejNaYkt4N1hsNVROVGhwTmR4TldEQWtXUWM0dXBKeThjZ2F1YVpwNHUvYXRL?=
 =?utf-8?B?SytlN0lSbE9iSWNCOXRpd2xFZVNjN0RVNElvMUczaWJsUXJ0OGZON0lTNTl5?=
 =?utf-8?B?UEhlK3R5U043ZFJsZWRET3ZnQWNqYmh2c1cvMlkzUjJEeGh1N1A1MkJGZXpS?=
 =?utf-8?B?QkE4ZjBYSlArMWR5NXg1UkU3OVBYTXJ1TW4zYXcwcVRzZnE2dkJraHpLZVVJ?=
 =?utf-8?B?citrN1NyeXBvTEpKOTFhRmVxWUtlZ0l1UThMUXlyT1oyTFlGbml5eVdGM3ZC?=
 =?utf-8?B?Y25KeU5CSjRqSGVsZC9JMHVkQm5OT0VkWmI0SlB1cUpsN1RXL0NBbnpsKzg2?=
 =?utf-8?B?UVZPRDZpQTM2WjVMVWRDQyt6eGN6QWNyS2pCRkJWQlN6VnJwaHFBYm1UVGRp?=
 =?utf-8?B?clZRNk5GMWVyTk4vZ0FsSjg4OS9sdlZzRmJUZVZOeldLemllVVc3aHBtS0RL?=
 =?utf-8?B?VWxxbkNxNTlJYXp2Qlp2MnBleXVnaU5kNzdnNTJIM2g1U04xeXMwTFhSMWgr?=
 =?utf-8?B?Tkl3L2VnSFJpa0pGRDl0M1FyMTA0eFRucVRQVitYaDJBWTh4VmM5SWc1RCt0?=
 =?utf-8?B?Z3E2aVdRb0RzYWhTazFKaitGc0RsbWdqc1FESTE0akp0U0tOR09rK1F2ZEI4?=
 =?utf-8?B?QWJOaGtYQXh1ak5BN2J3N1VvQ3l3TnAwT0ZtR2dxUkp6SXp5VzBXNmV5dVVV?=
 =?utf-8?B?Rmk5Sk1MTElpbnl1czVZN0ZkMWl3NURJa1BZaFhkcVdheXlSbkdoRmUxQ0R6?=
 =?utf-8?B?amdKcWRpREhpeE5TTUxrZDJxWXYxbmFjek5LMW5RZU94TG1mU3BKQT09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e6736cf-266d-495c-0acf-08df2e8e0cc4
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 09:39:34.5609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c7zRqvl9c3vkyEJwHwkqDs6kPLXTl+AOjIBk3JXJFqpWJ2Ea+AFbZrz/ME5wz/S4hJfoC2xt41Kj23EUMro4dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR03MB911377
X-purgate-ID: tlsNG-d62444/1792489177-BD146757-655DB5F7/0/0
X-purgate-type: clean
X-purgate-size: 20770
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Bertrand, all,

An update on the PCIe register retention question and the testing
of this patch on R-Car Gen4.

On 28/09/2026 12:33, Bertrand Marquis wrote:
> Hi Mykola,
> 
>> On 28 Sep 2026, at 10:01, Mykola Kvach <xakep.amatop@gmail.com> wrote:
>>
>> Hi all,
>>
>> I have one more thing to check here regarding the R-Car Gen4 PCIe
>> BDF-to-OSID mappings across system suspend/resume.
>>
>> The mappings are programmed in the PCIe APP CNVID/CNVIDMSK registers,
>> while CNVOSIDCTRL provides the default OSID. If this state is lost
>> during SYSTEM_SUSPEND, PCI DMA could potentially use the default OSID
>> after resume instead of the OSID assigned to the device.
>>
>> I also found a recent Linux rcar-gen4 PCIe PM patch which notes that
>> S4 and V4H use an always-on PCIe power domain, while on V4M the PCIe
>> controller loses state during suspend. However, I have not found an
>> explicit guarantee that these particular APP registers are retained
>> on S4.
>>
>> The Linux BSP is not a direct reference for this case, as its current
>> R-Car S4 IPMMU setup does not use the per-BDF OSID mappings programmed
>> through these registers.
>>
>> This series has not previously been tested on R-Car S4 Spider. I have
>> tested the suspend/resume path on several other platforms (R-Car H3ULCB,
>> R-Car Gen5 and Orange Pi 5), but not this particular PCIe state.
>>
>> I will also try to check this on a real R-Car S4 board by comparing
>> the PCIe APP register state before and after SYSTEM_SUSPEND.
>>
>> So please consider this patch as needing some further investigation
>> from my side for now.
> 
> Thanks for the information.
> 
> I will skip this patch for now (and anyway i will need some help on it as IPMMU and
> in general Renesas drivers are not really something i know).
> 

Based on the discussion with Renesas, the PCIe BDF-to-OSID registers 
need to be saved and restored for S2R on S4. This includes CNVID, 
CNVIDMSK and CNVOSIDCTRL. Saving the IPMMU context and micro-TLB 
registers alone does not cover this state.

I have been trying to get a working native Linux S2R setup first, before 
testing this under Xen.

For V4H, I have not found any evidence of working S2R support, even with 
native Linux, or a known working firmware setup. My successful tests on 
White Hawk only covered s2idle and the PM test stages. These do not 
confirm S2R support.

On S4 Spider, the reference setup requires S2R-enabled ICUMX firmware 
and separate SCP applications for G4MH and CR52. The build instructions 
depend on additional SDK components and licensed compilers. Rebuilding 
Linux and TF-A alone is therefore not enough to reproduce this setup.

With the original firmware setup, I traced TF-A 2.5 stopping while 
waiting for an SCMI response. With SET_SCMI_PARAM=0, this happened
during suspend. With SET_SCMI_PARAM=1, it happened during SCMI 
initialization, before U-Boot. I also tested TF-A 2.11, but the board 
still hung during S2R. I do not have traces confirming the same failure 
point in 2.11.

Renesas kindly provided test firmware binaries. The G4MH and CR52 SCP 
applications now start, but the loader takes the warm boot path even 
after a power cycle, and the board does not reach U-Boot. Renesas 
mentioned similar behavior on some Spider boards and suggested trying 
another board. I am checking with colleagues to arrange that, which may 
take a few days.

I will continue investigating this, but it has already delayed the next 
revision for several weeks. I would like to avoid holding up the whole 
series while we work on the board and firmware setup.

For the next revision, I propose keeping the IPMMU suspend/resume patch, 
clearly stating that it has only been tested on H3ULCB (R-Car Gen3), and 
leaving R-Car Gen4 host S2R support out for now.

I also propose adding a check in the host-suspend policy to reject 
host-wide suspend on R-Car Gen4, rather than relying only on a note in 
the commit message. This restriction would apply only to host-wide 
suspend, not normal IPMMU use or guest-only suspend.

The PCIe OSID save/restore changes and support for the other R-Car 
generations can then follow separately once they have been validated.

Would this approach be acceptable?

Thanks,
Mykola

> Cheers
> Bertrand
> 
>>
>> Thanks,
>> Mykola
>>
>> On Thu, Aug 27, 2026 at 6:45 PM Mykola Kvach <mykola_kvach@epam.com> wrote:
>>>
>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>
>>> Store and restore active context and micro-TLB registers.
>>>
>>> On resume, restore Root IPMMU context state before restoring Cache IPMMU
>>> micro-TLB state. Cache IPMMUs select Root contexts through their micro-TLB
>>> configuration, so restoring Cache micro-TLBs before the Root context
>>> registers are restored can expose stale or uninitialized context state.
>>>
>>> Tested on R-Car H3 Starter Kit.
>>>
>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>>> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
>>> ---
>>> Changes in V10:
>>> - Iterate over registered IPMMUs in reverse order during resume so Root IPMMU
>>>   context state is restored before Cache IPMMU micro-TLB state.
>>>
>>> Changes in V9:
>>> - set dt_device_set_protected() only after ipmmu_alloc_ctx_suspend()
>>>   succeeds, so DT devices do not remain protected on allocation failure.
>>>
>>> Changes in V7:
>>> - moved suspend context allocation before pci stuff
>>> ---
>>> xen/drivers/passthrough/arm/ipmmu-vmsa.c | 323 +++++++++++++++++++++--
>>> 1 file changed, 308 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
>>> index fa9ab9cb13..2e54fa63d6 100644
>>> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
>>> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
>>> @@ -71,6 +71,8 @@
>>> })
>>> #endif
>>>
>>> +#define dev_dbg(dev, fmt, ...)    \
>>> +    dev_print(dev, XENLOG_DEBUG, fmt, ## __VA_ARGS__)
>>> #define dev_info(dev, fmt, ...)    \
>>>      dev_print(dev, XENLOG_INFO, fmt, ## __VA_ARGS__)
>>> #define dev_warn(dev, fmt, ...)    \
>>> @@ -130,6 +132,24 @@ struct ipmmu_features {
>>>      unsigned int imuctr_ttsel_mask;
>>> };
>>>
>>> +#ifdef CONFIG_SYSTEM_SUSPEND
>>> +
>>> +struct ipmmu_reg_ctx {
>>> +    unsigned int imttlbr0;
>>> +    unsigned int imttubr0;
>>> +    unsigned int imttbcr;
>>> +    unsigned int imctr;
>>> +};
>>> +
>>> +struct ipmmu_vmsa_backup {
>>> +    struct device *dev;
>>> +    unsigned int *utlbs_val;
>>> +    unsigned int *asids_val;
>>> +    struct list_head list;
>>> +};
>>> +
>>> +#endif
>>> +
>>> /* Root/Cache IPMMU device's information */
>>> struct ipmmu_vmsa_device {
>>>      struct device *dev;
>>> @@ -142,6 +162,9 @@ struct ipmmu_vmsa_device {
>>>      struct ipmmu_vmsa_domain *domains[IPMMU_CTX_MAX];
>>>      unsigned int utlb_refcount[IPMMU_UTLB_MAX];
>>>      const struct ipmmu_features *features;
>>> +#ifdef CONFIG_SYSTEM_SUSPEND
>>> +    struct ipmmu_reg_ctx *reg_backup[IPMMU_CTX_MAX];
>>> +#endif
>>> };
>>>
>>> /*
>>> @@ -547,6 +570,249 @@ static void ipmmu_domain_free_context(struct ipmmu_vmsa_device *mmu,
>>>      spin_unlock_irqrestore(&mmu->lock, flags);
>>> }
>>>
>>> +#ifdef CONFIG_SYSTEM_SUSPEND
>>> +
>>> +static DEFINE_SPINLOCK(ipmmu_devices_backup_lock);
>>> +static LIST_HEAD(ipmmu_devices_backup);
>>> +
>>> +static struct ipmmu_reg_ctx root_pgtable[IPMMU_CTX_MAX];
>>> +
>>> +static uint32_t ipmmu_imuasid_read(struct ipmmu_vmsa_device *mmu,
>>> +                                   unsigned int utlb)
>>> +{
>>> +    return ipmmu_read(mmu, ipmmu_utlb_reg(mmu, IMUASID(utlb)));
>>> +}
>>> +
>>> +static void ipmmu_utlbs_backup(struct ipmmu_vmsa_device *mmu)
>>> +{
>>> +    struct ipmmu_vmsa_backup *backup_data;
>>> +
>>> +    dev_dbg(mmu->dev, "Handle micro-TLBs backup\n");
>>> +
>>> +    spin_lock(&ipmmu_devices_backup_lock);
>>> +
>>> +    list_for_each_entry( backup_data, &ipmmu_devices_backup, list )
>>> +    {
>>> +        struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(backup_data->dev);
>>> +        unsigned int i;
>>> +
>>> +        if ( to_ipmmu(backup_data->dev) != mmu )
>>> +            continue;
>>> +
>>> +        for ( i = 0; i < fwspec->num_ids; i++ )
>>> +        {
>>> +            unsigned int utlb = fwspec->ids[i];
>>> +
>>> +            backup_data->asids_val[i] = ipmmu_imuasid_read(mmu, utlb);
>>> +            backup_data->utlbs_val[i] = ipmmu_imuctr_read(mmu, utlb);
>>> +        }
>>> +    }
>>> +
>>> +    spin_unlock(&ipmmu_devices_backup_lock);
>>> +}
>>> +
>>> +static void ipmmu_utlbs_restore(struct ipmmu_vmsa_device *mmu)
>>> +{
>>> +    struct ipmmu_vmsa_backup *backup_data;
>>> +
>>> +    dev_dbg(mmu->dev, "Handle micro-TLBs restore\n");
>>> +
>>> +    spin_lock(&ipmmu_devices_backup_lock);
>>> +
>>> +    list_for_each_entry( backup_data, &ipmmu_devices_backup, list )
>>> +    {
>>> +        struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(backup_data->dev);
>>> +        unsigned int i;
>>> +
>>> +        if ( to_ipmmu(backup_data->dev) != mmu )
>>> +            continue;
>>> +
>>> +        for ( i = 0; i < fwspec->num_ids; i++ )
>>> +        {
>>> +            unsigned int utlb = fwspec->ids[i];
>>> +
>>> +            ipmmu_imuasid_write(mmu, utlb, backup_data->asids_val[i]);
>>> +            ipmmu_imuctr_write(mmu, utlb, backup_data->utlbs_val[i]);
>>> +        }
>>> +    }
>>> +
>>> +    spin_unlock(&ipmmu_devices_backup_lock);
>>> +}
>>> +
>>> +static void ipmmu_domain_backup_context(struct ipmmu_vmsa_domain *domain)
>>> +{
>>> +    struct ipmmu_vmsa_device *mmu = domain->mmu->root;
>>> +    struct ipmmu_reg_ctx *regs = mmu->reg_backup[domain->context_id];
>>> +
>>> +    dev_dbg(mmu->dev, "Handle domain context %u backup\n", domain->context_id);
>>> +
>>> +    regs->imttlbr0 = ipmmu_ctx_read_root(domain, IMTTLBR0);
>>> +    regs->imttubr0 = ipmmu_ctx_read_root(domain, IMTTUBR0);
>>> +    regs->imttbcr  = ipmmu_ctx_read_root(domain, IMTTBCR);
>>> +    regs->imctr    = ipmmu_ctx_read_root(domain, IMCTR);
>>> +}
>>> +
>>> +static void ipmmu_domain_restore_context(struct ipmmu_vmsa_domain *domain)
>>> +{
>>> +    struct ipmmu_vmsa_device *mmu = domain->mmu->root;
>>> +    struct ipmmu_reg_ctx *regs = mmu->reg_backup[domain->context_id];
>>> +
>>> +    dev_dbg(mmu->dev, "Handle domain context %u restore\n", domain->context_id);
>>> +
>>> +    ipmmu_ctx_write_root(domain, IMTTLBR0, regs->imttlbr0);
>>> +    ipmmu_ctx_write_root(domain, IMTTUBR0, regs->imttubr0);
>>> +    ipmmu_ctx_write_root(domain, IMTTBCR,  regs->imttbcr);
>>> +    ipmmu_ctx_write_all(domain,  IMCTR,    regs->imctr | IMCTR_FLUSH);
>>> +}
>>> +
>>> +/*
>>> + * Xen: Unlike Linux implementation, Xen uses a single driver instance
>>> + * for handling all IPMMUs. There is no framework for ipmmu_suspend/resume
>>> + * callbacks to be invoked for each IPMMU device. So, we need to iterate
>>> + * through all registered IPMMUs performing required actions.
>>> + *
>>> + * Also take care of restoring special settings, such as translation
>>> + * table format, etc.
>>> + */
>>> +static int __must_check ipmmu_suspend(void)
>>> +{
>>> +    struct ipmmu_vmsa_device *mmu;
>>> +
>>> +    if ( !iommu_enabled )
>>> +        return 0;
>>> +
>>> +    printk(XENLOG_DEBUG "ipmmu: Suspending...\n");
>>> +
>>> +    spin_lock(&ipmmu_devices_lock);
>>> +
>>> +    list_for_each_entry( mmu, &ipmmu_devices, list )
>>> +    {
>>> +        if ( ipmmu_is_root(mmu) )
>>> +        {
>>> +            unsigned int i;
>>> +
>>> +            for ( i = 0; i < mmu->num_ctx; i++ )
>>> +            {
>>> +                if ( !mmu->domains[i] )
>>> +                    continue;
>>> +                ipmmu_domain_backup_context(mmu->domains[i]);
>>> +            }
>>> +        }
>>> +        else
>>> +            ipmmu_utlbs_backup(mmu);
>>> +    }
>>> +
>>> +    spin_unlock(&ipmmu_devices_lock);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void ipmmu_resume(void)
>>> +{
>>> +    struct ipmmu_vmsa_device *mmu;
>>> +
>>> +    if ( !iommu_enabled )
>>> +        return;
>>> +
>>> +    printk(XENLOG_DEBUG "ipmmu: Resuming...\n");
>>> +
>>> +    spin_lock(&ipmmu_devices_lock);
>>> +
>>> +    /*
>>> +     * IPMMUs are registered with list_add(), with Root IPMMU probed first.
>>> +     * Walk backwards to restore Root contexts before Cache micro-TLBs.
>>> +     */
>>> +    list_for_each_entry_reverse( mmu, &ipmmu_devices, list )
>>> +    {
>>> +        uint32_t reg;
>>> +
>>> +        /* Do not use security group function */
>>> +        reg = IMSCTLR + mmu->features->control_offset_base;
>>> +        ipmmu_write(mmu, reg, ipmmu_read(mmu, reg) & ~IMSCTLR_USE_SECGRP);
>>> +
>>> +        if ( ipmmu_is_root(mmu) )
>>> +        {
>>> +            unsigned int i;
>>> +
>>> +            /* Use stage 2 translation table format */
>>> +            reg = IMSAUXCTLR + mmu->features->control_offset_base;
>>> +            ipmmu_write(mmu, reg, ipmmu_read(mmu, reg) | IMSAUXCTLR_S2PTE);
>>> +
>>> +            for ( i = 0; i < mmu->num_ctx; i++ )
>>> +            {
>>> +                if ( !mmu->domains[i] )
>>> +                    continue;
>>> +                ipmmu_domain_restore_context(mmu->domains[i]);
>>> +            }
>>> +        }
>>> +        else
>>> +            ipmmu_utlbs_restore(mmu);
>>> +    }
>>> +
>>> +    spin_unlock(&ipmmu_devices_lock);
>>> +}
>>> +
>>> +static int ipmmu_alloc_ctx_suspend(struct device *dev)
>>> +{
>>> +    struct ipmmu_vmsa_backup *backup_data;
>>> +    unsigned int *utlbs_val, *asids_val;
>>> +    struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>>> +
>>> +    utlbs_val = xzalloc_array(unsigned int, fwspec->num_ids);
>>> +    if ( !utlbs_val )
>>> +        return -ENOMEM;
>>> +
>>> +    asids_val = xzalloc_array(unsigned int, fwspec->num_ids);
>>> +    if ( !asids_val )
>>> +    {
>>> +        xfree(utlbs_val);
>>> +        return -ENOMEM;
>>> +    }
>>> +
>>> +    backup_data = xzalloc(struct ipmmu_vmsa_backup);
>>> +    if ( !backup_data )
>>> +    {
>>> +        xfree(utlbs_val);
>>> +        xfree(asids_val);
>>> +        return -ENOMEM;
>>> +    }
>>> +
>>> +    backup_data->dev = dev;
>>> +    backup_data->utlbs_val = utlbs_val;
>>> +    backup_data->asids_val = asids_val;
>>> +
>>> +    spin_lock(&ipmmu_devices_backup_lock);
>>> +    list_add(&backup_data->list, &ipmmu_devices_backup);
>>> +    spin_unlock(&ipmmu_devices_backup_lock);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +#ifdef CONFIG_HAS_PCI
>>> +static void ipmmu_free_ctx_suspend(struct device *dev)
>>> +{
>>> +    struct ipmmu_vmsa_backup *backup_data, *tmp;
>>> +
>>> +    spin_lock(&ipmmu_devices_backup_lock);
>>> +
>>> +    list_for_each_entry_safe( backup_data, tmp, &ipmmu_devices_backup, list )
>>> +    {
>>> +        if ( backup_data->dev == dev )
>>> +        {
>>> +            list_del(&backup_data->list);
>>> +            xfree(backup_data->utlbs_val);
>>> +            xfree(backup_data->asids_val);
>>> +            xfree(backup_data);
>>> +            break;
>>> +        }
>>> +    }
>>> +
>>> +    spin_unlock(&ipmmu_devices_backup_lock);
>>> +}
>>> +#endif /* CONFIG_HAS_PCI */
>>> +
>>> +#endif /* CONFIG_SYSTEM_SUSPEND */
>>> +
>>> static int ipmmu_domain_init_context(struct ipmmu_vmsa_domain *domain)
>>> {
>>>      uint64_t ttbr;
>>> @@ -559,6 +825,9 @@ static int ipmmu_domain_init_context(struct ipmmu_vmsa_domain *domain)
>>>          return ret;
>>>
>>>      domain->context_id = ret;
>>> +#ifdef CONFIG_SYSTEM_SUSPEND
>>> +    domain->mmu->root->reg_backup[ret] = &root_pgtable[ret];
>>> +#endif
>>>
>>>      /*
>>>       * TTBR0
>>> @@ -615,6 +884,9 @@ static void ipmmu_domain_destroy_context(struct ipmmu_vmsa_domain *domain)
>>>      ipmmu_ctx_write_root(domain, IMCTR, IMCTR_FLUSH);
>>>      ipmmu_tlb_sync(domain);
>>>
>>> +#ifdef CONFIG_SYSTEM_SUSPEND
>>> +    domain->mmu->root->reg_backup[domain->context_id] = NULL;
>>> +#endif
>>>      ipmmu_domain_free_context(domain->mmu->root, domain->context_id);
>>> }
>>>
>>> @@ -1338,10 +1610,11 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
>>>      struct iommu_fwspec *fwspec;
>>>
>>> #ifdef CONFIG_HAS_PCI
>>> +    int ret;
>>> +
>>>      if ( dev_is_pci(dev) )
>>>      {
>>>          struct pci_dev *pdev = dev_to_pci(dev);
>>> -        int ret;
>>>
>>>          if ( devfn != pdev->devfn )
>>>              return 0;
>>> @@ -1358,17 +1631,24 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
>>>      if ( !to_ipmmu(dev) )
>>>          return -ENODEV;
>>>
>>> -    if ( !dev_is_pci(dev) )
>>> +    if ( !dev_is_pci(dev) && dt_device_is_protected(dev_to_dt(dev)) )
>>>      {
>>> -        if ( dt_device_is_protected(dev_to_dt(dev)) )
>>> -        {
>>> -            dev_err(dev, "Already added to IPMMU\n");
>>> -            return -EEXIST;
>>> -        }
>>> +        dev_err(dev, "Already added to IPMMU\n");
>>> +        return -EEXIST;
>>> +    }
>>>
>>> -        /* Let Xen know that the master device is protected by an IOMMU. */
>>> -        dt_device_set_protected(dev_to_dt(dev));
>>> +#ifdef CONFIG_SYSTEM_SUSPEND
>>> +    if ( ipmmu_alloc_ctx_suspend(dev) )
>>> +    {
>>> +        dev_err(dev, "Failed to allocate context for suspend\n");
>>> +        return -ENOMEM;
>>>      }
>>> +#endif
>>> +
>>> +    /* Let Xen know that the master device is protected by an IOMMU. */
>>> +    if ( !dev_is_pci(dev) )
>>> +        dt_device_set_protected(dev_to_dt(dev));
>>> +
>>> #ifdef CONFIG_HAS_PCI
>>>      if ( dev_is_pci(dev) )
>>>      {
>>> @@ -1377,26 +1657,28 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
>>>          struct pci_host_bridge *bridge;
>>>          struct iommu_fwspec *fwspec_bridge;
>>>          unsigned int utlb_osid0 = 0;
>>> -        int ret;
>>>
>>>          bridge = pci_find_host_bridge(pdev->seg, pdev->bus);
>>>          if ( !bridge )
>>>          {
>>>              dev_err(dev, "Failed to find host bridge\n");
>>> -            return -ENODEV;
>>> +            ret = -ENODEV;
>>> +            goto free_suspend_ctx;
>>>          }
>>>
>>>          fwspec_bridge = dev_iommu_fwspec_get(dt_to_dev(bridge->dt_node));
>>>          if ( fwspec_bridge->num_ids < 1 )
>>>          {
>>>              dev_err(dev, "Failed to find host bridge uTLB\n");
>>> -            return -ENXIO;
>>> +            ret = -ENXIO;
>>> +            goto free_suspend_ctx;
>>>          }
>>>
>>>          if ( fwspec->num_ids < 1 )
>>>          {
>>>              dev_err(dev, "Failed to find uTLB");
>>> -            return -ENXIO;
>>> +            ret = -ENXIO;
>>> +            goto free_suspend_ctx;
>>>          }
>>>
>>>          rcar4_pcie_osid_regs_init(bridge);
>>> @@ -1405,7 +1687,7 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
>>>          if ( ret < 0 )
>>>          {
>>>              dev_err(dev, "No unused OSID regs\n");
>>> -            return ret;
>>> +            goto free_suspend_ctx;
>>>          }
>>>          reg_id = ret;
>>>
>>> @@ -1420,7 +1702,7 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
>>>          {
>>>              rcar4_pcie_osid_bdf_clear(bridge, reg_id);
>>>              rcar4_pcie_osid_reg_free(bridge, reg_id);
>>> -            return ret;
>>> +            goto free_suspend_ctx;
>>>          }
>>>      }
>>> #endif
>>> @@ -1429,6 +1711,13 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
>>>               dev_name(fwspec->iommu_dev), fwspec->num_ids);
>>>
>>>      return 0;
>>> +#ifdef CONFIG_HAS_PCI
>>> + free_suspend_ctx:
>>> +#ifdef CONFIG_SYSTEM_SUSPEND
>>> +    ipmmu_free_ctx_suspend(dev);
>>> +#endif
>>> +    return ret;
>>> +#endif
>>> }
>>>
>>> static int ipmmu_iommu_domain_init(struct domain *d)
>>> @@ -1490,6 +1779,10 @@ static const struct iommu_ops ipmmu_iommu_ops =
>>>      .unmap_page      = arm_iommu_unmap_page,
>>>      .dt_xlate        = ipmmu_dt_xlate,
>>>      .add_device      = ipmmu_add_device,
>>> +#ifdef CONFIG_SYSTEM_SUSPEND
>>> +    .suspend         = ipmmu_suspend,
>>> +    .resume          = ipmmu_resume,
>>> +#endif
>>> };
>>>
>>> static __init int ipmmu_init(struct dt_device_node *node, const void *data)
>>> --
>>> 2.43.0
>>>
>>>
> 


