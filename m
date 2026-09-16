Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64524C88E77
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 10:45:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1422581.1647956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6n8T-0003PK-6y; Wed, 16 Sep 2026 10:45:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1422581.1647956; Wed, 16 Sep 2026 10:45:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6n8T-0003PD-3n; Wed, 16 Sep 2026 10:45:05 +0000
Received: by outflank-mailman (input) for mailman id 1422581;
 Wed, 16 Sep 2026 10:45:04 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mark.caveayland@nutanix.com>) id 1x6n8S-0003KK-0c
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 10:45:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6n8R-009uGc-Cx
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 12:45:03 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mark.caveayland@nutanix.com>)
 id 6aaa732d-2eae-0a2a0a5409dd-0a2a4506cbf2-6
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 12:45:03 +0200
Received: from [148.163.151.68] (helo=mx0a-002c1b01.pphosted.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mark.caveayland@nutanix.com>)
 id 6aaa732d-195a-0a2a45060019-94a39744f828-3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 12:45:02 +0200
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68G8j54J700548; Wed, 16 Sep 2026 03:44:57 -0700
Received: from byapr05cu005.outbound.protection.outlook.com
 (mail-westusazon11020092.outbound.protection.outlook.com [52.101.85.92])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 4gqa0ka9vx-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 16 Sep 2026 03:44:57 -0700 (PDT)
