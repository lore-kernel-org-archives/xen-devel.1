Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB0A606A32A
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 12:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=oqJkrGtA
Received: from list by lists.xenproject.org with outflank-mailman.1485711.1688854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRTUC-0001gg-Dz; Thu, 12 Nov 2026 12:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485711.1688854; Thu, 12 Nov 2026 12:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRTUC-0001gZ-BL; Thu, 12 Nov 2026 12:01:00 +0000
Received: by outflank-mailman (input) for mailman id 1485711;
 Thu, 12 Nov 2026 12:00:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xRTUA-0001gM-LK
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 12:00:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRTUA-003iSF-1p
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 13:00:58 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af5aa79-e002-0a2a0a5209dd-0a2a450690c4-0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 13:00:57 +0100
Received: from [40.93.201.64]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af5aa77-195a-0a2a45060019-285dc940c9fb-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 13:00:57 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH4PR03MB8018.namprd03.prod.outlook.com (2603:10b6:610:236::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Thu, 12 Nov
 2026 12:00:47 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 12:00:46 +0000
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
 b=r8PSlCQ4kgZAjE76tAd6S5p9P8jz/5TqzgEkltqocFRUAYcpovvAQpQoV2tvCIgbxHpyPlQJ+0R58xRrr0kET3aNaevp+VKzJS17FphZkjhkfKSxxx/IG8wDfVUa1POKR3lS0h+9ytzgp0ZEbqQF0n+N5we3jX9U1g+CoVW/ATz75cjFx2TTlmg40gpxJB7I9JyN2MV9riL8jVKkp5xwJn5zqFJDsCXPnPDbmyEY7iVFo/Vse8RqODKGuBDM0YzQm1iAWONhb6J9w3/V/gTU0shtkmGJ2L8YfZm6ag1kjIBTNuBNIpIIZ1v64KhK2mVSfkI7DotFASRMmYZyqg0yxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=haFdn/+6Ya0UlciSIjaT5FEgL0x/MlS1o2yYgA+MxxI=;
 b=PdZR5nl85TNcCyr95dBG493VWF14hcdYe66AaEQg6CamUhny+KqwncgqP6N2+JoKDXJTIx+7PqLB6THRKweSEkgaI0Vs7TH5y6/vB/zOIB2sJAlnVF9cgRvUP0UPRdtMRlwulBz3MThhoyqtfUXRFVGGaO0Cv/+9N5zsY1bGaSLpkpdh0oOM/gQFwtsKWgyoAeRGJst3wLMvNncc+HUtZ6bTQioJi+zW1HNBGtVgANa3pxkFyFz6OS/uOuX9jwJtS+cw+9L4AyYlF1wH8TY5OI0K+6St0KuopaQhOk1IsyTGx26Fcn/CNexQKCOvdDq3Oh3CIR+h4ZosZWkkM6NcxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=haFdn/+6Ya0UlciSIjaT5FEgL0x/MlS1o2yYgA+MxxI=;
 b=oqJkrGtAdPJ19Es9V6cFOZe7wK7r55MjaRMIYo5YKljplqbwsOpQEWLCQMekVc7wyfUAPcCjLI/SkZ9JJJemlWV5MGwer3o28zR95aDFgIqOxKs7xzXkgAJZNAyfo6kizjSgmvGfWF2f+W5/ikvS4gp4G09bO0d8G+Xzh+5LxCI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <70813602-f5b0-4ffd-8640-f57fccfbe24a@citrix.com>
Date: Thu, 12 Nov 2026 12:00:42 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 1/2] tools/libs/guest: re-read dominfo after changing a
 PV guest's width on restore
