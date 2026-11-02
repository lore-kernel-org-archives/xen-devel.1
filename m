Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C97606C3CC
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 14:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=eA7N3VLe
Received: from list by lists.xenproject.org with outflank-mailman.1468413.1677520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNtFv-0005XF-Qn; Mon, 02 Nov 2026 14:43:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468413.1677520; Mon, 02 Nov 2026 14:43:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNtFv-0005X8-Nf; Mon, 02 Nov 2026 14:43:27 +0000
Received: by outflank-mailman (input) for mailman id 1468413;
 Mon, 02 Nov 2026 14:43:27 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xNtFu-0005Wz-Vc
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 14:43:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNtFu-00BBfd-Ag
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 15:43:26 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ae8a188-e002-0a2a0a5209dd-0a2a450bd6fe-24
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 15:43:26 +0100
Received: from [52.101.69.127]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ae8a18e-b7e8-0a2a450b0019-3465457ff58f-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 15:43:26 +0100
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by BR0PR03MB228406.eurprd03.prod.outlook.com (2603:10a6:2c8:66::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 14:43:24 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 14:43:24 +0000
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
 b=XHwaYwy9mkB21TEeyNa7FPz9oEqbYiKpZEdF3kSG9qVeMFCF2WsK8Tk9NOIkscV1H06nQiB+m9qZrqcIjuIewpLEAUF9U64HmR/XLJyCFMighezyAEKYExuqJcEmhiClhDqQFxgGxJiSGNvknLK3+KKX+aYaKKyZdYs3k1QoDNsMKrUUMMufWGNhWjIXVfurmeQRY76f7DkVJctMl5x1KysSmd5nxOoMGMzmTdC888fK2Ip0doa20q10wSnd1qZKZvX6RiTWtqCMgqnvqPaQFRP7MS8rHIYluPU0gpyTlUjhzX+RFwF8Q3ObeEjqNbA5Z08emkxUSFVF+O69gF4F/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ABfFHEX/1nXmaldgHj1APyoLHqmu/HToKqwkZSYceU=;
 b=K/06ZfHkf7DXEjPpCzVVtgkWqCTjn/jXiTQY/kmku2zknezeN3qalnDwvRFXRGXv4R3+Ezi0jVas6iO1nryZwg4Ch+55wAs+pcbdpPXX9Biqq4JfkhsB+FzqgUH8SWE26Tcotxohi0wFscPaWLjyLE3VzguPrKuSQNDMSIZRR2oC5FbhZBJN3qcMsB03gxyeJmLxL6CGESe9HxeBFnHEFLYnsLlRiZ8WOAJ5TFz/zUwO5d0BsJ/cKGTeOgyyeTyCmk2TRfEd+wm3Fvt6bEXMfUagqPVtLtlnWpqdg9ENYMvUzE0/A2hxJ+hsTDvVVTwGVdjkXDknR6NrCJwgbElYRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ABfFHEX/1nXmaldgHj1APyoLHqmu/HToKqwkZSYceU=;
 b=eA7N3VLevsjRqRzUtkShHcdALQM0yQlfmVq9/HJLtq9aIh2SQhKJVu1G7ntewDiy+22ystIOF6YGjgU48XkKCGnbu3HZ4vvqM+DvjsMlGNIM9V5j+nNSU9y2lKLTucZ2vJDi9QDT+/P3ONfMw56NvnUvgVUGLAQyU07jdk2oxegRCKAV4Yr1L4uXa1sIcd9HQx/FbH1Btl488E+o3zsMUdsFIRiH2CIETfIkn87hss3OFcgPmK5K2eRYTNz5l8iH855hStd0kxnbws/y2FRV1dmaliceZLn1Iu5ky55CkrObFzsph+eVTUHHwJXzqTB994CoCDsl0VAIyMHiWK8B2Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <fddeac51-52fc-4ab9-bb24-0b3b33faf07a@epam.com>
Date: Mon, 2 Nov 2026 16:43:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: deviate MISRA C Rule 10.1 for boolean operands of
 arithmetic
To: Jan Beulich <jbeulich@suse.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a536212d9cb18b5c23d06c1c06b9a8ae03941440.1792428626.git.dmytro_prokopchuk1@epam.com>
 <83187933-b4cd-46df-b428-368d6f71cfaa@suse.com>
 <dd2f093b-4151-4c42-ba7a-c7b1ce96e02d@epam.com>
 <929b051d-2735-4d33-9240-fdf13355c11c@suse.com>
Content-Language: en-US
From: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
In-Reply-To: <929b051d-2735-4d33-9240-fdf13355c11c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1PEPF00005B97.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::62c) To AM9PR03MB7526.eurprd03.prod.outlook.com
 (2603:10a6:20b:3de::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR03MB7526:EE_|BR0PR03MB228406:EE_
X-MS-Office365-Filtering-Correlation-Id: cdec245f-2b13-4961-ff8a-08df38efa632
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|10067099003|18002099003|22082099003|56012099006|4143699003|11063799006|261022105027099003|261026140227099003|261026121527099003|261009221227099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	xoxzqFzU5723Zcb9QLXeu5YYCQskwNuZK6rTBLbZLLiBq4llQhysCxEsHC59v2qkjxXMdVm9PtEnxRBGqn4raRf72TMjrXL0u4gib1K20BCckJ3O0k26hDQujhT/IMk1Sjtr0oQ1ctWpquDMXdMom9Ybilgwnt4ritOGtA9Fg05w9c7rvDSQn0TSV28ltu4YwdYreVPbFLRKiyb7JDZK4iDjVPZxR49AlndUzfRX+GT8tinnpl9s5YeTNsi95na+I4HVIfZCp7aPq7mZIEe2ljddAwDenUEM1n/cd53t5fwhmVcSiyoIjvRhbkJcr8LAYyHWy9zYF+yoRiMKkkjgJPeATtaZKuqFfYshL/u1kyp9PxM1sPKgDrrXPdTtHH9pTZB8c9V35EQYpmFuhw51vE0DHowdwrtUgQcYTGcWlqMsR14e0/P9r6IW9j63YIem/1IFdZq+Mc2EAHikSwwMGk6o5dqoHtmLLQQBKHXh2DVeDtOe1IdAiwn4Li+3vWdnyKU1L/Ex6APrDws5EAKPZkIR1tPuuzQQACGdP0LRA/ya0ZeJFVmBiSqlJbg8VJbOIasflhhBJF3lOtCJzJukxHmgsqutrZfnYykTB0R5ynqmfiL8ywqOoLsVVJpEO3c4fsdzO3Dx8sgjZ8h6Aby9+kRwLuoWY5fgnNb+CHzDVuk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(10067099003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(261022105027099003)(261026140227099003)(261026121527099003)(261009221227099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUs3Y0gveUJiTFBlVWExdzJhWXJYanNRRmFqUENHR2NISHlQYVhMUXFjcll2?=
 =?utf-8?B?RzJScjhUbWtadTFHeWdNdlNscXdXalNoK1VpUWt2OEcwWXR1WlJoRTNzOW9S?=
 =?utf-8?B?djQySWgzckhTVStIKzVWeFRRNjVTcWpGWlhYbE5LdHI2cmRpTVpEU1FHR29C?=
 =?utf-8?B?YzNxTkZkZElEdmlvZyszR0padms1elRGSnlSSlJmN3lQb3RLRitYRG9EMXJS?=
 =?utf-8?B?NjExRWMyaFZjcW9sV0plOWNYNmxaSG0xTldmdXpLazB6bDBYR29RWlhZL0hw?=
 =?utf-8?B?dEovTklNWG5BU1IvS2lxMHdQUFV5T25GQ1dLUjcvZ3RWV0ZxZnpqNStUME4z?=
 =?utf-8?B?MlFwSlNyaEFVTzhNeWlGV3FxUzhJeE5TNkFoVW15YkxUSTgxVFdtT09heklE?=
 =?utf-8?B?VnMxb0N4cjFDRG9rQVJtM3ZLL2ZLYUdtVXlUcGRmSENHenlkQ1JXakpSZnFC?=
 =?utf-8?B?aWRJTlhqZFViSUlucXFKZEpOMUx5TTI4YVRPU0paelVUSDNjU09RVHdmRG1J?=
 =?utf-8?B?bnVqWG55OExTQm5ZaGNLTUN6RU1rc2grRWc4c3IxTmFnNFhYZWN3VDNtR2Vt?=
 =?utf-8?B?bWhoc0ZzeEUwZk5VMSt5WnpOZzZsVnFXY290Y0lnRlIwUXJwNE5Xa01Tckxl?=
 =?utf-8?B?TWkyT0s2U3F1TVdSZEJ4YkhXWE1RNTl1QXZ2Vm4vV0JjdlE4RHpJT1FBQTFm?=
 =?utf-8?B?WDUxZ2J1YW9lUVRqaWh1bmRTbGlZQzl1cVJpZ3hFeUYwZEJlTFhvY3U3aTZj?=
 =?utf-8?B?NzBjYVJDWDdwcW9MN2ZuK0daRGQ5SmlmYThxTGg0eDJzQlU3VXJ4YXp5dnlt?=
 =?utf-8?B?MUJrOVhrbG5uMC9jWHJjSmJNRGd4QVFOaGVKMUxSZ3ZsOGFjM3lEVVhicXVo?=
 =?utf-8?B?Snh5cDNicG05S1pSYU11NDNsek9xbXQ3NWRiOHI1YXU5L3JHSUh2bHdHRmN5?=
 =?utf-8?B?VlVwY1NYbElxRWdJdWNxU0R1RWpHQkkxd1YySkNLNWppeGNCTWRFckJJRkxz?=
 =?utf-8?B?MmxRT0hCTFVqbTJLZDZFV2lpT3l3bElHZk9zaXpXWEIrNDNvRWxRcnJNWDhR?=
 =?utf-8?B?OVltUmdlalpyWjFvSUd4Z0R2a0hnL0VINVRLakgzbTRuNFVjNWhISmk4Rzkr?=
 =?utf-8?B?VXpOQm9LRC9iUVEwWjlFazJkTGx3ai9iTmJjU3dzeUxQTjBHWXhKVmRndVNx?=
 =?utf-8?B?WkJYVGNHOEQ5aXlrV1JOUGxkdUdtZHMzRm14cmZCMzlRVWNwZGhJbTIwUFo4?=
 =?utf-8?B?azJwd2lvSGVlQndRU1V5enZ3VGRqUmdNT3paWFgrR3lCOXlZWmY1ME1VOWkw?=
 =?utf-8?B?VjE3N3dFbTdvVzkwTFZoVDVkYk9neE45TzhYTmZPc2dHRDdBT045YW44bU9W?=
 =?utf-8?B?RlgrcU9nTG5kWGNRM3JNWktML2hSdTFQdklqWWhubjNsSnBnZExRRU5HblpG?=
 =?utf-8?B?WVpTQm9LSkNJaWhQVTdhN2txaXJGcU8rUDg1bG1pVEt0S0N0TFVuWWt4Rm1S?=
 =?utf-8?B?M1BQby9VODloOUxmRWJNNHVEUGVSMTdIZHpoeTBrUnFIalVtYnU4WXBJenhk?=
 =?utf-8?B?RnVvTTFSZGpKNEJ2bVVDV3pNV1I5ZU9JcXd2dXJRR3JRVHB5TTI2MFhZVVVI?=
 =?utf-8?B?SXZpNEZVeExpaDVTTkEvU2xYWUJDajF4MjUzS3dtN3ZtV2V4TlM4MzNRc21W?=
 =?utf-8?B?UFpaam4zeGlzQ2p5N0ttd3hrcHlVd3VRSzJ2b1ZzMEg3MVRlL2ZCblFIV3M0?=
 =?utf-8?B?TE1YVG9UdVNnMW51QUVsNGJQNmlEdnFOdnQvT2VkbnRtRkdMRUNiMUF0NitK?=
 =?utf-8?B?L1NiSUIrUWtqUWVvV0ZUZDdwT3hpck5kVFpXSFp1dnN4eVpwVmpYTHF4SGY1?=
 =?utf-8?B?aHJrdkZqdFJYMEtwTFBxR1RtY0hpREdkejBDMnZIR1U3R2hvWndKZ1FMbW9S?=
 =?utf-8?B?KzVEM0N4czhMMmdoWlJNSjdENUFnMkdCMHpZUjNLSS9ybmw4bzBMS3ZxVEtO?=
 =?utf-8?B?WTdwYUxYUWZMLy9iTFZmanpBVDBnOUNsNFA0UXVyY2M2amJxa25tcVNlQit5?=
 =?utf-8?B?Vlh0QUlMaXVuY3BYOVJrajNkWDFyZ2F3eUN3MnYzMlVwT3VobFhoWVVQTktI?=
 =?utf-8?B?MjBNa2VuMmtpS3pvVkhwZkNXS1k3MlJJbUJNQ1BpV1l4eC9FMWZDN0podngy?=
 =?utf-8?B?VkZ1Q24xNVNaMnljNXRrblRjU3lMcTgwQmVVL0ZFWHFFTXdZRmIxdHp6UGxm?=
 =?utf-8?B?a3JnTi96dHNaZW9POG1mOXRTU3YrMjByRnBtazMyNXkrSzdhL09uSGVpTWRL?=
 =?utf-8?B?ZFlFa0NWVnpBTXd4WTFTRituV08vOWV6aFlHWmZEK0dINm01MmE1SDZ2NGh0?=
 =?utf-8?Q?GClMogTAX/TIxBKw=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdec245f-2b13-4961-ff8a-08df38efa632
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 14:43:24.8290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OD+tzmMjSFzwI0iP4A2uBXV2MbdIqiC8eK50o2nUHb9XEim2oxGyL30gHxDfXnka2QA3Lv6grfJFLr0Y47RNmwhoqTsZdrZpCeDk+/28/7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR03MB228406
X-purgate-ID: tlsNG-42698a/1793630606-AA8D99EA-92E1F6C0/0/0
X-purgate-type: clean
X-purgate-size: 2145
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/2/26 12:52, Jan Beulich wrote:
> On 02.11.2026 11:20, Dmytro Prokopchuk wrote:
>> On 10/26/26 13:13, Jan Beulich wrote:
>>> On 19.10.2026 18:54, Dmytro Prokopchuk1 wrote:
>>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> @@ -335,6 +335,11 @@ still non-negative."
>>>>    -config=MC3A2.R10.1,etypes+={safe, "stmt(operator(logical)||node(conditional_operator||binary_conditional_operator))", "dst_type(ebool||boolean)"}
>>>>    -doc_end
>>>>    
>>>> +-doc_begin="The result of relational, equality and logical negation operators has type int and value 0 or 1 (C99 6.5.8p6, 6.5.9p3, 6.5.3.3p5),
>>>> +so using it as an operand of an arithmetic operator is well defined and well known to all Xen developers."
>>>> +-config=MC3A2.R10.1,etypes+={safe, "stmt(operator(add||sub||mul||add_assign||sub_assign))", "src_type(ebool||boolean)"}
>>>> +-doc_end
>>>
>>> Why the restriction to add/sub/mul? The text ...
>>
>> Because this is the pattern found in the Eclair's report, and it can be
>> deviated safely (as opposed to unary minus, division and remainder which
>> are not included intentionally).
> 
> Division and remainder aren't very useful with boolean operands, so can
> surely be left out. However, more generally: How does "Eclair's report"
> matter here? In deviation wording we want to go from what the Misra spec
> says. The spec covers all operators. Hence any special casing we do
> wants to be justified. And, right now at least, I see no justification
> for restricting the deviation to just add/sub/mul.

Agreed, the report shouldn't be the argument.
The deviation should cover only the established idioms with a clear 
meaning, and leave the rule's protection in place elsewhere. With a 
Boolean operand these idioms are:
- + and - (and += / -=): "count it if the condition holds",
- * (and *=): "this value if the condition holds, else 0".

Other operators have no such idiom (at least, I'm not aware of them).

I can put this reasoning into the deviation text in v2. Would that be
acceptable?
> 
> Jan


