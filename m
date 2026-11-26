Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118E7606A32E
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 15:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=X+BrPLyx
Received: from list by lists.xenproject.org with outflank-mailman.1503590.1699242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWbV0-0000Bi-Mv; Thu, 26 Nov 2026 15:35:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1503590.1699242; Thu, 26 Nov 2026 15:35:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWbV0-0000BX-JG; Thu, 26 Nov 2026 15:35:02 +0000
Received: by outflank-mailman (input) for mailman id 1503590;
 Thu, 26 Nov 2026 15:35:00 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1xWbUy-0000AK-Gp
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 15:35:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWbUx-00GHpy-T4
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 16:34:59 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6b08517e-bab6-0a2a0a5309dd-0a2a4507df90-42
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 16:34:59 +0100
Received: from [40.107.209.7]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6b08519e-b4ea-0a2a45070019-286bd1075b28-4
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 16:34:59 +0100
Received: from BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13)
 by DM4PR12MB7622.namprd12.prod.outlook.com (2603:10b6:8:109::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 15:34:51 +0000
Received: from BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740]) by BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740%3]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 15:34:51 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=afyjlOjsi9Ik3jTxzBLOgVhgiKFsmtwixXi4uzM63oO7BuL7leBT2HsbHnhztldLYBRjptE2GOko7Px/VruKLHd6yIY62A77OEq/PJ+l+ob35IdVEdLowtV/sbu7Z1lP00wpNggaG0mSqHXq9jbHnY6/wPDBNCqfouLRzvoLLXE2jGIsV7URrPpT6d3Ye2eWc7hCTAaQaJ2/8r67Hx9i2YJ8vvWiYOEmSJkHSthwwAYz140gp8DN9u9QvMrhwWG1QMGSnHgAMl3hQ1P+bWK5CFky3nEi065G2bJPDha4Y37F4EYwq0vnPxP9hXfgkHNz+qcTO1DkspSF1VF+p+2HpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BoRV0586mDJ99MiVh+ocqd9Ket3MZtOgjnjKvzFVdr0=;
 b=jKOgCXh8R7OFeVc/drBQ6mrYpwZptZh630exjZYVLhuZXZ1PEVOVOsaCwK4KjL+roJUldz+eAScv5BM2pD2bxo64CsHyg8+PYs5rYsBh4fQFF0hvell4f2mnYwWjyPLQa6xT6agp01nWuEzmkFEFBy5wnvTAQjmAoOUQngFVXI2To0aSilrJ45DkY6QXO1GXrtR3GYKWMkUW4vwgBnZhaw7qaTQnZ3MaOjf7tNU+FS9kBdx/JtXuuwb41xiiplwbiX0dErePf+QJNBbmc+ZM+lp9AAj5jFxhlifeN86q+WMBV8xkwQg4X9AsLfOHhf1BGNSCN2ifjRdfBIvpHEaLfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BoRV0586mDJ99MiVh+ocqd9Ket3MZtOgjnjKvzFVdr0=;
 b=X+BrPLyxXmqruZMA6WEs0dDpOlzWM5Ycjo/XeAsQrnQ8X7ynff1hl2Vu2AzImnbzRchU7lSNjMq3NseFdU6soVDi1JR8VOTTBKplkOpt/00evGJF4ee5ZWQtoKWmcybrfBl/OceGLKhuTGa2/n5z1IVecO1Ni6xvPcFveJmlSTg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 16:34:48 +0100
Message-Id: <DN593VRUTESC.U246UVFIC413@amd.com>
Cc: "Jan Beulich" <jbeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, "Teddy Astie" <teddy.astie@vates.tech>
Subject: Re: [PATCH v2 1/3] x86/amd: Consider only Fam10h affected by
 erratum 383
From: "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.17.0
References: <20261119144453.529009-1-alejandro.garciavallejo@amd.com>
 <20261119144453.529009-2-alejandro.garciavallejo@amd.com>
 <4d301ab3-484e-4a7d-8f97-4efa90c9f6d0@citrix.com>
