Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F3BCA5FFF
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 19:01:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441739.1659287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEAPo-0004Lj-4Y; Tue, 06 Oct 2026 19:01:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441739.1659287; Tue, 06 Oct 2026 19:01:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEAPo-0004Lc-1K; Tue, 06 Oct 2026 19:01:28 +0000
Received: by outflank-mailman (input) for mailman id 1441739;
 Tue, 06 Oct 2026 19:01:26 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xEAPl-0004LW-T3
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 19:01:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEAPk-00Gmgu-L8
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 21:01:24 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ac54584-8faa-0a2a0a5109dd-0a2a450b8354-0
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 21:01:24 +0200
Received: from [52.101.52.41]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ac54583-b7e8-0a2a450b0019-346534294326-3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 21:01:24 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB6536.namprd03.prod.outlook.com (2603:10b6:a03:394::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 19:01:20 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0472.020; Tue, 6 Oct 2026
 19:01:20 +0000
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
 b=xXf7PfggM3MK65v51ssEyXVCMHEdBIiEvQchbZZ49pOpSJ4jEs5cadZKZeLPmbja/OIQYskB9TAysltYJDP8KkpwZaTe7UIPNZXkHFTYzr0WYRccccZO3w/tpfP55aLe1GJKtV8Ht6ZcO4YapbOppsjD5KGRtU3HBM/6ttOKHMYjAmm7Ymwx62pbTVmjIgs+GUNgubO/eo0kM9vsaZ7yOmG+cUYA0VuryN+rkmjqoXz+jTM31owSS3jYNXiQmJxS6JiN2YPbKV0/4U9yvcBH/pY/2i8khKXGpdR4fh9RYyCBMBBiJ8PcYl6EhV7A15f7PPUpqoneI8PWARnZsibEmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lkbLXOBH1bR8qJI/ffu3PzBN2AybD2Uz3fSfJFHnxgg=;
 b=mIpdhhBDmlleEX6GNUcxkFzm6hoBCBlITZhvNptg2dVHVNZxrNhh96tAKwvSmvEU9eaJtwGt2tPSBrP6F7jKDyyZ8US4qdWUtxZOMIM6qazNOboNNMYxEKmUUbJSDOqR/cYrR+jPj3eYao0eq0oehNpZKxVI1rBPe1Pvx+oAwuW40LR9kcogpjrZy8eTXLi5/GKn4J/jLi7jN7xanblcUZxLJqlrBy3ug/FLGF2zkJe69ofShQsDzrembkS7pYl8NVruAPli75DRV7zkvMkRspr+Y0h2JJXchch58Q1YGdkGlgyE4APSYPTlThkL3HbofgHTurRotXFsqk0LDaPKrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lkbLXOBH1bR8qJI/ffu3PzBN2AybD2Uz3fSfJFHnxgg=;
 b=KAw4bCwohN7aJ2Wbu4pRgf9hadI2in2D7YcUNHY/eU7PhQFP7lui9D2hBpUiqy6ZcKi/KYxAMts/rISTTdM9PEF/HopGzzPF0v6uU400tP/Ae9JGQm72zFfTTcfySuXewB4NZdKO+AU4CAsMelSgsH8K7L2PWgheIarK9Fl4qX4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <288b7c58-8375-41a8-9923-a4884830cc40@citrix.com>
Date: Tue, 6 Oct 2026 20:01:17 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/kexec: Annotate more noreturns
To: Jan Beulich <jbeulich@suse.com>
References: <20261006105445.511099-1-andrew.cooper3@citrix.com>
 <3bade5ec-e91d-4181-89d9-de35bd42ce62@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <3bade5ec-e91d-4181-89d9-de35bd42ce62@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR1P264CA0093.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:345::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB6536:EE_
X-MS-Office365-Filtering-Correlation-Id: a7db2f6a-1b16-40db-66eb-08df23dc356f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|22082099003|18002099003|10067099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	8O+wABqfruaRpHYeVCIciYtCq5aoaDRzHVoDke6uCUcx38SwmCjjonA73hkFJYLbsJMhsNVwNuYRB/UeRX9I+Tw9naixJ8Wb/Fbyeqn0Nl+uc0qMBsduQIkcLV8riCFlati4QhsZ9lV8OipAkm+8OY2Obx6c3zBRAWTa27KPhorQmZKT27N7drWyvurolYJMbxz0F6MzJyIXyWX3US8eZog/cHckyhHVZkgu03v0ZrExk+VzcamL3RkJ6jZGwk3ftih75y1lo8JPYGakX9eNp5lknZCfAgi1oxFXvgIShsgq3jYvj56cNdUGTGTymPAgrzHzl+r7j1Bw32erBIbiRG80+qwWom+qBEMMJlbI7C091RHh7MflDFu8JbAzgLIKpKadQuIhqL8W3Nlabm4VMngLxvnHAdP9CcTX+pIHt5Tdd0yMTkUInFeO2V9KW0j5UygbrrBfYbKkfGBGhl5dX0wLchAx2Tny9Sa5IEv4eGYHZ/ElI6++QDTpvamO0VCjT07LlxLeDKnPkPJhHDt5V+yuQhl8JyPt5EQpv4TEWa+rd2CP6ZfuecRaT5bjEaSGY59fvhMPfxhbbniPR166pbDjs7LbENP9byVHnFM1KrWF5noGcIX4etKunlv4xvvvtbMSI1PVgQsBbMNF0AyiOldpVXsimXOawhocst5orZo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(22082099003)(18002099003)(10067099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTErL2U5ZzdPQWdXMjRRL1lKRU1aOWlkVjR2dXdpLzJzd2ZBZmhzcUNyd1VT?=
 =?utf-8?B?N2VvYWJLZWFXYXp6aDFoazVWc2hHbnlFNUZNeTJLcGlSTUgyR0RmWHVxSTZX?=
 =?utf-8?B?N2dyMzhnVlpkMUtFWjl2bDFYZ2ZwbmZIMm9RT3dqa3IybDBHbUREa0dMNlpQ?=
 =?utf-8?B?OUJ4aFNCdXZ6VW1rWWIvam1oSmpWNnFsWDE3Yk1tL0g3U2tzQlUxMWwxbEJn?=
 =?utf-8?B?cG5PUTcra1hTeDJkYmN4ckRyQXByZDZZTWxTRFc2YTBMUVYvR2ZsRGhXU3Uw?=
 =?utf-8?B?WURFaUdjQVVIVVVkSGQyckNZalR0VklEd0xqRXNGUlZSWmpUVll2aXBPSVdJ?=
 =?utf-8?B?dVJWVy9LMHF0THRrWjBESzNHTVl5bEs1NzhzRDBkZGNMZE1LckZYcE8xMGNq?=
 =?utf-8?B?SFZ2ZEN2eWxxT25qbmtMMGRLRzBxUEZCYlkvVHdXa3lTajBYWGtORU4vdzRG?=
 =?utf-8?B?aUVpb1BaUUxJRm8vYUNZYTZKYmRsREVzdUVvVHU4amVXQTJIM3dJQ2Rwam1B?=
 =?utf-8?B?YVlVbnUvakpORkd2a2ZQdU15bkVWdkZHSVRZa3RqR3B0cmhiNERmQVNrdXBl?=
 =?utf-8?B?Mmd5dDNuTGwydC8xUmp3RlZRVUdCS1QvRmx2djNLM244SFFpYVpYUDBiYnFw?=
 =?utf-8?B?QndNdjczZjlpNDJ2R09KTHNMQS9hbmFQYVNqMEZoUWxaWnM0SkMxdGRZakRa?=
 =?utf-8?B?SUxXdUc5OU9Vbml4OHd3SitManZZeldGbnk4b1ZEVG52VS9DSVJYMU9mdEsw?=
 =?utf-8?B?YXo4QjJFSnRCbVlYNDhLVVZJTW5va1crMmpNSXRxOVRCSnFmZ2U5MW1PbDFm?=
 =?utf-8?B?TWJEczRRVXd6YlNCaVcxd0tRU0xSU3BtNkd3ZkhaMGFvTUFUY3RuK2xTcGNN?=
 =?utf-8?B?M1BnMUdVNThVUVBsdlpndmdnVHRMZW9ya2Nhd2ZWUFV2Zmp3RWU0QW80Y2Mx?=
 =?utf-8?B?U1U0bXBsQWhpc2hIQjN3SElqSkZXUDhJemVqaDZWcjM0d1JDMG4zcGVJZGx3?=
 =?utf-8?B?UjRxTXFIMlFhVkltVXovenJMaldPdXE0WG03Y2JUdHVTcUZvazEra1oxdERp?=
 =?utf-8?B?bjVyWm1uVlVET0trL2xocGdvaXc5eER2Vk9Rc1RMNjBEbGF3bWFnVjAwa0VM?=
 =?utf-8?B?MjNTZWFwdkVoVURzc1pjVUticlhnbCtPVVRhbXFEQWM3Y0k3eEkxWUNpZk93?=
 =?utf-8?B?N2c4YVFuK1p2djUzZ3l1TFJzTjVMY3FkVC91M2lUZzRIZmdtYzZDUlF2ZGps?=
 =?utf-8?B?dnowTFJ5NTArQjZ4aVNrL0VXa1k1UFYyaHRSa0tlVEg0UmZDQU81bFdTRCs3?=
 =?utf-8?B?eW9HOWxIdGNKZG0yenRCYVpiQjltbWtDeEVLV3RtWWxjM25DMUNsblFLczJy?=
 =?utf-8?B?ZGlKZ0ZjREk5SldTamJRQUdLSzJ4L2lrR0R4b1lHczVZc0dnN0VrQVhCb2FI?=
 =?utf-8?B?R0NvaXJ3Qy9VZjdCODgvYUFES0gwM3BzWEJRTVVwV1NEWGdIYVNoa2RrbHJm?=
 =?utf-8?B?MXRxbEdZanhqMmR3Z0xEZFk2K0FoUCtobVZ0c3ExQmFnM1lLcGQwa2d3WGY1?=
 =?utf-8?B?TlFhTFBjYzc0OEVVOUVidGZUbXJ0QkZRTlVRVUFQVmJlTlp6WkR0TlpOQkNR?=
 =?utf-8?B?R1E4ZjhOL2piQ1N5eHo1VEREc0dxeWQrNlBsd0ZwMklNczMwbWhYSUpxY2xv?=
 =?utf-8?B?WDVjaXlSRXV3NEl6UTBhOWpMSEt3elE5TURKUVZBQkRSMUl5SWZzTS8wK2Nv?=
 =?utf-8?B?RkNRRnNSWk1aQytRQVBYTGdJR2dTRjY0N0dDa1R5eEhnbk9XTEVPZFZNMVZ5?=
 =?utf-8?B?U1ZqeDdhSnRLMmZwTlpqZVlnYVF2QVpJVDU3N2o3eDVVY0JyTW1sbE1DMDE5?=
 =?utf-8?B?K2VmWjNHMlRoRGtJSjI1NHlpdm5KSWNxelhLQVpXMWh1VUhJK3ZkRDhGUmJW?=
 =?utf-8?B?akR4TGY3akRRdWZEK2prWW1vaGdBQlBmSnVEQjdSbXZUMEtRV2hja2k2bWJJ?=
 =?utf-8?B?aWhvd05VdjJ5Nk13bHRvZHVBNkRLLzBkWm9FL0RUL3RZSTBWazRpSENkbW1P?=
 =?utf-8?B?MHl1d0lMVUJEbnlYTHgzekQyemZkV05iajY5WU4rVWNoOWRCb281N2xYdDYz?=
 =?utf-8?B?SjVSL016dGlnV2hIYU4zZm1nbExTbUNsWnR4dUt4Vy9ZQlhXZm03bnIwblhi?=
 =?utf-8?B?NVdkcHRrTlNKa213WW5iUVp1a1Q3KzdER1NwUWRYbXN1VTJCZmZnVFA1Mnkr?=
 =?utf-8?B?UjF5UXpzdElPbmcyQ1NsZ2xSZmR1cGFodWQzems0VU5UV3ZkajlQaHVjSUxj?=
 =?utf-8?B?RXpaNkx3SHk5dVdsV0w5NEpJQktPb0pEcG9wZ3ViOWZTV2hpL1lIdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7db2f6a-1b16-40db-66eb-08df23dc356f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 19:01:20.7227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2McEy5L7naGTyYC0QbLwHYkV+Mq4kX4kspIA7ZK3svkFoFI1HIk3ZNKOr70t6cANImLd3oEp96AVF7VvmQy8NJMpjc9tsUJK7oivozbD4sI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6536
X-purgate-ID: tlsNG-42698a/1791313284-A84CB9EA-E884AD5F/10/78276251493
X-purgate-type: spam
X-purgate-size: 2124

On 06/10/2026 12:26 pm, Jan Beulich wrote:
> On 06.10.2026 12:54, Andrew Cooper wrote:
>> kexec_reloc() does not return.  Plumbing this property upwards lets us mark
>> machine_kexec() and machine_reboot_kexec() noreturn too.
> The latter already is annotated such (see also next remark) as of 4d2ed2f88a0c.

You missed half of it.  I'm surprised that it didn't create a MISRA
violation.

>
>> --- a/xen/arch/x86/machine_kexec.c
>> +++ b/xen/arch/x86/machine_kexec.c
>> @@ -142,15 +142,14 @@ void machine_kexec_unload(struct kexec_image *image)
>>      /* no-op. kimage_free() frees all control pages. */
>>  }
>>  
>> -void machine_reboot_kexec(struct kexec_image *image)
>> +void noreturn machine_reboot_kexec(struct kexec_image *image)
>>  {
>>      BUG_ON(smp_processor_id() != 0);
>>      smp_send_stop();
>>      machine_kexec(image);
>> -    BUG();
>>  }
>>  
>> -void machine_kexec(struct kexec_image *image)
>> +void noreturn machine_kexec(struct kexec_image *image)
>>  {
>>      int i;
>>      unsigned long reloc_flags = 0;
> The annotations here aren't needed, are they? I.e. this hunk can shrink
> to just the removal of the BUG() invocation.

Readers of this code are not psychic.  They shouldn't need to be in
order to follow what's going on.

>
>> --- a/xen/include/xen/kexec.h
>> +++ b/xen/include/xen/kexec.h
>> @@ -49,7 +49,7 @@ int machine_kexec_load(struct kexec_image *image);
>>  void machine_kexec_unload(struct kexec_image *image);
>>  void machine_kexec_reserved(xen_kexec_reserve_t *reservation);
>>  void noreturn machine_reboot_kexec(struct kexec_image *image);
>> -void machine_kexec(struct kexec_image *image);
>> +void noreturn machine_kexec(struct kexec_image *image);
> The annotations on the declarations are sufficient, with another Misra
> rule making sure we don't omit the inclusion of the header in the CU
> having the definitions.
>
> Preferably with the redundant annotations omitted, and with the description
> slightly adjusted:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

I am not inclined to make changes.

~Andrew

