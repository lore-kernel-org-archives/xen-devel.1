Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01D3606A329
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 09:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=F+eBAYC0
Received: from list by lists.xenproject.org with outflank-mailman.1490313.1691259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xStKW-0004nU-CI; Mon, 16 Nov 2026 09:48:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490313.1691259; Mon, 16 Nov 2026 09:48:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xStKW-0004nN-9W; Mon, 16 Nov 2026 09:48:52 +0000
Received: by outflank-mailman (input) for mailman id 1490313;
 Mon, 16 Nov 2026 09:48:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xStKU-0004nH-S9
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 09:48:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xStKU-007FMt-08
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 10:48:50 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6afad181-bab6-0a2a0a5309dd-0a2a4508b32c-0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 10:48:49 +0100
Received: from [52.101.72.135]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6afad181-f659-0a2a45080019-34654887e398-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 10:48:49 +0100
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by PA1PR03MB11287.eurprd03.prod.outlook.com (2603:10a6:102:562::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 09:48:48 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0592.009; Mon, 16 Nov 2026
 09:48:47 +0000
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
 b=pdHMpRBFL5YBPC9NodN1f5v2qZo1XZFb0hC44+W6LlHYNVF9CFYxke8cfg4fXxdShR35c1buwtAEFkDOP1FZtKDICreoaTLiTZUrdKm8i5PJ4hiPzdDcPbrb5N5J8P7EZkwyKRToJ46Q/i3Z9HZh9JGjRvkpbhaLk/PcqMrrb5Cjgh75SWGgKrrqgJ0fx6AbT1IScQVruFrYVkN+aRJcsL8sYprIvx5qwlH53t/Q+uLD2E5/r3D6tbXEJIGhfKF9X4JqmVPtuV4dfjAHSFeNbTpCrCqHvMpW7fjyxryV/h2VmiS4QKM/yAwypC0jHSj9nGMeMjwvefJPdcDby3YDlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZNZS6FWJGmZRxk0ZYj26mTT1o9Ic2fDvknSe3swgw6c=;
 b=HofIH6LsDmmeFK/pHmBmks4vkAeVKwJoMvG+IovvJCJ6WA6m88MY2vvJ9s6SqvdryGrMV551GM0yH/uTcQK/zbMaEE1rfEv9FWACQDnfweRl94C2y2xrpNN6h49+m/W4aZ4gtdmcgGk23w+gBJ4bimTHsmK3k1LWUN0d+VV0CP+OVgqUxj4nR2QOULSY0jq0q4zMWpwXMj6oNNmoPr+aFTG3oLgbdA/Qbu3RscCwNCthTULAah7Rx8utt29k2pMHEYCU4WSue3OBWn6qnSnWnQ87s4qvWW0otYGTdAa7S03ondLoALcmSjTQj5HxTvMazwb6S9NvmTfvE68blr9EFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZNZS6FWJGmZRxk0ZYj26mTT1o9Ic2fDvknSe3swgw6c=;
 b=F+eBAYC019XIpxOfVbzy1i1WgG4bLdDU870HmT9iewdyjrggONBERt/lv8CPYyOrePq0fZnZfoEaMTifoX5Q1Q9Q4Je0bvivLCwyFQqNnUaYSEogeh3qfjT/Vogc0UzLenVwzHhxsn9Q6WdPKYKqhEnzLsSquWDxIIQhIXlRg0xeYB3zP3MCT4SERwnjQfIbexBGFjizPJU3teDsCvbKCbAZiSgYqlOmDi8HPVWJY6nHRfxW0/iZJ0G/BnlEITVm5BkMzXYVCYNemscfxjrOP8nJ4qUMuVaA2p0aRC7NpQCmqQVsDVH4pvodnbXUCbZgCxnNxDs8xH4JL3t1ldkd6w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <303a9a75-e0a8-4f0d-aa44-2c26a796954d@epam.com>
Date: Mon, 16 Nov 2026 11:48:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misra: deviate MISRA C Rule 10.1 for boolean operands
 of arithmetic
To: Jan Beulich <jbeulich@suse.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <810b14fef78b77572a87a7268aa718274b975f80.1794298911.git.dmytro_prokopchuk1@epam.com>
 <21557e4f-305e-4a21-8c57-aadcb77fabd9@suse.com>
 <6afad02b-03d6-4813-ae03-65562578db90@epam.com>
 <349e1546-ba81-4082-894d-7c820d319d22@suse.com>
Content-Language: en-US
From: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
In-Reply-To: <349e1546-ba81-4082-894d-7c820d319d22@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0P190CA0024.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::34) To AM9PR03MB7526.eurprd03.prod.outlook.com
 (2603:10a6:20b:3de::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR03MB7526:EE_|PA1PR03MB11287:EE_
X-MS-Office365-Filtering-Correlation-Id: 866bfa3b-92f2-44a4-53a7-08df43c6cf83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|18002099003|22082099003|261009223027099003|261009221227099003|11063799006|4143699003|56012099006|261028144727099003|261026121527099003|261026140227099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	wNdUEyw6pckHqg6II2dEC5iOwzDtrym1VbdXHb1iidv+aAhyqXwRcBKGqb9BIgO6mVl0FyEbati8MdfR8Us51M8QesLLnta7jN7/r48Pd01Ke5JgCLjsyBniYR7WsqVupYFxsN+VCvMxO/F64Hs0oKDnGhJbypGsonR1+Qa8cFKiAa4uQ1W487VDD3eaXQ5WGhQAxsv+aCtrq54dnvggy4AsGk2KcZq7T8X5xdmzI+2RwVh05VJJKvTijuDT5E/RO6QajcHRxVkI0Q1/IfAQDnF2cz8ME7+YvOf4vKBCzsHeb0dThH7wb7D3be76Wfk3qMexRREdii1NvZ+2WEQClDK2m+E/p2EiJEabu8AwOcHGGeajS4S+p7V2Z4gKqsZxJwUFE1ffl/eN+CFOOVr7l4WkSTlKijOzPO6KmVUSPsJ36pZRAMcxWLioHzbUcNezcH/qxNDegCOdMnryu9FgCoseALfWOPUKJfo4M/N1py7SP9JpfXifds+VQJ/5UpW31v1eJCHT1wQYrEa0+KbbIJce5z3RKff/TAKoVSR6LnKahb7PSrEbG1A1eYfUwaqeCk2tqanySiHdGnWJMaLCgBNwY8R6lPJ+Rv2HNaxoQgiMHCkyHdHoI/O2PCN80XedfLzyQYKzXCN8MqlCGKaj4w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(18002099003)(22082099003)(261009223027099003)(261009221227099003)(11063799006)(4143699003)(56012099006)(261028144727099003)(261026121527099003)(261026140227099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUVtdVRKWTlVcGtMYmsrNWI4UllpRVZ4R0NvZEhtS2ZRejJyZVc4Q0dlOUE1?=
 =?utf-8?B?aXB6RFVCbmFhWkxHVHp2eVNlOVVFL1hEUy92eHZ6NmdjbHN2NlVoaGFGQkhI?=
 =?utf-8?B?TEtrQ0NKbGdrQ2pQSVVVVnYrazhIZCt4d2VUa2lJdm9jY0JsMlY5V0pRaUtm?=
 =?utf-8?B?UGEyOWpNZW92dy9IQmNmNnltcVFJNFVqdWR1M3FKcmRxMUpqU0FJbEhMS25J?=
 =?utf-8?B?SWVBbWVtdFZnVTZOcldESmhHYU5LVFVPTGpnZjZDc0FRUEhGV25zdEdTajFP?=
 =?utf-8?B?YVhyd1VhVGJJanN3TjlDTWpjWXAvbXI3M3BTNm9KeFVHaDFLODlMTHV1dU5k?=
 =?utf-8?B?V0dqT2todmh6K012WEhuUFZxT2toK08rRmF5Q3VrUnExbmFaVm85bjc0WHJM?=
 =?utf-8?B?K0lSemZ4MDRjSHR1TnhpU2VIMHVmQ1JrQ2hRcTMvdDBhVUgrQ1hOdkl1V2th?=
 =?utf-8?B?ZlJCbmE1cFJjSWE3bzVqSnBHM0RXdyszak1tOHljN0pwOExkYldhRjg4WTNO?=
 =?utf-8?B?ZlhSV28xVmFpNWU2VmhKbmxGeUt5VE5WbUpTbXFGa1pDUHVlNy9qbGl1R0N0?=
 =?utf-8?B?aWJ2TUU3TFp2dVpNekQ3ZzcxcVQzYjd4eEt4cTJ6RU0yNEVHcEFoMVBqcExn?=
 =?utf-8?B?MGN3aEZJZzdZdmdPKzJiSzh0YUs0UUg2TWlYM1pwZm5zSFJrdkdjenplaHU2?=
 =?utf-8?B?bk9MbDN3QVo3SWpQaWZEUlhIc1hLTmdEd3RvMkJ3UzE5Zzc1MUpvR051RjFV?=
 =?utf-8?B?NkVtSDlmeXRoUGFWT2FydCtuZS9uaWxrLzgzT0hTM3NFQnhOQ21XbkEwODhx?=
 =?utf-8?B?NkxFRG9MN3RkUFFvL281bWVEM2xpUVY2eDBuY0wwODgwcFltRzd3bzhmUXQz?=
 =?utf-8?B?NWlrb0duaTFvRm1XQjUxOGE4WWkxeDJ6T29NWjBpUlJadWF1MjBYMHpNWk9K?=
 =?utf-8?B?Mlk3RW5kYVoyZEwza0FwdmlmbFFOQ3puNmt0ell3ekFiK1V3cnA2YURkczB4?=
 =?utf-8?B?bjVtTHR5ZmVmTzY4bjdpQ3Q2Q29VbzN4Yy9HajhOZHdhUjI4c1NJS0xwaG54?=
 =?utf-8?B?d3VYdlJ4UTVpa1Nva1IyR3A2T2N6b1JCRmkxQ2Q4TW51c1Z1bFhDWjBLTGJT?=
 =?utf-8?B?K0l0ZHRkUms1cHFNTm9PMHVhU1NBUTA0RU9hakZEYllRay9yQlNtNlZQeUxY?=
 =?utf-8?B?YTN6WXFHN09DS25nZGZFSFRkRjE4RjdxRzFteFdDUlgvN2d6Z0xiSWpFemJD?=
 =?utf-8?B?QUdCejFxUVVzK3JtWVJKZGNkZjJocTFveEhaSUN1MnNmamRHcUxpcFc3bUIv?=
 =?utf-8?B?Q1RrVTNvYUxBSTlaNURDMUhXTXRCU2hPWS9LdVVzZ1V3emgzZnhzMjlsRVB4?=
 =?utf-8?B?czVDS2gweGdWSytnajJHTk9zektzTHlvTjJtTlVDQ3JoTWM1dGVLcmlJV1NU?=
 =?utf-8?B?Vm5IY2NTT1EybkVubmpRWEhldFdCSUpxc2t4SGN4ZWJSa0pQaGVJSTI4dnNK?=
 =?utf-8?B?TmpNVkgra2RXdG4xWGxmZXVtaDVDWnJVYndsK0RXZG1zR3ZWTnhCVkdhTUxD?=
 =?utf-8?B?N1FOenJqczhxWklTZkg1dUtVQ0ZOd3BucWdLT0xuRXBZVE5yeGxpR2V5QXl3?=
 =?utf-8?B?SURiVUNyM0pjLzd2WEczR3A1bVdWRlA4QVlUaHpCMHBNaHdsbUZzbnE1cjR1?=
 =?utf-8?B?VWw0OWk0N1VscUNFcmJyc1ZHMU9NVHlNbTg5ZHlmcWpqNEJiV25NbUpvWlJo?=
 =?utf-8?B?V3Jtb2VZbVEyUWRYR2s4ZHN0aUVhUGJRUERsZHJTL1grcjFaa1BRdmtGaE5H?=
 =?utf-8?B?UlY3VGcvM2FlQ050aS9ua0c0QndWYkxRQTdsRklhbnJDZ0NpeGdMZ0JtL0VL?=
 =?utf-8?B?RGZXK1JEOHpsRFdpZ0RTNjdIeEV3K3FwQWZtU21lVkpBWDM0aUI5cWVLKzFq?=
 =?utf-8?B?VW9abVlTbmhjNWIyRXBzRFR6c1dXNzkyRjY4TnhvTDZMeHZ4RE43MndreFls?=
 =?utf-8?B?Q3hLU0JpTWZGMFdYa1VUZ2pWMkZ2bVU5S0k4L2p1QUhIU2ZCVjBpYllxbG9G?=
 =?utf-8?B?WTVQWTJzVkxJYXdQZnJDY1V2U3VsWElSUXVTY3VsOFBpZWVRZnhzUGxmYUtl?=
 =?utf-8?B?M1YyMnBVeWFWRER0Nit3VjZESHcxMDE1dlRvVWpNcU1RdHRhVDhSNXN4ZHFU?=
 =?utf-8?B?VVZFVGxRTUVaMFZSNFpjS3BDR01VQXVQbDJ3Ty9YekVEdXkvZjBBcWNBYzVw?=
 =?utf-8?B?MFJrb3RkR1cvQlRvY3J6dS9ONkg5WUN4WHArTEFoa1NvTG9wSVlZUWdTdGVx?=
 =?utf-8?B?QjM5SE1RcllwWGxVSkdNNm1ldTZLbjdCQnRYaVNiN3JEVmpRNm1nNUhjb2py?=
 =?utf-8?Q?oE+ZdA3NhYinbwoY=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 866bfa3b-92f2-44a4-53a7-08df43c6cf83
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 09:48:47.5249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ojRsL4+yJqj7MjWbGcQQktPGvCTW2MZwStqbBJqoHjzW2QLS+5QKYs4g9rbj8YSmZiaMrZLDtjnVKKU53Z8JwVpnhxhYOYVE8m1MDqhxFjY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR03MB11287
X-purgate-ID: tlsNG-c1860d/1794822529-D5F4787B-A7CEDE23/0/0
X-purgate-type: clean
X-purgate-size: 1853
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/16/26 10:39, Jan Beulich wrote:
> On 16.11.2026 09:25, Dmytro Prokopchuk wrote:
>> On 11/10/26 11:58, Jan Beulich wrote:
>>> On 10.11.2026 10:25, Dmytro Prokopchuk1 wrote:
>>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> @@ -335,6 +335,10 @@ still non-negative."
>>>>    -config=MC3A2.R10.1,etypes+={safe, "stmt(operator(logical)||node(conditional_operator||binary_conditional_operator))", "dst_type(ebool||boolean)"}
>>>>    -doc_end
>>>>    
>>>> +-doc_begin="A 0-or-1 Boolean operand of binary +, -, *, <<, >>, <, >, <=, >= and of +=, -=, *=, <<=, >>= is safe. See docs/misra/deviations.rst for the full explanation."
>>>> +-config=MC3A2.R10.1,etypes+={safe, "stmt(operator(add||sub||add_assign||sub_assign||mul||mul_assign||shl||shr||shl_assign||shr_assign||lt||gt||le||ge))", "src_type(ebool||boolean)"}
>>>
>>> Imo this wants shortening by making use of regex-es (provided such can be
>>> used here).
>>
>> Unfortunately no. Unlike file() or macro(), which take ^REGEX$
>> matchers, operator() in ECLAIR only accepts operator identifiers or
>> predefined operator collections.
> 
> I see. Then, to help readability, would something like
> 
> -config=MC3A2.R10.1,etypes+={safe, "stmt(operator(add||add_assign))", "src_type(ebool||boolean)"}
> -config=MC3A2.R10.1,etypes+={safe, "stmt(operator(sub||sub_assign))", "src_type(ebool||boolean)"}
> -config=MC3A2.R10.1,etypes+={safe, "stmt(operator(mul||mul_assign))", "src_type(ebool||boolean)"}
> -config=MC3A2.R10.1,etypes+={safe, "stmt(operator(shl||shl_assign))", "src_type(ebool||boolean)"}
> -config=MC3A2.R10.1,etypes+={safe, "stmt(operator(shr||shr_assign))", "src_type(ebool||boolean)"}
> 
> work?

Yes, this is equivalent to the single long list. It will work.

> 
> Jan


