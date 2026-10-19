Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191ACCCF2E8
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 14:26:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1454479.1668076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIoIw-00044N-5O; Mon, 19 Oct 2026 14:25:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454479.1668076; Mon, 19 Oct 2026 14:25:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIoIw-00044G-24; Mon, 19 Oct 2026 14:25:34 +0000
Received: by outflank-mailman (input) for mailman id 1454479;
 Mon, 19 Oct 2026 14:25:33 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1xIoIv-00044A-Aq
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 14:25:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xIoIu-00Efeo-9L
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 16:25:32 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ad62852-2eae-0a2a0a5409dd-0a2a450cd626-36
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 16:25:32 +0200
Received: from [52.101.84.80]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ad6285b-f479-0a2a450c0019-346554506b53-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 16:25:32 +0200
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 (2603:10a6:20b:410::12) by AS4PR03MB8626.eurprd03.prod.outlook.com
 (2603:10a6:20b:589::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 14:25:26 +0000
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50]) by AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 14:25:26 +0000
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
 b=F/iKkcrANFmAGMP1Q8OdJ8egMam9x/SyHmh0rkR7TJ+CCmFaZvmr6I6ag2d8RNkhMnzkDmb/r5lFgGId7SMinjsL6ZPRW0iRNdkJhCTdQpE8VyXF36ocY7aDsebN0A8YW66pn+bmoouR6doKLrOf2qAxIF4+h8UkmePbtyz/VaqAFwurK9smqW375nIQhYqA24vAVClBvLwl/E4+Byt0ZcUreHJlvbC+euZaokXCp+MAJijz/heNmGiplL2EIMfzUFcQULQvhJXK0IUApyaM/fXrGhCDVjCKoO/XCXdwLIcP+UiWfUiY+opEIBV/bMcHUBKCzyKE+kxJHqre9cNOhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7UGNIoeTDw6IJbM4PFWZhyPIM+ZOv4SYdoDQnE3EWr4=;
 b=fnagya6yoQkBWWgsILnrryMkB9zcWexrfyjYjoNrCo3a5amWCGOoFgf5zH+CkSRCktaSIlIZzJ2Rx5UbJ+XcVoLmKh6jsQAD7lix/zmkGbFCt5nJQm4rXLyENqEG/yAjfchKgH4ETSF66tbprw/S3guknVmaVp8V/t5SMd0v9CQVSFQ6TP1ZC6M2dg9TSIUtkkOkjjmW17jXBHeKiLgxiurDmKpaG5DHLYNZlUen/F44uwCNsGV34KJz4VOCWK0T3q+o42vdRogv6ySGEz1H9LAvq/fRo/0x40E0XSpjVlgBOVYpLbjmvsWpZjlh7JDr/Lf3pRebrEQwkUiSOOydnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7UGNIoeTDw6IJbM4PFWZhyPIM+ZOv4SYdoDQnE3EWr4=;
 b=omd/rmYUnPuZM+NEOqg6NEFsqRlKQ/LeleCjF3idE1/edjxOKtAjEqTmPZCj2b7JweQ7JubPbW1otyZeh2flD/RWmBY5R4DOrGV55Zm4K6iVRjblambmLpQc0esXqXhbmLNWWklrPXJuAtdMX2M5OoiUk+dGqElG1Ii63t5hY1iHI1D9Qw86SAKVFoZka3uQXxwC2suB2kVMcsMCChnHLDTaUw+jXZC+tY7vzJk4KDkHzO5g02dPvxBbnUwH1D85tocrGEzP8n4gq3LFQgIk5jGE1ZrDRg9mk5F+bSCI1uaJS27tT+QEIwgmKVJZy2BVE8Yg5PUe0DC9mIVhXHtRhw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <40b59aac-6bc3-4abd-aa51-7a6822ec8069@epam.com>
Date: Mon, 19 Oct 2026 17:25:25 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] misra: add Rule 5.5 deviations for macro clashes
To: Jan Beulich <jbeulich@suse.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1790661461.git.dmytro_prokopchuk1@epam.com>
 <79de1bea-7e1a-4d15-b7d2-8390ab5bdef2@suse.com>
