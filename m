Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A21C5CFCF
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2026 13:54:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388250.1629461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtmwB-0004vI-4X; Tue, 11 Aug 2026 13:54:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388250.1629461; Tue, 11 Aug 2026 13:54:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtmwB-0004vB-1G; Tue, 11 Aug 2026 13:54:39 +0000
Received: by outflank-mailman (input) for mailman id 1388250;
 Tue, 11 Aug 2026 13:54:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wtmw9-0004v3-G0
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 13:54:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtmw8-000Ibh-Sa
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 15:54:36 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a7b2998-e002-0a2a0a5209dd-0a2a4502a93c-16
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 15:54:36 +0200
Received: from [40.107.200.15]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a7b299b-6ca4-0a2a45020019-286bc80fb257-3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 15:54:36 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MW4PR03MB6946.namprd03.prod.outlook.com (2603:10b6:303:1bd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 13:54:31 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 13:54:30 +0000
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
 b=zQ11vnaen8GxyLGB5rPZxcD3nqBNiHt9eG/R62XSpqSDBSHFph3znZuzaYZX4X+9znkCrvDpy3JSZIJvCuWNaTHg1DudsHXM3KPTyTB1id3pVsAW6WSEjCQ4NF3LuNCN0gCMk5U/KIXw8dX0cg1KE7EmgVYcwyyrYySkgXepdrLw8equ2UwaosQhOE9AtfAnSjxypua2pn+okES7ok0cRwZSz+tt/0wq1jVQb9gTFRryZqHFON7X+EI6YlmckIjtJgctsqY/XoBPtzSkO1bvsDi0r6bG2JlPyV/1uyD7WN6a9lSX656/tK2nkWr6FxDt2uN1dKDC+4VXWUXLQ9fSkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k0JfVm/dOYCTKg2ATdxxuHJlejduKIiRsz2PKD+ycuE=;
 b=IY7AjNZU5e2IWZThrZjBrJcYwia9YDIlRCh9yQ4KMZZwaUMayQxcXgZ5mHaEmSVDE70+Un6WasDlQ/tbhblzUpHguVSfvYmGfwA7tN66L4SfCpLpfgDUgqueZXevLbSnt/ZN5R9ZDarq5afTJxmLhGHsN0xMOeQAtHOulj98p1htclaJ++OFzYADBglso7zjheHlURAiADOQQgrNA8ngU5nto/BDx9hG/1WGt7N5N7Gy/3Iii34LkimTxV6RvznpgpWBjG6an5r4/33DiO3xxudtoCNflJWw/JW2E2xm6mIeG8/AcdtZPa8siZ9KC7SNRHuHSJuvO9K1QRi+VZgSSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0JfVm/dOYCTKg2ATdxxuHJlejduKIiRsz2PKD+ycuE=;
 b=0eFDOuddafMykt2IHQjsUH9d8jzmikzP3G0Rbso0wQZboRJsNgX8yD0icyT+dGkzY3pX7H6Pi66j3Xv2jQCk48nzacijdWB8WYSyPTkKzKv1dDhoVMt/sVFof+RnZwE/Xx6qBK4DiFGz/Ct3yRjBXkjv62TDFAHUQZiCUnVqI/w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9a3d991c-9b14-4614-8010-e2e03aabcc14@citrix.com>
Date: Tue, 11 Aug 2026 14:54:24 +0100
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
Subject: Re: [PATCH v3 4/6] xen/arm: remove XEN_DOMCTL_CONFIG_GIC_NATIVE from
 the ABI
To: Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
References: <1784210820.8631fc262581453bbf619ec5b2062170.19f6b408bba000edb5@vates.tech>
 <20260716141138.88265-1-julian.vetter@vates.tech>
 <1784211105.8631fc262581453bbf619ec5b2062170.19f6b44e7b5000edb5@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1784211105.8631fc262581453bbf619ec5b2062170.19f6b44e7b5000edb5@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0013.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MW4PR03MB6946:EE_
X-MS-Office365-Filtering-Correlation-Id: 25593791-7bfb-4a2c-b879-08def7b0109a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|6133799003|56012099006|5023799004|4143699003|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	123vpdbtqxe7ykzKhCH71k6BzwCTihkyLYBpuvKXID0wNRtW+bEzsBmgY6clswoFtE+3Ow6Ll9Vz06AfX1jmyLESmBKwowK+XIt4do3CtKuRlBojCFOat/VFRdWGt1FA1XtUEZeHLshPVMeQxkbcCCvNWKX+tgX73UYtUGg4vjDlOORN4QEXKuYNpbqc2ObGgJGOPRwCkLvouZ7y1AdH7YrZCx7ke1o03+YSbg4QRwJsRcc+IBXsj+rekRw17da480J6pAZsj3gwVz++b//GFEGJRrkeHBvyNR1E2GR/+l3GV4U2YN/vRYzwfKERDFJ6mN9kqtI1QcNMSI6s+IOp3c3XoNY7h0fWeP+hofHEUOL55wt6iWcxOnl1FgYzy4mzvAerwn/xUTgjLdWraUgZ6/eUn0ZdzuafXKqXVsKE878J6zKxJbN+/j9swfxixNV471xTdVRTQ/UJSb5Mt3hvvaR9EqcNrtrg4lDKXPp/twnI5D81r0vf+keyW0wbmdPfNnjdilsEab2CF6+2noh0x6hNmqrDkcF7B0rG013P/IC6pKU5nIfPBqE+TkiK8OUnaTdpWvVpCMhKBD+bbCDJxqA7BD69e3mul+5U/drNWsM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(6133799003)(56012099006)(5023799004)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWlwSTErc2dYK0poU0RRUXFYSGlSdHJFWDdacjI1Q3pqdDFnMGMxOGNvRDRM?=
 =?utf-8?B?TklxVXVXTzlkdEZ4cTRRT0ovVFM3T0FKSERNMFVQZTlKMzZjemVUbDVXM2tx?=
 =?utf-8?B?WWFJMUJSYU5zUU5zbHFMdVNtcnE3eERmUWF5cUMyWDQveUM3aFpZZVU3Q0hw?=
 =?utf-8?B?NExhZmpNZzUxK214NWVjWDNIYXdFaEQ3RjZjeGRRWXpvNkt4NEtwVnZlb2xt?=
 =?utf-8?B?b3BCYXF2eURqTnA4d0NSSnMvc0pwKzZMZDRjakhFb3RLT2FtQzNGakhPcFU5?=
 =?utf-8?B?MkZ0NEJtVUg4VmlKdEJCNFZYSmpEaG1kaW55SDU2MnF3YkpQS0VadFFZeVgw?=
 =?utf-8?B?MWZxejFrR0k0MjA3UkZLeGpBSkladXdDalNvWVNnbmovN2ZPUFloUUlZazNV?=
 =?utf-8?B?Um5MVW9JUFpkK21pVTkyNnlkTGJmNlNWN1ZrTXRsdWY3U0NwcmVocFA5Qit5?=
 =?utf-8?B?RWZVTWJnZHlZUXhnbUkvYVJWTUU2Q3pEVTBhNVRIenYyQlRZMjdsZG5nR1lN?=
 =?utf-8?B?RnRiWWdCa1RHdnhqNHZzSUJZY2tDMVQxVXNKVzk0a1dsSWpWNFpGYzhkUnc4?=
 =?utf-8?B?aTZzTGdjQ1NnYXFPU0J5ZmxFcSthMWxuYWJnY2dnOUxYQUJVOHQrU05yQjNy?=
 =?utf-8?B?d1k0eU1XVVUxdkVtVXFEeSszdDlQVXFYWkpoL2ZVODFBY0tmMGRoN2RSL2Z1?=
 =?utf-8?B?RTBnb0h0cFZVQ3BjZ0FZNTRIbTlpRWNmeEpucGFkQmxYdkY3Q3VpemwrdGFI?=
 =?utf-8?B?SEY4cCtrVmwwVnJ2OVZ5QTRWb2VkUGphR1o1TWFQZ0Y4UlhyUlNZTGlDT2xD?=
 =?utf-8?B?dWlUVURFTEh4dXBrcjU4UGVVRERxRHQraUtwa0VqWlFnUEsvMEd4UDNrazVj?=
 =?utf-8?B?SzdPMlR6OEdoUmVEVU9IaGhmZThESUw1eHV1N1I5c2Q4WlB5eXM0bUp3cE9X?=
 =?utf-8?B?SitJc295cDhQWW8rN0VvTmRjdnRBTzU5M3NVZW5Pekp4NDFxVkoySDZVL0FT?=
 =?utf-8?B?NXpGQ1g5WVVKR2hPbHNWcm0zOTZPbDJmQm5sdjVqKzFtTHhMaUcxZm9Gd2Jw?=
 =?utf-8?B?cElnTlNOc2dOU09UTnd2TlB1dUhvbFdhdFNRTm1oUzJzTVlPendwTjhaY1FE?=
 =?utf-8?B?dWxlZUczd0o3dHBuWENHR0tYU2ZwOFIvY3hZaDdmcnBwaDRzaWtrTzJqUENF?=
 =?utf-8?B?TEVRc0N5S0NFellZRW95aitRRVpySS9KM0hvVjhoanp3ajIrZkZVZW82a05y?=
 =?utf-8?B?TldySVdWZnpaU28yck1ScHhkSlJtOXBKZXVuWDcyWVpzbUswMGt5dTRzRmMw?=
 =?utf-8?B?WXM1dGF1TjJ1L0VYNGxNbmRmSFYvaHhvRHJIU1dOU0RrczZNY2VHZ3JuSTdr?=
 =?utf-8?B?VUJJOVBxVTEvWU5yVndwOGgyeDNvakZCMy96THdTbmhEVXFoaE9oUm9pMlpv?=
 =?utf-8?B?THBKMnppcU1UVlMwYUhkK2NSTWZ4dE92ZmVRRXZWUklGclJwSlMzS2JqNjRz?=
 =?utf-8?B?R2poTmhTQVVOejM4SmFkcDd1cVFSZGZZUVVyV0tzMnRLVXo3QlJyUkIzYzNy?=
 =?utf-8?B?UnlieEpWTS84TGZqSjBNOTgxRDhqNXFpdU9RZkl3SVJ6L1Y1VlhOM3hBWitl?=
 =?utf-8?B?N0FCSUVvY2JJa2RYY2t5WWZ4c2MrK3pCV0JvcUs3dlQxZXNLemx4Yzc5T1cx?=
 =?utf-8?B?VmJUdlMrcmdOZ2FhVE1Cb2ViZEUvbHI3RWNPWjBCV3lGZEQ4eVh3NVppVy85?=
 =?utf-8?B?Q3NoR0FjMXJ5M2hrYnlrWlJmRFhJWUdwVnJCRXZGb3VzY25vUlBmZlZ2UUUy?=
 =?utf-8?B?UTNldVZNN3Mzc1NKVGFaazRIRGtpMVRpTE1OL1oxQzc1YS9WY1pobXd3b1Rw?=
 =?utf-8?B?SEo5cGgwOVBVZGtvbjBZY3JzTnBsSkt2MU5MTnRYRTIyL291dDN4OENkMWM0?=
 =?utf-8?B?QXFQeWlBcjB4YWpTYWlzTmtIM0ZGTDh5dzJ3byszT21reUxLTnZLR1U1ZzBR?=
 =?utf-8?B?VWNISHJkU1EzaE92ZUlUZ1ZWeWVINW14RUpBU3JPdnZyRzVZTFo2eUtzTWV3?=
 =?utf-8?B?NE1qRk9CdXozVGtSOHhVZkhEK3BzOTV6QW1OandJTGtZcDI1MHJ5cWd1VlN2?=
 =?utf-8?B?MGJ1VkVwZC9WNDZMaTdLMmQwL0ZCNVNreHR1YktpTy85OWRjWDE0Tnp1WkZW?=
 =?utf-8?B?b1ppaG1uOUtscnlRaGIxV2g5NWlmR2YxRUk4dzE4aDhaOXRBRkpBY2s2ZU1C?=
 =?utf-8?B?OFpxc1VaRExlMXBrRjkzQitBMlB3NjZBNmFUdmFTT21nNFBNUTNONFNUTlI0?=
 =?utf-8?B?bVpDY2ViVnlaYjQxUUZlcGVPMmJjZWRaMVpiYmpRMWFDMkcyTWprZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25593791-7bfb-4a2c-b879-08def7b0109a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 13:54:30.8472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: URj2g2in0RX15UaF7QxOoVT/4IGCYiPVGZ9xLWL7j4lK7qkYEjb3QV3FaJ6PEOFEf+WPsiZDEGzIQ9hn3wAy369072wgKDujIYVtvefDYG4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6946
X-purgate-ID: tlsNG-720697/1786456476-F30B02AC-3D9A5D78/0/0
X-purgate-type: clean
X-purgate-size: 4762

On 16/07/2026 3:11 pm, Julian Vetter wrote:
> Now that the toolstack always resolves a concrete GIC_V2 or GIC_V3
> before calling createdomain, nothing on the Xen side needs to resolve
> GIC_NATIVE either:
>
>  * A new gic_domctl_version() helper returns the XEN_DOMCTL_CONFIG_GIC_*
>    value matching the host's gic_hw_version().
>  * arch_sanitise_domain_config() uses it to validate that the requested
>    version is compatible with the hardware, rather than resolving
>    GIC_NATIVE and writing the result back into config->arch.gic_version.
>    There's currently no support to run a guest on a GIC version other
>    than the host's, so this is just an equality check.
>  * create_dom0() and arch_parse_dom0less_node(), which both always want
>    a vGIC that exactly matches the hardware, use the same helper instead
>    of GIC_NATIVE.
>
> With nothing left resolving or relying on it, drop
> XEN_DOMCTL_CONFIG_GIC_NATIVE from the public ABI. Every caller must now
> request a concrete GIC_V2 or GIC_V3.
>
> This is an incompatible change for any toolstack still passing 0
> (formerly GIC_NATIVE) expecting Xen to auto-select a version, so bump
> XEN_DOMCTL_INTERFACE_VERSION and add a CHANGELOG.md entry.

This is an API change, not an ABI change, so you can leave the
XEN_DOMCTL_INTERFACE_VERSION alone.

>
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
> ---
> Changes in v3:
> - Second half of previous patch 3, with only the changes to Xen
> ---
>  CHANGELOG.md                   |  3 +++
>  xen/arch/arm/dom0less-build.c  |  3 ++-
>  xen/arch/arm/domain.c          | 25 +++++++++----------------
>  xen/arch/arm/domain_build.c    |  3 ++-
>  xen/arch/arm/gic.c             | 16 ++++++++++++++++
>  xen/arch/arm/include/asm/gic.h |  6 ++++++
>  xen/include/public/arch-arm.h  |  1 -
>  xen/include/public/domctl.h    |  4 ++--
>  8 files changed, 40 insertions(+), 21 deletions(-)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 356be88351..74f02e91db 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -13,6 +13,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>  ### Added
>  
>  ### Removed
> + - On Arm:
> +   - XEN_DOMCTL_CONFIG_GIC_NATIVE has been removed.  Toolstacks must now
> +     explicitly request GIC_V2 or GIC_V3 when creating a domain.

"Available GIC versions can be queried via XEN_SYSCTL_physinfo."

> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index baa3a5d708..b396d5e615 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -609,23 +609,16 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>          return -EINVAL;
>      }
>  
> -    /* Fill in the native GIC version, passed back to the toolstack. */
> -    if ( config->arch.gic_version == XEN_DOMCTL_CONFIG_GIC_NATIVE )
> +    /*
> +     * The toolstack must pick a specific GIC version. Xen doesn't choose on
> +     * its behalf. It only checks the requested version matches what the
> +     * hardware actually has. There's currently no support to run a guest on a
> +     * GIC version other than the host's.

This is path is used by Xen too, so "toolstack" isn't right. 

Really, this only wants to be the final sentence.  Everything else is
trivially clear from the following logic.

> +     */
> +    if ( config->arch.gic_version != gic_domctl_version() )
>      {
> -        switch ( gic_hw_version() )
> -        {
> -        case GIC_V2:
> -            config->arch.gic_version = XEN_DOMCTL_CONFIG_GIC_V2;
> -            break;
> -
> -        case GIC_V3:
> -            config->arch.gic_version = XEN_DOMCTL_CONFIG_GIC_V3;
> -            break;
> -
> -        default:
> -            ASSERT_UNREACHABLE();
> -            return -EINVAL;
> -        }
> +        dprintk(XENLOG_INFO, "Unsupported GIC version\n");

"Unsupported GIC version %d\n"

When complaining that a value is wrong, state what it is.  That's far
more useful than "something went wrong".  In particular, finding 0 in
this error message means that some caller hasn't been updated to avoid
passing NATIVE.

> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index 7d6f87e8b2..6987f5bdf4 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -319,7 +319,6 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>   * struct xen_arch_domainconfig's ABI is covered by
>   * XEN_DOMCTL_INTERFACE_VERSION.
>   */
> -#define XEN_DOMCTL_CONFIG_GIC_NATIVE    0

We tend leave bredcrumbs around when removing constants.

/*      XEN_DOMCTL_CONFIG_GIC_NATIVE    1 - removed in Xen 4.23 */

~Andrew

