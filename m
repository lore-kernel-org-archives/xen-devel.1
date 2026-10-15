Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A222CC6B33
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 11:04:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450243.1665714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHJGO-00042l-GA; Thu, 15 Oct 2026 11:04:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450243.1665714; Thu, 15 Oct 2026 11:04:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHJGO-00042e-Cz; Thu, 15 Oct 2026 11:04:44 +0000
Received: by outflank-mailman (input) for mailman id 1450243;
 Thu, 15 Oct 2026 11:04:42 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHJGM-00042Y-JV
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 11:04:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHJGM-008dF3-0D
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 13:04:42 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ad0b33c-e002-0a2a0a5209dd-0a2a4509e958-46
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 13:04:41 +0200
Received: from [52.101.193.34]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ad0b348-be1a-0a2a45090019-3465c122f4f1-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 13:04:41 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BN8PR03MB4929.namprd03.prod.outlook.com (2603:10b6:408:79::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 11:02:36 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0522.013; Thu, 15 Oct 2026
 11:02:36 +0000
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
 b=qBzhzMu+Q+0hL1VZqmm4I0iE3AH655h4dCtEjr9ZFCq4WKKynX4hvAtwJRr+ydI2+qsE2x+vtbEguOmiaSg1So3nunwhJ4U9D2f7HLcUklMaln3EYnaVU4wkHVk4156n62Ozzv2ZaSgtU2wFd5obr3cCVhxMFCVDLCpxUB3Elnv63jQyYjF9ngS70SxDi066uCcImed2LvJ02k8Mb/EmKOG4u0IhYydJ97rLLOodpx0EzDdGfFmLGkjBinVo4mvqicAwx0gZ6OfR6DJzVTe9rCMkVCUyHE8/Kc9P8vYpAhJnLeSImpqu5ShvmB7tWLs145p+0mZooqxWct5dVF02Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TfUJrXhRvGh2qeFVXoPGBKATcwO46JYNDu14aBtmUQw=;
 b=ty18D2lgFz62c+KaS2/BHLkAxK5veNcv7cYTmGDGLPka563W7imAWpYuXRi2ErzURVQXtdetHLIVuy8GvrN4L8Nc2wn6P+m6XC88dIxQbNjTOSnExuW9PZiMDWmsLuWQnWf5idy7XB6yk8ngRcjMl4axfLlfyVqMTPVSKyIFyY3wYzIUXfUiUIvwqKW8b9F7D2Q590bwLyNSoWokIIlI2cMNcMrSxKw7NF2rjxVGTY3SIz4kHewE+V8L4wu4wFi7/DFppRmW7PxMg7rcIZROtRt5JC1Y37eMzq7O4Zr1Vd0PcLZpgxzeN4DAUz3sDgBdokbPhqInvnSWtuTCCZxSsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TfUJrXhRvGh2qeFVXoPGBKATcwO46JYNDu14aBtmUQw=;
 b=iK/OY8LV3HLWuzcA1FTPDhWzTTJ1bNhpO8EvQrSxBg9Lc4NCjdpm7H83j4e0AvG5/u8BvC0mgsBgVP8ehu6P8xXgDqk5YC8dgnACaBLxFR5F1BBpi93Yi6N4921aMisCHJLmGPOuELtYQh9AKG+hpa1MwYV+N0hxUF3EUIWJiNc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b3786acd-0972-43e0-ae3c-50251c4acd63@citrix.com>
Date: Thu, 15 Oct 2026 12:02:32 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: Re: [PATCH 1/2] amd-vi: set the size flag in the IOTLB page
 invalidation command
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20261014135143.34220-1-jason.andryuk@amd.com>
 <20261014135143.34220-2-jason.andryuk@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261014135143.34220-2-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0315.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BN8PR03MB4929:EE_
X-MS-Office365-Filtering-Correlation-Id: ac75eb3d-9bfa-4496-61fc-08df2aabd216
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|18002099003|22082099003|3023799007|4143699003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	NyUojdf7fXJkCs3SQv3ej/4y/dlGpQi2Qwxbhqf/Aez2tWnzRYfd5+DyXwsqEZPzUwNbDMiOeC8xDdUmqAreNTCJA22ed6jmYA0UVgrPpzk2sfEIwKUEQ91jGnv6BzWxVnwNHOIjWx3M8bXbC9ydNDXsjs6hmgq/Hgk/IKSbjD8YHNSjpNYjQzXZFPSwhxQ3PGKBlvORWX8dBdxp0tV/VLwNdEzn3+ImSCCP8CIMCo9PjKX/istMrx9k6dfaaLZ6FUJv/f2y4jMv1mXPeOt7412q/atYlB/WycCMqof3iZiTH4KlR1bVCunkj8k+XGMf/iDXRzjTsiKcz49q8OoX2C8c3Z6LN+ViVta1PD/Uxro3uqKdTyTRhkJ9DziXSwatodmxothag+puCU/n3vd4eO+dwNu2Q7hZEev3lS++x//iTzN/FEQNd1Tj5BXyqI7gfsl7ViZ7hd2Du9TR8cTxhRkNcpmoq6JfacPo9Ql/vOQwv74yTwFz72sGRs6XzMUiXo2QsgmD8RkrppoPqApvn5FYvisjOOhL8btJ/TEUpcSf9DCPYugd1pZplR+cduwNJBw69qTBttWjBOoiAryAu9K42CRKbw9Och4Ot3CE6lHJ1AGx5FmFamUkO2n/+0FS8gE/1BOZ0PPef+UsBqE/OanPSQLoR5isHjoA5RbLmCo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(18002099003)(22082099003)(3023799007)(4143699003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVREOTNQRTJJK0xEblUvNXdrL0tTZXlWRlFIUGUyS21ON2tCeGtOSmN3NStL?=
 =?utf-8?B?dmNsNCthcklNT3B0Y01VWHp6NGIzcmVtNzJncm9iMGtGMzlLVFNQK09WdHQv?=
 =?utf-8?B?UTBRSStIV0k5OG0rTE15a3ZHeDc3UzdFOHJGR2Q4bXNEWFhrbGo3MFdCUjlQ?=
 =?utf-8?B?M2FOdmJTNkxtZ1NuUEhyWnRHTmw2UC9qT1ROTlg5dGREZWNYM1g5MkoxbTcw?=
 =?utf-8?B?RDNnejhlSXZOWGR0QUJNRnlaaWRmdzlVUW5ldjNTRUdsdkRDeGhCdE9FV2tV?=
 =?utf-8?B?TFgvRlBQWWVyQ3VNU3llUkYwbEQxWi9Pam9uNWJsNE5SV05uNVpaditFNmdp?=
 =?utf-8?B?YVNqY0xreTJqbWljWG92N2lNcFhVY01lTTNKWEtQalErNDZZNFYzbVZObVRT?=
 =?utf-8?B?SkhBRm1hS2JDWHZCZ3VUUVRHTXduaEU0R2N3TEs2dy80NWhFWjhmeFpSSmJq?=
 =?utf-8?B?ZGRZbkJLdE9IWHFOd21oSzdHaFdvK090MEEwa0xZQ0ttdDNxc3JQeDJmdFY0?=
 =?utf-8?B?YU5MZDFaUUN2VWV3STg1K3NvVEJKTlBaZFFmb1VDbVVzV1B0VFJvdkJsVm92?=
 =?utf-8?B?dDlNcmcxcThVanRtdlhtelZwd3VxVDJ0YkpITmgrSFgyMTQxY2VCZ3lCNnoy?=
 =?utf-8?B?a0lCZGtVRnhtUzloMnhnS1lGby9HWTBIUlBaVktCNmx2b0wwaTY4a0llMmZn?=
 =?utf-8?B?REllQ1BDSEk2RFg4TWhISzZuS0NYOFhkSWQ4Mjd1Mng2d1dmRklUMlowZCtu?=
 =?utf-8?B?bVN0elpiajNrVXNlR0tHOGkvdkczL1p0elFXbFZyM0xteXRucGh6RWdzZzFC?=
 =?utf-8?B?UTdzQmxmeG1OVDlVaE9WMEtSMm1RaSthYVgvdTllaFBMQm02ZlZ2czhLZ0hU?=
 =?utf-8?B?OHk3ZDMxZ2VJK2t5NktPcFoydU9EWitZZ0R0dXpRV3hXSjZlOEhmSkpqdHZo?=
 =?utf-8?B?b29Vdk9Pc3pwZ29Ud2FvNWRHeWlJT2lsUFhCa2tRZmZidldXc29HL2pGc05H?=
 =?utf-8?B?WUFKOWNjeWZFL3FLTFpselFDb3hmR2FsamIzWWJGck8weERvS2NOZGI4cjBS?=
 =?utf-8?B?d1U1Q1dvaCt3Nm9Ibkk3cW1oclcxS3hER1VmR0pwcCszWTI2UDZzaEVWNkw0?=
 =?utf-8?B?R1Z6OWJxM0c4QzE3N053UlFvbXJqYWtlVzFKY3EvZENjK0pXK2ZsZ28vYzFJ?=
 =?utf-8?B?Zjc4TzFoYktqbm5GWS9LamdtcVdSU3R1cHp3TlBDOWkrSFZoK1llVU9KbUl6?=
 =?utf-8?B?eTJLVTJYOFZxWlVaR1RLUkRYOXpuK0Y3RzhPUXlFNUZOUjlRU1FWN0lKSzRV?=
 =?utf-8?B?WmEwejR1bFNwaEpwUFJtUzdIUklCbDBDQ0xseUdoNEZVeUlHRGc4eE91MUtl?=
 =?utf-8?B?cGRXRisyV01KTEJ0WkpuMmZWdDZHVUNORjM3c2dLczB3SlJIVmlEYnUxcjJv?=
 =?utf-8?B?NmtHaFQwUWoxK0tYNUtiTGpNcWRLeFMwbTJUbmFIRFZtQzkxZUxhWUdJMjYv?=
 =?utf-8?B?TVkyejQ2TzZheWJDRlJ1Vy9wZW1yYW95aHJHMDVoNEhtS3ZLU2dIZ0R3U3BL?=
 =?utf-8?B?eDlYUlIxaWMvVmhxL2d2ZWQ4dmxXdXpreWsxa3VERnNXU3c2bmZieFdPM01m?=
 =?utf-8?B?NWozSitJcGVGR01lenFPbzlzYW1CdFZCdzNlU0kxSFVydzhpdDk2SmFkbk11?=
 =?utf-8?B?OGNtRUhHZXZqOFcwZ0h1cmpOaWthdWV1eU53TnprKzJ3OGhXazAxWURRUEM0?=
 =?utf-8?B?cXNFdTFPRWZPTFV4RExxcCtlQjRsRmxEMEVtNUpBQW0vcXgybDVpdklPTjIw?=
 =?utf-8?B?ais5NmJYTU91Uk8rUUVMbkRHSU8rZlQweFNNekxZc0EvYXp4L0sxb29hYW9Q?=
 =?utf-8?B?Q3VrdDk1d3p0ZjFqNUM5ZG83Q3E0TnMweGRoVWRRTzdyM1U1bFh2L0hLNzlH?=
 =?utf-8?B?T2YrUUM3WjRFOFJrM3lPSDFPUzM1Y3NtZW9rZlF6MktCRzdxS2RNMkZyak1L?=
 =?utf-8?B?NHQ5ZVkxTmhCWVUzZVBkUFpOM2lqaklyd1BuQ2sxRWErSlh1dUE3MWlxbDdH?=
 =?utf-8?B?Zk9VUlRIYXhvbTNJZUpDYlRXSGpTYmdYcEgvak1vQ2R3WXdIQjFQdHptMWlY?=
 =?utf-8?B?bUN3OU1mRUVaQUgrNGpWQ2JSWVNpV21Yd3YzUXVZZWEySjRkNDlRTGt3eTNp?=
 =?utf-8?B?QnJNNjFxQTRNT1U1OWRSek94N2hUdGFxaGxqejQwZ1dhWmtXMkFSMEFlbTFM?=
 =?utf-8?B?UjFhME5jemtwRHVLMG9YTEhkMzZzODQzOGxXbDlySE9ZOUxXeGFXeENHZnZw?=
 =?utf-8?B?Z21rNFRwbElDcVNUdjl6eTVMWlR1WjEzdTZibFdIUHZRZkIyVWdOZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac75eb3d-9bfa-4496-61fc-08df2aabd216
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 11:02:36.3143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +YyWkCwKGL461qosiLtMUGvxPsaghvJNuICBL3TSS/EMNhWHvMYmLguzZdI+68IyiLIqx+JVzAW074WEMMAMBCO3I98KcX8JaZctloS38ms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4929
X-purgate-ID: tlsNG-bad1c0/1792062281-3B8D1034-B2FC85A3/10/78276251493
X-purgate-type: spam
X-purgate-size: 2537

On 14/10/2026 2:51 pm, Jason Andryuk wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
>
> The S bit of an INVALIDATE_IOTLB_PAGES command selects between the two
> sizes the command can name: cleared, the invalidation covers 4 Kbytes;
> set, it covers the range encoded by the first zero bit of the address,
> counting from bit 12. invalidate_iotlb_pages() builds that encoding
> whenever it is given a non-zero order or the all-pages address, and then
> passes the field's mask where set_field_in_reg_u32() expects the shift.
> The correct mask is 1 and the shift is 0.  When mask (1) is passed for
> both, the value is shifted out of the field it was to occupy and the
> bit is left clear.  i.e. (x << 1) & 1 is always 0.
>
> An endpoint holding translations of its own is therefore told to drop one
> page where it should have dropped a range.  The rest of the range is
> kept in its cache after the page tables backing it have changed.
>
> Pass the shift, as the sibling INVALIDATE_IOMMU_PAGES builder does.
>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Reviewed-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> [ Reword commit message. ]
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> This was submitted to the security list, but it is out of scope.  Xenia
> reviewed internally and Jan reviewed from the security list.
>
>  xen/drivers/passthrough/amd/iommu_cmd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/drivers/passthrough/amd/iommu_cmd.c b/xen/drivers/passthrough/amd/iommu_cmd.c
> index 665e882a2d..abfbdf2b28 100644
> --- a/xen/drivers/passthrough/amd/iommu_cmd.c
> +++ b/xen/drivers/passthrough/amd/iommu_cmd.c
> @@ -212,7 +212,7 @@ static void invalidate_iotlb_pages(struct amd_iommu *iommu,
>  
>      set_field_in_reg_u32(sflag, 0,
>                           IOMMU_INV_IOTLB_PAGES_S_FLAG_MASK,
> -                         IOMMU_INV_IOTLB_PAGES_S_FLAG_MASK, &entry);
> +                         IOMMU_INV_IOTLB_PAGES_S_FLAG_SHIFT, &entry);
>  
>      set_field_in_reg_u32((u32)addr_lo >> PAGE_SHIFT, entry,
>                           IOMMU_INV_IOTLB_PAGES_ADDR_LOW_MASK,

As said on the security list, this is probably fine for a fix wanting
backporting, but can we please purge the use of set_field_in_reg_u32()
entirely.

It is horrible for code legibility and generated code, and very fragile
for mistakes such as this.

~Andrew

