Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35389606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 18:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=Ixkc0VvN
Received: from list by lists.xenproject.org with outflank-mailman.1493038.1693212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTNv7-0000qd-8l; Tue, 17 Nov 2026 18:28:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493038.1693212; Tue, 17 Nov 2026 18:28:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTNv7-0000qW-5X; Tue, 17 Nov 2026 18:28:41 +0000
Received: by outflank-mailman (input) for mailman id 1493038;
 Tue, 17 Nov 2026 18:28:40 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTNv6-0000qQ-DV
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 18:28:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTNv5-000rdT-Md
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 19:28:39 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6afc9cca-2eae-0a2a0a5409dd-0a2a4507ebcc-14
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 19:28:39 +0100
Received: from [40.93.194.45]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6afc9cd6-b4ea-0a2a45070019-285dc22d935c-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 19:28:39 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH0PR03MB6145.namprd03.prod.outlook.com (2603:10b6:610:d0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 18:28:35 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 18:28:35 +0000
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
 b=NdDm8SoykLPNNqKAU7ac/OGkzrLcYKDgCMA/t25eGwJg1As7pYtMm0Ki5kvNCVMjaSC898qLXERmDaYEok+4T6ZmRXXtRYauxwvHlmn6QiBRP15qKa2t+ZXHySr2aly2t2emxR/6ekcfI9fzTnUtCE8t8IO76VBLGYzfKIF9pkbYZgPOwI0VkxUGxZkn25htl8tTiQBMZHzFVAqJ+3bRiSQqBFDKfnUE4pN19PAqr5GiILAzjKQXxstlTFii0HuXS2fu3/EHbYOLvSxxLH+KuZechPr8kj6MRKFVI+Ou7Uq/xbgdkgY1rBc/WEfYYznAx+sVpujXr9dT+TJdrpviYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VOcpwTQLb0CZAJkIfsEZF0oVMhmgYaXTLzqixrdXuus=;
 b=C7e5r5AWaWf2HOt4pPYRy7Is7fEyacXliQrmB2qX1ImkvfAvakTySoOodZF8xF+34F4RMxfapJO3xr3HCdA9ATwiXp4LUyL5TuTXU7SjDVeZ/nYUqYz/ry+f1I6ix8ejyqc5R6e69eFiyf9Opsf0wahvK6+BGWrvbOlsWO9hhV7ALgTL+l7KsEyuLChhSaePe0fSeVQkGbHRVZTHE5jhAToNuF704bozxlMf5+zRMyEysSo6mVlW+l1frD+TySKaV0WBn0kwAcIJe0hiA2dIZPwfxBLjuKdvxwDsGNIQoq2Jw6JeiVCKySEvCEkGlj+YbhkSWDydSboXXNoSgVhdjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VOcpwTQLb0CZAJkIfsEZF0oVMhmgYaXTLzqixrdXuus=;
 b=Ixkc0VvNP3BpeSDNjazmprLDqZDXb7ZyoVpEA8+5MVqwnfYq4Mlynxea4qpP/8wfjF5tUXEbjEsiJaqayqjca/fYJCgkui140qGEGLirlVBjRsON1TRm0oemev+KWu1VGxo0mfW7n4WtL2QjuVdenLobE/Xee4BlxKpnXS78zQs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4e7a7175-1f27-4d99-9c79-6723e1903742@citrix.com>
Date: Tue, 17 Nov 2026 18:28:31 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 0/3] xen/treewide: Remove NDEBUG
To: Jan Beulich <jbeulich@suse.com>
References: <20261117115549.3872611-1-andrew.cooper3@citrix.com>
 <a3f79064-9030-4efd-9829-a408b73c81c9@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <a3f79064-9030-4efd-9829-a408b73c81c9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0638.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH0PR03MB6145:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c396632-a4a1-487f-4384-08df44d89757
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|18002099003|22082099003|261026121527099003|261022075727099003|56012099006|4143699003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	m/DNpshnfGg6A4lCEthh1+9o3FM08ZuT+VwyH5AM3CudNOctB72lvSbUI2LrvXOfmxCca4NHvHeDmBJkVrD33URHWACbu36+qeIOeO/YPovRZ/dkOhyIQqKLR1It98OjAqRcLyY07AEVRygDeWuj+CsEQn0kCRWmfVWGKnXMmpMsQC0SdPLSOXSPCxooqswI0ZyuZUFoOgP0CH9twchAaJ3exQZhm8Rwhj8rkGxKaQfP7rbJDVw4OiPu+CAbG3OS/DWTzshAeIG1B97PEfHU2+bhKX728jN4Az1/O6VTs1w7B1Lrg4nZeXWe4+rGkJ9rz6UmlgKsLtpfc95bmajpaPSlCJhM16f8USit/DnHxi40bQJb+GLHyBDTtIcrNx7UK7SbzqyClCfX3bDBw5c7raDvip6D0jF3Z7/yQuMRGyo0KyUKbNCOslSkc0CUgtBn7V6Tc2BozzoSz9mTqzNgVWJlk1VzhmUUKQhcaULK6LMCfWHfvbMJy+X+nUk0kDajZfiap/0Sz8VQltSQopWF0yCkdyug23ZK79z+/yXTXF4bWLoSq5YGwhURml8htOgs7VUZwrdPyRGRXyPRjoHMEXlRMYnt+3oh6/kru3QMSKJzOdmisxu7SCoQHSsqA292SqAwkfJ2+KWMSHZs/n9uMOYnSHJfRrLAUX3FuL7LvYA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(18002099003)(22082099003)(261026121527099003)(261022075727099003)(56012099006)(4143699003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1pnZHFQSHBSajRnYy9yTkdtWFF5Y2VRaW0wazlUN25DWUdNL2VCeGNNTito?=
 =?utf-8?B?SjN5MTZ2NGJZcURKYjAxbW1jVkpuMzRtZ290NUFzU0lvVXNLaVZwRWVxWFlm?=
 =?utf-8?B?YVZQUWRHb1NBQUliVjZBQWt5aG5QYkhLVlJvKzZrME1OSnZxWU1iVElwREFF?=
 =?utf-8?B?a0dKckZmV2NyTmZtLysxYkVUVDZ0VGMxckVCS3BPQWJuR3NUQldyZGlVSHU3?=
 =?utf-8?B?Z21adEJkZGI5NXZ3R3lFYURiUkkrK0NxS00xMjNaNVBzbHFEbnkyRFhYNm43?=
 =?utf-8?B?S3piSVdxZUdldnJEaWd5KytTemhjeDRvc2xGWDBpdndRc0tuRHc2RENEcHEx?=
 =?utf-8?B?T1JId3g4Q1VVUUNUZytaSDFVVS9ZaEo2ZzljUXpkL0xCQjB5endFaGhsTzdU?=
 =?utf-8?B?dHU4aE0rYWFXU3lEVlg1V0ZDcHdvYkpUS2I2UnhValBkd1BKdFptNk1TeWov?=
 =?utf-8?B?S0ZMZ0FwaTFNdHNpNlk1RmgwQnIwa1ZFMUx4TUNXNEFzcWd2QWJISDFpMzA4?=
 =?utf-8?B?UWNsd3NKRWd3QTFUdi8waytZVS9zcG81YmRqL0dGSlJjSy9IMis0RzFxZFg1?=
 =?utf-8?B?MVhKWDM1MVVMQ0VSb1NWbitwdng3VDJlSXlVWmRDeWtGUGdYWCs2VWhxZjNJ?=
 =?utf-8?B?UEpHOXJGdU5SM1gydS9hbUh6NXo2bnE4TDR0bTdQc0FwSElzakpRYVNwdE1X?=
 =?utf-8?B?TVR5MEcwWVRjSTJhbExsN1RPODRRZlUvVnNKQ0Z2SkRlVTBrLy82aVJuTEJ4?=
 =?utf-8?B?WDhQMjV1RVczU0hrelJVTEl4NjdTUTB2Vnp4dXBua2hPWmlMUWs1T2RrNTdV?=
 =?utf-8?B?Z3N2cVdYWWU0ZXdSUkhSUzdGMU9CQU5zS2puWnBnbDZ0cUs0a3JhcFZ4UnJ5?=
 =?utf-8?B?bDREWlEza0RSOUN5c3ZpekYwWGdDMm9kTDcrRHN1bFFZeEhHUTJEemxjcy9O?=
 =?utf-8?B?ajcwazBudS9NQVcrY1h6Ni9KVS9rSXpjUWMyb0FnalREc29VZS8rSmVGb1c3?=
 =?utf-8?B?NTViNTBxUDhndHB2U3NuMjlLaldndkVvWlAvTEM3UGdrZWtwQ3Z6ZTc5KzMy?=
 =?utf-8?B?Zm5zQUVwMDA1K1loc2dkYS9wM1pTL2plSkZjYjNXU2EyOWQwd2Y3ZG1DQmtY?=
 =?utf-8?B?bUhTVTNpbmJ6M0p6VTdoMVVIVE1jeGRyZko2ZHRWRHhqU2NjQTBBeXR5RVdS?=
 =?utf-8?B?MzdweW1ialAweUkwU05RbWxiMG1IdjRiRTRiWUZ5SHBoNHhXT0dKTGZ1NGJC?=
 =?utf-8?B?MXk3RjdXRW5ZQlBRbGh2aWVuNjJqaTVacFBqZ1RTTldhRHhzR1Q0cjVHenVv?=
 =?utf-8?B?bVh1c1g3SmRjOGdFWnA4QXc4NkFGNDArcDZ0Skl6QWdwalE1N2VMSWhTTVlM?=
 =?utf-8?B?NHpmL0dWaFdsSjczNStlZ3VjVnJzaGpFTlNPOVpKNGRJTjd2ek42WDNjQ2wx?=
 =?utf-8?B?YVphaThEdjFvV3pVdFFIKzNrNmg0c25LbXJYcXdISUtjQi8vOXZrSGNIS29H?=
 =?utf-8?B?ZFg3NnBaWUVhdTh2dGNJeXdNb1NYenk4elBRT2ova3YrMWM3dTlNamRTdkFw?=
 =?utf-8?B?elMxT0VLNGovM21sajZwYkwvRWM4T3FBTFA2VzV6YlJhMWhhMUV0bGRuSm1a?=
 =?utf-8?B?WlZRZU5mUC9LWW91OW5kSDZCdkdJbVJab0xTUWdoQlloRWhoZlpzYUczUDdi?=
 =?utf-8?B?RHMxcVlGSVBpUElNMy9IRmM4Nmg2K3VON1loTE0yaHREM3FrU3d6ZytKcGg0?=
 =?utf-8?B?eWFtYkV0cFZveXdZQkJWVHY2d1EzSElSM3hqVkppVjJsdVZyN08vNi9PSDZu?=
 =?utf-8?B?cDV4NWZtekdqclpadkNUY2MxcGVJaHFKU3Z6eHpua1ZyeUZoeGhzOHkybFV5?=
 =?utf-8?B?SHBJYUxLL1AvUHV3eC95bkxYZFhISHJaUkJSMlhOeG5jNk1hSXlWbnFvWHZC?=
 =?utf-8?B?dERzN3JSQkF0S2V4Y2RRQnczNHY5Zmw2YWpyUmxlbmZ5VTFRclhoTEdZZm13?=
 =?utf-8?B?dElqY1BJNFBNbHRZTXQrb3dwUVdpUmJwUlhzeHByZ3FzQXg1R3dGNDR6YUJk?=
 =?utf-8?B?blBqWXVxSGV1WlRUTjBLMVhKZTJ5bTROaHpBYWF5SGFIU1dEL1AzUG5jL3FG?=
 =?utf-8?B?SEthZ3lFeFc5c0ZnRzBrZjlCWE5DdlhLUlZtSU92bjJVdkNpcXNvZmZSUkhl?=
 =?utf-8?B?R1Rwa3FEV05oVTd2TlBlVVZlM0E0SVExQzNMN0kvWjVJbjQ5dDlkQ1ZDZi9V?=
 =?utf-8?B?TFdxaHlWNkQ0REYzaW5RTllTb3RZWW1yRFJpZ2hRaGhGek0xMDBwMkkycUhj?=
 =?utf-8?B?V1VtaWZaV1hFSlI4TWNVZlZ2TlJjVlI2eHpjRlZmSzJ0Q2Y1b2tnUmp4eDJm?=
 =?utf-8?Q?+ePb0RhR5EA5vlPY=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c396632-a4a1-487f-4384-08df44d89757
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 18:28:35.4410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mulekbLNJeGBkFQyY6GKMKZtuhwsKpkINuCsJGBMTlizER68u6HFE5TYpMkb7LkhkVHRhAwt3uCnDwCwS0l8js/OyqRiAMSDh42e3nvagHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6145
X-purgate-ID: tlsNG-ef75cf/1794940119-A66DAAE4-7F3A88E5/10/78276251493
X-purgate-type: spam
X-purgate-size: 1069
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 17/11/2026 12:43 pm, Jan Beulich wrote:
> On 17.11.2026 12:55, Andrew Cooper wrote:
>> We have two ways of spelling debug build in Xen.  Reduce this down to just one
>> way.
>>
>> Andrew Cooper (3):
>>   xen/treewide: Convert all #ifndef NDEBUG to CONFIG_DEBUG
>>   xen/treewide: Convert all #ifdef NDEBUG to CONFIG_DEBUG
>>   xen/config: Drop NDEBUG
> While the ASSERT() related distinction was helpful imo, I don't mind the
> folding:
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

I'm open to the idea of having CONFIG_ASSERTS separate from
CONFIG_DEBUG, but if we're going to do that, it should be a separate change.

The problem is a) having two different ways of identifying general
debug-ness, and b) them having different polarities.

>
> I wonder whether in x86_emulate/ keeping constructs like
>
> #if defined(__XEN__) && defined(CONFIG_DEBUG)
>
> is actually necessary: CONFIG_DEBUG shouldn't be defined in the test or
> fuzzing harnesses.

In this case I think the __XEN__ is helpful context when reading.

~Andrew

