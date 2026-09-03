Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D723C624D7
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 10:56:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406820.1640004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x256y-0006Qc-DO; Thu, 03 Sep 2026 10:56:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406820.1640004; Thu, 03 Sep 2026 10:56:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x256y-0006QV-9Y; Thu, 03 Sep 2026 10:56:04 +0000
Received: by outflank-mailman (input) for mailman id 1406820;
 Thu, 03 Sep 2026 10:56:03 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1x256w-0006QP-SA
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 10:56:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x256v-0076d3-Qp
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 12:56:01 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a99522f-2eae-0a2a0a5409dd-0a2a450ab12c-38
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 12:56:01 +0200
Received: from [52.101.46.63]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a99523f-f2d2-0a2a450a0019-34652e3fa112-4
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 12:56:01 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by BY1PR03MB7189.namprd03.prod.outlook.com (2603:10b6:a03:523::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 10:55:57 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0382.007; Thu, 3 Sep 2026
 10:55:55 +0000
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
 b=DxasIE8sYbZEka0dBH3enj30RHdi2Wb+A5+nQfEnjrOTkC2x0/6mc0k4COKTMctKWkhxLTB84MBxWQtrcI4fc4K+s8b1kfPfLi2p8zRniGbXh0czgz+JKolS8w5tsdYAphcqfPQimJD46fi0sR1DFlG5FV+5Fe+K9Fz0MZ0Aw1y1HpaVe3PidLdbvU2I0xEtxWs48yKRwBsIedtixcTTkTGfmvgxByRKMembbjbDdzVD74W99alULaA6MhoCUhuNrYEJumyLtIlm2bTj/o2nnpQzVkgKa9L6GLge5wMpkpEietnJ7H0u7pSXI5MKQGye4gmbKy3GUJIgmAmGdKFf/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IgdSTHhGOXN6NHcc5q3jDwnh6tsUFiTXaHjBqXLZ37E=;
 b=fM37zn3dkomPNmNqYvmXSbjeFhpHXdx8ThXOgbFQNF5uH4PyO9HyuXPS5FCd4Fid07Z1f0zfpcGUvXlFLiYs3lsfxO8/jyAkDcqt50r9lUVeOeIjkmbk5Mu35b34dVwlAbB5Q6Oz8AaCWCVuPGxUwwuLBvy+fncbnlC/SKyQoDfx13rL1B4oOEllGLukBNscIoWwrmbJXpuTypO3jbJSTbcyue2ztcy9rcMBjZWF4Yb1lSDIXux8Jv+dH+MeHOIzjmp6O6EahpdZlNFN0GsFKn+BduLLSSOsIdiXrVqJMbn5dJL7rl8bEaz8pW0tZ6OGMBjnXDefjobvNYOPpCmnNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IgdSTHhGOXN6NHcc5q3jDwnh6tsUFiTXaHjBqXLZ37E=;
 b=GUGh/wZG9rCYBT0Vr9nJ0P3pi14jMeHRCK/j5cNm0hC2a2LuYBBifqIaQ8yoNRZjerJzSUXJ9mNEtIMi1YeEUSVZoBQRNZOIC9ayJKJ2wypDYcmkd5a71tRxViMc4bv8p8KmLZ+21G0Dh/GtUcj7H7SbbYNB5f8sDs3IMGsjWgk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <12a277aa-2d67-436a-8afa-3a68ad6f6ae1@citrix.com>
Date: Thu, 3 Sep 2026 11:55:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] x86/viridian: Workaround Hyper-V GP fault writing
 to MSR
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260828131142.3986110-1-ross.lagerwall@citrix.com>
 <20260828131142.3986110-2-ross.lagerwall@citrix.com>
 <39ccc2f5-7b3e-4c5f-a98c-b526f12bb1c7@suse.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <39ccc2f5-7b3e-4c5f-a98c-b526f12bb1c7@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0102.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::17) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|BY1PR03MB7189:EE_
