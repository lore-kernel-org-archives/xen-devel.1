Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CF5606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 08:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=XuKe75Pq
Received: from list by lists.xenproject.org with outflank-mailman.1461928.1672939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLcOP-00058z-Q4; Tue, 27 Oct 2026 08:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461928.1672939; Tue, 27 Oct 2026 08:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLcOP-00058s-NH; Tue, 27 Oct 2026 08:18:49 +0000
Received: by outflank-mailman (input) for mailman id 1461928;
 Tue, 27 Oct 2026 08:18:48 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Shuaidong.Chen@amd.com>) id 1xLcOO-00058m-8G
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 08:18:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLcON-003Bhv-GT
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 09:18:47 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Shuaidong.Chen@amd.com>)
 id 6ae05e5a-e002-0a2a0a5209dd-0a2a4508bf94-40
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 09:18:46 +0100
Received: from [40.93.195.10]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Shuaidong.Chen@amd.com>)
 id 6ae05e64-f659-0a2a45080019-285dc30a2600-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 09:18:46 +0100
Received: from BL0PR12MB4754.namprd12.prod.outlook.com (2603:10b6:208:8e::26)
 by DM3PR12MB9351.namprd12.prod.outlook.com (2603:10b6:8:1ac::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 08:18:41 +0000
Received: from BL0PR12MB4754.namprd12.prod.outlook.com
 ([fe80::ebe5:87e:6d95:580c]) by BL0PR12MB4754.namprd12.prod.outlook.com
 ([fe80::ebe5:87e:6d95:580c%4]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 08:18:41 +0000
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
 b=emHTi+Iuor0GtPzEY/WCIHjfwaJHPTaW/w18Ad2rGTeovXqLmI4kZ80876kymiOb0RNfQxWHgtLM+gBldziKa9j9GMJBj0mbvWz/uAsl5OJXrwta6puiatuEATrvRJ70xovvi9Xgz3U+3U01UK9hUuLA/hdQ34lMFcIt1eMRXCAc2OqX4c063kpWYnXAmc3NvNhJNjddbXD7TQU9s+9WIUwTuBF2OQfRhQHP+oyZbYydM3j8quZ+TRp89eMnf/DRJ4DpThogNQxGLwLdDerTZdcgrBtNGIgiwrA2KDlGybx8j4mpnV3Rq/tmk1a2ExurMgrVvxRmEtTdJn16UztLpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nr1TFgrkX5oNNpNc1S5p8yeuodf6f8dd0a+oIT7WHgs=;
 b=VrkOWjH/zMk8aYNECL8LdjD/Euck6kpDh3uUWmuYTlW1vMbVA/y1ea+Ba5NSBM0FXrGF0OMuL14MAc5qpcdkkMbL+7G28N8QeIyOEv8vh1klJ6bAiHfUOMRrkWiMdo1SQxpeZJifEKKSYfzBPOCalEh0gLOYXg7JpVs/391wycUjqOxlS6+Y2kpgIf1dvklzkaAwH/EcyElWt97lgZlJoIao5iLhIUFp66PS3KceKLLAml62RAUgx/cEtR8LJU2woeZQbYjhO5hc0UElIRmeCbVgDLJG7prU80Www2Yb3sVJl8yEsTAuQ4evtONhfqTpdThMiKmRtdW1yZCVn5VLXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nr1TFgrkX5oNNpNc1S5p8yeuodf6f8dd0a+oIT7WHgs=;
 b=XuKe75Pqf+VMiTBzv1Dx6z3waxmKklzGgOtEq+NlJ2VZNACDr1jrrhaNT5lxbgw1DPRTBZgbSdCwErAJIVzwg5wOMsMdubu/u54rUV0+/CB47YsUS6HdjYg3Yj6HG6lTe4v7GKySfH5SwWJkIrhwy6TwAviy+e5jRnn5evpBrlk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <321e7082-5cd2-4a41-9c49-ff091d9ceade@amd.com>
Date: Tue, 27 Oct 2026 16:18:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] misra: merge the two R14.3 invariant-condition
 deviations
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 Penny Zheng <penny.zheng@amd.com>, Ray Huang <Ray.Huang@amd.com>,
 xen-devel@lists.xenproject.org
References: <20261026030309.2507461-1-shuaidong.chen@amd.com>
 <67e298cd-3b84-4476-9dd3-607e505effe6@suse.com>
Content-Language: en-US
From: "Chen, Shuaidong" <Shuaidong.Chen@amd.com>
In-Reply-To: <67e298cd-3b84-4476-9dd3-607e505effe6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TP0P295CA0003.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:2::9)
 To BL0PR12MB4754.namprd12.prod.outlook.com (2603:10b6:208:8e::26)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB4754:EE_|DM3PR12MB9351:EE_
