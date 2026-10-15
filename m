Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2ABECC6B33
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 13:30:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450561.1666020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHLXO-0005n7-Po; Thu, 15 Oct 2026 13:30:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450561.1666020; Thu, 15 Oct 2026 13:30:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHLXO-0005n0-N5; Thu, 15 Oct 2026 13:30:26 +0000
Received: by outflank-mailman (input) for mailman id 1450561;
 Thu, 15 Oct 2026 13:30:25 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xHLXN-0005mu-66
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 13:30:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHLXM-0096fZ-Bz
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 15:30:24 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ad0d563-bab6-0a2a0a5309dd-0a2a4504dcde-48
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 15:30:24 +0200
Received: from [40.93.196.53]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ad0d56b-b57f-0a2a45040019-285dc4354f6b-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 15:30:21 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MW4PR03MB6555.namprd03.prod.outlook.com (2603:10b6:303:126::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 13:30:16 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0522.013; Thu, 15 Oct 2026
 13:30:16 +0000
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
 b=klBkkeuZn/feOvFpDYnwJxU02+H38GKBwjb08K1X5H29hSPCPt92ohXNOUPhVXHUf1stbFRGx+OPVf0J26EdIL9AFgRxibgTFhsiVflfCeVqMzsJN/gLcOUamPYyumG8h+bWySIsaDAzuIsylJ4bw07PObCyiGCZJ/1VRObF/azR2F0sKX8g7vGQKiccTNN1+wZOPz495L3yH8Mp2qRUS2t1rhRFu0CKJXC/7OcPDeDBzv4KTzSjGFDiBGY2FSOmQtylrQhWMu0xjBo3KbVcGBCbiPkGsKIP1AgCArFGKM971wB4QlmgBZPFmydhrLV7qnC2sw8bztQgdPEA31v/6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1RsR/lMvQmPDYXn0qSwj5QEqoktfgOcyMNx0f9mYW9c=;
 b=KPp398s6+rKJz8jImBNYNtHgeM3sgqnz36EdMMp8mz/4T2bak6MXUkgdpPw4olLbfAc7TM8TKztfSJofbvvuPkBrsp0pZGV+8Dn/Wj7hME+gU5kmJn1RXIc36WODoJUsvs2TbtIqeTL2LPrRbNJPTn7g5p1+yTM2FPFYfrwBkuQZ+k7ayeh9M1EGJIpN8ssDz51Uv6FOlxjOsU/Yz9aU9sOvzBOPKtiBDv2RFtp3IG770sgDR42FSVn3PyzBg5KmbA8hp0yhy9NfbRV2HJYNAi7QsyAUWs4w4dk0rcG/liXHbf19j9ZmoyT1JaUq3X9ymDGYQpYqqHoDwMZwKwTkDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1RsR/lMvQmPDYXn0qSwj5QEqoktfgOcyMNx0f9mYW9c=;
 b=zLuIwvZ01Vx2nyEhuWwmtTU2yWjUK2MyO0qdoM/ozDBDasTb6rdpRraDXpDIEJhGnBEl8jnIlE97zDsWdLALZ2o4IsqYwy8bYBKBP8BbWux0dVPfcynSKbkjiYtLcMl/bAySugzxXZ5cffptbRaOc5HRJY4tPXeYi9s+FDhsKuE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <fbfc7df4-9421-42ac-a9e0-fda0dd1f0dd9@citrix.com>
Date: Thu, 15 Oct 2026 14:30:12 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 1/3] tools/tests: fix domain creation on ARM
To: Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
References: <1792070250.8631fc262581453bbf619ec5b2062170.1a13fb5eee80008425@vates.tech>
 <1792070492.8631fc262581453bbf619ec5b2062170.1a13fb9a01f0008425@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1792070492.8631fc262581453bbf619ec5b2062170.1a13fb9a01f0008425@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0500.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MW4PR03MB6555:EE_
