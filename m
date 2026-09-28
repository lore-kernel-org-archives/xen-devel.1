Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B2C3C9833E
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 09:15:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1435802.1654597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB7Rf-0004cR-Qi; Mon, 28 Sep 2026 09:14:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1435802.1654597; Mon, 28 Sep 2026 09:14:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB7Rf-0004cK-Nz; Mon, 28 Sep 2026 09:14:47 +0000
Received: by outflank-mailman (input) for mailman id 1435802;
 Mon, 28 Sep 2026 09:14:46 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1xB7Rd-0004cB-W7
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 09:14:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xB7Rd-009nTY-0s
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 11:14:45 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aba2ffc-e002-0a2a0a5209dd-0a2a450ca614-14
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 11:14:44 +0200
Received: from [52.101.56.6]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aba3003-f479-0a2a450c0019-346538060478-3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 11:14:44 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by PH4PPFE42E23F51.namprd03.prod.outlook.com (2603:10b6:518:1::617)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 09:14:41 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 09:14:41 +0000
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
 b=HXxnZ33umLpcReqL1p1snfS0QT9IfMiIF0tMEpJJ/ZwBTC7LhynOuZ8yHImSYjIXLeL5nfEeUhjqrTObpLNdIuvCZ7Qzz1hxpoot6LLKuk8IHDZdtG0hjia0NFfEcpUh9E8aHG+fzVmsXQ7CcxVE7OW5ZBajE4uOoajzEiyIk+fiSaO5nqQLwnsYXSnZ4wBo9zQHeZb37xvuwY9g7hZWlSQaMJU/w2WCfVd8O4ZOjSLyOTy+2sArvdEEDrYV5WAYO3fZxiX4TAAeHs/eytMJvL2ncHRVBC4ouWuTFwdyH5h8uDbCMyUYAAj9gL/LqM6WLEnRuh2ZxlnYcc68ParOrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgSYmP9n7d6QwDbcjGRaR2t+3qRrHdduHrHKDr6U6Jw=;
 b=FE8ksMtM6AH9qhnlPyMYlANqbXyM7KhBUh3U3JaIMVi9un4F7Q626LTODUEhG4teQg9NNGiGUKcUlu4maglFfhGawDKlqg5bOZ2hBiuYoPdvvYCDj18jwubHHfoRArsuvpW3YP75KFwqIiGzZpPAiNseNdooglwxEvzQt8/ZqMf+DqxtWZ0dx1hUSNsHOnAf4+PgA/ea6PVEr+qBZR3HnggBg7WxgQhQ6gYsr6YDtY/QcA3zHaCcoYtKB3pGzjoPGOYnmuO854kGEAyyEnJ9L/Q4Qcralk+p32uDTn7kffYb9d13BfUMeXzWMyedeb6Z+jbV6cK5tAq9kfPcavrTFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VgSYmP9n7d6QwDbcjGRaR2t+3qRrHdduHrHKDr6U6Jw=;
 b=u2DtjCfcn4Ukore6G2oCwyjcXgv6z7Oaj2BbiEbmAYj3DGsFH24DeBDGtzawwj/VtKRck2dOtV/DtcBbeNtHMZMx13MHgMqXmmDcFGqA9DfwTWJRH5QArGECwVerm+Qk5E/CCf5mdjNRVI1WgvMPbCiYZJDWwz3MrBtbIlUUK6Q=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <654bb128-4305-4003-8ad8-2a533b0e3fd2@citrix.com>
