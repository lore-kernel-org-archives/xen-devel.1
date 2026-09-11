Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF713C88E4D
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 13:37:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416779.1645701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x51Qp-00059Z-3t; Fri, 11 Sep 2026 13:36:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416779.1645701; Fri, 11 Sep 2026 13:36:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x51Qp-00059S-14; Fri, 11 Sep 2026 13:36:43 +0000
Received: by outflank-mailman (input) for mailman id 1416779;
 Fri, 11 Sep 2026 13:36:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x51Qo-00059M-8S
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 13:36:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x51Qn-008bWD-6x
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 15:36:41 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aa403df-bab6-0a2a0a5309dd-0a2a4501a740-30
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 15:36:41 +0200
Received: from [52.101.56.0]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aa403e7-5984-0a2a45010019-34653800167d-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 15:36:40 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA3PR03MB7393.namprd03.prod.outlook.com (2603:10b6:806:39d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 13:36:38 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 13:36:37 +0000
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
 b=vJ4z3GKmraEhkm7bjADhFvyU1oM8VOx0ujbxHIT/XGdHnKhUvHFCWBlnjyXYa8B/vK1PR6+/HyDUPeMDA1wBTzloAtbOpxGknmBipF0j9Vg73V2ln953YEPZb3P1ZvTChYp3hHXQ7jm4U3UelII3bCThDaYMAcQc6dZmQp1M7+UhH8+UO4TxcwNCmle3vkDDaG8zXkt0+HoQWqxW0Q04v4CZoTGBgQMo5camVKBzOyzXd+k6hKI0F/ja6ny2cDZBjgLH6VVtLhO8d+4dPi22yoSk+j/qPhCp/6uZFSPcaxrqMJEzdSo7mAuv7aSFs7nVRwVlL7kwASdegtakTuDJhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CNIDaemXg2ZXLIkL7I+0+KM63ZpJMzcetANXfxpmyRc=;
 b=TtFbVsnF/arulpLqRbu+dihsICnE7XljCln77+9WgtA0Pk1Bf53L4C2uCsxO7Ve0RINvxaib0UX9ia8VYpVB+jbrcRqSTlbV/vGubGKh4bHtuJiwsPm+DuZVEb8MYkxdF/BymaWtesQSaJAO4yrtDRTfMagWxEHZqnJu4Fk0wiBBWgD4GV0QtwtF3L/ST1p0iTpI6qlUk3/esjkGH8XkbZ8n4yw7haRDazU3LxBdGBH9VnoDzHApwmFDi7Ojvkf7D4wqRpvkaH/kQ+h47s5f9WS4tgEpyP79WL7zsU7vQaIN2n3GrO0495bQdM4mQPgOwS9RrpTNDIIu7culWbD7bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CNIDaemXg2ZXLIkL7I+0+KM63ZpJMzcetANXfxpmyRc=;
 b=siqY02RUp3bKlp73qREc0nNbvDLHvGK0cwW1y8sepgyA+3fR28F8OOkOMGG50BSeU1b3LERvbRcY2bfALmF+nIvXCfkYo19y876ZLrx2DXP+5eY6zkQL0GealzU+ayNy4dh4tG1vSkpsEEAJL7NTsk1oAX9xXQlCyhzBu0xQipY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <10df3c15-990e-43db-8cc7-578f44a2bbfe@citrix.com>
Date: Fri, 11 Sep 2026 14:36:33 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2] nestedsvm: Fix multi-byte IO port intercept check
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20260911132315.1209497-1-ross.lagerwall@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260911132315.1209497-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0511.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:3da::23) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA3PR03MB7393:EE_
X-MS-Office365-Filtering-Correlation-Id: 941cc833-87d1-44e1-18fe-08df1009b476
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	6xeS/AhWKdAa4VHe0Ff2qixZjjNTLtbDnJTg68iKyUGpfexMv5Gd7HHh9zSsIvLVOAun/CVGjHZOVSUZBCpIHXqlXjthcaGd2KlYFoQFQhN3zqPoVT/VSKOYGDgDBQLk5pnmTlVP7z5PTpujCjScU0r8hHPOVBuybQME5DLqSOXiR4Nbfe4cRBPZoL5b6lnyzqQC4QPPAy8YnIB6n08AxMz2olXvR7ZWhnrOgMUkufdVfDoRDqVNe4Rd81nXRSJDPsuv+AH07b4cgHThUJ1VakZ2tFcPdBSWi58NqW14zy7xwe3cVw/CZaSpP45xOiS1/y/m0GKeRQvr1rD2eKb/ej52p9TTDaBAcMGWQ/Gak2MuZQsItl8joUSQhl/s6SIVY5OfuwCtsfJhbnfSEzOHcw+accEcHrOnIXv+5fXMf0xZV4E+oj0h5b2DTNfGtPGCxGb5qsIUghrn6IW0B+jVfEy/WianSvdRWFbzJQhan56Mm0pzkDeIykHYcued5tmvnMWAx8nt8I4Eq84vY+1dQJba0bRyznnzXQPLn0m5gfHTguMNTnKr2sveJpgUdN0hQJeCNdP/ZA7zlbKAMLAe59dNDTYlxT2LWIDk+xis7z/fqy2v+OwAACceOlv2GieLRXKELhAdSaq3PJjygk2xds1LavchZ3uDVULHp3jV/MM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2lGQ1cycjBCNjBRMm56NGwrUzdjcHZHQ3hEUEVpT2p5RXdtQlpCSVl3R3Iw?=
 =?utf-8?B?STY2YURJekpsbXlLSHpTdExkazZHVWcxR0VYb2JldG1CQXIrNnErRzVIYm85?=
 =?utf-8?B?NTExM003eGVlUWw2N1hDbktkWGNGNEFNTVZBV1ZLWElPSEd4WFB4bmNaUVYy?=
 =?utf-8?B?RU1ML0tENWZmSSt1T05lYW5SSWhpVjl6dEhFR0QwbWFKTkgveG01K28yZi9x?=
 =?utf-8?B?V3FTUWxnS2NXYXgyR1ZpWXZDUExpVDF2cUxpQkcxem5Oc244dHBGMVUxdG13?=
 =?utf-8?B?NGxRcGxZdXphYVZvS3l3OGQxblFaY3hWR25EWlJ2aDRuK3MyTitsTUljVUdx?=
 =?utf-8?B?cGFFQTNzUy9zQVpQWWlGeVkwUSs3eWo4cXNCOGNuUjN6MTBLUGp2YTRjMzdV?=
 =?utf-8?B?UUdUaE5jaGRzUUVoUllPalpNK1VJSjUxZktPTWpnM3hXbXlxMWltdWZMK0dx?=
 =?utf-8?B?S2tBeXBzYnN2QTM5MlpYeHc0cEpRMmlHZWlBRzVqQzB3TUpEVm5QOVdMSEts?=
 =?utf-8?B?Sy9GUnJHeWVMOVNZSDRqTmUxTUl6U1RxbWoxcUVQM1VRODdFY3gvUURkQVk5?=
 =?utf-8?B?emFEMG5tK3RsYk10bjU1YithTlgvZDZ2VEpnM1VmdWVqMlNqVE83R2ZQMjhI?=
 =?utf-8?B?TTlXd3YwWGE3MVl0blk3a0kxUEYwa0x6eVQ0S3RnSlhlNXNocUNJb2xEM2wz?=
 =?utf-8?B?WWgxSmNaTkduTDZJMUVia0RiVW9RKzVTejRiUmQ4MEFaN1ByeWVVemlGRVlV?=
 =?utf-8?B?Z0x3cGNiamVENVBCZVFLNEFueTVIVkFsWDRUdWRhVVB4aTNjWWZFcTNxbCtv?=
 =?utf-8?B?N2MyMU9weUdrNC9md201bENTUURxUVExeGh3b3NXSDFIeEY2MFpUVnQyejlK?=
 =?utf-8?B?VjVadk9MMnh0NFQzaU10UldCWHN3Q3ZONUZuUFgrMWVmcGY1KzlTRmp3Q1pB?=
 =?utf-8?B?cTI4NzdHSHh0OWxXOURxdFJaTk8yZXByK1B6SDhnd0tPOG1UL20yelpPUmc5?=
 =?utf-8?B?ZGdMdCt0Q1lBbmJURjRFdDdVUS9HaEhNd3k3bEFFV2QxS09LS0hSWkpFdmtp?=
 =?utf-8?B?djRGeG1mS2laVk0yanBDNXJITWhPd2hHcHlqdk1GdlBONHg2NFZvZVZ5RTUr?=
 =?utf-8?B?OFJtVnlML2U5a2ltMC90dXd6WCtPeGViWTRVbFFDVkFaMXYyUXlXSDhyV2VM?=
 =?utf-8?B?S0dUeGFwUDZhNGVkRkxEaW1jY2YyQUhXNm9saEU4R1JjTTExODlKNmFpTWJq?=
 =?utf-8?B?M1FLVDJ6a0VHc0FDR0xYQ0xqeEc0VG1tOTQ2eHdkSG52RndJeEpLaXY1cW9v?=
 =?utf-8?B?cUFaNkxCVlQ3ZWR1QWRCV0dPRnN3OFpQTCtEUFdNQzl3d2RlNnF0blIwSUIw?=
 =?utf-8?B?WEZMQ0VSbWEvcnJ3MVVCUzJRU2hQV2hjM0VJUU10U2VtMnpyTytsY3Y1TVVp?=
 =?utf-8?B?enpJU3d0QWdWTDY0T2lKN3RYdjdjVWxNZmpQNmR3R0hOUmMxK09KLy9ETDFM?=
 =?utf-8?B?K25pUFYvS0tnM1FmYngzeXc4enFNQkNlKzJXRHk1NEtNckhzUDNQTXVPanNu?=
 =?utf-8?B?eUdEV2greU9qUEdZbzd2VXkvOHBwM212c1ZxR2ZHUnEzUFlmVGlLUTJOMDgz?=
 =?utf-8?B?MWlDZnFOYno1MkxWc0dGd2xBa25oS1EyRStZdjVtTHdSZnhXL25HcUpBRzMr?=
 =?utf-8?B?T0pDdlpSd0pEelpuL3ZSTTIrUWZCYW1JZmNCZjFMT3Y1Z1BKQ1M4NHFHY2lX?=
 =?utf-8?B?SkJaem9DT0xXWHJPbjRPOVN3SGxzWTlRa3BxdFY0WExxWlJnVUlGK0ZlbzNq?=
 =?utf-8?B?eDJxUGVZTTdNekVkWjlxRGhJUTFMdExSTXVLMWR1SWo3ZlU4MC9LWGZDVk4y?=
 =?utf-8?B?RUt6ZUIwVXhJNEpZaFBYTWNHcFZVYkdKcC9kS2QwVVpteG51a2Z3RXY0V3da?=
 =?utf-8?B?MXQ2cmJ3anAyNkRXbmIwZzg3dlZjdjRkYnBxL045S1VramhXdTdJeXBmTDFE?=
 =?utf-8?B?RHNiemoya2c5S2RVODZwQ2l2aThpSEFFMnVLRFlqeFhHWnYyUmR6M3JyNDBT?=
 =?utf-8?B?UDFNRk5uNzFrRTFVcjF6MFVsN3hwdWNlbWtiWFEyd3A2VHFkaFcvR0I2M2p1?=
 =?utf-8?B?dXp5UTI4b0NJamJodEp6WGZHTWtwTmpyWFcrdDU0dVE4OW03VTJ5RHkxUTZ3?=
 =?utf-8?B?MmYrOEloMnFxZDVPaTZ1U3NlbGlsNEJubGFHUnJLN3NDbkg0UGFycmlGNDJW?=
 =?utf-8?B?WmYrV1NGVTJBRitXWW10MVVKS1g5U1ovWlRVcXVzNCtFZXhzL3Jjd1FkQWNV?=
 =?utf-8?B?bkxhOU14MUc2TGxOYzhvQ3JjRVcrczN2YlFXS0hMaThpVWJjUktzZFB5aWpx?=
 =?utf-8?Q?YFi6p8eumysS18ik=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 941cc833-87d1-44e1-18fe-08df1009b476
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 13:36:37.9214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J7kdr0canqQOaZmO6MH7opSRjPxGE1i7iVby6iuj4B0wKWoFtnXOanHgrIrvW8llY2WB4V4vcKbd0ydce8KTG6od24m+pveRYhk2hW5IQos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7393
X-purgate-ID: tlsNG-d62444/1789133801-BE465757-41C45A86/0/0
X-purgate-type: clean
X-purgate-size: 1676

