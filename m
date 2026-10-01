Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493E8CA5FCB
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2026 12:40:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438304.1657178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCG5I-0003kN-PF; Thu, 01 Oct 2026 12:40:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438304.1657178; Thu, 01 Oct 2026 12:40:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCG5I-0003kG-MW; Thu, 01 Oct 2026 12:40:24 +0000
Received: by outflank-mailman (input) for mailman id 1438304;
 Thu, 01 Oct 2026 12:40:23 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xCG5H-0003kA-9U
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 12:40:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCG5G-001ulF-7s
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 14:40:22 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6abe54b3-bab6-0a2a0a5309dd-0a2a450587c8-16
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 14:40:22 +0200
Received: from [52.101.193.28]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6abe54b4-4cb1-0a2a45050019-3465c11c4959-3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 14:40:21 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB5843.namprd03.prod.outlook.com (2603:10b6:303:6c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 12:40:18 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0451.026; Thu, 1 Oct 2026
 12:40:18 +0000
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
 b=vs1PxZq7JZ8/813m9RWEjXX7iGjAHWkLX7wL7GUC11Po7GyIvMRn8+zdMtct+48THgn+XbkhtHOHvm27WDvElm8se5cwMpUdg3koT8OfqFgyhj69V4crWIFx/44FikDFUQ7OQpFVmZN1JPcRxauLxqFvdZxFAus0YOk5PyD4xaWn2f78z3pDh4RbfHJ5Kj0RSDlE4k3akSv/Y0UpRyzWBoJMY2+ugqOjJK2VJQb5o3TxtIFvCaZEr6UQa7xJV3/4mYR1BR5yIPlqeJ48tXT1g93Qw57wSiFR6vG/BzcuQ8EECPC3BHq0RVmZafBiv7dDg50hKLtrbkDoQKv8cOwg5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y4cere2LRtLINpQR31Xmx3gH2C2G6SLtbMgX1aAABLM=;
 b=Kq/2UmYH6UCLx7juY5VJNBxuMxn5qoaS1Zqzs6DN/7vATyRrhDQSvElImm0y1d1dCa3SSos23AHtZPO85DsVeMFn9AmxbHz1TuRBZlzD0bIm5uMHQ4+dMAVgBq7zp8ibAWwifvvJuCgRWmRq+ZYgNnwzsWc6kTwCeihJSjsDZ+zVBk8FAVQH4zf27hgpVpkwDqdtxjORYowmnBHCQi1ntxC9Nf14PB334VvAH+YKz1S1f+3gkkoLhTPVXIIuOl/3hrseTonc56waFB2CBORF009EXxfJkmcnXkeoqwH/7N6JMT8wxCowckPE7f2qr0JyeRU0yI/gTa93aO3Xgb720Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y4cere2LRtLINpQR31Xmx3gH2C2G6SLtbMgX1aAABLM=;
 b=MzN0pLcZyv1yDjp3bI6fRBvP4vseWoPfYdMKeIRF8K5VeUV8j2Z57NSZCtJpowrm40eDKlxXdmSQOMMiSiZWH09DQtMqg0HjJVfLthuDuRzAbaTIjDlxRXRGdQoKUirHABOG7QTnxgRqDZxSqtLwD5DtGIK7JnpjRTHubFK0Csw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f68982e1-f46c-4640-88b7-36ef362bf340@citrix.com>
Date: Thu, 1 Oct 2026 13:39:55 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH] misra: deviate C library-style functions from Misra
 C:2012 rule 11.8
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Jan Beulich <jbeulich@suse.com>
References: <4abcb11ef287170ced74935cbee60c90058c1307.1790671787.git.dmytro_prokopchuk1@epam.com>
 <0a286fe9-2133-4f28-8fab-59f4e51d1484@suse.com>
 <446354d93ae04a07b86d7293705d7e46@bugseng.com>
 <0373fcc0-5bc9-4140-a2c9-52a31c7e42b5@suse.com>
 <2a8557d7ba88e95ec75148ff180ae0a0@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2a8557d7ba88e95ec75148ff180ae0a0@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0348.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB5843:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cfd2e86-a659-4289-a58f-08df1fb9263d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|18002099003|22082099003|4143699003|6133799003|3023799007|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Yn2tUuNQMNDsb6nShzVFyuRBZHjVzMZ6AKaxiYOt+nip+JFx0JDs4clYbvRhRLm4UqXZgswK+ejU4vw6G/G+mCSda9EN+YU951kXIOF3KH5RzLetI24qVeZuOY7i1TI3tiMyHY6rjPcj9j0lMtYlNjo/OXXKoTW+zYKcNDh+Zj9EUpe9UTySa+XQx4M9a4bFXdhHbPGnIy3aGoOotwOW3zrtgvT8ATzkqlDdvXEYuLpP9o7lo+0ETV+B4qRiz73YDkuQ02YNOQ5O5SLzi2p1UJ0PB3u6Bo9f3uRQNA3pYwlwY9diDUE6qZe2i1NBAnCjUdj4BGGxFmIzN+i4whQmu4gtA4cKoGgJZdohm3un+TwJFgHE1QPn5lbKi0ULPaEfW4UbKmriccfp86XpdxWVmyeW4CtABlq/QGkk8XC4bFlSR3TD9iWeBasTkTtJm6bTJuX7i7tasK5uyx9TO7a7FcV+yEeb1oStrrBuDoPpQ9xmsPmRupMVs26FpOyQ/+KFjVGxkoi1JAORpBHzI8NIgLp3RYWuopw2PNvOcvoI/a2oMUtJxC2Hf2SnRrLj6VuZ6e+Ra9mj+WoO50UIpLyMT4uRxc5Y8MU1V9r+XPOytAAchOn9PCmJpp6mZltMy3F5LsqafSkY9Cxh/8ujWwcLz/pB7u5uSN4K9ThIYjCMg3Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(18002099003)(22082099003)(4143699003)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEpCR09KYTV4WHY5UDBhYWYvKzJLUzUzOHVZUU9DU2hRT0xyNi8wTUZ5SG5Z?=
 =?utf-8?B?Mm5wVHJTU2dsS1EvM3E2eUljUkxnWnB6cG14VGw0cnlXbi9CQjdBcFZLM014?=
 =?utf-8?B?eVg0T3pVRDlDa0tZb0JTTHBuVTk3a2ppbkJHcmFrcDQ0RzZvam9jTjI3Mkh5?=
 =?utf-8?B?UVIvYVRlclBSR0xnQlFSUVpkVGQ1SS9xeUVpR1hkcFg0WEtXcHJIR0RjWkQ1?=
 =?utf-8?B?WS8ySnlqb3RveFFFS1VMejc1V2lWWnNBdVVjZ1M3dGdZWmlpeXU0dW9kT2cr?=
 =?utf-8?B?WkFocXBvYlVpeUh3S1pESm1tWnNncUdaclp6N0VmNVlKVXNJREkzSzU1WjRV?=
 =?utf-8?B?Z0FobUgzb3RXd2JMbWJTdU9PRWppSDBwbzgxUVlyOWlaL1FLVWN2UWozZlVR?=
 =?utf-8?B?YmlORWFlMThiZUk3blpLTk9ndHRiSmdIMGhsbDNNZjNOK1YzWXJ0bHN2SHNC?=
 =?utf-8?B?N1NGeTZhY0JVWGxhaUJaQlZHOC9SUnJNTGtiUWg3M2NBdjRFOXcxQ3RjVjds?=
 =?utf-8?B?c2dCSUZIdW12STFJb1N0RkVHY0NmUHdIRW5FRGtwVDJzalVnSzhDTk0vcnhn?=
 =?utf-8?B?bEpQbmVMSk91U2ZhNlpWRTNBaklQUTR2TGNYV2Q3c1dFeElnRjQxQXRXU1gy?=
 =?utf-8?B?S1czdGRFRjVLd0ZjQWg5aDdjVFVvQThvbEFoOXNIdkxxQ3E3OUhkQlI5azVD?=
 =?utf-8?B?RTVPa25IUFJCNUE3bkRyN21pa25WZ1ExUWFLZCtnTlZvN3ZhanppK1p6RDB6?=
 =?utf-8?B?SEdXOVNXSFpEMGk3cDdCbERYOUxrbXFvWmpBWG1vNjkzazF5WUtnVWZyeCtP?=
 =?utf-8?B?TTd3ZlF6MG5hejYvWXh6TVNsTVhlY1FENGF0YXErNHMyTHhLeXJ3ZHBua0lY?=
 =?utf-8?B?cWZ5K3JtRkRtNnhSYVg0dlN3ZGNlU3VSaE5wMkxIYkloczRncUpLaEgzdkxk?=
 =?utf-8?B?Q0JSNHpXWVZLb0QrL3U4VTBlR2N4bENOdElvSDJBcVoydlJpWkd3dDN2QkQz?=
 =?utf-8?B?VHZvYWo1TjNuR056ZUNlWldST2p0cjAzb0cvaFd5L2tqeG5CUjJGeUtkeWJB?=
 =?utf-8?B?M3o0bkZoUHVOcVRkSzl2Ykt4OWhNRnFkM2U5L1owOHluT0VkN2o4WTFVSGhT?=
 =?utf-8?B?OVJUQ05MSG8yMVR5VWRUN3pDMWZrd3N3Zmt5cTRHVG9uTlNBQTROSGt1RHFw?=
 =?utf-8?B?WjNQV2FUOEUxL3kvaGxGM3RzaG9QdnBSNkExeGxacmFOelpNYmIrY2dvSjla?=
 =?utf-8?B?OGk5THpacVBRdUl5L2pwejJBTmV1K3VnZExkQ0UzQ0dXMnV4M2lHaTUxbG5y?=
 =?utf-8?B?OFpYNTlxOGNHSklVTHF4Y29sVTRXcklWSXRQVWVLSzVoZEc5c0JFUGszcG5B?=
 =?utf-8?B?QjN1S0hpUXo2K3MvbzdDUXJzZW9UdjgvZnJ0SkNRUzZqRmtnMEgrMkNQb3Fs?=
 =?utf-8?B?WGpXd3hia3BEandWSFZ1eG1DSVJFQTdPZ3JtZDI3MWlpUEx5L2ZqSW4rLzVP?=
 =?utf-8?B?TnZlck4rbnNxN0gzdE5mSUVKUWtTbWVaOVpLR094Q3hDb05TWjNIMEkwajRy?=
 =?utf-8?B?UitBcVNHRWh3TFVKRno2TEVPK2txd2lHZUorai9RTk9pclc3c1FBOW94RE5Z?=
 =?utf-8?B?TVlsK3d3VVVTeFZ0ckdQUjAwYzRFcmsraEtaNHRJSytDejUrMVYrZ21EN2h6?=
 =?utf-8?B?TVEyY0RXczVObFMrRWRLYmVCalM1OThKck0zVTc3cndZN3Z4YWwwK3B1MlRM?=
 =?utf-8?B?cm5KRGwwZkQrWS9vbmhMeTZVWFJRZ2xzWEJiclNVdyswL0g4RjZBdXQyQWV1?=
 =?utf-8?B?REZlYUtsdlFUamJkL2E4WFZ0Uzk4ZFhFUk1CWXhRMW05MWlqZC9RTEsyeFVY?=
 =?utf-8?B?dDUvWTRtS1hqK2g1Q3VNWE5ibStoNGpxMFkrZFFqTnhYakJHR2dMOXJncnZy?=
 =?utf-8?B?eHYwNWdUc0x0ZWY2TjRBTzc2V1Ywd05aYlltVVE4UkFwcU5yWkJPU2dvVjk0?=
 =?utf-8?B?eUpFL3h3WmJOQXRFaDRsSkpWT05WV3pNV2FkWE54VTEwZWhtQUR1Q09OTU5L?=
 =?utf-8?B?eDVlR0NvSWZabC9HMWd3UlZUbi80VlFYMGU4VlZURkkwM1dyK0FoU214UmZs?=
 =?utf-8?B?aWxycHVuYXJDMjNLQlJzNXdrZ1cwU3BkN2ptSW9XaWRhVTBEd1ZDM2pCb0hD?=
 =?utf-8?B?UG1Fa3RYT2djWURINXUxOXgxSk9Tdkh6aEhXNTA2NVlUMFlObTFWTEpXSXpU?=
 =?utf-8?B?dUZtZVQ4K2tYMThwVDRHZ1Y1S2huUVBKTkRxQnRzNlp2dEplVTZTNXRTWjhM?=
 =?utf-8?B?OVdBdHZpTjk3N0FqT1hoY3ZmODFaaWdMSEVLcHJoRURQY2l2ZHU0UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cfd2e86-a659-4289-a58f-08df1fb9263d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 12:40:18.1657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QwY++0w5wPwqARvTbN8LxTZKiOA4CTAP2RvKphzFlNeHM85JX4f00JMc1bzp628vTi5YO2DcslE0KMDV8JI/PfLpFim8FsF6Y2CkUaAkwxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5843
