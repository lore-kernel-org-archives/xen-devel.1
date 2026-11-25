Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09053606A33E
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 12:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=qZY1OQZ/
Received: from list by lists.xenproject.org with outflank-mailman.1502344.1698313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWCVw-0001hz-MO; Wed, 25 Nov 2026 12:54:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502344.1698313; Wed, 25 Nov 2026 12:54:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWCVw-0001hs-Je; Wed, 25 Nov 2026 12:54:20 +0000
Received: by outflank-mailman (input) for mailman id 1502344;
 Wed, 25 Nov 2026 12:54:19 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWCVv-0001hm-It
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 12:54:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWCVu-005FSz-VR
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 13:54:18 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b06da72-bab6-0a2a0a5309dd-0a2a450bbd8a-32
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 13:54:18 +0100
Received: from [52.101.43.71]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b06da78-b7e8-0a2a450b0019-34652b47d62c-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 13:54:18 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB7066.namprd03.prod.outlook.com (2603:10b6:510:29c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Wed, 25 Nov
 2026 12:54:14 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0662.001; Wed, 25 Nov 2026
 12:54:14 +0000
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
 b=G6Y7ClP69OBN/ugkn9VL3oIk4plSXbK5noTT6bOFLFWDydb5zj+tWuUBhM+QhIJkaAhX2S7MHg/Rz8CIXQQRhT0CK0GvhpIe21P2CzOgNFJjVq6Z25fZ3TZtnMuVk+VDeo4wfaKdW6BVhrgcUaCDGhXTPPUQxlsBO8PNCmacyMaB5H8iChsxuxrq5r562adO2AxzdChJXSAWZhMKseNxrgbnMHdNxKc57KmgbLC0Xoe7YyYGYp3Wn3OZRJdKF1JniePaIcPfN10GwJ0CbPjtHIykCGzB4r+kDEuG9rgLMrLEadasUcjrYALdOu1n0crh/nRJGjTJ7HGY4ojJauxCCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5zPVxjAAOV+DWuvCbKZDYTaz+it8LUJMWGUJ/xNVPY=;
 b=gZjFRkceWxtgr08eR0rJyt0Vki/CSXa4+2VRPC9sSI0kht0tDfpvT3xCGtVEQ3Trvsr4rjG5MOo3O+tRThcaOvPZHVn9ZDiSKuxSRzE/uCiIz8wi6MOwm8yHQo2vOaX8+h+Eolp7x1xY4kLyUxRxoCAPosMW0zZ2ApFPv9p6RFSqTHkXmV0djy/vcRk2tIY1bWpsmTcJ8PidnJwLWrwv4Q3ocjKYzHvGExwg2XfvrZxvCefdhxsEm+WEcgnfPMZBSFjUpCNzECR6k/y+S5PQYKTePvvuQ2WQGziKYq4261B/1oaYHaW9B5UAQ8fvGNWHhxLX8CDzkyt7Fnw8wuYEkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5zPVxjAAOV+DWuvCbKZDYTaz+it8LUJMWGUJ/xNVPY=;
 b=qZY1OQZ/HbNRhxZR32K+40qhYX+Amy7LPuJSOIDekyYApEp5SmCwtiJIaQmlKlmq2KJLX82Hr6Syqrj0uNnuTtrOC9fyfvBaPEYOZBSsQZY6znEDrqiRh0tjs9LJANXR6agvybCiaD2spem7fcKzQrVzojg6BaXowyWKNXOPaJM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7fa69bd4-f9d3-4e47-a363-e265d9475fc9@citrix.com>
Date: Wed, 25 Nov 2026 12:54:10 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/efi: Explicitly set NX_COMPAT on xen.efi
To: Jan Beulich <jbeulich@suse.com>
References: <20261125122352.578425-1-andrew.cooper3@citrix.com>
 <b86dc4c8-99e5-4cac-b5b0-9f5d03d0611d@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b86dc4c8-99e5-4cac-b5b0-9f5d03d0611d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0298.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB7066:EE_
X-MS-Office365-Filtering-Correlation-Id: 3db45fdc-3abb-4784-ce89-08df4af33559
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|6133799003|22082099003|18002099003|261021121427099003|261022105027099003|261026140227099003|261102123227099003|261026121527099003|261028144727099003|56012099006|10067099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	elHgqvSbCZferzVG7F7hj8NPas76yYzt5oN8uIO80qIpBF3EubWk63WXLIUlUYPa0PCobrm4sk5vKLHp+lJg/iw0ABNVLGFEN7ZojwJerqITiLkehINdYc1SvOnl/Z1Sx6itEf/0uGF4QRLH7EBE6pY7xcHdu00AaQX2zmdKJNbsRH8ZGH8xCPg8TFSIkavqFvAa8e2I0YPNfkpfxq/VcVsXF+Mh/hpL6cKp+mjcRbWf2WbU5dE34JH/JhYnVQaQAFnL0k7BvjcxHfBFxE8PUV0UTURBUKP8EZ47iXvXXWXWKDc7ftriSWtSwSr86uL++YAAAkz25fbb8GmVXuP/AW1uVR+SZxLUKZX5ASa/D9o9IL9XPdrjh6XpbFalpIQJws+IOHsUt0+wDAdX3DhkWlbZXPBxiUlfMfU+QzhVwOnQTZFNmCRxWgl2ccarIevjm4nLHr0x8IMEaBGeuM2Xt6n9wia2ZxSRkwSXH/AhEwee1YkPV6ZwsAHZ4BzspmGm/tshPSwA+s79LfQXS9eu9pUU0419RoiLM6QIBXBM7hmAVGN75rvPhT/gLCGBTF4u+UjM9/pgCDXHIyLhsNdAYn7uh+C3aAYmYr9CTXpPqWE1z88cF2jAZDlk7zmxAEZZExO3l3iWkOo9un9u5d4U1JtrbKMlcMmCF/BAssZUc1c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(22082099003)(18002099003)(261021121427099003)(261022105027099003)(261026140227099003)(261102123227099003)(261026121527099003)(261028144727099003)(56012099006)(10067099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGlVTEhwTU1BMTBoSHlsL1laQUIrbWxoU0dLdFJRc3hKU0JqaTMxdkRvZ2Jr?=
 =?utf-8?B?bjJMWWNGVTRMaGdsWDFTcU9HakZvdTJ2bkxjdDNpa3NkVkVhbWYxWnAvemZu?=
 =?utf-8?B?UEVXWXZ2cDdWeGM2ckFHcUdVQUYvNHk4bkpxcUxvMi9ycVVvbVFjTGh1ZWk1?=
 =?utf-8?B?TGJMVkRGVGJkdWxGc291YkNFSGhnNitObnBFZ0xiWG1kbVAyT0k4TGR4eGxQ?=
 =?utf-8?B?U1ozalRHbUFKTzJFWmw0SGxHdVRDVDcwWXhkSEprcyt3d2lRM3ZNejEyTStJ?=
 =?utf-8?B?QjdKU21scmFERFUyd0RUV3VjOHE2TE5DYk1zWW4xRUhOc0lxS1c5ai93c1Ay?=
 =?utf-8?B?ditwWS91WTBCTGgzRUtuVkc2WWZxSDB3MDZ4Y3FrNHBJMXl3c0hrNndvUUVR?=
 =?utf-8?B?MUNKT1Viam80ZzBhM3pRajRtdk1XRGMxZllRcmEyWHlNckNQTTBLYmg3U0x5?=
 =?utf-8?B?K0Z4WUR0dXpoWmRLeEUvdWYvcFdJN05mN0o1dkVPRjlja2VWd25PVnA3VEZw?=
 =?utf-8?B?RTl6OTRnbXZ2bzEvbjNBeE00cUtnRHVBbGRacHpKSXpTWDFrUEJJaDd5OE9R?=
 =?utf-8?B?aU1pcGYreGZadS9OcmJNZW1LaE0yVmlSSGV2UWdNTnZSdCt1MS9VY2NreEJW?=
 =?utf-8?B?Y1R5cUFEQ21BZmxlK1JxMHQwUUlQSmJONEYrNGVpc29mNUd0SlR0eWdMdE04?=
 =?utf-8?B?OVZqSGgyNGYrSGI2VER4STZ3aXA4RVhzNko3ekJNak5NYWhGQXRFLytCTzFZ?=
 =?utf-8?B?STh4STEvMkI0dmdLQUVGemFMa0MyKzQ5Y25XZlg4bElMT3krUTBDQi9lYkph?=
 =?utf-8?B?RjFrbXd4R3JBdEJ1UnNZRElVRUloK0UxV3EwMU9Zc2VKSTVWbzRndExtYWNK?=
 =?utf-8?B?UzN6U3JwbSt1L3FQMWdFL2MzbUdoUHJNd1haRWg3YjhJaHpWNmNXWGxkOXNU?=
 =?utf-8?B?VGhhUlV2ak1lcGRiUEs3V01sNXROMXF0K0FOcERvU1liMkxhY1B0b0tveTVk?=
 =?utf-8?B?OWtPZWVma0tIbC8wekNEcDhwNy9rdHNPUHFlbEJaVkpvemdXV2hRL25iOERi?=
 =?utf-8?B?Yi9Dd1RYM3pNT1JBanFQRVdjcW10WldqWFJoZWFsVnlOcWlWb0JEZzUzVUk4?=
 =?utf-8?B?amdnMTZhcTFzQXF0Um5KR2lyeEZwL3FycFNKVGp3S1hHY1h0S0pJQ0kraTVp?=
 =?utf-8?B?bkY2NFgwN05MOGoyWTJGaFh6RmhvZjNSVXAxMHkzVjhHc2RLYXE0VkF1d3ph?=
 =?utf-8?B?RUdhKyswcXVFclRFUWxsT013dVNYSEtudG5KdVFsV0RoZ2M0SytmdXM3d2d6?=
 =?utf-8?B?eGRXZlJVNlRzbVA3NTRPVENadFFyOXFhTzNlMW41NmVHL0cyd0R6c01OZGhF?=
 =?utf-8?B?UXprTUtMVTVuSGZ0SkZmdTZoaXlFTlZOUHFwcUpNd2hWOGNFTWZlRjd6NmJr?=
 =?utf-8?B?NytZczhlRWU3MVIrM3pTZVVGekhWWG1GTnI3YW56RHRSRStWWFh2ZzJONlVy?=
 =?utf-8?B?WVZySXdoK3ZSMW1iTlJOMmdIZWVkV1A1L3JSQjJNZ3pqTVkzRlRIR29yN3Zk?=
 =?utf-8?B?MkI1VnFIbm12M1dhSnVPODhKSWdqREdXSjB3eDdYN2ZvUzVrUjFJYjhjSVJQ?=
 =?utf-8?B?eVlXNGlFbzUrUkNzaXZ5R2w4S1k0blF0YXIxUFdZMStpbTBES0xhZkFLdlh5?=
 =?utf-8?B?SXBvLy9aUFVKZGg2ODliTDNQdE15UENiYkxKaGl0by9JWW52YnZCcjM1Zm0y?=
 =?utf-8?B?MUszbHZ1TWZkUzdlbVl5M1FWTHRzSE9YR0hqSTVDaXVHQU5RWTQrbi9NbE9I?=
 =?utf-8?B?Y05GQVZqNENWako0U3pEcWh4Z3JyRjlUVVF5eEthL29lY1lwa0Z2Yk0ycHdP?=
 =?utf-8?B?VHhkcXRoRVppQXovMjhneW95Nkl0MEFuRFBZQkhNdWxuWDB0K3gyb2ZJV3M0?=
 =?utf-8?B?RDFqZ3QvS2VFU29YTWlLSWRsV2xtZkpkSUtLZ0tENlliSFlyYnVCUGhiazdN?=
 =?utf-8?B?NFcrM1J1UFRoeWFwS2NBZTk4cGU1akg3RHVhMHcrdHNFV1U3SkQzckF2MXgx?=
 =?utf-8?B?dW5WV2RGUmtkZjFocVFuMEFHa1hOSndDRFkzeVg0K2JXN1k2TENlejJ4blk1?=
 =?utf-8?B?RUlxQWZoSDFrODBvRjByMWFXVk1iaHRhVm5lNGNBV0N5bXpLNWxyZ09KSWlY?=
 =?utf-8?B?RUhqd2diM1JkK3g5eW8zMUpiaGgzZDliT05hVWdETzRPR25hTjZZWkRmUXpt?=
 =?utf-8?B?eFpBUjhuQVFRQlk3NjJHNGVBY21RRi9CeFZ4bXJna1pkNkpVdlZ3VmNzNzFl?=
 =?utf-8?B?U3QyT2txdmJKMEVhT2cvT29Zb3MyaVowWWJrR3QvWFlEZ0FRNW8zUTN3a1Ev?=
 =?utf-8?Q?SP/59c5TB+5ht5Ro=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3db45fdc-3abb-4784-ce89-08df4af33559
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 12:54:14.4169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P78f3W/Lwl5GFgMi+X5pUZeWixzOwqrKhhjB67suh2DGhPEVhdOTP+Oy8CCxuoGb/7YDxpTnA1c+qZkJhKjCZDiTgHt1Uwldaln0ZRKiHx8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB7066
X-purgate-ID: tlsNG-42698a/1795611258-A88C99EA-BADCB85C/10/78276251493
X-purgate-type: spam
X-purgate-size: 864
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 25/11/2026 12:43 pm, Jan Beulich wrote:
> On 25.11.2026 13:23, Andrew Cooper wrote:
>> Binutils since 2.45 no longer set NX_COMPAT.
> For completeness - ld prior to 2.36 doesn't either.

Oh, does it not?  In which case I'll adjust the sentence to this:

Binutils between 2.36 and 2.44 set NX_COMPAT by default.  Outside of
this range, programs have to ask for it explicitly.

>
>>  Programs have to ask for it explicitly.
>>
>> Xen is NX_COMPAT-able; Xen does not execute from it's stack at all.  The
>> property is mandated by the Microsoft UEFI signing requirements.
>>
>> The --nxcompat option is available since binutils 2.20 and llvm 6, so can be
>> used unconditionally given our toolchain baseline.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~Andrew

