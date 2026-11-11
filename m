Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1096F606A324
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 19:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=h3P9qb4K;
	dkim=pass (1024-bit key) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=K6xEyY4O;
	dkim=pass (2048-bit key) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=NObmDA9Z;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=TII4uIhG
Received: from list by lists.xenproject.org with outflank-mailman.1484779.1688154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREJe-0003Hl-6j; Wed, 11 Nov 2026 19:49:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484779.1688154; Wed, 11 Nov 2026 19:49:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREJe-0003HF-1O; Wed, 11 Nov 2026 19:49:06 +0000
Received: by outflank-mailman (input) for mailman id 1484779;
 Wed, 11 Nov 2026 19:49:04 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xREJb-0002sm-Uj
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 19:49:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xREJb-004SYx-BN
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 20:49:03 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c68e-bab6-0a2a0a5309dd-0a2a450bc3be-46
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:49:03 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c6ad-b7e8-0a2a450b0019-94a39217b8be-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:49:03 +0100
Received: from pps.filterd (m0367124.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIYT4Q2829190
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:49:01 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11010027.outbound.protection.outlook.com
 [40.93.198.27])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4hvuxm9py7-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:49:00 +0000 (GMT)
Received: from PH3PEPF000040A4.namprd05.prod.outlook.com (2603:10b6:518:1::53)
 by PH7PR16MB4726.namprd16.prod.outlook.com (2603:10b6:510:137::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 11 Nov
 2026 19:48:49 +0000
Received: from PH3PEPF0005961D.namprd05.prod.outlook.com
 (2a01:111:f403:c95d::1) by PH3PEPF000040A4.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 19:48:46 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 PH3PEPF0005961D.mail.protection.outlook.com (10.167.243.27) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 19:48:45 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIXgYw1790914
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:45 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4htkgbn3sv-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:44 -0500 (EST)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id REJGxf2QrQVyyREJGxG1YH; Wed, 11 Nov 2026 19:48:44 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=IuY
	trBG0TgdjodeSGWL8GatbuyHctAwD1pKZ3hfg90A=; b=h3P9qb4KNZwU6SV6Xp3
	Bi/a1T8qYq0qEzTLAUvkifVKiR/5xBGUmjSzs/Qr4bFC8yQCYuUE8nJ2MZXD3JdR
	VcbHDsNbvPUZIVSqeVk1l93+5BDI7+nMS9d2233WxaGwTNggTo3uqHuCMP0NHOR2
	ZyYYtPIBEb1rSbRIuCb4MZpRLHlEXHqPsMmhGKzzojcd4b2eq5UOyYNm30pj1yzM
	aspJPGeeLhmj986PmRHjr4+DjhD2hCnXxj7PSPVwOZi28lRYlmydVE4KEonPWh7D
	GajO4FiXGxER7hUVmXhI11ZJgn5hV8XRaLNmjF1lKnzIKIf1BVfpX7K2C5zO0OUP
	Vww==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yp+dbLeB/w/IquWXj9j37Fa3d8abbfQVB0ywxeTGprhK1rJICEzu/rq8RxjUKQQWMPvznxGnuh7kPEkElJzuVWi/mqsXhMz3Mx8rdYyVZWhYEvyZXXryg62p2OwUNMRLlRy4OVjVRqAFWEUB+ibxNYR49/TP8OC4lEve2iycGmSCJ4gXNYbAtdU9CJ+6+tS31zYI50mqgSw6DbolKgiafhOTOE+0pNi2eLCrhbl7GnHpmtK7SDWabmnaVjtx6bZtgn2TpmOA4z1xXLQ0W0gdsavMKcHFSe0giD5odTG9OpRGcxb9uU/h9DIHI3j33i2+r9oBWnPDpyQPAx5s5ETmTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IuYtrBG0TgdjodeSGWL8GatbuyHctAwD1pKZ3hfg90A=;
 b=negsPSK30J+k2uln1NJFIyqo5n6k3E1/c3LQwLduDFy0Ex9+m31yxu64+mmPPjQGV4Jq1nqo3gMQ+HEHI5AYImJzAi8nr1lVchL6fFdubN7ojckH5yFoIE5s59NVKWZLXTMbmCqxOdJIdpU/EPuq1qMWuKFIu8kGjJeS9giAJhxQeQztFxn7xNOAB1lhjh80cKQUt6qUQTFC57Bh2cXKUZX+EJbYBBurIrIhFtk5r7JMElMgA3lN8Oz5LRl5sE/a5dTs+GJExMZH+xEH8YYecl10tin9HRVGjCyfTVh+736nSjkmo9i5mVuIpPOFLe14CB2SaXzYbuUexgwRDsLgww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IuYtrBG0TgdjodeSGWL8GatbuyHctAwD1pKZ3hfg90A=;
 b=K6xEyY4OhM+VxD9i3IPGxeAv3GAuXvFLdx+7Zr65g4CbiOsSUY+2AHxM2D20vPXQjlDZdQ45/PMwqt0awsFKCbF005V6vtHL4qOBEJUy4mHVdWuWP8QM/7mV+X1gCOV6xxwd0kgiURgmYNd3ntU0hvgFA243oByheJqiJKMk0V4=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 148.163.138.245) smtp.mailfrom=ford.com; dkim=pass (signature was
 verified) header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	ppserprodsaar; bh=IuYtrBG0TgdjodeSGWL8GatbuyHctAwD1pKZ3hfg90A=; b=
	NObmDA9ZH44XH5uOKuBOdPvIHP6kuUKzg4cnmAJuqkxRT+iSVJUHD+DIxI1y1GVx
	Z9rFeTXITOmAjEvX7rRsZbVy+IfTCUrjfESlZ80eF+++zQ2FvaBtQShMyAREX1YZ
	0H+7ejJK7v367fvoGPspofwHyOvdCZ5XZwxVeOEZ26zQpD8x6U/e9SIwb5UCuS02
	QSPclb+mwqqXgOOK+oXMzpXMu22RvEMP/yV944jr1zXvCV03YPSElfCpGGRlFh5i
	OA09Hq7L9mgjqaga+3jGs/SG/TX7fzE+jVdTE0kOFznT8i8hk/NXDIvTIGCvEZ5B
	BbWd7gxd1FmdvaDkDixgNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=IuYtrBG
	0TgdjodeSGWL8GatbuyHctAwD1pKZ3hfg90A=; b=TII4uIhGkbTZ6NqL+lK1tUZ
	6RYfcVDWQh5RZQqwFUxontjLfDnhrDespSZX+M6+qEjczKj8vQSm5LuH2F2d2+L8
	ScQnbBXNWT0oIXAo5YMIUEKE1VbGAZgoeOjf+9VoANqR9XLH2HRgbH0HzqcCIqzY
	NbvCSbYWYQvOFxgtOC1F6xmfdzbGD8xKefzNLJxBykDAA1FuhkSZPe/ZO15oHzlm
	ZPPCMJWvXZ0arl7q4Vt3IrH2nGKN+MzAqsjIpW8c3PBbnsr2eRdaJ3Lsw0qPlUBh
	VMaakPI6qAhIoDueTpiDcSoDNmehAtaZeTcB7NvAdxkmujcf4UvXcQ6WXQsaRIQ=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: REJGxf2QrQVyyREJGxG1YH
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v8 13/26] emul/ns16550: implement dump_state() hook
Date: Wed, 11 Nov 2026 11:47:47 -0800
Message-ID: <20261111194800.1070016-14-dmukhin@ford.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110078
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PEPF0005961D:EE_|PH7PR16MB4726:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d9c56e74-773b-4abf-7533-08df402ccc4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|6133799003|22082099003|18002099003|56012099006|261026140227099003|261028144727099003|261026121527099003|261021123027099003|261022075727099003|261022105027099003|261009223027099003|261021121427099003|11063799006|10067099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	N51dnDJO+CHOZW8eOZ1yDPVC8mNJF5tR40hzEh9NU8Cy7ZxlqCR1WQVP38wdIxqeD+qwnnlfmd55huMlwcQoP3th/CAi8cNKDTdROeE8Ut21KSjRavIKaPl7r/chhAi+PTgQB5X2x/y9DYulo3OZdNDznq0cxEDmaCMJu1ccPyj6wwCQJDf8BNL+il/CpVmUuCUlL+EEJgqhkPytvjMmb7wsDpxzSi41Y8gQTE1BhcJKvcYkrr4L6MGgUtsWU8H3Q2iyPDeOgXOxMbRbzcu5O0YKX4Hv6BwCJlEbPu6GawmFwiFVogtCgzmAhs5pyhYW6Esmmp6/0hRn9xQ0fy164kvbdXl4/oGH8qgKTQHDnpaXAEHvN+Yh2tHn3OKY0NFxvEUJTtX3P0FoRrtIBiQt8rWUHxFheZIQ7gMRhsuCMkDkaFPJ3Mr0L0J5Lbtqq/832R+DsV4zYtGGMDJ3PpFmL71BLO7jAvYY7mZkFgTSdJj6RmcLXbstKSz4lCIhVk4s+YKrBGQZ+QCqt2JVXUHGbz4ua9PGy4UGkc+iBdteS/nRRrB9LEUssx3KUM8CzxKdN7Q3Gh7aHY0DByLVXfmhF57HtGkdSjK8KKXhrF10wHjx+VxT/1FUF0S0aGfgFW0GLSvmXmJxS3QKp+oZiUDwrzua0FRY+qCDbnaxVBA7t1L909xqdlfPHpcj32SaLEaMqD+g6/muUDM3XtfUsiMIRg==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(6133799003)(22082099003)(18002099003)(56012099006)(261026140227099003)(261028144727099003)(261026121527099003)(261021123027099003)(261022075727099003)(261022105027099003)(261009223027099003)(261021121427099003)(11063799006)(10067099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QwMs6j1hMZgeXlfCD0dwhrMEBzE66UJl+JSGIh9s6pxf1Q8HuOQ011AzqlLQM8yR89FgR4pfGAflu6Mrv0kJAACZtDFROVFdHP/Hd3NwhNvKHoz8Ji7b+v9QJdVMu9cHA+dJJPtziZQLmFuCoLr/cgyOMBpZ4V0J/Z5dur8WFHqDSsZFKAlyhrrHDmeiCWSanWVVv0xkayxJTQAIxA1+AhtjogCTOdWecKyp9skNzWsfP3MKslu8ahL7UxNZ46gGn4LDFPHHTaYq0rxIHULZqLv0KYBGtEjwbIAgs+X0HdM+63W69ZFVRsNI50pSbS1O4KODX/X1TT+81s/RAlluTTCekKCa4JBeFARn14cZy92U/HLHmmwtxnT6M/GoQSo4JqdiC5hO8xIpkNia7hYIJ7U+QKE4FL6wvLxtxQZe+s9vTyKpoMEVvFsuy00DeJ9s
X-Exchange-RoutingPolicyChecked:
	3Yhnbn6xyMN+iDwUrPRe9OlVm2+CSwu2/77XtXitl1ledl3nrLjSMcT+trB2uGQPuQTA2g5AFxRtYP+lKC290OeJedqpyIMbLSLlVBMr4XbprLIafB1YfiCHuphMZGNyeQmk8nZ3zt6czqYi/ZvAfHFpVMpS0ykzVbFGQ3nAAWXqjjo/OGGu2W+SRD0J0dBGl19FPdH6j9Pb3QxXjMWkR5I9TVGyYZuhm7tZP6AJsu96SKid7X+ThKph/idQti1qeoVOx/wg2faZy2WFnLM5JCL5I8adG+HELQgroUNSZEVG2NtlnLMpv92AfSr28saIy65S75kYJqZzpvCis7KQcg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jqGXDl/kvKNS0SPQsH6MNzZiUV8VyXIzbvCceYS6kHWyrlIUzYDZQGK5DYF8kmYnilH+blGXtsJMkBdhxUQfkLCmqGaoGdBDCt3Ryk/opPnGm7W2UTw8YsSrh1v+uTxgThb+06Ww52vdQpXifY8cGBJxOEB/axwgloUJUPhzCe8lomUW3QW7AAhSNZqbSxI9cY7QqjfSMaQUW9STEUJyKb2UF1efkZaXUEF5JNkMOj82D9hDgutQ2T5B1E7JOuSK0A8QgN1Hdum5D4fQZb1/OfxrJ9RMzA5OpFlhGEbbJdrXfgEzfUFKHg+p2G3wg2wgS4emk/hIF37/sYzOgYIxnTZTfYly6CwVuhb+q/ouHKjeqM7JnG3cmXxs9qjYznRtCD0bYtNvxwKspCmhp1NcB2EcDiQ7B9/gAtSvtYm2STw2WGlfKrQkiD5Cyv9ebpYNbBedING+kVMXniMuwDOMEXNVD83ShuTjy4AZN1Mwr5OEnR6te9WjABEVuwuCk9KCUzRuZan+x+kzwMwCvVm4Ds5VtHKVpi9WT0z992SKChyMZVwkViPQ+86qVx5vhtkaiabwOMDdEQeG4fyl4BS+HtMmFuRhOiftMXuoNlQxHIHrFTc8I1PR2dN9Zip6tmNeK2EjFWjNDRUvHbZbfsBBzA==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:48:45.8133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9c56e74-773b-4abf-7533-08df402ccc4c
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH3PEPF0005961D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR16MB4726
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX5Cv0Ce3jaABt
 bt2wh7YuDeuZAsJjlpmHAruLxq6ex/6f1VhH0/AhigHFQ+pFtIHwtlSqhgjc03GObc+PIdvcA1b
 koNZ5jyB25ryQ6Ruj9kFH0caWJeacNZkeqyySN2ZNS4U9uHVwvCH
X-Proofpoint-GUID: yBTFD-I4MjbDNNAQVtvVCGu5UbZN0U0i
X-Authority-Analysis: v=2.4 cv=ZKBCCn7b c=1 sm=1 tr=0 ts=6af4c6ac cx=c_pps
 a=oTJwsqqp05Np5voO4IKyrw==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=YJXg7OVxOWrJwj3yZo-i:22 a=cbNQJ9GKAAAA:8
 a=zmAIzDBXz7HVyQf3mo0A:9 a=DqJYxgmhk6moR-_7_KoZ:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX3hU7YNanybi4
 IKx4U7QAUGvQt/QQovcCeqL/Mkd6AU619HYDderX7fI29rUuOmLxhUTxXShhRUI5FtN3/2ePD6g
 P8pM2wHKeDBcttPJjcQiBIa/P1vurNuLpv0QL+0LgxjRl/4HTz2flt7QtkWwCkRgMKX8iEwqVCG
 8fEzoUgtojQNW+wmRuFs6ujiqeaAsqiRiyDCiaEx8eTHPy2Nv/h27jPihsKXxsU3WYDSmNqz7ae
 tl0bY21go1W8B5jkm3pE+Htt4Lkrl8Ni7CPdFfjVae+6Ur58dGYdQ7XNRgmrnCwE61fvkNLUa6q
 4ptwBnG2yKX7uI8ydtFRDAWPdNlat5MtHJhrAyS7f6Ue+HoKIdojIFy394znw7uBaTbrPj8CLT5
 OOuEmlnaSBo5iffocciQIuKdtBnyGc6918pOj+NpNiB/REonXGnePmc2iyafwjUqfFnuIocibv9
 DsB924bfPmX/bqNbptQ==
X-Proofpoint-ORIG-GUID: yBTFD-I4MjbDNNAQVtvVCGu5UbZN0U0i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110078
X-purgate-ID: tlsNG-42698a/1794426543-ABAD09EA-FD522F2E/0/0
X-purgate-type: clean
X-purgate-size: 4039
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Implement dump_state() vUART hook for debugging UART state machine over
Xen console. dump_state() prints state of all emulated registers
(including state-less IIR) and state of RX/TX FIFOs.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/common/emul/vuart/ns16x50.c | 64 ++++++++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
index 404e12311090..cda21c15cf78 100644
--- a/xen/common/emul/vuart/ns16x50.c
+++ b/xen/common/emul/vuart/ns16x50.c
@@ -728,6 +728,62 @@ static int ns16x50_io_read(
     return rc;
 }
 
+static void cf_check ns16x50_dump_state(void *arg)
+{
+#ifdef CONFIG_VUART_NS16X50_DEBUG
+    struct vuart_ns16x50 *vdev = arg;
+    const struct domain *d;
+    const struct vuart_info *info;
+    const struct xencons_interface *cons;
+    const uint8_t *regs;
+    const char *as = (info->base_type & IORESOURCE_IO) ? "ioport":
+                                                         "iomem";
+    unsigned long flags;
+
+    ASSERT(vdev);
+
+    /* Allow printing state in case of a deadlock. */
+    if ( !ns16x50_trylock(vdev, &flags) )
+        return;
+
+    d = vdev->owner;
+    info = vdev->info;
+    cons = &vdev->cons;
+    regs = &vdev->regs[0];
+
+    printk("Virtual " pr_prefix " (%s) %s %#"PRIx64" IRQ#%d owner %pd\n",
+            vdev->name, as, info->base_addr, info->irq, d);
+
+    printk("  RX FIFO size %ld in_prod %d in_cons %d used %d\n",
+            ARRAY_SIZE(cons->in), cons->in_prod, cons->in_cons,
+            cons->in_prod - cons->in_cons);
+
+    printk("  TX FIFO size %ld out_prod %d out_cons %d used %d\n",
+            ARRAY_SIZE(cons->out), cons->out_prod, cons->out_cons,
+            cons->out_prod - cons->out_cons);
+
+    printk("  %02"PRIx8" RBR %02"PRIx8" THR %02"PRIx8" DLL %02"PRIx8" DLM %02"PRIx8"\n",
+            UART_RBR,
+            cons->in[MASK_XENCONS_IDX(cons->in_prod, cons->in)],
+            cons->out[MASK_XENCONS_IDX(cons->out_prod, cons->out)],
+            regs[NS16X50_REGS_NUM + UART_DLL],
+            regs[NS16X50_REGS_NUM + UART_DLM]);
+
+    printk("  %02"PRIx8" IER %02"PRIx8"\n", UART_IER, regs[UART_IER]);
+
+    printk("  %02"PRIx8" FCR %02"PRIx8" IIR %02"PRIx8"\n",
+            UART_FCR, regs[UART_FCR], ns16x50_iir_get(vdev));
+
+    printk("  %02"PRIx8" LCR %02"PRIx8"\n", UART_LCR, regs[UART_LCR]);
+    printk("  %02"PRIx8" MCR %02"PRIx8"\n", UART_MCR, regs[UART_MCR]);
+    printk("  %02"PRIx8" LSR %02"PRIx8"\n", UART_LSR, regs[UART_LSR]);
+    printk("  %02"PRIx8" MSR %02"PRIx8"\n", UART_MSR, regs[UART_MSR]);
+    printk("  %02"PRIx8" SCR %02"PRIx8"\n", UART_SCR, regs[UART_SCR]);
+
+    ns16x50_unlock(vdev, &flags);
+#endif /* CONFIG_VUART_NS16X50_DEBUG */
+}
+
 static void ns16x50_access(int dir, unsigned int type,
                            unsigned long addr, unsigned int size,
                            uint32_t *data)
@@ -794,6 +850,9 @@ static void ns16x50_access(int dir, unsigned int type,
         rc = ns16x50_io_read(vdev, reg, size, data);
 
 
+    if ( ns16x50_log_level >= 3 )
+        ns16x50_dump_state(vdev);
+
     if ( rc == 0 )
         ns16x50_debug(vdev, "%c %s %#"PRIx64" %d: LCR=%#02x %#02x %#08x\n",
                       op, as, addr, size, vdev->regs[UART_LCR], reg, *data);
@@ -971,6 +1030,9 @@ static int cf_check ns16x50_put_rx(void *arg, char ch)
 
     ns16x50_unlock(vdev, &flags);
 
+    if ( ns16x50_log_level >= 3 )
+        ns16x50_dump_state(vdev);
+
     return rc;
 }
 
@@ -979,7 +1041,7 @@ static int cf_check ns16x50_put_rx(void *arg, char ch)
     .compatible = "ns16550",            \
     .alloc      = ns16x50_alloc,        \
     .free       = ns16x50_free,         \
-    .dump_state = NULL,                 \
+    .dump_state = ns16x50_dump_state,   \
     .put_rx     = ns16x50_put_rx,       \
 }
 
-- 
2.56.0


