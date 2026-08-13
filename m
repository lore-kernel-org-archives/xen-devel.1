Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A2DC5B572
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 11:08:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389813.1630435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuTIQ-0004dX-Me; Thu, 13 Aug 2026 11:08:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389813.1630435; Thu, 13 Aug 2026 11:08:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuTIQ-0004dQ-JB; Thu, 13 Aug 2026 11:08:26 +0000
Received: by outflank-mailman (input) for mailman id 1389813;
 Thu, 13 Aug 2026 11:08:24 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wuTIO-0004d1-PK
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 11:08:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuTIN-009DCR-TP
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 13:08:23 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a7da591-bab6-0a2a0a5309dd-0a2a4505bcb0-38
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 13:08:23 +0200
Received: from [40.107.208.37]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a7da5a6-4cb1-0a2a45050019-286bd025e58c-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 13:08:23 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB5943.namprd03.prod.outlook.com (2603:10b6:510:30::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 11:08:19 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 11:08:18 +0000
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
 b=K304yXvN0DbrSsP/Ph1r3Z0SrbowSVfhJCULuowEZ8yWx5hlix1bRwFDj8eQXJtpoKgrQ0gVCqmDubfyQhnKhAwEXajC/gT3K0vRnYiOIM0VzuATa1aU84+spcvkccx4XKhZmAtXKLtU5zWKG3tMiS1rT3gDCLZfFUD9u6qbRkRZxyMw41RaGHQaW+2UZLQV8TMXylR7Btv+ayvVNhT+a+Og7o/KdWcSUn2k2jIo0HKRoO/rxFRculTKKb4zCR4kIzmRjrPXb5LFk6oP5WQzcRqvP9Jko/bBMva5n7V2Az0VIRqZLJxgkdhC90CSHl3rt0etgD2LYzcdjvfNbQScCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fP4Dn4jJEnXWShuvzhONrYUAYiSFmhWmuI9URrlL1xc=;
 b=lVI1RGryOAwSbi5OzenhhsuIUtZ00QZyyCYl12wG5ej2Mdk30jCxp2eOmdEpNxURbDQ9uTQD5DqXgGVED+YXZIuMo5lSgpw5z7zDtL8QJVErGT0MLUAPMniPaT1Z4OWU2sOotvm5xO/MCKWly4pbk+O1mUP84WkKEPEXsaf4fFarA9jmFm70oxL4PUxtT6J7rOYfpqhflRLW7A1gFs+ZWCI7B9FigSxQmgtI/l0V+IvN2hGb/gIvNTrvT3taEVsnvx750ENzaFXxe2pZI27OBz+1zi4ZuYAQyUXWqMNUipi5PEJmTSAjh8s9WFgNs+LbzdulwZjTHmrMDXrnBL+8iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fP4Dn4jJEnXWShuvzhONrYUAYiSFmhWmuI9URrlL1xc=;
 b=AytohIxFfP6RDPtSmMDajELvS48zQZIH7p3uM20ifXwsGRpZCXej75GWsx/C7aGt1pxDwq8/65y/WJClZJ7Tyf7LFr6mrR5pFQDZkLVYYxReTC7hIDIRvf4lHdA/3MBUs2EH71qPJeJB85lNKUMEjSAO4Om5E5Lyaz9nCRfaooc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d41d0fa2-7273-4723-a5e0-6424d030cf0a@citrix.com>
Date: Thu, 13 Aug 2026 12:08:14 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v10 2/10] libs/guest: move batch_pfns into a separate
 structure
