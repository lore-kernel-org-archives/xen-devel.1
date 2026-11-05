Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19130606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=jpt3oj0H;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=EzflSAU9;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=Npxhf9uc;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=ksVgjMCq
Received: from list by lists.xenproject.org with outflank-mailman.1473521.1681252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmRa-000596-AZ; Thu, 05 Nov 2026 01:39:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473521.1681252; Thu, 05 Nov 2026 01:39:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmRa-00058q-6f; Thu, 05 Nov 2026 01:39:10 +0000
Received: by outflank-mailman (input) for mailman id 1473521;
 Thu, 05 Nov 2026 01:39:08 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmRY-0004o0-7P
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:39:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmRX-001xXk-KF
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:39:07 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebddeb-8faa-0a2a0a5109dd-0a2a4509e25a-46
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:39:07 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebde39-be1a-0a2a45090019-94a39217c48c-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:39:07 +0100
Received: from pps.filterd (m0482516.ppops.net [127.0.0.1])
 by m0482516.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6A50maiC1531040
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 17:39:05 -0800
Received: from sj2pr03cu001.outbound.protection.outlook.com
 (mail-westusazon11012003.outbound.protection.outlook.com [52.101.43.3])
 by m0482516.ppops.net (PPS) with ESMTPS id 4hr9tfbj14-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 17:39:05 -0800 (PST)
