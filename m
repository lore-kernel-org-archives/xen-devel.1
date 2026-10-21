Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9A7606A319
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2026 13:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=o9nU0xGz
Received: from list by lists.xenproject.org with outflank-mailman.1457111.1670016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJW6Y-0005UX-6S; Wed, 21 Oct 2026 13:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1457111.1670016; Wed, 21 Oct 2026 13:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJW6Y-0005UQ-3h; Wed, 21 Oct 2026 13:11:42 +0000
Received: by outflank-mailman (input) for mailman id 1457111;
 Wed, 21 Oct 2026 13:11:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1xJW6W-0005UG-HR
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 13:11:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJW6V-00GupP-UQ
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 15:11:39 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ad8ba06-bab6-0a2a0a5309dd-0a2a4509a96c-18
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 15:11:39 +0200
Received: from [40.93.198.12]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6ad8ba09-be1a-0a2a45090019-285dc60cc7a8-3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 15:11:38 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by LV3PR03MB8001.namprd03.prod.outlook.com (2603:10b6:408:27f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 13:11:35 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 13:11:35 +0000
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
 b=mRFVlnUd67sZs0tWj5BMttspFSYmAXUojQrN/wvgcbybpdA+djRUTusVrqblAnn7ajOwo8B9rWznzKYBrFY1yXNgxFIwXkK7psWoRW481rEmhE/zA0iGj7ephRWX6HmAm1ijdO1S1xDIu/N03AAQDnTy9daFfKqBlr2uT9J9YJzbJYYraiskDArKHAMBee1XZqiYu7Sr5Cdj6dgl9j14PEFmh2eP6P8dDu8TRAdJ6ih1LPgUQIO4tlMS1+pqIVfxGCX+VOYQZbIINKVVZQj+RflPlaGvFXy7T3UG+Syvmk0lpkLxN5kzqyPPu6UY6gnFf2Q7E6NKb8FDue5FSBzR6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eMKq2hosY3n2Jkdt8BIfiPZxBfY4uYcPjsGcQxNPe2A=;
 b=BFh6Zcrf8gC9+KURAnSVrhlV7ZMjjH8TQ6Le7x06G7nnV/vdt7cus1MzV+B16y480pGtMV1NEd+iKnnG8Qn+1Lz/P2zOXpcqTdSCtjP+t8ENo+yz8om92fEkZth5k44QG1RZoINZRcY5FQVetbryqtuAmJ+xr66Dixy5tCc3J+BAA2uRMXFTIht5K8+b094ST6HPuf36ZubpuQSGTKEL+tzUl9vkL+TWC9idDfFpA0DhKQLQtkOZGKw+SeQGqVd+QgfEnGdaNBr5H+SGxTU3EnkyfzvohVKxNT66RJJ0ne3/uu84RFcH3wyv0G4hGUIPNG4bEgGP6TA6skkBSLr36A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eMKq2hosY3n2Jkdt8BIfiPZxBfY4uYcPjsGcQxNPe2A=;
 b=o9nU0xGzDwoqqSHd22N/k7OZ8Qz8r06eJzuRDA/hPvScCPIIg0tgWM5tsqEkSCRlqMT9tn3je2RDFS5waQtXfNZKXdiyPbAUrh0SUERHTSb++JiAtRhh/fYOaehNoRgodCAXEZZQ4YliiXqLIcELVjWphfmG3hHPl1zDOWnddAU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <26141f92-f6cf-459d-ae56-e010db9062db@citrix.com>
Date: Wed, 21 Oct 2026 14:11:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86/hvm: Propagate emulated CR2 writes to the VMCB
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <stefano.stabellini@amd.com>
Cc: xen-devel@lists.xenproject.org, jbeulich@suse.com,
 andrew.cooper3@citrix.com, jason.andryuk@amd.com, teddy.astie@vates.tech
References: <20261020213315.3641133-1-stefano.stabellini@amd.com>
 <ath1oW-R2OlWy60f@Mac.lan>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <ath1oW-R2OlWy60f@Mac.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0003.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2d3::17) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|LV3PR03MB8001:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eebe9ca-c5c0-48d3-2a0a-08df2f74d57f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|4143699003|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	WRKTsF3Ul6DkQIjVmuYKIXtUrwf1CdvIRxwZgRQUZT3TotvIf7e15l7X89WQUex188LXlt3OhkGfH2iOrAhMit3p5Ipdtqi9Neqa64rPJAtYDrcUPw7AIUIuQOutS53EOCLLNai+W9A4pJ4WcLw+IgCjjoRVZHoaoE60X34zV6VQKlbwYRadAzPE7EXlFQhgFn6+v2zCDtFOnBo/+lDIRtv38meZEQnSIQcMQfK6ySh2fE7Gk29QKiTqEmetLzo8u5+zYDXchDzPwQCaTgt6sllrvzm/87hXx0Fmcq44EXETUMZy1fNyxWhal7mUSV1lM/4tN54Tl89AxrVSwX2rinnyiZMhPFqkk/pmyG1b//Fmwc4kcoCu8M1i17bQ2djq87kIcTYnU6xr6O7Q5Etz6AqLlnJ8a/ekEDhxccqmtSGkHIEgUxD4p+Pmz6TW9/PbdwhOgO6k5DOKv15vK79J2cM6YqTgmBkxpbW6ccCQHFc+i7vi7lGNI9+EQTCFShSQChen69Io+biyfjMldfC9GqoCTgLXjy4oZn/t98EXLk4R1piEKJz8X6PlHjIvA09aZqiUEs/KCkaQP8F/88EIbbcRypc0lSBmNpAxsPZRLxkKqznpeBb0UiqhuGF9ilH1QKnUxqjJt22XmbesvTNExQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTZwM2NkTFJoZEpXc0wrWmhWaWk4dmw4UWNrc1dVZjkraCt1dWxPTkxPdlhw?=
 =?utf-8?B?bWJkRUVsSyttdWMzbGxkWW45MmxIdFJreGUxdXhPNEFwUW5zN0pQSTE1bktK?=
 =?utf-8?B?Q01Bc0JWNVAxQ2h4WTh0cjF0dWVSalM3ZzNuVER1MWpmUU1rV0FhQjRnSnhi?=
 =?utf-8?B?K0RCZXdRRlVUZDkwYWpNL1NlcVdFdVBjd1U2MThzajJxY2tQZ0NkM3BQT1hk?=
 =?utf-8?B?ZmhUeHV6NFpvTGFWZStBcTVtVlBaeFZ5dHZKV25RWUtzbzh2ZWU5OWFQVk1p?=
 =?utf-8?B?TnNJSkJETmhrSXVrNjRkT2Fwd0dhTlEzQXAvTit6OUhUWUVLVFRIQmFDV0wx?=
 =?utf-8?B?aDl0d1pYamFtSnVSUjgzQ2VMR0V5MGk3T2NUd2JHRXlXemUxbVFBRndmcXU5?=
 =?utf-8?B?MUppOERxbVZsUjZmMHJrRGpmYUhiUStldlowRmNkck1lVUF2WXYrYlhBditt?=
 =?utf-8?B?enNHdkZGTDYrZHdOb3RIQXo0RkFjMXZwNkpWbWxQY0pnVGxCWmx4TEZxNU5r?=
 =?utf-8?B?akV1MU9tblVJdml5STJRTHF4TDhDaTIyRWI2bndzOTZtSG1uUzZ2ZnBvMmpm?=
 =?utf-8?B?S2VpM1lSbE5jWG13NnhBY3ZWSTIrVVJTc0Z6RzFYVEVNeTBtTEF4VCs0UGhn?=
 =?utf-8?B?SEtVYlV4bWtiUEp4MDZrNjVrU0dzV1FFZ29pMjJKeTZIakRSdnIybmZucDFw?=
 =?utf-8?B?V3c3RnhjaU1yWG9BVXFrMHRXOGdka0V1SndlRjl6MUpRQnYyQVNtN1djU1pm?=
 =?utf-8?B?dVlLRWl4ZWhzWUJyMUtZckxoNmZFTnJXL1FscmVCSmgya24yR0ZnZWZ3MU83?=
 =?utf-8?B?TmdDRC9qL201aWxhV1JtUmM1S2g1anNYRW9tcTNVdC83M3ZuRU5YQUxkNWZR?=
 =?utf-8?B?bndLNGZqREdNZk9LS3M4dHFUMGJsdGV4Rk9McDhUcWl5NFRQYmJlcTEwQTU4?=
 =?utf-8?B?T2hxdEtIRXBKWGM1L2pTK3FLWkkrNm52aUVoeU1yS1pXNW9GYWd3L1ZNazcx?=
 =?utf-8?B?emRPaGFtMVBWdklab0g0SjhvYVZzMWhIQTBNZ0hacDlGZXBjdzVKREVsK3BI?=
 =?utf-8?B?VVZXZ2J5RmhFSXdUZEFmOW0raE9sa3h1L1N3WmRhNUljaFFZSndNV3JuQTJF?=
 =?utf-8?B?Y2Z1a0hLaEVnM0ptMjZ4clRhWjVHajdmRXFhdFVTSE1mYTJ6SFpIM1ZteVhI?=
 =?utf-8?B?TkNkWE1YNG8ySFY3Uld4TjVZdmlUMlVRMjVXenhVYVNjYjY1emF6YnJ3Vmh3?=
 =?utf-8?B?K1dtWUJ1WjJxSmhEL2NVWjBPOWIvdm84VTRTQXJHNEt2MkhyVmRZZUd6REZr?=
 =?utf-8?B?THJRV21keklOOTBmaUw1dVp5T3ZLNkd4RWdkYTZFdHNMczdEU0VNK0htQ3pJ?=
 =?utf-8?B?d2hDOVVGTjRaU0ZzdS9yakxBVmxPWGJpNEZ6V0FMOHRXdEE1UzJEUHJqVita?=
 =?utf-8?B?N0R1OTJJTHp1U0dhcndiSEJoRzFIaHN4MWh4cWV3UlBVVnFnUDBuMGpXNVRu?=
 =?utf-8?B?enZOUHBaeXY1NWNDWEl5MndubnQ0cU5TOHVNYmROb3lyS2F6a2hod0tOaGJs?=
 =?utf-8?B?N1VJOWtYcWIxb2htaVl4SE50TDk4S01wNHpFTjNnNnd2NEtlM1NJZHRWSGs1?=
 =?utf-8?B?OEdBTnZ6T3lFUXRrb3VYWDFxZ1JkL0VMcjhkakl5MjEzMGRkc2xOVnNJVENQ?=
 =?utf-8?B?U01uVkdQR0tzcGEvRlBpa1RrU3MrcW5lZW84NEJPRFNONGNJWm1zSGN6MVl0?=
 =?utf-8?B?bHJTVy9BdVA3MkJpeUY4Vk0wRnBBeXlaakhzT2RzRDdmV2VzWmZVVG1QOHNG?=
 =?utf-8?B?SmJweU84Z0VteUVLcEc1ZXFxdlZrWFZEQWxrYXpJTkhiaWxBc2czK0kveWY2?=
 =?utf-8?B?YUVzTG5RNHZ0L1BHZGpWbWF4MGYvaDhkbWhiNHVqNnNnVG9GbFljczZ0REV3?=
 =?utf-8?B?andqMmhTSTZKQ3NrMmJDYnIxdHBTS3FGVjhWZ1JDR2lCcDdPUFlnQjYrZlVV?=
 =?utf-8?B?NUQzaHBDSkg3VkszYXVyMlZKT0s5eDl2ck9oTFB5T0FVajgrWUJLakdWM0x1?=
 =?utf-8?B?Tk5GUTV2YUM4eXB4TGJGbDBaajFIMHphU28vc081eVo5Mlh1cjZYMkhaWVNK?=
 =?utf-8?B?T1pOUDFVS2xOMjNHZHl2UC9tK0VFM0N0Q0NPa0wyc3lZdDQ0SHAzOHo2V3dY?=
 =?utf-8?B?aUszVVpKSXVBUEhGRXVvNEpPY2k5VFZBZWRyZnpydzM0L0lLNkxJZk5hQWg4?=
 =?utf-8?B?QmtjZ3UrRkMyQUViUWFjczllRXd3UUtwVTYvZWtpN3A3Qk1NeHdRUUJMN0Fp?=
 =?utf-8?B?YmVvU1FDcUQvYngwSnFha3pYZUhXWXVEeW03RkRvZXJCZFFiTFJydlhIVXRT?=
 =?utf-8?Q?zbiXHk2PcK56Khww=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eebe9ca-c5c0-48d3-2a0a-08df2f74d57f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 13:11:35.6222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r18jCe0Jd+DvluPJYOdbbjPELPGFBzyP/slmwzpvIxXha7l6QNIqBdHyKq/KnOs3ePb9fgjeHhCXyQvgQJhjHeLe9h6nk4YJnxQ+Po/nJM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB8001
