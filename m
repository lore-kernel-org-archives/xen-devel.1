Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87CDCC6B08
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 09:09:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446801.1662893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGYVW-0006nP-4d; Tue, 13 Oct 2026 09:09:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446801.1662893; Tue, 13 Oct 2026 09:09:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGYVW-0006nH-1O; Tue, 13 Oct 2026 09:09:14 +0000
Received: by outflank-mailman (input) for mailman id 1446801;
 Tue, 13 Oct 2026 09:09:12 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGYVU-0006n5-H0
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 09:09:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGYVT-001K5d-Qe
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 11:09:11 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6acdf524-2eae-0a2a0a5409dd-0a2a4509db3c-46
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 11:09:11 +0200
Received: from [52.101.52.18]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6acdf535-be1a-0a2a45090019-346534122730-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 11:09:10 +0200
Received: from BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13)
 by SA0PR12MB4462.namprd12.prod.outlook.com (2603:10b6:806:95::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 09:09:07 +0000
Received: from BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740]) by BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740%3]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 09:09:07 +0000
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
 b=dSxWjJNislUuScJEy+6UYweroQH6pNx7WL/OLyreXJPiqrOK/cCisPqt+EUoNFACmD21AR1I61jFzmE6CRSxDWtu/qS3j27YtF2hbzP7F5EFpHv8KRusx6GzZ3Oix3JrE0uUG4OCUFuVAayQuslpL31S9XgEk4f3wrqsYdmdazhRJ9zTeF5pUNdxQpfGChDcm6amchfbvWWWmzWpOyVVrXL05RbfIpnxwLbNDyfJmSyMFTcK2rfAzwINdoyqoLRnkSh+cFnVdHAOZQB10TzRk9bfC9QUKKkWLFzs8jL6glVtr944mPGF0ZiRroZH6lTP58wC9Vq/U1BtuONr5gaUoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vKsPSiNAJsut0sv62YQ7XV9ELK05TkGn7ktTCkdOCIw=;
 b=R8bt1f03HTBx3TCbs/pJueg/agKkeF7Ncw4gM40Y/iM0dCI8Cz7ewFzLk585XWxd6AKUpGmhvO4FjXxPpK316fqMtbn/BUuU0Usultlr3nb+faUifwH3GE/3IknS81fAQtCJOvixG5OOViBjLf2CaP2R2mWsRiOFOKRS2/hoeQXOzOQyY5izlb4JdjaOgR+7p31j9NIDZ/8rev4bgbY+ri6DkI+kWkyQzdRw2ZHWBHoN3zfgXsuYJ61aaxtw6yzCFmel0PDaX4CPPoGaVp8Sl5kjoDpk0APfVC68o0yjcSA04RIqJKxK86c49bqcyr8bQoWuyNZuPrBkjFJPnLVfnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vKsPSiNAJsut0sv62YQ7XV9ELK05TkGn7ktTCkdOCIw=;
 b=TZp0+hj/EbB1NUZPWyRtJ3R0v2CstBFl+U1wOaERxwLSI7BtDFISalQ0UcWZHuDmqKDHzSdfv6lF4jvBTSKCxSXsAgCShnmV+T0NKSZW3Bz7O50umdWisYzza/Y+GZ8Dr7JghEKkqBgtOxiZ5Gtpi/SmD4l+sU+7rN3yRy8dvqk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Oct 2026 11:09:03 +0200
Message-Id: <DM3LCK9H20XV.UWY7ZO59FMAE@amd.com>
To: "Sergiy Kibrik" <Sergiy_Kibrik@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Stefano Stabellini" <sstabellini@kernel.org>, "Julien Grall"
 <julien@xen.org>, "Bertrand Marquis" <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
 <dpsmith@apertussolutions.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, "Michal Orzel" <michal.orzel@amd.com>, "Jan
 Beulich" <jbeulich@suse.com>
Subject: Re: [PATCH v4] common: dom0less-bindings: introduce XSM labels
From: "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>
X-Mailer: aerc 0.17.0
References: <20261012101453.949907-1-Sergiy_Kibrik@epam.com>
In-Reply-To: <20261012101453.949907-1-Sergiy_Kibrik@epam.com>
X-ClientProxiedBy: MA2P292CA0025.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::9)
 To BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4999:EE_|SA0PR12MB4462:EE_
