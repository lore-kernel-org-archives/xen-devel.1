Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49769C54F51
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 06:51:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1372100.1619520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wobf5-0002jv-28; Tue, 28 Jul 2026 06:51:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1372100.1619520; Tue, 28 Jul 2026 06:51:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wobf4-0002jX-Qm; Tue, 28 Jul 2026 06:51:34 +0000
Received: by outflank-mailman (input) for mailman id 1372100;
 Tue, 28 Jul 2026 06:51:33 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wobf2-0002fB-RB
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 06:51:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wobf2-00FyOR-7P
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 08:51:32 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a685162-bab6-0a2a0a5309dd-0a2a450181c0-44
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 08:51:32 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a685170-5984-0a2a45010019-94a39217a11e-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 08:51:30 +0200
Received: from pps.filterd (m0367123.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66S3Zbnk509650
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:51:28 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com
 (mail-westus3azon11011015.outbound.protection.outlook.com [40.107.208.15])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4fpcp0d74q-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:51:28 +0000 (GMT)
Received: from SJ0PR03CA0169.namprd03.prod.outlook.com (2603:10b6:a03:338::24)
 by SJ0PR16MB5219.namprd16.prod.outlook.com (2603:10b6:a03:4e8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 06:51:24 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:338:cafe::1) by SJ0PR03CA0169.outlook.office365.com
 (2603:10b6:a03:338::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Tue,
 28 Jul 2026 06:51:24 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Tue, 28 Jul 2026 06:51:24 +0000
Received: from pps.filterd (m0426315.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66S6m19c314433
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 02:51:23 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4fnf1sjeh4-3
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 02:51:22 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id obeqwBlw1JrM7oberw9CFy; Tue, 28 Jul 2026 06:51:22 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=A1Q
	xlu6N89ffhdYOUJ7rbtARn2NIA7nR+C8pqWl/79w=; b=Bs4/XTPBK1kTKxfQklp
	Sp7N1LqoU9P+5b4v/xe7dcek80EdP2SQLuTnGLpwhMvaLAA/i3CEeY+J4gUL0yKv
	BmuccwiRBnqEKWVgEnjSNvrS6UMxiTOw9NzJD4KqE0HjH00VwbeZmRnnEjpaztEO
	PYBc+FUU6raZIbvtxh9BnT0+clptFvCwQX677/H9Pv6WZRtSiYeN9nNOUh+uiLOl
	RDhhhHEaGX/gfDybTnFFRutFU7wLMO74NGy4Q/5jWHhuu+ZzFtPywTbCADlswLxL
	1A8aOwO7CFX5Y/dZSUdLAjgjc/73eMyV8/3iIoqvrQbou0bFvZiNG390rMbdf+5L
	KvA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AR6qkJXcGfRhvstwtxsE+7yDyQt/F1JBHTC6aS+1AYTOb0Kn6Fcperf2T2qh1OWZzp6o7hqTMDEoGOXhN6ZX+vyhvQV6jI3K1LL9q/07OLfKTRvUHxnrPCOWs/QmFoXKNdRpNWD2O7xmgcnE+qJT8a1QHRcW9a1NqU4Erm/cuRiEdmco9pp/XxXROouJJzsOUljfh0oswyAA9H+46XwbD1Q/pZqn+V6UHcVkwvXqy5KRCv84dY6Q4qR/DBChrkdT879deUSXkVgx4BYw5uYtRwl8t5LtRajTbCFt1QL67ANSwiAClhQUw6i6qRVjYrtXzfNCXiK7Gg/gnD8elzIYJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A1Qxlu6N89ffhdYOUJ7rbtARn2NIA7nR+C8pqWl/79w=;
 b=ZHTzL2KM26NB6UPgAMBZD51jK8qISnVfTeTFti4RD+UrTEqvg2pCMmo+LLMtkG0VcSUoJlCDv38MkcXmswg9PgJmK8QdLSeWS0HRemE+1uMSgWpoLLXotRF/ajSglEyt59OJC3eL90uwKq6+zNJh7qUPnQis4yAQ9Unj+9xY7uyqf7c8+kqNHlU+YEgv2/ht2dxAQ6J8OX8GMNGpaLgDJNk7wHH4UnZbla/WkEutJvzQoaZbj0tkKA471SWl8JXWsw6oa/M5R2tEa+clWJGM+GpdXJXphT2HzgpmzNaDUu6t2wr5COOvsFQMYjLCtwQ7zuUy2vhcvcXDwZGbgganyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A1Qxlu6N89ffhdYOUJ7rbtARn2NIA7nR+C8pqWl/79w=;
 b=ONf+jmU2Cx6ztI38CCGj+s+L9d8R1BvAmqtmXeZinak0PnrVlIJkdGRiH41Ct3xNaQrXN2hcczznuVFNBl27Rj5M/nBG/9fI4SFpLUI1cogzeHxiXTepwqthMDMGiLTlDXQAoOGWg+GYPqNohma4uwHkCieLs/kbnx/anjXpNPk=
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
	ppserprodsaar; bh=A1Qxlu6N89ffhdYOUJ7rbtARn2NIA7nR+C8pqWl/79w=; b=
	Eq53B/zBrWE6bqRaCIMrx474LclKHofM2NLbsa1AeGCVJhz459iluFQqamSGudkQ
	mUUonRAITNi7LN7T8c9cjMlyizP5wE9hm2mBiw4EbP7OSE3oeLjCpzp1uqvpAShj
	qZ+MlSLWtKTyvlVfcwQpUf41E3gtGP7m/76IVR6zf6cyHHEeYi74MdpFA7+HJ6D/
	LpkpRuiufvy953vindac26bjqTbVqEV2v4EN6sNWVAY4THC1BClmMkAzQ0OnfP0J
	opmtOPvmSMV0nysBKDgefTAuESV0vVqRwWoRXySTAnarGNIBwZc6Oog0ISrYJSUG
	S3BWLQ8PqlmDQAZgfNxmuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=A1Qxlu6
	N89ffhdYOUJ7rbtARn2NIA7nR+C8pqWl/79w=; b=fHXFFN3X49mECLVaa17mKUh
	rV/yo6yoOHUkhEqgP+CciYd0vxa9jbImOwpKQe9m91cF81VokGZrEIu/4+XP3lRS
	BxasAYoDruikx3NBVpkxZH8WPYCC00cJStQJGhjnC18sJBjxYKO8Atv3OJ9ATmoG
	Be0NaoJsfR7qCdiFmHtHWMbJyPaX89iwidypGGNVbLTfDabXeteRfFzwjIfRMF7b
	3OlH46ov5aTCYYe4cROyFg48KfZjP4LxrKwK2C4lIgt9PI+Geq+q/1N7UJoI5kDZ
	jOcclyhZPnITJZ4vT76LZKNbqIQGfl4WWcXZ/OVD3xMe1XHOHfSyZrsYP0LFsNg=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: obeqwBlw1JrM7oberw9CFy
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v8 3/7] xen/console: switch conring runtime allocation to xvmalloc
Date: Mon, 27 Jul 2026 23:50:45 -0700
Message-ID: <20260728065049.1318143-4-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260728065049.1318143-1-dmukhin@ford.com>
References: <20260728065049.1318143-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280060
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|SJ0PR16MB5219:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7e22a9eb-b8ac-4121-6365-08deec74a3ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|6133799003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZH6XC4nO/ZwLUBU31xoXYAm5oXEFAOOwIa8vZY1L0PHGcEHW8s0I0zhhXaYAozQ1US2tuD/nUCKaLzAkJ+K3mwvzVDk19nIx8X504EzU6xNFenN4oIiVNJ72ImofxutbxshLVOJ3WOrpMyIuQT7gVWuV2b3wV23F9vZJQK8VH2AQLD20lktNB0bhdy3OqNj6D7K96HrbGI/CcYtgy2ciseu3+jXjYNvcx0CtA+KIthnCYxvCCMAbYrcU5LXw/wbtDB3LHkM4h85AtST6Hbz4CjhKoUz3vX6wrw4kNfSg2y5b24ON71mEI+1TZCmCl6x7tdx/kICrAcPMY3aTL8fzQJGzzc+Y07Pv4tjzS3xr9UAMNhDbw8Uf77Il5fBtk8zWZH4tNupsGDEX3/+kDpjK6/TMbGBgGSTGJ9ssZKNIGccQGXTTo2XM1c7lO0PfJ3ake1jpQV/q8Wb1ev0xr0gyKuC+z8WLmYJKP5YCGDfqpbt1BmvC7rpEmesEXi34zhKfkd1Ovn7Q4K9qh+11slBeJvoez5crd/9/4BXUMygGuf4GDT1LcTqWyxm5OfFSDBVy5WVcp5K0g2aiIPAuxf/cCbqRbTgcDLM5MmomXaVmlKCEXsu1sRLlXa7DovW2caqJfDCxyrS5nuCL6DfeSWrvwX70XWo31bYol8cKwyCJ7wcp21IONWHe39rEHCn8nrcgAFgCPe+QsK6AQtgU345JtQ==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(6133799003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LIUiDQLYVx9jOQW++muPVF7CpZ4luKGpJpwst2lvtJaKLoRmNjUe+0UT1K93Tud+x+Owrjy5DFaVOcv6ibF7ujjXkjXyxEt4FwEsBZInSeIH12QSWv6on2AwscMwtQ8GJlLFnA/4H0siOsKUdPbDnIlcSfk0q7AtykLZ61tfgO8DqWYrx/3IwaBZoeeQLoOR2jnLW8qp5L6XkoXmj9nzWj1CFSedBi+ZifXag5kxnGe4uKgweUXuf42A9R9IlbzB2bChJPvRbG0ksFO+7Dw+bdzibaPDawaJ8FP56KDlabOGfQpMLaDi9Q9UtKzaJu0hN2jHCEH6SlQb/3AXbbuHxoJoi15e8HD9bzjdYdRyFvOp5g8T3/1ItbOoxalXvujUkBPR3Tc/PP265BJDYsfm66PY8CaFdkx+F5v1L9aU+al7uxvwevAzorGiUIvcBJiQ
X-Exchange-RoutingPolicyChecked:
	r6zpqaXwdjI8XRUo1P8U76nJQE4WPA8kD2IZJNurfuP0H1Sjrf6x4HOdmkmeTP6tgv3GbLwIIvutlevkZKDDcvsy359s8cXQbTZYWS4TF86pr69V/5ST3tX9+YklxNHP8kizXYYSWwUvtbx4LYjfUVGY3fSzLcayw+IMomwTrna4EZBaztqImG8Jq2bdQhyQgyyi5lNPcm7nQtSAhKsQJlbgGjbAPL4t/iTKBuZtopiW86wnKx5ODAOpqKWqyUSEIkRm8MrUko7fQgkZCN83dC8JvsiH+Q/1pWQDg03Kve3tgyw2vCYxPVpefcN1NleuPG9eM4VUvYndDc+tJ0/scQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Af35D4+3+4eJqRnfpPxnmoDxfdPzNBCmbbsRECmkQTc/icH+y75XQSIaDySH5EpL+9heMYtGvQoFzFGueTLmlid2r8ErN1Qdgs24XQs+kOxKnQ21T87JScR8AzMyL3xwX5BRMTZ2aPLE8fG/FF1ZZQ7ZYbUJ2seO9nY2hMaTofqYGZcgo74XXTWG5gM6vRQCeeCJYGj1hdtxQno/Un1REyyf5Qgiz/qIUWOoSdHeXmu3R4Vh6dT+VbF5sMoGYElYyFDutdHkjZzBaccIVaYmRjRQqImapTYk1lomcrA/SWQz6ZQwnxWpd9BHFs86Y+X/ADM3saJc0GMOizxFAYNbT0b70a61ke+H8mRT1ShxhootdVUxIPTaLWYeGHqhRs9+1tO4vRNqcyFzUg2OAnx/okhqRqrA9ivZZDXAJNmNpYjH4buukD8kLsQisQn/FsydK/hMKUhzvFBakfYPAKkr+Oe5S4tBgQxWgGNxkCBIS7OmYP0jmWN3+lrPrrPYpOkcs/jKLvmp9U18Qhm1TvZ3t1wX+2Y+goZ1caPld8mlI3qIIpbfWlqLOKW7I29nuPrkJVGL2rAGCKffj8360xXI57fMiFTXtDIW25BuIckUw/SSIWblP0I/6eu2bb3sxecctl8ZXsPL3EOGikyaE4I0pg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 06:51:24.0781
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e22a9eb-b8ac-4121-6365-08deec74a3ea
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR16MB5219
X-Proofpoint-GUID: k3QiRU6-9Tt88IFoyATP-xh5e_xjtrW9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2MCBTYWx0ZWRfX3AGFObKjleDs
 9J5nzWeYq7SigSPey2P3NBPB26QkA29vGwen+mhv4jPK7V7mqs6KF7aUD8S4DK94nnwvC0K07Ra
 BkhU+/JkTXBeEHG75gInYkWSr5IcCj9q7c5qiox90RA3OuwI4K5g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2MCBTYWx0ZWRfX/vKQecxI2jGH
 rJ4ZACD1Gt6xeVe10Cb+D/fz2dWAhbYodYkaTQzRM0wPSS0/WFDUcSXp2ai7F0IppxkbtmwKGd5
 wFgy8gnaMhXDSyohiv0IH5/OIdL7S62zYmIrvCv+Fej87Fqa6qnL0urmjB4xniRADkhsFgWKZXJ
 72V6u67WfVCP4o8KWl8X64mPmUSYcY2mZn/Th2P99G/NOdAlfw/Uq+ZhoRPH1lGCkpBZOVLp5eI
 GCjZxE17rKIrQv6FLbrI1rAcQq7rmLuhxxsyFecx1+DXuqaNo9lJAdIAQF3PCO3474gBGnGD1+W
 StxRspHUxkwztHpGsk4DzdrUNO2OZUdKFlZl7WfCnkHE+pNVnDtZ13OY2xEDwI8DOFyAv9DyXh1
 CRPyhaTxCg0hZS+TFoDGvm7qj7g8L0rbZHrc1F8DkAbDf3mjb9+j0xCYhU6nSHk5VhvVin3a5cM
 eKmWR81djSWhvVvYrKQ==
X-Proofpoint-ORIG-GUID: k3QiRU6-9Tt88IFoyATP-xh5e_xjtrW9
X-Authority-Analysis: v=2.4 cv=JPILdcKb c=1 sm=1 tr=0 ts=6a685170 cx=c_pps
 a=+HTpKnCyMzx6Y2VIV8u7NA==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=N9_n2FxmZfwfyRXvS9-E:22 a=VwQbUJbxAAAA:8
 a=iox4zFpeAAAA:8 a=cbNQJ9GKAAAA:8 a=tHz9FfFoAAAA:8 a=rFyfnguHhtC7fIK2BTEA:9
 a=DqJYxgmhk6moR-_7_KoZ:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280060
X-purgate-ID: tlsNG-d62444/1785221490-BEA66757-A7E08999/0/0
X-purgate-type: clean
X-purgate-size: 2717

From: Denis Mukhin <dmukhin@ford.com> 

The console ring only needs to be virtually contiguous; it does not need
a naturally aligned or physically contiguous allocation. Replace the
runtime xenheap allocation in console_init_ring() with an xvmalloc-backed
buffer.

Also clamp the user-configured ring size to the supported range and emit
warning when the requested size is adjusted.

Drop full stops in all diagnostic messages in console_init_ring() to align
code with the common code pattern.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v7:
- Jan's feedback from
  https://lore.kernel.org/xen-devel/0fefa50c-46aa-4ede-a8e2-8c2c619bc2ab@suse.com/
---
 xen/drivers/char/console.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 40355c1d14d6..09282a7a4f8e 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -33,6 +33,7 @@
 #include <asm/setup.h>
 #include <xen/sections.h>
 #include <xen/consoled.h>
+#include <xen/xvmalloc.h>
 
 #ifdef CONFIG_X86
 #include <asm/guest.h>
@@ -464,20 +465,30 @@ void __init console_init_ring(void)
 {
     char *ring;
     unsigned int done, size, n;
-    unsigned int order, memflags;
     unsigned long flags;
 
     if ( !opt_conring_size )
         return;
 
-    order = get_order_from_bytes(max(opt_conring_size, conring_size));
-    memflags = MEMF_bits(crashinfo_maxaddr_bits);
-    while ( (ring = alloc_xenheap_pages(order, memflags)) == NULL )
+    if ( opt_conring_size < GB(2) )
     {
-        BUG_ON(order == 0);
-        order--;
+        unsigned int order = get_order_from_bytes(max(opt_conring_size,
+                                                      conring_size));
+
+        opt_conring_size = PAGE_SIZE << order;
+    }
+    else
+    {
+        printk(XENLOG_WARNING
+               "Limiting user-configured console ring size to 2 GiB\n");
+        opt_conring_size = GB(2);
+    }
+
+    while ( (ring = xvmalloc_array(char, opt_conring_size)) == NULL )
+    {
+        BUG_ON(opt_conring_size == 0);
+        opt_conring_size >>= 1;
     }
-    opt_conring_size = PAGE_SIZE << order;
 
     nrspin_lock_irqsave(&console_lock, flags);
 
@@ -498,7 +509,7 @@ void __init console_init_ring(void)
     conring_size = opt_conring_size;
     nrspin_unlock_irqrestore(&console_lock, flags);
 
-    printk("Allocated console ring of %u KiB.\n", opt_conring_size >> 10);
+    printk("Allocated console ring of %u KiB\n", opt_conring_size >> 10);
 }
 
 /*
-- 
2.54.0


