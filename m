Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FF0C54F51
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 06:51:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1372098.1619502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wobf0-0002Hi-CB; Tue, 28 Jul 2026 06:51:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1372098.1619502; Tue, 28 Jul 2026 06:51:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wobf0-0002HS-6I; Tue, 28 Jul 2026 06:51:30 +0000
Received: by outflank-mailman (input) for mailman id 1372098;
 Tue, 28 Jul 2026 06:51:26 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wobew-00021t-KU
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 06:51:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wobev-00DfL2-MH
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 08:51:25 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a685162-2eae-0a2a0a5409dd-0a2a4509bbda-40
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 08:51:25 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a68516c-be1a-0a2a45090019-94a38ff184f8-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 08:51:25 +0200
Received: from pps.filterd (m0367130.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66S3Zwtp440800
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:51:24 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11010029.outbound.protection.outlook.com
 [40.93.198.29])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4fpj0ust5b-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:51:23 +0000 (GMT)
Received: from MN2PR20CA0048.namprd20.prod.outlook.com (2603:10b6:208:235::17)
 by DM8PR16MB4374.namprd16.prod.outlook.com (2603:10b6:8:31::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 06:51:21 +0000
Received: from BL6PEPF00022572.namprd02.prod.outlook.com
 (2603:10b6:208:235:cafe::3b) by MN2PR20CA0048.outlook.office365.com
 (2603:10b6:208:235::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Tue,
 28 Jul 2026 06:51:20 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 BL6PEPF00022572.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Tue, 28 Jul 2026 06:51:20 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66S3bFCN2911160
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 02:51:20 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4fnbs72m2y-13
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 02:51:19 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id obenwuIZHERZKobeowQiAU; Tue, 28 Jul 2026 06:51:19 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=dqT
	Ghvqpn8gpXb6wAeWGBbJTJoEs7CcCTQTy9ycj/Xk=; b=d16GCcHLGQnHCURhynE
	m4n7CR4eIwK/XpgELG4B6sITJajPnCL99LGEyuiSIOAOA8x8IhCRWIjsxmA3cvCs
	ShHUBnrVCmdIwCjvrFe51Ro6gO3/jE5QiU76hG+z7L+75JCzzsMX4AszPqSl8l1F
	ORlybkYRBoy4svfHY9FeX4uac+H2hoxKBlsTE2QXnDQLjtRBcN4jPJw/Kmw2yxpt
	1clTAO6NG24pKaPWjdc+pWv2B2oenctnN1mrdhu5MI8PE0HoU2PkLrPmrJXhBtSr
	cF84uXYRA6FxRZqApsDSiV7zFluXb+w53YDfmdas+ieIHnoKt/NajA2lS0LUNpG1
	bPg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GIXki+GaGFDt0u9thydg6Pso+qE3lMD9pQH16JOvWqS/xNsxNxShRG1kt7XITxc6JzAZcVfu3Pl4EXOAvd/2gPTuSG1J5euw0HBEVzHXiR5/Bv3UB4OHBvRIfC0tsY9+GX9772f+SSs5ciKdyE4kSbTktllf9P3RxJYypGxqiMHPBD5jOfz/ROk8UtypziZKEbQTMTNChQuDNXE8lGvIcDNXtWch6BSoOWr4uNwQ932BpjVM8kbP36vtTp7g4Zj4FwfHR/oBEAMvbeucGLfRupJbm03mJnjTeAf4m+Q1XDnkCeWidhOrPTKssN+KlJ/R5Fo/cuU9CfuTQg68/s98OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dqTGhvqpn8gpXb6wAeWGBbJTJoEs7CcCTQTy9ycj/Xk=;
 b=b4MExBu7hDXaDH8Ar4s1yrJl95KWqqj+y37aqj+xM903MzEyM10AD1NfvTLhmQoZq4Q/34924mum7xh8Z8j9lvWYwwSzqWLekvUpOTcW/FaRRD5qsEydwOPyxFosF7w9Z6WJX22Fkx+uIa8VqLQ2QRzXp0KJvWan7rvzRIGwFQAMoXNYE/uMi9AzUK/aGQD4M15YwMufYKF3ItTjU5NSJxBiXex64mUyPUu+9WC6H2D31rHJ4kUEuerUiyF+6IKLrcz1v3ATD2HlmTxWu+iYUnIbpK/KSGneCZ3em2A4W1sMq4vrNtzBRD7maQwufVNoX6voIMvlZrqtOmzK2GB/mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dqTGhvqpn8gpXb6wAeWGBbJTJoEs7CcCTQTy9ycj/Xk=;
 b=BbUIRbT2E/fP/f3mfq1hQ3F+KsrMpCaK3kvc4bT5t245hu3oAhRA22Ku4j2QRontLLFPxn56QBUKOZ/LQxjp+0u5s1IkAAj+akbcscg0JaL8ZBmV4MdT/L210gWpU9jdeznKEVPrAVlitqba6JI5Znp6glphoUWdn6InMF2lGoA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	ppserprodsaar; bh=dqTGhvqpn8gpXb6wAeWGBbJTJoEs7CcCTQTy9ycj/Xk=; b=
	fKRNSO23qrbBOh3os97CCgj/o1UORIKeFIdkJDMkl75sid4J5DpKdVbgQPYc7m34
	2lii5LXgIFMjwhPy0Vzw14grXKKLD0LFnCLfqWeNLttBWCMRNiPaxxFp9iteVJ4d
	ELLDw8BB3fVERSSsEyAI4ITUsuso17XByYQDFDu8fRWYK/E1IHv519LCN3KlMoji
	8xN+UqFeoAS8LLbLSLjs5kYtpEaCbqr+MIbJvG97B5mbEgCedmMsELhkdPzym1KQ
	NpbVhVLXeNBJPho3dcU8KAckK+gTv4D4jhEwdUZJyw11zjTM1LSixnEgJxE1wRnt
	RdHaA12+CqTJNy3pd/1zvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=dqTGhvq
	pn8gpXb6wAeWGBbJTJoEs7CcCTQTy9ycj/Xk=; b=j1muFgD+vcQLqDFNga4f85L
	uZ9M6KvhqFCcXG3Rgg9M75qVAABYbFdUsZwYR9IqOrHILV7FDG9xpZjkTZcVVrzQ
	52Mu6mbGORRxaY9qNjaMhjTEkeh3xvfbrlbhKA8MzeJXBDKJ7v8hE+pG5JSMYMcT
	Ym5du7gxV1ilfh2fL26AtJ7fTpnwqqnyK3hb3piOnUjL2i45V7Did0GdP9nWTubB
	vkuVLLGcxeroIf/09nK33SOezX7xG0Kl2zVhVSIw8lJzCdZxL6xFVToudSp62U51
	BudcLkAOHj87k5pm7MVRAtwFSbg9uIIJsOrcR9fswkWsDZYPkSEJFys1eT3/T8g=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: obenwuIZHERZKobeowQiAU
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v8 2/7] xen/console: use 'unsigned int' in contring_{flush,puts}()
Date: Mon, 27 Jul 2026 23:50:44 -0700
Message-ID: <20260728065049.1318143-3-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260728065049.1318143-1-dmukhin@ford.com>
References: <20260728065049.1318143-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280060
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022572:EE_|DM8PR16MB4374:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ecebe3ac-81fd-46dc-6364-08deec74a196
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	EsG5KxGfcCJUEjvUwVHhoGc/lATzIwZjHYFw1j4MkDxcV0mrR5q2/D6uD3J2xV6FqVNSAOAMsH7qlAybbNNWlpm3fLNRGuZ7VTUl57jkdzq293cSDy2y5i1iWuyTiTPmOrHwdlg/3EMyVOgZuzjBewEsrFvrDrRPwmnr3icvaXfdQhuXENNWAiHuRdS9+K26tvvJA0eYjPxyqWVoXHxyVyF4QckLyGp//nwdtqHWKvfCftW7Vfbdl1K6g/OYF/Uu3n3tLft11hkvhk5zck3rJdMDdhmCr2pFWZOXqkCHKml9zpni4mzMo1RfOk7GFyolKT4m4jCzlke5B/aXYKFVJ7BzwPYlwhP0/IHhaTdWGfIXmdr1k6r6XobX950BNtnzjGHjkkfsDsed2k9bW38r76JzJ557y6BxG/E4RT4hbgjcd+WbK7ymAvmrajVP8NgSD0o07JN+Al/vW0Ofvqq6q4Gg72VCvao9BjUFKA1gNDpXhAJr2UtEDVS/mAv5srZMIDGTj0Wa5o0qfTfPTmUc4kHGddM8xub3AmUg5S08gXsRxumS3EkxXgluTusXMksNTpEum/H5duv3x4PDt2joI2SUNHKFp7HjMBmUoHQqmLUkYLaT0F1vIc/skQdhWI3O8M8GTlwiXJyHb0RSpoJykcTyiYfiS6ldmDPZAIB/QudCNpZURPAcHinUb4vmsqAQO08f6lzqsIrRucggUGeTTg==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9yCGUVvpCry6fpTW31SbHk8CZWlHj1DwSxFjewcL3lQC+UBfnlckHMkHgHuBkV33ETIKfmGo76qMHvTqZva9pcAJwbnKiVz1NXv2l2kvzdWlRMATImqP70clVEsq+rcoK/bx6JPOedJlhiyh4F6bSWM58r3nytHRClgL3+JMmrgA+3T9EaVTKUFs/gSfaxau3moPrjNpyAZVVE2zviSLZBM+N3ljTHQTQXxzhbv65m3FwUhtfiD7/gcsLjHIS46chIckDA8SKr2LeNknSveHl9eVKpjF7/Pl8TVS+2h+zf2djQsBScqneKu3aOefsZQMH59e4iAupZqqTslDfxhQEyZnxa2e4fMxzabsorQUKWmsB0LpquqNLQFCnMtlatzZro/Oma/NLyLiZIquX7OyD+fTJ2bYlGvoX0CEijyUN5LGpkgVkEdqVsYPcIRV4DnX
X-Exchange-RoutingPolicyChecked:
	Wgbrh8T+bC39slECdjqiM06vDhuTdah1MOBpgLRWCIvNv4x5HMyle139zqqUVs6018uCVj2zeJ62Cxv69PoWcQJioU+1qfm9x4Q19qrTk2cgm67ZhyYyYX++BKv9SUjmqdCPatfUWhN8I4c2mz0BxdKsMiNOgxHZP8hgfBa7JTCI7Lblid3j+VtLxXn+96NZWerkuOvW9g/5VBTX352/dQnhARoAaZNeIAoUJtemK/NVuqAZ7Jqw8TpXwe1VnonARveCyD0Q+ATLt3+e0+fpYWGISj+4pXxEakYqG8rHPYLfKL2zFZu+wqgl71+8Ze2bEiOAD9DYs/olbOjiCNDE/g==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lA3P0OzO7usRLUVoeV19ieOMc3q6+0B/1Jo4zPmxb3wC7lMMRfXKyrmwD9b/UA6IkAVc3sTZGmnKj6gpFt3v4j+v43Fb7fQaGZZH5CnTvkcuxKgasH2YBOAH6KA9DzXoML3KVpRBWKNNJposJX5fCa2RcBI5pE1VmuaeiqjiNFErqI1B8zJw2o1um9SvH+QI96YYvjhr74oVaTJTh79GH3nAidDJEzNcq9iFRI996GtNuNlPUKr4Lg0weVdvSE9pBSEcsEve7R4Ak5Rretx6hySbLwYSxJs0bQcLjcfWU2AX78YABAaRz68pFKt3HVQjp5pxoWLN3QzIyLxMOubLCuIY+oYlVXUq6hztpn/FFZl+X2+4F6USnbJHZ08JUWicoeqTuwzGmek3bi+4AOZ09DJ2KiAZUJ842a43lJnxxtEhxOc1mVy+iKtnXcu/3jWxLntj3hXgMyjPAwEvWa/wdBxO4IjXSNTeX8YelDYJPSKpWO36uj8Oj0aRPvIzfgETZZsTEMGolHX/HjQuPTG/W2uT28ok/rcoDKREPJ6b1z8kZbnY4FSAULlqAyLqVXRM/n8ijI6a9822OZ8pMfALnHT/dXcX+A/HFkp49Yy+28rSGpO0Vi1+wClqDIs0XRfG1iNN/+TMTGMQn12buncqPw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 06:51:20.3657
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecebe3ac-81fd-46dc-6364-08deec74a196
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022572.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR16MB4374
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2MCBTYWx0ZWRfX3gk6ABAShxa/
 uqilDpet/IYZOSBkiAITiP8G9aBQsuFh408crMR8UeGja7r/eofDNXAAxQgYOtMvvbfXpdNO1Gi
 5rcpxw6xnq/ZHQPuVX/EqUbZJ7y+DiHHgKRYmVbx/q/81Sj+/hWXLlLJ09ifep6NxkJaXqvfDlF
 BKfBUaBsNcmkkzxhxtfg/PlMK33tdFCZKNKDwPMiwvHplq6VUptT2en0GgPzqXf+usZilAdtEYq
 anhk1mU3EZomsTg1VokzSqULgRMsJD/D0GulCg3SeD7e3bADu2WXr0ZNMAz2oMzLtBxlg8VC+DA
 fXgy+Nqp8KHNfw9vmE8/CssSJHzF+x7CxGh0STl3Ynsb28HZZyJeLLxkXZF0tETO0rzIH1r855q
 Xa9tVmDXN/NV7QsJNbfWqzduv9A3gLk/E4JPJtXjnVIMDRSCR5I3FvZ1ZdaXopbCPO+mutWLA0F
 gVSgvvpbhbC/eNISm9w==
X-Proofpoint-ORIG-GUID: xPgIDSaZDKHTP006KsFvOh1bAql5qeLB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2MCBTYWx0ZWRfX0eCu/tB+FM3R
 mjtP1RlAUE2tLK1jQS7GqZKpsywL0pD6Q9UBHiV7UKXgSvH0AGrQcplElslNZSlC+AUkmukD5Nw
 Y0yM0/CkcNo5YCPfN8pmYLP1ITQXNZD+LBmES020LVjV7Gog4QRR
X-Proofpoint-GUID: xPgIDSaZDKHTP006KsFvOh1bAql5qeLB
X-Authority-Analysis: v=2.4 cv=baJbluPB c=1 sm=1 tr=0 ts=6a68516b cx=c_pps
 a=KMP5/9L46olBb+slh8+hsQ==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=vnUQfov-gS4s1L7hHvr-:22 a=cbNQJ9GKAAAA:8
 a=58MCq32nLZdK-yyUG9YA:9 a=G69WFyCBNqGPyalROSdv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280060
X-purgate-ID: tlsNG-bad1c0/1785221485-39AC0034-AB57AB37/0/0
X-purgate-type: clean
X-purgate-size: 1160

From: Denis Mukhin <dmukhin@ford.com> 

contring_puts() and conring_flush() still use 'uint32_t' to access
indices.

Switch to 'unsigned int' to as required by CODING_STYLE.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v7:
- new patch
---
 xen/drivers/char/console.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 37fdda93a4c1..40355c1d14d6 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -375,7 +375,7 @@ static void conring_puts(const char *str, size_t len)
 long read_console_ring(struct xen_sysctl_readconsole *op)
 {
     XEN_GUEST_HANDLE_PARAM(char) str;
-    uint32_t idx, len, max, sofar, c, p;
+    unsigned int idx, len, max, sofar, c, p;
 
     str   = guest_handle_cast(op->buffer, char),
     max   = op->count;
@@ -421,7 +421,7 @@ long read_console_ring(struct xen_sysctl_readconsole *op)
  */
 static int conring_flush(unsigned int flags)
 {
-    uint32_t idx, len, sofar, c;
+    unsigned int idx, len, sofar, c;
     unsigned int order;
     char *buf;
 
-- 
2.54.0


