Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A5D4C61DD3
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 11:27:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406872.1640039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x25al-0005Gl-AW; Thu, 03 Sep 2026 11:26:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406872.1640039; Thu, 03 Sep 2026 11:26:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x25al-0005Gd-75; Thu, 03 Sep 2026 11:26:51 +0000
Received: by outflank-mailman (input) for mailman id 1406872;
 Thu, 03 Sep 2026 11:26:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1x25ak-0005GW-6E
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 11:26:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x25aj-0029CQ-I1
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 13:26:49 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a995976-e002-0a2a0a5209dd-0a2a45089f8c-24
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:26:49 +0200
Received: from [52.101.46.33]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a995977-f659-0a2a45080019-34652e217209-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:26:49 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by CH2PR03MB5319.namprd03.prod.outlook.com (2603:10b6:610:93::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 11:26:44 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0382.007; Thu, 3 Sep 2026
 11:26:44 +0000
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
 b=UuawMFK1YXaT7S8LitRKXURhxET9yKyZEG6na+YF+aqFM13NYMLH97l2c2i/kjG0QT4uoONXQPLyDcK/PX03PzZLUVwrrJ8E7QeISowe4MnSWNe2F6Y94jI0VH+QxpqlmHnRzNDua2pi4qrhvtOAq1iR1Qj2iGBYzJqAbasQIEOLnjh6S5xQaLUIlt6V+X2yCxaFNyh4hQO1TFRiYmrZlSMQg81HE3AAvTHhnBRQKHRkKIrniS3s29O29kHFpp2WaP+LUJ5ZrPteioCAvUth2aS0HXsY7HwXUJl3pPlfdWbV8axBBnNOBjC7eVvaFjtefauqqmYu+wnw1PlFfPq8NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hf34BtU4NNagwBS8fBXREcIw1YPqhlc5/2yGbByNCZE=;
 b=Du7UqTxwdE+/CQHcggpAv7g8ts9DFB9RNX+lU5lKcrp5ah1eFgoTyhN3zmNnQHiPbSZQuN42i75m1DydmDDGQSRcj4TZMPLxjUdUPmoRr/ABUp8aB1FpdJHcO7ktpDPjR7zedpwdM94d71hM0OqlrntGnn5t1knIgU/WBLD6U+zOl16NR+1JMCCRibcVnk6FE2uYssMdpAN9TSDpqHQ5lzubklTIKny+5kqW1OvTyGfdUWU7I80I5z3qKDdLJddRXyu8R80lmuU03yT6Z37WCK61ZINZuKsZH9ub2LQGM1YX290oFo36aJdD4RdFw5XsZITe46ithg10DcUAOOpSuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hf34BtU4NNagwBS8fBXREcIw1YPqhlc5/2yGbByNCZE=;
 b=yD2cdWIm/UUv8y2WO14r+fd5+yUy3NEUYMEIw5P3u+6j3GskvUsZXjQvi7wahoibXEKNIELIDDik6LcPKNTmIuxNyMLFabs6bkEI+AiDtnPNgv5Z4q76Dp6MHqkIv+rjOK2i11oTxDM+PqmOnN1qj9t2HMsuOhxJ2ZcQL2s9Cow=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a8b6f26e-2533-43f4-81f7-de3dad85e24e@citrix.com>
Date: Thu, 3 Sep 2026 12:26:40 +0100
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
 <12a277aa-2d67-436a-8afa-3a68ad6f6ae1@citrix.com>
 <a3f0d2f7-b8b0-4367-853c-8d7e3d0948fb@suse.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <a3f0d2f7-b8b0-4367-853c-8d7e3d0948fb@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0174.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::19) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|CH2PR03MB5319:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a3b9dfd-99b5-4330-ef06-08df09ae3bef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	v41YT6+j+EPxGwYstn2rjg++/uri8Vu6y11yl901nPXAd0vqV7cJdawvY7i3VYaodU4Rtlv31uyNBXPTUnfU8J52vjYHELJfKwtX9oVJGceJYHUoa4Y92PHleApm+hx8L+zz0+egFGfMUN8fw3dq2i1HEAFdO3Zpjg2TIpLlS/+CkJio3JkKIK/x020wRQtKf4sADE+HFnqcGEVzw43ls/H3FUJqjSRKnIytV3DtBPkQ9eSdrEPH8j5vQhceen7n9k8Jd3t8XWVzQUp7mVFXEzDchXXdmrMHP2NyrtuPRPOE4SHhCsE0YhlRnjZkDjBeG/w+bLpg8gdyWRORdngmPVqUgmvXqUfi7FOuUsfNNKYZi3kbX6jqsg1bFVZqVeX4JVi9LuxxWBhmbHONIjIiLPca0An3nFJJugS5aJIc+4s0mNUOEG6pJCi5m/3ol2oVTI57Rl4XAKgn7gw1sx09P9EILgwihsigYiwwl1n2BAZFGQsmpeUYLS0U0IKNPv29W06Rv9WagcOiHf8TE9Yiy8P6ACoSWWyN+RnLyLp/N6t+RRvjuWDaSHBwbgYb5KVn4V6jb/yjRRujJkvyPY5J8QjYRDOfD8CcCmfzh7YpY25lzWjfj8lqyZcLqefbiA1tH3X9ww6bmke88139bpmOFkmmbcRnYmt0AqcQt85xoQk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlRsdHZSYk1id1BJY3FTRU9sWExnOU5pdVM5Q2ZYK2xtbEd3dW5mczRMQmRq?=
 =?utf-8?B?OUZnK3hwWGxsRHhXV2Vxdzl6UTBtTjEwenZCbnJhZUJ3NzhNK1cwcGxUQlRY?=
 =?utf-8?B?ZjFGZXlMcjIwOTZPQ3htUmpVUkY1eXpmblREbkYzT0c4Z1RHTnhHcEIxUld4?=
 =?utf-8?B?TktzL0FnNFl0LzQvMHJXOStHdW41NmJPMWJWUVJuUXh2UFB1bGFnamk3NFFR?=
 =?utf-8?B?cjdrZGw0d0VkSFRnSzJJRkNLaXZsRXJsZXlhUEhhLzA2bzE2bTFOSk5qNWdJ?=
 =?utf-8?B?MUZpbWtqcnlpcTBWcWwrZHJHZDZja2Y4Z1RtWjdTbU5acURoYlh5Tlp0TW0y?=
 =?utf-8?B?dktKNFd5a1k1ZTZCbk9oYWJHQmtIaWdGSSsvTGUxU1FPeHZoR2JiVlgzeE9W?=
 =?utf-8?B?b05tMFBsUUxWYmFDditIZEJSUnRMZnNyMmFnYVJuWmd5bzNlVzBGWXBITWt6?=
 =?utf-8?B?NTIvTmpYM1NKRjEyZkdqQVdBbUxxK2QxajBZWFVHMlBYUWdOQUgxYmJjS0dx?=
 =?utf-8?B?SzNlN2E5andSNHY3SE4xSllnSmFKREJPVGZsdkRRcElKN3V1SWw2YUhXUDNk?=
 =?utf-8?B?Z205LytZMUZVRWp2QlkvNWdleUpiem1rWW1xT3lwYzI0RnJqRzlvdi9jdldE?=
 =?utf-8?B?aWFndU1mVEFxcVFnL2R1YXI2MzQ1cE1GcVZYWFdiYlN2WDdJellYV3JlV3NQ?=
 =?utf-8?B?Y3hsMThxWDJ1ZGVVaFp2Q0QveTFqUUsvU3BqQ3g2RWZGcmNvTG9QQjNKN1Jj?=
 =?utf-8?B?Lzg0Z2JKQVQrb0gvVFhCc1BNeHdFNUluK3lMdmozZEF3TlRsNGs0VDY1Skta?=
 =?utf-8?B?cmtyZngxUnJaVFdsMFlsRWZyVTc2S0M3dWhoby9jUEtLN3djMXRGNlZmUVNN?=
 =?utf-8?B?VWsyemxpS3Y4M05BdWFYKy8xV2R3bThHNFVwa2lobFEvWEJTUG5qTGVUTWlw?=
 =?utf-8?B?Mkt2bDZPYTUzVnltQjU0cEZUaFJSMEk2OWFSeFpWN0tNc1oyd0N4VXNOT0lM?=
 =?utf-8?B?ajBRajRFSFVDa0pQTzhVSjRudUpUZHZaekZoK1N4OUV2V3RlYjZRMWFrSVB4?=
 =?utf-8?B?SnArWjBmRllkaG55andvYUZKd3pybi83bmh2UnNmZEVEK2RYcDVFUmYxQjNO?=
 =?utf-8?B?d1lmNnNVaXdaNytPUy9qWjVqb1hwWFdLamlFS29tVW1NQi94cEd2UDFQN09p?=
 =?utf-8?B?Q3FRRnhHcDJLQzBLV3hXNyt6ZVZhNUZudmpFVmRyNWYwUlNDckk0MTZEY1o0?=
 =?utf-8?B?K1VxdnhGQWZyOXJVc2VqdTJmYjgxTFNIRU9FWHJiMFIyUXg1ckxtNzFPS05Z?=
 =?utf-8?B?SzJxaDBpRTFNekZRbjRhTG5uVnFPQlI5VXhxMURvdlFrZkh3dUNoblFMQVF6?=
 =?utf-8?B?WU5Odm8rRzI3UUo3S000bm5xSTJVd2pOTG9YVEJNaktwd0lhZG8yZHROcGR6?=
 =?utf-8?B?aEF3dDZFWDN0ZkVmVGFucmlveTFISXlGUkIwdmxEWUpGYk9ZWS80MEd0VnR5?=
 =?utf-8?B?N3kzQlJWUTRuU0VBdm01Q2VJQTZOd2Nnb3d2L283a3ExR3NGREFnOFo5QjBs?=
 =?utf-8?B?a1kzS2RaKytQVXl2MWpsclNuSjVjSW5LbFNKa1BUNlBaWXRwNlF1QUd5bHdH?=
 =?utf-8?B?QTE3bDNKMy94OEsvWUJUYzhhbFlybXI1WnVtRUNYbXZmTFRtaDY0aWhxbk8z?=
 =?utf-8?B?NkdYaTRzQUIvbkJ4Z293UWQvbFpNQUc1V2F3Y0xkc3pOVWE0MXdrZzdCNXB1?=
 =?utf-8?B?U1V3Szh0a002bXBtVURFMDVoczAvWTdqQ0VyUTMxU2JmaXBYbVZ1SzVxYVFO?=
 =?utf-8?B?Mm0yUHFMVmZXbG9aRHZvRldsdXE0YWlqQmxxR29oc0k5YXVIUU1VK3J2aGVJ?=
 =?utf-8?B?NlVXTFp6aU8zYkxBRzJ3QUp5WnRrZVRJWG5IVURWSUJ4OVVmZ2h3akY4L2xO?=
 =?utf-8?B?dFB5WHgxQmxkTkQyanNScmxCNTBjYlUrL3VuWEROVmlkRHdOWk5qY0oweURz?=
 =?utf-8?B?NFNhd05naVlUR3F3WXRGTWxmUlQ1TkJqOUFhNEZEZi9xUmVUaTlQM3VBbEo1?=
 =?utf-8?B?UlZ0dERWVlBCdzRmYzdDbCt2bkZLaThlaWgvall0TUZqRkZzdXlXanZWY2FO?=
 =?utf-8?B?azJyMFFoQnp2eUdqbG91dzdUYUZPNFlsRlBmbndGWEdvQllCeVgvY0tQZEhB?=
 =?utf-8?B?R2lZa3daRjRzOW1GWWRhWlFGOUlSdVRiUzFnQ2Z4bCtWWlcwZStlcWdXRTlZ?=
 =?utf-8?B?NFZ0bVhwWWRGdnBpQklJalZoNGxTdy9YWGhvVnNiQlFuMTNsVlZvQjhvQXNa?=
 =?utf-8?B?eHRQQk4wc2RmUlVrUFIxWTZIM25zYitEQ0RQcnhBWVNtMVZIM3VCMW5YU2hi?=
 =?utf-8?Q?OXR1Yg+/QC9sSUqM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a3b9dfd-99b5-4330-ef06-08df09ae3bef
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 11:26:44.6061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m72wzUpOc5+XG9zKPesFAczAZuxGGE4wzyPdCvv6E9Q/oqH7XIKyRhUoj7dEviLCSui4xCGcjA1pwN/r9DnrV2RRimmFvKYc41Sz7PSLhzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5319
X-purgate-ID: tlsNG-c1860d/1788434809-CCF4F87B-AA960376/0/0
X-purgate-type: clean
X-purgate-size: 1401

