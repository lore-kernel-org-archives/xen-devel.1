Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DB0C982FE
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 14:06:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428918.1651838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x918E-0005ES-Cz; Tue, 22 Sep 2026 14:06:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428918.1651838; Tue, 22 Sep 2026 14:06:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x918E-0005EL-9Z; Tue, 22 Sep 2026 14:06:02 +0000
Received: by outflank-mailman (input) for mailman id 1428918;
 Tue, 22 Sep 2026 14:06:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1x918D-0005EC-Aw
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 14:06:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x918C-00GC66-FU
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 16:06:00 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab28b37-2eae-0a2a0a5409dd-0a2a450ae716-48
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 16:06:00 +0200
Received: from [40.107.162.128]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab28b42-f2d2-0a2a450a0019-286ba2802b24-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 16:05:55 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AS1PR03MB8264.eurprd03.prod.outlook.com (2603:10a6:20b:474::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 14:05:52 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 14:05:52 +0000
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
 b=Twa+XyxvDhk2wKCB+4leGMjDQrFWELofrhxeJyx1+pkFFfQUvnsOHUDYEvKmV0xsL7Xz6im6sZYwGwM/hqk3ghjiQso5RVUiWPM3jfxO9b8n2mw/D0yLnbJnlemYBZwYCqYZUyRDAmqtECAkYsjkN7YrAG8nI1lnh/gybHJcOqxQrCNqV2NcVeXN3dy2Jw8qOZv0iGGXyjfVz7jVUruBrIqtmkBM1eOU1h8+SDQwDPSnDiWAv1tqhMHodHb6O4khZA7vpnz82p+wZrk0nCOZSbrzNuCkjT6NCgjaCEZn5vTFw/1BPIeuMCi5Mgo5Ov5r7D/rvoFqS+VpZb+3EJD61g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b4BqyLrUmx+6dUteUQy3vicJ8GpvQFplSI25NlSF2sQ=;
 b=g5W846Q1lUGS3KuM6mBTqZuurzTyUPVzvibrWzQDtec0Ds7i0gRDo1054xJiLazadWq6f0EuwJyhlKSNJfGlOgeFCO1dhPCN2L+IUhyIuy9YUKCQoJudo+ytb9NkleGvAspTZTOVwL7iCPYApifD+KzpNS+X8rDrFrDqjzaMGKsT7Ndt5Oy66rCZWFdDpB3k4kiYjAY2yoGcyCykzK5clmhkV+nvlIJm8qcgB/AeVYCJ8UlueMvxylcGlILFF+ifhlJYXtZBtt1Aa/7y0IRkaYAJ2RfVbA5vw3yaWWTIhvdvgMrpeYChIwEPY1FpjJycCI8ZaiRtNtCbfb0j5mgNzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b4BqyLrUmx+6dUteUQy3vicJ8GpvQFplSI25NlSF2sQ=;
 b=Kuq+TIoJKBR8LIo/Ajhlc3FeHPI99mnMrxoFqmFWQo5nKM8dPG6X4nclDX0vzATWYLXd/IUYOnA2cmixxBaHzrSPtQilGyXNbg0DlIDDIaMoXkaXGDNEY7/MkP4EFg1bywaawON8Ib0olulwGOjrKfHoJRXOGaoItVUSOXMVPopVGEnzPb3TmijkghS5//g9E5qIIia8KPKv/6QfzClRYfEoXaw9jh/+SscqmeIl85vjr9gjhm47NCFrRNh7R7lmFofb2BVr5kmibz5M+VO7BirjTfRWhAWS+fd8zQJAXKqcZwkuM2EuVUdFkq8qo0i9dEUe4t1GeXLmtKQ9DP6mmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Date: Tue, 22 Sep 2026 17:05:47 +0300
From: Mykola Kvach <mykola_kvach@epam.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Luca Fancellu <luca.fancellu@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 3/4] xen/arm: its: refactor ITS quirk matching
Message-ID: <arKKhwi27bNGu9wE@EPUAKYIW02F7>
Mail-Followup-To: "Orzel, Michal" <michal.orzel@amd.com>, 
	Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Luca Fancellu <luca.fancellu@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1779922874.git.mykola_kvach@epam.com>
 <df3219d050b32a406b3eb787c55a42785aa25379.1779922874.git.mykola_kvach@epam.com>
 <22e10198-10d4-4343-9286-989d994b021f@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <22e10198-10d4-4343-9286-989d994b021f@amd.com>
