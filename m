Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2244C982FA
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 09:27:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429971.1652604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9JFz-000734-Iw; Wed, 23 Sep 2026 09:27:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429971.1652604; Wed, 23 Sep 2026 09:27:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9JFz-00072w-FM; Wed, 23 Sep 2026 09:27:15 +0000
Received: by outflank-mailman (input) for mailman id 1429971;
 Wed, 23 Sep 2026 09:27:14 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1x9JFy-00072p-Au
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 09:27:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9JFx-007AlQ-Nd
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 11:27:13 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab39b5e-8faa-0a2a0a5109dd-0a2a4502d1ba-36
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 11:27:13 +0200
Received: from [52.101.66.125]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab39b71-6ca4-0a2a45020019-3465427dbcdd-4
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 11:27:13 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by DB9PR03MB7565.eurprd03.prod.outlook.com (2603:10a6:10:2c1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 09:27:11 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 09:27:10 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QxFdpci3RoA9C7TP2s4ZZb6CPLB20PSrd9+T+F659rdOJQhe1Aww0Wkikeig9GocVTkfwiARhddv2AU3GABIlLTnO/Vo5bHmWz4tXlCU7m6lUPPaYzKBjEQa4pTnJzcQTKNvheFVs6nBQuCV5rloWllx4Kgka9NR17T6VxPJk5zrDszKhwfugpxcyl2s2011uI4Pomh66C3Hbux2fc4DsWhiWwfZBJczUvOw833gWRJCxC3h3D6odfQgoTRJBxS7qfn9NCs/XvX8+g1zrmtUBsLaMN8XgZMrX3Bga6Y+DOgmCp4ynTmrUkyvqUvoET4Rl4qVcd4uzxzjItjx4wfSpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mzz31HR74OJnBFNuOq07IWwxoGymFus80+Ak97b2Aok=;
 b=YM/j08g6+e25E7UEwLSdhkVyOD/QvBDmexGLo2HSNqJM0WdqlBFgDDgibDEISpUI8lbkJVPrXEVgrMxF//yNpMH01b7ZPbm5//piGFmtmLyjGirPnWpv1gSCu/K+ixN4C6q8vTapSqxMucolOB8jEKD+j7nUqvFVt/9FQmdJDgr7ThSMp9vujKQAQIKvOcELeUwCxhlgPAsh6rejMGvMZDNvIXhP4exfDod4Zt6wAeFwUiy7v98ALiQ3q2cOXSIwu4MsoMEquxHzvO9OQnuh1kJLbnOFqAjfOFquIS5eHfYmHBi0SS0R2CtP2C0b2OSGvoyQOickR2wC4KFHFdqcnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mzz31HR74OJnBFNuOq07IWwxoGymFus80+Ak97b2Aok=;
 b=WoUpaRiqrcYuQaTHxxyeODges74Kl2Mm3xdx3lZKO7Gvni0aVODihAAiWP2r26PjkphbNu30P+c55A2OdqKh2iFjjsg8LDQv34+CKii0wCwGALpn74d42D1/aTTOFAKHXfqWXrRw572rrUpDAE7cWrldlg2vkhNajNNZz+q6QbdOxIWAi4I5Q2K31sCMpSSBn8sA7PdGWPMJFYNoDNBXfDFn7/3FzoxXKxEMF1WiTFAhd08Wk5crGkkPAZdw6OS7JtBYLltBt++QIp5k2lvW7SO1PiM+sRZYtuflMjhROuEaF77hHPmOulYgJAobaNGGjO61xfjF5pf1HdpNAaySpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Date: Wed, 23 Sep 2026 12:27:06 +0300
From: Mykola Kvach <mykola_kvach@epam.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Jan Beulich <jbeulich@suse.com>, Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>, 
	Jens Wiklander <jenswi@kernel.org>
Subject: Re: [PATCH v4 4/4] xen/arm: handle irq_set_type() failures
Message-ID: <arOXcZBQaisPc_yd@EPUAKYIW02F7>
Mail-Followup-To: "Orzel, Michal" <michal.orzel@amd.com>, 
	xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>, Jens Wiklander <jenswi@kernel.org>
References: <cover.1790056623.git.mykola_kvach@epam.com>
 <85c5f8f04b19eea8d32e875a8b7e94f4ebb88292.1790056623.git.mykola_kvach@epam.com>
 <c7350208-54e0-45e1-a744-24460deb2117@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c7350208-54e0-45e1-a744-24460deb2117@amd.com>
X-ClientProxiedBy: WA2PEPF000008BF.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::699) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|DB9PR03MB7565:EE_
X-MS-Office365-Filtering-Correlation-Id: f17589a2-b82c-4433-9aa8-08df1954d84d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|23010399003|6133799003|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	SoGXoAVEnMKLYZ6oNPlO/1GXQgb06XwOg7oehI8rv1l+QqVToWYu9QhCcQproAuDJq4O8DfRRZc9gvF17fp+Ekv18q48qmWlO6fvQ7TMKiMtGF8etq8gZPOpRbv5CeMuCn/9cHvClRDzq7/D1uNNKzK35YdV6v7CJP+Gw3lAb6AkELpSA4kVq2G8PVdlfthG3vn2A4g7QeDK0CYSz2U0g2L52zqjpKsDuartObQXl8bsf0zytWbaQ0nmWIsDD5rOFj3y9Do/9nzNPLatnXoW5uehcaiy2DAwcUBHxj0Ci0e15MTtPqJhbXry4KuAH5W6dKNCd26u19YeHE0G0AgtRE3zG5AyplpUobCce80K6J0Wc/iwiePU1mH1kNS0t/OP7wLJN3YU+kqqPhvflw+neD8aC2zNPcV/4SufSY7WH4o567ASz/E6NokvvJIHuLuXZ/MkfyvMDAFz5rKcucf0SrvBrewF41e2UKgXPfvz4AhHXVCEozncAcAkxXYKUyBbbbeWMFFTDfgWs3ApSGqWXFCi8Son7w9sEGrvDekurFE7DzFhCP7h4rjv20YRJDoznMy4kJsgrOS1YAaJBC8jcSfbcjfVCGYs5M7YyIvjW0PPEYIKPtZ6KBBgLH2qFrd6bKZOJ3kF1eTMd+fKnShxLL9T/vHbR7GqoRsCl9DI8JI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUcwdlB6ZzlQWm5mRWZmQlJHdnEreFVPNDhiL3lMT2FrQmUzb296aHdHeVA4?=
 =?utf-8?B?ZWx2M2wwQThCaGluQXdQREhGM2YxSGJINkFJTkxEMWpwNG4rZWN5QWxodHcv?=
 =?utf-8?B?UDNSbVNJZXZiK1RieDlDU1FaUTF6VUVSMS80U2t6aGpHbDE1QmFTamNWSVdj?=
 =?utf-8?B?Q0ZSSFk2RUVGb0JBVmRtR1hPbW1lOHJDU01EZWI2enQwV05oZTFIK3B5aE9V?=
 =?utf-8?B?STVqZWw5Zkw3d3V0cW5wSFNwZmlCZitUUVh4NjdYSTloWkYwZWo2cHNYTms3?=
 =?utf-8?B?RGZZYkU5ZEFMVDlnWU5DRktTdUhYMURMMXdIdnZ0Q0FQSk0vYm80UmNHZU9Q?=
 =?utf-8?B?RWhiWUZ3aEZNc2dJV3poaHd4a3JOSVIvRnhnZDNHWDRiNW5ncEliSmFsa205?=
 =?utf-8?B?S1pyVWFBVDFCeWdxM0ZFR3laL25GcW13bG1kNUZZN1VkZkdlTVB6NFpuSkhU?=
 =?utf-8?B?MmFPUDM5OTB4RHJKN2NYMVVqUVQ1UWVuT2lncStpeDhZMm5LK3FEblJuYThS?=
 =?utf-8?B?aXZsSHR4ZFV6aThmbnUyeW40QzRDT2xRVVRrM1J1QWxhV3BTTng5VUZ0UEtp?=
 =?utf-8?B?UnNuSHFnSUt4ejhsWFU5QSt0YjZjT3ZtZ0VNMEZpaXhlc2FYL1djaFgxREp6?=
 =?utf-8?B?MlRrVFRiZVZGYThLQnRvVXE1UjJWYWNzakN2WHppVTVuU29yZ2sxbnRKOEFD?=
 =?utf-8?B?SklkUTFYMEwrSitrTTY4aHpiU1F3ZllxTy93ZWNwMlV1bjdmV0ZXWDB2WkJz?=
 =?utf-8?B?WUZBK090UXR2c1djRDdEUEhuclBLN2tJY0pUM0p6RjhiUzNVWlQ4MWxTN2tp?=
 =?utf-8?B?a2VhQnZNbVFnOUJhZzBPbWxSZFFmWFozZFU3TTI0TzBialE1cThkTXo5VEdM?=
 =?utf-8?B?clZsN1lpbHNDMmI0ci8zWDNPQTFnMURTY0tzT1lPakV1UDR3WitJQ1ZvUHVt?=
 =?utf-8?B?cDdQODBXR1JMOWhBaGM2MG11L2hMaXAzSmJJQVRwOEZHMHV2Rk1aS2FsUEEr?=
 =?utf-8?B?bWYzcTBnM3BQc3lkZ3NzL29pb1NBMmNicEFyRUVDTlI0OXNmeklZdjc4dEg0?=
 =?utf-8?B?dWE0cmdCTlB4NEc2SGlOdGQ1b1RFTlFUaWR0N0lHbkgzbkU3aFVVTGI3TlJv?=
 =?utf-8?B?YTZTTnd3c2x5T2R6VFBxdlNDQmp6S1ZMVDh1RkxydWVtSHk1ZzhiL2JMWita?=
 =?utf-8?B?TWp4TGpxTVVpWmFTb0RRMkZuUkk3MGt5RGlFcVpYdDVDYVFRcEJ3LzR1bmNV?=
 =?utf-8?B?NUxBbzVCeGZPb1ArUFRDUDFaU1Q2UVFYU1pIQ3pQalM1cGdrMGJBcGJkUThM?=
 =?utf-8?B?SFFzejBtTW4wUUZCMnRTcFh3b05ZNUZJWGVoUkZXemV2MHR4YnZ3eVdzelZX?=
 =?utf-8?B?VnVvUk1xUTB3cjNKWS9wNU9KaFVOU0FKZVdjSXBBcEhYZDNlVEhaWTdiRndz?=
 =?utf-8?B?bUhsczNaNmdFV29wRG5DcTFKcytXeGRsbENzNnliVm1najgzYU5nK2t4aGZr?=
 =?utf-8?B?eUtXQkEra3A3VWlrNVI2WjlpU3dFT25heEJCb1B1R2JhQ3NEWkhqeWh0SWlE?=
 =?utf-8?B?YU55K1QyRkVpUVQ0OURqODc2c2k3ZElMUjJJOUttRkd0dlk4TkFveFFNcjFm?=
 =?utf-8?B?bXVmUWZzY2RqcGtDZWxWYUIzdkFSa2RaWFZNNmJLN3lEQUh5NGtKMnhhMkpK?=
 =?utf-8?B?L0Zlek9HNnlMcjZRRHNydXlycTM3REMzQ1lIQjRHUW43eTY2S2NXR0lVL3JI?=
 =?utf-8?B?TlllenVta29iTzVGNXZ5ZTdVTVJkL1NSRWFBdjlLdm8rWGh0WHN5UTZyOWh5?=
 =?utf-8?B?cmhhTXNzSDA0T1JTYU1heGxpRmlrMVpTSXplNUp0dTVDMXpKZUV4cnNLbGpK?=
 =?utf-8?B?bTFqVjlydjdpYXA1cWVvbnlFVzNzT2tFdVJVa0UyKzk5TzB4MGlHYWM1ZnVR?=
 =?utf-8?B?cGl4NnMxV0JKRG5HL2RrUVlHM3dJSk1helI0WFV0SE9ROGUvbTZXL0RHK00y?=
 =?utf-8?B?R0ExWWZsdC9LbUFmaEo4TXhMaUMzd3FsUVZVc3hQWGYvdWVWTWVqSEh2TVNm?=
 =?utf-8?B?bDNqVFlmbGRWUW5iNFJIVlIyZDEyTTZQV1RpbjA4MlF4ZWIzd3cvTUNINU8r?=
 =?utf-8?B?SStsdzlyMkUxcGw1SUlRYlFGUThqTjlKRHVpWFdXRktQZjlyckNYQ0Z3MjYr?=
 =?utf-8?B?UDVDLzI1SzMzMEthU29qWFVka1hOR0lIdXhRdnZxcTNWeHVjcmpwalZlL0Zz?=
 =?utf-8?B?Y0NPTHMvdmErcklPblQ0RTUyVzFhTHFzdjVLTUowcGY5ejUyUVlVOE5rZWUz?=
 =?utf-8?B?MGhwZVFiMUV5c1JGckwvemU2ckdyRVEwVVg2M1JoQlVmWUZveG1lUT09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f17589a2-b82c-4433-9aa8-08df1954d84d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 09:27:10.8368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uujo6hvIDRnveZnjLlTuqAXxniCszfkqyIUOHYpfJGqLAts+lywSqE/D6emLUjfnuIyuEqFft9dGBIcEfEP0aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7565
