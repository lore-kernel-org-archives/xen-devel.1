Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B88C79FBF
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 08:59:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412698.1643070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4E9C-0002l2-S8; Wed, 09 Sep 2026 08:59:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412698.1643070; Wed, 09 Sep 2026 08:59:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4E9C-0002kv-OP; Wed, 09 Sep 2026 08:59:14 +0000
Received: by outflank-mailman (input) for mailman id 1412698;
 Wed, 09 Sep 2026 08:59:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x4E9B-0002ko-LW
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 08:59:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4E9A-00EIUE-UP
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 10:59:12 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aa11fd6-bab6-0a2a0a5309dd-0a2a4505a900-32
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 10:59:12 +0200
Received: from [40.107.200.38]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aa11fdf-4cb1-0a2a45050019-286bc826fe9e-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 10:59:12 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB5896.namprd03.prod.outlook.com (2603:10b6:510:3b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Wed, 9 Sep
 2026 08:59:09 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0382.014; Wed, 9 Sep 2026
 08:59:08 +0000
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
 b=x0FHh2dJQh14VEZ3Zgx9VeJRJLtlfklgNfzCp6/L+dXLOl5f0HO8O9+pE8sgNOy/oIJ3b+4GIeDKC7FwD7yahNW4j7lFOX9ptmqshh7uCIuvTzuDrnFYFIIuSgBbDhkj+xOYdbup0vB/mQKfCUbMHj4ShYnG9j6vLez+GUr8B84iBelZBKg25BL8VQ495x0BkP7ExWIPsLFJmmu7Cp6mtrhHc63JzOj5wpkwiThpF/ROcsjKWHdir+t+vDO2H4tUTdugSwK/tUU8czp1+ovRCfIxmmgttU6faLVhhwlEOMhMrEPz+guGpyvW9XO/0GP829bCRe14lcOX+n9zokLo/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Ml1cD2jLAbQ1K2jC2vkpy3/LpR8eJ3EBmtmx1sYcAk=;
 b=ToC/L1Wp9OhpK0x2FrA2nikwbcdMOyqWpdXAdCgVxR+riUjkB+FK+qa18hmavQsYFsqZcDd+0XY/DKmuK5bZmhgRybvvNDLe9Ya7tvzGECfHv+H2kB5Mue0SGih1uykmQ2rb8Nuo5mZ88Br8h6sA2KUzloaaOelWVAeAbuzDuE5g97URPIqhyqJJARvLjRRcuU5gM6c1F66KuPOZCecNi9ekYYHQIoVBV0I0/75+6P7+/TqgwQHdSbzHSiDUNKUHsaYJ4sYBKCqdIxWvbcntNdWmxis94ZMot613/RSJLz+UeXu6/4a+H9XZkWh8WZL43+Nbdzc7dDamsO47xz3bpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Ml1cD2jLAbQ1K2jC2vkpy3/LpR8eJ3EBmtmx1sYcAk=;
 b=un+YFFTAb9eHIFq9VHrGycE74FPRdt6GyBKT65/1zNjYcwxa4yaBVnPO/huipoWeTK7IYBXjOj8ResWS3cw7FnEaRqoy7HCmgrDwjzvqA1JCyqY/WsHws2ly9sgCXf/L8Nuit/ksG82/8R5vs1i6K7/BX290Xz/8xhcSpF2hmv0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4844d64b-a747-46a2-a9c5-d0f8c3cbbbbf@citrix.com>
Date: Wed, 9 Sep 2026 09:59:05 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 0/3] x86: Fixes for not-quite-XSA in
 pci_conf_write_intercept()
To: Jan Beulich <jbeulich@suse.com>
References: <20260908215721.3346842-1-andrew.cooper3@citrix.com>
 <891c139a-d6b3-4293-8eb5-7c0af82fd80c@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <891c139a-d6b3-4293-8eb5-7c0af82fd80c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0254.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB5896:EE_
