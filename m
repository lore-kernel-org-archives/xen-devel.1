Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66887CA5FF0
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 14:20:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440902.1658423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDjYQ-0007Ka-UV; Mon, 05 Oct 2026 14:20:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440902.1658423; Mon, 05 Oct 2026 14:20:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDjYQ-0007Jh-Qk; Mon, 05 Oct 2026 14:20:34 +0000
Received: by outflank-mailman (input) for mailman id 1440902;
 Mon, 05 Oct 2026 14:20:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xDjYP-0007JH-BS
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 14:20:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDjYO-001sgZ-3k
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 16:20:32 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ac3b223-bab6-0a2a0a5309dd-0a2a4504a952-26
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 16:20:27 +0200
Received: from [40.107.209.36]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ac3b229-b57f-0a2a45040019-286bd124311a-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 16:20:26 +0200
Received: from BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13)
 by CH1PR12MB9599.namprd12.prod.outlook.com (2603:10b6:610:2ae::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 14:20:19 +0000
Received: from BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740]) by BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740%3]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 14:20:19 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AbORgdSLavhhKbtCoYIXW+rVSiyaZEe0Q7wNs23J++T74zHPu/2ICt9diLOj1/W2ulkYSpbKTVhpukowLmB2VhPHCsRa/BtJPgca3JGGZCRpzX4I+gISRLHetGq648J83/aSRZCOCjZ7ZgnzTICxIXJYxs6+HHne/Mw0osiAcRLDsaIC0FBCOmGqpbUL+UE2gB0Q88hvTUZFD3N+Xy9MSzL5BEG9Rqh/vWSVA8uOCCUKOTlu9KckYU+li4/QLen/oNqfKXB2L29HQGDpR4dw17ZZLBAIJtbh4abVebQvl5W7bhdpoxxlgsYtm5G0xWTydPd0tbsBvkT7+mkyK3KH4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DdkQ090/RIKRtGEm0ll0/tOCZWXQzYWVSGBNfJ/gW/o=;
 b=OFoGPfrDIkIT6ICi4cjet6f3724OukIcpu1ksIy2sqnhO+smf18lIYGoMzgFKaGVdbNwBAqAdBFrXC8oAJU98l4/ZGqJzmaG/dxuSoJmHbn96pebtCZEFO3mFRHXqZgX3CYP5FL53J0EAVlUg/vUqQNPhVKjFBFzdp6y5mYh37v7Wj3ojWWJPqHqcgkGTFFVqIYwe8ulbBOAlkvL9QICZ+h4ZhOdkQUA7moHFWXxCretngWcIOVhfimKtLfWK7/Ivm3YE9VDEf1M1BXWB0M8SePkqGOuu+ngRtrqVGh5PBX8UOXcDn3zjiOd0nzP39LFeSn2HAmH96n9SA/jL00Dlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DdkQ090/RIKRtGEm0ll0/tOCZWXQzYWVSGBNfJ/gW/o=;
 b=mMva0xf7V2RzqdRi+n1WbrvDrpJkWnaIG6QKd1xqS9Wt8bH+Y639SkLtmRBPB/eoGRjWn0Y5NpH+MyVBTI9MkG71tHOgVlhdUcuPsWvRRPpk7Tx27KlxsUR5iJprbmILjBriJMTpW6eNRkvA1gHWLJm/LURv/jdBPHePSZhmneI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 Oct 2026 16:20:13 +0200
Message-Id: <DLWYYGAQGOU6.2X2IG1IN1XK5G@amd.com>
Cc: "Stefano Stabellini" <sstabellini@kernel.org>, "Julien Grall"
 <julien@xen.org>, "Bertrand Marquis" <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
 <dpsmith@apertussolutions.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, "Michal Orzel" <michal.orzel@amd.com>, "Jan
 Beulich" <jbeulich@suse.com>