X-purgate-ID: tlsNG-c201ff/1790858422-724B42A1-A60B3083/0/0
X-purgate-type: clean
X-purgate-size: 3790

On 29/09/2026 6:52 pm, Nicola Vetrini wrote:
> On 2026-09-29 17:11, Jan Beulich wrote:
>> On 29.09.2026 16:56, Nicola Vetrini wrote:
>>> On 2026-09-29 15:40, Jan Beulich wrote:
>>>> On 29.09.2026 11:03, Dmytro Prokopchuk1 wrote:
>>>>> bsearch(), memchr(), memchr_inv(), strchr(), strpbrk(), strrchr() and
>>>>> strstr() all accept a const pointer/object but return a non-const
>>>>> pointer
>>>>> to the matched element or byte, matching their standard C library
>>>>> interfaces. The const qualifier is deliberately stripped so that
>>>>> callers
>>>>> searching a non-const object get back a mutable pointer to it. Fixing
>>>>> this would require changing the public API, so document these uses as
>>>>> deviations instead.
>>>>>
>>>>> Update docs/misra/rules.rst to note that this class of double-use
>>>>> library functions is deviated on a per-function basis.
>>>>>
>>>>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>>>>
>>>> When I prepared my 11.8 series [1], I was wondering whether we need to
>>>> go
>>>> as far as deviating these. Since we now uniformly take gcc5 as minimum
>>>> baseline, there is (at least in theory) the option of using
>>>> _Generic to
>>>> cover the dual-use. One question there is whether Eclair would
>>>> recognize
>>>> such - Nicola? After all, looking at e.g. glibc's implementation, the
>>>> functions themselves remain "unsafe" there; it's a macro wrapping them
>>>> which puts the lost qualifier back.
>>>
>>> Could you provide a concrete example?
>>
>> From glibc 2.43:
>>
>> # define __glibc_const_generic(PTR, CTYPE, CALL)    \
>>   _Generic (0 ? (PTR) : (void *) 1,            \
>>         const void *: (CTYPE) (CALL),        \
>>         default: CALL)
>>
>> while the declarations still are e.g.
>>
>> extern void *memchr (const void *__s, int __c, size_t __n)
>>       __THROW __attribute_pure__ __nonnull ((1));
>>
>> (and hence the implementation still - necessarily - casts away
>> const-ness).
>>
>
> Ok, will look into that

