Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1367CD98E2
	for <xen-devel@archiver.kernel.org>; Wed, 17 Jun 2026 10:30:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1340018.1601023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZnWf-0008Dt-FW; Wed, 17 Jun 2026 10:29:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340018.1601023; Wed, 17 Jun 2026 10:29:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZnWf-0008Dm-Cb; Wed, 17 Jun 2026 10:29:41 +0000
Received: by outflank-mailman (input) for mailman id 1340018;
 Wed, 17 Jun 2026 10:29:39 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wZnWd-0008Df-IV
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 10:29:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZnWc-00FEqx-VW
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 12:29:38 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a32770e-2eae-0a2a0a5409dd-0a2a45018fea-12
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 12:29:38 +0200
Received: from [52.101.201.60]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a327710-c1f2-0a2a45010019-3465c93cb8e6-4
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 12:29:38 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BN9PR03MB5963.namprd03.prod.outlook.com (2603:10b6:408:134::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 10:29:35 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 10:29:34 +0000
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
 b=goTgFrH+3Gzi/ANLBcPEiT1DwsUoGHucmnKPrNW1bc5D50DVKNLOc0jkCvxDpKGB/Gmm47NLnqnwEGaFCkecm5FybC1LS5LrzJdSZucs1vFpqhSEhq06vX53zriM9w88P2fyXkPEobDtxyFJl1s2Hor3fFo6jd/cx70LKEzlsCwoRDqZWlgAj5TI5bllzUxPdEnbenyfBGCTkSkDwKNGYIReMbnZjZ/Za/I/D0jAnYZ6JJSe5b4DkNKkTyLK9HRaYSoHrZxIdGmoJYid2ZnR4zYDxSW+tbd2I1fBCW5fTMJYVpVNIPxQ34L9szxqi736dEpGSkatP7sWSrEsV/ZcsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ogkkzmv9tABuuD/jOrFMsFJivlC9jm9uL0WEnEgyPFw=;
 b=mrpjgHVaHXFjbzD4Xu2O+97xHzUrtIau74dJVk/GiRKJEnsaeAVh1xi4NgyzmHn5EM4EE0BQlVHg/KA9oJJ7dBqwGy+OcvCI9HW+Vz+MHev1LlMTgr1iZQSaLQ6Rf3KxQWqWAAVZSYvKIR8kaf1aN0P6QM7Vioe5NA1RXbSgFFFzQ9bANebtvqaaxNP29Am+9eh0EEd4ZCBVv1Rkijv5BgvHG2ahaUlja59f5y34wMUp6JGAruGv9lEHWpuQImvucWvykKdSroa9gT0WLre5hHTeKN9ATrUMntzd6Bpe0kKJG0nTUkxoRUR6EwdVOVCLVgdxRkakqfjYx1Qrovq7MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ogkkzmv9tABuuD/jOrFMsFJivlC9jm9uL0WEnEgyPFw=;
 b=f7uPcWTM/ZWP0MwHYhk7y+gKHHk0304sigQTDOltBV1z3lwHbVjwehcqoGU86lNQhz3sY5MNXox00ZJ0S8lqIV4w+cyao52I+nt2aFvWtfy4XeRJSv8rZZxGpU7K428GD4B59rNkgpYJECHwXpclADHhjCp3ehPaTxoWGxI+Cs0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 17 Jun 2026 12:29:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Marek Marczykowski <marmarek@invisiblethingslab.com>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.22?] x86/EFI: arrange for non-discardable .reloc in
 xen.efi
