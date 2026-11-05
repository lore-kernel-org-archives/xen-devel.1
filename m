Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F9A606A326
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=IfODV3qj;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=gmXd3yR6;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=M9unIzxu;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=VQJAzYPp
Received: from list by lists.xenproject.org with outflank-mailman.1473509.1681230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmRU-0003rL-64; Thu, 05 Nov 2026 01:39:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473509.1681230; Thu, 05 Nov 2026 01:39:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmRT-0003on-Qy; Thu, 05 Nov 2026 01:39:03 +0000
Received: by outflank-mailman (input) for mailman id 1473509;
 Thu, 05 Nov 2026 01:39:01 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmRR-0003Zs-Lh
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:39:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmRR-00CQvb-2Q
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:39:01 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebde11-bab6-0a2a0a5309dd-0a2a450a8416-34
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:39:01 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebde33-f2d2-0a2a450a0019-94a3921783fc-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:39:00 +0100
Received: from pps.filterd (m0367123.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mSLm2567982
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:38:58 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11013016.outbound.protection.outlook.com
 [40.93.201.16])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4hr8vmvbkw-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:38:58 +0000 (GMT)
Received: from BN9PR03CA0155.namprd03.prod.outlook.com (2603:10b6:408:f4::10)
 by DM6PR16MB3720.namprd16.prod.outlook.com (2603:10b6:5:2b3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:38:55 +0000
Received: from BN7PEPF000000A8.namprd05.prod.outlook.com
 (2603:10b6:408:f4:cafe::4c) by BN9PR03CA0155.outlook.office365.com
 (2603:10b6:408:f4::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:38:55 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 BN7PEPF000000A8.mail.protection.outlook.com (10.167.245.232) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:38:55 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mitI2969554
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:38:54 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hnxs4nrrc-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:38:53 -0500 (EST)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id OmRHxrnJ3CiSDOmRIxv96N; Thu, 05 Nov 2026 01:38:53 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=ICn
	i6QafSI0sZgyeoJf0rlSYN5mlAf+VMp/I2BHcwlQ=; b=IfODV3qjhcklkP4mc17
	FCclZQz06K9ZczmuUzM5xXDf4MSryxfPWig0h84+45Co0pxe4qJEHKlzzSiU1/KN
	1PPReKy6FpD7VhEfY3D4qT1RCuBtS4Q98r8e4U+6A17niPpizwH8iYqwVx0ne6lP
	GoZ/UIJEGhWIXY4bAFQEzlmlpLhIfz1Ai6zrMMxF1QrOHdwBobP/eExR0MhHCT2g
	fdFsEO3k2Ei2WWpEmP3hpZQz8wPG7Qg0dWlIsrimxEqbA1tJfxvr5Wo1X/KI/gHb
	H5qmfxf+0Hg4bFv5Sw5aDf04BHV2vBROOE4Nwxc/P/uA6Kfet+H4XljfRZNigInC
	rnw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rSoiKLAaZmhPJHu24O26VeBqTWs2LSObiEmvnVa3RSEL634lgQHnfBsHz7gqg+NrMBc8Olhws//2aij/RrdZoOjC8ynSn6As7B0/MGpzl5ykcQlUiNKbSZyO2nf9lnmiOeontdLyf7ZEGFPEymj0jEO0EYD2J+Mkmd0h5dMohtCQUGE4Wb+TQPz6bvzZF5UIBnl+OnvB9v7psS6FxuClbZHxi93G25GF8wokhI52vtFm03qmTp5jFazI0UClYiKkgAEokSBkYGn+PvVuG9MItMKrQdhY1pcnend7jTWX4dws5usefKrqbv6e4CZ6+qbwmoFYpYX2vfYEV5NTaxHw4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICni6QafSI0sZgyeoJf0rlSYN5mlAf+VMp/I2BHcwlQ=;
 b=nWZDy0JLxnl0m8IXUBZ+DW5mY4gj1brH1zWu1mOE2WeNRZ0iz+1QRpnRmbOuIxBMZNyKcjoeW2Ww4rLIRgRfX4QnIglDe0EYIKfjcTupQJsljfLqHVIMWFGxnL6vOVMayhpRkjqthJR1pQRGMZvVMpwyJxPTBONzsBWF57HhhcxeXA5yfaXP8G7IkrATrtVKm6sDqB8t+eu4Ax2IIax6XImVXYcjMrOisrV+ecw5VMeiUXWVBSbcOexiok4ZCCusF0Gn+pYg4Nu/KkDNIFDknfU5G9zqCiSHKAAwkHONBEjwx9RxOYDjf39qesbLZ+IeijD0cgZEvRpFBv/8Xct3Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICni6QafSI0sZgyeoJf0rlSYN5mlAf+VMp/I2BHcwlQ=;
 b=gmXd3yR6H8euIezUUR8ch6osothBVLI6XB7/hsG9HoMP6UitPs9UG3WSC7IDjlI0T3mFiH7IhftNneDDLDxt9SYXEf4HZ/XZ8Ni43iDwzvfu/XmhkNPAUT/NmEuXR1oSlPHR4bRgvju9X1EtdoPUVayW92RbD5Nqf0fWFNr6HLk=
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
	ppserprodsaar; bh=ICni6QafSI0sZgyeoJf0rlSYN5mlAf+VMp/I2BHcwlQ=; b=
	M9unIzxud54RLbKAu7jVkOReIVf2unWrW/tixm8CXEC/RusejZUA4toKMEtF0nVH
	MIi0qb5kZ08nheWrGHHNN7A2OWTjk2IVo0wnbOrIJwCYLqowy0O0xS92sRLfO96B
	MWWKZeD/t6JUlmL4itGAMRMNe5b82YJlKkmeFzz6TM65xqNljt/90czrdG5lqNZi
	2innSyLSkReRqvg3Cfglk5u1I4Bzc8rrfkvNDsHYS8/rEiewiYQn0kMxijZM8Co5
	mglerU7s70xCUOvc3Wu+TPAbXdp+yyE8xDHHIfTsKDIJPIT5xePOmWFsAhrxixVp
	HXADuZkvm2gmiSOAl6/BmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=ICni6Qa
	fSI0sZgyeoJf0rlSYN5mlAf+VMp/I2BHcwlQ=; b=VQJAzYPpHn3wwASe0AUpDcT
	m14pw1U3MO384xcBlLRDeCj8k44BsY94V861Ne5wQc4lzQ23tBTvIv5ESs8Y6IqK
	3p+wjLRJ9l0EnDBtx71ZYnobr7b3I2DqXKF+ucQbQ7pPcNFIdLg79eacqgQehfrH
	JCwcLFb3V3FkKZaSCGceMDUAOmIw37W7u2WDNjx9TKpLnGEkv9LUUGWb5Tno/3Dk
	xYzXud/So91SNcZoaxEyWITdZ/8wymdDcp2sn5OEWyCsRIIBu9vWcHAdeswIfM9V
	FWpM50pwsl4QNydPXw0znoCbcpe76ivIKbxHhCEJRu4zDGQPZaD7kmdrr0sLsxg=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmRHxrnJ3CiSDOmRIxv96N
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [XTF PATCH v1 11/15] x86: export per-vCPU IDTR initialization
Date: Wed,  4 Nov 2026 17:38:13 -0800
Message-ID: <20261105013817.719823-12-dmukhin@ford.com>
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
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050006
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A8:EE_|DM6PR16MB3720:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e6c078b8-417a-4446-e639-08df3add8dee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|11063799006|56012099006|261102123227099003|261021123027099003|261009223027099003|261021121427099003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	BTXIPYP9fMjyq7c2H+pur7DxyMg8ZaBekJ5pHfLT70fu2b+GmN3wv9gg7QcYX8e/5InXj4RBw4XmOQz3FA/exaMUJZNTfq5fv6hF2E7S+VtxkTv+6+qTKgWBLggGtXBBwIOJTFeAfQrRfwk/UYES433L1fvTOognGhSLMsIxr9ty1DLk3dIN26r+faVipBVACPjVfSraRZuzK0RRHSbqO0UgN9FydthHgAG3zzGTGtJE8ngLhPMG85rbET3WXTNKL1470y2xEiqaDRNNHLzw5ZUx44DDk38n1c4gQINd4O5O6d80nmM0nP9WYOx6xopCojvDm02KRmrxXvJthibeMffNBsDjoI15C4/kha0Wthfj3Q885eWIMg1+NOjW4mJyjB/t097QQERR218aw2p22WjsC4A8v/Iq9xq7HCLM7D2g68EkTRzlhDRCuzPNBDW1ExcpD+XoJ1LJxAUuQcugXGMHXDiGcH5Gct976CTxJTmg6iySpsz2w48SoIy8VTY0b9T448Ya5zVISc9F9YC1Xt6Vo+aIPnqW5Z9aGcLWK3oRxPPh7Ki9x5b1eS3iIBvpz/PuOFF5k5j1SaZiPYXE5+oL5Dm76q9I7162kDYtSsZZWBDWEJGZzmZtHYwIV9m886zfUL5Us3zd1gdf0NwJFWSWdcoyzkR+tmAB1pUteCHinpfxQNA4nkjkIMbmB4Z5HWMNt7GB2m25MGmK7Z4+Aw==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(11063799006)(56012099006)(261102123227099003)(261021123027099003)(261009223027099003)(261021121427099003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Hh4VgoE6dZyGC/OBy6uOgZmApsD+sPpo+WRc/BakRifm6W29WqGPJWTxtL4O6xMs7GAUuPH5k+1Ro/rgEDHeL0ki0ZCHZ0pWavoI5HmWPDFYRaJELzz1LM7GMzNH3CBcuNFdfSkaI1CSJUA1HlUyx/n7lPVpcT07hioZG3NXWuHSXGguKAwud/ZnLN2/7iGPgClC2NKg6GUnXVgfgHxKORIL3FueUgiYuEygSvKAV+Bd6OXT5tOFk0Ce9HzpgAyDJWOzZN1ikIS9vaz08mAqZMGLOM9GLmGaW3+sn5lvQj4Z+7qQQyVnplj88vfeY5iFdejY6wPc3DgBdV6sBcQOPTZB8gf9Nz7vJFPTGp7hqdz2glQssMmKMOjY/e8PmKE9BWWNLGVN+vpmYEC7piBNAmTjRKBh8R1OQpiVrkK1wXI7E28qdQ4258wY1kFoNhXu
X-Exchange-RoutingPolicyChecked:
	WRL+mPYa3xJDaaiu1vA5+qBLnv+0R3xTVApH2GhuGRGp3ndjlLLsmtNBcBw0Vdy0a1EXNSWYobSPsq7WsUmIu2vFtVcEpUVT9c9CwdSMipD5yvq3iubD0tcLgSGok/Y+2CMgwmcCeBz3QHIPciy11oUuQzxXB61bv9QQK5X858KKB3TcGAQgmQyNvQPX/+J+hi+JIFOllAhkaBVG/ZuSXRx7Jbf7Vc7Qdt1KBDcIzm/Ka7WHFLdrpam0VzZaFbGwhQUd6Ud+GRkWcPM7nr4lfs3lKU2sXHi1zUaUygDr3WWfGYGlPIv4qYC/5jqFUYGcsQtjTsF4T15KLuUMrO8bdQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VU8bZ4C2+masFBBoH83dSgqpbqtbxYNwzs0GgToe+v0yHUnXyb0scg+UnppzF45n79tOVSBokhVFZpklA8M/s6AOsvILquG8LH2f4s93DOa+CoA+OvKUJf6OxazDZz76MzyAwxUKNPKxc80dfGeq0T4PMxxvIhYO3i+IjVc75EdwkYJLCz2FovTfS3BAigv7J5RCUlHn+IB9tm552KfM4vOEIJUSyC1pYfX39XSGx8YOKrXhecaPIr2eFVyXwqgEwaw/aOkDWrOpo81JyPOls4hUKScM1tp4FlSWErD5vBhrcvVVsvrgjrnANwELA/iEhRN+FaIEa5TRWpRJzGX2y9iQME6hUBv16Zgtwi62VNX85JVuYl+W8ZHO1Ms6yQ2XrP1B6K8c8n3dIDQvulLTfCBEBx3lf4CTlFShxkXm1ot/bICTE9WjWq4cAyItwzr3g/SlNrTGJutVq3ladQ8Kf4Uk5cXD0jYMSaKLCvnZ24kwVObpmUMSnjYhFMbHIPJSljwSIohb5oxvjIPsPiMIfBqSKgq4oZ9wOYBD9qXl7aUPe+X5kAP/fDgJFOrW9RTtC66a/gMPFQAu9P95k48NSYSxe7c5ycuA1HFRv7RF/XtPN9+bwwKGd3lY2IKrwtsardqgqcH1FZl4ierZ/Phzkw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:38:55.0246
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6c078b8-417a-4446-e639-08df3add8dee
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR16MB3720
X-Proofpoint-GUID: TQc44XDuifNNeXNtXFuQxmicAoj_GqVo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX7R5rysskA5/K
 TG1VS3RqpMmX24k7ujGwSASSQCDbrkwjmaZjwA5aWSYyUQQ6NYdcny5fTt1750mINDkiz2cRx2p
 MHKs44LSGigocDiIf0QhYESELRjJ/DNueN/2Q8GAQcjKTVh300uuWxMMghQaQFjcyjae8y9ZOnP
 oE0fAWaup6g1vwKdQffuZGUySWnOWxyR6mEllfQVcQtxXrzeyQMiGQLooS5P0Ug91c1XPk5mo4s
 ZvxNOrLfw6GOOo5VGoQz3MkR4LVKkBu/S87geTqqUwDgs5UnbXcsSlJkXJGOP+B/6frlaWfUPb5
 CEpMCTGK4LRnF7jgTBfMEP8fMTS2i/ZYSiaVZqvZnA6EgD5PBf6tI72yn7BgAhiXZJTwHc8Exd+
 2Se20uxa150lOCB9P1FeMv3OgRsGzNM4ST2Z08hF54upmnzRktfaKu8CP56oDwzOUv5TkiRvPtb
 Lk14wDF3eOczF3Qo82w==
X-Authority-Analysis: v=2.4 cv=T7AZ3PKQ c=1 sm=1 tr=0 ts=6aebde32 cx=c_pps
 a=YOgfsySBG6Gh3lLixmEA+w==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=N9_n2FxmZfwfyRXvS9-E:22 a=cbNQJ9GKAAAA:8
 a=lWYGAnqwF_VhU8H50RwA:9 a=DqJYxgmhk6moR-_7_KoZ:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-ORIG-GUID: TQc44XDuifNNeXNtXFuQxmicAoj_GqVo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX7pudwCv6eTLs
 WgvGLkQZhk/POruqdUEp/E0/DXR6CB70RksHiuTrGGqw4RfbPCM3mCN+eSV9I/gotKNiD4zun7e
 qCx9fRaouE+UffrpNOwd48k/B9fWmakqR8XzjcGrvw/Gl63EcAFX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050006
X-purgate-ID: tlsNG-4011c0/1793842741-583CCCFC-F86AE3AD/0/0
X-purgate-type: clean
X-purgate-size: 1378
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
 arch/x86/hvm/traps.c        | 7 ++++++-
 arch/x86/include/arch/idt.h | 7 +++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/x86/hvm/traps.c b/arch/x86/hvm/traps.c
index ad7b8cbc3dda..dc7d617b80c5 100644
--- a/arch/x86/hvm/traps.c
+++ b/arch/x86/hvm/traps.c
@@ -70,6 +70,11 @@ static env_tss tss_DF __aligned(16) =
     .iopb = X86_TSS_INVALID_IO_BITMAP,
 };
 
+void xtf_load_idt(void)
+{
+    lidt(&idt_ptr);
+}
+
 int xtf_set_idte(unsigned int vector, const struct xtf_idte *idte)
 {
     pack_intr_gate(&idt[vector], idte->cs, idte->addr, idte->dpl, 0);
@@ -116,7 +121,7 @@ void arch_init_traps(void)
     pack_intr_gate(&idt[X86_VEC_RET2KERN],
                    __KERN_CS, _u(&entry_ret_to_kernel), 3, 0);
 
-    lidt(&idt_ptr);
+    xtf_load_idt();
 
     pack_tss_desc(&gdt[GDTE_TSS], &tss);
     ltr(GDTE_TSS * 8);
diff --git a/arch/x86/include/arch/idt.h b/arch/x86/include/arch/idt.h
index 02955d54bae4..b54dbec830f0 100644
--- a/arch/x86/include/arch/idt.h
+++ b/arch/x86/include/arch/idt.h
@@ -29,6 +29,13 @@ struct xtf_idte
     unsigned int cs, dpl;
 };
 
+
+/**
+ * Load per-vCPU IDTR.
+ */
+void xtf_load_idt(void);
+
+
 /**
  * Set up an IDT Entry, in a guest agnostic way.
  *
-- 
2.55.0