On 11/09/2026 2:23 pm, Ross Lagerwall wrote:
> For multi-byte IO port accesses, the APM says that SVM should intercept
> if any of the corresponding permission bits are set. However, the code
> has this backwards and only intercepts if all the permission bits are
> set. Fix this and at the same time, make things safer by handling
> mapping failures as intercepted. Also rename the 'enabled' variable to
> make it clearer what it does.
>
> This affects Hyper-V since it does not generally set all the permission
> bits of the multi-byte ports it allows its root partition to access.
> This results in an L2 root partition that cannot do PCI config space
> accesses and therefore cannot access its NVMe disk to continue booting.
>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

The reason I asked about 0xcf9 is because it's the one-byte PCH reset
register, which hides fully inside the normal 4 bytes at 0xcf8 for CFG
accesses.

Despite outward appearances, the x86 IO space is not one uniform space. 
It's 3 orthogonal space (1,2 and 4-byte accesses) where the target
device gets to choose whether muti-byte values alias in the spaces, or
are entirely disjoint.

For the HyperV root partition specifically, I'd expect 0xcf9 to be
unintercepted so as not to interfere with the final steps of
shutdown/reboot from the main kernel.

The patch looks ok, but I think the second paragraph needs a bit more
explaining.  Are we saying that because 0xcf9 was permitted, we allowed
4b@0xcf8 to be permitted, changing L1's CFG index rather than changing
L2's CFG index, causing the subsequent 0xcfc access to produce garbage?

~Andrew