X-MS-Office365-Filtering-Correlation-Id: e2fd5fd6-20fc-4664-cc94-08df2909a2e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	AihD/mX6rj4YCfygwuQskKx8EYyPONluFbY0D0uIVqoq4Aw3pKGNTNcdaSk7L1NBIJ5UJE6sYNEsKhRPWL0N5M4rS5AaupjxybqTu1n4bRuPfQ4b3Ish65peeXuQmsFK8FzL0XZLpkNYOiWpehbdeMC6YT8Fv0BaMJbrv716pxZ+J5Rdhu1zh4bKCKi5b1MMnDALmtA2ikIFlvWLWOiEpQyIsdsVAz85qnK2el7T1Ly5und/yTjpVOq81U5SHsU90Ovvttnc1NLBJwaVLNaWRFeLW4k8gBOQ0hRmOwwCoxu7S6z83DCMr4On2FO+FTP+XJb1LEd69YvWQQ7RX31rsFShDtbrn3rHVCSY3zjZqZa9hSsPCZLkjh4uFEE+QwD0zS99E+Lwn+G6jxODwfjMvFMOP8Lm7i+gC5X6KcxEKhCq+vN5lW+KpQdnZMGX42dm6oHKoVScspybFD0iaph9a5MNZWbFXgD/Q2m0J8EZ0rglIdh2AUPiEKscvz8D0VNf+ePwKKyWnN/izqhCInCFgKkoe4idrAqnIa+Xqf3ds0/UcRcvaz+fknrzKspVbUSM/Nm6Wv/82E2IKU0pXDd6xBeSr3ggHAc27/O+dymaPSu4vN7WP8NvLvpfmq/iaio0CWrkTAb3FScicr4tx/xftiqurfeD0csllMitYHn47y8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4999.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDVrcVlzeTlmTkVLa2o4cTRBSzRwSGkvYkNkQ0krMDdaUWR3RTVjc3RvaVA0?=
 =?utf-8?B?MEFjSFg1eWpaN2dkcHRQSUNxdDM1ZTMxWkZRRnhxcnhWTkcyaVgydUw3RUdV?=
 =?utf-8?B?bkl1dFFBU0ExS3R6L1dCdE1UWWRzWmJmM3h3bi95ZWJlY2RkUVc5ZFJZbE9l?=
 =?utf-8?B?aWZVai8rb0NjL2t6cTZucDJrUmZZYUtwazEvMXR2a3E2WG0yL0FoS1p3Y3dw?=
 =?utf-8?B?ZnhOM3g5d2xyeGFuQzJWUGpIWERRNmtpM09kdDFYR0Nzc0JTbDRoR0UwSmE2?=
 =?utf-8?B?bW90akxHNFp5alpPWFdDcUttcUpiZjZpaExRZ1FKejJYZGlOZHdxd2ZhaXdi?=
 =?utf-8?B?T2cweUxjTVp2WjJpSDd5aDlqY2hMQjEwdnFRbGtmdnFFUFR0NUZiL1QwVGIr?=
 =?utf-8?B?d1F4MzVieEdFWnpPdlhaS293WnZCNnhIV25ESU0waFJudFp1dFYwUHVvd3hQ?=
 =?utf-8?B?S1RidVBxbGdXV3c1ejJJYitGKzRiZDRrNTJZeHBZSnZnWFh4b1NRd2duTG5l?=
 =?utf-8?B?ZnU1dWZKYTc5cittK1E4RXd2TnBaMnZvK2hOelFkSUNDUnZBUnpCcjZabFFs?=
 =?utf-8?B?Q3VQTFRoZUdiY2RvWEJGQjVZTWdub3R2QnRDeExKWk9FWkNJYTltVDFvOGgr?=
 =?utf-8?B?eHdjTG1hUTgwWC9HTldSNUtNbGZRdVBGN0J0SG9tcmVTZElJS3pZSW83TXli?=
 =?utf-8?B?ZC95S0pkdDdwaVBZdklFenZLZG4vRldrbUpROFlRbVk1V0V2cndQdnNsbGIz?=
 =?utf-8?B?YllSVkdhQlhlQ2l0VjQrVWtqTXBoa0J6N3hkc2VKNStnWFdkdkVncW5xQXNt?=
 =?utf-8?B?VUY4TXFJUGdnUCtMWmxWdDNMQW04ajVDYnZWeis2TGg0eXQzM2U4U3JQWWZV?=
 =?utf-8?B?UmJ4QkNZTDhyNE5ZM1JZQkVyM0lBUU9UMWNQRXIrQ1M0Q2FQRmtWT2M2aC8r?=
 =?utf-8?B?bFFnb0lvUnBFbWQyQlBXemRPOTZPSWg4aDZ1YkU5ZlI4OVErMVc0T25BU0Fv?=
 =?utf-8?B?dUdwRVdKVFVFZG13MEdDdWd4Q2tleVVuS1R4RGhSY3BCL1ROZ0pDSTNoU0Jr?=
 =?utf-8?B?ZkNVOWNaK1lqQ0l4enE0ODROdkZSUzFFR3hIMFRxLzJoUTRTcTVhRE9DYmVm?=
 =?utf-8?B?Wi9RL1ZockN2VlFYeU1LVEk3QWdaeGRjc284aWVUTitZZWRHTnhqVHBmaXYv?=
 =?utf-8?B?RmFZUk5KOGp6VURZNFROZXBZOXlTTkdrMS9lbWNRejlVZ01nNVdVL1EwdDlI?=
 =?utf-8?B?RWppaGhOS2xxZy9JdllJVEpvenFob0tId0hXY2NjL0xXU1hmT1FXSGcvSFFH?=
 =?utf-8?B?RnRPQ2ZvSm5wZjg0N3JMZ1Q1RWk3Y2cxdXZwMDVUQkpKZUFiK3Qva2VjRTN3?=
 =?utf-8?B?c3hwQU41ZzFVV0tnOU4vVEFrc2ZLbUk5Umlwdlp3citaZmJpTHJOM3VnQzhB?=
 =?utf-8?B?THIzOTJnLzBHV202UzFNWVpGQnM2V0FWMWJaM0xGdjNRMTRjaU9vQjBua1lh?=
 =?utf-8?B?S3FHbDV4V2wrMFF2NHpod1VFY29aaXUzMlc0R1Fxd1MxRGRCNUVmcUZaLzli?=
 =?utf-8?B?bG5XWHZzSWtWTTNEVE5DKzZXZUZNUHdkVENKendPcUI5WHQwV2p1Z2Z5Zksv?=
 =?utf-8?B?RDBVODZIbnNpcGRnUTY1RVNkbFBIT2FaejZURC9yUW1CcHVqV243Z0xyUTdH?=
 =?utf-8?B?c2dIRHF6cjlrdjRaekJkYnhTN1lodnErVWFJVGRZNkFNcUdxWWJ1U2tPMWxi?=
 =?utf-8?B?ZU9hWUVUUnRIcEVuMGVFRkpsbUlhMC9Ja2NMaVRSYXJPbEdLTkxCUGRXYWFz?=
 =?utf-8?B?UndnTWhndUV3bWRYSG53ZGJtbUo5MzV1Y01Na1lTL0prdDJhdnFJWk5QblU4?=
 =?utf-8?B?QWhWZllLVUI4dnY5azA4dVpMajBJL1JoVGlwZkFqWFpybEUrR1lJcEF0VnBH?=
 =?utf-8?B?czBvVEZEa1dXTVNNNkxSRGdYTmVEVGt3aHhSZXpXTHVyZVJMdDl6MHNWWDlw?=
 =?utf-8?B?MVBPT2VCdkE5T2kweDV1TjA2OUFmVFFsRlNRNjlaYW9xUEIrQ0R3UzhWV3Bs?=
 =?utf-8?B?a1k4VFc4OWkvZ1lvL2hkbkFRR1RGTFU2T1ZLbDlHTkNzQ2VEeWkzQk14NWx5?=
 =?utf-8?B?bGlNTlExUU1HZVZXTXAxV1F5eTI1cXJXUnpvbmNVM0VhWDZxUzBWZTVNa1Rw?=
 =?utf-8?B?Q0F5RzgzZkZTK2hyZjh3czdOQ0lscWtWdzhnNXA2ZXpKZHl0OG1OOHRJNXVq?=
 =?utf-8?B?eVJCNXk1eE9BazRvaXpORnVsVm0rdWNhRUVzaHZqTVU4V3hWTkMrTHp3TjlC?=
 =?utf-8?B?ZlJFaExEWUNUV2NmSmZub3RDUzg0SE1jUzFWa3BwWm1FbzhNaHZuQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2fd5fd6-20fc-4664-cc94-08df2909a2e1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4999.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 09:09:07.5236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6wVzV0YpE4dyBoIeJ1rS84cH2/Ht1WKzDoWSfuOy9yymv/M6B7cX5HzXIRw6qLKZHByiWKFaGXNtzHjqcOb3oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4462
