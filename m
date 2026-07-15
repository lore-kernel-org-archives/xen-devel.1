Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48B5C44508
	for <xen-devel@archiver.kernel.org>; Wed, 15 Jul 2026 20:19:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1363312.1615054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wk653-0006qR-7Q; Wed, 15 Jul 2026 20:19:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363312.1615054; Wed, 15 Jul 2026 20:19:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wk653-0006qK-3z; Wed, 15 Jul 2026 20:19:45 +0000
Received: by outflank-mailman (input) for mailman id 1363312;
 Wed, 15 Jul 2026 20:19:43 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wk651-0006no-1U
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 20:19:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wk650-005TYs-Eh
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 22:19:42 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a57eb34-bab6-0a2a0a5309dd-0a2a450c9f50-28
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 22:19:42 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a57eb5c-f479-0a2a450c0019-94a392173550-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 22:19:42 +0200
Received: from pps.filterd (m0384718.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66FKJdFr3510000
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 20:19:40 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11013050.outbound.protection.outlook.com
 [40.93.201.50])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4fedwmt68w-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 20:19:39 +0000 (GMT)
Received: from PH8PR15CA0012.namprd15.prod.outlook.com (2603:10b6:510:2d2::18)
 by BN7PPFA29DF5524.namprd16.prod.outlook.com
 (2603:10b6:40f:fc02::71f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 20:19:22 +0000
Received: from MW1PEPF00016160.namprd21.prod.outlook.com
 (2603:10b6:510:2d2:cafe::14) by PH8PR15CA0012.outlook.office365.com
 (2603:10b6:510:2d2::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Wed,
 15 Jul 2026 20:19:21 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 MW1PEPF00016160.mail.protection.outlook.com (10.167.249.91) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.3
 via Frontend Transport; Wed, 15 Jul 2026 20:19:20 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66FKICXs3692040
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 16:19:19 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4fe3eu8x7b-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 16:19:19 -0400 (EDT)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id k64cwNIqit7Zdk64cwpKGU; Wed, 15 Jul 2026 20:19:19 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=XKa
	FHZ5ktm+3TGN1OySPqg+Yp5lz/RpEQwE5SjNSLQc=; b=tgk3ysLcubjh3373S3W
	mYn956Z+/NNAiRzSfd420wyNT2rmFm7pgpqiH3SlyUeZncr3hoE5GcV5JdSEu5DT
	G6uHpB82RkK9/rc6Qi6bQufobAApn00fX4odkj/hg3Xn8nVPWtOmuRTtv9I2W1zk
	3KtZlRRH2N2aeNI9B4K0/tAieNAqW+gJ2u9W+nYAnxuDlLL93ooKW9zoWl9huf/N
	FVT67Q7K3rbeKpOK097ps6LVsDhxnadAVlumBQnm6+W+gGk2suPmLbkiuajNQdG3
	iBV/YB6fhFYhj8UGf4EXZXtK8UHDX7O1yt863RGJy3yHmQP0MCqjpEMbsfh6XhSS
	G5A==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kWJS/Dd9l/tB1h1V0FjIFQwSvQ+l0JUEjnv1DVwi4xtZPNS/uNyVOYqOv4HNvsXRg0cssNvKLeGJKJHtRR0j4pA1V/9qUU/gNwppUkQ3mvhW0kEGHmgCGVP6andkK9G3O2mpevlIqeH3eR/JYSNjAxgnDZCWWsa6AfpxaHUti4QEyLISG2weLNMgQznihgza+wPwvXC/eW99j8XQ17lLBXNxq+y2BAxbeI5O5J+nlFOq+ykjpfhA2crOpp4im1ix4OQhKv+vGp3DXqdSZ2oSVTzNW3LtVAY+rDU9oKK8uiEDO49ZJ9erEJPMhO6tai00a6Gf9b91ESN7vyymkEsPyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XKaFHZ5ktm+3TGN1OySPqg+Yp5lz/RpEQwE5SjNSLQc=;
 b=SuHfF9TDVD3teGaqxrHFXteZ9/g+ONVrLe7udpdyWHAhF+BuN5oucK9JGD6aOXnqYg7qT/wk4kobudhcr0VA7bvRZm2D0iInQ4zxU+yb1deZoyJXdH4XZc0Nc86KwGme4pq59b1+BnA9ojPyCcZDfAQpBTuoe8ayH9Q8k0qsksAf8hr48+2cgH53deglpXV95hHz1x2DHtHgWyqRC9I0DEbF/PK9ScAB8MMJzOg6YX0qF0inx+oSD9fr1wJc4lQL7QKBGUry+wO3rLIpYs1jML9GFMzmBQK5ph3DMB2GZIdbITv+iVR5LK3qikKiN7lkZ5PHdSEePoQ4gTRY+rUqKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XKaFHZ5ktm+3TGN1OySPqg+Yp5lz/RpEQwE5SjNSLQc=;
 b=gMPALN7uSX+1yU+21G6f7e5DVgB/nLuyGaiyNIa2ML/u/vcS+qibH1IAIUlnLkNz5RVtpGSZhs4Av8sZ7f+pIONNss8g380L2iDwZN+Zf9sxiDdGWO97NThfiAwjg6cIwtCBGl1XrByKaqbHbksELj+BQ1FxbbilOCbsRVK/PUE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	ppserprodsaar; bh=XKaFHZ5ktm+3TGN1OySPqg+Yp5lz/RpEQwE5SjNSLQc=; b=
	jBNopuUzoEw4KlEvtgSY2G/lFiy2hZSKbzlw0ZiE+krmaaMltER3xCoFoOYmo4NJ
	HknpBpCdaOUsCb5CxZDa/in88TQ+PhckX6jwZpCcVyzMYZnOJuJkOHZ0g9iQXo/e
	V8T2Yrm63ExOXy5LpImNyijMu3JwZd8kElbK9XiPXujG+HEWp4KzGJ3OzfwTCXZ2
	bLkANi8pe0DyB7CTLj72lN1+itp48CzrntJZQCXzpmIprSYfbTj2mLKuL6ZAFytS
	aqkfeJLcji6mQOQuGd/9U/9Ag3sRkkQLK0Wt+PSprTrCH3zqFfP4ovyNyJdUQccv
	bMIzOxPMINJeoxBRbED60w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=XKaFHZ5
	ktm+3TGN1OySPqg+Yp5lz/RpEQwE5SjNSLQc=; b=sfyBX2T9h7VTsMwuJdBe8t+
	gUgQ88rLwbBpFL/bNtNre2P+wkyF9IPUHF6BdLYmugmVZfNcuXx9zcb+CVh3u0At
	3gS/dK2Opk9ya5rIuh0R3ypkWw81hCqg3v6lMBXmzS7L/fQdLINGu51xgCNErByQ
	dhRiCkfJoNlNSQdK9sUdZzGrahjyyk7ziuuVZqqcYHQKK+nNCLXHlEdWFREkAioT
	zrcU8C8ESzEJx7ly49PFLzTUNVns3NqkFUqG8jZL/jgA3WdgdwGC0xgssx9XSc8i
	tczS36scu6tuxzc959L/ZCVKYSoJzc2YYTlFpQWinrHkuSqErZ2nHmAjGTTH6gA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: k64cwNIqit7Zdk64cwpKGU
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v3 4/4] xen/console: reduce number of printouts in __printk_ratelimit()
Date: Wed, 15 Jul 2026 13:19:02 -0700
Message-ID: <20260715201902.2984407-5-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715201902.2984407-1-dmukhin@ford.com>
References: <20260715201902.2984407-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150203
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF00016160:EE_|BN7PPFA29DF5524:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6f4f2a51-71c6-4fd3-2e1f-08dee2ae5af6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|11063799006|10067099003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Qv3aKrE7zD+x+lU58CMmCmFrBbr4Xytjo21ICoTSSdITmV1LSMyS6nBK4BWREt12T2OP9Em7iFtbM1HQtaU6sX1mW2UINWKIA8dicJBV1P0AYyaCgmdYo7y5NdbZS5EDgnIZUVOTtyfoCgThTJfqK5GA/LOioqyrXK5my8Lfc/26VHumjoRQPXGq6lT/F174hjXICZ32rsvc1SJP88mF1o8unsihVg92v4mob+Xby+TNs6MxCLIOzMZDXfjLAXFdK8KytJIhn/OSmOOB6oxslZWuwUviW7tBDju/jAX2B3Io1wH/9rozMRbll/obHzgSRGZfWoxhk9FpqTEo1Xz/uIrkrhgxWyiyFEWWGhLuOcYGm5p2A3CeOc+9FCHgE5CEXASJfuY77PhZiwy414JGoP+QR6zkIUN7kHkT6DxcMU9ZAu5KuPY5BH7lnGGvJYkxC3D+ldDHqt0PbnZ8sED5pF/o6yBCxRRV2ngXc3w/xV6mxJ5yOIsEaeJhOEybIoKZlMHuWxFS5sMoNyH8Krf6mlV5j7j9q9ogz+ZKhuBzvHdXXwUifAEgpCVVhyB1mZ4X6wxpNwI4RJuGGSSv6LQtfT2NtHXWsAhFwI5UiKm2lYgRASPUmApCOp5FDIUAhzLaKUPurBsqY8/WyJfcL9tq4biNL9lr79WWmTcI0ckiZf+57y3dXdgyjBwWQLACHBaYZNAAY/lcmrwsKA1NslmOcA==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(11063799006)(10067099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gB+aI3OMu81+82LlWosYb84boIihlvyrRG51Mo2/AnBLvRDZCS51dhiy2V6JQOjc0Ap1dT4IB0VVA8Rs8geAntXHxa1cX+bbXEaidZKer/TVimJ44hHv7GDS924/dvK7h/GrxdHYsp1BkKHIEa2ObsT+7RQAk+rMLrWK0gGNN8M3+fA5VNRXHf8CvANT71u59Ax7JQJ6BbZjyzyXBjs0JByytqZ3n55vwKd//tOsfI1Fi8GJLYZHNFcGZLOM6KkPRV3Dy2g09EUlOsJGjb37YP9EHo+Coe5+SnaW0ivGPwl2qbbaKWuUeMOjkWoWGwPjkIeiLyzBbJr/EebjzTpbi41KyWhJ3+CUB8xIfUzyXYFGCne8md2o2AH8qukH/TXoWsDd2njpsQZmq2pvlHmuKfCLQWB5pBupGROm9vt0JcHhY0UDgdg33uvILIZtYF/C
X-Exchange-RoutingPolicyChecked:
	CwyWUS/rQKTCsD6SORJi26m/l/68TVIdDLKw9PS6/ZLqUy2ZOeYgyBQQX6v0TMqrGfFd8A6hW9ePpxNBletbl6JbFtBTniG44SpgdZzgtbgX4VYLQmIXWB4lpLsS31KTr3PXf8b17H4xC8m5HyXb+XvSh9WuCWT6SLoeIN/N5mzHFBnX21zCDcymqHvCc6nTydVaXLfzqEEEXIlv06G4H9fiyLo4XIMfXJAacsIorawwK1n/WJCpPZnjwFzhBe+EMWjZwHJb4zbgnYWUSeFZ3+XUWGot3trHOgEc2R7bRY7FtZKx+vGLVCt1BY25qD9kdNlbwXMXjCa1LG8UmWM3tg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	62ivYL23q/JaHMW7lGBZ3gOVcRm6nnbZljedx1mrpVb5aMggcJt3sbV7MU2iuqaRCS9Zge8GE3Bjw2tVuLUoAIxA35hM/oxvNz/KF7QhItbkNy4lE9GEOpJtbsbbB8odxeLESN29YSKxaUm9ZBz7hOsasusm6BSZfZ1AyNhHoq8APcSYZhFkbriphismFuvuqB9wjDpl+Nz//5lLTHSw1fG3mADwE4spI49OOht0V2bifCxExI7V/09sCCOdnnPPSz9c8geTNbmmQuX6dmFJlcc03VAdsYwocw4idk7QgeGy1C+CgfWl6HfM17Ve/2//WoXX7Kq/d6NJCASs2Nn1eE+SFENgaXanUAJAn7J6OzaDAQdpb4F0ckDt5tNJszcGXUgYXE/enKgIgAiJ0jWEoPONdjOrgxK+zBX1m9K5jVEd45kfMldl3LqOyYDN6Fx03N9eR3IFcJGzXe+TqX3KDJDPrEQ7nTJJ5oPLPxFIQdsxj9zyf15UoE2woeXd/6I9EFqZRvPL4QnslWXYzVkQhwnDC7zjCi1/eUCJ2gta2Llo/DBqrjloMOv2znikrXAwEYoPoFmR9jmgAgdH+varmAChsZm9bZl7tLtdQV3zuyS0tq7T87FRmjMnKodNEG2o+YnuM10OzJDBnG3k7IpFWg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 20:19:20.8616
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f4f2a51-71c6-4fd3-2e1f-08dee2ae5af6
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF00016160.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFA29DF5524
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDIwMyBTYWx0ZWRfX53llkCD60Cwd
 k1NiZlOLv18KUWyMlaLseZlYfMfp+cvgEX2y4I03xhhBg8+KbZsTgqwMFAd/dIEU4DHnFjDFBJT
 6VJrQ1dN5YjIvdfpldB29pg4ejQFPa8YYJDg3I9SQeK6zad09vGFUs2g94a7mnQlXDiRfdweQO1
 FVS6ug+R5LqP5Iu2KUminhHKt2Sa00WkBlfOOTF189C2vtL8M0b+/q864qco8yc6jya6m6zV9h8
 mXrVUhlwKwlGcarZbOL8HZwBUinvAQ4Q897DRc3mp5p/Nz8e8EDc4/s+gQMszvQTs/fPyXuVmXG
 3TMoXHX0qJvZKS+69T1cm4kBu0aVfpRckcnfCvwGejrAjB4NtbGTrKHMKs2sOr6xvtg+kkozJPj
 c7elTvTTj64vs9C8RcLI8EzVY/pezh3+60fK90zdZe52Jp819Bw/J9D+GUXmwk1DI5TwheNciy+
 2f5x7FvgpdnyZd5ElQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDIwMyBTYWx0ZWRfX9QnBnc6MfkIv
 NsZR7lKU8c2TURKxf4ee2k3CvW+uUSEkOYyyACuj8h6/7ZZZbPATCxDRRZB+YViBgW8jHNDBSF5
 JxAMXnUlpBqRGAygNpw+fTC1mugGCTXZNV9RJJyT3XzSrRJdiS2x
X-Authority-Analysis: v=2.4 cv=CLQamxrD c=1 sm=1 tr=0 ts=6a57eb5b cx=c_pps
 a=IN6nX5sQGDwae/9PVKyrlQ==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=ARvDHhclS48edyKYUbLB:22 a=cbNQJ9GKAAAA:8
 a=nlmiSLwtRF1c0idvFr8A:9 a=3whSkbs7g9Me0DR5EJEX:22
X-Proofpoint-ORIG-GUID: jBS_ScyMz9JqfBdQaqiRzdGD9M5RlcEf
X-Proofpoint-GUID: jBS_ScyMz9JqfBdQaqiRzdGD9M5RlcEf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150203
X-purgate-ID: tlsNG-d25034/1784146782-766DEA5B-040E90D0/0/0
X-purgate-type: clean
X-purgate-size: 1370

From: Denis Mukhin <dmukhin@ford.com> 

Fold several __putstr() calls into one around notification of how many
messages have been rate-limited.

Not a functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v2:
- corrected the commit message
---
 xen/drivers/char/console.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index a9520f5521e4..f9a565fc59bc 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -1303,15 +1303,15 @@ bool __printk_ratelimit(unsigned int ratelimit_ms,
         spin_unlock(&ratelimit_lock);
         if ( lost )
         {
-            char lost_str[10];
+            char msg[64];
+
+            snprintf(msg, sizeof(msg),
+                     "printk: %u messages suppressed\n", lost);
 
-            snprintf(lost_str, sizeof(lost_str), "%u", lost);
             /* console_lock may already be acquired by printk(). */
             rspin_lock(&console_lock);
             printk_start_of_line(CONSOLE_PREFIX);
-            __putstr("printk: ");
-            __putstr(lost_str);
-            __putstr(" messages suppressed.\n");
+            __putstr(msg);
             rspin_unlock(&console_lock);
         }
         local_irq_restore(flags);
-- 
2.54.0


