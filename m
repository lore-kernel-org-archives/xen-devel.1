Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28187CA5FAC
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 11:59:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437136.1655911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBsyB-0000AO-Q6; Wed, 30 Sep 2026 11:59:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437136.1655911; Wed, 30 Sep 2026 11:59:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBsyB-0000AA-NU; Wed, 30 Sep 2026 11:59:31 +0000
Received: by outflank-mailman (input) for mailman id 1437136;
 Wed, 30 Sep 2026 11:59:30 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1xBsyA-0000A1-IH
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 11:59:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBsy9-009YOf-VF
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 13:59:29 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6abcf99d-e002-0a2a0a5209dd-0a2a4501adde-10
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 13:59:29 +0200
Received: from [52.101.193.54]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6abcf99e-5984-0a2a45010019-3465c136a839-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 13:59:27 +0200
Received: from BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13)
 by SA1PR12MB6847.namprd12.prod.outlook.com (2603:10b6:806:25e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 11:59:23 +0000
Received: from BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740]) by BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740%3]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 11:59:23 +0000
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
 b=Z/hpmqGH3CQ1LFPMbM1NgZvs1xvdFN2VtVgxh9ZVVm1kqyXA/RdWUDxUrWfm+CUNhqGmz1xwoe3nxDBYJkquNyNbaZJgkadEqFlFlwq2eGYn/K6GDNTIDkCdOcJ9ED73+aqUOhZkK3qOT5qJ5deIjxTPLTiTxcZmgHq/MjpsxKJ1AW/1IUta3+V5FuTx2gAnYZxWTdwms7a8b05yJPVEGgcEWaVOg4ujaHyCmBzjjnBoMPTeOueMulcwbREOHXt/fspFPEwOcad/jKz+Z755j4UCRzLBM5x1ofZjTkIa1mYYFW530tDMJAwqZ2h4ZNEAB1gDcF9tpZS3UA/wqoIZbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=377X7wxcbb/IYu3/sELXexNlCs1RfTtLjf1eO/CNWb0=;
 b=eXiCYwUIGvCDlvsPFVR4ZWRymiWQC+nZyImgW75mXdTjLbNdxsWCtYLCZPHfj41a9W2fB+/lcD6kkL6JPRYQxQnfGJDsiFI9o1Hl6I/n2d45O10ezNXDaKWO0n0BqvdBPy+ZsOyD/KyrxoJemWfxxcGkYNnsNvm9XyNwGqEl0nRVDCUjOTXImXLm6DVHd9mWmXLDvKnK3RkzGVsxmBPSWMgGseMZKMDpO10e1CmFZWOpRe4zLqLMVN3NcHsZYRrLno34ozDWaoMCjjvoN8P0w1xc+Wyrz8b5BBf5wpnro4RARTaRvhfKUG7bgiPEUTBlAYfu2e8/MLKB5nj2IaKhiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=377X7wxcbb/IYu3/sELXexNlCs1RfTtLjf1eO/CNWb0=;
 b=VILESe3pjCd7X1mc6FOsDCyLNg3tMW5af+tWd+wLHTJ0sxvDOVW2bPrKS+p1yqQOLJmD2jCngcE0K4L/Bqo4jhO8emEuWCJ8Xn38jhKdVYstqYf3sZkzJqoVx8zq1aSzjYZagTOpd7SKfK9RtpsROLrdCnjTV1AFTiUcm+HUz+w=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Sep 2026 13:59:19 +0200
Message-Id: <DLSMTULZIC0J.37MJ4N5UJFOFF@amd.com>
Cc: "Jan Beulich" <jbeulich@suse.com>, <xen-devel@lists.xenproject.org>,
 "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD"
 <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>
Subject: Re: [PATCH v2 1/3] xen/rcu: introduce the concept of RCU epoch
From: "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
X-Mailer: aerc 0.17.0
References: <20260925163025.65217-1-roger@xenproject.org>
 <20260925163025.65217-2-roger@xenproject.org>
 <DLQSZY2KSYDH.1YSCWGQIQYP0H@amd.com> <arvJQSDecSSAU1WC@macbook.local>
 <50d1df6c-d969-470b-9b40-ca171c60618d@suse.com>
 <DLS5A4YDJ8ET.28ZIPQ6QEN2K4@amd.com> <arzJCY1M6NcVInmn@macbook.local>
