Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACB0C982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 18:05:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429391.1652286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x94rB-00012h-P5; Tue, 22 Sep 2026 18:04:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429391.1652286; Tue, 22 Sep 2026 18:04:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x94rB-00012a-MG; Tue, 22 Sep 2026 18:04:41 +0000
Received: by outflank-mailman (input) for mailman id 1429391;
 Tue, 22 Sep 2026 18:04:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1x94rA-00012U-3v
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 18:04:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x94r9-000XMc-6E
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 20:04:39 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ab2c32c-8faa-0a2a0a5109dd-0a2a450c8116-14
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 20:04:38 +0200
Received: from [52.101.85.40]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ab2c334-f479-0a2a450c0019-346555284326-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 20:04:38 +0200
Received: from BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13)
 by MW3PR12MB4377.namprd12.prod.outlook.com (2603:10b6:303:55::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 18:04:34 +0000
Received: from BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740]) by BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740%3]) with mapi id 15.21.0451.012; Tue, 22 Sep 2026
 18:04:34 +0000
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
 b=rIEghoqffS+B5m0AB8cm5VSOkz0gC4CoyLD+2wabmYutAxo5m8ItRo/pL0IbTwjUexjEGhkPIjhCEAq7ZbnK/jfMlHId6nLWLSiRoPYL8zXx6Cm/l86P1Hfy/75Ei3+A8M/wLmD8MqZYAZTXCuBRsm/9LIYpexDYf746w79wt8SNVN4itSLzuM1k4eHi0uJgSffW0USTOwmNAnuiFXa5DFBosMkEI85YcSZCUswk9clb3l7ky3D5Br0/WPjfRBw/yPWI5TS4IRwxYlg5CNQbciJHa1UsEFXSLioNj7pbvjGe7z2QS/NWqNKh4TiJ8H3NZMxUUPpQCIpgTMnfz1pxfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KsafzPgXm+m80JgfRlY5/jcuPa28hbwq3sNzFBPowF0=;
 b=Mnd+qcZ27W86R+m58HSAjJ1rsBO1Nj3OV8ckO6rSYiA/BDp7JvgKDIMhJc7juKPhTm8GRxhvuuCVr1+rqsNrDvGBg03aFEke7at8cx9mZkcA6yhE6Z0E5N1lxWNXaPlbiWyigMWgklOBGFqZfc2sNl9d2DJnQziE9PaIdwuyfYB7w17fnpim0hHNX31V0x4JwwkXbjwHHVUOnqNS5PKR29ldD/1Ytm8BzNGtolyXxD1qDyo7Mw0L3hUeIRQ5QItb0Rl/a74YH1ecYwB457k201/eOuqI9cbPLx84hKirWI5iMJbaDm5XWK2ZUVcnUj/DnU5VwLKk0+scJpqz59l9PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KsafzPgXm+m80JgfRlY5/jcuPa28hbwq3sNzFBPowF0=;
 b=MITuxenF2p7kXtvMz57grW+axEDfLY4YFuvUoggC/bFEQTo2mZo/c7Hmh1LA/WtyIOWtlxiyZj5nclsxjwAotFOtfEm/QYdT0cIEdX3/74ztaZhu056uumBVjs2U6+vJcuehJluXp+S63RJns8nbDnqYPcWIEGSCldPaNaNiVdU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 20:04:31 +0200
Message-Id: <DLM1L3P13SUV.ZV59HL491777@amd.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, "Teddy Astie"
 <teddy.astie@vates.tech>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86emul: Cache the amd_like() output on x86_emulate()
 entry
From: "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.17.0
References: <20260921092545.37148-1-alejandro.garciavallejo@amd.com>
 <baabb75a-dc95-4fad-a682-e4eb40071a73@suse.com>
In-Reply-To: <baabb75a-dc95-4fad-a682-e4eb40071a73@suse.com>
X-ClientProxiedBy: MA2P292CA0024.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::6)
 To BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4999:EE_|MW3PR12MB4377:EE_
