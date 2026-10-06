Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B7FCA5FFC
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 12:30:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441475.1659089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE4Iq-00022Q-6E; Tue, 06 Oct 2026 12:29:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441475.1659089; Tue, 06 Oct 2026 12:29:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE4Iq-00022J-3K; Tue, 06 Oct 2026 12:29:52 +0000
Received: by outflank-mailman (input) for mailman id 1441475;
 Tue, 06 Oct 2026 12:29:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1xE4Ip-00022C-7v
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 12:29:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xE4Io-00C3F2-LB
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 14:29:50 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ac4e9b1-e002-0a2a0a5209dd-0a2a450981ee-30
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 14:29:49 +0200
Received: from [40.93.198.26]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ac4e9bb-be1a-0a2a45090019-285dc61a983b-4
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 14:29:49 +0200
Received: from BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13)
 by MW5PR12MB5597.namprd12.prod.outlook.com (2603:10b6:303:192::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 12:29:44 +0000
Received: from BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740]) by BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740%3]) with mapi id 15.21.0496.010; Tue, 6 Oct 2026
 12:29:43 +0000
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
 b=jT51usW4g3monHE6hM2LSH5Y21a8JA1yIcgyrMO7cGVtYj9RX0f42O/j2qnv9lZhkz1jBx9/rgIQaPJxUTp9PAj6aViTztrfmUZSUCSrcoB9S3Pv6J0xukRXT0A+JtTR//6xHCkMRtbIhVF3j09klUFlcDVhpSeF498oCZqmjb7a/DVh0cgYANic0hXgXnVKXdz4/ZSDDCIKxSUz2Dn0oWgf3etuGVEzWt/ltYc+dN8GEajwAnV1oO9kq94/bzhqL8kudBH2v95jq/yzy7+Ez3OsFIuCsbcGcX66xpll+6ZL1q7kvzLPzeLOOmGPADRW6bZu2cS3jjc2nXTMGburiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DuG09F/PZRagwLzwz0P6+lF7+4aB+HcTYJQYawMjQVU=;
 b=lTTccw1tRfgj4wtKTxfeQ/tw2Dnw6sbqJ3C9P3bIErNwnRl1EmZlKH7HzJUrSzII+lrhlXKcJiCMK1gbqmvE4waWsEmwdH/Y1HP/Kc6qdajmFnrjhl/AvpniYC4YqB6RFIrwuQrSSSo4MH0BfUQLJOQLkuenSHBLtB0lNLgZUWgiW/Yk7gavyv5fo94VDTrCXcV4NN04KWkLJOPn7YQkVpl0f2VNxURjtx3pxh8daSfBMlTjjyDNIe39msfnIszLCAwzHoH5V6mPkSb0Jt30hf+bRwNn8gsWgSDwKL4qEXLioov/xulmaRpmzzhWxGp0Q7diKrhVH+Rnj65iAnN5RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DuG09F/PZRagwLzwz0P6+lF7+4aB+HcTYJQYawMjQVU=;
 b=e2tMfPh85XJpVY6xwmOKqy+NZO9j/jegO7/5doVdTp3MVc4H5S3copaCWtRP5jYPH1YuSt5HqAtde28elelIfhpOwvyMyZougfpBTj6UY1jPjABe28zU6jUO2tHUGPxh4F0z6javANRFkQmORNGrlMlBwpJRCaptgnEB5dDw9t8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 06 Oct 2026 14:29:39 +0200
Message-Id: <DLXR8CB96NCX.1ZRUEBZZG88GC@amd.com>
Cc: "Stefano Stabellini" <sstabellini@kernel.org>, "Julien Grall"
 <julien@xen.org>, "Bertrand Marquis" <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] arm/nospec: Make nospec helpers always_inline
From: "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>
To: "Orzel, Michal" <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.17.0
References: <20261006103142.139422-1-alejandro.garciavallejo@amd.com>
 <f9c2cb00-e334-4dab-a173-4cbffff18d94@amd.com>
