Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E77CCF2D6
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 12:06:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1454140.1667683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIm7t-0001gL-Bl; Mon, 19 Oct 2026 12:06:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454140.1667683; Mon, 19 Oct 2026 12:06:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIm7t-0001gA-6C; Mon, 19 Oct 2026 12:06:01 +0000
Received: by outflank-mailman (input) for mailman id 1454140;
 Mon, 19 Oct 2026 12:05:59 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mark.caveayland@nutanix.com>) id 1xIm7r-0001Z5-Kj
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 12:05:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xIm7r-00EDpy-17
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 14:05:59 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mark.caveayland@nutanix.com>)
 id 6ad6079d-e002-0a2a0a5209dd-0a2a4508b53e-34
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 14:05:58 +0200
Received: from [148.163.151.68] (helo=mx0a-002c1b01.pphosted.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mark.caveayland@nutanix.com>)
 id 6ad607a5-f659-0a2a45080019-94a397447d14-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 14:05:58 +0200
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69J8QNNd3199044; Mon, 19 Oct 2026 05:05:54 -0700
Received: from sn4pr0501cu005.outbound.protection.outlook.com
 (mail-southcentralusazon11021138.outbound.protection.outlook.com
 [40.93.194.138])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 4hc83eugxe-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 19 Oct 2026 05:05:53 -0700 (PDT)
