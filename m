Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE77C5B572
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 04:01:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389432.1630147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuMcR-0001bj-PQ; Thu, 13 Aug 2026 04:00:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389432.1630147; Thu, 13 Aug 2026 04:00:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuMcR-0001bc-Mj; Thu, 13 Aug 2026 04:00:39 +0000
Received: by outflank-mailman (input) for mailman id 1389432;
 Thu, 13 Aug 2026 04:00:38 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wuMcP-0001bV-1H
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 04:00:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuMcN-00EFYg-UZ
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 06:00:35 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a7d414c-bab6-0a2a0a5309dd-0a2a4509c92c-48
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 06:00:35 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a7d415e-be1a-0a2a45090019-94a38ff1716c-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 06:00:31 +0200
Received: from pps.filterd (m0367128.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67D2JjY62466407
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 04:00:30 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com
 (mail-westus2azon11012020.outbound.protection.outlook.com [52.101.48.20])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4g10gyjeau-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 04:00:30 +0000 (GMT)
Received: from BL1PR13CA0223.namprd13.prod.outlook.com (2603:10b6:208:2bf::18)
 by LV3PR16MB6285.namprd16.prod.outlook.com (2603:10b6:408:1e2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 04:00:22 +0000
Received: from BL6PEPF0001AB4E.namprd04.prod.outlook.com
 (2603:10b6:208:2bf:cafe::64) by BL1PR13CA0223.outlook.office365.com
 (2603:10b6:208:2bf::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.4 via Frontend Transport; Thu, 13
 Aug 2026 04:00:22 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 BL6PEPF0001AB4E.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Thu, 13 Aug 2026 04:00:22 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67D2K48e3240332
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 00:00:22 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4fxkgccwyp-7
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 00:00:21 -0400 (EDT)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id uMc7wagibyclKuMc8w5CsA; Thu, 13 Aug 2026 04:00:21 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:Message-ID:MIME-Version:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=ppford; bh=w35yOHQhu7JjGROZ/wB0BoyrS
	+uIi0AjDCqAd9qs7nM=; b=DkdgVH8JBayMIhve7E1vU8OatbCKJXy3n9n1qiSXx
	5GxGexY008U/yTGRfWJSd/+/lz006KRU0oKFf/gmO8mupXrvIEULJdvJ8GpoeixD
	T2PebOONUlb/4TioQzBYC3ltsOLAmULOef1wqaa11JINi6riqJHEXUVdl1iGxYtt
	6ohoS4C58QyO7zRXX59L9HRAJ+YGpAuUgfn2u/8R5RD9j2MbL2K+yj8jNfvdlC1s
	YG/pkvg/CqviZyMXIodUfv6+iQH5N6STGvGYFASjs1yCy/m+CWcUkH6lZpdCjdro
	Ga2ykzUd97dZr+VC2VGeWUeSFx2Ql0LPxa66q2Z0d9QNg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UrsqtMRAuMCTZOOZKP+r10orgVRnAqUg0hpKAm5JZRZHYn0xYjhmcFOSe67IiAwzMOV+kSAhMmlD7SuX53SxIGjLKcLZH4FwJFABKua6s+b6xxOoYMYs6oA/O14D7qU0kVg9fEmx2QmaDdjfMQ6EH3s+SbMrpZm12muruXk3m+b/YpJ01AG3FJ+MTeDR7UkktmXSO/U18NvW4/ej0NfWGpILDEaPQukDZbc71rhRyU40eZO6RMCRLOiSq3gPb7VhWHxAKbFVaPc2bp8+iL7al25kvFGWm5M4ppYeotJ1NFB/4dWLibP4rO3R//HQomSrOaxDnuRJmGlS7pyCH78qXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w35yOHQhu7JjGROZ/wB0BoyrS+uIi0AjDCqAd9qs7nM=;
 b=lhY0IHZjKIuBg2yu18LQPbMOvmgU0rwxzA3mlgDfMle2n4ldvNYKDFYDlB04IgK6Gj2neNO5qEFo3Op2E45GUBqABi2tqFLsPES16gFFFLI49wcVnpFVHGR5Bm8Tdczu7VBoeB+dXWj8cjUYhA5MUylQIfu6PNZ+Yr2fPasZS3ynWGhJjlMaGBoZlsfiqwu3AUt1HZP0zMQ4ajZkJBhe1zfqeuXamxSU9TysBqGuvoue3pZ3gqTosTRXdgADzVfVruNXR6wQHoEZd3Wx462rtT/h0Dm2AXEsWTEkOs3+duk8DElK/ASwpmzhD/MFnhqcLpIFOUadWfl9XGYeTtPoYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w35yOHQhu7JjGROZ/wB0BoyrS+uIi0AjDCqAd9qs7nM=;
 b=QXvM8W9edFJzIU9x1dfFh3adlfl8HX7m91DL4Ed+a6pCnP+VGQ6loe7Opgvn40gj6SYa2WzVReMG6PuzgD+mnisJX67xIangW+2+doLNvshzM+TY5PWPd/eH5Zdj1XyTryTjMaBmrUsRPcI6BoVS7QdbYA5aptzEokOCdzaaH/w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to; s=ppserprodsaar; bh=w35yOHQ
	hu7JjGROZ/wB0BoyrS+uIi0AjDCqAd9qs7nM=; b=mu2b57oE55iFfQFhMI92qul
	y8fad0p6HjI43/jI7+Vae7QUmxP/U+hSGuOONn8V1rKPAo1sp6ACvcZrd/8yFR7v
	SNBs6lKFa4urabrRZGXQscb5LBjPw0flpYCiaEtCoyHG3quyezIek7NMLyVuo93R
	RhZVbcGWbZj+loInwz3E0G8K3NNAEOnFX2PyPcCUSVlo1kYDBgLvzFVcoUZpsJfH
	TOQcz9Qob/z/2WtnUzktGN/Gu0y/y0wu0k6HK68LKHeckzdJjb9FC8vo+RbhhO+7
	a3SZSmIoU85Sm+dwOtBwFcq2k+eK91Gd8H8fq7kmtWNhwkC9/TlfMQllMJaGsNQ=
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=ppfserpocford; bh=w35yOHQhu7JjGROZ/wB0BoyrS+uIi0A
	jDCqAd9qs7nM=; b=lFg80uZx9yHsGwTosdmWP9nbU6UbGKrX5RNLWwqO8l2g8Xv
	CtOEmEzBL9YDKFV9hE+oeEAGJwEpeMGXtO1LyEMtHUrE5WqbtOzV7GqmnfB1c09B
	lupIXhIR34B3PsFmXBEwpLgPTu4dbcsR4/+aEjGdRQt9stoxw3U3HADZyKflU7Jw
	2o0CPphaC6e8vKQxWqSEzsCaF1Cy783KXeqi1sS6fWVVIO3rESQB7Txwg3jwWM4T
	LaIlk4aZz9DIgZ5JY3DuLehTs5veTNx1CfHhDQzT2GAa3whWtewGab2QQ820aBHd
	No5vOaO2+J+nXWnYvweiFyAEZhCRaZfyOhmx+4Q==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: uMc7wagibyclKuMc8w5CsA
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v5] xen/common: add keyhandler to show Xen command line
Date: Wed, 12 Aug 2026 20:51:40 -0700
Message-ID: <20260813035139.915536-2-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130024
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4E:EE_|LV3PR16MB6285:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 39b9de99-2fa2-4305-9493-08def8ef6604
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|23010399003|18002099003|11063799006|56012099006|3023799007|13003099007|10067099003;
X-Microsoft-Antispam-Message-Info:
	71tdEDgUZmPE9wScuy+7ihE8fyF8PrJqNTvT6iajrkAy3jvIgkcnYRa1DjcvhmQV7ypa5GLnqnPmlF1HDtIh3kt+i6cihoBWeRdCQQ/XQDKJIffqghkwPgGstnlMtrp+T82/BMzg6jm8eby4/DVQ3hJJIHXAJKf3IwumwmQHtOLx0pavF0Elu7b6JuTN4/YY6eYLk+5bUYhnnJOUiUv0vzjUcGEBSsy10mo8QgREvevFLqAUoLa0czL9+xtGUPiHmHuuKj+m9DsQfWoh0E4vuBTc2a1fa9XBjoHkMTEYAyRMi6io0KfLcuM/rpzhsco3P8xtvm4SiLq752QHxWSK6cqdeEvIex4XOx8EhC3+cKHjrkYSiy+rO9ySZHp7yHZCLeyJ/FE4tFhEekMFpV3xxOPKZFXHcGHr3gvsaUycki4X1hJmohKXgRyFyWaY1QeGv6op0CrxrzaJA396IgnSkdbAGTJMyGEbvjkWGTx+SlXsgogU+IW9OKAnrPopopIVDEm9M8RAzNxhRsK5c4MQ25VvAB8Nw8izdUoBkJl+cx5tZAXIKHj9TJKnr4pOg9fhahV4bhJuEIa8B5Qm+uexGLFt4l5cgN1pn62ci6Shaf6p78h9ZWp7EBT1mjNjLY8nyDdplfgng/dd12edX9iE9oBc+1YQfRXSmHsncjZs7lcSZkFp8d39ER3PnNX5Q1gPYF56jomzt6cQq1mGe2iPmg==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(23010399003)(18002099003)(11063799006)(56012099006)(3023799007)(13003099007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PW+uKFoNNV3aHKdmB52ektWuwjvlohM0464HrtxzbRbPDVIOzvtsYRLJqSlEY+MYsT48Asxtq1A3drfDyWjxPdwPAIsUMApzG84Q1S/IXpH98udBmssWKqRm2AU1OFq8bnnhnodmRuHa6Q7EJTbZ/xewQ0nqiAhi7/WVyouEKsL3Zwkpvp0isOgjYCcFm6DfFDLr1Hzd6OcglPWkZPmLOtmeczPsIUZCVgqyYfqu755ITxQ7jma+q7OkleK1xFifZAKwWLPK349TogT9WPb3ut+F1/71V65+DO3E0/rq5lIgi/41RzqV6mzGZNHJ2eMSlbx34An5gl1VAK57vvbzGd1IDp6S/1YYJNtO17wwlUSA8xUCO0tHnljgMeQq0x4Lh1pvjxQolf/1HeskwIzavZ1wYQyVtBwqppXTlaiynHJeJUdrGqHPGg8ehrNcioeu
X-Exchange-RoutingPolicyChecked:
	Pvq+uDQ1IFzeKAMZckJt1hfq+WkS7uVZCLxIpfiGosUswKxhlIiVwrlTrU4OX6ufczJjX8IXs4Y6Oah0obvGAsBbtFEpIbu4JjOG8etBFWeFJjSCZthWjSCvvLAsn8lh4DyVpuHtRmwhqoe4lyF6tTwg+DCgRkNMIoke48CEEER+c4JU3W2l9p9lsA+ZpkI/na4rNt6/jOfdA+Mq1G2oG+nJc1CaAUjwZbi4eGGu7NdSnRMEDwncpZxS+ASv3rqRcCRoRv+UWYmMv0Qw9iOTpzvKkF7/A9xGSj0FkJrSAzlXPlX1/Ree70fRwg8j13cbk9ql+clrGyewmVEltL95yw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZYVPvPlKNk3KABJE8a6ehjOvqUeYznzuLfZcYKitAWRht5hDLNKCdTkrQs8WAxFXlCzwLIIiIXIZXFMgE1wsahCeCuwUe1kLT0dKUxui/Jw819BiH8iPWYKRQYkTXoVUdbqVPn8vqgXjmlpdOA09+l82atD1Fjs7o0G0MC+lPyhKJkIYxkvsFh8dLqXYznBbcjzFNz4hxSv2GWvXo3aqG8a0Qh9JpZypxpy9yxiAuucFEcR3Sp++Lz0UiZe6zYPydFU6ic0629qjrcPlUuaeeEo9WhGQ2vzCjyAZIKjJl36L7tnMat7jeyhSi2iOrLQ66t571HRzo1o+0vf9lBdTzdKSXzEDjqb4on5re+4Ntd54khFVi9z9gU51VFsTtqIvUwsZ78FiPOzgN1vX1rpECTIduMCnT+2wWojPuaK8wZma9NpEOYvndZ7GHP4UaUEU6qIy5+sLbolfi3UU021HCqan2nqwoXJMNCxNjtPMpmricpOCF48Vk0uEdeFVeQClw4IIKRZLW9SvAZMgsHaZwDvnCc3J9lFuDAAC6Xc417fpJmHygnP8JSBBfS/ggBLpCILCVKNM6e1LZ+tJx8nUZUNKFenmiFzqR8OW+xZt608hPvqUQc/pRLNOeIDagkth8KeXBzfxIwnuPLzTMKVQQg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 04:00:22.4628
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39b9de99-2fa2-4305-9493-08def8ef6604
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR16MB6285
X-Proofpoint-ORIG-GUID: _l281Y64Yn4NFJ5hrHjz5HAKmyJyFHWS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDAyNCBTYWx0ZWRfX4nDWwOUyTLkO
 LaBhmgp0cv20fiBR0xl9O8JwMHCw75RhGQosJ3adk5iJ+c+pMZGsuYnEtMspLn5N2Pz5X/Hubd4
 EcrfAiPTc9iDzFBrIFuFP6BUXM20AuwD/UrgHkn6Bctv3Swm5JR74INdS3AnrJ+V5d4AJRilHGY
 v56psGmIfOYHqD1+pmlMEKS8bc/2sxNRJ3IreLWZFareoSMFo1TcfxD4HKewyt1krPmzfQGMtp2
 DXa8I/coT5zo2FPaEGgFzYb5qZdISIn5a1smGltCokFIpSSQNerE/1d8MAmoXf1Q279zfhLdcK8
 1aezkyd9AI7T42Z4lJQZ4v6jxqQUsyOKIaHKp+cfKMHUm+nlNb18ssXXF3B9dAYFR4GeuP+emH5
 HTg9mFoZnI5e//fB/TS4OIK2f8/4RW9aXYcTdjSFzfM376BHIOuK1PUIPFZfADyjUwktOvcy8JV
 idbj0dEE7GjYPm7vLDg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDAyNCBTYWx0ZWRfX8qPP4UkylvQW
 zLezukWu03886iI57X194QfnvNlqZqomonDbzY20DWiWtoAi56LZt6ViOtq417fHOjLVcXA/Gcp
 yJBq4cZYyc14O96c+d5RfG7Z4jNof5pQSjA1LygwnPgvoubHmUgc
X-Authority-Analysis: v=2.4 cv=O58Jeh9W c=1 sm=1 tr=0 ts=6a7d415e cx=c_pps
 a=wPn5mG08gX1eKnPfDThLSw==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=WER9OelvoqQQjwJToBYG:22 a=VwQbUJbxAAAA:8
 a=cbNQJ9GKAAAA:8 a=p0WdMEafAAAA:8 a=LJ2BZIJmTNxky85jOzAA:9
 a=3whSkbs7g9Me0DR5EJEX:22
X-Proofpoint-GUID: _l281Y64Yn4NFJ5hrHjz5HAKmyJyFHWS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0
 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130024
X-purgate-ID: tlsNG-bad1c0/1786593632-BE8D9034-CD7FC179/0/0
X-purgate-type: clean
X-purgate-size: 2714

From: Denis Mukhin <dmukhin@ford.com> 

Currently there's no way to print Xen command line on the emergency
console for debugging purposes when 'xl' is unavailable.

Add new keyhander '?' to do command line printout.

To allow built-in command printout, drop __initconst in
'opt_builtin_cmdline' declaration.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v4:
- promote opt_builtin_cmdline to __ro_after_init and use it for
  built-in command line reporting
- account for empty saved_cmdline
- adjust register_keyhandler() call - use '?'

Changes since v3:
- print built-in command line too
- change handler to print command line only

Changes since v2:
- account for CONFIG_CMDLINE_OVERRIDE case

v4: https://lore.kernel.org/xen-devel/20260811210956.3806559-2-dmukhin@ford.com/
CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2756104826
---
 xen/common/kernel.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index d1bef9ac2b2b..1afda2a68f3e 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -5,6 +5,7 @@
  */
 
 #include <xen/init.h>
+#include <xen/keyhandler.h>
 #include <xen/lib.h>
 #include <xen/errno.h>
 #include <xen/param.h>
@@ -35,7 +36,7 @@ boolean_param("dit", opt_dit);
 #endif
 
 static xen_commandline_t __ro_after_init saved_cmdline;
-static const char __initconst opt_builtin_cmdline[] = CONFIG_CMDLINE;
+static const char opt_builtin_cmdline[] = CONFIG_CMDLINE;
 char __ro_after_init xen_cap_info[128];
 
 static int assign_integer_param(const struct kernel_param *param, uint64_t val)
@@ -505,6 +506,35 @@ static int __init cf_check param_init(void)
 __initcall(param_init);
 #endif
 
+static void cf_check show_cmdline(unsigned char key)
+{
+    const char *cmdline;
+
+    printk("'%c' pressed -> showing hypervisor command line\n", key);
+
+    if ( opt_builtin_cmdline[0] )
+        printk("Built-in command line: %s\n", opt_builtin_cmdline);
+
+    if ( IS_ENABLED(CONFIG_CMDLINE_OVERRIDE) )
+        cmdline = "<ignored> (CONFIG_CMDLINE_OVERRIDE=y)";
+    else if ( saved_cmdline[0] )
+        cmdline = saved_cmdline;
+    else
+        cmdline = NULL;
+
+    if ( cmdline )
+        printk("Command line: %s\n", cmdline);
+}
+
+static int __init cf_check misc_init(void)
+{
+    register_keyhandler('?', show_cmdline,
+                        "show hypervisor command line", false);
+
+    return 0;
+}
+__initcall(misc_init);
+
 static long xenver_varbuf_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     struct xen_varbuf user_str;
-- 
2.54.0


