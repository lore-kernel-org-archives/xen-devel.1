Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755C1606A328
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 16:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=V1dZ5soo
Received: from list by lists.xenproject.org with outflank-mailman.1472192.1680154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOdnZ-0004J0-DY; Wed, 04 Nov 2026 16:25:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472192.1680154; Wed, 04 Nov 2026 16:25:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOdnZ-0004It-As; Wed, 04 Nov 2026 16:25:17 +0000
Received: by outflank-mailman (input) for mailman id 1472192;
 Wed, 04 Nov 2026 16:25:16 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOdnY-0004In-Dv
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 16:25:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOdnX-00Csmt-Qw
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 17:25:15 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aeb5c65-2eae-0a2a0a5409dd-0a2a45038fda-28
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 17:25:15 +0100
Received: from [52.101.85.12]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aeb5c68-fae8-0a2a45030019-3465550c1c9b-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 17:25:15 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MW4PR03MB6990.namprd03.prod.outlook.com (2603:10b6:303:1b9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 16:25:09 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 16:25:08 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R+0mRhot+ujOiFCm6HlqoLqkC/YCZVVMpjjLqwbyccc6AYYszlojXednXRGUPhfRXCMzsNUQvEawvg/eGzYiHmrTwebPswG0zlem4Bf7zXgNLe1sT7unDDqxw+znbGpBbBU17BT2Sn4PgTym+1RrVJ9vlqgUOV8ego4AYhv1s7U1Kese+opOBWlLxSnxdYEcLGMLnvOejuvVWMrHF+8/BKPFSiUDgFuLsPlT/lbwR2xZiyCtZcz54P22ZueyFb1xCO06+VHXYU3Vm2HGGuEq3tRnM/ZHrp8K5bDphgZPbRVyW+s2QgbYLGP2GcQMqPznkyoeMM2NOczH7Izy3/WNEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zdig1zY0Dv5t/iGTAjx9LBXwCFIeEfeZE7pMk03XenA=;
 b=yl0NqiZI9k1XsJpFFPVJUyHa797Kz19WgxEWiSsUlPKRzr7FjixxPdO0e6pl+4fmNav0AE3FTGyFp5U15jldJtK98WPH4ueTmWKOvOhQ0MBDuB946w7EglwxhHTH7pBtL7Lu6LMDnFXDsdRf0aV9wyBJHGzOMhfXtvB9aevA3++UNdva21tYVuCyecEIljMdaip5g1QwgCeqxBjYGsCWGugcsts0pREFLMM5Y6sdTxzTZTOB8X/6PzinGEamM9G8y2/gck33XAhvv4VP1pDwwpWT4y6dHiEQOqSgNQNeuEe6cmamu8Sc12Y1wbGtC5zV4wGIc8OOM29KGJpELTLyig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdig1zY0Dv5t/iGTAjx9LBXwCFIeEfeZE7pMk03XenA=;
 b=V1dZ5soo5zQvshhkF4bfggl4fTzFeifIlRWwQjZP+52seYuJ3Kpk83W3bCR+fOCyfWRAqDJpeoNeDAKSPmW7DL7Y8NCbsJz/QRokkp9R2Zn+37XYTdQ/sVgha+YCEPYZxyAjypcJ9CRFs96E0rWVrD+WFrkW2LzXAEswmDQ+kNQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e63f8ee9-0537-4d3f-aea9-5fe2f356b86b@citrix.com>
Date: Wed, 4 Nov 2026 16:25:04 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] xen/build-id: Introduce is_gnu_build_id()
To: Jan Beulich <jbeulich@suse.com>
References: <20261104135133.2209628-1-andrew.cooper3@citrix.com>
 <20261104135133.2209628-2-andrew.cooper3@citrix.com>
 <9f55c251-af36-41e0-8afe-cb218d41f6cc@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <9f55c251-af36-41e0-8afe-cb218d41f6cc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR1P264CA0041.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cb::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MW4PR03MB6990:EE_
