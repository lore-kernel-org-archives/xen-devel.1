Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABB5C5AD5A
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 03:20:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389411.1630131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuLyy-0001cm-KE; Thu, 13 Aug 2026 03:19:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389411.1630131; Thu, 13 Aug 2026 03:19:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuLyy-0001cf-GZ; Thu, 13 Aug 2026 03:19:52 +0000
Received: by outflank-mailman (input) for mailman id 1389411;
 Thu, 13 Aug 2026 03:19:51 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wuLyw-0001cV-RZ
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 03:19:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuLyv-001cUk-Hz
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 05:19:49 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a7d37a0-2eae-0a2a0a5409dd-0a2a45028cec-22
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 05:19:49 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a7d37d3-6ca4-0a2a45020019-94a39217bf30-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 05:19:49 +0200
Received: from pps.filterd (m0384718.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67D2JTGX2097940
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 03:19:47 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11013029.outbound.protection.outlook.com
 [40.93.196.29])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4g116n9x9j-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 03:19:47 +0000 (GMT)
Received: from PH0PR07CA0004.namprd07.prod.outlook.com (2603:10b6:510:5::9) by
 DM4PR16MB5435.namprd16.prod.outlook.com (2603:10b6:8:185::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.14; Thu, 13 Aug 2026 03:19:43 +0000
Received: from CY4PEPF0000FCC3.namprd03.prod.outlook.com
 (2603:10b6:510:5:cafe::5c) by PH0PR07CA0004.outlook.office365.com
 (2603:10b6:510:5::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.14 via Frontend Transport; Thu,
 13 Aug 2026 03:19:42 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 CY4PEPF0000FCC3.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Thu, 13 Aug 2026 03:19:41 +0000
Received: from pps.filterd (m0426315.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67D2K6163320449
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 23:19:41 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4fxpbsmr9y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 23:19:40 -0400 (EDT)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id uLyjwFwkcgWOHuLykwlu9W; Thu, 13 Aug 2026 03:19:39 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=fail header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=ZOM
	sx2hzZFceQKaRJRDftcMORB/FxgXZ+8Bbs2Qgpwo=; b=Z6XvUIDQ+4X1oGpkMbk
	1oUImWORI88ITEzCINEm2uVZ131RlGl51nB/3nODZEYyi0ZZpxax2NuL0eK78sUt
	CTxF7WBY4UOFQ5rAepZ/rb6p/+iU7hoEBWHK9OdMN+Q7+y0sSt28EzDcUDpUwh1R
	9byCLxo/zSYMCmZpG35b2sW50E/hRSWz0no5T3a8XIYeE8E5DQWLSp7sEOrVw+5T
	vITf2fRV2ScF6Yos+stehVyNqct4DScLZKJGxr6vurGA5g7xug31mig4qqdcu2+3
	debB9L/J20vpEdq91lKjYb1u+EPpNbNoMdX+SrA4VKc0cVpIfCWM+60p+aUiHGth
	e4Q==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EnG7zXX5FKde4ZvjaC9AGTZuG12DRfovBFfOiHw2QM6ajBNGMmhaDWZlvsQRx5AUVa07bfZ/4UexFYdWRpFQAj0HuTHhbeKnbtaXxjn/nY+q9pI2XObgPAUyFbQ3pE/9sM6l01QlUyq7GXt/RM8kuQqt+6TLS9DLx7oI7V5llcxcVUy8bHE4O9H3F/Cfmf3K5v+zvnwGkeMyzxEHmckJwGgIKi3/nam2HROQRreclJfzj0pNjro2wFxhcZZEoXlaV1ssmmhYwVYecXcf604GqYVqtIwuulz1dO6BBXd8qJ4grspcLd49RHbdliVEipgaUKjvAjICDZqu8SuOp7U7yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LMqnLhC3fHEBZQ89VJQmiBEAGMJpD8dQA2/BoKcwN7U=;
 b=og3CzP6Ih4nE0AGrLaYigj+5lTv/ilKtfU1uZz5XM8zHL2Bt5pGrTJY6MSMOvad3sOXF1KknlQSBNLMJNjsLPTnpi1DbGXr+M23yHLuvBxSdqhAGcpkcRjCIliKM6mLOWlPa7aP+MgU8PNBlhLkBHLViRfuUfyufEfzvkF5vgytvY8CD6ts+C79a4vMeJ2ijKmCN9mPFeKjTS8+/eRvdY5P4yT37DgfDyBY+0JZWe6B0zjPnYtHW+pmpZW8SsNzOynrTSQKVsKg6DAWunlepa/UGtFeQwWWZVHNHq/jvpC0ycp4yr2hlNKvDYfxG8doruOLMXKm0EYQlaJZ6Fatowg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMqnLhC3fHEBZQ89VJQmiBEAGMJpD8dQA2/BoKcwN7U=;
 b=IfV5LRtMveBw8q1FrHa04iu3HA+Icq1BYOxtlH69Q9f9BepL1nmEvYHg4G7S1N0gWlMFAxQq0MqhGbcG2IdZiH3/crQRsuzBjXuH8DXcm8vin6TjEcgJOaQ+ef3ZjBSUCt8VKo68q4LjNyA/wt1QKbRLOMqe2v0gMynnOGjVs5c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to; s=ppserprodsaar; bh=ZOMsx2hzZFceQKaRJRDftcMORB/FxgX
	Z+8Bbs2Qgpwo=; b=UEQ5ckJsSfgzL0zSZMsw83RfbMPc/Txw5L3JLcal9WwtneQ
	JyBRfLtNTj/png8rr4rGV+cuSZBILMrg8gvHIEW9iXpyzOQwMDc3wjCJdBCrz7dM
	H6qUcsWpRjpHpKj8jeA6xJecoTu146ROUIkpgKevu2oVW4fa+NE3ywJaY8rEj0em
	au4+HzFK0YAVHNl2/iaojZ5bbr0Ot4oicFJYyztQyR3UlUh+SECPcD+p/oOpqXBn
	BI5MczWmQDSyCh/jwwpfa7PpsjlEL9njUPOUluBn/9cfJMJ2vo92lnwVsCn8d2Ub
	cbnu3yRz6fiyH8TN01+4dVpdvMuLA+BlWrnNdLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppfserpocford;
	 bh=ZOMsx2hzZFceQKaRJRDftcMORB/FxgXZ+8Bbs2Qgpwo=; b=feG+aNEaZPDu
	/UijusRCIL+DZ+C6JJG6pskn2Q/PCuH/C+uY+w5M3NgYxw9nbxp2I3rptHD3NM3N
	rD1hnc+4KmQXGC6wSvyYrNa80tdEMslcfgFnWKyglGS5y6dhHjL0HxQFmGhh/usk
	G0y8FGAPyILcxx1CO9r7EtgrS5kvOSn8de4xNX7bouY1Me/GVnFUaDUkQNcblWgS
	6R39BwbxPzPFvadwHhuu7usrA45R7tgXnk2/cJo0f/BJqh14xvtJqKv/2oxBF8Cb
	2e4hqCp1AG0lThONr1FoVlQroCUMGmBUKQHAHJ8d5o+BeSmiBIHcEPiLXfQyuKSV
	WF5b2iUTbA==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: uLyjwFwkcgWOHuLykwlu9W
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Wed, 12 Aug 2026 20:19:36 -0700
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger@xenproject.org>,
        dmukhin@ford.com, xen-devel@lists.xenproject.org,
        andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
        michal.orzel@amd.com, sstabellini@kernel.org
Subject: Re: [PATCH v3] xen/common: add keyhandler to show Xen command line
Message-ID: <an03yMkWnZa6qcMR@kraken>
References: <20260810230359.671587-3-dmukhin@ford.com>
 <anrXvTfBls4flBqK@macbook.local>
 <anuMfq/lDjxbR8Om@kraken>
 <ba78a8a1-6862-41b0-a6a5-cae7eada3627@suse.com>
 <anwo2QtEh9tObNDD@macbook.local>
 <7ea460ba-e2c8-45a7-9b7c-0cddcce275e5@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7ea460ba-e2c8-45a7-9b7c-0cddcce275e5@suse.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130021
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC3:EE_|DM4PR16MB5435:EE_
X-MS-Office365-Filtering-Correlation-Id: d851d3e9-98bf-4017-1433-08def8e9b74f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|23010399003|18002099003|22082099003|6133799003|11063799006|4143699003|3023799007|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	aglB3rq+r2y73cj23/mN6LRnrFSGfUR/mJ49Q2C3k2pyrWUIhP2Vvewn6akRfP1qFIbEr9BFGVcTQBDKDMuPWB3ryE41f2VPN8kRDWeFCfILpJNQERJecFcz3yuomnybpzLoZfOlHY7VNeHR0lDvlivJL1C8oKdW5KzObzNLBfRkVCL/EXxOpP4Mq1IDXqvDETpPhJwhBxu/LXd6S3JG1LevYuA4RmhreX3AVK54z9iVN5wGEIo+PZL/OdjRcuheyNij9J4ai2AovZ7qf9ACkEnFpLw0vrRlRnw11XrMtFaZrl7CfG0pCVMvJb2MgZJzmF7blRRKdGPG88WdIwHPvj6Th0yxI3wn+Y59Cjo/KuioeVvq5umRAz2juFMSN8p0xWsCVI1y1paxejZGrbdRRuQ9fXeimUum8+y/11L/hM0aUQi8ZnHU9F66XrJ5DJgF257NMB0kRuCOlvZ+EQsVeAxli5t7qad/gzP6f7VwNW2/0mPQJoqnrTYnboUQvga4yKdgfJPG3CYr+WpXNRoP+QU21wDKqo7mtI2TekiT8/1a41olL1ByN2NINKZGBGPaJHsSWgPixFAbySmA1YTOFLfmKo9u6Ia7KCF/2lPFqW2KqXOrT6twTRmN4TuaqdQgmD80G7NHK6Vq+vO/Co0aJ+dAmUFXQ37Ff9KZmHmakad+Oo7F/8H3FTdJnsabTCLAN11RlW4O4VwzB0Craquv/Q==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(23010399003)(18002099003)(22082099003)(6133799003)(11063799006)(4143699003)(3023799007)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	L978hhN0/QVsq2T6UpEvux7LupaCLoZL8vTzRT+p1boPR1GbimSbCJmMyWOniZuGVEi0Gcr1lJvAbYaqK+zgtwrBCVC9Eci+L8AYB4k0eFfwGMW0AYyZVctvVacuBlNyHeHAFv3yEhRkYHbiur5JTju1VeG4DFSnSSYhViMZG0J2nv3DHamfEj5oixPNrpiQHfMbmflJbiuYDBuGu/sI615n7P78BzwmTzBBeCUHa327tdytjxkeRMdOhbREXnnHR592ey5az+Oief5xP7BCoE/SkpFTDIIn0V4Q6fbpgjEU7+vnzciOVAUmPUKE3V+n5sEzagVXOivQbW6Tn0p5VOWrfzxghNfHDpOpXC1Nlgx9wByrBuFdnv3vzdJMhbWhbIKsqBbRlOpMz7NnoETde0u9AfTy7LPtPNTalif5Lhtkylakp/Gt/wgUzlLFLQHP
X-Exchange-RoutingPolicyChecked:
	n0r0eioBFAQ+1dBR99KSwTaqdUXOsJGQI6401FwJpXJhKozIcs7v72EKwnoklXG0oKnKvJ38nO/Et8dZMdghPuYysk/4/w+KnbjvWdfxfXXrdp6VQ/a0oU1h/hYVHVGA5aX+HXNhJlaAG83yyx1DC38JY8aST9mvV7nI+he8xZ+hu1BT1wC0R8LwwbFkgNYijf/aj6Vhw2g/PWL1h32H5bmPI0xRUEMzw0Q38ZvD1fSlJWj8H11AiAnvHscoCIhShF8mDZq7UNpH5EdiHOyg9aqU2S41g7oM6pRdfym1cMxY+NKh8zrMLqUC3OqaNDJwhGBnaN0GcMwWaSL9+jDrfw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aaO9OtIiEhirSYXo2No5zGRMOkeK+sugGJNYXL2owu0ObIWsVbaFLNkTvRDBxGc/SGSFIBsPH9KwdsiwttxG9f5Q+qRfICALH0BX389snlZoKetFzNoa0ePWpSwNZF1X+U8SpzbWDc261PAmKjSPQvkkekRccXB/FXJCus9J48tBIxNk7K4+9JJXdmLFVzwPiCrBCHiEgzKPQLF2XrGdsatrD8jefcKxyKN8KcDCIsMits1eBjtUHjUybSGKGtoRoZejNYGsRHUjkpi1crxIPpsXWBt5q0lNikVFBe/91SiRgvyldX25o6aLnkEDuenqD9dmj6g3Yos9da6CXIM8w17/bBJvVroFQv/91ca2YkGkD++CymvHrPrro6+MEDGIVXnd0P9Bp7i/sCCFzjXg92mSosmeaFcWea1pM74LnpzQweyzoIOCNhxhqPQ7FOnscKwJ1XgzQN7OyHwckzhIvCPZHAqtGVqKYsJjcVNKtmRYZvhFz14GUsvOP61QRrrEz6hnbKyBSaOxkvhxskBsC9YfzLWkVXXfLRJduofBl0QMG9Ji7kbwMRPyoi0ZROTWQizpCvUM7FrNDc2qbKFDBM9PueYpSFR0Xoznsxv0LUK5736QW9ADV2Vsl48dUEdUdTvYiX83vjSNeHqeITeqcA==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 03:19:41.7735
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d851d3e9-98bf-4017-1433-08def8e9b74f
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR16MB5435
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDAyMSBTYWx0ZWRfX1nuaTZMgbIqM
 wcgFfzBFTnVWz8u1A6drUXTnqwlZ78cAq28126y21hZJPBSbhm/iK1rWA30KjK0GSW26NgR9f0l
 CC7n9hWPo3ZuXX5lJtrSNR3d8UaZmCeHO+HbyeWwLO7lnxxr987v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDAyMSBTYWx0ZWRfX+QWbSgqfdBiF
 wukgoQDjLR/y1eCytSLLgqT0w7VusaS6PqitFoC1dihaz5xMkiqqpJL6znqYdsqjGEjExkX51C4
 Vnt0Cz1OMK3AInvmIuyL4Ctqia+YOOCjIFoksrnCxmqW2emYraazTCNQ1s+6Oebf0packmlLAeS
 spkfNaScmX6sCA5kkmYPIeNc6wCcNJ+k/wviPRkbUovxJokuEMAFDKXni3avbCcH7vbh+mfP8aL
 SU1vZlJ6wRL2qvA69i5dexyzZqSVs8u6U+b7A7WtRwsVJsE5k4Gm4YFAnepqw1V4ma9Qwz6hNFb
 Yssjn0vVQW8Rr7XV1e6OFKtUW6B0840grHBea+lftmCmm4nng1YnbYFDLqSWV7stxHJtfCiihEV
 StjLpLp0KMj1o+lg98+FL9zxq1YQgMnE/2KHlefFnACEg7qVm4uLCDPGvUfW1PZczXtlr/EKMxJ
 Qj2dmb8XwQqhFSStKTg==
X-Proofpoint-ORIG-GUID: ifhfFWXUTLwGe20AbpTVANeOv2uP_aGi
X-Proofpoint-GUID: ifhfFWXUTLwGe20AbpTVANeOv2uP_aGi
X-Authority-Analysis: v=2.4 cv=R9Qz39RX c=1 sm=1 tr=0 ts=6a7d37d3 cx=c_pps
 a=y599upwrfiZ3HV94zaFOUg==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=8nJEP1OIZ-IA:10 a=Sv0fKeRqtYgA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=ARvDHhclS48edyKYUbLB:22
 a=cbNQJ9GKAAAA:8 a=NLsUbDrCpKz5by7Mb1gA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=P0bj-C3X3jJDpopQwM1U:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130021
X-purgate-ID: tlsNG-720697/1786591189-F12A12AC-530FF18A/0/0
X-purgate-type: clean
X-purgate-size: 2442

On Wed, Aug 12, 2026 at 10:19:55AM +0200, Jan Beulich wrote:
> On 12.08.2026 10:03, Roger Pau Monné wrote:
> > On Wed, Aug 12, 2026 at 09:28:46AM +0200, Jan Beulich wrote:
> >> On 11.08.2026 22:56, dmukhin@ford.com wrote:
> >>> On Tue, Aug 11, 2026 at 10:05:17AM +0200, Roger Pau Monné wrote:
> >>>> On Mon, Aug 10, 2026 at 04:04:01PM -0700, dmukhin@ford.com wrote:
> >>>>> +static int __init cf_check misc_init(void)
> >>>>> +{
> >>>>> +    register_keyhandler('X', show_hypervisor_info,
> >>>>> +                        "show hypervisor information", 0);
> >>>>
> >>>> "show hypervisor information" seems too generic to me, almost all
> >>>> debug keys could be defined by this sentence TBH.  I think this needs
> >>>> to be more specific, but I'm not sure what's the plan regarding this
> >>>> key.  Is there an intention to print more stuff here, or just the
> >>>> command line?  Knowing the full set of information to be printed might
> >>>> help come up with a better name.
> >>>
> >>> I will update to "show_cmdline" since I originally planed to expose Xen
> >>> command line only so it is possible to better debug a system when dom0
> >>> becomes almost unresponsive.
> >>
> >> Yet as indicated already on v1 (I think) - a precious debug key character
> >> for just the command line seems rather wasteful to me. If it's only the
> >> command line, and if that _really_ needs exposing via a debug key (i.e.
> >> if there are reasonable scenarios where "xl info" cannot be used), perhaps
> >> attach it to e.g. the 'h' key output?
> > 
> > I was going to say that we should not overload the 'h' key with
> > printing a possibly long string, but I see we already print a bunch of
> > information there, like the buildid and the compiler banner.
> > 
> > One option would be to introduce a new debug character, and move the
> > printing of the buildid and the banner to that key, together with the
> > command line.  Then 'h' output will be cleaner and just print the list
> > of installed handlers.  That would give the new key more content, and
> > help cleanup the output from the 'h' debug key at the same time.
> 
> Hmm, yes, that's definitely an option. May I then further suggest to use
> '?' as the key for this? (Or am I overlooking that key already being in
> use somewhere?)

I did not find '?' being used, will update the key mapping.

Thanks for the suggestion!

> 
> Jan
> 

