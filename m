Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46DD606A321
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 19:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=qGFYfWVy;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=UH3hVjJR;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=RF+M6ToZ;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=iHmgefe8
Received: from list by lists.xenproject.org with outflank-mailman.1484722.1688082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREJA-00086v-As; Wed, 11 Nov 2026 19:48:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484722.1688082; Wed, 11 Nov 2026 19:48:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREJA-00086j-70; Wed, 11 Nov 2026 19:48:36 +0000
Received: by outflank-mailman (input) for mailman id 1484722;
 Wed, 11 Nov 2026 19:48:34 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xREJ8-00083J-Ga
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 19:48:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xREJ7-00F4YV-TR
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 20:48:33 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c67e-bab6-0a2a0a5309dd-0a2a45028f0a-34
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:48:33 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c690-6ca4-0a2a45020019-94a38ff1fddc-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:48:33 +0100
Received: from pps.filterd (m0367128.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIYamc3992183
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:48:32 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com
 (mail-westus2azon11012041.outbound.protection.outlook.com [52.101.48.41])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hvrf7v272-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:48:32 +0000 (GMT)
Received: from MW4PR04CA0172.namprd04.prod.outlook.com (2603:10b6:303:85::27)
 by CO6PR16MB4305.namprd16.prod.outlook.com (2603:10b6:303:b0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Wed, 11 Nov
 2026 19:48:25 +0000
Received: from SJ5PEPF000001D6.namprd05.prod.outlook.com
 (2603:10b6:303:85:cafe::3c) by MW4PR04CA0172.outlook.office365.com
 (2603:10b6:303:85::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 19:48:25 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 SJ5PEPF000001D6.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 19:48:25 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIZIUn196224
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:25 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4htkxw5613-12
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:24 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id REIwxf1abQVyyREIwxG09n; Wed, 11 Nov 2026 19:48:24 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=W9z
	Dp+yLuzLH7t4eYcv/yIkt/2k3ixRO+QBB9212Fpg=; b=qGFYfWVyngYTDOyk2X2
	nzCPrMrrQHxA2xISAK3LGcFgyKKfdDYsOQ1YVoMEQqgXoITKe/exrEHfU8bPCE1K
	VoT8iWkzgGnjLGE+wy58SH0brO51nSg3TuACHnFwsxhgDDkFvZZDPEQPzZgagp61
	PBTe6X/lKejxTmU9eqnyim0+bqz8fzlZ8Osk6+iJbv9lv1wSup4vp/wa7XA7fieU
	4H6k3iFMjyJkbuSPLcYtRSF240r6acs8raNtl8aKa33hSb+UgU9hZPxnvwJ5Fxw2
	vzIMBrEgjkJOWOeBkwhpy6n/zwunpEtJjT/gmF5oM25gEU3vVaEab7tG/r4wsOgx
	/Kg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RIJ7AEKAnwmMvN8kTaGkF+BggZDNpUTo4WmGIg9MvFHJpahzp0OJ7DMcZ5UknQpo/qlJGbVKB/gk2klh1cOFxlLSgT5z3t/lWtRHhyQokrwQJxxfa+lyKLGy+GkJ0J8Rle1RMGDo6vWQgoNOQqq055KPfJHnnLQkxMogVot6LzUZ/oineaguB2g35Qqw+XI0YMDQYJmvrHpDOesfUmS4U+Boh9IF8SrNQmTyneOMZZBI8BXOyNL51WHBy6bf2PWF2jYnDaH1WYYnmCC2CXmXO4rvwV8iTqIkoSdV0faaUbuRBqAMwKxRAWoOIn8CpHYU2t3VA+r7RNBVTFstQl7SZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W9zDp+yLuzLH7t4eYcv/yIkt/2k3ixRO+QBB9212Fpg=;
 b=qwqBPn79bF9FtkDsnAY18RCEhkddSbv3MoUzn8WMYEwo0asIk3MJm+JdHn5ggZ5n6sGKZL1Xzv4IYR+x0NhSbVxKW+GdpnuKMUF/6Cl1M/7ZArbqt8u+KP+IYsvpppD3f1mZPGx8Lt8KyXXJ5VKZ4V+CC0LaJffnviBv7b1dmmsW3OCtK6edLLUp1sp7JH02jiR/bHWv+oBf6O+vbdGFmQPzZrcs9n/NTCgtuzI1Op150pbUMzoLva9OBsxO2+r9pomUaexekc45xFwKXl8WtnKSFIMDpr2nJAYs3snCeE/W70ZGZ7pEda2/Jp6SJ0hv0/9XYH46whULKe7GhkXyCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W9zDp+yLuzLH7t4eYcv/yIkt/2k3ixRO+QBB9212Fpg=;
 b=UH3hVjJRqd8sUlt3BW53ziJXxOifFDUYpDAq54YiuMyOh3ltRXL01iOeSVsYlHslsEJNjBm7pvLTISS5YUSYCTw3Y1WkIrTEUmnI5LmLHX7/c16MsNMdOZKQTtmoqJ+s/ji6ZTlWAVMHWfTP4QkUWHImLOOHYmqi41jj9rJSlfY=
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
	ppserprodsaar; bh=W9zDp+yLuzLH7t4eYcv/yIkt/2k3ixRO+QBB9212Fpg=; b=
	RF+M6ToZmvfsQYc3l6BiOWhSzSY/xeyaAYLm7u1xxIuIx7QoCvw8rJPMCUZWaInQ
	5oyXAPMkRfhBidXfVnumJ4h9fZejKMXasVKZNIhyhI9qMZ5J15tYZ2OzAiyiPLaX
	HthyPVFEV0hU3jC3q2u102J3eJIfTFvxjeJ/KyPZZlcza0dOMAlGGNjrcbGDwJJK
	AtmqdYF4Eicv8B4JhnyN7KJ8q1Ut8sHuZo3jzTDl+Hqk09MmLMkRNGutdX5Wqgyk
	O8VUPE9RtPdEAKkHeMwW7fOu5XFSuEDsGTjul8j/FQVurA+zaOEL1eAS0sjW9iTl
	29V1FtTzobb8/o9P8lZp/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=W9zDp+y
	LuzLH7t4eYcv/yIkt/2k3ixRO+QBB9212Fpg=; b=iHmgefe8zcMZsmo7cCNihi0
	29IjFqEzsxo/It2HQAFdVzdSQK7CE5XIaT1jiGwvIJ19gWLAigyXdXQyTTHU2+gf
	p0+mpBnmBjVNcgj3UEfJPFB+VCUpvtNWMNHajrOUhFQLNZe9MS5b41HwOUeQUAs8
	H0773K2kDhHIU4OBj26TEr3BgInLsVP74S3FsPcVt7Pb5uc+L8tzeDEMUIJ09Fd4
	/XdiEUUu1H4CK3BjVTG/SiaodW2laTmUlJoYVjhdBJcETOoQKQ/TaXyy2feCubJ8
	A715nRu4+47GSDI324NQ0aNK3f/pk+COQW5zr+OfH062K6SUnjYLiqapHipW4Xg=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: REIwxf1abQVyyREIwxG09n
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v8 06/26] emul/ns16x50: implement SCR register
Date: Wed, 11 Nov 2026 11:47:40 -0800
Message-ID: <20261111194800.1070016-7-dmukhin@ford.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110078
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D6:EE_|CO6PR16MB4305:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0e42d7c3-95d1-4548-2f14-08df402cc011
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|18002099003|22082099003|10067099003|11063799006|261022075727099003|261021121427099003|261009223027099003|56012099006|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	Fcy5F2JJrsP94cTfUmvl0D5vXD3OdX8Ddcp8Q1swtDTP9yQopKIY/guKIEPXI6G6z4TQAHukKGTBn7ap+7KYU3C83fW+L02CPLlUQ1s33F641G/sPBTjH4DPpFk9kK5MXWtRmMgFDm6RmV9Gll/IB6IjqSzfcSlT4kF+l9NrFrxExwoXOxLkvdImzjAd4nBkOFACGOTh+Xxg8YD9OmHPl4Q6n6ePklZs61o142WaLyaCCFf2k1wJ9z7DFCFnYG5873WMqfLaiVYtJ+zORYPLJUpqT31ikiSJ8gFkjkdhylLjTPdF7hCIqduwrf5lUBrNKhoiXZ2fnq85FZyEyWaMFNF2eodI8ti/iye0ZfPnJ+TTypmK+4lKhKczboD46JX/Not61aJndExHhxK1bYDuOY58GxD9TOaQcyn5mFiT5Kfs+ebffLMJfLpZGoYlNBgJx82Cnt1PAQMr4jEBeVoO6DNid8lQMwAYPpzt43ff2Q16TGBu3OyXha5FK/jx50baPDlKfuZZEeguUl3/JzF0iRGxaV8cd5DRQVDYcQGMDA2DITHyERx6OCtN+sRn+moFZPm39T4SekfwfNnu4DxBEH2tKZZB1DKOwSBxN596FJHKWtLyGQZ++nkg2ad9FmA637+4HvQry9i2GXPyDwfL6lwVWlzrQC19eqdp+9o8DjIB5btbHHikVT1kcbeuRN4lLRIFPCdncm7go38qIy0Q6g==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(18002099003)(22082099003)(10067099003)(11063799006)(261022075727099003)(261021121427099003)(261009223027099003)(56012099006)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5qds89IvKFPF0SpixGWwgAnz+2zF8sGPel12ifmn7PSJWf4ZN0/BzZIx4lj5rcuNe4Rrnc5vpenhIh7IwhdBnR43xoieXUaxH3E4B84FQWWOR508wr15c5TZg1wQKRpw49tOtTpNwd2XJc/c8BqF/LIBq0Jl7nDv14ihEr3hl1MyPpmQmZJo6AblHC/mrBGVHp+PW0/Spqz5PI/B9qErviJOHyrYXvVvidCAzQrWu/zMohs2DSIwWC0gWS+95Qph4KXNqA7TSA+/PQQNTbaVPGc1Fq0e+BAAPxmLPfUMBO1eR5kOMNcDDE4MO4h4FDGYFLi/N3MoqaRxqWf0/SW38Ul+UBEBbxuzGgO3EENIrLzZOHUREKsJ6qJPeMyCmS+bhzVn8oTLIFOTGVWwfH6zDb11Mq3LTjRcmgAyrmoJU+Q4i+jB+XXUcgMsbwwFDaqZ
X-Exchange-RoutingPolicyChecked:
	n/T/VBq1M+vEhPIAGQrpto4sW1V9bHFDzWu33NFrDcL6IiRYpuKvi6KJugMHyV7YY7LM3JUrfr1wlECSU0EH6ZkYRyRXIZkQO/ZeIExfdL8g/vh4PKElHo8H83Tyw8l2KjmwFCKFlmxBIgoB8qnLMu5hyu3MeCcd8oETNlse4RMjyPcb9AnhMZH7pGNpp59C3n9Lvmsj4a4pdagHK7Dc6RpzS9hyy/j3ld7gF5v5+fWylBc++bv6DcQAoudQiY36YNIanjbGqKvku/n5OGx9lf9V5sqdvzdEmU7idp7T6nKl65qY5e3tcx1BnBtBRVzMAohXXF+iulx4V/PwvZmWuQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qImwP48N6KasbQzVqd92JIni2tj8NzlFxz5BVT188Bnj+o//oU7ImSQkA+fPiytWe+RJ0TWjM+JqNr6wRn5oZidX8l3vtrGVrUXAC5O8py/S5Nw9ufBuyCkuSZZeZZZvmBS+ijZOB8mtZDkBCZrOeKVsXNdnocYhH63A1nwS6LhydWA63CsVa/Ud9wn/HczGwPJ1l17/xWzEGK+MX8bwQEeidAd8RfIC2IDup2Cpk1uDvLxi53hrTFIDV8W4Ww0to+flYJoby+i12m13MIvJ7/IBiHUoo/JYFa38XoYYf1+KcHL3+xpi0cCsMUYFvRKIU3I5xBHCs4MJxpY8+4x+2J2ZbR8zIDsjA8lzJU6Q4gccPn0gTSdc47yxdC/nLIEsoG8zBBJgEZYntH02UyBkV0i40sXqOvqmjdLXESA1ViDxg41muHzjrP/Eo1VJU8YYoRVPIrbTkFTC4cSqQTz9ANTVMCCo48nTulw0vjDxJa6kT8TLhoTIDMp3/9j7pqWAR38+FpigrdCWbaDPNeuSXU5b9KKI0XS8IGEpx2JLISaJ2inYyDLlsyMTzHJOKjUHAegQ6WTYbh+ATiYgXLEGtNaoGfEUkhLneJR3W/+YrzA9VB6NhcEF4hji8Nyz588bTXcIN2iqXwSr/g2u2gEL2A==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:48:25.4293
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e42d7c3-95d1-4548-2f14-08df402cc011
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR16MB4305
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX94Ze1jCdE0GR
 4WfY1XDYGQB3gUQS3mq/s3ko0RG2QqJ77iv6yp5iSq6Tpq9P3Tsvhue3cWIuF7A7QLHNfbRSzAr
 hZvlOTM96nXjkQHhmr6B79xG9Xjk1SzoBWhk0jbYVEXIAyNGSue4AurBGLocBJCeSo4KIcKCEP9
 pAmpEfC9VXlJERLJ02D1zdkH7GSUjgPzniUI5JaMjtTh6fuPlGy7205zLimm0rt+WzY1SNPODi5
 EUg8hrPoRewgXxqN5DemA1K92PYK9HU1mwaLPH45aBQXPLgZCEmjwD/eMD9OUs14yP/u3DvEV5W
 PtZ6OU/tMZFugbwANwyRvIWyESSaZ5eD4tyzMYDrPB3CjfJbCHf/qAUVxAqkMZAqBZEOhOehdXY
 1THDzrWat0ZSbHjeySo18vHkYEZXK72PoP505qPbHdftXNWJLOLJZiV/LLAP7RVQn4qC8TSuPJ9
 8+3EczQfldjRv4QRRVg==
X-Proofpoint-GUID: fVbIzKMKTCI4tQgDHIr5maPHGJcSf0DR
X-Proofpoint-ORIG-GUID: fVbIzKMKTCI4tQgDHIr5maPHGJcSf0DR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX9f4J+Ec703xP
 wjEdENpxkIXAwbCpO5wia0AipvhDbzoQCyHNNqk6oWMjVfxUmZ60j/sGSoc/+/iPBKBUzAQGdDV
 77pw9gg6ZO/uhp1hmW8k9gxL99VyFLg8XfTsdB6u6AdTVy8g68UQ
X-Authority-Analysis: v=2.4 cv=Ed9d0/mC c=1 sm=1 tr=0 ts=6af4c690 cx=c_pps
 a=LPv6HZ59J3TLgKTE/qPS5w==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=WER9OelvoqQQjwJToBYG:22 a=cbNQJ9GKAAAA:8
 a=X3_uliQPVPhk7ObNeFkA:9 a=DqJYxgmhk6moR-_7_KoZ:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 adultscore=0 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110078
X-purgate-ID: tlsNG-720697/1794426513-668B42AC-35F2CEB9/0/0
X-purgate-type: clean
X-purgate-size: 1017
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Add SCR register emulation to the I/O port handler.
Firmware (e.g. OVMF) may use SCR during the guest OS boot.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/common/emul/vuart/ns16x50.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
index 80805ee6ecc6..2371aa32d03f 100644
--- a/xen/common/emul/vuart/ns16x50.c
+++ b/xen/common/emul/vuart/ns16x50.c
@@ -145,6 +145,11 @@ static int ns16x50_io_write8(
         /* DLAB=0 */
         break;
 
+    /* NB: Firmware (e.g. OVMF) may rely on SCR presence. */
+    case UART_SCR:
+        regs[UART_SCR] = val;
+        break;
+
     default:
         rc = -EINVAL;
         break;
@@ -234,6 +239,10 @@ static int ns16x50_io_read8(
         /* DLAB=0 */
         break;
 
+    case UART_SCR:
+        val = regs[UART_SCR];
+        break;
+
     default:
         rc = -EINVAL;
         break;
-- 
2.56.0


