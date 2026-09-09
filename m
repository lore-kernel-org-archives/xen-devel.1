Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA6DC79F8C
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 06:13:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412560.1642960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4BYP-0000IP-Q3; Wed, 09 Sep 2026 06:13:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412560.1642960; Wed, 09 Sep 2026 06:13:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4BYP-0000II-NS; Wed, 09 Sep 2026 06:13:05 +0000
Received: by outflank-mailman (input) for mailman id 1412560;
 Wed, 09 Sep 2026 06:13:03 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <okamoto@valinux.co.jp>) id 1x4BYN-0000IC-4e
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 06:13:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4BYL-00C7d5-Se
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 08:13:01 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <okamoto@valinux.co.jp>)
 id 6aa0f8e7-2eae-0a2a0a5409dd-0a2a450ce6d0-24
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 08:13:01 +0200
Received: from [52.101.228.107]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <okamoto@valinux.co.jp>)
 id 6aa0f8ea-f479-0a2a450c0019-3465e46be3f4-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 08:13:00 +0200
Received: from TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:af::12)
 by OSZP286MB1909.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:1b0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Wed, 9 Sep
 2026 06:12:56 +0000
Received: from TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2067:ff0e:4c3:ad0b]) by TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2067:ff0e:4c3:ad0b%5]) with mapi id 15.21.0360.008; Wed, 9 Sep 2026
 06:12:56 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x0Z2Zx7HDVWz2nOy00xZMSVWJ0v+ENpl/RYPM2LDAdcLa8Qxzyb12PXT/tLOxlgkQaSjotKl/6dn1DprR6qh+ZBrAYZ6RCX3Y4MMqNgAFu79fzwwwI7q/9ET0kvlL6rgOcSL1lPcF3yg6zyPLVY41cRigwe7/QjijkCt4Cw2xzRTVs0M1teyC102yDCtd3tf0m3TCrUvi541EU7vLS5RpjWJ/+08OO2sjgXauxve5LX9MOfdoMIzhF4yKuqSptAeUSVqHd8pNDsopGH4fQQTmbMHFzfOZwgXaPQRzvgH29WeaPMEucwP1MAW3pfzlPWYTjde+G9fVoL5cs2jVl7sRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6TPhRfSzE8LUkpcYp2RbKf88gop1wKnKgJwVM7D/+XY=;
 b=HUhPU2pcuXc6tua4n/ET1zge/QzRGekm8FEXKYuEJnbVmIvm8hmbmb5nGVb+Q1lmqM15YyFqqUtsbKMy5fZEUBTQpM2LrLPLVdUk1jnq33wPJX9+k90Gsfuq1QFO/ymksVJGrain2Z4abdnwh6bcF1Y4SPteQYOZVoVeo6JOW1lZ54viNv/1GW25Nkw5aJX4ZJRIUY2LHI8n4fLdaURGgmd0jVlnHqzGTYOz5LBzPgWwl6pKy96NB92tEHOKdozBpqiLFzvhR2Ar7mG0MZqPcuUcOUlcNiu3JXvFGafkdzNEqGl1VJe7Nf3lPnvAjeqygmJyG82MS2ubSa/RFC4XFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6TPhRfSzE8LUkpcYp2RbKf88gop1wKnKgJwVM7D/+XY=;
 b=KoZbN4iEBCOWQsnkrfpnfWn0PeLVUAoCP8gOHIwNXvJu5bSGktebiT38nzJIAqxgKt69fDbi6f2jhHUkmIZZrNS5ekrxO6mdnYpUld/a4hBe5iKD1lIYdbPLJRznwvNrEf2gpYWvOOnjlXvcBKPCTpapi8hF6og+grW0tD1UsI4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Ryoji Okamoto <okamoto@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Ryoji Okamoto <okamoto@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] xen/arm64/atomic: Clear exclusive monitor on cmpxchg failure
