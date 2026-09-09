Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E62C79FB6
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 16:36:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413492.1643697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4LHi-0002HV-4e; Wed, 09 Sep 2026 16:36:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413492.1643697; Wed, 09 Sep 2026 16:36:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4LHi-0002HO-1t; Wed, 09 Sep 2026 16:36:30 +0000
Received: by outflank-mailman (input) for mailman id 1413492;
 Wed, 09 Sep 2026 16:36:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x4LHg-0002HI-1c
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 16:36:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4LHf-003PWQ-9b
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 18:36:27 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aa18adf-bab6-0a2a0a5309dd-0a2a4505d3fe-36
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 18:36:27 +0200
Received: from [52.101.53.67]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aa18b09-4cb1-0a2a45050019-3465354383b0-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 18:36:26 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH3PR03MB7481.namprd03.prod.outlook.com (2603:10b6:610:19a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 16:36:19 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0382.014; Wed, 9 Sep 2026
 16:36:19 +0000
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
 b=SckKboWbHDHUvFJXGZAWayrjM8HsbkwqAHbjVT/YrhUZUHSySsaH2IIVwIjnL6qDIsdAJ3hPUcef0PDYAY1ErYpLHGLMaxLgIFIvEea3+CzwwlTcvEfe7cp/p8bpCLijWBs5EEsDH8ER1nnsVcv5SB4YBUY7a4M/XbUvo0zaaLF+Tsw5g8uNsZst1UuFb8t7Q8JwPd6Zx8UwD0FUv/KdGwsXcIUj24nBQV0fnGbuYjtvqWTazFATi88bl5FJl882nYqGNDpayoXQ5NtlPHM/wZL0hf1ocQEzZZwU8PTkuMyyJUSlomP3Y4epMl9zo0PQ2wWfYOQiHEbQZei+vFFrNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h05uelj3kCaL5HmqleICISmLf2xoEmSZCvNmkWm6L8Y=;
 b=GzeE8uDHmsJA9YncKjN3qfFIxMuNQLEfRPdU8Z3o/y8N1Jypla9VkSXIcfthtq/SALlpkXN8Sw4jf3kzH+FXpnNnAnC7LaqqrLipIKiMm52W9c9yLM0Dw+g7IF1XIwRoaAom6tBsBfX/5eifyRVqcIiOCasdVECky9zcSUjwXYh0wacRd/K9sAmOSLMf/JjY6o2CAC1/zdjI+gsDvLBqf5Z6/h9Mld1j4wbGVfmB6ICJ7fDj2XBxZccxh+nyj/Jcq7jp02t4rh/e86OIJhKLIMCo+28yJXYMdNV8x4D5xYFq79Sl0NBCt7drsP7i4nGpbLX2g3JZpAP2RxodEU/qYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h05uelj3kCaL5HmqleICISmLf2xoEmSZCvNmkWm6L8Y=;
 b=j2i1znBn/AGnkpDdxMhdPnqUBKxiGZ6hsc2zLqET9c/gnH7eFHdUvD/zDj6/L+fNqGOhhn+p2OI3QsWFFx6YBd/jA0y2/ecjNtQzKaN0vFNroO+qMs2F1YjOss7kwZBx1PzRPGgCkDvldV9ckpRaduA6t8tgfxDoK8vwlecn1AU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <157b7cb8-5e20-40d5-96ac-8f2488fff234@citrix.com>
Date: Wed, 9 Sep 2026 17:36:15 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v3] x86/ucode: Work around Granite Rapids erraturm GNR98
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
References: <20260908171525.3196765-1-andrew.cooper3@citrix.com>
 <aqEobrU33SuSjf6p@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aqEobrU33SuSjf6p@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0130.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH3PR03MB7481:EE_
