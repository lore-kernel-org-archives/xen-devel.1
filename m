Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B87CC5CFCF
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2026 01:02:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1390564.1630872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wugJW-0004tO-D5; Fri, 14 Aug 2026 01:02:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1390564.1630872; Fri, 14 Aug 2026 01:02:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wugJW-0004sT-9l; Fri, 14 Aug 2026 01:02:26 +0000
Received: by outflank-mailman (input) for mailman id 1390564;
 Fri, 14 Aug 2026 01:02:25 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wugJV-0004qV-9o
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 01:02:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wugJU-004ZR0-7S
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 03:02:24 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a7e6917-e002-0a2a0a5209dd-0a2a4506d2f8-20
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 03:02:24 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a7e691e-195a-0a2a45060019-94a38ff1c354-3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 03:02:23 +0200
Received: from pps.filterd (m0367127.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67E0ND46118465
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 01:02:22 GMT
Received: from byapr05cu005.outbound.protection.outlook.com
 (mail-westusazon11010044.outbound.protection.outlook.com [52.101.85.44])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4g1nf99pc2-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 01:02:21 +0000 (GMT)
Received: from SJ0PR13CA0234.namprd13.prod.outlook.com (2603:10b6:a03:2c1::29)
 by PH7PR16MB6259.namprd16.prod.outlook.com (2603:10b6:510:314::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 01:02:18 +0000
Received: from SJ5PEPF00000205.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::35) by SJ0PR13CA0234.outlook.office365.com
 (2603:10b6:a03:2c1::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3 via Frontend Transport; Fri, 14
 Aug 2026 01:02:18 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 SJ5PEPF00000205.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Fri, 14 Aug 2026 01:02:18 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67E0VKjP1381261
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 21:02:17 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4fxkhrpbkc-9
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 21:02:17 -0400 (EDT)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id ugJKwnavi6i5qugJLwgwSn; Fri, 14 Aug 2026 01:02:17 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=ym3
	9jgrPTUF3kll+dsbU0hDpU2DP9K6eoXmXHXDMKrM=; b=GiQDohpLbeWo7qJtChG
	/iwwWXumqy3FF2m+y7sXE45TI5dnipPTRpcb9I5p0K4zoDretLFbrqOBpjPkIM8h
	M3JpTH6AnFhCIxbJGPAiqilFyOSMXbCyY0/qfmAaU/DhrYk9VuQSqrzzeKWrsXNk
	rPHVnkOMtvX3psUDC9F6Ukka7kNDQPDmvea5/y76bj56bD+Xt8BSENk3vktksH2u
	VYsJ573CfUsxqpI1VDGiYLAw6oe8yrVbXXgvzxoLs7DZlJXal3GDfqMMfisHUOow
	6Flm2MTudtLDWBwBVtYJXiekTokHcZGVpEAuWUQTPr3n3BI9TYkCD9E+zYeKLkGA
	Euw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F7QyzzZYvcv8G6E666bR9mHjsXFEpZ/SUdEVaLl7bmfUEXMhOrm/yvvGOU0RCEeDJkgSLpOfynasyUWEv5BuUzdGlCRLP/Bc9+9wpXjPySFVxwL6/3Xl6yx53jhIoP9KWJmIQ4eY2r2LKbJrwukZUn6ihZL2d4NWnkCb3s4v+m2+mfIhomJR1WuMEnB17dyJW9YHk4lYKh45LP9aGmJVz6Tn02BHMIRSc3NcWGCR9raTs+n3rikwfA5/ShDyYdJNC6msjiYFVxVVlKGSGMjtWYZoLwE0GdK0keRXQGZ84lUTrgR5/S8xevebxLuHxxn8s4DQUHf9UbbPeJ5PJ11rcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ym39jgrPTUF3kll+dsbU0hDpU2DP9K6eoXmXHXDMKrM=;
 b=RNftpO05V+1wzyFUFTzco7Dy90IhFoiwLFTUlHSOy5Fo4cBt3bhD94ELUhQqplLNH7ypF0AoMCl+DVd1dqBLI9q4Hw8cuUPRMhKQmin4f3sAgZ9JY36LxveyO+kgRAnqq0/Ab9O54HGdbsJ6ITiOQr55xGprsY+7S5WLwdV0Wt+vKIK5h7NvWb30IHv+PEQaEl4IGSC/S4hy2L8/PG++dGV9KD3jWmKWJo4nkjFGyz8Z/kI6/3FGFvPah+d1j5lD256L6XxWFjwL0nv29XcpesXubxBJKffJTVxQxVMFQK03J0xrIWDrSw9uL9KuDWIxQ//dpy64Raqp18RqiLJopg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ym39jgrPTUF3kll+dsbU0hDpU2DP9K6eoXmXHXDMKrM=;
 b=ISkchdlzmH/prhT7qig7nMjL4N4uZFDsYHpCSt5K9CedHVFY1INOFvvjZ8EcuVtPLfn8bB+MSoPEy1O8yVWBZ9LQNgSEfiqhoRPrkNnoMwQHZOvVLHgNsxclNs2IxslgTr5ljvWkRYoqjckZz3L28f9QaDtVVSpO+IyVyfZSJM4=
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
	ppserprodsaar; bh=ym39jgrPTUF3kll+dsbU0hDpU2DP9K6eoXmXHXDMKrM=; b=
	ojNv3p3+MRGKNnFDm1zuRVyvyQ7RcQNonWRhbMhWxVhCX00LP7SbvKJMc3zB+kH5
	narKWxpH30j1IHgexeCho5feq86712z6cT4WRlAdqcjYCTKU4JZUL7P6r4R2NJJK
	rhNyPFYtTFYjXNo2x1/E1237l59YOGotIOZVCTl7BGLcVdX1DI3b8R0BSWqs0jD2
	ACEx7GgdACMpx8YYapjh7RyVhlC6kQSJsiKGSIRdvKAeuQ3nSzkWsXSDpLz71jUX
	Y8n8AgoZ6uGzZjEvXqHEnykF1D84CVJFIqivx2NlzT+M+w+TPVbDoZJqgPtPFk7X
	BUdJ07tNkQSkP8BoWGha1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=ym39jgr
	PTUF3kll+dsbU0hDpU2DP9K6eoXmXHXDMKrM=; b=BLdsi9d/zod9DRRJ+gHWOqX
	l170JyojyB3ZPdgwN2OF9WYeVHqSy2T8cTlGvB8aUz8gT1eAxDjL1r528g3KrQMh
	K5mNeiuqXQA37wg5adlR5GhR3tzfBiMfAz55TfJijmqHs0PCM7StmDqYatTPbHy1
	Cd2RL1y7K/nYHUrQcDfos1RgGGVRrTL/kiAdwBgOc6yz1nDvmshcHYb9tWuAV30L
	+2k3Aw1X0KVvadRVskQUvora8jitMKlHnxUHpVe9KtLcuvM6s4aEQ30X+CAGc1Xw
	RwBF7mLR1bKB/24+aYBDEzoZGuxv7RPMvnOJtpawIWVJAayr4z9KguzKdS7/6Kg=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: ugJKwnavi6i5qugJLwgwSn
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v6 2/2] xen/common: move version printout under '?' keyhandler
Date: Thu, 13 Aug 2026 18:02:06 -0700
Message-ID: <20260814010206.1321724-3-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260814010206.1321724-1-dmukhin@ford.com>
References: <20260814010206.1321724-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140006
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000205:EE_|PH7PR16MB6259:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c672446f-1f50-49f2-6e39-08def99faffa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	2EhhgzMCvYMXlMs9GiwOLGQ751EHjVEfs7I7X9O4AXt5flpQG7zJcjf2ZG4LwoujLcABHhsLAfP82BGhZRhidN8y4lwkRoV71p1q2Fph3njJHvAyt+w58o0JRhEF/4Sw9MtRNnnkNsF6501gzqjL7sOUzNStP1hYiPIMxGPD6ryGjOswrCgQg8Gq9VGUDMgtfbFur8dH2w6QYGsNtqFGm5jVbI01rJvY/QVRDbEjWC2whO2He2kiJsUHU187OuF5zzn2vI47htBeswGfcWHtl3+X+cpbN5456v2EHBZYhFlwm2HaHJCJFvIscLOnWT5Er+Q36h1XyAssdjbQzQOdbVFbnzscZT+8XqU1fdjyRAJGDNZoTPGQf6imzKfGbv0Id8CWikYzaiGQE6UWZcqvCAhCptKNb2jN+UMbyp9x0fks97F/ip5vb32ZQYdIpntj8tHOUxLyBpYo+jNlU+2r1lJLK7M859HX7NSixNYJNkPXNaqIjuE9ULYeqM2lKmm+aT9nbJ8Yhiw5X0Rmu4T8aEDN6s+07LLDIQ1ZP5xSsl0wxpHPArUttfd74zUU8XGKnqAJpfGYsAcng5mE43HN92bjPLJ7LY9qFLWTVFrDEXo+LPoWGW9mz7Rq0JPXrabQpnTNP8/smJRz9EFtyCm6gABB2uqeulrBevy4ulUEJObY55DsJ1vKUoIPKkH8p7o7i361CAuE9hwy+Avnkm2sOA==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HGWb687IB+PiK9MICnz+iN3RI5PQjPAny4gvc16W0sYA/7S28z6445BcH+Dphnl/PnWKziAGjGhPbrlCeWx3SvMrolbNhkhowko7jLmYXqKUJ28SPVLCYvJUU8J0N42zKbx4npxTG6Wd7IG7jynei8hlNe0J94Oz4rOyB60ZesLptikGbiJa3fCuXyxBSwUEbmngYz8d3SRAreVHgLgjWppbxcXIWpqfrDtM5iPEx0dLzXA4Vhcq0MnDkZ4FJ8+xmDAyU0cwzoegIo/wrIzcmPwHg3v00rRvx+68WGQUQmYCRghWYQj0HTmXeAV5niT6gvg478C7egKc/KOusapvjpBdr8DMGA0iFH4S3MlP8tyvbbAMqfJpW19O/0Xt2asO1oGrwaY11a1yRFkPUwf7vI9o59AQNKfxgoMid4AIUFWgQAnu8qmPZh9608COCzpi
X-Exchange-RoutingPolicyChecked:
	HIlJPFgy+9cancdKFvLPoR/Jcz1g48kX2XdefmgMITuRZNt2PYPQRI+X4ApySHGZ/DfvfxodggvKfVugJrZsOO7cNGIHOQy1bKN295hRcDAY4gvhYpPaEn+w4KZxKA7In6Rcb5R/Jwwg0MJzl4A3XThzaPH9RIEEn/quKVHRELhu9CTInxp8GUcEqWQ8s3Myhw1zHQOF7y8d7eSe93SWtlRWlyFEm8f9P/XlfRIpvFNlVGhpVtUcNz+sd+q1NeBOz5HdqTRQBoML3qC9fJm6Vf7yzfpnQHAUEabgPN5K9FfY6xSY7XnbPZyoha93j+WDsUnh5dDYGHsLRlerQka15w==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7Lvhspx2SBuzD1lTmZpxxqClDXI67H27wQgMp10G+Lt9/WAsAop2moQ7yfeyPr0s0sbG+40vw4pia30IBjZH+SxV4rAJ+CZg1/Hunz+iZ9RzJeAIQWIXqeNOG0aKajeSp6K45Wqwj5AWer41Y/SkFSfPYYgFixv2/d4Q55j3dHxGovlqxSTo4H41tH7fWssZhcU7TUabaH0OGUfyp6a04wn6iy9TlAP136NO6bWqk8f1qtzOh9i3jyWz3QgzwtrfsYVwYrTw6djBpez71UrJVh3HKEOi+IYJOHCCKXTkwtiEmal8RI2S5ql/tW3eJ+RK/VhPhej2yDN6iEXSa+FYr1szw99tQ8H5ZOX4TpVZkbTww6/o/na+QXMu/Au4kh6921ZwscyMVjzCz97GwtPCqDd5fOIsfuPclBedDsHAO9AzUwqWXT70fySmaecaB8K0zRGCaAe2P3slfWQ8dg0IRWtoTeBSsRCug+azq65RMkEbeg1xBr5TX6h9Q389wOP4yV5Dp0EDte87bWXi6QKm9oAbnFCWJ7mGaxaJ1cJbpzbjMkiyQEODd6tF/dyUFTTUFzvBgeArLctf0NDmd4+Jb5tKRVPMl8wbCS850nOpIZYZg+E3jDxVWstlWAF4nnwfTk0i7f+XB5YVKjB5MkRSuA==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 01:02:18.0197
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c672446f-1f50-49f2-6e39-08def99faffa
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000205.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR16MB6259
X-Authority-Analysis: v=2.4 cv=HopG3UTS c=1 sm=1 tr=0 ts=6a7e691d cx=c_pps
 a=iil3+hz40n0Eqb4YezF7BQ==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=dw5MciS7gY-znkhJuOLE:22 a=cbNQJ9GKAAAA:8
 a=wqtWwZHT87S4RQOpVD4A:9 a=P0bj-C3X3jJDpopQwM1U:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDAwNiBTYWx0ZWRfX54G2pQwF+qiO
 Yu+L/wgu1C2/HBrliNw3i8aNbGGWweh5e+xw8h/kp9PRb+WSSdaac3tkrZxJ0MaBotQmEvXu7LP
 PKV8RgCRPsxOgOOAy+fbTKpdkWWwmIjqk0KKa8RSqvcdSx7374ra
X-Proofpoint-GUID: m_ci5wSKQBnGTiV65zdYnhuVYHPkI7BA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDAwNiBTYWx0ZWRfX2j2y1TNkApn7
 P9LkchB6BKK4hJ8E+2ZZY8SbLtIyoiIRqmYIUGFtfIDGoeYo6Mubjmy7lqxxSXRp15GNRHBDmU0
 OZeuzOv7wGT/PIoJ5XiBH8nxP353QmnJuGSr/qQIDQLGg7ketxfKc2TYqKSiUDwapb5tpT0H2mW
 KMWOWTapQCfrSWwPEzI8eAR1qN5eCKvie4tSeGV+FH/GS3H3vYDASy72pPQQoaSOXyrxdYbiVfe
 x7kOtp3DU2dcwsYQSaDLemhXKCLFnn8yG0ovsIh8dSkxQzCx82MIaXSTI9cviYJfLYe5vaIXhqv
 RzpkFNAR0LI8gCTP5DsPFaFPuTa/YnS27+iddDcCCt3ursZhsw0Wbdu1NE5hmIuKNY1/D5WLP7s
 +SRQZQEphlUrNlYuFmJDjMtuCH0C2ggQ/g5AFwJH1YQEGgLIQtGzOASHozjX481dIvogp6MXswW
 Eiww1EQlTXq/zVNO11A==
X-Proofpoint-ORIG-GUID: m_ci5wSKQBnGTiV65zdYnhuVYHPkI7BA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140006
X-purgate-ID: tlsNG-16d1c6/1786669343-1FCCD77B-EFFE146C/0/0
X-purgate-type: clean
X-purgate-size: 1009

From: Denis Mukhin <dmukhin@ford.com> 

Move Xen version printout from 'h' keyhandler to the new dedicated
handler '?'.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v5:
- new patch
---
 xen/common/keyhandler.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
index 92b0573d8b3a..03ecc4d5187a 100644
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -131,8 +131,6 @@ static void cf_check show_handlers(unsigned char key)
 
     printk("'%c' pressed -> showing installed handlers\n", key);
 
-    print_version();
-
     for ( i = 0; i < ARRAY_SIZE(key_table); i++ )
         if ( key_table[i].fn )
             printk(" key '%c' (ascii '%02x') => %s\n",
@@ -143,6 +141,8 @@ static void cf_check show_system_info(unsigned char key)
 {
     printk("'%c' pressed -> showing system information\n", key);
 
+    print_version();
+
     print_cmdline();
 }
 
-- 
2.54.0


