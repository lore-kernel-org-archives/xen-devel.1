Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187C5606A319
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 23:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=AIIZJ+jD
Received: from list by lists.xenproject.org with outflank-mailman.1455047.1668581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIwnO-0005Nt-R2; Mon, 19 Oct 2026 23:29:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455047.1668581; Mon, 19 Oct 2026 23:29:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIwnO-0005Nm-Lz; Mon, 19 Oct 2026 23:29:34 +0000
Received: by outflank-mailman (input) for mailman id 1455047;
 Mon, 19 Oct 2026 23:29:33 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xIwnM-0005Ng-W6
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 23:29:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xIwnL-004fJp-Ub
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 01:29:31 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ad6a726-8faa-0a2a0a5109dd-0a2a450887f2-46
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 01:29:31 +0200
Received: from [40.93.196.46]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ad6a7da-f659-0a2a45080019-285dc42e09df-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 01:29:31 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by MN2PR03MB5072.namprd03.prod.outlook.com (2603:10b6:208:1a7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 23:29:28 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%5]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 23:29:27 +0000
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
 b=JUVKlKS1y+BG1y5g8AVBr6LGTA6xuGrD4l1zSvuwyCDbOPjVTRo7l9ZkiM4UKxqH+sC0XPv2XX6wZKIGduusvLVBHO63bz0+6QoTNw3SC2lXvPfYmEO5WTwTl8ZYInhkF3Ersd/Hge57zvsNRNw5/1l82sJZ6pIPue/RtXLlsZu0RzTvQ+EaxHCpwHmG+R/R3avajLQkji2fiG018Ue4GzbWxZ3GmUh/uoaCmxwuiDOZ89xBm4knYxW4p5WVi9s7rNEWIDJ/a2hYFPRmJUQhVHcI+JOrYdCQe/26eW83wimB8F/eA6AmEeHqSPG+xo2Lw9hI7NVKhW3nE2fEzg47DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7octSSBU0RYQlZaDN888T7ZYftlnCCk/omHq1ESy0UY=;
 b=ZqyEAxAULBlbRN9iqIqdanYyZEtpImz1bnC+BVGWwS/AKnKFJY0bUxg+0LyU1mc2wqhURMvgr/hFeDzJvRh8wSSedefYHO9uc/RHt38SsOUM62TI0A5Ut30oS2pZztN2yu3PCxtd30axUE7TcQg8rnDqnycu1D+YSVPchr3kUO22Y9acjzYWcu0sPTzT99+DjUS3mR1lHqWuDuc6prQP+w3WT3oj53QIkuqBXq/3RyinMSyEPDQRDYHBjxIgdZH8xQCSVU/XGdLG0rRO0fvKly9sCVFjdNdoPo5aFiwHpzjBYnnvdbGXiUX5NB7yeqMgfv+btiuCxrsAeNnw+fiU4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7octSSBU0RYQlZaDN888T7ZYftlnCCk/omHq1ESy0UY=;
 b=AIIZJ+jDJcbeQXcsDiWBrUZv3bFFROlg1cw2VkHbbfN0PCYnKHOKETttNplef9k3glcTyWM+VSw1DWpHiT9WhlAQEL/KTpWkauUttWx3FMRHiNfw1FjURM30gxrMDgTAtkZaDGoCcc8Yn965V4OMx+p61dLtaIjp5C9ZDynJPIk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ca3d6951-d81f-41f5-b249-e8901f7af7d9@citrix.com>
Date: Tue, 20 Oct 2026 00:29:24 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Subject: Re: [PATCH] x86/vlapic: Don't change ICR on x2APIC SELF_IPI write
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <1792420048.8631fc262581453bbf619ec5b2062170.1a1548f6f6b0008425@vates.tech>
 <6769b61a-89b8-4283-b476-5a1a9aedbd5b@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <6769b61a-89b8-4283-b476-5a1a9aedbd5b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0356.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:37c::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|MN2PR03MB5072:EE_
