Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D3A606A326
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=nz4paN+3;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=TcNMojm5;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=gqJ5/fqe;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=rjBwoOF7
Received: from list by lists.xenproject.org with outflank-mailman.1473479.1681136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmQz-0008FJ-SW; Thu, 05 Nov 2026 01:38:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473479.1681136; Thu, 05 Nov 2026 01:38:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmQz-0008F4-Nt; Thu, 05 Nov 2026 01:38:33 +0000
Received: by outflank-mailman (input) for mailman id 1473479;
 Thu, 05 Nov 2026 01:38:32 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmQy-00080P-Id
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:38:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmQx-001xPV-VO
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:38:31 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdddf-8faa-0a2a0a5109dd-0a2a450b9320-42
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:38:31 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebde16-b7e8-0a2a450b0019-94a38ff1cd52-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:38:31 +0100
Received: from pps.filterd (m0367127.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mpH5226606
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:38:30 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11013000.outbound.protection.outlook.com
 [40.93.201.0])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hrfaurcm5-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:38:30 +0000 (GMT)
Received: from CH2PR19CA0009.namprd19.prod.outlook.com (2603:10b6:610:4d::19)
 by SJ5PPF2FE4C64A5.namprd16.prod.outlook.com
 (2603:10b6:a0f:fc02::acd) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 01:38:27 +0000
