Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FFF606A320
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 09:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=MGSdULk6
Received: from list by lists.xenproject.org with outflank-mailman.1497925.1695957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUKpc-0002hL-FA; Fri, 20 Nov 2026 09:22:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497925.1695957; Fri, 20 Nov 2026 09:22:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUKpc-0002hD-B2; Fri, 20 Nov 2026 09:22:56 +0000
Received: by outflank-mailman (input) for mailman id 1497925;
 Fri, 20 Nov 2026 09:22:54 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1xUKpa-0002h6-JD
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 09:22:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUKpZ-007TNO-Kc
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 10:22:53 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6b00116a-e002-0a2a0a5209dd-0a2a45068b3a-8
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 10:22:53 +0100
Received: from [40.107.209.59]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6b00116b-195a-0a2a45060019-286bd13b07b7-4
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 10:22:53 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Fri, 20 Nov
 2026 09:22:48 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 09:22:48 +0000
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
 b=hhqpou/c69/7y/yZWf3smBAJexA2pGu7tS4XD6XqBMdDbwb9vLGaL+GBpoUrC8dsxB5D3e+yIWnS3df/UjZHezDk8v34XzAqs0m4fGW2OWNvjTaPncCPTeVYla0mCWJGMnk3b4TOMnZcjh4DULxA0fhltrR3Pzx1PspM9CMD57DgRMnuN4kY8AgMwCR5azKCeGQ4tyXfju+Ak56C+o1zlxEUrrdr7CoV3cKTDevy1u5uOmISGxtn9Hynddhi3R1dmnY8wJ5wpgVrhLs/N1t8nVDQ0JMPVGhOvcyCKwetEKj9WdpAbXnqwFnzBnYDQxwmvJipx3fyYkoHv51vbMcGmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=syHnxj4Mt/t6CYVC+IZGOjxDJHK51qrriwU9fGKaaAU=;
 b=PDnugUGxhyAFJJPMIWRK6rn/6sWbJypBvnrERhuMssXxELs2O2TNUrlc7S13OPx/yvhlnBWW9wK/iZtqN6g8wb3OXvT7szYWQQFMXxUY+U4+pgoG/31hmJ2H4e14QH8vjmJlThsYGi3MxdkuLm+n4cy9lsI/AeO9gDs4W4yL24kQK7H49vmtTt4O75Q/9q/OCfoD8o/quvLaFQI4ohTSON5hYiGfMde0bP1pyG/7MA/DElwc/BaOXKncHlLVHBqeMaJkivAn62TwtBWpi/0rRDvhCoPbtjlpiLzkBewIzMIKN+hEofpsQMLxM57wrWi6UitkNZuYcnu+/xZBAvXUNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=syHnxj4Mt/t6CYVC+IZGOjxDJHK51qrriwU9fGKaaAU=;
 b=MGSdULk6XxQoMwzxjSyYYLu+MLUOzfqnpd9baPBQsBlUi2uEEQRIANDrpB6O/5NTROu7Y82TjQG1aqpGOlaVGuubDfmw1ubIQ3tfs1riDVK5rWFmwUvoRPslhob1eqrMheI/Ctxsg2B+sXpwxXzH2pQT4Kvpg4oo5WOz1+m4H0M=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <be9ea9db-c57b-4387-a114-67784dcad386@citrix.com>
Date: Fri, 20 Nov 2026 09:22:44 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] x86/nestedhvm: Fix #VMEXITs which L0 creates for
 L2 events