In-Reply-To: <f9c2cb00-e334-4dab-a173-4cbffff18d94@amd.com>
X-ClientProxiedBy: MR1P264CA0184.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:58::6) To BY5PR12MB4999.namprd12.prod.outlook.com
 (2603:10b6:a03:1da::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4999:EE_|MW5PR12MB5597:EE_
X-MS-Office365-Filtering-Correlation-Id: 987d0c2f-6c3b-4fb6-98f8-08df23a57fb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qTHGLbvZPWMZq4OtVBo5Oexe92jHaDYvFn54+DneuIY+hgJP210BMSF0l00xFBbCeQwzdB7isHjaRQ8IH6hkG0nSY/VS2w0talDvAZtoghv15veyB6jCc/G6UKoJq9sDrIX+OWwJ+AldJS2vZ9+ZRCGcjBZ9Eta7ecigsgWpwlPTlmLUbdBTED+QVxBRlSDWvK3pf4YgzeqGME6W8D7ARvvet2fMZkxrkPz0Hy3klEbHLVkAVXL1BO/0cFPxcrljeRgHBaveoauWZuTxsV4GHpI4ZWQ0d0DSjLGvP63bMWB/rTwk+gkOAeUpxIeBcRwAORPvF5Iq2FGl6JOL4Vx7H/6Ykt1w2YjhIDAAAWlmCksp2DNk4YxOKu+8tzjLDXKQ05BA6BAFrSWv1bfD2/XfaNfl4cpU9PH0Hq1WjbzuejrmvAB86rbCvD/6szhCfVP9PQgKFDgBhBf5XvEIF1gQANjuNuGcUtrsEGk8dnMkqH3Ukyb5siYNAsptnLR8/DelzGdmu5aqZMNdGfqavzl31H3LL4UvdDsS+mHY/bmCZoteOwuLujQfKP/wjQBFviXNRSKH1384ltOt8VLNQx0bqCY+k/hYNeip+wRgb5i4lc/D3z6ef+zK7r15tGGea44bAPNxYdYA8reZZASXidva3yqIXGVzav+wsoDNZM1ASzg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4999.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckprRlFqTkVXenpubjk1ZzVOQjh6Y3B0WmhtSXBHZ1k4U2pPemtTMHRHSXZk?=
 =?utf-8?B?V2VzU1BFaEVnQWliK1RMbFFYdW5nM1UvYzB4MGZpY2ViNDUyTnpzWDdoZGsz?=
 =?utf-8?B?STZoOFJiSXdFaFBiT1Jodk9vbTFDN2pPSDFiODc4WTlOcmlvTHJ1ZmVkeU41?=
 =?utf-8?B?QWF5VFpiRVJhWTJVQ0ZIVDBHZG8xMDFvSm1hbklHVXI3UVg2TVRucWJqS0gy?=
 =?utf-8?B?YzJ2cGpnUTVJSDFtUS9ERVh4dEJjLys4VHV1L0tOdzNhTUxoRUVuUkNhQlBG?=
 =?utf-8?B?SHo5MWRKbVhPTFNIa2I3ektiOEZrQW1SSXRmeS9UUkJpRDh3VGJ3Q2ZydHVR?=
 =?utf-8?B?UW1xM0s5b3l0RkdwSzlCQUlNcUw4NFZYVzlPT1B6Y2EvYUg3SmpuOWR3YjIw?=
 =?utf-8?B?dlo3VHRvcktuQUVkVm93V3Bwb2g4clh3RC9hUlk0VzJIY2hjT09pNys2MVpm?=
 =?utf-8?B?Z212RlpxRUFCYUFTV1BEaW1QTTA5b2hGWm16L3hpdmtSQ3k4UWg5WnQ3LzRK?=
 =?utf-8?B?cDZuMXJZdUZmRTk5dks2Q1laTm5jWVhQeDJGN21PckkrVExNUHNyaFlzMVVm?=
 =?utf-8?B?SDNCeWxUcCtlSnBoZlE5QVJ0RzZoYndRZkFmcXZyc3BXcWFBcjhNcnJ1ZHJt?=
 =?utf-8?B?TVRPOTNlak9UcmRYNXZtcEdZYmZaeTVQcnlSYXdUSmhDNERxR3JvazNOY3JM?=
 =?utf-8?B?cUswS2JKYkFVQ05Ha1NJaEZXNis3ajJsMERuNHNwQ0VLeUE2eGY4MFJrMHdS?=
 =?utf-8?B?V2dIS2NQZTJWNE9qZnNDYUxZTFEybGxiVEREQ3AxbEEyMjgxT1piSm5xOHEz?=
 =?utf-8?B?WTVveVcvOWdFdFRlK1FwYm1CK0RsOXdaTitXZ1Z3N2c4T0IwV1lZNkNyVkdj?=
 =?utf-8?B?ck14eTVia2Fram1taEJDOGxrWWRVK1FYeFE2aXlvckNNYXU1RjBFeXU4T1ha?=
 =?utf-8?B?SkgrNnd0RmhsQUpRMXBkaW5PeDRFOUVDaU9zaFUwVTIxK1VubUNkN3l6YUs5?=
 =?utf-8?B?Skl3bndMTzk1UjdNVFNaMjhpS3ZQSGF1V3Q0OHJqd2ZqQitrb25PNUVIaHZp?=
 =?utf-8?B?OGxrZnRkYU5Ma3N1eVVLczB1WisxQkN6dlB1MGdzNjk3eGd2eEc2d2FUWEZq?=
 =?utf-8?B?ZnN6cExSWVhmeHQ0WHc2RjVldGxCaTBrb00wbERheGd1c0MwMUJpdnRrNEtt?=
 =?utf-8?B?WnpzTjR6clI2TDR1RUNwdDAyMUF4TG8vbEZxVk1NNzdPZTV3ajB3K0xQN1ln?=
 =?utf-8?B?YlRUdHcrdDhYZUhYMyt1cEZYTFRNYkFpeWpEQ0g1TmJSMERGN2JQZ1N2RERu?=
 =?utf-8?B?cVpXODZnWDZxNVB3cE52QkdLcXB2eVpKeVc4djZtOTB0QmdoeXBXMU0wK1lz?=
 =?utf-8?B?SUZBRHVjU2VXRDlyK0p5bEV5QjFHazRMK3RXYStDUUJ0RXByWlJKRXJ4U3hw?=
 =?utf-8?B?N1B5MWJ6bGQxU0d5NmptSXZIbk82R3FmUE84cGcyZHlBQTJ3WTlzcWg0Q1JX?=
 =?utf-8?B?YXNXRSthN1IwWThYemVpanowUHMvM1hVUFF4Q21Sd05aYjVJR3JqT0lCTTJX?=
 =?utf-8?B?RW5IdkZIdmJjRHpUVVpyY0JZVThGM3cxbm9zVkFUa2F2NTRyYlhiZ05RK3lm?=
 =?utf-8?B?aGQ0ZEJpYkhvMFJWMlhyRU5jYlQ4amF0K1ZselRpQzltakxkRDhjTGtiVGd6?=
 =?utf-8?B?ZkRvdUpOeThEVkRxa09GMmM0dW5YNllNVU1XcVVyY3Nva3IvSlVkNnA3SlV0?=
 =?utf-8?B?ei9aY3ZjN3pOUXY3eWUxOFZKVWNNTnZpVHErckhDc1luZ2J3QzVTYy9VajRV?=
 =?utf-8?B?elRJVUVNR2xjNXBuV2V3bUpMZXlCeVpzWkcyWnM2S2d0Qld3QWtYMzNSbHNn?=
 =?utf-8?B?YUMrdXNPa2dIaEpWUkpSR1FQMFYvYkJpVGFscXplVjVqdHlEUkJ0R2hqRTRV?=
 =?utf-8?B?WERlTWNRKytnUkZscmkxSFMwdDg3bXE5Ump1NTB2bUdibEVhOGU2QjI3RTdH?=
 =?utf-8?B?SkR5YVZNdFF6dzNUNEw2S29sOFBQY3ZYV3F4WU9vV0tQVzNBeFA0Z001ZmR6?=
 =?utf-8?B?NUlmMEEraUFkTXQvdmFiSDhlVkpET2w0Zm1XdzFUZzNtUmk5UTdRdHVOeUt3?=
 =?utf-8?B?MHJ5WHJMdlN3Y0Zoc1ZaaVl1ZkkzUVlzdzlMdlVNR2NIQkxCMlAzK0dwa0h6?=
 =?utf-8?B?UC9YN3kvSzFDdWdza3ZGMiswU1RVUTc0VWtweXFZZkExQjFXb3ZZb3lXY0Rz?=
 =?utf-8?B?VCtxUFN1T29XUkdhekQvWi9SaHdyY2g2R3BRVWZmOXdwOFR6OHdyeG9UU29C?=
 =?utf-8?B?Zm4zQUpQMGhVdCt5Nk1SYU1tNTF0ZUg5MjJDb28vOFVYdWY4alhRZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 987d0c2f-6c3b-4fb6-98f8-08df23a57fb1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4999.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 12:29:42.9618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tlc4Wq0ntOHf0S6u6IY3Wt0gAyzdF3RPbK8COBGqmuq5cLy+zW10nb/xWh/vwyhREmtMfh0PhWKwsfBos1H4hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5597
X-purgate-ID: tlsNG-bad1c0/1791289789-BDEC6034-D876F640/0/0
X-purgate-type: clean
X-purgate-size: 722

On Tue Oct 6, 2026 at 12:45 PM CEST, Orzel, Michal wrote:
>
>
> On 06-Oct-26 12:31, Alejandro Vallejo wrote:
> > While today they don't implement fencing in a way that would block
> > speculation, once/if they do they'll absolutely need to be inlined, eve=
n
> > if -fno-inline or -fno-early-inlining are passed.
> >=20
> > Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>
> but this should be done for Arm, RISCV and PPC at once in which case you =
can
> keep my tag for v2 # for Arm.

Neither RISCV nor PPC implement nospec.h today. Should I considered the
R-by just settled for this patch?

Cheers,
Alejandro

>
> ~Michal


