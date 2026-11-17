Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE4A606A337
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 19:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=epam.com header.i=@epam.com header.a=rsa-sha256 header.s=selector1 header.b=pg9g3Tyc
Received: from list by lists.xenproject.org with outflank-mailman.1493147.1693265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTPAA-0007RS-NF; Tue, 17 Nov 2026 19:48:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493147.1693265; Tue, 17 Nov 2026 19:48:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTPAA-0007RL-KR; Tue, 17 Nov 2026 19:48:18 +0000
Received: by outflank-mailman (input) for mailman id 1493147;
 Tue, 17 Nov 2026 19:48:17 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xTPA9-0007RD-5x
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 19:48:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTPA8-00HTYr-Ij
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 20:48:16 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6afcaf7d-bab6-0a2a0a5309dd-0a2a4507d04e-6
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 20:48:16 +0100
Received: from [52.101.69.107]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6afcaf80-b4ea-0a2a45070019-3465456b0c49-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 20:48:16 +0100
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by MI9PR03MB911483.eurprd03.prod.outlook.com (2603:10a6:290:b9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 19:48:15 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0592.009; Tue, 17 Nov 2026
 19:48:15 +0000
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
 b=f1pNf368pnI5ZhLgkQmMtS0tIl17muyZwqTtgNuzOiEg05GXb+BtKk2EdxWIQnj+a+J9sXA+PCqoR0edyL1HKokZBPhhRiAqQa1iEpvCwXHEgNHv1THjRUq6cmCH7FiMs4sKrLFp/Q02F/NtS94U/GPdkfuJNVunJXN/2CzxhByyiuTSJ/c4zsM1QMq1gAB3Bek6aj6LvbcP9F26hR/IqlI1A1TcG5TLOAqQLvq8kBw9KZP7NIXd51oO3NwnMjMPGLMJZQ83yyB0+BYC0q0wVl/Fvvnz6qJHO3uUN/lb98o2cT7PqiPfKBuq91Ubryojk5mwGHrrKAytVB7d+GXDyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LErmF/bJlLM5D7v38QUNMSPLvquYKqgM6IzXspADTME=;
 b=I1gsYO+cZWtKpgJG2v531WfcxrH7Cb2RwNBeveFbayaIytO1z1sW86CiCkrfmssRnH7WYSH9Yo3LvLFCzk9qw1Fp5S6GrEokgt9bI3vlbHIiccyAHxAJZBJBiOrTFwJiF11kOD6Pkd7sNVWmxHIpJDbTBBRHFm/MaA7aIZPNubJnjlBw6+DzB0aYx0mllIeEZ2eDz3ryl0kRSaGmTxr6OrlxefLqGh6iAXJhmUKi/ulfrNrtf9cC/25ZYig4o0XLt55kgSJNRJN/dNJ0CMWIBHudCGNbBJ6cCWZIzjjFYuGcuaKOdBcjWy3+hNaXC3qxUyPhPcnAg85qLGKVpjVOoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LErmF/bJlLM5D7v38QUNMSPLvquYKqgM6IzXspADTME=;
 b=pg9g3Tyc3aFqqs20r4tiUUtHNrCBL86LanPrYD/eZZKMx3+pNOPsfmjIheRgsXSCI+KFhFLrUL8QrJ3WBVZoal92bYuo+3VapS0Bh/sXmrOFYYOSCZ4eh+lOYrBdNduG3Gw2Ta9yveCQrTqt4/ZlfRLj3DSklIc1JO1QV2zX2lxQOQ5OrLrGMqTz6LKHTw2JDN0SHqx/jfUwtXFOLvGFq/z6dsxesf2tXljxqwgS32ogTl0aXpSvQUmjbKAHBznC7hFijFD2DQGDA6O8rOWWlGamxw9z4TRv5KPUHxZNdyyb+5NSwSY8t6oJc+U5wSXIREbIpiAkoUI+tqrx3CaIQw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <0df09d6c-3314-4b52-bf33-1b70242193e5@epam.com>
Date: Tue, 17 Nov 2026 21:48:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] xen: resolve MISRA C Rule 11.8 in
 xen_build_id_check()
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1793699713.git.dmytro_prokopchuk1@epam.com>
 <bd4ca85c30c0a9551171506d81301cd616d4a23c.1793699713.git.dmytro_prokopchuk1@epam.com>
 <fdf5d898-0210-4f18-b538-7a05604844ab@suse.com>
