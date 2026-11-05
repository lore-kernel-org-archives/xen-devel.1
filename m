Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F86606A32C
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=iB1XS8v+;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=AbpBsRMV;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=BOq1Yb6p;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=CYWSoEaX
Received: from list by lists.xenproject.org with outflank-mailman.1473321.1680982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmOG-0005kX-Tr; Thu, 05 Nov 2026 01:35:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473321.1680982; Thu, 05 Nov 2026 01:35:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmOG-0005kF-Pc; Thu, 05 Nov 2026 01:35:44 +0000
Received: by outflank-mailman (input) for mailman id 1473321;
 Thu, 05 Nov 2026 01:35:43 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmOF-0005gD-HU
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:35:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmOE-001x5b-UL
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:35:42 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd3a-2eae-0a2a0a5409dd-0a2a4509db66-22
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:35:42 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd6d-be1a-0a2a45090019-94a39217d2ea-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:35:42 +0100
Received: from pps.filterd (m0367123.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mfSb2568379
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:35:40 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com
 (mail-centralusazon11010040.outbound.protection.outlook.com [52.101.61.40])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4hr8vmvb53-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:35:40 +0000 (GMT)
Received: from PH5P222CA0008.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:34b::10)
 by MW4PR16MB5087.namprd16.prod.outlook.com (2603:10b6:303:1be::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 01:34:29 +0000
Received: from PH3PEPF0005961D.namprd05.prod.outlook.com
 (2603:10b6:510:34b:cafe::a4) by PH5P222CA0008.outlook.office365.com
 (2603:10b6:510:34b::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:34:28 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 PH3PEPF0005961D.mail.protection.outlook.com (10.167.243.27) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:34:27 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50nw2C2971351
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:34:27 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hnxs4nrk8-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:34:26 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id OmMyxjRSdf5COOmMzxlLKX; Thu, 05 Nov 2026 01:34:26 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=UnF
	VM1D32Q8PVzU9oZlOxLlg1sYnLTK8jp9jrh0Jn4Y=; b=iB1XS8v+q4RL1hCmtMR
	4YaHgthfisWlBlaL5J2YLkStDJNWyjjciwgvuXRgr/gqNLsh9HicyXp0+SVVuN5M
	haSlYcwS0ev0efdJA6pSJg0gq4vLMiLlrnu1G1CH6aq6u3qu2HUvFKlEWBSzd6en
	QBTMY6W/PZMGkL8ocvoXEDdDWPyWlGaMff7ZG8F3eADLbeX3lY0gKtH4YLxeC/PR
	YUXATv/e+S22chZ0hTo4DfohtCfOTbhj4ZWI8FP7QQ8Iwoooeqi7WT/h4+e8XjWG
	3uKhmquZcGZSYaYensGfw9rXJl717qeZKgRrVyfCXwwrBMSZ3r7moPLFRaY/UEVG
	zyA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qk+IM3DLHYGiA00opPW3/OfLKt5XNOS0voGkrnZnDePm1mFUOxtpFZ9utrjp+71YEe1RfPSk6Wyb7jQSDc9Cm9iRfWivCxF2xUhNY53mkp6pmGJN2JjwpGRqWRcqXfR6bZjH7Vg2L7PdTiiWtuHzdXGDI60Ng12ZsTDVnjWuYYqfZf8TS7a4sTFWIW55RJjeyAmTI0y6+HCj7MGbFefVPaJIViu2XKFFVnWW8YEFtpwTTQBq3U3+SkYCXJm3f6zXBigiQ/SpJGrT7gHge+PKJ6U/b6XcT6+HxKfUP6JGKJc8Og0LOaWOPsYcHOCYpu0AdZERi9lJ0GVvlXe+GCKgpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UnFVM1D32Q8PVzU9oZlOxLlg1sYnLTK8jp9jrh0Jn4Y=;
 b=WT9gSu6eRmP5lypwNONvIoGevIyWoab+h24iU72lA3lA8b/lwQTaWkflWouqTFY/XosVSJeMJGheiVPPpp8UdjsbNONX8j/kIpWBhev3KEEIIP5Zw1BiFdozvQ6a3R28wsASswXMaUJZ78N6ZkoSRaDVT7d/iEjELRlWwJn69qFNnrnhhSLpMvdwj2mzunBaexLNLEFQy8IfsgXiYogyASJgXPLs9IhegmFPOg66l8liRkw9DeomgvO0b0kIEhuh5mhmAGK6zWuydFKbqhVLjsKGZlREJbOLqf8VRx8GPnDKJ24qbuwttvhkF7l12FRRMwALAdM4p27jdNag3H+xvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UnFVM1D32Q8PVzU9oZlOxLlg1sYnLTK8jp9jrh0Jn4Y=;
 b=AbpBsRMV0hYrfS8NqJyesf48bbQfTCmoSVYuUqP7/j+15UC/OCCIJJPwUhz/C2MPsXIKpy+p3iVpauwW87d2awwdJGED1bH8yoe5C45E85BA57mP9QWrxwmioPwEyWi9ROTPR1BfxhKIMzm33lRS70tkk3qjAcRRgMXL6gCgbh8=
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
	ppserprodsaar; bh=UnFVM1D32Q8PVzU9oZlOxLlg1sYnLTK8jp9jrh0Jn4Y=; b=
	BOq1Yb6ptAIG+gnm6XL1IMtAYZC4u3Bim2AExV9G3vXDColQaTGs441u56riVzBg
	f3NcUHxVilNxPSWIXHG6RWAarZ9xaE86LtRye3N5z4Ub30by0/Migi0/r8Mo8zh2
	ajh7HVHxaiWdIw9dF93cDbVGE4ZaCPxZqG0nrvsgkJtvz5UWYXQOaV0BwmL8h/Yy
	ybR+Oqr7AYDUZTOtc+N7d0Uy6lmiohPLiZ/CsmVRCpLsJ9AkBTrxL7hAQKSYqLaX
	BYlUkoZxmPTFZQG8MpzfPSWYFyy7Qb8WYHGnZ/YwqJINWUgVTTq5Nj2b/OiNUqMS
	HwM5xiEa/iG44ZNKt+AnTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=UnFVM1D
	32Q8PVzU9oZlOxLlg1sYnLTK8jp9jrh0Jn4Y=; b=CYWSoEaXv6AkQV8ZqfQBNCZ
	k7WErDch4E+okcrFFuXC8OGVBxIYgczOx6aREEaQ+YS5ku23xWOstPhezXcwCiaj
	882mhRi0gCWl3HZMdzLjjJeEZLgn8AZaI3yWg0iXgNF2llshxGeg4Le0Ice1PM0C
	iilFJFG36S+nGt11mS7PJ2aN0YGuRrGkJbwAiG4LJsI7PhrsRTxqzAtzODVvpc13
	G8Qc+0teKAIBupqp80NneXuPK4b6/dmj00QPBTW4tQC1NXgonGfAKtr9y5QYxDY2
	JzmxNhu4mD5eLvaLYPsuDujHaI+Y/mEuT4mw/iGggjg90sUMC7tal+Y43+dH7AA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmMyxjRSdf5COOmMzxlLKX
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
        roger@xenproject.org, teddy.astie@vates.tech, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 07/28] x86/hvm: avic: add VMCB state initialization
Date: Wed,  4 Nov 2026 17:33:24 -0800
Message-ID: <20261105013347.719392-8-dmukhin@ford.com>
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
X-MS-TrafficTypeDiagnostic: PH3PEPF0005961D:EE_|MW4PR16MB5087:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1df2eed9-27af-495a-854e-08df3adcee59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|261009223027099003|261021121427099003|261021123027099003|11063799006|56012099006|261102123227099003|261022075727099003|261026140227099003|261022105027099003|261026121527099003|261028144727099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	url9H1lcwI83DpUkLbesMo6R/4ZsxSSmBpzDEQhT72M3GddXUA75ov3IiEx/SHP/JNuY3yfJULV032Hnvk0KXg+pEFcSHDCcABuSd4TXXFSm0agfGXXP9Dkzjkviqo9xleDkzqZTgxcPVlJc8KBH4wYpf7A8Qt3To8JM4f33pQ7P+hiw4GfVMBFk5o8gRrvlMeaqcEWu5DbmfO7Z36ZYNzBiADVO7BakGoQ1DLV60GcKVQLUWGIgdxSboWxvJo+0ZkMIb2w64eVtVnRQO5IMotOhYF1k1DuKOV6KUrrpaL3nLJ2pzjWYJGDiUjEnO5iZsYh2DbcRVVkKBrtUpQ10Rl5Q/OqoIWOHYXxRGUWVfps2sfBk2hp0K4ZAVfgUoBnRJ19ZqGbrj+HjrTZYr2lOKBsSdGE0LytJGXPVgg49hVpB/Z7GTktKZu+Sp2uAukgMkz8BMzdCjgzJBg2vkQOjjeQqidJnnNe5GwVgKReELEZp2k6MAMyjjl0ZIsqzkkeg/CIrd7+tGkJVHcocEgFwTteRSflO0sJ0MHh+Fe31+7Wn9u2koUr/8oNoiCFLrzQt1KIjFLGbwM36/m17tZNSwV+XlNLoariDUQORTza3e4OVtJnXZTvv6VM62++QVnn4rzV6kez1er292+2lkTe1dJt+Lc8fXNsj84aVz0HEGquviqyxl3iuxNXt7Zn1tG/7TDNqOGVEG9jgnJhDEKZYyg==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(261009223027099003)(261021121427099003)(261021123027099003)(11063799006)(56012099006)(261102123227099003)(261022075727099003)(261026140227099003)(261022105027099003)(261026121527099003)(261028144727099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zNqdHCnoWprRZ99eOK2AISB6i8gx/q/piUykbQNBTW7PTX9352NBcBQlRni3qBKbV/WxAgsC6URsxh9c+jsCDKQC8TZ2glcCbtRmDVOGlv+b0j8xvEXEF3wLi032zcFXtWljkEveC7/Gogy83wfeVkk8YQhS3KgPFOnEqmkqjS6XX85wW+v5rvNOqRMZm3Ka5Tyxc+pvu/36u963ctz3nlsXluX9gnwj6Ux5o+wbvJYuZ5694joCRu9l2P2eWiyk0tRWlMm6rR95wP05IwGuOdN7deolY1Mz8aElESHyv5izqQXogoKgmyASkALXhVCt6qqqFLtmroj71wh95FZ5D42mtz0wzyaKvC4tUKqK8kXcTqq31JMPgK+mk6JihEPfbU3V5n9nMxIDdGywpmahBD1SV7T0svbPi+d8khaAKYYilK6fTte95NSxXhwzXcMP
X-Exchange-RoutingPolicyChecked:
	CQIvjwWCwe3UTu3zkEO9lMnk4BQb2oh9rx9Khu9Eq7BISlTenlzplfCvqvBBj7efMjkB2KDB9S11SLjcxWfJ8Ugu/og/8QZAopJxsHy7pA32xBCJTAPae9ETDqCasJh9DNPGnijkXMJQ7Fpvwxcf8ThQXa49xiwc6bBOcU8EMC25TucaIS+9wkxwA2rjCHEWEhqPffvD1w6gg4JJ3oCqCYi5crHfrJLK0aS4JzPBErcRHQ5oo3N7RgkRcnUITkwvA3o7lWJdg54UHN7q6DlzCWvcG/cOebST6WhECiO6LoPE5IANYbS9cuseeSUoTk8pm1V21ZoTs0TzTc7r/qZSpw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/6F/wv8B4AnKh3+cTcWqODzwHgycO/RuJXVzp2SkwXeYDEPl3mNtl6YYpBNoV3bk1MRmv+hnfcOmCTJXNXlEbD4OnwM7jcrsU3EHIb2bnqgcmx0cXWilgNFAwXwy2GAQuev3fejF9V6IQkLYYH4JsQI6DnOox04zYYelk67Lk5/ec/rT++Tr8+Z+zvcNwFVURkiTnTVzpoDODLJOoPtMyxDUTUSkPNvSKpQIRC3PL4r55U5g7BTSIE75ajWzefOFhjCXg1+qwSisVvL56AmgMiLBwxGVn7UY9t/dgYn4gDevd+mHa2BxIXGLcnQWt3zH6X3Qt9RZTp2qH6WPKZ5Jp39QB5MIo7wU6kN9a08+I9ECLUAzlCJ4mI43mLylaZIYzGk+Y1GgwJC1gai24YmEEy+2eQpc3pdmFwsz6agmJdMiU9bhlFmCWzydnSDQmsO+HybBXyGJbbnDxKmauJQYhfrwrfMaJJElFGQMSwydZzAlIW7rsl4JYtGE1LkeYpf9NQaylNksnKALkpBaN6bzJYiL4qXEnp8/YnUOp0lIf9F8eck6x/c9l+3Uk3oBNFZpK3YjbGvV7wFGfFYQSLDfMAzZSJdj8v/5gpxPVfq8aunqVb+FvQMmdM6mHsyracWGVy9t+5rjf2eCzqQPtCZXMQ==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:34:27.5000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1df2eed9-27af-495a-854e-08df3adcee59
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH3PEPF0005961D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR16MB5087
X-Proofpoint-GUID: g2kYAiWPnxTJAPWSgBuC-gghkGGePTZK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfXzQ+/cGirvAxX
 jJonAOG2I6ILL3m4MiK8l1/UAHzyae2BDo8WJpAz7lOBIZ+Et+g8m7iKkwkzOcV8V+f4q96FVFA
 EtQ0BnwBKoVhi8JQUxdDaTJ9egs+T9BWe96vYRBcV1dgdm3M0GmsDL0eIvZVeFN/6yuiwktXQDZ
 MaQ5jtIDCrS2UaaRPgr2GsWECNNUS6ts7bMux8Nh2GuTSAcEPpoYerOtlWCis1vfu203tOBFv+/
 ph8+S8aQyksdAKa9Qb+UZZfFu1UfkkWK24L0uCeX45W47SKWpp3tWHXHlYsOdMi5wjnFDCf39qK
 wcSyv+MmMK2yyT+izvigWk93rPl0t+jv6VMNAzZpD3xg8HeYKdQ2y3bKfK14p7IndjoXoWwU1gj
 M3NYNQBBcp+T3IUMoQ3SLEyYiqmu1std7e8rsdw9/jr0CYt0uKD24VdmNAuozEPS2R08C4wvTdH
 vjFuzetwAGBMvtlBa6w==
X-Authority-Analysis: v=2.4 cv=T7AZ3PKQ c=1 sm=1 tr=0 ts=6aebdd6c cx=c_pps
 a=v5NpUkBk8u87wj8Ets5Xkg==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=N9_n2FxmZfwfyRXvS9-E:22 a=cbNQJ9GKAAAA:8
 a=uumIENlhXCaLf2fO76MA:9 a=DqJYxgmhk6moR-_7_KoZ:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-ORIG-GUID: g2kYAiWPnxTJAPWSgBuC-gghkGGePTZK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfXyda6KKswhthO
 1jxJwJ48jXdvTIaK9zscI+nTCNjBCrjVgwQWgMfcF29QyFdLxJ4T5Eh0cNYgdUnPQF26xgJv9s4
 bqR9NmSTSQ4LDgE+fBzYFK4JfnfWNf+L2WfbHV+r8rDluh8DObqK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050005
X-purgate-ID: tlsNG-bad1c0/1793842542-FCC15034-A7E6F79C/0/0
X-purgate-type: clean
X-purgate-size: 8087
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Update SVM VMCB with AVIC-related data types as per [1].

Install AVIC backing page and logical/physical APIC ID tables mappings
into VMCB.

Set VMCB 'avic_enable' bit to 1 in case of successful initialization.

[1] AMD APM Volumes 1-5 "15.29 Advanced Virtual Interrupt Controller".
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/hvm/svm/avic.c | 110 ++++++++++++++++++++++++++++++++++++
 xen/arch/x86/hvm/svm/avic.h |   3 +
 xen/arch/x86/hvm/svm/vmcb.c |   7 +++
 xen/arch/x86/hvm/svm/vmcb.h |  19 +++++--
 4 files changed, 135 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/avic.c b/xen/arch/x86/hvm/svm/avic.c
index 2c0e113ae34e..bc98661a7057 100644
--- a/xen/arch/x86/hvm/svm/avic.c
+++ b/xen/arch/x86/hvm/svm/avic.c
@@ -9,6 +9,16 @@
 #include <xen/param.h>
 
 #include "avic.h"
+#include "vmcb.h"
+
+#define AVIC_PHYSICAL_ID_ENTRY_BACKING_PAGE_MASK        GENMASK_ULL(51, 12U)
+#define AVIC_PHYSICAL_ID_TABLE_SIZE_MASK                (0xFFULL)
+
+/*
+ * For AVIC, the max index allowed for physical APIC ID table is 0xfe (254), as
+ * 0xff is a broadcast to all CPUs, i.e. can't be targeted individually.
+ */
+#define AVIC_MAX_PHYSICAL_ID                            (0xFEU)
 
 bool __read_mostly svm_avic_enable;
 
@@ -125,6 +135,106 @@ void svm_avic_domain_relinquish_resources(struct domain *d)
     }
 }
 