X-purgate-ID: tlsNG-720697/1790155633-F2AB52AC-C7D3E3E5/0/0
X-purgate-type: clean
X-purgate-size: 1408

On Tue, Sep 22, 2026 at 04:24:59PM +0200, Orzel, Michal wrote:
> 
> 
> On 22-Sep-26 08:39, Mykola Kvach wrote:
> > Several Arm firmware initialization paths discard irq_set_type()'s return
> > value, violating MISRA C Rule 17.7. If trigger configuration fails,
> > initialization continues with an IRQ that was not configured as requested.
> > 
> > GTDT and MADT retain rejected timer and maintenance INTIDs.
> > check_timer_irq_cfg() and release_irq() later perform unconditional
> > descriptor lookups on those values. Xen has no backing descriptors for
> > INTIDs 1024 through 4095, so retaining one can cause an out-of-bounds
> > access.
> > 
> > Check the return value in the GTDT, MADT, SPCR, and FF-A paths. Store timer
> > INTIDs only after successful trigger configuration, make GTDT parsing
> > failure fatal, and stop UART or notification setup when trigger
> > configuration fails.
> > 
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> > Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> I asked you on v3 to reorder the patches, so that this one comes first (usually
> when sending the series, fixes, improvements should come first so that they can
> be immediately taken).

Sure, I'll reorder the series in v5 so that this patch comes first.
Thanks for the reminder.

Best regards,
Mykola