Subject: Re: [PATCH v3] common: dom0less-bindings: introduce XSM labels
From: "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>
To: "Sergiy Kibrik" <Sergiy_Kibrik@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.17.0
References: <20261002102521.565675-1-Sergiy_Kibrik@epam.com>
In-Reply-To: <20261002102521.565675-1-Sergiy_Kibrik@epam.com>
X-ClientProxiedBy: MA3P292CA0056.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:48::14) To BY5PR12MB4999.namprd12.prod.outlook.com
 (2603:10b6:a03:1da::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4999:EE_|CH1PR12MB9599:EE_
X-MS-Office365-Filtering-Correlation-Id: 128c1e92-71c1-456f-7919-08df22ebc759
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|6133799003|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	5Y1rPGA1VWpBw5F6odOcpJY0u7o/TirI/5lXyojq2XOhMx3h3TbJqPTFrLqD4OAkHB0ZdmOd727DKOOA42HJ3/n6WU/Tl1UoCYg1LiMnLwUy2TuNBWTYSudYVtCUEsZak9E9iqsaFTh1PVxumZdhywF6mBdC+2wlkg87Nx8plQfPTRS6nmbIq2hL7xpa2BP1EgRCzh1Gj0N4YeFWAiTyDOQLVLfiffpNm2IsVikMhPJvTKWt7TheqgSSTwnwyLQiGZOkUCf4LxwslnbiYL9G3i2lid0G7PGZ9dhK+EP2qq7UH+W0qqYZzjzZgFYewSw+MncjlLZ6Umrl0sVByuamydC7wiXWheY+YUj/GWzn2YpenTfm98CuTO1edzXEfcOIP51pmnT4AZgGUe3rboH2CHTIiJUJzn090GqDss9dV1FNggQAclc6RkM0VNBErxFSD3OOsfDSFH6T7oWvnkQyUhSpm9OmwMGoG49d2H8BJCNqi/dfUyEvgk7swwm7z0f8b6AiprwYIvbDXZT90CwzypDBYShiaH7Jh5oyYxJ9iU9oaFg98ugqKl/4skRHAYxM/blWmPqPqyqxUk64hGUiUEtQ6mZYHxXG+pNtV8iYTyq3q0sm+R2TLTpgpg6xOJgP3BgQZ5LyIpRi5f/84bXHiVwkpy53yJOI3aVJkuRTGrg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4999.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUcxV1BnZGxnakVFT21obU1uMDR2eTBYTmZOeUJpVk5RWS9XMGVqazhGWVZS?=
 =?utf-8?B?d2lneUNGSktDcWluNSthMjNubG1hRThpVjlBaGMwTDltRE4yNEN4YlJpdng2?=
 =?utf-8?B?d28rK1BkK2R0QVdkcWFlVmdqUm9GNGt4UmV5a2w0TG9MUmxhNUJkVWFEdW9L?=
 =?utf-8?B?dy9NWTZFL3dOT2Fhb2RkYndKcENiTHlFYUZybTBpSVpFTXh3aHRuVCtKVlBs?=
 =?utf-8?B?UlpDajd0QS9kOG9sdWJ6cC9pbUZFelFsT09TSElWMGpya1FLdThodmljOG1x?=
 =?utf-8?B?S0RIcG85cXZUa2pVRklHL2NpUEw4NyszUkl2MlRKYmMzMmJ5MVFhUFhVaC9M?=
 =?utf-8?B?cWtNVXZ2eVc4ejVldmoyWlBtQWpUT2tjNERhS1VQekNoaTVWd0RqK0t5NUVP?=
 =?utf-8?B?UEJRWGh3MlhGUW1nZU1tVlVYRkU5QkVXOWtvOUU3L1dWODJZbm1NNDlrT0c3?=
 =?utf-8?B?NmNYUzhBdUQyZ2ltOVZYNlhLdmRmTWlDRzhMMWV6K3ljL3dhd0krR0lldXBP?=
 =?utf-8?B?cU9neUkxemxQaE1BRnFhZDZKa1R2R003R0c2cFMvc0hzK3pCaWF6TEwvVFEw?=
 =?utf-8?B?S3c1c3BmanlqeDR5b2tSYUxqN29lbU5XeWNKY0FxVHlNNDlmU0VTVUxsYk52?=
 =?utf-8?B?Y1NETmJCWU1TSXEyUUkxOXZ2WUVZYVJBK3NOWEc4NlZaY3FLbGlsK3pZTUww?=
 =?utf-8?B?Tk5HVUtGWTRnRk9GcjgydThvQUJKNnRNcmZHc00wQlZXT2RmbURmVXNjS2RL?=
 =?utf-8?B?MXZLd3VoK01HMXJIbGhnMmplVXpnUFZ0SnBRSHFpU3QzSnovQndwRjVzMHd3?=
 =?utf-8?B?RUdtNFV6eHBxTmRicmRYZUlQaFFkc0t4N3U3b3kyRFAxTUVsY2lRM2NNaDNZ?=
 =?utf-8?B?NXRKUFlacFVBZ2NIQ3JXZEdRZUZoY010TVpsT1o4RUprbVZIeTMwY0lTQm9L?=
 =?utf-8?B?MmdmV2lXM2d5Nm1Cdi9BajFRUjNZNFozd2ZqYmtPbXhrZ2tjL3l5R3pIbVNF?=
 =?utf-8?B?ZXpOMkhUMWNPQkpaekhndHM2b2ZqWE1zQjZTb2xjZkpuZXlQTXlCYUxtTkFT?=
 =?utf-8?B?NjJGaHdTYjNHL0NEbTdrOEJENHRvZ2RyS0U4cXpPbUFEODNSc2JCQ082ZndB?=
 =?utf-8?B?aGwrYTVZR0NuUmVWSEpnOFVlYnM4L2NxazRyd1BBSEMwSWtGcmZSYTVJbUgw?=
 =?utf-8?B?MGlnMWhKT1VLSWFXVXo5K2swbkxZTnk3TXVVYm9hL1FoYUMvcDZEanQzYzJM?=
 =?utf-8?B?bkcvOWxWQTJsZ2tWMHpGZWdzejZmYnJUMGgzNzJ0SEtzQndDRDljd3k3SmRi?=
 =?utf-8?B?WEtQTWQ1YnhCcG9PT0lxSzVscFQ0QjEwd0t1VHlOZVlYTmtqcjRucGZvOHNz?=
 =?utf-8?B?Z2g0YmNOdi84TUZWbnJCZ2ZYbkFaUmdtZWQvRmMzTDZYeU5qOGUvOTJMWEFz?=
 =?utf-8?B?STJwT1FzR3NTbTR3a1E2ZEhRZ1lSSXk4N0czK1VwZ1FmZHBadndqS1lJQVhH?=
 =?utf-8?B?bUg1bDdiWTVkZzBmQUl1QVhTTHFMbGFtQ21GQ3ZLcTI0UkJCR1BlT0I2ODlr?=
 =?utf-8?B?NHViK1RLY1N0Tmx3Tm5ZZENxaDRlcExaWnQ3a1huNlVySzMzUzUrQmpjeXZv?=
 =?utf-8?B?ZXA5d2ZEQTZXcm9pWTY1LzF1M3ozN0xBN1NzZVRpNUhMeG52UjY4a0NHTHVw?=
 =?utf-8?B?ZjdDZmVHblcwbjVzakI3M0FVdEMxR090RWpjZ1htVEp2Um1GcTJhT0lZS1Rv?=
 =?utf-8?B?TFhNcGtRYWdGYytTdDhua3RMZ1psUEtzT2ZSMDgwaUwvK2c1QjJLcWpjZkY1?=
 =?utf-8?B?Y1JEU0hjMmV1dGQxSW1Yd3FtWGJCN1F2bGVOa0IzNVJJRWFTTUdEbDMrbDFO?=
 =?utf-8?B?b0pCeDVYUUljOXBMc3FwNTBSLy9PMVhyNkQ3NmFhczNrTE40TnBFMXlMcmFR?=
 =?utf-8?B?c3ZUQmNGMis2S0NmZFI0cEZyQklFMDF0Sm5udXZ4TjFOTlpTaTl3c1BjMHc4?=
 =?utf-8?B?YlEyeHZwOEVwQ2lxd094TStpRzY3S1JvclllY0k2UWFDakp1aGdZdVlNQXJV?=
 =?utf-8?B?TWZJZFJWZDdwaDZ6cDBrK1dqRlFLM3pyaVV3S0hZZ20xUWtSTy8rRWRaS2ww?=
 =?utf-8?B?M3Q0b0JRbDdCUUkyK1YxQXlBWlRiQ3VLMGY1L08xR0ZUbmwvT0J3ZUFwamtl?=
 =?utf-8?B?NHRlRzJEUk1hQWp1T0hWZUhrU2szUmJpY2YxeUZGOEVxQnJTSXFFQXRsVjhG?=
 =?utf-8?B?aGhxcnpwZVpqRktLWFFMWS84Tk8ySzY4VmdUVjYwY0c4ZnNxTmU4Rzh4TStu?=
 =?utf-8?B?T1c3TzQ1aUlVMzRYekpVWUZiUmFTYlp5OEdUakRmZEFsM2k5YldSZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 128c1e92-71c1-456f-7919-08df22ebc759
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4999.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 14:20:18.9155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U10y2JKJAD50vA0f0KL72kG4rHw3tu0Bn6TOBHn94LH3Sjjzt4FCCPftf+AgbOjRvRNfFEsYVgiSxoN06iyM7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9599
X-purgate-ID: tlsNG-ebf023/1791210027-C04DBB50-2CD332C1/10/78276251493
X-purgate-type: spam
X-purgate-size: 5667

On Fri Oct 2, 2026 at 12:25 PM CEST, Sergiy Kibrik wrote:
> Add "seclabel" property to be able to specify security label for a domain
> when XSM Flask is enabled, similar to xl configuration files.
>
> Currently guest domain can't be created by Xen in dom0less configuration =
when
> Flask is enabled, as domain is assigned "system_u:system_r:unlabeled_t" l=
abel
> by default, which Flask denies to create according to current policy.
>
> Because code from outside of flask can't directly execute its internal AP=
I
> a new routine flask_context_to_sid() introduced as part of XSM API expose=
d
> to rest of Xen, which is a direct wrapper for security_context_to_sid().
>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> ---
> changes in v3:
>  - panic if `seclabel` property found but FLASK is disabled
> changes in v2:
>  - add & use flask_context_to_sid() wrapper
> ---
>  docs/misc/arm/device-tree/booting.txt      |  7 +++++++
>  xen/common/device-tree/dom0less-bindings.c | 13 +++++++++++++
>  xen/include/xsm/xsm.h                      |  3 +++
>  xen/xsm/flask/hooks.c                      |  5 +++++
>  4 files changed, 28 insertions(+)
>
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device=
-tree/booting.txt
> index bcb06bc796..d04455b744 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -345,6 +345,11 @@ with the following properties:
>      not passed. This configuration requires static allocation (xen,stati=
c-mem)
>      and direct mapping (direct-map).
> =20
> +- seclabel
> +
> +    A string property specifying an XSM security label to this domain. D=
omains
> +    will be classified =E2=80=9Cunlabeled=E2=80=9D if this property not =
specified.

This paragraph assumes FLASK=3Dy, but many configurations of Xen do not shi=
p it.

Perhaps it would be prudent to state what happens (kaboom) when you load
a DTB with this prop on a FLASK=3Dn hypervisor.

> +
>  Under the "xen,domain" compatible node, one or more sub-nodes are presen=
t
>  for the DomU kernel and ramdisk.
> =20
> @@ -422,6 +427,7 @@ chosen {
>          memory =3D <0 131072>;
>          cpus =3D <2>;
>          vpl011;
> +        seclabel =3D "system_u:system_r:domU_t";
> =20
>          vcpu0 {
>              compatible =3D "xen,vcpu";
> @@ -453,6 +459,7 @@ chosen {
>          #size-cells =3D <0x1>;
>          memory =3D <0 65536>;
>          cpus =3D <1>;
> +        seclabel =3D "system_u:system_r:domU_t";
> =20
>          module@0x4c000000 {
>              compatible =3D "multiboot,kernel", "multiboot,module";
> diff --git a/xen/common/device-tree/dom0less-bindings.c b/xen/common/devi=
ce-tree/dom0less-bindings.c
> index 41d72d0d58..01d5cc1bc9 100644
> --- a/xen/common/device-tree/dom0less-bindings.c
> +++ b/xen/common/device-tree/dom0less-bindings.c
> @@ -11,6 +11,8 @@
>  #include <public/bootfdt.h>
>  #include <public/domctl.h>
> =20
> +#include <xsm/xsm.h>
> +
>  int __init parse_dom0less_node(struct dt_device_node *node,
>                                 struct boot_domain *bd)
>  {
> @@ -21,6 +23,7 @@ int __init parse_dom0less_node(struct dt_device_node *n=
ode,
>      bool has_dtb =3D false;
>      bool iommu =3D false;
>      const char *dom0less_iommu =3D NULL;
> +    const char *xsm_seclabel =3D NULL;
> =20
>      if ( !dt_device_is_compatible(node, "xen,domain") )
>          return -ENOENT;
> @@ -141,5 +144,15 @@ int __init parse_dom0less_node(struct dt_device_node=
 *node,
>          panic("'llc-colors' found, but LLC coloring is disabled\n");
>  #endif
> =20
> +    if ( !dt_property_read_string(node, "seclabel", &xsm_seclabel) )
> +    {
> +        if ( !IS_ENABLED(CONFIG_XSM_FLASK) )
> +            panic("'seclabel' found, but FLASK is disabled\n");
> +        else if ( flask_context_to_sid(xsm_seclabel, strlen(xsm_seclabel=
),

nit: else if could be plain if

> +                                     &d_cfg->ssidref) )
> +                panic("Invalid security context for domain: %s\n",
> +                      xsm_seclabel);

bad indentation of the panic statement. At the proper 4 blanks from the
conditional branch, panic() fits in 80 lines. Fewer with s/Invalid/Bad/.

> +    }
> +
>      return arch_parse_dom0less_node(node, bd);
>  }
> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
> index 9809e005e0..73d058a8b2 100644
> --- a/xen/include/xsm/xsm.h
> +++ b/xen/include/xsm/xsm.h
> @@ -261,4 +261,7 @@ static inline bool has_xsm_magic(paddr_t start)
> =20
>  #endif /* CONFIG_XSM */
> =20
> +int flask_context_to_sid(const char *scontext,
> +                         uint32_t scontext_len, uint32_t *sid);

nit: with s/context/ctxt/ this fits in a single line, otherwise...

> +
>  #endif /* __XSM_H */
> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
> index d65ba0aeae..0b44a2a3d9 100644
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -2016,6 +2016,11 @@ const struct xsm_ops *__init flask_init(
>      return &flask_ops;
>  }
> =20
> +int flask_context_to_sid(const char *scontext, uint32_t scontext_len, ui=
nt32_t *sid)

... this one needs to be split as it crosses the 80 columns boundary.

> +{
> +    return security_context_to_sid(scontext, scontext_len, sid);
> +}
> +
>  /*
>   * Local variables:
>   * mode: C

Cheers,
Alejandro