X-ClientProxiedBy: WA2P291CA0021.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::29) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|AS1PR03MB8264:EE_
X-MS-Office365-Filtering-Correlation-Id: fe9dc5b5-9198-4803-be8f-08df18b29c80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10067099003|56012099006|6133799003|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	sy1Fr2RhiiCeuazHkap8W2zt4Ci50cI4j7y7KHW9UvFgCAoN/ePAMwKkRa932I7P63de+aBjXX8tO8o0oF4atI2oKsZgUlCFmY0stefNYF4t1pyoDqHm/NyWRzrptJuWQkkDUt9GYUaX0ewk0jsLfMGfB1y1fCOX1ETL2O9cbjBaE+M2bYLN6AXPiGmuPuPJvbBhdFBRVd4zKrv04+7tcGsejt2TEKtSgDHZrq+KNqb1JT6QmYdC86QNW5UcWBP9b9s43LNYrODJHk4Ie3g0kkAbaTJi58QqWiCbko9wD1rnNi8k6Y7TvLWUkkT+YIGctKTuID25Qo5JCoineiCTLiCRJSCJVoy1hEmeZgvsxohwG5TrZ7bN0RCtMNbk+0tHdqG/+qtyChGqufsH71zhZ7sYpRFrzwxuNTeiW4EkBzReK504oOdfz+5z44M83sBEs5D3a7aFvMFIMPDTWtwjQ7EinRDnqRZKrSMMRfPTZ27p7kxkTQHj1aamSpz5wOOqFkZsERnw45JxRyPh+WWPWecUhknOzz9gOitLHzx77vwVZG3wMrV5Zwd5yrv+Q9sUzhobVzfPDMOHDx31ZzIFXcm1UCEET0NK7ycRmZI+urENgatyRnSy3ZsCh62Ln/IUCs+FB0d826bZQ16u6rxhRxMM1U/pZqHr9M62/r4Cz+o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWJYY1Y0V3l3Q0xDY253Q0lTSCtUKy85b2FlaDF1K2RXKzhkUDVXWGxqWERw?=
 =?utf-8?B?dGFUU0drY3BvLzk5eEllZHZ2cHIyc1g3V3hJL0N3TXIxbW0rMmN2cFdWN2wv?=
 =?utf-8?B?M2p0YzhtWnlid1NEc0djdkRNczhKamJxU3VWcDRrZW4xMGpSVTIrcnVpZ2FG?=
 =?utf-8?B?NmFqMG5HNEN6SVhsVmovRm1VZDBzRWI0N3MySzQ2bmFnNUpSYnVzYTQvSFEy?=
 =?utf-8?B?Ty9oK0daK2dIUDg5TUdwVmFYYjR1ZXkvMXNZUXFVYlpYdTNMcU5DS3pZcG1n?=
 =?utf-8?B?UUJJdEoxNjBweVd1WEZkN0tUVFFNbjhlVjJuTUFmNkRxOEFBWTVGMVZWMDhk?=
 =?utf-8?B?SFVWTEk5QnpXNHp1NXY0U2JLNU1yUmM4Z1FUbkNTVTRDY3RKTUNQaXdxM0gy?=
 =?utf-8?B?MjZyMzZJcFdndmJSdkZUdjN3ZGdHVjdManBEdyswNEpiY3V3OWhPa1Y5Kzli?=
 =?utf-8?B?VXZIb0V0ZnRDcC9MWkxiTXRuYWE0YmU4Z0tLVDBJTkkzTjUvZVlpVVRWQjVw?=
 =?utf-8?B?RGxvbUF6UnhCUEdMZlN5dUVVNlFERGpLdlpFK3hOZXVnR2FxSHRDTlVFRldv?=
 =?utf-8?B?Y0NpSUMySXU1V1ViVXFyMDNlRlZXdHE1Mmo4cGdVc3VuaUNJbTZtaEVKb1NJ?=
 =?utf-8?B?YkFZUEo5NUtZZkh5L3RqZjlrbXZGelV1cnljcUdhN0Z4NWQyNXk1SDFvZFF5?=
 =?utf-8?B?a2ZIYk5MVWMxc0Z5YWJoWFUyM05WN0dsODBBRGJ1aFdVS2hLRHM0bW9UN3NV?=
 =?utf-8?B?ck8wdmk5NUtVMUh5VmFQczhUSDREbndHUzFEK0ZUeEIwQkV5MW9JMXVnVzcx?=
 =?utf-8?B?TEZCRVpFWWU1b3Y5Mk43Q1JLd2dFVTlEeWFwVVlRblRFdis5cFcycEFkWjRI?=
 =?utf-8?B?aXJBZHp5SzRJZmJ2enJrbklzcmRseFN2aHNmY1cvQXkyNkk4dFBjbEZrYzEr?=
 =?utf-8?B?djFrSlN2c0R6a3l4NXBVWERXVjBBWlByRmJLZnlyNHhsUE5rbDRRYjYxRnZG?=
 =?utf-8?B?TUQ5K1Y2M2RkdVZodUFMWlF4NDZGeXFwaUZmOTZlNVFLRWFFRC9pWDhCMFdV?=
 =?utf-8?B?Ukxtb0hjYzJtbVhBUktzK0JKdXBESnhoTFd3NktlUkordTYySWM5NEhsdWFn?=
 =?utf-8?B?dkg5bmpCMVJtM05leDh0Yy92eU1iMTk0Wjc3Tmd2UklIN2Y4czh3Q0Rva0t0?=
 =?utf-8?B?WXV1WHljQU1iakFOejBlaytuZmFZTzlMOStTUzhlMUxkTGcwOFVWd2t4WHRU?=
 =?utf-8?B?aTFSZ05XRlZsWVNRT1JRUmF1ckRRY1lZeTBDUWdBVS9weE9DRWZYTGxyaEJW?=
 =?utf-8?B?V2YxYWl4ajhEZ0dCUHhoWjVPVEhBK3o4ZmlVQURTNEhJckd5cmhJMHNEbGUz?=
 =?utf-8?B?Rmt3YXZubVRCQzFOdHJVUllJZDcyb1pSeW1JOGdMYWNacmFxYm1GMGdFZ3I5?=
 =?utf-8?B?eEVBNTZZYlJLL0FjanRuQ2RWTGxRU1RTZGR0VDhVZitucHY5bi9ZTFhpSFcy?=
 =?utf-8?B?c1RnRUozY1FLL2lDMFk3bld6UFF1cFR6RW9ZbndaRGkvY2M3Z0dGcGxDd1Fu?=
 =?utf-8?B?V05VZUpqWExkVmEwenN0dEJlUWRWZ2czeWNMTkR2NzRsclhTb2xBQXFYTkcv?=
 =?utf-8?B?eEZubmM4YXZJSzI2RHZyMytZZEZzbXNZYllQWEl6aFNTT2o3Q3VYNUZLR3Rp?=
 =?utf-8?B?a1Z3MzRTdFo5Sld3ZFNDOUt0R3VVUVRhOHZDUGF5OG82VE5Vem9wVUV0ZWR2?=
 =?utf-8?B?SU4rWWVVa0F3MHA2S0hDUldKVzllZ21jSzJydTJhWTN2VUQ0aDkzc21lMlRs?=
 =?utf-8?B?Sm5GZ04weUNpdHQ0TGp3L2xZa2ZIaUxLbDdOcHhiUG5vbWdTVFFNVHJZZmRQ?=
 =?utf-8?B?a0U4NWtSZkVCSXhGNHRtckpYaHlNMUNDaWxJUlFqUGViMkhTSnVxQk9mVVB4?=
 =?utf-8?B?eHZLeU9kREN5MVdQMkFTWGNMYUJKSTFwUC92K0V4eXVMR1VBN2p1ZWVNcUdK?=
 =?utf-8?B?S3VWMUFPNmJQc21udm1rVE9ndGVNV2didUE2dG15Vkd6WGkwYzZGT1diSjFX?=
 =?utf-8?B?ODFzV1IzRytOSWptVEdVMVd6dG55SUtabTNxUERGcndHTWF0eEhPaTVXNjV1?=
 =?utf-8?B?SHZ2Sm9BOWVLdDg1L2ZEbktpdU9rQnNFVE15eGFCUmVLamp0eU5Xb2M3V0JP?=
 =?utf-8?B?MXVZT1ZyOEYrMEgzN3diN2NiUHpvdWNyZTNQMEg5aG1Va2Nqeks2c2Q2V0dN?=
 =?utf-8?B?c3FOQTFBT3M2VUdJNWFwY2t5a1hvNCtsRHV1NjlWMDNUWUVhWm1iN29ONEdZ?=
 =?utf-8?B?UWVTYURWc2lMNkNaeFlIY2YwS1QwMEFsaEZlTmpSY0xUeFgyRTgvdz09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe9dc5b5-9198-4803-be8f-08df18b29c80
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 14:05:52.5225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F8xTivaV0LXlbTdJDkFfQ03zJmVr6T20hQyUJbvHeuysW9wIUc+lRN9G1wTHnO0Fl/iPseZKunoEd0F9P8rCgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR03MB8264
X-purgate-ID: tlsNG-4011c0/1790085955-530D9CFC-4B27C6F6/0/0
X-purgate-type: clean
X-purgate-size: 4777

