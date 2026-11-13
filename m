Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9384F606A334
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=BcB7QMSH
Received: from list by lists.xenproject.org with outflank-mailman.1488013.1690316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtYn-0004m5-Mr; Fri, 13 Nov 2026 15:51:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1488013.1690316; Fri, 13 Nov 2026 15:51:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtYn-0004lv-JN; Fri, 13 Nov 2026 15:51:29 +0000
Received: by outflank-mailman (input) for mailman id 1488013;
 Fri, 13 Nov 2026 15:51:27 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xRtYl-0004je-He
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:51:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtYk-005t7A-Uk
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:51:26 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af731ee-e002-0a2a0a5209dd-0a2a4507ae82-46
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:51:26 +0100
Received: from [40.93.196.70]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af731fd-b4ea-0a2a45070019-285dc446b83b-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:51:26 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN2PR03MB5312.namprd03.prod.outlook.com (2603:10b6:208:1e9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 15:51:23 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 15:51:23 +0000
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
 b=wgpn3MN2A/4CaPZhjEUKYbJNDrmdKgWZmrsqol5q02H3nu5MZ/fjmizDqBuVDNDV7d/CYvbFUt0QZMp+IUd0uMZJ7vwJ5pisBCaBwT6qysjSPyy8VOT5s1e6Iz9qZhEYK5PoefNoJRNXBrCqVZDL1O7vvKdbtjIT1bGAdcvk0951GZAXC6eZrKuqy9GozfUVjqt7EOgP0gKXHEXSfsSONEV7P85Sxmt2a21d0crPIa0SxptKZl1AaC34HiZ1DLdoQqMvO7qwyMGtUpiUxt4hUtsm4q0eBlNeMbYJ0mhxCyNKuJ5Crfg3D58lJBqDsYwDl5IYXFw1SQYE34C7lkAtgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRyffpkOgrcPi0X0ed7uS9htB6yrRb1Hw+Ee5m5D2bM=;
 b=p/Wb8wPBmYOhEcy0nb2eFAfKxBQ2r+bEQSDFApDc+B4eyv3yoD0NFdZjHjJr9H6izKkjZRjSvlcBXb9ublsDt39DhULjSF8EF8xzc/qoDWQUdqVHHr+1RmcD3DIjXljfeZ7xndX1zz7m2fOnlqb/hCLg8YUx+Yv61xZ7PBfAEibcvKOeErRKLs2F7RbiQBghaluye1OdfIdxLjR1EwtrwFOpecYJALmh520bjy8J0SPMwHD5MQ7YwcW+JIK4xhK+7+pZVk1pQRipuj2r8Lip+rsrSFYqxeGBEvdBTEHnM3APVEqbC1sd6d4R0JvxI+qj/DMNh27sQy+9NV+W8ABfCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRyffpkOgrcPi0X0ed7uS9htB6yrRb1Hw+Ee5m5D2bM=;
 b=BcB7QMSHJ9upRzAn6clnSQLfYoDEA7S9zUZ0Y9jpSqpMsRhWZY7vGPHiO2YYxW0W4S+jyUVyZvNjJS1FGJsQktKtYWGRHlzpQGDU46BVxIu8Z1yfSS1HRmFGH5VXtX9Iy3QUFotHrvgW/KKOGRr5HFmSBzVkXQohK45fLgs5sZo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2a74d7b4-88fd-4887-970b-9b1bcb5b19e9@citrix.com>
Date: Fri, 13 Nov 2026 15:51:18 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Frediano Ziglio <freddy77@gmail.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Subject: Re: [PATCH v8 0/4] Various patches to improve Secure Boot support
To: Frediano Ziglio <freddy77@gmail.com>, xen-devel@lists.xenproject.org
References: <20260715062206.328049-1-frediano.ziglio@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260715062206.328049-1-frediano.ziglio@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P251CA0022.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN2PR03MB5312:EE_
X-MS-Office365-Filtering-Correlation-Id: 52353391-9902-4709-9f92-08df419df7b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|10067099003|11063799006|261022115727099003|56012099006|261022105027099003|261026121527099003|261026140227099003|261021121427099003|261022075727099003|261028144727099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	cwkVCmJWSPcoSHBD8o7GEf4mwVNHlw9rcYC01a7L96cxndKJwGAgqVcd4xojeTyLguguDioWXvDsVcXgEcPz+QIrDiAS5fyqjuqkvaryMz9xvvTB+Vs8YKu79Fb3BPdvMxJiUmSMJxn9vAiwbHj/aCuHqfpQDtEI6agFhEm+RP4DH6Dw3AY54c6b1G1FzpxF7rbHmxkT+tRsBrTlKqOSPfYBYqAuaQ9X3CWdra5cpgBBfnIOoXI0ApPa2nIz2+9YDLXyc7PcE8A0FQIBxl08SX5gcyB4n2UP9GnN2fFCQ/PQXJL5DvYqZKYDyRA4/STHtKB/M9lQtbqWCnxOjBkMoGSQIgvaxJSQ0WX5+ObKIv7/yVQgG6sUQEIsxCM53zic917G895AUd2O+M9ZSfHB8oTUeht6P+u1YOdYt4NsOqWD0GyNpgOBDS75NYDLPezsUKsMWiOR5uOe6A9O4JjnBUdviCJarvIPSq0AB5UfC+S5iRluCLxfRooPpyp0qJaunS5h3y5FpVgX86K1Oi5Z0glsxDUAq3g0pH/j1rXi3G9FZwXGodvwckewC1VapumWTILidWK4nWt9WvmdX85k1LpKtEkYR97XtcUYEqNQxhHyzE1xPlxMyyaGt+SodhaW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(10067099003)(11063799006)(261022115727099003)(56012099006)(261022105027099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022075727099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlVTdWZnQVU1ODdMck9QOHN1cjFsMnA4aVJHWG9lTWw1T1ZGdjZmOHlId2Fx?=
 =?utf-8?B?Wk4zVXc3V2dxOXVvd3RvS0hRMkt6NEVRcEJzNWpPVjNqV2hpWDR1V0p2V210?=
 =?utf-8?B?L2JnWW1XMnRxcWZpYjJWM2hWNlp3UEJyMFFIRWxYRlBoMWkybURzdDY0R3VV?=
 =?utf-8?B?YmY3WlFTRCtHUjc1aVk2RTBaV0lJeW0ycHR5NnVCbWROOWNuTzR6dkJDTnZp?=
 =?utf-8?B?azlNbk55V1NZUGxncEZWMWRiOUVHSDk5RGZxQ3NXeGlKVGE2RlI2aGpNemhE?=
 =?utf-8?B?QzZOaG9GNERuQWUxaTJ5UTNDekxxYWJRZEtleWR3eDZrU2V4ei9OUVQ0c25k?=
 =?utf-8?B?QmZNeHB5QUtvWmNIMFJmNXg0NEZVeDF2b2NrMkxJaFo1NW1lMXA3MWdTZWIr?=
 =?utf-8?B?eTlhNEJqVXJ3dWxwTW8wd0c5R3l4dTh4aEdHN1o3RDIrWEpxM05yTGt0RWNU?=
 =?utf-8?B?aDlZTUJqcERweWg2OVdjN21JRXhzNmNnWEpTNnJ3anZ1YW1IVXZNUFIwZWlK?=
 =?utf-8?B?ZkszRkZwc0lhdXo3bkhFY05icTlJU1lNdjJxa0VPbU5rVTFseDJld3FvRWVG?=
 =?utf-8?B?R2tzTVpCV3dnQk13K1U4YTlKUHI2S2tqSk81VUdYN0lxb0dwNzFqS0JvVlBG?=
 =?utf-8?B?eXNFOGJWZy9yazJVc3lRd3pXZ0c1YUhtaWg4aVljSWdFQ0xXcUxsS0gxOUpW?=
 =?utf-8?B?K08xL1AzTGl4Qjg0bVViTzdtc2VYL3Q3a2dDUm9xSGR6akNocGZHak5RYmp5?=
 =?utf-8?B?bk1mSzYzUDA5Vlcvb0tiZUpJeml4Q29mN2NSZDhqa0I3M1FkTnFmMi83Nzhv?=
 =?utf-8?B?MFQ4NEhhZzBVN2FjVkltNUxhMkYrb2Rma2E0V21TdWNkdjZBaUt3Zk0rVkhR?=
 =?utf-8?B?eGsxU3hReGJGQklTblU3R0dJRlRPQ00zek4ySDl1WldIeUhJYVdsMXdVek5B?=
 =?utf-8?B?ek5ieHBHbUc2alJnRGI2QTl3djlYYjBjdnVOOThwZDhFZ2NjTWxRTy9GdGJr?=
 =?utf-8?B?UTE5cmJNMzhqZEdnMTkvUE5kQ1FNN0U3Ym9TVlJBSGw3eHROYWZGV0lBdFZG?=
 =?utf-8?B?d1kzbDNDRDlObEpVdmlxOFpTTGU4Y0pydlFNM0JUTmpJVWRnTkFHWHlpdzZv?=
 =?utf-8?B?eitFZ0R4cFNDZWpYbmtkSXA2d053SDBJRUZqVXZjbGZHNlFvM0Fva2FYT1Fv?=
 =?utf-8?B?dzZmR3BHZkxOR1VXenc3R3lDSHVoMUVVYVRGVnpXbVdaYzZKK1BuVFFscWpp?=
 =?utf-8?B?R3c2MS93ZFJCTHlnN3NmMFkwRlNZVWFwdzdPS3cveG5uUlNvVksrem1OajQr?=
 =?utf-8?B?L2NIYTdXL1A4VkZVQ2lBWmw4enJkYnRwS1JPV3M5cWV1TkU0MXBNaUU5V09o?=
 =?utf-8?B?b2tadkVjRWZPakYybko1UGlvL0dkRkRqUTJZYTE0T1VkaUJZdzA1RHJlTWZj?=
 =?utf-8?B?TkNndFJCS1MwOE9NdisySk5IN3RCT0hKTDZKK25FeEJxNElEZFBwem5CaitY?=
 =?utf-8?B?UWdacVJTVjBORHB2WitvbnJ1UXREZTVsMVpqcStpSlJpeTQ0ekpoZGpEbEJY?=
 =?utf-8?B?UFVyMmNiY0F3cXpoWm96dU9VR1VHZmxMSHFia29kUlc4eU9MMmZHY0VJaHhs?=
 =?utf-8?B?SWFCUDNaTmtNTC9HSFI5UXJSUWhTMWxGNWRaeEgybC9yS0lOVzNsVzgwQ28x?=
 =?utf-8?B?cWE2TTFneUVoL0xWQ3ZzM2NKZ1pIVzAwTmZwK1pMTVBlNnB3VDFpeG5TeC9W?=
 =?utf-8?B?ZDQ4cVdkMTkrYU9zenZPdWdpQzhCZnlQUzBaNkk0bzF3VUdmdHBsa3p1N2lo?=
 =?utf-8?B?aXdad3FhZFhEZ3UxNDExc1N5eWFpN0cyVUNFaFBvL2xPVm04dzlaZjZMUVhD?=
 =?utf-8?B?M29zSTUxazFFVDRqNWJjQWRQem9MQ0hjVDdHbEdvcmc3ZGR1QjdtRHErTkNW?=
 =?utf-8?B?bi9kdFJIZEpwb1Rka2RrUyt5NGhyc3lKZE9JSldzNGpvRTV4U05mSGV2cWxS?=
 =?utf-8?B?bm1abnpmeGVGbzR6WXJESW9GbUJveGpWTmxFb1hVaWlTeHN6eWxxbkNWcmdp?=
 =?utf-8?B?M0swaithTm8xU25IOUJJQVVXMEp3L2owTjVleWxzQVN5VnRlQ1lkclcrWk8z?=
 =?utf-8?B?ZklRM285ZE9BMVRTYXVpeGp5d2ZSV25KbTlma3hEUERYMHlSWXJzUEZrNEg4?=
 =?utf-8?B?K0ZaUVJUdjhuVlFleWxTTlM4bXhwODF2UHNWT0dJSjRvZlpYVjlJNUV6bmtk?=
 =?utf-8?B?QUdVNTc1K0hSOHdEdlhkTUFud2ViS3YwTWNpWEpCRUpaZXZlTDRSOTlCdVhF?=
 =?utf-8?B?eVdXOFBPOEtIZ3dmWkZxazdXUE5wNzdsd3k2djI1OTZQNVg1VFFCQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52353391-9902-4709-9f92-08df419df7b5
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 15:51:23.2280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b7qxVMjIygacibRXN07OIH81rz1gLvR6JN2eJj11h9pCQvsJ5JRgD6LVgMzI7YN1N6By+dEoP1FM0PiXIZamyGGNSkUu+PR/mjYFco5rYeE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5312
X-purgate-ID: tlsNG-ef75cf/1794585086-3C212AE4-B17ADC30/0/0
X-purgate-type: clean
X-purgate-size: 2632
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 15/07/2026 7:22 am, Frediano Ziglio wrote:
> These patches improve support for Secure boot.
> UEFI CA memory mitigation requires memory pages to be not executable and
> writable at the same time. So changing permissions and splitting some section
> is required.
> Remove multiboot pieces from EFI executable.

Here is a hopefully coherent write-up.

There is a project(?) named "UEFI CA memory mitigation" (a terrible
name), to get the firmware ecosystem to stop mapping all pages as RWX. 
Elsewhere, this is known as W^X.  i.e. pages may be RW or RX but not
RWX.   Confusingly, shim itself simply refers to this as "NX", or in
some cases "NX_COMPAT", despite the characteristic being only one part
of the problem.


Microsoft have signing requirements on PE binaries.  Section 17 is the
relevant one here:

https://techcommunity.microsoft.com/blog/hardware-dev-center/updated-microsoft-uefi-signing-requirements/1062916

While for our usecase it is shim signed by Microsoft, shim is required
to apply the same restrictions to what it loads.  i.e. Xen.

From MSFT, requirements are:
 * Sections must have page alignment
 * Sections must not both the MEM_WRITE and MEM_EXECUTE flags
 * The binary must set IMAGE_DLLCHARACTERISTICS_NX_COMPAT


In practice, it looks like shim doesn't actually check and reject
section alignment issues.  It simply forces RW- or R-X over
[section.base, roundup(section.length, 4k)) and lets you keep any broken
pieces.  I don't see a check that section.base is appropriately aligned,
nor any logic to set read-only on sections which are neither writeable
nor executable.


Therefore, what this means for Xen:
 * Sections with differing permissions must not share a page
 * The binary must set IMAGE_DLLCHARACTERISTICS_NX_COMPAT


However, because Xen explicit undoes the relocation performed by the
loader, it must write to every section containing a relocation while on
the pagetables subject to restricted permissions.  Therefore we gain the
further restrictions:

 * Xen must have no relocations in executable sections.



This series contains _some_ work towards making Xen compliant with these
restrictions.

Further work is needed for the trampoline.  In the Xenserver patchqueue
it's moved into .data, but I would prefer to avoid this upstream.  My
plan is to copy into place and _then_ relocate it, rather than the
current behaviour of relocating it while in place in Xen _then_ copying
it into place.


For the series, I will be adjusting commit message along the lines of ^,
and get it committed.

~Andrew

