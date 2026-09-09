Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F078BC79F8C
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 09:58:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412760.1643115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4F4h-0005NS-VF; Wed, 09 Sep 2026 09:58:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412760.1643115; Wed, 09 Sep 2026 09:58:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4F4h-0005NG-QC; Wed, 09 Sep 2026 09:58:39 +0000
Received: by outflank-mailman (input) for mailman id 1412760;
 Wed, 09 Sep 2026 09:58:38 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x4F4g-0005MP-OC
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 09:58:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4F4e-00Ct9H-AX
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 11:58:36 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aa12dbe-e002-0a2a0a5209dd-0a2a45018642-30
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 11:58:36 +0200
Received: from [52.101.193.25]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aa12dca-5984-0a2a45010019-3465c11994dd-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 11:58:35 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA3PR03MB8327.namprd03.prod.outlook.com (2603:10b6:806:462::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 09:58:18 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0382.014; Wed, 9 Sep 2026
 09:58:17 +0000
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
 b=ojtBlAb3BUSkolcT7BkfANnY6Osx91Tlq75PoczCq6hpwyYpEevfjFS37NTCuaG1/1s0/kukAuIngQW3udNtE/6dJODRkoJLW9HWHdTac0aiAWKzxLhrrE9baqfbjOAh5Ypv+gB/0XLG67A9IErDvO7Nc1s9qT5SQ9qeIbxfhbpNPeCBtsBK+W/oxxEAffrZPCOeAtBoLtuhuQR8vHWOaikFhbMuU1kWLokD8lq3ZO0Dxj/rW75ArtDV3KzgrqEZBOL2Rq986o28V+GC5A7Y3zZ2Ft5yzpOTtnRg4/7r9uF1X0s0KnqM73sZ7wFRHfd2iefF5w+atjAfK1KKh0zLWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NE3GfjM+oOCpbHQ8qwGPZGtvfiPbjSSwpc++0eLKcPc=;
 b=bZcYY7/SmWEGi0LOmpFlfcM5MuZgGRnNerK7Z8ZUx91x+afwDmACt8JY3+IJi+8XUJ9yscNyyebdUAt6fU3IF8lNSWr5mUQgqtv5nPRzkW+FTTHRs+9g+oRMF9sbW+6kiwAVVCBt5Eq0udMvxio+Aa2dFz9Jekb/b9fW7DP4atVRd6iFaZZwbWUEzFm+0hb3FMusJszpjPujoatfRWFhHxUVucAzSI0CPggHVxbcrbRxDttX/XUkmKolmMLyVr7NtE9SlC9Lj7Ikp14QpvgWEDa2TWeM6zk1UNMeyX3D+3yKzjW0SHGZEYEzlAPaxOyunPWUCGLvpuwjA3PHYgbYXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NE3GfjM+oOCpbHQ8qwGPZGtvfiPbjSSwpc++0eLKcPc=;
 b=Pa8O4Tn37W8XmEb1MWpn8bZm5wnRjq+bfeK4nhhMopG+WhA7YXYmWRCjWUY+ai2Qk9Sj15h0CnR8Tf5XbtdREzE4xqZy4BMrAqH6R/GEGJ9pU9bljB+Pku0YptldkuHvsYeKB3Td3QHksByW8xYHW61v3QeseJx7QS5K3oc3Ai4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <07a6219a-d591-425e-bdd9-07ed20d59d78@citrix.com>
Date: Wed, 9 Sep 2026 10:58:14 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/mm: limit deferred TLB flushing to PV owned pages
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger@xenproject.org>
References: <20260909072451.67324-1-roger@xenproject.org>
 <1cadfc6c-efc1-4e23-b778-1df97fd0fa4d@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1cadfc6c-efc1-4e23-b778-1df97fd0fa4d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0417.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA3PR03MB8327:EE_
X-MS-Office365-Filtering-Correlation-Id: 6347ed21-4858-4b6e-6423-08df0e58df6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|10067099003|56012099006|18002099003|4143699003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	QjZc40STJ3SnEI1btZGs7/tUpN/ABXCVZ/7ihqKptqOD6s4GCO1tcZfu57OhniE1FlqWvhg/opR1H/V6hfAF6gTbLjP1U9rQXW+LAPVyQGm0g5G4b0QJq/qp3CfvNMUy/Sia+RDq3lO7waeOX4nQcLLug3FOmLCxkdURdLp6UVSJi1mi7s1UxclGBAoHvwiNmt9OR4XfnIhtNXgjXMHFKl2RV3zMk/+o/AdiCJbAC1WUb7eI7Gm1/czyTkb6iw9uHkR0RNCVRBJRB6VYdutT9WvMzjhTbGOtdjcjuAqoxOK2NdxG++rgfLzTZAW9u4JerY3OhP9Gf+BFye+lpWuCDxBIINKpYlR6G4npMeRCy27m730GYlYW+ImmTDhkpx4iA6tVqCT0jq3x62eZ8/EjSZC5TPrh7vIRFALSon4k74be1DJvGXJFrZZcLXwoapieTSR1ZFkQamK/9N1W1lcBSWoLCV3Vi3gYEcLe2lP4MspZmASdc8rhOjuejI3WP6cXORDzkkHUw7m3etPtJ9dtWzvmAqu2aE3+CRxo+c7pFwLfnPDYjfN4Ezy/2D74Omj8Krhex1l8pDkH+LCbzt5aVKDx2tC64AwtV/gPHjiCjNuJy5lwuak9vwrQE6Pex01Jt75Irw4jGthamS1c2ng9lp5BF+BwY6Mu/zbQlemH3gE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(56012099006)(18002099003)(4143699003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWhSUGlSRjJNUTNSSHFaSE9UZGhNSTYvYUhxNkZwZThtK0JtbXVYaXJzbnh0?=
 =?utf-8?B?VWQwTGpzS0RvYXJTYTE2QkdWUXNFRFdNOENraE1JWmJ1MXd3TjUvYndxS1gx?=
 =?utf-8?B?dkNBVjlBeks4WnJMR3BWS1g3MWpPTkk3d0R3NzlRRmJ1SUE2Y1Y5bzdVZVhW?=
 =?utf-8?B?a1p1enpLNG9taUFIaDVzT1orc0ZQMmhLa2wzVkhjQjg2MTV2OTh3NW13N1Vl?=
 =?utf-8?B?UlBFbE5CWVlIcnhWT3QxOUl0OTVlOU5oS3dyQkk0em8yUWJ5ZVNFQTFPSDF5?=
 =?utf-8?B?WVJlNDJwRWQwaXpPWXBrZGRyVUw5Z1VxQzY3Ni9nMVlMOWxSc1MyUjdYYjBZ?=
 =?utf-8?B?NERCT2dacFQ1YjVYQ0NWNkd0TU1Gamc1SU0wNWM0czdPdnYzM09tYkRPam1L?=
 =?utf-8?B?cEM3dkhpUUVBNlFsMkdXMkFpWjZ5Ry80WDJqd1pmTFRDVWxWS01LeERUSDJa?=
 =?utf-8?B?eDVMUTIyNXliMVdTL2RLMHRQOElGdzFvSlpVV3IzNjd6M3AyTlFucXZmUFlt?=
 =?utf-8?B?a05GeUpXV1g0RWZXaUtVYmp6VGxlZlBGNGRNODUzQjU3azZWS0QvY0V2SHc0?=
 =?utf-8?B?YmRCUEttZHZ4SXoxK0hERGYxNzdNUVZqZU5YRW1FNGtvZGwrNEY1YWdLcDJq?=
 =?utf-8?B?TkwrVEEyZ1JDaHk3L0tCV2xSbmY2NWpxcGJGajNvOWZEa2RjalJ2a29LQmFn?=
 =?utf-8?B?ZStCWXo3djZxVXNiUXZEVmx3bktEeWx3UlNvQVhHMSsvZldwV01CMkZjRXN4?=
 =?utf-8?B?NW9NNzNabC92dUIvUFk0TDU0MjBCK29SUVBEYkt0UlhLWWtUbnZTUUlYSjBZ?=
 =?utf-8?B?eURZc1R0Z04wdDlDdXNTYnlIZCtPZjB0Q0hlT0JESVQ4TU9TZGZMcVpIdUU2?=
 =?utf-8?B?RWlhZldTTWRTajlUU2kyTkY0ZWI4UzhLVGx3NEtQU0xCMGthTkpCL0FVa2c0?=
 =?utf-8?B?a2VsZjFUVS9ncVN4eXhGVGUyV3BUVGZCMDFiYm5jdUZDYnhkbjBFZGp3cjU1?=
 =?utf-8?B?eCtWVmUwNThzb1cxeUdpS2dlb1lLcG9leTVPSS9EeEdjeDhTMmdrL2JSbTJx?=
 =?utf-8?B?Znl0dE1nNkZaa1BEbWZUL2lFSEhic0VrdlBDUjU1U3NQMGo4eGRSRWZhK2FH?=
 =?utf-8?B?UFJoR3R5ZTVhMksxdEVXT0V6VDk5LzZEMk5QZjE3dldNN2J1c1cxYUFpOFRa?=
 =?utf-8?B?YzZDejlGZ0s2QkRTSzdzUUdBQlFTOWtVc2VsaVhEMWJ2bHVPT0dac1IxT2kr?=
 =?utf-8?B?ZHlDVlNTejEyQ0pGa2g5ZEdWVnFyTUFINWEwTDgvWDEzU0l2V3VUZ1Y4bzc1?=
 =?utf-8?B?dGxFaW54Ylg4Wk5aQXAxRkttbkNJMFFZSi9OeCt1Rk9ocHRvQy9walpKVmZm?=
 =?utf-8?B?NVdEKzhkRFJCdFN6bnd6RWVaR2FlT3ZyM2NLTE5SNGtVb3lxOW83TmIvMkVn?=
 =?utf-8?B?MUZxTXhCZEN2amVpZnYveWJkb2NlZ2svNndWc2s5UHR6dGRBMTFwVTJLZE1O?=
 =?utf-8?B?VkJsU2FaYVExMVZ2L2Q4b2VZTGthQnh6Kzd3eitNQ3BFMEhjaG13MHhSM3k1?=
 =?utf-8?B?T09UTUtXK0YwOGFEdTNqZVl3bjdZazRzeWdCK2NVcGJrTERnem95NnB5aVhX?=
 =?utf-8?B?bHcvdkI4U2hDNjN3NFFMRzhGcTgwaVVDU0NjMFFOOEVSYzZ1Z0sxRmM1cVhJ?=
 =?utf-8?B?VkRiZnBldHAxWmJ2aGsyUUFZWmtJOXFHc0NzWGF3TVNSV3Z1R1ErQXJFZzY2?=
 =?utf-8?B?d1V3TkVYQnJtYmhkaEVJZ0xxU0JGeS9QWkJucnRWNDY3dUxXUzN5ekJCYVlO?=
 =?utf-8?B?c0VBQnJzQXJ5b1ZiNWRXMStBdVdubkVjNmtxWDlDRFlBazVNem9WRU53aklv?=
 =?utf-8?B?UmlPRVl6QTI5MWJCcXJMYWJ1OG5ISEY0YzkzaWZVSERuSjVCcUcvakVOUS9K?=
 =?utf-8?B?clJRYUE2UlR4VzhkUVU3SUFKL0JkRTBWVUlMNXZZajdLdFdRQzBJdG1ab053?=
 =?utf-8?B?T1krTWxka1Y0d01VdEN1U2t2RUpjUU5HMlA4UWNkK0YvQzViYTZPYkttWmo3?=
 =?utf-8?B?dXJQaHRQSmdnc1c3bkl2N2o3c2hEcWkvWHgwQ0pXM3hmWnVTMXJpQk05dDVq?=
 =?utf-8?B?NXRsRkFQWDBzbFRYbzEvVk1BOENVUmNTRy9pV3ZzcDFVL0VvVk9vdFQ3dEdB?=
 =?utf-8?B?WVExVFVOQXhVM0FZcit2bzFmQmFhMUNTc3pMM21QYW5pV1RPWS9tbTlaQmc5?=
 =?utf-8?B?UmphQjBtdUdaME1FRzFGZnBzYlVNQVBDd1JBUUtxNlhaTWFEditRN0pSbUFz?=
 =?utf-8?B?WGtOdElralVpV2J0ck93UUE2QUNkV3BudnBUWkNCMTZHNE9QbSt3QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6347ed21-4858-4b6e-6423-08df0e58df6a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 09:58:17.8731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1efPZoMOILJJhq3YNW+UX27EL2+gTj5h3MlVeSt5ri1ZV0F4mtSkhXfOMwu4OZvdSkb5eg0Xql077Oj7cYUrEfzxeEN7ztCEeoMW39IXH3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB8327
X-purgate-ID: tlsNG-d62444/1788947916-1D272757-F691864F/0/0
X-purgate-type: clean
X-purgate-size: 653

On 09/09/2026 10:21 am, Jan Beulich wrote:
> On 09.09.2026 09:24, Roger Pau Monne wrote:
>> The current logic on x86 will mark all domain owned pages as needed a TLB
>> flush before being re-used.  However such TLB flushing is only strictly
>> needed for PV domain owned pages, as those can keep a reference to the page
>> in the TLB after it has been freed.
> What about HVM-owned ones which a PV domain has grant- or foreign-mapped?

If a patch is grant or foreign mapped, then it can't be in the process
of being freed.

I presume you mean "had been grant/foreign mapped previously", and with
that, I agree with your concern.

~Andrew