Received: from BY1P220CA0016.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::13)
 by PH7PR16MB6167.namprd16.prod.outlook.com (2603:10b6:510:2fb::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 01:39:02 +0000
Received: from CO1PEPF00018866.namprd03.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::96) by BY1P220CA0016.outlook.office365.com
 (2603:10b6:a03:5c3::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:39:02 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 CO1PEPF00018866.mail.protection.outlook.com (10.167.249.150) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:39:01 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mNQU3091282
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:39:00 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4hnycbnhnn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:39:00 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id OmRNxdLolmeVDOmROxZqYn; Thu, 05 Nov 2026 01:38:59 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=oYf
	26GDzfF+IzeihIfuSby2Ls4TyHYFhd7UaP/EZlao=; b=jpt3oj0HtDco5euDjtO
	+K2W0/4rIGkfXy6BSmmCLns55GqmEhOatPvj1oxjkyFLWYxsat+Qb3Hk+qyBUFhg
	APVm72B/aUxNQ7zAs89l3q0URTxfzhmTMg7F4ZdBeRA7bFWt/DJXJZdLFJaTQgdd
	IrQggUjxA47mwcId7x9NxpgdU/swSV8+szELQNGROHDu3q522P1ueyObOVwyNNXa
	3Vx2r76FHEgQeuTGVDyHESxA8X71byZLeO+ctPiIo6WmqK2QCMPrheRNEegRvy5u
	AHnLD/oAp1uTRc8bmrr4MwcpwxWFtJvpt3EIrJKe2MZJk+dZapvBHSOfx62kktFW
	mDg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gvhqa8o+DGzXHNk7KVi1hzRlBXqMdbUWh1m277cq0I6nruUX5Yd/NLKXzyR+kSAbr9m/zTY3W/O6sRCmUtRnWjy5Z9zmiBLUFugdneiUiTgJkW4gQgl2uFXOCYfEwz9489IJwCIkBVe1uoa6jtrquTh7NLd1+R8QDeVfy/3Q45BFVQidQBbMh0wNPHwFYSzMHC0QaG2Nq5RHv5rlPXtcKYfZsSFB+TLUwI3eDbnFz/cKsPZ/R6FIQTfasASENPkCuGqQUfsQLHFm0u34Q5MMWUzWSjzc3MskQbBG1kN8fiJiQMO2zO2celiB8CtVk9m+K0i5gr0rW4iEbT0rjP+0Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oYf26GDzfF+IzeihIfuSby2Ls4TyHYFhd7UaP/EZlao=;
 b=FCB+ED0ZeotnC/DQXu7ZrfTNKap31Dd6EhUonCI3XRnNCSd5f2VyoRUNh3k/6WEVgx3VSYnoxWunRCTRsTvgQdrVrVVzmrxpgbm6GrlSkUtAsiwLXipm2Pa8nF1zCDrVeQwzTeHzSBh58pzFS++YbUfJq8XT0HawcMHjmaeaqzq3rLGgq7d2VEvWHfBqQekjbt4ZQF3dcCcAJ9j5FfpclgsAleRrZUEgi76l2X0NalMz+cLhVNs9cuOXol+RWRS4HL1aMWRap4ID644IONwb6qA+5PcDWGPVyropZRDjnyKj4C5tqv6kvt7Ajv4MX60uv2uzmcaUjT3Gtf3DO7Qlbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYf26GDzfF+IzeihIfuSby2Ls4TyHYFhd7UaP/EZlao=;
 b=EzflSAU9QeIVI1Hu8XfVSGk9QF8svpGYLv2mfsxadgBevmYJmQPs4tY/oMNYKdjkYHkPdt79P7VRZAvj5w2MNnOJFSnqnA9aMa82PVJ5qG5082xyBTsjLYTr97+01gpw3U0pSBT1fOlxX08n3T4n6JWKCuWIu5HurQAWgJZXN20=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 148.163.138.245) smtp.mailfrom=ford.com; dkim=pass (signature was
 verified) header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	ppserprodsaar; bh=oYf26GDzfF+IzeihIfuSby2Ls4TyHYFhd7UaP/EZlao=; b=
	Npxhf9ucB0SylwZinMMYO9odCPnTBV2QKdY/rPYbpNusRUTdDrG6sbz7e/PAJjci
	yjXI4HcLuGL2HS4tGzWhbLkUuN0/Fb3qQAU/lSSzs+bRtizzW1OejFIsPg2hBjiP
	AU8CQLdyU1LlD5/sTs1GWSxcGFWAY5A0Uvn1E3a9Aw9pbyBSre8B7uhAJshFUuhT
	1YAXgHKRKAXDqj+A4mMHgghEBYyw5xsjca0fjTSlfWHfiYxdtSiYB/dvfWd+Pj0O
	xI9fuS6/YpC58jo+h+lMBt3dClflOms/igUhGB9Jd0ZrIZlkWLTSaBSs3LrOU4Cu
	QYPjlZfNq4d09WhdT3wYkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=oYf26GD
	zfF+IzeihIfuSby2Ls4TyHYFhd7UaP/EZlao=; b=ksVgjMCq6FfJxF+UG7pbIZL
	Mt/mvL5wbmOWwBhsNm0Z6uvR4H0L1QNAtCRGm7bFvxB1iEUIA6caDGa0rXWKVvBD
	ABJxgtPRTQScP24dXOWl2UIpGujkG84/AMEVNNBbt3a+vXen8ivk+ksIPRmwrEbT
	tS1m1hJHoo5LSfnGwb03Lx6s9vAZruIEr88hYgXa0wqJG+WNUfz1DEYnofcZGJpU
	MKyKnMNhAftzIicDTIJPWMb+D/35w16/RQODVGaOtjoFqPLCrVRSZuqTjvZK6yFx
	zymKExjn/AmJ6+AVssTYty6wbhwNY6kGYxBrSj2sAtEqXdGr55CLQZnv84gTiuA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmRNxdLolmeVDOmROxZqYn
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [XTF PATCH v1 13/15] x86: add primitives for interrupt enable/disable
Date: Wed,  4 Nov 2026 17:38:15 -0800
Message-ID: <20261105013817.719823-14-dmukhin@ford.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105013817.719823-1-dmukhin@ford.com>
References: <20261105013817.719823-1-dmukhin@ford.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050006
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00018866:EE_|PH7PR16MB6167:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e5e75e12-9dbf-434d-93dd-08df3add91da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|261021121427099003|11063799006|56012099006|261102123227099003|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	EUrLFYvqgQKisk4N1DGhtfhkBEJ6fPf20fyk0soyp32Rrfd7Cc49wa9VyEDh0k4h4bgWmkU3NN11s3iCUFAdb7yj6OB7RBJLJOWR1iADZD2brmR35wferey88qDqsPIVrEd64ZWfAgNcv+BQwfpWJk6z1oxqCqG6e1q+0WvGfhN210M0ARU2WcIqaRedqxcIwquhPQJk366fFOzFjYFRPjzLXOkTf0I4uhLdbl+x+tb0RH/RLz+8W+Ru+T4lCTRj1XoENS7pYSUbRqVJbKCFxQOx/kOTeoqhAecNS538AcZC05awSnJ175Jc6wmy7YnH7NghXxbadJJz9VCc2PzGQaMZsTm5+VRvukNxmMLC5j+18zIcGw32vjNltO5k6oRLM2xBuEOMtWTSZO3CHFLjf0NcpntGN+GCmg4v6VZgIAP2p1unKtsLMahbhY2W0IOZSk9lWHka0d9nCHiHWosdWLn4vw9vDxTr4Ud+ftzIKQWLzReuUW3DejMdwW3o3VVq6Pgm2WYMuMcJkcKbLg7ScwNziZH797GJxo7gRsDIQwxkD7QUxUNf6vvfqHuQ/LaNByL4d6h0Saly162gF/8D2yxRriYKiKvUwlr72zPUwvFlmamMYvNhT8DXY8ULYZqaNp7ZvTOExix3c5UE98AAQHvaR9gxUMeMf4/N4fi0gK49eEeqh9v5dDo5f7CMIdr23zLujRK2Yp0n05b2MZdziQ==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(261021121427099003)(11063799006)(56012099006)(261102123227099003)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9jBH1YVOObButIBgLOxYhnk4c++joq8AuDuYC3WzbYCTqo5l7ngn0liGO4Kyw/yeziyCrtspcSmAc/icdmtBHaTe4U1FKOLVNPa34tFxDqrNPoAxto1Gz+TUs+TkQN9UevD2953nEyVaha8pKvYjSZdBtu7QMiJo3eg9C4fUfgW5qVG8/uTFfdRLNb00IVrtQeYsTKPC0kf91wyeUrfuBGl7glAYdr0FsQwNWCtZeogFtgvp+YFBT6KGW5dKhTzjUzyzHYF98nq07kC0OdehiLGGRCBwiaQxbwtYcmyHHaDDz6aknGBD9lInjcd//D8d4H+0YbOonsiAzjWIpceJEmASP0TsIKwM+HEP1SzB7pHGfYSpd2/feCF6RRH+A7QqtTnID1p3J7esVkoMPyf4rWOFv6wSYsozi7vqC2buEv63iHBCH/TuT/DNrnMng8Hi
X-Exchange-RoutingPolicyChecked:
	UKwV04fKk8yrlOr0hH/KF6YfQNSQWfIK8Z/e4P9pibZQUSkHSUwt79O+Okjp0yYAbmTrT+E/EjYfKq8C/2Md8B3xwtXCdIRlZ1AbGNICih4N07pyVJddeLBTTF8fJSBFLDVTM2Zp51Q4sy7kB8uuYjZmG6EaSP9ndepbWaLu2NWTVoVgldjsJp17YU5j+5dL9AsjQQ/cQdVQYqgq2ymvk1MGla65pSpsct+PfMXdpzM0yw67qpS0coI6KSBn1rv0a7KusbgEVX1AwCPjkb4yUNmuTGK7rrMWro3rQ5e+MQ3+deo/0n5eN7NEeClQa9WJ5uL8VsSCtdjCQAMnIxg56A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3jzcgzVr24TEqej3i4ObOmIqQygY50H0XpyjU2ABRLwnarI13SRhUlr7iuArOPtZIlmz317py1rG3U2tdYsETuGlNBWBKsMJbEagNNLLXdzkwtcnr0jetkrH/ldgwBYqAp+qBpdsGJAQXHoDq+sfcLqXYXmCfb47CiMU0Kyn4qlS+0XkKT3oIA3oe4LHwFxA/YjDuX6ichHXnvkVVy53AcIZrwWQRFIUrFP0jZWzy2EUdJt1lWahV9bD2OJ2mXg0unR4bMqdz3K7N5iuA7ISj/NLDsNBXPAu/qpzylvNjvyzNfCd5Fr0gKoc5z87e4+/ivgTJJZ5rjZcVHXCc02Eg6GI/nOJjoA+sOzLIjUS5nl0WDm2SuLga1wdzjPQIaaW60L3HAmsOLIYll3kEdWycxcE8VOX1Z2H+RTqYfTc3oXmxwfFQEfq+o/pUfdKZ/WDc6i90atQbw6/WqWcR/R3SAM4Lux1hiImeT/UZIAj4QdjMDQX5jbDo8PPV/HQEM5VPlTtnR6ECqQgwvX8XA+pWsMCtWBy8+6+IrCdvH6eKMafiiaiaJb4OzVIZH1Zk0Mm1UJUZeL7x0zW3Kx76mzk36wUu4YW8HIX3cx7OZCmDYAx/zv+nGtvA9cmFhhWTHoxeLCUpmCuF8F0xJyEA2t6Ag==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:39:01.6237
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e75e12-9dbf-434d-93dd-08df3add91da
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00018866.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR16MB6167
X-Authority-Analysis: v=2.4 cv=XfAcX455 c=1 sm=1 tr=0 ts=6aebde39 cx=c_pps
 a=ayBBURk7jZ4GzqZFlR2IhQ==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=NvsXeTrgx-CJMFV-xl94:22 a=cbNQJ9GKAAAA:8
 a=oX6sQOh5f4QriJ02HC0A:9 a=P0bj-C3X3jJDpopQwM1U:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfXyOVP+SHsKOFA
 sz6u6/0T4swop6tHk6e67Z4NZVL7HquOw0zoY6TPj185xzMDEznjMMW/+OT66OTVlYEsfWnnT0J
 gLBgcofFxPzorzQTSm2OBwqtdNXnSfh2HhD1CCO2jzwqQ8uBIyTO