+static bool avic_vcpu_supported(struct vcpu *v)
+{
+    struct domain *d = v->domain;
+    unsigned int id;
+
+    if ( !svm_avic_enable || !has_vlapic(d) )
+        return false;
+
+    if ( d->max_vcpus * 2 >= AVIC_PHYSICAL_ID_TABLE_SIZE_MASK )
+    {
+        gprintk(XENLOG_WARNING,
+                "%pv: AVIC: unsupported domain max_vcpus %u\n",
+                v, d->max_vcpus);
+        return false;
+    }
+
+    id = GET_xAPIC_ID(vlapic_reg_read(v, APIC_ID));
+    if ( id > AVIC_MAX_PHYSICAL_ID )
+    {
+        gprintk(XENLOG_WARNING,
+                "%pv: AVIC: unsupported APIC ID %u\n",
+                v, id);
+        return false;
+    }
+
+    return true;
+}
+
+static void avic_vcpu_enable(const struct vcpu *v, bool enable)
+{
+    const struct svm_vcpu *sv = &v->arch.hvm.svm;
+    struct vmcb_struct *vmcb = sv->vmcb;
+
+    vmcb->_vintr.fields.x2avic_enable = 0;
+    vmcb->_vintr.fields.avic_enable = enable;
+    vmcb->cleanbits.avic = 0;
+
+    printk(XENLOG_INFO
+           "%pv: AVIC: %s: apic_id=%#x avic_physical_id=%#"PRIx64" max_vcpus=%u\n",
+           v,
+           enable ? "enable" : "disable",
+           GET_xAPIC_ID(vlapic_reg_read(v, APIC_ID)),
+           sv->avic_physical_id ? ACCESS_ONCE(*sv->avic_physical_id) :
+                                  0xDEADDEADUL,
+           v->domain->max_vcpus);
+}
+
+int svm_avic_vmcb_create(struct vcpu *v)
+{
+    struct domain *d = v->domain;
+    struct svm_domain *sd = &d->arch.hvm.svm;
+    struct svm_vcpu *sv = &v->arch.hvm.svm;
+    struct vmcb_struct *vmcb = sv->vmcb;
+    const struct vlapic *vlapic = vcpu_vlapic(v);
+    mfn_t mfn;
+    uint64_t entry;
+    unsigned int id;
+
+    if ( !avic_vcpu_supported(v) )
+        return 0;
+
+    vmcb->avic_vapic_bar = APIC_DEFAULT_PHYS_BASE;
+    vmcb->avic_backing_page = page_to_maddr(vlapic->regs_page);
+
+    mfn = domain_page_map_to_mfn(sd->avic_logical_id_table);
+    vmcb->avic_logical_id_table = mfn_to_maddr(mfn);
+
+    mfn = domain_page_map_to_mfn(sd->avic_physical_id_table);
+    vmcb->avic_physical_id_table = mfn_to_maddr(mfn);
+    vmcb->avic_physical_id_table |= (d->max_vcpus * 2) &
+                                    AVIC_PHYSICAL_ID_TABLE_SIZE_MASK;
+
+    id = GET_xAPIC_ID(vlapic_reg_read(v, APIC_ID));
+
+    sv->avic_physical_id = &sd->avic_physical_id_table[id];
+
+    entry = vmcb->avic_backing_page & AVIC_PHYSICAL_ID_ENTRY_BACKING_PAGE_MASK;
+    entry |= AVIC_PHYSICAL_ID_ENTRY_VALID_MASK;
+
+    ACCESS_ONCE(*sv->avic_physical_id) = entry;
+
+    avic_vcpu_enable(v, true);
+
+    return 0;
+}
+
+void svm_avic_vmcb_destroy(struct vcpu *v)
+{
+    struct svm_vcpu *sv = &v->arch.hvm.svm;
+    struct vmcb_struct *vmcb = sv->vmcb;
+
+    if ( svm_avic_vcpu_enabled(v) )
+        avic_vcpu_enable(v, false);
+
+    vmcb->avic_physical_id_table = 0;
+    vmcb->avic_logical_id_table = 0;
+    vmcb->avic_backing_page = 0;
+    vmcb->avic_vapic_bar = 0;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/hvm/svm/avic.h b/xen/arch/x86/hvm/svm/avic.h
index 3da62f59b0cf..1084ae683944 100644
--- a/xen/arch/x86/hvm/svm/avic.h
+++ b/xen/arch/x86/hvm/svm/avic.h
@@ -11,4 +11,7 @@ extern bool svm_avic_enable;
 int svm_avic_domain_initialise(struct domain *d);
 void svm_avic_domain_relinquish_resources(struct domain *d);
 
+int svm_avic_vmcb_create(struct vcpu *v);
+void svm_avic_vmcb_destroy(struct vcpu *v);
+
 #endif /* __SVM_AVIC_H__ */
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index 3ec5bdddf588..c4282bfd6c6e 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -20,6 +20,7 @@
 #include <asm/p2m.h>
 #include <asm/spec_ctrl.h>
 
+#include "avic.h"
 #include "svm.h"
 #include "vmcb.h"
 
@@ -215,6 +216,10 @@ int svm_create_vmcb(struct vcpu *v)
     if ( rc )
         return rc;
 
+    rc = svm_avic_vmcb_create(v);
+    if ( rc )
+        return rc;
+
     paddr = virt_to_maddr(nv->nv_n1vmcx);
     nv->nv_n1vmcx_pa = paddr;
     svm->vmcb_pa = paddr;
@@ -227,6 +232,8 @@ void svm_destroy_vmcb(struct vcpu *v)
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
     struct svm_vcpu *svm = &v->arch.hvm.svm;
 
+    svm_avic_vmcb_destroy(v);
+
     if ( nv->nv_n1vmcx != NULL )
         free_vmcb(nv->nv_n1vmcx);
 
diff --git a/xen/arch/x86/hvm/svm/vmcb.h b/xen/arch/x86/hvm/svm/vmcb.h
index 8b351679fac5..1ee5da053a9a 100644
--- a/xen/arch/x86/hvm/svm/vmcb.h
+++ b/xen/arch/x86/hvm/svm/vmcb.h
@@ -346,7 +346,9 @@ typedef union
         u64 intr_masking: 1;
         u64 vgif_enable:  1;
         u64 vnmi_enable:  1;
-        u64 :             5;
+        u64 rsvd2:        3;
+        u64 x2avic_enable:1;
+        u64 avic_enable:  1;  /* bit 31 */
         u64 vector:       8;
         u64 rsvd3:       24;
     } fields;