X-MS-Office365-Filtering-Correlation-Id: 19241c6e-237e-41c3-8a05-08df18d3f524
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|10067099003|5023799004|11063799006|22082099003|18002099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	ZoyC4g93Jx5zzHCF9+k650WmvU3/71GCt7+LNqciBeeOxY67Rgv55A/VSvoG78xMkva6C5OADr67EgPxwDuzESdJwdy/TF/3kEHibuypjBnk04ngZsJRVXTkQDgf+9o8zvQbKmYWNFq+xnNlF3X1ag/aKKFY6u8as+zWKINHnqO/3ml+BR+LS44Zz7/Yqv8lhRSIefLERpvEUg1z41/ueVNNt0tF/LFnAlVYSCbdCO5X/fl9f4bKqL69iCR64GxtL63u7yayeI6KLkBeTfq0+ddfZT/cwUfof0qiSgxz78Mo5Oqy1lXQlNsV8GIt4yPqLzXelCHpTmF8PZygICDWtDpUogF0Xh1Xqhtb0YP3t8JBJ/ra3qT0iJM/+zdsaPLYpazSLM4bKXTAar+4SRJTGEwR0xD+aTKtXBbRTVhNIK+tX/MsqcWc9Q3gwDELf3W6V8LRHAMAX7bmd+OvTOTqn1asd2zSeAG1xeg2ih2fBS/oDqea1ylG3pV3fYfpWMMb+og2BYTZrUzi+j5ZtfhDuTTX9RwrqLb7Jcqf9/WmZq0IQPr9MYsVVImrLFV7XwyeAp0ypiz2AuHI6fUhkR8T1fZ+AwyEEvRs74/1ws1H7krAjG4PGbN4nDPHRIwA0q7giEmq7MGK7wPaHXQCQD80YaAUnc2LR9esaTFKq/cMIqI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4999.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(5023799004)(11063799006)(22082099003)(18002099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3RvRUtwUEUxcE9BcFMyZVNzUFJidUpmMkljWVB3TUQydkJjWWZhb0VTa3hp?=
 =?utf-8?B?OWN0YU9YQjFFUnNUVW5GQ1lFdUZmWUVpLy82THRyQjk2OHpRWlpDVyt6WXVJ?=
 =?utf-8?B?dUMyUkZoUUZIaVQ2eWRXbGhWVlN0R2ppcEF4aVQ0MW1xTTB0REhXRnBYaW5m?=
 =?utf-8?B?YjlTT0VJSm9PdHVJVjluQjRLVUw5K1NMTGRyQStIUzdyc1d6bHRMMHl2UGhq?=
 =?utf-8?B?RFRwTWE5MWRkQjJ6c3VzbXNkcjYzRlBLcG4xQ0VqVUpBc3RHZU1RY2Rkc1hX?=
 =?utf-8?B?WHcrNWt5M2xiMlM4YXNwSXZFbUJueEhUeGhNd0ZWUU0rUVU5b0lSWG5VQjJy?=
 =?utf-8?B?Wm9jNlNCbHowSlpxSSsrY1BFbkFtRUtqYlFlQUdCaldwZEN2ZW9kYVNTSGJW?=
 =?utf-8?B?S1FLaVRkanFYRHBBaTl6ekF1d0NFdSs2aVlyTGg2Ti9mZ1Nsa2NTamZtMi81?=
 =?utf-8?B?OFdGaTRBZGhMQUhVdnovSVdEUTNhTWJ3VDFWbUM2bjI1SFBYeDRkSk9jS2M4?=
 =?utf-8?B?c1RBYWhrK1hiRjdScEx1bENpS3NBRnVDSjZucnk1b0hBSUhBbndTeEEralFB?=
 =?utf-8?B?ejJkV3J2NW8ybnVVdVNMeDIwMitRRGN3V3drOVdleGxvZGJ0ZXBicjVaNS9v?=
 =?utf-8?B?Y05vVjVBZWVaL2x1QmVwNFU5UzlCUko1c0VwcVRZVmYzNG1JY2xXdUg1cGtM?=
 =?utf-8?B?cHQvd0N5eDd2SVpnRDgzMUIwNGw5MlpkbVc4aUxpbXRuUjJFTmRYT05ZMWtX?=
 =?utf-8?B?YzlsTjV3N3V4K3FDSTZsb2JJejVQajB2VVVQM3VrdUdSUVppMkJVbDM1NFJR?=
 =?utf-8?B?dGVVM1o1VnA5MFhyYUdsVlRwNEZOWkF3ZDdiN2paK0x5L21rOFFLcHQwQWpv?=
 =?utf-8?B?NVo4MFBXa2hFczkyb1JIMHBTNmJVUHVvNDFRRUpmSW9WMmFEeEpGQ1NsN2px?=
 =?utf-8?B?RlV2LzJnbEJ4Q2hEdFY4VU05RFowemJyUUwvL3QxNTBTZDgyYm95cFM4MExu?=
 =?utf-8?B?ZzVGSCtNeEExbFhQVFp1QUVNeWVPYTY4SkZlWlZ5VkNyMVNwUVVrSWlzamhj?=
 =?utf-8?B?WVdPaFArd2prbDRDc1E4QmQyUU1hNjZEUndibnBpeElKbmoxVjQ4UGxoeWpx?=
 =?utf-8?B?cGxtWEY1QVJKdjBETzc5NFdFTGxmREtMUUI5SHpVYmludzlrOFFUdXByVkx1?=
 =?utf-8?B?d25nWkJWUWdlaTRCUHJpY3BZMFZ2akNrMUZmNWJGN2tDRHc1M2tJOTBLSVdv?=
 =?utf-8?B?c09iL3hNai93czV6aFdYRGZYOTcyTXBxV3lRNWZsYmpqMzAwL0RCSW1xVnJ4?=
 =?utf-8?B?NlBoZ3RKZ3ZKeTRNZnBQdW02MzFhOW9yN3dtR3pJWGdxa0hQSnlma3FRblI4?=
 =?utf-8?B?R3VIT1JZVmF2NklhNXZXVE1iRDZYZVJsT3ZpaHh5a0RGYXF2T1c2V3hTSWxi?=
 =?utf-8?B?cUNWN2NsbGRUaE5pWDNnR2w0L2VKRllwbE1tWUFJR2Mxa3RwOXZrOE10YjNF?=
 =?utf-8?B?bjE3emR5ajM0bFJvSTV4bXJ0cWVrazR0QlY1OGJ6MG03WXRneDlKTWp5L29G?=
 =?utf-8?B?U25XZXBEaGJCNXV1VG95ZTNvcTVPcWJIZVVwWTF5MDA0ZkhwQjJNSjEySmpV?=
 =?utf-8?B?VVNBcDJwVXJJby9NY3ZQalBFN2g2c0tHbCtNRzJoMDFEN1FtdWtKVU1ZNWQ2?=
 =?utf-8?B?UmVUQ2tPQklxZXlUKytEMTNTY2dselJVdEs3OHJ5MGhtMlRkQ1c2Rzg0Ti9L?=
 =?utf-8?B?SXZuTytUcUFIa0VMOU11NkpwejVlcTFGMkhkZHNJT1k0L2JhZ3VqSCtUeGdC?=
 =?utf-8?B?amlaWEM0cFNtTzhpNXJ5MGZkSnE4eTVQUHBEOVRsTFhQWHBGU1BKTHJFK3Az?=
 =?utf-8?B?MkR0Ti9oWlg3Z0pxd0Nzb1YwcFlBWVk2OEVQeW9NbDFndzcxUTFKRkFlNnZC?=
 =?utf-8?B?NnRTcFg5OFhvVm1lY2FpaUtrZEtsYkxVbkxNOE5rc0luam5tNTMxeUlXdVV0?=
 =?utf-8?B?aWJUcDhVWEFqUzBoTVhOMGYvcmVGQys5OFFjQlZuNDMwS05uYmVaV1Y2bm02?=
 =?utf-8?B?WU1iUng1UE1KdjdiRUprU3d3OCtoUXF4MnJ6cUMrQ3dLSGNmZFZJT2lmem9z?=
 =?utf-8?B?MytMZzhUWmNwOHMvQVZqU1VGYU9nRkZtTmlBdDU5NGVxcDVjVUVmMWp6ZWw5?=
 =?utf-8?B?V2NrTDFpdWhmcFFPdFg4dTJuY0RlMk5TTkF6dk9QcWZxTU5ZbXVqY1pDME51?=
 =?utf-8?B?Y3Y0TTlGcXM4cXNzWW85OXNTN3pCY3hqZk1maTk2b3FLMVM5bnVabUlKeVNs?=
 =?utf-8?Q?SvMfgOTV4mUga2vkNQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19241c6e-237e-41c3-8a05-08df18d3f524
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4999.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 18:04:34.1648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7vjAryzad659JLFOJ/DfPtVNx8LJnlUqXRCokMo/t939zGW+XD4vB2i9CpaS5RJlJByuIsb2y4xguoieLbEQ1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4377
X-purgate-ID: tlsNG-d25034/1790100278-50F3BA5B-CFE38C0D/0/0
X-purgate-type: clean
X-purgate-size: 1962

On Tue Sep 22, 2026 at 3:34 PM CEST, Jan Beulich wrote:
> On 21.09.2026 11:25, Alejandro Vallejo wrote:
> > The current code instantiates amd_like() way too many times, leading to
> > codegen explosion. Unconditionally call it early on, and use that
> > variable everywhere. This shrinks the emulator by ~3KiB.
> >=20
> > No a functional change.
> >=20
> > Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> > ---
> > pipeline: https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelin=
es/2860748404
> >           (it's red because of an caching issue and personal branch nam=
e
> >            conventions it's just arm. x86 passes in full)
> >=20
> > bloat-o-meter before-after patch.
> >=20
> > add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-3366 (-3366)
> > Function                                     old     new   delta
> > x86_emulate                               209351  205985   -3366
> > Total: Before=3D3617694, After=3D3614328, chg -0.09%
>
> That's surprisingly big a difference, considering how simple amd_like() i=
s.
> I'm counting 24 instances, so the savings would be well over 100 bytes pe=
r
> instance.

I have some more interesting results. I can very much repro at that
commit with GCC 13 with debug=3Dy, but ALSO the variable must be set at
the tail of all other locals. I never noticed the gain was gone after
moving where it is in this patch.

Clearly I misattributed the origin of the shrinkage. In retrospect, it
turns out to be an unrelated matter. I _THINK_ register pressure is
somehow precluding the inlining of a helper. The problem is gone in
debug=3Dn where CSE ensures all is good.

If I find a way of shrinking debug builds in a way that's more resilient
to compiler specifics I'll push that as a separate patch, but for now
I'll just drop this. Clearly it doesn't matter here for a realistic
build.

Apologies for the noise. Codegen is hard :)

Alejandro

