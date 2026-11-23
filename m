Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB84606A32D
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2026 09:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=p+oO420D
Received: from list by lists.xenproject.org with outflank-mailman.1500310.1696533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVQ1B-0002Gf-LA; Mon, 23 Nov 2026 09:07:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500310.1696533; Mon, 23 Nov 2026 09:07:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVQ1B-0002GX-Hu; Mon, 23 Nov 2026 09:07:21 +0000
Received: by outflank-mailman (input) for mailman id 1500310;
 Mon, 23 Nov 2026 09:07:19 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVQ19-0002GR-Ob
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 09:07:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVQ18-00HVEd-Ts
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 10:07:18 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6b040236-e002-0a2a0a5209dd-0a2a450aa6f4-46
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 10:07:18 +0100
Received: from [52.101.83.105]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6b040246-f2d2-0a2a450a0019-34655369cf2e-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 10:07:18 +0100
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Mon, 23 Nov
 2026 09:07:16 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 09:07:16 +0000
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
 b=pdhOaGdLMyiFG2O/NP4nuI6H1inB+b04p4NPtbfBukTNiVzYnsXRpenbkiCklSp5TwbP6zam9aGEn5s15iD3+BMoOS/Z8M1/wrGQzlJxZmd0gXsBPHszTFRGCxGIo1VHlXCzCSi3OLeGEb2wRxMONeZVmi2XLvHaCwaak/L2SpX+if+kd8uglSojgWjiGKCvt7838Clt4qm4WszxZpZEXB2ZqDJ+/1tIjC48t4URL+VitPZlGGa5U2aY1lDdtduuZwLm+kjU9vNVwkUss/OeE3/nNi07MsybuMXcHa3/rvtN2Oj0s6QP4rteurMU8tEArDiLvsFWp7aNZ13euczQdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t13nu1rutW0GqU3qPP/fdpnsUThLGro+H7MXGyV036A=;
 b=Bry/NyFjIiC5DOxiamPjoW+tt2e/tPs5yhCZ9EBny68pebuqYlUXKPXCcCN98Co0WlqSz9W4C4o1iWQ9Azc50OE+1wkUtb9c/Icdn2y6ZXk+rl0i7C+rxDpheJ7rjKb+39R30m5iRAWbwzBNjY/SoYbvkp2kf0eQHj9FJcsobnXc1eDbCTbmuoN5gxtcGft2nIWWT9U4DFXWBqdUmWBdjW+0IAenaF8BeOR8UXcmmwkg0RrEvn/0jEgbfmVAmxQqJ+dWvDqP4X7lCsZoGB/VcMQ278ziQE9ZOEKdEfFk1U3NQzbV0lynII63mWON+UB4v8X6aAf0ei+7TXHeV9rFyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t13nu1rutW0GqU3qPP/fdpnsUThLGro+H7MXGyV036A=;
 b=p+oO420D2otjjs/vI1l0q5PuN01U9jgR8ckCZDUSEnYI9mhcwjzuY4Cednf4cvTKptn3QmyecsXE/OtGOfJGx82xaAa9UMXJNrhaQXU4McyQl2mdJE42HnooN7uZpBfanl+/lJGs+dvt0YJR70faPP/XQnodHhEEBWTsTapoGu0oh3GcXVOUu2aKB6+DY43YzjrbbxOwaT8arIMGoi4OschVKWPI5vC4zq2UnBEKPS9QLg3O/6kW5chh0D7hZgoo3LQTQfv2jmhYuQf3+Wa0aOhbpaMa71nFIq0X5eqTkJZ6oGVOgM/hWkBF49VTAWqovpvIGaY8vAsCjjGfXoxyYg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <49f83283-5cb8-4b7e-9b8c-f0c25622c35e@epam.com>
Date: Mon, 23 Nov 2026 11:07:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/misra: add Directive 4.3 to rules.rst
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9981629dc9ea12a2bae9a06b70a4d2daa0556dc3.1795361846.git.dmytro_prokopchuk1@epam.com>
 <5ab98397-7a25-4571-a404-8f123bcf8921@suse.com>
