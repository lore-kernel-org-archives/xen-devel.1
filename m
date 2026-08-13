Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C660AC5CFDB
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 18:36:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1390403.1630829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuaI2-0008V0-65; Thu, 13 Aug 2026 18:36:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1390403.1630829; Thu, 13 Aug 2026 18:36:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuaI2-0008Ut-2w; Thu, 13 Aug 2026 18:36:30 +0000
Received: by outflank-mailman (input) for mailman id 1390403;
 Thu, 13 Aug 2026 18:36:29 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wuaI0-0008UU-Q2
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 18:36:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuaHz-00GbK2-VY
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 20:36:28 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a7e0e9c-8faa-0a2a0a5109dd-0a2a4506990a-12
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 20:36:27 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a7e0ea8-195a-0a2a45060019-94a392176f4e-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 20:36:26 +0200
Received: from pps.filterd (m0482516.ppops.net [127.0.0.1])
 by m0482516.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67DHinV7636690
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 11:36:24 -0700
Received: from ph0pr06cu001.outbound.protection.outlook.com
 (mail-westus3azon11011040.outbound.protection.outlook.com [40.107.208.40])
 by m0482516.ppops.net (PPS) with ESMTPS id 4g1h88hqmf-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 11:36:24 -0700 (PDT)
Received: from SJ0PR05CA0073.namprd05.prod.outlook.com (2603:10b6:a03:332::18)
 by LV0PR16MB7012.namprd16.prod.outlook.com (2603:10b6:408:346::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 18:36:22 +0000
Received: from SJ1PEPF000023CE.namprd02.prod.outlook.com
 (2603:10b6:a03:332:cafe::6a) by SJ0PR05CA0073.outlook.office365.com
 (2603:10b6:a03:332::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.12 via Frontend Transport; Thu,
 13 Aug 2026 18:36:22 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 SJ1PEPF000023CE.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Thu, 13 Aug 2026 18:36:21 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67DI1svF554887
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 14:36:21 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4fxkgcdtxv-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 14:36:20 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id uaHpwoa0QgCzquaHqwVyLk; Thu, 13 Aug 2026 18:36:20 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppford; bh=J93gNFg1w6xPup5L3QkkJfytNmz
	x+IO6XyrvU4tXMxU=; b=BNPWmNTqd90I3TmDw/YPdHgfmJOh5qm6dpqttrjwnbK
	MI0acxXrYOyQXq/S+udcJU+enPFJIzICbzzzZD/3b6AsoNO2BakB3VhHpViUkXJC
	srjRDH1xnNSlY88hDlo4JyVwVmqsHNghyf4RYuuFjh/svnECIt2gkWMEC1iBnVaq
	r79y9UjD03TNcR8Bl0ttBApB8jik4u4oPAyVv/4PA0Pjkaq7S1gwGuTC681zD8gc
	ZVeWfm6GFWMK+JwNfv4P6DDaSDkybtj6b3kVLkB0+GyoceZ6YXrF47oPGYjwfZJu
	KlSAtbAGfGjUrQ522ovl1zSlTr75dFZZjQ6u0Ao4cbQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VjUTI02AYe7ZViRSHRsnmjtpNv2EaV/bssWP/uUMhIqbhO39rtr/k51vvHIuaYK7KmDMke+38KTPsZ3fPfKgF6sdZMsmDVi32l+bQ6oIKZYVfcv2XKDD9FF3W+kvoKVIspQQBQ37NWPMnFfDR4Qu8HveLZFt8OjxnQ9BN4t+1/0r+nFRl5Kt23HSnwwUrZma36/TKCXF+jdMmQNPegQ91uFCBIJr3jsrWui2Ij525OBXSwW8+yJBfUYiBCePdRd4Smx9TTRPD+wyWOyU7Hv12Bu7FnYj5wyj5ChqwX4DTadar7KIlE3EsrN4YCtnpA3v0m2UgK8nDGaW2APTs4vygw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J93gNFg1w6xPup5L3QkkJfytNmzx+IO6XyrvU4tXMxU=;
 b=SYDYPmQKvq6/AbxQmvItAw6t4K7K8oaNHjX6dV9QY3m4swaEInenFBlhRDNBQbecWCbHwQ8lEDx2kKDYU0SHlh6YcclSM/wsxOpdDpImSScfFywrhuF5E8OtZ+8P6LVSeeptS0KFNIOFY7LqAEJL2SNGhkTVZotfE2ALnaEH1tlGiSFDe7wT1SROxYbi/e51gwvuUI2wHULK/Udh46JnjU3lSx0/e1HKsItE3v2SLmxYajx06QFPhKS3srMG+U4e5AuE//pU7OAwrq7+f1hLmI925swIuepqvIINPaE2gMXUP+5SznbXXQY4d5MMEu4WjPb6QpH35gJK8RNOYk/2GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J93gNFg1w6xPup5L3QkkJfytNmzx+IO6XyrvU4tXMxU=;
 b=O0wRUOjBz5uLXrtakKEx+LYSO9jtIyGmPQg6gtEE81sBIoGEEmlonJ0Ld5Uz0NptzXOvcx4b8Vl/FSjRxFJudOo8N9lK3z/yPr5dYWkJZJca64SVQLwRgwBqfQFI1vftnV8f5Pa8Q9Q9eUNl4kBmSFyxAQjcioj8kuE7CYzswjo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppserprodsaar;
	 bh=J93gNFg1w6xPup5L3QkkJfytNmzx+IO6XyrvU4tXMxU=; b=gnpLU5qgJsnT
	kqMrA5ilbjx/Q4d9Z9FB+Q08J5bihhlKj8WCJDy6v17W9hC6SF7TpeMRVC9E5Yqf
	r8L2MugH5WPGzDGd06rSWGg6DWnd2ShSWDl656jRA5nSW1tWVtbQIiHJIP1hwzcy
	7Go8CMVjAdVCUf5xP5KmK+eZ2rMonuEK9hAOCXD2X6syZmanjAYPTNKSE7l8U38T
	zzL7Tnj8R42RaNC/x7ukmAHzS0ymMhAcjrADbNmA1DEWWF7NCbZ30ScfDrjwywe5
	uAG88ooFOzwloVJM0kK9RAwQ2OAL6N/uLux0C9WGkrqDh+bMoyZ0kNEjHMJZEbTM
	SffjThYN8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=J93gNFg1w6xPup5L3Qkk
	JfytNmzx+IO6XyrvU4tXMxU=; b=W40eK51zrkFQNlhcB84VaMBYgQyIE19Rheyr
	J40d+6/S0Z0px7O/sIOdonu5ra/lXUFJ5PTt/8FE3L+cyZOEjyd2v5YYNafGcH2y
	zM4odWKnJCaaBRvaOQzTAvY145QkGaZ4rG9oJ3U2me20Opu5QNG79usF4C82pWDY
	/2UOza/+qtGN+tgL+Hs/u1jDWUXx0txASl7P+6d9iz7kTfAVvXDeAI5VbnoYEBM4
	yNJdzg1JScMfJIVG+7zK3K8rVX8khLfIvZlulhMT2j0Z8/I0T12rnFkKMUnoGAIz
	wXn2rBU19hKWBlqLtiZl05hkupo8tHsSwrhluORbsN9Uu8ozRQ==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: uaHpwoa0QgCzquaHqwVyLk
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Thu, 13 Aug 2026 11:36:17 -0700
To: Jan Beulich <jbeulich@suse.com>
Cc: dmukhin@ford.com, andrew.cooper3@citrix.com, anthony.perard@vates.tech,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5] xen/common: add keyhandler to show Xen command line
Message-ID: <an4OofEH50hEi5Vm@kraken>
References: <20260813035139.915536-2-dmukhin@ford.com>
 <04442bf7-7a19-4eb6-be86-8332da2a5958@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04442bf7-7a19-4eb6-be86-8332da2a5958@suse.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130134
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CE:EE_|LV0PR16MB7012:EE_
X-MS-Office365-Filtering-Correlation-Id: 654e7aad-cdd0-464a-5b8f-08def969c5f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|6133799003|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	oBKQjyY6cSt7kiEVywK+av64k+CNGYPMTAcd+CUz0VSRXtN9yfuYbW7mO3jYUr+Wlz+Xzb+mJxsqtazYN0LzjU83ZKvHjqr0TqTIFbBrkgHZdvB/X1A181omy5m6wW28qz1KwFugQMOu9tOkUC1ZMJow4pqrXWADdlYc/5bPfsZudQK/Q7mvavYbHyrQzkA4SqEks/FWDRPhE+dr5ZT9HwDE44gt3gljKv2faaiiPteD/7HZUPFegxvvLXUtoLLDf/ek7tCi+JXa6Hs/DE+f/m9iE3ah864nCV4B5e429GyY5+VPS+lZIn3fcB4PydtNzsnEbXM58HUy037d/rFBE80IAIMS40kx5rGo5uL4iPbEWhVmzVmYMsKiBvZDRm8QM5zki52GOqmCoBkuLPcE5BtQu/0jPLQL5WEM3Cx/ZQt838KrMRXraH1yuT9EBi24JITRMta8/Ld5Y898GRis4lbe6lwUoJusJDRJnqzRy7VFpNnE4fkf9fhBpwFl1pKJ1H/KOUXzc8yByKWX2oT1Gim0IXTBYXIXGUu6R9fahjYAxYHtrjIZIarCkexwMH/F71BPbovP+Nqf2Lw0d3VTTGV4VwP5F48XSOMKk6DIQFtVEcox8l8vnEZTepH4e+vhUwV+XLyl1DXHDaPoXdGxkoRQIhMJK/ggTcaftn9S1bqAT4qJnmpGxoUw5wCSGf1KuCtYBmwBcIUK9L/WVH3yiw==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(6133799003)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	chF6W3dKBU3QJvMVWQQ2eQAcp4JN5d+C3kc/Jj87HJ5DKaYfTeGYAfVpGtYBW+AgYe+GFlgfYiMFA6j5zLogRLwfMJaxFgaXuDA5gieu8cwQh2KOpdxyDQCZ+D3KiDCrQfheyynskuHCnOi0aPZuH8IOJiUDZ6JPA3QcPXpUHnvRmd+XxqyOXxmV5IQosfmx2F8pVDG50ASRnEMXuWEZtmIAoO18hplgSjGr26XlXGHNi7V9PqydVqvKKAKuET9R/M6hP8yNosdvg5zHRx7GULfOPwmH948caKBdFsEtB7IwK6MwpyqHjjFi5+Ip30gu9B7b0otjISH6L87JT5V1XgLBL7dCWWisfF67N12beTR/yyJyq7I1VUrgKSqGTKPgUdpwdzk1stQ15wM210Ck+HOD6GgFlRg1BzsNt9RZ8Vn7d7L9ahzk73FnqeNFyo3J
X-Exchange-RoutingPolicyChecked:
	S5JcBFINmzCb9AxAo3CRyd8rhyYAnN3R+XgnzUM6EOLp/fZyq7lMwi3/YaZKohlNTcfrA8WS9mHPoa2vtbDg8rcZzbY8IgZ+AOv5UtjSBSxoExfzXuZpaC9I35eozYKo/NvVuXO+wqS4Dpz8SG1Rza1x1PoOOsYwVky3YzZtgQmH+eXFTpJnqFSjaohPD8wh9SaE2uZynPG+UjzW6CdK6wAonXsf6aSDEnUvnbZ2cBH7TxEzBQba1jGyBqZQcfWRrOLmA/AG4AUFTuI6UUZ5YpsByRytHDwo4We/eSfCVoqTb89AIy/GNbbLjAGpug3QAwS2svdpAh/EqmyS1rTdSg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iOpHPzRRYRfDD31uuzbTswDMamEDrqXf5+TaC9rw6XYUkf+klFMt1qiksGq4t7CPOFnwsMdhbAmnkQfqJKqPSC1SXvbTjE3ZERPr4rtjH6krBOlrbqx+KAmYCJdNjAGBpSonKgfJ3kXnB4FtIt4kr9yiA4EiYspfVSXzYPD1zbF+4d3gxOnJMPdBe0aVgEgQLPwIBEKYAitOov3c/rsCWwQHqW4y1MU4KgHrGkbiBD5Va9d0SjyGm3RPTyLdb5nnDWukECKB8rnHmgsP+Xf1SHcGNC+FAaNCEcSAKuIZcGKAkTckMsuqZUkUvPDemDRtO95i+Hz37UFqKdCk5FOCCBpTjF8pgcucWXHoYKkpk2FvuIABrE++8hF7+SP2F2uLgz+3gH4aGIav9n3NRhZUy+EYItvRobQQqfBVovot4Mun2GUUWbPVkpHtbNAq+9tg9FzPVJRnmYXw/gi4sz0UCsn6AdANJrbwWl9+kz79gAYdIze+hv5lIuzmSw3kdtU4FR0LSYRjPZ3HP7d1CCO7JY0j54Y8TEvN19Ava/oFC285bOkEZRyfwalrcCIYc6L821BsPA2teFRWWAFjnUp3NSQ70yylPArdwsSy49AKpxoqWR2+msnGd0Yol0tgsuLVs7GoTLg+pLYV/HIsw5fELQ==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 18:36:21.8858
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 654e7aad-cdd0-464a-5b8f-08def969c5f9
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR16MB7012
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEzNCBTYWx0ZWRfX38uTVQyrF4+J
 dMgRqu3ooDzUHv3hMnigSdpeG3HxLdxXKugg4STKi/BH9RJ8cZy3Qh6lJfllk2Zcjrdu71B6WYL
 sI5PbULy2zq7aC8JaHQWTETLy4xGiXokHVgEeIq52Q73URJp0VF7
X-Proofpoint-ORIG-GUID: BwzB0R1difCG4Y7p-egCaFtbSQ5IFl-w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEzNCBTYWx0ZWRfX/hgCiHuSjWKF
 rf6jv7M4UzfkLeg8dJROry5/V0ZEImaaAyFlNhruOISQtVP6Il+W2FKlZ7d5zzVybDbyh0DvqmA
 3eapHbLAv+3P5CjZQPSjVGXCqAl/04D54sijPN6v1Ab0cvPDjHUgo98WIOUFLjZLdAg19mYueK9
 QCxxPR497A8l1i+IP0Vz0EWJTy3FG6Wcgru6iiJK/SI+odRDEKfcAh9PtGtY1gzqKdWxor8Buh7
 heHkXOxWhYnQPmmDEA/xnDnYjO9ge8Zu+cc9VGMEcZt+TjzwAA13AN2YcSuKx9rWQtwscFn6yhw
 x1BuavBweCBOAJ/1+fkyqO18Ma5LASKDs/4ul4JJtuAxwCpQpdpc93pbu5r3+ff3Rv5HjoJnZ/r
 Hgg6DQ8FrVDMJ1o/955ttoq1JxrwqFTBSpZKb8u1lRLOxsjm7lbBYVNUb71qlbu0aHgLK6101HS
 OUHwvTO7/IWdXRdqPOg==
X-Proofpoint-GUID: BwzB0R1difCG4Y7p-egCaFtbSQ5IFl-w
X-Authority-Analysis: v=2.4 cv=Xda5Co55 c=1 sm=1 tr=0 ts=6a7e0ea8 cx=c_pps
 a=SygfnsF0+onPdWEB+AKh+Q==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=NvsXeTrgx-CJMFV-xl94:22
 a=cbNQJ9GKAAAA:8 a=29axmnuJF_3FvSqT780A:9 a=CjuIK1q_8ugA:10
 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130134
X-purgate-ID: tlsNG-16d1c6/1786646187-F480577B-BC634AB4/0/0
X-purgate-type: clean
X-purgate-size: 1327

On Thu, Aug 13, 2026 at 08:00:11AM +0200, Jan Beulich wrote:
> On 13.08.2026 05:51, dmukhin@ford.com wrote:
> > From: Denis Mukhin <dmukhin@ford.com> 
> > 
> > Currently there's no way to print Xen command line on the emergency
> > console for debugging purposes when 'xl' is unavailable.
> > 
> > Add new keyhander '?' to do command line printout.
> > 
> > To allow built-in command printout, drop __initconst in
> > 'opt_builtin_cmdline' declaration.
> > 
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v4:
> > - promote opt_builtin_cmdline to __ro_after_init and use it for
> >   built-in command line reporting
> > - account for empty saved_cmdline
> > - adjust register_keyhandler() call - use '?'
> 
> This isn't quite what I was expecting, following the feedback you got on
> v4. My expectation was that we'd see a 2-patch series, first patch moving
> non-help stuff out of the 'h' handler, second patch adding the dumping of
> the command line. Naturally the new handler then wouldn't be named
> show_cmdline(). I'd then further expect tat no new use of
> register_keyhandler() would be necessary: The handler itself would live
> in keyhandler.c, and print_version() would then be accompanied by a new
> print_cmdline().

I see, will update.

> 
> Jan
> 

