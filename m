Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00BEAC61DC6
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:37:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401197.1636952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzcA2-0006iq-R5; Thu, 27 Aug 2026 15:37:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401197.1636952; Thu, 27 Aug 2026 15:37:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzcA2-0006ij-OD; Thu, 27 Aug 2026 15:37:02 +0000
Received: by outflank-mailman (input) for mailman id 1401197;
 Thu, 27 Aug 2026 15:37:01 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wzcA1-0006id-Oc
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:37:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzcA1-004llq-0R
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:37:01 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a90598f-e002-0a2a0a5209dd-0a2a4504d1ca-20
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:37:00 +0200
Received: from [52.101.57.11]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a90599b-b57f-0a2a45040019-3465390bcaac-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:37:00 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS7PR03MB5560.namprd03.prod.outlook.com (2603:10b6:5:2d0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Thu, 27 Aug
 2026 15:36:58 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 15:36:58 +0000
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
 b=nMoKXs0KzBdCujxnX5Cne3yegfvy666hBaY1r3JJmS9brwUFEYQ6dINnXGK9e1Oa32yB4FtpwS04IWRQoSDfL8N3jCOT/KqauUnrt406kHQge+ptINKmbhkvDBNKkv6qYT+LcT6sI93QGeXDRIj5v8YDR922Y7Y7lZaMwbOR26bF8XN+mOu6kg/hp9yql+ImCgkHV70J2mX6Cl9KFKWUMiwuw+UBMJw4IIEudp8e2zJHfJxkfB+ykP7MEheW980ABbdSJPCb2YllDRGIvtQBw/Y0dXysp62gqDln+C9oEmemDZZaiApBBcJLWeSPH68PH3o2yQEen/sfQyymmsZs6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RPWs7/g1X/Mu/0zIUh9LPX/o+wZB03lWsQp7pVaCrwA=;
 b=fkEth9lv7bNFued4OWYGnvjM5yRuuRpBXJHoertlKMK7qkEulr8FzJ0EFgw3SZqulkVoFcOP8XkzX5iBiFIP5cIFIJzZJ8d9l8t1LH85sTs5iPxMEJ61G3MHfvbTGDwnjx+brpPcgDxXPvDfIgyZH+kdR78nAGsswEhdUkVYthCT/QW7envsNxT+ElDlIQJdRXDnebIx+3QtEQpU82mfZjBl3Or+GTPLs/comnKw1aiJCSlOVgWXOSY9sl2l+OBKDAQa+IlV77VwI1/hAEEWYELnsH9wrbq8wxvHZ9Hc50AtBSP8GNs4tF+wUxlYzudJiSfJZkuvQXw8RnEr5e5V6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RPWs7/g1X/Mu/0zIUh9LPX/o+wZB03lWsQp7pVaCrwA=;
 b=yE4RwtYWHk8iBPU65bIjzMJ5i8A6vvVPVxjLhBjU8xnPfFFcuZN/GWhZJM4wY9y+/be3W5E08k+hIhVeSf0gCo2LWd6O9ZhICGBwh/RknYy4/pHiAEFWBI3q9B6YaE6a2PSGTcmwAstzrWHerBsXmC7XGz0vvzte5pc4xUBOJWs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <aded3bc6-6d5c-4c3f-879a-be428a8ad36a@citrix.com>
Date: Thu, 27 Aug 2026 16:36:53 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 04/39] xen/riscv: introduce csr_read64()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <0f7080ea4dc86a8bb3dae39d94e5b03e95d010c0.1787838835.git.oleksii.kurochko@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <0f7080ea4dc86a8bb3dae39d94e5b03e95d010c0.1787838835.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0136.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS7PR03MB5560:EE_
X-MS-Office365-Filtering-Correlation-Id: 4208fa6f-3332-4b96-035e-08df045107bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|7416014|10067099003|6133799003|3023799007|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	A86yzFM1iQO5pqXlW3JIgFZt/BathCozFDgPSnYCFiMUvzfGRFmbvVzEtak/UiNoGx4bT6iQTaTBU96qc2PkQ6RoCyon0NL6rPd+xbUhbQbGLWdjOjM9c3ieg7MMuNb3lAL2ubxs4H3UUu2jUXumtPw2YahOfNqWXBRTOsGG50AI9CJfvX7u7c8f8/4hrlGH7fOCMyO2H2I4M4i+yS0yhZDBh7Xwi/i//KLtmp86xaDLgaXz+CxWenU3jP5YwUH7j5oxWgjBYxch0P021pki5WnfW3D9kRf55PoJ64iNUmxkvIuP2oIhkTQj6jyfqjOUJQORVrIdcOy9/gXANSs5nxDqP9xpOA3T5Hx/R/hNn4Zev80DtTWQRj+PEpDQI8RWbKWoe0GEIvzMUGV12fXjyyK8zS4rmQE0wsHqnBP5f3wmM8WmHCgGwCB7oGh+34cXmo4gCYj0v3TzkjtU1coWPvRnvigqo+cM0tVuVhzfmRTsGQl0ostaEg6RKYPuaWTW5CyljMQbD5KLfQkpiXWbAm3uQHCC/0HlaZFBDFV5t9H0v1FaWVYCIn84WYJT9pHsy61pizAQNLa1XDxSBEaxJwgdH4N6GkPL6B+NC+vBoSFjrer48ybicF7RqOT/EO+H0270OGetJCdpTaStrTzn5r49pfKniBjygj/I8FDq7WA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(7416014)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WU5Ka0JBNk83NkZlVitCSjIwVXBYU3dnanhuOFVZY3FOMzhuaFlGOG85L3BZ?=
 =?utf-8?B?QnhrL3dGNWI3UVY2T29xRUZLRTE4RTJRUkdwWEgzc0x1VkJnN2VjQVIzRVA4?=
 =?utf-8?B?N3V1TXdIeTN5Y3J1VnlRQlM4dEFQVTNkSEZBRlo4ZVplWG41WWF5SGs1MVpV?=
 =?utf-8?B?eWZVN1EvNHpYUk1WNkNoTFJ4REJQLzMxUWR2QzQwSzNwcEtRQTc0elNtRDdO?=
 =?utf-8?B?c2dwUm40NG9OY013TEVmZW9sZ0hWVlAweldXek9WZXdTNHdNaGxJSFdncWxZ?=
 =?utf-8?B?bVhkTzRUcHgzRkI0bXlDVEJMT25RZ3B1bm40Znk0MGRIQ2JkeEU4RVBJWTBJ?=
 =?utf-8?B?aXVNV2ljdTgvQThObm56TEZpamY2cEFpWnJsOFBXTFRJb0FNT0RmczB0b3cr?=
 =?utf-8?B?bTBQYXNEaXJMa0xvSlpRaDVCNzhuTzZIcDRzaWh2MFhvMFJHRXZ6bHFENmlN?=
 =?utf-8?B?aHgzMHUxTEw5clQxV21QZ3FvODd6MkEyMjB5SDV2dGw3WEltUStFQkhZajFm?=
 =?utf-8?B?aTNETHpQWkYyUzFTdTJvZTNCeE9iQkh4YUZ3QmhqSFZkQjQxN3dCKzZBbTVX?=
 =?utf-8?B?ZmRWT1dsR2NUWHZ4WFk0QVJ3eHhBcGtzTC9wbE96Vm1uY1IyWTNGUkZBZnZM?=
 =?utf-8?B?eXpCV1gzeFNlUGx6WjRPdnM5b2txK1A2T25vN0txZ0p2eWt1NkdrQ09XeXVG?=
 =?utf-8?B?eHZWbVVMRUswTFFJb2ZsSUsrOGV1TVNPTEhvdlVtU3ZMM2NrNmpVbjcxRlN3?=
 =?utf-8?B?VWZlWjkzdHA2VUp5eGtzSS9zdFdxLzZOUUVWR3N3NzlXTHJKOEd1U0hVcitZ?=
 =?utf-8?B?VW43ZXpBZnRjby9FYnEyOWlodnhGVzZmQkJpTlFiWnNzWElJYjVaWUJQZjBk?=
 =?utf-8?B?MGZQSlNYem1UUEJGeUFMN01kdTl6VEZCU0g0emdtVWZpMUZ0TDhrc0wrc0hJ?=
 =?utf-8?B?YXlweHNTUmhmRm9qK0FpTVNtNEliRnFWNDVLSEdkZ0NyZ29veGZuWjZTRWQ1?=
 =?utf-8?B?c2RDSWlDWUUvUDZpbitxRXRZNEhwUnovZWp2S2p0cUNVeFNXMzZZWXZBUzJ0?=
 =?utf-8?B?eGxXbWt5OHBzYmVoNGdFWDcxL0JqWkFyYnN1Q2UrcVpjKzM5TEFPcmlnUXk4?=
 =?utf-8?B?YXN3WVg2RHk2Q0pIMm1nYmtOd0IwbDloNFFoTFFrcUkyUWh5bVQ1eFlwK0dM?=
 =?utf-8?B?YjE1ejFzd3IvdGhQcWVuVy9vdThsSlZERmZ4OFkvRGlhbVQyNlloOG0xVlho?=
 =?utf-8?B?dUFlck84TnFqUFd5dER2QjNOZzFpeW50RUVRNFltd1N5M2cvaTdsQ21TaFZ4?=
 =?utf-8?B?bzAramZDOXVrdHQ5S2V2dm5yZXRCYkZGeFdOUEYvNStvZnk0ZjhvL2xiM3JK?=
 =?utf-8?B?VlIzdmo0T1BBVDl2VDhsQWFwRWZucWNXNE00aU5NREhNYVI5NEcwdDlRYUVW?=
 =?utf-8?B?VW9PRWRRdlFqbVNTVFlQRFNLK2k4Tmh0YXBVR3hxUHBkczY1azZGbU8wdllw?=
 =?utf-8?B?Wk5pQllGREpEVGlKeTBneVVzaTZud0tESlUxbjNTTE5ZbFRsNXNobGtsYkxO?=
 =?utf-8?B?K2Y1SCsrY0lJamNnNGt3NW9pR0pnSXZVQ3dKcGI1YUdoUjN5dkJ2cThONGFh?=
 =?utf-8?B?dkpyYmkzVHdOWHhPL1hsck0wdmRHY3pnRHpQNXAzYUNFOEpydllxZmVpT0NX?=
 =?utf-8?B?dFdSamtuN3lVZkk2TlEyU1lrRGJBazRkVGdmMkt2NzVTdDRUNE5FMG5pcVpj?=
 =?utf-8?B?REhKMUczN3lWNEx2cGFwMTI3a1owRkRvUXJnK3BsL3lwOXRCYlF1TWc5K1I2?=
 =?utf-8?B?UHBCdW0rVmZSRzZURnFUL1NVYmRoWEVudXFBN0NLTzRVRkRaY2kzeGtoQWZ4?=
 =?utf-8?B?MEJNVVlLRmF1bXN3Ym93R0FhNXZ1MFRuZmZJTDJGczVYa0pkamNuVmYrQ3Bs?=
 =?utf-8?B?c3J3WjN2M2RBcEpoMVMvWnc3bGhkQk1qb041R1NXVTJUZVhSVzY1cGUyNlJZ?=
 =?utf-8?B?TkdJemlCU0dUZ25aV2d4ZDl2d2pLMUtzMjk0azkwNys2Si9jUmd5dUgyOEFh?=
 =?utf-8?B?UUl6Lzg4TVVUV1h2MWI4ZkFkVHJuZGN1YmgrZDFjOGN4K0EybVF3d2c2Si9q?=
 =?utf-8?B?ZllmbC9wL0dTdkJLMTQ1aFhkN0JWcFJZUVhUTUZ1bkltS3dEK1lvMnF1NDRy?=
 =?utf-8?B?Yis2NDJtbzF2SUJBV0xFR2IwSXh3YjRGWFJ1azd6VEt0S3dNOVhrYzdlZURK?=
 =?utf-8?B?cWxmclJMWTNvREZvTmxsbDZTU0RZOVYwOG1zZENCKy9uT00rZnlESWxjNFRY?=
 =?utf-8?B?Qlk3U0YxS0hKcjNaZGh3dVpudVdJdDlYelBobU5tVDhXWDBQank1QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4208fa6f-3332-4b96-035e-08df045107bc
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 15:36:58.0546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: es1ph1BhL27Z296R17CDhntnW3VdZYdZ6YTcxmKTcVUOqoPQ7edqz49Dw4hC/1FLM6LcRO148JZSWQr3LUlgn10zDiKDl4mgCrFbIrKEbeE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5560
X-purgate-ID: tlsNG-ebf023/1787845020-51CD7B50-CDD7688C/0/0
X-purgate-type: clean
X-purgate-size: 1582

