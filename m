Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C97606A323
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 17:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=f++2UuCG
Received: from list by lists.xenproject.org with outflank-mailman.1491343.1692175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT0UM-0007by-7h; Mon, 16 Nov 2026 17:27:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491343.1692175; Mon, 16 Nov 2026 17:27:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT0UM-0007br-58; Mon, 16 Nov 2026 17:27:30 +0000
Received: by outflank-mailman (input) for mailman id 1491343;
 Mon, 16 Nov 2026 17:27:28 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xT0UK-0007bl-Op
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 17:27:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xT0UK-00CpG7-4y
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 18:27:28 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6afb3ce3-8faa-0a2a0a5109dd-0a2a4506c700-44
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 18:27:28 +0100
Received: from [52.101.56.34]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6afb3cfe-195a-0a2a45060019-34653822ce69-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 18:27:27 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA6PR03MB7950.namprd03.prod.outlook.com (2603:10b6:806:432::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Mon, 16 Nov
 2026 17:27:21 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 17:27:21 +0000
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
 b=wStmPDkOkbahI4aIlfdQX9Go9ZAVBjlY+QSiC1LpeVSNNOR28lfVu09wjj5k5Zhmgf3DTuUbSHSIhUgStGvJcYRhBbgFzdB/A0NHIQZKS+228328hYaq3xuZIqD0w0hzXDAQHGdAh2IrTjbQrX9QPmqPunUFznCVB6DqERuULa7Qfnnfh5u/Lr7s+Yida+boiGnCEsN/ZjemKrW1zXgb4MLzd/B8yum+OQK8xWl3xhIx9eMWRp1HkSn0sFku8IlMS/fm1Dg+IS85kkCDvsqBFoXAdjAYEf4dKGAcBST4Ac2GHOu62aFvhbRoIFQlP+8phPdK7zSzMYX+6BIDky67xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I7VyZ0E9T178nEzqqQkuwsaD+DcwoFaqI4duEm8u6XM=;
 b=ifrLG8RGlQrabE5payM8pgj2QrBMCw529JOWVoDMrCJx3Xnu3EGbPe85jF+VvciIdl8QxBx3DDQ5D1+MI9cd5naWcJ7lqOYzDxQIIcONzApUhw2EI8gYa6b1bWqsZJBtad/6ekQ56X7E4bFRmk6hzckXcIAQwe31aBRffNXxDX3J5yIxrijOjoOL9+j20sjpbelM8LMOD1QtDoy+Y3fVu1mzlb4QBOU7Dl6MyXBxzLaj0XDmxU2BLadqG9dbsVHZ4l1MTlIX1IN0fuShXBS/ytFYFL1pAXmNJi/A4JJssg3BGY+SMvRM4PC0nYeJQuLpEQJhDQdbJMU8orvsDwbzyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7VyZ0E9T178nEzqqQkuwsaD+DcwoFaqI4duEm8u6XM=;
 b=f++2UuCGrxVEeHjCony0Rtp1sl0AZvRhwR8/QIPTYx2K134FVFCGtUcTWXfsv9Tng0RWHvImfo3R1OG6z/34e0W/B2ldivOXX7KUDGU7r3SoHC7BWF1Ppvj4U1CwPLi2xBKE8OYIet+Ii2k6UsGmgg+HJYH2FfAOBxsKy24a3oc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5f9e8365-74c4-43a3-9732-109905b7eee3@citrix.com>
Date: Mon, 16 Nov 2026 17:27:16 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v4 1/3] common: introduce "brk" allocator
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <640c0ea5-fbbf-436d-b150-4537cbe98fdf@suse.com>
 <43e47410-7d5c-43c1-bff5-8e1ce3746b7d@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <43e47410-7d5c-43c1-bff5-8e1ce3746b7d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0103.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA6PR03MB7950:EE_