On 9/3/26 12:14 PM, Jan Beulich wrote:
> On 03.09.2026 12:55, Ross Lagerwall wrote:
>> On 9/3/26 11:44 AM, Jan Beulich wrote:
>>> On 28.08.2026 15:11, Ross Lagerwall wrote:
>>>> The Viridian spec requires the vector to be >= 0x10 when writing to the
>>>> SINTx MSR, otherwise it should #GP fault.
>>>> The spec-defined initial value is 0x0000000000010000, i.e. the vector is
>>>> 0. On startup, for some reason Windows 11 Hyper-V tries to set the MSR to
>>>> the spec-defined initial value and since the vector is 0, it GP faults.
>>>> To workaround this, treat the write as a no-op if the value is
>>>> unchanged.
>>>>
>>>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>>>
>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> I expect that despite the (valid) absence of a Fixes: tag this will want
>>> backporting.
>>
>> It should be fine to backport, though in general I think backporting nested
>> virt fixes at this point is not needed as there will be too many changes to go
>> into the stable releases for it to reach a usable state.
> 
> How is this nested-virt related? It looks to affect Win11 when run on bare-
> metal Xen?

The regular Windows 11 kernel doesn't have this behaviour on startup, only the
Windows 11 Hyper-V kernel (and possibly other Windows versions too) so you
wouldn't encounter this behaviour unless using nested-virt.

Ross