Date: Wed,  9 Sep 2026 15:12:53 +0900
Message-ID: <20260909061253.546312-1-okamoto@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0063.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::12) To TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:af::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB1053:EE_|OSZP286MB1909:EE_
X-MS-Office365-Filtering-Correlation-Id: d99d0b94-3152-4fa0-2777-08df0e3963a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|1800799024|23010399003|366016|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	fLWkHiYC62e0jPjNXnZGnObD+Q7G57gcJWrxb4iHBE3fl2on0I+bZQD0n5y3XDk0LK1hONeO8x5g3IF9A+Xx7LFCDC8cI0uy8IyHHy6uuuL7IwDDHxOXMQU908hQrSRsHNewrb/6z6+UTrR7GQQodTz23mgef352grOLEr8kUUqvMlaStSWJyH8KwLF4ROgxL7NvqHNDJTIEkmzBorRbcyGAPmPYqchj4X2/wfewx7dMilJ1+yhVtoMmDnxvu+Qwb35xzgQTEnImjYwTD22qOs1kOSciyjrUKhx9hAVQvOylfr0JWxQMYBqZAwumiXwvQXWuBsHNBPJtZ+YdUhzvv8usvPxTwT3eYtrVZl1+O5wzSbVd56NYil3fvinWGxM/h4amFKwYKEqQfdr1OL/CYvOM94SIg2Fwc1CICIPaeMW2sxPwxjZGLfnRh50WHaNmQoYVgO59jKdycQAcvUfAUOQ9wPoevm/BEhRpX/eLgo8qfDSHp6eqwvQTJKD90CFZ5njd4/nnehLObJAou8T9TU9TVvCF1ib8yTDi21NIyX9Q3vpT1ckG7gMHfbiqjE0YlWkxVh4U5I1idhisLJnQJSnKJB6hGcMv453MvCQEl3I6fptbwxVELlOhWhdZcfVMHURPJ3UChKhHwocBeUp9JNuL0v5SVhjZi0LBtDFxsZk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KkKHGGhPyHf0YP7zaa5ECuUUOfWOMzheLMmjKYSzgivcFXcnQYHQWRj54yVH?=
 =?us-ascii?Q?+LkvND81Rn9XhOBDhtdlRIau/EEHSPfiBdbNYZ9/2QuU6O64SydpQh9n1aQM?=
 =?us-ascii?Q?5tOjeJP2pw8IXMTNGdtBakrJXpoOcT4SbF49vwgKPevd6tQkf5h3Qr9haY63?=
 =?us-ascii?Q?oOr2FSukB7Z04RJI37WEkakRkL/f03CUg4P/AYB+zZY99k30woqRBFxK2DSW?=
 =?us-ascii?Q?u6cn2PX4J4MqB5PCkrlj9ryAX9lbSzlw7WFoRYtsTlnY5iP+2nifxmOv2dov?=
 =?us-ascii?Q?9pRvEv1hXuBvITPAuqDwv4MqeP2dmM+K+TlBqjFlDDbiFUA+Ph31zkRXHEij?=
 =?us-ascii?Q?vwR9e0vc/MOsNYQZs9TyLBZOxiksbqEZhZsBEJpGPDjuqmkYdXy1Ttwbws/S?=
 =?us-ascii?Q?z+iiFlchV0guChNrLHi5xVw8rfTv36XlugemhrXIYobSqlU4NewsoWC5+6+F?=
 =?us-ascii?Q?SUAaaNmEhqc6rO+rfbPv4OoredzrWCbfFqhMaqGlHyG7+04U6z5RTV0TzqIu?=
 =?us-ascii?Q?mmtU+Hl2OnUpsmrTGwMFFQ+rGHV58Xd8cNhBqZ2Y0zo3UwI/FBrJ3YOWsrWx?=
 =?us-ascii?Q?ponQYTEMkg8vFEbPQzNDpYrTM96mQUe5/ozfOywAkCIvQDZ8w7u7QpiwteHw?=
 =?us-ascii?Q?2lCR3Lh5bllFj5s4ogO/Ddod+hxmQBg0tzjfRpA8E+lKt5qVdgjIPL4kI4w+?=
 =?us-ascii?Q?F6rUpC7RuQZGm9siVyOPo6ZfZVHDr3yf5FdgR3PX+3MDxI67MEI/YA9um+1R?=
 =?us-ascii?Q?X2aoU4VUyJjc2/McFZIVIbbEX+wqEGK9tl3LYOJrRGDBO3FNpMVYP2aHtftw?=
 =?us-ascii?Q?TGovKH/M1a65i3ABM4zwMS01Q+5zmIh8qJYwKlB0ksO9Co41/tmsSHZgsGzp?=
 =?us-ascii?Q?cFC4ih0NX9E6zDgmqX1zjy+JIN/shw+HRVVSvg/ROPnS5b4XaTTclbYiaHtM?=
 =?us-ascii?Q?2XgMwhDwkNz/aNvpX+y6Z7V1DGGEViUrvzycfOzcyfmmGTV9Amc69ETlyUUx?=
 =?us-ascii?Q?56S77OsryOHsd4XSPWCxv2lQ+A84mUNeNuWxUgJ6TpN9ytFOqTqOAI/Xo+mn?=
 =?us-ascii?Q?U7tJnAtqX3soM+6JFGvt2E9ERkzPgqPkyzPUuhZ6ope5Rp/9LY+zCVm9r0nS?=
 =?us-ascii?Q?OL8l8OYlao0QtnZmG1IJ7xiFUSYYrAtQsGx+ZkyTJl3kRlK6Z0+4fmcPLQWr?=
 =?us-ascii?Q?c8r9gTgYniZhvkEJ4k+eN0pkcoCaxF0M0DV8V3Lrc2umVck16unH5rBMvUB3?=
 =?us-ascii?Q?jZ1Y/JwdyHXp1Y2xwwo1ilGe/CFT4HskjVxT1p8LBEq8BxuhqMBpz5Tnyu5p?=
 =?us-ascii?Q?iN64xuOe0lbF8Ow6dFNEzQ9AmgJthkgavzIeiFlF5ylCY3Vp1fRsM3RbFlxb?=
 =?us-ascii?Q?E7zUtcVzy56oxeRBpkTmO3+ZB+baEIJvdI0KcTNci2lRDh9DllKG326rDq1/?=
 =?us-ascii?Q?Iq5dR311uU+vakKUCLX01H1uE/YTp2jHdAE1RicboRGklEtHPchYbZjw5hJS?=
 =?us-ascii?Q?IxliDDy/UHUYTRRvNejAde8SZo/DkRDq8aZFoVO1mgNbJ2UXTfv7Lj/zJafI?=
 =?us-ascii?Q?2B6woKhZ153Th0VjjyMFg/BlSiXkjwslkYGkfQdZ2+QUaXmXw5UxfuTOntfU?=
 =?us-ascii?Q?ixLVCVNwwICBU7/tzv6YFl3yFWai09qRqQ5BwqDiDXqSjpLQH2cUQorv3FYV?=
 =?us-ascii?Q?Bw9lJTVQOiTdcrWe3WY4aw4zhHVS7/x2Wwkui/Z+2u1thyAXcKdQIVLN2uIu?=
 =?us-ascii?Q?yd6+8MfJOqe6/fEB0/qW82kW4CG7hU4NxzQndnSmwTlFWRjZRsM5uX2gUdYc?=
