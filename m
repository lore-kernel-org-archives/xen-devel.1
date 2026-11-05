Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2A6606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=ab8AQWbn;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=HFs0oVtg;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=VIDRXYtk;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=D+VOEP1M
Received: from list by lists.xenproject.org with outflank-mailman.1473166.1680775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmMz-0003sh-Fs; Thu, 05 Nov 2026 01:34:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473166.1680775; Thu, 05 Nov 2026 01:34:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmMz-0003sZ-CX; Thu, 05 Nov 2026 01:34:25 +0000
Received: by outflank-mailman (input) for mailman id 1473166;
 Thu, 05 Nov 2026 01:34:23 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmMx-0003fR-6a
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:34:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmMw-001wz8-Jp
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:34:22 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd16-2eae-0a2a0a5409dd-0a2a450285f6-10
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:34:22 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd1d-6ca4-0a2a45020019-94a38ff15b26-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:34:22 +0100
Received: from pps.filterd (m0367129.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50n3kN891327
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:34:21 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com
 (mail-eastusazon11011000.outbound.protection.outlook.com [52.101.52.0])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hr99fkwvu-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:34:20 +0000 (GMT)
Received: from BL1PR13CA0369.namprd13.prod.outlook.com (2603:10b6:208:2c0::14)
 by SA1PR16MB4801.namprd16.prod.outlook.com (2603:10b6:806:23a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:34:13 +0000
Received: from MN7PEPF00000150.namprd04.prod.outlook.com
 (2603:10b6:208:2c0:cafe::91) by BL1PR13CA0369.outlook.office365.com
 (2603:10b6:208:2c0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15 via Frontend Transport; Thu, 5
 Nov 2026 01:34:13 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 MN7PEPF00000150.mail.protection.outlook.com (10.167.254.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:34:10 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50nD1d2970229
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:34:10 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hnxs4nrj8-11
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:34:09 -0500 (EST)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id OmMhxcJp0uKemOmMixhJOl; Thu, 05 Nov 2026 01:34:09 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:Message-ID:MIME-Version:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=ppford; bh=y/S2S9e+0ZwFb7lcmG+OgUsZq
	q/XCtOAyVvhCKcp33I=; b=ab8AQWbnSibShqHyObLi491uM/N6SQ5ZrxFuhTV64
	yKj9kAaGFuvyv5pvCfXv+OheMABZEqqpYeMqOOSHCL9ntICqmlAfmmJG5qfEaQ2b
	u+InFva8ocxZ9sngFu0RiWUtARCjqtoUyPohx1EuOBce/UdGcpFeYZ7MlNhqGHv8
	8+PfmEIBQLeZPY1/RYWU92NLpDPMWmVasTvX8brAhry4b/vH+/5Z6pF07nixiupe
	1Uaeafgzc49n6Rwd/RqRUb8DqQuV4qYaj/t1RNPm9hBI+elnCRi/ErvIx+vYYA28
	Ik7t7l/Eu64pVX2CuMs1BvLs0P7i5h0KF1w2bSa31sBeg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uL8L57NIO4BOWVCNhhX2DK4nZJoq9IeSghRlnN25cXRwHAoSZqrj1pHoh+U7CZWBMbNsHsieyx9tf9tpLgpMBZhpjCm+cK9/CzDBeZtUbQsSbqnq9GMRduNv0J4uEIN+8mSTabdB0489duxahvtqqu+FPQCQA8vjXFfj8AkiMHmYF/PKl7zi8O7/x1POchCLnYQ+8uwIGH9W9OgXe9vPtaNxt2EDRgZVKQ2JAEW03DtCkC/kppfL4TfurfL/Gc6sarDCt6jTHjhY1eKuvhfSGzDtUgd+4a8fsLaIiiIA5MAoRbTKUU/ZM91yS2FEHYU3hDzpsYP9eygR/jXSMZx3ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/S2S9e+0ZwFb7lcmG+OgUsZqq/XCtOAyVvhCKcp33I=;
 b=InxK4TV6R+WmPQfbjxYRFoFeJbxG+hF5e2N2yzxiApu2x0KFcC4yOwxUYu+/fwPNJq6L6aQPOlEUFG875lPiJZGwmjjV5zAuKc/+4l23dKqPLxvKjCI2dloctRwmnbvGv9bzH8Jg0dQQ0WUsQTrhjE+jyhxt1NX1BZoSCnJao7y0Dtm2GNxvTjW7Erg30w9FMOLbuH8OrgEwfgDQVnVSSO+S472zU7vTIyJQPcCPTL2XHz6n2TVNzZUEFtsccOhY4MgQ1LLFRUtxgH0C3KfABktm06DrtoKxldQ7KSMC36Qnc7y81cwGCywjMrhpK4+AO7ozHPnjagJXJqZobSe35A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/S2S9e+0ZwFb7lcmG+OgUsZqq/XCtOAyVvhCKcp33I=;
 b=HFs0oVtgAD+NOHxVOByI1s9U1rF9CultM3vpORVDn6ophW5Pho+rTRMNcKw+xV63KSV9V1ZzgSGtVdRZ/yVPbvf0u4XDJdD8ziq8VyjGWZvpoZieqwYISIlkX0sHTefCJ4n0yJWCjQ1RjSnMY8njVXAbu8SInd50MBy1p/qXvsQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to; s=ppserprodsaar; bh=y/S2S9e
	+0ZwFb7lcmG+OgUsZqq/XCtOAyVvhCKcp33I=; b=VIDRXYtkO3s5Yp49eV0YZQA
	Dichd8uwLyRrm9COwviiE5VozhVFilwdhbgIO/m3uXsUQFJTGYru0JcsuyVYmmUV
	3iIlQPOiWrwB7kcxTif5ClHyVVFxTgwEepBCrGCzT2hkjntR/r6aN04Gs7tOb9H5
	aX1snbrm9xvglDPPXfElquB/P6e6R2kDRDviZJaJier3r67+SL1pHJl9IoyPSMk+
	lIQge1k90ZJFNS4LXoca35iqB8KJADtOoXIP1+rQ25gL12h2eeLNg2RX3hpuMbBF
	lUMSIkpzXjOYCUyopAL6rC7rsNJEPsCKEZZf+FYOc3vYTJnX8R3hqccDkLKsGmg=
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=ppfserpocford; bh=y/S2S9e+0ZwFb7lcmG+OgUsZqq/XCtO
	AyVvhCKcp33I=; b=D+VOEP1MzZwoxKnwG0YCkR10/MYjrYo6vQFEtVy0UAnibyW
	P4Kaw9UWx4ksw6Ecc3QNlfnCG6GDmrTF5lPMu+prJTiV49/s1mZuMhrzyXdyktgG
	F0CBhAe/9iBR8DYTvYuG7jLj7THxgDmq8mGO62CeD2so3TF2knc951szH4Tap2o+
	edNJ/pSz+VrF9mkOWKNqOMwiehiyhPRub3sOfju5KK8dGu7TDBTO6O9kSKx6ev0F
	Vh6U3Nr8fYFZq/ODJ2LvdsVVETU5vP2MgwhE/nWtzjsO2AH2yDYcQSgO+UJNXA+t
	MwLpe4sN89eS6221Ylco7WlqU0IN75pAeow3pIQ==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmMhxcJp0uKemOmMixhJOl
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
        roger@xenproject.org, teddy.astie@vates.tech, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 00/28] x86: initial SVM AVIC support
Date: Wed,  4 Nov 2026 17:33:17 -0800
Message-ID: <20261105013347.719392-1-dmukhin@ford.com>
X-Mailer: git-send-email 2.55.0
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
X-MS-TrafficTypeDiagnostic: MN7PEPF00000150:EE_|SA1PR16MB4801:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0b6ba5de-c877-4edd-4c65-08df3adce481
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|6133799003|10067099003|18002099003|4133799003|13003099007|11063799006|261021123027099003|261026140227099003|261028144727099003|261026121527099003|261022075727099003|261102123227099003|261009221227099003|261009221727099003|56012099006|261021121427099003|261009223327099003|261009220027099003|261009223027099003|261022105027099003|260925021311599003|260925021911599003|260925022911599003;
X-Microsoft-Antispam-Message-Info:
	UxaikQAUcf6p5ZG+KUoeNmJJkAfBsroZKP6TWhVDA0M+edYSQ+3gnbPbJk+8eTClGWqrjTwO5KysfLidaT0Tl+sUzzTrP8yESuo2dyvrA+BNEN0/JmWmxhqkToEcdKEtBxKzU1ZpWyqr1BMx9aAwsk7stPnNia9nMe6Se3DUEUPdzy1bJ9E1qeSnWjNlajc+8lzTNcOZ045FQF1DN7KPqj0SZauBrSo/IxTZJB4T1sV5PVjFPesHHmDzUohPhV2VZqFtfaUWBKXM98DQiDX7SyasK0fI5wADnBf592Q57m54In0kh1K8XNeI5MTSDEUhV/vdK9zqD6lZEzICscQlR2Tr9ksCIk8rqXnDHvtmfOvGmk+n3QFNPiKbK871Ofd5w9eUcE2trL4bD0kbevsD6x+F4kGcp90/88IUBeXJOPHisxP3T5k35jywgI5xZKCe7i2a1U8XKsujnuBglMn3ihAX39Q2/5MR8Ew3/LKfds11cxR8h9Dp0naaeW5Aqk60JpJ0CCu5iuq/wLoyUawScsfQc1Iek1TGYSoxB+h35T35zEJ7dZJzLsYRWrdRKwc9e3EPIB6TEufPVc3NYyu2uohMJ9knQKcj1vobzQ0hybmni9Mmuk3lelUJ7kYu0f8ltGQqjuVuKLOa046isWXQn/4by+CCXrEPHgFPOWEt688=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(6133799003)(10067099003)(18002099003)(4133799003)(13003099007)(11063799006)(261021123027099003)(261026140227099003)(261028144727099003)(261026121527099003)(261022075727099003)(261102123227099003)(261009221227099003)(261009221727099003)(56012099006)(261021121427099003)(261009223327099003)(261009220027099003)(261009223027099003)(261022105027099003)(260925021311599003)(260925021911599003)(260925022911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pHk6xrHyndVUNrHGODfD6wxwrkxxMR/pS1V8BKmu/vI7zovOjtzlvDAvrCGmDfrK0bmNZhsqXxXq6RVwk21JOrFhiikis9gd3Ytb2QxUgMVfz9UQQWqSiDtoeLZvD8biHw1sbZHLBSUB3jCn9qbXSih2asodlkntz+O/hT9UMVLthb8Fa+zKIl1z//aXdB7GsQdKxaGWv09nZIiLmUc0CI8aAYCzqbJ1E+eH2uneZ7aPw3Fz8rfQPTjDsp8UOFyLeE3ZxAxfTcmkqaLaaIonyofmyakmXFxiMaEEt+24WXHVJlPaImWuA8nbv0qie+39tWLxlnNcrVw+CTYXglt01Fy1vo4T+55PX/cz1vw/+1YwR5i+xH22hoyOnXDF81wCRHjZEVx1LQsOqaIz5t5NOoSSSTOlgCGJa8BlmAGD8BO2x+MHsShg0xWvuiBJ1Nw6
X-Exchange-RoutingPolicyChecked:
	Xh+uGNwMj8d7hQ//gQTuyU+E2HY/ie9k0Vpxy0mAwNHHQxotyFNtKCgvmzarWJaMcTvSQlHOBvR4Kgb8MK7QS78w/gqDMcUcGqU28Zj9K0z+V1nZeMoWXJuNfoq3ErwUn/JYN7IFIJMYO2ruXd9eH0GL+fzwkN6PNd8T4EYZnWYXnyq1kGReRUG73xVk5QYQgjGcpV5mgIyxdxMHD0u1uhTfNXvpraEPcXpbS1QV9buaKr4iLMLK8nFhYnf+wHYFGXeRrB6jWzbXfmJI+rQH1C2viK4A5/QpeQekZQ9dTu1FEgFFCY8fihdMCTkNxIDGjEQ5G2yP0xPoBhDtOpFfsg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YVRtyCFzudhOPieUIBOoVa62uNuej07bA7gB70Hg4xcMWgnTovcr7JsXWR3PpDYa2gh8LoyQ7KojMAUCqaAxtI2DcD3BNuI+sk0jnpqT/rM3J+Biic+rlUC/ZLL26sv1FnCzk+RqnMe3jafabUYhqOG/zSv7mMQZ6TkSlsBPQfVtd3X6c4RXmRJaIx9nsHtOfRZn5i3dQ820hcCG+29TsGS5/3YKYZvsuCwAJJ/waNbMwDaVLYp5PhrRg0omk9TILdqN5wP70dVHd6zMPuzB+qVCQL4hQy6PMZqsqnXyC0vVOun6SclAzAvVGhcVvsEzKJaZjuUm72qbs6/brT+s5BYbZcPvvDL8tcI2MRo9ryikG9Q9S76BS/36mE4KJ7qfGvjCa6FrADE7LoqYBMKn+06prsPpzV9MAFliWsI0GQt4weAA1hH3syQpHUMm7jH5qHIX8FO84DAIkybukB7Frt5if+9kispuKwlRa/pdiZ35zed6HTCqBDR8fWZmcICp7XW1+QF0QeNdkPMwnNQrC+SMVa+P3yqZ8YpntaijyCpMMtS+PXfPCxL/nYzDlvYHzhbIKAO8gVUUcTsiSZfIsvwctYrmbXzyU/lWcNqh6TUcZhQr/w2RuSenNZgtON3bAlF1Tg8tejB4Furhu5k5fw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:34:10.7878
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6ba5de-c877-4edd-4c65-08df3adce481
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN7PEPF00000150.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR16MB4801
X-Proofpoint-GUID: 12UWCpLRJ4W7k9m9r9c4GpdL-0dweeCz
X-Proofpoint-ORIG-GUID: 12UWCpLRJ4W7k9m9r9c4GpdL-0dweeCz
X-Authority-Analysis: v=2.4 cv=LcKpeTfi c=1 sm=1 tr=0 ts=6aebdd1c cx=c_pps
 a=CTIJcRslT32CQvadRVAfuw==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=X3KReqg2EL6A36SYCKpz:22 a=zd2uoN0lAAAA:8
 a=vnREMb7VAAAA:8 a=4oupQTzvAAAA:8 a=VwQbUJbxAAAA:8 a=p0WdMEafAAAA:8
 a=NEAV23lmAAAA:8 a=Ko6J3DuGGfzDdmGFQ4cA:9 a=3whSkbs7g9Me0DR5EJEX:22
 a=WmVTiCyuxqgg3mnwYu6p:22 a=F_R_EHrqUKoJocvyGl7m:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfXwk3HWv1+cNpW
 XErTLpbz7MH4VD2v4EfcWsXNLPnYl9mbmawHKB5nZS3Tm7o3CXlBXVJ4tZP5aH1KXIGSaUo028c
 k3rQmnjXAhMI6RbP05MSsagFTHcQVHhwqUdqbxhVDv+I6nJj3nzpXZEcxDI7wuMrl1HqxNp7MkZ
 sVwM0+kQPmnFeLnZ/+AMqySdr69WJb1yfAfa8/q49j3Hoq0jKX9j6tFxTUO0ZgJsFpqUsZBTH/Y
 1QJeSdzfNr3v358bxcw7gMlVztTGgZG5xbWhwcBXYDqk1ZH2GgoVrc92rYnqz5TrT0exCyufkR7
 JW0StFiVH1X4S3O2S3TelG4NV+OqVco3BS1HxuSIg+No3OvsSamMXnsPyXN+/HZQ9fOluZNtUCs
 KX0H8dSFXLO5mnwfW+zYHWJikPXRRfTvlKhRLuB3FwRJOl7eWGl0NkYzjSzv5m/xZGmxC9ZQh3f
 npDp/tjpWUx1eHx0/Xw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfX/5t4tNqmzZ8v
 sOwxx935Qd9JF1E7etbqTGeAc8gyVSNaALnPYt9EkQr7B8ESdKb7uDHXdxX27biiV/UfKvwwyBW
 FoSnf+37Dx8ytt52KVVNFM+36K+rWFLdTtlyLV6g3C7wbAgU5R6c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050005
X-purgate-ID: tlsNG-720697/1793842462-F0AA52AC-D113FA2D/0/0
X-purgate-type: clean
X-purgate-size: 15234
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Overview
========

Modern AMD processors provide hardware-assisted LAPIC virtualization
support known as AVIC (Advanced Virtual Interrupt Controller). See
"15.29 Advanced Virtual Interrupt Controller" in [1].

The main objective is to improve interrupt delivery for a given VM
by avoiding expensive LAPIC emulation in hypervisor.

At a high-level, there are several types of interrupts needed to be
managed for a Xen domain:
  (a) IPIs
  (b) Posted interrupts (Xen-to-domain, such as event channels)
  (c) External devices (MSI, needs coordination with IOMMU)

This initial implementation addresses (a) and (b).

Current limitations:
- Only vLAPIC in xAPIC mode with AVIC enabled
- No GALog support

Please see [2] for more details on the scope.

This work is loosely based on previously submitted work [3] and [4],
including AVIC support in Linux KVM.

The feature is experimental and disabled in the default configuration.

Patch Series
============

Basically the entire work is divided into three big series:
 (A) Current series: initial SVM AVIC [5]
 (B) XTF interrupt latency test [6]
 (C) XTF infra in public CI [5]

For this AVIC series:

 Patches 1, 5, 6, 9, 11-16 introduce various cleanups and fixups.

 Patch 20 changes XEN_DOMCTL_debug_op implementation to allow
 more debug operations added (like enabling/disabling AVIC at
 run-time - used by the XTF test).

 Patches 2, 3, 4, 7, 8, 10, 17, 18-25 represent AVIC implementation
 including performance counters and run-time controls via debug
 hypercall.

 Patches 26-28 cover various documentation updates.

Testing
=======

Mainly, the patch series has been tested through public hardware runners.
Full CI run (including manually scheduled jobs) is available at [10].

Approach: I decided to write my own synthetic XTF [6] which runs as dom0
on a hardware target to capture some fine-grained metrics for IPIs and
posted interrupts (event channel).

System                                  | Test results
----------------------------------------+-------------
Zen2: Family 23 (0x17), Model 96 (0x60) | [7]
Zen3: Family 25 (0x19), Model 68 (0x44) | [8]
Zen5: Family 26 (0x1a), Model 36 (0x24) | [9]

Synthetic test:

    vCPU0                                     vCPU1
                                       executes some workload
 +-> t0
 |   |
 |   write ICR2 [*]
 r   write ICR
 e   |---------------- interrupt -----------> t0' = recv_tsc
 p   return from APIC emulation [*']          ISR
 e   |                                        t1' = handler_tsc
 a   t1
 t   |
 |   sync against ISR
 |   |
 +---+

First 1K samples is dropped, total number of samples is 20M.

IRQ delivery latency : t0' - t0
IRQ issue latency    : t1  - t0
IRQ handler latency  : t1' - t0'

[*]  For event channel that is EVTCHNOP_send hypercall.
[*'] For event channel that is return from the EVTCHNOP_send hypercall.

For all tested Zen2/Zen3/Zen5 targets there are overall improvements
w/ AVIC enabled: the test duration decreased, IPI delivery improved,
ISR latency improved.

Basically, AVIC optimizes long tails in the latency distribution leading
to more deterministic workload.

There's some peculiar behavior w.r.t. doorbell MSR which roughly takes 2us on
Zen5 - fallback to vcpu_kick() turned out to be faster. I added a run-time
configuration knob for a fallback, just in case.

There are also some outliers in the latency distributions which I haven't
ruled out yet: like look at max latency w/ and w/o AVIC in [7], [8], [9]: once
it a blue moon I've seen AVIC giving p99.999 values as a maximum (~15us vs
~45us for the entire 20M population).

Results for Zen5 target are more pronouced, so I am duplicating them below.

Zen5: Workload #1: IPI
----------------------

                    no AVIC                  |             AVIC
---------------------------------------------+------------------------------------
A: noaccel: IPI send latency (VCPU#0) (20000000 samples)
B: accel: IPI send latency (VCPU#0) (20000000 samples)
metric          cycles A              time A |        cycles B              time B
min                12240            6.131 us |             140               70 ns
avg                12955            6.489 us |             155               77 ns
p50       <        13000            6.512 us |  <          170               85 ns
p99       <        14000            7.013 us |  <          170               85 ns
p99.9     <        34000           17.031 us |  <          170               85 ns
p99.99    <        35000           17.532 us |  <          190               95 ns
p99.999   <        98000           49.092 us |  <        23000           11.521 us
max                99100           49.643 us |           86660           43.411 us
A: noaccel: IPI delivery latency (VCPU#0 -> VCPU#1) (20000000 samples)
B: accel: IPI delivery latency (VCPU#0 -> VCPU#1) (20000000 samples)
metric          cycles A              time A |        cycles B              time B
min                    0                0 ns |             620              310 ns
avg                 1402              702 ns |             626              313 ns
p50       <         1400              701 ns |  <          650              325 ns
p99       <         1500              751 ns |  <          700              350 ns
p99.9     <        20000           10.018 us |  <          700              350 ns
p99.99    <        20000           10.018 us |  <          700              350 ns
p99.999   <        71000           35.566 us |  <        23000           11.521 us
max                87740           43.952 us |           87000           43.581 us
A: noaccel: IPI handler latency (VCPU#1) (20000000 samples)
B: accel: IPI handler latency (VCPU#1) (20000000 samples)
metric          cycles A              time A |        cycles B              time B
min                15520            7.774 us |             160               80 ns
avg                16256            8.143 us |             174               87 ns
p50       <        17000            8.515 us |  <          190               95 ns
p99       <        17000            8.515 us |  <          190               95 ns
p99.9     <        17000            8.515 us |  <          190               95 ns
p99.99    <        17000            8.515 us |  <          190               95 ns
p99.999   <        23000           11.521 us |  <          190               95 ns
max                33880           16.971 us |             200              100 ns

Workload time                      182552 ms                               9919 ms
(20000000 samples)                                                    (~18x boost)

Zen5: Workload #2: evtchn
-------------------------

                    no AVIC                  |             AVIC
---------------------------------------------+------------------------------------
A: noaccel: evtchn send latency (VCPU#0) (20000000 samples)
B: accel: evtchn send latency (VCPU#0) (20000000 samples)
metric          cycles A              time A |        cycles B              time B
min                 5800            2.905 us |            6020            3.015 us
avg                 5988            2.999 us |            6204            3.107 us
p50       <         6000            3.005 us |  <         6200            3.105 us
p99       <         6100            3.055 us |  <         6200            3.105 us
p99.9     <        27000           13.525 us |  <        27000           13.525 us
p99.99    <        28000           14.026 us |  <        29000           14.527 us
p99.999   <        28000           14.026 us |  <        92000           46.086 us
max                92160           46.166 us |           92680           46.427 us
A: noaccel: evtchn delivery latency (VCPU#0 -> VCPU#1) (20000000 samples)
B: accel: evtchn delivery latency (VCPU#0 -> VCPU#1) (20000000 samples)
metric          cycles A              time A |        cycles B              time B
min                    0                0 ns |            5440            2.725 us
avg                 1412              707 ns |            5497            2.753 us
p50       <         1400              701 ns |  <         5600            2.805 us
p99       <         1500              751 ns |  <         5600            2.805 us
p99.9     <        19000            9.517 us |  <         6000            3.005 us
p99.99    <        19000            9.517 us |  <         6200            3.105 us
p99.999   <        71000           35.566 us |  <        28000           14.026 us
max                87600           43.882 us |           91760           45.966 us
A: noaccel: evtchn handler latency (VCPU#1) (20000000 samples)
B: accel: evtchn handler latency (VCPU#1) (20000000 samples)
metric          cycles A              time A |        cycles B              time B
min                15540            7.784 us |             180               90 ns
avg                15803            7.916 us |             184               92 ns
p50       <        16000            8.015 us |  <          190               95 ns
p99       <        16000            8.015 us |  <          210              105 ns
p99.9     <        16000            8.015 us |  <          210              105 ns
p99.99    <        16000            8.015 us |  <          210              105 ns
p99.999   <        24000           12.022 us |  <          210              105 ns
max                33120           16.591 us |             200              100 ns

metric          cycles A              time A |        cycles B              time B
min                    0                0 ns |            5400            2.705 us
avg                 1425              713 ns |            5467            2.738 us
p50       <         1500              751 ns |  <         5500            2.755 us
p99       <         1500              751 ns |  <         5600            2.805 us
p99.9     <        19000            9.517 us |  <         6000            3.005 us
p99.99    <        19000            9.517 us |  <         6200            3.105 us
p99.999   <        71000           35.566 us |  <        28000           14.026 us
max                87800           43.981 us |           91940           46.055 us

Workload time                      175951 ms                              62951 ms
(20000000 samples)                                                   (~2.5x boost)

Thanks a lot to Marek for hooking Zen5 runner to public CI.

Thanks a lot to Stefano and Andrew with advices and fixing the access to the
fleet of hardware runners.

References
==========

[1] AMD APM Volumes 1-5:
    https://docs.amd.com/v/u/en-US/40332_4.11_APM_Vol1-5
[2] Xen Summit 2026 SVM AVIC:
  - YouTube: https://www.youtube.com/watch?v=RhaJsOU_PIA&list=PLGe6RWOETgTQ
  - Slides: https://hosted-files.sched.co/xensummit2026/05/dmukhin_2026_x86_SVM_AVIC.pdf?_gl=1*158gk36*_gcl_au*MjU3OTQwMDQ2LjE3ODg0NzE3NDQ.*FPAU*MjU3OTQwMDQ2LjE3ODg0NzE3NDQ
[3] Archive v1:
    https://lore.kernel.org/xen-devel/1474264368-4104-1-git-send-email-suravee.suthikulpanit@amd.com/
[4] Archive v2:
    https://lore.kernel.org/xen-devel/20180507210753.2280-1-Janakarajan.Natarajan@amd.com/
[5] Current patch series:
    https://gitlab.com/xen-project/people/dmukhin/xen/-/commits/svm-avic-v3
[6] XTF interrupt latency test:
    https://gitlab.com/xen-project/people/dmukhin/xtf/-/tree/x86_64-ipi-latency?ref_type=heads
[7] Zen2: Family 23 (0x17), Model 96 (0x60): interrupt latency results:
    https://gist.github.com/dmkhn/289f1af656cce74c0fbc81642727a2a4
[8] Zen3: Family 25 (0x19), Model 68 (0x44): interrupt latency results:
    https://gist.github.com/dmkhn/9192105efc49cfedd15e2820b8ad23fd
[9] Zen5: Family 26 (0x1a), Model 36 (0x24): interrupt latency results:
    https://gist.github.com/dmkhn/e9f50b43cbc48b82175ec517d6cfe6f5
[10] CI:
    https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/3025987819

Denis Mukhin (28):
  x86/hvm: move SVM feature printout to a separate function
  x86/hvm: report SVM AVIC support
  x86/hvm: report SVM x2AVIC support
  x86/hvm: avic: add domain state initialization
  x86/hvm: cleanup svm_create_vmcb()
  x86/hvm: introduce vlapic_reg_read()
  x86/hvm: avic: add VMCB state initialization
  x86/hvm: avic: add AVIC_INCOMP_IPI VMEXIT handler
  x86/hvm: fix hvm_emulate_one_vm_event() definition
  x86/hvm: avic: add AVIC_NOACCEL VMEXIT handler
  x86/hvm: introduce vcpu_is_vlapic_tpr_emulated()
  x86: apic: use APIC_EIO_ACK instead of open-coded 0
  x86/time: fix typo s/interruopt/interrupt/
  x86/hvm: vlapic: update signatures of both vlapic_{clear,test}_*
  x86/hvm: vlapic: add checks before posted interrupt delivery
  x86/hvm: move VINTR disable to svm_clear_intr_window()
  x86/hvm: avic: route interrupt delivery to vCPU
  x86/hvm: add facility to print hardware-assisted vLAPIC info
  x86/hvm: avic: enable SVM AVIC statistics reporting
  x86/hvm: rework XEN_DOMCTL_debug_op
  x86/hvm: enable debug hypercall for posted interrupts
  x86/hvm: avic: ensure SVM AVIC supports xAPIC operation only
  x86/hvm: avic: enable vLAPIC mode switch hook
  x86/hvm: avic: ensure SVM AVIC is disabled with nested guest
  x86/hvm: avic: account for AMD erratum 1235
  docs: add coverage for svm_avic=
  CHANGELOG.md: add note on initial SVM AVIC support
  MAINTAINERS: add myself as SVM AVIC reviewer

 CHANGELOG.md                             |   3 +
 MAINTAINERS                              |  11 +
 docs/misc/xen-command-line.pandoc        |  23 +-
 xen/arch/x86/cpu-policy.c                |   3 +-
 xen/arch/x86/domctl.c                    |  24 +-
 xen/arch/x86/hvm/emulate.c               |   5 +
 xen/arch/x86/hvm/hvm.c                   |  74 +-
 xen/arch/x86/hvm/svm/Makefile            |   1 +
 xen/arch/x86/hvm/svm/avic.c              | 921 +++++++++++++++++++++++
 xen/arch/x86/hvm/svm/avic.h              |  41 +
 xen/arch/x86/hvm/svm/intr.c              |  22 +
 xen/arch/x86/hvm/svm/nestedsvm.c         |   9 +-
 xen/arch/x86/hvm/svm/svm.c               | 186 ++++-
 xen/arch/x86/hvm/svm/svm.h               |   2 +
 xen/arch/x86/hvm/svm/vmcb.c              |  29 +-
 xen/arch/x86/hvm/svm/vmcb.h              |  27 +-
 xen/arch/x86/hvm/vlapic.c                |  25 +-
 xen/arch/x86/hvm/vmx/vmx.c               |   4 +
 xen/arch/x86/include/asm/apic.h          |   3 +-
 xen/arch/x86/include/asm/apicdef.h       |   2 +-
 xen/arch/x86/include/asm/hvm/hvm.h       |  47 +-
 xen/arch/x86/include/asm/hvm/svm-types.h |  31 +
 xen/arch/x86/include/asm/hvm/svm.h       |   4 +
 xen/arch/x86/include/asm/hvm/vlapic.h    |   1 +
 xen/arch/x86/include/asm/msr-index.h     |   1 +
 xen/arch/x86/irq.c                       |  24 +
 xen/arch/x86/time.c                      |   2 +-
 xen/include/public/domctl.h              |   2 +
 28 files changed, 1411 insertions(+), 116 deletions(-)
 create mode 100644 xen/arch/x86/hvm/svm/avic.c
 create mode 100644 xen/arch/x86/hvm/svm/avic.h

-- 
2.55.0


