Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287AA606A326
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 13:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=ugEz74sR
Received: from list by lists.xenproject.org with outflank-mailman.1476618.1682641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPK77-0007PC-Rk; Fri, 06 Nov 2026 13:36:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1476618.1682641; Fri, 06 Nov 2026 13:36:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPK77-0007P5-O0; Fri, 06 Nov 2026 13:36:17 +0000
Received: by outflank-mailman (input) for mailman id 1476618;
 Fri, 06 Nov 2026 13:36:16 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xPK76-0007Oz-Bh
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 13:36:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPK75-006U8v-Dj
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 14:36:15 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aedd7cd-8faa-0a2a0a5109dd-0a2a450ae706-6
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 14:36:15 +0100
Received: from [52.101.52.68]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aedd7ce-f2d2-0a2a450a0019-34653444ead0-3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 14:36:15 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA2PR03MB5883.namprd03.prod.outlook.com (2603:10b6:806:f9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 13:36:12 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 13:36:12 +0000
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
 b=s5PX6lraQzHX+bEu5ClWTtu4va+MvmfOVV3lNWWCA6SqMbV/2XuFmankfHBBeBUry5kjkKHOYvNgO/bcN84ZQB+WTBFHEwyK/lbK7Bk1jG1l9BLVWX1GsR/mJk0wpz89TOS5Djhp9gaLopfjvrNayGYD5kFiQWLx2cJ0XH2s8SjhQSLJ//z6YxipbszLw9e/nRgq9LWMcpEDEqgjUVV/uAeQJEeogsDTxMEIoD49iPMPMj+S4iRo5muH7q3QGn5gnN23y0rixXjYwJruSRSsq7MMAqo7JO4Au4bQHLf/QiYyRllMMCDm89UGMDFIahv+Cx1T0I9S1deifIp6DNP6eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=erzpezTwBqVmoUW+km4miwxa18vvXmDgI3IQxTdV4R0=;
 b=AY1gmiP5DB1YtFPYwAcXLpUUG77obotn7E9abCwntxfZZrW5+YfZ+v6kvIWsOzZwE2zct+uhtNh58QLuf/WH/dIqlrGg70u1G1BXWvC3ZjGNA07gibToCnCaAJVW9N1ufStLvSklyeztjThecOnRtMcionKUeqhPkxzuTyp7GuOBwCCQ8KUS4sEo3HtAd2RiFGuag8K+vyANXgp/BJjjCY1e35BOEL0FerI7vu7VuxwWpQmQF6H3YKfSNdxPz/oW6Br3fsyMEPBUwjxYQnVYpYeln8q9AR7Um4YhX2DwiYX6N4rakmhgP0CoTvVGh8c+NqCljBChJ019SJTUoxh5YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=erzpezTwBqVmoUW+km4miwxa18vvXmDgI3IQxTdV4R0=;
 b=ugEz74sR3qQ/F5SNXABKG9zKP9U0wBzrA3IdmW1ARD+FMKmn3PBeJvUDRNB4cazpwbTeUtr4VhrhULZWgzfWv9jQC/6MZYhRDQamT7AKS418g1+lJ+Oa6x+68n5Xo6jD5wHpvHvTmskvbHt/hcTOAl2EhjWkHiwnQpBmOYgZGg0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <91314054-b75e-4429-9358-c9bc95b40ecb@citrix.com>
Date: Fri, 6 Nov 2026 13:36:08 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jason.andryuk@amd.com,
 jbeulich@suse.com, roger@xenproject.org, teddy.astie@vates.tech,
 dmukhin@xen.org
Subject: Re: [PATCH v1 11/28] x86/hvm: introduce vcpu_is_vlapic_tpr_emulated()
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-12-dmukhin@ford.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261105013347.719392-12-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0441.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA2PR03MB5883:EE_
X-MS-Office365-Filtering-Correlation-Id: e4aee832-18da-4a8c-a9a2-08df3c0aec20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|261102123227099003|261009223027099003|261028144727099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261026121527099003|261026140227099003|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	F5vmgvJlHul3YQrC/8sV0ivXTfu0dKSOMvRNwftwjFfHqmOOJxjTGTZ27fhCgPYIBA8WTTx6t1/BmBpFHvi5tRokknSugGGHPMQbxoAPOXxORb4xMwOJgvUymci+hGuXcs4IfvwbXohlM8aYoFzYy2VNS0FndLQ3I6/bygNm0eBlWtZ3syjaXtjAK1HKFMPye085ApETDc91lLrT1TPgUhgpL4ATO7i/XMRD8MBxmvEwuTIzXkqzdic/dUvc4WdhY6Kz9hNWij6VFzuOrqZkq/KKbraouDvAxg6QT2HRrwCqJ7WEIl44PDL3an1EZXOl0M7b1rfhp4liKHXg/hP7SghUcZrFOnQrnmcpkiWeO1d5a+N3OoOYVBsgXOFYpg8GedtKMxEeYDvzapsIPbXPu1EE1sfw6tsawR5qY6yd2hOyxtfJ1t9PH5mRaCG0GX6mlL7PFbmKGzZ9crSL6Cse/Sr5rgMZdNhNQaTb3rVGwsqhEpAY1IKi2JkaHkJbvjKUt8QQnf2+nzkSjHICwt3WFJwY/ptSvlCYudRvJFHuS3XBrArzJ0Jwt6ypIsywQ8hmyoCPF5n2OY5fcI8L6IsUgR0PP5+R0HCv0LugHvlWg8deMDXZzyaeh0Kb/cRtsNf0MWOIkeFqlx4NA3dC9+Gw+VPqA8lUSynNUgccYtsJcxI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261102123227099003)(261009223027099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261026121527099003)(261026140227099003)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blpNNmROL0QwZlFCYk1ISW9EM0JWSExmSXBEZit3VmcyaHluNTNDT2h6MWI3?=
 =?utf-8?B?NnYwa01xNzRGKys5WElqSWw0b25mN2cyNUFhQ0NvQlhkcDBMK2RhRHNZLzhu?=
 =?utf-8?B?NUpPN0RlWklReXRqbjR4amRrd3RwL3FJaHFldXZKTVVCRTFXekE0a2tPY2dK?=
 =?utf-8?B?L0hkampyQ1I5RGU4elQ0dWNXUUNoRktHZ3FrcUJTb3ZtdlNGeTdsZTlydmFl?=
 =?utf-8?B?Zy8xdzNXTSsreG52ZUV0eFNpUVlRendQbm9qQzkrVzVKUEFOMXNIdjg2TG53?=
 =?utf-8?B?SVQ4eXZRWElrUGVNby9zbkMxWFRsRy9wdERoUGtzNjErdDl4Z1Ira2FuVGk0?=
 =?utf-8?B?TW9ONm9CRU9KalFKR1g5WmZ1cHpjQkxjV2hLbmFTdm1lcFdLQkRFdHNzVnNu?=
 =?utf-8?B?b1k0M2NNNjZmcG9EYWpJQ2h2V053UnZPcTk0K29VVFIrT0NmL0tLRTRXRnlR?=
 =?utf-8?B?WEI5dTFET3BxS0pvRDFvbGxEU0FyS3JFVzNmQXhsUmhKcmZiT3BvQTFNeE5H?=
 =?utf-8?B?VTBTcEt3UGphQW1yVG9KUTY1UVJWQmV0a3RaRVluRVlBNHBZQjdMR2JxaDZz?=
 =?utf-8?B?eFFrRTV1K2RvYThUUTYzTU8wMCt1YWNOY08rdno2Um1qWE1IelNwS1BGTncx?=
 =?utf-8?B?eTZKcStKdElTNDlGS1FaNmw3MEp2SDRyd0tQUTY1bmFvTHRSMC9pTVZ0aW9S?=
 =?utf-8?B?K2JlRFgrdnJVWGdVVnljWWNCU1ZaaG9rREFMQ2lUNU5yMWROdDVBQm5JSy9T?=
 =?utf-8?B?SmdoalI1Uk9HTUprdCtsT0RhbUs4SHZKaUNRWmFPV1hzekhEaUVjR2k2UXpy?=
 =?utf-8?B?QnVjK2tZeGJWYU5KN1ZOWFh2SjJaRVR4aktya3JieEIzSWowQkUybW0vVHMx?=
 =?utf-8?B?bXB3aTF5ZnNDOGNGQ0Y4YzJrNGhhMWhwbksvSjdTZFNsMXV1b040cUZzcXJ1?=
 =?utf-8?B?SXVXRU9vUEYyK0JkakFySk00T2h1MFM3b3NKbG4wdGF0TXJYcjFqVEN4Vmlo?=
 =?utf-8?B?NnNxME95aElpNnZsNUdsNFBsUkViWFQrc0x0Z1cwT09NYU9BTStocGNlUU1B?=
 =?utf-8?B?bWpjV2diaWhyaElCSmtIcS9HbjA3WnVTNUNCWlhQM01FQnJaQktsYU1OMlIy?=
 =?utf-8?B?NDE2SVVWZUZVWWYyM21naEtBSFRPREl4Y3hKU0hnNmtuOUFCZDZJZE1wSHZN?=
 =?utf-8?B?V21ONFpnSmpDck5OcExpalNZSk5jQU9FZDJ4dGMvUWpyNWVYTUxGK2o1RUIy?=
 =?utf-8?B?M1dnM21QeUozRUZKKzBmL0JIRlQ5ZHhXcmNqMXdTVWNwRS93MGttWkowZjZ1?=
 =?utf-8?B?ejhtSnpnTUlMS0lsTVFrS2dUVUVyOXdhOW5DR2oyaGxIUE9WOTIvTWloVmR2?=
 =?utf-8?B?MEcyQkp4cGtvUWRIVHAxc0N3NUc4bnNwUTNBb0xaRVFDT05FTFVGbHg2TXhx?=
 =?utf-8?B?R2IyeFpUdlc3TnVwZ0xDRG9WR1h1eDJxWmxqc3djZzUxelVyNG4yQVhvYis0?=
 =?utf-8?B?Z3FHRTJHUTZ2aHVvaHo4TEZRYkdpcFhiSWZkdFlUSysyTEFkTHJjQ0htUS9k?=
 =?utf-8?B?WnRBdGtiVFArNkdaSzFTLzhsalVnNnhrREFFak14RXAxR2hMcGJVaWo2Si8x?=
 =?utf-8?B?L2c4blYyMU1OK1Zsa0JXdnRGVDliUG9iY2xyQUVTanVXRE9DZXpFVHdhVEdp?=
 =?utf-8?B?L21veE5HbGRaL1NLY08vZ3hmMFl3ZElnTWFiU2UxQXJOL2lLMWdGczBMNXlD?=
 =?utf-8?B?VlhpUU5EUldFQ0p6S3JiT3k0dnoxcFp5UURXQkVpTmZaKzRYM1VwSnlJaUtp?=
 =?utf-8?B?aWhMeE5uNk44OUlJbzd5TERYY1FyTjYvQUZsbzBFSnVJZHM1TDBnYXFkQksz?=
 =?utf-8?B?ZXEvMjc3NFBzV1Z5NURrVkV1dkkvSURNak1YU2hVbmtCdXRVNkgyeXgzQjZv?=
 =?utf-8?B?VUd5YThVbk91K3JwNC9qd292YUQrMDFXbjhBaDRONENWZDZBeWVwVVRTYlZI?=
 =?utf-8?B?NEd2UXVZTUwxbGVJVy85ZjdGTjVYTnN5MXNyNGEwWFpMa0N6SFBLMXhGRDBq?=
 =?utf-8?B?ZWlWMVJERGVWS0F4WUgwWFNnaUs5RGRoajNuTHJiTmdSaFRjNXJNTWt6aUJD?=
 =?utf-8?B?Z2dUc21CcWt6Z0lqRFRaN0V5STRUaE9PaE8zSWpWazZuTlhzTEY5ckFuNVJk?=
 =?utf-8?B?VU5pd2ljUDRRY1JlS0wrNjI2RUdpSHBrTkhXdlpuNFYyMjFRbTVLTzRxWktC?=
 =?utf-8?B?RFNjYlYvZEVpWnB1Rnp3TFRDbU9nVjRrUVBLL1k3dnJOU0F3M2tSRzhuOENz?=
 =?utf-8?B?NWRpYS82a1EzTlRtWUFZaFdJZkxkM0grM0k0VjljU25ZbHN3MmpSdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4aee832-18da-4a8c-a9a2-08df3c0aec20
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 13:36:12.0532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GhGcdZ1c+1Lc/jrUKPlBPb9t14Xp/oqaVf6x7dYCZ9tQb5Tjs/Or5FMkWOcSdxSajd+sMGX5ISyPvbWAgXO6AiEOqE8h9awbhZIJy0O4uxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5883
X-purgate-ID: tlsNG-4011c0/1793972175-4B0D9CFC-2C0441D9/0/0
X-purgate-type: clean
X-purgate-size: 6728
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 05/11/2026 1:33 am, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com>
>
> Introduce vcpu_is_vlapic_tpr_emulated() in genetic SVM code to account
> for the case when platform provides accelerated access to vLAPIC's TPR.
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  xen/arch/x86/hvm/svm/svm.c | 38 +++++++++++++++++++++++++++-----------
>  1 file changed, 27 insertions(+), 11 deletions(-)
>
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index 673c818a0039..14a86ca4ff8f 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -925,6 +925,19 @@ static void cf_check svm_ctxt_switch_to(struct vcpu *v)
>      }
>  }
>  
> +static bool vcpu_is_vlapic_tpr_emulated(const struct vcpu *v, bool force_noaccel)
> +{
> +    const struct vlapic *vlapic = vcpu_vlapic(v);
> +
> +    if ( force_noaccel )
> +        return false;
> +
> +    if ( vlapic_hw_disabled(vlapic) )
> +        return false;
> +
> +    return true;
> +}
> +
>  static void noreturn cf_check svm_do_resume(void)
>  {
>      struct vcpu *v = current;
> @@ -933,7 +946,6 @@ static void noreturn cf_check svm_do_resume(void)
>                          v->domain->arch.monitor.software_breakpoint_enabled ||
>                          v->domain->arch.monitor.debug_exception_enabled);
>      bool vcpu_guestmode = false;
> -    struct vlapic *vlapic = vcpu_vlapic(v);
>  
>      if ( nestedhvm_enabled(v->domain) && nestedhvm_vcpu_in_guestmode(v) )
>          vcpu_guestmode = 1;
> @@ -959,8 +971,9 @@ static void noreturn cf_check svm_do_resume(void)
>          vmcb->cleanbits.raw = 0;
>      }
>  
> -    if ( !vcpu_guestmode && !vlapic_hw_disabled(vlapic) )
> +    if ( vcpu_is_vlapic_tpr_emulated(v, vcpu_guestmode) )
>      {
> +        struct vlapic *vlapic = vcpu_vlapic(v);
>          vintr_t intr;
>  
>          /* Reflect the vlapic's TPR in the hardware vtpr */
> @@ -2538,7 +2551,6 @@ void asmlinkage svm_vmexit_handler(void)
>      int insn_len;
>      vintr_t intr;
>      bool vcpu_guestmode = false;
> -    struct vlapic *vlapic = vcpu_vlapic(v);
>  
>      regs->rax = vmcb->rax;
>      regs->rip = vmcb->rip;
> @@ -2565,8 +2577,10 @@ void asmlinkage svm_vmexit_handler(void)
>       * NB. We need to preserve the low bits of the TPR to make checked builds
>       * of Windows work, even though they don't actually do anything.
>       */
> -    if ( !vcpu_guestmode && !vlapic_hw_disabled(vlapic) )
> +    if ( vcpu_is_vlapic_tpr_emulated(v, vcpu_guestmode) )
>      {
> +        struct vlapic *vlapic = vcpu_vlapic(v);
> +
>          intr = vmcb_get_vintr(vmcb);
>          vlapic_set_reg(vlapic, APIC_TASKPRI,
>                     ((intr.fields.tpr & 0x0F) << 4) |
> @@ -3097,14 +3111,16 @@ void asmlinkage svm_vmexit_handler(void)
>      }
>  
>    out:
> -    if ( vcpu_guestmode || vlapic_hw_disabled(vlapic) )
> -        return;
> +    if ( vcpu_is_vlapic_tpr_emulated(v, vcpu_guestmode ) )
> +    {
> +        struct vlapic *vlapic = vcpu_vlapic(v);
>  
> -    /* The exit may have updated the TPR: reflect this in the hardware vtpr */
> -    intr = vmcb_get_vintr(vmcb);
> -    intr.fields.tpr =
> -        (vlapic_get_reg(vlapic, APIC_TASKPRI) & 0xFF) >> 4;
> -    vmcb_set_vintr(vmcb, intr);
> +        /* The exit may have updated the TPR: reflect this in the hardware vtpr */
> +        intr = vmcb_get_vintr(vmcb);
> +        intr.fields.tpr =
> +            (vlapic_get_reg(vlapic, APIC_TASKPRI) & 0xFF) >> 4;
> +        vmcb_set_vintr(vmcb, intr);
> +    }

There are a large number of bugs here; they're prexisting, but this
isn't helping.

First, these final two hunks are wonky.  They're necessary, but only
because of bugs elsewhere in Xen.

In order to explain, I need to cover one of the bigger sins of the AMD64
architecture, CR8.  See APM Vol2 8.5.2 External Interrupt Priorities.

Windows (at least used to) write APIC_TPR very frequently.  Microsoft
made demands of the hardware vendors, and AMD made CR8.  AMD invented a
register called TPR which is an architectural abstraction of APIC_TPR,
and defined it's access to be via CR8.  They even made LOCK MOV CR8 (an
otherwise illegal encoding) be an alias of MOV CR8, for 32bit software
to use.

AMD state that it is undefined how TPR and APIC_TPR interact.  Intel
stated that CR8 maps directly on to APIC_TPR, and that the APIC must be
enabled for this mechanism to work.  AMD do have storage for TPR which
is separate to APIC_TPR (this has been confirmed), and as a result it
must be possible to desynchronise TPR and APIC_TPR when the APIC is
disabled.  Intel's wording suggests that they do not have storage, and
"SDM Vol2 13.8.6.1 Interaction of Task Priorities between CR8 and APIC"
hints specifically that only writes are reflected meaning that reads may
not be.


Since the outset, SVM had accelerated CR8.  Furthermore, because the
V_INTR_MASKING controls both the host/guest EFLAGS.IF split *and* CR8
virtualisation, we can't run VMs without accelerated CR8.  V_TPR is the
storage.

This final hunk exists because we have no path from the vLAPIC code
wiring writes of APIC_TPR back into the V_TPR field.  But, it has the
side effect of always clearing the TPR cleanbit, and exists only to
cover an operation where both manuals say "don't mix and match using CR8
or APIC_TPR;  use one or the other".

When AVIC is active, the V_TPR field ceases to exist and is now mapped
directly on to the APIC backing page, without intermediate storage.


From the Intel side, original VT-x had no acceleration here, but one of
the very early features they added was virtualisation of TPR accesses. 
This covers both CR8 and APIC_TPR, and they both map onto the APIC
backing page without intermediate storage either.


So, the next steps (probably as a prereq to this series) are:

1) Determine the actual behaviour of CR8 vs APIC_TPR on real hardware,
including with the APIC being disabled.  It may well be different
between Intel and AMD
2) Use 1 to fix the synchronisation of V_TPR and APIC_TPR so we're not
writing V_TPR on every VMExit
3) Testing in place to confirm we don't regress.  I should dust off my
ESR test as a starting point.

In particular I note that disabling the APIC needs to disable all parts
of APIC acceleration, and that the Intel vmx_vlapic_msr_changed() hook
doesn't do this correctly for TPR.  I also observe there's a major
difference between the Intel hook and what you add in this series,
insofar as the x2APIC MSR intercepts don't get altered, which is suspicious.

Thanks,

~Andrew

