Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58987606A32A
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 12:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=x15ZAxgM
Received: from list by lists.xenproject.org with outflank-mailman.1479941.1683839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQOEN-0002rZ-QA; Mon, 09 Nov 2026 12:12:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479941.1683839; Mon, 09 Nov 2026 12:12:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQOEN-0002rS-Mx; Mon, 09 Nov 2026 12:12:11 +0000
Received: by outflank-mailman (input) for mailman id 1479941;
 Mon, 09 Nov 2026 12:12:10 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xQOEM-0002rM-F9
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 12:12:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQOEL-00Dxzk-ND
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 13:12:09 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af1b899-e002-0a2a0a5209dd-0a2a4509b4a8-8
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 13:12:09 +0100
Received: from [52.101.43.30]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af1b892-be1a-0a2a45090019-34652b1e0857-4
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 13:12:04 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BN5PR03MB8111.namprd03.prod.outlook.com (2603:10b6:408:2ab::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 12:12:00 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 12:12:00 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WdXO2yjxvv4fvv5tpZjo14o4TtKHXJEGXuJXhQn+XU0ur3iQHv3XA25AMJQmjYHu+N8QtfFOEE2pZlyBN4e2bSeGTtj277c9OBw0LEQdSYSLSjS0odJ5/lRNbSt6fBFd8qMfFoi8hUQ/WTOa98YNzz2BQDwAZ134Y7DImTHteY8mpIQ641oPlEMbiEPg8RF3jfuxJB80d1bja3ZpJWNnOxHRJRWeWx8+c1m+HvyhTbBr/KH1cAlGZT+x6y6PLJbqhhRWaqbuR/I1qwGoZ82EY/gJTCJeJoPmldbIsYwOhNPutXKIlwQgNtcDQlDyCQkI+GEUkjgOkqynNLJT8KBKmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6oqk1oiG2+lagwnQT9xYbsTlLVcAyDLGEes14eZnORk=;
 b=DiVHzVZbiltpe9gebwp9e+5oGEb1VZ57QkUhjTSCL0ryvaiUF42jMaZephnM2eQlvQp3vBwdvlocS1QF8IsOjbD7uxQeA0Ik/qUR/rBJO22vOMwtb+IXguzCFTvwMQC3ea9EjEBbhw5cCAi361l6SIBSU0vDZXnecJFIhoxyHB4FknKyBtHe2Te+/aOT6iQndesx/cqfsrT7onSPVzld49Syi0j9Cmve3Wso2WhwQGOMYdTYCXX8AZktbMJUM9U2n+pDdIwhiPnxQ7eNy90//vHlhCHiWQ0geNJzD5PCYq3RIL0imWv1oK+M1CeHROfzP4NxBDXlRGQYR3ap9XPlNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6oqk1oiG2+lagwnQT9xYbsTlLVcAyDLGEes14eZnORk=;
 b=x15ZAxgM7pSReV1pLe51DVmX46//MVI5TJOzQvm7MafivhrjQBHf2e7LWzWdFjJmHmVVvRFWnLBgPqfF28vmz/yitZ3/3GyO6kC1fyToO2DR3yw317K6eDKKcsYOYm3K9m8Tgh4GgSxnvgTVHDOb2skwC+Xtzi/v9mjCnj5XwYg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2c3e53f0-c4e4-4242-aa59-f3ee12a16590@citrix.com>
Date: Mon, 9 Nov 2026 12:11:56 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH] tools/ocaml: Fix cleaning bindings test
To: Andrii Sultanov <andriy.sultanov@vates.tech>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20261106231732.482518-1-jason.andryuk@amd.com>
 <0037995b-dea1-42d6-85ac-cfa7719762a3@citrix.com>
 <936b4d91-cb3c-4be5-9945-4c150afbec3a@amd.com>
 <1794213821.8631fc262581453bbf619ec5b2062170.1a1bf7a3b52000403d@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1794213821.8631fc262581453bbf619ec5b2062170.1a1bf7a3b52000403d@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0213.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BN5PR03MB8111:EE_
