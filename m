Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A72C61DD6
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 10:50:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408184.1640831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2RV9-0007Qw-LG; Fri, 04 Sep 2026 10:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408184.1640831; Fri, 04 Sep 2026 10:50:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2RV9-0007Qp-Ig; Fri, 04 Sep 2026 10:50:31 +0000
Received: by outflank-mailman (input) for mailman id 1408184;
 Fri, 04 Sep 2026 10:50:30 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x2RV8-0007Qh-Bx
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 10:50:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2RV7-000Wyd-MZ
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 12:50:29 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a9aa262-8faa-0a2a0a5109dd-0a2a45048648-34
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 12:50:29 +0200
Received: from [52.101.48.17]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a9aa273-b57f-0a2a45040019-34653011e6fa-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 12:50:28 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BY5PR03MB5284.namprd03.prod.outlook.com (2603:10b6:a03:223::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 10:50:24 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 10:50:24 +0000
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
 b=wE/a2HEsqmz4r07Esf0V3v4D8Uf2nKKwNgkqAF11tKReRu3bpbMImZ+c5Y+KmDpFBxGtbqv1YiSMvyhYOVYOiTbSlwxwk/5r1OMHD4L/A3Pb5pw3G2ut5ONxkVwbBKT6nB6DhCLFnMuQXkZO36gI4w0vTYq2QghkE4r2Z+y/SgWCrbS9Dj8svJdnZY9dLuDxbh/ud0HWNSWKXZ81d5YDjcnLuniLBCoeYTsumHxSU/bLpu+I1Ybc+n3e99RilXx1jW1oNyg/getXnrtN8eJsc2x53vdjHhpxHMX2GKS7+87zM8J+ICUtT0BBiTpjr99D3UeCsjnDdpuAF5TzZK7ANQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZy08fihcHui52eWaPycF6G1OtxD4ooUz9UDdrNVDOg=;
 b=VsYzo7GSdZyKSlyKPgxOrgYqRfdSD/XdmgeJTl3uHZoII/GGG8DABoOmL0cMNcHoiPxmLkAj/DsaoSDZ+/YgPDHBOl3OhUH20Pkf38rh0SG6nFKddcTIukpS+x2bufpQrfUnQe06Lm4hwxbKcjBxGMUS9wJPYRv0Y7FL0MwNqYA1zzgHVz9rwALnOBWSeC8pWYFKdBvHSbdkzH4K8prBx5QGy2oUqP+hQp9waSUFaxjO41NLDObvZe1VwCLTNDi8aNFp1TPbbk32ofOBKJ4utBJ7pPp08nxte1KmL7n52gKvEXQHCq4r1xjj75yq/wBNEi5961w0eSQiKM5mHFz2Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZy08fihcHui52eWaPycF6G1OtxD4ooUz9UDdrNVDOg=;
 b=ygc4yNGikCBZAUG065YSIqxz/WGSWJiFuRl0HEPbtqG6KzmAmLrcC7PmFVaflc57lfQcRFUEbydH0z/3u2ckEDdx0EJkdeXgtxxcQouak2JDB5yzhfuzoGufHWAOhd6/OCw5+9nlMUjKjIERSbhoxqzTQNTva+Nab5larNAWGJ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <85b0b35b-b790-4c06-a61b-330f5e913adc@citrix.com>
Date: Fri, 4 Sep 2026 11:50:20 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>
Subject: Re: [PATCH 4/6] xen/arm: Rewrite arm_smccc_smc() for arm64
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20260831121944.2908139-1-andrew.cooper3@citrix.com>
 <20260831121944.2908139-5-andrew.cooper3@citrix.com>
 <D043ADF5-504C-42B6-BFD9-4438469858A3@arm.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <D043ADF5-504C-42B6-BFD9-4438469858A3@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0106.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::21) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BY5PR03MB5284:EE_
