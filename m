Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9E9C79FAD
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 05:53:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412540.1642943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4BFA-0004ol-1u; Wed, 09 Sep 2026 05:53:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412540.1642943; Wed, 09 Sep 2026 05:53:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4BF9-0004od-Sy; Wed, 09 Sep 2026 05:53:11 +0000
Received: by outflank-mailman (input) for mailman id 1412540;
 Wed, 09 Sep 2026 05:53:10 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <okamoto@valinux.co.jp>) id 1x4BF7-0004oX-Kl
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 05:53:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4BF6-003kHi-Go
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 07:53:08 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <okamoto@valinux.co.jp>)
 id 6aa0f42f-2eae-0a2a0a5409dd-0a2a4504e08e-38
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 07:53:07 +0200
Received: from [52.101.125.77]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <okamoto@valinux.co.jp>)
 id 6aa0f43b-b57f-0a2a45040019-34657d4d5eb7-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 07:53:01 +0200
Received: from TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:af::12)
 by TY6P286MB7361.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:35c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 05:52:55 +0000
Received: from TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2067:ff0e:4c3:ad0b]) by TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2067:ff0e:4c3:ad0b%5]) with mapi id 15.21.0360.008; Wed, 9 Sep 2026
 05:52:55 +0000
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
 b=MWhhUUKLNqYZNfePFnnJVDZrxfpGDzkbRMwrL87K9W9MzbwcZRLefzyf5cCEqyFk75Q/t9g/CUhxl3djPvFXYE7zlUzbxh0QKcoenkI0d3WwFI7LLJnS2Y9bTgrVNBWFEFkDesO9RbSeBZsN4JmIeEZdATyh6sB2fIogVEyQrd4Id9Oyr44cryo1kRL+NFBJKHuOSKXwTowF/oLkvo2xImnbkNEd059/ps60OYoYfZXlpObLnxI8+K6ksnN1gikzohCwhLUIhju6qnjsewQPNAWxb1AeFSBWvHz8XlCR+gclSIcxPB9GZSnxeqZDd0nblDdQxstFo3sMtzn0Qi2IMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BWaPMVJIRKQcX9poEII5w10otm4TFZtQ5aiX1u0k+S8=;
 b=WvkHT/NNiIq+BW+llXIo01ZqT+vaTlaR7vS5AvscwCXZC9hMEhRjsueV1Pi+3xcNThY7m8IOvlD80+nW9ie9vj/saOlFFK1CQqN9Z5HZY7zwMXgnnpKO7Jnfe/K0gdZvhXFn+2N8qC4T3ZiSOMCfl9dXwTXRSJA7MP9iSB6jWfmOQlicoguJagEGabXsomM5IYiIIP6Dk8xKg/ImaCfmGmFscCzwLetdFORpECjdygzn03W9VBjz5EIDP8Ov5Tw2Hj9i5N05fLGpD0j5KmM8hR8nfOpZGyTM14wMZXPT+tM73UbwTm9OIe2/uHSMz816gyBoq2uWYvUpH1+ppDPb3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BWaPMVJIRKQcX9poEII5w10otm4TFZtQ5aiX1u0k+S8=;
 b=eV3Ljmg1xz0FQV2u+Li1NSMzSqJMqP/5xqacTUwDsBzdQuEBsKyXvPs7e8QbZPHMXSv5l4YtqkS/qG++HyFqCur+p4DDfucI18NmvcKB3C/khcV2hpd0sZtQF5xFqQM+fXde9XLxEU5uezdt3SntUE7zjuiryx0EjzUt5JQlz4M=
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
Subject: [PATCH] xen/arm64/atomic: Clear exclusive monitor on cmpxchg failure
Date: Wed,  9 Sep 2026 14:52:37 +0900
Message-ID: <20260909055238.521966-1-okamoto@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0028.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::10) To TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:af::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB1053:EE_|TY6P286MB7361:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d6feddb-1206-4942-c41f-08df0e3697ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|1800799024|23010399003|366016|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	mMj4I95xT0qSXtNJligsI4ifziqF9RBv9vdgA7UB7m5ymcGC7/R5XVkijJV3qd/IMFIILBrJCpNYCprHB4hp12HU1WNLyJ6sEOG1vN98tyZ3Upa9ssBLm+9rW+Toi31dW1o+38ZaBt6bitrdb6xT7rpiooHLo0I0Ela5IcgDBzNJWTS1L5ZyPrYb3mhcDDjNiAiogaym/I/BUIH1itUX0Rppboj5DsKOOhv9kvKyR2NEjJcb+8LwEKCFpaVZ+OM55iQzmTr7+voCpn9vGzfSYtjl0JBH5GFWaFYdS5IiLZIzxKWRRH/W8uMS2+Iv+xeW7s+fblXRYYEoSJqKr1cA1D88w8e+kcF+DPZ9VkRB0ijLY2RloZSyImEHHW1qEc9BtHNQ0Ri9dMCsePt7zlqduo/h55KvXdvOMAzC9hhbrqa2QxbG7OifQZ929AwV9o4yJAg2Pe2EbYy49OX418lew92WS+eQ/5DJoJRzA5DK2oZkNC8WXRIwbMEX8ByvqxZjRKWe2qht7d4xELmK2xVGxwmAZXv6DWjTWITffLtlEiRMzh+Q4+E5aiA4h5dtDNkiOjevqGHgnDWlJ2zuTw+ONkpSvVs8yRFWGZtoOUChA6EGARzpwhJL5WQvnrr9LuhgQTmP3T3m8/lOsyWFLb/Lh8svbi/fXBAY1DskCYHWjfA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zmB+hFptLAhe6YZ8b49s5DwbX3juSDc97wYsozaCMh+3KctCsWdYn4dHTJAg?=
 =?us-ascii?Q?Ijivp8FoJ4l9LkachaV7lHPsGXnI3JrqkWQknNFBggMz301Pttgnu8o6OpHB?=
 =?us-ascii?Q?aRGp1NdbZHmi1mirh2w8oDW3EZPsLpvMfGp1sN7rszlAJUkoD23qgQF1xwKI?=
 =?us-ascii?Q?A/8Qv3ov36MBrhEmrSmwcFMmUJzW9jDfs4ptghJtedirF7XmJn0A6GQ2l5zv?=
 =?us-ascii?Q?e4Q47zV8LtRHqgx99IkNlgK5lCQR7Y5JmdoslflyKUp5UVqQoAKlkJbdi1ow?=
 =?us-ascii?Q?zEwR9B3QItq4VzUHyXUXygK17HczTRFuutF46aQ+c93orGnfWVnCYOhssbQI?=
 =?us-ascii?Q?Zpr8oC2GBWB9bZa4sh7htAZeevKOVjAePTgLlIKSoUbFy/WI6JuPTx2DFWRr?=
 =?us-ascii?Q?gIYxQlRfd+X/k7vy4rdIrYgagwoGFcTtWfMbUvKSl3hwvx4JQh3Pt6JW8JpA?=
 =?us-ascii?Q?hC2sYS0Sxg26cJWLz2ctBzyyWlt9mGudLqDywu1jQfX3qCWQ2a8bcH5MAklQ?=
 =?us-ascii?Q?EYwJKN3bHQ1EX8xG3VbfB+iH1nzbWisHHXKFHAxEFf6clkXAgC4OlO2T6bIt?=
 =?us-ascii?Q?itVE3/EKJWnd7s+15ZrvmpwgrZJ/2q728yx3XULM7ij2kWWt9/sspesKLE+y?=
 =?us-ascii?Q?OYGSNzwMWsd9h603yoyQllxyVyCi6+ep+REx0pg3VHB8GVLHZO1HoHFinEqO?=
 =?us-ascii?Q?3kpxLpzWu7HCSBP1tqilwd9V+iL2Q5JWYDxyRn6v6pMwpHrAV45kWV7Ryugb?=
 =?us-ascii?Q?zyU3QGMOgC46es5UjSbBjREsYpULOm9jpMP+CV2Zau7GvZvQ+VkXt+OCUNvx?=
 =?us-ascii?Q?wWmmoO4XeREKE7Lqjgh/25SnbjmGu4+fJC843vO5VwSjTYs2//eFkf/dRgix?=
 =?us-ascii?Q?kwnwxDtxVDVJ0eeAUvKopREwJoaW6trIs1mAxV2Bc0cVmDYEbswUCUaJXh61?=
 =?us-ascii?Q?mgsnbiNor1x0KzvTZd9k9eL9rasdzNJtAXLhDcmNPqujXzsp/XtHQNbIc3kM?=
 =?us-ascii?Q?bk1ACwRWORw8ZimTXI89QvIrLe7GLxOdsPPAXi3YtDhFEblgYvfceSXdTSJJ?=
 =?us-ascii?Q?+k5QgmW1BVcbq36FX5H/j77gGR1DWLcHk1Ftfz/8UTBAo5yLz1hPQyN8Ed6A?=
 =?us-ascii?Q?e41uZfZtVNAcOVRZOsoJHyauxu99bb7laLceAS7aCYbQSkrE2Sgl/8tdh10H?=
 =?us-ascii?Q?aITjCIO09qEM2mAgN6g3zfTAmYdgg3Z2O5SvhDC2YIdCmmN1kRVh16Oh8tok?=
 =?us-ascii?Q?Bn2gqUCxH9sbvwR/QLEbbUtkdLRq096SGgyM3oJkw09qKHQ9+Ondi4s1gI8s?=
 =?us-ascii?Q?jVVx525wNon1SMJ7DrxOU9c1gScs6cwSlD+yzILDscXkxo8nDF3DHtPr87n0?=
 =?us-ascii?Q?xC4Re9vm/rTXZqrgQTD92xmPHZG4qWWESP+2sMRRGXRX0Avg9co6qnx3XHyG?=
 =?us-ascii?Q?uUZh4KMzhoMd8cmJ6iKb2Np4SdiyqH/4lRrQVF+P778sq2U3JijD2rDFpeWS?=
 =?us-ascii?Q?3L1nXNDprU20bdYV4455gqqhTd+UwXUs3FiNvr3jAPjqR5gmzjdRrff9Hj7T?=
 =?us-ascii?Q?Uo9c1/WP2YiaLc3yTnmMKSUZe58ioZ+1OiaanAhlbUfQeRItHlLMNGN5QgmT?=
 =?us-ascii?Q?lQwXlgrXUYWK/QFdXUCHm/jsIAeEyAgIubPi+07bWUZlsahArxWuQNHSNNkg?=
 =?us-ascii?Q?3nKIHjPWRSQo76nZy9KYsiByiXrs0xDVR9m/ic+5g51vlv10UIbsQUPmsxvQ?=
 =?us-ascii?Q?Y1U+pEK7MtU4ouVzB9aMkTE3NE+pGIXKcIvVdSUCGo6naiXt3pcIAh0gxmpv?=
