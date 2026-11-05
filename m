Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07D6606A326
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=d+/DuG+7;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=BSFP8y1D;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=aZbJvFw0;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=eEZ3+eze
Received: from list by lists.xenproject.org with outflank-mailman.1473232.1680910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmNh-0000kb-BR; Thu, 05 Nov 2026 01:35:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473232.1680910; Thu, 05 Nov 2026 01:35:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmNh-0000jc-5r; Thu, 05 Nov 2026 01:35:09 +0000
Received: by outflank-mailman (input) for mailman id 1473232;
 Thu, 05 Nov 2026 01:35:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmNf-0000Tg-M7
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:35:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmNf-000xGY-2C
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:35:07 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd28-bab6-0a2a0a5309dd-0a2a450c8a0c-26
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:35:02 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd45-f479-0a2a450c0019-94a38ff1cdc2-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:35:02 +0100
Received: from pps.filterd (m0367128.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50meLi2611674
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:35:00 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11010058.outbound.protection.outlook.com
 [40.93.198.58])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hrdw8rvdt-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:35:00 +0000 (GMT)
Received: from BLAPR03CA0056.namprd03.prod.outlook.com (2603:10b6:208:32d::31)
 by CH0PR16MB5337.namprd16.prod.outlook.com (2603:10b6:610:18b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:34:54 +0000
Received: from MN7PEPF0000014B.namprd04.prod.outlook.com
 (2603:10b6:208:32d:cafe::3) by BLAPR03CA0056.outlook.office365.com
 (2603:10b6:208:32d::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:34:54 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 MN7PEPF0000014B.mail.protection.outlook.com (10.167.254.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:34:54 +0000
Received: from pps.filterd (m0373460.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50o3Jj1488836
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:34:53 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hp232whx5-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:34:53 -0500 (EST)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id OmNPxwimvDnFpOmNQx5heC; Thu, 05 Nov 2026 01:34:52 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=7Of
	eq2WpHsK3IHZPkWuWlAntiWL+LEDmFt6Pi7PGeq0=; b=d+/DuG+7B9A1G8z3ssq
	/4xoA+AF5UIaSKd2mrtTHrSj1jO7wCJ3/Hco4/R6KPW8qX19WVlQ5BBxxPbuSUG9
	M+QmDcN/XhGoh9sUNLs/vwI6Ao/UmWwGNaGL8edLomeL3KPmGBe3sI10hejdH4bx
	CQOpCFkCVIkowVbOcCv2gArPD1VROhZ+3XYHYqykfF1HRzlHGSkjHSHOtwXUxT5W
	VPYSio9HLTbi+B3LWm8AM6GZFdpfUFyHEJ7RZx+Jc3rZ1yv6P6VeiTBo/YupPIz2
	joysY/G9JKt45/1zt9pU3fPE+IGNReXeEdO+rlgxZ6II2HFWWpNCifnc1umNs6OD
	KIw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uraGYyNY/CYa11E3KRHm4r1ZjdmQxK8xgG0mwAnO2O2cbugLozabF4YM1Z4EVyeV3QNbGJ0KsSUpJ8eGlKMFQq7BbgNaY5xtt2LEF/zKOI2AluOhu4H3D51P2czXi4VfoUIhDYZuV7/0HZhtv8DCM8SW2oUvHQ7r51R5JFPQK+ciEmknaXafOTGX1txYOKNbqu6k98uotEVWv0ed6rpIbHEgxog1whaj1lKsWTiTjgBpJBci8I6Zl0bllnv84xULfKryGxcYfm0WrgSAEjmVizOtYOhnDPr5vaLA19ENeMoNCb13O4JhMA1yCpOokSybqeFVgYou6TfEN+/USoor0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Ofeq2WpHsK3IHZPkWuWlAntiWL+LEDmFt6Pi7PGeq0=;
 b=RnXuFwjODABjiiC8QuDgrGvaFg/v1y1Y+KwDgGU6Kx6WNCO/qtOPjyf2Pt/Hbg495MK7kgh5v5NQxvGpsZKdlV+FhnUzfeEiSc/xSQR+xv4zowrhZItTBvwT7AXTG+ZmOLpHQ6ETIj6sMubsTNZDjz8/crj8JFlDma+7Df+mcoOL0yt8N85ChKFzil/12Y+135XlW+GvG3FAHiWN5q1p0b3NgtVXxR0CCoGEK1QOkobIx2AxYtrYpn/9rHYe53vUCrPJgViloQaV4SaZslFKJBYKDcFKMGLsjwfHpjCkyNJLm50Gq3SZ5ATTJMHItHwHnc+gC/7IxyTOL3w2huX9zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Ofeq2WpHsK3IHZPkWuWlAntiWL+LEDmFt6Pi7PGeq0=;
 b=BSFP8y1D+SPNYJd9tfyL89/mCLxOzBQIDaVdJnr0zSj0OpuS3cXUNU1meOvEdcPYrcZOM3tmv4Y4m5LgNzwEecTKVe1cW3SoyBhFdFvhxHkIXX0ed2hrj4ez+awmTw+bxhrQ8wUxs+RfrFs8jcSNy3X2h336hGZJHrbqUNNnqNc=
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
	ppserprodsaar; bh=7Ofeq2WpHsK3IHZPkWuWlAntiWL+LEDmFt6Pi7PGeq0=; b=
	aZbJvFw0QF/EWTY0hwHJ3cxYyZtOhYyu+xQ+rF7zDM9mZsrrDYHgw18/f8XsvuZU
	CkdGVe4mv+nzrQUFGfQEPELzKd2TdgkIKqL/QInPqDXrP5Fv1PECtS/Bawdam3MY
	9zRBeNqhV6eIETCL3ZwfwqlvdJn1RH+hTN7hqohtalqDBDmoWCbothHX1EiB4j3+
	dVgvnLOuFcCsmb82oHOgEiCUiCO4P5hQhYWBa7k88VBKKO7LO786L9Yk0xgfnSKB
	huTrOXbP+GtAtJ7D+D4YwTAEQyzatCE5nGHXNaFacEaWhavhD0u0NRo2wZyIOxYh
	cvcO4lXGwFIfVt4TfETKKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=7Ofeq2W
	pHsK3IHZPkWuWlAntiWL+LEDmFt6Pi7PGeq0=; b=eEZ3+eze65ogdEmzpnXmEJu
	ArYl7539rhof2RZRikxlorpTTn8BWTYSPQEqj3olsFxV2l4WfW+SN05IZYM53nRk
	FjDImGumJwhJS3h0nK9BAgFrWK30xCq+WGjTA1PSm1hNC8JtUZo3CKLIT31h5SJt
	2UjmSyZM0Ik3W31fC2dHAotcmbMq8XaEX+XAMjPkaPRxRIUINozISFdioN1SItcO
	PW7DSxnDVm2snj5jR4I05mQq58gAxLxshSNJHT09qxz2nrPqQ0H1NJk2RVnapYqu
	3nTzx09suwHXoivAnr7V+X2lFUfcRaAIRzW4nE07t64+jNHX74c8D86fmR+hq3w=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmNPxwimvDnFpOmNQx5heC
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
        roger@xenproject.org, teddy.astie@vates.tech, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 18/28] x86/hvm: add facility to print hardware-assisted vLAPIC info
Date: Wed,  4 Nov 2026 17:33:35 -0800
Message-ID: <20261105013347.719392-19-dmukhin@ford.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105013347.719392-1-dmukhin@ford.com>
References: <20261105013347.719392-1-dmukhin@ford.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050005
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN7PEPF0000014B:EE_|CH0PR16MB5337:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 70ab23dc-44d6-401e-9375-08df3adcfe6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|56012099006|11063799006|261009223027099003|261026140227099003|261022105027099003|261021123027099003|261102123227099003|261022075727099003|261026121527099003|261021121427099003|261028144727099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	TcVtbFUrasnOY+skDs+q8k7xFlmY9d3oZRpHJOlXO6Z87w4Y1rluEaDUqfqUfQB36Zi1uT8+U5Wj93V5rmBU5AQBhCGvyZ8ZOrAUlMRfEoQtBNqhetpLS0O4HYByA8rUwjPRe1Zj6hFiSSXKqhwNj4Tu8kqVwm+jvaLQBDrqKWOfTIRN5Oq+44XaPqb2AKLW1WC70A9KkodEfPIX/tdg0lVKwcXNxoVvk+agMlsCqRlakqLZuTWC3dddnTvxv1+lE0IVASTwhCgAIyl9QoBcMT3PQoru9a8BC4fAA0mj9Z0uzdY77P3P7ryAlIQXQqC9gUBQulOpnEuhHjw7FsrzrPAMeXlfQ1/wzR06Owm0Brqsov3n+DWdOnwI1DWOhQ5HIBxm4+xjlmlLPYa1Zj40ej6AH7JsXJbFfLPiedtnioXAfkJoL4XWPRqVUZ7hxOWp50DhKbwtGuRkAneNx24Vtg11juopNEbsV6KKwYDYUDhKFmxRlXXH2lNphY4TRBgxtUbdiNsAL/Hr7tc6Uox46bKgKs8P3QROGWjFC2sPap+gwdbu0rBUT4EvJLldCBd/yp3zOD9SZEqkozfHr96LBScoXxnGlX7f+zD9dzciXQvQA+zXWf71v2iyKdGCUXOm7fvfq45qB11bD4JJ3FSkpy078baQQ+vXTQuUptihBcE+hoYUjYCbXG52ciMgnutK3UjZyeCpfR8Sq3UfGb2Q7Q==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(56012099006)(11063799006)(261009223027099003)(261026140227099003)(261022105027099003)(261021123027099003)(261102123227099003)(261022075727099003)(261026121527099003)(261021121427099003)(261028144727099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	G9HBY90xgv/GeUtpWbXxo0Vqvxb03tnGywN02ut6PM9eA5qF0bU3fAchIW1mujuTxJuDPD1l7rNHt4zmc5yYjLLsdLKYhc1k+oGuJPZFq8Zpxe8428899xIbfDH13dEdsPAqskSNpnRvTFdgUHJjnfZaj57l5RPxY+mNvsR5yX0FQRHS2AtnzBfqKCqXsp0tRt8t2eHALuhYbNZYCTB6UQB2j+CxzZqeAM/WD2ixhcygMsEgThc8EdiRp6rqaDT9ibJi6DNvu0UJ+P7W7NQIM3wGItJk8riaUWTY8n2FwCZmvbR4Vw+Ua2+LpEVY6WeW8+V74HAuLnbccRjl+2xS3+8tYOsspKxjG1QiBwgL7xj3JWvEMZBAIAJqZADMu4CxDbAQtxjFrOnWZo41wkZq6G2U0fMkH97ApEaGUJM+mzhFtuAmDdy4BQKrx9IC2gz1
X-Exchange-RoutingPolicyChecked:
	kpr9i6F4UTWbAuRqTN4r+QHoFsPQ4MDotGozADxoj7YBKkCx5DdNch5A46Q4HETW3As8PMccHJNwVL4l7iFj5cWKwYZKpEop2SHyFHgSK0qBIh/3CYyJHSAqxU2KTtebwBhOYTvPw+/KmukuMJkXxAEa63ajBlZwOqQYZLIaNpdS046LySVD/ngBDno9/WaBPFjfzA1gdkAo5H6LtHW7PoZYFe9i15lDttw1N23xTr8NnbSCAw/Trwzbx2AVfBd6/WpXeTa9HxiQaHV6FbEIuzhqFpKsi5Q5yueMxGjRSgDcJ+bLfqclxtVoQpYq8yEqsXLvbnh2F/TiiSJ0aLVahw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EttMKd5KHKz+3oLsOXfPbHdqU03x6Oo3ecyLCZ2OB+c2PwsH2lYfTPgBlFiRotWv/JDTJ70plBQWle8Kyon2aJ63onpeSw9GvfjY32KSuidV8jfXYqq6EyAKuP1KqELhHkSeBsqYRh4GomIqYEw+JBx4TWxtKss9PUOLCE2Km9jhmyC9u4n2NlbBkr0MBK1MX+RbS66sb344FfBZIl/G14YJ9unc6g4WpbCNQIMZMwDMhuNsbFFq/59HG6Saxm++YwufMGHmE/7R/PlJ/V96Sy9TrcAk8SEmlRXgeIBUO95cTfVKxPMIFDnGRnWQvalBqUMySFtGQ3yLn3r8eZY4rGl8yRo3p6w8sftUZoZzw2RASsXel9wbNGhVxcpPppj3QkqzYjbFB/vJurzfa7A4YckNjmNOMpqPLyH5sOLfBs10qNPCj4IDA0V06CoJxbUbLoXDSoYfRxoL/VvsAvUoGKffKgOjj9lq3L4ts8J0r3F+1ck2oBG5uFGh9zvta1dYGTOZx6EqHqtK76vTt9CNdjgpZEjknXayQMQY7AtchRFWUBfsCZv7G4c6DNFeKcWadDi7Qv80oanZo7DBgL1p6zf11/2N4W5yWJmXtTG5o5RHwdsDRdSTOlsT0KfoYoM1xmdSbTSjLmSBsOrB3rHoKw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:34:54.2609
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70ab23dc-44d6-401e-9375-08df3adcfe6a
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN7PEPF0000014B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR16MB5337
X-Authority-Analysis: v=2.4 cv=JPiuIMKb c=1 sm=1 tr=0 ts=6aebdd44 cx=c_pps
 a=lG9UAvPfEC4VfFSIqus9xw==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=WER9OelvoqQQjwJToBYG:22 a=cbNQJ9GKAAAA:8
 a=cHMDla566H0nh-0__SgA:9 a=G69WFyCBNqGPyalROSdv:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfX8Kktu+OhnsX4
 ds4PTiKH684uUHRpdXlpHyE6wqneo1GhW7hVk9epdIZ1X2UaU2scIg/VV5qoQwoTPmJNDfycQ7c
 IZBPGq9qw6dVBtobsNramSHmUDulNxmLQDWVnwElKEOdQVPPBS4G
X-Proofpoint-ORIG-GUID: iUINUCIM8Obz9kqXn3q49AOXpBsnc1RF
X-Proofpoint-GUID: iUINUCIM8Obz9kqXn3q49AOXpBsnc1RF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfX2M/xW0adbW5E
 IDNHUARIwAVBRJNwtANqkhRVu2A6ualRQw05Et84T2ZXol9Q7VDsI14r5/mSyMteZjx4yDSDS5U
 m9CFrhhps430quE6vq58GumLv5ziMYLk9rHq7yBoFT5o5B6XdUyCqzaoTEEF9jPQ0kndFPQtwxe
 nSxb4aY5olrJicHiJsEr1EvzAJiYWCE9Suw2taxgTOyboxhz84B4UpBGOIg6h8VJbjonxFfIbkX
 aXcI+JSYmQfAZGDIBk0UlzcXvVDW0P9kCJqblJ3zvhdBZJNZUcczrTRW6rOA0FCOtyOoY8rYKky
 MRLhxgG3BH1c/ZtDb9Kzq9Jt2kYFd1zTmoshBIvCBZlyFackfxpiBmJ0XaJRDCOqa57M50pCJe/
 uuQfo5kaWxpCxobB9MqDN/qSLeC3j96PuCdZmwT+xKjHpvY4/0SSOQasLr2V3dNrvR2ks1ecKtr
 Du9OjwefonSiSzcy2ZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050005
X-purgate-ID: tlsNG-d25034/1793842502-00CCBA5B-F27C115B/0/0
X-purgate-type: clean
X-purgate-size: 3046
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Introduce new method 'dump_posted_intr' in 'hvm_function_table' to enable
hardware-assisted vLAPIC printouts (e.g. performance counters).

Update 'interrupt bindings' keyhandler with a call to the newly introduced
hvm_dump_posted_intr().

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/include/asm/hvm/hvm.h | 12 ++++++++++++
 xen/arch/x86/irq.c                 | 24 ++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 9bf2064925fa..1f0f7749b579 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -217,6 +217,7 @@ struct hvm_function_table {
     void (*update_eoi_exit_bitmap)(struct vcpu *v, uint8_t vector, bool set);
     void (*process_isr)(int isr, struct vcpu *v);
     void (*deliver_posted_intr)(struct vcpu *v, u8 vector);
+    void (*dump_posted_intr)(const struct vcpu *v);
     void (*sync_pir_to_irr)(struct vcpu *v);
     bool (*test_pir)(const struct vcpu *v, uint8_t vector);
     void (*handle_eoi)(uint8_t vector, int isr);
@@ -851,6 +852,12 @@ static inline void hvm_sync_pir_to_irr(struct vcpu *v)
         alternative_vcall(hvm_funcs.sync_pir_to_irr, v);
 }
 
+static inline void hvm_dump_posted_intr(const struct vcpu *v)
+{
+    if ( hvm_funcs.dump_posted_intr )
+        alternative_vcall(hvm_funcs.dump_posted_intr, v);
+}
+
 #else  /* CONFIG_HVM */
 
 #define hvm_enabled false
@@ -958,6 +965,11 @@ static inline void hvm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
     ASSERT_UNREACHABLE();
 }
 
+static inline void hvm_dump_posted_intr(const struct vcpu *v)
+{
+    ASSERT_UNREACHABLE();
+}
+
 #define is_viridian_domain(d) ((void)(d), false)
 #define is_viridian_vcpu(v) ((void)(v), false)
 #define has_viridian_time_ref_count(d) ((void)(d), false)
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 32a75f77a46d..de79e36fdfe7 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2527,6 +2527,28 @@ void free_domain_pirqs(struct domain *d)
     pcidevs_unlock();
 }
 
+static void dump_posted_intr_info(void)
+{
+    struct domain *d;
+    struct vcpu *v;
+
+    rcu_read_lock(&domlist_read_lock);
+
+    printk("****** Posted Interrupts Statistics ******\n");
+
+    for_each_domain ( d )
+    {
+        printk("\n>>> Domain %d <<<\n", d->domain_id);
+
+        for_each_vcpu ( d, v )
+            hvm_dump_posted_intr(v);
+    }
+
+    printk("******************************************\n");
+
+    rcu_read_unlock(&domlist_read_lock);
+}
+
 static void cf_check dump_irqs(unsigned char key)
 {
     int i, irq, pirq;
@@ -2605,6 +2627,8 @@ static void cf_check dump_irqs(unsigned char key)
             printk("   %#02x -> %ps()\n", i, direct_apic_vector[i]);
 
     dump_ioapic_irq_info();
+
+    dump_posted_intr_info();
 }
 
 static int __init cf_check setup_dump_irqs(void)
-- 
2.55.0


