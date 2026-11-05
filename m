Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F743606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=FrKYiLqa;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=aAWP0IeD;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=Oed3OCsd;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=rKLC/qqR
Received: from list by lists.xenproject.org with outflank-mailman.1473380.1681018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmPo-0000Zy-5w; Thu, 05 Nov 2026 01:37:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473380.1681018; Thu, 05 Nov 2026 01:37:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmPo-0000Zl-2G; Thu, 05 Nov 2026 01:37:20 +0000
Received: by outflank-mailman (input) for mailman id 1473380;
 Thu, 05 Nov 2026 01:37:19 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmPm-0000Lk-Vn
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:37:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmPm-001xJk-CY
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:37:18 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd93-8faa-0a2a0a5109dd-0a2a450a8d3c-20
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:37:18 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebddcc-f2d2-0a2a450a0019-94a392177e92-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:37:17 +0100
Received: from pps.filterd (m0482516.ppops.net [127.0.0.1])
 by m0482516.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6A50mZ5k1530997
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 17:37:16 -0800
Received: from sj2pr03cu001.outbound.protection.outlook.com
 (mail-westusazon11012002.outbound.protection.outlook.com [52.101.43.2])
 by m0482516.ppops.net (PPS) with ESMTPS id 4hr9tfbhpb-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 17:37:15 -0800 (PST)
