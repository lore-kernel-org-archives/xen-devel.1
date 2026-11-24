Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6B3606A32E
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 17:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=EgdC5bU2
Received: from list by lists.xenproject.org with outflank-mailman.1501367.1697437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVu3g-0000tc-KP; Tue, 24 Nov 2026 17:11:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501367.1697437; Tue, 24 Nov 2026 17:11:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVu3g-0000tV-H7; Tue, 24 Nov 2026 17:11:56 +0000
Received: by outflank-mailman (input) for mailman id 1501367;
 Tue, 24 Nov 2026 17:11:54 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVu3e-0000tP-LT
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 17:11:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVu3d-009RTQ-24
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 18:11:53 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b05c545-bab6-0a2a0a5309dd-0a2a4503c79e-40
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 18:11:53 +0100
Received: from [52.101.62.8]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b05c556-fae8-0a2a45030019-34653e08f5d2-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 18:11:52 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by AT6PR03MB782546.namprd03.prod.outlook.com (2603:10b6:170:10a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 17:11:25 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0662.001; Tue, 24 Nov 2026
 17:11:25 +0000
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
 b=s/CssfOJqeBTGVwJp8XmuVtHIpA/gjPenIIKwQJEIxQbuwxXCfUi5nIAzthsIqKlUeaJXCnMKTz9uBDSxr/SBP0Nw2/aMXWpCi/czxHG6GYbyARW4ScPxWM49SQ7YifNFJv0LRkhqgDDEXhziTpVuhT88CzeQN6W6SjcOv2fv6bURvF/Oj7qTNy/bDlJ+46sILEp6FBLb9f/6KnzEAGh/4LBTHqa/BkHzlujoHAkEqcb4V+fpmlCMyf3L4/pMH2g1Ag0ezi9qiUVkEC7ChPNQ0qMa8poLb17BtSHHNuBkdk65fjeq/u1SA3RNTW4dYQhVwR3YV+Q8Qu6Iys0QkfDSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWK5CNXHHZ0B6taOS10AfDynuM6A2wpEE5HbRKoxNEE=;
 b=JB3CafZYqApT0HMHKNE4K1hJ0wJcTYDdl+Ykmfn/A32WIaVhXCFIgovJ8O9bsqE8ab1egdE1os1xGZTGG6GUPUhkbmmjXPpTnG6TLNOmrj47gUYmp6QIkfnmbVPX3SZG2Z4KSncrfnQCSSc1UOeMU5l3atcuYckIr91xlfW1cyp1G07AcVfTTGJ/RvssBz6eIG239mkqlMOlrzz2CS+fsU2me02uraIxa+itgfuOvgWm0KgB60oUzsyezMBszIH6NcNEngo+4vtWDgSdtGuXH9TdomRsg4a7TEAgg4LmCEdEQBnfdwwGxuHHl1cVpYf0ZsBhtqb5G6b4WcukRMqCyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pWK5CNXHHZ0B6taOS10AfDynuM6A2wpEE5HbRKoxNEE=;
 b=EgdC5bU2o2xsPiOK2IyJtnA4Ep2fZyKXvJ12Qy3txUHlADFvFL1rrYWqmCFJ5T7q24N1c1QQqGERMmqdJK+EhNcWe/x2AuIAuvDIZhTRNSZ+6rtsUvSmgRmRo5kdW0XuZC4Dtt61mCijrNhPGq1+pZrzNTqQiPppRJL2/qHhyAQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1341e7c0-cde4-4f70-9a6d-141ddddb4ea0@citrix.com>
Date: Tue, 24 Nov 2026 17:11:21 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH 1/2] x86/PV: correct descriptor read sanity check
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ba2a2c31-24c4-4ca2-a2db-fa3745ce2fcb@suse.com>
 <ef9d7231-32c5-4b7d-aa8c-b54cc0c48349@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ef9d7231-32c5-4b7d-aa8c-b54cc0c48349@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0062.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2de::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|AT6PR03MB782546:EE_