To: Stephen Cheng <stephen.cheng@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <20261120090013.271926-1-stephen.cheng@citrix.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <20261120090013.271926-1-stephen.cheng@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0155.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::7) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|DM6PR03MB5196:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a4780e4-331a-43a2-b368-08df46e7d7ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|261102123227099003|10067099003|11063799006|261026121527099003|261026140227099003|56012099006|261021121427099003|261022105027099003|261021123027099003|261028144727099003|18002099003|22082099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	UExZwAFbKnv0BDJGP0a5v4U6XjsFlw+g1Q/5UexEHUs2gxs0q3hofP6RPe+vwAo8k7e+h/BtwTv9AobkKggpgjUpSFy4UVzgPai1Fe9ZrrIAkDjN+n5VWWOFORGiGP+HzZHRr6It1ShNz9knVNA2J83j/TWvmKo7xWI9BoTWRrQ58uhWok0swMc4jtN3KNLkF4c0yhSMRn2jk5T6XF14qvi+Zci8/0FuVJ7NTLcKjNbrSQCVmxSnhbxN1F6hsAvXnYYEsWwfoFzbJxPvCiSaE27d64zrF0rnv5CjgQ9NTlBFdFCWlO66GUhu0Cv30ZdhXgqWcv/6DuONtRoMC01LYsu4f4LIXiaGGycOQo7B8SmAPojmzqLFccdn9zbAKeuU+x2jLAMQPsLWZ/rF9vEc0FVsy6Z6MazzTbJQVE313ZHENvX7I6pqAe7yqqr3OdjbHoYnK7v8CybEEvYwZLmWccq1Z+jvvMGMKz91yj2gb27nJ5GtUuCD/PtBaVEauXW+kqhCbgAer6ggpTwy+b4cEETBNBKywDvgRBysxu0ElGg6yQY00QnfO01C0DmA4kyI8bi7DASiTyZ0PGmheX0qv/QwIm+r5qZP0PaR1XoNT7fVr9QRVRCgjl+I+Swsq+nn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261102123227099003)(10067099003)(11063799006)(261026121527099003)(261026140227099003)(56012099006)(261021121427099003)(261022105027099003)(261021123027099003)(261028144727099003)(18002099003)(22082099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZENONmlnUXdZN0t1eFNPa2NuM1JRR3ZZZmZNSVVadmVUcXY3UGNoeUZPa3JU?=
 =?utf-8?B?eFFsR1NsM01XTlZaN2p3M2NpR2xmbndIbnZEUDBoZzVLY3ppVUQycm5ndDBn?=
 =?utf-8?B?emFYZGIwSEY2TTBMZUM3b2I5MzZ3bDB5M20ra0pSdU1pbXBJS1VZbVJuOFBU?=
 =?utf-8?B?bVU0TXlGTlRDcFNqb3EyMWlQM2N2YTVsRkVzT0VZYmtqc2ZmdEhYS21OcWJh?=
 =?utf-8?B?M0k0NllObnNWM1ZZOGF6cVFOM2JmRDdCaVFIOHlRREl1ck1SUXhpTi9LRXhU?=
 =?utf-8?B?Ris0RGgzTTVqeWVZYXlGbXJGSnpUR09EWGdrS0tPSmZySGNtNDNPRlhyVDJB?=
 =?utf-8?B?Tm84ZUpkZU84eW54QmRUTVptZHVVNXNibmZOZ09SSFFDYVh1Z1cyc1lNOFdp?=
 =?utf-8?B?UVY1V3JLWVlDODFxUDJzS25aTHVTSm1XL2djdTM1VlBEWWM3S1A2ejQ5RFQv?=
 =?utf-8?B?VU5nc1dWWGFHQ2lrd1RqaEowekk3YlUwczVqM2dtR2pTMkxmeGpiN2p4RXk0?=
 =?utf-8?B?eC9kWmdUMVhGaUVTZThaWUQ1aUJaUVU3K2MvMDFweXN1NjdQVjBLTjFHNDd0?=
 =?utf-8?B?eXpTZEQzV1N5cnIzOGdiQWhkTC9VWkhOMWFnak4wK2VUL05ORlNKeC9QMGw1?=
 =?utf-8?B?blBGQWNZTXE5ZE8yMmlucXZVNnB3NytJcXZkQ2VnSll3R1V5Y3Nta3NTY09m?=
 =?utf-8?B?M1ltdmljTjBEVlU3bW40Q2VRbCtBQ1V3T1Q0SS9maTB1endoU1lPdjgwdmJt?=
 =?utf-8?B?WmtieWdhdWpmOVZuMzBPZGZPZGhIZ05LWGhVVk9sOEUwMnUvV0pCeWpqc1ZG?=
 =?utf-8?B?d1k4dUVhSXRrUDJiTDJUSm9rOXRBVGZIcHppQU90UnJFT0VhQjVsOEM0VnVo?=
 =?utf-8?B?MUlheFZqbVY1KzREMVJraEhMNlBRcmVubFNvMysrK0c2Q3NlYTNEcUEyeXRV?=
 =?utf-8?B?ejkwcmNRdUhWUEZtb0M1S0owNGg1VS8wQlBGUXpLOWN6SjdtRXdHMFlIQUNh?=
 =?utf-8?B?ZU9hUnhvbmFoNzlhZFg5TnYwa3ozOFQ0OGc0Qjd2YkZsL2xmbThMdGM1Vy84?=
 =?utf-8?B?L2JLeXFXcnRZTmlaY0o3Zi8rK2lyYVorSnlLS2lQSVUzcmZDYUhaSmp3R0Yr?=
 =?utf-8?B?STdwbElyYW9KMTMxbmFET3hJUzd1aHN6NFJsSkxNZ0M2dWZRWndHNC9VcHhD?=
 =?utf-8?B?REtrWDJ4ZDVHNkRodFNwSnhQbThvVzZzVE8vSEY3K00yaHc0WXh5VGNVVVht?=
 =?utf-8?B?VmQwQkEveFhKUGxaUFNreUJmSStTTEpmUzRUR0pENk96WmpFeSs3ZVVGVmli?=
 =?utf-8?B?emJWTlh0ZitMYVEyNTFMR3JSYzUxc1lqQVRnckRGYjYrV1hVMklhS3F4Q1Uy?=
 =?utf-8?B?TDNzcXppcUE4elRkVXRsZ2FvalphRlcxWVNIdEVTUjhhbFV3cjIvL280VjN5?=
 =?utf-8?B?bk5jVEpkK3U1MXIyalh0YjVnUkdZNi9MZXVlZUxuNThQZVMxTUNWUElVbFlu?=
 =?utf-8?B?eVp3WXUyRkZWV1Rib2E3YWd6N28zcHl6ZDRLZk1YbXZrSmtqUWc1KzR0N3c3?=
 =?utf-8?B?a1VNY2ZIdkpBMDN3a1NoN2tmbWVwVGpVQ0dCZ3hxbjNGbTRCTmd3TS83T053?=
 =?utf-8?B?ZlMvaHFEQWw0eENKSEkzNlZ2S3Q1ekFmaGtCL2RVengwRTg1dm4xVlRyK2ZV?=
 =?utf-8?B?Y1cwdkNlakplbG1vbFRwcGJqRnBJb2l1bGp2aWFiTW0xTEtlc2M5NUhjRzQr?=
 =?utf-8?B?b1g1c3FLdVNLNnJPYzlXemt4a2x1YWQyTTJ2WEpSVU1HdGZDN0Z3aUVuQ3h3?=
 =?utf-8?B?WVBYS2VBSFo0cFA2N2cvYmVHdnl4dEhGSnpISGlmRnhnQWl0eGNLWlJCQ1BQ?=
 =?utf-8?B?a0RMaWpGVU5KOE1iVXJnVzhySitJOVl4MkF4VFltKzJncXBoREJkNFJzZkR1?=
 =?utf-8?B?blVBamMyOXFUSG9ta0dGckN2K2wzdjQ1U1Z5bDhEU1dwekJzdUJnMmd3OXFG?=
 =?utf-8?B?bHMzWnRhSXpuMEtNcGxtaW1WV1RSRVRMaFVreVNRdHZSSUs1NVVnaFFjYWpR?=
 =?utf-8?B?aHNEZHVxc1lVdTJMYzR0cWRObTdYS0dpS2E4VkxmZ3pBcXRwZndaTXgvTE5X?=
 =?utf-8?B?UnFFc0FMYStCVjQxZXlEelRzMjAvNzZhQmhHM1RReWwwZGJYWjN6Y24vSzVa?=
 =?utf-8?B?aEo5L0pkeXdIVkpraXBBNzd6dEhYSWxJNjFTQ2VBU1lUZWltL1I1UVBsbjdX?=
 =?utf-8?B?V3FMOEJOUTFtUkpUUmJFajRjTFRLNjNaUnFGazZpRStpOStzcDlZRlFidEdv?=
 =?utf-8?B?RHJRVzZyWHlIRzNYbTVqNkxObUsvcG5ETkdMUGRDYzdwRUpGVit4VzhZUmhW?=
 =?utf-8?Q?V1UwdJo+DEBr3skQ=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a4780e4-331a-43a2-b368-08df46e7d7ea
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 09:22:48.4907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D/ibq99174T5ndzxJmwCSMdBz5IMyQLlyM1XUgThgfPaNJJQmbplfzhObDUu/9MqNvHX864KBaHOKGrm2Xy9ig/EIFhSxTejpDO4QXMjrW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5196
X-purgate-ID: tlsNG-16d1c6/1795166573-FE87577B-FF8F21CC/0/0
X-purgate-type: clean
X-purgate-size: 2253
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/20/26 9:00 AM, Stephen Cheng wrote:
> When L0 handles an event of L2 itself, and L1 intercepts it, L0 creates
> the #VMEXIT to L1.  Two parts of that #VMEXIT are wrong:
> 
>   1. NextRIP is copied from an earlier hardware #VMEXIT.
>   2. An emulated INT $n is treated as exception n, so the software
>      interrupt intercept is not checked.  For some n, L1 is crashed with
>      "Illegal exitcode".
> 
> Patch 1 was sent alone on 22 Oct (no replies); it is only rebased and
> reworded here.  v1:
> https://lore.kernel.org/xen-devel/20261022090658.151682-1-stephen.cheng@citrix.com/
> 
> Patch 2 is new, and uses the NextRIP from patch 1 for INT $n, so I send
> them together.
> 
> Both were found with nested-SVM XTF tests using the forced emulation
> prefix, and tested on AMD EPYC.  The VMX part of patch 2 is only build
> tested.
> 
> Not fixed here: an ICEBP in L2 which L0 handles (always for a native
> ICEBP, since Xen intercepts it, or when emulated) is checked against the
> #DB intercept instead of the ICEBP intercept (APM 15.12.2).  I will send
> a fix separately.
> 
> v2:
>   - Rebased on current staging.
>   - Reworded patch 1's commit message.
>   - New patch 2.
> 
> Stephen Cheng (2):
>    x86/nestedsvm: Record NextRIP with the deferred #VMEXIT
>    x86/nestedhvm: Don't treat an emulated INT $n as an exception
> 
>   xen/arch/x86/hvm/hvm.c                   |  3 +-
>   xen/arch/x86/hvm/svm/nestedhvm.h         |  5 +-
>   xen/arch/x86/hvm/svm/nestedsvm.c         | 60 ++++++++++++++++++++----
>   xen/arch/x86/hvm/svm/svm.c               |  8 ++--
>   xen/arch/x86/hvm/vmx/vmx.c               |  6 +--
>   xen/arch/x86/hvm/vmx/vvmx.c              | 10 +++-
>   xen/arch/x86/include/asm/hvm/hvm.h       |  8 ++--
>   xen/arch/x86/include/asm/hvm/svm-types.h |  1 +
>   xen/arch/x86/include/asm/hvm/vmx/vvmx.h  |  6 ++-
>   9 files changed, 80 insertions(+), 27 deletions(-)
> 
> 
> base-commit: 5b28c0efc1d5d73ce651ca651e103c45b6932f9d

This mostly changes VMEXIT handling.
I think the plan is for the rework of VMRUN and VMEXIT to go in first.
Hopefully that resolves several issues but any further bugfixes should be
rebased on top of it and go in afterwards.

Ross

