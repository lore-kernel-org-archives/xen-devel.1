Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181D8606A326
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=wbC+RE8w;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=at9/CYW4;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=L3lI+bKW;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=E2HbeJof
Received: from list by lists.xenproject.org with outflank-mailman.1473204.1680856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmNT-00071g-Fx; Thu, 05 Nov 2026 01:34:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473204.1680856; Thu, 05 Nov 2026 01:34:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmNT-0006zY-AG; Thu, 05 Nov 2026 01:34:55 +0000
Received: by outflank-mailman (input) for mailman id 1473204;
 Thu, 05 Nov 2026 01:34:53 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmNR-0006ny-8u
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:34:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmNQ-000xGY-La
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:34:52 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd3a-bab6-0a2a0a5309dd-0a2a4505ed80-2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:34:52 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd3b-4cb1-0a2a45050019-94a38ff17072-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:34:52 +0100
Received: from pps.filterd (m0367128.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50miCb2611914
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:34:51 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11013049.outbound.protection.outlook.com
 [40.93.201.49])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hrdw8rvcg-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:34:50 +0000 (GMT)
Received: from MW4PR04CA0210.namprd04.prod.outlook.com (2603:10b6:303:86::35)
 by LV0PR16MB108449.namprd16.prod.outlook.com (2603:10b6:408:3dd::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:34:48 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:303:86:cafe::a0) by MW4PR04CA0210.outlook.office365.com
 (2603:10b6:303:86::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:34:47 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:34:47 +0000
Received: from pps.filterd (m0373460.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50noOk1488051
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:34:46 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hp232whx2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:34:46 -0500 (EST)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id OmNHxrjLGCiSDOmNIxv4A7; Thu, 05 Nov 2026 01:34:46 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=zdr
	SjCV06jvCBbIMYqihzyNNatKFVXpQLzFOygG/sG8=; b=wbC+RE8wPI/tkAp7GeF
	ZT1EQEYM0+VM787SNpDxW6MZOedYNXynETBGq3A9nF5LT9AEYgPBaYnRLfZ4/BO/
	PM+fnGSlkuGTJYQpEUdBkJ0233hzZ4/H2xvFp31TiKqZm2fFgQoawJcjix0gm39N
	gPAAAfapv0AYaNkBeGdordZ8ZvKc3hGpSKYh2Kdgnvj1fOvJdEGoCoxGcNYo9kzv
	21npRN0n8UxyiuNdDZCUQoUvzZyHLRGEuo3y/WKHsU1qAF0e5MPgAYNEa3Yo/ly+
	dfkUHkd/D3rd8/TDrSJUjohFYgsuSWChXFZ4hBHR6Nr0O+7Mjlr7XNUvmXqrKTvd
	ToQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w0xjH/W/1wro52t53F/mvc1rPgJRQt8aufAP718Vq8Kt2CSiuke8/5sWkmYVD31eLDGnpZ2O45VFtBvlXy4Tp9KVOTjMGJB9luH4UFB4r8wLeUashv4mYUKVpXJ6aBVXvX29SvvPkiyM6l1iRZ1xGp3BmFhk4cXcqTtQA6OBJIDrXR+hTQ78AAxqVUUiX9Po0pwv59itXUcDSIoO9QwrjaY3JczrJxt1hiVzDwcsNYa+NAqAuiQauXj8wGbMVPYiZ/MZa9X5qfDkPi3o3LtgRf6ZQ8Mfd+/XmQ0MV3MUn1tk2iT//PGvB27CrNiAV8VdTw4wzUAAv9ZY/IuWz1de8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zdrSjCV06jvCBbIMYqihzyNNatKFVXpQLzFOygG/sG8=;
 b=qbI/vqinlQcvMKbvyRrfEGAa6YpqlziXtLoxwFlYpZDNStm4nE5o33EN9rbPP3PhgEZqBG87UHo97tAnywlNAmY5rxDZFhVb+k/Uvof2xUvq2jTjfOGX7raWY0rwWjnvAgAoSHxddgIboYLyz1mznWXGF0BYEHCUIy43Yet12+bHmKbGUVAiiYbL3SvOsj+E7pvExKQsJIQDYgBBjp9R89QTuPIQKc1TblT6sIJNsbxCNSSd8/KS6DMqSfydDvISHz8+T+Dtm3VS2LlX90qDN55mP39O7UgcjtozjdFVVyvNy92/EXXeQgIX9LtjKrEgzPb/Bnekxq22lYX1FgomkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdrSjCV06jvCBbIMYqihzyNNatKFVXpQLzFOygG/sG8=;
 b=at9/CYW48892KQJrXcuIUD4BHXeAXfRAwMMd1pYuh4r38KbY3TwJbLafXN9rHU174fFH5IogR4GFZsIGPe3fSFfVfwJy1Yg6ejEwGLm16HWmBwKNzOic+rLCYfa2fyOtpAHIbXix/qd15uJ2RIQXGwAqWBFAgDVysFCdlFyRN0Q=
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
	ppserprodsaar; bh=zdrSjCV06jvCBbIMYqihzyNNatKFVXpQLzFOygG/sG8=; b=
	L3lI+bKWuddZsvk4V2inB+egSmBnW2vu2PEU2om0JdgOPvJAjGSt6VXUwaw/TK9K
	rnjpsuYhjlS/XLP48SU205YUraMqofDl3f09gwKQovQ8QTckKEJiqS0vddpp8xxq
	BpoPI1L3WfDwnByDa8FvjXuSN9SE3cgFmYfHqXxHfV+SjDICMnpQzKw9cn18dNrH
	n5N0YY1ijlhtvN99rD4hMDcpHkqQlsHZ5HxB0vOnGxm8wDuOiNtEmEzTtc2fttdV
	Za/h2FV6X60/sqwlwceioCLaoYS7Lp/lRcUdpNVpJ9II64ZXnzQoNO/muNj4mrfQ
	Sb1Sky4pVfPRvpuI9DrMGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=zdrSjCV
	06jvCBbIMYqihzyNNatKFVXpQLzFOygG/sG8=; b=E2HbeJof6am60l2ip217kpu
	LTTTFo0AZt6/jg8F1uVJg50dgDyP8MUJrGE0O0MfkQtIWAU2TEdhC3nZqcoINz6D
	I5uzrwxUrX0VkB6MLQ8eN+yh71TTbhWAkQSug4KOHq3tvOkIfozT/a6HoK8B2Jxj
	FfEh53v6lh0r561d69QlLRgt726Civiw/UfIRReSPz+wX334LYCNxLqTugDNp9jv
	0rl/3B2JX2umBYF9i+wXX2RpbYFjtGczPIiIYRiSbicHlbNDfjkIJ1i4SklxXVn6
	dVDCVek7Z31KiRu/stoJpiZUPdXg4fzeAex4Yx3aCvQEP2bvf81t1EFw7l9CX4Q=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmNHxrjLGCiSDOmNIxv4A7
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
        roger@xenproject.org, teddy.astie@vates.tech, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 15/28] x86/hvm: vlapic: add checks before posted interrupt delivery
Date: Wed,  4 Nov 2026 17:33:32 -0800
Message-ID: <20261105013347.719392-16-dmukhin@ford.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|LV0PR16MB108449:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ca708f3d-166e-427f-e37a-08df3adcf9f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|10067099003|18002099003|22082099003|11063799006|261022105027099003|261028144727099003|261026140227099003|261102123227099003|261021121427099003|261021123027099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	IClIYAgvw4rL/1biAw+sd5UMn5wZKJbENyS5UCUFl4NuClwrpn/G3cTGycAPE1GKVj87tfYqgiJ1q12yR2bHWmYg4tkAzgNXdveucz9V/hWbdvQUoxS1rZf/QzSReEsgNfV63o3VlVWQHPxIffCrGIVi//QVA3OM36PKfFoiYAr8ydwxPUNuuwYM1OslPvKuVEDH8tsE25DRmMSf2XX+5xi3Yb03UFXUV16bJT0eWcaZoN8RerkKDSF+ahwdbLgQOhNzg0cxQTIdUoTxB9+LsG19jBLCENiupt2Zz8p2ya5JqOxkIicLNbKiAFvXfzBVJIa/qAGt3XLV1VZ+yRPOfYKNw5GbPR1yu1CVzeefyrF+wqCQ6L5au3fjlaygIWbO4gg36C91Arjv/pI8b1r8QWU1Db3uYRmWzyiOLf5p0ci5q4NBG23Spz5aLRxu0QqXINatrJTZXNKIAod2WGQajPoC7a9CHYOcoStHXOjaRTsr8YiHJWjpSvchaYo8057/d0UeXNDA+GlmHjKka+AxyQo5l+AVunk2LR1m4QZwC8XW4lJrBi9i3pIxHtXZ8UPIZ55k8e8vUDd50w/6V17KWbXtHoflk/QTmt4NihbAx8F5PlUGTqT4JcnA9wsMFe9xF+Ze9Z3+cJoJjZb+qFxZKaznbJohx4uKCB8V68+bHQOTY8V0UgNO6mxeFjmWS8MJb445FYSwxYy+bBB3OFSx4w==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(10067099003)(18002099003)(22082099003)(11063799006)(261022105027099003)(261028144727099003)(261026140227099003)(261102123227099003)(261021121427099003)(261021123027099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	n5Dn7LSREK5AYo1FSJOODPaStbtSJ8n1cyDbyK6sQD52gIvIkCqCgxpPHI7CGDWFx6cOEwJMwfy2wk9lYIJq9umsI02jFsEpcC8mWof4qtzBqIbZmOdZV+r0xQv6dAioMypnkxsKXVoc1TaGXugznMlUo6vmJnHT0bO0Y6Bjnj0McYD1IbTza9+gjrnwNbaHJXd13W8mCZLv/LhCS8n0CSbz3HitP92ChrrcuvCH2/VkCFCmWHhTLIRPajY9KpuzqP0rKdFvAJt9uOWPAo74kLdO8TutvfNiVjzLxP5qBIXxsdoiagdJ/y80T6yWVllVZrYZjrLxzA7EKDEPNlHhMIX5DcsaS0BDR0xMdmlrI1/SdJk/NAr+Qk2WETWbAl25Q4rikLJ5AitCOKNsFJtu63p5ipfoi7M/B9T+YuJcJ+7K/BR3R/A9g6nFjaQDPCnQ
X-Exchange-RoutingPolicyChecked:
	L/PAYwBIcpTw+QBhUTGNXF3T48c95GSJiGE7MlIW6aUUWyBW78qVKJCUMDb0WHDrvWXVDgIgBvlnYs35kEo7Go0zKh6kouqmHXfDkA1YqfHERqgggg0y8B8nfO12mHp9i2WWnLkreyc1ULGnjcgwV7U8H2mv3Hrr6nKmEQdFzKURE8nVnRhzt3WtMhrAB/W8QrLPK6J34fR4vufkjzacrc8Ju5TjoFhLuZKe7vMWqO2ULYvrgcbPA/PE6fHvRBZJuJsPRC7e3eYgqPWLAuzmL2A6aBCVVWJQ6GqwbngM4dQ2/E2+B1ftZ8nI090E9nngJ5ZIKEuj1/tWslD0C1LnWA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gtZeqtu5dUYFddkpj+ZoOkdUqpx2ZozmuV/rpixq5WlHx23gtIjo2kPWIsduq6yWv4ygHzejueS2o2J7UbSklieN5cGj8lbTMA6ZJRwiuvav9sCVS2JdP9S3xGcn4kQFq69UH6hVuXaiG5poNYhnJCUILrWk+QcucGOsfofzsvEg7fh/W+m+v2aKI784T1QvyMudnlZXfqFQH1muc0Y7UnpWNqDySqhcVQGyi6+ydj8v7jYDmh6WaPrDXGLo4DJ3dXKvXD9wPPWrruVSV+yEoHAvMWdZ5dS4WGojfSue3AOd73PnDHGUIhx9ZV11FOkHoUQa3o+62RhKYZbM5cQL4FYlFuwXZ5bYYImFEeKgPPVBgq4277ta5C+xo04qaWUCiD5QdqRruyupsGC0F21Uw+RxoiQxhvSML0HqpnEY6r/KRlNlJ1E48Gv8VYwJNWL+XqJiHwpQGzG3ESCvsSmM2esaWCs6PBe15ubwE7Ryk+AXXpVmtBdhLRmS4VW7U6xYS+PVAAq7cBWIJGoCG3vIXQNR0XXIdToe5K2zmfvjkF/fM5FgZFFNOc2BfrguChMT4FzPbJuR7/egUQk/AoFazN1kf+luAz03KWPJwjHI+Qf8zjoS0Lc2Cd6r8e10WlKlFb8sSo23ImmIV1UQDGiUSA==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:34:47.0321
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca708f3d-166e-427f-e37a-08df3adcf9f6
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR16MB108449
X-Authority-Analysis: v=2.4 cv=JPiuIMKb c=1 sm=1 tr=0 ts=6aebdd3a cx=c_pps
 a=onUmW/TBZy4T/WhMO3N4DQ==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=WER9OelvoqQQjwJToBYG:22 a=cbNQJ9GKAAAA:8
 a=pmcM1Ed31OFrkSDlWIIA:9 a=DqJYxgmhk6moR-_7_KoZ:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfXzexnzVpAis6S
 e6EgBjY8cz2gG01aun39BkWVGJG8VeSFzIw1hL8lxdDEMZ6F6SvhTfn3dUqN1PvseKeyuqL9TKw
 Y5CdXLTBCwo3pzl1mkJh/Xdh9/JnAt8LJvKE2afSSG5viVhrzZ+K
X-Proofpoint-ORIG-GUID: MhbiSFx_dq-CRH0r_Zr6B4s4SS3MsyUS
X-Proofpoint-GUID: MhbiSFx_dq-CRH0r_Zr6B4s4SS3MsyUS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfX39Bvu8wG2Ac/
 ib9TWJyr/1XlwTNDmqD+OpD8a41ItiZTxGLmGoz+aGbDgvW9etL+0YwvI5aHtDtAuHtFWLKjdxj
 cE9TL5L6/FzpMXIEvsoWQDxRu3YmSw915CCj0k7ro8YM3oqsEcvJU9MBgmJFFYOYPGmWNrDsBum
 EIQ8jetaQVowZGK+/iSs9qnMBrXxjXocCfpBaD03+PAetxSSx154Nt26KzPCHkI+KVbt3Adk8/c
 vjaO1JAy6LLcJ52L18TDQ2lj2Qezi5ILJAMecEsvZ7AxzvV49zm0d1Qfd8HDN6RELgQ2mfoPfd3
 Rw25NkWTJL6K8AsGP19XAtmm3unr22npYMWu8CPaYlLz+DHmfH2cdUl+zRWW84EHPSGYeGstP6d
 HFveorRRcnzyNwFmp3dQDL/L6PHpTty8/E6SbTEPtNOWnJVteScL3uizXh75GQBgwn/yuEMJPxJ
 QLYOdXUbgkZcoF38pVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050005
X-purgate-ID: tlsNG-c201ff/1793842492-F62AB2A1-8C0AB5BC/0/0
X-purgate-type: clean
X-purgate-size: 1219
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Hoist IRR check for pending vector in question to avoid calling into
posted interrupt delivery callback.

Also, avoid calling posted interrupts when current vCPU is target vCPU.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/hvm/vlapic.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 22c472d569b5..222a78b02b77 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -164,9 +164,17 @@ void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec, uint8_t trig)
     if ( hvm_funcs.update_eoi_exit_bitmap )
         alternative_vcall(hvm_funcs.update_eoi_exit_bitmap, target, vec, trig);
 
+    if ( vlapic_test_and_set_irr(vlapic, vec) )
+        /* Interrupt vector is already pending */
+        return;
+
+    if ( target == current )
+        /* Kick remote vCPUs only */
+        return;
+
     if ( hvm_funcs.deliver_posted_intr )
         alternative_vcall(hvm_funcs.deliver_posted_intr, target, vec);
-    else if ( !vlapic_test_and_set_irr(vlapic, vec) )
+    else
         vcpu_kick(target);
 }
 
-- 
2.55.0