To: George Dunlap <gwd@xenproject.org>, xen-devel@lists.xenproject.org
References: <20261111171441.23101-1-gwd@xenproject.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261111171441.23101-1-gwd@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0P190CA0001.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH4PR03MB8018:EE_
X-MS-Office365-Filtering-Correlation-Id: 05a7dc2b-0b90-45ce-b296-08df40b495b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|6133799003|10067099003|261028144727099003|261021121427099003|261022075727099003|11063799006|261009223027099003|261102123227099003|56012099006|261022105027099003|261026140227099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	CbpSIG3xmROZ1UF0oNNyfJUnU7gvehuB4xDTpYc78jmyG7PAnFonF0Tr5H6Z8LJligK9XJ+xkGuAzbbwoNdYk1E22k/wXBIJIISQUGJTbw0/HkHK9bk5BRSaOn0jUlbkz8QW141vkkANzXMGo3dHmEWO6K5evcGDmNmK8qdGMFqL/FEsiUS1zZAvtBJ8v/syD1ObOHYzd3Au6TIxhhvAyOpvsFdvnydQ3i7BF/bem0EVX7tngITEBoXCpVSQeeLcHnDiXbtFxpNkrV1AF+e1RpxH7FfQUnQlSGjdkQeoN2viQr0O4y7z207mmkjNbtU2KJ2LbjvDMRoCuMar9Fk9k6Qa5o2dbf99QfO2mWiYJj+6Ly68minFceQbu7BKGHN6T/+tFPjXj/TiQTXp+53O3rtrwA0a6Z072hqFwaqAReCB5d03YljMtMI4FYrNS7aRtMiok5EbGn11o7lkaEc2FgR04p6yQTTYjOQYAN+zKKklGWUiG/1fc4lI+jXdVB2JfO3my+TJHZuSfcFfDvDf51eUKPFQAaMAgnuSFpp+KeEraTYgX47ANa8H7/oLWzcXhoefN2ROAIlnOPwkvWi8Ly0PWHCEA2pgL2yrEl9O5xy4npBA2pYfx6cEtnXumFylAollUsXgRZfGGzPR1ARxYb9lfNbMogNyf5j320Ty74k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(6133799003)(10067099003)(261028144727099003)(261021121427099003)(261022075727099003)(11063799006)(261009223027099003)(261102123227099003)(56012099006)(261022105027099003)(261026140227099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXUzOSt4c3lkVzhlemdmZGh2bGhNM056QmFMMjExcytUYzU1UGduTEQzUmpn?=
 =?utf-8?B?ZWZmdUdNVjVad0xtK2JlQlk4OFJFNkJzaEI4SU1ic09Zd0dlRUhyZ0xQcXE5?=
 =?utf-8?B?M1dTTU9lOHBQcVBGMTlhMkRDWlJJYlk4czkwN2wzajk3MkdzZWNSczdqVlJ3?=
 =?utf-8?B?YVlpZTRBT2R3bUpnMDVWU3lKb3JicEVJQmpBeXZFcENqcndQL0xjamRISE9Z?=
 =?utf-8?B?b3AwVGIrRFhHY0ROdkVJMS9KU3ZRbTlRSlpYQ3FLaTRIbTlNQmZjdXE5Nldr?=
 =?utf-8?B?SjFYK2Z1WHhaTUF0TUlIcm5HYkRYOHo1dVlsM2pkYmorTkoyV1RqYmloK1gw?=
 =?utf-8?B?eWszb1p6cWszMDJTQmNsZmQvZ2lkOE9BaUZXYTJlZy9ZRk8zQ3FZQVJxRkFp?=
 =?utf-8?B?OXUvQTRaK3Rhekp6Um9LOHkwU2JDSjF1TWtScm1mYU03TGNPc2lKb1hhamNL?=
 =?utf-8?B?dFYvN0NTR0FnbFgxRHNyUjB6ZFBEdGxCZGdrMGl3SnlHb1A5QUdhODA2VEo0?=
 =?utf-8?B?dHh2Mk10ZURYcU01dGp4RGZ2bWtQU2tUWTRvWlU3Ry9lVkdxbGxBMVhsQ0VM?=
 =?utf-8?B?ZGdNWEVlZkYxbWtZRVljblFqczQvYXdyYjVYbHdqZUk4eGF1ZXZlR0J5THVU?=
 =?utf-8?B?ZUQ5ZXVFSW1qa1E3K0FPNVIzVVdwbXRaSElqVVBoR2lxQkJPZ1IzNlB5WlNE?=
 =?utf-8?B?K1pCbVdqYUtMZXlzN0tGMnhrVjJaS21IVFVDOTF4MGJZbXlHbThLNHhVdVEv?=
 =?utf-8?B?MFgydGJWOW9aY1FQb0lINUZHQm90TFJ6dmpDblZhZ1R5TElTVXhvMithTG56?=
 =?utf-8?B?a0tMSlFOY25HbmRqWTBuTWkvaGZQZlZ4bDdhTk9ySUhnY0Y4dUlIWVU2VVdl?=
 =?utf-8?B?MHVzSUFhV0pkT3RZYzRUMFpERU9uUjVFL1lOZ0dJVCtzM3J6amhVcktCTEtl?=
 =?utf-8?B?WFlEcTZoc1dLeHpMMDVVSXVtdHBORm9ib1FyQ0VjMUNsTFk5eno5NG9LcGZs?=
 =?utf-8?B?Q3lPSDM2RnFuTlBhRGJYTmM4RWJKWWc1aXJ6Z0pjSGtOSjRpaS85TmFOcTAy?=
 =?utf-8?B?YmVENEJ5Smh2ZjRsemxzelgyS2FWaU9MMGk0Z2l2dVdGOHZLWlB6MmFqSDJp?=
 =?utf-8?B?WUdxc3J3YTRGQkM2RktlRjJ4U2dRS0tZK1BWSmhBdnNLKzRVN0YwYzBERGxT?=
 =?utf-8?B?QUVRMGdWSkdDTU5nN2Vsc1Y0VjIvVDJhY3Biak05R1NjUlJHL0hDN2w1Z054?=
 =?utf-8?B?UFNiWG1QdW9UaUQ2Z2F3WURHSEhUM0pwV1JjRENtNml4VEZOVWpTei9KZzRO?=
 =?utf-8?B?c0NIVXBOVG1yL005UDB2L3pHb3p3VXpzamExbVlnRzdSTS80aHRsM2krS1FW?=
 =?utf-8?B?cmRieDNUR25QelVoVHBuR3VPVEhJa0g2a3JOVTBXTnZoeFN0N3dvaE0zN0pj?=
 =?utf-8?B?ZGh6WktZNFlVd3hwalVidlZUbUVXbG81SHpRN0hqakpSN2t6OHYvZHBGcnB4?=
 =?utf-8?B?a1JVaWlHMzZhWFUyK3hHNmNDYWlQdk1ja3NXK3d0aC9BVnQ2ZGZCMXRLU1M5?=
 =?utf-8?B?RWh2d21qcE9EeGdHbWtCbFc5S2ZMQjdjVlMyenRHRXhQaHNTWmc4dlJPUDNn?=
 =?utf-8?B?NytFNVhraFprWW9aMjBIMXhEWnpER1o5dmpkNTlJSDU3YVczSU9lS3NmK1Fu?=
 =?utf-8?B?V3FXWElLcTZOZTRYVW1uWlFnVCtSQy80T1BXRDRDUEtGODVuWkdYVjI1d2JD?=
 =?utf-8?B?OGZvaklhSU9qcXBPb09hSytRMVFOamdRT1JKRVlmSjFHQzdtZVRQbjZQWE5Q?=
 =?utf-8?B?QzBEaEpKck1OakFwMXpUeWxseWdpTXVBSk5meUYzdVpZd2hSRW9lTUNLbWVW?=
 =?utf-8?B?VC92UkIvczBVUFlwam9mcEVXTWJ1dnFXdzhDcGRpcXprLzdhdklJWmdMeWZF?=
 =?utf-8?B?WllzMFhndFRNZWlSQ2ZwdW80cTBtcVZpMHFHaDJnVlZXczNhYU0zK0Ivcm8v?=
 =?utf-8?B?VjZvYnovNE55aWtlUW1YVERuMDJISFNFOHpET2V6ek4rd2N1eGJ3NlN1cURq?=
 =?utf-8?B?blhINjh3WGRTdnpQUkxFQm9sOU1CMDQ4bTBPY0lUSG55dWVZUHk2dCtVMktx?=
 =?utf-8?B?c3N3Qis3WjR3cWUxM1NLcWNnTktxcVAvNHczWUJJN1R0R2x4SlE5OGI2MFhP?=
 =?utf-8?B?bmdKbUlSRVRDSFBBWWR4OENkSW5aSmExdHJPNWpWZi9YMVhnbllWeFRubFNN?=
 =?utf-8?B?enRLTlVIS2FGSXd4b0gxaktIMWhBYjdpbFdISjV4ZG5iZG9XeE4rcFBOeHNk?=
 =?utf-8?B?RWlNbnVaL296ek9xak5oUUM5YStzdlIvOFQ4eUFMYncrKzJ0TnA3Y28yS2xj?=
 =?utf-8?Q?T6nUPkR+LOUm75wM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05a7dc2b-0b90-45ce-b296-08df40b495b2
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 12:00:46.0441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pr+Z2/qTO55HqwuomjsNoc811Z/KpUcpGVpT1DU24JqNQAT75D1W1xiRwKLt0UgBOEjuhM8VJDjQQTbjr94fys0Kp1v5cBFTNZqPMmk3wZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB8018
X-purgate-ID: tlsNG-16d1c6/1794484857-FCE0677B-23F8EA4D/0/0
X-purgate-type: clean
X-purgate-size: 2580
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/11/2026 5:14 pm, George Dunlap wrote:
> The x86 PV restore code reads the domain's information once, when the
> stream starts, and keeps it in ctx->dominfo.  When the X86_PV_INFO
> record gives a width other than the domain's, handle_x86_pv_info()
> changes it with XEN_DOMCTL_set_address_size, and then refreshes only
> the guest's width and page-table levels.
>
> Since 8a9255405ca6 ("x86/domain: adjust limitation on shared_info
> allocation below 4G"), making a domain 32-bit may replace a
> shared_info page (if the originally allocated page was above 4GiB).
> The shared_info_frame read when the stream started will refer to a
> freed page.  handle_shared_info() maps that frame to write the
> SHARED_INFO record, and process_start_info() puts it in the guest's
> start_info.  Xen holds no reference to the replaced page by then, so
> the mapping fails, and with it the restore of any 32-bit PV guest
> whose shared_info page was moved.
>
> Re-read the domain's information after changing its width.
>
> Fixes: 8a9255405ca6 ("x86/domain: adjust limitation on shared_info allocation below 4G")
> Assisted-by: Claude Code:claude-opus-5-5
> Signed-off-by: George Dunlap <gwd@xenproject.org>
> ---
> Not tested end to end: no 32-bit PV guest here can suspend.  Restore's
> steps replayed from dom0 on staging, on an Intel box (create a PV
> domain, read its info, make it 32-bit, populate 1GiB, then map the
> frame read first): that map fails with -EBUSY every time, while the
> frame read after the switch maps.  Build-tested.
> ---
>  tools/libs/guest/xg_sr_restore_x86_pv.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/tools/libs/guest/xg_sr_restore_x86_pv.c b/tools/libs/guest/xg_sr_restore_x86_pv.c
> index 876748c11e..b72cacd000 100644
> --- a/tools/libs/guest/xg_sr_restore_x86_pv.c
> +++ b/tools/libs/guest/xg_sr_restore_x86_pv.c
> @@ -646,6 +646,12 @@ static int handle_x86_pv_info(struct xc_sr_context *ctx,
>          }
>  
>          /* Domain's information changed, better to refresh. */
> +        if ( xc_domain_getinfo_single(xch, ctx->domid, &ctx->dominfo) < 0 )
> +        {
> +            PERROR("Failed to refresh dominfo for d%d", ctx->domid);
> +            return -1;
> +        }
> +
>          rc = x86_pv_domain_info(ctx);
>          if ( rc != 0 )
>          {

Oh lovely.

I think I'm going to start by putting together a real migration test
including PV32.   We *need* to stop errors this simple from slipping in,
and there have been quite a few recently.

~Andrew

