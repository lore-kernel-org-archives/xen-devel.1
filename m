Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6EF0C982DE
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 05:47:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427089.1649726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8Wrq-0001Cr-Fo; Mon, 21 Sep 2026 05:47:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427089.1649726; Mon, 21 Sep 2026 05:47:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8Wrq-0001Cj-CE; Mon, 21 Sep 2026 05:47:06 +0000
Received: by outflank-mailman (input) for mailman id 1427089;
 Mon, 21 Sep 2026 05:47:04 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stephen.cheng@citrix.com>) id 1x8Wro-0001Cd-CV
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 05:47:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8Wrn-00FizV-9j
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 07:47:03 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6ab0c4d0-2eae-0a2a0a5409dd-0a2a450a80de-22
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 07:47:03 +0200
Received: from [52.101.85.71]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6ab0c4d5-f2d2-0a2a450a0019-34655547b0d2-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 07:47:02 +0200
Received: from CO1PR03MB7889.namprd03.prod.outlook.com (2603:10b6:303:275::14)
 by IA6PR03MB944787.namprd03.prod.outlook.com (2603:10b6:208:5ed::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 05:46:58 +0000
Received: from CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767]) by CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 05:46:58 +0000
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
 b=SkiDLzM4es5p2hDxDG+cNQE8TxnKGqOMPZO2ibTTGevkaTOKHUKpNhCqL194IVvg+dXgT0rlI/o81fhSgpXkIDagbFXky+3HCbQZPSHgUyjlV9H365NBsyTEO64mIOb8TqufRYc+e5rIbFyQqh5J0FXxKS/ZPPIEoOI8diJ+FxzspiI4HBy1GP913cDhu9ldQuPveR30Wx0HW7aLfNwwskRd1QEN9DwDFf5THRG/iY6vF6oVTmI3F4mGJEUKy74MBDlvvXv8GwIJkr07n1HQ4YZtAh2osXpADqtzTdO0zpWlqXlax62is75XhNpr89sE9RDDWl0sSH4yY7xJ94HzLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bz6kdJz6bJBZUYmXnNYr5Ji6cJljDt0qMhmgmep5HH8=;
 b=HyFACjZqX/q90fj2MlN2krRvqx1LdiMNFoI0KlguHn6+tJlBzqNcxPFSn1P0JCYZKxg0btG1LmfAQN04sJ1/j3zKq9hxUf571jXBOkUkl+Tq8w+vNkyAz2BkbZ3sgR24uEI97WCj34RjoIYYjL78uHhAoa7zLOGUXdxEP0L33mSuekWo2onjWxUHc99UwCu8elZbdBRi6w0GlxBT7R2dOCP7zGSZ0ayeimHZdgTEN8fFK3HdWGHJq0sVBO2Wau6lqP0x5BcsuPD3Sg28/s6MW643fdWo7pYYfHPoGGYLz4GXPOk0+MJfj1dH7YoRsTzt76S6t2pqKfzReIQlf1XvNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bz6kdJz6bJBZUYmXnNYr5Ji6cJljDt0qMhmgmep5HH8=;
 b=IdeN5wxXaytY33F6tjaWQkndsVUGzAQ6Ht6FJwgMRKheH7AKYkxVOpYJvaJQQkvAITz8T4sZesK33VzB9q4497BfO5EchUeFcqk9tu8lc+09RCOlpmCKi7+Eq/V9SH1G6+Y/bwMeTrvh+uBHN4JG9kNxnYPEQ6F+XMqYj6toHHQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Stephen Cheng <stephen.cheng@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/nSVM: Don't zero the l1 guest's N_CR3 on #VMEXIT
