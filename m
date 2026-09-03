Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5154BC624A4
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 09:36:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406630.1639823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x23rj-0003ZZ-Js; Thu, 03 Sep 2026 09:36:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406630.1639823; Thu, 03 Sep 2026 09:36:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x23rj-0003ZS-HE; Thu, 03 Sep 2026 09:36:15 +0000
Received: by outflank-mailman (input) for mailman id 1406630;
 Thu, 03 Sep 2026 09:36:14 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x23ri-0003ZM-EQ
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 09:36:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x23rh-00CNyi-I5
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 11:36:13 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a993f87-e002-0a2a0a5209dd-0a2a4506918a-16
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 11:36:13 +0200
Received: from [40.93.196.28]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a993f8b-195a-0a2a45060019-285dc41c7018-4
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 11:36:13 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN6PR03MB7765.namprd03.prod.outlook.com (2603:10b6:208:4f4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 09:36:07 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 09:36:07 +0000
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
 b=bn1HONFxVDLeDcRszV3W/D8PA4GDA14ustwYDfzje7sLm2TjBEH4bACnpV4jTBK5xVoNUQVbaIzdIknvpmJLu2WJQTIV9pVSXy+VnlaWX6YL6PkLldmxY0age9N0xHsaDVhbu3Br1UqKcPYZ6FNsD/xw67Kib0dUTJsZaIzPCJ9QlCTIVc3BO4DJVgl3gA94PbP55nwqZYoTjK00/3NHBxxFtdNl/1RPWkmfYrphWJ0lCR0JFDhlCLOZ1KTABCv/Y7pKgmZTks1xgmdaLy36NWSmEHbpoCRui1zD670dfP79IYTYIpHf9Ln8wUy2MuAfgyQ+xPWFevR268duPJ+F8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGpjHWPGW6tkt+WCWcxyIvIVJukJxQD+XnWoThcmq/Y=;
 b=EUyHoOMdMpJYbtsI7YTslatj+iY3C1s73d/tidK+J1QeR40O3upyeOX/nRq43o+R2ciJDUvU6sps4akYyjOlJdY48f+AKAStt3FnSG/g0CH6jNtKevZQgY47FCzUACHkIwxJpayONWLVF3uIrzeKfLbidWXp9w0xE8abbv+032/bywzcm9ENvSSEjWGxo8tzrt8gt7fFte2MJsrrKg6vq60XmFqC6qgDjfeixI2RH2Smu80eXV4qOGimr+1Sk/cUTQbCOw/qqoOxsthOYgULOwIUoV2xAgPTNVam1KQDPyaB9K7iLuyHHY9sf1IswUHVq34p24UhPNT9Spl1vNDp3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGpjHWPGW6tkt+WCWcxyIvIVJukJxQD+XnWoThcmq/Y=;
 b=pDpYSmaO5jvrbTFiabCkE2Nv7TxEgkw/v5OacMiwFlFO2Z5+TkObMqBDhnbBhu407uENLltFvhZ4jBBW/EIby5fkBo1NyAfXYjFSH6FIj0APyndYho1Hsp24GyTW0Imw+Asn18BL756eeSQP28snyz0cLhT8Wid17NQP6iBkizw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b796e561-e8ba-4911-b765-3f2fbf46842e@citrix.com>
Date: Thu, 3 Sep 2026 10:35:57 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>
Subject: Re: [PATCH 0/5] xen/arm: Fixes and improvements to SMCCC
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20260831121944.2908139-1-andrew.cooper3@citrix.com>
 <646DE9C5-6708-47B9-A4EE-9111E101A038@arm.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <646DE9C5-6708-47B9-A4EE-9111E101A038@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0374.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN6PR03MB7765:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b5c0449-f5c4-4c91-a416-08df099ec822
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mtbsy/oWpti0J6L0K9P7/B9uS/hUCI7l/5zgHLkl5hAU5dNey/jaQ3SbDoIzx+JaS87FAMmbM5pE9mOpGLaebu5Hw1SLLPpYLShaf56+pqLaun5gFxMmMAEDknGYZPUm9DCUqqknx9t5zvF2M6Dt3ZnQHOHZVetRxJRVvpxnUfzjt+FstRgKXfv6CeaUdOb90a+gsLSr3Rsk/ySNQaMqy1N7oOW4OKi/o1r3tqGIVoGj81Hua4e/fNPQbyojAnDI/mTB144JfE6yRqlkOTA4vbPN5nGXL3Y90WlQiZfbb48hRxujebv58l/eMgLIKH1FHLGJIr4pKWfX6lD8jy4XjbHpePHVNNwAmGon/TiEAIQu9sd8Zb3S0uFjK7oKo9plJq4oGLnNyMja41PpYSj8Yduk34JEuGc8WEikkOM2XnwqOxl4Eo2VJJaBAWWPkDfghTwCJKiKaVcYa56r2BWiigeFcPmxjXNKyVC3P/+9HIk8PSbr11/INnhoDjcMuUfWSZTOgZrapXnGpigHdJq8MDukjfM4TU9vadDnefWPMXodzaCuEl2nJB6LGNjbqENMOGU00rcUNXD7EOxdkBn5UD3aq2iVTP8VhJ+ngZvkYmY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R040OXRieVdVR0QrbC9HaDk1bHBnTEtFbEhvNmF6WGloR2tGOVVTR0tocVZK?=
 =?utf-8?B?anh4QkhielpQM3lIMUh6MkFMVVAzWmdWUU9aSU9qcUVrVE1hVzVZcUpCUHd0?=
 =?utf-8?B?NnlINURGM3N3VndOQk5mbnlmbkZBdFU3UWk1R3lCaUhVcUNrR0pwU1BoNE8y?=
 =?utf-8?B?YVBzenZMNytaOUZzdXp1THd6azlkRGppcU9rVnVnWm80SC9vZFFQSm9kT2Iz?=
 =?utf-8?B?NkxIUUJETXhwbC9NZXRsTHdLSElSK0dNRE44OUtSMTBqQ1NaYldMSXk1NzhI?=
 =?utf-8?B?RUM3RlpyNXFCQnYxV2lKekN0SkE1Ti9IR05LdExNVzc0b01RSXBhYnpGUzMy?=
 =?utf-8?B?Y1k0U0F4cE05S1BhaFo2N0pFbFZGYkdhb3djQW9zSThGWkswQ3hRQ2VIa2k2?=
 =?utf-8?B?Q2FoeW53VGJhSEpOcXM1OC9iRkRYNm55ZlFSTGNDd1FLNGxSOXRJTVM0Mng3?=
 =?utf-8?B?REVXeGM5OGRHZ1ZCQWZ1REFENEE1THllVWFYV2lyUWdTVTJZYnNWT3Y3Ykxk?=
 =?utf-8?B?N3o5Z2RNaDZHTFV2N2JvSGVWekRISm84cXNjTUZFSThXcUlSeDRkRGgzeE9S?=
 =?utf-8?B?dndxc0xwaTNxaEhtRUFoaTlxL0VVQWRuV3RJbENWWEwveGNwRGRJbUtTZysy?=
 =?utf-8?B?Q2lnbWdQbmUwTEpuN1VVeFg5cXpPdnhhZ3VYU29UZ2c2OGJFc2pvNHJzQVRp?=
 =?utf-8?B?aVY2OUV0VTR4ZkZPS3lsVXZQQlIyOWdnN0JGbU5ySFpwMzB6bnJxaWZEZVoz?=
 =?utf-8?B?bWI4b1FOQ3ZpQ1VUeFNQL3NVbVh0UXEwQnViRTdxalpNS2ZFb1U5MDh0bzRi?=
 =?utf-8?B?YVArNmNpKzFPWnhBdVUxWGViQ2Zqbk5UOEdUY21rWFIzNFJieG1HeE9sWENx?=
 =?utf-8?B?SUpVTUFHRGF4dWorM1JMY0VZSGZ3U2l1b0d1UC91MmMxYmZ0am4wemVicVdi?=
 =?utf-8?B?OS9tWjZxYXlvdTVPMmIwc3NLdElYY1FRNDZ4dGFQakxpT0R1UUswNUVlcE1X?=
 =?utf-8?B?TWhMNEwrdEY5TUNJK2p3ZFhWZFdPU0Mwbm9MQkpLdm1idk1wWGt3TGdjVm1E?=
 =?utf-8?B?ajJJVG9oOUpLVnk0eHd2VjRRQWcwTlk4dGlaK0hwV1loTGUzNE41cVcwcWsx?=
 =?utf-8?B?Yk9sMVM1b0lvWnYvTkhObjhTN1hmRVNIMTBMOUZweTdlcVU2TzVFSXkvWENS?=
 =?utf-8?B?eTIvWTZtMnl6OGpqU1ZURzNtbUgxVEwybUxvbXM0em5vbmJNK1BqR2pxRFUz?=
 =?utf-8?B?YU55d20xVjd5eUVkVmNlUjhtRzRiZkVpaHhTbklyQXNwYUJGbS9OL1pOd1JZ?=
 =?utf-8?B?NlZKT0NoMDBsNW9TTDFiZEZEc25rTWNQcEQ1cXhDQjNvbTB4Y1g3cFlpSnpT?=
 =?utf-8?B?cE4raUQzUFdidkUxazE3Wm5tbXhlYkNvYkdtYUFib3JGbmJueFh4K0FBOFVt?=
 =?utf-8?B?MG9zeEhMUTdyN3JIaWd6bXVSM3BYd1BYYlVFbmdSTFF3b1BvRlorRS8zeGpT?=
 =?utf-8?B?WmdsQ1AzN1R6TVdwTU9BSWhzSTQ5RVhIUWtYSVNXR0x2VWxzRkRMVlRZdjRl?=
 =?utf-8?B?N0xaWi9UUFZlMU8wNURSNWtFZW9ZZXlXZ2lHQlkzeXpmV3AxZHdNVThWQjhM?=
 =?utf-8?B?alFjV1NkQTYrYml5MGNBbDNjZlV1NzFmNHo5T085alIzY0VSbTYxdkJTVGJG?=
 =?utf-8?B?eXhBbUFXUy92dVdpMFUyWUhTakNjTHByMnRacEdlYjhzcmJVTGtDbGxRQVBM?=
 =?utf-8?B?M0pJc0hpQ3gyOGFrOEN1cW1iSlMvQVpwK1I4L2hoU0dqd0pJYjR3bzRUOW9E?=
 =?utf-8?B?YUZXNTJsa3p4aGoxZGVYWTRaYmRWYzAyVXM4d3luSTJRWlB1WkdsQkE5ZkVB?=
 =?utf-8?B?bXgvTWJPVUhzc3ByeFFsRFVRQVBLcXVpM1JjU1ZwdUVFVmVWc3RwT0VYTkQv?=
 =?utf-8?B?Y2RlWGQwRmNhNHlKTkxQNnpiUFl0dnBMRTBmQWtBMEFaZmluRU1RNldiU3My?=
 =?utf-8?B?TjJDTEkrVFd5ZFlJTFgyNG5EbVZYeFRheGNMMUtja3ZPUEUwNjhhMllxUkM2?=
 =?utf-8?B?aGZzYzJLUGk4Z3ZCNXBpMGNDZDlpdXJlUDhSYmxqRVFwOGhqVHFEZXFnZ0Ju?=
 =?utf-8?B?UURMdEtrZU52Wlc5Mld3NlNMb0JUSDc0eTI2NlV0LzlMNnB0L2Vzd3oxUmtK?=
 =?utf-8?B?N2xEVE81eWR3N3d2MnYwbE83aUMxcXhkR1MvOFBvN3RhYUFSaHR1U0c4aXRT?=
 =?utf-8?B?UXFoWGhGNGFrRjdNZTRud3pVMjRLQUxYeG5lNzU0LzhJL3BnUFUreUtwT2dS?=
 =?utf-8?B?cHVDcHhVSFBhQ0FFQnVicm9aMUVxTjZSaTg0eW1VZm5pc3UrZm9xQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b5c0449-f5c4-4c91-a416-08df099ec822
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 09:36:07.8700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +hmH0EaUc0bXwczAvgASLBtqt8LnVbYw5a9qSz5j1603VC6CKcHpagv501CVMCQDrNoP/SlgwFNmZ1KJJcqJty1KjRIhcSHi8v8Mtye4KUY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR03MB7765
X-purgate-ID: tlsNG-16d1c6/1788428173-FD80D77B-2A026225/0/0
X-purgate-type: clean
X-purgate-size: 565

On 03/09/2026 10:20 am, Bertrand Marquis wrote:
> Hi Andrew,
>
> While reviewing those patches i found out that cover letter is saying that the serie has 5 patches but then the patches are number out of 6.
> Is there a patch missing or something went wrong in the numbering and there is actually on 5 patches ?

Oops, that was a mistake with git-format-patch, I expect.

The 6th patch in this series was
https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=5504b16eea5e661b67d4fba3cf9283d85b9dd3dc
but I ended up submitting it separately.

~Andrew