Content-Language: en-US
From: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
In-Reply-To: <fdf5d898-0210-4f18-b538-7a05604844ab@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::19) To AM9PR03MB7526.eurprd03.prod.outlook.com
 (2603:10a6:20b:3de::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR03MB7526:EE_|MI9PR03MB911483:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b48a55e-dffc-454b-8e37-08df44e3b858
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|22082099003|18002099003|261009223027099003|4133799003|56012099006|4143699003|261026140227099003|11063799006|261102123227099003|261028144727099003|261026130827099003|261026135527099003|261021133027099003|261021130227099003|261022113327099003|261022075727099003|261026121527099003|261021123027099003|261022115727099003|261022105027099003|261021135927099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	15acyhRxPN2WKZNAtZvMVq3tGSJhi7fEAJzQLkw4mxHwyomWFscW3EgjxnCVZP/64wHCDHPT6lXhVL3/CGYoN9s4o3XjViXA/1T5RcJ1wCms+1xtzKE/HfOXHA7CrXfscYHujf2Pk4lDcXIV1WLaJWMHhJv2b9WJNmOgasrbOJ4nuC71zN0VhJYt8OAweVbYxarzgKe43b3wqjn8pGi7spUeo+W2Y8NhVJjRegQThmpxTinmIhEJiica8gMZ4cxWJu+GmnjEl98352ZiUQt4Biy7gDo8x0RHNmw8ALKQfoFFbZDtd9yVinHKi04YeFALx6ZUcpj+D9JQGFU+iHA7tNvYRSONVk5Kb0wH5SfOkLubT6w7/hDmRCNf9Vohqgnp4a5vfItxlQRldjUNLsrWnjkCqkYj8bCXdyu6vJNx0apP2S6pTX4BLkK3L46Upyk9tTYPONGpr/clJubAnDEyMj0BLrPVHiPDcEV6Xc5c5v+DFXd4uFND0Yj6oMm3IPXus2mATQLy9bPKIaCCiFamjDrdYPCGzUQshX9F/MGamEMmiyy6j1+kuFChILXjOPOH4IIUfcTU3wRW/hjyeA0xBIgHB4hBh/h9kbhMdrtp6OLkhgqRFZRDIvxpqYgGvvBX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(22082099003)(18002099003)(261009223027099003)(4133799003)(56012099006)(4143699003)(261026140227099003)(11063799006)(261102123227099003)(261028144727099003)(261026130827099003)(261026135527099003)(261021133027099003)(261021130227099003)(261022113327099003)(261022075727099003)(261026121527099003)(261021123027099003)(261022115727099003)(261022105027099003)(261021135927099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXl0cy9wN29HL3hqK0hMQVdKaGpWb3IzTkdJTS9BQkZ0YnR2ZVRJRS9rTkFv?=
 =?utf-8?B?WjVJMXpmZ3BONXFGZmg1OWk4dkZqbEtiMmFVTjBzWTVSRFdZWXlSd3l0aUx2?=
 =?utf-8?B?ckFUdGxVVHFGWE1XaFhPMDlWYUY3SUFoV1dmYjBTbXJ1Z2F5ZzUxQjFWK3cr?=
 =?utf-8?B?dnMyR0p5eit6QkEwcVowTzU3VWJFZzhwMUJxcEdqMXVJa0JUQTRWd2JHd2dV?=
 =?utf-8?B?alk2cE9Ic3hXd2NoUDAyK2NNNW90eTZRaUNSNFVpWm1LT1JVZUVOeEZVMUJa?=
 =?utf-8?B?anBKdVFoV0RxVVVlQTdoR1FJeDJnUmdzT2ZNYVJ1UkF6SGVqTEtZR2QybWtl?=
 =?utf-8?B?bjl1UzZkYnRSWnBuVnlxY2lybzk1bVpXdkRWVkRoZFpuVll2U3FwVWRLbjJr?=
 =?utf-8?B?aWFpMEVJeFcrZmM4aEUvVWkvUlA2VTdMZlBDcElYSUZYR0J4ZWpxNXhMY1ZL?=
 =?utf-8?B?M0xHcVRTZWIxYzdwU0ZQb2UwK0dwNnhLZjJVU3hRMWlzK3A3WFNRNTZIYm05?=
 =?utf-8?B?QUhjQzBIaWVzOUQ4Q25SWURvYnNHeXI4NEZveis3cCtRWDd1Y2I2dm5Gb0FC?=
 =?utf-8?B?TUs4YTh4Rk03R1dFMHFJRHV4bUNZOGFQcUIrcTBRQnBWb1E3WWRCK3NGNGo0?=
 =?utf-8?B?eXd4bXFaZjF0M0hFdTNkSmUyZmFhemNWMDJBTHFnbllRMWpxVlIzbkJEWlBX?=
 =?utf-8?B?Ty9XN3lob0xIeVBXTmxEcXlBRFI1U1VNV2NNT3dQbEU1bENaQnRnNGZVckhX?=
 =?utf-8?B?VDU4MXluTkl5RzFkYjQ4VkNxZ1UrSFh2WGlCdjRQZUZsa0dnc290NjNzNFAr?=
 =?utf-8?B?N0JIN0pJU2JpUEQ5Z0taMFJZelJZZTBLcWdDb0cvZDNaTURtQUt0SFNDUmtG?=
 =?utf-8?B?ZW9zSVhjUlRsWFh3aVhaL29zanBTMVRtTEJmdVAvbFRmOHB3bmRLaCtXZnFL?=
 =?utf-8?B?ZDl0NUZmOCsxd20vbTNUT0hiVkovdEZiTnJRSnlhLzBhL1V2dW94aEdnUUtV?=
 =?utf-8?B?NFpFc0dHL3FnMXVoSjEzZjdidHFTNFV1Z2Zpclh5STMxRVRGM1pRTHA1NDBT?=
 =?utf-8?B?NEp3VWVPcHVIa1IzV1R3SnJpV2djTXArU1V4MkJwNGMwcDg4elRGQ2dHUS94?=
 =?utf-8?B?RERheUtMcWw5ZndJcFZBMnRScnpqdkUvMFpRZnlXQk50YVZqME1PQmdQTGY4?=
 =?utf-8?B?UGhpc0swZkFUWGVrcUZiWkdDTmtuc0xVWWhmd1pJQWlFKzF0SDhxZjdZWjlH?=
 =?utf-8?B?WWhhTXRtSGJOK2FIVlJoc3RNZVB0TU1TYnBqbkRwZ2FqYlZpbzZkclcveGZq?=
 =?utf-8?B?djc2SW9YTFNtUUMxa0JrWGxhQzEyY2JsWHJQczB0ajZxQnJOVTZSMGlVb0cx?=
 =?utf-8?B?NUtQVmFzMkRlWDk3QnJqQTlGV2MzbmtvV0d0VXVJUkNtT1hDRTZFSU9XUkpY?=
 =?utf-8?B?RXZoOWFzMlZLRlJlSWJzZFNxSzJwZ1VtT1pEbWRjNmZ0WXl2NVlXeHZsSVBY?=
 =?utf-8?B?aE40SEkrQXZuR2NEd0dneWFuL1d3V0ZFRWVINTNWWnp3azZXTjlIZHU0dXlN?=
 =?utf-8?B?QmQ5OWR1N1VLYVhqYUNBRWJIMG4rSXhmT0JwMUtaT0pDL2xKc2ZTaU5SRHdz?=
 =?utf-8?B?VFpmeU9wUFdkVTZ5QkxUU0NYVmNZdEp4b1c0aTNJWWZ4bGlCMFBzNFBYb1Bm?=
 =?utf-8?B?OXpZOEYxdjRoSjUybWh0MWFkbFg4b21nTFBQQ3RvVkE3OTJobWNETjArNUoy?=
 =?utf-8?B?MHZkOTJMeHBIdDA2U0RSbzI4Z2RiQzBQdEMwTnprdkFVbWREMEhDV3ZDTVVX?=
 =?utf-8?B?NWsvSjJkNkhFSTZlUU52dmZ1SThxb2hncllxRU1Ta2Jzczl4TEZjNEd1dGVL?=
 =?utf-8?B?SjhhelhiTE1ySysxVFRSQzRhaCsrMXloTkk4TWJJMVJnNXFUUEExSlZoZEUv?=
 =?utf-8?B?VDJVVU43aFByellyQ3lLRUtEZjQzcnJ5M1ZwTENUSFpsaTE3dGtYNW1zRlBJ?=
 =?utf-8?B?WVJZVDU1R1hkWHZjRWIyUzN0M3h2elhSTlhyMmNjcWNKVTJiQVBnWVlCcS9n?=
 =?utf-8?B?VUQwZU56bHdnOEMzUnd4U090RUNIY3k5Ujc0WU5wRGdoUjVYY09HbGFUaEdu?=
 =?utf-8?B?ME9NSW1NV0xEU2dFYjlFVE5GSFlLZWI5SjFWd2VnQTZwWlA4dmtMdWRKR016?=
 =?utf-8?B?VWptdWhBY1ZUN09TemZXTWpIdjc1aDAvYjhLQ3ZhMWtUVHVVZGt0bFplYnlN?=
 =?utf-8?B?T1hyVzRhWnl5Tkt1UjVrR1cwMng0QlBBdDVuRlBOb1B0ZE1QUmFUWG1lTnNp?=
 =?utf-8?B?UFZGWW96dHRVTndwMzBVVHVoTWZyNUxMTkhMQTB1dTNOOTIzS0xPdXhVaUc4?=
 =?utf-8?Q?LC3bMykcfD/eCBTM=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b48a55e-dffc-454b-8e37-08df44e3b858
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 19:48:15.1851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3xomHiksa1ctoEzmYrJ+ba3nb/uAUOeMjI/DVoIUc2S+PfWx4lrQT7RQtOQtITX8ownCX3vc3k9Erkf7unoBML+m8r9LZ++1uEk8NgB5RQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR03MB911483
X-purgate-ID: tlsNG-ef75cf/1794944896-3C610AE4-518FD9A1/0/0
X-purgate-type: clean
X-purgate-size: 2253
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/3/26 13:16, Jan Beulich wrote:
> On 03.11.2026 11:29, Dmytro Prokopchuk1 wrote:
>> ELFNOTE_NAME() unconditionally casts its argument to 'char *', and
>> ELFNOTE_DESC() is built on top of it. xen_build_id_check() passes a
>> 'const Elf_Note *' to both of them, so the const qualifier is cast away,
>> which is a violation of MISRA C Rule 11.8.
>>
>> Introduce ELFNOTE_NAME_CONST() and ELFNOTE_DESC_CONST() for read-only
>> access to the note, and use them in xen_build_id_check().
>>
>> No functional changes.
>>
>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> 
> It again would have been nice if it was mentioned that this is an alternative
> proposal to an earlier posted patch, [1]. Personally here I prefer my variant
> (with the adjustment as per review feedback, pending a v2 submission).
> 
> Jan
> 
> [1] https://lists.xen.org/archives/html/xen-devel/2026-09/msg00045.html
> 

Sorry for not referencing [1].
I will drop this patch and wait for your v2.

>> --- a/xen/common/version.c
>> +++ b/xen/common/version.c
>> @@ -133,13 +133,13 @@ int xen_build_id_check(const Elf_Note *n, unsigned int n_sz,
>>           return -EINVAL;
>>   
>>       /* Sanity check, name should be "GNU" for ld-generated build-id. */
>> -    if ( strncmp(ELFNOTE_NAME(n), "GNU", n->namesz) != 0 )
>> +    if ( strncmp(ELFNOTE_NAME_CONST(n), "GNU", n->namesz) != 0 )
>>           return -ENODATA;
>>   
>>       if ( len )
>>           *len = n->descsz;
>>       if ( p )
>> -        *p = ELFNOTE_DESC(n);
>> +        *p = ELFNOTE_DESC_CONST(n);
>>   
>>       return 0;
>>   }
>> diff --git a/xen/include/xen/elf.h b/xen/include/xen/elf.h
>> index 4199b4d6e6..3337b8cabe 100644
>> --- a/xen/include/xen/elf.h
>> +++ b/xen/include/xen/elf.h
>> @@ -34,4 +34,8 @@
>>   #define ELFNOTE_DESC(_n_) (ELFNOTE_NAME(_n_) + ELFNOTE_ALIGN((_n_)->namesz))
>>   #define ELFNOTE_NEXT(_n_) ((Elf_Note *)(ELFNOTE_DESC(_n_) + ELFNOTE_ALIGN((_n_)->descsz)))
>>   
>> +#define ELFNOTE_NAME_CONST(_n_) ((const char *)(_n_) + sizeof(*(_n_)))
>> +#define ELFNOTE_DESC_CONST(_n_) \
>> +    (ELFNOTE_NAME_CONST(_n_) + ELFNOTE_ALIGN((_n_)->namesz))
>> +
>>   #endif /* __XEN_ELF_H__ */
> 

BR, Dmytro.


