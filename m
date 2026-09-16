Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C3BC88E5C
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 10:45:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1422600.1648010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6n8p-0005jv-9N; Wed, 16 Sep 2026 10:45:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1422600.1648010; Wed, 16 Sep 2026 10:45:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6n8p-0005jd-4p; Wed, 16 Sep 2026 10:45:27 +0000
Received: by outflank-mailman (input) for mailman id 1422600;
 Wed, 16 Sep 2026 10:45:25 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mark.caveayland@nutanix.com>) id 1x6n8m-0005cy-Rp
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 10:45:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6n8m-009uPu-8O
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 12:45:24 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mark.caveayland@nutanix.com>)
 id 6aaa7343-2eae-0a2a0a5409dd-0a2a45089568-2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 12:45:24 +0200
Received: from [148.163.155.12] (helo=mx0b-002c1b01.pphosted.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mark.caveayland@nutanix.com>)
 id 6aaa7342-f659-0a2a45080019-94a39b0c8042-3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 12:45:23 +0200
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68G81MRd579034; Wed, 16 Sep 2026 03:45:20 -0700
Received: from ph0pr06cu001.outbound.protection.outlook.com
 (mail-westus3azon11021117.outbound.protection.outlook.com [40.107.208.117])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 4gqbtb9yb3-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 16 Sep 2026 03:45:19 -0700 (PDT)