X-MS-Office365-Filtering-Correlation-Id: d59ebb2c-da6d-44fb-5f8d-08df3402e8ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|6133799003|18002099003|261026121527099003|22082099003|10067099003|5023799004|56012099006|11063799006|4143699003|261009223027099003|261021121427099003|261022075727099003|261021123027099003|261022105027099003|261021135927099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	ecsWPfzxvHTVFJ+v+p8TTtBdOiN70iOryVDZ7fhdcW5iQns0HXHfkUWS+9SJf5kSkAMSEPMbLYCxHluDc7ojxaYYRpuuR2Tn6FTZs6bGAJHILcFKMIjeEEB3VpSHaxAE9ESsigGCdnDh6UgI0sLFFWOHXWfcpy6nJIECxs0v+ayjXNjkmDl8hmeV5mQs3Tg2VoFEMxYED+jdg96E/Wg8teFmjloRtYE7EFBx/TC0H3p2EiygkQVx+nfnvMYV4dWw44rQUwu9q5bvsps0HYSrmhOR4orUhWaCMapjYPBzslBotdcqikbNV2HPlRXJaEwhL+PmrvLYrYl0Ka83P3Rnch74Nc3y2KLoKdqZaVEgKmneB7Y1W+a1HJny1yDMh4OQ+yvMcx/O3VPak2u3XmLkwlvyMmHdRaYLXB8a5WTXK+jxt9lWSobY+aqclpWtnptk6Hno59BqPaubSjcZ2nGok3HCBfRJjpx6RJOWu+ggjvUzhPf7Js7g8PH6pgQdrJ+1jDuJj458DUk4s2eirAwEDEaI++F8CFIq4CbPjJ8k0ucab+sJxk40U1dcXVS+JGktckUhmuZsYHehH1e4bLOUEDiIIPDyO4tov6KVNcWt2z4DEaE6ZTuQjygZ5XPaT0c4bbmbio92r1XaNoghOU4Z6NFQKWVfOpISURCwygu+flc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB4754.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(6133799003)(18002099003)(261026121527099003)(22082099003)(10067099003)(5023799004)(56012099006)(11063799006)(4143699003)(261009223027099003)(261021121427099003)(261022075727099003)(261021123027099003)(261022105027099003)(261021135927099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0hVQVpwZHdUb0JGMllsTENvSUF6TGhyQm5TQmhhaW15ZTAxa2pTbWc1cXFL?=
 =?utf-8?B?WkkzY1JubUZrdkpoU1FBaVA0OE9wbG5heTYwUnNvKzBPV1I0YUdlbmNYSUcy?=
 =?utf-8?B?dXlaaXBiMjJvVVdjQmFMR09vZnBVMkgrTkxvLzcxWWs2UGRCK2ZneWIrVkk5?=
 =?utf-8?B?aytUQlBTYU1hRCtWL1FxT3RuMHdpamlEdENQOGpxS1FFK3c2cE5XU0QzVzdB?=
 =?utf-8?B?alRMTWxzS2IyZTJwS1I0UUo4QW9ISVlaeWxWMFpTbXh3a0VidzZSSnpkbndt?=
 =?utf-8?B?Um5QNFMvamJqbjNUL2h6bE1Rekt3dk1aSmJCTlplaTNvbmlINzhJa1JHY2Zt?=
 =?utf-8?B?RUQvUDBiekQwZlp0TDEyanhWRzYwVTZHeStrVXNJZmo5a1YwK3B6a21JT0xZ?=
 =?utf-8?B?cVI5LzcrQ2tLZDhUenREREllSmE3bEFHZDVwQm02ZHlsRmUwZmlkS0xlZ1hO?=
 =?utf-8?B?VUVjRysvaWQvV2Vtdk40dmYwMTRyeU9IdURhcUEyMDE5clQ5VlZwRWo0aWVm?=
 =?utf-8?B?M0tVTkZWanc0cEgwUEp6blErNkp1SlVHdkcyQytVTFdSZk9GeW9oT0RMWmJG?=
 =?utf-8?B?Q0pwV2ZRMlVTOFhhUzRyNGdteGI3akwzRnlKTmRtc1daTnFaWjR0Q0dOVDJa?=
 =?utf-8?B?TVFHUlU5eTBrWDlsL1BtbzFrb1FQM1ptQkF4Q0VJenVaQ29vT01yTUEyQnBC?=
 =?utf-8?B?TVdJQWtJR0RqSjlJQnJ1ekxGd3RHbFhWYmg0Nk84YjlwRE9iOS96ZVFHWXNl?=
 =?utf-8?B?T2xrTm83aWpscjVlNko4RG4yZlJWSCtEeFdBRjJHV3d3OXJ0SVpWOGMrTDVk?=
 =?utf-8?B?S0U2UzcwY2dZSmpiaGZmU2FXRFZNbEFsL1h3V21LT0R1eUxOVG5EaEpqVUhD?=
 =?utf-8?B?eEhTbkVoNjhTUDFROXRQMnBsWGdWL0YzVWFTZm9ycnJNM0plYWd2WXdMbGRs?=
 =?utf-8?B?OFpyS3dSOGJiSmd4cWlkQjVEZ0lhMUxsRG84ZUlDQVhUZE5GVTVaaEUyRTJq?=
 =?utf-8?B?a091NUJUZnpyWUVBaHRiZkRsV2Z4clpnQU9WUVdpVTdsSlRoU1dGZU9BYnJ5?=
 =?utf-8?B?YmEvaVZkNFpyTTdhRDJPUjh0Q3I5M1NiM3JsL2hOYTRtOUJ3UGJ6aEhjUHJk?=
 =?utf-8?B?cGxITEJyRnNEYm1tR01ZSWMrMjhnOFhmL2Q2RzJXajlVT1U1RnJsb2YxRGRR?=
 =?utf-8?B?MWtQY0V4LzBxdkU1R2VBZnExczgraHB0TGZ3YVk4Z3pDazBjOFBmdG1DT2xk?=
 =?utf-8?B?Y1pzeE13YzRLQWN1MWNGVVUyKzBzWXlNdzF5ckszYm9IMkdKZFh3b0VQbUdR?=
 =?utf-8?B?d2szR3pzK3ZSNk5STVIwZ2FnVHZuanJCNnZvQnNlNkxlZG5QMU5BSkpua3Rk?=
 =?utf-8?B?ZHpDTWdwR1dDeU9VS2VUbHg4cmJiQlJscDVUTlFYVFgyQ2ViNWFiakl3UDVV?=
 =?utf-8?B?RW12bDVGNndhQVgvcmhMck1ZSnBQQTl2KytYUm1VTklSQXM1dVhIZVZNUkND?=
 =?utf-8?B?TXFUWk44b3d2ZEl2U2VFU0ltdFhBNDg0NzROZUZZQTdlUm42Q1hhNEV6aVhi?=
 =?utf-8?B?MUJZVk5SdkRoZlEra2d3Vmtkc1h2a0J4aG9TYi9nOHFVanc5OGpVT1BsbmFo?=
 =?utf-8?B?aklueHQ4MWIwN0NKRGhmSjY3bStxNTZKdzFkYjZRT01NZUYzTlgvNTNUZWd4?=
 =?utf-8?B?MnZmTHBCWlk4MGo0bWdWNTBQd0hBNmhMeHZrb3Jyb1VhaUkwV1JJTzFWbzN1?=
 =?utf-8?B?RzN3SzRoajExRzFtOU5QcVM2TW4wZmlML2o5VS9Na091MG1aKzNmSkFaSlRs?=
 =?utf-8?B?blJzUDgxWTV0Szk0WXpVUU5OVnRObEZ3RUNHOVIzcm9hUm8zTDNPNmxmMk9w?=
 =?utf-8?B?a1FZV2hlWTBoTGFpeW55MVVObGJ6RFNjM2RyRHVwbWxsaE5XMnpzWWMvZjRI?=
 =?utf-8?B?bm5Cc2JZZ0FZbTJYQkVZOHlkU3M5MkRoRVFnTG4xL0prSk5KdlRlUlVDdDBP?=
 =?utf-8?B?Zi82bEdNKzFTZG5LMncxTVR0Y25rZmtuU1BGZk5VRFB1ZWNCUDV6aFpqaEdH?=
 =?utf-8?B?dXRtMkhsZVZZT29KNEZMMkQ0bzNBRERzYm9teTdhOXpuTzN1MkJrSkEyTUV1?=
 =?utf-8?B?T2lURWVSdEUxYVZ1Y3A3NGtjMCtOTnI0Vlp6SlRXTGV1ODZzL093ZFpMR3lz?=
 =?utf-8?B?T2NTMXBOTGEyT2F2UHo5Mm0xbURNU0FwWVhjOW9EQU4vbTB2SjZZS29pakU1?=
 =?utf-8?B?aktzc1lXOUc0aEliYVlDSUFCSEhESnB1cTBxTjh0YWhFK2hycEJaWWs3TFpW?=
 =?utf-8?Q?aAM7HvNBDq6xJ0eRyA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d59ebb2c-da6d-44fb-5f8d-08df3402e8ed
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4754.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 08:18:41.5911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kWJf85ThKSSYSCBlq8tbUTK5FJIn9lSgnypMjYbLO0fqbpOWRyQ776ZEWZYUvSEjhhWRuuWD7xL39DfYY7qAog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9351
X-purgate-ID: tlsNG-c1860d/1793089126-CEF5F87B-5C80A99E/0/0
X-purgate-type: clean
X-purgate-size: 4215
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10/26/2026 9:14 PM, Jan Beulich wrote:
> On 26.10.2026 04:03, Shuaidong Chen wrote:
>> MC3A2.R14.3 ("Controlling expressions shall not be invariant") is
>> deviated by two separate entries.  One covers 'if' statements and
>> conditional operators and places no restriction on where the invariant
>> condition comes from.  The other covers 'switch' statements, but only
>> when the controlling expression is a 'sizeof' operator.
>>
>> The rationale recorded for the two is the same: the condition is
>> deliberate.  Nothing about a 'switch' makes an invariant condition less
>> deliberate than the same condition in an 'if', so the 'sizeof'
>> restriction reads as an artefact of that entry having been added for
>> read_atomic() and friends in arch/x86/include/asm/atomic.h rather than
>> as a considered limit.
> Well,
>
>      if ( 1 )
>
> can make sense, especially when 1 is the expansion of e.g. IS_ENABLED().
> Otoh
>
>      switch ( 1 )
>
> doesn't make a lot of sense, even when it's as a result of the expanding
> IS_ENABLED(). I agree that limiting to just sizeof() is unnecessarily
> strict; alignof(), for example, should about always be usable where
> sizeof() is. Yet making if() and switch() equal is imo going too far. I
> realize though that it may be difficult to find a suitable boundary.
> Stefano - do you possibly still have notes from the discussions long ago?
>
>> Fold switch_stmt into the general entry and drop the 'sizeof'-restricted
>> one, which the general predicate now subsumes.  Invariant 'switch'
>> conditions that are not a 'sizeof' become deliberate as a result; that
>> is the intent.
>>
>> Signed-off-by: Shuaidong Chen <shuaidong.chen@amd.com>
> What you don't say at all: Does this help with any remaining violations?
>
> Jan
Yes, and let me give the full context, since the motivation comes from
downstream safety work rather than from the upstream analysis.

On safety branch one of the techniques we rely on there is to pin build-time
configuration to compile-time constants, so that the code which the
intended configuration can never reach is removed by the compiler
rather than merely left untested.  That matters for us in two ways:
code eliminated at compile time does not enter the coverage
denominator, and - more importantly - it is not in the binary at all,
so it does not have to be carried through the whole qualification
chain.

Two examples:

https://gitlab.com/amd-xen-safety/xen/-/commit/160dac43f554733a68d83c38cc1d0e73b3b7bff0
https://gitlab.com/amd-xen-safety/xen/-/commit/e0eccfa7184b7acee23916cd5cb2a3b5afa101f2

A side effect of this is that some of those constants end up as the
controlling expression of an switch statement, which then
trips R14.3.

 > Otoh switch ( 1 ) doesn't make a lot of sense

Agreed in the abstract, and I would push back on anyone writing that
by hand.  But that is not what happens here.  The sources still read

   switch ( gt->gt_version )
   switch ( opt_bootscrub )

exactly as upstream wrote them, against what upstream intends as a
runtime-variable value.  The constant only appears after a build
configuration specialises that value.  So the construct is not a
pointless switch on a literal; it is ordinary upstream code that a
particular configuration has made invariant - which is precisely the
situation the existing 'deliberate' deviation for if statements and

conditional operators already covers.

Of course the other alternative: rewrite those switches as
if/else chains, which the existing deviation would already cover it, and 
the violations gone. Technically that works.

The reason I would rather not is that it is churn in common code for no 
functional
reason, carried indefinitely as a delta against upstream, and it makes
every subsequent rebase of the safety branch more expensive.

Having seen that a deviation for switch already exists - restricted to
sizeof - extending it to switch in general seemed the smaller and more
honest change: it states that an invariant switch condition is
deliberate, just as the project already states for if and for the
conditional operators.

-Shuaidong


