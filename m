Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F320C5B572
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2026 14:00:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388259.1629470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtn1S-0006l8-QV; Tue, 11 Aug 2026 14:00:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388259.1629470; Tue, 11 Aug 2026 14:00:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtn1S-0006l0-Mg; Tue, 11 Aug 2026 14:00:06 +0000
Received: by outflank-mailman (input) for mailman id 1388259;
 Tue, 11 Aug 2026 14:00:05 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wtn1R-0006Q7-3U
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 14:00:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtn1Q-003DyQ-0j
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 16:00:04 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a7b2ada-bab6-0a2a0a5309dd-0a2a4504eaec-26
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 16:00:03 +0200
Received: from [40.107.208.23]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a7b2ae1-b57f-0a2a45040019-286bd0174e36-3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 16:00:03 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS0PR03MB8197.namprd03.prod.outlook.com (2603:10b6:8:28e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 13:59:59 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 13:59:58 +0000
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
 b=TYZvjBROyI+wII/17UrH9QnzVpyqctauJXG+dvj+CRLM4T4oSOFpc9w+MlMeweylgQGpOlRrXsOY2w+/S87p0TjlL+D+f0g8FSiL0yjlC9MQDlX8Q/fnoV6Ip/d0/mfmlUT19jSNrh2stjOH0sCRiglwe/wuzkRyMhOv+LmX4dAlcSkr3X3fJDSJm5gVDdI5uzy1wJ6g+6btj/tf9alS7O0sPgzHOq66jQSFv8KMae8ykx6zq97A5OtUU+8W/MWvozye8E40/DknmrYKG98sQJeh65bAEYKn0RP12Z5+ZlR3Ja/hql26JJyeaAe37mQixgQWJK30AgdTh4w8PkyCDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n0K66Rlwl8cRN2U2VYrij4lVf/l9gfUC2MKBew1hXig=;
 b=yEi6945I3soIH/ExhEVGu00NmVPuqM8whlK9lrNspuXVAvyH6CuW1E7HBL46ieAmM0nPedF+2+icr/ssJHYowIOmtvsZUZOBxbMmHusRNJe+vGlCb7+UweefIDERnoOfZTT9sVXzDvbzszfz0nUgT6SA25r+7SqBXG9k3mUYE8wYmWKZTqWAGcUd/lyYwTVj6I5bMNHx8DNHTexxK31n1ugnRnJ1YXCWktvFSGr+FckXu5UDKw6BTHlHX6a5C6pJvH345v4mX+/ohKWa3mhSQI88J8H1plEdWsCZkicO61gxpp2pnMJ1pURBn4m7A0cBSUfW5ux5e/KdY8/V/sdY9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n0K66Rlwl8cRN2U2VYrij4lVf/l9gfUC2MKBew1hXig=;
 b=YTKimTGGR9HCkMrPfdy08UuVFMEmFeqFECa+B70Lq6rEh5Mwdy8S9wbdbYQpA0MDM7UH/V4B/TPfTcKV74x1cULmJifmLnJBRQxPpYtperbAEKW2cOGFWANH9qVLc6R7bk0aWQmcbGub2354tnAjwArYVCGicYHUWJAGkyjRySo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5e314dea-42df-4a5e-b855-f5735760ee66@citrix.com>
Date: Tue, 11 Aug 2026 14:59:50 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>, Andrii Sultanov
 <andriy.sultanov@vates.tech>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v3 6/6] xen: make config argument const
To: Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
References: <1784210820.8631fc262581453bbf619ec5b2062170.19f6b408bba000edb5@vates.tech>
 <20260716141138.88265-1-julian.vetter@vates.tech>
 <1784211106.8631fc262581453bbf619ec5b2062170.19f6b44eb46000edb5@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1784211106.8631fc262581453bbf619ec5b2062170.19f6b44eb46000edb5@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0025.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS0PR03MB8197:EE_