Received: from PH0PR02MB7159.namprd02.prod.outlook.com (2603:10b6:510:16::8)
 by PHXPR02MB11343.namprd02.prod.outlook.com (2603:10b6:510:3cc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 10:45:18 +0000
Received: from PH0PR02MB7159.namprd02.prod.outlook.com
 ([fe80::8e97:bc32:822c:b250]) by PH0PR02MB7159.namprd02.prod.outlook.com
 ([fe80::8e97:bc32:822c:b250%3]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 10:45:18 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=proofpoint20171006 header.d=nutanix.com header.i="@nutanix.com" header.h="Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector1 header.d=nutanix.com header.i="@nutanix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint20171006; bh=iHuChNbu5rbXyA0PVs5s0TbcMgtzaERrjGU1D2vny
	2c=; b=aPIChpv9SLgz6h9+7a/QT8YbBtPd7Yxpcu5TiJKB1SmzoGEE4w3XwTc3R
	E4olm4PAv5Zhown74IZCt0QaKyIncoZoLdTk3cVC4TtiyHsbx+jwf4JqEueQw9RE
	JmwVLZ0YGSF2hRDSQCgCI8PeteOw1UAZ4ejNDpEUvwYrOF0NaIXVrvkfCGa20mqV
	ueV4SbgAbGUP+CtUHfOqOCw1yjsFU4OXdBEnc4rsf1qyim9a7UrymDZETo4ar0X5
	h408zfbAyhSB3/Gs/h063m7x4lrZRfcV4QLGweqNTXZAaVfO3bh6cCdes4eBjW6/
	k/c9BDOXNnZXqwfO0fAaBpPFlYg4A==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NXoSynAj3pqOeFftRU4ugQUmLGxjxNcZ6WFS14d9HPhYyIyM67V48YEn8Y0HSDyxBUarz7SMi6SEdLKGoQ8wPuk6iKVQWA5L7QkpoKpX+tA0MuXesGCpeCd30wLwvrCHsqrmZBzuL5wtC/j/nMhA19/bZv4l3McoAIZJ5t9tlsNnwovpzmPyVdQ9qg+DbPxXKyZ1aZ0rdV7HtX1RQzd0AdyS3SmT7IsK6ofcNzoHG+OTafDscmZb3Z8fv1zsmlJ7rI6i7fLIvDlZkG9mtLN8B8Ywm/mJLtUf9LIWrVPjz26TzOTE0v278qW3NY5YkIXBFbtzmBnPgFBJZoBYz95+aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHuChNbu5rbXyA0PVs5s0TbcMgtzaERrjGU1D2vny2c=;
 b=OCy3+9scQ85i+x+PnJFA7Dz7zJDE1cux9vdzV2W77SfVg778fLGCwuZBhj7Z96QvxOlpXmUKvxf812sEV6IWXPsKtFMkkGZuijNlWQK7qoAS53wy7rKgRqWF6eWI+jt/ogYL3KOKuqU22rW+edNKyljLwNbvQYQc2n7yVHspeUjdsybGtuosIQesTMZgMoE7XHIK64PVJJoNe/7VLCDmyrtjrXJ1vO90yoWkibV1WGssDg42qIZqTEmsMxoP7cTEPZWI7892btuq/cpCBGleLkId5e0mPuTLBlB9OlM7HDhngkeesdRZ8ayNW3pBIOTmF9ovIIzao3EYFF5LK3dEEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHuChNbu5rbXyA0PVs5s0TbcMgtzaERrjGU1D2vny2c=;
 b=wicJ7Sb77IsjkASCtm9QGpVG8oBTm9x4k3Aucv2350gOm2AOf+w8787d5YVe3Eaw0aHDb2WQSsXyW5lnHPe79gSvRCs4FXr5AOA/7bQNf1VDmh3jmNRYjOF+HvYFj+0JCo1ei+/H6JHeVRDRcThdX54T9lruMJyklx0vzm9MnmIKFoDRccHCHWQ19cuI8OnYDPzXFzOKb4naejA9Q0DUGVQqiwGDqvkPrTgVUu8MHeqOLh++tp9kO2gPF5apjbIPtQNeTCmgKmmDB0qAowTH9+4v5aTzc/2nwEOkJ0srV5moDguqvhfbgqucFBGq8dqyrrS/B14ZRTVH/Z0ZVHPC1A==
From: Mark Cave-Ayland <mark.caveayland@nutanix.com>
To: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com,
        sstabellini@kernel.org, anthony@xenproject.org,
        edgar.iglesias@gmail.com, qemu-devel@nongnu.org,
        xen-devel@lists.xenproject.org
Subject: [PATCH 11/22] i8259.c: convert to use DEFINE_TYPES() macro
Date: Wed, 16 Sep 2026 11:43:39 +0100
Message-ID: <20260916104435.600211-12-mark.caveayland@nutanix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916104435.600211-1-mark.caveayland@nutanix.com>
References: <20260916104435.600211-1-mark.caveayland@nutanix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0070.namprd05.prod.outlook.com
 (2603:10b6:a03:332::15) To PH0PR02MB7159.namprd02.prod.outlook.com
 (2603:10b6:510:16::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7159:EE_|PHXPR02MB11343:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b2d9d4c-b562-4545-e46c-08df13df9969
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|18002099003|10067099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	prJoDOR8yx1WBqIPyJNTXUB8ZLH+vqWeUJs5H6umAmMF5NcLWgXoUd8IKgvhTk1hiu78Zz0c7yRAPXcWX+QR0j9Hux/bA6kzmagFAj66GFwV5CRyvSQgX5+mjSpaSqz7ZAFSvl4znUvTTl2pFBh5w66GG0sK/lO4+zVHH+zaZ2qea+uOG7lINk33LFPLhOEvWF90MhRTjq/mXkz8OVZW9oyDVsZxWM0uiZClSawuXQDGsbiCDa1YaiRUZf6Mx3mlJuiPYB0VjnNPlBaZaC2frrtQ2DsQu/jMoL05j03I9rjPyPShEms7xjkRr5IPEN0z+DyqlDR1HHVOh7F7mAcDn3oSpmhVyzUmVkoPPkMxxA5So0B57vlAyeoMNrSF/xEjgpCcLc2p1Oj32Bf2lC45vNrIvstbjXyyuAS2QxKQLay5BZChk3LQFyrmtf0DptnJjcrF0knvFxvab8EiDE74EAnXQa3iC3NGqjXNbescEMKh2koNQsvN5hQvn1+Sk95VhWC4q6Ibl5NOyPQnT08d6zUdQyPPAXnW9/NgAAImisaru3mnTv8klhWIVJmmhS4tMxhgzi63dX441kEnx9/Mvo9QCuxUjA5ydU/1ukzGApqZ7sD8hxxaJ9h14EHq+jm9LM5o8vd+ZcifjZJWDb4KzxYJymhmfXwQ82GSmsgqixY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR02MB7159.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(10067099003)(56012099006)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GZNsWJUOH8v3xYMC+xQ8yZ3aER1nnzwboLkmW9AEc5PLGE9FEN+UcUM2/qsv?=
 =?us-ascii?Q?wMf0rrGQ8ffzLyDS3U9RNUWonE/gPEyp65ZvMqppZq2YxtIxwvJZ9kcaL1fg?=
 =?us-ascii?Q?L2S3tK7qACONpR3uwGOX8T7OPRgRRMdUskO/I3E0QxKmnNxcgN4P6e55UtNZ?=
 =?us-ascii?Q?WNHJa6TFlsRhvXi/8dUk7B32sCtI6kjO7kjLv7RsHcK487whIlmGB/WukFdg?=
 =?us-ascii?Q?FPIAVxtGv+9iJFX912emTWfUu2DLWcUKkL9A3m31ioqfhpgx5wwVGwkPEGZn?=
 =?us-ascii?Q?r6HySyUDc8KHsKkfYOpwoQt0nx7TGb2xf0nS/f32MPvIumQPkSBmPLwjNRp/?=
 =?us-ascii?Q?HZSn08T6ps5oItCJwpnxOWyiSNSPx1x26hH0l0zQeApUboYacy6Mz19t3RaB?=
 =?us-ascii?Q?IW8Hn2Y7/64vy9gT/tj6/k0tL/8V1mliT7u10KSt1ok3mm/d+gvd78FxkqPK?=
 =?us-ascii?Q?Qly7tDlL7thv5vZEk7yVKLTIi7h2G/Pdu26QiAzsgvOGFaXPRRMe5jPdxbBs?=
 =?us-ascii?Q?tW5X9woG/XGY1MoZ2u5pXvHVDkmzO5cklYo0FuquyNRuwHGBFf7k7/NL/jQ8?=
 =?us-ascii?Q?f7YgGcVChhhmwz46GhHenh+JNfZl+SGc+Yjouj+0pqpE1n+9RMue+fg8KHyM?=
 =?us-ascii?Q?JJEtadptNOEJWRyp6aYa6Qzl2xIxQt25LR3pmbXzGCY7XsJUAquVcWKW1IOm?=
 =?us-ascii?Q?OaBr2BIvwvC4S2Zyjh1j8GKZleSymnXt5TkBh8dZH6VuDHC4t2sWx3GBQn7C?=
 =?us-ascii?Q?E/wVQo2E1lxKTIVjlDSFpYNTGOk82/PmVGMAFEr1Q2/tYwVGLFVEn6/RvN9P?=
 =?us-ascii?Q?k+4XklBiBtxfpI30OlC7z3OIkrwU3h90rX58FbMErrpUe7HLwwwB7GwkH3y3?=
 =?us-ascii?Q?vEJmS+VxPStfq2sW8xxeZ0K+BohGzQGgokBnSgKr6TBnkFCAuSz3KcmK0wjK?=
 =?us-ascii?Q?ot+wCfsCwE9y9b7dU6r84sYIEsc9FNIH1AwaU524bKW4d+8GrA0jCdEZelMJ?=
 =?us-ascii?Q?XT5TK8dSk3NQbfrF7aUcFAIPMDwo9ZAbJ1uBoyQOk3bBgZFCrdFTnb05dAw9?=
 =?us-ascii?Q?Z37fBe0i4xtmSVXhpFywykGTyA9Pm/bFd7Jlt1FXaeJOvo6HyLb8tRHwUNjc?=
 =?us-ascii?Q?JEtp6jen7DYV/TwA4gxqgRqQv6E8+iC5dC3JNJJkE3bnHbhJozT1sqiD98cN?=
 =?us-ascii?Q?CmUNnz//aI6jr1RGHPNDQBv/D3oKg2HXH5Zk0+cjdoJFCUD0r/pSB1SCZLD7?=
 =?us-ascii?Q?aFWQDS7J4WcrxuXfGCxPrU5+aEdXMUD5N5DbT5c0FqxtXSr7bLxoYFy5D19Y?=
 =?us-ascii?Q?1d+pMEXoumQiDv7GSCs4iRR9jePsb2C1HmqFIq4gAJ/qAf5JEQLTbAoaB7SF?=
 =?us-ascii?Q?tiiD/2AzhAYGRNHRvBlZ9PfMiAKBiK5TjDuRTHaTqeHmns91o+aEPvbGTHga?=
 =?us-ascii?Q?I2VWHTMQp+bVWt4dgeeR5x2pFi8E2CQTcBN/FhTBsdV92+1K8tWacyzhYgqs?=
 =?us-ascii?Q?4sQeW8h3Snl5PHYE/kMcqcqZLbbL9d+FoKOzu9IenWWc79VUOGqT0sdNQrS0?=
 =?us-ascii?Q?fWNiSxQZPAdKVCszNm590yl8Nu2ieZgNpuUU5dmNZiju3Hw8gaMa8LUS/kuz?=
 =?us-ascii?Q?uzpYqpwVqtsldjaehhPoG+UBpGovrQMGYoSN6BrNRAyP0NF9NFPrfiiODZLG?=
 =?us-ascii?Q?1RGc9r0VSjiaQqTckqjzkfJ/uLAeHggwpHz/Ven2rN97o72RqRxXieCqG3B5?=
 =?us-ascii?Q?XdZBixzhysLKNjEIMLGNqbVndddfnqo=3D?=
X-Exchange-RoutingPolicyChecked:
	jLEfsHiq1xlZcmq9vpqLejaNdN2egt3edMN8H7vRf0xmMYxSkPAErmqOJTzYT8vQPDrmFupnsSi9q29Uwm7tzN1A9TnoFtAlTcTjmAxYsuzNEIO/LXevTmxTu/Jew21FobA7r0xhmCwAFxOJOXRxZoiv+ipviAwBeQ3wPhIJNPuw2FLBPJollkCJyOAXfA5UolU8CmvXfPbTuA5IJFG6MhnERwU8tW24apDdtnWAA75pWolSQ3jas0cIcSfgtH0YAFlk+qpJ4Abf5tBC+N3dHKBVyYY4wIoSGVHGg2iV6GsLG/UrMzLmWVvfmKYANhpMFxCsz7gbTeuCzR1zftIOzA==
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b2d9d4c-b562-4545-e46c-08df13df9969
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7159.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 10:45:18.3671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l1Fl1rshUhTKy6dNuYmf1y9ulbiQc9abteeTKr2aEBJYQcP8pko1vJgxfbSTKIlFEn6Vqupnhe0I7GW6/8sgsMxX8WnCDR9rPAlnJmSzFtY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PHXPR02MB11343
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE0MSBTYWx0ZWRfX4rcPc3GjM8D1
 wa5uB0EY0Y9iyLgzrpamJfFXSefkD46zEZ3+tEYY8zdZ/NVaZMPjaDJdZzP2Nqlsi9ff7+IOTpi
 Nrs+jN3S39p6OhME0Zd1YLFAscx0Csg=
X-Proofpoint-ORIG-GUID: Uh_gmNpcXbqHiEMQ9VPaUsqYzNb0UyrM
X-Proofpoint-GUID: Uh_gmNpcXbqHiEMQ9VPaUsqYzNb0UyrM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE0MSBTYWx0ZWRfX0RBcQQwhNTmY
 Lwea4NNuGtL8yO3UhLvXnw08n/iEaRlEVidtwX2j23xIRiNFapc0ZA34wPWSpugZ8zdixWAboRf
 VinHkIyr67fbsO1JMDcDMhb4uIqwNe0D6+/TmQEUJ2Nx+CxGZdBb/rQtRf4Ae5ycbE+c6EmTvZc
 adN7eVEyZIdjVVDy/qNWWFyXWJnmCpilP2yESbe/f20XWDZPn/+IIVhDAY3ME5tp7JIvbJqgwRd
 ylQtrIAONuSmYdnT7a7JtQREeaTuqjx5r8Zk7mXM0AanK/JhwidBau93o81DOAJ95sIt/rfvYUk
 oMUF7lItAgm4EBiFcD01m/TC4SbIOMZiBtunUiyVtCl3EiVHHwTmco3qhoh4ZSLAv75KfVIrzg9
 TlhclNsRe+PT5jxQYwjMoGekMUw1LQg7ABCeeMuREX4gTDouf3RN81j0L7w+gXoOo1fGFQKcFic
 DzcQ5NyKa8DXKwDdWAA==
X-Authority-Analysis: v=2.4 cv=QYvzLcbv c=1 sm=1 tr=0 ts=6aaa733f cx=c_pps
 a=fJIB0T+C2yAfE4P2TQxPqg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=0kUYKlekyDsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VofLwUrZ8Iiv6rRUPXIb:22 a=0LlEyIVc8U2lsR7dKhuH:22
 a=64Cc0HZtAAAA:8 a=7eIJgSlqxBVt2QvjjhkA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Reason: safe
X-purgate-ID: tlsNG-c1860d/1789555524-CD94A87B-C44751BD/0/0
X-purgate-type: clean
X-purgate-size: 960

Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
---
 hw/intc/i8259.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
index f2d8cb1489..af33b71591 100644
--- a/hw/intc/i8259.c
+++ b/hw/intc/i8259.c
@@ -429,15 +429,12 @@ static void i8259_class_init(ObjectClass *klass, const void *data)
     device_class_set_legacy_reset(dc, i8259_reset);
 }
 
-static const TypeInfo i8259_info = {
-    .name       = TYPE_I8259,
-    .parent     = TYPE_I8259_COMMON,
-    .class_init = i8259_class_init,
+static const TypeInfo i8259_type_infos[] = {
+    {
+        .name       = TYPE_I8259,
+        .parent     = TYPE_I8259_COMMON,
+        .class_init = i8259_class_init,
+    },
 };
 
-static void i8259_register_types(void)
-{
-    type_register_static(&i8259_info);
-}
-
-type_init(i8259_register_types)
+DEFINE_TYPES(i8259_type_infos)
-- 
2.43.0