Content-Language: en-US
From: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
In-Reply-To: <79de1bea-7e1a-4d15-b7d2-8390ab5bdef2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4PR09CA0016.eurprd09.prod.outlook.com
 (2603:10a6:20b:5d4::8) To AM9SPR01MB0028.eurprd03.prod.outlook.com
 (2603:10a6:20b:410::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9SPR01MB0028:EE_|AS4PR03MB8626:EE_
X-MS-Office365-Filtering-Correlation-Id: 68f77cdc-fd45-4663-1e74-08df2decd1cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|56012099006|4143699003|11063799006|18002099003|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	bwVydrDwdKGzqDoJ8XmfbH7QdO7G0y9tYFddn2IlR7DGYV1O8bQD85GKdn8bpad4hE3df1Ci1b5TfIS0zsD4mSvryRnKjulGDty0CCteI90f9TH6D/enu7/lmhWEB3ctMNdHFavAzZqTHPCWBkBPvW5Te0QWqMrFIN09qI9/ih6Pe9V51U3XHWL6YTXeaHoCNLPsxyIMaU7AxXs+9Wn5Nkw9r154SeZF5YG1K8ieTg6c4Uk+ESdfxQzGmeyffhkFsKneXjWgq1LWvIU9E8L6dpmI1QTEXqHD+hJrtA8NWtvspe+DTTMvoe/WYeIzZ418P3B7nFOcI8kW17Rlmlf9hPuSYacthKzIycAZBRFXMt+fBhlt0pNr1O9q2e2M7q2k6ePKWLUM8X6z9Xzsi0Mqhx2sInRDNRS4cF28e/9qrzdL/tj8/3NsHztESgJSKhVaVoqFH0qwAycYci1U+kLhcKl/O5oUiuPuNEOKm2RTBgrsWTd3thhdxNnwiSol5cPrHyBPc9Jf7Xd/+VzC9lDmYNK6Ak29YdjWpYMHHOQkih/uTcedcGCzQ4yHJko/Cbgq1jWN5we+toFAgaNbiFb87yHXRo3vk0HuRiurX4hgcDDgpgX8OlFLjb8Vyh3f1u/R7AzysF5w3SNk9joyMUMqr+mXvO13pj1BCY27t8mluhw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9SPR01MB0028.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(56012099006)(4143699003)(11063799006)(18002099003)(10067099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nkh4NUJGYTNjVVMwSitOQmc1TU1YME5oVGM1cG5DUmhoQWovbCs3OHpXSnVx?=
 =?utf-8?B?TDJ6T3RpTU5qa2JmaUc5c3prdkplakhhODBHWkxjOVM3L2xUdFhQUk9UdVZY?=
 =?utf-8?B?NEJkdVg3RGJsbzBSU3RGdmw0cER4U2pkazFGUFRMdlNHMk01VXZBK2I5Q0RF?=
 =?utf-8?B?aDlOYkpFdXJNUzZOWlNkbW9QTE9PZVNPeTlTaFhMWGthY2RqZGVBdmNmVVVu?=
 =?utf-8?B?QWN6MWRIbW9yVVVtd2lxQVFaZjlTSHhlTWNyU0hZbUxVMy9MaGdGUE1oSXI4?=
 =?utf-8?B?ZnNsUzlSNFhHZU5hQmE3OGtBMWRWTVpMejZUQXlaeXdmVWtmZWdUOFdBMW9H?=
 =?utf-8?B?OHpjbXRtS1BCYjVaMCtCMlBQYzFpeWJDRlRKMTloT1hYSmNjS2oyRFBWWVIx?=
 =?utf-8?B?Ukx1a3J5ajJCcFZiMzF6a0JxRU54RU5ZWU42UU9DU21YUnlCekNFeW9TWFVt?=
 =?utf-8?B?Y0puZ3Rsb3QzTmNPTjd3Tk1YTVFodE9DMWtoY0xhcjluN3VONnBOS0d5K2k3?=
 =?utf-8?B?NGw1Zzk0V05lQStJQzJrK3NjdlpqWFRpMXRTM0JQYXB1Y1VHSGVTY2VMdHkx?=
 =?utf-8?B?QWUwTGEvb3NrUSt0U2RtTGx0aC9KKzJDRDNwZ0RueUNGOWt4Zk5Uem1WTDhR?=
 =?utf-8?B?Tk5Cbm1xakMwWndLWnBpUXFPTHpDdm8wSkgrNmUvelpidTlTak1hQThzS3hV?=
 =?utf-8?B?ZUkrRk5mNmNPbkx6VHRXeGdyN085Smoxb0liclBIVmlmelVwZW5meGRjSkdR?=
 =?utf-8?B?VnlEVzYraU5WR1pnNERvUUhQa0lPRmJxUkxQZzN6bmQ2TFNPbHFVb2pScHM2?=
 =?utf-8?B?YTI4VklJblpiR3d3ZkRaOFdieHdPamo5aVNqS0hZZDJTNVpuczNlQ1pDZC9P?=
 =?utf-8?B?eFIzSzhBUFdKdmdqQ1lhYzdiRndCcGJjZHJQT1hVUDNpeWZWTnRKeEsxZTdV?=
 =?utf-8?B?YVpSK01ia0Q3c1hTQi8xZWVuSjAxVlZ3YTRjMjFsR1FtN3dYMThVNEs0VlVz?=
 =?utf-8?B?WjBDdnVpRzlsZmRpTTJNRHFkQmtiZ1VIeXhYOXUwVkV2Lzl4UEQ1UVhENk1k?=
 =?utf-8?B?NEp6eHJmZ2V4QkI5Ni9pSExZMXdyajlNSU9HVkx3eEZUUityRVg2UFhOOCt3?=
 =?utf-8?B?MHE3QmVFdE9KaFBiS2JuVTJ6Q0xseWc0MDRKVHZVbE5BcHc4ejAyWE85ajVp?=
 =?utf-8?B?TDZlVjg1eEU2TXhOdXBQcDVwS0xQN1A5MmpId0Z5eGliaDM3SkxIZklJRGJK?=
 =?utf-8?B?NkVJd3hFYW15VGE1eXdXaVpJZlBpdlhIb25kSXEyRnBYTDJNamVKbk14L3lk?=
 =?utf-8?B?Qk1YbnBCV1FrSmJIbGI4dUZ0eFJwOU5oOVF4cXNJS24yTWVyd0lkMUVCeXZD?=
 =?utf-8?B?M1gyZFhhODNka29sRjNOZlpKSVVaWVhLUmd4cGFtbVJsWjg4d0VLckFXYnFT?=
 =?utf-8?B?d29FOWNXTC9VSnB4alN3NzJwcmllOVhBN3Y4NDNSUGxVUDMyMG92WVlkTURm?=
 =?utf-8?B?R29HeEdLWEtuQXE4QkRaZTcxOGtGSHRlbEF1N3B2OFNnVGdiYndvZU85a0lT?=
 =?utf-8?B?YWViSE9ydWw2TXBaYkx2SFhOczYwcjZTNUZiV3FBUDl6TG40SVhHOXVEbk8r?=
 =?utf-8?B?cDZKR2c2dGlLV0NRMGt3SWhBQXY3SzJQWFVGdFNJbzFYRjlndGdFUGh1N1lC?=
 =?utf-8?B?MDFBc0tzeHlLVHpBbUVrNHlQOWpRc0VhL3F1bG5ibjFZS0lBUXpjYU1KYjlG?=
 =?utf-8?B?ZHAvNkg1ZThsQitMTzlxaDc0ZUVGVDIzTHlaVG9PNE1tenVwR05UaGcrY0U5?=
 =?utf-8?B?NjNGN1hFTmF0Tm13U2ZRMzNrd0J5UTBBbUZ0dTNKZEVZRWdIYzZyM3MzMXI5?=
 =?utf-8?B?eE5TY2J1aU10SlZhOUdhS3lBRC9abytjbTNUY1dtYWI4RHFjQmw3VjJJTFQ0?=
 =?utf-8?B?VjZmR3B3Ykh0TU04a3VoSlVHUlFQdHNoUE8wQWJaSkQrNXBJR0NlV3ZZeU1J?=
 =?utf-8?B?bFF3cWUvOWlHaWtqdHl0RnV3eTQyR0JxczNVeHZkLytoUVVEeTQxYVRKcE9G?=
 =?utf-8?B?Wm1zQVcyTGNyZkJyS21KVlFPa3RRd1lEU0xBc1NtVjNicmVxRFJmOG1JSExL?=
 =?utf-8?B?Q1Q5MktlMjlFSHJza3J1amtLTDc4QUdISjlab2N2T1BjNjJ4dzQ5SktNUTFD?=
 =?utf-8?B?aTcxV1N6YjQraVM1TWxNa2ZXNWkyWWpwSllJZW5jb2c5dkhOZERxOFpKNmlT?=
 =?utf-8?B?bzNEdVN1SWo4MVQwVjYxOTc0MU9tK0Rnc2pISnBRcm9BYktzWHFWUUNyY1lR?=
 =?utf-8?B?cTZKQUZmSitsZlZTYTFuaVpDZFlGL0hwUk9qY0VzTjJEMDNhaFFrdlAwZnNj?=
 =?utf-8?Q?YAcNBqS/4JApTuaU=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68f77cdc-fd45-4663-1e74-08df2decd1cf
X-MS-Exchange-CrossTenant-AuthSource: AM9SPR01MB0028.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 14:25:26.6757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UYKzU3OpNM4iOryFWmfDuWwArbZGz4Qn5GRCuAZPks2LJn1SIwKZMNzGN6HaFmOaC/g9gf6H2ePj4inY7XtTtXOg+p7rYIn5zfsIRNy40n8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8626
X-purgate-ID: tlsNG-d25034/1792419932-51339A5B-7AB067B5/0/0
X-purgate-type: clean
X-purgate-size: 963

Hi Jan,

On 9/29/26 09:52, Jan Beulich wrote:
> On 29.09.2026 08:21, Dmytro Prokopchuk1 wrote:
>> This series adds deviations for function/macro name clashes where
>> the macro is used as a wrapper around an existing function name.
>>
>> With these three patches all ARM Rules 5.5 became clean.
>>
>> Changes in v3:
>> - update wording with specifying file (constrains)
>> - add Jan's ack for the first patch in the list
> 
> I.e. you took my reply to Bastian's comment as sufficient to address his
> concern?
> 
> Jan

Not entirely. I took your explanation as the rationale, but v3 doesn't 
record it in the deviation text.

The patch is already committed, so v3 didn't record the rationale you 
gave for sharing the name. I can send a follow-up patch that adds it to 
the deviation text and rules.rst: the macro deliberately shares the 
function's name so that accidental use of the size-based function is 
less likely.

BR, Dmytro.