X-MS-Office365-Filtering-Correlation-Id: a33280a5-6c05-406c-d9c7-08df09a9edab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RCzLHOvKVhvVNXSpVcEx5zQ7kT1QDaM9CPwoMquWdF8wy8p63E15a5vb0i3FcIHadkDwD0JOoDa67ihkUmHx3YDlPDVFrrgOeJLf3xawy6+4O5qLCAjD8aBOS3EKvjqoItZmQ1b8TX/vfx7K9cccwTAlGqb0ggOp2AtTVgFcbt9kkcRajF9Za1UAT23k2gRJl1vr4CdNMrja41vKopHF+abB3CgovoYDh/rS8dpDVCzMPu7nQHCQozwEC+J8l8PNv1DuvP5Oil+itocP/dKGv9C8aPdml4V9n0ONVvsaEshozesPWwzJKPil/8m+G9DwQ4yDeiz8LN+GNXWj3zk0TXsiOzNBxyDAONevVU5z5aLY6SAr5TNhZ2k7pqQwMJJwbzt8SDtxCsar8X31gFuzj3M9RNgRCwYTpKGfJSEmqfnLvYMWU5mN+YZpu+ibIHEMYZoomUZs4nFQUO8MssQeRI/+mMXUpprJvGi+gSi1phkyvQxVKq7EluBq6wJJ0rLE/Km1e18QOmvfjMwRlTdSjkJN7lBYg4ni50fY04eLXID6zbO7c4On2O1i92sgzsguShIb+d8up7DiCpqyvV1hocP21S1oJueiNOsnPL4rIScxG5YQkOQxrVAqXJEQunrxISS1E5qm/QY8FfsD8OE2ZCqmFqKKnpxU8x2/lsXzTd4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjU1MGk5M0xzcllEdmVlQ2RyME1iR0RNV2tpYTZwOWZTT0UyYS9iejZleGg4?=
 =?utf-8?B?em9JK1N2azVRcEJKdGNZS0dBbW5nbmNkQTY0Wno2U3NZUW9BMDJXdG1iVGtM?=
 =?utf-8?B?NjRRcDY5Qm1KaXVudGRHNnQ5RFJZMS9pTXJGU2RlTGlnV0FYQkYybEVSQWtx?=
 =?utf-8?B?b2dsMUJsZ28rZUdzUnBRajhXUXI1WDROWWU4ZjBZUTdCNitrRDVjU2R1S2oz?=
 =?utf-8?B?Rk9oaVNmZ0owMVpVY3NyaGcvQjVpSWpLNlN6K1VkWHpMZFVCaHp2TjdwNGxi?=
 =?utf-8?B?WTEzSTNtd1lqZEFqWDJMTjVBKzFOWjlyUnBQUnZSZ2ROWXNicEhyN2hETGVB?=
 =?utf-8?B?cjJ2OG5iMDZ2eHFnb1VuQVpBakQ3UmhibEtXekZ0aGVzNy9kMnlhckV3dzVl?=
 =?utf-8?B?Tnh2VXJFWkd6Zkh0cFptaTNHYWdhOTQxNnRzNWIxZVJiVkNldmFldExxMFpm?=
 =?utf-8?B?Mmdqa21KMzFneFFnTGVrSmtpUWZrU2JycGRVcEZGOUdWTExPaUNlV3JZdGtE?=
 =?utf-8?B?V0FhbWRreUUwSFFSNUVBVENMQ3M4M2pmck1oUWhNVmJtS29aRm9LcXJ0RHNz?=
 =?utf-8?B?cXhJa20zYTRSWDJTdXJINzZTbmo0ZjlCeFcvcklKWDAzWFZwYnBpUjByK0kv?=
 =?utf-8?B?bCthd25lV0piZnJWL1h5WXZ2aUNZUEpjbE9oa0pVYXU2Qm93VTJRQVBDaEZB?=
 =?utf-8?B?ZDk1YWJnbFl1dkpPNEpEU0UxenNXY3VoRThnc2RZVkpoemwrNHNwNVlHNVBp?=
 =?utf-8?B?Rm5wVm9FZ3lGZFYxSytnVk0wRTMwVVFEREJBaE1oOGx2eGJTRkt1Rk8xSGll?=
 =?utf-8?B?VmcrSFlLTTI4YnFOTUFMYzVTa2RsMFRpaXVMNWRROTdaKzBhdGxDVzJSQVVK?=
 =?utf-8?B?Yk5pUTUvOHpWTVJ4T1VwWU5OYTlDMkpwb0JlUm5lSTVSaHF4RDVadE9yaXpI?=
 =?utf-8?B?MGdpQklMMG83RzR1NGx0cXJ2ZXdrVHhWYktHT1dRdVpzckJzejN0NkE0R1R1?=
 =?utf-8?B?RHVxMEQ4d2lPZGxQdFQ4WlFWTGx6NTFFbldZTXlUYVk0MmpQNjBVKy92SFZQ?=
 =?utf-8?B?OG1pd2t3Q0RtdTNPeGxHTmxpQ3VMK1oyYndobTRMcVA4eFZ2dzFNd0hqYktW?=
 =?utf-8?B?cXlMb241Q25VNjBLZFRRSENIbHRKVW1LdlNTSDFpMmFwYVZ6QjVzZXRTVkwv?=
 =?utf-8?B?UGU5ZEd5WlkyYlhjRHF1RDJpd05wQ3ZXY3l6N2w5dzVHTWhIZmhNbXFJMDZQ?=
 =?utf-8?B?c3RYc3NCd1Z2d0tzb1Zka1ZtWmU1RTZMVGlxbHk4WTNGSTdGTlZzaXF2VkpJ?=
 =?utf-8?B?NEhlRGROSEpTK3BBSmdHcnJQOWNFdmx3QUFKcHkyU29oNXlVeXQzbVhBbHU3?=
 =?utf-8?B?MHdTZ2ZhUEZvS1RQeEp4RkVwMVR4czQvV2ZqVVdpeE9vaEFHd1JqSmxUS2Zy?=
 =?utf-8?B?Ny9veFB4eDZDZ3QwTU5nM1o5Rm5WK29PdmgyYjRvOHcwRC9UVDBKNTlxR0la?=
 =?utf-8?B?ZTZFclNTTHh3NGdjRWZGQ3cyUG9MdGRaazVJM3grYUtCNlYwZWV4aXBYZ1ZZ?=
 =?utf-8?B?WEc2cXRRcG1HenNGNDl5dWJBQzE0U3NiR2RJMG5ZUUtUV3NxS0VCaWk4OHVO?=
 =?utf-8?B?eFNKK1FaMFgyMnkrRjJrMG5ZYmtQNFFCcjZBcUdla1JPaDlGZ0Z3b3pWSTFq?=
 =?utf-8?B?bVpZUFlza0JQMGFaamhuZ2F3RllKaHlkWU5PVktQRXNZWnRkTkd4SGtRd0ZR?=
 =?utf-8?B?Mnk0ZTFCdmphYTNpWTF2bHdjUE51Yllic2pWN1k2TVErTDFPdngvVmNmRjFa?=
 =?utf-8?B?VEdlbTcrWkF3SFkyblRlNU42d0R5cmpoaGtPSm1xSjBrWDRLY1cyMDJCeGRC?=
 =?utf-8?B?OWRCRW1SRE1VOFhMVUJlbUJMZStGaEdpVWJ0Rkl3ekhuOHp6QUV1L0Z5dHJh?=
 =?utf-8?B?OE5Gd25vZGlkeGdzOXpZcnBFcGhWNHcxdnhNaWpzdU1yekRFSVZXV3B5U1VZ?=
 =?utf-8?B?YjhYSDhiNk90VmVhSTRvOVgyY0N3UHJ6NkVJRFFuZnI2RHhuVFBxUFRLYmw2?=
 =?utf-8?B?V0x3RWxNek9SSlFkRVZRMHlzbWFOa2c0eW9VZWxWNDhoUm55cFZHSHQ2VnJq?=
 =?utf-8?B?TmQ5d0xLdmlabEZzNG9tajZ0dWxOMGdXVSsyR0dNUEI5WkVBSDhEODRzcG9L?=
 =?utf-8?B?OTV2UlJHT3IzSEJSL05IVEE4aHQwSjI3RlB3QkRld2wwOW1FTlQvaGlnU2Vt?=
 =?utf-8?B?YUJkQUJMTmNUU3ZHcHhwaVYzeXpmamFTYjc0N2pJSkp3U1BmQ3k2bTA1MUVU?=
 =?utf-8?B?Y0JGVitFMWdVd3VMSTRHeFJ3b2ZUZUgrS1BUNGxWelVDSmJSL2VZQ3JwV2xQ?=
 =?utf-8?Q?muHB6Wl1KM0d6BQY=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a33280a5-6c05-406c-d9c7-08df09a9edab
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 10:55:55.3115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: whwI68CUwLq1h+wrThcXI4xmzhS24PMsyIIdKw0RoqI/W/Yte2reJHhMGvaBh3p1dUSE+CynCekeltqKz2sD8FFIGsIEi15ZPareUd7w+f8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7189
X-purgate-ID: tlsNG-4011c0/1788432961-593C4CFC-BA07A55D/0/0
X-purgate-type: clean
X-purgate-size: 957

On 9/3/26 11:44 AM, Jan Beulich wrote:
> On 28.08.2026 15:11, Ross Lagerwall wrote:
>> The Viridian spec requires the vector to be >= 0x10 when writing to the
>> SINTx MSR, otherwise it should #GP fault.
>> The spec-defined initial value is 0x0000000000010000, i.e. the vector is
>> 0. On startup, for some reason Windows 11 Hyper-V tries to set the MSR to
>> the spec-defined initial value and since the vector is 0, it GP faults.
>> To workaround this, treat the write as a no-op if the value is
>> unchanged.
>>
>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> I expect that despite the (valid) absence of a Fixes: tag this will want
> backporting.

It should be fine to backport, though in general I think backporting nested
virt fixes at this point is not needed as there will be too many changes to go
into the stable releases for it to reach a usable state.

Ross