Received: from PH8PR22CA0010.namprd22.prod.outlook.com (2603:10b6:510:2d1::14)
 by SA6PR16MB6766.namprd16.prod.outlook.com (2603:10b6:806:41a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:37:11 +0000
Received: from CY8PEPF0000005B.namprd21.prod.outlook.com
 (2603:10b6:510:2d1:cafe::ab) by PH8PR22CA0010.outlook.office365.com
 (2603:10b6:510:2d1::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.9 via Frontend Transport; Thu, 5
 Nov 2026 01:37:10 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 CY8PEPF0000005B.mail.protection.outlook.com (10.167.247.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.2
 via Frontend Transport; Thu, 5 Nov 2026 01:37:10 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mceI2969017
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:37:10 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hnxs4nrp7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:37:09 -0500 (EST)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id OmPaxwlRiDnFpOmPbx5lWm; Thu, 05 Nov 2026 01:37:08 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=xge
	uzrEthdNFuFx9EdJgbNva0B8MdVED+N7Xgwhf5oc=; b=FrKYiLqac8x+r166ZWt
	5eUCVGdICM/130/gfAwLaiwH7Qdv9UlBpcjm+yNoRdN9eDKneHsJE43MQhfIJ3ec
	J7M8PfNJ7uuTch88mVu/bhtKJ3+vTNJ9LSczVFA83+xu0s/NIrFM702vUtO9iDmB
	5qRPLm5O2GIVMdfPVO2f/F+Fpgy5sz9+JMalQExyJPTtdwPdd3a+VK2g0OuyHS+6
	xZIsYFgY2MHv6mRJ48V6y+WTf4Di9a0FEdj1ZRsoiJYxusBYfvmRchYLh45s0Gt/
	NTPwoUMI5ekWDvx0pWpmQI7hHW789ygCiG2Db6ZbC/AOv1mIo9Kay7VBeJYkCB1o
	1MQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QWo2N6aDn3CZg1BWwivf0PhGNxT0zZTe/6Ga+gdSIWhHgyt1e+oKUXSWnYzMTlyAg0AbhlDTzW/zXIDQaEEtNUqBSjUAryQC2vlzOmm/hm7pNRWzKvYsRwZ0dIzCVfkYXLB3XV5eAn7D7NIHgeSBTb1js4hDZFTehGb+nFfG41ZDQAkQ/Mlauaqm5baxjTokYvJCswy2EGBHvrhzi4wie43CZoPwnAX1FDZv+xu0RcpQqw3OvojnR2BLRxizL+CN74lVEJXfkHVIJdXgL3r0zmBPX13syrXOzVJqZ+zETQngwrQ2FHRuxXntukIN94Uv1aYoTk6oXFy+RdJ/4aS/Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xgeuzrEthdNFuFx9EdJgbNva0B8MdVED+N7Xgwhf5oc=;
 b=r1tVbBtO+tsbkiwerhF5YSvzGMKzxoPuliPDBl+qPBP7d/ovAw/JB5GEuph9TbRpL1bW5zi8bi+yiSO7rACj6JPG+YD7vCd2EqT/3cNdR0gn/IOp8T0u7oQT8p+WILizdj8Wtwiab504II7H3R4C6DWX0a2WCBNj+ROniQxex6BrxBVV7hGUK3S7LY9n3fmTwggTv20YTF1PK/x+XRrVqmCdlzbiw7J3JvQ9w1fKULekYu7Jp86gg31fVemHM42nrA7ZiBCFjS81PrmzUilx3gWpeCQgNfgdFBAyB4fhqmmJssTlktjeJFt8eOu9SOO1+jpcSNUNG0Fg/Dr8aIcQyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xgeuzrEthdNFuFx9EdJgbNva0B8MdVED+N7Xgwhf5oc=;
 b=aAWP0IeDXUfH0KnMxNr12gxdL8lHR2uj1MONd3gjXVO0P85vq8daQDYojhIzBYwy+7iA5tJl4Aw50x+CBXB8Y4aToS0pCJyT+2b11Qr7FHXvQoBXDYf9slVkvUSFtjV6AtEr5bC0/pZ0E/E3R8bxPz1gGjWmVVtIMMgC+L3+DxE=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 205.220.161.53) smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	ppserprodsaar; bh=xgeuzrEthdNFuFx9EdJgbNva0B8MdVED+N7Xgwhf5oc=; b=
	Oed3OCsdNPwbnrO9pcflrJ9//ZyOegYv7VeNNyXoDG58r9BkkVHPHqW7K11NaMqw
	f+rvvoMdHDTCk1BSG97K148pxbEfIhqT3pBshyaZyxJPXdIx8VijqU0sRuR+snhn
	oQIL99sEJcrz3ROrnUQcNzFZjdLZBe5Yboc5I8bhd40GFcZUmHkSlmuDCuMasmdd
	WxAlneowozVO7+Hc/nuP0OiPUs8p7lxbMJIQxYGamvMAVnBcQ0xD0Zk0Yf88IEsv
	P/mJbim6mN7JxB6n5gv4RKXEkOpvDMNUR1kJv/UQo1nEeLXSnoMpk9OhF/M/wYWV
	4w+7+KZqz5iJVm9pZmbXpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=xgeuzrE
	thdNFuFx9EdJgbNva0B8MdVED+N7Xgwhf5oc=; b=rKLC/qqRJcIrpwO77QxrEJ2
	AF9PjW3pUx6ANcror5CTFNnghS19K6rmKVVVmSheZEFxf4sZhsvXkdZnmKPcbUkL
	NId91tSx56A2iReQ3ZIcVrlQE9I8JP2RytDtHtiCPq6zqMJY6VaDgJcfrE5J7PQj
	WIR4XjD9Bf8EhvBq27+OID9vup38AQZP1OYrcscW05qeniytKVZIK5pUPD+OjYgB
	MjVwV+I2+parPdIqSh14z7jwZxOTu+rfsGNDmD05nja6FN4rmULFQIz7vnPLlBLl
	ASD8PfSoLmyVPErpo7iYD7MR1qvgOWZk6lnxXyzx6t5D2mZlYCCYW0MtFny3uSA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmPaxwlRiDnFpOmPbx5lWm
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 01/13] gitignore: exclude QEMU testing artifacts
Date: Wed,  4 Nov 2026 17:36:49 -0800
Message-ID: <20261105013701.719658-2-dmukhin@ford.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105013701.719658-1-dmukhin@ford.com>
References: <20261105013701.719658-1-dmukhin@ford.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050005
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PEPF0000005B:EE_|SA6PR16MB6766:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 444c318a-1724-4ed2-3529-08df3add4f9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|10067099003|18002099003|22082099003|56012099006|11063799006|261021121427099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	C7Lq4r4UMgZUf6eOq/BI6Fb4N+hkafQYmBrBsiOC26U524fj32PgI99uaI+HmI2LewfRgKGof5IO2FOmp1u+maFYrux+UPLgWDywwvXr9LsWAl9TLr7Il3nbn/UPWG00xPP1jbGa1v0LRSHli3LWtOqdS7NIOWv4/2ueQ2Z7nkw6HY1CUi0DPq9rzN1UIfzJmm2yNZV4+GQQweIcyduZj8Lj27spK04POGmCiUJui9xYmLKdqeR1fmRv5Ymw1XA1idRYs5h9Ov+QOGTCc5IgELf+L0U4ilPCRtxsJb7SGjKZjuZ/8T2Dpl5qa3pvJRuYtLwCpARjeCvb+QP9FOzbyFqJ7r2UNtRtNY2MWPKvjDj8UTra5mg9ox6FrjKU+5jU8l4hll+KWSVLhVnTzsVomWvauFgrqOLl5J7bCrmJ3wi3BqR39tTEUrjgzRLBpMtGHBgRaDcMo+AW2hKRD7ueJaAMhjSolW++bL2EzR+ozps9O2+Z9fAjV82Ef7wjlx4xCRB6A8PQQExBmDHwtRW4fWX/AEDtZ8Rgc5Ks7XhyTt0RTsRtPDGMHMr+lUOZzd9Wi0iCUOXRDHbT8IjbDYVaJH9ovjHflfvZtloQjDqIGkO8RdhoF4gZZgcutj9JsTe2R3XTIWKBx7IGyUXwbxHWUtaIGGNYZV8g5bY48J1OH8LBVlC0nsq3JciEEQmO7ARd4vwIKjRN+yBDVmEIbmTTdA==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(261021121427099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PBeF46tu8nUzUmn+eYjqbuhnS7flg7sBXUfWc8sIG72TmQma1T5+GCxVrNfe4NAKt97De15bZ8Bt52COKn9Hoilk6bAAXcFmO0SH67tPZH6/XRh5RqBrFxMVSKGY+SC4yw4m6tw+zATreWErW4oDja0LgohRoK0rhtHM+0a3cKZxWgoGaKgWOEBkAF3c9xleKxqlJ+5obpHwMdHsg/P2Y72XlTOaFf5CJoAK7toRamkgPmOv6GFain3jKb3KoJkM2L4JsTMsMuyEJ6QDU14aTRpmNfJl2LlDkTwV0YSAOwtD7YGSQ+aYQI2g3F0KMx40Tb2Aihhayd3vNn6PFiJSCpyTCEgkW/PuFfAcMC0VU6vP2alFQifXcXdAS8FN5IZrsRdkPZlkL0+enwiOz20fZ0hcyu7gPlu6FcoUz+KMvmfhP2BxdsMfhFMTrTCd3Bwd
X-Exchange-RoutingPolicyChecked:
	i+F6qt4pzepd2vXdTgpRE6ak3CqoJ2zZntDlSZHwNMhK21jxR8TDPlzsC43BgpLS96Hk/yPR/mVhPNDynO+DhbqXeY1iNxX5H6qJdjh8EN09QPve7uLxBThemFuC8N9WiuEbmotVX6njIATHuld1pHjDTPkjb703ONdI55MMXaXISg4mia7GxUWfwt5qtddIyghYreo8m/k0QCB4s7CYGIB4FK4fT6vgMSW4Jlhf/EeyBGEng+/1IBgv3UucUmx/WY2KnVTYpSgbXv4xwqPoSgme7Sbz6fJd5T3DKM1WXw++uEOjiOivDX2WYxlmqi3BUOHsENGaV175hobGE/Whxg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qMqzrjREA7+D6Is4G9abg3TMzh63Jl6x/2YHvhJH6AMxQI9qk9pKka75jB7h5ZZkJwCQFidADb8fAzDGGYyEsh0n+SSSd/Nd7rbomeXnrEiC8drDfrmVn3h9rqLJfw+uXzn82boCQqAyQyktS9iQHWu7Kpe+UDlTJ0W+UglHoDKT2i3xQfHXjhC1bVdxcAGCpUX+DYOb5LsnFsx8j1qPLaXh4CgNkjknLAbP8czhEamA+kMRWg76YgO7+TDKTvqnnFeAQqMJrbF8laDSzsQRMM35/yE8xuCPA59knJKbecWe4Vvp8/kxHKARW4xwRnDDX5ZrhL46GcvZcmFtmGZd/Gp4PAsGg5NW0FY/sW9KSWYpfdfnxNLiUrKJKWe9A2XT3qVTCbAU72YkolsD7A26lZVuX/5/c32B/zy/yx2+H16yTS5iwNIRv400VJHv9PEBJvk1pMsyXHUOsa8pJcoE7X4ztQtUXay2cD8DZ7CiBCx7LopdUeg31i05vRIaaW3567NP1qXyoH03fsIBOy0xDg13dZFmsVY//l7Pp+j7CMlkDdHXGqxz3yyWK18TgfRwb4qinRPGBz8Y9GZHr0DWpllUpz/iUDfaP6tQBZVcDCtsIBaM+aijwU61tzZtrqtdTxpGrRxRLKgA/CntkPk13g==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:37:10.5694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 444c318a-1724-4ed2-3529-08df3add4f9c
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY8PEPF0000005B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR16MB6766
X-Authority-Analysis: v=2.4 cv=XfAcX455 c=1 sm=1 tr=0 ts=6aebddcc cx=c_pps
 a=E0F994Awt23I4DNeuEdoUA==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=NvsXeTrgx-CJMFV-xl94:22 a=cbNQJ9GKAAAA:8
 a=oX6sQOh5f4QriJ02HC0A:9 a=G69WFyCBNqGPyalROSdv:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX6COQaDlywrwr
 sJ4yOHpKFXyUFlaIVPmfC6O0Lkrw7DWVFSL5/HHGwzsO0ihcDgOQco0qW3WZzwtLjN056Wt0j6H
 bStL3mBuAXjUBm5IATHAHxsAoV/8aFcuHN35Xk01FgO9aAjU0DTs
X-Proofpoint-GUID: QV0QpYOPfwBW3lGo7UJAELbnc4tRH8Rn
X-Proofpoint-ORIG-GUID: QV0QpYOPfwBW3lGo7UJAELbnc4tRH8Rn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX8OeoO7X7Wovl
 f8kNi5AepZS2c33KXTKh+Kk2y7PwGCNU5rq1O5pX+C5ysHPdqCE6O1GSO2rO2hHrh3q3ty2C25C
 /1+Lt8H5+vdFXk9xziddzyzsHYpPH8YYf7AuQ1grB3InbKAFK333DXXGsKdoWunyMlOkeikuwnl
 S7ghZNrcYRvWjVG2kH24XSMZ3Oa4lcu8yJKFAAGx8fSe0g2HDpyIZtfIBEGwdwoN+GID7p2ivxG
 0W3jm+LpO0OcNzTlT5Bt5u8zZIl8R6tSelakS1pMLE5bYFFM2ghuS7+ehvIOYuu+demKJ/C8oKu
 /3Atxf7Ylhjr0du/Bfax87wn+2w+jKUTw7tS2GsRuaS8pC+XyaRpQrlACad2tEegSmG6iN0kCIr
 7Dqf8gK+rw5MgqTVVCUrmnbH+imEX/LzZeS87zzOE8NVZLM3GhuUgoJpWW6rPJqrockO3u01iZU
 azJ57EuTsIIJ8k6/3Dg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050006
X-purgate-ID: tlsNG-4011c0/1793842638-58FC6CFC-5E03C39D/0/0
X-purgate-type: clean
X-purgate-size: 743
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 .gitignore                    | 5 +++++
 automation/scripts/.gitignore | 1 +
 2 files changed, 6 insertions(+)

diff --git a/.gitignore b/.gitignore
index 0aa9b801de63..46d14a86da84 100644
--- a/.gitignore
+++ b/.gitignore
@@ -37,6 +37,11 @@ cscope.po.out
 .vimrc
 .vscode
 
+# Local QEMU testing
+binaries
+smoke.serial
+xen-config
+
 dist
 
 autom4te.cache/
diff --git a/automation/scripts/.gitignore b/automation/scripts/.gitignore
index a01b533c60a8..f5f0c15d2606 100644
--- a/automation/scripts/.gitignore
+++ b/automation/scripts/.gitignore
@@ -3,4 +3,5 @@
 /smoke.serial
 /xtf-*/
 
+*.log
 *.rom
-- 
2.55.0