X-purgate-ID: tlsNG-bad1c0/1792588299-BE4DB034-1524EAD8/0/0
X-purgate-type: clean
X-purgate-size: 1444
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/21/26 9:19 AM, Roger Pau Monné wrote:
> On Tue, Oct 20, 2026 at 02:33:15PM -0700, Stefano Stabellini wrote:
>> hvmemul_write_cr() updates guest_cr[2] but, unlike every other writer of
>> it, doesn't call hvm_update_guest_cr(). On SVM, CR2 is loaded from
>> the VMCB, so the emulated write never reaches the guest, and the next
>> VMExit overwrites guest_cr[2] with the stale VMCB value.
>>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Acked-by: Roger Pau Monné <roger@xenproject.org>
> 
> I wonder whether there's more missing here, see below.
> 
>> ---
>>   xen/arch/x86/hvm/emulate.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
>> index c09ea002ec..cd2831d34b 100644
>> --- a/xen/arch/x86/hvm/emulate.c
>> +++ b/xen/arch/x86/hvm/emulate.c
>> @@ -2350,6 +2350,7 @@ static int cf_check hvmemul_write_cr(
>>   
>>       case 2:
>>           curr->arch.hvm.guest_cr[2] = val;
>> +        hvm_update_guest_cr(curr, 2);
> 
> Looking at hvm_update_cr(), is this possibly also missing a call to
> nestedhvm_set_cr()?

AFAIK the values set by nestedhvm_set_cr() are not used at all with nested SVM
and from a brief look may only be used for CR0 and CR4 for VVMX. So maybe it is
not needed, though for consistency I think it would make sense to replace both
lines with a single call to hvm_update_cr().

Ross

