Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FD4606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=kdwBsFIo;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=Xy61N8yC;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=cDepNnsa;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=hCNe+yn8
Received: from list by lists.xenproject.org with outflank-mailman.1473382.1681031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmPr-0000v2-LB; Thu, 05 Nov 2026 01:37:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473382.1681031; Thu, 05 Nov 2026 01:37:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmPr-0000u1-Gt; Thu, 05 Nov 2026 01:37:23 +0000
Received: by outflank-mailman (input) for mailman id 1473382;
 Thu, 05 Nov 2026 01:37:22 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmPp-0000ov-Pg
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:37:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmPp-001xJk-6Q
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:37:21 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebddbd-8faa-0a2a0a5109dd-0a2a4505a81e-20
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:37:21 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebddcf-4cb1-0a2a45050019-94a38ff105a8-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:37:20 +0100
Received: from pps.filterd (m0384717.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mn6s1339679
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:37:19 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com
 (mail-centralusazon11011005.outbound.protection.outlook.com [52.101.62.5])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hrbv9t303-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:37:19 +0000 (GMT)
Received: from BN9PR03CA0099.namprd03.prod.outlook.com (2603:10b6:408:fd::14)
 by SJ0PR16MB4773.namprd16.prod.outlook.com (2603:10b6:a03:42d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Thu, 5 Nov
 2026 01:37:09 +0000
Received: from IA0PEPF0000003D.namprd03.prod.outlook.com
 (2603:10b6:408:fd:cafe::73) by BN9PR03CA0099.outlook.office365.com
 (2603:10b6:408:fd::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Thu, 5
 Nov 2026 01:37:09 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 IA0PEPF0000003D.mail.protection.outlook.com (10.167.249.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:37:09 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mtE63092129
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:37:07 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4hnycbnhk7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:37:07 -0500 (EST)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id OmPXxheeBkWyrOmPYxKE5s; Thu, 05 Nov 2026 01:37:06 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:Message-ID:MIME-Version:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=ppford; bh=aDC1lM/h49/xUMqIMAbI1efwe
	aDfCKcHFFRHExvyUKA=; b=kdwBsFIopSoWwWPbZJZeMPRlIFtdtlM+FJso+pKdA
	Kj1cMLt/a5TjaqXY4rkAeZl6yAt/0n6WPZvsPQ/+08/b3BVqTsJXUNgrkrU/EqDg
	W/bAXsdCWzvPQtDkcqIk1onQq2yj0XRMnQK9VwVrkZX/XjdV1qf0TV2W57659XWa
	vddQXLLr2QrroEpSwWsfZ8u0XhgX1/BvY5CIIiYxnuTgebg7Brs4fTsSMxne6Awa
	QhYS/nCLslloB97GlBN/VoCvPJVfeh/2TQ2ctoDqCLuXyY/kJ5fjYHt7fghGTF/N
	2xYBWFh1F7oFfFmCkUnwS2TDAMz1BHBiV2uQbjuH8q/xA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UMfCtlfBPr+vmdG8bbIa46/skY6no6MgGIzIyjgNs8WYzlJqzkynmEhwTTRK4m6+2srjS3l7Kka9Gb3umi+z4dlka+lojmhWLbLo3NTJAoI5EkR/BVpumGH+B4rsdwqPdaWZwsRZlKpD2qtWH8AAt9j6ZpsKGhq7kG4ELv0vJM57deTRewwF5Ly2lUAOMPE7ULPTJdaqQqy1ojSL1Pt8krwZjJF/vH30oFUghRpo75g//LbJcYlkqrflA93qJZSsCzRzZ5zN5XeK9xv4G6C1cd1oOAzkkMq50vq5iR5AW5CiZeXOz70oP54kISKNQzHRYeBCgUO0z4O5wSV11G5afg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDC1lM/h49/xUMqIMAbI1efweaDfCKcHFFRHExvyUKA=;
 b=cuJoCeYqG9UHiDU7VnCkdxdFrjLKBdBVRmHDsuhi3P1R+88GQKOjIPmzJ7OUisx6cIO6IyT5KMm5Xoe+EOAEPOaIGtxjFox1WfV+h6smgFddyAANWUSL7VFFvID6MBQtHbmS/VTB2fGi42b855oQMfvvzXbayaGeTyIzhgMaDP7H2IjxExerBSozlz2bubMM7gzz9bqPXhMyhfNWur0OajVTol0WLY3kS2K7r2+bioSbmfa9fkj8QqHyEX4mE07xUB0kW1Vi3Cm3OaavnzwHYjJM38KpWyOEn6x+EqFvA5ivAElGpbPuklpl7rNdvP/BsL40yzOcYmBJ2V/vBV1q3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDC1lM/h49/xUMqIMAbI1efweaDfCKcHFFRHExvyUKA=;
 b=Xy61N8yCXA42QJ1mBF1VZu/+8SBjYrSvAOylRHb6rBjSkO/vTTTn1zs32/SFKSqa3L0hIoxEdgIxpJeEJzZgo63qJ0m3my8/HDAf15VbdujG66H8RduVvOLw1fQSraMZ92fzkeptkyXDdyTsvhK+JwWtenEygXMUEu29BMAu1Os=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 148.163.138.245) smtp.mailfrom=ford.com; dkim=pass (signature was
 verified) header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:content-type
	:date:from:message-id:mime-version:subject:to; s=ppserprodsaar;
	 bh=aDC1lM/h49/xUMqIMAbI1efweaDfCKcHFFRHExvyUKA=; b=cDepNnsaCEtj
	4k5Xbd+ofOKPujLIqd1HOtnEX/vB+88BI/PXNhp9NMAIantcATu2WOZnA/8r6YPC
	5+fXwgdnn6AFwtC+7QHONwZM/ZY5VnF40QcQqL83OIbqCtqV84zUK9MBGbf/KSqw
	sXGNZxCB5zB8KX3je/D0LxcNxfi46pnBn4qbRT2UJJMUm1rJsDNP6TiaIJJll4gr
	fWr+UcP+sto3E9fWubsS8aBbUsw67b+liaBZRs/fi/X2b02oV6lD0EHZdpN3kZXa
	lOxrBvRAg9vAgv8nV0QYAI5lerq1+XAHMtRSBA+Ypcv8E5GcuAeYTKE8GMtGI7Im
	geAYKgsX6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=ppfserpocford; bh=aDC1lM/h49/xUMqIMA
	bI1efweaDfCKcHFFRHExvyUKA=; b=hCNe+yn8SSrJg6M/nrS79PWFaHkL4u/7hE
	LyLuFgZ9gNrxnZ6gw8wsms3bJN0T0svZBbmLF3ERcAKC1V69KaSAc0BkOPX6xyGJ
	xfTEwAlILYnkbtSIfZ7NNbFZPoffMHx2+Tsjo17cC/EBRo8Dv+bf/8vTbTMHYdGX
	7AV7ww72hwGF3C/JSpjswiXNNbfPc4yLvFlqAkl3NaJlVDhFfbuT06ImZngVIvGh
	S6HWaeeJtjLsFkvjpv8MG0KPb9/FmD2oBAHrgpGCH11KoPG5IrUQU2259tWmGiWo
	zo2Df3/k2wfjddxyp/xnk+pjJKdfIALmhdMQGsSQuqUlS6ZOs2vA==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmPXxheeBkWyrOmPYxKE5s
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 00/13] CI: updates for XTF jobs
Date: Wed,  4 Nov 2026 17:36:48 -0800
Message-ID: <20261105013701.719658-1-dmukhin@ford.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050005
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF0000003D:EE_|SJ0PR16MB4773:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d7cdd83-c767-4bae-2245-08df3add4eb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|6133799003|260925021311599003|260925021911599003|260925022911599003|56012099006|261102123227099003|3023799007|10067099003|13003099007|18002099003|261009223027099003|261021121427099003|261022105027099003|261021123027099003|11063799006|261028144727099003|261026121527099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	wVOwhnnhA2tm19KcCvQ9EiZCGa16uRhhzugQyr7QFSG7Sqa/jXMl7t6Wuu/3uZvUX7Z3G2FXJTZahdGp2oc+Z4PvlUzAY0ZcYiEiU4d4F0e3aEJGR8Yhn5Oyzu+wa7dYft0Cr3KvZQ9v6KpGxiqrfZt/iEPms4r1w1frdpslTdKpLC89vy+9ZN+pUNJITKNFwCYB2ywIzkk6uJxVOnjFE/AKXC6oVmdwKBYDRU4JtBS1RCKxyu11aMLFFlB6u/+f5GsGS76IbGba2ZW3lyA8E9mAC9OQdxl6QKbgScy2fxBbVoTUYtdYII+yp9mcYEfoDV3wCIrdvdBN8cvTYaLIY9rF9XgkyE6+1iMhejNkQ+ZILSbJOvsBnm8Adln39F7ZMyyxIMuQ6cHNQgn+TRVoDa7d9Q9EMvaH49NGwzVaXfyk9JJUOFWGKWDtgC6wOsW18+OapHa6UNmb7Kzu3Zg+eOCqj5vS/e8DBirm/yORN0wkB+oIA6PxowXdwLAXdXM8hKghT6VoadU/AUW0xvE0clfGzZ5qCslHba1ZrLB/lPNF1RXzaWF2BZaQGA91vM+PZMNIYpFoDt76MiVXkYLn0+oBXhIG3txMMyrcy6/4sWvX5Kxws718qXk8569x3JhoYBekSvwdHv27CJkkAm1InzKiEvTdMgo/Lpe9zL9bwYk=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(6133799003)(260925021311599003)(260925021911599003)(260925022911599003)(56012099006)(261102123227099003)(3023799007)(10067099003)(13003099007)(18002099003)(261009223027099003)(261021121427099003)(261022105027099003)(261021123027099003)(11063799006)(261028144727099003)(261026121527099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GDICFdwEmWrx3mCxmXWayVyxnkJxF6F2KH92anHwHm3n5aNNfrEZQ5vxUVLiHPL2R6k9gdy0TdItpzWuhVSxOKQUvpsajtdqoXz7Bv7ZFfO6iTPZ2VfBZBmmBACEY9TDmM6KX/SFXqt90o7TRblefeBMXshfBOkm0JMNNZ1UjhRpd9ztKTfJuzC/QDO+5Bwebj85AqAZC2XKy0iFxZ9tBDdVCDqInOR2cgkVVnYWEd0pCdsSPpnkylcfQ5gpO/Kt7nGsYQBsRYnkMoQWdv7Gs2D+lalyHQ58i1y0SXFgXsF5L/3zipjnLuzXIWxxtMsjTThyj8W0LI7Enru3ubq47Fsmv9dj75ybsnYA/kiEwGfNlqtHrxFvHnxogLTnSwXmrgoOUanjfou61KfgMSONw92ad/t8SMNuG5qk5w+WK0N9lvFFHCzI8c322sjgl1vV
X-Exchange-RoutingPolicyChecked:
	s9NxjHhLAPQJ1egGczEzLlneV0bGZt+2ykhLCFssWLbNCKAJ9zRv1/8Lj/z9XJDliRQ4J0ZuWSptDCJbJoMpFRJVRCwWFyys067TtnCAPNYPdPgtwBJ4JpVbUMi8xYm9gm4NxaEyEZiI9BfidxdcErgStxzFvbs3ngYgVsQidyzkD2BxCMz32oPWmWsYkgWfp++POaUU5G/J80KdXbcxj+SbgUhwP3NtW/elRQ21FNpZbxuSNh4BV5hxeS+e95iYIOkE2Va84+msPA7k0Tcn2pHhRljn6wZPXfhNQKSxBSSyg9rad/DYUzgznr1eIF4+ardsGsB9V6qYj+h20+ZWEg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Es3MFsB5OFeQPsBF+mJvqJShXdc41ndj7OsEt8t4pCxJ7+OniI7M/HnMlSG62Cvz23MespFH1QO6uMZDFm0UwtZPrF0vsKFR7A8GFUP4uMlbW3DkQLJ9o2duQHra6XcH7oE7vInK1V6hU147JSXxGhm6h5ZxmGEQaieR93oOOFXaMBUByAnG1VTRzxODQ6AoXtQuktGuMJS+zdRa5LowO7h0aNoJM4X6+rbdIaZMVynmhfGZ5K6pM4KEZaqh4cKl3w+rfIEyX5Rm+2Wk/pnVxfEHcqdcg4s8pYQ25zeJU8dc/bA1yHJsfErr+xtH5kNWLpdorK0vZBkmMTPHsEuyQVWRwJ1SfWtL3I/kFg3aJmFMf4Cx7ybArx2O2AIWIjdWCpXd+ryR2G+Ts5JQsufkSkcyFXxdPcdVKklg0uhH7v7ARZjaZa+VPVhaMalPD7qBuz+D+FddF2jG0N2RonzVk3eBgYUDQS/CFM4iV6jhrH0x78Caa+U/zU4IWFa5D1X2vcYVKJc+x8cvyuUKpe0e6ASb9LmhyUijYNuYOMFdDJWgAujkTZGg+zcw2KEecf1JVwVMIRaf/0MxPmTV+9JOXHjxLZcsOyJq62cNqr6sqNhImR8CnmKJuoSaTQzKChCC0+We58mEtdeAdvrC84g/fA==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:37:09.1158
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d7cdd83-c767-4bae-2245-08df3add4eb2
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	IA0PEPF0000003D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR16MB4773
X-Proofpoint-GUID: 5zO1SilbBUP90xZJAXygp4WwpVKP2ztx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX/9rWoI9rma9g
 Dv7aKVhPklMuE2MXX1XUNmgClfwIZ/uscWT4EqCYDI+lPpe7lJQHSdpLYzMNIsVRpv6UL+k0ass
 GctBBafZhFKyo/B5ofcetVE9zxEEx58YkOGMGrUa7RfkRV0i5EWc
X-Authority-Analysis: v=2.4 cv=JKmuIMKb c=1 sm=1 tr=0 ts=6aebddcf cx=c_pps
 a=F30aWN9Bm7kNfdI93JtEUg==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=AHe91QgOk3R4nFVtG5At:22
 a=p0WdMEafAAAA:8 a=VwQbUJbxAAAA:8 a=cWRNjhkoAAAA:8 a=MBFdvfcDGwvs-Ucc41wA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=P0bj-C3X3jJDpopQwM1U:22
 a=WmVTiCyuxqgg3mnwYu6p:22 a=sVa6W5Aao32NNC1mekxh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX14Fo2K+o3dsK
 T8QsLs7LL5Y22Qt617uRnvcuo28BM4KiKnEt2dIe0xIA+Br8dMlJCwRdnm6R1hfjt1V2znvkAXw
 whiwWjHRjo9a8FUEhVoyDfs38P2nDXZv1+4eAlQyCksYlrvDnsMFvAsXSngszBwvpxES7rSQsso
 B3+zJaPkuNHvmETUi6lIGVg+rp7FQlIL2gC2BqjGKjG0TQbduVEOKtMVKKGAhfca1Smh4SqHL8T
 l2oXeNZC1DP4ecojGWYeQreBX6BqiT4miCpx8b5/Knv/Tva+DV0Y5nPi3ZBocdGv8/1+5Hym8Mk
 6hgMG9aBdAYGr/L42S5M44IOoCz8M1/lALCg4fRAW6kJMbeygMjTVNAXuRi8uN1ns1f0TJcKMwi
 BPFXFsPSQCw4bhIjI/gEBrloj2UIYbZshU9zcMv7Y/h4+/vEbr2K9+Hywly3YG0NIUHof2XRz7F
 g3A3V3jCZlI3s5WgITA==
X-Proofpoint-ORIG-GUID: 5zO1SilbBUP90xZJAXygp4WwpVKP2ztx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050006
X-purgate-ID: tlsNG-c201ff/1793842641-F7CB82A1-AD4F087A/0/0
X-purgate-type: clean
X-purgate-size: 6324
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


This series has started as a tooling for SVM AVIC series to allow
running AVIC tests [1] on a real target. The series depends on
the SVM AVIC series, see [2].

The series performs the overhaul of the existing XTF tooling to allow
XTF test suite orchestration on both QEMU and real hardware targets.

It also fixes up the XTF error code reporting and accounting of the
tests, e.g.:

```
  Total : 2
  CRASH : 0
  ERROR : 0
  SKIP : 0
  FAIL : 0
  UNKNOWN : 0
  EOF : 0
  PASS : 2
  TIMEOUT : 0
```

QEMU XTF jobs updates:
  - x86 XTF jobs now batch 75 XTFs each at once (~7m for the entire run)
    XTF batching eliminates few existing jobs which simplifies the
    existing test pipeline.
  - Arm XTF job run 2 available tests at once (<1m)

Patch 1 is a housekeeping to avoid committing test artifacts after
local QEMU XTF runs. Turns out to be very convenient to run QEMU XTFs
locally.

Patches 2 and 3 is a non-functional cleanup meant to unify the CI jobs
definitions.

Patch 4 adds per-arch per-compiler XTF builds. This way the XTF test
jobs can skip re-building the XTF world and pull from the artifactory
instead.

Patch 5 updates console.exp to recognize known XTF-reported test
statuses for building fine-grain test reports.

Patch 5 adds binutils to docker containers used by XTF jobs.  This is
needed for patch 6.

Patch 6 is a mega-overhaul of the existing qemu-xtf.sh. I kept it bash
for simplicity, but it makes sense to make another pass and switch
(finally) to pytest (see [3] and [4]). I deliberately decided not to
split it into smaller chunks and I __hope__ that would be OK for this
code to be reviewed in such a form, since that is tooling and there's a
public evidence of it being functional. But - sorry in advance, that is
a big change. The example output is here:
  https://gitlab.com/xen-project/people/dmukhin/xen/-/jobs/17749986186

Patches 7-12 - enable qubes runners to be used for XTFs. All XTF jobs
runnable on a real hardware are made disabled by default. They can be
selected via CI variables or manually triggered (but still needs
elevated CI privileges). Here I want to thank Marek for providing Zen5
runner and the initial set of Zen5 jobs.

Patch 13 is meant to provide a way to execute the new interrupt-latency
test on AMD x86 runners. Shall not be merged.

[1] XTF branch: https://gitlab.com/xen-project/people/dmukhin/xtf/-/tree/x86_64-ipi-latency?ref_type=heads
[2] Xen AVIC + CI infra branch: https://gitlab.com/xen-project/people/dmukhin/xen/-/tree/svm-avic-v3?ref_type=heads
[3] https://lore.kernel.org/xen-devel/20260922100900.29129-1-anthony@xenproject.org/
[4] https://lore.kernel.org/xen-devel/1793715358.8631fc262581453bbf619ec5b2062170.1a1a1c44b87000403d@vates.tech/
[5] CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/3028917985

Denis Mukhin (12):
  gitignore: exclude QEMU testing artifacts
  CI: unify hypervisor console parametrization
  CI: unify naming for hypervisor extra arguments
  CI: enable XTF build jobs
  CI: enable XTF status codes
  CI: enable binutils for alpine and debian containers
  CI: rework to allow hardware runners
  CI: enable on-demand XTF on qubes runners
  CI: enable on-demand IPI latency test on AMD Zen2/Zen3 runners
  CI: x86: attempt to fixup flaky tests
  CI: add on-demand XTF test jobs on AMD Zen5
  CI: do not merge: re-wire XTF repos to custom branches

Marek Marczykowski-Górecki (1):
  CI: add test jobs on AMD Zen5

 .gitignore                                    |   5 +
 .../build/alpine/3.24-arm64v8.dockerfile      |   3 +
 .../build/alpine/3.24-x86_64.dockerfile       |   3 +
 automation/build/debian/12-arm64v8.dockerfile |   3 +
 automation/build/debian/13-x86_64.dockerfile  |   3 +
 automation/gitlab-ci/build.yaml               |  56 +++
 automation/gitlab-ci/test.yaml                | 289 ++++++++++---
 automation/scripts/.gitignore                 |   1 +
 automation/scripts/console.exp                |  25 +-
 .../scripts/include/configs/xtf-arm64-config  |   2 -
 .../scripts/include/configs/xtf-x86_64-config |   0
 .../include/configs/xtf-x86_64-efi-config     |   0
 .../scripts/include/manifests/qemu-x86_64     |  75 ++++
 automation/scripts/include/xtf-runner         | 138 ------
 .../include/{xtf-arm64 => xtf/qemu-arm64}     |  13 +-
 .../include/{xtf-x86_64 => xtf/qemu-x86_64}   |  13 +-
 .../{xtf-x86_64-efi => xtf/qemu-x86_64-efi}   |  13 +-
 automation/scripts/include/xtf/qubes-hw1      |   1 +
 automation/scripts/include/xtf/qubes-hw11     |   1 +
 automation/scripts/include/xtf/qubes-hw2      |   1 +
 automation/scripts/include/xtf/qubes-hw21     |   1 +
 automation/scripts/include/xtf/qubes-hw22     |   1 +
 automation/scripts/include/xtf/qubes-hw3      |   1 +
 automation/scripts/include/xtf/qubes-x86_64   |  54 +++
 automation/scripts/qemu-xtf.sh                |  28 --
 automation/scripts/qubes-x86_64.sh            |   4 +-
 .../scripts/xilinx-smoke-dom0-x86_64.sh       |   2 +-
 automation/scripts/xtf                        | 395 ++++++++++++++++++
 28 files changed, 864 insertions(+), 267 deletions(-)
 delete mode 100644 automation/scripts/include/configs/xtf-arm64-config
 delete mode 100644 automation/scripts/include/configs/xtf-x86_64-config
 delete mode 100644 automation/scripts/include/configs/xtf-x86_64-efi-config
 create mode 100644 automation/scripts/include/manifests/qemu-x86_64
 delete mode 100644 automation/scripts/include/xtf-runner
 rename automation/scripts/include/{xtf-arm64 => xtf/qemu-arm64} (79%)
 rename automation/scripts/include/{xtf-x86_64 => xtf/qemu-x86_64} (53%)
 rename automation/scripts/include/{xtf-x86_64-efi => xtf/qemu-x86_64-efi} (75%)
 create mode 120000 automation/scripts/include/xtf/qubes-hw1
 create mode 120000 automation/scripts/include/xtf/qubes-hw11
 create mode 120000 automation/scripts/include/xtf/qubes-hw2
 create mode 120000 automation/scripts/include/xtf/qubes-hw21
 create mode 120000 automation/scripts/include/xtf/qubes-hw22
 create mode 120000 automation/scripts/include/xtf/qubes-hw3
 create mode 100644 automation/scripts/include/xtf/qubes-x86_64
 delete mode 100755 automation/scripts/qemu-xtf.sh
 create mode 100755 automation/scripts/xtf

-- 
2.55.0