In-Reply-To: <4d301ab3-484e-4a7d-8f97-4efa90c9f6d0@citrix.com>
X-ClientProxiedBy: MR1P264CA0128.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::10) To BY5PR12MB4999.namprd12.prod.outlook.com
 (2603:10b6:a03:1da::13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4999:EE_|DM4PR12MB7622:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cc7bc03-710b-48d1-d5cf-08df4bd2cfe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|22082099003|18002099003|56012099006|11063799006|4143699003|261022075727099003|261021123027099003|261021135927099003|261022105027099003|261026121527099003|261026140227099003|261028144727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	N5+BgPHzfgcBZALMDjrQ4/6wLy3ycjsw/iYXJYcLqo27SlIWyG00lQxq2uXe/PLPKvDRTAZZr74i5MJALVHcTMu20OpYYvCQEd6jk+m5GgxALh4fHSbU9WZXLWqqPQ1Q/8LNE/fM4VGv5Ku9EpBOMmB8JB0imPwX5kDmkjvLzWfEXne3onOPaBUnqYJIoK/ghamLjfLjOxnK0OQS+6Es1bT7ik9gXmOOWwup2OiwOs6mcZYLlUGJqXTnil59SvvQH5IpOIPP6qy7h0dNfs5G2WypMbfWL7aOTZlCtjTwrddATBJ05qhNXo38ImrCDgy31YDpNoKS4pPPe97Wx4Az8yAZnc6IyyqcG32yBeONwmDTGtPqIZV2MwQdYJjunzIVZyKAVdcYxVIJ3+U6WNuBT4rjPS5tkac7v4Ldd7SGEHhsNDposIPpUkhx4sQguCsvS+uU3k4NIEBypJvsRvM52Z6B1iB7pPglFMvlh2meJjzZdZNABL6GFdvlA8GQNMwL4KkGQnm6A2/LyCphvNm19P3gG4lSVv+sMO7Nuu/uFMfofEx/Wf8mcJo/pFkzfT8B6iahs6yd89T8Sx5kcUAXFvFeZfFfKca0WD7zzk2ayZA5X4eYYUecO6nUZsBbeWh+4BTvWd/MsPEf3DwdPuzNeg8oUhJ791juOQdmvQJkel8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4999.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(261022075727099003)(261021123027099003)(261021135927099003)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlpRbFhSOTNpSjFLTTJYMEVXQm1PY3pxZnpFOHYvWmJQckdvMmlTTDFzZWVN?=
 =?utf-8?B?YmRaeC91YXhJVDIwUExrbEZuWVZxZ0l2Q2VGQ2FEajNrNnpHUlhaeEtwRFhx?=
 =?utf-8?B?ZnIvU1oySGFBYTJCdTkrSG9pa1h3SUxqeGYyRDRsUGtuMnI4N2hydFRWNXRD?=
 =?utf-8?B?TnBoUDJ0bmE2VjFxKzRDQkZkNm5CeGoxeE13cmdNSUpsR2NFVVBVZENBYVlZ?=
 =?utf-8?B?MkNVVmNPZ212RGVFYnU3NW9mcUVCaUZPYU1Mc0VQdENhekt3MjltVTJuTWdz?=
 =?utf-8?B?eHYycS9ndzN6cUNBSnhWQzVlT2ovN3BLUGQ0Y2Fmbk1QQ0VqNmhsVUNUeDk4?=
 =?utf-8?B?TEZOUVdKdmZUZzRKeVNKcFRnY0tjc1AzY29nY1dGdW9XTnF3TzY2c1FVNXIy?=
 =?utf-8?B?MHFKckVGNzBZMFluci81V1JBMkY4SmhubHdoVG1rUjVHQWUxaWtsT3FyZExW?=
 =?utf-8?B?c0hJVmJYd010RnViMkg4Sys5MTZINTRHdGxHcHZkQ1gxSWx3VlJrcG40dXJK?=
 =?utf-8?B?Q1d1UGxoU0hScnRURngvRGd1UzhZSnZOSVZqbVVxanhjSDNnSWRBSUFlMkRP?=
 =?utf-8?B?ZGVKZkJyT3B6WWs0cnVkbjU1SjA2RzJSS2FPcjlRbUF0VVo4MWVESXlEK0Za?=
 =?utf-8?B?UjNjRzFkM20wMm5DMTcvc09sSnhlZ00weUFCcUIzVmZlVVl1MWNQaDZMaWV2?=
 =?utf-8?B?bU1Ob1BmRVNabkxKTXNxNWJSSGJuY1JFaHIvUzNySHJsNXBUdmJkQzVRTHNL?=
 =?utf-8?B?LzIwaitEdHA3aXUwWFRLT3YxcHh4dlJYRDAwZXVhQW56dDJINlpBNExqWi9Q?=
 =?utf-8?B?ZXBoVFlvTHBHR1pmUi9nV3JwQXp4eW5aOERMdmU1R1ZUc2RtN1JXKzlQbmFJ?=
 =?utf-8?B?MWs1czhDTGltOU94SEQzc3ZtSDhEUStQdE1rbkRSUmhxRzhKNUw1NndNOGVM?=
 =?utf-8?B?NjhZVWJOU2FXZUY3QlJNeHhxZ1VQemFJbzZkNDd6SzBlYnEvdTlWTlNlSFlp?=
 =?utf-8?B?L0FFb2d4NkFkQjVtQXBaOGhjVEZFN1IrRFQ0TnNUWlZ4MFM2V1kxTk0zbkNV?=
 =?utf-8?B?VGdwRWpxcnY5S3RkSERHcXRiNGtWaTVvdVlFeGxneHVPbjdjbFdVKzNUZEc5?=
 =?utf-8?B?eWd3UUo3Tko0S1ZTN0VyQ1FFRXNSc1FYSWNjMXlUZTJaWnhLTGF4aGd4MHd0?=
 =?utf-8?B?UkYvTk1IUmZiVDg5dTRqWlYrK0NzS09VbDNaV2pPUVN4NHZVWHJvWEtmVFR4?=
 =?utf-8?B?TldNRGxGTGhDYkJQMFlmVGNGYTNtMTVnelVNRGw1UjZJRE54ZWVzOSttNnJ6?=
 =?utf-8?B?ZXE0blJKRTV0RmNkbk9iYnJtQloxT2JlZGd4eStQK1NzalJrTkloUEJRU3pD?=
 =?utf-8?B?aUk2UHpTUjJtVnRSU2NKUnlRUjgvYWozejFzc3AvYTRVRXVmQnNZRHlZSnZ3?=
 =?utf-8?B?SzhnM0tJY013Z3hJL1VEckJaNFFadkNvVGxCU3FiS3MzWGlJaEdVQ3dDb1hU?=
 =?utf-8?B?aFJlUEZWOFN6dFNia1JjZEFMYU1Gek5lazBrbFluWEJwMEQybmphK041VDYy?=
 =?utf-8?B?cW9yTUN5R2QzY1dGaXNoc2dRY1VOV09MWkxnR0lISnlCTnRnajF1WDBsTCsx?=
 =?utf-8?B?N0d0WERUODQ1QUlSMC80OVEvTEQxZUFJMWZ1UVNSTzhsTTZ2UzFwQ3RPMjA2?=
 =?utf-8?B?bWNqM28yZkpjRWVud3dPS2hjdHRuLzRIRzVGYmxQOWR0NDhZcmI0ZkJTR1Vv?=
 =?utf-8?B?OStleUtRdXN2bHB5NlNySE9NamtIcDkvS3JsUnJSY0ZDQmtZOFZ1ZHEyK0hi?=
 =?utf-8?B?SHhCc2E0SlBQUjhrM2d3VkY1WGNGSExWVUxqS1o1cEJSWndFL0VzK3UrQUg4?=
 =?utf-8?B?NDJXNDRLU1dwZ1J2cHBzT0lZcUpTY21KM2NORmpLcDhJV212cWtLaXRHR29a?=
 =?utf-8?B?bDNTUTI3UVNZNzFlQkowK29Qa3VyWEp4Nk1sK0kwUG5YUVFvQ2tHZkt3Q2xN?=
 =?utf-8?B?b3VwRUh1MFNSNWFKQ3dqTmVUYUEzeGlWem5NTVdXR3prZ0JBd2hBcTlIQnI3?=
 =?utf-8?B?RWl5aDY1MnFQWHk5c01vbG10S0lQVlNacWZ6bmNndWY3ZFJMZEdJRldaRms5?=
 =?utf-8?B?cFA5RkZzaW8xY0dWbjNrMVJrTXpTQTRGTVFVbWtzRnZBb0J4K1hwdnN0cDEz?=
 =?utf-8?B?bEt3em5aaHlKV3F0WHV1OEkyZVNHUzFVOEd4U29mVHNhRDlDdXBkYmxyYnB4?=
 =?utf-8?B?WktPMHpJNU5ybTFTNENwSmZyekVVazlGcXhZVXh3aEpPbVNDb3p2OFVXcWVi?=
 =?utf-8?Q?tiVYZBfl/75WWWlITx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc7bc03-710b-48d1-d5cf-08df4bd2cfe0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4999.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 15:34:51.4441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1srXQnNycTzzS0ZQtEccmN1mnqmdRRzYGmO7quhYgsp/WlUpq76AeFOatfUW+u5w3thdmlwVb/YVxBgfVNDSCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7622
X-purgate-ID: tlsNG-ef75cf/1795707299-A4CCFAE4-3A695CD1/0/0
X-purgate-type: clean
X-purgate-size: 1871
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon Nov 23, 2026 at 5:53 PM CET, Andrew Cooper wrote:
> On 19/11/2026 2:44 pm, Alejandro Vallejo wrote:
> > 2604adda4f81 introduced the cpu_has_amd_erratum() machinary while addin=
g
> > erratum 383. The commit message claims it was based on Linux's, but in
> > addition to cosmetic changes it also added Fam12h as affected. It is no=
t
> > acknowledged as so the relevant Fam12h revision guide, and Linux itself
> > never considered it.
>
> You need the NDA revision guide, not the public one.
>
> Fam12h, Model 0 Steppings 0 and 1 are affected.=C2=A0 It was fixed starti=
ng
> in Model 1.

They are 15yo engineering samples...

More interestingly, the fallback list is wrong. It considers
model1/stepping0 affected when it shouldn't. THAT's actual silicon
people could buy.  The range is inclusive, but it was  written as
exclusive.

I'll rewrite the patch keeping Fam12h, even if it's silly to do so. with
the last item being model0/steppingF.

Cheers,
Alejandro

>
>
> > My best guess is that OSVW always returns early and
> > doesn't let the "legacy" mechanism ever match Fam12h (the relevant bit
> > is always 0, according to its Revision Guide).
>
> The OSVW MSRs are fully writeable, with a note saying "OS/VMM should
> treat them as read-only".
>
> Getting helpful OSVW information requires a firmware update, which means
> OS/VMM software needs the fallback list irrespective.
>
> This is why we have the legacy list as well, but it also means it
> suffices to only have the legacy list.=C2=A0 (Yes, technically we could b=
e
> levelled and OSVW says vulnerable outside of the range, but for the sake
> of one 20-year-old errata, I'm not overly bothered about this corner case=
).
>
> Anyway, this can be given as the justification for getting rid of OSVW,
> with the Fam12 range reinstated.
>
> ~Andrew


