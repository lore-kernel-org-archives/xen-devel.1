Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64887C61DCB
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 14:18:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1402092.1637502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzxP2-0000Rw-DJ; Fri, 28 Aug 2026 14:17:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1402092.1637502; Fri, 28 Aug 2026 14:17:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzxP2-0000Rp-AX; Fri, 28 Aug 2026 14:17:56 +0000
Received: by outflank-mailman (input) for mailman id 1402092;
 Fri, 28 Aug 2026 14:17:55 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wzxP1-0000Ri-4L
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 14:17:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzxP0-00Ck75-HH
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 16:17:54 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a91986f-e002-0a2a0a5209dd-0a2a4504db00-46
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 16:17:54 +0200
Received: from [52.101.52.13]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a919890-b57f-0a2a45040019-3465340dbcbe-3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 16:17:54 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by PH0PR03MB5912.namprd03.prod.outlook.com (2603:10b6:510:40::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 14:17:50 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 14:17:50 +0000
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
 b=E4BWIYNkWkCbONWB9Cy/GD2s48fUN9iGNhJthzcFB1fFNjEheJSmmQWuYRawscc56FeoKvZZNpll44Oj6UTa8pt7IQ6NI5H7lRGXfLM/Rh4BAt6sikihVeaJJwL8CXvGlTa9oRpOm2dicdnhV13QEimE4+NuqFIhwid6x8gK7P6TdTJmSyphxYkDncROwzBnWeFUd3GBEsKngF09w8wL2wtg5dWpMbXJp8/wc/k/9Do8mPF+hVnvTmhiAGuwSRrL4YAMdLYTwX8VWby0nQyQi8/m/9xDcVgdAfl4uymIfxb4Da5/2SC8KaPBDb0rw5Bd8qd85r/2WOpIfUnVGKSEhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NNldBmkROthhhik+2AfVSo80QSOw0nX3PLZ+fPYZ1Ek=;
 b=mTEejXKZ9nA6uHo2q4k8hO6rq+26yGYlTpcKzdFyRdVWV6MK0AuT+Gj+wIuE8py7tdGzA6Qx24+ijjxWvMsdQLL5rlTxJBtYcZLbfq6dVyBKjH0cJizxwmmvD+K7x/aL2DcA1kONpHtINZ2udJOksWTgeGBvYzNyZLw3XrV2POgo0qFFowqQZZJ7aByXMkyZW1Iocl7gULSpT+yc6VyAdS6BAA/kLWqQYWPkB/nLTQTWbYtcDJp7gSrV+HsKF64jU/SbuY5TLQqp+2OdYjj94o2oqFff7X44SvSwXbWKrr1EXQ6+xmQ89KGf8jHUr6WDVbHkrlVjwq5yT0c1tmYk+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NNldBmkROthhhik+2AfVSo80QSOw0nX3PLZ+fPYZ1Ek=;
 b=c0ua/9zAXkSxbxYwRTuOw9y6rARCjziTUk9AE72iv/J/3jYHzuIWjjtERhpP2PaBxuAfYOGYl6TgREipXhVa/GO2CovRjbg9Cyf3TQ/Zgu0U+J/5E+InVE2Jd8J3Uh0D/4a+ZyD1lL2nOk6c/wsQO6hFc85AOOg8K5Wicf9ja0s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <dbfca751-4bd0-46f1-824b-43a9856031b0@citrix.com>
Date: Fri, 28 Aug 2026 15:17:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] x86/viridian: Implement synthetic timer direct
 mode
