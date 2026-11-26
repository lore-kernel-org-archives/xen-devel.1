Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E29606A31E
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 18:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=RsG271IX
Received: from list by lists.xenproject.org with outflank-mailman.1503890.1699514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWeJr-0008N1-9N; Thu, 26 Nov 2026 18:35:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1503890.1699514; Thu, 26 Nov 2026 18:35:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWeJr-0008Mu-4Y; Thu, 26 Nov 2026 18:35:43 +0000
Received: by outflank-mailman (input) for mailman id 1503890;
 Thu, 26 Nov 2026 18:35:41 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xWeJp-0008Li-Gb
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 18:35:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWeJo-00Gf79-T4
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 19:35:40 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b087be0-2eae-0a2a0a5409dd-0a2a450b8108-44
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 19:35:40 +0100
Received: from [52.101.48.41]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b087bfa-b7e8-0a2a450b0019-34653029e438-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 19:35:40 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM6PR03MB5211.namprd03.prod.outlook.com (2603:10b6:5:24a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 18:35:37 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 18:35:36 +0000
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
 b=WHr2fV2ka2qPC8cgCQPCFToKU2v9ZMv/G5UF2BgyW7wqIvzey55sKklqjvCTQCk2d8KTaa+SZAKcmaf87ordVgcsKqtkhXrVASGNk5RULrOvPnJwe+gNrsEOe0Stmp1eNVxHIp4NFQGmsyqv2RM0VXNJlEha0FLUya/oqXYmaHLxJ6LkJdfjzL+RDkFRHROyrFnBUcuUeM1yIcn+qHk+ZcHrOzqT6GVKhKAAXqzPOpHo1DElELlAzqqk3lt3S3sjmSTFh+NYLu9jZClfqIpO/DVKuPqAQa0xNQvd8nUSRQFmEn4rRWjjxXJxjs9Yr0iuwSrTZmHz1nVkDBMDH+o6xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MucCxF5EDPXxlRJqlSlxrFnf11cI0Ciqy2qZK0DLgFQ=;
 b=oMS/m4T0Mh+vAHVBM4cLQIGrlVfkSpM3zXK4bSS/3anOnbk0OBL+wheNIgyJwQweYzzOIkRTbu2ARtZzx3xCd7l+PHKPTFojmKn6vfOqZk/FBzRFHE7+LvIQBzGlRASRGhg91bj3LM4RCApwUQuojIry44VyyJVOfYT23QsLGbFqszooQjH5QvtpABlFg9O68xum1W1WO/yZ8GXpMsidhKxb6C74rZyGhON09yvgL+5oAyvXQ1DksKUOivjSE99sArB2pZukmFG13x9zVzera8OsGL0HT4ib887tQYvZ2CMkmgd8Ao+VZ/0/tdiEcdduLwl3JHJsL8Yy1jzCmXsRuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MucCxF5EDPXxlRJqlSlxrFnf11cI0Ciqy2qZK0DLgFQ=;
 b=RsG271IXSGVUYfiggSl2yfHZ++prHy1BzL0zohiQyC3NLFJeUKT1zSQmfIuhUt1ksgVt9+SQ7EuBdOQq6at2kbzDrZdt/qMli2adgfo2FrUXogyxpLFNI9zJDsuk3pxUE7xxG959qYmt9E/UwPMgguJj/6D3teAwFpZg1DCJ1R8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <0a5616bc-bec0-4531-9161-544cb87b4e2a@citrix.com>
Date: Thu, 26 Nov 2026 18:35:33 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, jason.andryuk@amd.com, jbeulich@suse.com,
 roger@xenproject.org, teddy.astie@vates.tech
Subject: Re: [PATCH v1 00/28] x86: initial SVM AVIC support
To: dmukhin@ford.com
References: <20261105013347.719392-1-dmukhin@ford.com>
 <e36dfc8f-62d9-413f-bf6c-3a806bbd0e71@citrix.com> <awCKB7euqhzrAzd+@kraken>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <awCKB7euqhzrAzd+@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0148.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM6PR03MB5211:EE_
X-MS-Office365-Filtering-Correlation-Id: ceb7422c-c6c1-478a-110c-08df4bec1037
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|10067099003|261022075727099003|261026121527099003|11063799006|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	JlNslaM+VPDvq0+TXzqDljEpJ3JZfig2bfXKXo4Ql/yf7cgjVtlnziiIbOpKtU01+MUWyDle954I7ZSOQyQrPzDefr/ikp9jVlKZu/8uCIdeYevQCPOijautb/UW0s0xkHC5wYU+VTj+jpH/WVtIRidXZV7/sK+7qNtQ3t2mrHc3JygNMGqIi+RIIijlGQActKRTlrwpLt0HhNobr0epwYsUuP41ssSzFS6Psdt4IeypDRQvV+As4DPO7hHlsHac9qZn5Irz5mgp2x+YFM4CuVlfSUzbX8KgN7XMj9VFILWZ50cpTU/KSl+Z10XlUVd/yEBSJ2UZbMPJT1+g4SzYL8zvITX1XKj2juUsFdf0aymkPzm8xZSlcdru4A7vFvBQ+oK1F6PzEXgb6GK9ARvXXAh08yxcathAxm5xgSYExwD/OnnrtIBg0HwT/drwgsWyf91jcDrkLnUChx6qwdXXYV7G66lHdoS5qUbaOtQ3vpOC83WdGmvs4PWO4stGi+e13jirougUuZ+h0e5mtoK59FD9eaT9uN9xqIBhuHdDLE9ju4cA4i+frxyh09lxBsV9YOMc7Ezyy7+CyeEGDkHRExdXP9+OxufoCKVmaZKg7H02roPWxRa14xc8exDoqK7cw2dSlUDp3peJZ+u6/bqYa4DSTAZWIl8UbZUY6MCyhPo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(10067099003)(261022075727099003)(261026121527099003)(11063799006)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVRjZnVnVTh3d3BNd2NhV1FLOUVvam1XaEVmcVpUVVUxOS9OMHNJejRzTGlq?=
 =?utf-8?B?MHVvMmlkMnpESEh1ZDZwNGljbjhaRjFGVHc4c2FUL1FiMnphNjcrUzQySDBj?=
 =?utf-8?B?MXlYYkhDa3ZmVlBYUVdtSi9tdEdhaXV2Z0kyS3ZaUnExblBkUlg1NDRJT28r?=
 =?utf-8?B?b29DTWQ2Uk1zUEhlZGJhUEtMcGIxdEE3ejRucU1SSzh2bE5Nd0FGVUhTZGtB?=
 =?utf-8?B?c3NNM2RPSUZxaldMa3IxNExoelhzMTdZNEVpSmwyWmNqQVpXOSt5UGs5ZzMz?=
 =?utf-8?B?dmx1azk5MUtDTEdQalJIb1VQdmloa0EzNlhybUxDQ28vd0FDTzA0TWM5b0R2?=
 =?utf-8?B?bXY4ZFhSS1Z2V3VRTGpqU1lKUThqU29tOEhWcVYyWGxqbzdHZU1pZUc3U3pO?=
 =?utf-8?B?eXJjTE9YcFk3ME1tdWdoc1dwTzNGQzFqNENKc2gwd01Nc2Ntd1Y0WERqdVJp?=
 =?utf-8?B?QVJoWjlnSGRVUjI1dzgvRXVIWkNGYVBMY3JKTUNlT2l2dWpRQ1BjU1BITWEw?=
 =?utf-8?B?NngvVyt0TWUwNXQxaWV1NkpBZkxGc3dqWExFbG5ZUkh6bXo2WFRvb1BSeXNT?=
 =?utf-8?B?S1NTVzl3RlRLOUNRY09wUWtwUHpqRzJ0SGU4bC8yNzRhUHhEcFlCRmZoamVj?=
 =?utf-8?B?WjBndk9UUjg1OVY0aFFwd2xTUG51Q2pndEY4QVJtOVNiZk5HYUFnbnFPYkV1?=
 =?utf-8?B?RGZlcTZFSGY5Q0RJNU9seUJBdlpsNlFEQlluWWx3RTNPVFlMcmpQUmlLSkVj?=
 =?utf-8?B?UzBTQ3VOWExuVTBaaEltYStZeDJKWUE3VGxQRTcvTnBQNXFvQWtFREk4N29y?=
 =?utf-8?B?S1krdmIvWXVEc0plQjdpenNZYTkwRGw5VmwwRWNmU0E2UWNETmRPeHhydExU?=
 =?utf-8?B?aXdaaVZrTHR2dnZUKy9DeU1YR0NVUmRhZ3hCd1ZFQTFmamZkSGFveENuNytT?=
 =?utf-8?B?WWJ2U2Q0Z1JJdStoT3BPY2lGeHk5WWJmYnlhV0hlZEVDakw4OUlpOUNqc25Z?=
 =?utf-8?B?RDBqcDRvSXY0a3lHNElrZThhOU9IT1J4Y1JjNzlHM0R1UVd6NjFCOGZWbUI0?=
 =?utf-8?B?MFhqRmY5NjNITjcxNDc1T09tTzdNMlMvYmNPd1RpRzBFTXVEMFRFUm5uL3My?=
 =?utf-8?B?U016WmpmTFhHcGIrbzFsdjhSUGlKZmZTSmdZN25QNW8va1RFVWhrSUlKeTg4?=
 =?utf-8?B?WWIrTUt2MzVqaENBaVRBRm42QTlrUkZmUC9yUVFtZyt1VWZvTy9EUHlDK1Br?=
 =?utf-8?B?Kzc1S1ZMVWFFSmg1a3k0UVpPZ3YwR0RQMElyZmRodEMwWWdnU0U2ejExNUdZ?=
 =?utf-8?B?SThnUTZXOW9BTTlnbE1HUy9zSmw2Vlk2VXhQR0tOeUN5MTZFcFE4NGZxNFk2?=
 =?utf-8?B?c2EyanR4Zks5S0hkaXo2VnFMNFpPTlFvOTdSUVdYUXRYSHJoTTdwbmtqMkU4?=
 =?utf-8?B?ZTRLQ01McEhZT1pDTGlDQ2twbFZlYVpFbnBtUWY2ZnlmRzB0NFQvV29URkFS?=
 =?utf-8?B?cHBHNldYdW01NUFHeno3Uk9xeFBsL3VzTDNNdDA1Y2lja3pXcUxOQlo5ZFFa?=
 =?utf-8?B?cWFMMlBRQjVxa2Q1WFRwL05GaG5XNXhZK2UrWTRCWmYrbkk1QzJjb1lYb1BR?=
 =?utf-8?B?RjRtMDdQbTY3bys3OWphemxTWExBR0NSN2hiMjhMeHI2emozamVIb0dMOEJj?=
 =?utf-8?B?ZHNZa096eFVmQ0RWQlNzakd1N2h6eUZJMUsydjAxMTNzbkFIN0kxcWJ3dk1T?=
 =?utf-8?B?UTdpQ2lzUzJTajRKTnlndVlkK2lzVXoxSDhvTXJGSWxPeWZPRDhEemRRdEpz?=
 =?utf-8?B?Mm1vVUN2dGVXZHJUcHo2eDFFVjQ4d1kxTVpIcVNSZmV5MXU0ZXNJMkhZVGVW?=
 =?utf-8?B?aEMwQ0hRcExNRzFGRDZoaDltbzV4YzhzY29TbnJjYzVqRjdrWmdFNUl4ZkV4?=
 =?utf-8?B?QXFUdDYrU0V3NjNRR2NhZFBJbDFUTFJ6OXIycXZFUEp1N01GTmE5TVliMVRR?=
 =?utf-8?B?SWNFR0p1UVBFUVpkSVB2ZTdCcXViQ0xXSzFFQ2k0VDlTbkhwemNPZHZuWEtU?=
 =?utf-8?B?RVNYc0FKRzllTU96elgxcFJDblhNYi9icVFFdTVWU08vdm1VSDVTZjJaMjkx?=
 =?utf-8?B?dDI0TE1iNnZpc2ZsRWRKV2NEcFVVb0ZENHhFOGJFK2F0OHJzb0NKQTZDVVRZ?=
 =?utf-8?B?Tks3U0F5VnZkS0NoUC9ZcTVIUytvNW5waEZQbHRNOUJUVTJFMHg1cGZCbEVV?=
 =?utf-8?B?Yk1LSVFmVXF4WmorZFpUQ0ZPK2tuNlh0WVNRVFRXb0pBdVJxQTRzT290aXl1?=
 =?utf-8?B?MDF0VW5qZUZzVFJtSTYvSHlDVGIzeUt3M0c2MHNScDk0VTY2S2xmTDRmUzVP?=
 =?utf-8?Q?7IqNUbQmk3nxUd10=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceb7422c-c6c1-478a-110c-08df4bec1037
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 18:35:36.7795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sbTM9HT9F6QHAe1Yg22148pyVH0jtN4YcQ4RzehjJdkgYPCTnTy7EzT+skCkZfQ4MnKxU77WB19SuEQWY6TDjvcdd9ZPmBwvD50BFZE9h5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5211
X-purgate-ID: tlsNG-42698a/1795718140-A82F49EA-2C5EAFD9/0/0
X-purgate-type: clean
X-purgate-size: 2221
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 20/11/2026 5:57 pm, dmukhin@ford.com wrote:
> On Fri, Nov 20, 2026 at 03:47:15PM +0000, Andrew Cooper wrote:
>> On 05/11/2026 1:33 am, dmukhin@ford.com wrote:
>>> Patch Series
>>> ============
>>>
>>> Basically the entire work is divided into three big series:
>>>  (A) Current series: initial SVM AVIC [5]
>>>  (B) XTF interrupt latency test [6]
>>>  (C) XTF infra in public CI [5]
>>>
>>> For this AVIC series:
>>>
>>>  Patches 1, 5, 6, 9, 11-16 introduce various cleanups and fixups.
>>>
>>>  Patch 20 changes XEN_DOMCTL_debug_op implementation to allow
>>>  more debug operations added (like enabling/disabling AVIC at
>>>  run-time - used by the XTF test).
>>>
>>>  Patches 2, 3, 4, 7, 8, 10, 17, 18-25 represent AVIC implementation
>>>  including performance counters and run-time controls via debug
>>>  hypercall.
>>>
>>>  Patches 26-28 cover various documentation updates.
>> Sorry this reply has taken longer to get to than I had intended.  I have
>> committed a couple of trivial patches, but I think the rest of the work
>> is going to take a bit more complicated rearranging.
>>
>> First of all, I think there are two areas where we want to take other
>> pending work as prerequisite.
>>
>> 1) Moving the SVM/SEV leaves into CPU Policy.  (Series of mine needing
>> dusting off and re-posting.)
>>
>> In patch 4, you introduce a new command line option.  I know Intel has
>> one, but it is part of a bigger anti-pattern we're trying to remove. 
>> Wit the SVM leaf in policy, `cpuid=no-avic` on the command line will
>> work to hide the feature from Xen, and without much effort we can make
>> `cpuid=avic` work as an opt-in until it's enabled by default.
> I have parameterized MSR doorbell path vs vcpu_kick() via
>
>   svm_avic=nodoorbell 
>
> in the current series. It was pretty useful to run experiments.
>
> So AVIC may still need its own command line switch.
> What do you think?

Sorry, I did mean to mention this.  I can see how it might be useful for
development, but I don't think it's an option that will be of any use
once development is complete.

So, I would prefer if it didn't end up existing by the end of the series.

~Andrew