X-MS-Office365-Filtering-Correlation-Id: 9252a7cf-2ab5-4618-b1e3-08df3a90312c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10067099003|18002099003|22082099003|56012099006|4143699003|5023799004|11063799006|261022105027099003|261026140227099003|261028144727099003|261026121527099003|261021121427099003|261102123227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	4WwXFSti3PXpaSLCbQzBFNKVan+PrH88AzS3dbisTAeW2xAHUPElSPRRh3xIj+htPoUygEitr7Fcw2DR8o+BwciUW7XS6fQ/hOLDYfZoeo5Di0agUdQpDLCG6W5Y+dLPwrzmjWmn6FWdg3dsOBnJ7Fk9l/P+GskdqNEMqwK2RaiVgouM5LpAWmZLINQGWr+sOmRwhPgx7jduk2aWGredN5Sq1+zTb7EIMzajowvk/1UoffMiYIFcToYggPOrq7zBDowPSlL8uL/6RnAVAMuE5h7024UAL1OTj2PzJJPrY+hSSp7ozLP+hwF2UdwpbG04yx60dubCIcPaUgRC6q1QcshFAGGZWY6kGmgZLj6FxqFFtpNKG7XGNsuZktbIVbmJkUD4inss0+dqWt5YUM1/5s5ouWC3gEIqygIOSX+BskEIBWBQ9CSb1zdOJhnreO/g5HdlLvo+YOXBM7Pazsduk3OaxPIdhgpISKKRsJCkaGqSIkJw2al9BMOIS0M0vBk+Rc1kwZV4HFc2HuddWOedPMj+f76xnu+eCEXoCa4ByHH/cT5ZFgeJ9zmdM3HywPi0YlH9tt+WBed5QDtKROIXGOi+it481/OAKSu6pMWf2WDKqTAQjoFNt/GuwixYytpNe/InxdHZ/XJABGR/oihPsenLoO6hdB220BKL0ynjpJw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(18002099003)(22082099003)(56012099006)(4143699003)(5023799004)(11063799006)(261022105027099003)(261026140227099003)(261028144727099003)(261026121527099003)(261021121427099003)(261102123227099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnhVQkJnU0tvN0UyQzhnd2h0VnBDaithMUxzSlZRenpiRDBZdGhkaDBGcW0y?=
 =?utf-8?B?d2lnZUI2RzBVeHppUHNtOGNrT2lIZlpFRlVWNGhXQVFnWjBOYXJjR2hSNHh3?=
 =?utf-8?B?c1U1Z1VTdXhhN1J6QjRWS2NLdkNtay83UUU1R1Z1RU0zNzJOWDUyYlhMNjg4?=
 =?utf-8?B?R0FGbnFIck0xd2wrdU54MXVHZFpNNmdaUXZxckFoWU1OSXcxWmtuU1NrSkhi?=
 =?utf-8?B?U1RsQndyaWtUanZlenQ4SEtrVDNaKzc0NnF4RnA1eGFhUEc4eFpFZFFOSEJJ?=
 =?utf-8?B?V29QZjdxYXg2akZSZ2hUOUlFdkp1UFZ0NVNpNWV2V285cDRzWXRwcDZIRXFp?=
 =?utf-8?B?bWtPYmtNRmxyZWNqVnVNMFBGNFh3TG4wb0xHRkFOWCsyQmNkU2U5V2I0OTBG?=
 =?utf-8?B?YjIzUmowYW1IL2gxZWtZcmgzK3BHdXkzdnl4bDFCVW9xWFRlMFg3aEplaDQ4?=
 =?utf-8?B?VHNsSURzS3hFVjBwYUNXcjBMc3JaVUhzdEpJTlczRzNQc2hxVFNKZGtJNzhP?=
 =?utf-8?B?Z3hES0Q1OVlDeDhwL3V3MWtEeEVJRllMUW96NWhKb0xQaGZpbXc4RVBRdFFE?=
 =?utf-8?B?aXVOVHJSVmxVRTFEek5XYWVpckJMOThET2ZGdGNpRUYxR1V0Zk9nYnFNQUQ5?=
 =?utf-8?B?L0J0S3J5VnBoRUZnTVk2Z0FDVHZ2Ukx0LzhTOTQ1b2FkcVM0RDBGT2Jmck4w?=
 =?utf-8?B?U3AwOWRJQjVNdlRaMlFlMHZIdktzK0E2cUV5dFZLNkhBWDFIa082eXhQLzMz?=
 =?utf-8?B?RU1Sd05zdStqQnhIRmdhTlNoL3cxNTFpWWFUN2w0NWU0NFZMK2RWcUZjcEoz?=
 =?utf-8?B?clQzR2FZbklnVHZ2U21lNlMrOXFXanZIMzJBT1RNTHNUbEhQQXBsdUhRc0sx?=
 =?utf-8?B?REZrcllDQXlocVdCb2hiekF1T2dSTnpYWGNIRm93dWFJWDNXbTg1cHlyV3dh?=
 =?utf-8?B?SUNnb2lJSnBrZmllaWw3NkJsZkFPNnpnYkpYMVhUU1A5N3djNWdaMi9nWmF6?=
 =?utf-8?B?SWhtVGNSM3FZT1J3eUJucDVaeElDbTBud1hOS1dONGY3WDU1OUtBd0JqeXRl?=
 =?utf-8?B?QVBtVXpQUDMxN0habjFUb0ZUYXFQUDkvVDgvY0xESzVzbnBSbGxBMFllMGpS?=
 =?utf-8?B?aEtIc1BPd3ZWM1VVcFg3MkxjTXEvNTJEcllaZXo1TDBmMlFGYlJ2ekhyWWEx?=
 =?utf-8?B?aGloZXYvTy9HRjQyY1gxVnRscXNBRHVKd1c5dHAvTUtlN2JSQ1BkTXlKeGtl?=
 =?utf-8?B?OGRZZCs1Y3pYK3pHM2JOZ2tjMzNCOXFDU2NrNXl4WTU5cTJJTjV0TnNtaVoy?=
 =?utf-8?B?cUM0OXpaWndudGxsU1lBTzlRb1FVY2dhTHVWbmVScUVkZWo1cHUyREoxb0hh?=
 =?utf-8?B?eTFwazlVTFJMUnM0R2RxRStidkZQeU1rY1owVHVGZlpjNmtyVENLVG5kN1hq?=
 =?utf-8?B?bnM1RFRCVnJ6eExtblkzc2crbVBNWWM0MXNJNk5DVWJmMUczcmFvb3BjY0gv?=
 =?utf-8?B?bmNVeGtoNEZmYWVTcWp2aFZvTzNuTmIwVHZ3SkhLcmRYWjBLUCszYTZNcjhp?=
 =?utf-8?B?cjI0QlVNSml1aU9oUjVLUHlrV2VFZ2xaNmVCNS9oVXVWNjR4VnBTNG9NSkVz?=
 =?utf-8?B?SkVxamU0UTJ0M2s3N0xxQVdvUFZJUC91SHgzUmROa21UUy91Mms3SmZ4T3B2?=
 =?utf-8?B?OFhKVnNud1p3T0ppeDZBYTlySWpqMThwS29UdHpKeWozWmNLZEVnU3d0djh4?=
 =?utf-8?B?alFyY2ozNXZSS29xMFdpVlJFcU9NY0NsYjhtbHRCdk5zSnFEQlh1eWNiU0FW?=
 =?utf-8?B?aVhIT2pNdHdtd0lIM0lQUFdHM2pFbEoyZEZkNXg1TGE0SWwrRlZzS09jQTl0?=
 =?utf-8?B?Z3RnTkFtczNXanBHSWJXOEovVW9Td0FMU0p6cXdDN1RWekcrRU1QS0NzR0l2?=
 =?utf-8?B?aUZVQzVxY1N1RFFPWnN2SVVvVUN2UGlUTUJJYitEVHZxbGc5RWgwQVBoNHFW?=
 =?utf-8?B?S2g1NzQ0WUpMRTNVODlDV1BvK01iQ2p6enJrdjlZWHMyTkFaVnJGRGFWd2J3?=
 =?utf-8?B?c09GbS9hc202ZS9uK1d5V2hZK3o5bG1pRGYyOXdYdEhxN1JKMklTWEg4NzdU?=
 =?utf-8?B?STNUdkczd3R3dVNHTGpwTHhBZjNYamxDOHBlc25pa0tGOSs5YmtEZkdVYlJE?=
 =?utf-8?B?VU5HZStUeXpDYkZzQVcwbWd6a1RyZWREcnMyeFZhYUtjRXFVWjV4bG5SZGJW?=
 =?utf-8?B?U09WSy8zYlJLTmRNWkRUVXRUSFpwU3dVRFkyTzVoekdUcHNFcEtMcUIxVTN0?=
 =?utf-8?B?UDNDa0cwZVlMUVZDQ281c2lnYTQ1cnpCSXVPRWJFRi9sa0ZBL2p1QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9252a7cf-2ab5-4618-b1e3-08df3a90312c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 16:25:08.5294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hDd5FGREHM3l+vie3OmkR/KQfuie0JREBVRxE4QXn9OC9UWq42e1tRc6n5mEp+JodcQkQEmcnwYTTCQrkoIbv6dsGI6vcMh+iHMjJpOjNAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6990
X-purgate-ID: tlsNG-33051d/1793809515-6DAD44E9-B78EC560/10/78276251493
X-purgate-type: spam
X-purgate-size: 2753
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 04/11/2026 2:49 pm, Jan Beulich wrote:
> On 04.11.2026 14:51, Andrew Cooper wrote:
>> Broken out of the subsequent change for legibility reasons.  It will be used
>> to replace xen_build_id_check().
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Ross Lagerwall <ross.lagerwall@citrix.com>
>> CC: Anthony PERARD <anthony.perard@vates.tech>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> CC: Jan Beulich <jbeulich@suse.com>
>> CC: Julien Grall <julien@xen.org>
>> CC: Roger Pau Monné <roger@xenproject.org>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> ---
>>  xen/common/version.c         | 33 +++++++++++++++++++++++++++++++++
>>  xen/include/xen/elfstructs.h |  2 ++
>>  xen/include/xen/version.h    |  2 ++
>>  3 files changed, 37 insertions(+)
>>
>> diff --git a/xen/common/version.c b/xen/common/version.c
>> index 80e7a9b981cf..7eb8a0221d82 100644
>> --- a/xen/common/version.c
>> +++ b/xen/common/version.c
>> @@ -114,6 +114,37 @@ void print_version(void)
>>  /* Defined in linker script. */
>>  extern const Elf_Note __note_gnu_build_id_start[], __note_gnu_build_id_end[];
>>  
>> +/*
>> + * Check whether @n is a GNU Build ID note.
>> + *
>> + * We check that:
>> + *  - type is NT_GNU_BUILD_ID
>> + *  - name is GNU\0
>> + *  - desc is non-empty and exactly covering the rest of the buffer
>> + *
>> + * If this returns true, the contents starts at n + NT_GNU_HDR_SIZE.
>> + */
>> +bool is_gnu_build_id(const Elf_Note *n, unsigned int len)
>> +{
>> +    const char *name;
>> +
>> +    if ( len <= NT_GNU_HDR_SIZE )
>> +        return false;
>> +
>> +    if ( n->type != NT_GNU_BUILD_ID ||
>> +         n->namesz != 4 )
>> +        return false;
>> +
>> +    name = ELFNOTE_NAME(n);
>> +    if ( strncmp(name, "GNU", 4) != 0 )
>> +        return false;
>> +
>> +    if ( len != n->descsz + NT_GNU_HDR_SIZE )
>> +        return false;
> Isn't this too strict a check? Build-IDs can, iirc, take different formats
> (yes, this is under our control, but still), and I don't think there's a
> guarantee that all current and future ones are coming without any padding.
> IOW I think len wants comparing against the rounded up sum.

Hmm.  There should be no padding included by the __note_gnu_build_id_end
marker, but there may be in the section size used by livepatching. 
Still, there must not be any rounding.

is_gnu_build_id() needs to return 0 for failure, and n->descsz for
success, and this check needs to become len > n->descsz +
NT_GNU_HDR_SIZE in order to tolerate tail padding.

The caller cannot subtract NT_GNU_HDR_SIZE from the input length,
because otherwise the padding would be considered part of the buildid.

~Andrew

