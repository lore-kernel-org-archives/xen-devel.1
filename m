Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D27C531FA
	for <xen-devel@archiver.kernel.org>; Fri, 24 Jul 2026 09:27:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1369916.1618381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnCB6-0008Jt-VC; Fri, 24 Jul 2026 09:26:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1369916.1618381; Fri, 24 Jul 2026 09:26:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnCB6-0008Jm-S9; Fri, 24 Jul 2026 09:26:48 +0000
Received: by outflank-mailman (input) for mailman id 1369916;
 Fri, 24 Jul 2026 09:26:47 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <b-padhi@ti.com>) id 1wnCB5-0008Je-CU
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 09:26:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wnCB4-004M4O-01
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 11:26:46 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <b-padhi@ti.com>)
 id 6a632fd1-e002-0a2a0a5209dd-0a2a4505a05e-12
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 11:26:45 +0200
Received: from [148.163.154.28] (helo=mx0b-0002e601.pphosted.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <b-padhi@ti.com>)
 id 6a632fd3-4cb1-0a2a45050019-94a39a1c738c-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 11:26:44 +0200
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
 by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66O4l1TL407665; Fri, 24 Jul 2026 04:26:42 -0500
Received: from sn4pr0501cu005.outbound.protection.outlook.com
 (mail-southcentralusazon11011033.outbound.protection.outlook.com
 [40.93.194.33])
 by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fkyp7hvwt-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2026 04:26:41 -0500 (CDT)
