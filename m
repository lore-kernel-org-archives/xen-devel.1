Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B54E606A330
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 20:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=jIr7OSrT
Received: from list by lists.xenproject.org with outflank-mailman.1495149.1694261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTmH8-0002iI-QL; Wed, 18 Nov 2026 20:29:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1495149.1694261; Wed, 18 Nov 2026 20:29:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTmH8-0002iB-N7; Wed, 18 Nov 2026 20:29:02 +0000
Received: by outflank-mailman (input) for mailman id 1495149;
 Wed, 18 Nov 2026 20:29:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xTmH7-0002hp-HT
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 20:29:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTmH6-00H0we-2u
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 21:29:00 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6afe0a67-bab6-0a2a0a5309dd-0a2a450c96e8-48
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 21:29:00 +0100
Received: from [52.101.66.134]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6afe0a8b-f479-0a2a450c0019-34654286a5a7-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 21:29:00 +0100
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by DB5PR03MB11266.eurprd03.prod.outlook.com (2603:10a6:10:64b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 20:28:57 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0592.009; Wed, 18 Nov 2026
 20:28:57 +0000
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
 b=bzWYHHENP/uCoqy0ovLLw/VgTMt/fcVR2p1iVJ87AeisY8TNstIw8VPYdJwsr4bdAd83DaWV/vzk+QUvr+b3JSRRwvG9ET57WLpIacvuF8tPBWeEF5i8S+hkN2ddUyk+WiN9TgOEmxArXtkqUg+Gco3g77qKjQEje8SjP0AuaZAjl4rez39xLH5VMwg7nsishRis8xpgfX41nt/3pb0rPRisf318SwNF7F3dMYTnq68DIeHq+/YSKV+VyFsFlxj0na9bqnynGGEIXJQqqJaH1znNADgZdarp/8JKKmsV3Cqs4xM4L1ITmuNEFrl8P6i1wi4QZYd/fKsgXoRJCxw0Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thrLq5TvVXcTE2FigxgmS1wlwXZMtlV0Riq6akklBtQ=;
 b=MuzQ8DldPmpkjSxeBTt+oP0iaxabmupo5jXHYc2Bv51BzocRb7jr9wbFmRcYTCyntrT3PG26v46QxFRrv3ZSWw0PPqAfVM7qcU9AF0yDhelXZjuLcszEti8NOu1fy8ZKqj4WA8/vNq33wZcHYfjLtwmAEzxjY2n7e3FEr+fiOiFG9J7aWUs+QDaT88gGQiD/b29VYrJAvtsAtTpmXwXPbqy42QgswYuUksGrymEapgfA+T2taG2K1J5PD2/5zXl11vXz76+2Mxqb9sfoF+c+/57yL8K7ckk34qh1SN+bQW7CpPTIAR3R78/l/Mnr9NhOlnTw6R0VATTDMCl14EBKAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=thrLq5TvVXcTE2FigxgmS1wlwXZMtlV0Riq6akklBtQ=;
 b=jIr7OSrTFjm/4wSbyUcYns54premyr55ZxS2kxrWRPeYT0XUAh5z0E6p0mZp/juwnCA8lbGX0zwejQS7SJl2f6lCHrmCmh0y32P0iJbwOh4fmJZibssHvNPB4PqzrErsuplaEhX3nbUBrZN2Y4ZPfmZLmqRLk2zbGjSqq0+IfWNN2SW2xeVTqYL4vr9s/Aaijflh4lSFqOZgodBHYuNO66NOSvfpPzBdAs8Yi1mRqjeFEahrNYliBaVVKMkv2D+Q5sBmWK09Websd9q4s+UWs7HJQE9IcRQHkeYFg6vJ4wwsVWDw0Lo9FMW6xF6NqcCxbfAdSo6Xq20Ww2cP/mZxtQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <2ec208a3-8cb3-4769-a268-46351e22cb11@epam.com>
Date: Wed, 18 Nov 2026 22:28:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: deviate MISRA R11.8 for capability enable
 callbacks
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <74ce8a8150674591c2b0daa672f8e2e00b2a1201.1794950154.git.dmytro_prokopchuk1@epam.com>
 <3d675e31-a31d-4c93-952f-72280dd2f7db@suse.com>
Content-Language: en-US
From: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
In-Reply-To: <3d675e31-a31d-4c93-952f-72280dd2f7db@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P190CA0033.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::13) To AM9PR03MB7526.eurprd03.prod.outlook.com
 (2603:10a6:20b:3de::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR03MB7526:EE_|DB5PR03MB11266:EE_
X-MS-Office365-Filtering-Correlation-Id: c86c6a92-38df-43ca-02d1-08df45b29242
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|6133799003|18002099003|22082099003|56012099006|11063799006|261026140227099003|10067099003|4143699003|261026121527099003|261102123227099003|261028144727099003|261022105027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	w96UwjAb2mucOAQroxLwjVluyOf2EvaopuTi1wTZS5jJ6oRIt5fDVUt8qQpXW4Tq0kKPHdN3BNRqTZsJIQX3VQcsQFFMfXplV0Emr7HMJBMR9Hc1QLcraEWjO5fZ+hqPt+ezijiGFQ0FrS7qwHKJ87hs1CN3EXVVqYtWLMZx+eVe3FTDUuORAWolE+fiU02H4rMC4XUC7yr+Q9pZMB+JptOExeUZsYehAnQ6mE3BVDMJMm86aRiLn96ZQUnBC3pQIX6gGXzA7n7zjFyk78jRL4wvIxR4m5rt1+SsTsdjewk7ViZLtIF9sX68yhcrxrUXlGJAfoOoGju0kedynlidifscl5S4mXCz0h2kkWXFrJ0MEPouA7Ks2eXzCka0PAQqybyDtYWjsLNlZoiQojXQlyMW/RxkdHGhurJF8XwJ5iAunTJl6OUkz1tlmeo2yVdQKky0O+jzrLB8ZCv6H4GMP0ujTgJ69e83Yze8p73YmQ0E3GiPl5iDrYzwpT59n6mxNU4dOqE8tjV63Ir3ue0L1y2UWWaDQFexd2zjPXiRFs23CHJE13ka45KGUuJZ/uoF1MzwpfzzxNTHQhzhxo7mWTlHZFjbP63fab5cBDJ0D8RdY3sb8b1ACPsH9jQrCIdRezJDGaI21PGmzyJXlTTDLoMwTCm9eidtvmfZQhCCD2s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(261026140227099003)(10067099003)(4143699003)(261026121527099003)(261102123227099003)(261028144727099003)(261022105027099003)(261021121427099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlpURUt3dXZRZUVybzJNYk9RazBaY3ZERmMrRDh5RFBKNHV4R2ZybjRqZEtE?=
 =?utf-8?B?aFJSUlE2Tkt1U3ZrQ1FJbU1QZFFXd1JER1NNb1hod1VvelRmVXNuYWxvRkpE?=
 =?utf-8?B?MkV1dVo2MnlnTnZ6TlJxZ3U0UlF6YlZDaXVMMExCdWRncktuTTlHcEJiRUVx?=
 =?utf-8?B?NzBkMVRGM1BqeVRHTGlMbStyUENBY0Y4UDhGN2djZFFlRGVWRVFTd2lhK1N2?=
 =?utf-8?B?SU04SWRmNVZFTGVZQWgrbGp2QW43SnJmT1NzUnozZ2J5bHdsMlhCSU1GT1dt?=
 =?utf-8?B?RllVYjU1THNYMnYvVGx5cUIwNnl2aHUzUnM5YXk1dWZ4dTZyTG1uRndmZWNn?=
 =?utf-8?B?RGdNNTNFLzZwNS8rVDhRRFdXRlgxcjNLZCtySTY3NHIwQ1BMVjl6Y1k5NEov?=
 =?utf-8?B?ZWlYZjhEZDJ5TnlmSzh6M21YYzZEdlZ0NVlCdTNuTitqdVNCTXBTaW1tb1dM?=
 =?utf-8?B?Qk41YWMvOEpsc2V5WmdBQ3JXVXdJUmxYNEN2cEFvOVlpazcrU2gvWk5zSUdr?=
 =?utf-8?B?bTFQTE1pVzBSWE8xUWRPSUk0bVd0eHd3ZXN5c1NYZW9adSszTVcvVzFwNVQz?=
 =?utf-8?B?RmxvM05Lbm1FWTREeUJERGQybWJ0TTNpSXFZdEZaNGJNS3ptenl3L0FBa0Fu?=
 =?utf-8?B?Ym9rZTMyb3ZYUzRkTHZEemFFV09ST09JRmtienNoNTV6MG5xQnZkWHdjRG9n?=
 =?utf-8?B?SnFYVC9BN3pNUysvN2J2RFZyR0VCTU5UOGpGWmNWcitZVnJEMkY0Y3pBdXlx?=
 =?utf-8?B?ZnQ4QnYzb2tHZ1ZyQ09pNGlXYUo3cndBdkN3c2FyVWova2JSUmNPV0R1LzFt?=
 =?utf-8?B?NFY0aGkydzhmUmhmUVdFWDZzSnRtUWRhbWtPR1ZURDNkUHFqVjVBc2lGYU5X?=
 =?utf-8?B?RjVxMzVnTWsyR1NTOWxIdTBDVXBtd0xBMkJCaGhIcWZMamR2emMvRVI1UGcw?=
 =?utf-8?B?aDVZRmU0OU9tSW9jdWlFZUFrdHlvcEdrRDlMZWk3Q2xJUnl2alZWd1RIdEhZ?=
 =?utf-8?B?YkZPWS85V09TdGUwaEFQN1pkQytTd09GS3JmTWZVUFo0MGxMN2ZzRVlwbEox?=
 =?utf-8?B?SFc1N2kxY1VrQWNtRW1VdFZPY0d3M2NtWjN1TG9DQ0JLL3hKWXdRdWtydFZJ?=
 =?utf-8?B?RlZ1WG1kOVYwdVdGS20wQXpUeURnanhvcStzckp6QlN4YWg4VStQaDVVemtQ?=
 =?utf-8?B?MEt5RG9YYU13K3p3NEdUQ2QvYTBZQWRYTUFRRisza3lhOFdGZ3kzRUFRTDQ1?=
 =?utf-8?B?aUVtL0J1LytKS2M2cVF1REI4dkZjeVJSL2hFc3NJMjNrSTBQdnAzQ0Z5Z2tQ?=
 =?utf-8?B?bG5CV3ppejlkUEw3UGdoWVVpVmw5VHlKMmp1cTJtenVjampBS3E2bUJNM09q?=
 =?utf-8?B?NEZaMGo3ODEwa0hic3JjWGhQdlpJRVlaVkJmU05BNVQzNy9mYnMxU2owK01O?=
 =?utf-8?B?dW4zQlRsT1Q4Y2M2UHJNWmszcjFzbU8vb1dENU1rYXNVdnp2ak43ekFrYXpr?=
 =?utf-8?B?Qlg2R0NlV2lOOTNadW5DMzNmKzNDTGIwa1RmMnhYTW9HRGJLTHpQd09id0NO?=
 =?utf-8?B?bmNtOU5kb2hSb3Z0K1FybEZGMFlWVllYYnQ3RXpRZkRKb2tmb3BsWFczd2sv?=
 =?utf-8?B?cEJJTVFHUklOd2I1R3hMSmVtK0lGZGFGSDl5SEhtN1ZYSjRoL3lxaXpNYS9r?=
 =?utf-8?B?UHpRZXNETXVmZ1pKdUZwZVpROTA1Y0JTTXdxbVJCamhHdWNnc2NEUnpFTDJV?=
 =?utf-8?B?SWxoOUxYVC9ScEZ1b1k4akRoUnI4YUxnb0xsa1V0T1FzbkQrSWl4VmJCbS84?=
 =?utf-8?B?QldIQnQrS1lmWTNJc2wyanpIUkxlSWMxTFNHODBGUWg4ZVRyQit3YjZqdFln?=
 =?utf-8?B?aSs4cHI1RU93dGFiWFQ3SzhsRlV0RmRQNEFyWFYzS2ozOTErMHZsaC9qS05C?=
 =?utf-8?B?cUM5RTkrWVo5T2RVVzJoKzdadHBlY1FUdlFFYnNJalJaeXpEUURQWWlHTkdy?=
 =?utf-8?B?TGlybTV5dXVvbHVKV1haZW1peGJNa09YZklDZzNiYzM5QzlGcWlzMm1ENlNh?=
 =?utf-8?B?N2ZmNkpJU0taL25RUFJYcTErVkxxSUNIeWNhWU44Skg5SnhkdGE3dzZRR3Zx?=
 =?utf-8?B?MTFsTWhaVTd6U0NxWjUxSElCL2l1SG1OMGRCdXA3TWhDTWd1RUZZb29KYko4?=
 =?utf-8?B?RUdsN0ZselVSOTZmbFZxamFNMmVCTnUyOG16eDhRcEYrcEJ2V3h5YlBaYUsv?=
 =?utf-8?B?eDRZVVVBUDNuTFRLYVhoSXJJQUQ2TzBOYmRINGtGeGZ2YUhiQkdsUjNkU1dU?=
 =?utf-8?B?VHhvcy8yeHBOT2gvVHhsT3g3QWZrcjV4MnRQT1RtTlNIbWVRRUdEaExOdnNO?=
 =?utf-8?Q?ct078FyBpIwFjwrI=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c86c6a92-38df-43ca-02d1-08df45b29242
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 20:28:57.3033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oQwpBgK7/GIs4Ix8GZn7Yo34765QyklQ9HaV54llZn0Ld1BDR+JG2NwqbWJtEBT72Le8kkSIzREouBLf8mNhcgzQ+qnShA4m45t3QujO7Wc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR03MB11266
X-purgate-ID: tlsNG-d25034/1795033740-032D8A5B-06DA997F/0/0
X-purgate-type: clean
X-purgate-size: 1344
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/18/26 09:41, Jan Beulich wrote:
> On 17.11.2026 22:31, Dmytro Prokopchuk1 wrote:
>> --- a/docs/misra/safe.json
>> +++ b/docs/misra/safe.json
>> @@ -124,6 +124,14 @@
>>           },
>>           {
>>               "id": "SAF-15-safe",
>> +            "analyser": {
>> +                "eclair": "MC3A2.R11.8"
>> +            },
>> +            "name": "Rule 11.8: cast const capabilities to void * for enable callback",
>> +            "text": "The Arm CPU capability enable callback takes void * to match the generic callback convention. The cast removes const only to pass a const struct arm_cpu_capabilities * into that signature. Existing enable implementations treat the pointer as const and do not modify the object."
>> +        },
> 
> Do we really want to restrict this to Arm CPU cap handling? The same pattern
> could easily arise elsewhere.

Hmm, good point.

Well, the deviation could be generalized to this:

name: Rule 11.8: cast const pointer to void * for a callback

text: Generic callbacks take void * by convention. Casting a 
const-qualified pointer to void * only to pass it into such a signature 
is safe when the callback implementation treat the pointer as const and 
do not modify the object.

If such wording is OK for maintainers, I can prepare v2.

> 
> Jan

BR, Dmytro.

