Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D087606A320
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 05:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=gZjbgI45
Received: from list by lists.xenproject.org with outflank-mailman.1483046.1686609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR1Fi-0000bp-3D; Wed, 11 Nov 2026 05:52:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483046.1686609; Wed, 11 Nov 2026 05:52:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR1Fh-0000bh-VM; Wed, 11 Nov 2026 05:52:09 +0000
Received: by outflank-mailman (input) for mailman id 1483046;
 Wed, 11 Nov 2026 05:52:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Zhao.Jiaqing@amd.com>) id 1xR1Fg-0000bb-5g
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 05:52:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR1Fe-00DGe9-I4
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 06:52:06 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6af4024f-e002-0a2a0a5209dd-0a2a4502b398-32
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 06:52:05 +0100
Received: from [40.93.198.13]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6af40282-6ca4-0a2a45020019-285dc60dabfa-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 06:52:05 +0100
Received: from FT1PR12MB249006.namprd12.prod.outlook.com
 (2603:10b6:170:34::19) by SA0PR12MB7002.namprd12.prod.outlook.com
 (2603:10b6:806:2c0::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 05:51:59 +0000
Received: from FT1PR12MB249006.namprd12.prod.outlook.com
 ([fe80::d278:a9b8:f37f:6342]) by FT1PR12MB249006.namprd12.prod.outlook.com
 ([fe80::d278:a9b8:f37f:6342%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 05:51:59 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m86nZ8Ph0PDCFDTJTlOz195LFjMSZ4NqNiBLdW5yPMtg5CcSLx1E6dhoCwydUYLnS51N9onRT23UWqFlED1FzEm+9cSVbpKUVeMQikmzJ2j14CWl7F0nfuP4octRSkAzkotm/NMCDlfMGidXyFvSGN56fVFk/HC2+A8Fm1YssI71s5h/Le7lWGAOdVDYB1X5VzIF1AvjeSTXUI0ZCzGaqDtXK3fjxpkzwK7kgkzyIBo//xd+sVD4TojF+ysX6Vb8ASHeO+cyefb7MZ3mDKTSSZqnKdjwjfdUZKRh5I40NI6q8/XaKZjhB0/81xMmUKit2P4oeBMUyPOVZSFL/K6viw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d83tCLT6ksUjT7bgelpDP2wmClPUG0KK4z1p3tA4E6s=;
 b=uAOaluxHZNCHgYFx+W/xX1Ti30qS/Y99C3g7dEYFmmNzPk7oVrh12ESC+ZU6neJ1KQtWb1eCNQm84Ed8n8utx97l/cHYNlP9CBHqcaLKIs3w0f0OVotYizXPEK1W99xwMTT32owWmhT7nV9JK+nokMQl6HEY6j5LjgzFrU1g0o/D7T8dIjAAjfeY5OoqvvLXbdaeYKJYxE/utTiHtj86PySlneYamILMaFxYQLu1TymdG6WC1DWQVjdIlnqJfd9JLEOkaZcuTOw9MPD+gpiJGvRzAkTIoBOV+hV/unASOIuq6pjIQPk+p9KhSSLLWAIBMpSu0fG9Gm57wcxcIroxPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d83tCLT6ksUjT7bgelpDP2wmClPUG0KK4z1p3tA4E6s=;
 b=gZjbgI45klm1CZ38M5XKHqz7n1iSnnyue41UHwcGvR9T18XFMTtmPONtkTpjXK/iarS53Zu7b1bohnLnnl8cAI3RC4SYIK/1/LhE6ZFDRL2j00HcAUQcZ286cY8/nVudMS2Kk2HUGxB7b88dGqdTac3UK2bDhDDHxEsZasPonUM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <81087fde-407a-4f3a-8a7f-e2a96945d175@amd.com>
Date: Wed, 11 Nov 2026 13:51:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] libxl: wait for QEMU exit before restarting a domain
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Penny Zheng <penny.zheng@amd.com>, xen-devel@lists.xenproject.org
References: <20261110100258.490701-1-Zhao.Jiaqing@amd.com>
 <d2ef64c7-0587-4fb1-b119-bbd11b987c3a@suse.com>
Content-Language: en-US
From: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
In-Reply-To: <d2ef64c7-0587-4fb1-b119-bbd11b987c3a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TP0P295CA0020.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::10) To FT1PR12MB249006.namprd12.prod.outlook.com
 (2603:10b6:170:34::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FT1PR12MB249006:EE_|SA0PR12MB7002:EE_
X-MS-Office365-Filtering-Correlation-Id: bf66f73b-cb9e-40b9-efff-08df3fb7e6b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|261026140227099003|261022075727099003|261026121527099003|261028144727099003|261009223027099003|261021123027099003|261021121427099003|261022105027099003|10067099003|261102123227099003|11063799006|4143699003|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ewcaj66hecN4ycIW6CJKtCPr0ZcImEV03xGBw+fuKJNGZkrr0mmljfGpEVx79vMMjwlWJPix3up5nu80O1Isrp8mshmwBEw+HZI58aJeSXIKa9WA4eUQlmUYNfh5VoCLr7DeDEXORm7Vsup/TcO7xBsq6WwKuV249UhKTrnZVT8JQhMQeNsxowUvPYq0Du0jRncIOrmmxav+/3c2O/9GRzXSXmugeT1z1TLLX1qihzoN96pqdkwSgePV38e5CuYYSfNPELPaDJoWvcQPSLSGCaQkiJEPw7lDsTghYQnInnf3kq7V4clD9XHGZjHhra77W4PFTuT7gdxqdMwEKyr3lSuXUV91Fk1XhjzfgkBTuu1OU9ldMrBrtbNeLKrtFQFouZetgwJjl0PRLUDChH8uocTl6yoj5QXez5ptzKRISUotTvpuUjm4ELTg1r2FRfrYXynIUrBg/xsryjW45bzhQ8ycvOGNeMuR386Sr5rBZm/6FWbZx65j8w6Pd0aWIBnrTQ4z2VAVRXtDFH3gKonAwqR43/kv9a5sGnpLWJCpkyFXoGY1kFb6FaTFmoWTIyP21f6On1T9Urtax5UASlShfLgjoNxjl3I2qttpeavFzr5ZuAvFcG2kenC6vYgFBbiaCc3Y3tsaTxzNs9vd8TbDp9e87zjFnYXbJItjSruLmz4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FT1PR12MB249006.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(261026140227099003)(261022075727099003)(261026121527099003)(261028144727099003)(261009223027099003)(261021123027099003)(261021121427099003)(261022105027099003)(10067099003)(261102123227099003)(11063799006)(4143699003)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UldCeTQrL21zekh4NmRnYVE2eExFYmJkbDhkV01CdW5ONnVUTUc3WGVxaWxJ?=
 =?utf-8?B?a2lFNE5URzUrck5zOTBJNm9aeHN2amF0Ym5IVENlTmh2UGhrTkFSRWljZGNH?=
 =?utf-8?B?REpwR0JJbWxyTG0wd0FLb21mbng1RjhKc1NlS0VkOXZlb1FBazZyRlBQRDdw?=
 =?utf-8?B?Q3MwSFlCZWozTHZLSlFEd3dYUEVnMTUzT21UNVJwWVB2dzMycCtIZjh1Z21n?=
 =?utf-8?B?S0VoSXJ6VFJUaVJqVVVjcmdkWmI0LzdYUDlWakdiYkhLWTh2aE90cUxya0t5?=
 =?utf-8?B?eitrL3NhMXN6VnVKV2xjeU0yeU5VWUZkeUJvS3lteHpKTUowRmJ1dlZXL0Vl?=
 =?utf-8?B?QzZlUWtqL1BUSzByaC92UzBkckpJelQrOThvWXY0WVhhV05KYVNHMFFMZk1h?=
 =?utf-8?B?Z1JOeDRoZlU0VFp4MnBDaW9nblBiVlNvd3RnNkZmMVVacy9tMWNvZnNTT1Yx?=
 =?utf-8?B?QzlRWTlPK1VHekFtZTdOeUxkdy9pb1FVWlV6VUk2ZGl3QTZSVU5xcThGUlBm?=
 =?utf-8?B?LzF5T2luclN0SVI3bE5pN25NSFhMVk5nbm9mYVNRbVY1dXpFY0VqenhmK0pj?=
 =?utf-8?B?MVljZmdWOGEwQytXa3FWUFgxZFFwYUJRVEVJR2VqRHViMU95UWtZNFlidnJR?=
 =?utf-8?B?S3dQS1pnYlRwS2V1cHJHdmk2U2xTSThtdE9qckxMQ0M2aGtzZjNrVjRaSFY3?=
 =?utf-8?B?c1g3V2JSaW1pbXBBRkdRVHNLVEg0R0xvRTFiUUVXdlNjeHlhclJPVmUzcU9U?=
 =?utf-8?B?LzlDVWtQNGh6ZUF2WjVIZGJTTWJLMkNzY0ErWVdodGdZYVdiWktYTGt3TVBD?=
 =?utf-8?B?VEFHY05VUDlDM2tMMU5xVzN0OXJJNEQzT1JVYStUZzFvK3dudnNiOVFSbkZF?=
 =?utf-8?B?b0VteDV6QXp3M3BuUDRLS3FYR2xzMmNFeU9yYlJrZHJ6c2pBekhYUCtTQmt1?=
 =?utf-8?B?VUYxZjAwZ09GRFlxRktkaDFmOUNaaTVWN1Yzb3hJcjhvd0QrODM0K29XWWNp?=
 =?utf-8?B?TXYxS3ZIaVErNGpBQTdsQTR6azJFakJIMFpTOFJZaXpmdWFTUEZjb2drSFNo?=
 =?utf-8?B?TWJHMENBWEk5VDFWcmFDVjhuYlU1ZmlxZmx6WDBGZVBUazFLQVNzTkpFaUNx?=
 =?utf-8?B?NFNnVERUTkZjb1I4SERCWGZhbUJPYzdITUtSV3BDUTlQelFTWWhSZDlNVnpo?=
 =?utf-8?B?cGZQa0tSSVZ1RytKUDJ5UWVJVmZRbVRJOGkyNHdRK2poajBoa2tFdGZja25E?=
 =?utf-8?B?d0NTN3pNdEp2TjVIMVI0SlJmR1hRSmMrYjdHMnRtRVVPdmRwU2FSZzhpZm02?=
 =?utf-8?B?YURtdFJCL1AyS3BhOEc1b1c4VW1uUTllSzYweFducTVxN0RlOVlOS3JwM3pF?=
 =?utf-8?B?ekhPNy9VTHl3YWIrcTRJcndCZU96Z3FITVY4WkFGREQ5NCswSjFYUlBndUV3?=
 =?utf-8?B?OHNkOWQ4VFZMMDRMMXV4L0l3WTFVUzJydWZjTnYwUUx5QXluNnpEZ0VNdTdJ?=
 =?utf-8?B?dDZJOW8vbHdNU2Zpcm9lNWhEaDY4MndyUjhIUjc1Qnd3MVRMa215Qmh3YmJQ?=
 =?utf-8?B?elpZVVQ4czhXNW15elVodFhWOUpjSGR3dUphektmcXZldjVkYzU5TnViNkZk?=
 =?utf-8?B?Sk1uZER3bUQxcGRSTUpIa0VBSVJ0SkZIak1Zbnp2Y2NYMW8reDE5OHhtMlNa?=
 =?utf-8?B?SmtNTkZKUFFOU3NlQThDVStHZDhHQlk0MVZiRmN3VnBoeHNuVU5QYzBJZldJ?=
 =?utf-8?B?ZmdtQWxacGNsdFNlMEdZNFlEWU10UUZQUFY1bWR5aXVuMmloajVyN1NxRzhQ?=
 =?utf-8?B?dTMrODVqaFBlKzNLdzd1U2NBaUVOc2dGbGVjakwyQTJ1STBHbld3SWpXeU9K?=
 =?utf-8?B?TkpXSWw0R2JQM2pEbkZNWndPY3BEa1A5S3ZRZHplazB5L1BkRFdNUkpMcWlY?=
 =?utf-8?B?ZHZMMDJZVHV4czQrdWpubU1WdXd0YzBZbXdlcFB4V0tZUms5NGFRRXY3Umh3?=
 =?utf-8?B?Qit2bTYxUzNxWnlPNWR6eFhMR3hINDZHckJWVjJ3Q3pyMUhhUEpHN3pMck93?=
 =?utf-8?B?QjFPNjNVM1lHYmdVWi9UZ1RPZkM4UTI5RTZwdmNpemFhNExKU0JSbDVvditt?=
 =?utf-8?B?N0FKZ1hiWWNpSy9yMFBqU2FCR2JDcWNieEw5WnpmdGdUaTd3dDJwQXNxWHdr?=
 =?utf-8?B?SVEwSFhwOWRYbUtESzJjK2hISStmbkFCcXkxbDBwTjBwaDlmUEJKek00akRy?=
 =?utf-8?B?bGJxRC9ENlN1R3hPNkdXRmVMY3RUaHY5MXJkdGNmYWtPU2FIWTVIamIxZWlm?=
 =?utf-8?B?YWk3dEIwUkNVWFh5SHpoem1hU2hFZE1RUjZ4TWRpZGg1WjVHTzVVUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf66f73b-cb9e-40b9-efff-08df3fb7e6b3
X-MS-Exchange-CrossTenant-AuthSource: FT1PR12MB249006.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 05:51:59.4873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wT5kBsbvCIKErukqxQlWYdWRgEH1GXbqiOETUgp1VwLa642ufHgSMGduyjjtWDDXgBWpmg05nmb24lQNiZ7bbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7002
X-purgate-ID: tlsNG-720697/1794376325-F14AE2AC-5FB06BE8/0/0
X-purgate-type: clean
X-purgate-size: 1835
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 2026-11-10 18:22, Jan Beulich wrote:
> On 10.11.2026 11:02, Jiaqing Zhao wrote:
>> The PID-based device model destruction path returns immediately after
>> sending SIGHUP, before QEMU has necessarily exited. When an HVM guest
>> reboots with VNC enabled, the new QEMU process may fail to bind the VNC
>> port because the old process still holds it.
>>
>> Wait for QEMU to exit in a child process after signaling it for at most
>> 10 seconds. If waiting fails or times out, log the error and retain the
>> existing domain destruction behaviour.
>>
>> Signed-off-by: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
>> ---
>> v2:
>> * Share the fork, error handling and child exit handling between UID and
>>   PID-based destruction paths.
>> * Reduce the device-model stop timeout from 60 to 10 seconds.
> 
> As per my v1 comments I continue to question this.

I looked further into QEMU's shutdown path. After receiving SIGHUP,
QEMU calls bdrv_drain_all() to wait for outstanding block I/O requests
and bdrv_flush_all() to flush its block devices. These could take
longer than 10 seconds on slow storage.

While this does not identify the timeout you observed with SR-IOV,
my earlier measurements are insufficient to prove that 10s is enough.
I'll restore the 60s timeout in v3.

>> * Handle unexpected errors from kill(pid, 0) explicitly.
>> * Fix misspelled "signaling" in commit message.
>> * Coding style fixes against tools/libs/light/CODING_STYLE.
>> ---
>> Cc: Anthony PERARD <anthony.perard@vates.tech>
>> Cc: Juergen Gross <jgross@suse.com>
>> Cc: Roger Pau Monné <roger@xenproject.com>
> 
> You will want to use a correct address here (.org rather than .com).
> 
> Jan

That was my mistake, sorry.

By the way, on MAINTAINERS:390, Roger's address uses .com, maybe it need to
be fixed?