Date: Mon, 28 Sep 2026 10:14:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] EFI: refine cfgfile buffer allocation
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7e332eec-5c5c-4c1b-aeeb-c65e046b1318@suse.com>
 <525eb684-289d-45aa-91a3-b9edbc73c06a@citrix.com>
 <38f6e47a-77d4-4b13-a4c7-94cad14db6df@suse.com>
 <5c243828-44c2-49fa-8881-c97c4170f232@citrix.com>
 <2cde5f79-810b-4634-be43-83e9f62957b9@suse.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <2cde5f79-810b-4634-be43-83e9f62957b9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0039.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::18) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|PH4PPFE42E23F51:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b28a557-df46-410a-5b4e-08df1d40edd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|17002099007|10067099003|56012099006|11063799006|5023799004|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	mqefmoGNkRbTGaeeHQ47OSKf6j5KubaPZ6dDVfmm53Axgjv3QiRDCAEs233xiIu5HbKD3dACnKbb1MLv400rdJXf/9jGSOhkioEABN9qGoBgwws681mCEwK2HuY7bXJOQl1796O0QXIDRmYzGQDqE7HABy2IedXorr46gf1Id+MdN2XXrlaTvxAcuvs6hoyWNvm5LP4nafdAWqHp2U/qFzTr9ILfB+7HiCMfq2Ur2L/zp5vztKOubjsr00lyvAGpBmmg5eFGgbBoXFssl5mZsSLsRH6nBO1YPbnKoROpkcGU9K3GwoJ119VIuWeepfjEzNHorrQN67CIgAI2Hfp1HAyl+0Hmr53uZbHgxyIhy4kXhOpSWS3JtWZPcPADBOYEHnb1BHpNvO1uQesxd0lZITB0c15PiiaG3innZNM8QfoWlYDRShYsAPmdFHXj6CjtWUmMBmBdF6ZZaPXHlHU4F53WEq55nPqk1TScBObteGlr6gh2QDAuITWbcsaF6DYmD1ux/3fiVufFChD/h7Ao03S7s2zHxx7taYdCk2/CujvL8ahLGPgvXZ/xJJwY/uT0NU2g0QKnHSTbWb72+nN/fvjjqhAS81KbaKHGK8UPiKSV8F26xFbUSW558PWi8K6Diq+ALOOWcLsrRUilJK3+SR16V8am+K1lJ2GmDT7irUs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(17002099007)(10067099003)(56012099006)(11063799006)(5023799004)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUdlUW8rK3d1b3EzRWRJL2lHOHM1ZWVRV3d3OFRaQkpTU21lVGxsWm5LRGQz?=
 =?utf-8?B?dGNVWU9UaG9iUEhqNHVSL3pJY2d4YThoVFlCZ0FrMHBjbzEvbmVBemZiQXp6?=
 =?utf-8?B?d3E4VUE3d0JvVDdaaXBLVlJvZVNuT2dXT1FLTzlaWjBVLy9DYUZucmpoMFlk?=
 =?utf-8?B?T1ltalp4R041SzZRaXNHS0ZyTFJiQUErWi81cy9oZkZhdU81MWZrU1YvWTY0?=
 =?utf-8?B?b0RNRW9Ba3hqdFE3WEswY2dWYjlOamxwWXFldmZBTmpzT0VkUERwQjJ6ZCta?=
 =?utf-8?B?WEJkWEFHWVh1VEtnY1JXNURObHNiTW5QN3hxRURGWWxrVENqakVueFBxMmFq?=
 =?utf-8?B?dDZjUzJDbUZCeUZ0MXpZVndocnR0YVc5bE5rbzhoZm1hMkd4dUdWSVNXalhm?=
 =?utf-8?B?WGJDNk9EYWxYeEFsZVV3b0FIckZMT2NkR1dGWmQ4OFFIODBITXptV0puSTVU?=
 =?utf-8?B?NXZEQVJHUGVoMkFOeFMzRm9TcFJQdk9DMEtrSUR1bHZTc2hod2U0RmpzMnhs?=
 =?utf-8?B?U01PcUFjSVd4d3I0MFRnS0FiMStaWUV3U3ZYVU16UzI0c1dremdYVWtlTkxH?=
 =?utf-8?B?OC9aTlFuYVF3NFp6SERSMmFTczhyQXpqem9vcmlONW1IdXdpQlkyNnpMS2dn?=
 =?utf-8?B?eU1CT2s2aU9SelFhd0lqems2ZkYyQU9pdTdDVi9vQlVnU2lCOW1ITEl2VHJW?=
 =?utf-8?B?YzRnUVQvM2ZMeHRGdFZyakljK2VzY1RRVkM3OHNEM3dCWUQ2eDFKOGwveVhq?=
 =?utf-8?B?ZTBUWkg0R01DaU9RV3BhdkNBTFN6UDNjRzZhN3A1VXNoWmFUOUJFNXAwc1p4?=
 =?utf-8?B?QVZYYnY1MjBLMDBmZ3c5cEtnS3JWK0hTby9Dc0tDY0I5UjRQMHBXV0pkZnNW?=
 =?utf-8?B?TFdoWFFWS2dFWFJqeGNpcG82V3podWFKdzNFNTVPTzRwOTJKMlVXNUVMcUtU?=
 =?utf-8?B?d0plQVJrcThiQkJNOXlhMzJFTC9OSnN6KzhtWlp6Z1ozbXdrWVlWTnNTekdn?=
 =?utf-8?B?TkswcEZsOXFLRUN3L2tjMTN2TkFCTUpLQXpsOE5oZmVqQ0t4YkJnWE9NN2E2?=
 =?utf-8?B?Mk1IYXVmanFtYjdjQTdMMGo3RUprQUFkY3dOUVYzTzBpU3VsZjFRTDdSbWhJ?=
 =?utf-8?B?V050dzFRTkNrYVVyK1NCVkw0czlKaEMxSk0yZXlJMWhNY0FQNVdvak4zNnZH?=
 =?utf-8?B?bTZld1RlaXk3WE1kWjdaVjhBeFNBMkVqN1pITFFnb2VDTE83Qkk0VUNqWjU1?=
 =?utf-8?B?bU1OTVQ2b0VWdURsUkNkclBZK2NVc1lJL3FCbG1PVHdkUGNyTVppcWZtc2Vx?=
 =?utf-8?B?QTNKSStXN1BaQjRobnZ4ZFlnNXlFVmp3eHlWZ1lHWW5SbG5Sd2VXR2tZQnRN?=
 =?utf-8?B?REZFK215Rlh2RXNpNW9MS3QzbnJaTVJKTGRyaW92RzBNWWk3THpYL0NsRVp6?=
 =?utf-8?B?TWZjZzA5UnhtUDFPRjMrd3R5T0NXQk44cEtkOHc0dXRITlMzRTR2RkYzM1Zw?=
 =?utf-8?B?NFl2R3FZaFBqS2dXdnFFUXMrODg1aVdsZzJ3UEdhOGU2bmV4ZU1FMmVjN05W?=
 =?utf-8?B?NlRIcHZWS2Erd3Fxcm1VUUtSZHorcnFVQmNFWXpUbVJHZ1h0clJUTktQbWNE?=
 =?utf-8?B?RHpjeUI4ZFl3a24veHlybmRFWUJFc25XcVY5M0s5RmFrZnNKYUpoYkNhdGRx?=
 =?utf-8?B?dkZmbkdhSkdWbnU3WmhPdXR2WGFPcTBJcjM2amJvajQ3bzNkMzJRekovSnVV?=
 =?utf-8?B?bW9aMGNHak1NWTVlR1Z6dE1jR0xpdUdyWWZuKzFBMTJVRHM4MW03dVdFcXhM?=
 =?utf-8?B?NUpiVVNnZ3ZzTWlFbXE0NWJLTHN6YzlEaXRQamJvaUt3UGFlVjQ4L1YxaStm?=
 =?utf-8?B?elFic0JTMnlrM01MNGQ0dEs2M2Z1d0c0OE1yTlVUQnBNdVVsd0txTHZaUE1M?=
 =?utf-8?B?RkFGcGoyWmM3Q0ZuUUFsWkVlNnUrT21MWlpTNnQ0NjBlNUo0TjliT1JuZXBr?=
 =?utf-8?B?N1VsVkhpWjMvb1hyd1dNZFNnSUpmYTBndFlZeU1BMXJwV3ZDY0NsdU11bERX?=
 =?utf-8?B?TVgxdHZoV3ZYRVFCNWFhaTZmWHgyWGZUd05lbkovVmJhdVJob0NtZEJHd09p?=
 =?utf-8?B?QVlPMzNPeU9aell4SVJ5R3hma083UUxhSmRpdyswa21vdFNXU1lHOWovbkV5?=
 =?utf-8?B?SHJBT0tiNVVKeHBVZkc4aWxtTnpJSTZYOFM0VCtNTVlteThYNmlrZFp4UmZa?=
 =?utf-8?B?L0lxVTF6M0F3TjhZNGE1VkVpaEpuNVk5SC83TnJxSFpWQUI1b2tTMzdiOE9S?=
 =?utf-8?B?YmJzeTg1Y2x1dXBOcTNJeHliSCtEZG4rM0YvTU5SN3pBMkkzUWlJMjh6YlFW?=
 =?utf-8?Q?dupFJL2CkXa38+NE=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b28a557-df46-410a-5b4e-08df1d40edd6
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 09:14:41.6941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NccsAwALtjTw0T/nclYE6mjHNZFWZrCvACD961LV40FKFr+ZFhoUVrMG1fADbNJHwLDkZ6M/cvC66mBQGR6ULMwdDcbB208njXnBueVCreg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH4PPFE42E23F51
X-purgate-ID: tlsNG-d25034/1790586884-5270FA5B-6C4F759E/0/0
X-purgate-type: clean
X-purgate-size: 1765