Date: Mon, 21 Sep 2026 13:42:01 +0800
Message-ID: <20260921134201.811248@citrix.com>
In-Reply-To: <20260921043148.562181-1-stephen.cheng@citrix.com>
References: <20260921043148.562181-1-stephen.cheng@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KU2P306CA0066.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:39::17) To CO1PR03MB7889.namprd03.prod.outlook.com
 (2603:10b6:303:275::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB7889:EE_|IA6PR03MB944787:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f3af6a6-9d56-4063-37d3-08df17a3c04c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gulpprvHemPXDaVroR2TbGzv8IacUdIsiKL4UGfVDCP8Scd++9Xe1t1wZ5CKFLrDdmKsuDMT3Vy8X5Td8MzjcWAfNq5GkIhEU4jda4FIMjTzzUrBoiVbEUL35yJgvOTcSRfBwwBtrK82ZW7Q0ZUix04ZZRS3z7WdoHlw1npXP8tenSbq5lO+gPjHB7A7qfqVatoT07iQlaY7BSKJUN+ld0Mj/lNiqNJxgNm8X8etSQMgHMh3w/IrwYTqHhEZK06cFhIQLq4+8gvx1x/4iZKlze1C6iEeYNmsMdSsBM3WWlGVL+bRH3XM3NlcXs0iWedcIAuW5sTFxLAr5kQrQa20Fg9Bp1cu7dMnVhNp2nHTbuNvrwy8LnztHG2aYZccwCSsZh6zD5bOSQ7F+lYWLBXGJ7RrC9O2uXcwhRky+py/oupiPyhhQsq+irsd2D8t2m7oI4tjh30f59l7lnnTmtR5kQcSD3BsmS3eyPfXQOGu6UCiZmbIVL7/Pxt7Mb30rGYHJdmvkEPFE5t9W/vzLxhoKLxYwtkw52ax+iv6Y9cQ9cjjRuDYbQIL/gElTlBft3kphWcFVqE/ykmR/XPCuOsymNybXVk4MWeDq4EdyaILMl+3t2yOBzEoP7OVlfjjoIs0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB7889.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEdsejlEK005K29XTDhvOTFTUUVEVGp1bWdmVHVvcmxyUzFFZ1hCYVpXQjVK?=
 =?utf-8?B?d0Jnbk9oWjdYS2R2Y1lEUGtDQUl3SnFJSVRkMlJETEVVaHUzQjZKaHJ1bXEw?=
 =?utf-8?B?aHYzRW9jdDNFRkt5MmhYYUJ2cENKckR0UXZpQ2NyMzhZM3NJclF4alpNWmkz?=
 =?utf-8?B?UHc2V05pNnhDQ2N0Nlk1ekRtZFNkNW5JeitWUmx3OXdBV0RpLzFYZHk2NzND?=
 =?utf-8?B?cGl2ZUdtU0Z0c1hCcjY0Z1paMzV6cG5EME05SEdnZ0EvUXlaNjYwU0RqM0Zl?=
 =?utf-8?B?SVVyNTlRU0d5bTBNWE5jUUg1b3l0MG5abkFHTFR1NVRFU2xwSTV5K0graFhr?=
 =?utf-8?B?TFBxejcrZnp1KzJSZk5MMmpvREcrR0NDaktxRTlxeFVtRnNqRi9mS3VpcmNZ?=
 =?utf-8?B?QzdlU3l3MzR2d0svWTJyNU9VdE84R2xXd0VMZEx6UCtEdSsxenU2M3BaOGRN?=
 =?utf-8?B?b1ZKMFdUQ2kzZWU0RWFtSkhicmxkbUJmNVZQQlVvTHdDM3cxMVhPeE5qbC90?=
 =?utf-8?B?UGNaSzkzNjkvZy9mNjdKZFplL1AwSGtiOXBiYWtzd0QxSnB1OUhkRlRQekNl?=
 =?utf-8?B?dTNSdzl1YTArWjUxQ2xQU2trT2Y5UVo0RHZvMDRaRXZSY1lreGpHTmZDaFlI?=
 =?utf-8?B?RDRzanphTXZyQWRkUSs0cG4wWW90L0h0Sk9oei9pYUNZWktodEZ4ZWZpK0dL?=
 =?utf-8?B?VlkydVRRUUtlV3RDYkdlQnBRU3FhMHBKU3hhYlN0ZGs0N0NzQ3B4SURpT0pK?=
 =?utf-8?B?clZYajkwaXRJbWwwdGF3aTJxcERyQitzNDBhVVJXQTFBalNSQlFBQjV3d3Jm?=
 =?utf-8?B?cW1UYkpZUStaTWE4UTlBbG50MWxQM1F5RkZ0cWhIaFc4dGdZcHFwMVd1VW9G?=
 =?utf-8?B?VklnaGpONERPenFjQjYwZzZ0TU04elJVRSsrR1ZSZHpYWE9TUkMwTzkwODZJ?=
 =?utf-8?B?YzJzUGdIZlRtREhteHYyelFxdk5jS0w4NzRDc3ptaFFYcEpwUTRXWjJ5cGsv?=
 =?utf-8?B?WmN2c1lESjJPNnBwZ0Y4ekQ3aDRVbGo0SkpDVSsrdU92bk9SMHpVSVV6czUr?=
 =?utf-8?B?WGY4U0xnY3g1VW04WXkzU2RJVFBtMUVhR01tQ3dhdnVDWUJ3TVZJdWs3K3VR?=
 =?utf-8?B?OU82cDlxZUdoM08yeVFEUzkyN0FFWkJnOVNBK3VUYVJLOUVibTNUWmtXZENT?=
 =?utf-8?B?TUJvbXkrOWUyV05zZEkzYlh6S3ZtRkhRTHNyb2RVc3daVW5jSHpEV0RIVVp0?=
 =?utf-8?B?ay83OHArbmIzL21yMGZad1ByeHlxVksyOHVlZFJkcXZaVlJtWmViZHV2NHdB?=
 =?utf-8?B?b201d05Vd2RUNU84R2N1UkFsbHg1TFZTeExOamt2ZVd6bHA2d0dpVGhiaS9l?=
 =?utf-8?B?aGh3UkN5NFZIYUxueFFGTUtjM2ptMmJiN1lvM3VqVXZSZXBvYmYyc2lHV3dx?=
 =?utf-8?B?Zm16dVUrRVNmaExQdW01aVYzVFdkTWlRN2t3c2tibURrYWpYc24wVURwUWNy?=
 =?utf-8?B?R0VHQlpmQzFmVEVKU2dmTTc5MWZwMFc5Qy9sY1hWMDg2NzNuVzNkbUI2TGZP?=
 =?utf-8?B?WGEvS1d0TUR0R3VzY1U0L3cyeGRUbVBlenoraEFtTExIdXozbnJuZnVHdC80?=
 =?utf-8?B?OXZINFE1OWtqNFhhaVdkNUdkMzI3dHJKdW1CS1N3dGhrTVBKWmtkaVhrcndv?=
 =?utf-8?B?SWlXWHRmNWZVdVZSTWlhYmJxVHhKQmhOMlBtanYvc1VrK21DaGtnZG1mVDZL?=
 =?utf-8?B?czNxSm1Ebkp3SXk0WDNXZlptRUpmSlBlUE80UFp6TjBUYW1tTDNLL2RPcm1E?=
 =?utf-8?B?U24zdjNxemRXbW1OMlREa2d0Z05adXcrVW1kTXlaTWNvTWEyNkhsNEpWMmxN?=
 =?utf-8?B?eDZHRTZTVGE3NitjTDlMVWZnRVNGb0d6d05sK3BLclZjNC84N1VFNk4vZjVU?=
 =?utf-8?B?aDI4ODBkVS91dUlzSEhCQlFmKzlNejgvZkNBbjZqVE1LK1ZGQmZrb0RBWHgw?=
 =?utf-8?B?cS9JOWxVRTU4TXY0bDBkQ0Y0OFFQVVpPQ2pBLzl4eXo0cFk0RVpvMHBQc3cz?=
 =?utf-8?B?dk9NcUlOV2o3WFU1UUxqY3paa0JWckk2RE9IZDNFU28vN3lYVXRvSW9Yd0h2?=
 =?utf-8?B?MnMwK1VkUFRXZWJWeWorK041bk03TklqRjlCN1FBREFTWlRXSXBWTG91MjJC?=
 =?utf-8?B?UGtPTHBrSXNDTXlDWFQ3a0VsZTZQQUw5UUVXaFVxY1hwUktFSmpIaU44aW1D?=
 =?utf-8?B?aDlHbE1RcDBVS0ptY0h2OHJndkc4K1Z0bkQ1U2k4Zmt4RUN5Z3VVamZYVHhO?=
 =?utf-8?B?UVZibUZ6LzMvaFBkQi82QzZoYko2ZGR6UVkrcmhrYjB3bkRBdnRlUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f3af6a6-9d56-4063-37d3-08df17a3c04c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB7889.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 05:46:58.4354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ii9Sh6d/N11kGLaHXX700LbaJP168ZJxOCWwP1lGrDq4k3y1a6u7iA/AYbR4+z8XuTWywcyP02PUKXNynVDl3qLD6//dwBLzIETpnMcK30=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR03MB944787
X-purgate-ID: tlsNG-4011c0/1789969623-4B6D6CFC-A64C27DB/0/0
X-purgate-type: clean
X-purgate-size: 375

Please drop this one.  Ross posted a fix for the same thing three days
before mine, which I missed:

  https://lore.kernel.org/xen-devel/20260918125205.374168-1-ross.lagerwall@citrix.com/

His patch also drops the NP_ENABLE writes, so it covers strictly more
than mine.  Sorry for the noise.

Worth mentioning: I have an XTF test that catches this issue.

Stephen

