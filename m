Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2141606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=SJkPKmoT;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=FjxgWzHr;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=I1VSgPs9;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=I+Q3Jz/A
Received: from list by lists.xenproject.org with outflank-mailman.1473180.1680825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmNJ-0005Vk-PY; Thu, 05 Nov 2026 01:34:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473180.1680825; Thu, 05 Nov 2026 01:34:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmNJ-0005Ux-GR; Thu, 05 Nov 2026 01:34:45 +0000
Received: by outflank-mailman (input) for mailman id 1473180;
 Thu, 05 Nov 2026 01:34:43 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmNH-0005Ll-MA
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:34:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmNH-001wz8-2h
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:34:43 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd20-2eae-0a2a0a5409dd-0a2a450191ee-10
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:34:43 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd31-5984-0a2a45010019-94a38ff11828-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:34:42 +0100
Received: from pps.filterd (m0367127.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50n5MA227443
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:34:41 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com
 (mail-centralusazon11010038.outbound.protection.outlook.com [52.101.61.38])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hrfaurbrk-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:34:41 +0000 (GMT)
Received: from BN0PR04CA0062.namprd04.prod.outlook.com (2603:10b6:408:ea::7)
 by BL3PR16MB4411.namprd16.prod.outlook.com (2603:10b6:208:33a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Thu, 5 Nov
 2026 01:34:38 +0000
Received: from BN3PEPF00022BD0.namprd03.prod.outlook.com
 (2603:10b6:408:ea:cafe::39) by BN0PR04CA0062.outlook.office365.com
 (2603:10b6:408:ea::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:34:38 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 BN3PEPF00022BD0.mail.protection.outlook.com (10.167.248.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:34:37 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mn2H2969641
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:34:36 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hnxs4nrke-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:34:36 -0500 (EST)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id OmN7xugeYz55iOmN8xXIL0; Thu, 05 Nov 2026 01:34:35 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=epf
	nUdbtf7rNlmst+lBbQXBN+HCXSuGOjupcOfOOzY4=; b=SJkPKmoTFSnHBzz5iqd
	lOM2Gi6E4J8O7+AFebMtgPT5oX0kmIS+riBRKehGa1eZ+RzyPCzAkJuZuomMv4SF
	GMKLpM40sNCUUtodT/tyLZaq9vr+L3cRlkSC1qp8KoiJKCwN75BllbN10IzhYpZ2
	NRemO9c5vbgJWlPNT4n6o5KoLrSVXXyPom3qWBJ5Y398Hu8MUGhYJfZZYZz/0o9u
	e7F1wf0H2iBnSQwdw58xXLYq79sslmNU+lBorDRmeCK6cXeHApbRau6zY295t6Vc
	zpq4xaO606wAHMfTdKNFgBtpg2hZyjFHI6mDszgdyQf5BcHqCFGP32Nb8Uf5mT9g
	AfA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ldgb/Fn1VnCien9g6i4NduTptysqtsvs0FxdX/Ek8a3LHzdwetIO5kc098beW3SWF37Vu9w8ZBPFR5j3nW1Jh88c1DWTTUgRRENiy1YwpO9RJB1V27xSd5GBJAmiZ+Mtux3j6uz1Z6O8VgNMaLMwuJiENmtRq7DCHftHjY8mE4ViV4PHAFrWCmPGH+2mX8sHkV4XnQiWMdVclr3r7sEKJdLcdxrTatMyIL6P02In2mn3ccmBiIlHSHwNKHw8Ouq+Vh86lANaNRSvVWxnF3l+JGylt5hrUitfsD46OSDNym5GATjdpDZrsCV7+qx+8duW7Hmi83LKq2wqC40lNTklBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=epfnUdbtf7rNlmst+lBbQXBN+HCXSuGOjupcOfOOzY4=;
 b=iehks+zFxJF8zdie0EFxDD+xkTmI3/WfryQlTP0pgf9L3zR2yegmjPgXz8MagV6GmMb1lPfgYT0M0XCkepUjyGQfD0/vDqbqzu+O/yngXlJ8nNmyvkWtUIRAHdg80+qvzRwr+QHWOrnfexPTBt11oi0CQlVeCzgqtvHwg0F6jEaY/NmQHnjENKURWN6FrM60mHPu777l3RE4ZdEOkiJNmg1+OfjfZUaLG/naY/r0ps3WwLVpoMoSEezYWImzOdWHD/1nO0MfXD/bzsSjZSfOTeoDZVpkrEITLgYA53o4GuH+PVZPHkBt3g2NCd1pZfMmy7+674xmOk+4+N1Jyily+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=epfnUdbtf7rNlmst+lBbQXBN+HCXSuGOjupcOfOOzY4=;
 b=FjxgWzHrX9zygaJXAaMrS0LRvsSZmmMtrVMqBmP160P4+r4oI10P4iC39XmMfMWVfM1ETIuFFNz1+QVtQ11ix1u3thbvWo9TmwN1dwEwLygR8oOhpYs1ZdZIH2002D1pxXz0avP5CXfcVgGWgxp+T7AoGIXJlUZA+TgpwPtYQKQ=
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
	ppserprodsaar; bh=epfnUdbtf7rNlmst+lBbQXBN+HCXSuGOjupcOfOOzY4=; b=
	I1VSgPs9fLI1ftUmvDU4LodUKr+MW+fr7EhuoVaWeKyy3hsqNgzB2o9sXnjLhvey
	jnFvHeT0YKQUfzpq3EG+7bFbik8n5xQC3DMQqEcdMjN73qZpEgKBA3tmOu4ft0xD
	F++3boetlzfbDfL/eqd6lWYR2ccHs207HzVV9zZ9JCoiY8rguHFZZeWI1oWcxImH
	c9dHmQDcXMnSm92YwURAgqaBoKaOi13llCjfCHKHE7V7HDfB5jFJ5SDgHl1ziYXc
	R+SxfvNJLSnqRWt6OSjEtTQqty0rsTrJ6+ieH8islCcLWpF+zv+soIJLdcIGeOl0
	nvbF+6Dc33olpkVYK9aAlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=epfnUdb
	tf7rNlmst+lBbQXBN+HCXSuGOjupcOfOOzY4=; b=I+Q3Jz/AEvXcyCxpRoYQNRn
	TDeaQvAt7cUTivQVNWcD1SiidKZHvBzyUn5su9Lljtgq/f3vuxKeXRvfK3bHSHtD
	dbL7NNrVGqaK0AUwh2YFkaKYUkwjJgzBqa0fwTWQMSmQqCJ36xKCgGROK8G4Zq0h
	tp8johUak6LhbdMa9/LZzSDPevXC/3jR4QW8O+NWJ4iiPS4SG2bUicYupeHl3o86
	umGwic9pxTUaIVe5jt9SztqweHKQ7MzULJI0CmlYHUXr3retCXOdTJ5ZKWGoCJKB
	mKhktqlxW0IE7cWi+pO55D4+HGyUuOHwdPyI2nS+S9n+4KPMbRwvGfFFytEjnxg=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmN7xugeYz55iOmN8xXIL0
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
        roger@xenproject.org, teddy.astie@vates.tech, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 11/28] x86/hvm: introduce vcpu_is_vlapic_tpr_emulated()
Date: Wed,  4 Nov 2026 17:33:28 -0800
Message-ID: <20261105013347.719392-12-dmukhin@ford.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050005
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD0:EE_|BL3PR16MB4411:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7df96abc-59e7-497b-7ef8-08df3adcf499
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|23010399003|22082099003|18002099003|261102123227099003|56012099006|10067099003|261009223027099003|261022105027099003|261021121427099003|261021123027099003|261022075727099003|11063799006|261028144727099003|261026121527099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	daWWRcRtddaBexuQdYCs3MUCGMVYl1Hrn+uRFYQ9jzGFR0ceG/dO9HTtiqxZtKbfdjKKdUH+v5MjbvL/CshPWWg4BPzmiSpgsakaLO0F7wyRJYUZtQv0ysloNyLFtAE+QX11BiOg41+s3vnfjMYEYejN8ZRPi2VH4FTsvaF3e8vDyC3OlaiqunTJ/nuH4myWRzUF3Ry+OXr4gmTkiekFRR5t7eMTJiERGDSTar7n6DmyLLdILBZQ5gTAG5FUK4m1PK9nzeTj9JQbgCNuERdBNbqJX3pXy+ByHoLwCXqeKwCttpmPCoqwYjbodxFXYnOAmdsbRZya+nSo2IC04PBz4vchrQBjfOsHd5QUnrqekzZH/dk1NL1CdKaEqZ1kENhHuX3BP6oQ0zerD7oSc799eQt/YLLUifPy6Opv+cpwv6KL3Xh/ZYEegl0QexE+vE2hzgcRn9Tbe3aHmw9LOLotbf6AdT+E5ypBF2ICW+Bv/FQ3GBK/MZXJcdLTW7iMin4k4aZtgWQYUQV+iQ1cCE1hx8iym/pXAY7vxYmQSXDXBWHsdJsuq2R8y2DvZQr0J2nFAL0mfRmRYSMxPHarUds7h1r99paf9zCqRbWkxOaBaU0kTC2odttYyAUd9fydQQ2zC3XV0Km1RKZNcPD6/lLDFZT+cTpKb8AGJGKvQmJFIBIPZA1yIQwatEmnJkkeGk3uD1LSWN6Y56xECVARwR0eHw==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(23010399003)(22082099003)(18002099003)(261102123227099003)(56012099006)(10067099003)(261009223027099003)(261022105027099003)(261021121427099003)(261021123027099003)(261022075727099003)(11063799006)(261028144727099003)(261026121527099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YchnYcNeHMh2Esxya08htpEwD6rgPg2/Z2mt/cAfYaRr1q8WLzqgU752NMxTbOpJnpdbRwB4mEdIHBxCD1MovpTHLmKyekFHxRtirwZ6KqcG89nzzvquwIzE41Tp42SH9WnSB6Qbue4P/DtQ39YjxUQKbzWEaRIujj181qLD+UpuQVjumW3+6K5Hf+KfRd/+oI3OzqBLiZGLyt08LMoWLGNLKJz6qnEMqSwhMol54onHydtgtf6ZTX/CkD5sx9p/aoUxWKDIE/Dx4L3B51BWVlUMWYNw0N0T5q5YUiUaoPmFvfeQyX7+F3hznkSTbZoWB4OYbIXOFa7BP60ACNXKYUETgZ/4xIrrNCqwUqnru7Z576OvPxxjCpXmSAz8cXpI/zKGgRDNXAof30vJ4xYf041dGcD7yo9MtSnaOsZr+jRTlUZZouSDM+IPkRAbKj3R
X-Exchange-RoutingPolicyChecked:
	UC9g8vDliZ0+7O3rzfcupsWV2iJQ7aMf+b7RXsXIICHGCdSBs+ulsU3QJyGx+CPtSyYQtLqnqwOn8HS7cRcp3bvyJVIy6nfGlwlgHYHeRJpwEqiiX4j6UaifZKcKHumo7VBgoAvOBEusTJVYQnUNoGOMrZpDjkY+ck0K9lke7SRbMOPEfW87UaagWTD3J0D3M5T8CtAagxbp3BIjUvA1BZP2koIee+CKQvFcZeJpUaiUzyk5w8D9sod+Qf+jVAsshX8SqRElEAcK0bUn1aZeWILBEbm0t/9LB43zFArG27pGamZIBxRlJGcgj05sOp0ErqXIJf4uAO1r/CY2JLDJOg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	V2PYRsoTEOgx5DtJhx3+UBNgpSiC/OniLrVJt4lX54WATacN7PHoE74K7j5u75YhnaqHgaM2YW9pZklbCVX+uAj3rabFNX3zJPLi45e7uUgZ9woDA8TUg9Iatht3vInrVyaMPLpRahcxaxKPWlnnNyBxcek4+2Zoc/PtkvUue+sPR681jy4CoANYrJ9PiYYaBcjwdwl5ar1wh8v8AxQlvz06BCStoO+r00ipqlRhoru47GsPu8WsmqyqeDeFh25FFZGiMlcBBelTpHlu+6tcCXf8r9+/QSgVwKcQRhwVFtHHhTti19C4nNvm3+dYCtfNRwYi+eAfvLcDNdlxLHZxNB/nrxmZ3dzamRIEl3GohzZtDJtFPhbid+/xTiTLXCTLyCQ0TxOvdSfnDp4miS5/9a1C9tUkxMJ1m5cOP55RS+Q/piSyjRaN2zYg3CkSAIo4HDIwSj7D3e3NgUBx/kcfHoXSj/30yzzJxGPrF1eV+witb+5e6/IsAkRruvMNMCcYMmMAEJaTDWEvIheurtEwMSO1PnAF+bR17AjyG7ZzGwFXsY4gSm01SvXbtbdDxcf0dAwlAvuHoAItJpV5M8995ADNPqtkpsoi5XC0n9EFuQ7t9gQ9jr3TaBg495XM4oLmc3DEFDj0xrhfDsfgC/T12Q==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:34:37.7899
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7df96abc-59e7-497b-7ef8-08df3adcf499
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR16MB4411
X-Proofpoint-GUID: MR41UklxQ1OxSHoScIXIkj9CjgroxtNk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfX9HnzP/uT9nXe
 3YzXO7SmfI9CYrEbWo/cSKeEyriX/SaDgP/M0IFNMiERAUlBhmnjnJNYfqbW8D/BIPHDdjXxoff
 M9+AZzjHWkWBFiWO2RvuH+eTb+RcvvAghYn+rKctl5VPo5zuOA7l
X-Proofpoint-ORIG-GUID: MR41UklxQ1OxSHoScIXIkj9CjgroxtNk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfXxuQOy0pAjrPf
 sA3XZjF3bi77TSS/Mmivrhza3QRGovBROUhPV73k/VKXH9wZngmq0docbw+UWsTNjYn13pzkoks
 lZVGEmWTLCqWjkOmQrtvvcUqGIsz0e6Z1gJfl1A/b/u0PlHod8Jh9Jig45K4vy8RsoNuSgXKqBq
 mCePPLx8Snd/Ee9VAgzvkPXK/67d/ioY9DxTcPRJ6isAjdpge73a/RfIq1HV54kQ0yA1qqNG+he
 w/H9nwHqPEjZi/ZWbhnHgVOXrZNwigxKawC9nVJGonxa6diVRfLZiyQQw8aZC3p7xqypaK49QFS
 PSvnC7CQtMwixm1RL1kRUYO+ARq63dM83GUtdnjfabhjLyD2NaWvkJWgXaGQiFA/dSFiBB5NKrL
 AjbPVZzlOWHVWJ4pWmZeKjE+oDINWZBOOJw8IxyTUI4rHzeEjdiSOxLCYIGGa/Uvnya5EzB988f
 AR1faa7JConxiR8r3eQ==
X-Authority-Analysis: v=2.4 cv=ScVi5fRu c=1 sm=1 tr=0 ts=6aebdd31 cx=c_pps
 a=uwUl5xS/OuIXHPkYzYKLCw==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=dw5MciS7gY-znkhJuOLE:22 a=cbNQJ9GKAAAA:8
 a=XLFSpuJ1Vscf6XR70B8A:9 a=G69WFyCBNqGPyalROSdv:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050005
X-purgate-ID: tlsNG-d62444/1793842483-BF262757-ED1E101D/0/0
X-purgate-type: clean
X-purgate-size: 3425
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Introduce vcpu_is_vlapic_tpr_emulated() in genetic SVM code to account
for the case when platform provides accelerated access to vLAPIC's TPR.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/hvm/svm/svm.c | 38 +++++++++++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 673c818a0039..14a86ca4ff8f 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -925,6 +925,19 @@ static void cf_check svm_ctxt_switch_to(struct vcpu *v)
     }
 }
 
+static bool vcpu_is_vlapic_tpr_emulated(const struct vcpu *v, bool force_noaccel)
+{
+    const struct vlapic *vlapic = vcpu_vlapic(v);
+
+    if ( force_noaccel )
+        return false;
+
+    if ( vlapic_hw_disabled(vlapic) )
+        return false;
+
+    return true;
+}
+
 static void noreturn cf_check svm_do_resume(void)
 {
     struct vcpu *v = current;
@@ -933,7 +946,6 @@ static void noreturn cf_check svm_do_resume(void)
                         v->domain->arch.monitor.software_breakpoint_enabled ||
                         v->domain->arch.monitor.debug_exception_enabled);
     bool vcpu_guestmode = false;
-    struct vlapic *vlapic = vcpu_vlapic(v);
 
     if ( nestedhvm_enabled(v->domain) && nestedhvm_vcpu_in_guestmode(v) )
         vcpu_guestmode = 1;
@@ -959,8 +971,9 @@ static void noreturn cf_check svm_do_resume(void)
         vmcb->cleanbits.raw = 0;
     }
 
-    if ( !vcpu_guestmode && !vlapic_hw_disabled(vlapic) )
+    if ( vcpu_is_vlapic_tpr_emulated(v, vcpu_guestmode) )
     {
+        struct vlapic *vlapic = vcpu_vlapic(v);
         vintr_t intr;
 
         /* Reflect the vlapic's TPR in the hardware vtpr */
@@ -2538,7 +2551,6 @@ void asmlinkage svm_vmexit_handler(void)
     int insn_len;
     vintr_t intr;
     bool vcpu_guestmode = false;
-    struct vlapic *vlapic = vcpu_vlapic(v);
 
     regs->rax = vmcb->rax;
     regs->rip = vmcb->rip;
@@ -2565,8 +2577,10 @@ void asmlinkage svm_vmexit_handler(void)
      * NB. We need to preserve the low bits of the TPR to make checked builds
      * of Windows work, even though they don't actually do anything.
      */
-    if ( !vcpu_guestmode && !vlapic_hw_disabled(vlapic) )
+    if ( vcpu_is_vlapic_tpr_emulated(v, vcpu_guestmode) )
     {
+        struct vlapic *vlapic = vcpu_vlapic(v);
+
         intr = vmcb_get_vintr(vmcb);
         vlapic_set_reg(vlapic, APIC_TASKPRI,
                    ((intr.fields.tpr & 0x0F) << 4) |
@@ -3097,14 +3111,16 @@ void asmlinkage svm_vmexit_handler(void)
     }
 
   out:
-    if ( vcpu_guestmode || vlapic_hw_disabled(vlapic) )
-        return;
+    if ( vcpu_is_vlapic_tpr_emulated(v, vcpu_guestmode ) )
+    {
+        struct vlapic *vlapic = vcpu_vlapic(v);
 
-    /* The exit may have updated the TPR: reflect this in the hardware vtpr */
-    intr = vmcb_get_vintr(vmcb);
-    intr.fields.tpr =
-        (vlapic_get_reg(vlapic, APIC_TASKPRI) & 0xFF) >> 4;
-    vmcb_set_vintr(vmcb, intr);
+        /* The exit may have updated the TPR: reflect this in the hardware vtpr */
+        intr = vmcb_get_vintr(vmcb);
+        intr.fields.tpr =
+            (vlapic_get_reg(vlapic, APIC_TASKPRI) & 0xFF) >> 4;
+        vmcb_set_vintr(vmcb, intr);
+    }
 }
 
 /*
-- 
2.55.0