To: Frediano Ziglio <freddy77@gmail.com>, xen-devel@lists.xenproject.org
References: <20260810103018.54564-1-frediano.ziglio@citrix.com>
 <20260810103018.54564-3-frediano.ziglio@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260810103018.54564-3-frediano.ziglio@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0317.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB5943:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ca0d4b1-8cd0-486f-0c27-08def92b2e0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|18002099003|22082099003|6133799003|4143699003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	3hlIQ6rviX5XzZxzYzJ2Dlhh1L7muI7A7OklvgYMnKMN0PMjVMuFA/2pye8GfXMUH67Nb2rBI8vq/587XCmOw2dz4qY0J5rPSuXtP42Eh/X49uMeWXou5u9W+WhjsaFVMKuJYL0fGFEC5Kk4NsPvBmYSHZpuy/gfTNnrvSOR/Atv+C0J1J7tHImxkFDp+weO2BQTsYRbFmnuLvI7ImWtmMFb6k8yPd2EWgYPFvQ5cqWGtt6XbA7BWE83MUVdclAneP62ZfQRJoHokpWHYRCz19VX8U/0ZjGYWCBpaCziFuYjvZ0OohIVjEjv05RaehqaxDvbjZR9fAtC/naOuh4OhYduZRRVRNg3nstKSm/OpoH17onYHcb3vAgpNqQJV7atNe7zMSOSV0JRg06YPAXEORIq5eActSMSE8nq6kCmN1843eukevRjar6GiThvViHBYGpada2Qqzd4m4CWlJ7yKLPzML5jeFB31snLLTCrczFMQtNyrRwfJgI1gUGjZ55C3y8KxNn/CwvNBYiuwxUp9RCZQiD4J2E7icZWKhDh3DE/Ze678whCvhBu7u82Mg/jox1KoVu6fMLstf/mL/jCAxEgZVXNmVucj8hJzwSZ1MeV8RUHycp6i5eB283ztHE1KsHaEsx9lvB7d90yCV+zIW+C1fbfT3Xth9kbMkMsMKs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(6133799003)(4143699003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUxIbEhZSjZpelNsVkUvRzNFcU1ueWVrZ21WbFRSR3JrcUgyaytqeWZJQ284?=
 =?utf-8?B?RHVJSVVac3F2Z25qcHpkTzVsVFdvSnRCc2JHZ204TkN2blFvbklJTzd0ay80?=
 =?utf-8?B?TER2RUs1cml1WHdBZCtjaUV6UU8wN1doelpTUm5RUG4ycTZEKzE2cHFYelNF?=
 =?utf-8?B?U0x6RzVzcktUVHhHSDl0YTVqNGJMaWFRSlh2WExQc3JNV1V1TmlKSVJkQVkz?=
 =?utf-8?B?OGR5OW1ZWkxxY1N4Yy9tS0VYWmswSVQ1S1llWm5mUnhXVjdmODhMbCtWblVm?=
 =?utf-8?B?WjBZZUZZSHZ4S3pHREpvUzV0MXVnZXVtaHpTWm1GcEplbUVCMXlUQm14Yisv?=
 =?utf-8?B?SjQ3b3gyeVg3UUtMdnR4bFNMdm1YL2JmY1dLbVlyMTBQTkdoNHpUQ3B0SU8y?=
 =?utf-8?B?TTdVSnZ5eUU3VmRjSjVZd0tKd0FiM0VYdHQ3dE1pS004dlVFUFFOM1BGa0Yz?=
 =?utf-8?B?QWR5M3RJVUhsNmY5WStUUWFmbFFONWFLUTBJZDNpOWpEN2R2ejlFQnNzVVNF?=
 =?utf-8?B?SnRVelkxQytXLzV4NmVYcVJhVkRIM05uQXB6b1Evb1ljeVpVL3hYTFM5bFE4?=
 =?utf-8?B?Tit1aXc4K1NIcTR3cTdtYkhwVlFsRGZkL1BpRktMVmlqRUNqS1BBeGs4cUZE?=
 =?utf-8?B?NDU0anpKWkNLekJVUE4rVElKMFgzYVBxMEsrbmJNVHU4RDVhUC8xZWQwVms4?=
 =?utf-8?B?U3pieFZLUFMzMENGVzRzazF2b3doZlZzNTR0VVFQVUdNdU9oMUhhWGx6OThU?=
 =?utf-8?B?S3p5SkZYbk5kaXg0aXI2TFlnQW5vRXI0MnhLelE1RitmQWdBOUlyQjdWVGth?=
 =?utf-8?B?V3VWMUZMUXZpdlV6Z3pxWExzMThzRjRJbk5vRy9xb08rREY2cmtvQ3RzR2lH?=
 =?utf-8?B?Qm9yQjVORnpoQTJpWHY0QmZLdG9rZC9BcjFMeHoyOWlMRXVVQlhyd1dyeTNv?=
 =?utf-8?B?cGxlU2crclVoOGl1RE9GM1FYME5sUFJqN3Voc0c3SVlZRWMyRUNsbzd5UDdQ?=
 =?utf-8?B?b0hRL0J4ZUdERTkwWVVxeUtnY3RBZm9WYzA3S2Ftd0s0WFIrM3ZIejlXTWw0?=
 =?utf-8?B?a3U5R1R0b1h0RzlEaWhuK2IvZ2pZLzFERFFNTEwwVWsrd213NGRWR1cvYm9q?=
 =?utf-8?B?eHFLaGh0VGxCcHlaLys2Z3lPZERicWtveEw1cFBJckRzYWFmWnRDZXQvTTYr?=
 =?utf-8?B?SFh0YUJRcXlPd2ViQ1hBbXpoOWp2c0VpYi8rL1crSkVJUVNlK2xXL29qNEx2?=
 =?utf-8?B?T2tZMUdlTVBhU1EvQ3lZcm1DWXlPU1dXbzk0MzhZNmVMa090bWY4ajJIbDc2?=
 =?utf-8?B?eUFwZFRuY010RkdlUWsrYjA2VnZIYlppZGNSZ29NZFUza1JtSmZ4cDBMYjFs?=
 =?utf-8?B?V3BXKzB2blk2L3BDTnN2ODFYVityN1FoVExQMjc1TjU5TXE4dGhpSlRPUTZz?=
 =?utf-8?B?UzNhbDJEeUI3Y3FJLzJJenBBelROejJYekRLdklnYkFDcXFOYnVwRElTQVp1?=
 =?utf-8?B?ZnpBUEZ3dVI5TWp0eWNzZC9NdnRPMGhiWUdYdkZKRnRmOFZtaDducitnNGtW?=
 =?utf-8?B?Y2dFM2pDeVJKZXJyUkQwbm4rdEgzZU1LOHdxZFhMdWhtSTZjQmtacXU4OXhm?=
 =?utf-8?B?bjdubU1iblY3VkxFRDJsOTBSbU9WWlU4NTFIOW1CZ2xBazM0MWhjSTg4OXZ6?=
 =?utf-8?B?M3dsZmE4OERiOTdUTGtlYVlQcnF3Mk92c1hOa2haOEdEWDhBby95S3V1aVRW?=
 =?utf-8?B?dmVseFJoYVZyRGp5NmJOUkJkRXNFbUNQTWxGa1BxWVVkWFhyYzVNV3dFdVlD?=
 =?utf-8?B?clBVdVdaaHNRWWxLVEduWk82bDA1Vi93dUhERmhQeXY5aVB6WnlNa1dhVTZG?=
 =?utf-8?B?NDRla3AycEpwMUw4VFJ0MlpuOTJFRWlDVXZmMGk1L3NVYnlkU0U0M1Y2dGNp?=
 =?utf-8?B?UzNQenlmbklzaDZHTWE3eHN0SFlZRUlsNjJSWWpycDJzeFVDMGhYcnNicVl3?=
 =?utf-8?B?OHlKM0JVdXpGblBZRnl1VXhud3pQSXc1UDRrSkdqY1BPN1RDVlI4QUpKMGR6?=
 =?utf-8?B?T2FmY3d3MlNLRjB2ZkRpV0ZkNXlLMXZIV0pOWDhpSWpheVROZmgrWk9DVzZK?=
 =?utf-8?B?VTluejhkY2hXZU1CdHVYMEF0QUF3RkNzMGlnak1odFhGenU2R3Q2dnd6WW9V?=
 =?utf-8?B?di8vc0FadXN0TlNVYTJBdWF4YnRiUmJJYkdKYTdTbjF3WU1NVTRZMldyaHBP?=
 =?utf-8?B?Y1hITG0zdVRaSWxQLzk2dnpuaDNHemlvNXcwSEduYWNVYThnYnhDWG14UXQ2?=
 =?utf-8?B?UjlhTmpwZ3hpSUpOZ29TOXBrSHBQcVJnTk9ZMDc2Mk1JbVNEaDFlUEx3cklj?=
 =?utf-8?Q?5gyAfHtXkHkH/m3M=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ca0d4b1-8cd0-486f-0c27-08def92b2e0c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 11:08:18.6530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cyAvn0a+3+Q/IhF7uVRRXSZwIALgzyHvrr5N77Fh0FSPZKLAbsgcKFcxkGWE56KciCTtBf4Q65Eq5aK3R3h66Z8PNVZaVVKtG2qatbsqWOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5943
X-purgate-ID: tlsNG-c201ff/1786619303-714AC2A1-88F47882/0/0
X-purgate-type: clean
X-purgate-size: 1507

On 10/08/2026 11:30 am, Frediano Ziglio wrote:
> Preparation for a followup patch "libs/guest: allocate various migration
> arrays just once".
>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Coverity thinks this change has memory corruption.  I have to admit that
I'm not completely sure why it's noticed now; possibly because now it
can see the size of batch_pfns[] where previously it couldn't

** CID 1700057:       Memory - corruptions  (OVERRUN)
/tools/libs/guest/xg_sr_save.c: 284           in add_to_batch()
_____________________________________________________________________________________________
*** CID 1700057:         Memory - corruptions  (OVERRUN)
/tools/libs/guest/xg_sr_save.c: 284             in add_to_batch()
278         int rc = 0;
279     
280         if ( ctx->save.nr_batch_pfns == MAX_BATCH_SIZE )
281             rc = flush_batch(ctx);
282     
283         if ( rc == 0 )
>>>     CID 1700057:         Memory - corruptions  (OVERRUN)
>>>     Overrunning array "(*ctx).save.buffers->batch_pfns" of 1024 8-byte elements at element index 1024 (byte offset 8199) using index "(*ctx).save.nr_batch_pfns++" (which evaluates to 1024).
284             ctx->save.buffers->batch_pfns[ctx->save.nr_batch_pfns++] = pfn;
285     
286         return rc;
287     }
288     
289     /*


~Andrew