X-MS-Exchange-AntiSpam-MessageData-1: A1EJw6W3v1pLwQ==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: d99d0b94-3152-4fa0-2777-08df0e3963a7
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 06:12:55.9908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3fbWXz6k4/nbdgXtB+hqY/GlHaruV9P/44sgiYkULli06GO/jZzB+s2Z0xY2MB6CEoldlV4gIVxoFBDpkhvEQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZP286MB1909
X-purgate-ID: tlsNG-d25034/1788934381-034D7A5B-D21BAE60/0/0
X-purgate-type: clean
X-purgate-size: 1022

When the value comparison fails in atomic_cmpxchg, the code branches
out without executing stxr, leaving the exclusive monitor in the
exclusive state set by ldxr.

Add `clrex` to the failure path to explicitly clear the exclusive
monitor.

Fixes: d2654a556835 ("xen: arm64: atomics")
Signed-off-by: Ryoji Okamoto <okamoto@valinux.co.jp>
---
v2: Use tabs for indentation instead of spaces

 xen/arch/arm/include/asm/arm64/atomic.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/arm64/atomic.h b/xen/arch/arm/include/asm/arm64/atomic.h
index 4460165295..3aa0ffb4d9 100644
--- a/xen/arch/arm/include/asm/arm64/atomic.h
+++ b/xen/arch/arm/include/asm/arm64/atomic.h
@@ -118,7 +118,9 @@ static inline int atomic_cmpxchg(atomic_t *v, int old, int new)
 "	b.ne	2f\n"
 "	stxr	%w0, %w4, %2\n"
 "	cbnz	%w0, 1b\n"
-"2:"
+"	b	3f\n"
+"2: clrex\n"
+"3:"
 	: "=&r" (tmp), "=&r" (oldval), "+Q" (v->counter)
 	: "Ir" (old), "r" (new)
 	: "cc");
-- 
2.43.0


