Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79804606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 00:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=REIF2duz
Received: from list by lists.xenproject.org with outflank-mailman.1493410.1693410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTTGq-00007W-SX; Wed, 18 Nov 2026 00:11:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493410.1693410; Wed, 18 Nov 2026 00:11:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTTGq-00007P-OS; Wed, 18 Nov 2026 00:11:28 +0000
Received: by outflank-mailman (input) for mailman id 1493410;
 Wed, 18 Nov 2026 00:11:27 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nishimura@valinux.co.jp>) id 1xTTGo-00007G-Ju
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 00:11:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTTGn-001XCS-Se
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 01:11:25 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nishimura@valinux.co.jp>)
 id 6afced2a-bab6-0a2a0a5309dd-0a2a4506caa6-2
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 01:11:25 +0100
Received: from [52.101.125.106]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nishimura@valinux.co.jp>)
 id 6afced2a-195a-0a2a45060019-34657d6abcd1-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 01:11:24 +0100
Received: from TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:15b::9)
 by TYWP286MB3413.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2da::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 00:11:18 +0000
Received: from TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM
 ([fe80::1150:c5cb:d781:8147]) by TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM
 ([fe80::1150:c5cb:d781:8147%5]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 00:11:14 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dC99JJ8tM11yvcdzlOWY1IMCUiTCX3W/SnJxwN5+w4kNJmJmxXgSUHecSX05KPBJxrhmJGfnZz2jkAhf25FnrKpHJHL497+rnj59+ly6ePtwNEr6ccTLPf6mZq0I1FWLJVx649Hk2XlHEo6zsPqM2ALTOiOQfrBBEhSowIwdoub0v2+Ptq1Epn6dzrbFX/ShIARjYOH+JMm3+GoWjiTl5ndqtDa7rJayIOqjestRH4VDVSVANi8+NZT3ftSD2nKU9t9ho+ig6bydUwSCoTf5LZjDRAbe8pX4zodWTpToGOKDm8R1tztnI3QamGjVld5p41hLnGdgz7bGtL2EV879rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/m/lWMA0COO5xIxOG9xK5tZfiU4xDWQ+AevlpfzyuAo=;
 b=fZYw+cwSbeRAqh9lN7Zzm8mYEGiequUEOmFgLbvmLPgMJX07xMJL/9GFWMDPeg5nGeaO4HzOnLL50o7Y6hLHyDZ+su5+d/g/T3LWwO98nzuSXTIQ2u9spIhvMekSyLI24uyji17k68ixdyJouD3UAv/bNQlS5oyH2sUljChaymFTZsci3ut8EC5vd0ejb5QY9WDTVOl+kkxLXOCoUWmm/U5PfMyOv+RUTAHC7gL9IqRNyybxKnLYbDDzJxf89SifuzAspuID+/zPN9MfZcBSMktL5JULM50LFoi8xmIzoqxqeHDmTXbSuKDMWJ0/XZxBgkzx5V5vM2SbOWfzvu6dxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/m/lWMA0COO5xIxOG9xK5tZfiU4xDWQ+AevlpfzyuAo=;
 b=REIF2duzFzCXbDWjoyUCd/yoNKLAh8n8u3OdPLfN5x8+ubHV/X6CAaBfLjAolW6QPg09evTN3RHQL3dvX8hQAk9mcfrNSZOd3sEmEsTcuM3/HcE2WU+ndPLr3/Vzb7RT+fksXPrjTWlRJM97S9KW//E/gApfeN0gRnWtzzXb6rc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Date: Wed, 18 Nov 2026 09:11:12 +0900
From: Daisuke Nishimura <nishimura@valinux.co.jp>
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: <xen-devel@lists.xenproject.org>, Volodymyr Babchuk
 <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Daisuke Nishimura <nishimura@valinux.co.jp>
Subject: Re: [PATCH] xen/arm: its: only clean cache when sending ITS command
Message-ID: <20261118091112.0000637e@valinux.co.jp>
In-Reply-To: <0d253cc7-486a-428e-bb4d-b4ce2ebf530c@amd.com>
References: <20261117033217.184625-1-nishimura@valinux.co.jp>
	<0d253cc7-486a-428e-bb4d-b4ce2ebf530c@amd.com>
Organization: VA Linux Systems Japan K.K.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0223.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::11) To TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:15b::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB2019:EE_|TYWP286MB3413:EE_
X-MS-Office365-Filtering-Correlation-Id: 72abcaed-9c87-44e0-3626-08df450875a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|22082099003|18002099003|56012099006|10067099003|4143699003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261022105027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	cynl7ZEcHjoZvykTGfLx/5uqxcscXigfWfwIGcvHCsFJ+JbfBXDrAhXxvOA6ALuBuKo2ynCGI82V3AURBWC28fsH8SyfNU11xp1slq0i7/Q3s5oaO6nHorPP/Vj07ScriaA/ro5v+lQNtcZUb5x2BPA8pnvNFYLJAkULECPwK/ymal4MLrGBeZQQbfoWuwvqzC73EGzvVsI2dqw8KU4B3LvjrBfcmwEVou4HuUniWVHS1vZRfXNOU0TH/xGZL4tpUmMROJdKY7QmEXIQg09Stt8PZKADTXaZAgwCEXcLR5dRnXUCxEspb+V4195Yx6snXjfulvUBx1stsE27dCmWR2HMQ0Qjbmi+0llBPn9PYTZfduMY9CBLXbRpeCCZr/GU2L2yeqp7ddwH/VU6rONiCEiElod/NStCawIPnaj8eyfOy6WvwcA/PPZ4EGIQCDNZk51MW414hPg+CgtL+FNOFyCwmbHVge43RsnlwfcShXTwLe0j75z4tE1Xo6QuPI3t9ERiiz7CnziuxfL8TaOyp0jnk8BwkNEgBEk2sF9ROk58X0dzjzuGppDlN9bFBRz1EobxZaycP8QGVTyWKfN3KIOHscypW7qDIa0x9FOEgotpSEPOPY0iHTWU5i+Eod4XmWWhks6XG6Fbu3eSqWZmaRg6TqgtkQxxWjxGv1TF6VI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(56012099006)(10067099003)(4143699003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261022105027099003)(261021121427099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WSvLwnGh7jJCvPz6asqNuLzMhheY1OhEcuKhjM/hB4kNGgXRrOvJDpWCDUir?=
 =?us-ascii?Q?6j7ftz8AYzSTufDmmh6rPCRMU6JrkGZgIR2V8ck4/Xh3k+ZbE+bOStvCu6vY?=
 =?us-ascii?Q?vWbYB2L6qtD7bhtILFKORLs7/AgDM/wsiWlB/25vTT9hMFSw7j+l68s1cSQZ?=
 =?us-ascii?Q?tDMWNaDkhTVT3uPqCgXVAOYaNNFsx7e4yyrOPTQu1+CU+wBEgLLh/zZgRqwk?=
 =?us-ascii?Q?uDii3cVOUlrYl9m44RTiHWK4otaxGLbLn8f2XdTQTWiaRLuWv+hhE1bDfopx?=
 =?us-ascii?Q?1eCIg3T3coHpBJYrMv69yjFAVzozpa1pk45pL2zditZ7F4US1YQWAhKADhuY?=
 =?us-ascii?Q?qEc6i8LWd2mvmRnv46XMUfWH+31Xm5OENa1RM6RaMVwjNtbew7ol5z7AXN/G?=
 =?us-ascii?Q?eh6xXtTCUqW5Vk7VrAJ4le2T+I5+ztaHOqfH3eJnv2uhn008jLiLRF6QLAT+?=
 =?us-ascii?Q?wA/EzBddS3XWz2cL3NKP08VxP4m8RiZE1W8WkbT5/el8rpTOcagAp1tQAcd0?=
 =?us-ascii?Q?M1JlVqfnKnfzYb07zhxiD0NznMwYDXkHHY2xFtJi2sMS9E+NdzZUxs0/Ih0D?=
 =?us-ascii?Q?5BPOyS+xK/D+z8XMUuqfU8sj0dR9k+ET6pIqIDqc1Tpoxs3HolK41M8Jjls1?=
 =?us-ascii?Q?wk2gxibGrr1mYjt60yChHWddYKRl/6llDuvCfpTBDhs5bW/mRATjTQrHVCz0?=
 =?us-ascii?Q?GEhKUf7DNKjhcB0MtB0C9dfjKTP0gwvDw0xArbfvUvWuLJI9DKTxGdVSxI+E?=
 =?us-ascii?Q?FB14m56yig1opbQr3RyemFILtfgGZqfj8MP/djy/Ort+BCT2tL+O1X/IUfF5?=
 =?us-ascii?Q?7G+W/d73vUvXMJYoZaw3mFORap9h3tACwIHD3rGlKNnW+wYM1eN9tHzndKcA?=
 =?us-ascii?Q?l0fngY/xnIh/cHKNxg4b+qOJp9On+ONo+HXZyD/OQttzuLo7XD1aUAgEa5ND?=
 =?us-ascii?Q?Dxd4tXZJmXZlTg3o70W/sOOtuuYAQ9sePG1rUmT4aiRYg01YyCEef+Rr3HDv?=
 =?us-ascii?Q?X9GsMxcRYLT8xVr26Iulz2ytf1Joo93Ls6AZMjwwoDD1a9g0SzXFOfb4ANm3?=
 =?us-ascii?Q?dal3iYJtTxWJaJhG9uLHIqcPtbNr3w+j2E1LPk+9sCqPPXowO4oWkodcee9Z?=
 =?us-ascii?Q?i7HCcmhl9vbUASG/iYl7aaf1bmMLOqCAX+g46S3NuZub6Y9MAHqdv10Uzgfb?=
 =?us-ascii?Q?CjQuafN4A5FAwwIv8YUGEGy6DdkC8AKk9jMVrUh/zCBIVyOr3iIP3ghMdTkf?=
 =?us-ascii?Q?72O/4pYL1l9lgjT0byDSRiPzodIbh5rpzCFhcMCNIDAikwu8YHB56yUhIh9r?=
 =?us-ascii?Q?/sI/qq5vV+dZu4YBYMk3HvsCd0pY2isQQQeOdOQf8pbvmb04bel0gH+JKK3e?=
 =?us-ascii?Q?caJsTv6NQStUjDQbd8zKK1amzWoaSEjOgVTIjZCj7evBFNXJ70a5brCaZEGO?=
 =?us-ascii?Q?kJGl3M8UDgjQEJF985ztXuHHrvIQLQGHfCVJ4Iuqvpg1kr0lZrwlCfk4VNW6?=
 =?us-ascii?Q?VBX+gOjWoO8ocijgtY0iRT5VzPrmLvaAl5EzeGxRfmLjHPkY+s8zSrBlyq93?=
 =?us-ascii?Q?88jOLfzWD2ZrJCaHhfCWjsoXPUBa+5Fu87OydhnSnwSuYmd7uk9zpMZbZGLh?=
 =?us-ascii?Q?OQfNg24uOQyR/110AJouTjWq22dfuyEF4Dzsg64u4oZmUqE9gr0ZnWd9/Lyq?=
 =?us-ascii?Q?JKWEisF4tDSPlzU+dMFDuNOythZQPvmko3M0oU2IHfnDJsulQJmh/NZ4yuoz?=
 =?us-ascii?Q?t2He8VcgTg=3D=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 72abcaed-9c87-44e0-3626-08df450875a4
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 00:11:14.6440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XdrJg6kY6WP7jQLUZeRYg7FILaYrUEpSVjGxdWET1WEsq5xQmGZLehmeLAPx1jF/le8ZjqOsr3ykDHD68WCyfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB3413
X-purgate-ID: tlsNG-16d1c6/1794960685-F70C777B-04E5FED0/0/0
X-purgate-type: clean
X-purgate-size: 1222
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi, Orzel.

Thank you for your review and comment.
I'll update the commit message based on your comment,
and resend the patch.

Daisuke Nishimura

On Tue, 17 Nov 2026 08:45:27 +0100
"Orzel, Michal" <michal.orzel@amd.com> wrote:

> 
> 
> On 17-Nov-26 04:32, Daisuke Nishimura wrote:
> > From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> > 
> > There is no need to invalidate cache entry because we just wrote
> > that memory. So it is guaranteed that cache entry is valid.
> I don't think this is a good rationale. What makes invalidation not
> needed here is that the CPU is the only writer and the ITS the only
> reader of this buffer, so the cached data cannot be stale.
> Invalidation would be needed if a device wrote a buffer that the CPU
> later reads.
> 
> > 
> > But we need to clean (flush) cache line to be sure that ITS sees
> flush means clean+invalidate, which is what you drop, so please drop
> "flush" word.
> 
> > command written into the memory.
> > 
> > Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> > Signed-off-by: Daisuke Nishimura <nishimura@valinux.co.jp>
> With that:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> ~Michal
> 