On 27/08/2026 4:20 pm, Oleksii Kurochko wrote:
> diff --git a/xen/arch/riscv/include/asm/csr.h b/xen/arch/riscv/include/asm/csr.h
> index 888d6a2a86d6..a5cdd6f99c8e 100644
> --- a/xen/arch/riscv/include/asm/csr.h
> +++ b/xen/arch/riscv/include/asm/csr.h
> @@ -39,12 +39,36 @@
>      csr_write(csr, v_);             \
>      csr_write(csr ## H, v_ >> 32);  \
>  })
> +
> +/*
> + * The two halves are read by separate instructions, so a CSR which hardware
> + * increments can carry from the low half into the high one in between,
> + * yielding a value the CSR never held. Re-read the high half and retry the
> + * sequence if it changed.
> + */
> +#define csr_read64(csr)                         \
> +({                                              \
> +    uint32_t hi_, lo_;                          \
> +                                                \
> +    do {                                        \
> +        hi_ = csr_read(csr ## H);               \
> +        lo_ = csr_read(csr);                    \
> +    } while ( hi_ != csr_read(csr ## H) );      \
> +                                                \
> +    ((uint64_t)hi_ << 32) | lo_;                \
> +})

This double reads H in the looping case.  You want something more like:

hi = csr_read();
do {
    old = hi;
    lo = csr_read();
} while ( (hi = csr_read()) != old );


Still, this only matters for volatile CSRs, and is unnecessary in the
general case.  I'd suggest naming it csr_volatile_read64().  Most CSRs
can use a simple split access.

~Andrew

