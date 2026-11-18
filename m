Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18E0606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 08:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=n4++jDtv
Received: from list by lists.xenproject.org with outflank-mailman.1493918.1693633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTaZt-0002uL-T3; Wed, 18 Nov 2026 07:59:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493918.1693633; Wed, 18 Nov 2026 07:59:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTaZt-0002uE-QQ; Wed, 18 Nov 2026 07:59:37 +0000
Received: by outflank-mailman (input) for mailman id 1493918;
 Wed, 18 Nov 2026 07:59:36 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTaZs-0002u8-31
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 07:59:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTaZr-001JSK-F9
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 08:59:35 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Shuaidong.Chen@amd.com>)
 id 6afd5ae6-2eae-0a2a0a5409dd-0a2a450bb54c-4
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 08:59:34 +0100
Received: from [52.101.43.59]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Shuaidong.Chen@amd.com>)
 id 6afd5ae4-b7e8-0a2a450b0019-34652b3b2c75-4
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 08:59:34 +0100
Received: from BL0PR12MB4754.namprd12.prod.outlook.com (2603:10b6:208:8e::26)
 by IA1PR12MB6460.namprd12.prod.outlook.com (2603:10b6:208:3a8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 07:59:27 +0000
Received: from BL0PR12MB4754.namprd12.prod.outlook.com
 ([fe80::ebe5:87e:6d95:580c]) by BL0PR12MB4754.namprd12.prod.outlook.com
 ([fe80::ebe5:87e:6d95:580c%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 07:59:20 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iwyOlggmmTIMOvQp8GLITxM+sevPHE+7mYfWpukdcReGDkasyhGFf2p0cJPtzGbJ35zQ3Cah21tu+SGiMs6TWyBZoGGpFAQgY2Co8+jgpS7AASvjcodDjve0WdR2uP5oWNlq6kInQfFVKebJH/B46AAQb+Sfyndxmw9FcquKTwQd1heBnyvfpJfKXC0xNxW6MIAkUpGRNSKaVSKRa57nO4LEvPg+/LlWuftGCR77aEZtMhRArVGW9RKPfciu4bS4wigHlwYNRtvab1aGQDI6aCBkUmifTiiayNwBVzKpKFvVZIss0EI9oHBL5D3s93uqrH3nWgK6rjlEwVKUrTiTsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cDY0Nu51yBCFJEMrDc/pZKkrTts4HdaPkmooMjI9lg4=;
 b=rs+wC5mq9sxisggiqxpwuSByTThrNsUcJi0SPgCyAZJS2lKWUxneY25XnrSs4R00l8oJ2bqDmg9Mfo/NIRJw/I6SweOVYjit9MvD6oozTfUzPr5zml7U0coYp2KbOadlkridOupe+xn6sfN0QX/xDaClw2QvF5/1Ozk+Txf3T5CYGt4UWk5l6SeXNt5bHciWUZw3C2bA3gdGLpgU9xnf6CsisND5c3oycxyk0FlLm6IdCsce+aCQ/A/jNPRewjrzwtEaVsx/YtXnsP64Bp5nu0C1MH11kaPdOxyAyR7nLJ4YYdigOdOm0ljhtTT1yo/DJSt5UPdZgRbH00O5e/Lqag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cDY0Nu51yBCFJEMrDc/pZKkrTts4HdaPkmooMjI9lg4=;
 b=n4++jDtvWns9mMM8faa2qw1qrYeSLdZOlH2Jv10xXg+NfNBSpJwENieMm9XFsvtC2HS0xbec11u1RazL2NyiVKbyFqn77dg5EfT5cVs9nUdRk0Xh8+kuM3QlILuNJdw44BKNXYzlxQkw8IdP+YVbOnkRMv2xS5eFG9u5h9RtedI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <9c6add31-c9a1-400e-91e2-8764cd6c6bad@amd.com>
Date: Wed, 18 Nov 2026 15:59:13 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] automation/eclair: deviate R2.6 for the x86 emulator
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20261116031717.2958306-1-shuaidong.chen@amd.com>
 <3863be19-b5d2-4277-a550-2bc0235c7119@amd.com>
 <2a38c5a4-f71a-4375-9c23-722179168700@suse.com>
Content-Language: en-US
From: "Chen, Shuaidong" <Shuaidong.Chen@amd.com>
In-Reply-To: <2a38c5a4-f71a-4375-9c23-722179168700@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::20) To BL0PR12MB4754.namprd12.prod.outlook.com
 (2603:10b6:208:8e::26)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB4754:EE_|IA1PR12MB6460:EE_
X-MS-Office365-Filtering-Correlation-Id: f168bbea-d22e-46d1-c8dd-08df4549da23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|261021135927099003|11063799006|4143699003|56012099006|261021133027099003|261021130227099003|261021121427099003|261021123027099003|261022115727099003|261022113327099003|261022075727099003|261022105027099003|261009223027099003|261026135527099003|261026140227099003|261026121527099003|261026130827099003|261028144727099003|261102123227099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	PF7B/LivhzqMGCNeFAqgu42wxVxoUf6h7q31y7SmcbSqu7uk1KkE5Tld0F0/7Ha3pKKc9xpxfYe/n4mmhk8mSM6n4ZHHJVnHvXSEUq7YTkb8Lb0rIMguXj0U2p/QkgAVeKa7B6Spn6GNsqWCoXDgVCSqSosU32Z89tw6ux9yS9RUMotuW8pN1LHdOFPRU77HIZ56bCYY3I7paCDhqIolCT4sFMINQ4/YKLKziSnmLLVpyiMm+BO2+XsYfDdDeUY+6sKTPP5a+qV/HIMM0eJx3Y06X1D5AdxJAJaxyOYSSvKk0oTvMdMqgQmMwEZYbTRV1odC/UyI7bz4Y2s5MgLL/AYDw+/wCPL48FfauXj7JtYe9s1yeBUiotzG0HFTw3cPVWwN0mEkdex0VKP9zQJKVWKTiodazvvtqqIQX5iNIgJI+TVJgQDsaHQJeJ+kZJnqboyf+s2bIWceMtApRiruNZoDYfv/Icvjn7oQv+V+Au379illh3B1rhHXP9vqM+VEX/gH0HcVD18QlkhV1I0+6BOBTBsGPlI6WTvQgHxTGnZzI3VsKrHIVAvSfxD0VYhnjcPHlylcm2wd4WA6Ks769Ez8auTE05Ze+RD0apaLzyFW1R51u69uj8vdY0W90Q2eWyPQcAoyw5C/B8qnmY5MfzobrGEaCkINSlwGmDQHSkI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB4754.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(261021135927099003)(11063799006)(4143699003)(56012099006)(261021133027099003)(261021130227099003)(261021121427099003)(261021123027099003)(261022115727099003)(261022113327099003)(261022075727099003)(261022105027099003)(261009223027099003)(261026135527099003)(261026140227099003)(261026121527099003)(261026130827099003)(261028144727099003)(261102123227099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1FyUlFzU29KTnhxNzFKY2xUaWdUdmpHSVBRdmZpVFJ6cFdOMlk4ODhSVUpU?=
 =?utf-8?B?NUdLUjhlanQ1MGc3WUh3czJ3R0x0S0JaeHpRNTFxUVlQTVBFeUozMUFFdHZy?=
 =?utf-8?B?Qi9tWkFkSDdQQjE3QjNMaVo2UlZjWGJxeEoyMG1YaGlqZy8rUFZsS3ErSGRU?=
 =?utf-8?B?dlBSeGhSQjBBampZZEtFSFBFcklnUXBYWmJXVjRidnVJY2FndnlSeUhzR2Nm?=
 =?utf-8?B?OWFweis3aXFFV09HZ21YQ1VIYUEzN045UjVsQ2twSmt5OGdQTFFMNjVmQWM3?=
 =?utf-8?B?UzFlcUNuTFdHbzNUREJsOHhxaFhCblFmNnVzVjR1V1V4Mi92MGM5VnVLRitB?=
 =?utf-8?B?S29ydUpnSmNsZGlhQ2hlVHlQL3RIVXZRM0R3VkpDQnh0OEJOL0R3ODVqaVdO?=
 =?utf-8?B?STIwWitOdE91bGZhbkVzajcvaW8xalFUUk9WVU0wWVpaUjhScXVkVGJ1ejFJ?=
 =?utf-8?B?RjkxMUQreGNlMmtFbFByRlh3b3BiUGg4Q0RzY1ZDb1RIWkZTUDFPM0JRcjY0?=
 =?utf-8?B?VkpUTWpEdjFnQXJhMHVWNFNkSTB1dXliT1Bpb1ovRTE4cXhKNFhRcEpiTGVL?=
 =?utf-8?B?ZFpEMkk5VDdWN2ZCdkpuaVJ5QlUrdG5ScnRGWXB6dUpkdzVjT0RKcFVMa1di?=
 =?utf-8?B?WGFmbVA3UjkrWmhrN2R4WFFQRWtXT2R6TG03TEFYclhSRGlCNGEvMERIcHBw?=
 =?utf-8?B?aEtNZEJnTlJMYUZidm5DbkRlcTd2TFlzTjRxanB6ZjJwVEZCMjk1TlpIUDNy?=
 =?utf-8?B?NG5xNjBTcDczTHBLZ1FLdm44RVBIdmo2TEdXanZGNGluUWVTOFRUWHJlb1VY?=
 =?utf-8?B?TWpIRTlOVmtreHlzOXVHOGc4Zk52MzY2bHRyMFk1R284dXhxeHdaaHg4dU4z?=
 =?utf-8?B?MlJ3ZGFXcWM1NWhGcndLSGZHSWZGclIvNTFEZVE5MG5wdGZrektnRTRaaDkx?=
 =?utf-8?B?cWVNQXVRVEgzWVM2NXdMNXQ4dDFUV1o2aE9veEJ4WjNLNkxGb3BJcDFJRmV6?=
 =?utf-8?B?eUZzdHV2SW9uYllLMjJGQXUzWG5vTTJDaUp5cGtQTGhMUXNnTU1XanZFMnN0?=
 =?utf-8?B?WHYxdnBBSXQxSGlhbWZZcEcvWGN0d3hUN00zdnJnSlM0U0lRRjNvWU9RTzBi?=
 =?utf-8?B?VjFwbDR3dUI2SVRLdXZzNHhMRDc4d0REWmpSMURrc2ZWMlY0RnR4Ulk4TUg3?=
 =?utf-8?B?ZUNJTmRrY0xxRVJvRFNXUTk5Y0JyMG9kclhlLys5OWQwTE1sQUVIWU1RK3Fm?=
 =?utf-8?B?b0xUalBvZWZoUkdKUzU4WW5sYVg5aWYzZkQ5WHdlQW55bWpLV0VYZmdYMlZ0?=
 =?utf-8?B?QzFSSkdXQlRZZkhPMDIrT245YXM1WUwzeHQ3dmhDdjhMSDkxeXhXL0k4SDZJ?=
 =?utf-8?B?M0RjM1lVd01RT0IvVklZTXN5dzNXZHExNXJsTmI2M2ZDbnRMQzRCaHV2TXJt?=
 =?utf-8?B?VEN0ZkFndWpDVHhnekkyanEvNDNHMjFaNkVRN05PUFJZcHRRWWVxeGpQSmxK?=
 =?utf-8?B?VkNZR2xEbFRFcFdxS0hFNVNrVkdxQWhNSjNKaE8wdDdCWWdrUkhSVHlOZXd6?=
 =?utf-8?B?VU1VLzJ2Z2hNb0RtYkFyeEdwM2FEcnBibmR2Njl0R1NCaXlSL0lZN0JIdVdG?=
 =?utf-8?B?Yi9WNlgzMzZJOEdmSDlRTXc1SExUY3JxUXFDc3ZzNkNoeVBnVGREZkZZeUNJ?=
 =?utf-8?B?akJac1BJTTM4akMxZm83c3VIeHRIaWVOTjJuVGV1eUxjNmJFMWUzS0p6WThY?=
 =?utf-8?B?azFYRnN2bHJqdTloaEtoK0NUUHFxdHppellzdVZKcGRZemtESDBmWHZySkYv?=
 =?utf-8?B?RnozL2ZZRHZGei9Fb052ei90WEhjQ0VwbW4xTjcwazdZNzNxMThzME9jWlc5?=
 =?utf-8?B?VFVZaW5EMk5jbEwzcGhVN295amlDOEZldmpqQlF3OHhEb2ZjMjQ4aUQzemFz?=
 =?utf-8?B?M2ZISnFNSFF1SGdrSGZpUVNkZjlDdENsRmJlMXF6MldqVUt4b3JtN0Jxa0pz?=
 =?utf-8?B?WUZwa01UbGh3QjR0QnJqWldEVEtoNUM4VlRQaUwvSkk2ZFBQK2FqY3IyMGhj?=
 =?utf-8?B?R3lHM0tlRi9tMVVBdldVejNCekVCVytFMkpBU1lEdG9lMUxOaXFzK2t2Vm9Y?=
 =?utf-8?B?eGRXTkV5cDRDTVN1YjlNcmpqcVFQTHlyZ00rV2RDR3JRMEFpaDJZZnNpblNn?=
 =?utf-8?B?REs0VHRyR21nTkxWWG9sT3dVc0JCWHdGY1ZFcjRsRmcxUGoxZTFueTZ5VTcx?=
 =?utf-8?B?UXVuN3oyYzhrMnQycThPY3ppKzJ6K3lUcVpxVklOTlppcS96SUxBZFd5bkJu?=
 =?utf-8?B?YWphaG5iTVJwOTc1UTVVcTN6dkNaeUk4cFNQdEZQVTZiM2RwemJ4QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f168bbea-d22e-46d1-c8dd-08df4549da23
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4754.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 07:59:20.8959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aNaPsHieN0RIES9CkeCpxJJgXvEqz0JPwNaa7z4BldIZMalAlIcE+1xbn71mBTHDkan3NFYWf35VW1NPrQ5fQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6460
X-purgate-ID: tlsNG-42698a/1794988774-AA8D99EA-C666ECEF/10/78276251493
X-purgate-type: spam
X-purgate-size: 4476
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/18/2026 3:51 PM, Jan Beulich wrote:
> On 18.11.2026 04:16, Chen, Shuaidong wrote:
>> On 11/16/2026 11:17 AM, Shuaidong Chen wrote:
>>> MISRA C:2012 Rule 2.6 (advisory) states that "a function should not
>>> contain unused label declarations".
>>>
>>> Depending on which parts of the x86 emulator are compiled in, some of
>>> its labels end up with no goto targeting them.  For example, with
>>> CONFIG_HVM=n private.h defines X86EMUL_NO_FPU, X86EMUL_NO_MMX and
>>> X86EMUL_NO_SIMD: the CASE_SIMD_* macros then expand to plain labels
>>> instead of case labels, and the gotos to several hand-written simd_*
>>> labels are preprocessed out, leaving 91 unused labels in
>>> x86_emulate.c.  The build already acknowledges this by passing
>>> -Wno-unused-label for that object.
>>>
>>> Annotating these labels would only add churn to the emulator.  As done
>>> for Rule 16.2, deviate the rule for the emulator as a whole.
>>>
>>> Signed-off-by: Shuaidong Chen <shuaidong.chen@amd.com>
>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>> Acked-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> ---
>>> v4:
>>> - Reuse the existing x86_emulate file tag, moving its definition ahead
>>>     of its first use.
>>>
>>> v3:
>>> - Drop the CONFIG_HVM=n specifics from the deviation text, as the
>>>     deviation itself isn't limited to that configuration.
>>>
>>> v2:
>>> - Drop the __maybe_unused annotations (v1 patch 1) and the CASE_SIMD_*
>>>     specific deviation (v1 patch 2) in favour of an emulator-wide
>>>     deviation, following the existing one for Rule 16.2.
>>> - Trim the Cc list.
>>>
>>>    automation/eclair_analysis/ECLAIR/deviations.ecl | 7 ++++++-
>>>    docs/misra/deviations.rst                        | 8 ++++++++
>>>    2 files changed, 14 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> index 296340bb4c..d49af53055 100644
>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> @@ -55,6 +55,12 @@ removed by the compiler, the resulting slowdown is negligible."
>>>    -config=MC3A2.R2.6,reports+={deliberate, "any_area(text(^.*__maybe_unused.*$))"}
>>>    -doc_end
>>>    
>>> +-doc_begin="Depending on which parts of the x86 emulator are compiled in, some of its labels, many of them generated by the CASE_SIMD_* macros, may end up with no goto targeting them.
>>> +Annotating them would only add churn to the emulator, therefore it is deemed better to leave such files as is."
>>> +-file_tag+={x86_emulate,"^xen/arch/x86/x86_emulate/.*$"}
>>> +-config=MC3A2.R2.6,reports+={deliberate, "any_area(any_loc(file(x86_emulate)))"}
>>> +-doc_end
>>> +
>>>    #
>>>    # Series 3.
>>>    #
>>> @@ -531,7 +537,6 @@ therefore have the same behavior of a boolean"
>>>    
>>>    -doc_begin="Complying with the Rule would entail a lot of code duplication in the implementation of the x86 emulator,
>>>    therefore it is deemed better to leave such files as is."
>>> --file_tag+={x86_emulate,"^xen/arch/x86/x86_emulate/.*$"}
>>>    -file_tag+={x86_svm_emulate,"^xen/arch/x86/hvm/svm/emulate\\.c$"}
>>>    -config=MC3A2.R16.2,reports+={deliberate, "any_area(any_loc(file(x86_emulate||x86_svm_emulate)))"}
>>>    -doc_end
>>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>>> index bee4686675..7b983db264 100644
>>> --- a/docs/misra/deviations.rst
>>> +++ b/docs/misra/deviations.rst
>>> @@ -116,6 +116,14 @@ Deviations related to MISRA C:2012 Rules:
>>>           such labels poses no risks.
>>>         - Tagged as `deliberate` for ECLAIR.
>>>    
>>> +   * - R2.6
>>> +     - Depending on which parts of the x86 emulator are compiled in, some of
>>> +       its labels, many of them generated by the CASE_SIMD_* macros, may end
>>> +       up with no goto targeting them. Annotating them would only add churn
>>> +       to the emulator, therefore it is deemed better to leave such files as
>>> +       is.
>>> +     - Tagged as `deliberate` for ECLAIR.
>>> +
>>>       * - R3.1
>>>         - Comments starting with '/\*' and containing URLs are safe as they are
>>>           not instances of commented-out code.
>> any other comments on this?
> Before asking, did you check the tree?
>
> Jan
Oh, my bad,  it's already be merged, sorry.

-- 
Thx and BRs,
Shuaidong Chen


