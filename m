Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A4D606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=PbIRd8+U;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=a7e3jcA3;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=FX9Toz3R;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=Z53iHNw1
Received: from list by lists.xenproject.org with outflank-mailman.1473390.1681068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmQ4-0002FM-C2; Thu, 05 Nov 2026 01:37:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473390.1681068; Thu, 05 Nov 2026 01:37:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmQ4-0002Cs-3J; Thu, 05 Nov 2026 01:37:36 +0000
Received: by outflank-mailman (input) for mailman id 1473390;
 Thu, 05 Nov 2026 01:37:33 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmQ1-00024v-Fo
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:37:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmQ0-000xdn-Sz
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:37:32 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebddb9-bab6-0a2a0a5309dd-0a2a450be758-42
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:37:32 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdddb-b7e8-0a2a450b0019-94a38ff171a8-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:37:32 +0100
Received: from pps.filterd (m0367128.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mdh32611538
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:37:31 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com
 (mail-eastus2azon11011069.outbound.protection.outlook.com [52.101.57.69])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hrdw8rvva-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:37:30 +0000 (GMT)
Received: from DS7P220CA0080.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:259::13) by
 DM4PR16MB5096.namprd16.prod.outlook.com (2603:10b6:8:52::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.10; Thu, 5 Nov 2026 01:37:24 +0000
Received: from DS4PEPF000001C4.namprd21.prod.outlook.com
 (2603:10b6:8:259:cafe::76) by DS7P220CA0080.outlook.office365.com
 (2603:10b6:8:259::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Thu, 5
 Nov 2026 01:37:24 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 DS4PEPF000001C4.mail.protection.outlook.com (10.167.23.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.2
 via Frontend Transport; Thu, 5 Nov 2026 01:37:24 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50nw2r2971351
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:37:23 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hnxs4nrph-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:37:23 -0500 (EST)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id OmPpxuj9tz55iOmPpxXLdZ; Thu, 05 Nov 2026 01:37:22 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=eMJ
	7+fJaPspHNS78QHkdRIUv28HyzylFQ4loU77c2z4=; b=PbIRd8+UuAkHlTMJB1Y
	aIFbIkkMISSjWlMT/B48IrAnSVxYkV2+/RopSe7wCMgq1aYcrnKjAu5suZXTM0gS
	pbBOOZBOllANB6uEYOUMvByyDIGuiTciIDLzvmiN3Mj1SxULkC+Wp91WzVrNkHaK
	YgqktrHh9ffUo0kZ8jJ3ReIRvPdbqg55EnP1Jqx8YBKIGfJ2GdNWcncchiIxOS8m
	1ud4LARvsO+q16bbpPtDmUow/NBeWtIxfKILJPFkVIEs/zX7lRnhaS7QtbWA92Xv
	k1bYuIbUvSD48zhU6gRvthqRdLbYqb66/Jv8sBWdlDIcp1K2+rQT+OnWVXM/9/qK
	QmA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uTFx4kTQgN4gsUi5HlkMgQn6Og+w8DRQECFdGUeprSwR0pQO+lF8ntSux6yDlp+VuhnSfVkm9cG8WPGImDfNMAmc2pqGRT21fe0YJUWVHGODiut9aalKxffEHpvAUMkfpDJ7DeymKeKpSNVm7f9an0Yp2U9L6iTNGqNvdqHQWOwkkqFF8/kr7t+0HdpKDm4/Q3a7n7odcr9OalAs1tnthbP2MmE+JTDfV8QJjaRsqRjidTSjVS04p4PvcSHi3ZRPW1vmutnWi0STD2jTRiJKefYCaSl9ZWazlAWjC09/I6lNcaZmBKG/Td3FregqWx/5eaJQdfTaK6qiUx/qbbTbPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eMJ7+fJaPspHNS78QHkdRIUv28HyzylFQ4loU77c2z4=;
 b=PXRmtaHDhOY9Y/bneboHPRoXIAvJWDUAUcZs2ki2Ly1XdUoKCEThgWwwgRxW2+mQwY3Ft9v2A3K7V+GpBcdlDTw7pEFlHm0zVpx1pnRjaIgrJs6EdInrU03afMHgY4UVUfCsaxQdwn9fZzbD7khdx64gNvZiEJi7kVF6r9E7XhipCPDfXqlHgpNRlfqeLAm02ZuBLvnSNRcosCSVNsqqaBBhhKEmYtirONCYkT+S4eBw9AQBffj1ZMgaeF31sy5EZB5y8XAjMxO+c4PNXehe4Lm1B/C1m5eYvjdmiOmJNecEhv/OzZSoXfKXT8Yb/zMUWZBKUopyY6kLT1xor19akw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eMJ7+fJaPspHNS78QHkdRIUv28HyzylFQ4loU77c2z4=;
 b=a7e3jcA3e9Fdq+5PSBTgD6AN3oBQHmt/2oZMF3HoKxetfq3n4VcrU6VBct7pvtYmD8CrPV0EO1t/OI2qc6yx08Wd8AF1nOdBtQOG6nYfaUoNFTPb5EqIDKAD+sWkM5fG9hevV03YnFS6lvgXHgOrco/wvdp2+ySLOXx3P3fB4zw=
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
	ppserprodsaar; bh=eMJ7+fJaPspHNS78QHkdRIUv28HyzylFQ4loU77c2z4=; b=
	FX9Toz3R0wsGd/DYm4hBUD+i5J+b/JioJh5lBakjlp0xpwkyf9lxCb8rflUGZRXz
	ez2rOOUmdNJK+GuPxQyFIi9FptAfFK+FcDJCimINdfwJpQ9gMg5INy/buothXbi9
	czaYdcEePHwFBEP6sctKgBXa6S844dSVkwzPZEl1YuYM9iWVYyDut55rieaz1FLM
	BE2bfUa7RJBpETITq4jRHfksLDmD50s6Z2XPowEVgZuSrCEQDKage2cJMtIxWj86
	DmvdK3Il6WmkNbvTw/gu6bfZ/JboP1b+yBRC3tXCgpPYYeOuEt/xHHC279oTkcjh
	tYzAa4iUxVSpslNOS9Vhzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=eMJ7+fJ
	aPspHNS78QHkdRIUv28HyzylFQ4loU77c2z4=; b=Z53iHNw1QzlvDGWLDO+Kq/N
	lOD5/P7EgD/NMeTh24bNHp4S/vph3RzQY5eb9BZaPwm/bJFXxdMwS0YQC9ExVOyO
	krZA0LRrhzjVytuwcyEX7iwGtivGzZiksAoBDwxJn2g73AF11NNDMRjKmvze3RZ2
	Z543SECe7JSTrpI77JAPpS5xk+kdAQ4AltVtAkx3pFjHbp8uuVgBqGOMpzJDBEhg
	Cc9bVWSc/c9bsEMhYHQErp+/1g2kCCecYUpJVBlCyjXQIeT2U7LmBNfaBG1VSYl8
	KyNxrRGg63yvYV6T6Jr76kpl6FKf8fpi1Giw03u/o8KBKIxVsZrj3PvW6bGNK2g=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmPpxuj9tz55iOmPpxXLdZ
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 07/13] CI: rework to allow hardware runners
Date: Wed,  4 Nov 2026 17:36:55 -0800
Message-ID: <20261105013701.719658-8-dmukhin@ford.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105013701.719658-1-dmukhin@ford.com>
References: <20261105013701.719658-1-dmukhin@ford.com>
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
X-MS-TrafficTypeDiagnostic: DS4PEPF000001C4:EE_|DM4PR16MB5096:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1fa11602-8110-44f5-aabe-08df3add57dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|22082099003|18002099003|6133799003|10067099003|3023799007|13003099007|56012099006|11063799006|261026140227099003|261022115727099003|261026121527099003|261102130727099003|261028144727099003|261021121427099003|261021123027099003|261022075727099003|261102123227099003|261022105027099003|261009223027099003|260925022911599003|260925021911599003|260925021311599003;
X-Microsoft-Antispam-Message-Info:
	CAjGAQ6r0xd2gM1VintJjo1TtOaYNyl2B73+ZXUAj+zZImb2ogWYpQEL7Mo2eDCU/QqRot2XcYRVku+3ZbENeKJI3nsLcKIvvoR/SyH6yRb9k81s55djTi/FADCOSj2DPeMv9zR7KUHDbOTZDpn6G0hDbk1vAiU6ik77yUuw5f+Dg/fbsOIa5D4l/tr/exgr7Kyf9k5t1JECyYZCWlExfBfiGIQedurh5CtgkM3oTD4zneIfB1+9HCa68e+7oNOymqDTz9pBgfvbGC8wcanHvSynIXoCnjExpb4LBqH+suuAYgpQk9Xvtjlxzl500SWWfe30oOJTApjmhBEcnYHr5z9ehyAC54x8bMIAVlc5uli8tSxSCBtptDeTSylt/VUsmbMnE65QRFecqlvkbAI1t87aNhOvoS5ObTuMPlVeU34bFH4HvrtSFsWBZw81cYwHey4yfcyppCW4yQxySSjVwDbMYPvd+gsNY1nB6syzzsHqr4lBZ9/mPC0oJHCbRynDdnenADWRbIG52eSpIMS7wFy47XpOrtML5mfK4NtiAPW9ogSF+9XxhS6cgj8rdBNLYBMuyfLM7C/S7B3uQvEl6J2/4c0EBaUIH0Tlh1HudtF3dL74tfYWjQsw5EowD8ayTc97nSsVe+bGKO+MEoUrqg==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(10067099003)(3023799007)(13003099007)(56012099006)(11063799006)(261026140227099003)(261022115727099003)(261026121527099003)(261102130727099003)(261028144727099003)(261021121427099003)(261021123027099003)(261022075727099003)(261102123227099003)(261022105027099003)(261009223027099003)(260925022911599003)(260925021911599003)(260925021311599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TCBjZejOBWwoxltoWMsOcu3zkZHoC0PMqLPODGMIHKPnke568w5ib33fj+WU0WmSAHhhAQ234oiO7iLpKCyCRr8+7w6GvX2WbTEV1IK/Vra3QUaW+sFlhoL9XlxUCsrFTzzhThExEdgILgS3JaYHB+DvqHh4olA7Zqyocdp9axUaOGEYCaax01x0lBETDlxgqOOA2bI8YI4tRR0Oiq9f4bmxAwYx0q9VdqWNjniMYwZHoTvPFKEu82BBn+OG1QmXomvyEs7T9QVXvzyC/4K/UgJp7lGupaltdKhOkEkxcU4m08oVHSO2FJdGFAXkuxB1GT4Kxanr4+ttjq9dokqnuysszbLJ4TayxkPE9sCgRyXB29x1pHDp5Xwb/OXKQ5g0dauWkjmuENrEgdM/ADSyJ0LLZhb2nuZQ5IRaGJ+4WcduCTKNjy7YQd2+ci3XFfA6
X-Exchange-RoutingPolicyChecked:
	tqAA86xomtOi4kYPAwuOInUtPMm6nKVBdfE09sjBsJkYS3IGJIjtePqoCx98GXu2eKIhgWUgKJFbWJCkP8QI0ChJGzyCoDEcM9+aLPx04TB0NkkZhjNm2ZCFfVwi2k6476BZ64Z1jE8/QFWt6j2Wi1EMnRgUsjjriIzTVrS4vQBj2yprU93sXMYmWk9t7NE4KSK0bG6Dgxo6dnjbciLg+DpMAp+by5H02v2szII0KDp9LX5yky1OoHom4f4w+s/LUJsAQouNt441PGh/FdmUxjl3gkiqc0+nUnIDsRdTbsxhCqlhsMDoMdr9lggzfkbm+kFG9pKOsnS2jLoVpnqgpA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7x5TfF9uN4ifopv1VHQ1hIeciAGrKiUvE6h8EIpuP5SErwWbktltvbkV2+NF/4gx61TJb7kPo/3/IU3keYlNxSbo1leARi+WLc3LhACwsarHRp4H9SF+6U0TNajjsFQ7LyxukiOUFiPhmqjSO6Kco/OdlESwpu2IkPOHH2IENP7daevcHsVDa7sw3A67gQCI7WeoSoL3yUuD+GONKYaRu7aWGBbKTlr7fqga3d8gJsqHpWHtWzpFx3mYUmnqT9l1qLLB6Oq8pzZSpu5Dur3aHUJYN7Y9gbQfgRAqSsQHD9n268yHUb10pStvhXCP916XB474Iz/8C/LvuHP/H7CMqMXrqG+6e11kdMBrudaC1Bu/7e5wnYoueQeQatRYTTEAMNETs+wJEiNPL/opItNKwCqyx86u+pj6nn23GYOuaOxAFfICmT4dGcWYwxM4FfsLecTyw00D+WSjvG/qndmCoZbIJRQgCOfGiF0cXfv+RFw7I/MiT2lJQX9Yovai5nu4JIRV/kFtUSKLkz5FqJgxtf8sKDSqkc4QvDwG5I6PYMsDUrEj1rUNCkvjKz2TgJsJkhsgSX+GrU10K+qdw0Erd2Wur/JHDMw/y/5eW/AvHpw82XeELwq9Ffnhh8iY/Iae2qcB0SzSCN3UesEGCLBjSQ==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:37:24.4036
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa11602-8110-44f5-aabe-08df3add57dd
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS4PEPF000001C4.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR16MB5096
X-Authority-Analysis: v=2.4 cv=JPiuIMKb c=1 sm=1 tr=0 ts=6aebddda cx=c_pps
 a=e0i8hnKg6rYC2BAxtNpLhQ==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=WER9OelvoqQQjwJToBYG:22 a=VwQbUJbxAAAA:8
 a=cWRNjhkoAAAA:8 a=p0WdMEafAAAA:8 a=mLnsDVdbAAAA:8 a=cbNQJ9GKAAAA:8
 a=Kh_WWJUcqPMiyg44z38A:9 a=G69WFyCBNqGPyalROSdv:22 a=WmVTiCyuxqgg3mnwYu6p:22
 a=sVa6W5Aao32NNC1mekxh:22 a=xnp1pY6zelCj5OLna2To:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX+OPa15ZZoGsB
 0rg8ELFSGNMII2h3fQW0PZMTovCAxAli1i7KcoF58UqG5pGrjhw5mcMcqI1/3Zq93ycvPz7VHDw
 QceNO1lTv+9UeU0K69uQd3rTBN1zQKAeVOQEjL0AJ4RHVyErUadH
X-Proofpoint-ORIG-GUID: wnO-Lte5Ca-nU2Mr1Zhv4j4nyCmfzr-Z
X-Proofpoint-GUID: wnO-Lte5Ca-nU2Mr1Zhv4j4nyCmfzr-Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX9Yu1qaBG5WWj
 0+8vfikgH2AW3aE/XtAE3Dtj27ZGDE+aeoyJRwX+bBxwMOhkXhcbc7wXQJOxI6vP4N/ypxU/sJ1
 Eg8VRxPczOkNyKKyUrUBj4hco6BxYoz8e2s8RPmkSA6sVNHQ6sgqwRLAcB5I0bsSKLFARIzfHL0
 EVXdmnCHALZ/zJsq43UVukJO9r6Atd7jQScT1rW35vk0ENcheseumwAihT1+mR7gxa89vPVnFnl
 BN0C4lnB2VdQUKd2nbehlbLb4RFMHnRvQjtzvVvaNHD+h44OjMO5JI0I5PrTXxNTWpBeBR+komx
 8w418IahxY/fAJxat1TGbq+moJyvgUMXPXoh8pHzcanU+CVNf7yRn0bveVnqldVwSyvpvM/OsN5
 DT596eDFZoRcON/XcimQqLTGUdtrMtPhCS6Vx59qTDv9M+jc0oTD59cDYPJ/ml8F+uC1+hGmKRZ
 BkcyqcaNeS5k2szcg7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050006
X-purgate-ID: tlsNG-42698a/1793842652-19AC09EA-5E7ACD6B/0/0
X-purgate-type: clean
X-purgate-size: 30910
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Rework current bash tooling to simplify its use for local testing
and CI integration.

Allow batching multiple tests in one run.

The batching rules are:
- Use 'SELECTED_GROUP_ONLY' for running only XTF group of jobs.
  If unset, run all XTF jobs.
- Use file passed in 'XTF_MANIFEST' to select a group of tests to
  run. If unset, run all known tests.
- Use regex in 'SELECTED_XTF_ONLY' environment variable to select
  a group of XTF tests. If unset, run all tests.

Correctly resolve individual XTF test statuses returned from
console.exp for pretty accounting.

Include per-test title in the output.

Rely on per-XTF 'info.json' for assembling per-test Xen command line.

Prefix all per-arch XTF QEMU configuration fragments with "qemu-"
prefix and move them under 'xtf' directory. While here, rename
qemu-xtf.sh to xtf.sh since the code is now generic, not QEMU
specific.

Update all affected QEMU XTF jobs.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
That may clash with
  https://lore.kernel.org/xen-devel/20260922100900.29129-1-anthony@xenproject.org/
and
  https://lore.kernel.org/xen-devel/1793715358.8631fc262581453bbf619ec5b2062170.1a1a1c44b87000403d@vates.tech

My take - pytests is the way to go, but I had to unblock myself
with running some AVIC testing, so ended up with existing bash
infra cleanup.
---
 automation/gitlab-ci/test.yaml                | 165 +++++---
 .../scripts/include/configs/xtf-arm64-config  |   2 -
 .../scripts/include/configs/xtf-x86_64-config |   0
 .../include/configs/xtf-x86_64-efi-config     |   0
 .../scripts/include/manifests/qemu-x86_64     |  75 ++++
 automation/scripts/include/xtf-runner         | 138 ------
 .../include/{xtf-arm64 => xtf/qemu-arm64}     |  13 +-
 .../include/{xtf-x86_64 => xtf/qemu-x86_64}   |  13 +-
 .../{xtf-x86_64-efi => xtf/qemu-x86_64-efi}   |  13 +-
 automation/scripts/qemu-xtf.sh                |  28 --
 automation/scripts/xtf                        | 395 ++++++++++++++++++
 11 files changed, 590 insertions(+), 252 deletions(-)
 delete mode 100644 automation/scripts/include/configs/xtf-arm64-config
 delete mode 100644 automation/scripts/include/configs/xtf-x86_64-config
 delete mode 100644 automation/scripts/include/configs/xtf-x86_64-efi-config
 create mode 100644 automation/scripts/include/manifests/qemu-x86_64
 delete mode 100644 automation/scripts/include/xtf-runner
 rename automation/scripts/include/{xtf-arm64 => xtf/qemu-arm64} (79%)
 rename automation/scripts/include/{xtf-x86_64 => xtf/qemu-x86_64} (53%)
 rename automation/scripts/include/{xtf-x86_64-efi => xtf/qemu-x86_64-efi} (75%)
 delete mode 100755 automation/scripts/qemu-xtf.sh
 create mode 100755 automation/scripts/xtf

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 047c4d513a65..9ca93842dfe7 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -5,6 +5,31 @@
   - if: $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
     when: on_success
 
+.test-jobs-group:
+  extends:
+    - .test-jobs-common
+  rules:
+    - if: '$CI_JOB_NAME =~ $SELECTED_JOBS_ONLY && $SELECTED_GROUP_ONLY =~ /(^|,)(all|[*])(,|$)/'
+      when: on_success
+    - if: '$CI_JOB_NAME =~ $SELECTED_JOBS_ONLY && $SELECTED_GROUP_ONLY =~ $GROUP_REGEX'
+      when: on_success
+    - if: '$CI_JOB_NAME =~ $SELECTED_JOBS_ONLY'
+      when: manual
+      allow_failure: true
+    - when: never
+
+.test-jobs-perf:
+  extends:
+    - .test-jobs-group
+  variables:
+    GROUP_REGEX: '/(^|,)perf(,|$)/'
+
+.test-jobs-hardware-xtf:
+  extends:
+    - .test-jobs-group
+  variables:
+    GROUP_REGEX: '/(^|,)xtf(,|$)/'
+
 .arm64-test-needs: &arm64-test-needs
   - project: $ARTIFACTS_REPO
     job: $LINUX_JOB_ARM64
@@ -27,11 +52,44 @@
     job: microcode-x86
     ref: $ARTIFACTS_BRANCH
 
+.xtf-arm64-gcc-debug:
+  variables:
+    ARCH: arm64
+  script:
+    - time ./automation/scripts/xtf 2>&1 | tee ${LOGFILE}
+  artifacts:
+    paths:
+      - '*.log'
+    when: always
+  needs:
+    - *arm64-test-needs
+    - alpine-3.24-arm64-gcc-debug
+    - xtf-arm64-gcc-debug
+
+.xtf-x86_64-gcc-debug:
+  variables:
+    ARCH: x86_64
+  script:
+    - |
+      if [[ "${CONTAINER}" != "debian:13-x86_64" ]]; then
+          apk add --no-cache binutils
+      fi
+    - time ./automation/scripts/xtf 2>&1 | tee ${LOGFILE}
+  artifacts:
+    paths:
+      - '*.log'
+    when: always
+  needs:
+    - *x86_64-test-needs
+    - alpine-3.24-x86_64-gcc-debug
+    - xtf-x86_64-gcc-debug
+
 .qemu-arm64:
   extends: .test-jobs-common
   variables:
     CONTAINER: debian:13-arm64v8
     LOGFILE: qemu-smoke-arm64.log
+    XTF_TARGET: qemu-arm64
   artifacts:
     paths:
       - smoke.serial
@@ -58,6 +116,7 @@
   variables:
     CONTAINER: debian:13-x86_64
     LOGFILE: qemu-smoke-x86_64.log
+    XTF_TARGET: qemu-x86_64
   artifacts:
     paths:
       - smoke.serial
@@ -66,11 +125,6 @@
   tags:
     - x86_64
 
-.qemu-smoke-x86_64:
-  extends: .qemu-x86_64
-  variables:
-    TEST_TIMEOUT_OVERRIDE: 120
-
 .qemu-riscv64:
   extends: .test-jobs-common
   variables:
@@ -503,6 +557,12 @@ zen2-suspend-x86_64-gcc-debug:
     - *x86_64-test-needs
     - alpine-3.24-x86_64-gcc-debug
 
+zen2-xtf-x86_64-gcc-debug:
+  extends:
+    - .zen2-x86_64
+    - .xtf-x86_64-gcc-debug
+    - .test-jobs-hardware-xtf
+
 zen3p-smoke-x86_64-gcc-debug:
   extends: .zen3p-x86_64
   script:
@@ -565,6 +625,12 @@ zen3p-tools-tests-pvh-x86_64-gcc-debug:
     - *x86_64-test-needs
     - alpine-3.24-x86_64-gcc-debug
 
+zen3p-xtf-x86_64-gcc-debug:
+  extends:
+    - .zen3p-x86_64
+    - .xtf-x86_64-gcc-debug
+    - .test-jobs-hardware-xtf
+
 qemu-smoke-dom0-arm64-gcc:
   extends: .qemu-arm64
   script:
@@ -653,21 +719,13 @@ qemu-smoke-dom0less-arm64-gcc-debug-earlyprintk:
     - *arm64-test-needs
     - alpine-3.24-arm64-gcc-debug-earlyprintk
 
-qemu-xtf-dom0less-arm64-gcc-hyp-xen-version:
-  extends: .qemu-arm64
-  script:
-    - ./automation/scripts/qemu-xtf.sh arm64 mmu64le hyp-xen-version 2>&1 | tee ${LOGFILE}
-  needs:
-    - *arm64-test-needs
-    - alpine-3.24-arm64-gcc
-
-qemu-xtf-dom0less-arm64-gcc-debug-hyp-xen-version:
-  extends: .qemu-arm64
-  script:
-    - ./automation/scripts/qemu-xtf.sh arm64 mmu64le hyp-xen-version 2>&1 | tee ${LOGFILE}
-  needs:
-    - *arm64-test-needs
-    - alpine-3.24-arm64-gcc-debug
+qemu-xtf-arm64-gcc-debug:
+  extends:
+    - .qemu-arm64
+    - .test-jobs-common
+    - .xtf-arm64-gcc-debug
+  variables:
+    TEST_TIMEOUT_OVERRIDE: 10
 
 qemu-smoke-dom0-arm32-gcc:
   extends: .qemu-arm32
@@ -741,49 +799,36 @@ qemu-alpine-x86_64-gcc:
     - *x86_64-test-needs
     - alpine-3.24-x86_64-gcc
 
-qemu-smoke-x86_64-gcc:
-  extends: .qemu-smoke-x86_64
-  script:
-    - ./automation/scripts/qemu-xtf.sh x86_64 pv64 example 2>&1 | tee ${LOGFILE}
-  needs:
-    - debian-13-x86_64-gcc-debug
-
-qemu-smoke-x86_64-clang:
-  extends: .qemu-smoke-x86_64
-  script:
-    - ./automation/scripts/qemu-xtf.sh x86_64 pv64 example 2>&1 | tee ${LOGFILE}
-  needs:
-    - debian-13-x86_64-clang-debug
-
-qemu-smoke-x86_64-gcc-pvh:
-  extends: .qemu-smoke-x86_64
-  script:
-    - ./automation/scripts/qemu-xtf.sh x86_64 hvm64 example 2>&1 | tee ${LOGFILE}
-  needs:
-    - debian-13-x86_64-gcc-debug
-
-qemu-smoke-x86_64-clang-pvh:
-  extends: .qemu-smoke-x86_64
-  script:
-    - ./automation/scripts/qemu-xtf.sh x86_64 hvm64 example 2>&1 | tee ${LOGFILE}
-  needs:
-    - debian-13-x86_64-clang-debug
-
-qemu-smoke-x86_64-gcc-efi:
-  extends: .qemu-smoke-x86_64
-  script:
-    - ./automation/scripts/qemu-xtf.sh x86_64-efi pv64 example 2>&1 | tee ${LOGFILE}
-  needs:
-    - debian-13-x86_64-gcc-debug
-
-qemu-xtf-argo-x86_64-gcc-debug:
-  extends: .qemu-smoke-x86_64
+qemu-xtf-x86_64-gcc-debug:
+  extends:
+    - .qemu-x86_64
+    - .test-jobs-common
+    - .xtf-x86_64-gcc-debug
   variables:
-    TEST_TIMEOUT_OVERRIDE: 60
+    TEST_TIMEOUT_OVERRIDE: 10
+    XTF_MANIFEST: include/manifests/qemu-x86_64
+
+qemu-xtf-x86_64-efi-gcc-debug:
+  extends: qemu-xtf-x86_64-gcc-debug
+  variables:
+    XTF_TARGET: qemu-x86_64-efi
+
+qemu-xtf-x86_64-clang-debug:
+  extends: .qemu-x86_64
+  variables:
+    ARCH: x86_64
+    TEST_TIMEOUT_OVERRIDE: 10
+    XTF_MANIFEST: include/manifests/qemu-x86_64
   script:
-    - ./automation/scripts/qemu-xtf.sh x86_64 pv64 argo 2>&1 | tee ${LOGFILE}
+    - time ./automation/scripts/xtf 2>&1 | tee ${LOGFILE}
+  artifacts:
+    paths:
+      - '*.log'
+    when: always
   needs:
-    - alpine-3.24-x86_64-gcc-debug
+    - *x86_64-test-needs
+    - debian-13-x86_64-clang-debug
+    - xtf-x86_64-clang-debug
 
 qemu-smoke-riscv64-gcc:
   extends: .qemu-riscv64
diff --git a/automation/scripts/include/configs/xtf-arm64-config b/automation/scripts/include/configs/xtf-arm64-config
deleted file mode 100644
index 99427409276d..000000000000
--- a/automation/scripts/include/configs/xtf-arm64-config
+++ /dev/null
@@ -1,2 +0,0 @@
-CONFIG_GICV2=y
-CONFIG_SBSA_UART=y
diff --git a/automation/scripts/include/configs/xtf-x86_64-config b/automation/scripts/include/configs/xtf-x86_64-config
deleted file mode 100644
index e69de29bb2d1..000000000000
diff --git a/automation/scripts/include/configs/xtf-x86_64-efi-config b/automation/scripts/include/configs/xtf-x86_64-efi-config
deleted file mode 100644
index e69de29bb2d1..000000000000
diff --git a/automation/scripts/include/manifests/qemu-x86_64 b/automation/scripts/include/manifests/qemu-x86_64
new file mode 100644
index 000000000000..82b40deb94e5
--- /dev/null
+++ b/automation/scripts/include/manifests/qemu-x86_64
@@ -0,0 +1,75 @@
+test-hvm32-argo
+test-hvm32-cpuid
+test-hvm32-debug-regs
+test-hvm32-example
+test-hvm32-invlpg
+test-hvm32-lm-ts
+test-hvm32-selftest
+test-hvm32-xsa-122
+test-hvm32-xsa-188
+test-hvm32-xsa-239
+test-hvm32-xsa-317
+test-hvm32pae-argo
+test-hvm32pae-cpuid
+test-hvm32pae-debug-regs
+test-hvm32pae-example
+test-hvm32pae-invlpg
+test-hvm32pae-selftest
+test-hvm32pae-xsa-122
+test-hvm32pae-xsa-188
+test-hvm32pae-xsa-317
+test-hvm32pse-argo
+test-hvm32pse-cpuid
+test-hvm32pse-debug-regs
+test-hvm32pse-example
+test-hvm32pse-selftest
+test-hvm32pse-xsa-122
+test-hvm32pse-xsa-188
+test-hvm32pse-xsa-317
+test-hvm64-argo
+test-hvm64-cpuid
+test-hvm64-debug-regs
+test-hvm64-example
+test-hvm64-invlpg
+test-hvm64-lbr-tsx-vmentry
+test-hvm64-lm-ts
+test-hvm64-rtm-check
+test-hvm64-selftest
+test-hvm64-xsa-122
+test-hvm64-xsa-168
+test-hvm64-xsa-173
+test-hvm64-xsa-188
+test-hvm64-xsa-195
+test-hvm64-xsa-221
+test-hvm64-xsa-231
+test-hvm64-xsa-232
+test-hvm64-xsa-269
+test-hvm64-xsa-277
+test-hvm64-xsa-278
+test-hvm64-xsa-304
+test-hvm64-xsa-317
+test-hvm64-xsa-454
+test-hvm64-xsa-463
+test-pv64-argo
+test-pv64-cpuid
+test-pv64-example
+test-pv64-rtm-check
+test-pv64-xsa-122
+test-pv64-xsa-182
+test-pv64-xsa-188
+test-pv64-xsa-193
+test-pv64-xsa-212
+test-pv64-xsa-221
+test-pv64-xsa-224
+test-pv64-xsa-227
+test-pv64-xsa-231
+test-pv64-xsa-232
+test-pv64-xsa-234
+test-pv64-xsa-255
+test-pv64-xsa-259
+test-pv64-xsa-279
+test-pv64-xsa-286
+test-pv64-xsa-296
+test-pv64-xsa-317
+test-pv64-xsa-333
+test-pv64-xsa-7
diff --git a/automation/scripts/include/xtf-runner b/automation/scripts/include/xtf-runner
deleted file mode 100644
index d1ef888465c3..000000000000
--- a/automation/scripts/include/xtf-runner
+++ /dev/null
@@ -1,138 +0,0 @@
-#!/bin/bash
-#
-# XTF test utilities.
-#
-# Environment variables:
-#   BOOT_MSG: Expected boot message
-#   FW_PREFIX: Firmware images path including '/' at the end
-#   PASSED: XTF test printout in case of a pass
-#   QEMU_PREFIX: QEMU path including '/' at the end
-#   TEST_LOG: Output log file
-#   UBOOT_CMD: U-Boot command line
-#   WORKDIR: Test working directory
-#   XEN_BINARY: Xen binary location
-#   XEN_CONSOLE: Xen console device name
-#   XTF_SRC_CONFIG: XTF config file
-#   XTF_SRC_BRANCH: XTF branch
-#   XTF_SRC_URI: XTF source code URI
-
-# Output log file
-TEST_LOG="${TEST_LOG:-${XEN_ROOT}/smoke.serial}"
-# XTF test printout in case of a pass
-PASSED="${PASSED:-Test result: SUCCESS}"
-# Expected boot message
-BOOT_MSG="${BOOT_MSG:-Latest ChangeSet: }"
-# Test working directory
-WORKDIR="${WORKDIR:-${XEN_ROOT}/binaries}"
-# XTF source code
-XTF_SRC_CONFIG="${XTF_SRC_CONFIG:-include/configs/xtf-${ARCH}-config}"
-
-function die()
-{
-    set +x
-    echo "FATAL: $*" >&2
-    exit 1
-}
-
-# Build an XTF test binary.
-# $1 Test variant.
-# $2 Test name.
-function xtf_build_binary()
-{
-    local xtf_variant=$1
-    local xtf_name=$2
-    local xtf_dir="xtf-${ARCH}"
-
-    # Crude check for local testing
-    if [ ! -d ${xtf_dir} ]; then
-        git clone ${XTF_SRC_URI} ${xtf_dir} -b ${XTF_SRC_BRANCH}
-    fi
-
-    make \
-        -C ${xtf_dir} \
-        -j$(nproc) \
-        $(tr '\n' ' ' < ${XTF_SRC_CONFIG}) \
-        TESTS=tests/${xtf_name}
-
-    export XTF_NAME="${xtf_name}"
-    export XTF_VARIANT="${xtf_variant}"
-    export XTF_WORKDIR="$(readlink -f ${xtf_dir})"
-    export XTF_BINARY="${XTF_WORKDIR}/tests/${xtf_name}/test-${xtf_variant}-${xtf_name}"
-}
-
-# Build Xen command line for running an XTF test.
-# $1 Test variant.
-# $2 Test name.
-function xtf_build_cmdline()
-{
-    local xtf_variant=$1
-    local xtf_name=$2
-    declare -a cmdline=()
-    declare -A per_test_args=(
-        [argo]="argo=1,mac-permissive=1"
-    )
-
-    cmdline+=("${XEN_CMDLINE}")
-
-    # NB: OK to have hvm64, which is x86-only variant
-    if [[ $xtf_variant == "hvm64" ]]; then
-        cmdline+=("dom0-iommu=none dom0=pvh")
-    fi
-
-    if [[ -v per_test_args[${xtf_name}] ]]; then
-        cmdline+=("${per_test_args[${xtf_name}]}")
-    fi
-
-    export XEN_CMDLINE="${cmdline[@]}"
-}
-
-# Build an XTF test environment.
-# $1 Test variant.
-# $2 Test name.
-function xtf_build_test()
-{
-    local v=$1
-    local xtf_name=$2
-    local xtf_variant=""
-
-    for x in ${XTF_SRC_VARIANTS}; do
-        if [[ "${x}" == "${v}" ]]; then
-            xtf_variant=${v}
-            break
-        fi
-    done
-    if [[ -z $xtf_variant ]]; then
-        die "unsupported test variant '$1', supported variants: ${XTF_SRC_VARIANTS}"
-    fi
-
-    xtf_build_binary ${xtf_variant} ${xtf_name}
-    xtf_build_cmdline ${xtf_variant} ${xtf_name}
-}
-
-# Execute an XTF test.
-function xtf_run_test()
-{
-    rm -f ${TEST_LOG}
-    export BOOT_MSG PASSED TEST_CMD TEST_LOG UBOOT_CMD
-    ./console.exp |& sed 's/\r\+$//'
-}
-
-# Setup environment and run an XTF test.
-# $1 Test variant.
-# $2 Test name.
-function xtf_test()
-{
-    # Out: FW_*, QEMU_*, XEN_{BINARY,CONSOLE}, XTF_SRC_*
-    xtf_arch_prepare
-
-    # In: XTF_SRC_*
-    # OUt: XTF_{BINARY,NAME,VARIANT,WORKDIR} and XEN_CMDLINE
-    xtf_build_test $@
-
-    # In: FW_*, QEMU_*, XTF_*, XEN_*
-    # Out: BOOT_MSG, PASSED, TEST_{CMD,LOG}, UBOOT_CMD
-    xtf_arch_setup
-
-    # In: BOOT_MSG, PASSED, TEST_{CMD,LOG}, UBOOT_CMD
-    xtf_run_test
-}
diff --git a/automation/scripts/include/xtf-arm64 b/automation/scripts/include/xtf/qemu-arm64
similarity index 79%
rename from automation/scripts/include/xtf-arm64
rename to automation/scripts/include/xtf/qemu-arm64
index 5d851af788a1..1f23e33fc0ac 100644
--- a/automation/scripts/include/xtf-arm64
+++ b/automation/scripts/include/xtf/qemu-arm64
@@ -3,20 +3,17 @@
 # XTF test utilities (arm64).
 #
 
-# Arch-specific environment overrides.
-function xtf_arch_prepare()
+# Target-specific environment overrides.
+function xtf_init()
 {
     export FW_PREFIX="${FW_PREFIX:-/usr/lib/u-boot/qemu_arm64/}"
     export QEMU_PREFIX="${QEMU_PREFIX:-}"
     export XEN_BINARY="${XEN_BINARY:-${WORKDIR}/xen}"
-    export XEN_CMDLINE="${XEN_CMDLINE:-loglvl=all noreboot console_timestamps=boot console=dtuart}"
-    export XTF_SRC_BRANCH="${XTF_SRC_BRANCH:-xtf-arm}"
-    export XTF_SRC_URI="${XTF_SRC_URI:-https://gitlab.com/xen-project/fusa/xtf.git}"
-    export XTF_SRC_VARIANTS="mmu64le"
+    export EXTRA_XEN_CMDLINE="${XEN_CMDLINE:-loglvl=all noreboot console_timestamps=boot console=dtuart}"
 }
 
-# Perform arch-specific XTF environment setup.
-function xtf_arch_setup()
+# Perform target-specific XTF environment setup.
+function xtf_setup_host()
 {
     # Crude check for local testing
     if [ ! -d imagebuilder ]; then
diff --git a/automation/scripts/include/xtf-x86_64 b/automation/scripts/include/xtf/qemu-x86_64
similarity index 53%
rename from automation/scripts/include/xtf-x86_64
rename to automation/scripts/include/xtf/qemu-x86_64
index 186f074bd8eb..0e079893dc25 100644
--- a/automation/scripts/include/xtf-x86_64
+++ b/automation/scripts/include/xtf/qemu-x86_64
@@ -3,20 +3,17 @@
 # XTF test utilities (x86_64).
 #
 
-# Arch-specific environment overrides.
-function xtf_arch_prepare()
+# Target-specific environment overrides.
+function xtf_init()
 {
     export FW_PREFIX="${FW_PREFIX:-}"
     export QEMU_PREFIX="${QEMU_PREFIX:-}"
     export XEN_BINARY="${XEN_BINARY:-${WORKDIR}/xen}"
-    export XEN_CMDLINE="${XEN_CMDLINE:-loglvl=all noreboot console_timestamps=boot console=com1}"
-    export XTF_SRC_BRANCH="${XTF_SRC_BRANCH:-master}"
-    export XTF_SRC_URI="${XTF_SRC_URI:-https://xenbits.xen.org/git-http/xtf.git}"
-    export XTF_SRC_VARIANTS="hvm64 pv64"
+    export EXTRA_XEN_CMDLINE="${XEN_CMDLINE:-loglvl=all noreboot console_timestamps=boot console=com1}"
 }
 
-# Perform arch-specific XTF environment setup.
-function xtf_arch_setup()
+# Perform target-specific XTF environment setup.
+function xtf_setup_host()
 {
     export TEST_CMD="${QEMU_PREFIX}qemu-system-x86_64 \
         -no-reboot \
diff --git a/automation/scripts/include/xtf-x86_64-efi b/automation/scripts/include/xtf/qemu-x86_64-efi
similarity index 75%
rename from automation/scripts/include/xtf-x86_64-efi
rename to automation/scripts/include/xtf/qemu-x86_64-efi
index 15c6463dcdc5..dd2b8c3c6e52 100644
--- a/automation/scripts/include/xtf-x86_64-efi
+++ b/automation/scripts/include/xtf/qemu-x86_64-efi
@@ -3,20 +3,17 @@
 # XTF test utilities (x86_64, EFI).
 #
 
-# Arch-specific environment overrides.
-function xtf_arch_prepare()
+# Target-specific environment overrides.
+function xtf_init()
 {
     export FW_PREFIX="${FW_PREFIX:-/usr/share/OVMF/}"
     export QEMU_PREFIX="${QEMU_PREFIX:-}"
     export XEN_BINARY="${XEN_BINARY:-${WORKDIR}/xen.efi}"
-    export XEN_CMDLINE="${XEN_CMDLINE:-loglvl=all noreboot console_timestamps=boot console=com1}"
-    export XTF_SRC_BRANCH="${XTF_SRC_BRANCH:-master}"
-    export XTF_SRC_URI="${XTF_SRC_URI:-https://xenbits.xen.org/git-http/xtf.git}"
-    export XTF_SRC_VARIANTS="hvm64 pv64"
+    export EXTRA_XEN_CMDLINE="${XEN_CMDLINE:-loglvl=all noreboot console_timestamps=boot console=com1}"
 }
 
-# Perform arch-specific XTF environment setup.
-function xtf_arch_setup()
+# Perform target-specific XTF environment setup.
+function xtf_setup_host()
 {
     local esp_dir="${WORKDIR}/boot-esp"
     local efi_dir="${esp_dir}/EFI/BOOT"
diff --git a/automation/scripts/qemu-xtf.sh b/automation/scripts/qemu-xtf.sh
deleted file mode 100755
index 55c221b36dc5..000000000000
--- a/automation/scripts/qemu-xtf.sh
+++ /dev/null
@@ -1,28 +0,0 @@
-#!/bin/bash
-#
-# XTF test runner (QEMU).
-#
-
-set -e -o pipefail
-
-if [ $# -lt 3 ]; then
-    echo "Usage: $(basename $0) ARCH XTF-VARIANT XTF-NAME"
-    exit 0
-fi
-
-export ARCH="$1"
-shift
-
-set -x
-
-export XEN_ROOT="${PWD}"
-cd $(dirname $0)
-
-source include/xtf-runner
-
-if [ ! -f "include/xtf-${ARCH}" ]; then
-    die "unsupported architecture '${ARCH}'"
-fi
-source include/xtf-${ARCH}
-
-xtf_test $@
diff --git a/automation/scripts/xtf b/automation/scripts/xtf
new file mode 100755
index 000000000000..9f75ad5f99d0
--- /dev/null
+++ b/automation/scripts/xtf
@@ -0,0 +1,395 @@
+#!/bin/bash
+#
+# XTF test utilities.
+#
+# Environment variables:
+#   ARCH: Target CPU architecture
+#   BOOT_MSG: Expected boot message
+#   FW_PREFIX: Firmware images path including '/' at the end
+#   QEMU_PREFIX: QEMU path including '/' at the end
+#   TEST_LOG: Output log file
+#   UBOOT_CMD: U-Boot command line
+#   WORKDIR: Test working directory
+#   XEN_BINARY: Xen binary location
+#   XEN_CONSOLE: Xen console device name
+#   XTF_SRC_CONFIG: XTF config file
+#   XTF_SRC_BRANCH: XTF branch
+#   XTF_SRC_URI: XTF source code URI
+#   XTF_TARGET: Target name
+
+function die()
+{
+    set +x
+    echo "FATAL: $*" >&2
+    exit 255
+}
+
+set -e -o pipefail
+set -x
+
+if [[ -z "${ARCH}" ]]; then
+    die "'\$ARCH' is not defined"
+fi
+
+if [[ -z "${XTF_TARGET}" ]]; then
+    die "'\$XTF_TARGET' is not defined"
+fi
+
+TOP="$(readlink -f $(dirname $0))"
+xtf_include="${TOP}/include/xtf/${XTF_TARGET}"
+
+if [[ ! -e "${xtf_include}" ]]; then
+    die "cannot find '${xtf_include}'"
+fi
+
+# Scratch directory
+XEN_ROOT="${PWD}"
+# Output log file
+TEST_LOG="${TEST_LOG:-${XEN_ROOT}/smoke.serial}"
+# Expected boot message
+BOOT_MSG="${BOOT_MSG:-Latest ChangeSet: }"
+# Test working directory
+WORKDIR="${WORKDIR:-${XEN_ROOT}/binaries}"
+# XTF source code
+XTF_SRC_CONFIG="${XTF_SRC_CONFIG:-include/configs/xtf-${ARCH}-config}"
+
+cd ${TOP}
+
+source include/xtf/${XTF_TARGET}
+
+function xtf_string_from_elf()
+{
+    str="$1"
+    xtf_binary="$2"
+    local addr=0
+    local size=0
+    local idx=0
+    local sec_off=""
+    local offset=0
+
+    if ! command -v readelf &>/dev/null; then
+        die "readelf not found (install binutils)"
+    fi
+
+    # Get symbol address, size, and section index.
+    read -r addr size idx < <(
+        readelf -Ws "${xtf_binary}" |
+        awk '$8 == "'${str}'" && $7 ~ /^[0-9]+$/ {
+            print $2, $3, $7
+            exit
+        }'
+    )
+
+    if [[ -z "${idx}" || ${size} == 0 ]]; then
+        die "no ${str} in '${xtf_binary}'"
+    fi
+
+    # Get section virtual address and file offset.
+    read -r sec_addr sec_off < <(
+        readelf -WS "${xtf_binary}" |
+        awk -v idx="${idx}" \
+            '$0 ~ "^[[:space:]]*\\[[[:space:]]*" idx "\\]" {
+                sub(/^[[:space:]]*\[[[:space:]]*[0-9]+\][[:space:]]*/, "")
+                print $3, $4
+                exit
+            }'
+    )
+
+    if [[ -z "${sec_off}" ]]; then
+        die "failed to extact ${str} from '${xtf_binary}'"
+    fi
+
+    # xtf_binary symbol address -> file offset.
+    offset=$((16#${sec_off} + 16#${addr} - 16#${sec_addr}))
+
+    # Extract the NUL-terminated string.
+    dd if="${xtf_binary}" bs=1 skip="${offset}" count="${size}" status=none |
+        tr -d '\000'
+}
+
+function xtf_get_bootargs()
+{
+    local xtf_info=$1
+    local line
+    local re='"xen,xen-bootargs"[[:space:]]*:[[:space:]]*"([^"]*)"'
+
+    while IFS= read -r line || [[ -n "$line" ]]; do
+        if [[ "$line" =~ $re ]]; then
+            printf '%s\n' "${BASH_REMATCH[1]}"
+            return 0
+        fi
+    done < "$xtf_info"
+}
+
+# Build Xen command line for running an XTF test.
+# $1 Test variant.
+# $2 Test manifest.
+function xtf_setup_cmdline()
+{
+    local xtf_variant=$1
+    local xtf_info=$2
+    local -a cmdline=("${EXTRA_XEN_CMDLINE}")
+
+    if [[ "$xtf_variant" == hvm* ]]; then
+        cmdline+=("iommu=0 dom0-iommu=none dom0=pvh")
+    fi
+
+    if [[ -f "$xtf_info" ]]; then
+        cat "${xtf_info}"
+        cmdline+=($(xtf_get_bootargs "${xtf_info}"))
+    fi
+
+    export XEN_CMDLINE="${cmdline[*]}"
+}
+
+# Execute an XTF test.
+function xtf_run()
+{
+    rm -f ${TEST_LOG}
+    export BOOT_MSG TEST_CMD TEST_LOG UBOOT_CMD
+
+    printf "XTF binary: %s\n" "${XTF_BINARY}"
+    printf "XTF log: %s\n" "${XTF_LOG}"
+    printf "Xen binary: %s\n" "${XEN_BINARY}"
+    printf "Xen Command Line: %s\n" "${XEN_CMDLINE}"
+
+    TEST_XTF=y ./console.exp |& sed 's/\r\+$//'
+}
+
+function print_title()
+{
+    local str="$1"
+    local width=$(( 80 - ${#str} - 2 ))
+    local left=$(( width / 2 ))
+    local right=$(( width - left ))
+
+    printf -v lhs '%*s' "$left" ''
+    printf -v rhs '%*s' "$right" ''
+    printf '\n%s %s %s\n' "${lhs// /=}" "$str" "${rhs// /=}"
+}
+
+function main()
+{
+    declare -A nr_tests_by_status=(
+        [PASS]=0
+        [TIMEOUT]=0
+        [EOF]=0
+        [SKIP]=0
+        [ERROR]=0
+        [FAIL]=0
+        [CRASH]=0
+        [UNKNOWN]=0
+    )
+    local -A xtf_completed=()
+    local -A xtf_binaries_selected=()
+    local -A xtf_binary_by_path=()
+    local -a xtf_binaries=()
+    local -a xtf_binaries_filtered=()
+    local nr_tests=0
+    local xtf_binary xtf_file xtf_variant xtf_name xtf_title
+
+    xtf_init
+
+    #
+    # Pass 1: Discover all XTF ELF binaries.
+    #
+
+    while IFS= read -r -d '' xtf_binary; do
+        if ! readelf -h "$xtf_binary" &>/dev/null; then
+            continue
+        fi
+
+        # Some XTF build quirks
+        case "$ARCH" in
+        arm64)
+            if [[ "$xtf_binary" != *-syms ]]; then
+                continue
+            fi
+
+            xtf_binary="${xtf_binary%-syms}"
+
+            if [[ ! -s "$xtf_binary" ]]; then
+                die "Missing ARM64 boot image '$xtf_binary'"
+            fi
+            ;;
+        *)
+            ;;
+        esac
+
+        xtf_binaries+=(${xtf_binary})
+    done < <(find "$WORKDIR" -mindepth 2 -type f -name 'test-*' -print0)
+
+    if (( ${#xtf_binaries[@]} == 0 )); then
+        die "No XTF ELF binaries found in '$WORKDIR'"
+    fi
+
+    #
+    # Load test suite manifest, if any.
+    #
+
+    if [[ -n ${XTF_MANIFEST:-} ]]; then
+        local -a lines=()
+
+        if [[ ! -r "$XTF_MANIFEST" ]]; then
+            die "Cannot read '$XTF_MANIFEST'"
+        fi
+
+        mapfile -t lines < "$XTF_MANIFEST"
+        for x in "${lines[@]}"; do
+            xtf_binaries_selected["${x}"]=1
+        done
+
+        if (( ${#xtf_binaries_selected[@]} == 0 )); then
+            die "No tests found in '$XTF_MANIFEST'"
+        fi
+    fi
+
+    #
+    # Pass 2: Filter discovered XTF binaries.
+    #
+
+    for xtf_binary in "${xtf_binaries[@]}"; do
+        xtf_file=$(basename "${xtf_binary}")
+
+        # Filter 1: YAML
+        if [[ -n ${XTF_MANIFEST:-} && -z ${xtf_binaries_selected[$xtf_file]:-} ]]; then
+            continue
+        fi
+
+        # Filter 2: regex
+        if [[ -n ${SELECTED_XTF_ONLY:-} && ! $xtf_file =~ $SELECTED_XTF_ONLY ]]; then
+            continue
+        fi
+
+        xtf_binaries_filtered+=("$xtf_binary")
+    done
+
+    for xtf_binary in "${xtf_binaries_filtered[@]}"; do
+        local xtf_dir=$(dirname "$xtf_binary")
+        xtf_binary_by_path["$xtf_binary"]="${xtf_dir}/info.json"
+    done
+    nr_tests=${#xtf_binary_by_path[@]}
+
+    if (( ${nr_tests} == 0 )); then
+        die "No XTF tests matched the selection"
+    fi
+
+    #
+    # Pass 3: Execute selected tests.
+    #
+
+    print_title "Selected tests (${nr_tests})"
+
+    local nr=1
+    for xtf_binary in "${!xtf_binary_by_path[@]}"; do
+        local ret status_str
+        local xtf_pid progress_pid
+        local t_start t_end
+        local xtf_info="${xtf_binary_by_path[${xtf_binary}]}"
+
+        xtf_file="${xtf_binary##*/}"
+
+        xtf_variant="${xtf_file#test-}"
+        xtf_name="${xtf_variant#*-}"
+        xtf_variant="${xtf_variant%%-*}"
+
+        # Some XTF build quirks
+        case "$ARCH" in
+        arm64)
+            xtf_title=$(xtf_string_from_elf "test_title" "${xtf_binary}-syms")
+            ;;
+        *)
+            xtf_title=$(xtf_string_from_elf "test_title" "${xtf_binary}")
+            ;;
+        esac
+
+        export XTF_BINARY="${xtf_binary}"
+        export XTF_LOG="${TOP}/${xtf_file}.log"
+
+        printf "%3d/%3d %s (%s): " "$nr" "$nr_tests" "${xtf_title}" "${xtf_file}"
+
+        # Spawn in a subshell so that bash traps could be used
+        # (e.g. for power cycling the target)
+        t_start=$SECONDS
+        (
+            set -x
+
+            xtf_setup_cmdline "${xtf_variant}" "${xtf_info}"
+
+            # In: FW_*, QEMU_*, XTF_*, XEN_*
+            # Out: BOOT_MSG, TEST_{CMD,LOG}, UBOOT_CMD
+            xtf_setup_host
+
+            # In: BOOT_MSG, TEST_{CMD,LOG}, UBOOT_CMD
+            xtf_run
+        ) &> "${XTF_LOG}" &
+        xtf_pid=$!
+
+        # Print a dot every second while the test is running.
+        (
+            while kill -0 "${xtf_pid}" 2>/dev/null; do
+                sleep 1
+
+                if ! kill -0 "$xtf_pid" 2>/dev/null; then
+                    break
+                fi
+
+                printf '.'
+            done
+        ) &
+        progress_pid=$!
+
+        if wait "${xtf_pid}"; then
+            ret=0
+        else
+            ret=$?
+        fi
+        t_end=$SECONDS
+
+        # Stop the progress indicator.
+        kill "$progress_pid" 2>/dev/null || true
+        wait "$progress_pid" 2>/dev/null || true
+
+        # See console.exp and xtf-runner
+        case "$ret" in
+            0) status_str="PASS" ;;
+            1) status_str="TIMEOUT" ;;
+            2) status_str="EOF" ;;
+            3) status_str="SKIP" ;;
+            4) status_str="ERROR" ;;
+            5) status_str="FAIL" ;;
+            6) status_str="CRASH" ;;
+            *) status_str="UNKNOWN" ;;
+        esac
+
+        (( nr_tests_by_status[${status_str}] += 1 ))
+
+        xtf_completed["${xtf_title}"]="${XTF_LOG}"
+
+        printf '%s (%ss)\n' "${status_str}" $(( t_end - t_start ))
+        (( nr += 1 ))
+    done
+
+    for xtf_title in "${!xtf_completed[@]}"; do
+        print_title "${xtf_title}"
+        cat -v "${xtf_completed[$xtf_title]}" || true
+    done
+
+    print_title "Report"
+    printf "  Total : %d\n" ${nr_tests}
+    for x in "${!nr_tests_by_status[@]}"; do
+        printf "  %s: %d\n" "$x " "${nr_tests_by_status[$x]}"
+    done
+
+    nr_success=$(( nr_tests_by_status[PASS] + nr_tests_by_status[SKIP] ))
+    if (( nr_tests == 0 )); then
+        exit 255
+    elif (( nr_success == nr_tests )); then
+        exit 0
+    else
+        exit 1
+    fi
+}
+
+set +x
+main $@
-- 
2.55.0