X-MS-Office365-Filtering-Correlation-Id: 59129bc8-bf83-4175-fc89-08df4a4df889
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|261102123227099003|261026140227099003|261026121527099003|261022105027099003|261028144727099003|261021121427099003|261021123027099003|11063799006|4143699003|5023799004|56012099006|10067099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	kA14+QpUWNp7ra15iezHNVcyXITWG6bJH6PR26hldx2XaVwoabRvig7xWOtt+N/7qj7Ush0Ke21Evj5z54HSEjp+uo69xXV6U+6OvHf1SV31vc/mCogX7P+U4kUDg5StMA0spSfsAvJn5GJPwTd2RKO5OCNEO/srQXvs3Y8QcGXK960oDXYAbqbA0jaL/3fp19eqQLtrJmChXlPAez3LgpqS+1/nlJ/uUW3efxwf7NQYS+pnS+ctXDRlvkUYNwuMsjD/C8ia+yqcP/RxwC3X6O0UrtKjXfM+KhRgiekv4IIZFv048LMlcm5ueZwqHEJX6QHcMvFW4rm7KJEnt9UBPdL8WHEwYCQks1XvSwPFrDB22pfE/qWQ4plIVrPpCi+jJ/LGC3vd0T9LOndKNTdja0mJl6rvlmPJCQ6tXKJd4R2tFm9ef1ocFlrL0CUCecxFgqbWdwo1/UyxUsOyIrzk+DTl/92RtwZ70YpKHJFyJtQ6huxVOBGyrsco4R1+XWolBuKYDC5dtB/qDShJD5ZdJDkWpKxUzYCR+RsZnblmSlHX7/rL7CrKANSdT6GD8eMiqt6d+4AZLo037+z1Hpj/d0ZOVb1gt+hqaARyaLF3bDs3q9HNsdsbhyNOAcBcHaB+57vJ4CdNJy0NW+TN5zdi4nvNTPzdvKSoDG8RCinOoGI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261102123227099003)(261026140227099003)(261026121527099003)(261022105027099003)(261028144727099003)(261021121427099003)(261021123027099003)(11063799006)(4143699003)(5023799004)(56012099006)(10067099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjZCdWpmV2craVc5elIvbmVic0N3ZWVGQmt1NzkyVUQ3SFYzbmlQVHRMNHlL?=
 =?utf-8?B?a2FWK3BxK1B5MGFNbCthd0VHZEtXblBsZHFwQWdxaDlNVWo5aEw3eDJUajZQ?=
 =?utf-8?B?RE5UZHFEVUY5ajFzM1BwRTFoOTZzVU5JRXovVHBwWEF6ZTZoNVhiMTFmVW9G?=
 =?utf-8?B?WElreEhrc0FCYlA0clBBaHkwSE54cWRLMmtSY1dxamNTUXNKU2M2bzM1WjZz?=
 =?utf-8?B?MWU2Y1RMaGpRVjhpc0ZMamJrcURtZjkvVjZpaFZTOHFyVm1ESUkxb091MThR?=
 =?utf-8?B?OEkwQU4ya3ZDZjcxT1Z1N1NPcmdkaitCVXJ2T0hsbzlscFpOcEQ4LzJEM0hN?=
 =?utf-8?B?ZjN5V1pjWUhsRlArYXhOVFA0QjhVVmx5K3Z0eVRGZ2JRY3hieWkwTFBjMnFP?=
 =?utf-8?B?ajNkYTFnbkJQdjBYWFZqbjRyV1dmci9VZXVwTjhHc3ZqWURyelB4WHR4am9R?=
 =?utf-8?B?ZTBaaGpXUll6Wi9pMzd5em90NzBXU1dXMmNPWTdIRDVseW5vUklRb3Nyamdu?=
 =?utf-8?B?dE5IdGVYUW9qN2hnK0NYRDBFSnVYQWMxKzlpUmhsRVFFOFJUclJrM1JvcGts?=
 =?utf-8?B?QUxnNGt4NUdzaGc1VFRhNnUxdElpaER4cEVwRTl5YkRiWG93cUpPMEVBUWRa?=
 =?utf-8?B?VldvMjR4TlQrUmtKMFRRUVY0c0dvQk9oczU3RGtFMGdVZnJrTFZtVzJVY1FV?=
 =?utf-8?B?K3ZSc2ttanRDWlFRakhqSjh2WW84SENUNFQwSWZLTGZiekdnWVplVkk0UFFk?=
 =?utf-8?B?NzBiR2NZOEllY1VVcE9acDRmbVhRektiSVB3YTdCcFp6dTNya3BrRWZoTEw2?=
 =?utf-8?B?WnI3cVlWRUducEVnMkNHUjJEZ2xyNnd6bDRMVVlIUytoMkNYNG16K3hxeHdJ?=
 =?utf-8?B?M0dxMHBUbzdkNXhpYWpEMFYydjByMFRoeEh3M0twQW11Zk1NbkhTek5wRjBR?=
 =?utf-8?B?TVdQWGludVpvY3dUaXJkcmNwOFErSkxXdVRFTGl1bVZvSUJDR29zZkFWYVBj?=
 =?utf-8?B?d0RPNWNWN2F4QXNzK1BNZHRDVXhOK2xETWV0ZmVJVFlVUmYydEc4YWNkdlVO?=
 =?utf-8?B?bncxRVc1RmtoSUNSOHN6Yk9nR2RxOW1EdFhQSWNmZVREZ3c0K2JvTGVKSEhP?=
 =?utf-8?B?S3Z5L1QvZi95SGIweW1PdDNITHl5VU9GcGZsWS84bk1UVVNHY3NMUlBpYW5i?=
 =?utf-8?B?WVU4Ty9peVRQMVFxTEpIVjJoTkJ6QlYxbTlmL1pnQmRmY2lWbVdaOU52SXNa?=
 =?utf-8?B?ei9IQTBvS3NTbEFwK1JkeExZRnRNSFhUVkJGc3pTRnFlZm41QzUxNXU3U1hm?=
 =?utf-8?B?Sm14TjB1Z1Y4Z0w0eit2T2pnYy9nZkhQZWIrdmlYVU1Wa2QrcVNrVFpESzdW?=
 =?utf-8?B?K2VMY3MvdVlJdGVGVkxzaGk5eHdFZ2J2MUNlMG5KMGhWUWVSK09JRnFVcUQr?=
 =?utf-8?B?YXh0eUJhWXBwUllkSytYRnFaM3VlZFdJLzdhSldUVXprak44K0JWU3RoN09n?=
 =?utf-8?B?SHBsdkFVdGk5a3U4M0l1TzY4ZVdrUmxzdExyMHFFZXh1ZTRYT3JoMkVpWFFK?=
 =?utf-8?B?QWlGNkN3b2labGFaK2NQMWVIRW1yY3c0M29BTkQwRkM5MEttWWRCdjkwcVdp?=
 =?utf-8?B?OHc0dFRoY2JHVmpORkdkbEF3c1F6WVZLTTNxV0JteVV5a3Q5dlowWW9xdC9L?=
 =?utf-8?B?c2RjQVR2STZwbENpWVJmaXpiZThmeUIvc0xRSmpKWXJFcnhlbVVCS1J2WVlx?=
 =?utf-8?B?ckpJdnNJUmlyT2VwNzZ4Sm5sYWtBaDV5blpHUmVjbjNVdS9VK2VnMmhQL0xY?=
 =?utf-8?B?QUdwRmxMR1RBZWdJQzFxdU1sbXAxa3lNKzNWWDVZM3IySFpSTWtDZ21TbE02?=
 =?utf-8?B?eU1EMGFJd3V2VjdjT1lOeWlBaXVrUGsyemprRFluTUQ2dmpVeStWZi95cnNQ?=
 =?utf-8?B?cjFRYldqZFdaL3JmenVaMFRvanRpV1VtSXZqM2NvS093VkVQOGFxZzVzZy9X?=
 =?utf-8?B?SDd6QXRqR3A0RkJNWlFkQWxMU3Vrb2ZrTTR0TjJZdjdSMXNlODNuZTlITlVa?=
 =?utf-8?B?MnhON0FxcXZZakFGUzJWZVN6MXFOUkFtemk0bEI1VjdDdCtGMWVlU054SXBX?=
 =?utf-8?B?K3UxelpQNmFxb0FSUkVJdGQyTXo4UWxieFN2T2ZUcHE4L3JJYTJtd09jMDZL?=
 =?utf-8?B?MlM1eVNGZGpTWDJQYWh5d3JnOW1XcDBKRGhhQlk1Q01IQzRGL2lyNEo0TWVY?=
 =?utf-8?B?SjE3RlJOeGZVWEtuYUFxY2JuZ3FnV09GRGkxRjdFdHY2Zm5sQ2MwVG5LWEVW?=
 =?utf-8?B?dE9NVFJheG5XVmwvOEZlZ0NzZ2lwUFNON1BHeC9LTy9PanFkVDRTdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59129bc8-bf83-4175-fc89-08df4a4df889
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 17:11:25.4521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pyXqszYFa8hMuHP8YIUAixLDWASZONGF77Kxdg6kNylMzqqyHto1k2MomtUB3VnvPRmNoFyYTQUVF7stdrpSoEFhn1Ze3cs4EDCWw5G28b8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AT6PR03MB782546
X-purgate-ID: tlsNG-33051d/1795540313-6F6C64E9-A4512288/10/78276251493
X-purgate-type: spam
X-purgate-size: 1951
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 24/11/2026 1:30 pm, Jan Beulich wrote:
> Checking what LAR returns against what we read from the descriptor table
> requires that we check unaltered values. The clearing of L therefore needs
> limiting: Do that just in *ar, and use the then unaltered desc.b in the
> BUG_ON() instead.
>
> Fixes: 8d6e195a2def ("Adjust emulation code to deal with compatibility mode guests")
> Reported-by: Roger Pau Monné <roger.pau@amd.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/pv/emulate.c
> +++ b/xen/arch/x86/pv/emulate.c
> @@ -37,11 +37,12 @@ int pv_emul_read_descriptor(unsigned int
>              return 0;
>      }
>  
> -    if ( !insn_fetch )
> -        desc.b &= ~_SEGMENT_L;
>  
>      *ar = desc.b & 0x00f0ff00;
> -    if ( !(desc.b & _SEGMENT_L) )
> +    if ( !insn_fetch )
> +        *ar &= ~_SEGMENT_L;
> +
> +    if ( !(*ar & _SEGMENT_L) )
>      {
>          *base = ((desc.a >> 16) + ((desc.b & 0xff) << 16) +
>                   (desc.b & 0xff000000U));
> @@ -57,7 +58,8 @@ int pv_emul_read_descriptor(unsigned int
>              asm volatile (
>                  "larl %2,%0 ; setz %1"
>                  : "=r" (a), "=qm" (valid) : "rm" (sel));
> -            BUG_ON(valid && ((a & 0x00f0ff00) != *ar));
> +            BUG_ON(valid && ((a ^ desc.b) & 0x00f0ff00));
> +
>              asm volatile (
>                  "lsll %2,%0 ; setz %1"
>                  : "=r" (l), "=qm" (valid) : "rm" (sel));
>

This is a TOCTOU race, which reads the GDT/LDT 3 separate times.

Nothing prevents another CPU issuing do_update_descriptor() against this
descriptor, and hitting the BUG_ON() despite the care taken in this
patch.  Nor is it legitimate for there to be such an interlock.

I suggest we just delete the CONFIG_DEBUG section.  Because the segment
registers aren't architecturally available for PV guests, this check
simply cannot be made safe.

~Andrew

