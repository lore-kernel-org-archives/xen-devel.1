Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893AF606A326
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=sUQuy3GK;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=Fpf9hdPO;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=mHyEQT9S;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=JcHyDcEf
Received: from list by lists.xenproject.org with outflank-mailman.1473258.1680952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmNs-0002es-Ej; Thu, 05 Nov 2026 01:35:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473258.1680952; Thu, 05 Nov 2026 01:35:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmNs-0002cV-3b; Thu, 05 Nov 2026 01:35:20 +0000
Received: by outflank-mailman (input) for mailman id 1473258;
 Thu, 05 Nov 2026 01:35:18 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmNq-0002Dp-0V
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:35:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmNp-00G6d6-Cn
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:35:17 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd50-8faa-0a2a0a5109dd-0a2a450ba0fe-4
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:35:17 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd53-b7e8-0a2a450b0019-94a39217e386-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:35:17 +0100
Received: from pps.filterd (m0367124.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mYQp1469774
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:35:15 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com
 (mail-westus3azon11012034.outbound.protection.outlook.com [40.107.209.34])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4hrdk511mb-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:35:14 +0000 (GMT)
Received: from BN9PR03CA0450.namprd03.prod.outlook.com (2603:10b6:408:113::35)
 by SA1PR16MB6977.namprd16.prod.outlook.com (2603:10b6:806:4b8::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:35:12 +0000
Received: from BN2PEPF0000A993.namprd04.prod.outlook.com
 (2603:10b6:408:113:cafe::8e) by BN9PR03CA0450.outlook.office365.com
 (2603:10b6:408:113::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:35:11 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 BN2PEPF0000A993.mail.protection.outlook.com (10.167.248.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:35:11 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mwLw3092205
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:35:11 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4hnycbnhgy-4
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:35:10 -0500 (EST)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id OmNhxcKituKemOmNixhKUC; Thu, 05 Nov 2026 01:35:10 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=TYM
	ocsRux56pcfeS2Q+gOlkmmV23pRJGzYNFKN2hxR8=; b=sUQuy3GK29cevPDL67O
	gnIVxWqvWwNqb+BBCvFQomEay1p+YVsqw2lmJXAGvjmWYtvTyEL8h11MWGOk4Aw5
	EdWpqOMprB3CvnPrAorfvql/L4qWdcj3MgS73ZF9OUI+bN+MByXDd9tKhhIviQyQ
	KB1KPaeMROlZm4EM5YnuafbE0fDsotiTrQLbZ7Xhl2OnFuTn90juUFuzXybDV04E
	EYf9he1HxWvyp6DhUaElpoaA5U0d84xXeoQqpj68XzpkZ+m9CYjkvrBYxLhkVq29
	6rmK/a252AYjzjI/xUkz+lqM7HBodCwtZiE+ionSxzddTY6fjs1X4HyyOYdq+ndn
	8EA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g2UG5NCll6yirxJNEgOtM9c30RRgGZmruJEAgDpLIH7exQKSvTo0dmZoxwAbPqMrzz3DTQYfidyHEdkO3SrBVPT20GxmJJkDgXz5x2s4IwzZr5DvrPHkO2NER1QclPTBxj86oApM3Q3iRBWBGUS2aGtGEYD2OAwxkC+fqUX1P1Aish4Yyi7QobgmAQJkSnb6DfCp5+V4t9SapsymvZ+UsqnwXaoVMMSYnPhRKEWhfWOXlIufa0Sl2wA3UHWM2nEOUGyPnvkswV050iqh/9kbdCHjocfM7szKEWppxCcsxgwc+iRqMeMX3yiSEQ3R7hto99DKsvPyVRX+ajtPBZ8PpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TYMocsRux56pcfeS2Q+gOlkmmV23pRJGzYNFKN2hxR8=;
 b=fkwjDicHCakl0KfVBW1f6gg03iknaIbjdvblPgBP56wy8RbCcjmrqSAK99Vr/Umx6+8KB0u3fRFopgJRwMOcUheGgptR/Cc1YkHWcfNZSZGaVuDyqqUZuleAvfGODrLEMWffqDzrMyOF+dA+ymeTDEA0jgj9+RTmvzbZBdM9g6MlLgX6mevgDx3y1GV5lRG/qnfBcb0tKAorChonME+yYi/qdSiMKUms0QQSI0M2K+CVBlCaMqf8xqer4esKTIlBkPNYcQKgzo+BbRSIGMGyXKYPXJZ5dKgtxY3htFkp5F2qxBPfyig3pbz0eWSi5TVTVS+x+xvsMRAroVB6AyNpAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TYMocsRux56pcfeS2Q+gOlkmmV23pRJGzYNFKN2hxR8=;
 b=Fpf9hdPOz72/qi4rMeQsQD24rYcKhkMe5SlbZabcC/5VWkNH0OZ6mV9yQW5x9Ym/RnkZtcD7h3parwDRyoppVvvU2wK4Evku3Oh8p+R6EWUG1OHAFRNJpwRzAdXW60R6Mh54ybp1LllL3G/jpKLhU2/i86rzqElRZxyQGLq/JeA=
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
	ppserprodsaar; bh=TYMocsRux56pcfeS2Q+gOlkmmV23pRJGzYNFKN2hxR8=; b=
	mHyEQT9SuKOFDv8d4iFVZ7WMyw/DVwehh0AiPgfwAsHqP0RALIta8wTSWBAesMY5
	XWvHcbHvRppMtrQMMzeHtkBVBFmp1OjEo4tv7QMb8aHVlzh7RY5c+l2P9gVROhNS
	fFIt9tjzjWjPtt8XKYoignd4N9GeMlcRUoOHn8oS7w04h4TU75HzbqfaxNXGiWvL
	AazzWUOw5CD3L22GQBPMwzP2Kfc0VR6TLZh3TKoaQctqzs7sqq9tnacq+j3hDjrM
	U0gnR7/qcX/PXEhC3yBdw885ouzmfFC27qKnT9NzEAxkOnI65KRN7cB2kZxVc4wm
	R7kRhU/hz239bYkCiLk9Jg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=TYMocsR
	ux56pcfeS2Q+gOlkmmV23pRJGzYNFKN2hxR8=; b=JcHyDcEfqtr/lr6dvf32bEh
	BXcVkqMxhg408gjuHzdZbfqplFNlktDbEo6jVGRTvj3x2UZ7k+0omdhp1/gcBMeN
	53DrTGfPXjD0oOuX25EI9DAhph4umXQU5rLJEctuGUrDx0zNIsOKnNv44szGl0wN
	nVME7li6kCvtOmBaPg2rY/VlpSxLHWXxpxVPqvqIHjZEsAQN8HwdjF+GVYQv7+RF
	wC+vlMXxw9OOpUvXWfKmlut7e77sy/PJ0mTRaCikhISbfPV2vsztT/WbucGkJ3r/
	XZN9N4AHizUqZBaFfwcKoXM9PtDLAFS6AM+Q0g+74wmE4mon0A0PTQV0MHLOs8A=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmNhxcKituKemOmNixhKUC
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
        roger@xenproject.org, teddy.astie@vates.tech, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 26/28] docs: add coverage for svm_avic=
Date: Wed,  4 Nov 2026 17:33:43 -0800
Message-ID: <20261105013347.719392-27-dmukhin@ford.com>
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
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050005
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A993:EE_|SA1PR16MB6977:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3fdce89e-044e-4e4e-9dc5-08df3add08c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|6133799003|10067099003|18002099003|22082099003|3023799007|11063799006|261022105027099003|261028144727099003|261026140227099003|261026121527099003|261022075727099003|261102123227099003|261021121427099003|261021123027099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	zOs7gQT4W/CnsfJkGXlPIferq2atQQzdr0Smku1dAeml8JxH0A4WyQmTsq0PLZiB8lbe708HL5zT5nHpwptSunx5n8elTkN81s12ohppHtNRHMzviIXFTvP5a0+GuNIHACr1nzV/YZrt/bDV1Jd6534mJongiMcGceEiF1daPLrfcL8pqCrqRTHZInqu+uOzjpah4saOqWMNlJHu2eqPl5KNhmB822wDY1YnOGXQAHtioxOsMvpRYyZyAB8TaqxgllyMJIHGeNDV3W+8NNxaXuZk2tbLCXQYKNFcQwepsUAilUHhCOjJ/qGVYZVMqwCTDziYVUNnKF/nfThziMFWqlPLDuApLBeF8eeAUArY2Be1YbIariDLB/951fXNZFd5S4YeCipO72ZGGw9V0Icgbn0eU1NOFNZLtLKNVtwz19Vvut5NOxYU9j+jhKGDyiCXnhKTTtvGbmSARRW53YESPh+XoptmV5Ko8AXsaXZzA79oGMiVPnXYvbqeFHSxlbKYE6ZjIgtp7R6ghfAmk35ecRiwO7Fbh3DqgbID6ecc7G39xOex2z5jm4oBT8i5ns/fAQg/wXbBTCTxbJ9C8O26PS2q581b6nJNFkka0OFamg4Xky1h6X20jMpnB2/S1naKFb4/rSWiBQAacSMOZ/S6noN1xoeM9aLXebowJdvdqyxoplOovN3jO0sMR7PdQ8f7QUh0oolv/yws7MXn4qwpFg==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(6133799003)(10067099003)(18002099003)(22082099003)(3023799007)(11063799006)(261022105027099003)(261028144727099003)(261026140227099003)(261026121527099003)(261022075727099003)(261102123227099003)(261021121427099003)(261021123027099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cuyzh4pyNokuNW80DS5c1z7YO22t5cfbJ7SzEDb60ThpIzBIQqCz9ImxmClt073C7EuGQvNzxkXooayZnAz5FC9Dlhqupea40Hz4V63YeeaapBVqVM4EpFjuDb5tzMwSLpfshbs/5nc0S06mGvjXPRUWo+cTFd1I2D4bcCzK1S1Cihi94tuLip1lfMF0YBACDSMc7R1yFyy5tBFcQb+RiH86BxL1yeXD/eLqctWgppLqBQxN77AewZWmiYTozTAaID8jPPq1zIel93xpRoHcCD/1vxdkWqNBkUR0mZYmZ/FhCn4jObjov53vLap2NAvNW8z6XBc8Iqb9AWB+Oc5WjiDXGLua+TcQEJX3LB70nHPQcYwAXO99hSDTaWQ3N/9j3QmKI8CQXGU0ulaY0CqbWTDeaOrlZGbTlK7ZdA8/uMEOdz/a9To4rX0pCx+UGTFY
X-Exchange-RoutingPolicyChecked:
	tgBKwPw86KhenSzjJOs21bPDItBdJzX/iAUNnskxq+071FhLNJ28EgvxdUERmdkG4Lb2k9gbzPyX3/e9oO/ZILwym31shWFUf2alqrPv4Bs1BQ8fuQe43i2UUZEKdpKesoXPiyYdc+FpwNUdTV7JSb8cTwXyslU4MWs99rKK0DumR61lIb6CindzUEIwkJ8kWkR/9K1+aA1HLAHKqELMlXJ7vrUtFSTRV+HCgwLJbUBeV41NFOhulu3l58ylNX9TjvTk+FiNoWr5K60zN7ggwPsa2/4p5gebgGRx62pyqtqmLQRjQkUUGgcpAHKNZSHFIGHwXT6KaI5AcnxugeVryQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WFwJyY9yYgoVmtC8SyZD+YKBqAqFKRzUNL5q+zhV2i6oNKgcAHWQtNNn1wnEG3xez+iwL2aYLWLUfDFqP9ti4FB9IZ3+co3jLYfAT54Hls26Q1nzhyUTFM69QyO4fBsMxlK4FrleW266tvFi/Y9yRotFxQB2g1bhyx2v6am2Te6/r+6rw4sQrocHZHW5vZ/oTpzjnMR44mlrd94hAgsrgLzSes1DVsfQQiq79p5iJ204+CEgPk2vEuyMd3YVUWE+/pU88Ia9FWFjNnVqNchhr1Fv3p5JKfTHmQcL4caY/OrFac8GnDR3Fuv48tIaPCi9WLGxeb9gxlAb0fusmi0eXen31Yl/Q9cgdeGeQZR8UF1MR6eCoVhrFN8k1zaPtg5yjP+lOyXHYP89ugjR+TvN4JFyiB6UMTBx6YGiFz9h5K+Rf10Tot4rBqJcI0g5Mhs3NWYQbLR1C3KZkD5cg+QjqNKnJ7WCw0yfTA3nHSiG4hDC+AFMlCynmxVo2nw0q5HGNwBU4Ul7kWOBud+yW5h0jde3i6CLfndt+r/Kr3xrb/cfZDLgjFlnSfnLoZMYEiYNYwsH2PWwxRQ/izY+elRTAUSW8AMX2CnCGNaSg9cNVWbDEamR3ZnPjOm3aR6Uco+JsSJnr0qqAmqpFwrKkwiD2A==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:35:11.7977
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fdce89e-044e-4e4e-9dc5-08df3add08c1
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A993.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR16MB6977
X-Proofpoint-GUID: M1cMgPAUFa5vT9rngEbpFatR1TjZs_hg
X-Proofpoint-ORIG-GUID: M1cMgPAUFa5vT9rngEbpFatR1TjZs_hg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfXwIiqHXj+2Iw/
 O7dOil0WJkPL1yQxUgy1kVDAkHktTDCny64pw3wmK500OGDacJI4xKvuKVdh7ZsPirZSkQZs2Np
 MsG6zSu1N+OeGfjfvo+WgqPXA7fjthYXY6UUJv+ElIottDJnSN/J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfX5+Uc23RnQA4P
 RmPv15nfKc7s7Pk4iVx5Q6DuYD7Yb12lZximyLgb2zPr6l4Z0xNwDMN6JfqDByyiDnfPqjLKPU/
 dVYdvGtiIw/Ghm6CNBxY1rYYovJuX1N4Y6StUvuqTEGUnU3oemYM7Kbg9NKT//jfnsDVb+B3sUn
 VM3OuYRpaL3W24Pn+JSvp3JgZAU8f+boVI29FdwRFIte6Ou4Tequ1KKRtAvi1GJlD800skPZUGY
 F3vJR+NAFp7Vc8kfv52VXlV+eHHv6pThhe8KWZQvOLV6t5XB8b8phVRrYdHuPrMZ4npW2MLCnuf
 JFxrb8raQVyOK2Sqc8lAccBn8AMWG1/WI1oxr7fhEsyiygcVtY3ev73J1BUrFbExyKmjztcgH6o
 zc6dnX4k9gwqDV7/bA3db2eEQO2CXL6EmGcEwIXEpXmvI9+m9uwB7w0jbaFreAkRxvJ2Lab8tv8
 TOjoHORTMGxvpUjVdmw==
X-Authority-Analysis: v=2.4 cv=BOImP1QG c=1 sm=1 tr=0 ts=6aebdd52 cx=c_pps
 a=p5SqRtR3VJW1kgksvcX22A==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=YJXg7OVxOWrJwj3yZo-i:22 a=cbNQJ9GKAAAA:8
 a=An-mqNOh_l-qzLSVOUUA:9 a=3whSkbs7g9Me0DR5EJEX:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050005
X-purgate-ID: tlsNG-42698a/1793842517-AB8D19EA-42F95C9E/0/0
X-purgate-type: clean
X-purgate-size: 2133
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Document new command line switch to enable/disable SVM AVIC driver
in the hypervisor.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 docs/misc/xen-command-line.pandoc | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index a6f08463d177..e810f8836fe7 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1623,7 +1623,7 @@ boolean (e.g. `iommu=no`) can override this and leave the IOMMUs disabled.
     This option depends on `intremap`, and is disabled by default due to some
     corner cases in the implementation which have yet to be resolved.
 
-    This option is only valid on x86, and only builds of Xen with HVM support.
+    This option is only valid on Intel x86, and only builds of Xen with HVM support.
 
 *   The `crash-disable` boolean controls disabling IOMMU functionality (DMAR/IR/QI)
     before switching to a crash kernel. This option is inactive by default and
@@ -2673,6 +2673,27 @@ On Sappire and Emerald Rapids CPUs with May 2025 microcode or later, the
 `ibpb-alt=` option can be used to switch to the alternative mitigation for
 Intel SA-00982.  Intel suggest that some workloads will benefit from this.
 
+### svm_avic (x86)
+> `= true | false | nodoorbell`
+
+This option configures Advanced Virtual Interrupt Controller (AVIC), which
+is an extension of AMD Secure Virtual Machine (SVM) to virtualize local APIC
+for guest VM.
+
+This parameter is experimental and for expert configuration only.
+
+Xen has mitigatations for the following AVIC hardware flaws:
+
+ * AMD Erratum 1235. A hardware flaw affecting certain AMD Family 17h and
+   Hygon Family 18h processors where the CPU hardware reads a stale
+   `IsRunning=1` bit during Interrupt Control Register (ICR) write emulation.
+
+Limitations:
+
+ * AVIC in x2APIC mode is not supported.
+
+ * AVIC in nested virtualization setup is not supported.
+
 ### sync_console
 > `= <boolean>`
 
-- 
2.55.0