X-Proofpoint-GUID: JAqPgAl7sFXmi0tvRLv9B2ra1f1OkcRA
X-Proofpoint-ORIG-GUID: JAqPgAl7sFXmi0tvRLv9B2ra1f1OkcRA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX+b7yEmPE8cG5
 qwqjgxnji1UrUiZet+P/4mw0BtovQ3Dmz/kRVxMnKbmK+ydL3SmvyfNZe3uHoKM70QZ/jGSgYaG
 Dh3VMujdJYneV2OERkUXJjmcfziEHTbMfaoZU19FmBtdaK03Iw9ZQMgeV6ypF8rY36Ry24wJJXh
 Q3nsm0tWjkt9AL8ckKkFJv51w1a5kNhssg8D1V0K1FYIb0QToDQnIxHCTs1mFAAnGVuzym2Wmsq
 WtV/mgklwp/OzDotMp+3eS9/X+MmbccLKHuwDi+bMwS5YDYEV4Drag1cXHVLLbhPnCqwSwMNRbS
 FY1SMdqVyBtRKTy5PRFuZBBHqzvCmpglxBc79SuZT1f8MGuEVXRUyynG6H9Mnb0BGZOBg4WmItj
 K9NrbQ+kvJ3j9wkdH4FzZf/frapJsX6FoZbECJzL6pbBGRzGYluKZxQwlZvfoliMuOvWiUNgXWc
 C8EEkCzzawm7pHOsbSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050006
X-purgate-ID: tlsNG-bad1c0/1793842747-BD6C2034-01117F50/0/0
X-purgate-type: clean
X-purgate-size: 675
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
 arch/x86/include/arch/system.h | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 arch/x86/include/arch/system.h

diff --git a/arch/x86/include/arch/system.h b/arch/x86/include/arch/system.h
new file mode 100644
index 000000000000..3f1c20263a3c
--- /dev/null
+++ b/arch/x86/include/arch/system.h
@@ -0,0 +1,7 @@
+#ifndef __X86_SYSTEM_H_
+#define __X86_SYSTEM_H_
+
+#define xtf_irq_disable()     asm volatile ( "cli" : : : "memory" )
+#define xtf_irq_enable()      asm volatile ( "sti" : : : "memory" )
+
+#endif /* __X86_SYSTEM_H_ */
-- 
2.55.0


