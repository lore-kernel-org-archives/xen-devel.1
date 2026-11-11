Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73A4606A32A
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 19:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=t727ZOW/;
	dkim=pass (1024-bit key) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=PZQEuGXW;
	dkim=pass (2048-bit key) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=Nyp+wNHV;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=aj+mxfCi
Received: from list by lists.xenproject.org with outflank-mailman.1484934.1688307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREM8-0004yh-De; Wed, 11 Nov 2026 19:51:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484934.1688307; Wed, 11 Nov 2026 19:51:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREM8-0004yX-89; Wed, 11 Nov 2026 19:51:40 +0000
Received: by outflank-mailman (input) for mailman id 1484934;
 Wed, 11 Nov 2026 19:51:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xREM6-0004gg-A0
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 19:51:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xREM5-00AWH1-Ml
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 20:51:37 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c746-8faa-0a2a0a5109dd-0a2a4508b67a-14
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:51:37 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c747-f659-0a2a45080019-94a39217457c-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:51:37 +0100
Received: from pps.filterd (m0384718.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIYerD2313378
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:51:35 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11012023.outbound.protection.outlook.com
 [40.93.195.23])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4hvuucsrry-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:51:35 +0000 (GMT)
Received: from BY5PR03CA0007.namprd03.prod.outlook.com (2603:10b6:a03:1e0::17)
 by PH0PR16MB4830.namprd16.prod.outlook.com (2603:10b6:510:148::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 19:51:28 +0000
Received: from CO1PEPF00018864.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::19) by BY5PR03CA0007.outlook.office365.com
 (2603:10b6:a03:1e0::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 19:51:26 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 CO1PEPF00018864.mail.protection.outlook.com (10.167.249.152) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 19:51:26 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIZIVu196224
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:51:25 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4htkxw564x-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:51:25 -0500 (EST)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id RELqxf7ijF9Y3RELrxzAzh; Wed, 11 Nov 2026 19:51:25 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=Wp4
	pgvmicn5rS7W+LOf218M2zwWa7DzUvgtz3aMSVfk=; b=t727ZOW/Bqn1pfNLc7T
	xoDFYgkD/g0dn269wvRu9N4sxIcpjwhi7EVfJ9pSNjudWTLtH6dvN9EkluPcNGsG
	31KNZs6+HbffPkWm+rsDm7xISb8akxVfV5y7jU+oNY8zf70xLioqIxf+yTlYAfmk
	0nsnOh07VWdQ+3e1Yi/dYcqNB50CAVWxsyrJGUhLf10Je4WoIWxorerkzSud/XGv
	LV28fdx30RonhjC+6UL2uWtH3upiX5dPvi/6QJTLjKhio/4O7wqIRiESe2s9Ou/C
	QJDc/WI1jJhCyr47t1ysVAzqcCaApLz9jjCqHb8vzttZQBkGUXRS7dUZCTIV/YC6
	DxA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CIUhJIFdQ47WMONhCGCuZMxMvoZOKhwS6OSai/35uCgIQC3rJvjAlrSsddrL574Ak2iKt+XzU7DW6EAhPVkhC93mlZO8O2YmAl0kkk/v5QFbWWPVaEWsvKFTe41WB9mHPm0FycSSlo7pecEEBIvVm583r9OwmaVMjYNSKuSvRMrxmIjNKmgtCludImyZ/F6ASb4JfH++H/TUx7hnfk1CLczPJLmGnNaCdtfolWnD8O0ynAQucvg5wNEjdqT0crCiPU3V8ZSpLG7Btiaqe3CEFcE5MdRS7bWD4Y6zLq+g7wFe9ZWmI0B74LcaPDfPIlDOvSx+p5RODYyoT0Sf22fFGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wp4pgvmicn5rS7W+LOf218M2zwWa7DzUvgtz3aMSVfk=;
 b=BwpH5Kf6qz1oAeQffhrO+XTsHQdBxZ0d6jDoJO4MsF6yrS2o9CkD18npnVX9EBpy+i4RAeaikUi7jZjIcXFLO0JlcXqHy2qjQhRWJXqpaLuVn1ZqnGkApiPLqCMdfMcVVWIZkMtJV6JrHeA3brldoLACfG6tETrl0QA/fcbtW6/2pAelQ+BfJ91RZm9uEVePpgROi75cH1bpB3p2DPlaoTdjTXxUtaRRon50EVBKY6DkGCO05qEbqvZDm41+VtsU1rw9wjHg2eSMrd0nEMPyticxr4uLe6skm+dVs/JnO7BNLLeIdW1lrLWfZBM+xQMb4ZctItf5TECil/MnxPtx0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wp4pgvmicn5rS7W+LOf218M2zwWa7DzUvgtz3aMSVfk=;
 b=PZQEuGXWDGlS2336ad91O6mCdkI3Nc1rcnsViL5VO6XuTuZZ+rIY9HBwZ7F5PC4GAJazJIqYzUNIRJlxoaDEJpx5HvLfmeeYdjUZOOUkgqEZw1xOD522NjvY8qqRIkfk5TmSYCPUMovOqT1XZTHP3Kr1vhayWZAQtG4JY7i757k=
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
	ppserprodsaar; bh=Wp4pgvmicn5rS7W+LOf218M2zwWa7DzUvgtz3aMSVfk=; b=
	Nyp+wNHVWzSJwgm5NdlolByROU082PwkD4YeQV1G7W9MakgbjvZKrg/LgIP9l7Vh
	omnPkcPepV6ITzSX2OcCgYJCkGn1fYf+f0Sw5BI+T/UBZ6yCYT9OfsV1p2btdndv
	AngnwXDyImbqCoSs3vOAgN8g+HrgP/jADJIG24ve5wY1/Zk5b3McsVtyvxGXvQu1
	SfV/IrH4lhG97/mBBffX0X6nvELluNkOj57In+GKaHoBcY90wtqmXuukzP6KdHJF
	lrPzACo8B6q0zh4Na3a9vm0jccNxcnr3QltbjsMZp06ai6g0vKynk9/uxLoFEiDG
	3SlhyjBSVIFgU8U/nulcBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=Wp4pgvm
	icn5rS7W+LOf218M2zwWa7DzUvgtz3aMSVfk=; b=aj+mxfCiCgvu4QHx6UhUrsX
	czFnxacFQozToDrah2gpGMJSKtRsdmjPWETv6313+iitPUzUCAKcp6Cj1FJrGmhW
	Ro6JYSAFqNaumsXunhs1qp+sWNRDK19GyMTkK+ktmENEzIZBf2HudWS1bzvGFy02
	EUiEEazSGfM14aLOTecfwUfcxcF1s9+pH0sGYF24s9qcnNcsEGHLSYxc1jMLCUfR
	6W/G9oGHUVsm9OOuQL6/UhnJtcWQEv4i45UckWFF5JcZ3JRXAuhUgJ1KCjvlSVpF
	DMrR3YZk+TpKmJdKnVDghMrblUoGhknNVgzBo15WAAAG7TB7bdAK0laYArY4fJA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: RELqxf7ijF9Y3RELrxzAzh
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [XTF PATCH v1 3/6] x86: isolate FEP in setup_fep()
Date: Wed, 11 Nov 2026 11:51:06 -0800
Message-ID: <20261111195109.1070169-4-dmukhin@ford.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111195109.1070169-1-dmukhin@ford.com>
References: <20261111195109.1070169-1-dmukhin@ford.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110078
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00018864:EE_|PH0PR16MB4830:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ed3cf724-19cd-44b1-17ef-08df402d2bff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|22082099003|18002099003|6133799003|261009223027099003|3023799007|11063799006|56012099006|261028144727099003|261102123227099003|261026140227099003|261026121527099003|261021121427099003|261022105027099003|261022075727099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	uc/haAcnVjyvOh2nPtSHsmE1KAMiXGBXiL2pmtb+wVmaryIzBwyehK/ver4s4s6cSrIslM7Pi2vuGnBYJRWHXv5O/MKbDkhvUUpuBGO7kC1JqbGgVR493PsxYjcBcbY7szJmdFBcs8LJtW3ySBwu4UdFrtbHdUv9VYPntfNfcYZvYpgOR1u4o4093F+SBCo/WypQefvjE/wWxANBRUp2u5D4Z/xYYUPuTYlwV7udrEnoTyMrjqxNzpJ8oUJAPnELuFPL7qlZ6l1G0rUiAbO2C6I3P6yey8cxPOg689uYUVQfNvI8RBGdEqQA4Q+oCBS4mWtUa2w3a3DCWLqT+zjU/ToNT1ZUPGhjtGSckw+qg7TTduMHrUZypOxyo2gJ4o/LB5tMOhX6Ummpj30V6OY3GXPEYkmblz8YNjrqdq+0sxACroL3wFpM9q6gTwW9eevvrNpLOCnUvR7l0Db4uiGc8R+wK/uipcbem54S7w+rDdr0a6FrE4yLvrUsejciuqTDP6Hzd38SCiBVqxrYVI3ee/H/smFKd0fATHiuuFcROARFw0jPy1xthw/iJpq/xaR3UyNxiP/agBW7Ax9ZvnkyhZzXnxwsEzrmCohmEQ+ukf/cgn9AQSfrKtMHY9Gr0IvBvnBrNB1uskLWdQewyfj0/xJo7P3xpx91U1y7t8S5HZK0TfDzpghZpF3E4jccEwm3S27aa4Z8RtywCPRbUyK7jw==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(261009223027099003)(3023799007)(11063799006)(56012099006)(261028144727099003)(261102123227099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022105027099003)(261022075727099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3n5kUCZU/BQedGAx6jqC/372cGgUR+0kU/UD2A+dsfKJQhTtPJMWKuAUhQ6ZoSifLMBumqLMG1bJYT6L8frZ6dApB62I1QT9ihwKapI9YLYVuMPowHQD9z/NCe+ElCmk+XyK3K2IZOh+mz42olVrBaEiRBYJjJu6Uz2sYePxdpEgCW7yydu4voihOGc901T6qNctk7OVUMY4F2UaKh0idir29Nr0rgbUb25mqq89ycLX/OtHn98tmtuwV5w0fQU/Wu2UH6xVQs0CCf1lNRweeH0hH/1CxrlxNAL24+i2Y4J8vTQiprSmkrJONelOFhLWv2kGpklb8J5OO7ba56Swtd20W8lyKXByqNDR8vpiE3rwMtnLPw+bHONNYjoryLf+B6PLEVGOVV8YEWpTUbbLA4Hmhsdm+tVajrCTwRQMv+09oK1baSpeYCy+7Tp+5AO8
X-Exchange-RoutingPolicyChecked:
	0fDXwJKii5X6VIhZKVjkb8C0Sku59U+xsUIvxHedX8bzAVlPoL7SSIIGTpSkW6UVGUZ+UtIFvn5N5qJrZblQu7PF2svNfnjKe4d7rts6CsCAj6PDFa0rYI1L0VexpQJzvgsJUNZVKI/Kn4x/ZZOUsGWFMXjeZQSps5fS+aKG69mZT2IHgZonA6smofue7hb2Xf27wQGXyXnjuhL+QC+MsLqtVBO08wD6ij9bXO1SIPpTiIzDPLTdjAuitZQ8rA38F17gNPxJBfADAgCdcKlpuSLC7jAEyfWWTy7l9HHHkY7oEB3pptH5peC54sU0d6IK+DBhvZGDblAoKXVp0o669Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	al4LSxZw0gpV51/ZYGKCOU3N5KAcwImLqH8k+gZ89mLN4So+DP7Znbw9lk+1qMkkcG609Cn0kDaFo5vRaQ3O13b+fNja/BcpWP3OlEj9QrIlneDC/1VaoI7Nay5ghCANOoQsRZu2cQEjaIEamWIoTCQvOO/0l30uyTlG/XBcHjf+cGh4iTXSLnOUEsuSgWVPooCoGhWya1vLIvev2cHDEHed0HvrB0uTBTrdjyT6SLV2U9nGTGg7yl/SRgqliqabEAnOfUMm2ClvXRTua9DnwI/YV7UR686HxPuw6oWQWR8U7ySg99G0zUORmySPBjvXXbmObw1OnzherxSgw2v9ZNYjv3Pv/OpK6nMJqOZTiCgp4PZIWyPJ3p+OjlKx6Gm5vcgSTJWJIYpIpoyTRNmoxxAtB+jW2e/1MVZVb1PjBPSyv5z+I0F5xv0NFguypgt1olxwSzMJBfVuKJUXQO7FNujeTgjmJV8YjW/XHdC6zAViHyw5bJioTcU2taTNZM7gw8r4BHaYuNdb+7+HsYs+qCavU6uHt6gkHBcrOwVdEAVj/MnSSDTkWgorx194A40NDNcY70QK8jEpcYzSsBCDQNUZkJmuRFpf1OIaXZYMNHrNDQq6JyM3Ln+YexD79USpF/WjsIdbRvd4d77n3l3sUw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:51:26.4397
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed3cf724-19cd-44b1-17ef-08df402d2bff
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00018864.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR16MB4830
X-Authority-Analysis: v=2.4 cv=YO0KWhGx c=1 sm=1 tr=0 ts=6af4c747 cx=c_pps
 a=CfFGriBY15yWSKnMtEY+og==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=ARvDHhclS48edyKYUbLB:22 a=cbNQJ9GKAAAA:8
 a=ObMOV3ej4XRLPq6fSaIA:9 a=P0bj-C3X3jJDpopQwM1U:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX0J06yXKb3/5K
 M7ne1p3gzoVKUzTX6hy+bNhq0o2c0Cy8+Iv37LgamtNE4mvnFq20pCZjY6GQq4z5riD7HXnO3eK
 yXjPkJJmcOuLDZ888xUGUoOg2zj5IsuLQ38XGot3b9j/plv8hz4G
X-Proofpoint-GUID: coT4F-k8wFOu6luFw4_ljv9olPMi0IuN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX2gvGIF2vNT/K
 gu2kKM+l/XeFbjWBPEUnIt3jhx+Z/YOQwGdpr7+K0xUz9aaDahUznHouMgQfCB22+vDnaya60/k
 Y/eG81JjKUp3NYYJO/8ARKn7vf43RYK1lnN140tnG9p/NaMD4tGZn01zES7UDRsYpWv/dh8oAEn
 mAzfiOJoFDs6xfhwIye1Sm8SYQKJE7Hi3hbGGjZ9siUvLZXESZDapMxXms0uKr62+yVcAg0HCNF
 DE7bmnEEfuJtIZlJDKT0n5RlWrAeNHBb+abr2qXs6MJ0hmtjSYRYhE6koLN7/UdbAxVu17lXVkC
 ZH4BAKBLyvbJmMRBGVyYEnwmYMwLIF2KtihwpdSlJUZSYW7N5VHsS3w+s3+LxMA/B9VzdoLQ+sa
 zO3O85yZl9bV4c6saTDrdyMlojLO45Aa3bC843+JtSA5My4S3w3WjxtBE20x7q+U3FrPDTKGtho
 pcbK03FzeNfsgOD2CfA==
X-Proofpoint-ORIG-GUID: coT4F-k8wFOu6luFw4_ljv9olPMi0IuN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110078
X-purgate-ID: tlsNG-c1860d/1794426697-DFAD487B-579875C1/0/0
X-purgate-type: clean
X-purgate-size: 3345
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Keep weak symbol test_setup() for per-test definition.

Isolate FEP into a new setup_fep() call which is executed on a common x86
path.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 arch/x86/setup.c | 80 +++++++++++++++++++++++++-----------------------
 1 file changed, 41 insertions(+), 39 deletions(-)

diff --git a/arch/x86/setup.c b/arch/x86/setup.c
index ba6f9c320843..8fea6495de1c 100644
--- a/arch/x86/setup.c
+++ b/arch/x86/setup.c
@@ -253,6 +253,45 @@ static void xen_console_write(const char *buf, size_t len)
     hypercall_console_write(buf, len);
 }
 
+/*
+ * Common test setup:
+ *
+ * xtf_has_* indicates the availabiliy of options which require runtime
+ * detection.
+ */
+bool xtf_has_fep = false;
+
+/*
+ * Default weak settings.
+ *
+ * test_wants_* indicates default settings for the framework, which may be
+ * overridden by individual tests by providing non-weak variables.
+ *
+ * test_needs_* indicates options required by the test, without which the test
+ * isn't worth running.
+ */
+bool __weak test_needs_fep = false;
+
+static void setup_fep(void)
+{
+    /*
+     * Attempt to use the forced emulation prefix to set the value of
+     * xtf_has_fep to the value of 1.  Use the exception table to compensate
+     * for the #UD exception if FEP is not available.
+     */
+    asm volatile ("1:" _ASM_XEN_FEP "mov $1, %[fep];"
+                  "2:"
+                  _ASM_EXTABLE(1b, 2b)
+                  : [fep] "=q" (xtf_has_fep)
+                  : "0" (false));
+
+    if ( test_needs_fep && !xtf_has_fep )
+    {
+        printk("FEP unavailable, but needed by test. (Is Xen support\n");
+        return xtf_skip("compiled in, and booted with 'hvm_fep'?)\n");
+    }
+}
+
 void arch_setup(void)
 {
     if ( IS_DEFINED(CONFIG_HVM) && !pvh_start_info )
@@ -275,6 +314,8 @@ void arch_setup(void)
     }
 
     map_shared_info();
+
+    setup_fep();
 }
 
 int arch_get_domid(void)