X-MS-Exchange-AntiSpam-MessageData-1: 3mjy27ViL07ybQ==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d6feddb-1206-4942-c41f-08df0e3697ed
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1053.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 05:52:55.2489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ffCfci9Txr6Q8qcohzlzt6CQe4JWmqvbV8lVJrYoK26JE9CnSflbihKDD+Kh4jUHmnn+E6/+M/d315itgg9Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY6P286MB7361
X-purgate-ID: tlsNG-ebf023/1788933187-C32CCB50-728203E1/0/0
X-purgate-type: clean
X-purgate-size: 980

When the value comparison fails in atomic_cmpxchg, the code branches
out without executing stxr, leaving the exclusive monitor in the
exclusive state set by ldxr.

Add `clrex` to the failure path to explicitly clear the exclusive
monitor.

Fixes: d2654a556835 ("xen: arm64: atomics")
Signed-off-by: Ryoji Okamoto <okamoto@valinux.co.jp>
---
 xen/arch/arm/include/asm/arm64/atomic.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/arm64/atomic.h b/xen/arch/arm/include/asm/arm64/atomic.h
index 4460165295..2c74ede740 100644
--- a/xen/arch/arm/include/asm/arm64/atomic.h
+++ b/xen/arch/arm/include/asm/arm64/atomic.h
@@ -118,7 +118,9 @@ static inline int atomic_cmpxchg(atomic_t *v, int old, int new)
 "	b.ne	2f\n"
 "	stxr	%w0, %w4, %2\n"
 "	cbnz	%w0, 1b\n"
-"2:"
+"   b       3f\n"
+"2: clrex\n"
+"3:"
 	: "=&r" (tmp), "=&r" (oldval), "+Q" (v->counter)
 	: "Ir" (old), "r" (new)
 	: "cc");
-- 
2.43.0