X-MS-Office365-Filtering-Correlation-Id: e40d9aa5-fde0-4777-3036-08df0a7252ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|11063799006|56012099006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tVPwqhhnWrxIWI0EQYXZpfnOoXmuUJ+g78IKFatDp0UNi6yXC3kEZldneL7ZAXdDaX9drRMub7uogVE0Yw8aQcbRf0dYQ5K6VdIhFrVBzwjFt9Vqs27GwYe51n90TV6WsoS2siUKPN6pNwvLwKlYANwo+ke5tXD7uKAUBlJ4FBinKgMQnCqVM8YO9pU9JFe74s8G/4dO9pHDjvxxyGsZzDQgY8z61LX8PgXqVmTRBocqUX4ES4YPrjryUDsQSWV7ofri+4M87tDB7mf2whP7M/UDPSfCuLW3U/tG/uLqSJ4HrqnbDa/z662wcZA8tN+F7x+Qyf8uCKQMKqTTizybDVMnNL3QQGpjQltX1T4TDk7PuWgUIr6dQj/3S4pXMfuW/vTwmQIgtSvMx5MJ5XnppngWaREoJhnZtOGxMvqkErX0FBdY9UFz8ZWfduUuxMzw1lypotxrgQ1EKMWEX17kQzfs8+cMgUfNMU6siS0bxEWzAGJzKMRa+Sb1FYKb/hf65a9a6825cU4yq6Rq+HFaivTJcq4ugtKEhG+Xutnh25aUtkbNzt9iNkvh5udrL99Y1a7e4SFaLhJ1G9tc5UUoQ3K+a63SvuJlMKLrs4yUiWncu1gtS1qdYJHUE5o7h4MMgl0my+B+GaO3VKtNklHLzg43TnKw6WZp2GtKNhX2/ik=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEdoMk13MHZ5Uzgxemo2Q3ozaDRyWUVUTXJMZmo1d2hORjFGSVJmQUM2RGIz?=
 =?utf-8?B?ekp3NjlObXdwODhpaEVPWi9lcGFZSTA4QXYrZ1pQMzcyc1VJY1NzenBqeDAx?=
 =?utf-8?B?RzFjN3RibUFDZ3BGc2dUVXRrS0h6YmV0bFdsTWp0ZU40VjFlNWI2NnZVdjJ1?=
 =?utf-8?B?MVB4eHZmZnd2U1drbUtLQWlBaEgxK2FoaDROKzhxRHZGZFVaMlFJejVNT0ZY?=
 =?utf-8?B?V3JsdDMzaWdJc2Z6UmhiLzRibnNKYnd6N2s1S1o5MXpNSnZiNzVBaytTenNU?=
 =?utf-8?B?bUJ2UHE3d0l3ZXY2SFF1V3o2RkNIRnQwRFhZYitTRE5IM0F1VVl1QlVrKzhZ?=
 =?utf-8?B?RjJkMmVGQnBNV0lLTDZpaERvVnBCOWdORVlIVVNUa3RyWEtTM0kwUytYcy9h?=
 =?utf-8?B?K2taVGhrVzUvSnhkVHZCV01RbHYxVEthd25ydEgraFRPVDF2RHk3OE0yazFw?=
 =?utf-8?B?ZTM3cGRKRTNUSThwMEcvZkNpYUxuVFFHNnZCbnNEek9YSE51Nktja0g1ajJo?=
 =?utf-8?B?TzhUMXI5dUYya1lZVkgyTy9XZ0IwUzl0WE96ZTQ5Y1NLYTRLeHNtL0FFSXdj?=
 =?utf-8?B?c1loaHNTSHkwYTBTMEJzZ08xZmNtS2x5bzUwY01wR0VOSXUvZW9qaTJCMTB2?=
 =?utf-8?B?MDcxYUNSTFhwUUx5VFhZcjczbHd4YXNlVFV5cUpZRGVVR0JoWGtIelFNY2ZR?=
 =?utf-8?B?d1ZkU1VjdzdZV0wyYm90ZlFkdjBhSERvdlpNaU9ycVBVbE5JOUtpci80dU9q?=
 =?utf-8?B?eUpQZ3hpWWRpQVYxSVplSTNNaU14ckk4ZW81MDFuRWpwdGdQMTNERDVuR2pF?=
 =?utf-8?B?UDZZWGdQa1kwSnk4QjRHYnlmZFliNXJyZUtNQ0l2L2E4TnNJdnNxeksyNXYz?=
 =?utf-8?B?NEpRNFpBQytqR0lOcXNkZnZmNlZjVUZ6MmZZMGZrV2FZMnVpZGhZTGhJRHBm?=
 =?utf-8?B?SXRaNnlnMGk2dDVBRE1HaXlobGJWVEY3UmFWV25DVlZxUzh2UUlsMjVwRDdp?=
 =?utf-8?B?WEtnME10VlE4bTQyWUFVdU9aOCtEMGp2SGJOV3pTYU90TUh4R2hqOWsvWnEx?=
 =?utf-8?B?QytmeDQzUVlTSDBRcjhLY3dWQXZGMFJKZ2NGcVBiRmUyRkNORUxLcldBMnV2?=
 =?utf-8?B?OWRNc3FoTDR2T0JUeWxwWGFEMW1Td29MRVRBM1JSR2tQK0lhSExtZGE0R3Yz?=
 =?utf-8?B?WUlsdTA3MHUvUmRUVWZMZ2wwWWJIUXVIQTVvSzNHd0IwcHgrdEMvdElBaHlF?=
 =?utf-8?B?bU9MR0dYbmpXaDlrSWxCempCMVIwU2lHYzhKM2huRlVoMldvR2NtZTFQQm05?=
 =?utf-8?B?aVhFSk1CNWJGejl4OGNwM2ZSeHpsYUkvd1ZGRmloWDhFcUlxZ2ZHYTU5NmYv?=
 =?utf-8?B?QTFubnlSSkRNby9hRVorRS96ZUFyM3hXSkplbFZMMmdremI5VHhzclp6VDFH?=
 =?utf-8?B?THNHTmIyWGltZGdSVi9ZUER1akNJUXpORDhsSm1SVktDdjU3TnFqSlh5cXZQ?=
 =?utf-8?B?dkF3Z0JwWElMZTRUVHFlWkdsVkNzb0k4RzRFMU0yQ3NVWGJCSTNLaGlhOXpu?=
 =?utf-8?B?eGRJUVNDR1k3ZEFSUGIvQ2F0eWZKUVNYeWVKNmE1cER0RmhxcU0vNGRLVWp4?=
 =?utf-8?B?Z0pmSXl6UEpPSXdXK3Q3RC94YmlEYzlTNTlrYVNrN2c4SzFkVWdlekcyTlhj?=
 =?utf-8?B?MjlsSllJRXM2TnViN09SUlFtaUtXMWhCLy9tSkY5UjgybU5qWkhiUlBMb3lV?=
 =?utf-8?B?eEdSREVVSWtuZnZBTUgrbFREbC9UdnY1Rkc1bmZxcVp1WnpjNU55dlVTSFZa?=
 =?utf-8?B?bjhqam9BSWYyclFsWnhnWDZsdzVBNVpkU1Z5YTlCMUtTcXprYnMydnZBTG44?=
 =?utf-8?B?YmJ1ZFVZTVF4ZGRHa2l1OTIrSGZvbUFMTEdXV25qVU4yNDhZdWRIaHJ3TXNV?=
 =?utf-8?B?UkRwYnBxcXlxeG1TOXgwT3RHUzAweW1XT0dKaWpCV09ZNWJUdjZWRk1WL0lp?=
 =?utf-8?B?SGNtSU1JSTR1UEVCU0p5aFlLcUNjL2o4TmFpUjUvdXp6d0owY0o1ZG9XTHZn?=
 =?utf-8?B?ZjdKcS9UVFZIMjlSUWdsZFlFQVpvYlluWCt5QXdmalJZZm0rTWhPb3h5Qm1D?=
 =?utf-8?B?Z1pyclJLRS9LUDAyTHB5ekNLQVMzVHVucEtUQUF0K2xBNHpHbGZoMlp4S3U5?=
 =?utf-8?B?akZPNmpWdjBXWjhFaFp3UjZOK3hQMUM2ZDVqUlNJNS9zaW9sOUxNeTZta3JN?=
 =?utf-8?B?eFdNMUJ4Mkc1U2o3RmxTVjNlbDh5LzhpT29sQXdtVlRDaEZ6SXppWVd3RzEv?=
 =?utf-8?B?d0R6TjJJN2JaTFMzcUhiMk01RWl2Mmhhc3NRYXhGTVRKRjFaR1hGdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e40d9aa5-fde0-4777-3036-08df0a7252ee
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 10:50:24.4627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WygajGKEu6BboiAXz3cc4lvtOTK/xTx9eCFl19o1+ePqu8ZSw2Ifwlg6jezIOs2SmJYdn4Vd9DgtMBtn9NbjHN1hWnGiZkolp67kPH/aWU4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5284
X-purgate-ID: tlsNG-ebf023/1788519028-532CCB50-CF2EBEBA/0/0
X-purgate-type: clean
X-purgate-size: 1199

On 03/09/2026 1:16 pm, Bertrand Marquis wrote:
> Hi Andrew,
>
>> On 31 Aug 2026, at 14:19, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>
>> PSCI v1.0 says that x4 thru x17 may be clobbered.  PSCI v1.1 says they are
>> strictly preserved unless they contain return values.
> I think the PSCI reference here and in the rest of the commit message and the patch
> should not be used and should be SMCCC references instead (which would also be
> more coherent with the fact that this code is not PSCI but SMCCC and is used by 
> others than PSCI).
>
> PSCI does not define the preservation rules, this is defined in SMCCC spec and we
> have a way to detect the SMCCC version.
>
> SMCCC defines the following rules:
> - 1.0: x4-x17 have an unpredictable return state.
> - 1.1: x4-x17 must be preserved.
> - 1.2: x4-x17 may additionally be defined as result registers, otherwise they remain preserved.
>
> So the commit message and comments should consistently say SMCCC instead of PSCI.
>
> Other than this the code is right i think.

My apologies, I've clearly got confused somewhere.  (This is the first
time I've ever looked at the SMCCC spec.) I'll adjust.

~Andrew

