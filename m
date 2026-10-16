Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E94BCC6B38
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 14:22:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451997.1666879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHiog-0003Pc-NF; Fri, 16 Oct 2026 14:21:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451997.1666879; Fri, 16 Oct 2026 14:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHiog-0003PO-HS; Fri, 16 Oct 2026 14:21:50 +0000
Received: by outflank-mailman (input) for mailman id 1451997;
 Fri, 16 Oct 2026 14:21:49 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mark.caveayland@nutanix.com>) id 1xHiof-0003Im-ND
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 14:21:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHiof-00Aqsy-3k
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 16:21:49 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mark.caveayland@nutanix.com>)
 id 6ad232ef-bab6-0a2a0a5309dd-0a2a45069fdc-22
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 16:21:49 +0200
Received: from [148.163.155.12] (helo=mx0b-002c1b01.pphosted.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mark.caveayland@nutanix.com>)
 id 6ad232fb-195a-0a2a45060019-94a39b0ce3f0-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 16:21:48 +0200
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69GE5MK83333355; Fri, 16 Oct 2026 07:21:43 -0700
Received: from dm1pr04cu001.outbound.protection.outlook.com
 (mail-centralusazon11020128.outbound.protection.outlook.com [52.101.61.128])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 4haukukqe3-3
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 16 Oct 2026 07:21:43 -0700 (PDT)
Received: from PH0PR02MB7159.namprd02.prod.outlook.com (2603:10b6:510:16::8)
 by BL0PR02MB6547.namprd02.prod.outlook.com (2603:10b6:208:1c8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Fri, 16 Oct
 2026 14:21:15 +0000
Received: from PH0PR02MB7159.namprd02.prod.outlook.com
 ([fe80::8e97:bc32:822c:b250]) by PH0PR02MB7159.namprd02.prod.outlook.com
 ([fe80::8e97:bc32:822c:b250%4]) with mapi id 15.21.0522.016; Fri, 16 Oct 2026
 14:21:14 +0000
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
	proofpoint20171006; bh=GoegeKV1vQWnIJ04Hn9BEfV8vtJcqN917AjDT75f7
	DQ=; b=PO3i9xpGX1TOzmdZrEV5nXJdi6nzUdlsYwwkcjvxbM9nWDmdmVPX/MZ47
	AksHWmsUggOWTCAMwmP9AcpLj7saq2zGKUbnIz/b1baFZ/6UdjDg3hzor0vBSeWn
	rxA7W/ARzxnQqKtpuVFun56LJ5TpJvX98zzLXyFeHAWO23a4vwhshrWrFmSGUMhm
	KJdxgakVCAmo5gCOA/KI4+bnV4tTNf2yXQxr7raT38dWri2A6H8YGOAP8PzzU4iQ
	z4ETgoyzz5QFKTZbyEd0AvtmuS/LW0wWcig172VPsfN2gsF7/0T02gVNw4jDDhsp
	KXp5xeKV4ezipTaOmkFWqvnQerPtA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vyJ5VwhEadg2rI007DWrqolri3EgkbHapZk3fft0T+85CuCt3BQJe5bZgp3r+0rVtkIrXr4ZO0I9tSjZ4R1UElt3eLMFBBCYRpR/b3P7gxrgDk7g74qZoMAjXZEjB38xjzPG/CQRxP/ImIY7EZzXvjOzjHKvU2S7CDn9Ihlewl3LRjp1MBcuNzKKWK/zseQRUDGFN6qQsB14DkWdwn7UQ5X9s9lHjApBIojfH9RR4ucJYuVxFk4+CvffQ3QdGDngEAG+4qHZBZbfYNENfpAMVs0B8GSGOtXMoH/rMJpE5Yb7QKOcxGdy+tisr0eZXwCch/2V0eLPmRNMqyuO7XRocg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GoegeKV1vQWnIJ04Hn9BEfV8vtJcqN917AjDT75f7DQ=;
 b=jeHKAMvJ3qg3vgUAL7644nZZd3D3qvTgv8iBsL1AXYl4gezPxuFkVmnLqRvNbwANBemVdKtubPNk4CRyLSzZ57zmpRUATegAgCV8Eq0rbWcbdqvvyNXhbqpRX6Jn9bdKdZXBqgyZM493GOVeIua4DLdWsIaIiIKBBa9fE2N2JvQnJEY+4MZitLL4DsV1Mez5LujOiFBs7wyH6A/Q6LwQzEbxaip4OHT1HtpoECwwPw8lYVOlrn2puP6Npweb3EjIVX5f8snpNjlAuNeyUt5g1nQ+CEENF7fwcoJPTWd5YzQQyLccQ+j+F7mn0luHKNqKRmTyrxQ4+aUn4HaG8JC6+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GoegeKV1vQWnIJ04Hn9BEfV8vtJcqN917AjDT75f7DQ=;
 b=YN7VZGP6TGvVDUYSvRIfKbeC1qrtr2D3pKkEDtS3zh7pdmG+SQXfKimWgPUMeNDrkmKy2MzG6+7nMO7FUpl4W27P7Sgyck85zMgUrMzFZ0tsgx5Q3qXH+36ix7Awo22+ZscxNYWrFAdmIY4nhkSe5E9dy+kgcK/MN34pyxsMYVeux2XxBL2Eh+r9vaX3N8JMzMPiVPlaOFzby4jhdjUYVNoSJEQJVUdEh0MGqw89MQYjWy6QfvUL/jrF2NoW44yzdbPaQJknnHuzs7TzA4+poFQSXkUPfRyrDDgh124VasdcLRqwvAr3oKXM8sdzWetZA9iZQg09JC/vttH6IN71aw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nutanix.com;
From: Mark Cave-Ayland <mark.caveayland@nutanix.com>
To: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com,
        sstabellini@kernel.org, anthony@xenproject.org,
        edgar.iglesias@gmail.com, qemu-devel@nongnu.org,
        xen-devel@lists.xenproject.org
Subject: [PATCH v2 09/27] kvm/i8259.c: introduce TYPE_KVM_I8259 device
Date: Fri, 16 Oct 2026 15:19:15 +0100
Message-ID: <20261016142031.1204281-10-mark.caveayland@nutanix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016142031.1204281-1-mark.caveayland@nutanix.com>
References: <20261016142031.1204281-1-mark.caveayland@nutanix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0016.namprd04.prod.outlook.com
 (2603:10b6:a03:217::21) To PH0PR02MB7159.namprd02.prod.outlook.com
 (2603:10b6:510:16::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR02MB7159:EE_|BL0PR02MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: d4af9134-80a9-4191-dda1-08df2b90bc1d
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|22082099003|10067099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	6wzZgYk7PuMphndy/F2woKoOv9nP1MWvE10kvtiZuOV+gVX8eLRPPpffEB+3jSCXMHRi7TtYxEIt7hygNVS9fl/pBNHOHlp/YxafldPI203YevEZuYBiAaCEF4D8GBOvWI1ZmXbUG2CLEIw14cpcORjlEgppoFdNXn6bgmyFIK6P8Bi9kdIoewpfooRIdci2T4zjM7Zoqnbg3ocqFGec6anrZxf7qtoPjo3SK5/8Z9QL/57/Pe9Io3PyddHCW9ylUdEc80r/EFIZPQKdnHVri32TVqkl1tRl/pvuwTny+/doBOFjR4Qb3k3GuM+LqFU5E2XTWtHwIxlm9QioxrXJtRjlKP0h9B2gJvYUzaDmCGDCnC4gwoP75haVrZiC5sLsRlgwBUEWyYVaZsqthjgwLUWqLLT8tdtiUyNXtU4uqd1npWqJhOdYBqvv9fAxiPTy6qpflE+bvg7JSaGbgSpQOzGF3ctacvWCnx6zMXeVSWyNQNx0JWhCrcgeEbgVTUdZScqHCqrfZgCFNiISbHyPhQ/l8mwXkFw1hiI247Gm5PxmOlG4tgl4aH/Itr4z++zoJbgzYoPwlosWBs64CSOnFV54qdEECaybNBsJgWkORiD6biZc5nmB5N2BGDmednB5m/+Ns38eZeMQ9UxmTJFV4xFUm86LHgt0bTdrKG59tws=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR02MB7159.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(22082099003)(10067099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L3Dy39C9AfgE0qsqPGISFIYWimHk0CIdjZc/ajr9LclCbxyudKowPcKJHk4q?=
 =?us-ascii?Q?lIbxTvvsPYwhQPOZcRzGp1DdHXVnxAHRt8/vQPqBLiBzrrTobTK4poQRAfrb?=
 =?us-ascii?Q?9nWYOrvLQAhBQ8RaccbCQJIYId580ARevtOn0EZEEJVWKjURUFv5Jfz4XIIO?=
 =?us-ascii?Q?h5LdxE2nTPK/kQPe7GLX8gM4rmIQ4NqWRXBKfIj79/q8HTBmjf2lTZWAUCk9?=
 =?us-ascii?Q?9Ndrbt+G6tQa8/IlnesafV6IL1WqJ2HcbeA3U9D7TJGn9IgAmNtQ5cdwTDvq?=
 =?us-ascii?Q?1iuM/J+SRmjHm6S9Q18zczCM7lvA7fuRUSg6B31uH9y5GlRFoiLFY/H5JbHp?=
 =?us-ascii?Q?NH7mpwlceFtqrFjT3g7/RsRp0CvS1qRqKFoLymtvqjhshWIQcipWrdIGI/b7?=
 =?us-ascii?Q?FYG1LHhmnon4eoV61WLCVK2S1yXHuE8EnKO5IM949Y82R6+gCvNr7MEj2zzK?=
 =?us-ascii?Q?5oGNJGKSMM/3rSVDXav3Td7GI2pUZ6vlPRtNeYBmSTIjLE2Z+RoX2zHZJCcZ?=
 =?us-ascii?Q?ilpD4gzjkT+nqtVpAcNGYXXMeWMvmONtuxj0dbobTOpHmlSvJ+Dm05/MLebK?=
 =?us-ascii?Q?3F9hKlLvvwDBKK0EXuJ8Bl8Pd+vU6iIc5AF0aNwofIwMBfWwPPG2qSBkACGs?=
 =?us-ascii?Q?fKyx22+ubrATQfRPcbOYsPHGBkKgY+9iflDwzgC4CXZAYSTuvXcxUYsVfPFv?=
 =?us-ascii?Q?6FP9r45CMdy1OzxwA21aOMjg17nExWwgrCmb2zo0SDKpaykOg7khyZT5C8Uh?=
 =?us-ascii?Q?EKvoZOK2OpcryvYrLg6TixRmUW8thYpTJ3W+Y+vMFWK0/r/azGS8ReOW9wP+?=
 =?us-ascii?Q?0XrIq4PMo0BHHpfiBptMnlVXBdCUjB1RdDo8TNYGB3Kj+W/eq/NZlKdcjAAo?=
 =?us-ascii?Q?+eLA8xPF2nXYDxPGkMdegQxKpsKaMWd3gIPC1nppzRP8sHmRb0rryyPDqPtT?=
 =?us-ascii?Q?ouFPKbpRmm0/BI7ppY1MrsH0XhEg/2qFgxXnNze+CRwW5MaQTpcNch82EezL?=
 =?us-ascii?Q?AqUJ2OPtOH0ShkEyXI0vCLDP0rkmKlE1vVz/7XtqRWVsx7ZfAJnHiFoGMlyI?=
 =?us-ascii?Q?HgFTY9HPuuWRpMgqevz85a2uoXhxLlO30nQPdErd+6Z4tOlGR0q8zJf7uyHN?=
 =?us-ascii?Q?uLrfbbaNhCHVJ7R+fX4ZSsNJoMdrl1V1wmYI7pwzpss8rvb9DxbbShv0f2iC?=
 =?us-ascii?Q?CVMjLgWagLipvfFB/tDFEqI9qFYgC05CV9hmdxizs9lIhDrdAx7zXDVBVEgz?=
 =?us-ascii?Q?FlkbidACdmY6DJDurvPQj9EMH5L8xNhz3MUo11WAwECH1vxXY/nIBDKhpoL1?=
 =?us-ascii?Q?9qaeWRzkOwCjXPbhZM55bym7S2245oobUutvZu/z5Ae3me/eGi3CdTS2sIrg?=
 =?us-ascii?Q?RQWaOxjdhSZH6cnTf+/TjJxWBQ0zoJyLLY2oR3D9YT6mJNqyo6mwzWI4o2VO?=
 =?us-ascii?Q?HGXJaQZYDDQwlgjMOLdYCiSJaFE6gOZH9rT5vEcbJmWsWoFAwY1+a+++xMnA?=
 =?us-ascii?Q?DbtomktxcKQIkBs28w33oOUqIgDOKaYP6tA5ulSmY4antesF2vfrjxIG0km0?=
 =?us-ascii?Q?yuhPjPWxm+q//ljb5GUW7Dm4Wg3pFxHfKnUXbkOPU14Mr+mSY3l9+qDr2WkQ?=
 =?us-ascii?Q?cBEM7DdLR0+DRhFHgfoR842bwtNiObl5ML4iRQgFwnP+iNM4Sn64op3zNZRh?=
 =?us-ascii?Q?dtMxiQO2NmLlahL8Gp4CZOa6+iZTBJm7hNESgsbvMDlPt8ltKqKlVbbB3o9k?=
 =?us-ascii?Q?QcOcqf41IDhCkvc5RxDXyGcYNsJIur8=3D?=
X-Exchange-RoutingPolicyChecked:
	t0EHbI/OoNNPm8DBLS50qX7xNGxehClsCXhZFZ9B7bFVAo4t6C5WZaflV/3hVhbwpgZx5yTBuuJyH10GQMKxj4tSbsZjiT+QCcPsLX5iEsMYo2HzsZnKoinozdJ5GUH/ydAGNboEQWH1UyIJeBDVLkxwnd8Owvr8rr5TdZSf2G9q+f+PkeycsbZxnlm6bJlrqPZx4FhY56SHQxFPr4brkdTqeFwbwGLF0umU9YyjbXqQlBPaOMDHlWrZzjDMPHCOAWi0ZnQAEzZDBUmmC3KD6fNv2DY9CqQ17oQ75ZRskS7Z9J7ti9mcKadRL7TP1HjzCXpGPYuxY1fZvJhQdjDS9Q==
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4af9134-80a9-4191-dda1-08df2b90bc1d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB7159.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 14:21:14.2089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: epsMdh+/Sx9avIERamq7GSCobqJB3Uow0q67GIRdNl88W4yr1hJLnwAOz7piTt0gaKynzORYhgcjNLfuvq8lCwvDOyYaHYq4ESVHYnC4Ldo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB6547
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NyBTYWx0ZWRfX621WD9LNx0pS
 W1bjqEBQov0diufXQjjhY4nBlWX3m4n28N1jhxeG3y16MX6mKbyHfjjuzPeLsjwRORSOyZ9oFou
 TS+GmEAcI2wUOhHCwC4zuDJBpyOk7C8=
X-Authority-Analysis: v=2.4 cv=G+OJgNk5 c=1 sm=1 tr=0 ts=6ad232f7 cx=c_pps
 a=8h7WK4dQWB09CNKj11a7yw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=0kUYKlekyDsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VofLwUrZ8Iiv6rRUPXIb:22 a=dEe9Ve2bX-KnNSUMM2s9:22
 a=64Cc0HZtAAAA:8 a=8xmoOu93QUavKZLLyKsA:9
X-Proofpoint-GUID: taTb4rykIkdH5mIPA0dCdcY5eM4jvn1m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NyBTYWx0ZWRfX5mc7USv2Y8K2
 9s6sgKs/5Pi4qGk7abAHJQ8wbK4E1mbjIICW085REXWJwl74DqxTKQjF1+61FkXkeCKe3SKnoE5
 roou4cAAzkedwxodrG571bOhokixvBXzRNU0IsUfPlryOM21E7Xhg0NPCzFqqrjsjAB3Dh2g19q
 +mBLYgvc55io8x0Zv0sWW6PfdnNHme9QmdvFnyM5aBFBY8X+wVkR18yq9jLNghJmRgC3LGCbfW8
 Gkz2ZdwFLoCzOe157+AmRrNWAW9r3RpF9IauwWDlLns5Yzf6EDABwhJmnl0bjHymfgw07N8MOP8
 WhBYREGs4ksPLewC2s7XexWEoVvT5R8SbdpIdsuiUbGCdUGNUNuV2klDdMUnMLDFym/m0IGwd/d
 2ngroPV1UXaSa5Lyo6OzZDhIfvnQQpKnXBUqksX7CiGfaHE6xlmVS/1j9GgSHDOYqwHpp8ln1IT
 eLzCtk1/UI6YaNqZc+w==
X-Proofpoint-ORIG-GUID: taTb4rykIkdH5mIPA0dCdcY5eM4jvn1m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Reason: safe
X-purgate-ID: tlsNG-16d1c6/1792160509-F72C677B-1A0DB23A/0/0
X-purgate-type: clean
X-purgate-size: 1238

This device represents a single KVM 8259 PIC and its associated class and
ensures that we can safely embed the device within a container device.

Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
---
 hw/i386/kvm/i8259.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/i386/kvm/i8259.c b/hw/i386/kvm/i8259.c
index 85176dcf80..8ae5dd39b5 100644
--- a/hw/i386/kvm/i8259.c
+++ b/hw/i386/kvm/i8259.c
@@ -20,9 +20,11 @@
 #include "qom/object.h"
 
 #define TYPE_KVM_I8259 "kvm-i8259"
-typedef struct KVMI8259Class KVMI8259Class;
-DECLARE_CLASS_CHECKERS(KVMI8259Class, KVM_I8259,
-                       TYPE_KVM_I8259)
+OBJECT_DECLARE_TYPE(KVMI8259State, KVMI8259Class, KVM_I8259)
+
+struct KVMI8259State {
+    I8259CommonState parent_obj;
+};
 
 /**
  * KVMI8259Class:
@@ -154,7 +156,7 @@ static void kvm_i8259_class_init(ObjectClass *klass, const void *data)
 static const TypeInfo kvm_i8259_info = {
     .name = TYPE_KVM_I8259,
     .parent = TYPE_I8259_COMMON,
-    .instance_size = sizeof(I8259CommonState),
+    .instance_size = sizeof(KVMI8259State),
     .class_init = kvm_i8259_class_init,
     .class_size = sizeof(KVMI8259Class),
 };
-- 
2.43.0


