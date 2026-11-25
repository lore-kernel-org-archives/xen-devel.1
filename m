Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE56606A31E
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 13:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=Sg6azCEu
Received: from list by lists.xenproject.org with outflank-mailman.1502365.1698332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWDCQ-0008Fp-1Y; Wed, 25 Nov 2026 13:38:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502365.1698332; Wed, 25 Nov 2026 13:38:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWDCP-0008Fi-V8; Wed, 25 Nov 2026 13:38:13 +0000
Received: by outflank-mailman (input) for mailman id 1502365;
 Wed, 25 Nov 2026 13:38:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xWDCO-0008Fc-8K
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 13:38:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWDCN-004Juz-GF
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 14:38:11 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b06e4bd-e002-0a2a0a5209dd-0a2a45089276-22
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 14:38:11 +0100
Received: from [40.93.195.39]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b06e4c1-f659-0a2a45080019-285dc327b7d4-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 14:38:10 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA1PR03MB7055.namprd03.prod.outlook.com (2603:10b6:806:33b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Wed, 25 Nov
 2026 13:38:07 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0662.001; Wed, 25 Nov 2026
 13:38:07 +0000
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
 b=NWvVlHH6BizKzfRVxBmtHwkrNECrUQtfI+PEsoids5vgKSXFDLtS048aRAawqswoY836PN/37ji9k1taCNQuNKehlOC774CkHjYgutorSN/OjY6pYY2+du4hwTNfN3oN6X9azQUvTkGdRxawRY0p0EOSE9mMuSQIMgmkwxaTbRhJvfYuLskzGJ2/aQQNFVYJnYDz3ElpHHwUG6AxsOp3ZBZ0Tw3S4dIGfjoIU5cbhjV4XYcUv+DV54l+9A3t5lryUFMcGf8vPuC2amPJDl3wjK1Tvueq3y/yEAg4tZZeXsLpFGWpjQh2Rc77z+O3ooCOaZFnLCQFYfqh2WfRV1l/+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nvjl87DgByRiqQNigdQJ/AZsJopzfxk+2O/bkF+pWOY=;
 b=bvTb0UpPmG36G9eDPuxY4HtTN2Gdv6FOh3tLigASqfpVdEXi8NNJuGlkFHG9/0gMoiwTD5Jxw7X6Z2OGFcjzK1EgvujON1hz+yJS1xbL3mSJOPXUJrZHr5WnTfhCjfJtd/DSO6rzovw8yfrjarEILH8doDOahOhaROvXfcLz/4utxh5Eao0lETs72UDt/AO6HhyhOxAoh+yfAVmd9MVOeJWHa6pb3cje7wtog5bSMPGgVkgYXNOODrX8GOxy0OE8dRONKHhtN0HiicEktywwGm7hwiS+xRTFMQrbEGcXlZ9xSfybF2WUxp2sd33Fr3Mco6BhF8qJv4nvsb2rsrM9Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nvjl87DgByRiqQNigdQJ/AZsJopzfxk+2O/bkF+pWOY=;
 b=Sg6azCEuImz5Xz+HbquaKB0SiTnZnaUqaG8MKdOy7jOQ1gn3vpNiyeBDbgzM7eSeBzxRAeryoZaGGo3HU50r/EODL8VXs1riHl/CBQYV4cTfw0mQyJGXFwUTjXc7XhOSlVBvHZcr72bZ44qjoAiXMVSVIlq6BA0pE499dssfl/g=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9e956bc4-9550-4bf0-ac08-7fdff3c9f51f@citrix.com>
Date: Wed, 25 Nov 2026 13:38:03 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5 13/13] CI: gate macos build jobs with MACOS_JOBS
 variable
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <cover.099eede8b72ebc9acb07545472d72abceed1c8b7.1785941707.git-series.marmarek@invisiblethingslab.com>
 <1c63c71893b9cc2cb6cf2dacaad8fb96fab6cdb8.1785941707.git-series.marmarek@invisiblethingslab.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1c63c71893b9cc2cb6cf2dacaad8fb96fab6cdb8.1785941707.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P193CA0043.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA1PR03MB7055:EE_