X-MS-Office365-Filtering-Correlation-Id: 75977db4-ed25-4889-fe22-08df2e38d152
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|6133799003|22082099003|18002099003|4143699003|11063799006|10067099003|260925022911599003|260925021311599003|260925021911599003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	NvnfPLXNPHrIEcGiAos7Mmc6GLdWPQFChnVl/hZ3+c+4x5O0tGFSrewurqgg8aaY3hg2LP52cOLYHv07grE0Zn7FSydUmU02s4uYg7VgsuL3uYRJ/YbVPCw8keWagHAzKP2ssWIf/XrNjvdaz+Zk3UR8xH5zCMdDWGMRztB90Gr/38vYDMuTk1ZpJJy046VryCq5RTvaSdwqBObw4m5sb9iFTlPt5bbp/8xOIJd93Etf6Pv1n3t2fsMs1uoUdJW9zvCDAqrJbe2fAB45YlKORZmiShK784TsC4EvtvY85ot1aLIlg77/5K15PoMjuer1GeNVX9zoSTdzidmeRHZ6ig1t2ZqO6Cv9WNEcykH46DuTXEBETAdltgnlTXiob9mlphShBFZgY5beSz7TzFNqMvSoI5WFgDIM7ogu1pk7YdPblbFpX7Lmv18OLoBZ0Rd0gqjbX/NmawKoYY9bl6BkS2OOm3e2Z+yQ+f9fpgudj1DktKJ9Mo4cTS4659QcX2l/EwkJjQsELmTiqH+49UiSyzyQzTX107BBdY6IXXH/UP58EVfupLmdyCZLMM5seMA8+RayyBEETCHa/YlDkf+EJaUQFCDimAtBSuSCxSAceAA+ogEVxwQjgAxJifaZT3IUQRe3ikuxgZXhPnUxHo3BA5JZzHPPW6pZyGpr2bVPlWc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(10067099003)(260925022911599003)(260925021311599003)(260925021911599003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REN3NUFsMkVtZjBKbEJtdjlPMEI0clpPY0lnVFRUTDBIaDI5Z0hzcVFmRVhi?=
 =?utf-8?B?c1NTMkFSUFZOZXRvYVpGdEVNNG9GK2tONnM3eVl4ZkRFSmxsZ1FFY3U2UjhX?=
 =?utf-8?B?aUNNZUJNcnFBTkZMTmZlYkt1QTlQMzlScGtMdVkvZ29tRjZaWEZvTnF4cnR1?=
 =?utf-8?B?bWJ1cUNQWDZ0a0NxUC9VdVFsRnNINEwwZVVqRUVubHVHOEdnRE9XMko4TnhB?=
 =?utf-8?B?blVjOXpZZXlQY3JXV0kzdHVyZ1RFWWxYekNhclVRT3RCNGZPUG01VmtydW1I?=
 =?utf-8?B?YXJrcWlnd3poU3A2R2pDQ0IzWWVJMGszUUhDcVMwZ1VEN2t5cnFZTWMrWG5i?=
 =?utf-8?B?U3g1NVlrZWFhcEIvYjFsSHlkUkhXS1c2L0R1ZlRUVW9HemJsLzdRc2JkT0Yz?=
 =?utf-8?B?MlhjQ3NqQVZhR1pYbnhiNnhOMHprR25jMWxMZzdhRGR2dDNNM3FEODB5aS9Z?=
 =?utf-8?B?NDlkMDIyV0t6L3NNWU5oK1c2Uzc0VkNDV1pGNjd6UmJsTlBrT2R5VDdzRWs1?=
 =?utf-8?B?eG9jTzFJT3RXd1dXZDNJcE80d3luVCtPK2c0S3lIZ1BoOFJyNlQ5TDJXb2lq?=
 =?utf-8?B?cmE3OFEwdDFBVUtkbUVCZEVJaEZjWDZQbVNHRFd0Qjh3N3FzeDRsaHIzZHJ4?=
 =?utf-8?B?UTNvMUVnNDA2V0k2eTRVejV4NGdaaVpyWjlnSzJMdGozWEx0U3JSZFFHK3Ur?=
 =?utf-8?B?b1crN3BBYlFMOTZ3WkxnL2c0YTNoQ0pNaXVmNm4rckprS3Z2OGYxMFlVUmpO?=
 =?utf-8?B?T3NkUkRPRmdrZW5hamt6WkFGTjA2azQvK2huQWdZZG40SDN1aHBlOFFWWkZu?=
 =?utf-8?B?ZGhwTW1kbzlVMlNSZWs1VjhINnlEMVN3VGtLSUpLUEd0Yk83ZlQwek1CRURj?=
 =?utf-8?B?MkpHUDE2d1ZJRDc4Q3JEbElCU0NyYWNoWkdsZG5QVVZaVTR4WHgydVJWSmsz?=
 =?utf-8?B?V1FBaU5xRURxR0lGanFNaE9DMFZ0S3hMQ3BYY0s1Z2lRUTBQb0dtL3ZqTEdY?=
 =?utf-8?B?VmJrRGhPSE1Lc1VyME1hMGFFbG40UEQ0bGFiU1M1NEVUYW5wMXBhanZDbEc0?=
 =?utf-8?B?cGJlOGcxQ1lFN1RvVkl4Mk9kbWMzVE9qQ00veEVtMSt3blBybW42cFM3My85?=
 =?utf-8?B?SHBSM3E3T24xend5L0hPR2REa0U2ZWFvRkk5V0tPRkFFaUxyNjdwTWhIVm55?=
 =?utf-8?B?RUVML0RZclRrRXBGYk5YUDl0RGtLbmhKQVd3ZVlIWnhLbTdrcVVuREx6UWFL?=
 =?utf-8?B?UWNid1RtV0taU1FNaWEvSktob0pZM2ZFWmk4a3QvaGtlcTI5K2lTSDNYQmJw?=
 =?utf-8?B?dUh0TjF5UHBLek1hY2xKVGtocEtvL2VRalRVYkFsMzFEUElpcHBiT2ZSYjdI?=
 =?utf-8?B?dEJwcUluNFdWeGR3cVFpdUthbUNaY2dndkNhVVJ0QUs4dXBrZGlaR2hGQmVw?=
 =?utf-8?B?VEoyS3FsOWsrVUVaeXIxeWpuZUFZcWp4M3VzWTJaTXlicTdpa0VDdW5EZmFh?=
 =?utf-8?B?WGo3VEVad2Jocy85bm9Ta2FHNnZJUjFScWxCVDFQQVpBWGoybDVqa1E0RmxR?=
 =?utf-8?B?QnFJWFRqSURneE1GNDRzOHdHTFRkQ2hDWVQxNEtpQ29vY2xHSWV5UjIvbHUz?=
 =?utf-8?B?NzlNaDA0UVRtRnVzQytNeTNJeHl5QXZFZ1RSaHFqWGVlODFtTEoxQndRcGVI?=
 =?utf-8?B?eUVHWlB2eDhMaE9QSUNZWk05YjN6THgwWFJCVHRKOHNxYzVHWHJNaFBMRUFN?=
 =?utf-8?B?dG1WSmdCTVlqNldmYXFieThwWXQ4TURUVTRlaFl0NmNPdFNUL0VnWDMxbE9n?=
 =?utf-8?B?bWVJNUd6Ulg0dmNOMkhsTUFjdml3S0VkZkMvU0RLb2UwVVVENTZVZlVLekRG?=
 =?utf-8?B?b0JNSG1pQVBncFc4aEVDOTdMMWFvdFc1emxrMGwzTUlON2NUaUVvMTlLOG13?=
 =?utf-8?B?VnpERVk0SXltbW9BanZwZ1g5STlzT3hkQXlwUWx2WFFmdHh6QXlsMFR6MUJ3?=
 =?utf-8?B?US9RdDBnbElOTXVHZ2p1QnpoOVJ5RTdYMGU0Nzlab0Npa2VETDBmVFVIWmZR?=
 =?utf-8?B?cExUK0pCSW80alNDdmwxMXVsYzljaTEvNGVZUXUzRlcxTytxYW1PZTFyOUZK?=
 =?utf-8?B?SzFtRGtLWGpzQ2lHZHQrOHBCTGdrWUlIanpJUk5IelFxektWenNLWDh4cEMv?=
 =?utf-8?B?Mk9HMUU4TDc0bUl3MnJSMzNwU0s4WklvajFPdzhRbHBvM2hKdElNd0RXcGM2?=
 =?utf-8?B?cm0vaFFBSjNFcXl3VVorL0dndThnSGs0Z1dKbExQT3hlbGhpR2xrMC9jZG5a?=
 =?utf-8?B?LytHcStDRlh5SEF4eU9lWjZXWlFrY1RCbXJ6WXgvQ3dENURNMlZTQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75977db4-ed25-4889-fe22-08df2e38d152
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 23:29:27.9436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1XUaIAoWWN9sBjFo7EUstjVyTx8MXg+uF4hXvv2OyUXbF7WIMHOgsGVyLBS005pOm+uH/Rp0wgykjjhh4vv8fcZ3NPWD+/gjYWmeZfrWZoM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5072
X-purgate-ID: tlsNG-c1860d/1792452571-D6F5F87B-14350F2C/0/0
X-purgate-type: clean
X-purgate-size: 2020
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 19/10/2026 10:09 pm, Andrew Cooper wrote:
> On 19/10/2026 3:26 pm, Teddy Astie wrote:
>> The Intel SDM (Vol 3A-13.12.11, June 2026) says
>>
>>> The semantics of sending a self-IPI via the SELF IPI register
>>> are identical to sending a self targeted edge triggered fixed
>>> interrupt with the specified vector.
>> However, this is not expected to alter the ICR register.
>>
>> Fix the Xen behavior by sending the Self-IPI directly instead of
>> emulating it by modifying ICR register.
>>
>> Fixes: 21c4d089ba2a ("x86 hvm: x2APIC emulation")
>> Assisted-by: Claude Fable 5.1
>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> What matters is the behaviour on real hardware.
>
> If we're taking a strict interpretation, then "identical" means that ICR
> does get mutated.
>
> GNR:
>
>     (XEN) '1' pressed -> Extreme debugging in progress...
>     (XEN) *** Testing self-IPI
>     (XEN)   Before: ICR 00000000000010ff, IRR 00000000
>     (XEN)    After: ICR 00000000000400fc, IRR 90000000
>     (XEN) *** SPIV
>
> Turin:
>
>     (XEN) '1' pressed -> Extreme debugging in progress...
>     (XEN) *** Testing self-IPI
>     (XEN)   Before: ICR 00000000000000ff, IRR 80000000
>     (XEN)    After: ICR 00000000000000ff, IRR 90000000
>     (XEN) *** SPIV
>
>
> So, AMD doesn't mutate ICR.  Intel does.
>
> Weirdly, Intel reads back ICR_BUSY which shouldn't exist in x2APIC,
> while AMD fails to read back the shorthand.
>
> See the attached patch.  The test sends SPIV to CPU0 using ICR, then a
> self EVENT_CHECK sampling ICR and IRR before and after.  The SPIV
> printk() only gets serviced later, which is why it's the last of the
> printk()s

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2965354494

It looks like it's a behavioural difference between Core and Atom.  Core
modify ICR, while Atom do not.

Also Atom look to be delivering the "SPIV" IPI too early.  That will be
a separate bug.

~Andrew

