Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6A9C44507
	for <xen-devel@archiver.kernel.org>; Wed, 15 Jul 2026 20:20:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1363314.1615062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wk659-0007Bz-Ew; Wed, 15 Jul 2026 20:19:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363314.1615062; Wed, 15 Jul 2026 20:19:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wk659-0007Bs-By; Wed, 15 Jul 2026 20:19:51 +0000
Received: by outflank-mailman (input) for mailman id 1363314;
 Wed, 15 Jul 2026 20:19:49 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wk657-00077q-AV
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 20:19:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wk656-00Ey8o-N7
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 22:19:48 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a57eb3b-e002-0a2a0a5209dd-0a2a4502dd1a-44
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 22:19:48 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a57eb62-6ca4-0a2a45020019-94a392177e0a-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 22:19:48 +0200
Received: from pps.filterd (m0482516.ppops.net [127.0.0.1])
 by m0482516.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66FKJYlO3546465
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 13:19:46 -0700
Received: from bn8pr05cu002.outbound.protection.outlook.com
 (mail-eastus2azon11011059.outbound.protection.outlook.com [52.101.57.59])
 by m0482516.ppops.net (PPS) with ESMTPS id 4fed2sjwcu-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 13:19:37 -0700 (PDT)
Received: from MW4PR04CA0069.namprd04.prod.outlook.com (2603:10b6:303:6b::14)
 by CO6PR16MB4244.namprd16.prod.outlook.com (2603:10b6:303:a1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Wed, 15 Jul
 2026 20:19:19 +0000
Received: from CO1PEPF000075F3.namprd03.prod.outlook.com
 (2603:10b6:303:6b:cafe::24) by MW4PR04CA0069.outlook.office365.com
 (2603:10b6:303:6b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.11 via Frontend Transport; Wed,
 15 Jul 2026 20:19:18 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 CO1PEPF000075F3.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9
 via Frontend Transport; Wed, 15 Jul 2026 20:19:18 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66FK4oGS3704206
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 16:19:18 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4fc493n4ts-6
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 16:19:17 -0400 (EDT)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id k64YwJyRWwVVek64ZwDAR4; Wed, 15 Jul 2026 20:19:17 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=9Yp
	smNRekS9oIq3/N3tPLgQiNEBPnt5Dveap4jDXsoM=; b=G8cRa6H/oGekBfploDl
	YiNbfB3Wi5LdAu/h0yFRH6/TG1eGqQeyiHYGuV88L7O36o0zVJ0Z7pKq1aRqxwT9
	r0mfZR4L+oixHd9fX+WAYcwzY9YJY72CObwhDL2DCzaz6DDHzrwe3yNQKd9iR2DW
	Zbyj9E5KFmCqaSxN3TC2M0sC4G6ZxN8QDei6nUkuzpZzLVpZ1LrftOnGYVQHTuOj
	mbJNBc+lQQYn7VwaylB1EvYXkoHRD09OZFacJHT8r/c4aCjhqc6qiOdq6EMBEhAQ
	70jPTAHMC2RvogGTPNYQXXCmJVvtAMgcvZYGCpIUJaXSHvLT6wWf7HaIuwImfPlZ
	0vw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PU5UlXHOZrK6c159v02c2a96m+hjGcJJ4v7FwXFq95doNEmfgYEKbJDRvwPJkfnhgi+BqZBsskeZirSd3enWj1e/edDHhc4ZwunDTO5heoxGGut0G3kTyrdsqSCw6nYjqu+Bhw1HdWEgscZhFOQyBRajR6PWX8Pz+LLLjBR0OezMIBGtT6PyhwiPwHUF5DrwBrCfgpQ0qOjbdRtp+NQ2HK2R1Ar7HW8wy6vDpDNg9ooFcxdAHSHdmbMcZBWR2qo8UVIdiFGaj9xcV28yJiagTK3QRt2AcHkjlttoVaTZWJ0WluJ23JLQ/vfFnlsJKGnJNtcPKQnoT+l6rshDuRdw+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9YpsmNRekS9oIq3/N3tPLgQiNEBPnt5Dveap4jDXsoM=;
 b=CGCSmW2GaGlmYYVHqvyb2uM0tkeCqd6Gc41PC2p/EqLrghol8LKvMa20aLh+6BkFmvzYz6lwotRIglqsJy4HGEQ6wF8I+tgowur7ymf+uu61UapsMZUzKZKaJbBGOH4pxgRdX2Ozrpi2bBtpBmpoos52P7dhabwC0cs2FvmcjShWfTAIu+jQ/pi0DWoZr7Me9+t8VHRuDZC9OpMSHlDFKHEfsAZznEJOTAIYJiTiOcka5YJ6/US1FQcTwlbBiZCsX8c1lwUFBYo6ea+BlhtySKiCB0mn1+A3fMn2UwToWMe2SGWsih3XwFZJvuIPrBlHRKRLreh2r2MIv8jnFiDfSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YpsmNRekS9oIq3/N3tPLgQiNEBPnt5Dveap4jDXsoM=;
 b=I8RKNuvD5hQppWIkopJPo37dkDriAn78285WFyalYd0nq1Jc+SJdsi6AqXRvSoM86mQQAHwsDH2fHY4qneh01xQSoqf9WohfDP3yUFY+A61kiBl2DoBClfXfVfOQ5Rx7fcI2Fc2XW63790o2ALuSpcU7dp8SrVNQkBGA3RxMGxs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	ppserprodsaar; bh=9YpsmNRekS9oIq3/N3tPLgQiNEBPnt5Dveap4jDXsoM=; b=
	C28jW44O2g/L5Jtlwb/9YFLsZQaOE4ZgNQpa2BVBEa4GaO0b8ZEaaP0T3yVC1NKR
	CXZ+LiC6+WP4D/ikUtrzJk1T6m3wq7teU0pitr6QfLdzrW8eSGtTQ7FmhqpNVNCu
	3QxM1D5n00L0jyhE5OXnN+IsD6RjLmbVfoE3b0I70t/fgBbAS0WnbId/xcj8Qo7n
	UZPqvXPwbhtJuRtnKJb8ecjdlaGHYZzsm+2fkOxErsiiY0MEaenpgHFklqZGz345
	Je3F/6DWA0A2RZZO8yR9jmcoFEEA4fpfC7dc/ZBYxN0gS9aXGc0BtO0PLyS04Kjw
	HLFqH+j5IBYl4hTXfLSDJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=9YpsmNR
	ekS9oIq3/N3tPLgQiNEBPnt5Dveap4jDXsoM=; b=oQE/qW5xDjEmYPVy28TSmlo
	PaqKfhpDcVy8lbkm8bhC4RhKAzoRGjTRpVoaYXUrcm+EjVK+9Mc4iYX6zxNPew9c
	v27LmPtkDCWlCMNUTKY6cKbMW8asQMm1mHfHz38hRnc8EfAcx/z37OOJHGFJJ3IX
	2CLcB7xxtdlxaqhtGDyoc+qx5YsZ+5O+UEH1YadQNOfDyEw6lc0AmaUe5RoXGcf6
	nqqVTGik4FdDOp5FeU7jZElVMnqueSiR/DwS0t9NijaHyB4Kp5QiX/AJEwhNeFg+
	qYjytVQrJoifisDwStlahSCVSDAnbML/JaDNdPfTYOce2Zv0HACOaMdBaILmufg=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: k64YwJyRWwVVek64ZwDAR4
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v3 3/4] xen/console: add build-time rate-limiting controls
Date: Wed, 15 Jul 2026 13:19:01 -0700
Message-ID: <20260715201902.2984407-4-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715201902.2984407-1-dmukhin@ford.com>
References: <20260715201902.2984407-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150203
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F3:EE_|CO6PR16MB4244:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e144036c-bd26-45bc-a8cc-08dee2ae5987
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|23010399003|1800799024|10067099003|6133799003|56012099006|11063799006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	GP/S60n7eqwUZmboVbD/6kQSjpNCigVWyfVO8BOyFiEuIm6Nl+x4IUUcfU+QDUXf83RjdD47BnPA2/CSkBeDbBht0UbjlKAaJatkogs6ZOGXdnI0a2zx5ZIuj96N7NI/GCrbOcG1j1EYIIa/gV97zUqfk6uA0b7NE0QighOqIkUhxp2MTlWND0DzHb2IKcghjvOttSyOy8Vt6JAEZKOMs49P/kbkfi/q9PQnjRNTKBUwAoJdHYqQs3b8n6GKmFmaEuC1Qc7t0N1kAs+fctPt53R7dZMintBKRiUMdYN+A7FeasuH5D8VI0rITDdw/Wd9/UquVNkJAjmw5OnjDQ4G4vrdC4tkTEI9x/YDbeTyaJyT/2ZcOl+urA27fOs1F4vttCg0E2sS2IYvqbzxWLwaX4/gcbpVmHcqzgYG4Y4qz77AVxM2pPln/pZdznIL9MTuCJ2r6yIb6SaOE5X1vyAOITH6/tg4akg/eWmpVSNkoL9owsx7Qzfz6Mo1mj02Nsm+X4efZ589zi+RDvWrj+JE5ioNT6t5pk9Ne3re4hpazgsrki1ejHwIuSTnjzkvN6Y7PAXxs/IYPqS7RoNT8n5mjGSlj0iObkD+zGQfFb+e/mtWNKn/5/0vJ1/BI5UgiBvDg31M9GnStH1CnKEG5moa+I6lZfjqSpg9Z/Mme74yVCHv4ewrhj24tknUIwGtYR6dYUXJi+H8DMtNTu3I5W5y/w==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(23010399003)(1800799024)(10067099003)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OexXWVnK+Lf8SsHy9fO5qVELwGmLBfyOHpDyt52SdTJiWy7sqdIn2tjl4VhtRpB5j5MCDe/0FfYN+KWIk1xbmksF88wJ6BOwGa06ZX7QtsanCVAR3O+4VeDvRtNpM6d4M751k2jKNAKlHlgA5Y6VX/gSZh51DtMWvGLBJbsdLL3LQUjEebD6+erml3CBHQCcA2c9IUodzarGJEc2kwjJus6ieOg4SGGT4QFJ9vvTipxkL/eFPJtUhwjfPIvL/kZwOc9Tmwc99TQNaxGF8cSUDJyr+4evI0qKgX9x1p//T5Dh1hhpSfiIBrCoCA/iwgV9kzkojeeqVuTKqG79QW+6N7eJqiIsx6ixPhN3eYIkLsHr6Qcsqiyg2uDG688orWRSLs9wNeCRL67q6voLm79vkmTGysHk3ekKKoGut1fFyEBtSxfHnkXp1ANkxDAbXipW
X-Exchange-RoutingPolicyChecked:
	OvNpNABdSd96uw7yi8x1Vx54/TFehLbXO3nvyKL0ij9hhASVYmY54CsB1ZouxlmIrHDjKmCHHDNiQmV94H4+yfccsKWDaXczSDMW9xtmTPFb/bMtbF6Z3ztlTxGh/JBRNvnAUXI2DP9ccDZzB8FOHeGZTzmu9SislyKG5y6SnLdVCuWb9t5V0Ctj9pLhuIgB0y/+Lpol+WPTZ2M/mGaFz1xzZRrfEkGwKeoV+CTlIWGBTchdvtag7gvMtxa5O0y2E437K/Tf1CCAipUlPKGvLBVbn1xWzhSZBK+p47jhmB8HrUGn8MiAfG6MXo+HelQd3FqsdqT5yqNYmunzxxpg4g==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/1a/naMLI1oQwZLE53x4Ln5y1gdvM6PIIKm94ARrvYtLAswjdyZ+YYi5EXlMxe6FHMqYt6aI5h/Tmas3HuG1IufHcwXbOcFxpPGuJDYA5hHoPnGRGIew1w9frLNaeMCSLklwSyHUX8E0Wb1g2pqyGImuygQtEGbWwEdRwczHzEosnG0rU2C6efx84QZQVWzkDom0khQqcfIYYX7fDug02nexqxFQ/88y1uxm4AuCuHB7PJKX6MgTlyA0bAEq9lF/R9PWAS2pAKl1m+L02aaiwaTDDZYTE4C/kknPEcx7MxZUnQ8SrHXKSUjbEfxAh7qJIApqZVSFLNavJIj8VhqFs4ZuoN3uTjhQzpznQKURvDXIIBFfwmIJTDh9onry8sQqpn8vNgJs7tanqNYVfgwWtuIpODX9DmmHvLPdmZ3ugJmuHZfJ50o4PvLUQK016GgU8WNby3bFLaDc7Es/1Z1xry06Vo+H9AviHSPdhDYilnfPTHiRCSirkzKJk1aFcQy+9zrCyOnB25d83hGGwWv3AaXlSpr95chQNfaQA2BqYw2MLgbUaz9VaqM2M4QcuZLG1nK7gT4iutGgqls4n11HMFJg/6Ea8/+BrNSsT+88B7BeOwgJZbibvOdlEkKHr1S7sQdkYADLB1VtWUvybCgApQ==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 20:19:18.6119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e144036c-bd26-45bc-a8cc-08dee2ae5987
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR16MB4244
X-Authority-Analysis: v=2.4 cv=U56iy+ru c=1 sm=1 tr=0 ts=6a57eb5a cx=c_pps
 a=J5CYyyHZZtesdUd/yj239g==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=NvsXeTrgx-CJMFV-xl94:22 a=cbNQJ9GKAAAA:8
 a=KRdSKdEVfKJUlWCUXkMA:9 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-ORIG-GUID: iA1KvHjLBJyrUaUmPwcYqUzj-geT1LhC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDIwMyBTYWx0ZWRfX2wh+fi6UEljr
 p+TLbI1ta8/4pGZzTxCxCFkGyzxJYgbWticdgkUWFO5XuKNcpyOq2g6wxzy+N/aO9bK4TeG2Fvo
 LRLVywG48Dm3WPrbUVo6Ksqy7cSbLFWMRaIX7blt50Vm5g+mqQKg0H9I8bTufIaKN61hcKCAncZ
 oVAtMarwYCrFBarmumzGSWW4HEiOqJAVtYJEdB6gtGjMR+7sw3utMDc8x4tz2900YlRi2Cw0d74
 F2SNxxNgGuM/cjKkVxav+XS4q8LnhUMolF6hGDEYLoN6nLkk47/+qP/3zk8NhnYuDGHQc43O6I6
 +dtfoCV+CNfhRB63e7tasGkdJUW3LyDb9hbHarUhWmUf1PEHUbMrRlD8OlO91ZWIZ0IxcpDHNB/
 /aOj846vZ7ilqxUkp66LWgUxDTiS70AXV7jxBYBPY+XnbyzNFKdZWGEt5B4xlGyBaWsQD/yEqA+
 PZVToGvQ9NduovXhQ4w==
X-Proofpoint-GUID: iA1KvHjLBJyrUaUmPwcYqUzj-geT1LhC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDIwMyBTYWx0ZWRfX/DhIlTj3U+h4
 qa0eWC1ao4e8V99Os3pmUCM4ZIkt2eQbEVchqtNKosxaaEdMBAOvJ91HERFdBgC37kYq+B+Yu4p
 jg529WpplGFGt5mfkf4CuTscZy9ffRJnL6m5mYOb2V8ygx5dp1cE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150203
X-purgate-ID: tlsNG-720697/1784146788-303C42AC-EB860FC8/0/0
X-purgate-type: clean
X-purgate-size: 2541

From: Denis Mukhin <dmukhin@ford.com> 

Introduce CONFIG_PRINTK_RATELIMIT_MS and CONFIG_PRINTK_RATELIMIT_BURST
for configuring rate-limiting policy at the compile time.

Use symbols for global rate-limiting initialization in the console driver.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v2:
- moved rate-limiting controls to common/Kconfig
---
 xen/common/Kconfig         | 29 +++++++++++++++++++++++++++++
 xen/drivers/char/console.c |  6 ++++--
 2 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index da80fdba8469..fd22806884e0 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -672,4 +672,33 @@ config PM_STATS
 	  Enable collection of performance management statistics to aid in
 	  analyzing and tuning power/performance characteristics of the system
 
+menu "Console rate-limiting"
+
+config PRINTK_RATELIMIT_MS
+	int "printk rate-limiting time window (milliseconds)"
+	default 5000
+	help
+	  Specifies the time window, in milliseconds, for rate-limited printk
+	  messages. No more than `CONFIG_PRINTK_RATELIMIT_BURST` messages will be
+	  printed within this window.
+
+	  Setting this value to 0 disables rate-limiting entirely.
+
+	  Rate-limited messages are those controlled by the `loglvl` and
+	  `guest_loglvl` command-line parameters.
+
+config PRINTK_RATELIMIT_BURST
+	int "printk rate-limited message burst size"
+	default 10
+	help
+	  Defines the maximum number of rate-limited printk messages that may be
+	  printed within each `CONFIG_PRINTK_RATELIMIT_MS` time window.
+
+	  Setting this value to 0 disables rate-limiting entirely.
+
+	  Rate-limited messages are those controlled by the `loglvl` and
+	  `guest_loglvl` command-line parameters.
+
+endmenu
+
 endmenu
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index de9f2432445d..a9520f5521e4 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -1323,10 +1323,12 @@ bool __printk_ratelimit(unsigned int ratelimit_ms,
 }
 
 /* Minimum time in ms between messages */
-static const unsigned int printk_ratelimit_ms = 5 * 1000;
+static const unsigned int printk_ratelimit_ms =
+    CONFIG_PRINTK_RATELIMIT_MS;
 
 /* Number of messages we send before ratelimiting */
-static const unsigned int printk_ratelimit_burst = 10;
+static const unsigned int printk_ratelimit_burst =
+    CONFIG_PRINTK_RATELIMIT_BURST;
 
 bool printk_ratelimit(void)
 {
-- 
2.54.0


