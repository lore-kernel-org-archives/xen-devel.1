Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3D1606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=lhk1JeOj;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=Jt+hDo+b;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=A8NEEfbD;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=eOb7drPA
Received: from list by lists.xenproject.org with outflank-mailman.1473490.1681186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmRG-0001X6-0N; Thu, 05 Nov 2026 01:38:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473490.1681186; Thu, 05 Nov 2026 01:38:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmRF-0001VU-Lb; Thu, 05 Nov 2026 01:38:49 +0000
Received: by outflank-mailman (input) for mailman id 1473490;
 Thu, 05 Nov 2026 01:38:47 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmRD-0001JK-Bt
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:38:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmRC-00CQpG-Oh
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:38:46 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd76-bab6-0a2a0a5309dd-0a2a4508a366-48
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:38:46 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebde24-f659-0a2a45080019-94a39217eeaa-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:38:46 +0100
Received: from pps.filterd (m0384718.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mkls966588
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:38:44 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com
 (mail-centralusazon11010058.outbound.protection.outlook.com [52.101.61.58])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4hrc5ghvrv-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:38:44 +0000 (GMT)
Received: from CH0PR13CA0039.namprd13.prod.outlook.com (2603:10b6:610:b2::14)
 by FT1PR16MB412983.namprd16.prod.outlook.com (2603:10b6:170:35::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:38:41 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::3e) by CH0PR13CA0039.outlook.office365.com
 (2603:10b6:610:b2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4 via Frontend Transport; Thu, 5
 Nov 2026 01:38:41 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:38:41 +0000
Received: from pps.filterd (m0373460.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50no3F1488046
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:38:40 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hp232wj2b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:38:40 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id OmR3xqupP9qreOmR4xpvkl; Thu, 05 Nov 2026 01:38:39 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=IFm
	siu+h+ub8blEeRWfanAwLjZ8dBPkcuMyJSicCH0c=; b=lhk1JeOjZoaVEraPrt5
	lq0RpWxf6FeGb8TowBNyaq+VpdTEelZxA9+44Q0ugVucG3owbyBSLl9b+t9WZ7/G
	vwRqlhXVlKdrOPRXNBaXOA8wkmnXgC0qmVb2FY0Eiivqcf6ddGCuNcraWohykSjs
	RF84h/uIFxyoBN+CXtXsBNTklb/zxLdPasf4O3mMB+Acp1Xzo3DQZYMdM1ODJaUe
	amrIidseH3sLzDCaCQAXUBzBV8EGqPiNhj8SVsT4hJUqBuU44aRDtfBSuKy99HfF
	D1gmtWOklEgWihQzHboxJ2C00FsbMtY4UTIRrfMPekMVQsf+S075fAXUCZ+Q9sKr
	3SQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w5yQiGKsSpGN/YvMX8kqFgmw+a6g0XGbcNGmgGZyM+evLB5LtM/u3HwmIDBz5yNUtKz5Q4IGnLrEqBjfttvr1MGUHZeovogsIh0vJ82f9IlqL4cGEDlgR1AgI6Xew4/EJmn/jQf7QW5BZd4btJxkB4JWjNp5+tiZ907R6FvobBwl0IY+KLi1J2AOwiXMMZNdFtF5WLgM78ihtRFzoOY1jf7EVnuYeH93vMlodfgiUdrmoO8MBb9XDRkqqsmhdHWMchaEEfuq8imkTmphjb592/5mesHSkEs13yZjGf0GR6c6oe+sVBdRJw0DA4vkApCuGUOQIVCMtXfjE2tD5qM/sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFmsiu+h+ub8blEeRWfanAwLjZ8dBPkcuMyJSicCH0c=;
 b=ggO8sUHmgf9y1wRmHIanblfTeA3FdF0RmJ4t2FomSPGAiEGt1igQYGyZrEvMitV1GRE3irHzLZ0dNGI8NznRi+wYDtsHLMS+ZYfdeVO2BSU0JuaS1ePcxJ25u/HWs6xNlAYixn2UbjMp2X2cpsLZlubJ+L1T6X80+8neaydjq6CNxXF0P4s3oFCEJZlDbfxo+KuJDh5fOSCccjg98mZmkXSt2lYuXWHo26qWlX5IsYQCD1YzU26CcDKPLKAQMn4juAiyjdB/qN8O0iFlWUx0CKJsAwoG8r3l3SImXVsTUvbV3AVXpz/taQElcPWODqkcpjkggkPCgdBqPxj1Gogy/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IFmsiu+h+ub8blEeRWfanAwLjZ8dBPkcuMyJSicCH0c=;
 b=Jt+hDo+b0UM6ZnJZmsvjl8DfP10Bb/UWlm4+ltnxiIkavTxbWj0MStUmeXmdInO5aTWhAZA1rIOnz5C6HFOsUaOzmclD+1xdtW4FFUs8QXS/IK4vvg5IAyHcRLO6iR/H1KpwcyCBVmlLd8majO49HkPXLoua+RqwWMtD2M9ID+E=
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
	ppserprodsaar; bh=IFmsiu+h+ub8blEeRWfanAwLjZ8dBPkcuMyJSicCH0c=; b=
	A8NEEfbDS31mWlPRaNtWVDIYAETZ7NTqVKHYFjOoNh7AuXZ0QlKXTe94wHzSSOAs
	5VMh6jD9GHeBFkc1w7JXRBA1y52Xp8sMB9RoqZbtXP0KKsZ5yPK9kuUof3JzKKf5
	FY836mT2MXpgvrOcoun16uLRSZowhSvm+7UsG54agMriD9ljGIoW4+554fDTxfCv
	mSYg+E3fsAXnjJs/uA667bitnT2mIQgwCQdyzoRm1yrs4YbuUGOFBvEr6G6v6k0E
	JMzSoO9MVgX1GLjGl3Pj6dQBKc5ChZMky8srI2Jn0tUl0YRBf/h9Mm2Uf//nj1z8
	zf0MZulcIcy74/gI8tC/YA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=IFmsiu+
	h+ub8blEeRWfanAwLjZ8dBPkcuMyJSicCH0c=; b=eOb7drPAMapeN4u+BkpeW3P
	6oit4+P6+4Eevz+WoV2thRxNeZaYCIaAAkFyCN+oDA8h1TyEblcOTRcRYmLpkHLB
	kluOKbAmwYDvZUrlvdvvbZqsBMgPMMNaFM+byUwMTyzuoG/wyqqrOdQFjaDa4D9c
	AStma2kq+XA7PMjcSK1WZqxx26PmxxZHlQm9ucr+KeKB1NlE8rs1SEkgfINJUdH+
	J1Tyfm+k+TK4LfkN4ZkC9a4pBJuzAxnVmtA6D0HsX4nEFF6MNYh1JpMHcA98o/3u
	v4HZ0khGLwhR1/F/nzjNlpEzO623UaTTTsjdVljWmd9S/Sl5+HwbYwkxVCxg0eg=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmR3xqupP9qreOmR4xpvkl
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [XTF PATCH v1 06/15] common: add missing evtchn hypercalls
Date: Wed,  4 Nov 2026 17:38:08 -0800
Message-ID: <20261105013817.719823-7-dmukhin@ford.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050006
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|FT1PR16MB412983:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 60a1f426-f9fd-47f4-031d-08df3add85d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|11063799006|56012099006|261009223027099003|261021121427099003|261102123227099003|261026140227099003|261022105027099003|261028144727099003|261026121527099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	2ex8wKIF1PNG9SgiHhfmJJJxYmDPJ5FX3H1LxXuNI9A+mGgmeDo8uY7BS+HE+lLf2XPclbndSAnOyyPbm5vWZeWG6VB6hSElVbOZAyT8CNyEeNrnIiJ2VAldzDDN1Hf4YLOYOIqjvYNJU79xkhmZy31o3gx8kI9NdQrFzonbAD+lcW1eejtEq2nT/UuRPwD57TJZylKTbj+pwjrrKGzKqRpu4NnLFMJOqhCtjGsLZ7kgtsxJewRsLrYTU2aSBRiyL5AoeaNEiXuvDNv2KcXItQiBiIEEAbmC3IDeovesQERpjbHJ//1TiyyBLLOcLV/ElFAXvbcOLs+C4smWdl67m3touh1nZ4QgomT5KTGrj0yy9OXJEes1bCz7Wu0B0Y3cnT/K+4Ei/wVPsCfVCMPtf1yMt0USJOgjTmh7PPgZh5UFjTDFCLvwHTEvN/NDHeqQ8XTgjnDapAdkHeU3ycJ7oaBip+/8BsVF91k1ekhqJDC8F5OW1dlo9OKUpH5BTASL7MUSQxZ5p6WE6eWosjBuL+u0BZajZjP8keJ/JwMzvU6zUOjidxHXMXDYS8JdwW/gHEh+bf6fGmhs5bUofFtCnLAf79wWgBbuhCQwsQifdLsgij5XnYvNXUDW7EVjQB6VWVluXsBsyWKPzSQucbqhp3Mr4kMIIevu55L+LnumWyRMhx3vAF6bAX6kDUiGZreu1Ey4xwCDmRTBd8bvlmLSMA==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261102123227099003)(261026140227099003)(261022105027099003)(261028144727099003)(261026121527099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9LEqpzk4tGEM1MRNb+5KlGK2YLsVSzNRs+PToV277+PZVKUTjeQGFKqb32FSgUz30JVqoFUy8QzS2L0GkbR1z2N7HZmVjYezdcmv5jpvn/eVexli+b2dtUiNkAXJFw1dWO/pUaaYwveL7DHDf8njpwbMTTnVlXiRRq/n8F/p/wz1b2YcMkocr5TcaHLnOTa3z2zKU7mzy9ITEe9JWdrbuYsRK5LJvAzvzUQeIajTsOQQnU/uR9RpKHFbohEegdAqWD46KSDKImO1PoHpS6Dw1EsqVsKVeWalIJy9WT5+Tr7bGYkAJ8buQwH/5n91jO/JGeYooJWzisyWt/eu6vV5bJ4LQdzjT9tXLUWbZOuwS9ScNAhOLB23iuTbI0cRDePEk4DuWw+e0LBoPUNuSoolTFlitLruRIwdHwTukUCOwCbrH2BJqiEygV0vyIvIEh6T
X-Exchange-RoutingPolicyChecked:
	Sx3Ld0RwGp5j9P738p/suyk/h8oV482NvtJWPeFQYXeFA5s8eJQCfDGdyJ97aVlVdtk0WLXGumuQwyk561nAYTTWzuW6BLLtPnsTlD0EPJhbUK7aAKHP+910eknl4mtLwog1PtVxyhJC98WGo/RTVcMGCj/ah0u2fcTCoVDaqOY+t04TnBOpZ2GVyhGgUZJpY3UDSbTdAczxMIGUvAodFJky7s/ednAXg+GcgKtGrhYgl1VwS+aP8FDtgqR5Zj5dMq4CunxoMPSdFuapkI5o1sgDl7cPhZzz4i7m/laVtfw2wTsuITxiybuDDJx5BGhZ0QZW/ApM/SedHzuhMpsAZA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	N8KnThcq28KAyxWrojyubnEtNjExw5hMnjPtUuzzCrh4zwtHBRhxSQXP3OlKs+bif4e6sC8G3S9LlQIBIvUlemLLuPYnzt7gxry90aE3MrXzdLufiNTvWSqMV2ctm1+Mxd2OSSVDd47rDkGlmAWBuB13Cook1TVLUPhD52ZI/HvFFhjB2t5zy433Or5VdMviDQT7SwObD6zgOwgsH66ZewlBgnaeKespzZ9CD7SeSfexa9NR5M7IqTI7rAza3elUR0KxO41ERYHa1WlPrT2KjjUgl7GQUxKp+/4al0AVLJ5ufKSizjEawtxba4ebSngRH6cuId/IZWx+/7mIlN2MxzN1OaDJW/BZLJG8SkuXe94ZXFIhBZsOe1wQqGROBCycejgSaqZmJS5GGm3+csOV61vfLt1nJSdGlyiZuoGTtu/Gd0LATvVxDtsq+Tk6V4+APu1xNoU1Ui08lSm74NG8quIMawS+pJwYKs2RkSKPmAa0WqoCj234StqmYRvDYl0hptXYjRdqQJzDH/QTwxuK2EfYaim2fwvAfAlaVAHdV2PtjTE3Qj1qMqgrAYcYgw5UukB/OtYUyViTMov0n3cRexcTNY7jV9redZ4NFTtzAiSVFneWR9iqFhFlu4gDxY/3fTTJrVbJtB4oFpslIpMbzw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:38:41.4693
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60a1f426-f9fd-47f4-031d-08df3add85d0
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FT1PR16MB412983
X-Authority-Analysis: v=2.4 cv=JawpPkKV c=1 sm=1 tr=0 ts=6aebde24 cx=c_pps
 a=2PUY6gUHBEqav+0eoazkAw==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=ARvDHhclS48edyKYUbLB:22 a=cbNQJ9GKAAAA:8
 a=e17CkGIfPB0j-OmyU8UA:9 a=G69WFyCBNqGPyalROSdv:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX93UChqCGE11G
 FgRESNHAmLk9rJf6nCpmzEVLERfFX8dRiiaguDXaJmoY1sUN+/r70Y98Gu5esavRoM8NAAzj4Z4
 lqQgPyiA92+HvQJM+dTMwjlw2tzGKlb88dB0cX60X13ryxh3FG68ekX0Fsb8kHys6JBO8ZJr9zb
 n0yrtmB5ljWqN4KD0AO31HpxG/jHdyiDAIIDeD1IommWACBtbWkVb4ewzBMXXYpRiRoJvsrEPvu
 V3sJX2o0pJ1QD1vfSwssNm3BN/prLs9Uh7Kl8tXmpeRv5didQFKbuy8l5TRDspQ/qQKFq4GKvpa
 VyNE42Ut5hQhkjMGZXzl2W+uismJ+1oAbhVcoDVST5crbA+/cfCKh6BYUDCknw/2XnLRWVKlwKh
 pF1tvOH8aQIKn48wBWxyy0/hywuxVkUqg/37S7evN4IueGnVypVqWzbGoBfy1cdIlbECWCkHkfD
 G56TQVfKfhg4xrNBrbw==
X-Proofpoint-ORIG-GUID: l2-mazBy0BDwqoqfcJ-eU_9GBNSFUSaq
X-Proofpoint-GUID: l2-mazBy0BDwqoqfcJ-eU_9GBNSFUSaq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX5AUpqIgEIdEq
 vrGWx+vMyx7ovDM0fx0uEEbAqW59czCo6enXJADL5xsNXcZjHThvxBhMc3OeXem0Yc5AoMTyuEm
 Bv42422LMl5DwLlQ00v7+38H+kjNyjPV9FnqTyS8jZueWEI30RTu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050006
X-purgate-ID: tlsNG-c1860d/1793842726-D497287B-525C4ACD/0/0
X-purgate-type: clean
X-purgate-size: 3258
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
 include/xen/event_channel.h | 13 +++++++++++++
 include/xen/hvm/hvm_op.h    | 17 +++++++++++++++++
 include/xtf/hypercall.h     | 25 +++++++++++++++++++++++++
 3 files changed, 55 insertions(+)

diff --git a/include/xen/event_channel.h b/include/xen/event_channel.h
index 2068cc09eeba..734889356252 100644
--- a/include/xen/event_channel.h
+++ b/include/xen/event_channel.h
@@ -7,6 +7,8 @@
 #define EVTCHNOP_send             4
 #define EVTCHNOP_status           5
 #define EVTCHNOP_alloc_unbound    6
+#define EVTCHNOP_bind_ipi         7
+#define EVTCHNOP_unmask           9
 #define EVTCHNOP_init_control    11
 #define EVTCHNOP_expand_array    12
 
@@ -46,6 +48,17 @@ struct evtchn_alloc_unbound {
     evtchn_port_t port;
 };
 
+struct evtchn_bind_ipi {
+    uint32_t vcpu;
+    /* OUT parameters. */
+    evtchn_port_t port;
+};
+
+struct evtchn_unmask {
+    /* IN parameters. */
+    evtchn_port_t port;
+};
+
 struct evtchn_init_control {
     /* IN parameters. */
     uint64_t control_gfn;
diff --git a/include/xen/hvm/hvm_op.h b/include/xen/hvm/hvm_op.h
index 8c240d8d90b9..2b1866c7494c 100644
--- a/include/xen/hvm/hvm_op.h
+++ b/include/xen/hvm/hvm_op.h
@@ -15,6 +15,23 @@ struct xen_hvm_param {
 };
 typedef struct xen_hvm_param xen_hvm_param_t;
 
+#if defined(__i386__) || defined(__x86_64__)
+
+/*
+ * HVMOP_set_evtchn_upcall_vector: Set a <vector> that should be used for event
+ *                                 channel upcalls on the specified <vcpu>. If set,
+ *                                 this vector will be used in preference to the
+ *                                 domain global callback via (see
+ *                                 HVM_PARAM_CALLBACK_IRQ).
+ */
+#define HVMOP_set_evtchn_upcall_vector 23
+struct xen_hvm_evtchn_upcall_vector {
+    uint32_t vcpu;
+    uint8_t vector;
+};
+
+#endif /* defined(__i386__) || defined(__x86_64__) */
+
 #endif /* XEN_PUBLIC_HVM_HVM_OP_H */
 
 /*
diff --git a/include/xtf/hypercall.h b/include/xtf/hypercall.h
index 68b3da111d85..9d6d901d1668 100644
--- a/include/xtf/hypercall.h
+++ b/include/xtf/hypercall.h
@@ -241,6 +241,31 @@ static inline int hypercall_evtchn_alloc_unbound(struct evtchn_alloc_unbound *ub
     return hypercall_event_channel_op(EVTCHNOP_alloc_unbound, ub);
 }
 
+static inline int hypercall_evtchn_bind_ipi(struct evtchn_bind_ipi *bind)
+{
+    return hypercall_event_channel_op(EVTCHNOP_bind_ipi, bind);
+}
+
+static inline int hypercall_evtchn_unmask(evtchn_port_t port)
+{
+    struct evtchn_unmask unmask = {
+        .port = port,
+    };
+
+    return hypercall_event_channel_op(EVTCHNOP_unmask, &unmask);
+}
+
+static inline long hypercall_set_evtchn_upcall_vector(
+    unsigned int cpu, unsigned int vector)
+{
+    struct xen_hvm_evtchn_upcall_vector p = {
+        .vcpu = cpu,
+        .vector = vector,
+    };
+
+    return hypercall_hvm_op(HVMOP_set_evtchn_upcall_vector, &p);
+}
+
 static inline int hvm_set_param(unsigned int idx, uint64_t value)
 {
     xen_hvm_param_t p = { .domid = DOMID_SELF, .index = idx, .value = value };
-- 
2.55.0


