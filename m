Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AE6606A326
	for <xen-devel@archiver.kernel.org>; Sat,  7 Nov 2026 01:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=iT2sPEiG
Received: from list by lists.xenproject.org with outflank-mailman.1477683.1683021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPVMt-0006gV-IF; Sat, 07 Nov 2026 01:37:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1477683.1683021; Sat, 07 Nov 2026 01:37:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPVMt-0006gO-F4; Sat, 07 Nov 2026 01:37:19 +0000
Received: by outflank-mailman (input) for mailman id 1477683;
 Sat, 07 Nov 2026 01:37:18 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xPVMr-0006gC-ST
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2026 01:37:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPVMr-00512p-39
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2026 02:37:17 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aee806d-e002-0a2a0a5209dd-0a2a450cbdf8-30
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 02:37:16 +0100
Received: from [52.101.56.61]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aee80cb-f479-0a2a450c0019-3465383d86fd-3
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 02:37:16 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB5728.namprd03.prod.outlook.com (2603:10b6:a03:2dc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Sat, 7 Nov
 2026 01:37:13 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0592.010; Sat, 7 Nov 2026
 01:37:13 +0000
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
 b=uKlfJrHBKDAjYYVW4isozYdfKGlTIzeeNDQEHCNrYEbcr8Q3045ahH8cARoBToCwXgI91LyPWq7zJQN/FIBV0XGVW/7uoHZc1S+xjg2BINZ+/XNu+IzV6Rr7BBcdGbv+GYanRDx9MvCtJ8TnkOI8BJHXtx6kxv0ppuKlgCn3Km2H14fj6nUE1x5DLBJgvGKIdkjXIkSPt2vlU4Uj7Zu5hIQYTJeBkyT7TNK0g37t72M2cFAoWdT6L5/gUKTAvT4pM/lwG4rXehgDJRYtAaMcqL4rhmxw0qruVrZuiBTRPuY4KV3L3Uf2cYdPYaBvP9gHaFod7NHza0WDAAJLr0rxyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7n8Ow6GSK/Yly+x71bdxoobWNiHgFAiEaPY+d4LSNo=;
 b=t+BOgEeVYlzmyfc3BrPeEfyWFpFS8hCm1rCBM7ia09TF5xiZpb4HIDcF/08OYKG6/CSx6DhEE1HtDlQqN4Um4J7H2+jHNpfCkx6gB1GTgV0IjdgDTg3cdIy1Am7KI95g/7D42SMOQYg6Moky3NzZNeB/B+HF7c/1rvhEd5IQiMNpVtRGxwLQIcn5IC+aCAV53Y9u0PHAXbhS5QDcKb7eukn6pQOuJMZmfQIVvNqanOyFeciBW2G9MVPjASiCiFmOJD/Pz8S/5TrwbNtb3TZ76wey/EZK6k5npBCILZk9/PhTJlkx1zs+eGzOsJzJlnIX+DIexq7pXShr1bzHLNnI6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7n8Ow6GSK/Yly+x71bdxoobWNiHgFAiEaPY+d4LSNo=;
 b=iT2sPEiGpI7kj6wJLmTwXWL8nsqJdDXv+DW77ejiVv5Mvv2nXAyoBYSZvTJaJNQYjfGoZFCyS3y4J+YNgSDysyh/uPlQQylTpvqFC/IiWygZu9Tfa7EmzCOe+8TJUlcZIgWdKet/t28EsorMR+67h3P13GavjORzQyroUiW8hn4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c28d472a-9642-4f12-955e-893916ba98f7@citrix.com>
Date: Sat, 7 Nov 2026 01:37:09 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Roger Pau Monne <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen/gnttab: _cache_flush refuse an owner without a grant
 table
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20261107010623.192975-1-stefano.stabellini@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261107010623.192975-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0617.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB5728:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d5ad57e-4ed8-4215-4f39-08df3c6fa5ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|10067099003|11063799006|5023799004|261026121527099003|261028144727099003|261026140227099003|261102123227099003|261021123027099003|56012099006|261021121427099003|261022105027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	gN0cuN5LygEBSL7RVEhdD7ld4t57wvSrU67jFbW95d6k+YVEPeLbe9Nkj+PHBguKjAiRsxBp9+auBIp+PAca867BkdTeNrNtMxbc5Y/fB7IejBviTfkPSunhBN7HhLjhaijqYyBZ3XZqipk2Iadq9DUMHBTzEIdN3r7goVjuWrd4ZamdRNcAdyyhPGJOsHwTXYOuXif6SrWNIYJ+p2DQCr5CaG8jZ2jz6hhANOE/Aoy+EKdyt7fJxtsThwzJVnK9F7JqdVOzON+8XWICe6fiZ7RuvBbGpUjbkkxgVnDtXvF3knAyAdigdz1HluZM8CLMxoNi6g2emCH0hTpCUC8JuWhvfLSETTjPnhrzH4+6ooihpnCxuW2dAYXp7ZV3D04jOcL6ZYQxHNuMG3SlsU65T7iT0e6BlxB8yt74n7Or/HJr9YP/Zr2GM0KoYGOnFdT/idHuLf0oKrFTfx6btnAN/7J7M4oOB0tyfHUkXSQFJq2hU0Sqag4EJ6VsPSg5qx+c/vdm+GSEUJdvnxU7+G0P4Td+wjWrmBVNwfIReAQHHWL4J8G3IaKIjg/XALxvnJ0tIEjUsGa9LlIZhejcshUz1I765oXW5OOt4usuqChEemI1iApQggaYqdTkLVtrC/Gm88jDAEAbDkfQsCZZZDgyjvzSTdd4pg6bGXrpZAHIOxs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(10067099003)(11063799006)(5023799004)(261026121527099003)(261028144727099003)(261026140227099003)(261102123227099003)(261021123027099003)(56012099006)(261021121427099003)(261022105027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3lGNEppak5rUmxRQTZ1Q1J1TmVTUUFPN1lzUVd1ODV2RU9Xd2YwRW5qNkhi?=
 =?utf-8?B?M2ZOVGRLcHQrdEIxOTFkZmpyRk5BaE5HMDhrcGZBSG5uQUUrbms5YmNCMjJG?=
 =?utf-8?B?N0RaVkIwU0x3VDB6enpQQWxSVCt0QVJPbm1JblErUDdXdi85QU5IYjVmVFlj?=
 =?utf-8?B?WVJib0thbldvTGkzZDdlVmk4UGwyeDcySlRRRjVpQ3JnZXZocDY4aThDT2FF?=
 =?utf-8?B?dENvYmlqSnhSMFAzZ0U0V3d6NndyZkFvcVdlUVJKWUY5eHZVSzdid3VMeENq?=
 =?utf-8?B?cktFbWVWQ0NaU2pEVGFUYThkWXlmNTJxWHNEQVdIT1F0QUF5aVZDV3p6dVli?=
 =?utf-8?B?eS8yd1FteDdXMkc3Sm15a0ZWN3hSaXZMNUxiTmdBSnpGMExCYVVaeTk4ZlRa?=
 =?utf-8?B?WFppeXFEY3FUMDhHOXR4empteUlScCtrbTFEYjNpeGxsTXBpRGhUR3Z0d3lq?=
 =?utf-8?B?Q1B4VVN6SHJsVkRDMkhqY1krY1BjMGUrMUdyUHFzcFN4ZTNQa2x2U2N5MThk?=
 =?utf-8?B?SkxpajFSSC82SlFnN0RVc3FnNWRpdXY4OFN6QXltZmcwK1pIa2YxK0F0eVpM?=
 =?utf-8?B?c0tudjlhM2QySkIxak9pOG9IOXBRQkxPUThDL29mZENMa0xTUWsvNkgyaTlE?=
 =?utf-8?B?djhCWDNLUDZwRlhuWlV5ellrV0Jyend1bkxheTNramM3S1hha0V3R1FWUmZW?=
 =?utf-8?B?SEhyblE3Vk1WWGdMOFdwWnkvU1lrM2pTcmtpNGt1eFNHRGxkQ2JiTW50UTY5?=
 =?utf-8?B?SWgvTEJ2akRjTTlCWmNMay82eEJIa3VmZWdRK3dRaG9qMGhHVXhvSGk1UjB4?=
 =?utf-8?B?di9vKzFjaUkrTS85UDZyK1NLcGg3alN3REo3NjhhY0o3d29manhzVjZSbnIy?=
 =?utf-8?B?M2JmYzliaXJKdWcxallWM3BGZzNOdW5zVmRpTHp1RFAveHg4STJjSnJzckFs?=
 =?utf-8?B?VWNTN0RGU1FjQ1hVc2N5dEZtaldydGtNcDNYNE1VN0kvRGRvcUhoTU5xaWE1?=
 =?utf-8?B?NDljS3JMK1ZUOGNsU3lWVXdTVHF5ejNLNVRYODRpUHhmeDg4aHc3YzVpM2hn?=
 =?utf-8?B?OE1TMEJidU1QQVEvcDJ5Y01pQmdHbENpVEtFY2gxeHFWRmIvVGdQeDRWV1ly?=
 =?utf-8?B?TG5pM0ZPckZyZEQ2SG1kZkgxekREcG5DUEN5RHg5S09RMEcwQXRYUlJ0TmNS?=
 =?utf-8?B?MVdmblpWSEtwd1dEbzBUY2c4bDhQQ0ZaMUxJTW56cHBIZVc2UHlFNE1Hd2oz?=
 =?utf-8?B?WGtPYkN6RGZJTE1Pd25CSUFTZDZJK0czWmp3RHFKdHRzV2lpMlZmL3V6L2s5?=
 =?utf-8?B?ZEJ0aC8rVmxhZjJ1WDNOS0pqWHJQeisrcEdzY1AzZnJGcHZCcXJWbDJIU25D?=
 =?utf-8?B?R3dPV1lud3VlRm9HSDZZRXZaMjdGOUhMZ0pZdmNja1FKaG9HWURMejJtUkhQ?=
 =?utf-8?B?S0dWUndQVjZwaTVXNVg0MFZZdUtNUk1MVk5jMVVIUzRHL1VCQ256aWlkKzN2?=
 =?utf-8?B?aUJidDUvWjZ3TGpybmpkWU1zT1ZFVmFBcVhsRGgrZ2tkdFJGVUZIaEE3Z0ZX?=
 =?utf-8?B?RkRpV0tXTWZ0ODBUdi9IT29HbUtPZmlSR2hnbndaQjFIN0F2Y1BKbGxjZE5p?=
 =?utf-8?B?WHl3WXFJVTNCbUhydmtzYmZxdlhYMmNCc0dkb0x1eGxHUFYzcFVlZlNjNXcx?=
 =?utf-8?B?YnlKT3FrbG1QTjBrbEtDay9XbkdUQU5RSUFhQnNtRTFLTkt4dG9jTzJ0UEJI?=
 =?utf-8?B?S1hyNXgwbnd5dzNCMjgyRzNSdEpWbkdFZ3BQSncrZURFb2ZaQkowN3hRamNC?=
 =?utf-8?B?Z3JvdFpBa2YyYi9aNjZGUWxKaW5ZclZQYTlWNFcwSkhFbFdGeUdySEduT1Zx?=
 =?utf-8?B?NUhlWFNrQXo2QWFwdjVRekF4a3A4cWs5TmFvd1k3ODJnZ0pJWFcvVGlUZUNj?=
 =?utf-8?B?WGVwMHg4Y3I3VVFwYzVWNnFkaUloNkNzbnR3bTN1MUVuOEE5anJqbkp0WHRJ?=
 =?utf-8?B?aEV1ejE2QXU2U1l1ZUVxQUNuWDZFUDNkb0xONm5ReW55dXdnaHhxRmwzdXNz?=
 =?utf-8?B?YXlRYXoxQVJoWGx2M0twalhDcEV2SlpqVzg3WUc3RnptbjE4dUZCUUo5Ymty?=
 =?utf-8?B?S21PUmNzUnpaR2dYbkxQN0hNdHMyUXMvQ2VQMklFVmt2cko2T2hFbzRBck9Q?=
 =?utf-8?B?SWFrb0lYVWU1QkFacjQyZHBvTGZJU2t2Y1BEZEhwc25kMnh2Um9jbENGcGxT?=
 =?utf-8?B?U3FuQXhzcnRaeXhaaFNRaXdjVll6S0orNlVEM0hnM0JQR245SlJlazRNY0lE?=
 =?utf-8?B?UDNqd2V1MXBKWFlOZEQvakFyMngrVWJYNzFJb01tbjUrTTZKTTNTZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d5ad57e-4ed8-4215-4f39-08df3c6fa5ba
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 01:37:13.1291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uTlyK4n5beK/WzCyIP+UeN9EPyJix03AeMJamvJmoji9ppBB2809FpWM7hbcdRU76JiQGUSH7xgvpItHgg/QIO2GaQ7GWF6KJbsqJ4XFMFk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5728
X-purgate-ID: tlsNG-d25034/1794015436-034D7A5B-37C09B5E/0/0
X-purgate-type: clean
X-purgate-size: 1918
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 07/11/2026 1:06 am, Stefano Stabellini wrote:
> With CONFIG_STATIC_SHM, a shared memory region without a "role" is owned
> by dom_io. A cache flush on such a page then reaches grant_read_lock()
> with dom_io's NULL grant table. Reinstate the check, and give back the
> page reference taken by page_get_owner_and_reference().
>
> Fixes: bec8e3c1fb91 ("xen/gnttab: Drop owner->grant_table check in _cache_flush()")
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>  xen/common/grant_table.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
> index 2285c4aee8..999b10abcf 100644
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -3633,9 +3633,11 @@ static int _cache_flush(gnttab_cache_flush_t *cflush, grant_ref_t *cur_ref)
>  
>      page = mfn_to_page(mfn);
>      owner = page_get_owner_and_reference(page);
> -    if ( !owner )
> +    if ( !owner || !owner->grant_table )
>      {
>          rcu_unlock_domain(d);
> +        if ( owner )
> +            put_page(page);
>          return -EPERM;
>      }
>  

Seriously?

We debated this at length in the security team, even the fact that
XSA-520 only applied to Xen 4.21 and older.

Now you're saying that claim in both the XSA-520 advisory and patch are
wrong, and therefore the owner path was not in fact dead code and a
MISRA violation.  This is the only reason why the patch ended up in this
form...

Nothing in CI noticed, not even the STATIC_SHM tests.


What I would like to do is a straight revert of bec8e3c1fb91, stating
that the claim is false, then apply the XSA-520 hunk with a different
commit message.   That way at least the logic ends up the same on all
branches of Xen (in this patch, you're reversed with rcu_unlock_domain()
vs the XSA-520 fix).

Thoughts?

~Andrew