Received: from DM3PEPF000265B1.namprd02.prod.outlook.com
 (2603:10b6:610:4d:cafe::c) by CH2PR19CA0009.outlook.office365.com
 (2603:10b6:610:4d::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:38:27 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 DM3PEPF000265B1.mail.protection.outlook.com (10.167.23.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:38:26 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mNu43091274
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:38:26 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4hnycbnhms-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:38:26 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id OmQqxuk8Wz55iOmQqxXMqf; Thu, 05 Nov 2026 01:38:26 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=4ya
	lAjYsUxxsmkW5FJo/Dk9J4B1KdHhLsXkLz4WvQu8=; b=nz4paN+3cLHRAD3jh2w
	EoZSYcRtRcb237l+9YaPKqHnaXojf4sCwgWYAfoz5vYIUerMKT+fk7rsEQYHdUDj
	sEJI0Rqu6Vm7sdFu+/rearEEn2TfF3S/LYm2m9jVMJX6mgkCM7bXtY+0zwoJj3uL
	GXOuz0E7kkidRlEIxTH0p8Cyilh1PLwtBgKv0vKc/SL/rDj+aeD9kOB1TRhjlNs0
	ut9FA8uqNccC8OAl7+cCBGe+6tmRNhPYYNzV6hwf0kSmrITpZMQJLcPWG0UG63xt
	ugjV8qv5QYbAf2SYogwyrLNGLyfQ3a0kr6iqcBQgckud+k6QipKq0YYUjbnFEe0L
	eBg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zQi+B2jdPU9X10rSzSLlTbZwXGtXYRFI6FUrX/Bnwo6VsauwMAwPpN+9GikDP6EW8n+U5rNsBk+aIAF6WB9EX9d7Gz23tUF+rSN6vUdn+xqtqhfxAtlZRn8NTUN+C4lXNMqCPAmlKyVfQozanIr8JA2FCvvHM3plaoeQqg+5DdpkzpLJgg4ESZ0OaXAyJ9j4bMl3+n1iCOIm8HpIinxqhCr7cAzT1Haao7LN8PGpgPxMAQekISTz8zAsR2blsQXnOCCSOoAf136vYk6rmifrnsd3BkCopQ88jMV5v3IwPnziLm5hR5rbzml1BoXox8RUyFmD8SfRxLT80MwpyLbzuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4yalAjYsUxxsmkW5FJo/Dk9J4B1KdHhLsXkLz4WvQu8=;
 b=BBMRVqSj4Cb2HtJWSQ44ys16XMI85vfz28yXVZrekAP5DcFMyvSsJNDdsH5VvMAY3L4dKmx/oqtuU8RjbX+GFG036NKIM+V+meOy2v7pntOlydKiw69c3rXIzdWO75klSi18kjALH0+A/ObRUMFMyuKrVLYseIV2aWHh2D38fLRXWIkgGBYsITxktBZgmPh87B2dS1syq4iE3YTWce6bZdPuDoNgWuqeVaKorl8LCls40q4xJfPQ4LuAqKoPbxZCBoNihB6TKRksJzG4Mb0D65H6gELeJhQrCM7HFROhMczSZ8+0PL0thBzRX2ufcGV/el3USk3MRv+NmcHBV8ygyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yalAjYsUxxsmkW5FJo/Dk9J4B1KdHhLsXkLz4WvQu8=;
 b=TcNMojm5B9SrB1vcNxh3KGaJ6ozTMk9XEu6XvLAvQQ6L92YBvEk6ytqfeAMGIbI52RllqktmGAQFvprP1W3ZLSq3vCqcRCICrOdZTro9MsmTYK9wVrQksUWq1Es1g8K+8VBQhgcM4ojmHnMo1HkA10lNzsBwEIsoHEQwGcwjvZQ=
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
	ppserprodsaar; bh=4yalAjYsUxxsmkW5FJo/Dk9J4B1KdHhLsXkLz4WvQu8=; b=
	gqJ5/fqeNrY/IREJnaUIsFqddDBWb33A/VSxQNkRa6ClYJwo8CgFkShpbpNJshfw
	ul81c1IQXJ0q/yO6itRjXwHe50jdguLr6RPqPDlp7nB1dFoyzScnNM7dnJbhi+/d
	W338C0pvZxEz0wnGsqK5fUv+uOAvg3L6sMMi0rB8K1/Y2MOZd+mZWxuQ6WRKZX3D
	Wz9ddNm+pUJ6TxE83Iz8x21y40ZrZbuqsfR4h+/WPtkPAAWLyq5asGWr2Yv4XcgH
	FiuXzCfjqx42Ax0wQV8qCSshGSJGeWi0eaniQl4mBXMRpEUt2LSgXoGo1ieTYtcU
	pz0q3BQ/l9qyxu8kXP42Nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=4yalAjY
	sUxxsmkW5FJo/Dk9J4B1KdHhLsXkLz4WvQu8=; b=rjBwoOF7KAmZahHahT0yRnG
	bMkBliSrTayniHTGiyxjapKE+66vazzKaFjetrr3F2DHJmZGSJzYzK2aSqq0pw9O
	mXuDYyuH03rRMBf/tCeP9jVYClxz1ZeYvmrlrhJCkq6pc7F6euMiTnfjPh7A+IAg
	TFnkN2MSa6b6pyBgoT0Ut4ZRDFdkZ1OgumTx9+ufyoyMQaoY0NcYrkyxoyRfS5oQ
	F2WxeKFVylIdqspPiwe/JguZCzuginRuj6a15lCCX9OHMruSeFQI9nQxapm62J64
	TbadVv0dweKMV5u2z/ILT5i07pvJUe7ZCza/FWSd5ndYPSxNc6oIThkS1VGr4DQ=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmQqxuk8Wz55iOmQqxXMqf
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [XTF PATCH v1 01/15] common: account for installing *-sym files
Date: Wed,  4 Nov 2026 17:38:03 -0800
Message-ID: <20261105013817.719823-2-dmukhin@ford.com>
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
X-MS-TrafficTypeDiagnostic: DM3PEPF000265B1:EE_|SJ5PPF2FE4C64A5:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2b7a2f00-1f42-4606-9feb-08df3add7d25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|10067099003|22082099003|18002099003|11063799006|56012099006|261021121427099003|261021123027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	AQ4odqdERB/qgaWCbb3i7duMr1Vz4+7cBIWLHeykhWrr0yQJtCRSMHPBG3MNhaqCIlle9Fzv9+FOT6OnDqYT+ry1byqbc9pvQQO4RUg/dtc/dYGHNYHyfQVmMCJEij8Hk6CIugO31iYm42BiBrxLp4t0UjWqyLrst3psnwsUiOIuubnu97ie6WuU3zqAA9F23z5TyeyqMnavZ1DJ6O/tH9lcPRZ9s2dw4CR11pMph1VuUJlNFjYXs/W81uw5QJsmwyPQT988Kn0hGdJclGd43EYkA6JOaOdM6Y8y9pvNNFCGqv5i7TDDo3/9odNs6YcY/0u2/1h0M4MWoEdnDedEYHbbuANTOaxvod6TQic8WgqY/oFpvvJxTwj7tHg/QOxedsbFkSa1hcuGSdStkH0+tNG0k4ricrttKxRoRk5yjrt4kGgutjhX1dVYDdiUxIy0o5IrRTFpYYO4uDeXWGn53pNZGoBB21uKMPL45x03L/tHPsr7Wk196MVuejYFE7T9HuI5dfrjPGCPNE/cK5+Cs0PAwx9WZoHESLfHDLJGI+HVl5dl6QJFz6PuFZ90qqd8qFCyWJY/Rs1i4pvgXI1JekLDclap5SBluERoOEArD/LT45r6Amwxj2pLxiXREwfvs+P8QbniX5hJbZbdW3C3GhWSwkSAeKaG0ghH+nbAe+/BSsyEXJx39YBSS7dINinxmWwDLElrBZiqT79a52NpPg==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0HEZGCQ8lgt1o1eO1KWLN0vsdmbdVjLUpccQcB9z/om+K1smu21uPxszB1X2ZTV/C1daLdUb0xvB8DjBA0nrxXlAoKHMgljUiDAibj8d3a/XYZaaUbHq3+rTp+EAPQ+nNuX2v7je4+/j+vTjROiG64YhKtJ8pVrVKLCgEg92jtIJESHwHqwj+rfe5Z7OIHqhyWGPVYer91vTxGvR3rN7fyuIQXLW4uuENSuGABHbAWfX9Fs3zIaj5e1n/rLV9BsK/vNNVE79tHgurdv8QWRoG1u9BFo5tEd3w4fMLsytUghzJSJdMhd8xf/fiF4zzos4/MOjKtU3MbqZ6RECmiyk/UEg+jLGwMRVKditSKpS+Qu47N2zN8uhIdYsZyxvdBmNel4db+oXVcQneeB7N8FY2n0zXcngbBQnuNf9vmw0GniknwbWl8NLW07KbD9IlwmB
X-Exchange-RoutingPolicyChecked:
	RsJ6H1G6mHgowV0h72TOO6aGni3JE7bxR0CgjgidJMvDEU2+U1br08iShuGlPKa/nSBfHoMZgBHDVEZcXNPNsrHdIh0cDZQfV0oVFpselDWRJ2ovasPps5idmo/4FyZPJWMtuVszAyf0w/LqlI7mw7DrIWrad+wb11ISr+yv7kctYkMtauw6nnEvAXI35ND+EegbWtjnb85vRL0+ItuOcNw0oyVLQVJPCNCqMCww5Rj+hJHMAmxzDc12ehneEIWD6QnEuz4ANbByFFMvsEtWKDjj9VNyVbEiBWqCbDvEM/GXjs3dd5HkmBBX5NJ/hIs6NR3tEUOuoeVCQ79f/sHU6A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2vg3vut1LEGTTh4yzXRaBd2QBjKKqgqxe812Y/843sMHyvcluNb7D5nrcTvsHp5XjhH+ulPAsYed2DPb1a7N5H6ex4PqsREoK8RWsd9StvagcMwenKyeBAUUCOIFqQ5eR51py3DBFA3HXsOjw2zos1g1h3Z1I11mpkYDjoqt2/KsrjXxJguy85jSGmNzpjcH2v00j8diLgJMhBJA892vQrL55OAkUzUOqLaCIFDcFuwty3CaJ33SjaieW1KDWOGMwDsZgPdFyD1p5x8Ou6AnHhlo3iwRfxAF+7mwjl7yb0Ia3aI08v2Ml/mkqNZyCUBRDLuvKN8UUonnFQ2sSPr0tbFsGRPeUziC+fi51nvL771lxySK9CvybYaAkG2VbW21Y18dEnzrXLDL2Jnpeop9B4SolHXJ75jUkuTyCVlfuLWJgpRnn2FauxZoPBlr5CkUHsCZmzoxhX+qS+8GsQyS2Wpmm5RdTsyquwa+kIxRjkF/reW8mc7ENG3MoY2OwrFHs3DbhV+mQHS/QPEmwNDQ8lYaGFZTCD9sMyu/rweH3j7Knl16rlRdv30Y3jSx48frGE+eHi1d6F5XMaj7aBrrEO1aP0ZM0XCe8+xaGBCPnDqt15w46KNr5/w65WhjN+CnQDyNbp9m4yHiFXNhrk1mCA==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:38:26.9842
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b7a2f00-1f42-4606-9feb-08df3add7d25
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3PEPF000265B1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF2FE4C64A5
X-Proofpoint-GUID: YGHU-ZAHaWeqwi2chJVMW-MbP5GScavW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX90WGtDypZBf1
 K0Cyrccgb0qg0ww0qevjHbJLNNgCattqnJTgKK1Q0FX4LvnaZgNy9JZQvzNJnlZSRJjH/cC6yr+
 DrhgCvnhMUScsr8IECISHGV6odYk9DLnl9iJMNwmQwbD6HfaBX2l
X-Proofpoint-ORIG-GUID: YGHU-ZAHaWeqwi2chJVMW-MbP5GScavW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfXw768euobHN7p
 Ykx41Kp3tlsEvJJcInzEV1YFlgZGwseUwfZy1kF5nlT1diFaSnlaDpfEFoKWNRZXJbNBwqTsjG4
 KRBskuJefPtq7QLiBN1KjSmUdjDLpeTvWI2SSVmGo2EiVzS3d628ClRIGoMsVexfIsNY/438AMC
 QiXzA+7tEkyRihMCb4YGxZ442JAAtmEQVuTdtBt3Bv6bWBu/Nb4qlygK23JiMwhECfDO9t2VHoV
 523+9FT3C+wGro0KfvOPsuYl/odL38k5d/CrX+G7/brG3sr+Yt7SjhlSKXHMkmuru9V2c+i69L+
 04/fEzPeqm2AJEPGTV2BcEvysNuKeK0+iULImLLsFXPtTXCDQ3ZKCTBwWiCc/YJWTFd69Q23zWp
 +qS2ulq9k6oYAigk99b2BnGRJDU+icdAwz9IOrIn+KzHFv6pCzhCzH9qV/9bnzuTYDFW1O1liVG
 RkhPLrXylFeuXfatLoQ==
X-Authority-Analysis: v=2.4 cv=ScVi5fRu c=1 sm=1 tr=0 ts=6aebde16 cx=c_pps
 a=snd9/+/+5efdJOckOpJmHA==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=dw5MciS7gY-znkhJuOLE:22 a=cbNQJ9GKAAAA:8
 a=aL_kcGaodeMCETBUHCsA:9 a=G69WFyCBNqGPyalROSdv:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050006
X-purgate-ID: tlsNG-42698a/1793842711-1A0C59EA-080E2E59/0/0
X-purgate-type: clean
X-purgate-size: 853
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Install *-sym files to support XTF packaging across all supported
architectures.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 build/gen.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/build/gen.mk b/build/gen.mk
index df474a121de9..8c400e6595e9 100644
--- a/build/gen.mk
+++ b/build/gen.mk
@@ -78,7 +78,7 @@ test-$(1)-$(NAME)~%.cfg: $$(cfg-default-deps) $(ROOT)/config/%.cfg.in
 .PHONY: install-$(1) install-$(1).cfg
 install-$(1): test-$(1)-$(NAME)
 	@$(INSTALL_DIR) $(DESTDIR)$(xtftestdir)/$(NAME)
-	$(INSTALL_PROGRAM) $$< $(DESTDIR)$(xtftestdir)/$(NAME)
+	$(INSTALL_PROGRAM) -t $(DESTDIR)$(xtftestdir)/$(NAME) $$< $$(wildcard $$<-syms)
 
 install-$(1).cfg: $(filter test-$(1)-%,$(TEST-CFGS))
 	@$(INSTALL_DIR) $(DESTDIR)$(xtftestdir)/$(NAME)
-- 
2.55.0