X-MS-Office365-Filtering-Correlation-Id: d034012d-d04d-4910-94b8-08def7b0d3cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|10067099003|56012099006|4143699003|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8bdjZS87W5WBMZOGBGlCvg1eLt3xz1iAJNW6IwCYsUone5O6oHcOP/oh3n9rx3vFcddv/zSZ4nS+u9Tif5Y7yaBoQ5J+kBSswU3Q6H0pB557NjJfCRIQJsragoGtxwey4CBeFL1B1LI7iE/a0pFWTrBgrawdE8oLRsoxTgFsV++8lFLqJDva8nKO0ILEmMOzjuN8tL5PsAqhWs8GsFdBx7vtutz37v7ORrxN24hpEGorVsu3RYneiDPrA8sfq37dJ9/6gW6foRNpvvnUNPU/371MgF+BZy5K70rSUy5f5IJ0ve+eJfxPPEUxaDx0A7NYhkuMJOrV7YSrSH8lHW6flUzw2qvZQwHqgZrX02XajMCtqnuIvfq8BagIy0PqZh5Bctds8HQp4b113BopUNSC9HwW8kZj3BZEpjuV4HFMV2np+LPDzqrFGO9iGLTCjD4XwWG+9dwKBMiPWFTf15slYTpw8YLKwXmsxLuYqrrDx2okIddTcVhxTiKKgsFtJytcCVVrYzE5sfx227l+hmX3m7SICNu05uZFdhlJ1t4oNHPO12J7e48OWitKHU/edXyI95ZW+z5TPF945ankeMPcOPkQP1xgQvFTNX8+JAwrPaYwyf/4zn8BslfjQq3HZLwSMEezLmtGHBd6XlAHdRU+39Gj40lbfNey8Y7nCfCYiHU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(10067099003)(56012099006)(4143699003)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVQ4YjRnQVAydzBERVgrbXBxSS85a1BJNTdwS2xtQWxHcnRoOUNyK3R6WjFG?=
 =?utf-8?B?RG5QL0xHUWFuYi9kZ3U4OStFWkJud1lNWWpKVGNPQzN4Nk9BYkc3S2cxQVBM?=
 =?utf-8?B?RGMzSDNDQnNIb1ZlbVk0Rzd6b29DdUZySXYvdjZHU210Y0I4eE1wUjlFbTl4?=
 =?utf-8?B?aGNQTEg0TDhmeVJXeGZJMy9aNTQ0YlVGeGtjb0Y3ODRJcDc2VkhyM1FncTR6?=
 =?utf-8?B?azhlLzRsdmlQbkVXMi9NSHgvOUNoYndVcnBuN0VQcjhWV3NiT0JyQjBkMTU1?=
 =?utf-8?B?MmtpR0N2eVgzTWN2MGNUbzkrVjhQSktkTzFwNG1vTzRkOWk2RnYxRmphRHJo?=
 =?utf-8?B?M1JaYW9XYWFwdVZpdkJDMnQ3Q0JtcGVQT3c1TFdnS3NMMWhOUXp4bUkzWSsz?=
 =?utf-8?B?Y3lweFBJeEl0NnA1WkdzMm1SNm9JNGNGWFJKczBlRytCaU1Ha2hCZ1pjZTJv?=
 =?utf-8?B?dDYzWFFWNFVMcEoxaFh1YjhYMjB3UDMyUmVDcWFPWTdpKzhkYy9YenVHa2Q5?=
 =?utf-8?B?RHh4TzN1VHY0RHNrYXZCN2Y0ekV1UkJBTk1ackpJUjlXREJoN1AvQUxMbjFE?=
 =?utf-8?B?dml2MzhGM0ZOZUZ5SStWcnZhT1VTVUtINUFlNWJTY2hudnREb01ydG5OMFdP?=
 =?utf-8?B?WU12L2xSM040VzdrbVhmRFVIQnFCbTVINjFaYVFpdVJvOXdLa3F3NmhlVjA3?=
 =?utf-8?B?UDlnMkVYbDB3VHNvVDRMS0M3OFhrS0N3dWs3YXZlemIxbGJ1SnRjY2FTelZF?=
 =?utf-8?B?SGM3QjYyRDBwbkt6eFI4NFQ3c2gvdXJpMk5OUHd1bll2eU5Ybi9tS0g2TmVn?=
 =?utf-8?B?N2xtZldKOFpkcEZTaGtMRkhaVmNxU3ZrUmZYK3VFeVpXTDhuL09tZnhQYjF0?=
 =?utf-8?B?UWs5Sis3R2c5eGNqRyt4TGFiSjhLWDNQeG14NEpjVDVJS2t3ZTV1MitFN0FH?=
 =?utf-8?B?OFdQVFJKMGRhTTZtOGhvdXQyKzErVDBDUmJUUnUzSFNWVE9hZFNMWmd1U3pS?=
 =?utf-8?B?dVRDMGtFUmNvSkJGbXVBSklWQWFnSkRwdFVzbFpzcTZtck5GVkRhRUJxRWdv?=
 =?utf-8?B?TVdqWjRhMFB1OGFOUGY5MmszRFpyUi9CcTJZUXAvWkNheEdGcWE1L3cyMi9p?=
 =?utf-8?B?MHRuYjhzV0FmTGhQOGJNd2pMS1VWN0Erd01lbnJpb2dNTjdoYWJVT1RnVVFn?=
 =?utf-8?B?dXJ6em15SDFPamdJRURoL29XTEYrVU1HOVRvNXdVZy9SdXJEclpDUFdoenJl?=
 =?utf-8?B?YkJ5R3hxRXFuN01IUlRQTkJjK0ZLcndOdDYwRjVKZE9wYmg1a3hoWjMwUmlJ?=
 =?utf-8?B?TUNlQlp6ZnFVY0hEdW1EU0hndko0c2c3QlNOL0Q4emNSMzJPNU5vUlhoMUlQ?=
 =?utf-8?B?T0Rlam40UHhlbWI2T0tvWmdLUXlhMTZab0sxeFNiZmlzSVdwaHNKOCtqQlBh?=
 =?utf-8?B?Sks2VFQ0MFJ4cFUrYXNnSXdodnJLc2hicWZSM1JNRXZ4ZDJkMlcyNk1OSmt1?=
 =?utf-8?B?Q0JmQmRFdU4wQXR1VUNGTUpRdWFGMFVDZENTcS9SY0o0K25vTmVDUEFPclgw?=
 =?utf-8?B?SXY4alV3SDFud1NER0NPTHRPSXcwTWdvQThUdUxNQTEwbHlqdWY0TWppY2po?=
 =?utf-8?B?STF5R1MyS0dmbFFkR1V3TGloU2JtSTdBU2NrR2E1bytOdnJyTDVwYTNnQUV3?=
 =?utf-8?B?OW80Y3crQXBQVzlmTmU5TFNXLytIblJPT1YyRWd2YTVlNzM5Q0N6R2l5Z1lu?=
 =?utf-8?B?cmRFZEl1L0NGWUJMb2xkQzQ1T2ljTUR0NWFWOTVQSm1hRHFXTU0yWVdrclZI?=
 =?utf-8?B?WXZEaVdRelo5eVQ3VzhqU0VKU1ptaU5WWkxFV3ovY1NkRzFsSjdwejFncDZE?=
 =?utf-8?B?SHIwV2NRbGpNRGRkdUU5NzdFRTN4QkpXc3FBa2hjd2xkZUxLUWMydW5vWDFs?=
 =?utf-8?B?SjE1Y2RzOTBPdDluVWlHbUdlZGV0REtwV0dqRGVKdHR6QWxQUmI3NnN2U2lM?=
 =?utf-8?B?NXpHWW5CczAxMy9GYTlnZVJSZjJwWE1oekovK25ma21QcWtDeTFBclJIbmlt?=
 =?utf-8?B?M1ZBd3h2ZzB3K3dJVHArdEE0WUtZWnozV2tPc3h4c0tMMVpmWDE4MnFjbHNh?=
 =?utf-8?B?R1dzck5ndmplNkkzQno0SmRtMVBRSzMzWHZ5MTNCeGRjZ2h6d25sdDNOdk9m?=
 =?utf-8?B?T2diRlZoSGVWb2pVZEc1b3JZY1B4QTAxaGEwdDhrQ2xocm5sMCtQTDVJRVcw?=
 =?utf-8?B?RkN4ZS9UNDExUXB3U081N0paK0hLblBVdVhjS3dhZ0JmSUZjUmtmcnpXcmE2?=
 =?utf-8?B?UFBET05iYTBqeXYwWmpMZTk5bUk2THk5SlpZdktKSnR1SHFTT0NwZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d034012d-d04d-4910-94b8-08def7b0d3cb
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 13:59:58.0736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uX5YRARdr9daLfABKDZZGZukgg2hy1ub/o8TnUDj3C4fDfaJJOk263QUOuk4a0a/STKE79xtB3buQWZ+zineQ9J74XiFn/oHtV4kREaalPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB8197
X-purgate-ID: tlsNG-ebf023/1786456803-C0AD8B50-D4C55635/0/0
X-purgate-type: clean
X-purgate-size: 992

On 16/07/2026 3:11 pm, Julian Vetter wrote:
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 011292e9f7..66ed7454ba 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -756,9 +756,11 @@ static inline void domain_update_node_affinity(struct domain *d)
>  
>  /*
>   * To be implemented by each architecture, sanity checking the configuration
> - * and filling in any appropriate defaults.
> + * requested by the toolstack. config is not modified: createdomain is
> + * input-only, and the toolstack is expected to have already resolved any
> + * defaults.
>   */

Again, "toostack" is wrong to say here.  I'd suggest finishing the
sentence at "the configuration."

~Andrew

> -int arch_sanitise_domain_config(struct xen_domctl_createdomain *config);
> +int arch_sanitise_domain_config(const struct xen_domctl_createdomain *config);
>  
>  /*
>   * Create a domain: the configuration is only necessary for real domain


