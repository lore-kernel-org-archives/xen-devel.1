Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010ECCCF2DA
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 09:57:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1454052.1667534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIk7H-00051F-5m; Mon, 19 Oct 2026 09:57:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454052.1667534; Mon, 19 Oct 2026 09:57:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIk7H-000518-2m; Mon, 19 Oct 2026 09:57:15 +0000
Received: by outflank-mailman (input) for mailman id 1454052;
 Mon, 19 Oct 2026 09:57:13 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xIk7F-000512-9S
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 09:57:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xIk7E-002gCA-8c
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 11:57:12 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ad5e96f-8faa-0a2a0a5109dd-0a2a450c8bbc-36
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 11:57:11 +0200
Received: from [52.101.52.62]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ad5e976-f479-0a2a450c0019-3465343e5228-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 11:57:11 +0200
Received: from BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13)
 by PH7PR12MB6468.namprd12.prod.outlook.com (2603:10b6:510:1f4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 09:57:07 +0000
Received: from BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740]) by BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740%3]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 09:57:07 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y/HnD1cErJqBGO/AD0qmQKY/4wrX4sxTAyBQdJM4hhzS0hxOqprgMY3a+IWKVfnJOYCIN4LOkCItQlOdwfy6hAl0pBuhTtuILR/RVMTVVtQAY4W53JhTkKG0aAWtQgWYn8Nqpv+zE+DbAvO41+0fcQDbV7x1eXglFL3e9LKMiX/BFitMw+HojzcKNf3pFLEYadrH4WXouCrjnF0WKOpoueP/1S4yFbX92twUKZYRVqdW/9cABtrylDsNeOn8NJ9rWIU5UAIgiGm4vgPspHiU6ykGig1NzoHQuftfBTSzTtThqhoWf86qOnxNfeCWvyA8WJEEhpX7wwqHyWcG+ve/wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=20Xj4+fFCJ9DxG7VWK3ia5TVuJSi01rEY7gT0dVWtFM=;
 b=eb8doOJGy8Eg9P+u+nE3IUe1USC/vTw3ZIuOwZlE0kTfDxNFcJzCwkMKIqmUKQTZq6dbHoIm+uLY9nDYL18yV+tS5fHiVF3cHMRk+UHgu315ITm40awb7+F7mjivV/hzdOkGaDD4hNjnMKH7jerUpo59YF7OFaFAK1iojWBV21f+drzQe7/txDtwj5yP1YWlggGzR23PmoZEjrhNj7zEv77SilcffAAgHAV2dVmJJmb1hVGHiZDHRqArVG4CzQlCUIVRsTBueKIZF4r6IBTIJ3L+WLplRHkuHmxbNTYcfOtMXZYItfkBVRYdTe/L4seKaKAklp5nmWI/7j4vVdMZPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=20Xj4+fFCJ9DxG7VWK3ia5TVuJSi01rEY7gT0dVWtFM=;
 b=Ge/8HdsbdFfFRduGS1sAi2SNvEz9MzVTMmKPer6I6trt1ale4PdhoEnWUYVqeH1nfA+uScA90g/vJwOxBr4jnkEVKKlQLbRjmt3jfuNUd58liiYR0kgRvHGHQ8F6+O35m1yMm3RDCyvtggmlMd22pXVH1189gtYk3TT2rZNWuk0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 11:57:03 +0200
Message-Id: <DM8Q4L8IVF5G.2CNGU491IK4D4@amd.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, "Jan Beulich"
 <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Andrew Cooper" <andrew.cooper3@citrix.com>, "Teddy Astie"
 <teddy.astie@vates.tech>, "Jason Andryuk" <jason.andryuk@amd.com>
Subject: Re: [PATCH v4 3/3] x86: short-circuit certain cpu_has_* when
 x86-64-v{2,3} are in effect
From: "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>
X-Mailer: aerc 0.17.0
References: <b6ae837e-293a-4c06-aefa-02a5b9cd2c3f@suse.com>
 <18b38bd8-bc6b-4925-8880-234c7d2b9497@suse.com> <atXkGLicylXMQ8_H@Mac.lan>
