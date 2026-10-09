Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B6BCA6019
	for <xen-devel@archiver.kernel.org>; Fri,  9 Oct 2026 11:34:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444271.1661209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xF8rI-0002Wq-4l; Fri, 09 Oct 2026 11:33:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444271.1661209; Fri, 09 Oct 2026 11:33:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xF8rI-0002Wj-19; Fri, 09 Oct 2026 11:33:52 +0000
Received: by outflank-mailman (input) for mailman id 1444271;
 Fri, 09 Oct 2026 11:33:51 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xF8rH-0002Wd-37
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 11:33:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xF8rG-006ml6-Di
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 13:33:50 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ac8d116-8faa-0a2a0a5109dd-0a2a4509ecc8-14
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 13:33:50 +0200
Received: from [52.101.193.11]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ac8d11c-be1a-0a2a45090019-3465c10be4b9-4
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 13:33:49 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO6PR03MB6210.namprd03.prod.outlook.com (2603:10b6:5:356::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 11:33:46 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 11:33:46 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dF44rZNriaKObqLfumqvjQSgS9vwSMk1CV+XG5UQ/HPnJ0cJRgKY4tRIm4xfJ9zfiITxIRTLAy+fERctOrrHwH7QmHJUeXdIpESv09TTNJ7bwBLkulKS8fgiFusuA4hLK1NAgb6ICtOI1BKwPdYW4vcPV49bSjasFgjwQ5tQ3qa7Dqnsy/EVyh5x1ReXzSHF38KqHj34HCgPB0Z+NMV5hLLk8oH2Bz4lsw9lSGLPH67gL7aHTlxdYWJVhhYwk0Ifteqo8mLG2eQRE/a0G7gZSso5PZnqjgYS1PXbelmBC7cH9U1W8+2KvnXkt25c8Fd35U4cwPVboQXguosscI9/EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/WyrPRdTuvD0r8LZkwdNqFuIqm3cqujM1UA8B6JtthM=;
 b=X6BLhmlMLxjrtbpoP3rpjuGcEe+7MpD/Us5YwNlHj/9S8Tmtfxvu9TMjrSjw2cdzv3V7Jn4XBKooilMp5LjhUWZwNn7yGeMdlJmiK33i3KpkfPCyVtw8f6PsLkNubmeV1eKlG9EbWFhbfLBpsVpcMRSGqqUwgxXwMlXkpbvfGEccCCeSSoiFS3mksd7d2LnzcaCtso+Py+9ZEAnLyTmKf8qozuXUffWXIWEhkWAXfZZWQbU6lEFvez0Nhu+/QkzXPWXkw5CNLRA9HznN7aKk5dhMge0cMG0Z82H2QWneRMRZA7xv27PsqJbEBADTSzi5cAxemS1jC/Lo1o3KBwr+YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/WyrPRdTuvD0r8LZkwdNqFuIqm3cqujM1UA8B6JtthM=;
 b=FgqcLgoMk3Z2zHNX2eowQaZ+K1rGDL041GQUAF8N7LnsybMcogkmeLsUk6KAd/o/oi8VnKWcpXgd7SN/W4MKcevpzDnPVe4JdOVwAuNXba4cEmUrcpfJB4Es3y281C5tfQDBIO1xB1OH4/QGnO7JYoaLsMDCHV5vfZiH1yNLPOo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <64b40c8f-81da-4481-85a6-336d0a89a21d@citrix.com>
Date: Fri, 9 Oct 2026 12:33:42 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jbeulich@suse.com,
 teddy.astie@vates.tech
Subject: Re: [PATCH Linux v3 6/6] xen: Add new Xen pv-op pte_get_and_clear.
To: Juergen Gross <jgross@suse.com>, Kevin Lampis <kevin.lampis@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20261001174749.2275245-1-kevin.lampis@citrix.com>
 <20261001174749.2275245-7-kevin.lampis@citrix.com>
 <7778808e-6963-479f-9cfb-a218de0c382e@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7778808e-6963-479f-9cfb-a218de0c382e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO0P123CA0009.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO6PR03MB6210:EE_
X-MS-Office365-Filtering-Correlation-Id: bd4c6e9e-edaa-4e5b-0dde-08df25f92e02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	OpdzLCiOuQQ268bfzd71a2g/OWjmvZHM7gyQeLVlchThZstlMbaRt3BlTRTRMgzFIwhkUBwookCCXt5anc1BwvVA4KYQtxfv4pn7U7PaSiXBr+86XP0vdd9BixDrNiwXb9jmDOX3WzsiD87cc/aRVXU8G98LCsNXeq+0Sgbr0z+eBl5PXTCtqPZ3veGkyWHtpG6zRxmauJAxw3OK2hvW9md0/4dWdhBtWUXvFfVcEinYrbhDgaA6g6AG/sQnyYkgvMRQmneVgghKWy9J3c2QhkC4KAxImOxXm/hYqVqHbd1gvDu3o0Eu8Sa6C/Gj3BuyGKV37UuAOjRQiS2RiygsTogLQq1Hg1DRDsx44yxMAt2CvSw9rmNIK6R2mjw2UNJmrZtYuHsJc+gnjWs/bNbT6SEOb5O7TQfbBjwF370X/gtmLa8GDSbcLKfC0pGK2Tjy8p/uwS4zYrsXYh5KHzxyrqK/HgpxqexEa7pHYjr6MhoIpJ/ts/TIvRbfWmBYim0KpEyfz69z+GsYc/uqlRftp9oJkAWGuaLLmzV3ZY4DJ3HQfbZaxcLv9FQqBCABGMY8IJ/77omEvhi1XVqxzAzUxySg3tfiLt1m6gtdcu/mr05+L8Tf6KteV1jhudEcjp1msRMj1v7q/5O+pwn2AJ0/KdXecVnKeC/hdy0UXRB3dnE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnlpbmNvUVh2aHRmek9VMHUyK0sxOVRkM3FlT0xEWlJSYTY5ZlJQTkF6Z29P?=
 =?utf-8?B?ejMxTklVdks0eU1VQ205TGp3R09OUGpqbmZEVzdIb3piZ1JXeWZjMUdON290?=
 =?utf-8?B?Sjc4a2E4cnRGdU01UHVZUVhTcVJYcUUxQTNSL284YWlraStPV3RzNXhhQXpt?=
 =?utf-8?B?OU1yS0xMSFk3QTBKeVdXazBEbVBoSWhiZDREV0oydDRKMHB2MFdTekJKVGkx?=
 =?utf-8?B?a2FDcVd0NUdzSDRUMHRYbVZqUzgzNHpDYkhOcXR5Mis4b1c3QkdtT1lBRG1H?=
 =?utf-8?B?MCtkTVdqa0ViOHllK2wzdjVnOXB3anI0SVpVTElRWTNtR1VkOWxka081amZp?=
 =?utf-8?B?WmxMOVQ0ZTkxUnEwamRxSGIxNlVTazZpNkxnMnR0dDBBS1h6eXhzeHpkMi9F?=
 =?utf-8?B?NTJlUjl3UUlhalB3R2dUeEVYZGpVcUdBbVNCUDI1QXM1b0swTXIyTVhyKzgv?=
 =?utf-8?B?RXhtZCtqWUcxaDlpM2dQTnlYQkVwYWw1eUlLZTNPY245Z3FjOEVpUXhzNTJn?=
 =?utf-8?B?TG1hWjN5Q1dUMnA2V1liSWx6bUJyY0FITm42N2xJaE1jQ2NkRWRiTVYzS2ow?=
 =?utf-8?B?UE8yNmFQcVhRSVBwWkNyNzViMXRYSHlyd3lvWVJxSHZNdjA3YnhSdHorWVNY?=
 =?utf-8?B?RjRBZWt6dmlmL2IyU1RmZG1ZV2QxWkFKNjBiSE0wclMyTFdiemZPQjBUd1JY?=
 =?utf-8?B?SHhLUitFSUp3eGZEbHNsc1Y2bktObGZrYlZIbElPMDczcDR6NjdlTnZFQ0Rk?=
 =?utf-8?B?ejZzaGJRNUgraE8zbWljRjdzRDFKM2JscUhxbFdGOXFBcUZGRUVLWTkvdHZF?=
 =?utf-8?B?WDBDaEJoOEVjSjBYVU51THJjK1lmRXV0Vk5OTlZ4aCs3d0ZCQytHZUgyZ3pD?=
 =?utf-8?B?YXIvV2V5QXpaWElFMitvQm9WTW5pZGhIZzYrKzVzVGcrMlhuN1hLMFFTbzRh?=
 =?utf-8?B?MHRIdVJzYWQwbjdIdzYvYURqdHFIaFoyZmZYOTlBOXJRWnJvMyt2a3podW9w?=
 =?utf-8?B?ZUUvbDJiWHVBOUE1TTdKR0p0cVAyVjhLVjY3VUEyeW9hSjFwZ2JyV25VUXpz?=
 =?utf-8?B?NnE2dnZrSVBzRkhONXZITWRLTDlkTldQVTNQUHVSVmM4WTFqcTQ0R2pqVUFD?=
 =?utf-8?B?MjlybzNTa3NNMEhUbFd6eHdnTFBWNHpYRld2OXlQMFRNQkdNYzdnVUhhK25M?=
 =?utf-8?B?Q25EN2JOeWFNVnZxWlc2bFNnZ00wWkFJc29aNUdWQmFVSW5HS0ZQMmg1cURl?=
 =?utf-8?B?WlY1eW9mQVZCRlhOR3JyK0VES2NWMzBpUmNic1lFeFBvSld4a0wyTHU3dEVG?=
 =?utf-8?B?dVdEeHFHZ21hWXhmdU5oeEJ6MksyUDBQR1NRWVFqdVc0dXJGS1lGQW8yUGtX?=
 =?utf-8?B?Tll1eWF6TG1vRkNqbXRSS1FZRW4zWTREWGpEbXFqMXBXSmN6di9Kc0Q0WVdu?=
 =?utf-8?B?MHJ5emhQQmM5QmdUaEdwWWtObmVWbXQrYkN2Q1FVNVhJRHI3SWhiSFRSL2NP?=
 =?utf-8?B?R1l1cFE1Zmx5WDVhMklzRWNMLzNkcFVXVlhablVPOTRrcTFiNHNCNmp6bGl2?=
 =?utf-8?B?a3o1dHFSMVF4V2lxSi9icTNDazZOMFhIS2dERi9lZ0NibDk5NERxN0trZ2U2?=
 =?utf-8?B?dSsvR1ZYbEw3WTVxR3ZtNS9uUnJuRjhKL3RqYmFTV2JMelZyaTdyNEhHQStB?=
 =?utf-8?B?YUlvMHhaR0NmMFRFSHAybUJ1N0xvdDI5N0xveGNUcWJXa3ZYajNNT3pZa24x?=
 =?utf-8?B?KzVWMEExc3BLRkJIWDFRc1h2SmJJYVZVZXhld1VaWVlqZnh5bFJYcVpXVEdz?=
 =?utf-8?B?OXYveWo3c2VINndRRUt3YVdHNWVpU1Z6dFpDandyYnZENTJvOVlnM2lZbEdy?=
 =?utf-8?B?SkYzVDYzb1RUSUZIZG1EQ1hKYWxPWmVJNlFjWitIQTdRQjdydXVUam1xYjdo?=
 =?utf-8?B?Zkc1M0treFRRSC8zaWNheVowUlZTUFRhTDYyMk1LOUhQMEFORHlDeUpJeDVa?=
 =?utf-8?B?b3VrM2NLdFdOQTUvSUJCT1A4cFFONWlYN0RwMTlYMFBKRkJSSHczMDNUcTBG?=
 =?utf-8?B?OEVoODhhOEJIR21sdTlyYUhqUXNhUWVkWnFUc295NWx4alV4ZzFEOHJ2Wk4r?=
 =?utf-8?B?dkw2cXJCZlRsODlkRyt6RU1MdnZYa1ZIRGR1aXd0MERyV0huUkh4Qi90TmJ1?=
 =?utf-8?B?ZDQ0dmx6aHgxUG9MWk1nNjFLdmZCa0VYMGpYdVY1YldUY1Evb0VFanVMa0J4?=
 =?utf-8?B?NnZyTjRNbXBDK0N6RWVPcitqMGV6T253VjF6NWc0ZCs0VmdCL2ppTkNNTVg4?=
 =?utf-8?B?eStvR2lWdTMrUjFXYkdVS3lqVkk4L2tRUmwybmlMZDlUQXRUbVhUQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd4c6e9e-edaa-4e5b-0dde-08df25f92e02
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 11:33:45.9641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ywnQL7bwNCoEI1jwYqBsqL96MuuX7UaUjZRwA0C2dIlTPsyFGBbUxRXKBfcMxlxvwQ8CI4ENQZH52UKmB9JYMWQ8y6dmxrVIzMNA3RNCbfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR03MB6210
X-purgate-ID: tlsNG-bad1c0/1791545630-3B4D3034-3CF379B9/0/0
X-purgate-type: clean
X-purgate-size: 738

On 09/10/2026 9:27 am, Juergen Gross wrote:
> On 01.10.26 19:47, Kevin Lampis wrote:
>> If Xen supports XENFEAT_mmu_pt_update_swap then for performance reasons
>> call mmu_update with the new MMU_PT_UPDATE_SWAP flag instead of
>> native_ptep_get_and_clear().
>>
>> Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
>
> Reviewed-by: Juergen Gross <jgross@suse.com>
>
> I will take this patch when the Xen side has gone in.

"for performance reasons" is of little use to people reading the patch.

Can I suggest instead:

"If Xen supports XENFEAT_mmu_pt_update_swap, use the new
MMU_PT_UPDATE_SWAP instead of native_ptep_get_and_clear().  This avoids
the the pagetable write trapping for emulation."

?

~Andrew