X-MS-Office365-Filtering-Correlation-Id: 726375b1-b065-4ac1-80bd-08df0e9079a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|6133799003|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	fiY3XT9uWupuzwpb5W/cqcQTtkmgK4rWN7Y4XzXATAv7fD8bpHdI0T1bNPt3dP7m3cv0YXA14kCgqmaasxCD9OwE0WrchmDCrU+PMPFxdZTYtWdPPWmcBf8ESmUj0hsfRpw6r2I/Z2UUQsSLufbGKEVZLF9/5FggRNSNw3p+gHpiJVvQw71HfGb5ibRRDZy8voCvU+ig2jqNizcKVAtMALrncHyu6BNzjZQVIo5rLRP30AHYtQ271BSDCDH/mS0NtQwWdJ1qonlAmOUVts5eyXj3P8UtiHLr/rlPApTfM0Ei+gEJFq8H7VHpdnJty39i+FILUPh4MXiEpgfU1Tfbv/bMOgBPvpdFykwxyjRpKuqZtZYOqmGBsTDVIGXc0H+YB1CUPVil8r80qlESu5UC+oSOvhF/2m4jeSaEyn/ziu7dPt8YrxZUWvyTJzPXo716kyq79VAbQpPzLy/lTkuVd8yoFOigMjvd7We+ibIMJVln4ikcgkDr7PN/zWoyGClfvPQD+HBX/BkdAZMt590mcwVfWIUciyDqc59jMxhd0AezNL1zBuIuft2nC3thxVmZ2l/L2hTn94MD0T8zJw46PBFU2fQwaV5yv1GLiMymZNZvxHB3xbkSLszqsMKg6nAdGXfuYAhSkABM/kvNeXNLRVQTYMibeeGk3Z7qlfumzHg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnRSR2ZpTFdMTlo3UGpCZCtwS25KbndySzFoRHA0WWlNUWRka2ZSY1dWWGNZ?=
 =?utf-8?B?MHZ0MkdOY1U5aFE2a2dSeE52OXQzK2l3L2NjYTB0S2xyME1qbTZDYlFucEN6?=
 =?utf-8?B?VTVBQ2Vrd0svbUdGVndnbEhSbGlhZDQyVnNZb1dqc1hzWjVTQmdTWlNtcFd3?=
 =?utf-8?B?SEZSYmxLTlhqTWdGSDZyRFNiWTFGR01tOTVEOEJtZHM0eFBydlBHeUE5VUNJ?=
 =?utf-8?B?cnJpdTBrYTJGMGdkcFdDMnJjQVVCb285ZXE3dUdtVjBuNVFJaXdnOUpYSWVy?=
 =?utf-8?B?T01pV2NjaEJhd05IYk5ZWVNBS2ZwcWFmaExQNDZwc2FwRlZDVVlBYWtneHMx?=
 =?utf-8?B?ME5sRk53MEtVTWV3SitpajYrTTQzcFk5SUpua0xiUzZKaS81US85dkRQYVhB?=
 =?utf-8?B?bTJBZ3VqS3RNZlJMeVRodk5aYW1WUWk3eDNhSFV6dUZhTHlyNm5KaDhkMFdl?=
 =?utf-8?B?TXFaWnF2ajAzbVQ1aXZsdUxNMGRxbUEzYmFaVElPcElOYTdtemlLMTA1ckxq?=
 =?utf-8?B?eWZZNG5GS1VPQytUVzdsdXQ0S3NCVTBjYnlMSjkwRitNN2dnQXR0QjZTSEpV?=
 =?utf-8?B?eFp0OTczOVhZSjQvMCtFdFF6YzVqcXBzV1NsMEp1Tml5UjVnSElJV055VWNI?=
 =?utf-8?B?TXRsbXVVczFCODJKR0VkSFR0cm5RK2UrU0VuODE3cjNhZjNldVE5RFNEcThV?=
 =?utf-8?B?UXpWRDJ2ZVpQbldkM1JTMzI4d1Zjb2U5NHQxU1ZISFRwbVkzMXdNVTMxSGkr?=
 =?utf-8?B?eFZqU2wzb2Y4QzdrcDJnWm5FNEs3NDd5SXdhT3VQeUxaSVE3VjJDVy9BVnp0?=
 =?utf-8?B?M25rUDI1QU4zbjFxTGc5Z3pvK3pReHBXZkZjaUI4TEZxbUNSL3A5cWxwQXIw?=
 =?utf-8?B?K0I3cTFzTExYMlVGbUVicUJFdkpINzBJelB1TkdQUDlhamJGVHVSb0pOWlAx?=
 =?utf-8?B?dTB1VmNjNnRWMjA2UForWXlpMFF2N09OSGkyL0JMb1NXMUFFZ0ZCOXMyNm0y?=
 =?utf-8?B?Tng5akN0b0pXZkROcUhteFVwRXQ4SGxHZzhDU21ERVpSMlVsNlZseGpCZzN2?=
 =?utf-8?B?QkVsc3laN245alArL0ZDdmUwa1RzdTN4TzJrRmRwcW8vbm1sSEgvc2lrTk12?=
 =?utf-8?B?T1UySHhoNVlYSzFnc0x4NVhoOXhEa1NKQTc0b0dGb01NYmI2NEdQdmh2WXg4?=
 =?utf-8?B?eDlONno5bkp6TzhCN25KelBpQkRSYVRoMFIxbjF5Yk9rTW9oTWlEcUhDRTg2?=
 =?utf-8?B?OE5xc24zMUZuUFluK2ZTN0FGZjhzT0NMRDlqd2dZdytjQU5wVUplZlIyVStw?=
 =?utf-8?B?b2RDRXBkRCtHS2JKbnpWTnZCZnRwODQ5U3l6OE03ZHdDTFNoVDN0N09tL1di?=
 =?utf-8?B?WnBtRUJ2bVhycFgvSERMRERtWTRaQXBmMXExbjlPOTB4U2dRWStYWmZoVkVK?=
 =?utf-8?B?ZHloV3YzTnB2TXpZcVZRWEZrQURqWEo2eTJweHQwakMrKzcveVBvRnU2M3Fn?=
 =?utf-8?B?NTBsSExkQWNoalVqeE5aMFFlU2lxN2tiV3VkdmlLUm9XK0FRTklKdFRHV21y?=
 =?utf-8?B?cFUwZDRzbkpCcVZNNHpOZzhWWUN4bHVKWE9KR0pxb1pLdE5tMHRpREtLdk45?=
 =?utf-8?B?cDRPRXVFSzBrOFBIOGlvZHhvcEtUckJHU3BDMU1CRzZlSUx3a1hjVGpCTEUx?=
 =?utf-8?B?OEpKVUE3STZlQVJTVW1KOFdlYklmVzQ0N1ljS2lZSlprZUtWblhTRVRUeCtI?=
 =?utf-8?B?eG5hZWxZVmJHdFNIa1VYbGRrbzZPK0pOS3ZYaUJvVFYwNjl4Q1RtQXg2SGNl?=
 =?utf-8?B?bWxzU0IyNXFxa1IwUzdRR2ZUd0JYcFhRSS92Z1RYZUFNdWlFWEpsU1haSjlr?=
 =?utf-8?B?eHRKbGQ2Z0JZZnNxZENiTmE5SE1obVNvNEVWSHNNU1MyOFE0VmdPS01QOHBK?=
 =?utf-8?B?TzBIMEd3V1k2RDlXaDhrTUFGdG52QUVCL3h4cHRwcUw5aVUwbFY5VzZyQlZx?=
 =?utf-8?B?c0pLTXY3VjBSUG1FMDJxYWsyRCtmL2x2am14RVNrY0xvV3NqSFl3eGZ3ZmZo?=
 =?utf-8?B?SFlDNzdCOHZzYit1K3o2ekRMbTBTeG1sbDdBb2QyN25PZTN3U3kwZkc2S1Zh?=
 =?utf-8?B?S2p5K1RDclIyeEJkQjFKV3FEUGs5MDNVWU1FWWkwemorSklra2NXeVlCNkZt?=
 =?utf-8?B?WnFnZEpQVVh2aS9IY1AzWkVtRGtqTE1iN0I0T3NIS29rUVRhaEl4YVhRWlBr?=
 =?utf-8?B?b0UwRzdBbjI4cDJJZHhYQ3JSOTNaZEUwN3lUc0huSkY4TnN2d2owZmNBU2VL?=
 =?utf-8?B?Q2RLTDZ5em0xSVZ1ZHhaY0t1UkMxSGdWYzJqc2NyNlRyQi82TGhOUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 726375b1-b065-4ac1-80bd-08df0e9079a3
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 16:36:18.9407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7pVXj+Se7hDnt5xhRnzieYy/ARPfv4Lpsx0EDYJuZnNgoSyece3pKYT1KErqk2aYhVYA33Nnx3tUph8wKq7gmJCcSGImwschiU4Iqrmk8nQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR03MB7481
X-purgate-ID: tlsNG-c201ff/1788971787-247132A1-E6EA3735/0/0
X-purgate-type: clean
X-purgate-size: 1956

