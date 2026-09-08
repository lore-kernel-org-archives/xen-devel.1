Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA39C79F9E
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 12:22:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1411893.1642354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3uqI-0004Cw-PL; Tue, 08 Sep 2026 12:22:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1411893.1642354; Tue, 08 Sep 2026 12:22:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3uqI-0004Cp-MK; Tue, 08 Sep 2026 12:22:26 +0000
Received: by outflank-mailman (input) for mailman id 1411893;
 Tue, 08 Sep 2026 12:22:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x3uqH-0004Cj-Ik
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 12:22:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3uqG-00BmUL-U6
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 14:22:24 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a9ffe00-8faa-0a2a0a5109dd-0a2a450ba55c-0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 14:22:24 +0200
Received: from [40.93.196.30]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a9ffdff-b7e8-0a2a450b0019-285dc41e243c-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 14:22:24 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN2PR03MB5056.namprd03.prod.outlook.com (2603:10b6:208:1b2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 12:22:21 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 12:22:21 +0000
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
 b=U8y2emMBI9ynufwnnDZMt1h+G/ND71GZBOF7oPasipID/HulSDIDYpYfg8hzb59U/2OLodjdPF7TlTSFRzIPr8bipTtqeTqX3YNbRtWCgM8DWgqYQKQECecYqaS5HtRagyHzs7fEJNvJBaFOycJFOnfKogJe5uSZwb4o5fuR+ug4icTyXbT4QMeOWr/Jt3GvOIXgrmDyzqc9SfTX5KmslGrJl+5b+YEbpCgOlcYdRL+soEXIwXTfOnYhDimQoHyjyJr/2tlQF6USnkfL3m0zOTREYvP6AZyhBwRAhdS90CyKEVKTYxau+ftAIcwrf6fjuI0IHxPpkGATxCvAd4fqRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3TC5WxXG7rrt/FrhpeNxSgCqOXaSHMmr5DeZkB0Oxq4=;
 b=NVxgtC+kPA55/VHo5LqFjfhfpvJLkSWzoAJCOskc3FS4oniAf596/GBw9CdDmHOy1uJ8VScwzbrQe+3mJlF5ZL3Kq0uyiYtCObg9Q24MWrCnOYFylTSrpIAcU28z3xSXL0HsFBcmhTyLXaIUjta6DlohqXHF9B6cmUujRclp5JU5ZjnDyDHP2BpeZX5tOtVjTfZpAuVG/XlAmqO693O7w92z7eC60mV7gmNqYnFUMQWkBISQAs3V6asHprYwNcMMud3PEUkyFrMz4Ufh4wtQmYvmQca9KbGKLFnutqV8cB5QdGu5WLT8hT6eyBodI2hQMGGHPy38aXn2EwGkY4q/6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3TC5WxXG7rrt/FrhpeNxSgCqOXaSHMmr5DeZkB0Oxq4=;
 b=v4TYTmm5sLsAR7TxPvkBP9e8C9MN28kpYHJzqFIkiRj9Lg+6vr3mD9WsDB3qM8Y294sOXeBXALk08KYy1ig7FkiVHDrLjWaedy24ugGDo19YY0h3Cpx1r9CSW+FnqaD1gSqbYXZS7+UPa1FDJKeRpX7mEbkG1huBwtIYUN8FXDw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c8f312e4-fe4f-4a17-b206-52f29ad0714f@citrix.com>
Date: Tue, 8 Sep 2026 13:22:18 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH] x86/HVM: move evtchn_upcall_vector field
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <837bce31-aa87-43ee-82b9-1f188432d572@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <837bce31-aa87-43ee-82b9-1f188432d572@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0033.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN2PR03MB5056:EE_
X-MS-Office365-Filtering-Correlation-Id: 52f90a82-79e2-418d-5e3e-08df0da3d4fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xuaj8OWAAqZBeFDW7IkYLH6A+oBJN4gfCEVIOBSNx1XSCm5fa861NsfWumWz2HRKD4rVJuGJtoa+zvHgu6CfWD0vvfNWpB8Q/596tEcRpulwpmlWvElEQayL/5mi0icWIY6qrZpAizIEwxWJutkq2w8JD90TIVUow9SD+q5bW/GUI5MaYIbfiLhJHIZx63ajs1y/3ZbqveRCHvzz9nwAkOxInyQ/Xj+It5Bd6DZyBcT28BSVKvnaQIPfrRPEWxMJ+Z0qqKy08XkxC7ZgUr/y4RcH0gO5Dfw1NSWzJzKW0DN+J2iNoeFrEjbnriEgGbFrjksZACve5zHk9oFNYZ59Xv2INAp/N/rqTu2l7t6RahxzVyDlDumC6U39EgpUTCMkcKFzNewCRU2Wep0wRKTcrbgXTZf2FWUPyaeSzYnJJWrnl9Okl5kfiKH4Di4nqarczi6ApfNofCfFxjoSy5I/Cn9NeDzVtMlyhqCLJ4TRG/P2sP9W7tWT+TaP+9bXoVjcJbJn+uV+p0wCerMhW1X8pnpXULW73zR+b4/ayoYs+WY7YCzgbNSb6CkT7kKA2PxSMlotapaPWuB8/Jx/Srd8VROM2+6X9g84M3XQim0BYgruy4rW1iuHgyOdV84dDNk2w6LYCHsL3D/CObdvCRp/MN8Hu5/6B5r516YhT+oHNi4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVZqZzRLNWNPQzZzWkFMOW1DRkF2MWllVkVlaWJFUkgzNWJPWVVJcVl4VVRr?=
 =?utf-8?B?MkRwNUJyYnlrOWhWWVZRNzM1aEJ4Snl4aWRHbDBXaUJVdWFQRWdlYUhjTmF0?=
 =?utf-8?B?aXp0QndJT1dzMHo3ZTlUdG9Ra0xBZjE4RWE2Q2pNY2F1enF3MHNzYXdOUk5m?=
 =?utf-8?B?d2FXRXBXN2o3NDNUYUtEWU9qTFByRDRMT1IyWFd3ZCsvM25nTmRySlVtNUcy?=
 =?utf-8?B?aVZvbVRRa0draEM4dmxyTWwzNnBkN2tBemp1K3pjQklqMk51QTBGUHgrbEJQ?=
 =?utf-8?B?TzJ4SlQ1TTNaMzNIZm9nTWV4ZENpVWVJd2E5cWxkVnhJMGlycWwwSVhKczdQ?=
 =?utf-8?B?T0UvdWpuRlE2ZURzTm96bVlCN3Nsd1Jjd1A1Uk9BVmlHbWlHVjYweURrbFFG?=
 =?utf-8?B?T2haaWdUcU9JV0plZ0d3MmdSM3RUeGdCU3BjczBFVVNma2R0d09jQXIwQ2F5?=
 =?utf-8?B?Qk8zVzJDVytKSExQNlBSVEQ3UGYrWUZicll1cTBwWTBYT2tPcTA3WHQ4dysr?=
 =?utf-8?B?eG80aVhpb2lPbmo3Rk9VcTU1eGpOYmR4TURmTTlnNXRRNk5kcC9uRThLRTBM?=
 =?utf-8?B?ZHZDU2RML0RKUVdrOTZFblcvZDMxUkwxMVdGeG9RODcyTm1wQjMwcFZ0ZnlR?=
 =?utf-8?B?NnFVTzQwU2MxTTB5M1l1Qk9qU1NFTERuazNvT3FjMU1zM2ZXOStPNkEzV0NL?=
 =?utf-8?B?Ry94dU9xa2ZRampDeEdBOWZHWElVQU55RzB1SHZDT2NjM3JvVnNGOXhSeW9I?=
 =?utf-8?B?dDJhMnpWQXZobCtlbURETzBOUC9FODNKaUx5R3RWZllMejhDZXFtYXFobm0v?=
 =?utf-8?B?Q3VSVjN2bkhqYlVzZXJWV0E5Q2gyWHg3R1kxVGZqVWVTczhGclMvUTFoSWkz?=
 =?utf-8?B?YytlanYxUGQrOGwvc1duWnlPNkt0OGpLaUk2TFJpNTZOMWhKQytrWlprZG00?=
 =?utf-8?B?cUJiY2xTSm1ObWE5RUxzVW9LenZHMWJtUmFEdFZxdG9kT0ZTKzhCSmdVZDcx?=
 =?utf-8?B?dm5KYTVpTU1QMGdpajNFdFZoR2lhYmpkYjZDSnBTcGxCbHJoM2twNlBvemNs?=
 =?utf-8?B?ajFGSUxRN2pGQzl3SU93OGNDQzFmYlhLRXFudkVORjI4Z09kUjBBM0RSOVNZ?=
 =?utf-8?B?SExEUndRblNlUTVBVkNFaERMbjJZYlpnTmJZMSt1MHl0ZTNObXZScy9VYW9R?=
 =?utf-8?B?REc4RTAzaTJEaC84WEJPUGl1ejJRTktPQ0VTenk4NlBPNUdrL29lNjJBUWxp?=
 =?utf-8?B?ckl5M1d4Tm1GYnlxOHY1OEVsQ3JvUlpXcm55ZWpLZDRKRXdZTFFMM1ptd09q?=
 =?utf-8?B?RG1zZHBwN0doSzF0VWt1OWFLczYyZm54MS9LdmZDVDRFZm5jMWowamdyRmxX?=
 =?utf-8?B?dFMyanhTL3N0eVhRNk1mQ3NOZENFNHAvNHh4Zm01MUpIWmJocTZmeEQ5Y25u?=
 =?utf-8?B?M3d4ODdRNlBXVTY0Z20zVzFEcFI2L2w4SGJlekJjNm96bllCdmJ1NEhKeUhY?=
 =?utf-8?B?ZkNvMEROYTRHMzNtQUJuMVlUSWZ4aW94ZWo2UkRXeXY4cjNpZjdEdUk5V1Bs?=
 =?utf-8?B?QWl4UWZpVC83STVQWXZ1Q3BBdXhhMHU3bnVWWnVBOGF6emVUQUhaWWpUYlEv?=
 =?utf-8?B?QVJlV2lHOVpsUkxGT0w5aFlaQ2pHOVdOUGVJMlBJdHJIVmZLbmk3VXNHbXpr?=
 =?utf-8?B?eFlrN2xjbkEyTDJxNHVXK2x2VXQ1QTRFUVBXUVAxYjRWRjBPbnM3QlFBVzU1?=
 =?utf-8?B?emhaRzhvZmZuQ21uWFFpczdmZEpBM2pSRUpWS3M4cktwZWF5b2MybHNBUEZz?=
 =?utf-8?B?UU5ZM0RjcndkOGpjTE5ZZk12SVlqeFFQZGRzT0xaNkdPeE8wLzl0S1liT1BJ?=
 =?utf-8?B?bkwwQWdLNVlKeWQyNTZmckxCTUFwZGFZYzk2NjFHK2xXUEUrUWczNDhQUVJM?=
 =?utf-8?B?WEM4R0Jlc1JKYmc2WStUMGhucDZ5a0owbmQzNUxCdzdxeTJZNEw1aHFyTnIz?=
 =?utf-8?B?MjAzQUw0VlNtNlhpcW5YL1lLdUZFUGZvQk1WNi9ha0FCWkM0OVB6NWdXOGFm?=
 =?utf-8?B?ZlN3RGNDU2VKeHBTT3FUeXNXY2JmVjNlVUFKaWdURGZIQ00wK05hUE91dWt6?=
 =?utf-8?B?Nmp6cUVGZmVxVzY3WkZzd2p4WDBKbHNSSlBxYkUxeEdQLzJDblQwQ3VrVUox?=
 =?utf-8?B?b3h0K3NuMUpYUkd5RG9BSnliWkZvNHozUWVudzYxMXFyY0NSTGtxM2pnaTRz?=
 =?utf-8?B?RThlOUcwdjh5MjZWcVg1N1BkY2RWdWZnUTR6UllFbXpIeXdvTnlySDFhb25p?=
 =?utf-8?B?OHo0UXlaYTJLSUZPbTEraXRGbGpsS1VTSVd5NElTamxoT05seHVVQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52f90a82-79e2-418d-5e3e-08df0da3d4fe
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 12:22:21.5178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V/Mk7+zJx3RTZaS8vcQ2Cpdc+qDmnDSfpCFFPjNKkU8xS7+VVZYcVXV0GzYmwn8kbNp9uuyoIxxRvQbpRzAKrxylKpBMJHS+FrbEaojrxlE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5056
X-purgate-ID: tlsNG-42698a/1788870144-182F49EA-4F515A4F/0/0
X-purgate-type: clean
X-purgate-size: 245

On 08/09/2026 1:17 pm, Jan Beulich wrote:
> ... into an available 8-bit slot, rather than having it followed by 7
> bytes of padding.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

