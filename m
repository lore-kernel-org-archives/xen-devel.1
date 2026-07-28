Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB904C54F52
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 06:51:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1372101.1619531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wobf8-0003BO-Ag; Tue, 28 Jul 2026 06:51:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1372101.1619531; Tue, 28 Jul 2026 06:51:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wobf8-0003B9-7n; Tue, 28 Jul 2026 06:51:38 +0000
Received: by outflank-mailman (input) for mailman id 1372101;
 Tue, 28 Jul 2026 06:51:36 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wobf6-00038Y-Nk
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 06:51:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wobf6-003NGo-3o
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 08:51:36 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a685170-e002-0a2a0a5209dd-0a2a450aadac-28
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 08:51:36 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a685175-f2d2-0a2a450a0019-94a39217ce32-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 08:51:35 +0200
Received: from pps.filterd (m0367126.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66S3ZpDi331091
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:51:33 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com
 (mail-northcentralusazon11012050.outbound.protection.outlook.com
 [40.107.200.50])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4fpf2uuaa7-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:51:33 +0000 (GMT)
Received: from DS3P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:45f::13) by
 DS1PR16MB6596.namprd16.prod.outlook.com (2603:10b6:8:1e4::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.12; Tue, 28 Jul 2026 06:51:30 +0000
Received: from DS2PEPF000061C1.namprd02.prod.outlook.com
 (2603:10b6:8:45f:cafe::1f) by DS3P220CA0013.outlook.office365.com
 (2603:10b6:8:45f::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Tue,
 28 Jul 2026 06:51:30 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 DS2PEPF000061C1.mail.protection.outlook.com (10.167.23.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Tue, 28 Jul 2026 06:51:29 +0000
Received: from pps.filterd (m0373460.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66S3cDMn2945260
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 02:51:29 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4fne0y2kh5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 02:51:28 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id obewwrUDbAJcNobewwBr4V; Tue, 28 Jul 2026 06:51:28 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=x0I
	5dZqsaE9TP4bNGGGXMWIoZmxerERJuqTqO3HQvSM=; b=nb57CLJi1E5r+TvEaeZ
	sd6NNSZLdqeThL2od+HWlUKYKHtEPqnCCKSVM3WMgtBaaYrMpzV7mhlTtwHyQ+YA
	S9ZF2hskUY438nUelYhwOVy1lDejHg6N+lnWXCT7Emth7AUMtbnTh0Ts8yy0L5DI
	YrYP+inI65TNSIAKdYbTzvSOjO81iSpJogABBj9yF3m4/eqP7Jw95Xvr3ZSBE7BE
	tJ+pTqToat/l/3wB6wp/sZan6BPe7s9SSoS2GjglX58aPXMmyQlQq1XOg/E8VYsX
	d0Orlfm2uCivdi2uEySmx0eDKBzmyXTf/P/E773RWRzrwUgzxK63aQvTGuWwdUAp
	3Qg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N41ksUiF8RlxEpeP1il+iCdg2dI1tFm5PQtZq74xPHxBkh9zBlbWwf3ldCUeJZTnw2JpSm8n28KOZ4+QAN76rrqeSCY+9qSyR6aTrvQPNzk5zv61zaGKtLvENwgbqxwWxsoLPrRdc6YnxB9pPHhxVbqrlZs4shni7ng3TA8oQxtJn+aNtJShSb9dOjFYtE91sThGzo/9z63jDpyl8PI394jRJLFpIQRqHaHhVCkglQgGmjKLU6qo8SGG5A0HW+ThCEReGjumiMvX1VNwfhSqUOhxH06apPd5+9VGDotY1VSt2T3RHOODfKduvMNfIYjF8ZZ0KmGN5+sSfF/uGIT1mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0I5dZqsaE9TP4bNGGGXMWIoZmxerERJuqTqO3HQvSM=;
 b=aOYE6jIq123x5J9b3egD5okWScHoZK4Yu9y6kUEXkWSDmAxE8HTdXZNJtKTYYvTyeeEFtfUUuswOvDAx9dhQ4jfgX9gOwxY7Th1QAWNQcGQSW3nhhkpDnrcFh/yX5fxWP4hYsSMty9xNT808CO9GscddhtSmx8nQV2iAqPV+Lu5WmzZ2rKcx4ZBVf4kFzNCZYW89oJCUaQ0fVts0O/9dzfAASDkkS4GZsayEESVJdIfKgm5e2ihXNYafaBuRO9MoFueKPvITJYP9Ll4W+Sy6B1NhJIZn4KZDbCNrascJmjhm54iv6YJZ+os27SFmyXVDMd4lLUp3GYuQ8yCqayzyzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0I5dZqsaE9TP4bNGGGXMWIoZmxerERJuqTqO3HQvSM=;
 b=kXEHfHCktPUjXS00n5a2EbY9CCqm2wfTXlvH5z22RogRT7yJyeddorfEqs2NiWaHADa9loVOL037Uuxu+XrRnvupATLmlTz3MIUy81LU9pjXtf9gZ1znDQTf8/l8hBqU9naU3y37MpRaqkdzBH2IiGfTMXu/wtERt0nh0ze0zPs=
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
	ppserprodsaar; bh=x0I5dZqsaE9TP4bNGGGXMWIoZmxerERJuqTqO3HQvSM=; b=
	lwm3EOX7e5GWePcV3gGY9WTfl069yVKTGE1J7LWHhB667hA7Rluv+vLEC7Ax0hDX
	vQIObzZbvE4W6qnKmFFBQPNKnZGQF3YRT7LD/A6QjtqsgY+63ImrPVdTTFxle9UB
	ghfFArjk5/Ru/zbEHj7foSYR7D3bmQc8s/MhXPNP49+hgqSD5HCxuLnCW+QGiRO3
	BG+vbYLH7XEDuiujAW6e6xjNKB+1914BVeN1IUjKpNb20IWqo9D4uQGV0suxJYVQ
	3mzSXdpHhCaqveGAPY9y0ZjSYvDmhw3ouD++iXW/CoUwWYdyxeAOavnlKMrRGxpM
	yUaA1rxeNs4br582t8Qj5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=x0I5dZq
	saE9TP4bNGGGXMWIoZmxerERJuqTqO3HQvSM=; b=r4epTvKpHSUzxwvbRgV/pBG
	ucwuNhOf01gVQ4pdafFPKeRTd/eDjRPVF2XdVQdsWZqMVMEfiIFZHl+AO6RUqjWq
	O3vM0JGaHkeJOVYq63aml3nq4ESlktvnpYnr8U2Yc9hERbGadiiXf9RnJaEKGbMl
	7QKrZBCD6FoJyR6jkqFBLJRY37qL6Phs6mvqRLdzCc92W1bw5aYHlThsm9gvHqcA
	LgdKAAz+xx4qiZ2OvxSrQYYn36T5IVgwCdBOwyFU1wBAz9wnuft39YXdOewegg6s
	v22oujYED5VfVMKrgI5wInxQEsc+dF84jqv41122vFzHBBqTl0mTMx2LbQ6IGFw=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: obewwrUDbAJcNobewwBr4V
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v8 5/7] xen/console: use memcpy() in conring_puts()
Date: Mon, 27 Jul 2026 23:50:47 -0700
Message-ID: <20260728065049.1318143-6-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260728065049.1318143-1-dmukhin@ford.com>
References: <20260728065049.1318143-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2607280060
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C1:EE_|DS1PR16MB6596:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d11fd38b-54b5-40c2-0ae8-08deec74a733
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	ooSIM5LNq2EHNfQZ5JQC02UfKem32DV5Zhjuz3qyYE0/MA+WJoGCHLlWjHvOT9Y2He8KHJRQtQgsTYQxweHXSDjR85tfigx6B5W9Pnb3/ZxXq4Y/1wmKkpzB9zlVvOa6hlrsqbCQD4nQpQQIPcnDGOPtxsXGCoy0jEsG7+zI+xFG5Dq6QBPk0sjBoZp0ZN0EsKzO+La3YgE02SyrDjLHb8Z472zldTGUaQ6cxmTPiIrPMAUltnaPaYGqMBQrCXcYWlqD5tfo60w64zKHzDi9UKAxdjx3AJa2lu6YqZapBIlKaKZFlOKp9jAzWbnTbc63gtvViTv7nnA6NxWB5TS0LjFAbl8oZsFAfbGJ1SHUMoCvdwbKz3oVBRHrKV6qsE83y1o1ypWhpaDQlLngkwYwkVZ3k5jolOWOP9xAPLChjr/JAqhxcjkVTGYrOi5lYSnXLCS2t5rBZaAKxgvqUqMH5DI7EIvzi0j4uqHbkp9Qv9US2/vRHz3MhR9OOOdzbOidysBKVx0h0vRVF6Ux2risl4711uaCH5Vizq9JtoC0kX78MJzhmkZn0bEiR3Cj7c2IH9Wm2/90F9/uRldEvdtz4623qX1iraw+laM1fC3uA4/HXEk2PGl/40DKTPTT4RP5bYw+Z2ivLc4jn0VW9RBGiN4YeCk6qfL8fDvfn+RzIlwYQMHbqziGFdzBbYyciRnoTVwTEfzfA0IdMsO1dI9EEA==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/3O/OcSteh1jHtFCkd4sPPtoa9W9p0Qeo01gdKEan78APQ8CeEDbUCV/ushXSRcaWP17nW4YqoUjhUKqkdiW82mHP6CrL953MV0VCxft1Q4h0qx3DFZntalHJObtDOgqgYQfHUbpCKC0stZ9mMs7P0Jq0PEw9ZphB1VJ7dOQEmMDSO3NuRMkBOV0n36GSrDiFt2Hb/VE58gHZ/sWpqpA2X/l8qYwJBSpHI5/KVxbFHNWtHU7fcfUzLAjgFiuGPXk5Dr3LYe9UbJJiCYWEh/RUtnmglTj/WkVi1xuHtYTMcYDkTQplt7l6sJ6YriM+vvjh1QYNW/bVRkz3G/4G1gHbKt71nYBAe1WNzZ/IWngFk4TlwJNeBJx+UqQrx5jq1m6nD27gCHhlxcZzRVLW4/kitgN75iK/Gn3rF90O2sMiZFVBlpr0An0Yz3A5Tq14yZ/
X-Exchange-RoutingPolicyChecked:
	T5llKJdLoAv51odNKDpH4HhRxvROBddmI1Oe8nWxoDYN/7c7aEvDb5jfFy0JcmsNt1ZPW7fJh6majwZJ1WdZGTtU82IFNU0B7CksUAZZs1vk1C1SOvjhJ6yl51FgWQBgafU2qLWkfkRkPgkYt8vb6m6ULQ0aHcZFFkSJOHIuDEHGfMDTPEki+OOZlygEMIM8LVCQ3t21ViokF9151D/SPtFXJ+G1UQbojK9PXwY9mP1sVi1Xbrb67pmpQc+BjXNz3tMnPsof3GXUavokyDW/HmYBSaSHQjJP5ypB7UpEfp0be7cm+MdNSpGowZgZYilkLLaeTfE9yZWb0WxBev10Tw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	86UdC+CatOLaPnhwIr46ntpbscON8hx+WNdbESLx5AuvKjgT7Bf4iqB6lRFcb2AbaGQSymAD71+63A2hGM9SqwFhMBIP6LkGd8M+UBRPIycjysUx7Br6X99PA2c1Eqw/w/dBd6mXN+eR0ca3K3QODbS4C6XcdmClv7b2MejHYL4rXwIysnxUbMh/AbUfcyYCSMBFAZIWKFpXYQmQ9mDwNt+R4QUkk0XEJM6HHqfIlTp7Pt+Y1YMLLF7x45mr5YqN9hLWUQF952scH0V7ba+psS8a6lP0OUf+8sEOGBocF4K1V1Rjzga6FxiuFcmULiyp0FMeeH5AXB6iZgyFu25ZoJkg+Z/f5Eltsfek/MVI2rfUj11+neQv9GKvbZ54BaQp0qa1jchRXY+zN6q+frAPXaJMz05KOrmdAQq7tBdu5XVSf9ZvGYD224al9cY35mRne+k5jswMg6/XfIVEFMNyTNT/+wN+Grz9iedrjQoQL6ABWzsFEV9TsuyLLOGn1suI9ZH/cYkruEQAzMTlUygpJhLmoi8grTTynSdXNw9gopvG1vXXiD0waRvRMZdEsbtxmKe9OQkWq5+DMZ27ZSkWQBVGNgckIoSVvjaXX3PoSuRpwIT+xASKtc1TqvWIAKDI3MrrPJA9RokiMHj2+jQHNQ==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 06:51:29.6566
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d11fd38b-54b5-40c2-0ae8-08deec74a733
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR16MB6596
X-Authority-Analysis: v=2.4 cv=O5cJeh9W c=1 sm=1 tr=0 ts=6a685175 cx=c_pps
 a=ZVLNonFp53krOPJecICuKg==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=-OawqTZBqJjt90xPb8wn:22 a=cbNQJ9GKAAAA:8
 a=xRmHRjTGlWJa7SWEWMMA:9 a=P0bj-C3X3jJDpopQwM1U:22
X-Proofpoint-ORIG-GUID: DuVj7qgqzrhxCe7c8xzLf6CXw6xY1E3J
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2MCBTYWx0ZWRfX66/I7KAuRc77
 uIMczz5bOEzWUeEcV/mdKfUuabS/9msMD/UJ/iKl+fBegvbQIdvTqd5KhI3vdHH0J2nqssHDFlC
 b2cr8/h9KbdwEeCMUnt4QjFCAVMlC5CUckV2Jn1uy0l+bmvNs5+f
X-Proofpoint-GUID: DuVj7qgqzrhxCe7c8xzLf6CXw6xY1E3J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2MCBTYWx0ZWRfX7J9eLn0yQVtW
 2Fb/YCyp2NTCXE53ETt5By85WPOsXInS5Anc/0b7ZXRicfynTaZZ6gU4LpWZgXbHEL22Ou6tJwi
 d0ogxQjt4Jvf2giC91lzIg7GYmshqoaI/Xm+9XahTJHNhBWJpue8Kx8F2POXTb3qalmz243jMzi
 dwUWa4F1HC7CKFNg3PyXP6XP9H1xtKuaEhuw5zeC6jeiSaoI7j/qOFT2Oua/67+drBsovMCoOsX
 jQBc+tzJ0wonBmeMOFJkwBUGm9FQoTPW4k7u5HGQOCXjYxL/UcuCKEtcocVvMjOWaQLjsMpS6XS
 dZ51BbMjTOI6tcOd6AeHBxfxoVPCl5v1ZvhgWjxFzf5cQ+shiHeCdz5JA8mVApIjbs073owKM+p
 CFM7rqNczee8/gv7QiIoUTOkvAIFYHAkILXHxs4D5KKAd6yNkpi6nzDEU5XLoIP6EldH4KKIPVi
 88FYbNPGDLRQGzVexNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280060
X-purgate-ID: tlsNG-4011c0/1785221495-524DFCFC-E1160779/0/0
X-purgate-type: clean
X-purgate-size: 1528

From: Denis Mukhin <dmukhin@ford.com> 

Make conring_puts() more efficient by using memcpy()'s, rather than
copying the ring a byte at a time.

No functional change intended.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v7:
- hardended len check in conring_puts()
---
 xen/drivers/char/console.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 09282a7a4f8e..a1b8e5f5b507 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -361,12 +361,24 @@ static DECLARE_SOFTIRQ_TASKLET(conring_tasklet, conring_notify, NULL);
 /* NB: Do not send conring VIRQs during panic. */
 static bool conring_no_notify;
 
-static void conring_puts(const char *str, size_t len)
+static void conring_puts(const char *str, unsigned int len)
 {
+    unsigned int src = len;
+
+    /* There are no callers with strings longer than PAGE_SIZE. */
+    BUG_ON(len > PAGE_SIZE);
     ASSERT(rspin_is_locked(&console_lock));
 
-    while ( len-- )
-        conring[CONRING_IDX_MASK(conringp++)] = *str++;
+    while ( src < len )
+    {
+        unsigned int dst = CONRING_IDX_MASK(conringp + src);
+        unsigned int n = min(conring_size - dst, len - src);
+
+        memcpy(&conring[dst], &str[src], n);
+        src += n;
+    }
+
+    conringp += len;
 
     if ( conringp - conringc > conring_size )
         conringc = conringp - conring_size;
-- 
2.54.0