Content-Language: en-US
From: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
In-Reply-To: <5ab98397-7a25-4571-a404-8f123bcf8921@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0030.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::40) To AM9PR03MB7526.eurprd03.prod.outlook.com
 (2603:10a6:20b:3de::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR03MB7526:EE_|DBBPR03MB10396:EE_
X-MS-Office365-Filtering-Correlation-Id: a1257dcb-c70a-4927-ffb1-08df49412ba2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|18002099003|22082099003|3023799007|5023799004|11063799006|261026140227099003|56012099006|4143699003|261022105027099003|261022075727099003|261028144727099003|261021121427099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	LSjlsndewLYSK953SgmITPeipg70HAwIQcjflPbx3NmjGT9uHDjmntP0na0QcztweZnDuQK48NGl2K8y38q00Fg0jwqx2dkAyqk5B9jvBL3VodcrIfGszLm1vfNgqRR3CfFh/POOnDXkmlCUGLrY76iFq/MTXGDdvkpyw+9mfIuqAgm5H/NPJnTDos2k/t/J+lhpTc2wo53J3VLSwfsROr8xckYRJo529ANTKEm0v8GMbp7WoLnEPx4HPg4ZLSlIKiZ70UTz2H4hLiVApyrNQkNBxUz/DZm7bqCD68RH1ZfTuY7y6SSwJzSv2gholPcI3OE3Dtp3DNwgcNeaW30ULeg1eamXiSCOiFFivBaJuaHUDSCgG5ZDKxumPj5l+azNxlmEJDF3IALkHmn7J8O8VQDtxz2WQBntRuTwl/wnMs0qTmBl1woYcfXBl/7x2WHC6jJPTqOLGpZzzHPdybBhk8RWB7wa1rtNMPMihsYA2oZeNjGPvb4/oqUXrtaBONdn9wdHaTXWZK8GDb8a2oT42owzsodKm5LfFew0oVXDLIvSMMikRWYAURZFsdHIJBDMqg2kD0JDYLYMxfIJ0J8v2KW3OORlLzbUP9RWzXivfmYrOkq1mh5ZpP1ruQhCgVIvaDCanuTwlXAqSfr1rMOkKJCinj9QBEO6I2qc0VncpnI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(3023799007)(5023799004)(11063799006)(261026140227099003)(56012099006)(4143699003)(261022105027099003)(261022075727099003)(261028144727099003)(261021121427099003)(261102123227099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVJyRGtjNmlVQmhwcllVVFlGTFRVODZBRDVMVTJsd0FXaFhjeC9nKzV6N2NT?=
 =?utf-8?B?emZBTGMzQm5IdVhFSkFiVmhWTTNDQW84c2ovbkpEOHphSnFvYXU0RmRieUVx?=
 =?utf-8?B?ZUpHN0tBMXVZQzZLWkJMTWVzRWlZcXh2NHY2WitHY3dNNU0xMDROdlNUL3R4?=
 =?utf-8?B?QmhybzF0TlRTQ0E4dHZHOFNTL2l3R3p3WDY3R0oyZGtucUhCM2RkNU5TNk01?=
 =?utf-8?B?NDM5aXloZ2t5SU1LVlBJV2hNUDIzU29rQXZHeDdURVVmTFp3djErSFN4WGg4?=
 =?utf-8?B?UXM2SnRYczRYbFdzd0QvNEFMcVNyWWRsdVJnajBtdk1iTVNPQnZxTnRZMERs?=
 =?utf-8?B?MEJWZ3NlQU96Q2RvTUROcE5QQ205U3VrRmdSd2xKYzBuWXArVnRVd29oNmhJ?=
 =?utf-8?B?U29VMWwxUG9FTVdLWTBuQXdianJ0TjFxMDZZU2VKU3JrMzFJVktuMm1ETGVa?=
 =?utf-8?B?bFYzM21hSS9IYVdrVWw5V3doWE1YTytzaHZobEQzNkFHOWdwUjg2S2hYZG9U?=
 =?utf-8?B?bVJWSjN6RkZ1cmF3WWRRWUczalR0MDNGVk1mWXJVY2pxak9mVmxhUE5BYU9S?=
 =?utf-8?B?bzh6TFVBTTlzaE05U2QzZkFRUkN1MVR1Um9iODV2TlIzbzc0S0l5T2Y4NG9v?=
 =?utf-8?B?bTZ4cFdPbzMybjlmdklCdzJBd2hpbTAzSDhFRGpwejgyM1BJcFUxakU4WlU2?=
 =?utf-8?B?cTdMQ09CKytUUUM5eE5SU1hia253TUhmRmRTU1k1SWpTZXJZMi9yK2lzRlhJ?=
 =?utf-8?B?QzM5UVhZWjExVE96cXlWMy9Ic3F2aTNZTXVrenFEV0F1MlJrbDQxWDR4SjB1?=
 =?utf-8?B?aEFGekg3SktIS2xHdjRhZDZDZTVUejBEenU4V3lKNFVtdWRVRnhVTnRnL3hE?=
 =?utf-8?B?VjdtSkJjUlJQNXJjakxlLzVhRHdkTkhlaDdFM0NoM1d1QlNVcGFGajlNUW9W?=
 =?utf-8?B?V0tLa2NldHJiL2U2Z3l0Q2ZlNXJ4TlNHcllZaFZsUXdIUlUwOEZFYzhNVW5u?=
 =?utf-8?B?T0V0RUk0S2VFKzFxQlRlUEJJZ29pRjZ4VmdtSzR5dE82Q2Q1dGRNRWdEQUFE?=
 =?utf-8?B?ZlVhUUtRczRWQVdMNFZkUWZJRVdMNHkvbk9VVlZ3K3FJZ1J3c0duOHQ1K0ZZ?=
 =?utf-8?B?OTVEaXluNThRb00vclZoMEtRYU8wZG52ejBOMnVXWTlZSGc4M0V0bEFncmpa?=
 =?utf-8?B?NDRhanJNYndja3NVZWg0eXllZi9YalJXRTRGQjN2eTVBMWdNbWJ2aXo1S2pv?=
 =?utf-8?B?NTk1dWcxcW1neWVvb25nVllyS3JwUGowcmlvcy9HRGNiZUsreldKS0F5YWcw?=
 =?utf-8?B?YkkzWmsrWnlhTGU3ak5QQkI3b3dIVHhzVlhDYjIySEM1c0JQRVhlanhxZ290?=
 =?utf-8?B?a1ZBdEZmYmJERnFPQ0hUaEF5Q3d6cS9pYkt6OVZzSXJ6R08yUkprZUFjMENl?=
 =?utf-8?B?OWVTU0ZzbGEzRWdseXBiNkhDOHN5SzNXZCtOdWZjUXFIM0xlMG9aZEIzV09L?=
 =?utf-8?B?MXN3NkFTcndBcU9KdUlWNTZ1SGVUMHhMN0V0OEM4S3ArVjVHenZxdUNwWWZa?=
 =?utf-8?B?NzFmT0JLS2FtTllkVVhDaHNGR3VSWEdPejBMbnR4a2UzNXN1RThNYzFuZG4w?=
 =?utf-8?B?ZFRVZkR6M0t5aWVrOEZhM0ExVFRiRGI5dThjUS9KRStwZEE4UFZaRFM1ODdD?=
 =?utf-8?B?bWl5cXl1NFN5SzJLVDlub1JLbSs4VkpFZDY3Uzc1c2FSd1BDWGFVVU9MK2pj?=
 =?utf-8?B?Qm4wcWpJYTRwYVN4TlNjUG5vUElDZlh6SDVFL0hLeU9hczZReTZMcHBrUUFX?=
 =?utf-8?B?RCsrb2NhN0pTOVpNajM2OUxIcXlOcmVxZ3JRZEkxWkVISXFDRnhpS041bjhR?=
 =?utf-8?B?eXZ0NXJzV2dlWklubkJFV1YzSFNpZ0Via3VuOVo1NXdSaG04RFRXdGN2V21G?=
 =?utf-8?B?TC9oQlJBYTBOM0RuWXcraFZ5dWROcEt5aUJHRDduZ1BEaWh0ZjQwdVBkUVkx?=
 =?utf-8?B?NU40OWg0cm1kSVFtNHhqVk1zQlN5UVlNcHJTWTdTUmVDbW9idGZlWEoxN0NN?=
 =?utf-8?B?R21rbGxQZXgwSVRobnVRcUxDVkIyTEFpZ01sZ3dBZlQ5Q3ZuYUpvNFZVenVy?=
 =?utf-8?B?SVRtOXhHb3R4Z0szOGdjUy9rRHl2OXpXeGZuSlJJSVhHZEVOb01kcmc5V293?=
 =?utf-8?B?L1lIUVJaTHJrcTM3Y095TmlVS0kva24xLytnMEdZSTUyUHl1Vmh3SFFuclJI?=
 =?utf-8?B?Q3hybFNneE95SHkrR1kxNUVaU0hLZ3F4WjhJNEVUYzU2TW1VM0dVYm01WkFX?=
 =?utf-8?B?RjV4cXNWYUN2WTZ0WmRjbDFVR1F1SUFsbXdCUkMrbjBWckFUN1pwRXcyeW1D?=
 =?utf-8?Q?E58HVAKd7Opukduc=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1257dcb-c70a-4927-ffb1-08df49412ba2
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 09:07:16.4931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n1eTcQou0F3MkladfRYecQ0KZesXpsD11WNzdv39m0S/uqNtu2icPHBNXBtI0JPAelijGGOzg+zyHIpLPkVPEr+TabQY0pR79cE3YBo2+tY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10396
X-purgate-ID: tlsNG-4011c0/1795424838-510C9CFC-0B328BD4/10/78276251493
X-purgate-type: spam
X-purgate-size: 470
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jan,

On 11/23/26 10:04, Jan Beulich wrote:
> On 22.11.2026 16:39, Dmytro Prokopchuk1 wrote:
>> Directive 4.3 is accepted and ECLAIR reports no violations for it,
> 
> ... and is already marked clean. Then ...

Please, update the message during merging.
Thanks a lot!

>> record it with the other directives.
>>
>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Jan

BR, Dmytro.