In-Reply-To: <arzJCY1M6NcVInmn@macbook.local>
X-ClientProxiedBy: MA2P292CA0014.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:1::10) To BY5PR12MB4999.namprd12.prod.outlook.com
 (2603:10b6:a03:1da::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4999:EE_|SA1PR12MB6847:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d24deac-9ed6-45d4-4c11-08df1eea4477
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|4143699003|56012099006|10067099003|11063799006|22082099003|18002099003|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info:
	ORUo3bzbiSIMMqbtbEFC1vW9+nxBSuqCBG/zQRpFjzwrgsIvAb23jzMM9ROanHsngqIyPvYH/O0SshwigiEggE+LyFgX4fMapUv19tLYXcIvhsnbmT1CdbG0wn5tZ70/eT3gxKJx+gZwPUs63mTQY8tjs/bYrPapwv8DsxnC7F0CSl3omShyAK8t7aA7ToSXRXB1/qYs96iALYCSLBFalMZmaE17zAHR9KwjA1KPqddHwQfwHkNYGRO0M1QMP91pmWN84iWnkcRDP3NoUfGbvL6f4ThWzZa5vRUz/NErx8sYb1hwD/oKNuJIyRTT2CoXAmu8yTJadGUBGwcvgKJl8YOhHH4XqCviJT7uU/AxlrjtxknFl5UkTHTjSBgMOnU4BWrHsk5MrF/X/PNNu2QbXbhbIeVrTIlC+2nJgWeZoxht0axXQ1y7+38azR9yQf3/JSWZPpsc9wzsuhQo5n1i7Vmc0YxcgmJcSY3cXgyppubStbOhb/qNhJtOfLfGoxeVUKbDJ5SAEiXcxhLY0orega7SCHLlxmUclwljFOVqQHwHhyVPpGQU5+F1cuB/PEj9ZrCXfsOkj41/AOT36BXBqrFgfEFl1gnH4QaAGBIh28yemx9TugMMevLZJ+8W1ohp4liMjrhMPdWpYk8iv2NfyCEASG00te8z9K/182gu0mk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4999.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(4143699003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnZHTWlkb01jL2hRMi9HRTh0WndTeUFwZHdmNTBFRGN4WEluVkhWREgxZFRP?=
 =?utf-8?B?L2RQR29LQlZ1a2pHMEUzMjNwMjVZNWVXY3lFUU0wUnUzV3I4ZTZCWXhOYVEy?=
 =?utf-8?B?cXNDaTVEWlZHei9wbXo0RWpHTmUwYXAreDJJUmVPOVI5WEtYQ0lhZ3FYWkJt?=
 =?utf-8?B?cXhHMExHNHJuMlhpQko0ck5EdzZHRXk5U0crL05UZkJYQ1Zpc0Q0WFdkVHNp?=
 =?utf-8?B?Y3BKRHR0cWpXc1k1NlB2eVZITFl1MStPZUx2UVNucXdzQjJTVXc5TmpyWlF3?=
 =?utf-8?B?cE1JWmw2dnB0bmhRcUtVcm5uTTJ5VUlmOFlLWUlIMHVZTnJRTUxSV21uTFcr?=
 =?utf-8?B?RlNnUWVnWEd0US9rQzRLWWRPbXR5UXNxQnFVREZ4K3BXSmpYdEtHQkc5QVdM?=
 =?utf-8?B?U1NJdFBpQlpPdTYvZFRMK0dmT0dYOFNkSUF0cGVNY0FMcTNWalVWUnZWV2pC?=
 =?utf-8?B?VHpwdVRUOSt3MHlOeHpjRTJsV3UrNHNYMmhoR1NLaGVXNlFIdmhaSFljdUZu?=
 =?utf-8?B?OU8rVUZNODBvTXd2UVBTSEhmcUJvYTkxaWlMY2ZGeVBkaUNVdzN3T2tOUXJl?=
 =?utf-8?B?N3dENHA5NGRiaUl6WWxYWVFMeXhvWlFuN1l0VmRzRTlLMEtaOUxwbFNPZ1RB?=
 =?utf-8?B?VHp3NWRPYnJKRzk5UWhFUmdFKzh0eEJ2VE9zUHZuVlJzZzIvSFpQR2c4TW5F?=
 =?utf-8?B?eVlYQmFET01FVVgybXNOQ0lnd2FoNFM2c1RINEdnVHNQajh3YUlKcjdzR1RN?=
 =?utf-8?B?bzEyMWV0S2o4M2VMWkVLTDlCdlJLTEhZL1BNcmZqbXV2bSt1TWNtd3B4V21i?=
 =?utf-8?B?ZWRHbTZnV21ERXlPdmp5eGhGMFRucnFpbzc0T1NENHd2WEFaQjVIaGpNU0tJ?=
 =?utf-8?B?blpaR2M0ejVJR1FkK1BmL2dzcHBMb3I1SmtVY01OeGFta3J0ZDdEQVY4dmZE?=
 =?utf-8?B?dmsydWJlU05wRy8zdVJQSm13QWdnR0Y4cyt4bzQ2VUo0MW1iUXVnMDlzYmhu?=
 =?utf-8?B?dGErMGFidlFIcGZPMUtOWXNaWjdLSUVLSWIyUlZxdGJBWDZXdXg1Um1UcXp6?=
 =?utf-8?B?OWVGL1E5Rm5aaEJrYWhaR3dQR2t1S2RTN2loeVVEOXRGTHV2cGFtcVo5Y2pp?=
 =?utf-8?B?VkY3VG16ejF1cEk5cEQwZmJTQno0NkhiZTZmaHdvYjBMSkxwVnJsb2ZDODFn?=
 =?utf-8?B?SWxrS0dwak1JWFNoQ1Bad3ZyMTRvYUZRamFSc3RZdDVPNDdaYkt1S3pKVWtJ?=
 =?utf-8?B?T1pDTTZSK2x4b3pTYlNmajRsUHBxeXQ0SFd1c2tCbnNvR0lOZzVhRFBzSmFF?=
 =?utf-8?B?K0hDNHBValFRNTErSEtFSXIwcS94K0Z6L1pEM0Q3ZnBaSERvM0NwZ2tCVXk3?=
 =?utf-8?B?R2hNZWFCSzdLcjNSaERDZkVnSEZkU1hMcWVjVXNJV3RYWGdqV0EyUjdDNlc2?=
 =?utf-8?B?ZHBDTXVkUHlSajZHNWFoVTBscjdqNWxBcFpvaUU0cEd6a3BKL0hFWkY4RFhZ?=
 =?utf-8?B?dWNkd1pIY0dETEZ5MU9QTVo0WVhCanBueDNvT0dnK2c0b2plQjZXeDNaSTJH?=
 =?utf-8?B?eWoydFNNVi9ZTUdjN0J2MStEZVRUT2UvbUU0OTdYSmZVM2xZTDArR05FV00w?=
 =?utf-8?B?ZGEyZGZwUWRUWDViVTA4QUlERjRhV3VJSzBiN2lnNDk2K2JBSkZsMzFkSGNS?=
 =?utf-8?B?RjQ0TDAyV1hQb0dnTmg3WXJKWWNZcVpMcnhRQ3B1eGNqajR1OFU1N0JpNlFW?=
 =?utf-8?B?WURmSHc2VE5wemg3U0pxOTR2bVBQSzU4cWJZMjhTRDlHMVlvU3praWZQS3BD?=
 =?utf-8?B?L1R4TXB2M2t2dXdneFNyWExJRGdsUmo1MEY2djVBZHdzNCtudEJrSFdEaWlJ?=
 =?utf-8?B?L2M4V0FuWXRNb3VrTEpwUjcwcVpYSTFVWU1PQVdZUWZHdmlFMG92R2FISlRF?=
 =?utf-8?B?ZUpxUGV5ZWFhL2NrWE1TdFZ1OUFhYnJOQWdTOThwWHQrME9oeDM1RHEyUDNF?=
 =?utf-8?B?NEJMYldlR3R2RFRXMW5xRURMZ2VYUGl5KzluOTdIUUJITHNtNHFZM2szYnVw?=
 =?utf-8?B?YlRmUk5hSkVYb1JucVVEK29hQThuVnZLYktXdkFqWG0zU3E3TGwwNkpSY1hI?=
 =?utf-8?B?cTh1RmtMeEJvWjRsODFmYy9UMGZLZHMvejQ1ZTRXWE5ES2NSbG1kczAyTDJj?=
 =?utf-8?B?Ri9HQmVCQmFZdnVDSkRXMEs1VVBDTFBLWnc1V3dGUGswbmVJelNYSXNGUDZD?=
 =?utf-8?B?YkdnWW9PZnRYWHgxOElVeDNsRk9TaTJaRXJTOXB6TEtTaDJGdUFhTEJHUWVn?=
 =?utf-8?Q?F1FzFdWGSaw4Uf91Q4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d24deac-9ed6-45d4-4c11-08df1eea4477
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4999.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 11:59:23.1099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b/0PyL92iVQkbnQ+45rOiIJJC1pnp98OdgB7hDyDIGpNgkpH9qBKUa053auxl6QkqZ7jipGxJKnK17eNKONRCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6847
X-purgate-ID: tlsNG-d62444/1790769568-1FC69757-58DE4D5F/0/0
X-purgate-type: clean
X-purgate-size: 4735

On Wed Sep 30, 2026 at 10:32 AM CEST, Roger Pau Monn=C3=A9 wrote:
> On Wed, Sep 30, 2026 at 12:14:15AM +0200, Alejandro Vallejo wrote:
> > On Tue Sep 29, 2026 at 4:52 PM CEST, Jan Beulich wrote:
> > > On 29.09.2026 16:20, Roger Pau Monn=C3=A9 wrote:
> > > > On Mon, Sep 28, 2026 at 10:24:04AM +0200, Alejandro Vallejo wrote:
> > > >> On Fri Sep 25, 2026 at 6:30 PM CEST, Roger Pau Monne wrote:
> > > >>>  static inline void rcu_quiesce_disable(void)
> > > >>>  {
> > > >>> +    unsigned int cpu =3D smp_processor_id();
> > > >>> +
> > > >>>      preempt_disable();
> > > >>> -    this_cpu(rcu_lock_cnt)++;
> > > >>> -    barrier();
> > > >>> +    if ( !ACCESS_ONCE(per_cpu(rcu_lock_cnt, cpu))++ )
> > > >>> +        ACCESS_ONCE(per_cpu(rcu_lock_epoch, cpu)) =3D ACCESS_ONC=
E(rcu_epoch);
> > > >>
> > > >> I'm not terribly convinced about using ACCESS_ONCE() for atomic
> > > >> accesses. In particular...
> > > >>
> > > >>> +    smp_mb();
> > > >>>  }
> > > >>> =20
> > > >>>  static inline void rcu_quiesce_enable(void)
> > > >>>  {
> > > >>> -    barrier();
> > > >>> -    this_cpu(rcu_lock_cnt)--;
> > > >>> +
> > > >>> +    smp_mb();
> > > >>> +    ACCESS_ONCE(this_cpu(rcu_lock_cnt))--;
> > > >>
> > > >> ... this variable is to be read by remote CPUs and autodecrement s=
eems
> > > >> like the wrong tool for an atomic decrement.
> > > >=20
> > > > I can use {read,write}_atomic() instead, but there's been a tendenc=
y
> > > > to phase out the usage of those functions.  On x86 this should be a
> > > > plain `addl` or `subl` instruction (the non-locked version of
> > > > atomic_{inc,dec}()).
> >=20
> > I don't think the compiler can merge volatile reads and writes. It can
> > shatter them (thus my fear), but they are meant to be distinct because
> > each might have different side effects. Jan already mentioned this in
> > other words.
> >=20
> > You don't need an atomic decrement though, just an atomic write. Note
> > IRQs restore it on exit and other CPUs don't write to it.
> >=20
> >   unsigned int *lock_cnt =3D &this_cpu(rcu_lock_cnt);
> >   write_atomic(lock_cnt, *lock_cnt - 1);
> >=20
> > and this yields a plain mov, through a static inline stub (plus the
> > mov from the read access + dec)
> >=20
> > The problem with ACCESS_ONCE() is that the write isn't guaranteed to be
> > atomic.
>
> It has always been blurry to me using ACCESS_ONCE() to signal
> unshattered accesses, but we seem to rely on this property in other
> places already (which doesn't mean is correct).  See
> ffa_negotiate_version() for example.
>
> This is all kind of moot if we guarantee that all supported compilers
> will never tear accesses up to machine word sizes.
>
> > >
> > > If remote CPUs are to access the variable, is a non-locked access oka=
y
> > > in the first place?
> >=20
> > You use locked access when you need sequential consistency or an atomic
> > RMW, and that's not it here. There's a single writer (currrent CPU) and
> > IRQs don't play a part because the restore the previous value before
> > returning. So it's race-free. All we need to ensure is that remote CPUs
> > never see a partial write.
> >=20
> > Another take would be to subsume the prior smp_mb() into the decrement.
> > Something like:
> >=20
> >   arch_fetch_add(&this_cpu(rcu_lock_cnt), RCU_LOCK_CNT_MAX);
>
> Kind of a nit (as I've already attempted this approach), but
> arch_fetch_and_add() is not usable as-is here.  We we need to consume
> the returned value, otherwise the compiler complains.
>
> ./arch/x86/include/asm/system.h:189:6: error: value computed is not used =
[-Werror=3Dunused-value]

(void)arch_fetch_and_add() would shut up the warning, but...

>
> Could do:
>
> unsigned int prev =3D arch_fetch_and_add(&this_cpu(rcu_lock_cnt), -1);
> ASSERT(prev > 0);
>
> > This would make the decrement itself atomic (through a locked insn), bu=
t
> > ensure sequential consistency as well, thus removing the need for the
> > prior barrier. It's trickery through twos complement to behave like a u=
nit
> > decrement.
> >=20
> > My point isn't so much the "how" (should be obvious by now there's many
> > ways), but to not use ACCESS_ONCE() where an atomic read or write was
> > meant. Not necessarily a locked instruction. Just atomic.
>
> I don't have a strong opinion of using smp_mb() vs
> arch_fetch_and_add().  I think smp_mb() expresses the intention
> better, and avoids explicitly using a locked instruction, which is not
> required here.

... I agree. My point was rather on ACCESS_ONCE() avoidance. Let that be
for now, it's clearly meat for another barbequeue.

Cheers,
Alejandro

>
> Thanks, Roger.