Received: from PH0PR02MB7159.namprd02.prod.outlook.com (2603:10b6:510:16::8)
 by MW4PR02MB7380.namprd02.prod.outlook.com (2603:10b6:303:74::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 10:44:56 +0000
Received: from PH0PR02MB7159.namprd02.prod.outlook.com
 ([fe80::8e97:bc32:822c:b250]) by PH0PR02MB7159.namprd02.prod.outlook.com
 ([fe80::8e97:bc32:822c:b250%3]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 10:44:56 +0000
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
	proofpoint20171006; bh=v0kaGrtHuAWW3BhosR58UAq4Y91huIt/VByeAJS2U
	co=; b=dse14ZTYUTLslaaYJwd1AdvlSIwpiyGZovETRTb94qD1ZfKjBAsUmM58p
	t2fn2D6OvQ6x8zYQSZc2AZS25EeOqQ9qkaHRbRNoIUil7jQoh/InpJXbhSr6dydW
	Jn/vftsoy7Hw/ziJ7Um8uBFTDvgYPkx1vabyX+AQ3picI8aoAdRnoCqoPjcJc9RJ
	K1VAC94Kw4OXOXIUHWEG1ZM1Z5YEjMtn9bC1er+dRxe8NVfCt629OFo+G65Gid2p
	y1ROGUpSTUNfT/zWGZzkYmB+KKkoo45qh4MpUN23cmnBncoPkyrgYL6pKbdcYu3z
	RznQCX8I0OiqmnKrdndF262cOW4CQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cOZHR7B0KZ10MZ5h7Hu45RrRKErR4xJDqbed9pBIujBoSW3sOqta92RcVPJ+MVZSjrlai5M71IPaVE9o7Np8gWy5+m1t0rUj0Zn33SwA92sKVfrouRWIqTYB5XmDoHkyu9eiBggwWm4k3AQcwNnpu4hy4O9q+yIp7US4Ua6a7H02zzBK8xaVwaWfk/Pw61CgyEH2xbl/q97+RQfGE0eKawNBVhzpNMO+47LlLkEDI2xa+SYc83b/EQ6atRC15ssgDpyxlPWfGir1VUrTBGVetN8gyb+g5GoTjGCOGMkbKYf/QFkWN0fT4G9c4Ad5KCbi6eiUIsmPWLegeXdjyUswVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0kaGrtHuAWW3BhosR58UAq4Y91huIt/VByeAJS2Uco=;
 b=NQ54SL+D+qsPMEEKb82HxvlK6MX1lYOwS1wBg4V+7x4CABbKlE1g+tRLaxSiUrNZhmNnx0K4RWec5zVdJ4o2yw/mJWyBzdJsV1M3g/XlwIdgS0ISFFowp48iEns5zlSdDFiYCCnApTFr1IpX0RYjprmWtoyDPdPPwcrhWIu3JXWoi7dnwMSrmrEHS7N358kag2RDdidni58HVInmOr2F/lUB8MP3ndE9QQquFhhPL0337e3wnE472DDWl6LD64oEpe6xFZGqMMKx4qR9IBQwXycauJhnxtidnLspR3F2lhd/OeIZTxNgVTVfqINMu0ZoCKV7JOC83zsYD4mF5RNIoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0kaGrtHuAWW3BhosR58UAq4Y91huIt/VByeAJS2Uco=;
 b=fm8ZRSb2cyR5AK1+NlVV8PivMgqzAvdhG9pvC0iCcBoZXXbKzSgxpB9kOb6t6hXxxx+6PVjsgDC6//HBQNGj7UFMHgLFmkogjTjI4R6hHWGLkYVhjc8RQczES1zF81WWE0MCzqnCBWwxd7M2WN0agabEScGNSIl7N21adMopsZZbmdJ7K1/88AnHhoaEpu8XFt33S6G+2/KgtsbcrApU/kwlCCQhxkeD8raeEky8LP8Lpns50cOYuGcBZQK6ZqnuTYMVeyQTNF4oCKAbTO6bKgWxWHzTcH4IsXAUZPhcOg9VVIFA6NUKf5tAt8gne3v/0WOc6qfo51+15mwvW6XTng==
From: Mark Cave-Ayland <mark.caveayland@nutanix.com>
To: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com,
        sstabellini@kernel.org, anthony@xenproject.org,
        edgar.iglesias@gmail.com, qemu-devel@nongnu.org,
        xen-devel@lists.xenproject.org
Subject: [PATCH 05/22] i8259.c: move parent_realize from PICClass to I8259CommonClass
Date: Wed, 16 Sep 2026 11:43:33 +0100
Message-ID: <20260916104435.600211-6-mark.caveayland@nutanix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916104435.600211-1-mark.caveayland@nutanix.com>
References: <20260916104435.600211-1-mark.caveayland@nutanix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0205.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::30) To PH0PR02MB7159.namprd02.prod.outlook.com
 (2603:10b6:510:16::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7159:EE_|MW4PR02MB7380:EE_
X-MS-Office365-Filtering-Correlation-Id: d6fecace-1a57-44df-fb14-08df13df8c39
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|22082099003|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	6XrZisVsJ2t8aDwyDz7LWugPmBd6G4B1BeuENS0ib6rXuq7GKZO8J9J6zIHC6uslGcsLZSpGdtuaSST2BrLHt9TysBKdgHtFg7WoxDRwehOWt26fIO98+esuL8gXrFHLM4dTx7PAqeejKUbEEvVk4XIqaZfi13BIUEB/J/qGvRl0N55zY/b5QP6tGro9sd7f9VQxoajL/Skidi1/+f6gYwdlaA6ivkO/ej8JAIm2nsC4rfU/ZL8noZi+m+77WFmFsHQiP61o8fXHj7ViqGKLqjd2JYqFcb6zvx4hEcTvcggl4CfuMrOwRkvsJVSJSl3cZscrtrtv0DNuEJN66Zonqm4IdttnW9sYyn4Zf94lK9TAosK4VoPQInORS6+oP4B+Jp5+DGzsdOfIh6Qq59H8yFbVCW5ftVAAA+SxyKqeXqXp9VnawjBQs99ArU6GE7yWjKNjb/Ynsna7gN+8YKg/a5l1hIBAIIA8s0bp32G6yM1h/dsMJF+Fa/MqsbTqrPsIzFCsFFxrQfUWqWC7wri8DRquH18drMpd46vDvBqWI7ei4Kpau0npCI5Vu8MwUv0T3Y3XYK65oB6LSxpf1bQ5f37if0zlpOqGjShlnqNjD9u4mErAAMysUWSXsrAsAhvh7lgdqVyEC+pFOX3j1sBbXrGoo3vtfVG+/FJEfCF6fCs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR02MB7159.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ws2oX42ZeYUHrXOtJ5se5MwjBoOUjxH2V/pu6fizyM/2kiK/1N1BN5HcayCk?=
 =?us-ascii?Q?3LyzfZD16sVuMlyErwUIKk0eNQ72VO1aAVD7Z53rMMHYGz2RzGdIJSvX35Eh?=
 =?us-ascii?Q?zGFWamTNfCuiRdx5fQUzgKS9AdXqHbFshFGZknLxeHWSyEqo5Le2x1BRJV5i?=
 =?us-ascii?Q?pau8cvoBcRRlwVmtz9kHEVM5DrEWHt32Y/Qxqc0BqwmBf/J4XUvAWPrmh9Vr?=
 =?us-ascii?Q?Pvtu0L3Azegu4FhYRR9afL1rjA8bT2cJ2MoLfuLxFQp0s29Xu8dH8Uivj5Id?=
 =?us-ascii?Q?3VcbTTmOrlYv+cRerBmNifeMoOwjO9IOIE410Q1IknAREmLk9whlWRCDc6GL?=
 =?us-ascii?Q?RPBfle8ZIgRMdLGdBI2WVmd8kvr0HnqbTaAk3M3rMmjmUwRS+WMmJTmOg1sb?=
 =?us-ascii?Q?HpnuL+TxtmxeFU324/l5qB/O4UXXPZJpHaIsJwRxq9J566dRULPNeCRvROqE?=
 =?us-ascii?Q?HuuDv/kn921/zihffHS2ZXpWb/TiZyyeU867RBgxUPgg3olQ2knXzpr3y6Tv?=
 =?us-ascii?Q?sYkRpIhQAouqgTDamYcoLHwHigpfo8sVg0HzLxDxblL5UFM/2pihjf0rp8TL?=
 =?us-ascii?Q?Ce3ztaLfUPkxCHVzC0gP3DGiP7XVD2DN/N/GRMtwxyyIvrsO7krbAhvFr4Vt?=
 =?us-ascii?Q?ppSybhB7qozc1aMQN/ag3q/XZV76po+C20O5HjA3b+8JchWof92Lzr2TsJhh?=
 =?us-ascii?Q?DvslmjuAGr2di8eGOrx6hXbyDZ2dq5Iz0/PrnkCT4zkVS3BAK3ts5+rQRHkq?=
 =?us-ascii?Q?Vjpsks9F7NgOvzskO+lJCRTOhMvjgcvSQSIEKgacVjP8oJ5CXQcmBz5zET1M?=
 =?us-ascii?Q?n6GVla5t6W1bG4xZ1p9jZZ9zNiFyl9bg68jAv1/KuBSqpfqZjXorsb6TM9CR?=
 =?us-ascii?Q?uo5teBQKrIj4ij3SRpbc8TL+QN/ow/R1+bK3Twcegqjp53VG2vx1ZLHNjA/v?=
 =?us-ascii?Q?2AoarONCnXS5/1ThzHrlRV0MVR6OXJijx9GPyYq8JKXBWdM/pHCzBZcD1UaA?=
 =?us-ascii?Q?nYOFr1o32EroojmFF9iM5Uz+g7IXIGaOUTKh49VJeddAMd7N/KOogXh/gMpo?=
 =?us-ascii?Q?XOVxDmu8ZvKlvObn/t3otSjM4K10rHBbjwaovd23bSqG3H1Ygw870Ds4B9TW?=
 =?us-ascii?Q?iNxxsXmd/XXldUN1jsdJ9I/VuQ1XDN4M1igiJQ4HgaPCsEZIJwUhA7OVynxI?=
 =?us-ascii?Q?qJ3BYUA//pTAQD0oeRqXX2pygTvIMKKUQ8QqK9+K3KA51ErARIfRzk7MrEgd?=
 =?us-ascii?Q?T9Gm/V/CwkJW+jAH6++zgDlczgS6zfvgybqqpFUurt8uLqg12FxlZiEsa7xB?=
 =?us-ascii?Q?ogNUfBGzfXvn58qEB0p9S5c/K5ujfgzconh8PQGmav0YQSWsBulg6KbSnGdr?=
 =?us-ascii?Q?7uxDaqsAK9KY0nyu0DVD6rr2MUOGevgfkjMqOpnAY6V3PNndc/cJvglZJINy?=
 =?us-ascii?Q?UAH4uCOygWbneKaHXU+SpkSLsK941r1yv09BXdH36+mTy8UKBEDj+PmT/dsp?=
 =?us-ascii?Q?GsUJPordlD1RP8YZPe/OTI2GOW52Prcwpr6qlmLqa2L6JC9EQaruFtOdlTwg?=
 =?us-ascii?Q?66UGoqu7lLK8ypuQHHKLX+PbOuMGs9TlvedtIAuYNBrnqLXF5V0l9Y6IYxiP?=
 =?us-ascii?Q?kPLjYlTd2Em18kJSZbRCMqnhkql5U50kEnkC81pJaY1ICfWr3RFjxGvG74/M?=
 =?us-ascii?Q?GU6Z1M/ul8CF7RRpjyi9CJycPEr6H4s3JvlOcYW+a7PmN1IGVSquVP25ZNSi?=
 =?us-ascii?Q?2XWXsdmoOGNqWfG7zk35DxHqsb64bDc=3D?=
X-Exchange-RoutingPolicyChecked:
	qZqCFZo609+/6AAEK5jj4c5MtFYNF+p7zgH/aSytJnrlgV/f1shxLwq8f3D0T9EcZwtUBvZel6jeSxOinRlSVdyX0yLJmC0L9Z+Pipn0Q11sv4bpoK7lnR/cVXsAfHGEK10QQdrxsTS3wYiMZOVs8dmZ7OSUOEkdS4zShDoosVVmJpopqY45DODJNwtvISbNyEm6bdj86US4u1k7SpNsJx+XQVbRCywZiu8ufh5D8Ag0dIAvohDd0gZpaR48oPGmbzaXqhPgDNCgqsQv9EmvuzXpo0Xj22BAYsdYfJ3vQ7DWLKU6ZlUXtfeZkC+gc0lBvtd5j0aRrUek8haNamKZaQ==
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6fecace-1a57-44df-fb14-08df13df8c39
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7159.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 10:44:56.3169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GCvl1ght25PaCEj9zR6R2GF/tWG9ndXTToP3OHyNObdTy0YHeK+pAl0RX7wXyy8WP0cT7/34n8+h89n2Hk2dGx4niDEG8SD8fb3TUAN2ygU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7380
X-Proofpoint-GUID: 6S3yKRD2RXniTedcURJuooGA0kiTLUxg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE0MSBTYWx0ZWRfX+fd2EWzCHdks
 UsyjeJCBtiIMuotuc2DI6cdp8NumtpdpryfYHgzy838au1MmsZqvpLIxg3GHnsWbU4grQU1iBM1
 TVAd0bAe4onLW+CLpG1esk92On9Bl1k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE0MSBTYWx0ZWRfX1amkBnlD4tw8
 QRnJvbvhnkPkcX3EN6upw8OuOu/IZmj7dNYcO6wJxx2/jCRb5KxFgAMcPv9sLaeixMJ6gadOy0W
 QesPP5XSve9qPDylAyeSM7ZKAPWx9s5ywCRjKur+zl3MgHOUBtXL6WQh8luMEYhKQq8lrUmTsjb
 5zC7P6FjfUHuQEOJJS47On0bwVVbSm3Hpjo9BNXA3LOXZdUJur6UX03L1hsqedFuVy+XL/QEZmt
 aQ24zRlI6qclTyvQckbFAdgnbIGOK6pDq4vOf8fvYUeei3jyM6T+bhDmiVW4XWSDxg8uWIhW/RZ
 4CeaMfwabFnIRhMv2MCzajUfXBUR9TBs2s2QxQgMrVjTZzgkyOX5F1evBnOo2Ejv1dbEhbscRy2
 XmuQRMXb77sHhen+fe6mQ2yBUWrwOfF0fi8cNGO+dpcjOYaxBSwP2Ph35KANxmvPsr7eOqbHvQx
 7dkDotVDQLaQkAJHXmw==
X-Authority-Analysis: v=2.4 cv=P46vFSAu c=1 sm=1 tr=0 ts=6aaa7329 cx=c_pps
 a=rN54qV+o3v1qfa0lUeS+bg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=0kUYKlekyDsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VofLwUrZ8Iiv6rRUPXIb:22 a=Ap8k9tRZuQ82DLYWQqG7:22
 a=64Cc0HZtAAAA:8 a=REJzgUj2r183NUftQ48A:9
X-Proofpoint-ORIG-GUID: 6S3yKRD2RXniTedcURJuooGA0kiTLUxg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Reason: safe
X-purgate-ID: tlsNG-16d1c6/1789555503-F5E0E77B-7109FD4D/0/0
X-purgate-type: clean
X-purgate-size: 3022

Both the emulated and KVM i8259 implementations store a reference to the
parent_realize function in their respective classes. Start by moving
parent_realize from PICClass to I8259CommonClass and removing PICClass since
it is no longer required.

Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
---
 include/hw/isa/i8259_internal.h |  2 ++
 hw/intc/i8259.c                 | 21 +++------------------
 2 files changed, 5 insertions(+), 18 deletions(-)

diff --git a/include/hw/isa/i8259_internal.h b/include/hw/isa/i8259_internal.h
index e039d6f067..e2b0b00f5b 100644
--- a/include/hw/isa/i8259_internal.h
+++ b/include/hw/isa/i8259_internal.h
@@ -37,6 +37,8 @@ OBJECT_DECLARE_TYPE(I8259CommonState, I8259CommonClass, I8259_COMMON)
 struct I8259CommonClass {
     DeviceClass parent_class;
 
+    DeviceRealize parent_realize;
+
     void (*pre_save)(I8259CommonState *s);
     void (*post_load)(I8259CommonState *s);
 };
diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
index 547e86c5f4..131aaf9b04 100644
--- a/hw/intc/i8259.c
+++ b/hw/intc/i8259.c
@@ -35,19 +35,6 @@
 /*#define DEBUG_IRQ_LATENCY*/
 
 #define TYPE_I8259 "isa-i8259"
-typedef struct PICClass PICClass;
-DECLARE_CLASS_CHECKERS(PICClass, PIC,
-                       TYPE_I8259)
-
-/**
- * PICClass:
- * @parent_realize: The parent's realizefn.
- */
-struct PICClass {
-    I8259CommonClass parent_class;
-
-    DeviceRealize parent_realize;
-};
 
 #ifdef DEBUG_IRQ_LATENCY
 static int64_t irq_time[16];
@@ -388,7 +375,7 @@ static const MemoryRegionOps pic_elcr_ioport_ops = {
 static void pic_realize(DeviceState *dev, Error **errp)
 {
     I8259CommonState *s = I8259_COMMON(dev);
-    PICClass *pc = PIC_GET_CLASS(dev);
+    I8259CommonClass *k = I8259_COMMON_GET_CLASS(dev);
 
     memory_region_init_io(&s->base_io, OBJECT(s), &pic_base_ioport_ops, s,
                           "pic", 2);
@@ -398,7 +385,7 @@ static void pic_realize(DeviceState *dev, Error **errp)
     qdev_init_gpio_out(dev, s->int_out, ARRAY_SIZE(s->int_out));
     qdev_init_gpio_in(dev, pic_set_irq, 8);
 
-    pc->parent_realize(dev, errp);
+    k->parent_realize(dev, errp);
 }
 
 qemu_irq *i8259_init(ISABus *bus, qemu_irq parent_irq_in)
@@ -435,7 +422,7 @@ qemu_irq *i8259_init(ISABus *bus, qemu_irq parent_irq_in)
 
 static void i8259_class_init(ObjectClass *klass, const void *data)
 {
-    PICClass *k = PIC_CLASS(klass);
+    I8259CommonClass *k = I8259_COMMON_CLASS(klass);
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     device_class_set_parent_realize(dc, pic_realize, &k->parent_realize);
@@ -444,10 +431,8 @@ static void i8259_class_init(ObjectClass *klass, const void *data)
 
 static const TypeInfo i8259_info = {
     .name       = TYPE_I8259,
-    .instance_size = sizeof(I8259CommonState),
     .parent     = TYPE_I8259_COMMON,
     .class_init = i8259_class_init,
-    .class_size = sizeof(PICClass),
 };
 
 static void pic_register_types(void)
-- 
2.43.0