@@ -362,6 +364,10 @@ typedef union
     uint64_t raw;
 } virt_ext_t;
 
+/*
+ * AMD64 Achitecture's Programmer's Manual, Volume 2
+ * 15.15.3 VMCB Clean Field
+ */
 typedef union
 {
     struct {
@@ -377,7 +383,7 @@ typedef union
         bool seg:1;        /* 8:  cs, ds, es, ss, cpl */
         bool cr2:1;        /* 9:  cr2 */
         bool lbr:1;        /* 10: debugctlmsr, last{branch,int}{to,from}ip */
-        bool :1;
+        bool avic:1;       /* 11: AVIC */
         bool cet:1;        /* 12: msr_s_set, ssp, msr_isst */
     };
     uint32_t raw;
@@ -469,7 +475,8 @@ struct vmcb_struct {
         };
         uint64_t _np_ctrl;
     };
-    uint64_t res08[2];
+    uint64_t avic_vapic_bar;    /* offset 0x98 */
+    uint64_t res08;             /* offset 0xA0 */
     intinfo_t event_inj;        /* offset 0xA8 */
     uint64_t _h_cr3;            /* offset 0xB0 - cleanbit 4 */
     virt_ext_t virt_ext;        /* offset 0xB8 */
@@ -478,7 +485,11 @@ struct vmcb_struct {
     uint64_t nextrip;           /* offset 0xC8 */
     uint8_t  guest_ins_len;     /* offset 0xD0 */
     uint8_t  guest_ins[15];     /* offset 0xD1 */
-    uint64_t res10a[8];         /* offset 0xE0 */
+    uint64_t avic_backing_page;      /* offset 0xE0 */
+    uint64_t res09a;                 /* offset 0xE8 */
+    uint64_t avic_logical_id_table;  /* offset 0xF0 */
+    uint64_t avic_physical_id_table; /* offset 0xF8 */
+    uint64_t res10a[4];         /* offset 0x100 pad to save area */
     uint16_t bus_lock_count;    /* offset 0x120 */
     uint16_t res10b[3];         /* offset 0x122 */
     uint64_t res10c[91];        /* offset 0x128 pad to save area */
-- 
2.55.0