X-MS-Office365-Filtering-Correlation-Id: ca1a93b5-d138-42f8-8975-08df0e509bf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qJ58pfUx3LX2cdDF+H9JDc0NDLB0P7UixmMnBGnwMimAahk5in3kJvYXyweB+X6kCaFN97LS3LV3dyXszalLsSvL67e1I0w6sWwqFD/FYVw4Ad+dEfjhOMQ/zvEhPih0vWqSmjbJH8ZztGU6JGTlIOg7RZ6OVxPxxkrIgqfImjO3hkoz+2GlT/3pIj8TLZTtO3rp8ggf1u1m1aF4M0BPBMPIVDKWTihMMRTpWejIwXsCntcIDwaKQ9TNHLTaGm2WswIwOrRovuLKoViBYTTKxWoDIQK/eZQK8HP9csIXjeq7kvw0yoXHdajMUrvfQ+g8gVlL9XLEjngGqq5YbJgzy/YlItgl8p0TcGCf6FPfLz57gdgSRqM5yq+MC4/XGvsy4JJK/gtpcsB4cY+fo4Ejp5ystGnpik4ebYmAcycTdEjLNtyJUQUjpmecPqh+RIumNz6r5rS+1LDQNMlGIwhl0GZoSCMhk+PW+/GV4lelk0SlJRHHgJP5WyQE+Qa/mLbnsXsQG/saql8AIXyre5OalpeWcAiUdja927apBFwhbmLFLccXDSZH60OHh7IY7xkphTcmDYjFEELQiIEFIFMeAlS1mNloXZKinTNaZ5jhote/8+qO1TULO01IXW1AObsaquKmV1XqrCjB6qft5Pp34m2HdcLBBNZWTxWyAK78jDs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eCszTzFyR0tqQnltcnFKdGs3NVJ0M2xIcFROOVJEQnE2VXRlMG9pblpBSC9u?=
 =?utf-8?B?bmRTRGpEZi9NT09oTTlCV1JXeWZiR1l6UTloK256bFpmK1VmTE9PR21pTVVF?=
 =?utf-8?B?NTFDZmpFVm4xRjJqM0dEWlFaa2J5dnU4L0hLSklCdWRoT2VJU2puSVhBR0Z2?=
 =?utf-8?B?cVBsMmVFRk83SlphaTVFTlNhK0V0TVJsRk80c1JGUG1rY0VtS0tYRFdSNE1u?=
 =?utf-8?B?SVVaS2ljcDZXT0tQVWl3blJKaTFzZm5GZXFjOUwraTlQeDBFOXE4RUxFdG5i?=
 =?utf-8?B?N1o5c1JpVzdnd1BhUExDMyttODN3eHU0NU1mTUg3Y2R1a01Eb29kczdVZm1H?=
 =?utf-8?B?TjRiSUJ0UlU4cVJ1cFVIdkRWRVpuV2g4Ulp5TEozMGh5UzVsdnpTbDBzc2VO?=
 =?utf-8?B?dk9GNlI1RGdYS2g5TDErYlg2WXM3NFdLbzRmTmF6dTVWQ3lMbWUwUy9vNDBU?=
 =?utf-8?B?Zk9GcG0rcE9qcElWTFNhaXp6M3N6amhoMldRbzFsUENBMGQySW93YjNxVEF6?=
 =?utf-8?B?RDZoSzZNcVlUdlRTOElOVGV0TWhzdk5jVUVyMWg5V3p5ZW16NjBKMWVOQnE0?=
 =?utf-8?B?QWR4a3NnVUk5M0RJaXNFZE5ZZkJ5cU1XNWhvek1sRnNPQTlsTWNJRk9zL1ln?=
 =?utf-8?B?VStsemFlcVFoNFErTDhmanVoSFpPa2RDTGNFWFVTNHM5QVNJWEZSbTM3R0pv?=
 =?utf-8?B?M1JLK2hyS09PMFNBTVlLNUVuUEVHMCthU2MrcXFjSU90R0wvRFQ3USs2dlRW?=
 =?utf-8?B?QzJ1aUVLUHk4cFJxeGZLUkpzdlF2ZXc4MGNBWENlS0RiaE1PclhoMHFlZ29H?=
 =?utf-8?B?ejkzWVRsR3VmcmFsalJJY0JIb0xXR0Vzb1hZRUVPNUg2c1FkRWpCV2Ryc2hi?=
 =?utf-8?B?cXlmRytEeGFrSXpyWWg0Y2h3NGVZQjRGZjdFUnZ0aEFLbHl6RzQ2WjFSQnQv?=
 =?utf-8?B?K2hnQnRzT1c2a2MyRko4NHArbldTVkYydlZBaElHSTExazh4QXpSMldxNC95?=
 =?utf-8?B?WXNVWFNJNXlIblhDUE0vbVUrK1lxakxxcmlQakVwRVpNUWJoSEpxMGhkaVA4?=
 =?utf-8?B?VUZvbWdLUXNRVDBvUXZqZTBua3hBQU1kS01hOURERjV5ZTFJWHB1cXBiUTZv?=
 =?utf-8?B?ekw4aldqVTE5MnVlUFBxTHpGdkxhRTE4TGMySjR4TGszbUt0dE9vTjQ1RWtP?=
 =?utf-8?B?dVloTWNmcjJzZzQxb2RnbDYvM0RYNFBrZnNueUhDaXdBTzBvRUxsYUEwN2dt?=
 =?utf-8?B?cEs2bzY2Wm44eE1OVmtaRjIvUm4rQXlrNk11WVBMdXV0TFhFQnR1WjkzYUVP?=
 =?utf-8?B?Wjd1MUUxd1VaQ29obnBqa2ZKMSs2eXNiT0htSmcyN3NuOXpPWDNmdW95TWZS?=
 =?utf-8?B?c01uNVVpUmY4NXlnaVBwQlBUWHJUa2RvSzE1T0pUd21qRWdrZ0ZySUQ3T1RC?=
 =?utf-8?B?QUdXWG1DbEMyVkRkVytSenhtN0J2Q3hPZFRVS1JNRE5ndVREcHVKdUh3NWxq?=
 =?utf-8?B?ZmJBMHFoNDVoVEF0aWV5WWpQay96Nm95UnZGSTBNNGZsU1BEbWhpSUNwcUUx?=
 =?utf-8?B?aFp6WFpLU2tES1VlRDNaMm5BWFE2UG5MbXMvSTR1NzJOYnM5SkdJZ3JzYVB0?=
 =?utf-8?B?ZVBhTnBUOHlwZ2xld2F0aUJ2M2hQTTVCZmNCQ091NG9adVAxbStFektRSGJJ?=
 =?utf-8?B?TnJ3aXRGVzZCaXJZNGw0ZjF2dzc2SUFlUGpmaGsyNGxTNmg3WHE5QmRyNWdK?=
 =?utf-8?B?ckZ6M0pYSFFRWEduWjVYVEZ1TEVCUnBsYjZGSVJsYmkyTUg0U0YrUFBsTHlT?=
 =?utf-8?B?QUpaRjdxNXJOZjRQVUhHM2k4VmpUMnZiTUhReXYwTFprdmRLMEYrQkhxTFNO?=
 =?utf-8?B?MnNlM2kxSFd6QzRMMjNPS28ya0tQd2lIZ05ZaHBqaElxSGh6S0xTSEYvTkw3?=
 =?utf-8?B?SXhtS1M5Q0lTZnVRWWY4RFNYVDhBc3NNVnNwUFFGK1FIbzJrNmhkTnFGSEll?=
 =?utf-8?B?ajBZUitPc1pkTUE2aE1sWGNrUWFTTndPNUh6TlpaZXV2cE9KbVdJeFNYR083?=
 =?utf-8?B?MmpQMlB5ZkxZSDd0ZmNKNkcyWE11Z1IxVGtPNUFrL25paHdscDNLVkZOdGkx?=
 =?utf-8?B?ZFcrSXZzVGFuWUIzbmc5c0Zpem9DSVV5a0xCOVFOWk81OWhObmhBWnYxZXdP?=
 =?utf-8?B?ZjlFRitONnVLR1FPTUpsSVZYQW9RZmtzVHdPbkI1WDZaQXBRMlgzUmpINmtm?=
 =?utf-8?B?R29WVldoYTUvMzM4ZUNLUVZHWHEvcXdBeVhRSk9mRWxFdmYrTi9RY0RJckp4?=
 =?utf-8?B?djlidHBvRXRyaWc4LytlajJEc1dUSCt5ZzdObmx5dkpGd08xTWEzZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca1a93b5-d138-42f8-8975-08df0e509bf0
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 08:59:08.6942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kwEAFAZmztYdfV35E1OYFdSA3eEh9zMlpPWvF/3n9VctKOo6bTVA69FBmXzc3ek2Wdwq3eBgWq6DDS3/gZmkUjGJWig+d8z5yTdmRQA3ijE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5896
X-purgate-ID: tlsNG-c201ff/1788944352-24F1F2A1-78DA86F6/0/0
X-purgate-type: clean
X-purgate-size: 684

On 09/09/2026 7:39 am, Jan Beulich wrote:
> On 08.09.2026 23:57, Andrew Cooper wrote:
>> Plumb pci_sbdf_t up and down the callchain to simplify parameter passing and
>> make it harder to forget the segment.
>>
>> Andrew Cooper (3):
>>   x86/pv: Convert struct mmio_ro_emulate_ctxt to use pci_sbdf_t
>>   x86/pci: Convert pci_mmcfg_{read,write}() to use pci_sbdf_t
>>   x86/pci: Update pci_conf_write_intercept() to use pci_sbdf_t
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>

Thanks.

It's worth saying that there's also some cleanup to XSM wanting to
happen, but I'm going to wait until your series is fully in before even
starting to look at that.

~Andrew