X-purgate-ID: tlsNG-bad1c0/1791882551-FD86F034-99F256C8/10/78276251493
X-purgate-type: spam
X-purgate-size: 6460

On Mon Oct 12, 2026 at 12:15 PM CEST, Sergiy Kibrik wrote:
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
> a new XSM hook lookup_sid() introduced as part of XSM API exposed
> to rest of Xen.
>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

  Reviewed-by: "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>

A couple of inconsequential nits below, but otherwise LGTM:

> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
> changes in v4:
>  - introduce XSM hook `lookup_sid`
>  - at SID lookup return error if security server not initialized
>  - document panic if DTS property is used and FLASK disabled
>  - per Michal's request panic if FLASK disabled is left unchanged
> changes in v3:
>  - panic if `seclabel` property found but FLASK is disabled
> changes in v2:
>  - add & use flask_context_to_sid() wrapper
> ---
>  docs/misc/arm/device-tree/booting.txt      | 8 ++++++++
>  xen/common/device-tree/dom0less-bindings.c | 7 +++++++
>  xen/include/xsm/dummy.h                    | 7 +++++++
>  xen/include/xsm/hooks.h                    | 2 ++
>  xen/xsm/flask/hooks.c                      | 7 +++++++
>  5 files changed, 31 insertions(+)
>
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device=
-tree/booting.txt
> index bcb06bc796..2a69d2537d 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -345,6 +345,12 @@ with the following properties:
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
> +    Note: boot will fail if this property is present but FLASK is disabl=
ed.
> +
>  Under the "xen,domain" compatible node, one or more sub-nodes are presen=
t
>  for the DomU kernel and ramdisk.
> =20
> @@ -422,6 +428,7 @@ chosen {
>          memory =3D <0 131072>;
>          cpus =3D <2>;
>          vpl011;
> +        seclabel =3D "system_u:system_r:domU_t";
> =20
>          vcpu0 {
>              compatible =3D "xen,vcpu";
> @@ -453,6 +460,7 @@ chosen {
>          #size-cells =3D <0x1>;
>          memory =3D <0 65536>;
>          cpus =3D <1>;
> +        seclabel =3D "system_u:system_r:domU_t";
> =20
>          module@0x4c000000 {
>              compatible =3D "multiboot,kernel", "multiboot,module";
> diff --git a/xen/common/device-tree/dom0less-bindings.c b/xen/common/devi=
ce-tree/dom0less-bindings.c
> index 41d72d0d58..b03cee0e8c 100644
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
> +    const char *xsmlabel =3D NULL;
> =20
>      if ( !dt_device_is_compatible(node, "xen,domain") )
>          return -ENOENT;
> @@ -141,5 +144,9 @@ int __init parse_dom0less_node(struct dt_device_node =
*node,
>          panic("'llc-colors' found, but LLC coloring is disabled\n");
>  #endif
> =20
> +    if ( !dt_property_read_string(node, "seclabel", &xsmlabel) &&
> +         xsm_lookup_sid(XSM_HOOK, xsmlabel, strlen(xsmlabel), &d_cfg->ss=
idref) )
> +        panic("Invalid security context for domain: %s\n", xsmlabel);
> +
>      return arch_parse_dom0less_node(node, bd);
>  }
> diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
> index 6331859afa..029cddd5cd 100644
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -823,4 +823,11 @@ static XSM_INLINE int xsm_domain_resource_map(
>      return xsm_default_action(action, current->domain, d);
>  }
> =20
> +static XSM_INLINE int xsm_lookup_sid(
> +    XSM_DEFAULT_ARG const char *ctx, uint32_t len, uint32_t *sid)
> +{
> +    /* dummy policy has no security contexts */
> +    return -EPERM;

nit: Perhaps -ENOSYS? or something like that. It's not that any
permission was violated, it's that the real version of this function is
absent.

> +}
> +
>  #endif /* __XEN_XSM_DUMMY_H__ */
> diff --git a/xen/include/xsm/hooks.h b/xen/include/xsm/hooks.h
> index a331f5f0e5..3c1bef3053 100644
> --- a/xen/include/xsm/hooks.h
> +++ b/xen/include/xsm/hooks.h
> @@ -169,6 +169,8 @@ XSM_HOOK(int, argo_register_any_source, const struct =
domain *)
>  XSM_HOOK(int, argo_send, const struct domain *, const struct domain *)
>  #endif
> =20
> +XSM_HOOK(int, lookup_sid, const char *, uint32_t, uint32_t *)
> +
>  #undef XSM_HOOK0
>  #undef XSM_HOOK1
>  #undef XSM_HOOK2
> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
> index d65ba0aeae..b130ff5e26 100644
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -1949,6 +1949,13 @@ static int cf_check flask_get_domain_state(struct =
domain *d)
>      return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__GET_DOMAIN_STA=
TE);
>  }
> =20
> +static int flask_lookup_sid(const char *ctx, uint32_t ctx_len, uint32_t =
*sid)
> +{
> +    if ( !ss_initialized )
> +        return -EAGAIN;

nit: missing newline

> +    return security_context_to_sid(ctx, ctx_len, sid);
> +}
> +
>  static const struct xsm_ops __initconst_cf_clobber flask_ops =3D {
>      .set_system_active =3D flask_set_system_active,
>      .security_domaininfo =3D flask_security_domaininfo,

Cheers,
Alejandro