X-MS-Office365-Filtering-Correlation-Id: 45b24f89-f526-4b80-718b-08df2ac07325
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|22082099003|18002099003|10067099003|4143699003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	kQ9d5QqOMkx35PY4EyGmkKvnDBJUFMPypw891tqDs1OnlX8YNQ11FSBwJxJB1dAdU0LueBFdLs65IHUCNqQsbqwIvKtV44ZHQFqLapAG3vYKpM3cesNULk15aN8iBL7kWz7FDnzofXT3K5Q8+r2vO8obJ3gDQDBVHeo/O+7d7BJW0QJpuy7HLfxqUxHC8gdYlchBro4CETeL8WJxsOl3WgUjaE7tGwaX71w24fz+RgK+ExRTXys8hoajI+WxIMa3H6XB9wq3fYYqrkixbUvNoXuqDhSYOzPZbssgNJ6lFBkadDAUmIGGu4LlLAB3a406MI6r3fU8s4+sQWRTFmZqyw+AYhRuf3NrXieQNIHB+SGeS711nXDVLv7cI1x5OAGxGC5ORaA5Xv+3LgHGUf0Gt2ILlUafXJtDKqc0m2IXEM1rUmAKwSh6nXyhEJ1ZZRnsFVcsXrqzNsquipx4KfL51aN1Ur1jaHjNe4kBv2DY0vftSW0HFZSHzCAsSkee22Bj6i8+xfxn3JAMYzwnGEncKYtaN49nWFfEIrpotgjAyCiOHy4gozdbsG06IGTEjZ5JwveY1FRxvwHKsFeoqfmewGMQO+rVbdi9UcGaeqzHp3oCwaF/7uk6jLQHDwLlkfyrtG7bYmBBz1iJx76AQFUhEWwsTihcu1r8GGTBMKynrFI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(22082099003)(18002099003)(10067099003)(4143699003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TU1EYmtoa3ZkL1lMcnZsOXU4TmsrT24vd2hSOFNzeWFORko5MURUYVcxQnlp?=
 =?utf-8?B?bVJBL3duVDN5M3lGbTVLSDVWdDh0Mm0xM1pKanRMZW1PZEJ6SU1PVEZSbldi?=
 =?utf-8?B?UlN5Z092Zm9iVnpCdHJja3R2OHh6MTdQd2xOM0pQZ0IxM2YwZDJQRWdUeHo3?=
 =?utf-8?B?dERzaG9LeG8rdmRyWEoxbFdEQWJ5S1I1OFZOZGxCOG00M3k2QTJhZ09qS3k2?=
 =?utf-8?B?UThBcVNyZ21weklHQlNySGF5SEVuZmh1RllUSWRlcHV2elZhQUZ6akg1Z0c1?=
 =?utf-8?B?Vkp6WWJ0di9IdDBGQjNSeWF1ZzJ5cHBONTB3byt6UlptVEhiUU1XSUlVdGlW?=
 =?utf-8?B?YjR5Q0JVVmsvNlYyaGJCaGR6TzQ2Zk4xRnRBSnFJa1hNYnMveW5pSFR5alVB?=
 =?utf-8?B?N1ZTVFdQQTM4SEZxa1pjVW0vTnVEMmdwUmhZNE9rNzZQY2l5dXhvcGtCR3Fl?=
 =?utf-8?B?Rmpsb2h2cWxRNkpGeTdBRjRKcWFCYndMa1hyU0NsdjI3azg4N25JeVE0MlJ4?=
 =?utf-8?B?N1dQOFkrazRHMGYrM0dmV2gwYmFSZHZyKzEvMVV2ZzQxQVpQM2VMZ1NtZHRF?=
 =?utf-8?B?MWhyd2JXU3pWSVJmMldySng2eWVNL2IwOGpheGpxbFFhaWRlS2FJZ3dxYWQ0?=
 =?utf-8?B?MkN2NFFGeGlFVW84amJKOEFQc1lucCtmVnE3SlZEYTE5Z3FSaVFueFNJVjdy?=
 =?utf-8?B?U0s5NkhaMGp0Mmg5Z3Q4Z05KclJRUFVING5IWEtQZFM2dXhYamlUVjNETzF1?=
 =?utf-8?B?ZlFhNUtlYVNWdUpyN2ZjL3ZiTW1rZlB5WHFESnk2MmxoWU8wRThoVzNWaXZB?=
 =?utf-8?B?OEY1RzNUWFVkTVlLWWNENkxnbUluRm5nWnlHTUVFcUdkc2VROVV0aHI1Z1g1?=
 =?utf-8?B?R2JEVXRINm1XRjgyMDViVThscUQzS0pObTRZaDYrd0NZdGFkVUpLaTUyTGVo?=
 =?utf-8?B?WEdORkxLdm42VUVaZ1VhMWp2TGo0eksyc1hmS05mNmpGRDBENVBqRWtvZ2hr?=
 =?utf-8?B?eVJqQm5rUzYzU0dzd09BVHVaVXo1ZFlkK3owUm9oeHZ5OUpySG84c2p6cTdM?=
 =?utf-8?B?K1lZOWhKTWZoL1J5TU45NlNCL0tHTUtzWE1KM3ltY21wVklVZmVDdWRNcFla?=
 =?utf-8?B?Z3pmRlJROWtnWld2eUZmc1Y5bG1rVXRPZlF4Z3NTTUY3cHRaNldvZWlUQkpU?=
 =?utf-8?B?bkVtRm42RVdla3AvYnZMS09FZjdOcEtPZnhERGE0RFV1VnRLZFJDYVVOY3Fm?=
 =?utf-8?B?SU8xejRqcEQvVG1TRVRQK1JCdU9pZnNpTkpndkhFbDNoWUdVZEZXWHZzcFJH?=
 =?utf-8?B?cnBlUS9sQUJQcDdKSVBIUkJ5VHN2cGtEeE1VZStyTisvSWZFR0dGcTRmZE9Q?=
 =?utf-8?B?aGcxQmc2SkY4ZkdpUXdOUEhxaGdwTXV6aTVma0J6cnIxeXFyWHlXdHNYNEN1?=
 =?utf-8?B?SlNDSFhsUTdzYlRjOHZ0ZExTZnFRa1p6MnRLdkh2ODN1aDY1RGoyRnNWVk56?=
 =?utf-8?B?YTRvaUthMThOV0VpYnBWbFUzcnJ4QjVrTDl1RHNGOUpXUUcyZ0QyTTN0SDRZ?=
 =?utf-8?B?VkJjMXhsMmtnU0FuN0ZkZGl5SG03b1NZQ29CYTJhMGhxNHA5bEdmNWRwSXBz?=
 =?utf-8?B?eUQ3RVVDbUdWaXlqOGUvMW9HZzBGWEZzcnkwckFZaUFqaTJ2ekMxcEw5Qldp?=
 =?utf-8?B?QkpxUnFFRnM0cy9iUWxiYzdRdU1qMDlHNHFCNE9oUjdFOS9PNEtveVN6NW12?=
 =?utf-8?B?bGpiWjJiVlFwczdqeDFIbmNwY1VMQ25vRGZTci82cVF0K1R4bzNuc1VyeTgr?=
 =?utf-8?B?UG9ZeERyM0FWMzVuSmNzYzdibW0wcXBxNGx5QWs4UVl1UmpMSk1RWWJLNGx4?=
 =?utf-8?B?ZjNQNkl0eUpBMzlpKzVxaU9TaTk0NWpHM2xEaHlCUUN5U2NCMGpCaGdnMkYr?=
 =?utf-8?B?QXVhSjVoaXBCY3krb2lVT1VNdXpjTFNiVDJ3bFQyb1o2Mml3c1Z4TUxBYUg1?=
 =?utf-8?B?elJBWE9xZkp5VlBtbjZQRXJjaDQ3ZnhIeDErMnBIRFBoT2tuSEcxeXlISTVl?=
 =?utf-8?B?Z3diNTk2WTMvaVJqY1o1KzhkbFpRZGpTLzBFeUt5aDRndDRYQWN3bys0TTAv?=
 =?utf-8?B?MWxsSytjODdzRU5QYkZNRk5udlJ0QklIVnNaYUZ1NVVqNXVvQVpoaXFrdjVM?=
 =?utf-8?B?Z0NaeHYwbkpSd0tCdWhtS3JGbEZXZUNLSWZBeXMzUXVCanZJcStJaVhkbmpi?=
 =?utf-8?B?UU5XNWRMZzdiVURXNjZsbWZtTDdpQkpwMXNwdXI5ZndvMDNxSzNmSDZBbGpF?=
 =?utf-8?B?UVlxMFc3aDlvRHRLcEpzaFNjR0F4ZjhoODk4OFRzVUVhVnZkeFFpZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b24f89-f526-4b80-718b-08df2ac07325
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 13:30:16.5520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iZE53mCXUvCiSEy+TU7Vo34JPPjsjDW/1ywMb0KwWLqwHeXavV4ROAoPz6QVoSUyy63saJYhDqbE1KJBCSkvm69/nb/+4IuS6Kstf2TJZlc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6555
X-purgate-ID: tlsNG-ebf023/1792071024-C12DCB50-D0CD81B1/0/0
X-purgate-type: clean
X-purgate-size: 1612

On 15/10/2026 2:21 pm, Julian Vetter wrote:
> The tests test-mem-claim, test-paging-mempool and test-resource create
> ARM domains with xen_arch_domainconfig set to zero, i.e., gic_version
> XEN_DOMCTL_CONFIG_GIC_NATIVE, which has been removed. Domain creation in
> test-mem-claim and test-paging-mempool fails, and test-resource
> skips its ARM configuration.
>
> So, pick the GIC version from the XEN_SYSCTL_PHYSCAP_ARM_GIC_V2/V3
> capability bits reported by XEN_SYSCTL_physinfo instead, the same way
> libxl does. Use GICv3 if available, else GICv2, else fail the test.
>
> But, even with a valid GIC version, the tests don't properly run,
> because ARM domains start with an empty P2M pool. The toolstack calls
> libxl__domain_set_paging_mempool_size() in libxl__arch_domain_create()
> to provision the page pool. But these tests don't go through the
> toolstack and call domain_create() directly.
>
> To fix this, call xc_set_paging_mempool_size() just like the toolstack
> does.
>
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>

Thanks for the patch, but I think this wants to be two patches.

The GIC side of things is obvious, and is fine to go in.

I'm confused by the mempool side of things however.   The mempool cannot
be empty at the Xen level, even on ARM, and we do try to set it to 16
pages in one case.

If there really is a difference between how x86 and ARM behave here, I
suspect it's a bug in Xen.  We absolutely should not be having
differences such as this exposed at the toolstack layer for things
common between architectures.

~Andrew

