Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DE2606D817
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 14:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=Fcf7CM5S
Received: from list by lists.xenproject.org with outflank-mailman.1474824.1681757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOyGb-0001N5-5I; Thu, 05 Nov 2026 14:16:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474824.1681757; Thu, 05 Nov 2026 14:16:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOyGb-0001My-2J; Thu, 05 Nov 2026 14:16:37 +0000
Received: by outflank-mailman (input) for mailman id 1474824;
 Thu, 05 Nov 2026 14:16:36 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1xOyGZ-0001Ms-Qs
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 14:16:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOyGZ-00EDVv-7G
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 15:16:35 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aec8fa6-8faa-0a2a0a5109dd-0a2a4506a8f8-38
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 15:16:30 +0100
Received: from [52.101.53.46]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aec8fbc-195a-0a2a45060019-3465352eeb17-4
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 15:16:29 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by EA8PPF9710463C4.namprd03.prod.outlook.com
 (2603:10b6:30f:fff5::853) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 14:16:27 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 14:16:26 +0000
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
 b=dlzCi8NUdH+OXjVmYVARt8AXDe8nrFdN+MPWrpVfxwZLqANKhxVEMUsvjtpeosTE25l19+pqpxqtjOu4h0aX7k6gwG9iDwiKS+DPxerRqbHFuUfO0n5aHPDVCemeRbsBJDXZFDsq/pv+9K0cc9eObxorD/frOg0fYIIDpAi2vK4KCSMg0wi7vPiu6/gqp6b7ps65TlPzPOKTOJKct0k3BDrz8xxg1cw0slSbaVERete8csQsDjyxR3tUuiQr/11FcerLXAuXoCAqjdZ8IhNjWxXGab5z2+DzHbaEUv+iMnfCqJrRH+QoVCJaC5n+X4C6OxWc5NFhMDaeYx1iZGst2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNbPkS+RVjtOk6zNKMPf+QvaAfKMZgs4eSqKEMH8Cec=;
 b=DEs4/Im+xFW2viU9a3FZkEKzssAesZpmWU3MVw9GjT0FL96wo20mXubSE0ngq68CxmMdCE8AZ281MZrhscoc0Im+mOl+2Q49EOm0LD43xiJNxJFk2mxgEJU4kEF/czPRMqnDQDpWv0GFwu16SWC7Brj6YZYSAXVQmw+WHm+nSJqfqNrmXoo+/kDQTCo2p9wR4bUkrwIV1SHQEJsgnuEyozaBmYVO2cSCuj23dOiRwNH9Bq3cmM/84gx5T89k4Ub9TAoz7Vx79kAcbrf4BVgTqvvhXonk7OeRlucfMSuedyS70f7Q6FURC47u6CX48XCj+MaMU6A8cvNDLklrPH9uuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNbPkS+RVjtOk6zNKMPf+QvaAfKMZgs4eSqKEMH8Cec=;
 b=Fcf7CM5SiqUJ4PRRoqH3+JqYdSmGPO9Uv4Zwcw1lkm+34eTybeRcr+jPe37WwjcFz4FxICy5w9CPiLuZKQlBBCk8zRlEigItZrY0klgB2LfGJrYMPLtfY3lUiNgzH8eJuwtWYLRGP0c+K/LXE2lO0/obUBH86yAyExJlMdFZnM4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e3105225-de64-49e1-9254-45917ad5bb13@citrix.com>
Date: Thu, 5 Nov 2026 14:16:21 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/nsvm: Fix L2 VINTR intercept merging when only Xen
 intercepts L1
To: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger@xenproject.org,
 jason.andryuk@amd.com, teddy.astie@vates.tech