Received: from MN0PR03CA0005.namprd03.prod.outlook.com (2603:10b6:208:52f::12)
 by DS0PR10MB7512.namprd10.prod.outlook.com (2603:10b6:8:165::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 09:26:38 +0000
Received: from BL6PEPF00020E62.namprd04.prod.outlook.com
 (2603:10b6:208:52f:cafe::8) by MN0PR03CA0005.outlook.office365.com
 (2603:10b6:208:52f::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Fri,
 24 Jul 2026 09:26:38 +0000
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF00020E62.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 09:26:36 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 04:26:33 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 04:26:33 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 24 Jul 2026 04:26:33 -0500
Received: from [10.24.50.162] (uda0510294.dhcp.ti.com [10.24.50.162])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66O9QVKa2937557;
 Fri, 24 Jul 2026 04:26:32 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=proofpoint-05-2026 header.d=ti.com header.i="@ti.com" header.h="Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector1 header.d=ti.com header.i="@ti.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ZHbxgTIavjyPTqu8VUIzrhRej/DC/CmLt3eZA4hJ1
	LI=; b=F77ynN/tgWzD9BIIael4O06iJOc3J8wSDPfMr1E7k7ZjCOcJTz7j89A9v
	9izWBOK3OQ4QR8cvFjRk0LQcysOyCq+lbrVXiF4HXIvnLpm+6asSFRQFovZ61y+a
	sflkgABfSdz8HQJyvWDHjksXlyzH7LCE9tvGxvjgDao1bLBbCDyNZD1HL4KbW5wK
	eFpnhYYdcskS8syD4QAoT5/grwbx9ODVDLGvE/M1osGGcMXR7jRvVOcT+wGcnm4A
	Amtl75PoK15JLHEM88QGw2cyJo954fB0R+6RzS/8yNMWgvpMKhlCe3eCe2sh4Yv6
	8vgPggcl6Wus2z2BdGQHbgWl4U7WQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T17I6xyDzW+hyFThzXyUEGiy7pmVxmcrV2THUT/4pB2eLEI8ntdWmetAhc0Ximc3P2qfSzc1GnDNej9SExsIHj/AgphAglKr4+gUuLevt44NWnY3vXF4P4aJlrqhOyh7o1UYsIi+ppZUB+T+FDEP5Z6v5x895SodkxQm7NNRdVxqD1XuKHQdRnjT8kVGygE6M7QhQwKpMjR1O350GFUxcBOBqcDHMzyVPsm5sGN3ZyHrSTe1Jj4Y3fVGHYzRt5l28P16RE84xxkZIq5aoi2obIFrPWH3uXQvZIp7S7HJeqLMmRoQ0O0QS00FdLAjF7EMUAJyIHCZNdyPuuBkx2imcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHbxgTIavjyPTqu8VUIzrhRej/DC/CmLt3eZA4hJ1LI=;
 b=Gtr1iN1PvIYdAUiHZEzwTI73rPlEakzzH/Ua3P9NX6bsYA/OyNm1ndgcDeWw0oS1rLXFA6MMajKzEKp02Wi7SaHUPhtCXd3AqruqQkV5QnffUxJX8qHr5STqK/nzPoy3Ytdw7p0LtUIhs015TkDkMN8KeMzpdnKl+hDNB1uWKJaZdJ9HaKNYUjhXylrBDCh5Acbj3FnZT/NAoorvtmDEEdcP2Bn81vpZuXryPo360UVM7RxyZC5usIV9+TbvAIn6Grlfgw25DRekt9SgP40ce6nXCqZ3I0QGjEC5ICwBTegps9zITR2SJzTrelOM9P4Nv3fV4E0kFaYhkP/uRXKyoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHbxgTIavjyPTqu8VUIzrhRej/DC/CmLt3eZA4hJ1LI=;
 b=NozmJSm23n9qTYfRuxtoDGyzEv9dGYTO/AaVV9Md8BRLyVEr4eg9gadTyRqxrH6jD3Bvcm9s4HaTNGtFkmsbdhplT8TrFQzpzIb0yFxhxSFxuE/lV5LzwaHPPLFmAoUfLIk1tRwGNbCexyx3/DYwx+Ab0EkDBkgDGSqrKOYSioE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Message-ID: <0e556bb5-269d-47d7-9ae8-68f06eee9fc0@ti.com>
Date: Fri, 24 Jul 2026 14:56:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Query] Unable to probe reserved-memory carveouts in DomU with
 Xen
To: "Orzel, Michal" <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
References: <ba100bd7-5cc0-4f87-af3c-dca887963d44@ti.com>
 <c042c42e-89a6-4d9e-8b9e-3f6ceb259467@amd.com>
 <92ad79d5-ad28-4b17-ae13-174135d565fe@ti.com>
 <a28c9391-ab8a-4998-b35f-9ef4b539220c@amd.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <a28c9391-ab8a-4998-b35f-9ef4b539220c@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E62:EE_|DS0PR10MB7512:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f454793-b1b2-4b95-6da4-08dee965a908
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|56012099006|4143699003|10067099003|6133799003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	nUj9IVLfsGFMP9FYY4YrGm3PtYEcW7Yi1BISJkES6a5zQ/FlkWdfEr5CnFe7buoFJp2cNUqwmLVHYlkfapKTSSq/Povi/FMizRt3pnAm+xV4fiQeqrOrHXwgUO9sjjA7UXqi8V/rT7r6HqBW3970kY+RSGZmIibD15fYS6H3AVyHT2ZvYQ2b8PlU+E3FEG3Yc5BR8lwXouaPTXQADTQwEqsxZogayC+JJ8O+iy5j9ps3aViUrUAz5SQJZr7b3Hbf3rYHUYPYMhVnGkqOmA3FWj02kV9b3PBv4hqdcxlsCV4x3UICZQ4bcGDNO3FvPJfFQVY7P8UxKunJr4StXiRzOQ189/nR4c4CcCKD+JTP1QeUArWw5kIltG9Wt9MuX94X2uw4j0uaT63Gi9efFL6zgv+8h/HCC5PmU3ocb8zZcvuoQDvahqTzB1OTUqlW4F3isG93vIZ9iBjcF4hvz3OPt7T5Utg4w12D0kDqfEwWvXknKiOgdIrW0GmnbFZvXP13ArB63g6Rm1397OxH79sKF1T8TOF2zgOclQQ0XnRGqmxLxHMQP+qWdX1GY5Z+uUF7hd2FnYiBuOVLe6xVNlmXJ7NOI5i9i4Ar1kE/kVE5iOm+zMIlStXmRo/whkWsiYxyXoxYlMV5pXQx/+f+AX//bg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(56012099006)(4143699003)(10067099003)(6133799003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6yokOJe1NF0PFXgkklAZBk8vWQG13hwmzpkLiqXLeq4/RvuBu0oFEJhAQ++RKyP+9dLwAI4zCzq9FRJR05mcA4D6LA62JHZhmc1X3CRvwVl9bQUVfEXISW3rAnVPKQJqPTJk3yAl2+xQGeOqcWq6ZRzZQBDXugLBZZLUQ80UOmBFMZUuU4uJTq1nHSWMccH3rwXdtt4maNXCboR3aG9lSqZ8MO4x9A2o9mc8qzEgpz0+hb4lAWVw24PcYOwlB3VEKXohPQ/zmnQ5fXGrD7zIv8u79BmvRVrK+VWy/2iN4fTbAmmMOETGUf35ybbhmzwMKJODDUFo+IksscCBd+tFc86cyN5nzH5znWWESNGQRZMFuO2tYpcohMT9mQ4ymsxoMrJ/yg48px0cypG/iw7yWkXElFyC4EZUCVXEyx3wZI5EbCC/eeNVqFMf6WRvMNXh
X-Exchange-RoutingPolicyChecked:
	KQxzRqygq7DptarupEk+9NtsS6Y9rHbONT9nXpxrH/NhGTRDK+LJSRGaQl/K/1wAAnKO3dM+HN4B7oCoHQwdNOY+J5RISTK5JWO83d5kuIVcg3bWk/kSykFgaxeHVLfr50JG1BNnSSTAZvSt/Z66PuRSSGg7HPygpnx7GBpGgt5uSB8tDzYDdZD1EiAquFiWljfG+Rox4RCDUP/3VKz6rqBmae5lOJtJR9VkrthxCFPB3RcnQ/KP3JS9EwxXE/yZe4jlxxCnIW9SVHPIIvkpbq/DnkgQdFZgaEfI+oOkNYfb1Ha0NJyA3fEZ1LU2IzQzJpJn2SlJks/jmBx0NtONwg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 09:26:36.8921
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f454793-b1b2-4b95-6da4-08dee965a908
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7512
X-Authority-Analysis: v=2.4 cv=M4p97Sws c=1 sm=1 tr=0 ts=6a632fd1 cx=c_pps
 a=Ik8WVU4vKgjy7N2tmpohTQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8 a=ogjyi8eG2KlWUyNr29sA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA4NSBTYWx0ZWRfX1uKERVZm0uw0
 7mKZ7+lJn5Om6Y895Sedr7YzAUD/MVeG6yD5GoeZtGwmH57ADGwn7SEG119vKv7pG34LM9yGwzf
 Q7gzYEfO+Q+0Br5pVeGn0oiC1RjrOak=
X-Proofpoint-ORIG-GUID: dIp-A8q-ajyTkm_zLgKgSolG_GpnK3Tp
X-Proofpoint-GUID: dIp-A8q-ajyTkm_zLgKgSolG_GpnK3Tp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA4NSBTYWx0ZWRfX/3VNU5kaOEic
 2V4QmSigA1RMoc3eQmwxuuhQB7g0bLcRR8EP+S+Ub3SbdRCj8DUIM9gP6pht/bFivqwpPJX/9xw
 /V1IjirmrZaU87XJEom0sexXmPAHCAYUUDN/N5J91npvuVhInLiUeDevvtyuYPPXw/EWlSEFLii
 qs3uJZGCUyZthJrrt+Tiy0iY4bNf8CWdSA2DS3ZNYbL10Go5e04ufE7ESioTpf6yN7mT8MT3RNl
 qKmy70vq8TGK0mhtt70Ez3bNtUVq16jU3huZTXJ1Fv7CCnLy9vXCIIrnyV1LJDf0dwPyquq7qAB
 /u03sAvvTEVoAHVDJxcd8wo2Y/p/l4z8mOO9DY2ghdhB/GNjs7XOmMMhS0qXQc4//xgVDOcQl1G
 Q8R2TquflxM92m+4K6u7itmax6vJm3lnGNnbzX4PLpfvMXTLA+62wv9rtTDjTDl3DUvuHCv8lZo
 hYlgpkPu4GDvOId6ccg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240085
X-purgate-ID: tlsNG-c201ff/1784885205-F70B22A1-1FD01A08/0/0
X-purgate-type: clean
X-purgate-size: 7049


On 24/07/26 14:28, Orzel, Michal wrote:
>
> On 24-Jul-26 10:32, Padhi, Beleswar wrote:
>> Hello,
>>
>> Thanks for the response! I see, this would solve the cma problem. But 
>> there are usecases
>> when we want to use the reserved-memory node; one example is the 
>> firmware for
>> remote processors. In that case, how do we passthrough reserved-memory 
>> nodes to
>> DomUs?
> I'm afraid we don't have a solution for that at the moment but this is a
> limitation we are aware of.


No problem, I can look into implementing it. Thanks for the
heads up!

>  So far, when it comes to /reserved-memory we only
> have a static shared memory feature allowing to set up a shmem communication
> region between domUs, where the range is exposed to domains in DT following this
> spec:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/reserved-memory/xen,shared-memory.txt


I see, is there any working example or documentation on
how to use these regions? DT/dom1.cfg configuration?

Thanks a lot,
Beleswar

>
> Cheers,
> Michal
>
>> Example:
>>   60
>>   61                 mcu_r52_0_fw_memory_region: memory@a1000000 {
>>   62                         compatible = "shared-dma-pool";
>>   63                         reg = <0x00 0xa1000000 0x00 0x100000>;
>>   64                         no-map;
>>   65                 };
>>
>> Thanks,
>> Beleswar
>>
>> On 7/24/2026 1:52 PM, Orzel, Michal wrote:
>>> Hi,
>>>
>>> I'm afraid this will not work. The reason is that Xen only copies nodes from the
>>> passthrough DTB to final DTB that are placed under `/passthrough` node and
>>> `/aliases`. /reserved-memory needs to be under root node `/`, therefore it will
>>> not be copied. However, it seems like you are not using CMA node specifying a
>>> fixed memory region (using `reg`) but size. In that case you should be able to
>>> achieve the same using `cma=128M` kernel cmdline parameter.
>>>
>>> ~Michal
>>>
>>> On 24-Jul-26 08:55, Beleswar Prasad Padhi wrote:
>>>> Hi all,
>>>>
>>>> I have been trying to use reserved-memory carveouts in DomU, but failing constantly.
>>>>
>>>> This is the log from Dom1 boot:
>>>>
>>>> [    0.000000] earlycon: uart8250 at MMIO32 0x0000000053914000 (options '115200n
>>>> 8')
>>>> [    0.000000] printk: legacy bootconsole [uart8250] enabled
>>>> [    0.000000] Xen 4.21 support found
>>>> [    0.000000] efi: UEFI not found.
>>>> *[    0.000000] OF: reserved mem: Reserved memory: No reserved-memory node in the DT*
>>>> [    0.000000] Zone ranges:
>>>> [    0.000000]   DMA      [mem 0x0000000040000000-0x0000000051ffffff]
>>>> [    0.000000]   DMA32    empty
>>>> [    0.000000]   Normal   empty
>>>> [    0.000000] Movable zone start for each node
>>>> [    0.000000] Early memory node ranges
>>>> [    0.000000]   node   0: [mem 0x0000000040000000-0x0000000051ffffff]
>>>> [    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x0000000051ffffff]
>>>> [    0.000000] On node 0, zone DMA: 24576 pages in unavailable ranges
>>>> [    0.000000] cma: Reserved 32 MiB at 0x000000004f800000
>>>>
>>>> This is my passthrough.dts:
>>>>
>>>>      1 /*
>>>>      2 * This is a partial DT for passthrough node to DomU.
>>>>      3 */
>>>>      4 #include <dt-bindings/interrupt-controller/irq.h>
>>>>      5 #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>>      6
>>>>      7 /dts-v1/;
>>>>      8
>>>>      9 / {
>>>>     10         #address-cells = <2>;
>>>>     11         #size-cells = <1>;
>>>>     12
>>>> ~  13         reserved-memory {
>>>> ~  14                 #address-cells = <2>;
>>>> ~  15                 #size-cells = <2>;
>>>> +  16                 ranges;
>>>> +  17
>>>> +  18                 /* CMA region for framebuffer allocation */
>>>> +  19                 linux,cma {
>>>> +  20                         compatible = "shared-dma-pool";
>>>> +  21                         reusable;
>>>> +  22                         size = <0x00 0x08000000>; /* 128MB CMA pool */
>>>> +  23                         linux,cma-default;
>>>> +  24                 };
>>>>     25         };
>>>>     26
>>>>     27         passthrough {
>>>>     28                 compatible = "simple-bus";
>>>>     29                 ranges;
>>>>     30                 #address-cells = <2>;
>>>>     31                 #size-cells = <1>;
>>>>     32
>>>>     33                 misc_clk: misc_clk {
>>>>     34                         #clock-cells = <0>;
>>>>     35                         clock-frequency = <100000000>;
>>>>     36                         compatible = "fixed-clock";
>>>>     37                 };
>>>>
>>>>     73                 uart@53914000 {
>>>>     74                         compatible = "ns16550a";
>>>>     75                         reg = <0x00 0x53914000 0x1000>;
>>>> ~_ 76                         interrupts = <0 302 4>;
>>>>     77                         reg-shift = <2>;
>>>>     78                         reg-io-width = <4>;
>>>>     79                         clocks = <&misc_clk>;
>>>>     80                         oversampling-rate = <16>;
>>>>     81                         programmable-char-timeout = <4>;
>>>>     82                         status = "okay";
>>>>     83                         xen,path = "/bus@100000/bus@22000000/uart@53914000";
>>>>     84                         xen,reg = <0x0 0x53914000 0x1000 0x0 0x53914000>;
>>>>     85                         xen,force-assign-without-iommu;
>>>>     86                 };
>>>>     87          };
>>>>
>>>>     88    };
>>>>
>>>>
>>>> And this is my dom1.cfg file:
>>>>
>>>>   1 name = "dom1"
>>>>   2 memory = 256
>>>>   3 vcpus = 4
>>>>   4
>>>>   5 kernel = "/boot/xen-dom1/Image"
>>>>   6 extra = "console=ttyS0,115200n8 earlycon=uart8250,mmio32,0x53914000,115200n8 loglevel=8 root=/dev/xvda rw"
>>>>   7
>>>>   8 # UART1 (0x53914000) passthrough to Dom1 console
>>>>   9 iomem = ["0x53914,1"]
>>>> 11 irqs = [ 334 ]
>>>> 12 dtdev = [ "/bus@100000/bus@22000000/uart@53914000"]
>>>> 13 vif = ["script=vif-route"]
>>>> 14 device_tree = "/boot/xen-dom1/passthrough.dtb"
>>>> 15 #
>>>> 17 disk = ["phy:/dev/vda2,xvda,rw"]
>>>>
>>>>
>>>> Am I doing something wrong? Any help or debugging leads would be really appreciated...
>>>>
>>>> Thank you,
>>>> Beleswar
>>>>
>>>>