Message-ID: <ajJ3C40FLsyBZn-U@macbook.local>
References: <652b57e0-42f8-47c8-b94d-df862874aba3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <652b57e0-42f8-47c8-b94d-df862874aba3@suse.com>
X-ClientProxiedBy: MA3P292CA0028.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::18) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BN9PR03MB5963:EE_
X-MS-Office365-Filtering-Correlation-Id: 50f49ce9-6f11-486a-9a29-08decc5b5368
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|3023799007|18002099003|22082099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	dXpVFL0+jrWZFj0mPzjDoxb2U6BN8CWIjmY9g5qNiC4T7Wd6HFrajVJb9tBvLQIGQ0aFfY1E9GJGroRluPs3GPiov0UVbarWJAZzj54oG5oZQpa34DkszEEYaT5nq/SkGEezWeSswjMCebR4ZU3yUo0a/gmAGMQc+FGb5tkaZ1sn1W6iubbf7Z4pmig1pan3+KehlyMP1l4ocb4aJKGTevO8N9MszSRETcpLFAelb9S+WNwXKqSlyDcH503K/tviYgBTNz+3Bz90vX6LkOG5d5nnbxIbRrgnmGkIMxN7hVEeF6epmZ7B8+clTlEPNzkzOiVMtuppc+iFItV8wKxpDL+eyX52Gp4j78ZdFYfcocu/lWe0aWaNmR/DSo2xRDtAyW2VU1VOobpgHcWqRBuzU93fj3UCKNbmcKV+YMvTc9rQJc3EAJVQ5JH39cKcueOZYEXXSVsxYvCMhaiS85fYzLxPHQFHL02SLoChZ+wlFdcLYD3P9U2WIwJj3XYZqokXloW7xJR5puNFdPs1PJ/UIGqbFkTuMqpq9Y+i1ko7Q/FhyBJFaqkCKmk6ZdQ4gK4f56Pqd7WnrtdRXpHS7acGQZGI75oZRalg2KnJjq/yZ46gHZj1W+q/TriT0hJjNUTfk0KABeRW7J7kRMKY7Dn35hdBsoUB1r70kP0eDGirV2DaIFBu93ZBx7qkR0Xv+PoJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(3023799007)(18002099003)(22082099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ni9KUUNlUFFKdEw5MGNxR05STFlONXppS2N2WlRMQlp5ZkJySGNhR0JBeElH?=
 =?utf-8?B?RHVoOGlhSkJIWFB6RHpzWWlralFDUlpTL2xGTHg4d1ZZNDJZa2RmNkRnK2Fr?=
 =?utf-8?B?SHZubjFZVkJLdjhmQm1jOFBiM0c1RSt0ZFAwV3VkU0kwR0ZvbUZqNG5MaTBZ?=
 =?utf-8?B?RVVXYTVLUjIwWVhCbU5zak81bllzVWpkL1ZHVHJOSUJvaXNVdzZPSWNOdW1u?=
 =?utf-8?B?emhJRnRmZDFYcEZON1p2WmJzYStsM0hRRGlSd0Vvc0RUMFJLN2c3NzE4Q2Ew?=
 =?utf-8?B?ZUxIQjhFRU0wWEl0QXBnSWEwYytnajkwbldWN2o0YzMwRHAwd2JaaGdQN0FF?=
 =?utf-8?B?MnFXOHJvc3FQUXpUQ2ZWamZ5eFMzREwyNFE3eEw3UGxHRHRXVy9uRDBRZk5F?=
 =?utf-8?B?ckZqOE8zbTJNWnU5aGQ1bEt0SWR1ME5mSnBLVE9UWFg1aW5kT2Q4OWNieWV2?=
 =?utf-8?B?akZReWRHQnhieUZPOTRkMEViSjFRV3E5K2JtcTl5bDZkaXpiOTdZNmdEMVVt?=
 =?utf-8?B?YlNSKzk3VUhlYkFML2w4d3J1Um1adUhVVjkrVEFxbGFqMENSYm0vNHBPdHJp?=
 =?utf-8?B?MHU5bWdJUFlJRm9XamZXbVVPMWtRc3BCWVdoSU1oR3pMUHNNcEVrSGRvc29B?=
 =?utf-8?B?cmlYSHlZd0JDUlpGbDBBZnpJT240cWtiSmoreTRnMjRwZ1dzVHRlL0JsVmpP?=
 =?utf-8?B?bElRYUJSbmM3cDRuQXdybFROcTU0NmV6TFo0cmpJSGRqTC9WZWpwQTlyWVl6?=
 =?utf-8?B?Z0lyODhKNWMwdzlmQ0ovaGNXeFY3TUNEQ2E4YXd6WmRGUXlSNVFyT2FtRjNx?=
 =?utf-8?B?WUI2Zml3eUVIMHRtYmEybmtsL1BBQjNoRmRLYTJjOFFGUWhMUTArak85TTZ0?=
 =?utf-8?B?UkJTM0d5am9nUG1QRHh1c2hRSlpUNGdHZnIzYXJwcFY1SzE5Y1QxV3Z3K3JK?=
 =?utf-8?B?RXo2THZETi9xMU5YVktVMk9DZU5RdUt4U0JZZE5rOUdyaFd1WENHemJzd3NK?=
 =?utf-8?B?bXU1c3NjUUtFUFF3N0lVaXNWVkhiTkJtRUt3Ump2UUd4MjdRVGhZL01QUW5l?=
 =?utf-8?B?SzJEcWUzcHhLRm1EVXpNL2ttN05hQStoNUExZEZUQjdIYnh6cDFJRVc4cTRL?=
 =?utf-8?B?akNvRHRJamRMQnUycklKZnNnUW9teTllT3hZUnNtS0FQN0ZGMHlJcHF4UmZl?=
 =?utf-8?B?aUFNd0U2REJVQWVyUzQ4aVpEZTMwQTZWcFBOVjNPdHppZDZZVXdxT1BOaUQz?=
 =?utf-8?B?cTB3WjdCNjlqdnM5Ky9uUXdKWkpBdkttait2ZXVxQmNLSkduYXIwdWdsbHhJ?=
 =?utf-8?B?Mm9RVFd3ZHVZUnlJN0NLRC8welNzYWJDYTVaV0QzazdzaU5sUWo5YkdjVUsw?=
 =?utf-8?B?Q25iQ1I2RjJobmtrcmpmSXFCK0x1SXJkdTdLcU5JOXdnZkF3RTdKbFBmcHBL?=
 =?utf-8?B?aGx3REtnUTdhYlFTK25mVTFkVFg0ajY5S21lWDB6UXQwbTdxS21hK2tsNWRF?=
 =?utf-8?B?emhNMUVlYk0zNzg1M1JoRlJnem5DSHVtRG1rQnBtNktONG54am9YRUpVbXpY?=
 =?utf-8?B?Y2V6YlluK0JhRHZrMTY0YU5JbG40SXNOemRycExuMDJ3RW5oMUNCSlBScVlo?=
 =?utf-8?B?S3Rsa1c3YmJzT1FTc2NHWEM3bExZMGVHdTIrYWpmYWp4UjlsTFc3MFFTTlZm?=
 =?utf-8?B?OXE1N3Zuam9IRFp2Mzh2M2R4bm8zZFYwVTdlZkdYOXh3L2xRQVVHMllPaFhW?=
 =?utf-8?B?b0NiU0ErYTR4OTNZRkp1Vk5ZYmc2SFlMaHluYi82b28yakZVWlVDcklaU2Ez?=
 =?utf-8?B?a3ZOUjBYV1g3VVFnc2V2TVI2eUZRTTVYbEVDSUxUejBIaTA5K2RiS3NjTmlH?=
 =?utf-8?B?RmdLanN0S205Rit4SmR4U3ZmdHFmZFo4dzg3L3A5NW1Ob2RCak5wM3d3U1Nv?=
 =?utf-8?B?R2xKVExDTStRM0VkbmhqUHBtanN0WlIwRjFCYUl6UzhLdU1na2hZbE1lSE1x?=
 =?utf-8?B?NXQ4TlZVR0FXU082UUhPWU5QNVlpODV5UmZIOEJxRXppQjM1WmUwcUZ5UmNa?=
 =?utf-8?B?T0ZXWFNGS01TdW05bEgyNnRYeENadTRDWk92RXEvZWF0S2RyVUtrVHZpUjNz?=
 =?utf-8?B?UkJSWnVhNXJmZEFEb1llRGRZaStraE1scXEvcU94STZjNzY4eTJUTC85Qkpm?=
 =?utf-8?B?STVsbW9yT1BGMmx6TGFHVStTS0pNQ3hPRWZGczJ2Ni84a1B0OUtQbUI4dERu?=
 =?utf-8?B?clVSQVlveFcvQkpZRUpmK3U4VHBSR0premRJek8zWHNaTkFuTDdDYTQzbURG?=
 =?utf-8?B?VmgzWlNXM2Q3MlVRekFocXMra3BBR2JoeFNLN0U3UXJJRXkrbjc5QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50f49ce9-6f11-486a-9a29-08decc5b5368
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 10:29:34.7964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Xgh4lbJZQSd65vqv1TKes8R2VTV47/P5c1NuGkg73TGhQopySBkoeXA53NCx5OZkLNO+Q1Z31EJEssoqf8ekg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB5963
X-purgate-ID: tlsNG-d62444/1781692178-B7754FF4-D4A382FE/0/0
X-purgate-type: clean
X-purgate-size: 810

On Tue, Jun 16, 2026 at 06:17:54PM +0200, Jan Beulich wrote:
> Loaders respecting IMAGE_SCN_MEM_DISCARDABLE would not load such sections,
> yet we need to access it ourselves when switching out of "physical mode".
> Leverage behavior new to GNU ld 2.46: Any contribution to .reloc which
> doesn't have the discardable flag set (which cannot even be expressed in
> ELF) will yield the output section also non-discardable.
> 
> Since for intermediate binaries we don't care about section attributes,
> link in the new object only on the final linking pass.

I'm not sure I follow.  Xen already does generate a custom .reloc
section without the IMAGE_SCN_MEM_DISCARDABLE attribute when using
the mkreloc utility, and hence the .reloc section should never be
marked as discardable?

Thanks, Roger.

