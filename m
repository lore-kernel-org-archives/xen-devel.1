Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DA7606A31E
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 16:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=H10zMVqX
Received: from list by lists.xenproject.org with outflank-mailman.1464949.1675880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMSup-0003up-Qo; Thu, 29 Oct 2026 16:23:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464949.1675880; Thu, 29 Oct 2026 16:23:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMSup-0003ui-Le; Thu, 29 Oct 2026 16:23:47 +0000
Received: by outflank-mailman (input) for mailman id 1464949;
 Thu, 29 Oct 2026 16:23:46 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xMSuo-0003uc-I8
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 16:23:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMSun-00GfuI-Bd
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 17:23:45 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ae37308-bab6-0a2a0a5309dd-0a2a45068222-32
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 17:23:45 +0100
Received: from [52.101.62.47]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ae3730f-195a-0a2a45060019-34653e2f5872-4
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 17:23:44 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA3PR03MB8328.namprd03.prod.outlook.com (2603:10b6:806:460::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 16:23:29 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 16:23:29 +0000
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
 b=HoNDTcaigJKUmwVGQzPYHnAYx3FWgt+Mrx2OrXHSZMBmD4r2ddfX74mRvBh3nqW9Kqt5CyQwuYQOPVQKWxGsIDTPP9T0tsXJlh79xem6j+7h8ey+bP2SFrzBaLPu5qmYo/B6CValskdaR+Q1b+zUKWeEHYg2Ri4QnxlLeKUaVv2YbyznEn+c/vBLSe7sjB+YeE8xq4AkXw6SjZ0eTsItpgwSOhcKFxS8lwCApx+9uGUraqgdl0gvSsxYfEy9ESDbQ1ZyDiI9ECuaqPYwRHlK4ELjw3awXKUAC/EZhT/yOxntnMedFsvxRD5Tw9dILUkv73NM6ElLH+lIZ2xuJOd/ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZtXkUJqagZuRI3N4ziQiVOHnYUCntW69wcovVMbjws=;
 b=cLQA8abNQG06Q+Kh8JILJmbQ5QulEXGcHLujRJ7ElytZl/w5pdZR7byHAlI7hnLzSWsnbmaB2cMV5ZXSHhPeOnLvEwTr5bdkpcuwzOP5Ut7TzODLx+gfaaaTbxO9mClxU82Ag5WM/EQK36yvj6Dr2FxdRV6mtDBwHt+TtR0yESR9bJmNfHNGu+nANx7SaTTLmFYIeu0Pg+a1N49RR/0IRhSrvbOAQb1GFedh6CuGfXz+X6EEPuzS7DXsj1Gj7oF28jfZFVAAqcxvFiN25ZtfUO62jOxAM06W7zsecXIXMsKkj9/K4LaG60VNc0ZpIL6u5yX7LmLi/XGi2fEEZ04vjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZtXkUJqagZuRI3N4ziQiVOHnYUCntW69wcovVMbjws=;
 b=H10zMVqXpwsGr2a/RAX5Qu5V39uWtFugvhWF/s5L0WMDg+qWcG/xt/WVJzEydsz5X0RdfD6rfetH2RkUVwlojosQWWKC0GSluX4kkp54ahUK+Z0lTj3UnXfey2RYEsBIvshrlUIJj8OEjRd2zVLD95XW3W+Ey4xJ8kkGKYOziyM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <be21b731-f903-4334-95bd-99128a560d08@citrix.com>
Date: Thu, 29 Oct 2026 16:23:25 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH] x86/HVM: shrink (pack) struct periodic_time
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c9bb9cf4-9171-402c-b6d7-14ba45618c6b@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c9bb9cf4-9171-402c-b6d7-14ba45618c6b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0615.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA3PR03MB8328:EE_
X-MS-Office365-Filtering-Correlation-Id: fc10b952-29ec-415a-9dfa-08df35d8f774
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|11063799006|56012099006|261009223027099003|261026140227099003|261026121527099003|261028144727099003|10067099003|261022105027099003|261021121427099003|261022075727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	lwQoyM18L/uELpZy3PZV2xWeCqU87SN5ZFQGTdCJ46CwlIDWS9J95Kl6WSqb1uTpvguv1L3lLl29jjDKUmCZvDcSMLK3Oo+8XAnAM4PXwvp4ryoQcdpRyYnaXZIO5p0OB7A0TjYYCLMsWIMwGXY/28d/iJxaLl25L5JXL4p9ko8t5skx5mk8OyIohZnjeVf1jlEx4gQJJUpnloC0HOnn0gQxggdeXalsKjFwIuhdKIpu0qBlvespVdTKt563a18I09SrG8SVuJO6GoRLZDTewFgQAjggaiCH1J7Rdv8ySsSGtNUvgp+K88+e/o25Mh6hngsBt4hYtyWrOQxVPE2GVCi0EBirxrbjOhv1dUBbGckJeL8MUvUWeysVuLR5aDO/HDO1O3R8m2aYXZx0+RBeRafNnH/u1/QYTA7rmkAPj0spjLQLdHWtOAH2A84Jt/WlD9OlvpGyRlI5QunGoDz7jK21rzwhwlfCPolijWyB1RgKc9JrmtcREea8qZvhMJvcP3kjvE08t6Qp09lXkI2e6h4isWFWqRCSPCNVU2MZC+9QALuopzZ0qr3qwyoQ4CAtt51NojkMjPeDXrYOTEP1InnlPwdaRpX6ll6D7FUAFxePiR7W32kjXSfBEt+BKtuWJvSUW5z76sbIZsGTxDCqT/3C+JDKIrTp02NoLVcefOk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(11063799006)(56012099006)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(10067099003)(261022105027099003)(261021121427099003)(261022075727099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3R3bEhXTmY5Q1lsRlhRd25UbjRuUEgwU2tZbDVwdWpGdVBoSnU1Rlg1REll?=
 =?utf-8?B?cHhPT0NEODNadDg3VDEvWkJPUVFaYzVLSkhhVmZjUm1MQmN6Zlc1SnBxZVdC?=
 =?utf-8?B?YjFETUFTMis0VmpxbUh6eHN4b2hvNGVZTytRamJ1YjdqQ3JGWGo2bG1yWkI3?=
 =?utf-8?B?TUtpYUs1MEVQaThjM0VZL1VraFBad3RrcUYxeG1rVGxGMjlxNlU2VjA0dzZn?=
 =?utf-8?B?K1lNMER6MUdvMTRIRzUzRUY2Y1F2VS9RWG5FWSt1Q252V0F4czJ6Z2RVeFFr?=
 =?utf-8?B?SUdNdXRJdm51L2h0RVZaM1FrQkwyUzBFOXQyTHh1Um1CT3ZRdmJGZkpRT2VR?=
 =?utf-8?B?KytpUm00ckgzTW45YTBWZytHajVDNUMvY0t5d3ExYlRqYXVWb0FDZkZOaFhu?=
 =?utf-8?B?b3JNQzRaRDREcjUwbEZJR3diSEFOd0tPYXRrUE9CczBSd0ZreGU1N2lQVFhW?=
 =?utf-8?B?MDBaNlB1TXduemJ0bFl0WFNjNmRRcU8vUlppU2t6YkZRR2pVQW1NVittNkxF?=
 =?utf-8?B?MUVJazdubWVZZm5id1FEa2dFN0ZVb3pXRDczdGxMbENxYk5xTVhmUXQ0VWJs?=
 =?utf-8?B?SWEzdVZOMjAwa0tHaFlGdi9ocEFjaWxxc2ZOUk9pMzdSRVJ2Q1RRVGxPUEx2?=
 =?utf-8?B?Q3J4b01vYzNzMDFYMGRvYVVhcTJyZkV2L283bWEzMGZsRDJlaVJuS3N1R1RL?=
 =?utf-8?B?MlNiSnFucjRuVitXQWd5bjhLVktQVDFRRkRzU21Db0dHRzVOZTV3dXhEb2V5?=
 =?utf-8?B?RVhaeXhHaVBmK1o5VG4zT21MY3YyQU9SZEUvNDJ2U0tndXBMdSsvQjVldjI1?=
 =?utf-8?B?R3dDUXJmVkQzeXFFZUVFZDl0bzlOZXhjOWVxdnVWQkZ0OXZxb1BXZWlNRU9Y?=
 =?utf-8?B?QzZQTXFOQjhvK0crcHVyZkptTENwd3VQMXhqM205dFBBekxUc2NNaitxMkQ4?=
 =?utf-8?B?MHp6YWRYMmtyR3ZFSE1xNElCbUh0Rmd3M3NpRXhrdE9US1NSbXJjSHhDeVVX?=
 =?utf-8?B?VTdDNEhxcmVHSm03dXVLeDhvdVRVTkRoemNsdlNZTEdyNTczOWQwaVN1ek5i?=
 =?utf-8?B?c3FWL2JXdG9zU0xZTFUwZUNzdzByeUpIUXplSExyd0pkUGViVXRqeEpjbHVa?=
 =?utf-8?B?dCtmSjJYT25yNG00cDJKQTFrVFNyd2pCeUUxdDkyTFZVejdXVVJkQngrUVJj?=
 =?utf-8?B?MWF4RURVZHY5c3ZOU0VYdHdTSTZOamk4V3FwVU5CQXFFTGwwZW8vRnF2R3NU?=
 =?utf-8?B?YXJHandld21ucU8xZkpncjJ3c0V5TjNVN1Q1VmFCR05BOGloV2dSdHdSd3lj?=
 =?utf-8?B?WlRVMWdZTGMzQ3RTanRCZE5DUlQwK1RmUjg3VjRMcTFtS05uYU8zOFFlZ2lv?=
 =?utf-8?B?M01nN2pka1lBNk9Oem1saVl5MUd5NUFMNU9TQ3hVR2lEdDdZbzJmaDVTWHJ1?=
 =?utf-8?B?NjZhMDlsYmxjcytzcjBNV3ZWd3hoeURKRW9oM2tiemRFMk1zNXhpQ2hnUVNt?=
 =?utf-8?B?eGdKbTdYRkZQdzA5MjdIaHA4alpSd3NvbTcrc2EweHVyY1FqNFJSdlZTZ2Zh?=
 =?utf-8?B?dyszZmRhWmUyZEFKVnFLeENyMmJ0ZmR2ZmVwWFNEQ1BlQmZTdlJIYVRqeDZE?=
 =?utf-8?B?MnU3RDZOV3FLaytyL3VuUjdNbmtpcEtmbUt3VDZQUHViUUhSdEVNZG82bGwr?=
 =?utf-8?B?alNtQWFlRkhCcElDeVQ0b2xhYytuaTZBK1NoNURmNjAwMHMwMXFRR0tuS3Ft?=
 =?utf-8?B?cXJBR3NQSjQxbU1OM3NTRDhZMXJpOElKREY5QmVRMEFGUjJRQVNGd1JiU0Zp?=
 =?utf-8?B?cGlNWjhsWGFJelpiM0hkdzNYdDRvRDExNGxZazNCZWs3Rk1pUGxaY0NvNnJz?=
 =?utf-8?B?YTlidi90V3l2UEQ0cWU0aTVWd1JhT1QyRnRvZkxqTmRtYkRDS29UZFVIRnEy?=
 =?utf-8?B?ZXJGOGlDMFQrSEs1MjFzdmt3UjFnZXhtRUFaclF3OU5RVWt3N0FiNGdjMUxu?=
 =?utf-8?B?aXNWSWMwemFtVnZtck14dVMrQWNWSElESldUM0hDVm1pT3c2SUxwRTE1RHVE?=
 =?utf-8?B?OFd1MG1WcUJMQXlRdno4THUvQnVocDgyN3FzUStMdmwwbG9oOVI1SkhjNm5F?=
 =?utf-8?B?UGpWUjJJU0VKanc0dS9sTWhuWW1oc0Ywa0hDYTIwdzB4SUN5UTVoSDdSQ251?=
 =?utf-8?B?czMwU3pNSVV2Uys1bnI4cW41dG1FVS8zVHVjRHFpK21PQ2ZpdkxvdVlwbU55?=
 =?utf-8?B?a0lGb1JHNmsvNFc4N2RGZk56aEJQcm5qSEtPNzYxcGV4QmhVeUpYbEJMM01E?=
 =?utf-8?B?ektFUnd3dXlRdy9zcllhY2I0OWg5UzI3c1ZPVENhSG9tT3YzSkl4dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc10b952-29ec-415a-9dfa-08df35d8f774
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 16:23:29.2634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: richTbi0LeCrhhnmOkYFjjzvYNZHiUMEq2d6kTla9UTZQ5t9P9kgLxU4Kkgs/hbkYAp2xV+D9sFJg6cM4WgvcWj3nsb2vEtdyM4mDSIrfOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB8328
X-purgate-ID: tlsNG-16d1c6/1793291025-F72C677B-7313C6E6/10/78276251493
X-purgate-type: spam
X-purgate-size: 1280
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 29/10/2026 1:56 pm, Jan Beulich wrote:
> Except for warned_timeout_too_short, which is used with
> test_and_set_bool(), the booleans there don't need to occupy entire bytes.
> With them converted to bitfields, pending_intr_nr can move up into the
> vacated 4-byte slot.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

test_and_?_bool() are a source of multiple problems, not least because
they have no business living in xen/types.h

Next, most users of them really ought to be using the bit forms, not the
whole boolean form.

Next next, this particular warned_timeout_too_short has no business
being an atomic at all.  It's a printk_once() in disguise.  Worse, it's
a gdprink() so we're doing this atomic work for a no-op in release
builds.  Also the debug message is tantamount to useless as it fails to
identify the domain/vcpu which produced the overly short period.


At a minimum, I think you ought to convert warned_timeout_too_short to
be like the rest, rather than leaving it like this.  Or remove it; I
really do question its utility.

But, if you were to expand the test_and_?_bool() macros to finally
remove them from the code base, leaving behind just the xchg
expressions, that would also be very much appreciated.

~Andrew