@@ -293,45 +334,6 @@ int arch_get_domid(void)
     return -1;
 }
 
-/*
- * Common test setup:
- *
- * xtf_has_* indicates the availabiliy of options which require runtime
- * detection.
- */
-bool xtf_has_fep = false;
-
-/*
- * Default weak settings.
- *
- * test_wants_* indicates default settings for the framework, which may be
- * overridden by individual tests by providing non-weak variables.
- *
- * test_needs_* indicates options required by the test, without which the test
- * isn't worth running.
- */
-bool __weak test_needs_fep = false;
-
-void test_setup(void)
-{
-    /*
-     * Attempt to use the forced emulation prefix to set the value of
-     * xtf_has_fep to the value of 1.  Use the exception table to compensate
-     * for the #UD exception if FEP is not available.
-     */
-    asm volatile ("1:" _ASM_XEN_FEP "mov $1, %[fep];"
-                  "2:"
-                  _ASM_EXTABLE(1b, 2b)
-                  : [fep] "=q" (xtf_has_fep)
-                  : "0" (false));
-
-    if ( test_needs_fep && !xtf_has_fep )
-    {
-        printk("FEP unavailable, but needed by test. (Is Xen support\n");
-        return xtf_skip("compiled in, and booted with 'hvm_fep'?)\n");
-    }
-}
-
 /*
  * Local variables:
  * mode: C
-- 
2.56.0