We are going to have to deviate the implementation, even if we are using
_Generic() to force const-correct behaviour from the callers.

We could duplicate the functions, but there's a different rule about
that.  We can't use ELF aliasing tricks because that breaks software
type-hashing techniques for control-flow integrity.

>
>>> In passing, for stronger
>>> guarantees w.r.t. _Generic it would be better to switch to MISRA C:2012
>>> Amendment 3, which has specific support for that feature. Keeping AMD2
>>> and using _Generic weakens a bit the safety argument (though one can do
>>> an analysis himself, of course).
>>
>> As this keeps coming up, we surely want to discuss / progress this move.
>>
>> Jan
>
> That makes a lot of sense. We could add to the next community call or
> maintainers/committers call to present the problem and propose a way
> forward so that all stakeholders are aware. From my side, I can
> explain what moving from one to the other can entail in terms of
> static analysis, while others (e.g. Andrew Cooper) may expand a bit on
> specific C11/C18 features is desirable aside from safety.
>

What I've got for now is all in
https://gitlab.com/xen-project/xen/-/work_items/201

We want _Generic() for const-correctness reasons only.  (And possibly
API transition work - this has mixed results but can substantially
reduce churn in a series if done well).

This depends on moving to C11, which we need to at some point anyway
even if weren't for _Generic().


The other area was the use of auto, but that's sorted now and will
continue to be an implementation extension until we get to the point of
considering C23.

~Andrew

