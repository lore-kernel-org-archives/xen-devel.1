Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50944C79FA1
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2026 15:16:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1410941.1641746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3b4l-0006b0-IX; Mon, 07 Sep 2026 15:16:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1410941.1641746; Mon, 07 Sep 2026 15:16:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3b4l-0006at-FB; Mon, 07 Sep 2026 15:16:03 +0000
Received: by outflank-mailman (input) for mailman id 1410941;
 Mon, 07 Sep 2026 15:16:02 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x3b4k-0006al-Gv
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 15:16:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3b4j-00ACV8-TC
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 17:16:01 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a9ed50f-e002-0a2a0a5209dd-0a2a450cd178-46
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 17:16:01 +0200
Received: from [40.93.198.68]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a9ed530-f479-0a2a450c0019-285dc644ea79-3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 17:16:01 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA2PR03MB5705.namprd03.prod.outlook.com (2603:10b6:806:11a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 15:15:58 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 15:15:58 +0000
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
 b=TV5QItgNMRiZVuGiSXMdm34Qj1eTF/m+KTf+Xxk0525u6hX9rdLhJ/f3TC8guB8B6vtqedYVwfbsUzrd34OfOffHtw3VTQUmnUeoLStAKS0VSiLn0BqYUH1B2znokNTo5FJwhdfNqDCz1zLLWuQD70JyNwbBp0VxoUezH1sqA2M3p4p0GbpHbonkzgZSs/czvTP4WFjDZDBasCTrrGttngNixHUEvgGLAgT5wmdNZpzQs6Ww6N87ta0oiJgKUCMwenkXM+ficUacM+j0WUAjyW3tZD1j5EjsikGJDgekv5kAGkURUFUu5QHQa4ZKUzmFygaG5gZ+GwqdHHWsK618bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9d7RCEnJ7qkoWNu6bXse0/3RGXFhgVEUq560o+40iGw=;
 b=INBWVxXeBW3nRBoOEwst7K/o3xMQxC67+0yHDdemBq4Jb6jn40upZboeBrge08Otih1H9Msvd9d1kOM89a5aQdtyFIeAfuRRseX0xJNZkCr/CL5NUEm42sSqZo9QozeDxR2wliL+ck8AAsrqTDNRgSR1uKG61Cc/Y74hReNNm9yisqJEHLnl6V0fjVlgi3MMo1cccKZKQGINmM6TsxQguMuaf+9+gNIAjdx/KheYmnBU9BoH6NWCNhvATuNwH47vvt324yEHGDdJeb5ZNuUCUUJIvd8/BgwCZJvKp1DqZsZyxpQEuSzr5vZ2EEaV+TW8Wt4L2mNVgojhpLrc2tEbOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9d7RCEnJ7qkoWNu6bXse0/3RGXFhgVEUq560o+40iGw=;
 b=Gp6aG4YUDYl3m5Y0XvVeqZTUNGkWUgxroihOxy5qJQyrD98GR3iqNlAf+IMLNG4bpRZ+QDVp2XOeWUk71DdblV1YRjT3CtOk9hsod7UYdMuQsUxqZzOCVxbhRFCSj8thG6GLHvFZh5wF7vNrVh+MXuJRbGLU0ghMGq9ni/BwPOc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5a3b475d-6c1f-47da-89be-ae45e34c4e49@citrix.com>
Date: Mon, 7 Sep 2026 16:15:54 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
Subject: Re: [PATCH] EFI: don't use alias attribute for compat hypercall stubs
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4326ea69-572c-4a1a-ba89-147fab55b2d5@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <4326ea69-572c-4a1a-ba89-147fab55b2d5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0095.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA2PR03MB5705:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b694d65-60ad-488b-21e2-08df0cf2eb44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|6133799003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	q/uxnTi4skFYPawT6p/cyTID39qJ1lwrPxDMv7749ggVIS8SD7yKFV+JpNX3du9ylOlNXk3tC790SIiooNpWw49ZkRvt77k1dbeicDupeSD7xDeSMe1DjKDiAtzD3UnqxDHFX9tzBoDtqX44JWfm7TzCi0bJArKbe+huU8z/nzQSS83kgl83UD656UVNWax+RvNaW08yB2J+8+rik5WVtLerNAPETf6XJzUi/W7OM/r0AqwNWgXxKQPCniCtKcpb6U6zZj+sFoOchJ/yp+PYDEtQUtM8TLvzRMKHpN4YhowtC+xedOFpWLfMAC8drIcpHwbz0VW6CAzYVIWkEggEl+rcI1VIx3phNTG/UC21vucCkaa+QeWvkEUHuHJz22Ue2ieaxBwqvzUUgd6oRkoEABRwnvgx5VjrSjiU3ZK4Y9vOcFCPKBnd0BMmcBR6kWwTUDnRm1Ak9rj8QPm6N4TYFkVQ1ymj2zb2bVydrIOtXl4BU5k4rNavxQLwPgx8JuQtDM2KwAWzQgJZT1T+zLLiW7BxDjnYWkmdC3HMEntjtXQm0ajGrfuZ3+JM6heNWYbEWaMTQJximASTDGrsSlNsoQUIt5E44FOIYMhmQ0oVtEVIHKe6iwCYD1I458jgWZD0IvS/sCzygvQQbVX57pCjJz/w8dN3RtFpZ+kwJTMYMTA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVlNSjR3aU9aaXNsYlduNm94c2lyNTE5OUlXbXlJNk5oblNTTC9hRkZhSWdp?=
 =?utf-8?B?L3dUdzltb2hub1MwVEsxVjdrdFZTU1B6ZW5CSlp0dHpvN1paZno3SmQ0bVJi?=
 =?utf-8?B?YlM0clpHOFhIWHBVemc4SWdQeFoxdEVpWlN6a0dvQ2RIU0ZUeUU0empCbEMy?=
 =?utf-8?B?d0JkY3RDd0IrRmNoUE1rM0ZZWWh6bklyckM4Y0JhRzE1SDdXNVl6bXVVekgv?=
 =?utf-8?B?YmdPTnhQa2d0OFdRajBPT29kdmdMS1R3elJYbUtKa0RGVmRVTWx5dlJZdmZL?=
 =?utf-8?B?RHpyRTgrVjYzVnZSb29iY0ZGKzc4cFBCckFadjJVUk93MGFnbFhGTkk1cEVi?=
 =?utf-8?B?Z1VFZVk3ZHZxUkdBRHRGelkya092M3JORWZrZWt4aTliNXo0TG1YOUZkb1py?=
 =?utf-8?B?U2ozNW5TNjV2K2Y1dU5tMThCbUlUQ3VnUlYwdnFYRFpyNDNPSHV6dXJ6RlNU?=
 =?utf-8?B?UEt6NUZyeVUvUHNZZ1NwdmpsSzJSSUJ1UUYxeDNISHp6R2p5NHBRWXdmRTkz?=
 =?utf-8?B?eFhiTmpNdE0yZTlMZ1V5ZHJZRXUvR1NZWFAyY0tiekpvRmVuVFpsMGx0ak01?=
 =?utf-8?B?a2hDMkNlQzBacEt4dnJQa3hrRU1hYms1UFlaUVNlTXlrcldBV2V3b29QaTNM?=
 =?utf-8?B?VmJWaTRGNXVMb0Vld0oxaXZxZk02Zk8rY0VpaW5aWkVFRlhYN003WFRzNk8y?=
 =?utf-8?B?SWlaUGRyYXY5eVpjdkxnT3JXcFoxRWZqK1FCZXUwNDFXaHhHSkVmcTA2ZTJ1?=
 =?utf-8?B?YTJnVnEwcGl5UDJrS2l5L3UwVUdhdHZjUnRQY3lvdkZsaHhxNWM2TUYxKy90?=
 =?utf-8?B?SXFJNzJGYXQ5dy9ITExQVm5CL3FubExSYmZhT09NL1NxNEI2eCtzcHJwV1pZ?=
 =?utf-8?B?cWlUWUNGZDQ2TWJrTGt4VDFoNktLN2RoRE1pdlQ3N2NwTHV5R1lhUk52cEk0?=
 =?utf-8?B?cGcydGlseDdlOWI3TEg0OUFNcDFub2lJYU9UTlQxUU8yTzUzZ0xGYlNJWWNE?=
 =?utf-8?B?NSswZEpBZUhkcDE4bVhFR2NMY28yVWFQbmdRdmtaQnNCd0xGb3c1TGEvYTVs?=
 =?utf-8?B?Y1dUQ2NBbHFMdFFhcDdvNXJHTXM1Mm9oR0hNZVgwbjBHc3c0ZGV6SmErZlRt?=
 =?utf-8?B?NisrQUxaS2JNV1lEUitteEdlNUZwRnVGSkVDa1dCOUFFNC94TGJwQXNydXZZ?=
 =?utf-8?B?K1VZQzdYM1BWakM3OEVRZTlvMzJ0VFhBNGcxNE84cm9kdmF2MlJpRCtNL3ZZ?=
 =?utf-8?B?UEFleE1rT0pEUzkyVVB1NEZlUjhPUjZJS3g4dFJDTURqODFPOG9Td0R6Tk1Q?=
 =?utf-8?B?dU9GS1orVkp0NEo2QVpOZStaSDlHU01DWTlFQWJMVVM4YVFWZUVUYzJYZkdw?=
 =?utf-8?B?c3IxWndiRmxyR084UG4vR1R4M1VBallYNERHUUNyVklVTjU1TWxZNUV1aHYr?=
 =?utf-8?B?N1hJcjFHMG5FQmJ0Skc5aDhpL0FaaEdjeXBaMUQ3Wmd0MVpvVHdkRW1wbFVY?=
 =?utf-8?B?aFFkSXg5Y0IvMVMxQUdPTTdXcHFNVHVpTEZxbUNveDlTNTN2MG9Nbjd1dm5X?=
 =?utf-8?B?VmdDNStyc0VkblUxVkJ5cHFlWlp4QVFLc3hKbkNFZTdFdzRyOUtyYktXVXV4?=
 =?utf-8?B?NzA2dFptdGY3M1JPMkQ5dGZkcEhqRmdqWEEwYi9wNFBZRTZxMzIza1BLS0Zu?=
 =?utf-8?B?UElhTGk5R25nUEphSGo5UFBUTDdyVTFsdDg5bXBtY092cklWeE5US0l6Ykh0?=
 =?utf-8?B?cnhOM2JwcWJqbm5BVDY5VDZSZmFzYUFuMUpxbERsVGxHUEltMWVaWmM5cmVy?=
 =?utf-8?B?UndRd2RjU3YwbmIzdlJ4V2dGSW9Ya3RTOUtXVXZINjIzT1Z5Sm5qVzFTdm8r?=
 =?utf-8?B?ZHZGb2lIUDlZdzB5Q1BIeUVhS0s1eUFPNW85U3hxaWE2NDhtREhuVkxvaUF6?=
 =?utf-8?B?bmUwREVDMXNEdVhaMkVpNElDbWt4Y0dBVURtbFlQZEFNSk9qbDFrcmZteUlE?=
 =?utf-8?B?aDRPTWxmN294cmpYQlk5dEo2Y0M3WmFHK2lHRGhVK1k1aForTjA2aHQwaDRG?=
 =?utf-8?B?RkdRR0tramxwWkpwV2JxZzNWNkJCNFgyNGp2TG5BZXlyV0oxSTdZWThuNFMx?=
 =?utf-8?B?eVFrYTNuRlRJQlhwcmkxbEtQSGZQa0pNdm5FaXBvUEdwelkxaVFJWVlGaWFo?=
 =?utf-8?B?NlB2MTdHQTl4MmJsbkdHeFE4a3hBWmY1UkhidzNzdWVLK1JweksxSmJMOEdY?=
 =?utf-8?B?RXZSdTNUTFp3ZEQxNGFIMVN3bHdWVUZDbVVsODRORUVnNGs5TlNVTGVmM0dw?=
 =?utf-8?B?WllIOW5QaFBjcE0vbEFxenpabSt4Ymc2MlI0d0pCTlhNT2VCRkd3Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b694d65-60ad-488b-21e2-08df0cf2eb44
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 15:15:57.9281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4I8PKKG/F1GgLxALXmqR7FxDsqoRVyLwP9+S0XW4J0G5seBcVEcHZjpVNn56R5KZCH2+sUX9Dw+v5G4pU0S9cAAx1gtw+xUMncGztIY/i/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5705
X-purgate-ID: tlsNG-d25034/1788794161-006CEA5B-052A99A0/0/0
X-purgate-type: clean
X-purgate-size: 302

On 07/09/2026 4:14 pm, Jan Beulich wrote:
> Recent Clang objects to types differing between alias and aliasee. Accept
> the unnecessary overhead and make the two compat stubs real functions.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