X-MS-Office365-Filtering-Correlation-Id: eedc3702-9068-475e-29d7-08df4af95689
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|261026121527099003|4143699003|11063799006|261022113327099003|261022075727099003|56012099006|261026140227099003|261009223027099003|261022105027099003|261028144727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	d/cGPh5l7WCNKOJXC0h6jpfHxmhqAw7EtkB5dJ7C1ZII31ypXtq8aChv37XdNB80CVSpdOzGdseXC7UR8QWMRSmkxVKgePDkVKdnExbhVUM0kCuRG+nqK0YMZZjGEdjTan05if+Mrzw/1l0AoOXzVoJfy5oZFONruv73Dejca76GXTLuBlVFGa7qaEPYXhsCFr8P0TAA8tGrXuPw3TW6oZzwaz6O4dCIP0u7yhofCttcflN6gd91rsiYWKZY9EIWS1Ui5PzDxxK5dttrr3yyagERw2c+ApFenmT6DQWF/izBMYYxr7Jh89ZBPW2JiYcoGtH15oImrC5WE6udN7cbFJjWvtJ/872AhNnJCzMFbaFvKXM1N38DWIQdu/QzUpBZ2jv8QFTH0qfWKUL1BSXgsWAH3UEsNUtahdELh+qMbLSoLvJY5DRISnkA5XdMaYHjLaw7ZMSkz2K4/hqB5DRzub93vBX6rJ/7561zkiVmP1Yb69vq6YfOenZXJ/QNSrbc09KAAUimostfzrjW4WCiQGY9N5gVoXUXC9IrwfhcOu5vFlt6QZ4XVElNva7zyggIoXYpM++R8x79Jlip5Po01zd+qu+07YnW0lp08kMtPvUaSJwWolOg6nrBBx2lhWQ9NYOXDAKxLb1pETLkMvbhaBiH0LJDDVpIqv2EItGvLgE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(261026121527099003)(4143699003)(11063799006)(261022113327099003)(261022075727099003)(56012099006)(261026140227099003)(261009223027099003)(261022105027099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHJtcDBnWFo0N1RrVXVlVFZWUzNxeGM5VEZINUlKMGk3QlJSenBsNGprUDVY?=
 =?utf-8?B?VzNWQW9LalN2cFJZNFlkSU5teGoreDJJUEUySkM5MWdWMCtaeHdnQmYrbHc5?=
 =?utf-8?B?RE5vbnZIRm5ySzVnb1Y5dlo0VXNZOVM0c2w0SXh5UVVROFJzUDhCanNSUDht?=
 =?utf-8?B?OGlGMFdmMDlFM01LRFdIZlV5YmJBTGswVGJ1aFRQU2gyTDBlMXFFZVp3ajFO?=
 =?utf-8?B?c2FObDBjclVvamZSMXF1WGJab2hOSWZ5WE14cEtiK2RlOFFoNi9CM2hHVFBn?=
 =?utf-8?B?UUZmZmcvSUdQT3hLYjc1c3VkZit1dDRsSkszeVF3dW5iRmZCdFA3dVNidTY4?=
 =?utf-8?B?QnZZTVBIZmc0UFFJclM5OWFaS3lqdFZBd3JTWG5SbHVUTjlLamdaQjFKSjV1?=
 =?utf-8?B?L0xVSTBaTG5aZ05IQ0ZJeTZETSs1YWhEVzdndUEvQWNLQ1NGYnd3QlhDVDNO?=
 =?utf-8?B?bUtHeWxrY3VRUHRJZTFSSFBwR2JmTEcvRUYrODZkNEpEeGo1dXJ2SXIyTWFY?=
 =?utf-8?B?ZGdKaFY2YVhZbkM3dE0wUVdjL2dQSDQ3N0ZxdllrSEpMdURrQm1mcXhpbXlH?=
 =?utf-8?B?Y1R2M2N6VlZGSnZEZzFubGFuSUxFSW1HVDB1TmJrR2U2alRjbWlHMGF0UDJ5?=
 =?utf-8?B?eFg5QW5mYzNQTlVLcThmdFlYand4dGpOTkdYdEZCMlc4dzEzV1MxbW0yQUNU?=
 =?utf-8?B?QUlEUy9QaUF1QUFxM1l4VWhjRlgwMktsRTB3d3lSMDltcGdVSTZPWGIybEtP?=
 =?utf-8?B?aHV6anBCV3FHbFlHRWNIRzBZQXR4NEFlUEtlbENnbkhqRWg1Y1Fnay9rQkU4?=
 =?utf-8?B?cXRzSW83TWoySm91YWErWGZwL0k3TGpXVE9vRFJ3bzAxUTVQWHZwTnZRVTVz?=
 =?utf-8?B?WXhHMHIxV1ZaSHZOUFI3S2t6SmpBVmFNeExkNmtTUysxM1MwMnFpTTR2Y25z?=
 =?utf-8?B?ek5LRmZGWDRVR1l1WEIxZCtoNWU5YzVRUVg2L2Qvc1lZOHdHQjVwZWpkajcw?=
 =?utf-8?B?T2VDSENoWnVBZXpqOHR1MVFVc0FEMmF5dGVQVDJwOWZBR0JFdXYzSDJ3QXRi?=
 =?utf-8?B?eVJ5V1NlUmg4U3kwMTAxeGxuSWt4RnpTN1UybnJ5Mi9DUURBMzVmREtlc3FS?=
 =?utf-8?B?T0ZqckQwWVV3Szg2cE5tSk1iWXY0NCtEQU9GbEdUUWROc1lZZjc3TERFWjZl?=
 =?utf-8?B?NlIxMkUrdjRYa2FVaFE3YWlLSGJvZUMxOC9CeE5pNklFU29NdFVwRDJPaG9U?=
 =?utf-8?B?ZytzSlZjN2kzZGpFdW5OeHRqYWh4ajR2d0VvNVFRWDJTM2tEdEhUekNONXVx?=
 =?utf-8?B?d2h0dkx3Rk9FVUZHdTFyVlZ3MjVMQkhNaEJsN2JHakRZcjliQVI5VkYyb1li?=
 =?utf-8?B?eHNuQmlRYU9BUlhiN1dXT1E2a1kwczFZVFBXb0I0SGliOTk3TEtFWUVZcWVh?=
 =?utf-8?B?M3pIOUU2SW8vb1dxSGEzYitGV09laFU0dVIwMThVOW1VWjc0YjVGbGJ0dy96?=
 =?utf-8?B?SXJzMVkxWjhJbjgvNXM4QWVRSG5yMlpGTE5qYzVGUms0aXJoemR3SVpuSUYy?=
 =?utf-8?B?cmJFSkVlOTR2L1UrQUpZWk9vVzJrbHlIZzRZelEyZ08zRDBmdlpQbTlCRHZV?=
 =?utf-8?B?Tkt0dUppSTBsczFWUVN5YlYvODVYNnliOW9acTd4ZVl4aEJCTFhDODVnUlk2?=
 =?utf-8?B?YXdiVnJXUzAvOVpyWDNWS1RLdW5LU3pySHdXUFhudWs4ek5YRGxCaHhxQjhM?=
 =?utf-8?B?Zm0rUmZnTkF5S2xrREVVUGdFV0Vibk5pcjVVb2ZtdjJJd3IvNExjRFdmVHND?=
 =?utf-8?B?VVRramxzNzJkOEd1ZWdrM1JpTkwveC9STVNVaHZsajJ5UEptSlVtelpJQXdI?=
 =?utf-8?B?V0s1MkhIVSt5bWxOSjR0cEFBL1ZGMFJNNmRIdE9kcWpoaVRORVdsaCtrZ3Nq?=
 =?utf-8?B?VEJJdXlTUlRwMC9hYkRYZ05wUVovdFJpT3ZkbnQxTHl2dVV4dVNhb0hIWDFC?=
 =?utf-8?B?TURoNzVkalp5UTh1TDBLMmozczZwMkZ4VFV5S01YRHZYNFZmdmhxVUc2amh0?=
 =?utf-8?B?KzQ0YlpUR1diVzdsUVJKcU54VVkzbk4vTVZtZXFjV2NLOUsyTHZFQVhSTFdl?=
 =?utf-8?B?STdxUW1aekdKWVpjdm5tSWgrcXRjOERTNWJYZ3VSR3dyaVVXclNtR3JzdGcy?=
 =?utf-8?B?UlQ5UDlzbVF2VVZpTlpJVnRwaWhQSVQvUVE0OEZFZ2pVV3cvak9XajU4bTVn?=
 =?utf-8?B?bW9HUGxpa05GcXpNbktkVmEzdVBGSjdvY2pxK0pnLy9VaTc2KzFvQWJsRjlC?=
 =?utf-8?B?dmIrQWs0Nlp4U0dva3JhcUNPY1VhanFXMm5vZVVVY2VYNmxkc2MzQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eedc3702-9068-475e-29d7-08df4af95689
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 13:38:07.0862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +oexzTbO77rUW6xm8SkJDIv9g460oZ8LQjbG5cjZtPsMG5/ox24sgwsfPD5a2spNKMJQSsxZjbgLnbsSrNQ3nnwOvW2cYb+dEkKyVKnzjBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7055
X-purgate-ID: tlsNG-c1860d/1795613891-D534D87B-84B0F013/0/0
X-purgate-type: clean
X-purgate-size: 1003
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 05/08/2026 3:55 pm, Marek Marczykowski-Górecki wrote:
> The macos runners have limited availability (they aren't enabled for all
> repositories, and have a monthly usage limit). Do not schedule macos
> build jobs unless explicitly enabled with MACOS_JOBS=true variable.
> Note: just setting the variable is not enough to have macos builds,
> relevant runners need to be enabled too. Unfortunately there isn't any
> built-in variable signaling runners availability.
>
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> New in v5
>
> MACOS_JOBS=true wants to be set as a group variable in
> xen-project/hardware group. Specifically, on this page:
> https://gitlab.com/groups/xen-project/hardware/-/settings/ci_cd#ci-variables

It needs to be project-scope, not group scope, or the security trees
will use runners outside of our control.

I'll figure this out.  Thankyou for fixing this bug, it's been
irritating me for a long time.

~Andrew

