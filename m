Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 864E8CA5FA2
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 14:33:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436095.1654870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBCQB-0001fG-Gx; Mon, 28 Sep 2026 14:33:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436095.1654870; Mon, 28 Sep 2026 14:33:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBCQB-0001f9-Dp; Mon, 28 Sep 2026 14:33:35 +0000
Received: by outflank-mailman (input) for mailman id 1436095;
 Mon, 28 Sep 2026 14:33:34 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xBCQA-0001f3-LN
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 14:33:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBCQ9-00GnvD-Ht
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 16:33:33 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aba7abc-bab6-0a2a0a5309dd-0a2a450acaaa-4
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 16:33:33 +0200
Received: from [52.101.201.51]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aba7abb-f2d2-0a2a450a0019-3465c9338c79-3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 16:33:33 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB6517.namprd03.prod.outlook.com (2603:10b6:a03:386::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 14:33:29 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 14:33:27 +0000
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
 b=ntWuF24gN/JzAcsPQrqdDs3hId0nhEwVFv08Z5pqbg9AC5nLSO8yHODC3RQ4ZnzH/by9pI4K2580BWjvamcZmfq889qUVkEV21Meyti7nFdHL6G32PTT/wbwrnnHFzaA1DFC2ywy2qKdYFGJnT+e2yFxm/GTjKGRpIGhjbSainvUHPCQucW6kP6cBA3x2NGXvZOdLqqthJ4H1a3V6C503HM4BKhg8UV6WUcE8BRb7686MLcfYNqVfKHqZHxCd6Hk2J/o2sAvgkPgKeACGD/Id/SRdVXxknmSAw6H21PDN6BUBs8QbBYkygP9X/pAm+uS+YaHsb6slFusQv7iYOSk5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCXb+CsJVyi91xyH5WsqDKe0zvFm+y6euhGoIG1BbYQ=;
 b=au972QgcfDXNWB/k2do/PGRlZlPb0VbB8835flAMTEXGEa35e6Q2bY32sUYipzYbsXlJCCkdZgEsnxl89VxM/gawoi3G36b9fWYH23x7rhPTl7O4bcF+pskj0c/shzyiNIZC8B66FyXsa/CRoAMfaLJ70GOOejw5JL7T2Z9ggXjiJCvfyGBPK21XykFS9YD01quS9L9RTR6D2VM4WyoA6AwElYgDBWEDxOMQSr36vgBeM+sy6xwleGIygnMgYKtEsSmizNBPmywOJ0edK6AkUGHEbb94Vc0iiBxDeQAAdFfdyUgEukyL3SBDhywMWfDV9rH2PoLeBklIabR7zoKQYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CCXb+CsJVyi91xyH5WsqDKe0zvFm+y6euhGoIG1BbYQ=;
 b=N2C3HbXjl+4eCqFtK/gcgv5UlxCwHZNEQL0nD1b5tpIF7DBdbedgYBrj1sjrYUFQJYwkg2VbdG3LnPigPNVJBtOyjYdqC+bUZO5wzH1trmCpCg+XRow6XVolxVkBi+0dOj7FiQ1gbqkkuoISpSMDYX6Ei/UweQyhzOiVgQJ24Ps=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f9dbceca-6ce6-413f-a4ef-a74a908d6dc0@citrix.com>
Date: Mon, 28 Sep 2026 15:33:23 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/hvm: Clamp Viridian features to known set
To: Jan Beulich <jbeulich@suse.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20260924110342.1045230-1-ross.lagerwall@citrix.com>
 <b444508c-1684-4999-b560-c95b9be0efb4@citrix.com>
 <f6de75b7-f936-4257-9a6b-c9ba9a3fc17b@citrix.com>
 <2f929826-3a32-405e-9bd9-0d47006e14f6@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2f929826-3a32-405e-9bd9-0d47006e14f6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0205.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:36d::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB6517:EE_
X-MS-Office365-Filtering-Correlation-Id: 9159235a-ebde-4c23-09b6-08df1d6d7570
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|56012099006|6133799003|10067099003|5023799004|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	HV+gLH+SjnGUCmRISlgwN2Q7GpulBUaQ1WNHASO4ing8kJMrKw9UppEQD5DHTBlsztaZfk2rU3Lybr0R+LuUViYKs0ka2eHDGjq5VA/nigONV86QtCmXzyy27B1ypQcmBNCTJk7Sy3vUajrLo6HjgA4JWm70EAwgUrSmr8kITRQCD9w8ixIMKEpFINqfno7vJOYE1C4ZKEXlSytsfPfdIaxCYymVtptL9wAhG27nJaYaGr/XGMqGzdT4oLrAyuh7d9JED2gwUpULBX0rkf7DovN6mVojkHYjFLGtbkMhgn07RNTI1TW1h2qDxT8rH3MDbPPlxYO1yFEa17lx9Ufj2aGS8anluXRXHaHLdNIP75GwJuJtYZlJO3DQHj2Fiu3DxZb68Hb0du4WfqPtOcZhRUsV0CvqTIMpmUjcAk0m7UkU5TScKFz3xhtl8q1wxkvwKG/KduZZkPNgyCenacHy5/h7iPwmFjx5iPg8VVRgTyal6OnsAK0qO52lekUsRrOBYbn3BrW17szGR7qxD+3vLeIO3LFxvjaYOPLkkk0kxJ4YQLvjCZtfHOklx3wWZIDWU3+0iF4Phk86J/8eecnp1SSRU6Z+8e6zCHY74ejFAiqaxtiiwxcx+sJA7hvh3mlFRfDa784FGrJ2cH5NMid2Wfg6QaXNUTnOJ450WwsLGhE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(56012099006)(6133799003)(10067099003)(5023799004)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjNsbml3aTVxWEdOUmJwYjJxOWh2UW9XVlZzOFF6c3p0eVFUYVlLcmZvQXAw?=
 =?utf-8?B?UEVTclcwMnZtR2FacVVjUnpuUURxTWtidlR1N3FQM203dHl2QXZBclNacEwx?=
 =?utf-8?B?ZWR5VUMreHpjMXdPZ0lUWWhRa0YrMEw1NTFTT1Y2MEFOTmVMRGwyWHdTZEpt?=
 =?utf-8?B?RzNaZXp1Wm8xYThYUS9JbTBDZU1zRVpYMXZyWm1NTWo4TVp0UVFhS2dsVEp5?=
 =?utf-8?B?QzVlejlxR1dmZWh5NlpBMGx4RGVEalQxWU84RGptaUNKejcrMFFBa3gycVNZ?=
 =?utf-8?B?bnptekhMaFpRcDc2OEVSSkFUNGxxUDVmNk14bS9lSXkzWWpBNU5iQXp4TnJk?=
 =?utf-8?B?b2tuRFl4anFNeDllaUxRd1FXTGIvWlpITEoxVUxzM3QrM0gySmM5ejZFdHIw?=
 =?utf-8?B?NjZjd2lObEtONmxHUmM1MDVJZmZDL0tYejJOeDVBNUo2QVRnYmhhMkRqT0lV?=
 =?utf-8?B?dGxIb2lhRjliaUpPU1ZiS1hXS2JhdE4vUXJQL1ZaQmpaNTdLeURXQTRpUVYw?=
 =?utf-8?B?UjJkRkdHMVJVL2VNcHc5Vk41YWdPMnNXNng5MUVSZFF6NzNMYm0xcjJneXFJ?=
 =?utf-8?B?TEZkYlVnUGVvdlFCK1ZVckNBM0VDQWZGaGZFRTQwNStnVFlQWlFNTnF1UXc1?=
 =?utf-8?B?ZVY2OXhqNzhhc1dic0tqd3RIdTl0ZUVkZkJSTEMvb3BTY0VjUTJ4QWpESkJl?=
 =?utf-8?B?R0d5ZS9razBSem9LWmVXN2NVcjl3bkNwSVgzRHY2Tk5hcjk0ckkrMDRZZFBX?=
 =?utf-8?B?WVgvT0tsYnducmg3V2JiMGpiejl2dithemtPbktlMUl3SkZjZHVkMWpLVk5l?=
 =?utf-8?B?a2h2aGdrQkVuNUZyNGV2a3oySDFCWG1YZWMyQjNHZnV2b3ZiNFdUT3VnTHdn?=
 =?utf-8?B?R3poaDduQkhvR0ZVbUNiUkxKdDZEQ1AycG9BYng4TkFOejkvRlR1elNYeGli?=
 =?utf-8?B?SGhwRVZGdlo5NXBIRFJNMXhKck82UDFrU2gyNjNJL1ZDV3pUYlVnVGJzWjMw?=
 =?utf-8?B?V0xvU2poK0JDVmRWYUFaSlRmVmI0aHVHTVNBQlVKcUlLMk9wZWVyMW1ITHp5?=
 =?utf-8?B?SGVRc3dXRS9WazhVeFpNUVVOS2ZqRkoyRk9qK3YwbGhZRTBxc3NjWlk1S3pr?=
 =?utf-8?B?NkkzV2JqSUpNbWU0M2wraitBVkpHbm9DdDY0aU9PRmpYK3YzYjJ4di84L2do?=
 =?utf-8?B?dmpjUkpGdEkvakZIVHVhd2NHcXRhdVZpOFB4d24wTEM2NzBVb0JaMXh2TVFw?=
 =?utf-8?B?aVZ2eDZmTHRLTndGVTlKTWh1WXBaVXJLOC95WWtKNFBMdURTYUY2bkJoWkdu?=
 =?utf-8?B?RTI4Mk95WkdmQXBtTGp5MmgveE9oZ1ZHODJqUkxPK1gvV09pa2dqM3V3TjVl?=
 =?utf-8?B?UWZRaEMxZlRKVFVqcWdkSUI2aVBHQ0U2TGZQVU9HdVduSm1McUxxTkZDbmtC?=
 =?utf-8?B?YlgvTmxMK3p4SWJISnJPamtwdkhQTVpsY2UxWDdBVzdSODZST3MwUmRYNk9R?=
 =?utf-8?B?WlJKSTJobGt0c21aRWdreUhhdTdWQ3NvNEZhZ3o4TWFqcldiaWM3b2NIRjlw?=
 =?utf-8?B?UTJsdFZPa0J4Uk1PaW1lNmpLQStZUk1lbmN4MHBodnN2M2tsc0dWeDdTZjg3?=
 =?utf-8?B?SEkwWDlIZ3VDQUxhakVvZ0dBRE1LaFJJK2c5dk9VK0xuMmc0UmF1WVRGS0VF?=
 =?utf-8?B?cEhrbXl6VWRmUVcxRXI1eitPS0hTK0lYWDVxSEc0ZGpWc3dDeGZGTUZrSmtl?=
 =?utf-8?B?SUZCMElVMStRQm1YOUV0WlpJWXRNMEd4YlhBcGw0alR5SGYwbjFnYkFuNEl5?=
 =?utf-8?B?UFEzRWtrNVI1NnY3UkxLRDVlWUlJb3I3RkEvbGdaRzNVdjA1RE5IQVNMSDUz?=
 =?utf-8?B?S0FFYXRLVnRUSnJhTW5WdnhhK1lMcDNmdTdwYnYzcE0yQnh2MmZjOXRpL1B0?=
 =?utf-8?B?V0o5a0dHRzJvL283ajVzd2luNzJLUDVEUUNMeVNmM1VES3dlMlZadXg5VVVP?=
 =?utf-8?B?cXB0b0x3UEpyODZhQzRrTjkrVGpSMElaRlJvWkt3dzRkekN1RzhQd2RHdVd0?=
 =?utf-8?B?Y2l1NCtRZTVTb2swRTlHVjhJUXI1TTdIdTZnWWQybTJ5T2llb0FBWEhPTUcr?=
 =?utf-8?B?RzBaOWNwcFpydWY5dUY0Z0VkblZUZTdOSmkyVFNkSmJ0STR0YTNCUTFKMlhI?=
 =?utf-8?B?d0RFOCt2ZEhkMHJxMVB1UHRHR1NlNEQ5TzdJd0tMeVMwdzlKWG9TcWV1aVRi?=
 =?utf-8?B?WlZiSTN5cGU0SDJaa3hEMDBjdmFZNUlKUHpPbGlMYjhLSU5HQUNseks4SVJ4?=
 =?utf-8?B?ODJZc1ExSytLT3puNzNDdHZFUk1CQTY2SjdSajZ0Q1p6M1k1bVpjQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9159235a-ebde-4c23-09b6-08df1d6d7570
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 14:33:26.9864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1y40W6nwT9PzSUmlrpFQtcEpKlQisIcJ/syVHz7Uw9/5xPhhj8sVj8FLh+GtHbO1SHeEeFeR7qACbw6AWyLEYG6SYXCZJS+cYm9eJSZKzD8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6517
X-purgate-ID: tlsNG-4011c0/1790606013-4B8D5CFC-7640AA5B/0/0
X-purgate-type: clean
X-purgate-size: 1603

On 24/09/2026 2:08 pm, Jan Beulich wrote:
> On 24.09.2026 14:56, Ross Lagerwall wrote:
>> On 9/24/26 12:20 PM, Andrew Cooper wrote:
>>> On 24/09/2026 12:03 pm, Ross Lagerwall wrote:
>>>> Instead of returning EINVAL on an unknown feature bit, clamp to the
>>>> known feature set.
>>> Sorry, but no.
>>>
>>> This is equivalent to saying "I've got a VM using AVX512" and Xen saying
>>> "ok, I'll ignore that safety check and let you run on non-AVX512 capable
>>> hardware".
>>>
>>> Requesting a feature that Xen doesn't know about is a hard error.
>>> Truncating features out like this will cause a guest using those
>>> features to malfunction.
>>>
>>> It is a bug that this was expressed as an HVM Param in the first place.
>>> It should be part of CPU Policy, and it's on a TODO list.
>> But isn't this the same thing the CPU Policy code does? In
>> recalculate_cpuid_policy(), it silently clamps the toolstack's choices to the
>> max featureset.
> Which is behavior that, if I'm not mistaken, is supposed to go away. Such
> requests are intended to instead fail, down the road.

Correct.

Right now, both libxc and Xen run the feature dependency calculation, so
the toolstack ends up passing something which Xen will say yes to. 
We're fairly close to being able to alter Xen to reject a policy update
rather than edit it behind the scenes.

Viridian should be part of the CPU Policy but isn't (yet).  As such
there's no statement of Xen's capability for the toolstack to choose
from, nor is there any dependency tracking to reject nonsense combinations.

~Andrew