In-Reply-To: <atXkGLicylXMQ8_H@Mac.lan>
X-ClientProxiedBy: MA3P292CA0035.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::14) To BY5PR12MB4999.namprd12.prod.outlook.com
 (2603:10b6:a03:1da::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4999:EE_|PH7PR12MB6468:EE_
X-MS-Office365-Filtering-Correlation-Id: f7f8c106-f819-42ad-a744-08df2dc755c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|261009223027099003|10067099003|56012099006|22082099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	YZLhwBUxHIpTtSf3vxjWiCXnVvAOdf1Bpy6QotQLM+iZpJ+w0pgrKSZGLOCf+9UoUgIePYx+56pC/e1PD3xR98/cav85wHBRaHESjv91GNA0ro6ymAA41ZJiKqF0NdMNVMValWfdZOXGgAGsJ4+zfA1ydlpM850SFIZeZuWsvm9vriYOk9RxDBnVnhWFI+OF20YDPAHURkkOLieuzVhpWHplYCLwoO9NcljWYx/ToLskMI8fRRVWh/Tql5FWP+Eyux4AR1lrdjbX9FRnMVVjPQmrDKN8pE2u2ByByo7xYgSgkxk7jhqz9FN5SdQJnzghRobAWiMhxpfNJ77UURd+PYKjeYv/8IlR61AxehaWh6WDaEhkkh2RFtsfFotLo8ZM5qyIM3LvaOqDrD7ewOwp0rwEjyDp4FX3vosZVGN9oBhC8id9Jee/Srk9HmRjGQ1/TbBjvjDqJAqMPh3ZuHw5PkvENQHZTQrbtkMkD75/bFTKPb4lDSKCCFd1igso6RrFYU/cde6QgsuFlnmon3XISvvTluluz1awmMUQqqtOMpkNmCymzGJQG8dL5ANKI2HPUiN8TJb/d+JizUSWrMv3s4BoUByWAVqiCkw4brvmXf4FZ9F0clA+UxaXiZT70wKhoCidelhZ4oehMqhELrjGGn1qODXhWK3kEMfkf1bjEqw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4999.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(261009223027099003)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3hrbmZxanRDcVdNN1JmS2wzbHZEZEZoSGxydUZINURCd0tDbkdBL3dZcEFz?=
 =?utf-8?B?OElIRzhCSEtmanh4OHkyT0h2dEk3czQyWFVvWm9zOTdFaVJURkxDZnRUQUVo?=
 =?utf-8?B?L2lIZWcxUDRxZlFkTGVrejJSbUNFeUJ3RlNTL2tCMlJFdldZd2xNdnRHRGlB?=
 =?utf-8?B?S0dicnpIS25lZHhjRjU3bUZMZ1J6V2NSdzNML0xabjlIU1lzZzhvaTJYWENE?=
 =?utf-8?B?YXFmNjFuNXJieUZDcWdYNHkxakVBbjJCeGdOVElWODQySE14RU9teXRGWm4w?=
 =?utf-8?B?QUxXNFFqWTA1d3lNRm52ZVJXYk8wWXo4ODNOSjZDRlNFNWpqVGpiYXErSklh?=
 =?utf-8?B?VEsrTnRsYkJuZGtsRyttTWFrYVBNZ3dkUXh5WmRINy9xMUgyQjNVUjJLVjA1?=
 =?utf-8?B?MEdVaHdmVW9Qcm9ieHBWcHFKcjQ4QXlFOXVkLzhBaGlCdVpFRE85U2FBbFVu?=
 =?utf-8?B?aEFCZkFDVE4zaGVaUXRncmlWUUNFbDVLbjQ2S2JZR1kxa3VTNGhyejRqUkRL?=
 =?utf-8?B?ZDU4dEgwSGRELytkRHA1QVNkRjVieFJLRU1zSUROT0tIaWhwK2FjcFlEL1BZ?=
 =?utf-8?B?bWpJNVJkUSs2VTBZOGVGSVdzSGNlc0l2SVFvcXlPZlVrT2NGSnZjekNFMHY5?=
 =?utf-8?B?dTdRZWduVTY2R3R0SGpmbzVJL3hJaUdJaHc3enV6QjkzcU1NQTNzbU9jMWo1?=
 =?utf-8?B?bDBlWm9icjc0RG41QnZwa1VHNFRlc2daWXlkdnk0SHVvVExQQzFyTzdnRDI1?=
 =?utf-8?B?bjAva00zbVlJWk5mWGRadThKUWNTOUFveWRXTGZqSTR5UERvT084SUdzdER4?=
 =?utf-8?B?LzdVTDFiUFJTWFF0cW9sSnR3Um05cE1ESjJ1S0Q1WXVScmwxMGVlOFNlUUor?=
 =?utf-8?B?T0EyZm9xV3prMFljdnJmNDkvbCtxb0t2TkRHcHk4MUVLMWV1VktqeS9aSjFB?=
 =?utf-8?B?QzZvUURkT3JCT29acUV1bmRkQ1p0dkVnZzFtSGF1MGovOTZzZk5QS2tIdWQ5?=
 =?utf-8?B?RVl4SFkzcjMzYzZtVVNJSVpvMFMremhRNDNKb1RGb3NZM2l6WHEyWHRCR0sv?=
 =?utf-8?B?WE5abjhCb3RzME1BSFlXTGl2L1ZhMU54QVQ0bTlQWTAyUHgwVUVVcGU4M3dJ?=
 =?utf-8?B?SkhWQ0xub1pVTU5QZndZemI5SUcyZzg1NUt0S0dIUVdEV1RtQTRqellWU1E1?=
 =?utf-8?B?WE9uWHJkOVZiYlZ4ZG9IMVJBWDdUell3N1owR0RLazZqVjFjeHBwb01XMUZk?=
 =?utf-8?B?WVVwS0VKa1FKbW0xZzNYUWlEcUVtcVpGUDh3R1hUQjYwdytjMXM0ZUJXN0Zs?=
 =?utf-8?B?RmUwVndhK1hJUkhWbnlLb1UzOUVYa1Y0S3piY2hKSEdTajVCT0xmQWhvaDVP?=
 =?utf-8?B?enNET1Nmbk1hTUtBeDZ2cDkwcnJKNjdQT2RBWjd4eGZRVjVaVVN1b1ZlN1U0?=
 =?utf-8?B?OVFjRndTQkpRNmVDYzd6bFBpZzduNDFMc3ZkOWJYeHZoQlpZMzI1WUJIWkQ3?=
 =?utf-8?B?WG9OOERDR2duRmxXNlBYWDNqWW14QkNiM09MaHNGNDk5cGF5UGUwK1p6dVpE?=
 =?utf-8?B?eUFxYWFNb3dvZDIzQWdkNzVWWE1Qakh2SFo1ZVNyVmw4SmhDbE5RS2pnQ1hp?=
 =?utf-8?B?azdDcmY1NjltdTFCNUlPc2hWbndqbXMvTWVsR3UzZ0RnMEdxVytCWE14a3hp?=
 =?utf-8?B?V2dMMFJ0RGYwK1lyam1ReTl6dTdqZkFydzRMcEp4UTlEMXVEaEd1NERGVzV2?=
 =?utf-8?B?aVZoSUZsNGNBdk9RaTlPblh1eGVZQTRYT3N2bHk0bjcwUXY1Z3UrNlJTZTB4?=
 =?utf-8?B?LzdlZVpQTUZkSHpIay81OStBSkcrcEM3cmJQRzd6ZVY3VUlSRXBGVFAwMGNo?=
 =?utf-8?B?TzJiUmNFTU9SZzNpZ0ExTndldGF1MG80TkJuKzJ5ZjRCM250SzVNTWc5RHhj?=
 =?utf-8?B?VGhCZlE3SGtVZUxjVVAwVkdHbDdBcGUyOFpxQUp5UnhqV3RiVlBqYW5JMXRU?=
 =?utf-8?B?d0w0UkR1RTE1SVJQYWVjZENFbG9WQ011bWhVS1gwbFVZZ3lwUWlJY1hTMG41?=
 =?utf-8?B?NGNHSDVRaTNrbmJXWmhqVTJJajNNbHRqWThKcnlNYmZ1YjJsRmczUm93M3dK?=
 =?utf-8?B?OGtMUzZXZnZzWHQyR1QxdkVGYkt4QlIyZ3BSbmlvOW04ajEvaVhxY2RMcDdX?=
 =?utf-8?B?WTRpRW40dlM5QlFXVURCTTVrQk03Z3BteTl5aURHRmExa0c5d2VtOU9xRDBN?=
 =?utf-8?B?dGg1cWEwcHFuc0U3SCtrOVNYR2E2YmJkOGZLWFI1SVF5VTVKM2J5MEExWWFL?=
 =?utf-8?B?SmhzWkwzRG16aTA0b2RRSWh2ekJaaWlDeW15VzY5QmdWRXU4NDZuQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7f8c106-f819-42ad-a744-08df2dc755c6
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4999.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 09:57:07.2442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YSxMeuSgahcDAmwVjqDXo9cfatRPPmr1EahTG+PQl9JLYBmkA/IJUW+r0R7ASBkQsIJIlc6zV7oGuBka+jvVEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6468
X-purgate-ID: tlsNG-d25034/1792403831-5270FA5B-B12CB9A0/10/78276251493
X-purgate-type: spam
X-purgate-size: 3057

On Mon Oct 19, 2026 at 11:34 AM CEST, Roger Pau Monn=C3=A9 wrote:
> On Thu, Oct 15, 2026 at 11:11:39AM +0200, Jan Beulich wrote:
> > Certain fallback code can be made subject to DCE this way. Note that
> > CX16 has no compiler provided manifest constant, so CONFIG_* are used
> > there instead. Note also that we don't have cpu_has_movbe nor
> > cpu_has_lzcnt (aka cpu_has_abm), and we no longer have
> > cpu_has_{popcnt,bmi1,bmi2}.
> >=20
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
> > ---
> > Of course we could use IS_ENABLED(CONFIG_X86_64_V<n>) everywhere, but a=
s
> > CX16 shows this isn't necessarily better than the #if/#else approach
> > based on compiler-provided manifest symbols. While not really intended
> > to be used that way, it looks as if we could also use
> > IS_ENABLED(__POPCNT__) and alike if we thought this would end up neater
> > (because of avoiding the #ifdef).
> >=20
> > We could go further and also short-circuit SSE*, AVX and alike, which w=
e
> > don't use outside of the emulator. This then would of course call for
> > also having a way to select x86-64-v4.
> > ---
> > v4: Re-base (over dropped cpu_has_{popcnt,bmi1,bmi2}).
> > v2: Also cover XSAVE.
> >=20
> > --- a/xen/arch/x86/include/asm/cpufeature.h
> > +++ b/xen/arch/x86/include/asm/cpufeature.h
> > @@ -132,11 +132,17 @@ static inline bool boot_cpu_has(unsigned
> >  #define cpu_has_monitor         boot_cpu_has(X86_FEATURE_MONITOR)
> >  #define cpu_has_vmx             boot_cpu_has(X86_FEATURE_VMX)
> >  #define cpu_has_eist            boot_cpu_has(X86_FEATURE_EIST)
> > -#define cpu_has_cx16            boot_cpu_has(X86_FEATURE_CX16)
> > +#define cpu_has_cx16            (IS_ENABLED(CONFIG_X86_64_V2) || \
> > +                                 IS_ENABLED(CONFIG_X86_64_V3) || \
> > +                                 boot_cpu_has(X86_FEATURE_CX16))
> >  #define cpu_has_pdcm            boot_cpu_has(X86_FEATURE_PDCM)
> >  #define cpu_has_pcid            boot_cpu_has(X86_FEATURE_PCID)
> >  #define cpu_has_x2apic          boot_cpu_has(X86_FEATURE_X2APIC)
> > +#ifdef __XSAVE__
> > +#define cpu_has_xsave           true
> > +#else
> >  #define cpu_has_xsave           boot_cpu_has(X86_FEATURE_XSAVE)
> > +#endif
> >  #define cpu_has_avx             boot_cpu_has(X86_FEATURE_AVX)
> >  #define cpu_has_rdrand          boot_cpu_has(X86_FEATURE_RDRAND)
> >  #define cpu_has_hypervisor      boot_cpu_has(X86_FEATURE_HYPERVISOR)
>
> Alejandro (now added on Cc) is working on something that achieves the
> same end, but it's more transparent and doesn't require modifying
> individual cpu_has_ macros every time we want to short-circuit one of
> those.  I think it would be helpful here also.

Yes, my cpu_has work would simplify this quite a lot, and it would
effectively deprecate the ad-hoc nature of REQUIRE_NX cont-ification.

I'll try sending upstream an adapted version some time early this week.

Cheers,
Alejandro

>
> Regards, Roger.