To: Tu Dinh <ngoc-tu.dinh@vates.tech>, xen-devel@lists.xenproject.org
Cc: Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>
References: <20260828131142.3986110-1-ross.lagerwall@citrix.com>
 <20260828131142.3986110-3-ross.lagerwall@citrix.com>
 <1787926292.8631fc262581453bbf619ec5b2062170.1a048b62786000c4f3@vates.tech>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <1787926292.8631fc262581453bbf619ec5b2062170.1a048b62786000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0633.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::20) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|PH0PR03MB5912:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f51433f-7bdc-4203-800d-08df050f2417
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|4143699003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	Ri3mXN46eY3cZuqzU6sktO8V8sYvGWvFx/5F6RZGjri7WYL4lvjQCuiWZ03SgQfXh8nY1OciOljJzmI72mRY5x1uCyeLEEUm0WUFUmyJU+mOhu8oHJEVmqnc/+6aj4XqQfImjwOIsKFtIWh5WPrV9r7/ZxL0CQS51+oDxWNEC13ldCNc/lOCh9Kz5lFGp1uQhtw8VmMiPm/kphWI9WBp+r+kSIeKo7dvLnzS0uGhKu+KoCKOjrcWm3OyOfSBc/ly0kgmfOGyxOiOq5zbQH94U5Ql0Pz9QknhchCvqAgAjKwVFnx4EuaaXkjCgfh0hYn2MlXPnsgd95peiwM8UT9VFlljv61O3jl8M0XXCZtgvSgYUrHu9T2fqYOi+08YBJ1Rp8UGGebHubvFGZS9iosB12NgsVY09/mpCyeJ2DEegCcLY7O0Y9TTtm4OJkaKqVNXgt+hRPr2lbAuEfphP5OBHCyxk9JCYCOlWvO81jUvV60BtEMPyyQPpdWjTHzI5KrtP1KY2reZ5TGehctthLjEC8o+2YtHrAED8J0RgivXOioZrHhFzIICFchUjYFDT3W3Gu+UAFMUhVkvyqkZGoTGhE55xaq+PmDbPZZGzg0O8lnxPHAySdplBYu4ZMD8mZURzM2yr8qcpYCGbwnx46OMFWEougph/YSKrEd9yZst8F4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NElBMStMUEM1NXN4M29rSzc2ZS9xQ05LTnhWNXlDVUwzcmdJU0E3NzJ0TTdR?=
 =?utf-8?B?OXh3U2lSaDloUVFoakV2bHZyMXdYSURDci9JZ0xEY00ramhkaExSMFVRMS9O?=
 =?utf-8?B?b2JNZ3dySlFYaXlZcFhsMzVSVEw0MGJicHRMaDV2b3hYS0NUYXdMTWZPaWc5?=
 =?utf-8?B?Q0FIVm9zcU90Nlp5Y3dVT1pURGlxWUkrZjJHM2FNTjA3Ti9uZUdiMmFrdW9v?=
 =?utf-8?B?ZFlENGJnblBYZVQrQXRFc05jQXNDQVo1UldZa3NmdUllNjFsM1lJMFBJOTRF?=
 =?utf-8?B?dlp2YmdqZ2JBWXJJKzdhWndLVUsyM0syT2FDQ2hIMExGVmhsN2ZRdHFaRmxC?=
 =?utf-8?B?eEF4Z3BScEhBK3JyVlo2MTZ6ZnMvSzkvYkZEME5CTmJqVXM5eXRROTJOcmlS?=
 =?utf-8?B?cnNQaEF0Y1p3dGhlb2FsSFpVR05WYkdWQ3JHc1NPU0JPZHdzb0FlcUZiN2Za?=
 =?utf-8?B?N0o4Z3BQQzRyV2NIWTd0YjdQdFdlbUYwUGU5OEJ5Y2ZpcDA2R3VSSVI4dHFu?=
 =?utf-8?B?dXZsVmFqQVk2SWlZb2dSOEp3YkQyUkw4OUFNakR1ODRlYmpSL2I5ZE1COUF0?=
 =?utf-8?B?MElKOURlVXhFRExTbmcyeVVpUGZzOXpoWkQzYlNycnhzS3pJYVgvdU8rZFhF?=
 =?utf-8?B?SUZPU0w4ME9WNTZuZW4xMk1LRWNBN2trOEtZL1o3MFk2bjJONHA5V2NRQXM0?=
 =?utf-8?B?RmdtOHhZZ000K3lpR2NSQmlkUjlwZ3NnSWpHVWdXOEl5UWR0S1l1eHgvTGwv?=
 =?utf-8?B?WDhMbU5rWjRBVitWaEgzeVIrYno0Y1FMaGs5blJ1NnVVQmNnVDU5ckMrZk1M?=
 =?utf-8?B?Wnp5b1pjOVl0b0cxNndnUnd5OExCZHE3WXR6V3pETTl2a3UvdVlaWXlYYUo1?=
 =?utf-8?B?NTE4a2R2VTdYUTdjMGF0OE56amoydDYvY2RqR1pKNGtwOVArZTBjK0VweG9H?=
 =?utf-8?B?SDlMRDRmMTMzdm9OejZOendDZjVzRVFibmM2TXVQalN5cXZCL3dGMkVBUjl4?=
 =?utf-8?B?L2t1WVJ3QU5pTHpPRTVGTUVhVkJHbXN2Si8vNGNRYUpqNEw4dlpGMUlNeEpi?=
 =?utf-8?B?V3ZxakZDcmlIcjhrdk83WHc5MkdBQ1cwNWpFZXoxY3cyd2dLRGZMdHNBbTRa?=
 =?utf-8?B?eSt1ZGlnYURqRmN1U3puQUc4dXhBUEl5bTdjWm14V2hVYzJSSVJtRURaVktn?=
 =?utf-8?B?Zm9oV0pjM3dIdFpDZkhrRUZVSkFhQWl6UUpsZzF0bFUwY3ZianI3Y2M4ei9j?=
 =?utf-8?B?ZEtyaEU4QmYzMGIvSWZHR2x5RElhZWd1VkYybXpCd3llOUR0NTE3MWVndVpH?=
 =?utf-8?B?elhaSEIvUzhyT0RNS0xRSGVqWDYzTzRsNmpRbHpieWRaajVTelpndnprZy80?=
 =?utf-8?B?N29JWlBWK3UvcktIM294VzI5SE40b1h4bytsdFdpVjNIbW1hZFhucmtndzI0?=
 =?utf-8?B?YnhsTEprL2hjeVFRR2tCZjhpU3BsTHVKU0UrSXF3WFd0T1N1cVA0dXNwT2VZ?=
 =?utf-8?B?RTZUdlB3Z0w3aGNZVFBrZmVmNEgvR3VjWXJSMjArWlR1dUhiNStNN2ZYKytQ?=
 =?utf-8?B?VzBjblBpb0ZVcnVVdEdZYlpWeHJwY3o3MTN2Z3l0aVZiUkdPN08rcUtuTmQ5?=
 =?utf-8?B?OU5CQTJPSDcrelB2RTh1THJ2UTVpZzFWYmkwbnpXQ0dScnBRdCtzcktHQjNI?=
 =?utf-8?B?WkVPS1FEWTI0NFRiR3kvTGdrc1NkS2ZUSGcxY2lCUzJTTExQcklDcnVrYTJ5?=
 =?utf-8?B?TTlITWtRZ2hjeWZoQkxtQjFUU21lTG1nMTVYTERyWE54RUx1Y25PbEJjZU9R?=
 =?utf-8?B?VzV4eGpmZUprRzlPbTZENWUrMnFmRGozY09hUWpEQnZtUmN5b0pTbDdXOVUv?=
 =?utf-8?B?MnV0NzBpb0xwL3hYYU9BN1p6QXZ6WVhDRGtHMWJHUllJNXJsWTFBbXMzbGo3?=
 =?utf-8?B?bTlOSmQvOCtvNW5QenpyMkJ1bFp2Z2d4VHJnb25WbnlUdkFaY0R4b2w2MjJi?=
 =?utf-8?B?a1NjQzVtSVRqZGJRL1lNY056bUc2UmxEcFdxTzRBamNpY2I1K0Z4VTBDbTh6?=
 =?utf-8?B?VkxFK2VLbGUrOGhRbUdOL2o0dmZjOXJZcmFKWkg1SUJINWpJdWRaZmVKcmho?=
 =?utf-8?B?N1VYOXJkKzVMYWQ4WUkvYkRVMzAyVldYWndiNS9EWWttWmloTmxuN1JHTzRW?=
 =?utf-8?B?Yit1bXpEV0UxT2U2V0pyeFJtMXhDcG9qd1BMemhCRnlOWWJ1NkR5cTg2VTR1?=
 =?utf-8?B?WDdrbWp0YUVwKzMxQ3JDSlhjMklvcXFRTmxZY1ZqR2FCTERzVUpWZDgzMXlj?=
 =?utf-8?B?SDRjUmt5SkUzbnVsV0NpTWZqLzZjYlVZSUgwWlJ6a0hEbnNkNXkyMzlzVVV2?=
 =?utf-8?Q?vTrcR5nrzVGiswqg=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f51433f-7bdc-4203-800d-08df050f2417
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 14:17:49.9787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uNVVUiMcWI3m1ew9n+8aCoKertMRbZATlNHBSusKV0BMrUA6ZNkPdqlbYviVCYZ4c/oU5BXNgtZdphICPfQ0wy32yS5EXdLeGCusv7eDubM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5912
X-purgate-ID: tlsNG-ebf023/1787926674-51ED6B50-F8073EDF/0/0
X-purgate-type: clean
X-purgate-size: 643

On 8/28/26 3:11 PM, Tu Dinh wrote:
> On 28/08/2026 15:14, Ross Lagerwall wrote:
>> In direct mode, the timer asserts an interrupt on expiration rather than
>> using a SynIC message. It is useful to implement this since Windows 11's
>> Hyper-V can only use synthetic timers in direct mode.
> 
> Hello, is this new behavior compared to Server 2025? What happens if
> direct mode is not available, does it fall back to disabling stimer?

No, it's not new behaviour. According to Linux commit 8644f771e07c it
has been this way since 2016. If direct mode is not available, the VM
still works but without using synthetic timers.

Ross

