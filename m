Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F10ABC88E4D
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 19:33:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1417832.1646411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x56zP-0001Wt-UT; Fri, 11 Sep 2026 19:32:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1417832.1646411; Fri, 11 Sep 2026 19:32:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x56zP-0001Wg-P6; Fri, 11 Sep 2026 19:32:47 +0000
Received: by outflank-mailman (input) for mailman id 1417832;
 Fri, 11 Sep 2026 19:32:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x56zO-0001V9-El
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 19:32:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x56zI-004ayQ-RY
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 21:32:45 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aa45745-2eae-0a2a0a5409dd-0a2a4505ae84-12
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 21:32:40 +0200
Received: from [52.101.193.25]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aa45757-4cb1-0a2a45050019-3465c119cf97-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 21:32:40 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA3PR03MB815874.namprd03.prod.outlook.com (2603:10b6:806:58c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 19:32:06 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 19:32:06 +0000
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
 b=e/T2oP7tJeCl4h0Md4WRmiN6idwZcR4jxeuPkGAzb1O6iDIsHeuHZE70Vy/ZsUYhmFKNRR4sHMGON/FGBpd01WbACp8LWG7A2gVQxM8ioh71k+w8i22UurazLFUzASBWmfY+1vnWrQSSVbBW151v+WW1M8wQ4p23GwCrVlMia+my166zSPfqAeZ7HpcK8UMd+qd41ACrg6oIHmdZZ3AH08MvlbamONpO3JPv/WvsXeu0mdkZos+P+5qtj+ki0Ec34z64NxWoleSK57tjNyGl8lFI8F+X9XxLvOdlGQLJazMMI77RQIxD5eS8e0h9s3Ca3tVQqI0h1pnw12IJQiqlcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FB5TtqEQywMrq2bB4v+9nNxpSSDLHMIXq7Ss0/YQAR4=;
 b=wb4ma3c8aWPQRt5+rNS12uUsEpzRVF0NvwRIs8qR6A3lLBx7BCB6RWwBoIOcevUXNRe7BC0vBiShNeO7L00LWAqZfmp0/Qy5RekQAOKId0Jug+LFXUBwMQK31sBES3NsdpZ7D5d+bBYJiqhzx27Jb5aYujq44z0fVrN5+bHWuz1Rfbd5r52SPexT9YGi32lpmphNjHQ/RPmlfl1l/XasHecQYiHGuxbv3TkZ0RaxSFW9XI1JKSctxof5GxyCNpHHSizxd0U9vzRR1j5Iv4RkSIjfiC/Wktr+tGl66uYidFETtWgjqPd2rsbMBwKLIh57A6vs7h6zsAl+DJQEWn8kRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FB5TtqEQywMrq2bB4v+9nNxpSSDLHMIXq7Ss0/YQAR4=;
 b=M4J+6jq9Yn1ipb8f1vhGQ5mAtwhOvzU9Qq2hBgeESK62aaK1EmtxFYH4Nef0QIc7C2qLXM5LBQWktQI+hOQ/ChBXjxHpODiPKvhnhgoR+OxvyGkUrGTqqd5PxMqrHNEXzDILD0XKwuGCGjOI8CTgtW7fTM6ny9xofxPATHBQ2s8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1f166505-507a-4932-b4a1-0e9a123d7807@citrix.com>
Date: Fri, 11 Sep 2026 20:32:01 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, George Dunlap <gwd@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86: always park offline CPUs
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b9c89c9f-20e1-441c-bf77-7da42eafdae3@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b9c89c9f-20e1-441c-bf77-7da42eafdae3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P193CA0033.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA3PR03MB815874:EE_
X-MS-Office365-Filtering-Correlation-Id: 6288ca96-bd22-430b-89b1-08df103b5d2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/aOK0IRwrOQlaJHZDLqMCBnHU+kP7wDhe9wW7lVGw0JkqmyQ/cKIN5gwKuFoxBYz3NrJZXcv6AqDq2POkPqp9RDhllWwctlOLwUDW6vBQOB7y/wPkzZ5ofubI36KAPAo0h56gwnRyPLIGEVxj5A9mBaXNpTTiZleeKLUduhitU9nd3WzgylZYVQufv9D5SKhilH12qoFanNcqAptQjdbeVLrI/a99mG04epvPwEwPpwCFCZKSfFt/VvHbhpWWX2qnT+UEvrj2uMVFZLV2sJkCPlct4mKAA3pyCnCfogf/U8te9XofuwaGKb9gbnqAKXrSTJXTsE0ef2eHF46FxpPka86yNISquzT7BXRcoeYklIMXKi8nLCR7c2jqiyzAF+pbAH9VVmSv374drOjpmnHQEhJ6dPKM2VtmHZQdZP59vngb2VgRPrIq3PPqPJCoL2lhaga6JL9AkCWHFJL7EZD/aTUAfDLWTUkV+X+v8hLgZcSsIV2P8N/9rc/Hasl7pPwiAU6+pEp+CUzA/++qGEgWDIbhp8WFJYx3E0LAekB0N0W9MewDEn/Qksct4goJ4gh6oPZrwySZ1sKNREDBwKkWtwS+/clGdAGDGr5yZEnwr2K258H6sIXQWjNT8jG9HbM+3xTkhx74EK6F3fh0LvlsNaHV4fL2m/Fi5gJ9iGQVco=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmNZYXVRV01sM0REUDJmV0xBMjFjSE1tektQMVdidkxBTURzNDNGRTZCem11?=
 =?utf-8?B?MGpLUjFaMCtCRDFJYXpGb1RTVmtxdG1RYjJHSE1PdHJMdHFLdGpqckhXcWU2?=
 =?utf-8?B?V3JWcC9jb2pGUW1BYzlQamY0bjNrZnh3QUJaSjlxV2pvS3BzZmZHa0kya3hm?=
 =?utf-8?B?dnR4WFZ3UEFvUjFzc0xMMnQvdkxvQnFNM2F2anNQc1JPK2VjV2dySmVKRjdT?=
 =?utf-8?B?WVRlS2hZWjlUZk9DN1BnL0szdnRFYisvRUdVYnZUbXhMUUlFdDZGQzRqdVhr?=
 =?utf-8?B?b2UxUUk1dk55NlFyTG5hMWs0MjVTUmZPSGlIUC85TW5OVTBudnNTVU5XaWN3?=
 =?utf-8?B?SlhqdnJxbnFTQmJpTUJFa3htVHU0WFl4R1o2dEt4Uldwd09MV1A4WTV5bDgw?=
 =?utf-8?B?OWgxUGUyVmdPTXh4WmZJY3o0ZnRuYXR1bDhadlZsblBzcHF4a2ZLVFpCRWZn?=
 =?utf-8?B?QU04SFQ1d3A0a0twcjV3Q3lNVVVkZ0ZSL0k1TjJua3d1bW5lbWZFNHpJVlU1?=
 =?utf-8?B?bjNLWFh5THRQKzdmRlN1aFRWNEwrcHpZY1VGTnl0cHEycWpoaVNyalJJdUhE?=
 =?utf-8?B?V3JPTnRPUFo5NEpwR2NlMVhHL09lWndaa3NuMjJsQzZORXdKbkc2dzJLM0hV?=
 =?utf-8?B?OXFnSitWNi83L0o0MzR6U2I2NzZvUlVpTWw5SVA3V1o4aE1La2Y5YXE0NFNO?=
 =?utf-8?B?UlFaNGxZbG5jSSsyWlF0dzdtYjMya1pSVmJuYnJDaFRJWWpjZklLcFp6MVc0?=
 =?utf-8?B?My9oUytYQVphTHpsZ2ptaVlDWWhPbWh0NWdaSENUUVlLaXZMMjFoTlN2alRW?=
 =?utf-8?B?VUtxV2VjaVZMbk5MdGVqdWxjc2RrdElxZ0h1aGwxdnU0MVlYd2NyanozZlBz?=
 =?utf-8?B?N1VhSlI4VGM1LzlRSTRuTjRJVk52Q1VONmQ3dU04c3JVVUo2MkRZYjdSbEFa?=
 =?utf-8?B?a0h3YWNvUHFmUXRodk1KQ1pKTTZRbGxVWVVZRDVlUmFtUnE3WElndjlFcTJ6?=
 =?utf-8?B?NWlQanhsQzFURWtURy82WThvTVBWaXF4WmI5SWtCcFZyZHBTOUg2d0dJTDEx?=
 =?utf-8?B?ZFRNRUw1cGFzQzRQS1hiNVVLTjI3bStWSkJwRkoyVGNUbzlnRmhBRnF2NGJs?=
 =?utf-8?B?VTVYWnJCaFZLSGlGa29EanJjNTN4U0E3aEFwd2IwNzVtWXBra1JodWpMdTJi?=
 =?utf-8?B?WjFuODdMVmtSKzdtVFNrT3h5MlVhZVRGVE9FbzBYUDI1Zm0ydCt2elBLaDNG?=
 =?utf-8?B?ZldxaFJsOEp2Zk80V0Q2S0dwejlEaXZSc3V3bmh0VC9BdG9rcU1nTUl2TzBV?=
 =?utf-8?B?MDRqQWx6N2txRThKU0luL0RlczNhZFptdWV4ZVNOMzJndFpIQWo5elhHbzAy?=
 =?utf-8?B?Wi90a1RFcVZuQzBmR0ZQQzVmeW5ZVC9UcDh1NXVHSFNBblZieFRTV2VKYXFm?=
 =?utf-8?B?bHROMVJiUktGcUZ1cUtZYXh0QldGTm5nQXhvL1cvY2l3ckprSlN3ampVL1Q2?=
 =?utf-8?B?VmxnbHhTK2EyamVITlFaU2l2NUY2U1NQb1pxT2ppSnFGZjZhdDBidEhZdGJQ?=
 =?utf-8?B?ZEpUNytrZERXQitIaWx3WExKd3VQZnhvZ1lCamdkQk1xa3JXMXlrajQzQWFp?=
 =?utf-8?B?SGlZT1l1RUVjMHpDTmpLbGJsOTNraDh3WHV0bUxPSmFmWk92UXFJUDJNeGxh?=
 =?utf-8?B?MmJ2c2lIMWNTeVBWWGxrR3k2NitSM3BIT0JKb1FpWjBFeStuQ2JucmNQUDEz?=
 =?utf-8?B?ZEZDUDNzelN0V1lWV3dhOFdBRHp4SmNWQ1VJZGExS1VoM3d5ZVlSdHVvVEMw?=
 =?utf-8?B?YmZ6cVlvMzc1aXk1MTY1OXM0OVRGM2ZvQTZ6bE9TY1RZdDAxOXdIVTNHK0Na?=
 =?utf-8?B?cGVWczdUV2pidzQ5SEJ2U1dPRm83WGNtUi9WLzJja1Q3TTBGMDJOUzdFMmJG?=
 =?utf-8?B?NVdYMkFiRXFTOGlCZGF5NmZlaW1NNXVSQXgwcFF5TVFvdlYwRzROeVYyR29B?=
 =?utf-8?B?NnFycjgxSk0yRzRQUElJV0laQktGZmJNVzRiZ3N6QVhkWWZXYkpldC9Kano4?=
 =?utf-8?B?ei9PZkdjWHVJUWNkUjRoRFVzcmgzbnRzVUJGV1ZmYlRRemxnNlFnMmF0Rk1Q?=
 =?utf-8?B?SkFoVGxmMUdHMGVvM241NlJLYmFZVUZwd3MwaWNLTGlnTzd0bzg5Wk93RUN2?=
 =?utf-8?B?TGhsaUU2UG5kbXQzRUQ3SysxeDMvQWkydXBDZlJIZjBoY2JwejdVZEZLYXM2?=
 =?utf-8?B?NnMwTWRlZ0V5a241RTdQbTZkYmpMNVZBWlhZN0daR0RxYmNDT1Y1VkpJaWVR?=
 =?utf-8?B?WElickJJcjNMREF1SE5MakZaWng1emMrczlYQlRRaGlNRnoxNlpiVlRlYnFa?=
 =?utf-8?Q?7AZg9Gzy2FWXQraw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6288ca96-bd22-430b-89b1-08df103b5d2f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 19:32:06.3441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: owWUYrD5YYcoOuWsjTBK4my+4ociBwDM8vpJ+MGTugNFe3tstpH9pagKjdIXEaYjMFElhL6ZWU8pQFOYtNLBkgv8ad/sCGasQmQ9/v7+MoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB815874
X-purgate-ID: tlsNG-c201ff/1789155160-F46A52A1-B1A0959B/0/0
X-purgate-type: clean
X-purgate-size: 1326

On 26/08/2026 1:36 pm, Jan Beulich wrote:
> While on AMD (or Hygon) CPUs the situation isn't as bad wrt broadcasting
> of #MC, some "multicast" can still happen. Therefore the reasoning to park
> CPUs rather than fully offlining them applies everywhere.
>
> Don't retain the dependency on the "mce=" cmdline option either: That
> option may best be dropped as well, as not enabling MCE will result in a
> shutdown when #MC would otherwise be raised.
>
> Drop the global variable, using a #define (just like common code does)
> instead. Outside of common code, simplify expressions / code accordingly.
> (In common code we still have to cater for x86 wanting it different from
> everyone else.)
>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> As it was never actually used after its introduction, we may want to
> further consider dropping CPU_REMOVE again.
>
> I was almost certain that we would have at least one place (presumably a
> CPU notifier handler) were we assumed no parking for AMD/Hygon. Yet I
> couldn't find anything; did I overlook the crucial bits?

Quite possibly not.  This code very rarely changes.

There will be a lot of cleanup to follow.

~Andrew