Received: from PH0PR02MB7159.namprd02.prod.outlook.com (2603:10b6:510:16::8)
 by DSWPR02MB11441.namprd02.prod.outlook.com (2603:10b6:8:354::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 12:05:52 +0000
Received: from PH0PR02MB7159.namprd02.prod.outlook.com
 ([fe80::8e97:bc32:822c:b250]) by PH0PR02MB7159.namprd02.prod.outlook.com
 ([fe80::8e97:bc32:822c:b250%4]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 12:05:52 +0000
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
	proofpoint20171006; bh=Lbk19TW9tvFSdcp/RjK1f/3JYaD9dIFpQrVMQhJU5
	8s=; b=i8Tdo1vAgYhfG3mbR5etts7AcBAYHKeKbeloDtRgjhgEzigZd+aHJLsSy
	10UlsCjOijmklIhzyny+I/dhAQpoeiw0S/xwC7SOwslWNNm1gYS1KwZIEqKqUvJD
	1rdMd6giSiKqpTMO9SNFn+FWzE9oGboKQn0P4/WCRAUVD0DuvxKyGWswL8yxDK2r
	VYp3oAFd0Bk0cp2e56TXOqTYU/Xkx1dMA/+zotiBTAiDLea3PEX047Jxmhi9pNnw
	I/jBm9U7qGSU+K+IUUB/OY5x0ivdoZCsmfmXtS+LAQ/8XacDE+/I44Uxz3B5tPUA
	LSoyxN/IzMJIeqkF6XblqLF/KRZsA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p2ABZeK4VY02s66F9otn9t1KKJdRPfvVMEZK82sxadh7sTnemga9ZNhT3hmiACeYbyuNLVWO5ZOjDjQTP4lFA4BZGPN5ARivnO841sIPr9VMj/ivWCZyQOUq9NSvlgtGw9Truh35+VeOgFXP4TrKztWFABOgE7w5xFolVR/6iamVzZND31guM5U1UGDxAhT3zabiMd9rIIOq1Z3VkEK6V33fWQRn+wmMgXJezNywU3XsH+is+/VWF0Hzh68VodjvQqPX4l/7vf4McWjQaI7+jXXqmTSzgSl1hJEosoD9tRSwli/Uyk1jWVtLA/j8DR25Z8BJq6czr3KdBbNM2Pkp2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lbk19TW9tvFSdcp/RjK1f/3JYaD9dIFpQrVMQhJU58s=;
 b=bPnUhnEaGhAAUugUYPweysjAOIugxZRq1iyABbHUKYN7e5kjBQzw4KMBVplSXxZVXkZXDb/4y2GDzN98ldSN5jKl2S5D/3eS+mlebT39FlH0PEuCOeKyj1/Srhc/tWvaY6ivesJEV0SAe3D0RDlQFg66t7jwAzTT7YxyCOgbSHz0KSaCgRggAVSgC5I0TukrR2KZEV7k6ldekN51DymZ6YPadvWqkZdQqKunVGdhNd9MvzkyrtXgnU99teDlCvuVSiNukodF7x/SKp8wZGWKQXBnaPHAYAggNkLfpshpfE5aKPqiHQ+QyMvDEB4bprZ7N5tPZnAFs7QZxATumlmSuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lbk19TW9tvFSdcp/RjK1f/3JYaD9dIFpQrVMQhJU58s=;
 b=Kp5gSyBf0lpmv4S5F9csTdmPMlQEppOGDvAMikHI/sk+q6MNJRNmaZOScpjAKhOeUZHMxDUBLuu2fXxLKb+I9cY+JPz0vIsvk60Uk1mVvhcWjXchZ2a8yrCzrimOvIUqeT7L4vDJ33GTtKWqrmfdoiIe6sWRExetPnEoJNT3+nmsA6lyKi9Tx+CQ0Wxt9J2ea8uwSQPczUr9ydtIs7pvHbzyvdvUWICAZIW6x1f+ev9kBj4ykQUpRHQnrCn5osTdCn+FqVqUdh4Ax8WwXVD3RWm552GeKWtPN9vxPIBkXWFnRzLNw/RJepqvnQbjYZEGjBqE4+P2A+JCBEAAcp38Ng==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nutanix.com;
From: Mark Cave-Ayland <mark.caveayland@nutanix.com>
To: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com,
        sstabellini@kernel.org, anthony@xenproject.org,
        edgar.iglesias@gmail.com, qemu-devel@nongnu.org,
        xen-devel@lists.xenproject.org
Subject: [PATCH v3 10/28] kvm/i8259.c: always use cs for I8259CommonState variables
Date: Mon, 19 Oct 2026 13:04:42 +0100
Message-ID: <20261019120517.1448687-11-mark.caveayland@nutanix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019120517.1448687-1-mark.caveayland@nutanix.com>
References: <20261019120517.1448687-1-mark.caveayland@nutanix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0159.namprd03.prod.outlook.com
 (2603:10b6:a03:338::14) To PH0PR02MB7159.namprd02.prod.outlook.com
 (2603:10b6:510:16::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7159:EE_|DSWPR02MB11441:EE_
X-MS-Office365-Filtering-Correlation-Id: 664d7082-eac1-4bb8-74f3-08df2dd95274
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|22082099003|18002099003|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	DNcdofC6+Eo79BdindphJBSiYJ3tQvFrM8u3qzHELnyF/9Hnw3UKKD6ia2Qk3ut3l3U0CoCduQrqT7mvF8RsuZ8ZZqo259hpnfrWLu1dDreaYYS6fTHDh1nzTTV7np7YxSrBZHDT+yZ1AeZ2LNXi/VL/R7WmDCD5LRNUCcocJeH+pm/dn0iOptDzpo/jbLD5C5ZDkziVhtl6kG1IIqJvajmlnMwDakPXq2FfPzEwXxLiSBDxXIcqERuUZPHhS+F80Bx4xWB0dGPXmH/p5DnUc3cfvzscZd3NRfGfSNwXrpZk1pYs9+oRMRm+yll0M9N9m00Rjcu8PBIOt2NYCes5jfj/ec1vuQtvAuonQ2GqktrnQxUJGhRnt3mLFRTmORGLN6vO5IXdx/v2jLUNA+z+MKAd7ItvTtzPSqDUZD0Nz68grW+ksNe1JR4r7g/lkmIanpDbR7tiEy+gwqiZECFwlIMdYqq2XDptaDIjk0wXWN67WjT12cK2HmQcYb8eYUF0Zjg92NeuF3oNgzeSaBV3KEipEjwWIS5uWnQEKkqeN4lulrudWNDtezCbOxb0+bwAOE00ivbV9pHhq/q0IS472CW9SGkGaIE68GlSjadAnmwjb9tkmxhre4KH93qx+WY3wsrhO2isyWkRRDjEjK2slb14iX5DYi5VhoSKRY+QBCY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR02MB7159.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(22082099003)(18002099003)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+FaweITFlPhTHLOScfKBf8ZBoOcxkKxxBJ7OxTIZ623OKINUhBBIZV5wYBJ+?=
 =?us-ascii?Q?JjAZHyvLzZn9hJ2KjHKRNXyg03RnfRh/7TrYuFkIg9UW6eMoc79a2vUxq31I?=
 =?us-ascii?Q?JKv63tQFAOSVLBU5WDE8XESgzKEUui459qTZy24+CuDsx9ZWzQ3bt/b09bif?=
 =?us-ascii?Q?Vyg61/EokMl5ZOKkI9dL9XYOlxqHGsQlOXOlzkCstHlCf6Q42WR8A3dZVYyy?=
 =?us-ascii?Q?h3JlptBX32q+lxUN0aPRhDwVwGwdZxjo/HAmlwp8jbHdT/M2pwHj77/XJ5Fw?=
 =?us-ascii?Q?oCQbwF92/EUfGb3cHMLDhzruQ3cuQMn6daSH/BChynnKbBjFTgq5pvnRw8g/?=
 =?us-ascii?Q?aY614XNq8t1a0U5yg5exFgru2PhhDRAoE1qkjLQL5JP0wHDv2avvozYAWBB7?=
 =?us-ascii?Q?T2AQPU9wv6tKraB8L1zMKKNGxf0XFDf0Ey0egI8o1Qu6Cw/ToE1EFvLNO0DR?=
 =?us-ascii?Q?uCX4KQjub8oKYDFloArvy4t7YFA9QVJ2fHqe6Qf8byB2Y9e92rbNyWTKDiHl?=
 =?us-ascii?Q?WDy4ku3uwMQotrQOUte8TdmLKD4zYjyBj0Dgo5Khfy7xvxXfTYxAE4tCw2hU?=
 =?us-ascii?Q?zVuTQ0Pu1ZUsCiOD+rZRDQGgwCR6hx8Fcs4JQT6jtlPVM6Xcv0Xb3izz2Hwp?=
 =?us-ascii?Q?Fo7HTTQh6FuaB95eliBmuBh0l3y1ohHrMT4daOh1fVh6ntTf5xV+/k4G5UW+?=
 =?us-ascii?Q?O4/fJMDLs7F4ccbM3rZlZKfsZMh0wjcQadlvQY9DzqNiXKKqUM6jDBU5S9J5?=
 =?us-ascii?Q?YFtK8odJeFTfR9hR6yNarzDoUfLxawAcIFA/pMbweSUkDuC3VJyZ8vuH2ywL?=
 =?us-ascii?Q?Y1rPg+gJwjKE+ROzv9y9a+33Qkj5NhvpvtXVSaj3QNRKOZzGJuX4IbtOK5Lp?=
 =?us-ascii?Q?V05tqpDiUp0SuOEA2NSIoVwayC/40LX412U6tp5n9jwUgP9DT0fr4oklzxUh?=
 =?us-ascii?Q?s47zKuNJ7hmCmnBg8noE2/X8rzoWAPMIN1ErspifZlKDgWE4IShR6ozXIeI2?=
 =?us-ascii?Q?2143cc1P846Ho2V/CW9BP+M+h943RvKUS7Xqg0hAYPHoyj730pOKyHcu5h2B?=
 =?us-ascii?Q?L9+9LOTJFPeN8jzPK2C85pKLoB7FVXSeGz7t9vhPA5FYQ2E6VBpaMM1wgDiD?=
 =?us-ascii?Q?HUPJ/9CHQn0LBv7cFYPxoPT6babz2+1Zv4dPbuhtv5MeoCNeXUClTxF/bcfm?=
 =?us-ascii?Q?M1Qkx+iJ6Gn8v0uI+PbSb8EP8tUAnKl+bB5y4CiUVuYFUEEqOL4YKBSxZ07N?=
 =?us-ascii?Q?AgfozprEWvIAStFzlECXhVkGlii+spUCprv1sf1kRdHfzlEstXggUlXr/yCw?=
 =?us-ascii?Q?DksCs/qvaX7bZdp7Xgf6gqfjlHXgdUh7XyxCGSsKgUNSdjpTTpUlZXzpSls6?=
 =?us-ascii?Q?peXTGPoqSxBCm95cPTG4Or+6d14yyygQMH+hw6+s/hjtiTQQu2VyWScHcw5D?=
 =?us-ascii?Q?0wzrISfgJ0EIJDLC9EVcOGEhcO7F5CrQucj2Pg2dM3+k9umR90x2VGUUVtF4?=
 =?us-ascii?Q?c6FybT6rE6ci5mvCELRZ/VdswrzE+TPcYerLduogZGRkRNs/PybTQv/QDWck?=
 =?us-ascii?Q?Q70BnLQ3tNg+CI+CEIKVx0XgbboxSrICHjdNUIfu3i/XmgyUM6mDX/i+UGjM?=
 =?us-ascii?Q?babbDc1r4XjHbIK58Eb/Mq1AyoClC35o1T9otn1OT74f5A/GHLk6rCeNqFc5?=
 =?us-ascii?Q?H/oliSJ46ITbyUz+0VhnvF7UV0/kLTJn1wqrl2+BX1KIsABk4irGASBs8WC1?=
 =?us-ascii?Q?sF89OOKr78MByjZleLBknfU4duT2lns=3D?=
X-Exchange-RoutingPolicyChecked:
	NYoYe5ZQh+IJL3yVsorUcoK9xqjiTYJj5zCRYauQ9EDMLpdfq1bgV3XoJFXC89v/5kxJtXtPqllgLSyaYodDDelXG570rxY6l1HcdOrSAqYqzNUDhCQirQpQQ8JnsHu+H0Om/vVxOJ4DEXLoW0cr5wk7dL6kBaREkg3MLDUqmfVXLXLbTIzvlT0ay24eFCrgGHxPY+sL8sBOfSIkpH69cOb25miX93mSsVly/sQOaIuYX1i+rfJkaQfRMuWfZYcH9WiamCi8uwYpCYNiRnStKTpwQ4K1Erz3e4n5o+Brl+uGgswmEShgHNRgalw8AbDs6PZqrTYHvtcoysa2lOYnjQ==
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 664d7082-eac1-4bb8-74f3-08df2dd95274
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7159.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 12:05:52.6814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U7fQJz3xzWAj40tqIcEBFSh8J1FYOJ5H4OE4qGwe7HW8qGxTE3fhaAMwR/VE4Xs9jI/w5IAJE1RtDRjmtD0rxghhnjLRk1NQ2OoBY1LBb08=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR02MB11441
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0OCBTYWx0ZWRfX7ityboHlymxu
 Fyec8+xxXXnQJ1cFmYPFLPKAy+LK1geK2y3uqk7/SchtDUHY+2EogFOUM2oE4vjBOABZWRAUIm4
 IOpfoleUkRZbt8HexgmjH37KXlUFph62FX/cqC/Jna3ETR7yLteFOR6xP5PQ8bTdt5J+qXW74eW
 aVNXjL8n0hspLO8lVCkF8txtT1hNV4oAs+30Kqkh4X9WUm1tFB3NND3Hj/TvarBhabxX3yR6Y7S
 FbVsHn7LhEIbK4jiSRUr1oVhKpm+r8PxdHKsE18hmZ47tDmn9w+rsDQhIxBV2zilzuaf6aIbp2Y
 L2fBZyRUjmoEr+DkeXJDwZOUjf+oz0ATTHGtReRqQtLr4O2Nxf2usPOg32fAaXDu/xJ+maoPNe3
 xub62pAaYKbQZepMhf9RaLkPXhRqJCTfqWoHB5JsVeasDoYKT7JMUjzAWDi/Crnf1LuxS/zqTPY
 7JnEnIWHArQ+YafXRGw==
X-Proofpoint-ORIG-GUID: JEJCLSAGkLLZ8ggYXLX5mprfzN9JsT5Q
X-Authority-Analysis: v=2.4 cv=RI8mjIi+ c=1 sm=1 tr=0 ts=6ad607a2 cx=c_pps
 a=+dppALzRPzum89W2H5IdTQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=0kUYKlekyDsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VofLwUrZ8Iiv6rRUPXIb:22 a=y4UcunY2MAxhM4LwGdWI:22
 a=64Cc0HZtAAAA:8 a=KKAkSRfTAAAA:8 a=zNa_6NNZsa7Vo5epgMYA:9
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0OCBTYWx0ZWRfX/nh03BvmvOcY
 JIbaM1gVxRGk3E+/HrymdEik7W9iRnyG8adSTD24bMTAtVudgOuE1n9MKUWImNCJEKQEp547Wd1
 7DcjM3pzo07B/O+Hp726JlV3pSDEB6M=
X-Proofpoint-GUID: JEJCLSAGkLLZ8ggYXLX5mprfzN9JsT5Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Reason: safe
X-purgate-ID: tlsNG-c1860d/1792411558-D674387B-8AE2E1FB/0/0
X-purgate-type: clean
X-purgate-size: 5300

The use of consistent variable names makes it much easier to follow which
fields are being accessed from I8259CommonState.

Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/i386/kvm/i8259.c | 86 ++++++++++++++++++++++-----------------------
 1 file changed, 43 insertions(+), 43 deletions(-)

diff --git a/hw/i386/kvm/i8259.c b/hw/i386/kvm/i8259.c
index 8ae5dd39b5..86b1ffea4e 100644
--- a/hw/i386/kvm/i8259.c
+++ b/hw/i386/kvm/i8259.c
@@ -36,13 +36,13 @@ struct KVMI8259Class {
     DeviceRealize parent_realize;
 };
 
-static void kvm_pic_get(I8259CommonState *s)
+static void kvm_pic_get(I8259CommonState *cs)
 {
     struct kvm_irqchip chip;
     struct kvm_pic_state *kpic;
     int ret;
 
-    chip.chip_id = s->master ? KVM_IRQCHIP_PIC_MASTER : KVM_IRQCHIP_PIC_SLAVE;
+    chip.chip_id = cs->master ? KVM_IRQCHIP_PIC_MASTER : KVM_IRQCHIP_PIC_SLAVE;
     ret = kvm_vm_ioctl(kvm_state, KVM_GET_IRQCHIP, &chip);
     if (ret < 0) {
         fprintf(stderr, "KVM_GET_IRQCHIP failed: %s\n", strerror(-ret));
@@ -51,50 +51,50 @@ static void kvm_pic_get(I8259CommonState *s)
 
     kpic = &chip.chip.pic;
 
-    s->last_irr = kpic->last_irr;
-    s->irr = kpic->irr;
-    s->imr = kpic->imr;
-    s->isr = kpic->isr;
-    s->priority_add = kpic->priority_add;
-    s->irq_base = kpic->irq_base;
-    s->read_reg_select = kpic->read_reg_select;
-    s->poll = kpic->poll;
-    s->special_mask = kpic->special_mask;
-    s->init_state = kpic->init_state;
-    s->auto_eoi = kpic->auto_eoi;
-    s->rotate_on_auto_eoi = kpic->rotate_on_auto_eoi;
-    s->special_fully_nested_mode = kpic->special_fully_nested_mode;
-    s->init4 = kpic->init4;
-    s->elcr = kpic->elcr;
-    s->elcr_mask = kpic->elcr_mask;
+    cs->last_irr = kpic->last_irr;
+    cs->irr = kpic->irr;
+    cs->imr = kpic->imr;
+    cs->isr = kpic->isr;
+    cs->priority_add = kpic->priority_add;
+    cs->irq_base = kpic->irq_base;
+    cs->read_reg_select = kpic->read_reg_select;
+    cs->poll = kpic->poll;
+    cs->special_mask = kpic->special_mask;
+    cs->init_state = kpic->init_state;
+    cs->auto_eoi = kpic->auto_eoi;
+    cs->rotate_on_auto_eoi = kpic->rotate_on_auto_eoi;
+    cs->special_fully_nested_mode = kpic->special_fully_nested_mode;
+    cs->init4 = kpic->init4;
+    cs->elcr = kpic->elcr;
+    cs->elcr_mask = kpic->elcr_mask;
 }
 
-static void kvm_pic_put(I8259CommonState *s)
+static void kvm_pic_put(I8259CommonState *cs)
 {
     struct kvm_irqchip chip;
     struct kvm_pic_state *kpic;
     int ret;
 
-    chip.chip_id = s->master ? KVM_IRQCHIP_PIC_MASTER : KVM_IRQCHIP_PIC_SLAVE;
+    chip.chip_id = cs->master ? KVM_IRQCHIP_PIC_MASTER : KVM_IRQCHIP_PIC_SLAVE;
 
     kpic = &chip.chip.pic;
 
-    kpic->last_irr = s->last_irr;
-    kpic->irr = s->irr;
-    kpic->imr = s->imr;
-    kpic->isr = s->isr;
-    kpic->priority_add = s->priority_add;
-    kpic->irq_base = s->irq_base;
-    kpic->read_reg_select = s->read_reg_select;
-    kpic->poll = s->poll;
-    kpic->special_mask = s->special_mask;
-    kpic->init_state = s->init_state;
-    kpic->auto_eoi = s->auto_eoi;
-    kpic->rotate_on_auto_eoi = s->rotate_on_auto_eoi;
-    kpic->special_fully_nested_mode = s->special_fully_nested_mode;
-    kpic->init4 = s->init4;
-    kpic->elcr = s->elcr;
-    kpic->elcr_mask = s->elcr_mask;
+    kpic->last_irr = cs->last_irr;
+    kpic->irr = cs->irr;
+    kpic->imr = cs->imr;
+    kpic->isr = cs->isr;
+    kpic->priority_add = cs->priority_add;
+    kpic->irq_base = cs->irq_base;
+    kpic->read_reg_select = cs->read_reg_select;
+    kpic->poll = cs->poll;
+    kpic->special_mask = cs->special_mask;
+    kpic->init_state = cs->init_state;
+    kpic->auto_eoi = cs->auto_eoi;
+    kpic->rotate_on_auto_eoi = cs->rotate_on_auto_eoi;
+    kpic->special_fully_nested_mode = cs->special_fully_nested_mode;
+    kpic->init4 = cs->init4;
+    kpic->elcr = cs->elcr;
+    kpic->elcr_mask = cs->elcr_mask;
 
     ret = kvm_vm_ioctl(kvm_state, KVM_SET_IRQCHIP, &chip);
     if (ret < 0) {
@@ -105,12 +105,12 @@ static void kvm_pic_put(I8259CommonState *s)
 
 static void kvm_pic_reset(DeviceState *dev)
 {
-    I8259CommonState *s = I8259_COMMON(dev);
+    I8259CommonState *cs = I8259_COMMON(dev);
 
-    s->elcr = 0;
-    pic_reset_common(s);
+    cs->elcr = 0;
+    pic_reset_common(cs);
 
-    kvm_pic_put(s);
+    kvm_pic_put(cs);
 }
 
 static void kvm_pic_set_irq(void *opaque, int irq, int level)
@@ -124,11 +124,11 @@ static void kvm_pic_set_irq(void *opaque, int irq, int level)
 
 static void kvm_pic_realize(DeviceState *dev, Error **errp)
 {
-    I8259CommonState *s = I8259_COMMON(dev);
+    I8259CommonState *cs = I8259_COMMON(dev);
     KVMI8259Class *kpc = KVM_I8259_GET_CLASS(dev);
 
-    memory_region_init_io(&s->base_io, OBJECT(dev), NULL, NULL, "kvm-pic", 2);
-    memory_region_init_io(&s->elcr_io, OBJECT(dev), NULL, NULL, "kvm-elcr", 1);
+    memory_region_init_io(&cs->base_io, OBJECT(dev), NULL, NULL, "kvm-pic", 2);
+    memory_region_init_io(&cs->elcr_io, OBJECT(dev), NULL, NULL, "kvm-elcr", 1);
 
     kpc->parent_realize(dev, errp);
 }
-- 
2.43.0