On 9/28/26 9:55 AM, Jan Beulich wrote:
> On 28.09.2026 10:37, Ross Lagerwall wrote:
>> On 9/28/26 7:15 AM, Jan Beulich wrote:
>>> On 25.09.2026 17:56, Ross Lagerwall wrote:
>>>> On 9/21/26 10:09 AM, Jan Beulich wrote:
>>>>> --- a/xen/common/efi/boot.c
>>>>> +++ b/xen/common/efi/boot.c
>>>>> @@ -878,8 +878,13 @@ static bool __init read_file(EFI_FILE_HA
>>>>>         what = L"Allocation";
>>>>>         file->addr = min(1UL << (32 + PAGE_SHIFT),
>>>>>                          HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
>>>>> -    /* For config files allocate an extra byte to put a NUL there. */
>>>>> -    ret = efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
>>>>> +    /*
>>>>> +     * For config files allocate an extra byte to put a NUL there.  There's
>>>>> +     * also no constraint on addresses for them.
>>>>> +     */
>>>>> +    ret = efi_bs->AllocatePages(file != &cfg ? AllocateMaxAddress
>>>>> +                                             : AllocateAnyPages,
>>>>
>>>> You could avoid the negation here, unless it was intentional?
>>>
>>> Use of != was intentional, but that's not a "negation", so I'm not quite
>>> sure I understand what you're referring to.
>>
>> Sorry, I meant !=.
>>
>> For the cfgfile, I don't think you need to allocate whole pages so it might be
>> better to use AllocatePool/FreePool for those allocations.
> 
> Yet that would further increase the difference between that and the other
> allocations. See e.g. free_cfg(), which right now works uniformly.

free_cfg() is already a special case for freeing the cfgfile and it is handled
differently from the other allocations (in blexit()) so switching the FreePages
to FreePool in free_cfg() is surely no less uniform.

Ross