X-MS-Office365-Filtering-Correlation-Id: 06c14213-afda-46f9-9b97-08df3e5aa832
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|4143699003|56012099006|261021123027099003|261021121427099003|261022075727099003|261022105027099003|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	47YFWQgIuR07KQjnLmQyiVZiZsBHqUagyuLvR9szDt1McApxsTF7wWNiTDaQ2UVR19fzUac2NWTDlNwoMPEGReG0EewBb3VTH544RmQ19H9ebbj1Sof6uL4AqeblNTfTT5wxLqKFJ8nol9KFaX4S+PDJi8FMpB7TGqCywhX0rH/DyNOeuWi/vHV4UgxCaJjrXr3JHQobezm28VuycIiT10aneY4tLCdBMJBR9l+unNcKS871/kenimZunpvvvFi3xhQSuwPE+tjzdMoJD1kRgt1nQkeJy/8gsCaktGPdYzPjkotyMQ4JtMu8+8Nj747EqVYJ2K3tb7ggf844edkQHHRLmrZ45rgFuwt01pP+GFqFjpPK6phfOKcNXzALBqDsWmEFhzpy4807ZeH7I/8MBdDXYKC2n/1PC7nP7PaCGKWcMWmFazZncC+IFfMrW9XXULhixyzQ9DTRhBXGoXD6kMxAgkQh4XRe0Xdd8HS6A+goxVE+wo/udAX57+CSrtLFRZ14wAjfPDU6YZoamkQS1SpTDp3BnvPzjYfadBgE5iqq/pXMQtAh7U1zEiDgfT4AFsgSrhr7ElaGNQJGkOoi+V0y1Ije1x1ragt99OoocwXBlFzbrP/vfIc8Eh37gu2YphiI+8jrQ7pVFz7H0z7iLzA4E92LoRqF4sQVyLn1CLQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(4143699003)(56012099006)(261021123027099003)(261021121427099003)(261022075727099003)(261022105027099003)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDJKVHhrYUk5dnNWVVkycXhaUitmeHJrUFVPRzRnYXJEejNLT3hZZjRGbTQ1?=
 =?utf-8?B?cVhNUWtNaUNlZkxrUGlKdVVPR0ZPbEw5OWZrVnlCbGM5TmlQbWpVc2dncGpZ?=
 =?utf-8?B?WFJUeE9DMkplajNOS293ZXMrZWVNTFZNVWsrTUVXcnBtVWF1VDVrYzlVRWlG?=
 =?utf-8?B?OFhldlJHa3I1Z0Y1Q0lpMDd3eWVjZ1Q5ZmdBbEV3Z0V0ZFJCeVlZeW45M0JP?=
 =?utf-8?B?Y2p5dGV6TWQrUFBmdUhpUlpHdGdVUWlmdUFqWHBnRjlhQUEzSm51WlZCdzlq?=
 =?utf-8?B?YTM3dzBHZUNpZWlFNlhCYlUyQTh1SjEzTnVhZjVpbGNYVkxUbmZtYlAycFlr?=
 =?utf-8?B?UlcwVTdXNVV2OXRITFBCNG9NNk1kVkxTYTducmdHc2tNaENhRHRpemR4UzdI?=
 =?utf-8?B?a2svUU1LSStWOTRkUmpQTy9VRjR1YXpGd3J4R3grYkpwRWx1VURmMi95NTEx?=
 =?utf-8?B?Z1BiZTlJZVNjUFk0c2phdjJuS2d3amUwTDVKSVNpeEVIei91WDNUMUtCekZJ?=
 =?utf-8?B?OUk5SmdxS0RPVGU3K1BjQTUyKzZUMFg1WWVDSW94QkdZQzRpQ3NOU1VPQ0xw?=
 =?utf-8?B?VGV5RTJoN2tnSndBK1IzOG5UbXN3ZUppUkpqaDFzUTk2VitRank5ZW4zWUc4?=
 =?utf-8?B?SUcwL3IrYTNvZHNaSHM2cFFpaFZMMjkvdGQwVVRYSmtKZmZhRE4yVHJ0OWND?=
 =?utf-8?B?TzhDZHIvbG9tZzcvb2hiOGlDeEZ0emN1Vm1qQWJKRDNBbWVFQjFmK3NEbDlw?=
 =?utf-8?B?a1dVWCs3NmNsaGgxazQxaDQzSDV3R0NLREt6WnhUK0pxOVd6WDRUYldaTUM4?=
 =?utf-8?B?N3dKYjBKbUhZbXdKWE1SQWVTUit2dGYxTEZuRGJ5ejBZdmxsSGVBTWFwTkVv?=
 =?utf-8?B?dW50Q092SXZaa2lRL1p3OUQwUTIzQTUwY3lPNEpPR1MwQVhScjI5ZTZ4WTJn?=
 =?utf-8?B?aDdIMGVER0sxeU4vb0pzVlFEbGxBcmRCQW1CQzlEQWczcktHbVVRTGtnNTlQ?=
 =?utf-8?B?VEtSZytDekpNZHd2aG1LbXdBbi9qTjZnbHUwWTFvUlBQVUF4dnYyNkhhYTEy?=
 =?utf-8?B?bjhOaWFjSnZLSUZ4RHZxUElCRWZDWWFPMTNNcjFiUTYxZmlPTE4wWVF4NG1h?=
 =?utf-8?B?NG9jVVNYbVlndEMwT2VlbmlwemNkVXI1NjVUNnY0U3ZUS3Z1YzFacmpTT3Z4?=
 =?utf-8?B?aXV0Z0dCb0NaQXlLWWZOc011d0dsT21xTUZrTG1HdEZwaUU3TW5OQjdxWjlr?=
 =?utf-8?B?UnhQUHJRRHExOXV6OWpJVGxUU09IVHBUSXFTWGhUUFhuZGlyd3lyTlI4Y3JV?=
 =?utf-8?B?eFp5SGVkZkk1Q3ZRZUtHVE1EVDJZNm1XM2xVeGk0eUdDU0pkMXhxVXhsRzdh?=
 =?utf-8?B?dHMvYW1PTEh0U0t0SkUzaFpWdHpWSWhwZjFydGV1dk1vNFA2QVhkZ0VKWHF1?=
 =?utf-8?B?NVNMTFAyUjJJckhTUGxNR3VxeEdldjZvaDlFdGJZTzFRMnN3WnVWN21KMzV2?=
 =?utf-8?B?SEpaUzBXTGUrWXlDMnUvaGY1M015NFVCLytYY3JidXpaMGU0NVhSY0FmVFAw?=
 =?utf-8?B?M0R2T0dSc1VWZldKakI1T1phV0Y0U3FBd2Q4Mlc3WFY2S3dNaW5ZVElFQ3Nk?=
 =?utf-8?B?bS9lT2tCNmNHK0g5KzZjcGtaTm1iVmFFUDZDUWdkeFRTU0NCa3h3TFBuYTlR?=
 =?utf-8?B?ZnlFYm9YS1ZhUUs1WEFIZ2srWHlVSnZRUFVDS1RCNzlWbTFON1NhTjJxVkhV?=
 =?utf-8?B?RDI1S2Fic2o4UmtiYVZVSWpVMDc4OW5hQzR2bnpLY1dYSUVIcTd3SjBmRHFx?=
 =?utf-8?B?RzBoanVCY3J1SlRjdlhneUVJakljWWZ5T00xNmw5a0tlSmRoTGQzWm8vMXV5?=
 =?utf-8?B?UjBmbUUwZ1lsVGFsa0ZweTB0MzJQRWlRc2k1WDBBVVl5bFh0SjVyZ3BWZGor?=
 =?utf-8?B?SHRpZW94SGJTWkRwTjhsUXp5TlcyVTVRRnRPeWd1R2xPWmhidXYyMUNtWGxJ?=
 =?utf-8?B?d3hySkNrSWhoL3VSL3lQVHR1UXYyd3JhVU1kcXZSTXZzcTBOdUI0dVByNVQ3?=
 =?utf-8?B?Nk9uaktscTZ3czFVSlBOdi9QSjdCaUJYVCtNRXo1cTBhS1hMQVpTMTRubGk4?=
 =?utf-8?B?TWh3b2lyYjBHa3ZHNEZMa2Z0bkxuZE9iUVNuaURBZmptQm8xSGVlb2lDanB6?=
 =?utf-8?B?a1pnTjVpbWoyeGp5L2VKUmZxMFZsbXNDYWFUOVVyMzl2S3Foam0yTndvVU1t?=
 =?utf-8?B?Y29wNlRNYjByUTg0L01RRDV5YmttR3hNU1pyczd2VTVHeUVFNmtEYXd2MjZ1?=
 =?utf-8?B?Z2hEMEl1Tm55a2dKdWkwRFAvZXdmQjZRWXdDSElVVHNwL1JzMlAwQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c14213-afda-46f9-9b97-08df3e5aa832
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 12:12:00.1876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NNmha/6PJqRlkpHN/PKAH4AqpBm04iHcfFwc8GaC4dPLtnuPqWF/PH9eYSyEbCIFXpD2ExqoNLM7zM3kHHeFDaSq5j8D6W6c3X6drokXYLM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR03MB8111
X-purgate-ID: tlsNG-bad1c0/1794226324-BD2CC034-80005476/0/0
X-purgate-type: clean
X-purgate-size: 1404
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 09/11/2026 8:43 am, Andrii Sultanov wrote:
> On 11/7/26 00:11, Jason Andryuk wrote:
>
>> On 2026-11-06 18:19, Andrew Cooper wrote:
>>> On 06/11/2026 11:17 pm, Jason Andryuk wrote:
>>>> make clean fails in the bindings tests:
>>>>
>>>> make[7]: Entering directory '/home/amd/xen/tools/ocaml/tests/bindings'
>>>> rm -f .*.d *.o *.so *.a *.cmo *.cmi *.cma *.cmx *.cmxa *.cmxs
>>>> *.annot *.spot *.spit unix.cmxa -ccopt -L -ccopt ....
>>>> rm: invalid option -- 'c'
>>>> Try 'rm --help' for more information.
>>>>
>>>> Split the compiler flags out of the LIBS variable, since LIBS is
>>>> passed
>>>> to rm.  The individual *.cxma files are deleted in their respective
>>>> directories.
>>>>
>>>> Fixes: d97847e858f1 ("tools/ocaml: Gitlab CI test for bindings")
>>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>>
>>> Lovely...  Sorry for breaking this.
>>>
>>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> Thanks.  I just double checked and unix.cmxa isn't in the directory
>> on a successful build.  So the whole thing could be moved to LIBFLAGS
>> or a suitable name.
>>
>> Regards,
>> Jason
>
> Could we follow tools/ocaml/xenstored/Makefile further and
> move to BINDINGSLIBS or something like that?
>

Yeah, lets do that.  It keeps it firmly away from variable names which
have common meanings.

I'll fix up on commit.

~Andrew