References: <93437f7cd832790b61c520332cbfa432c75ad8fb.1793723920.git.abdelkareem.abdelsaamad@citrix.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <93437f7cd832790b61c520332cbfa432c75ad8fb.1793723920.git.abdelkareem.abdelsaamad@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0132.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::13) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|EA8PPF9710463C4:EE_
X-MS-Office365-Filtering-Correlation-Id: bb55bdfb-f5a1-4317-7c69-08df3b4760e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|261026121527099003|260925022911599003|260925021911599003|260925021311599003|261102123227099003|11063799006|261026140227099003|261009223027099003|261021121427099003|261021123027099003|261022105027099003|261028144727099003|261022075727099003|56012099006|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	chlhiig4e5Kfy7+4CY7RsL4yh4rzyV8PQYeaf2s8eP/WPUjT313Z7ezp0vhwc1aVvSZCwaTOJqci9FZBfDCrZx0AutjWU541W6zLJUH+W8xDZiIFnfZogTnIjdsotiuDzOx6RuKeu3l+93EynScpkoEWEnT7s4kTCdvVCbya+6w65JW+bj/Ww2HAJzbYnGB+4RwMekUBL7TrwSk57zPW/vPrsOqZPHxVGf8trXbvAbnkfT2wg72t3nJKbRhqhXXwhmztzFr4fZFkQd/nt3dLfj+eyTz/eO1W2Jk+N0ypMadtmXBMUVNCE4AyLLnwCWJQBAGnLo+UYNdqAs9oCy6YbDQmTRl54QWQLMjG+V3Z9gWnil1jgHtMDQDTn2KFF6dByVhGI3xGsI64f2lwhWafOH+n/KqZVQS4ex0xp26AZUmrS9pLqAohzAX+Je9PnKmH6zXhPsPIEO82IP9YDzl2RdLBbP9dF1FM4kdCnGfPIM+dVcRuAqVIxBxXhOvj6PF5vdw9Fa5XqkNYHSIzsQJfztVYxHrjga6ywT5Utqhne2Ma27+6VKEwbiY9Qqs4qpZ2Clje353cq3NX3S2XLthTWRULaUS/NFNcmX4B+DQv8cmxN8eUcRGsfrP932sk4eUDC6Itu7SARF9Xh7Tdnkki0GvbZURKC+La73aR2vmApvI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(261026121527099003)(260925022911599003)(260925021911599003)(260925021311599003)(261102123227099003)(11063799006)(261026140227099003)(261009223027099003)(261021121427099003)(261021123027099003)(261022105027099003)(261028144727099003)(261022075727099003)(56012099006)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2FtbnJFSlVFNGx1dWtnUjA3clF6YnhnM1pxSXBqYW1rTlhZbEdxUXV0bFlq?=
 =?utf-8?B?RXcwejdyUFp2WWpKMW1ad2ZQdTZRS0JxL3ZmQWRXL09DaFdsVmJ2UXRpc2N1?=
 =?utf-8?B?UnVXTzN1OE5MQkkyeE9HUzZmcitkeUc5a0hDbE1MZ1BBd1hIQzRuYStoUWNK?=
 =?utf-8?B?V0l1K2hkVUxmQmZURHJhVHBJMlM3cEtLQXV2cEdWelRkbWJyb0F6Y0dPSm4v?=
 =?utf-8?B?YXQ2OExYb0tJKzVNU1pITnpicXhkR1kvdHNhL0ZSNVFTOStIaC95ZGVPMGNt?=
 =?utf-8?B?OTduejNrOS9LS1dGd0w2cGtwOFJBSUtkSk1lTlVQc3pVSjZlSWNxbFVTS3J1?=
 =?utf-8?B?TDlwdGJoUHd3dUZGWW5xZGJiYW5XcG1rTVpPM3VIUk9jdytVdTVCQ3JZeWVT?=
 =?utf-8?B?RGtHc2tRZDNXMXMxQVErSkZCWWVSMGVVdlFWZWhpdTdLMjVjSE1ySDFabVBP?=
 =?utf-8?B?U2RVaEVMc3R6MEpxODBPMUQ1RkZ0MGpEMWZEYjZRUTVMY1F2dzU0VTZUTE9n?=
 =?utf-8?B?dkJJeFgrVDVYNmVabXdWdVMxR1ZHdnBzWFNRMmpjWkFGdGdnakVLbzJiemF4?=
 =?utf-8?B?L0E2by9yei9qbjd1NUcrTGJRTlNRQjA2dzQwSE5LTWtHZXdrSitzVU8rTjNv?=
 =?utf-8?B?NkVuaUwxMHh1YkZGc2V0N0NENHgxbHR4a3p2TThhM29yNWpYaENoR2ZsNk1G?=
 =?utf-8?B?MmFoK2VBejJoaFZtT2Y2NGd1Q0VMT3dRK3RCNnUrbEJzU1V5U1hoTlJ1Umt5?=
 =?utf-8?B?VHY5VzNiTzhoSElRNGNPYi9WNWxkNk9RSzF2cWtSa0k2SEJJczNzQk9zckQ4?=
 =?utf-8?B?QVU3WkI3RUVOejltYXFVcXpRdFVvczljVE5QNFdIcFVBL0NoUHBDeXVUclZT?=
 =?utf-8?B?UzlRUGRBdVVoRmZQWXBpNFE2U0NudlJsQUdaQkZYMStXS25aMmRBWWxTdVlU?=
 =?utf-8?B?ZHpvOEpwd05lUit3YmFvWm04WmVxdStRRyt2NHA3czNzY3RQeXdIdXBNM0wx?=
 =?utf-8?B?VCsyZm1mdVJIamYwc2t2eVhLQzBLempxL1kwZUdwdFZkQWRpUTlTVGdVYzV3?=
 =?utf-8?B?a2Y5TEpoNEVJQXMyM3NXdk5zQnc5WHVIWjNsNktEWXNjSU9sakU4QlFRWHZn?=
 =?utf-8?B?UGFTdGRwNytPcjhHQ3NFZ2tpRHdKcHViMlFCS2dRaDdWL2Jjdk1rTDhEbDN0?=
 =?utf-8?B?SDFYZmNEcEUvTmlrT2RMb1BVdDByRUJiUUhJTmVsODU5VlFTNmVSZnlHL3Ji?=
 =?utf-8?B?TTM5NE0xbnhNZlIvcTJ3K1F0Z0JUQzh0T2hKSmJNejNTQzlrU2JsL3gyY1c4?=
 =?utf-8?B?NDllQnRHQkhpRFhLN1FBazhFbTBWSXQwT2tqTmxHRi9tK0RpL2NueXM0dHR6?=
 =?utf-8?B?dDNISzNZSHBPYUFVZnd5ak43STQ1RkY5ek5tRTMwZjFFdVNXNzVzTjR6bnhP?=
 =?utf-8?B?RW5EMGpoUEtROUErMmd5emVLTHEzWktJbzU5VnFPN1lWNDJNUG1NSWJ5WXRY?=
 =?utf-8?B?SmJCL29FUkpMbTJxdTY3ZnlyMmwzNnRhYU9SeFBSc0s2Ty9FcXNKcUl3R0Fm?=
 =?utf-8?B?b2VhcVY1U1ZzZVN0dGZRSFJlUDdHSG5SWnJZczh3WEU0WWVNcU55RU81UmhT?=
 =?utf-8?B?eUNUWXgzSW8zZ1l5bkJld3lGWXpNOWFDN1U2bm9yS2I1dUk5bEpOSWxJOUYw?=
 =?utf-8?B?RVU3L2xGT2lMOEhzbGtTNmpIMk9hK2J1VTEyMUx3aTRMVjI4ZkJ2a3FtT0Fk?=
 =?utf-8?B?cG9nRW1SeHBMT1JySEZLNVVDbytYaFZzdXU0UmJIQTlNT1VYVTdna3VjcmhC?=
 =?utf-8?B?UFg5d0NadUFMQWpVUDd3K1c0UXhpZGE2WGxJL3h5bHUwQ3dIdk43akZrV05D?=
 =?utf-8?B?eHdQTi9reVIyNHRSYk91bTZYdyszYWczcXFTRnAwRHNVVFNBMEtYZktITzRN?=
 =?utf-8?B?czJqenJMMGZLakphOU0xTy9OelNEWU9kR2lUQ3lCSXFzLzE0NzMrSzBXbGt1?=
 =?utf-8?B?cFFkSGxUcExLSXRKckJ6RDF2Qks4TUFqbGlHb2ZwUWVvdXpiVEtla3lYcm5G?=
 =?utf-8?B?Z0lEY0tibk5LSFVrSXBiQktseG03b1pNWFZFSERhK0hyT213ZmdkVXdzMVdS?=
 =?utf-8?B?WWFhcFdnb29JcjNaRkFBb2t1R2FsZG1jWFR6U0JzTjh5QzhxdG9ZK1JGSVhp?=
 =?utf-8?B?ZkRVUk5OenRxbE9aUm1LL2dqeVBzRkFQRGo1LyszVitGb0RZYWVaSjNWeEha?=
 =?utf-8?B?QUl2aEpRdEsrd20xSnV3elRtNUVFQWpycVNsSDd2OHFMcFpReDhsTW1KWlNS?=
 =?utf-8?B?NGo2V3lYU2J5N3AvKzNEandRWmdRM2U4d0hkcjFPZ2Nwdys5WkwyT24wY2Zy?=
 =?utf-8?Q?KSF89Z5fTZzQw2Ho=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb55bdfb-f5a1-4317-7c69-08df3b4760e7
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 14:16:26.6189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 78x36EWfWXw01ToqAwx+eUYLLoBTA71TpsKCRapCt9vCjT55KJKlA+EoJgY6Y2t2W74bm+HBHhGQQYUOjVdXdgOJlN1/RoMAWlKAKMlat6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA8PPF9710463C4
X-purgate-ID: tlsNG-16d1c6/1793888190-F500977B-F85BD533/3/8916376837
X-purgate-type: clean
X-purgate-size: 3747
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/3/26 4:59 PM, Abdelkareem Abdelsaamad wrote:
> When nesting SVM, if the L1 hypervisor has not requested a virtual interrupt
> (VINTR) intercept for L2, Xen should not force one. L2 execution should remain
> isolated from the L1 VINTR state, and there should be no expectation that L2
> execution results in an L1 VINTR becoming deliverable.
> 
> Currently, if Xen intercepts the VINTR for its own L1 management, this
> intercept incorrectly forces an intercept during L2 execution even when L1
> intended for L2 to run without it. This breaks the expected transparency of L1
> configuration and introduces unnecessary VMEXITs.
> 
> Furthermore, handling this forced VMEXIT_VINTR can cause a pending L1 virtual
> interrupt to be incorrectly delivered to L2. This occurs because when the
> intercept is determined to be requested solely by the host
> (returning NESTEDHVM_VMEXIT_HOST), svm_vmexit_handler does not switch to the
> correct VMCB context before evaluating the interrupt injection.
> 
> Fix this by ensuring the L2 VINTR intercept bit in the L2 execution VMCB solely
> reflects the L1's explicit configuration for its guest, independent of Xen's
> internal L1 intercept state.
> 
> Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
> ---
> Testing:
>   - Test setup using a custom XTF nested virtualization setup:
>     1. An L1 maskable interrupt is triggered while L1 has physical interrupts
>        disabled (via the CLI), leaving the interrupt pending.
>     2. L2 is launched via VMRUN with an active, deliverable virtual interrupt
>        configured in its VMCB (L2 EFLAGS.IF = 1, L2 vGIF is unmasked,
>        V_IRQ_PENDING is set and L2 V_IRQ is injected on a distinct vector from
>        the pending L1 interrupt).
>     3. Xen enables L1's VINTR_INTERCEPT to catch the next available VINTR
>        window. L2's VINTR_INTERCEPT is kept cleared.
> 
>     Results:
>       - Old Behaviour: If the pending L1 maskable interrupt vector has no
>         handler mapped in the L2 IDT, L2 immediately crashes. Otherwise,
>         the L1 maskable interrupt is incorrectly leaked and delivered into
>         the L2 guest.
>       - New Behaviour: The L1 maskable interrupt is securely withheld from L2
>         and correctly delivered back to the L1 context upon the next window.
> 
>     Note on Test scenario:
>     I think the same window race can also result when having an injected L1
>     maskable interrupt handler that temporarily raise the TPR to block
>     lower-priority interrupts, with the intention to be lowering the TPR
>     asynchronously later, then executing the L2 VMRUN in between.
> 
>   - CI tests:
> https://gitlab.com/xen-project/people/aabdelsa/xen/-/pipelines/3023453459
> ---
>   xen/arch/x86/hvm/svm/nestedsvm.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
> index 128008321d..21b50a59b0 100644
> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
> @@ -403,6 +403,9 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
>       n2vmcb->_general2_intercepts =
>           n1vmcb->_general2_intercepts | ns_vmcb->_general2_intercepts;
>   
> +    if ( !(ns_vmcb->_general1_intercepts & GENERAL1_INTERCEPT_VINTR) )
> +        n2vmcb->_general1_intercepts &= ~GENERAL1_INTERCEPT_VINTR;
> +

If L0 wants to inject an interrupt but the VINTR intercept is not enabled, how
would it detect when it can inject the interrupt? In particular, if VMCB(1-2)
has V_INTR_MASKING=0 and L2 sets EFLAGS.IF=1, the interrupt should be
delivered but L0 won't notice.

Ross

