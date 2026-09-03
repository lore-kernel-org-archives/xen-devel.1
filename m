Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E37C624A4
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 14:32:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407343.1640445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x28U0-0005uI-N9; Thu, 03 Sep 2026 14:32:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407343.1640445; Thu, 03 Sep 2026 14:32:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x28U0-0005uB-IV; Thu, 03 Sep 2026 14:32:04 +0000
Received: by outflank-mailman (input) for mailman id 1407343;
 Thu, 03 Sep 2026 14:32:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x28Tz-0005ss-CX
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 14:32:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x28Ty-00An5l-Ov
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 16:32:02 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a9984d7-bab6-0a2a0a5309dd-0a2a4503939c-20
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 16:32:02 +0200
Received: from [52.101.48.12]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a9984e0-fae8-0a2a45030019-3465300c7f52-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 16:32:01 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH2PR03MB5269.namprd03.prod.outlook.com (2603:10b6:610:90::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Thu, 3 Sep 2026
 14:31:57 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 14:31:57 +0000
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
 b=DNBBuEMRcuHzVNXeYGQPHI+63E0RErmngbmPkhUVHVY4+HktHNkGsnuHE2jxZ/59EDQSkX6Uzofb2lM9pMtulKe50G7su/pH/MOGVP7awmnrpFAoy+q1SRqA83iDMfpW+ZA9/eDe3OdORw1RX96DcuSmTnMu4+m8qHWMGajT37Xke+xidmA9dcGQtFCFUFdFRqQdlqrhgZKHV8mpffOPmw3Gwkz8FM/itIwb6XKhNvj0TApifCeydAaMGNRyjuqCI0pnsq+ZF2kB0KCVLCexF/EEeTdQC0s8TTXqLZxR1r+UVhRNxZRaaLYfwiVpfgPnw0rjnz7GgMWCk7WUQTsHwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8JqueNGQIyNX+s8aWi3F1MkZNe4nUGn2KTfR2Oxn9o=;
 b=fU+4d0QEtVBkWSPzbtstKD+EAalMJ7yQ3OLoAXP3Ws+nxeFKO/dfy9x0l9xtyoO1dF4lZRGd6l5OAnIVAR8crH7xIvb8sReZe5Y5Uq2ZWdJtpr7Ohyhbr1fdH7YiLFCrrbR3hgaULGN6FNDXsZ61cgh+PK64UGG65Xtd7uAnbcAXjl7xokBeKQd0eqzVQLHYM7MmEeOboHDomGIEHkX55ZPBwoLyhoGdOiWT0EIY87i8/FsI9Mo7u6xD1du6fJgxY+NPCnlZXF9DUKOn1YC855m/Dxsk/7FC8s1qhPLzrQYvSn2MPXrTq9CchJTi7BRxPttfxESN9pTsJ3VfwRz+Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8JqueNGQIyNX+s8aWi3F1MkZNe4nUGn2KTfR2Oxn9o=;
 b=m95wjObidK0pgiMSr20iEJseeaI7WK3VhPUnlnhMxngdeqYMSGr2uOy+RzFDOLOkqGgY/yjyNHFAcIjlrpOmezdkpAslafpatTTHjePhevPJ/irMWLFItjPwzAn0edKUGdwexLIouqI8big0VKHvUXV6QYR2HOi8vD48hU9Oj30=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1acb3901-c159-49c5-bd59-aa7be58c67cb@citrix.com>
Date: Thu, 3 Sep 2026 15:31:53 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1] x86/svm: Intercept CR0 writes selectively
To: Jan Beulich <jbeulich@suse.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20260828141955.4009939-1-ross.lagerwall@citrix.com>
 <514b9ad4-912c-45fa-9450-3c85adaef483@suse.com>
 <6ecdf1d1-784e-4cc0-b840-f8970a295ed5@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <6ecdf1d1-784e-4cc0-b840-f8970a295ed5@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0029.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH2PR03MB5269:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a749461-90b8-4650-2c9e-08df09c81b4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	YSHmPm7D2Njo2SN9u3ivjFe3HQtFnA61AMRslJL33+9FGIUzvMUfCrdQaLhX28OpQetB1SAGrxnx1n92g7waOSMTXT6Izq5n6zpVn4vtIvINMEg0yCwFOkuzROCZio7l/rpfua/bO4PWppoGkfNeG4o+88Ev03ftmtTjftBxMUiaXcU0RPVNnpkEieQt7/LvZvjFPOiKOQnFopSQC1eX8gnCRIcXCC+cHM77bo1kHu2duUJPQ4YpebO3wCrtXJEj/uyQ5BcIuMMDshy+ezkKHT/YzKp25nYvMpaKros1U4BPr1hgfSpEoVdzK4uw+cW3+EgsMt/IXmIABCjZfsh9f1Fk55MyqKw//+CMUkIi+0x41nw1rfEVE44Y+sQbEFYU8tQbf+3bmcJj+6ukzXbrLmAvcdv/66heg4fTV1FRYfiyM71mom6IxsYCZ18M0v0O8LvmPCP0PMBQCJygs4jsUO9QZ7c8yxqHBchjxjFQrUS/jU1gMoj327JZt20zlK9NP0iCzJlElyfVkP9O/4kSz9EwzVbs9r1Tnml0N8zsNwOvq+3U4XT+exVjiJUM1fneL4l+j002toSneAo3XKtXSTElssm4yqUhJrgVXmhX33n3GPypBvG0eRkj3WBnv/OtKhP3DDAwXuyfrYsmZZOh4FjLOOWLXfgRTR4SscuYL0o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVpZUm1vQnVnTmZTTHJlUjRtY3NxemtCZHZNL1NSZ3VqTVpWcUNOV3ZLRG5S?=
 =?utf-8?B?QmRJQkVPWTQwTW00a2ZzWGZCNXNtSXlxN2pSRzg0WFNUdy9PeE43QmJpY3hW?=
 =?utf-8?B?YkJzaU8yU250ay9DWjZOc1l1MjV3SHliSTVCcTFBT084d3RhNzdSUStxL0Vl?=
 =?utf-8?B?a3F0NFMvZVBVdUpjaCtGbTczbm0zWXpyTm9oK1hFOW9NdUloSWllSlJ0cUZ1?=
 =?utf-8?B?RTMvQlhKWElXSkNZVmgxVzIzVytyMEpHVy9pbHVqZGp3eTNKeWp2SmJoUXA1?=
 =?utf-8?B?MWJ0TWxZR2ZTMG55U0tpUEdxdk1sZDErcDZ0LzMyNjE3TzJDdVRYaytHdXZU?=
 =?utf-8?B?Nnc0c2Q0UEhSem0zL095SGtBcFR0Yy93R2t5TWNJdlM0dTJxV2J2Z25Gd1Ez?=
 =?utf-8?B?ei92S3dqSyt6bUZycUhWd0RKdFVMVHNYV2NCZUtDMzZTNlhLa1JrVm55M2ZL?=
 =?utf-8?B?RXgyclFxaGtPNmtEMEFHTjZMamc2bEpyd1FKUjdBWmxBL1ZwKzNuY0R3ZDlS?=
 =?utf-8?B?WlFWemhTYnBDTjlwUTBUNlFYMnRiSnBLamNCbUc0MWIvVzhERlhXZzlxT0xH?=
 =?utf-8?B?SURGVGpDSGZ2Z1g5TGVWay9ldFI0UENLTmszMGxjRWRhNlRCTnVyOVRKYkRH?=
 =?utf-8?B?blhNYXJtbEt4UlZrVHBtdUVVWlNlVktnYkt2cmdQbk90dWYvMHFza01TTSt6?=
 =?utf-8?B?NkRNR25IdXpDSGlxZnZMV0x3akJjRG9xYmZqbjNRWWtvS2psSWRDbkhpMGxl?=
 =?utf-8?B?eHV2N3h1eFZDekpJS0o4NjJ3cW5sR1FpeCtTVTBoMFJVbE1Jd3FON1BUVnhj?=
 =?utf-8?B?UE9BWUlHVklpQVBob0RGbFZCalFEdlltdTNiVFVZRmtjeFQrbDZtN0FXQTQy?=
 =?utf-8?B?aE1nd1oyZmVEaVd1WEpyaisvSmo0R3BYckxWUnkzblBJR3FCSDliY0N1cWVm?=
 =?utf-8?B?dXU4V0tTNysrZzBNUFFJeTZGRHJ1VU8wNk8zdDJheUJyRlNDcUpTZ0o1c1hT?=
 =?utf-8?B?QnM3cHNKdHhDbStudTd4NStVVmhmQVg3bG5oYXBBM2YyOHpsZjFra2tnK24y?=
 =?utf-8?B?bFFlcUZGSHgzeGhudHpGaXpZbTlhUUk1MUZoNXBKSWM3UG5TakM2akFUa3hT?=
 =?utf-8?B?QkQraGppcWlSMUdRd1JjSngxaEQwY2xObFVOWWVuU3RMbEpvSHVpVWV3WUFM?=
 =?utf-8?B?Y2J2ajIvNXpZYjQ1c3pVdnhLYVduYlo5SnptSk9zTUhvNXdiLzllUnRlZWhk?=
 =?utf-8?B?ell2Rjg2djROWG1vNmF0cEJHNUdBdjRqb25zWjZDdGt6dVRQMVg1L2UvY1hW?=
 =?utf-8?B?OXgxNm9PM1FQK25UenlMNmVPRlQ2UEJKdS9sM0cya1orMndhbGR2L1lzQWlF?=
 =?utf-8?B?ckRudGY2UmQvNEJFcG9TSHRWNnp2Y3hBR2taTWJudkpvck5hNUU3eXhManJk?=
 =?utf-8?B?ankxVGFjZ1lhYWNQaW5DaUc0NXhSWTJyZ3RvWXp3Qit4NWNLdVVQbTdTNGR2?=
 =?utf-8?B?TUFNMlVDN2ZLcTA3SW5ta3l1cTZIZWF4dEh5QWZPcjN5SFVNL3RSWDZ0OWw5?=
 =?utf-8?B?T0hJSVJROHN3N0tHUDVIM3VYUEIreDRBay9Ucm13YzdVMzYyK1J3K0NQZXdK?=
 =?utf-8?B?Ykt0VVNaaDhObkpNdldjS2tCNlA2cHJSK0lHV1RHcFJiU1pxRDNVRERnRUNo?=
 =?utf-8?B?eWMvL3I3SGJSY0c1ZndrNDlJWG90TUdKbGNmb09HcXVZUlRTOVZMSXZrOXFi?=
 =?utf-8?B?dTNSbXpwTER3NjNFY29zV2YrbW5iZjR6MXJTVzFMMUpUeXZrZEJOSUJhR0lh?=
 =?utf-8?B?ckJ4ZzVuRWtIN2d0TCtwRk13dE1QdElKY1BYQVIwMXdzWUI5TTZpektlOUFY?=
 =?utf-8?B?WTk2ajdJQnRUTVI0ck9GN1I2R2FGeklxMy90QTcvTmIzWWppbkQxcHE0bTVj?=
 =?utf-8?B?VkxNcUtxU2UrRUhuY2JIeUV1K1pQRVlwYnYycGt0RkpoMjYvdmZsVjJvaTZj?=
 =?utf-8?B?K2gzM1F6UHRrZHNIT0NxN29heUI0OVFtaVBYOExpTnN6aEpmTDF2b3NHV3pj?=
 =?utf-8?B?TWdxZmd6SmhWd01zODNQM2tsdmZUMGxyNTBlTDR1dFJXRGlYM2dabHZ5a1Y3?=
 =?utf-8?B?VEFBWjF1Z1R2UXF4anFYZkNOR0VXYkpBdFhKTnhkZHJWWW9VVSs3V0pXM3lB?=
 =?utf-8?B?S0hvSzg1M0xXMWdJWVV1SmFBYmlLbFZFY25kcHpKOHI1Tm1WYmx3Mnh3QUpH?=
 =?utf-8?B?cmZheFhLbTlVcndIYmtmQWQzalhOWkNLRitWbmo0eThiWFRDd0doZHBzazVV?=
 =?utf-8?B?OGRXYkhwYXpHOEpsY2E0QmtNYzdhZ08xZWZHSEd5Y1Z2NmVydUs2dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a749461-90b8-4650-2c9e-08df09c81b4b
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 14:31:56.8275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0jLkLNDmFHaIxPX7VZ30H7JT9kP4rVm/lqct6TQblJl8aws1jYA1FRfyROa9GTv1M03RhvjNim6++ka+mBsyI6O1acFBoianCO7fu5CljjU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5269
X-purgate-ID: tlsNG-33051d/1788445922-6C2E04E9-CF52B0D1/0/0
X-purgate-type: clean
X-purgate-size: 655

On 03/09/2026 3:31 pm, Andrew Cooper wrote:
> On 03/09/2026 2:02 pm, Jan Beulich wrote:
>>> Aside from potentially reducing a few
>>> VMEXITs, this fixes a nested virt bug where L1 intercepts CR0_SEL_WRITE
>>> and L0 intercepts CR0_WRITE. The hardware prioritizes CR0_WRITE and so
>>> L1 never sees any CR0 writes.
>> Yet if L1 sets CR0_WRITE, since intercept masks are ORed together (if
>> I'm not mistaken),
> L0's choice of intercepts needs combining with L1's choice of intercepts.
>
> Mostly this is OR-ing/unioning, but not exclusively, just like levelling
> for migrate isn't a straight interception.

Sorry, intersection.

~Andrew