On Fri, Jul 31, 2026 at 10:34:11AM +0200, Orzel, Michal wrote:
> 
> 
> On 28-May-26 02:25, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> > 
> > ITS quirks are currently matched only by IIDR and mask fields stored in
> > each table entry. That is too coarse for integrations where the same GIC
> > IP block can appear in several platforms but the workaround is only valid
> > for a subset of boards.
> > 
> > Replace the fixed IIDR fields with a generic match(hw_its, data) callback
> > and an opaque data pointer. Add an IIDR matcher as a reusable building
> > block and use it from the R-Car Gen4 matcher after checking the Renesas
> > machine compatibles. The R-Car Gen4 platform refinement is DT-only;
> > ACPI-discovered ITSes do not match it.
> > 
> > Keep first-match semantics explicit. Assert that non-sentinel entries
> > provide a matcher and that IIDR matching receives match data, but keep
> > runtime guards so a malformed table entry does not become a NULL function
> > call or NULL data dereference in non-debug builds. The matched entry still
> > supplies separate ITS and LPI flags; this patch only changes how the entry
> > is selected.
> > 
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in v2:
> > - Replace v1's optional platform callback plus fixed IIDR/mask fields with
> >   a single generic match(hw_its, data) selector.
> > - Add a reusable IIDR matcher and use it after the R-Car Gen4
> >   machine-compatible checks.
> > - Document that the R-Car Gen4 quirk remains DT-only.
> > - Keep the split ITS and host LPI quirk scopes when applying the matched
> >   entry.
> > - Document first-match ordering in the lookup path and guard against
> >   entries without a match callback or IIDR match data.
> > ---
> >  xen/arch/arm/gic-v3-its.c | 67 +++++++++++++++++++++++++++++++--------
> >  1 file changed, 53 insertions(+), 14 deletions(-)
> > 
> > diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> > index dc48a84789..e055914763 100644
> > --- a/xen/arch/arm/gic-v3-its.c
> > +++ b/xen/arch/arm/gic-v3-its.c
> > @@ -53,8 +53,8 @@ struct its_device {
> >  
> >  struct its_quirk {
> >      const char *desc;
> > -    uint32_t iidr;
> > -    uint32_t mask;
> > +    bool (*match)(const struct host_its *hw_its, const void *data);
> > +    const void *data;
> >      uint32_t its_flags;
> >      /*
> >       * lpi_flags are ORed into the global host LPI policy and must only
> > @@ -64,11 +64,48 @@ struct its_quirk {
> >      uint32_t lpi_flags;
> >  };
> >  
> > +struct its_quirk_match_iidr {
> > +    uint32_t iidr;
> > +    uint32_t mask;
> > +};
> > +
> > +static bool __init gicv3_its_match_iidr(const struct host_its *hw_its,
> > +                                        const void *data)
> > +{
> > +    const struct its_quirk_match_iidr *match;
> > +    uint32_t iidr;
> > +
> > +    ASSERT(data);
> > +
> > +    match = data;
> > +    iidr = readl_relaxed(hw_its->its_base + GITS_IIDR);
> > +
> > +    return (iidr & match->mask) == match->iidr;
> The commit message says you keep a runtime guard so malformed table data
> does not become a NULL data dereference in non-debug builds, but there is
> no such guard - ASSERT() compiles out and match->mask is then read from
> NULL.

You're right: ASSERT() alone does not provide the guard described in
the commit message. I'll add an explicit NULL check before the IIDR
match data is dereferenced, so it also works in non-debug builds.

> 
> > +}
> > +
> > +static bool __init gicv3_its_match_quirk_gen4(const struct host_its *hw_its,
> > +                                              const void *data)
> > +{
> > +    if ( !hw_its->dt_node )
> > +        return false;
> > +
> > +    if ( !dt_machine_is_compatible("renesas,r8a779f0") &&
> > +         !dt_machine_is_compatible("renesas,r8a779g0") )
> Given that IIDR 0x0201743b is not Renesas-specific as you mention in the cover
> letter, this is a behavior changed and should be mentioned in the commit msg
> (cover letter is not in git).

I'll document the change from IIDR-only matching to platform-restricted
matching in the commit message, including its effect on ACPI and other
platforms.

> 
> > +        return false;
> > +
> > +    return gicv3_its_match_iidr(hw_its, data);
> > +}
> > +
> > +static const struct its_quirk_match_iidr rcar_gen4_iidr = {
> __initconst
> 
> > +    .iidr = 0x0201743b,
> > +    .mask = 0xffffffffU,
> > +};
> > +
> >  static const struct its_quirk its_quirks[] = {
> __initconstrel

I'll also mark the IIDR match data __initconst and the pointer-containing
quirk table __initconstrel.

Best regards,
Mykola