On 09/09/2026 10:35 am, Roger Pau Monné wrote:
> On Tue, Sep 08, 2026 at 06:15:25PM +0100, Andrew Cooper wrote:
>> +
>> +    /*
>> +     * Treat pre-production as always safe - anyone using pre-production
>> +     * microcode knows what they are doing, and can keep any resulting pieces.
>> +     */
>> +    if ( (int)cpu_sig->rev < 0 || mc->rev < 0 )
>> +        return true;
>> +
>> +    /*
>> +     * GNR98 states that Granite Rapids systems hang when loading new ucode on
>> +     * sufficiently old firmware.  GNR101 retroactively states that one ucode
>> +     * had an incorrect minimum revision field, in light of discovering GNR98.
>> +     *
>> +     * Both are incomplete statements of the problem.
>> +     *
>> +     * At the time of writing (August 2026), the believed safe sequence is:
>> +     *   0x01000370 -> [0x01000380...0x010003f3] -> 0x01000405 -> any later
>> +     *
>> +     * Disallow known-unsafe loads while permitting believed-safe loads.  For
>> +     * GNR, this allows multi-hop loading to get up to the latest.
>> +     */
>> +    if ( boot_cpu_data.vfm == INTEL_GRANITERAPIDS_X &&
>> +         boot_cpu_data.stepping == 1 && (cpu_sig->pf & 0x95) &&
>> +         ((cpu_sig->rev < 0x01000380 && mc->rev >= 0x01000405) ||
>> +          (cpu_sig->rev < 0x01000405 && mc->rev >  0x01000405)) )
> Given the logic, I don't think the CPU needs to strictly be in version
> 0x01000370 to update to the [0x01000380...0x010003f3] range?
>
> Maybe you want to replace 0x01000370 with "any previous" to match the
> semantics used in the tail of the sequence with "any later".

Hmm.  370 was the first release, so the analysis of the problem stops
there.  Everything older was development phase.

But yes, the eventual planned fix doesn't have 370 as a boundary, so
I'll adjust to "previous".

>
> In any case:
>
> Reviewed-by: Roger Pau Monné <roger@xenproject.org>

Thanks.

~Andrew