X-MS-Office365-Filtering-Correlation-Id: e949ad75-2b2a-4607-d03a-08df4406deff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|6133799003|11063799006|4143699003|10067099003|261021121427099003|56012099006|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	+bHtweNPwYTmVDg72Vvw+IOlVweFLuTC7E0jp+spNOHHvxsWqg2ZwFEQKoDGlmbO3tcvehSr8w+lNmS5Drjc+5EPQolx2oW26BJ8629SdiMSfD2KlPU2HBkvcWV/8xbdsRDKmR+V3jpW3+n/7lkZ6ob4Fg7rIQpEEfFfQi0EW9T/l+eT4l2V7CS/Id+2SDT60Z1qOeI2Svj14sRCuZGEiJl7R2BH3gIfyH87rNWlEKfgOcLr2gV7vhi+zWhc7EP1s0nLE+sX8RdlURJpb5pCm5zNVTyzoO3R4HHFx4fMX/w5pGZq58bAmxxpPKRkHAgZG2wMKVhs4nEgJFQWmBxkPzFl1C0267AF+vykVjhxXhC4CNlplGoZlvlJRZiOVf2BhhZgvAtBy+NAyinRltMsvyGv0OJrOhfP3K9sjuEGqTUHS8aHM9/b8gifhcBt3quXh+zE81Tc83w5yfazbmtipnC7Yyau2QC6XznpWAswSDuwlA00qjwCZPg2NCrPqj0lrilxHx8LhPRdwPSDlvJvgx7zMimMxKn7Z1m+e2Rd92Op/G7aIeP6rtX+DIlTnZ+uDOyfcuBUcpV0tr0rIVGRJnKszXTEf1RfIU7jYSGlmhTTh9y87fgmMUj+2ZKJO8vey7d9WF2yoZWpC4e0dAocVPbtk0P7vQTNsM/sIRW6Lgc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(6133799003)(11063799006)(4143699003)(10067099003)(261021121427099003)(56012099006)(261009223027099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUxYdWdteTFKNldmVVBpVFFnRzkrQm1sVHNEc3lLNEcwaVJPVkdqRjc2NTBW?=
 =?utf-8?B?VHJJdnQ4WUdKemd2Q2c0Q25ZTW9ibStyeVh4L0xybmtjSlRiQTR6QTdhN3Rx?=
 =?utf-8?B?akRwYWl6WUNBeDJLUVcrWlBMeEQwbGFSZldHdzMyTnJxaHJhbW9ITElXQmVo?=
 =?utf-8?B?TFV6S1FHN1ArRHVSdm9QU2NGNWdVNWV2dVhsMmY3UGFkdVRIZ1p4d3o5Nk1a?=
 =?utf-8?B?MFB6UDJ6c2ZqeUZTZUI0REN3YVp4dENIdEhhdGRaazUyZzdYT1A0dHdQVEor?=
 =?utf-8?B?Qmp3ajFkSGthNnhJZklJck1PRzVzVUZOdVpmV1pETXZVZDQ5RzArdjB6OG04?=
 =?utf-8?B?b0ljeTlvWStLUnhwd1I0Q2lZTElNVEJGVUZMYUhnTENxbUNndktzMlZ4a29a?=
 =?utf-8?B?OHczcGpBY1lGK3BSRjlteHBkRjA4STRGVkNLUEdqUm0va0xtWXUwTFo1Vzll?=
 =?utf-8?B?eTVDRXJjL0svanR0NENHS3RwQmhEQk5KMFNPb0FLWHZsazBCMDhxbzMzSlVH?=
 =?utf-8?B?b0xPRjlQNitoL1pkb084VXlZMWxCNjJGMjJCTXVVL2hSL3Z1bm5BL1BPRDdX?=
 =?utf-8?B?eGY0RDhHVW4zQStaNzRIU3lKdFRONGJqSXNUREJqVjlicmpxR3Z0M1NuTlU4?=
 =?utf-8?B?VGxISlVDdWN2V2Z5R3FLdFB6MG9uVGk3R0tOUXZ3SndjTFB1dlVWSDVXZ0hh?=
 =?utf-8?B?QzEvdlRzeFBaR3RYVHloVWVobkY1YkRzREJXSGFDSk96VkU0Q09oNlJIL0hV?=
 =?utf-8?B?cjNmM043VDhKR3BDM2NqNGFuSWxPaXRyUjhObXZsS2s3TjdlYTBGdHdBc2Zz?=
 =?utf-8?B?aC9BSTc5QS8zTnphZ2w4elpEck1JeUIzWXhkS3FHaUdHY2ZQc0JSK1loalBP?=
 =?utf-8?B?NVZvQ3RKYVIvaERkdmlkeWFjTHl2QXdiOGg5RFdhTEFkQlhoN2FWZ2t1dTMv?=
 =?utf-8?B?SE1UMGlkbDBEaklBODNIYzZXdU5wVUZpSS9sMmJzV1VpUmVEemxKOEgrZHN5?=
 =?utf-8?B?T2dMcDE5ZmRlZHViZVJzRWpYMSs0VEs5Rm5aK3k3akhXQ09IU3pkK3RmbER4?=
 =?utf-8?B?L3ZkekJFeHhyOE5aQ1ViSEpjVVV4WS9jczU4NEpTNC84ekVXdWZ6Yzh2NTYx?=
 =?utf-8?B?NWJCSllSOXBEMk5FdjBTVUJhS1pIY1g4WFlvV1lyL2JYZWI5S1I3d0V4RTY0?=
 =?utf-8?B?K2JHUmNodDduVk5rbzJScFB2YW5hOXhzVGEwTTRrQkZqZjlpczlOdElkVlM0?=
 =?utf-8?B?aEwxRVZJdGwzcjFrV3RnSWt4WHZxc3dpQmU4VTE4aWxlSkl6R2tqbUlYQUFK?=
 =?utf-8?B?d3Z3TjVQQ05nNlJKaGdibVBkZGtkYkRVWjV5RC9HVWg3RW1jaFIyNGJ2NDd4?=
 =?utf-8?B?RWF2ZjVMN29kUzVMaysxK1hlY3ZmTGJ5bXo0QmpZZVhxR05rL1p5RG1EWFVn?=
 =?utf-8?B?QmdBQ2RCWjFONlNYOEJXc0xvWFppdUNZSXJYMmhjb1lhSUlMb1BCMld1a1Nv?=
 =?utf-8?B?VFhrcE45aTdFUnlJWkdmRGhPNE95RGFOYkd6dm5NTE5WVFNMUWU5RzBTYnFJ?=
 =?utf-8?B?QjZCbkZOUXdrOXRMRlNPWU1TT1dmcFBvNDczTGJJN0t5YlF4NHE0Y0lpdmtR?=
 =?utf-8?B?cS91M2NoWUVhVTNrL3lMeUtsZ3UwVWYwbmRDc3VQNnJVMzRlVEdzOEZwRXk3?=
 =?utf-8?B?ZEhWamlxdnJaSm9SQlIzYVpzUHJScnNhRGtuRUlXOEI3MXRxaGczODhkcWNl?=
 =?utf-8?B?RkcrMDhaSXJPS3AzNHcwV3dRTklvdTcrV2pXRUExZlB2L2hyZ1BKbVJNckFC?=
 =?utf-8?B?THNpK1UxWG1BN3NZWlJjNzBIa1QyMTkvWE1NWEhiS25kZC9uTFZNZ21Qdjdu?=
 =?utf-8?B?clZKNlVMMG5GWkUwaDUvcnF4RVJVTmdqcDlzaGR2aEdFNVl2NncxL2dEcDkw?=
 =?utf-8?B?WXB5WjFseVlBRis4cEFxdDFndTl0ZCtlK05XQldRS0N6a1pmS1BtVXhYYTk1?=
 =?utf-8?B?Q2lEWms0VXlEYm5DckZjQjNQaHAyN2pXUnpQRVlsQzh6ejR1T2NVVlZIaTFC?=
 =?utf-8?B?UTd1VGc4NFlxZENsRDdoUmt4Q1lpNDk5R3lJb2hjeVdzVm4rQW9KekJXSzlz?=
 =?utf-8?B?cTFySlAzUnZpNjVOcG8zWHpUT1FNU0VxOTIrSnYxVlFXb21Xb2oxMHJyZEgy?=
 =?utf-8?B?dXIrR21oRjZzZXRxNFBicFJldGY3M3R3WEN6dHh5SGJBcmhrcWtIbFhVdU5k?=
 =?utf-8?B?TzA1MXB3YmE2dk4vQmExSlRPS0hXUmVTcTM1eVl4RU9lclVrRjNydGN0bHlt?=
 =?utf-8?B?RFpLejhISDU5aTBxSEkwejJlZDRJcFE4Z2NxVWxtYzViTjZvSW1LZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e949ad75-2b2a-4607-d03a-08df4406deff
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 17:27:21.3381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rfznmYXE2YMKMxOeoVURVfGDvmesUkC6tmuQ64CqXzmMgHEIcUiRDe7GAM6DEWyze/fmgq/vYqtayVcDK3Ua9uy8c4+ck5sJLrQwhGTSzig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7950
X-purgate-ID: tlsNG-16d1c6/1794850048-1F6C877B-D8C8A6F1/10/78276251493
X-purgate-type: spam
X-purgate-size: 722
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 03/11/2026 12:49 pm, Jan Beulich wrote:
> ... to replace (on x86) ebmalloc(), and then to find further use(s) to
> allow recovering memory which is needed very early (and hence needs
> setting up statically), but may not fully be used (or not be used at all).
>
> Note that unlike free_ebmalloc_unused_mem(), brk_free_unused() (once
> other code is converted) will be able to free part of the BRK space even
> in the xen.efi case on x86. That would happen if BRK space extends across
> a 2Mb boundary, and actual use stops before that boundary.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

