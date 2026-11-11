Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C34606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 19:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=GzPYyUT2;
	dkim=pass (1024-bit key) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=jr1ufLSs;
	dkim=pass (2048-bit key) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=Hpe50/HB;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=m0a6plmv
Received: from list by lists.xenproject.org with outflank-mailman.1484736.1688108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREJN-0000uC-Em; Wed, 11 Nov 2026 19:48:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484736.1688108; Wed, 11 Nov 2026 19:48:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREJN-0000u5-C1; Wed, 11 Nov 2026 19:48:49 +0000
Received: by outflank-mailman (input) for mailman id 1484736;
 Wed, 11 Nov 2026 19:48:47 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xREJL-0000mK-Fl
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 19:48:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xREJK-004SUA-SY
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 20:48:46 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c678-8faa-0a2a0a5109dd-0a2a4508a0aa-38
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:48:46 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c69d-f659-0a2a45080019-94a392170ac2-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:48:46 +0100
Received: from pps.filterd (m0367124.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIYTNh2829123
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:48:44 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11010025.outbound.protection.outlook.com
 [40.93.198.25])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4hvuxm9pvh-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:48:44 +0000 (GMT)
Received: from BN9PR03CA0373.namprd03.prod.outlook.com (2603:10b6:408:f7::18)
 by IA4PR16MB390101.namprd16.prod.outlook.com (2603:10b6:207:144::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 19:48:37 +0000
Received: from BN3PEPF0000B372.namprd21.prod.outlook.com
 (2603:10b6:408:f7:cafe::a6) by BN9PR03CA0373.outlook.office365.com
 (2603:10b6:408:f7::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 19:48:37 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 BN3PEPF0000B372.mail.protection.outlook.com (10.167.243.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.0
 via Frontend Transport; Wed, 11 Nov 2026 19:48:37 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIZXwR4131289
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:36 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hvjh28ufa-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:36 -0500 (EST)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id REJ8xlr4aam0hREJ8xXdgH; Wed, 11 Nov 2026 19:48:35 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=tpH
	/jn4+M7frt8tAasI2ACt3HCQdkODdjuyx7wToXhE=; b=GzPYyUT2HfcSmmvkx6U
	vXn7BCbw9p/8jOFjR4/ZgmeqNE5DBfg24o/yrxASi3VQjT3xJ/5XdqD4CHIREjYi
	u7z5KL71umxd7VXnG6Btd1hGf5hFC916sIMLzHw5ldCN94/M4kbwbw5IEo9R2mao
	QHeZbXH5+WLmNwzgn3i5H7llR92Te92rlEREUm9oUB9N7Lbkmva4v74MFzjOvbW/
	FRcVrUuNhBMiqfBxcSJxyGw9RpsA+TsxfsZbIwS61Sy4FjAJjK9ojT22V1ANN1t1
	IzBhpWO4Rswclx9NBSSzMsu4RT6LUGSYviweSIvlJ93wnmpkhxx7V7HVYLGorbqc
	qlA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sHmTJGac4+Ij80SGlZNKvIjnABCDOhwAJgxhuX8WvJVuE9+/hv4HUDcuGf5baPWJJBEMXQWcCzrlSUuXj/ytjCXIOmN8CFEV/AmJc8i/cEVpRRNDD6+aJCbSjiV7s6N3IslCTDkNw9pLcsqDI6gb8bfxM747d2UrrvBAz2ow3HzIHXDjbPdirY2nR/9YKtHupPt7GUAFNvdzyH5xb51n46djgZfAtu//GQuE24OlrxwBTIVnuAaPX4SjPiVVjY1fG+mi5piffsc0iMAF915JAxJpo28Qr/mfkhYwMJAHFOLUSaKfYSyj7aIh36KJMaOyPldSSXSaTInN2+AOc/zgdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpH/jn4+M7frt8tAasI2ACt3HCQdkODdjuyx7wToXhE=;
 b=N5IcnK2y03+mKiU4kLTZlCERl6rYzJ5YN4N0eZVaIGhESvdiX8VLeFfkChWIBzjJ+3iUB/60PThYzfEtCIoA0d5NAAPjtprNp7Wx6OO3lxgAUtfO3ajadLFIDwhsuqI0tAdwruMH452ERjAvQBkLPBjk63cJ/V3HQL56nF812RA1Xa+NzdVGwo1jSaXufZBRpTgjH70x5HFP3z5yjechx3QfmLd4//9yOxpvvqoPcxn6ksaNZz0sI4rP01PSDmhw/snS98BgH/gOsGsAFQiRbDSdLpcrxLv8f3F8YKOfQgwdjTKz9bB+zQrnASWDR2H4zy6xiDNbdcjNAVZh69cziw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpH/jn4+M7frt8tAasI2ACt3HCQdkODdjuyx7wToXhE=;
 b=jr1ufLSssKiT6vHgooSu+VKJdMY+EgyKyz7l+BPXKOnu5NgHvGs3SvGGMKahnP7UYHXIEKAupUWf+DDHkyt21VHv7I3NiFQJpx65YYY2Yv5dmgAUXITGTL+la0iU8lELa+Z8afqW1mD0U5HAC1KLMsZMXebqJ3mAOyBHTX2LymA=
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
	ppserprodsaar; bh=tpH/jn4+M7frt8tAasI2ACt3HCQdkODdjuyx7wToXhE=; b=
	Hpe50/HBeI/+e0WlY10tl5lmWKcBtm7p2Ry5bxhSYThA55h1hCvv653gV+QB65ek
	WJnH7i32KFMJ3OBFAdA3ZunW/g7psiWJoXxkl30lm49HrqD3BjFBCNmGanV7Xkgs
	GL41V/pFIKjCV0uU5rytpIGt3nhyyjcrmUy6B/eUYz8/WaJIrhEk8i8jbpTzayGp
	vXE/3JKns1s+7anbOCVWgsyltD5vPuWJEKfk/y7wXur7d+yzTiRgY8C7SMuAXLIj
	TJD3+w8NXa93cHXfW4qhLFAY+2GO14hNHFJWA7/fAiocbR4hlmQLg/26nB8UyghB
	UG8fcKvUr5I5yGYiBcBZLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=tpH/jn4
	+M7frt8tAasI2ACt3HCQdkODdjuyx7wToXhE=; b=m0a6plmv7+Fq1oxFf04B4x+
	zf2PUPWjOdKhja3pvZyG4RGMVLvn7K27lgx7P4azc1ObbaedHNe3Hj9JVpRVEKa8
	j6IRIkpgND93MY4xXX6Nlz70tJuebDfLTb+bLFg6KQeNakK4dJq2SgVe2SAtuuTE
	cDy7PU5XdE+HUAeuiTAxQZQpblinMAA/c1k4gCBiFrmW2fxV0guHSsESgYtoiuQZ
	GQXX3yJcGA2AKRmWyWuUmLyFso188DgWrvKjSW2MNijGdOTvE4aX5Bu4ICVdnUBB
	wt6QAALmrLhzrRs8fx6vHuTQqA5yrLeqiKHcbgh2IC5xUho1KTlkAUyslYlY/Ig=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: REJ8xlr4aam0hREJ8xXdgH
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v8 10/26] emul/ns16x50: implement RBR register
Date: Wed, 11 Nov 2026 11:47:44 -0800
Message-ID: <20261111194800.1070016-11-dmukhin@ford.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111194800.1070016-1-dmukhin@ford.com>
References: <20261111194800.1070016-1-dmukhin@ford.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110078
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B372:EE_|IA4PR16MB390101:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a84412f6-efa8-47e5-9f71-08df402cc75d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|23010399003|6133799003|18002099003|22082099003|261009223027099003|261022075727099003|261022105027099003|261021123027099003|261021121427099003|261021135927099003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	2qz8Q/V3vIg2iQAF7LSQR6k5QES0qfKSYqlrRyODHXxI6UxwCo44Dh/KcvH71L93+h0is6ApUlx+F+f2SFBvOTAEd+Kyyhu01RbEJI67AmyX60C1s67cEXus4NiupDCIYOeXQqPi17Xxn1AVd+TdHaOt5Lbxgoy1TTBeeZFaz7bRMWc9Zm31T9HIWVUDLqzSDzfQy7pyMbv+zYEWb4K48QjWfwCKELTcF70Sib15pxGyo7OwGH+09b1HQisdGVWTGvvFFFxi5LHYQr2Ef4Hl4umScZ9Q23gw/DdDGU18Yyly2W6YmrbUe8b8i4rHiIcC7eqFtT7k7ks5jW8zCYZJUp+6n857NCpf8my1FOZ4cgDU2DsrDO+GnGY6DYOd+5PhArV5h2PGAtfcqwlObU78Z5wXyx2WnDGR8xL+yV0XdRqJ5C5+ESc9VkxwCLduT9YY/qBaTYSh/VikA7Gd27nvOdvmo4C9Q2anC1tsuS/4q+k3u3J2RKlev0Ses2RS9SJRd7vDBLMGWH0wgRnDP+xGDOEGsdMUct/sN+EzZBfvhnY9+qUIUJrP0iuS+fmgPBQMpAKkoPEN+mjhlyluHHcHE0NYFLbd3Vct7vKvB1uROAu8Sxl6NfyTzQt1oM8Xn2xeuzjVmF63UlkVm96nJP/PL4Ri41WovETzb6okCt8SznHssOkBD3CfqI+GH22CqPB3jzOSZ+5XEXplvlpTMVeBaA==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(23010399003)(6133799003)(18002099003)(22082099003)(261009223027099003)(261022075727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261021135927099003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	m9jwickCNfhRFJA1IZvjzbtt1nCV2p/u+Kj2yrWtoxUkMS+0WqVz+423daLnY05bUjidAgEgrV95v8JriRtg19CuGe3BhqqS/n9P0hvc+Kz+UEGddIReqBR9e+XFaC2SWUaa99ruWf2ueIDNSaXvIG1B1novHMr74jzqgs0p553qpr0ppH+WnqYACui3svN1+fF6M6hUIesQYUUKSIJDTr91H//IPHO40QudBlQlqHr35tmfWkTpo2mXf9irpwKsEV/vrr8tAbFA0c4QCHi5/WfK9qjVwgiaCVIH+aeb6kVFXeJ5JALgCG0+uzh38GGFDPf9IYfV6+vCIV8u++I96gIQQyw42fVZnNESWvRgguKLqB4XU20MRBU+pn1GuIdd4kIFIMhEctGiz02vHhsrgYtxSLnCML/tZ/89mIyCH8rYr6ERQoqcxgvUDP3AFyRx
X-Exchange-RoutingPolicyChecked:
	MJDapFvCJUJC7ygd0NVcj8azQ33z6TEoU3LJKwQlKvQCD0uDsuNS8iXvbbxNnqjngYM+bXzR4xKInAhs/SHdH7i6kHD9dFRPaoYqIBgfbmLZ1DRv4BMWok2S8Sxqz2zAlwN2PjYjGG/O7QEBIzTr3UXhCH5w9cjOQDAKNglotofCb3qAWQyxDk2a16ALYrqq53dSxV91OhdYtia7Wd3win7oflZGvq7LBkaONkIr3RyxFaSiAKKJt8nqvrnSwvJJ7KLJBT2gYMnhOGRgJF2F7DxTIOVWYKqzj4SoV3LZCooU1qqvQCMs0CTpZZ5Zvc3M2dOQ9s12RpnEc5H7FUNvSQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/r8reXR0GfacVF/iIuiRELiFRJw7N1bQdy8fTbCph5sXK5wgdoz98pPuDQmgvuWt5c53d9PBkWJgq2PPh/if103TgFwkPAXJDGxwlxMt/kZfFnqfUateolsvRNe9MrDCdp0aGU5dL+OWFNnLcJNxp0gtFcpwLHUUztn8yXH3vy3vdmtHT9WD6RFjUpHvf0kMavg+zXf5xv6umBO/DmoO13vAe9g24NZagjKW9/yt5JiUeMBBi4jNkH1QaR3/mzfQB7Gdbkrzwj2E5Qq4nEnYQOoyTxs9uks51UYRvwawZR4ONnd9HKsgXzJ8LVxoU8C5fLNSNmYtWWqzLxlYLDhQVgQiBO/ZyQYt/EO1qpURQR4LBq/BHX+CUgetkd8j8xNz33yERzI+fwYTitDlyzqp5tiqSB2Ham/80aPtKtIbPczFGE3yiDf+ZRyXKrEhJqsrUNfWoKj8CaA+geFZbmnrL944iBhr5Nexf/oEVvkxkOuhreLPIALakOKdpN/1cNT4SNDMf06a1r51De4NOaytaLno5t6QOarPoMKeic2bn/yiZJjGzksWhKXApQzYDJiibm0K1lZYf/RhORVruXj3tsN1MwUwTRjceL1LdYOu++p4KgYZwEddJn2lwF2Asv1PuegRYyorU8SjCOsge8RWgg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:48:37.4506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a84412f6-efa8-47e5-9f71-08df402cc75d
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B372.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR16MB390101
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX6o1atTNYZh9a
 5IAT7Xr8E6p63jbyCRmy8wWunBp7ig7lo5njtxEcfJvuLQUWRH7/cvJWdhkCC1dPE+MCiOPlmOs
 3FOAzRxxCI2Xw7JsfYtym5BdqbhvTXqedigMiF4KEZrM/Kt3D/gM
X-Proofpoint-GUID: 8a4uU_Ow34aAkPDvoBtQAapcwx9Ctdvs
X-Authority-Analysis: v=2.4 cv=ZKBCCn7b c=1 sm=1 tr=0 ts=6af4c69c cx=c_pps
 a=Eox/QAxx2gIfswQ7UCXYtg==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=YJXg7OVxOWrJwj3yZo-i:22 a=cbNQJ9GKAAAA:8
 a=iHY80BiRb3QM9dj4aJAA:9 a=G69WFyCBNqGPyalROSdv:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfXwh1A6WpyTGOg
 dBYQ/5dReDNi5ep7l+bdHHZ9u5Wq+E8FkHIxhGo+F3FxJtcqRhOMgmkMj+0GO9kMkFbk1fQ8rgY
 rn7KoafaNmNjdBuHRzxNWdC8m7kNaGpbCWFeHmoDOgXRySoOkIXK0qIZEf7UBltz39PHAfEDQyt
 aVqZFdYAQwddPhgbOhLehgpOEVRM8qfu1vGICXG1RFY3xuoupS0Y8/WukoOXcZ8AvOyMU4FOLB3
 lgUawurZWz61B9oa3Aw5oBF9E8l2fQ3kKFKvdy3Jir0mW6nZUuSmXq1yxAXOHEXSThHB7yva3zW
 b65wRH2lm7E9upykmTQRuyFEeAq/j4fKJPazAfrCrof4HI9ph1aYk58oXWgBAguI60l2LRrK8od
 n7ZG3PiU+BEQ6Uv67GB6EoHbXp8rATFHDS3BESyplOyrWMnGb7e9MqkAgCDIGjdwzxBxqD1Dzqv
 MigjrQyRjRR7dVDFRwg==
X-Proofpoint-ORIG-GUID: 8a4uU_Ow34aAkPDvoBtQAapcwx9Ctdvs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110078
X-purgate-ID: tlsNG-c1860d/1794426526-CD94A87B-39CB8D78/0/0
X-purgate-type: clean
X-purgate-size: 6037
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Add RBR register emulation to the I/O port handlder.

Add RX FIFO management code since RBR depends on RX FIFO.

Emulator does not emulate NS8250 (no FIFO), NS16550a (16 bytes)
or NS16750 (64 bytes) precisely for simplicity. No baud rate
emulation either.

RX FIFO is emulated by means of using xencons_interface which
conveniently provides primitives for buffer management and later can be
used for inter-domain communication similarly to vpl011.

Account for DLL == 0: in this case, disable receiver.

Add UART_LSR_DR handling since it depends on RBR register access.

Implement put_rx() vUART hook for placing a character into the
emulated RX FIFO from console driver. That implements physical console
forwarding to the guest OS over emulated NS16550.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/common/emul/vuart/ns16x50.c | 132 +++++++++++++++++++++++++++++++-
 1 file changed, 130 insertions(+), 2 deletions(-)

diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
index 9f530e589495..d04caf2baf2c 100644
--- a/xen/common/emul/vuart/ns16x50.c
+++ b/xen/common/emul/vuart/ns16x50.c
@@ -123,6 +123,76 @@ static inline void ns16x50_unlock(struct vuart_ns16x50 *vdev,
     spin_unlock(&vdev->lock);
 }
 
+static bool ns16x50_fifo_rx_empty(const struct vuart_ns16x50 *vdev)
+{
+    const struct xencons_interface *cons = &vdev->cons;
+
+    return cons->in_prod == cons->in_cons;
+}
+
+static bool ns16x50_fifo_rx_full(const struct vuart_ns16x50 *vdev)
+{
+    const struct xencons_interface *cons = &vdev->cons;
+
+    return cons->in_prod - cons->in_cons == ARRAY_SIZE(cons->in);
+}
+
+static void ns16x50_fifo_rx_reset(struct vuart_ns16x50 *vdev)
+{
+    struct xencons_interface *cons = &vdev->cons;
+
+    cons->in_cons = cons->in_prod;
+}
+
+/*
+ * Transfer character from RX FIFO and return the RX FIFO status after the
+ * transfer.
+ */
+static int ns16x50_fifo_rx_getchar(struct vuart_ns16x50 *vdev, uint8_t *ptr)
+{
+    struct xencons_interface *cons = &vdev->cons;
+
+    if ( ns16x50_fifo_rx_empty(vdev) )
+        return -ENODATA;
+
+    *ptr = cons->in[MASK_XENCONS_IDX(cons->in_cons, cons->in)];
+    cons->in_cons++;
+
+    return ns16x50_fifo_rx_empty(vdev) ? -ENODATA : 0;
+}
+
+static int ns16x50_fifo_rx_putchar(struct vuart_ns16x50 *vdev, char c)
+{
+    struct xencons_interface *cons = &vdev->cons;
+    int rc;
+
+    /*
+     * FIFO-less 8250/16450 UARTs: newly arrived word overwrites the contents
+     * of the THR.
+     */
+    if ( ns16x50_fifo_rx_full(vdev) )
+    {
+        ns16x50_debug(vdev, "RX FIFO full; resetting\n");
+        ns16x50_fifo_rx_reset(vdev);
+        rc = -ENOSPC;
+    }
+    else
+        rc = 0;
+
+    cons->in[MASK_XENCONS_IDX(cons->in_prod, cons->in)] = c;
+    cons->in_prod++;
+
+    return rc;
+}
+
+static bool ns16x50_is_tranceiver_enabled(const struct vuart_ns16x50 *vdev)
+{
+    BUG_ON(vdev->regs[UART_LCR] & UART_LCR_DLAB);
+
+    /* DLL set to 0 disables serial communication. */
+    return vdev->regs[NS16X50_REGS_NUM + UART_DLL];
+}
+
 static bool cf_check ns16x50_iir_check_lsi(const struct vuart_ns16x50 *vdev)
 {
     return vdev->regs[UART_LSR] & UART_LSR_MASK;
@@ -130,7 +200,7 @@ static bool cf_check ns16x50_iir_check_lsi(const struct vuart_ns16x50 *vdev)
 
 static bool cf_check ns16x50_iir_check_rda(const struct vuart_ns16x50 *vdev)
 {
-    return false;
+    return !ns16x50_fifo_rx_empty(vdev);
 }
 
 static bool cf_check ns16x50_iir_check_thr(const struct vuart_ns16x50 *vdev)
@@ -400,6 +470,17 @@ static int ns16x50_io_read8(
         }
 
         /* DLAB=0 */
+        if ( !ns16x50_is_tranceiver_enabled(vdev) )
+            break;
+
+        /* NB: do not forget to clear overrun condition */
+        regs[UART_LSR] &= ~UART_LSR_OE;
+
+        if ( ns16x50_fifo_rx_getchar(vdev, &val) )
+            regs[UART_LSR] &= ~UART_LSR_DR;
+        else
+            regs[UART_LSR] |= UART_LSR_DR;
+
         break;
 
     case UART_IER: /* DLAB=0 --> UART_IER, DLAB=1 --> UART_DLM */
@@ -694,13 +775,60 @@ static void cf_check ns16x50_free(void *arg)
     xvfree(arg);
 }
 
+static int cf_check ns16x50_put_rx(void *arg, char ch)
+{
+    struct vuart_ns16x50 *vdev = arg;
+    unsigned long flags;
+    uint8_t *regs;
+    int rc = -EBUSY;
+
+    ASSERT(vdev);
+
+    ns16x50_lock(vdev, &flags);
+
+    regs = vdev->regs;
+
+    if ( vdev->regs[UART_LCR] & UART_LCR_DLAB )
+        ns16x50_debug(vdev, "THR/RBR access disabled: DLAB=1\n");
+    else if ( !ns16x50_is_tranceiver_enabled(vdev) )
+        ns16x50_debug(vdev, "THR/RBR access disabled: DLAB=0 DLL=0\n");
+    else if ( regs[UART_MCR] & UART_MCR_LOOP )
+        ns16x50_debug(vdev, "THR/RBR access disabled: DLAB=0 loopback mode\n");
+    else
+    {
+        const struct domain *d = vdev->owner;
+
+        /*
+         * Echo the user input on Xen console iff Xen console input is owned
+         * by ns16x50 domain.
+         * NB: use 'console_timestamps=none' to disable Xen timestamps.
+         */
+        if ( is_console_printable(ch) )
+            guest_printk(d, "%c", ch);
+
+        if ( ns16x50_fifo_rx_putchar(vdev, ch) )
+            regs[UART_LSR] |= UART_LSR_OE;
+
+        regs[UART_LSR] |= UART_LSR_DR;
+
+        /* TODO: check FCR when to fire an interrupt */
+        ns16x50_irq_check(vdev);
+
+        rc = 0;
+    }
+
+    ns16x50_unlock(vdev, &flags);
+
+    return rc;
+}
+
 #define ns16x50_emulator                \
 {                                       \
     .compatible = "ns16550",            \
     .alloc      = ns16x50_alloc,        \
     .free       = ns16x50_free,         \
     .dump_state = NULL,                 \
-    .put_rx     = NULL,                 \
+    .put_rx     = ns16x50_put_rx,       \
 }
 
 VUART_REGISTER(ns16x50, ns16x50_emulator);
-- 
2.56.0


