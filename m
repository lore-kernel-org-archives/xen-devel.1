Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF963C531F9
	for <xen-devel@archiver.kernel.org>; Fri, 24 Jul 2026 07:38:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1369836.1618344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnAU4-000074-QK; Fri, 24 Jul 2026 07:38:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1369836.1618344; Fri, 24 Jul 2026 07:38:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnAU4-00006x-NU; Fri, 24 Jul 2026 07:38:16 +0000
Received: by outflank-mailman (input) for mailman id 1369836;
 Fri, 24 Jul 2026 06:55:25 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <b-padhi@ti.com>) id 1wn9ob-0003gW-64
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 06:55:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wn9oZ-009VrO-Py
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 08:55:24 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <b-padhi@ti.com>)
 id 6a630c58-5cb7-0a2a0a5109dd-0a2a4503e2f8-8
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 08:55:22 +0200
Received: from [148.163.154.28] (helo=mx0b-0002e601.pphosted.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <b-padhi@ti.com>)
 id 6a630c58-fae8-0a2a45030019-94a39a1c4092-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 08:55:21 +0200
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
 by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66O4lI8S408453
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 01:55:20 -0500
Received: from dm1pr04cu001.outbound.protection.outlook.com
 (mail-centralusazon11010024.outbound.protection.outlook.com [52.101.61.24])
 by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fkyp7h5x0-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 01:55:20 -0500 (CDT)
Received: from SJ0PR03CA0158.namprd03.prod.outlook.com (2603:10b6:a03:338::13)
 by IA1PR10MB6268.namprd10.prod.outlook.com (2603:10b6:208:3a0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 06:55:17 +0000
Received: from SJ1PEPF00001CE6.namprd03.prod.outlook.com
 (2603:10b6:a03:338:cafe::82) by SJ0PR03CA0158.outlook.office365.com
 (2603:10b6:a03:338::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Fri,
 24 Jul 2026 06:55:16 +0000
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00001CE6.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 06:55:14 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 01:55:13 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 01:55:13 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 24 Jul 2026 01:55:13 -0500
Received: from [10.24.50.162] (uda0510294.dhcp.ti.com [10.24.50.162])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66O6tCKx3350536
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 01:55:13 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=proofpoint-05-2026 header.d=ti.com header.i="@ti.com" header.h="Content-Transfer-Encoding:Content-Type:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=selector1 header.d=ti.com header.i="@ti.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=Sb5WM7wy/Lbmm
	F+SlDIIGyJgGdYTFXCgyTfe/QLwZkw=; b=lVEnexyTu9x5Nb6rYEeVy4KGJmOJk
	gTW0/gXSNR4WN1i1zaZT+vFLSBwx9Q7nKt8CTGCw5ng6ZOqK/B1iB8FMMc+HOFG1
	ruuRSNoJgTZcGQBtnieSExejulvqeXXC/rZsFDOyEwpXux3GNZF7P7JjGh7chVGH
	g2VTFjPlfibfkQtGpLlWR+cboMCYv/wvS+r4q1bgYiLe/RMqw6s1qXgEc6NVkzEC
	XSBIgYXhujDBzEd7mx5RrO0gZ/6LKcRQaiDlSKTKpPo+pOaDuE7fyTpR1NYPYrLe
	FnGRWJuK+z+5LjvuD6ANSFrBFA3SdfuFegwz2esYa8kt813jevGDusiJg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FMd3zUcaJpcZtISt/xS+GIOzUS8/hZn6HxeZdczxYpB28jqwxvq+E0EXOqiYWOOEyAOyq/6DZy+U0lN+0xbo9LRWCeCurS24JsGghgpPV3zBE8Q1315jtBsjy/ObUpu4dto9ENA7ckuMJKJKFLyjDkawsLbZcC4zGslWS+jEv4WIVpMPvrEELPUtMMxFFXk68Tyl+zGnTvUD/Hf5Zgo6CwRlf49iH2yQN2qugWKv+3AOlDkE7yXhXymE34T6D9B0Thyd1k5jc44owGK2A3sg5hSO3oEt7HSN+QWK0LsySlqpD3sHVS1E2mGNT9h1ql8kcAykHW1/7hS9tLSx94xZPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sb5WM7wy/LbmmF+SlDIIGyJgGdYTFXCgyTfe/QLwZkw=;
 b=IPR7mBRYOQe25isjs9SVTdRhSBfMm/Ef+i8LxtNzxVBV8BozqNMZO3vEGFq4qYaSfadHR/3XOyiq6Z9I0DOY8zWXujHnaXQtZQc8+KXawI3KlZ02sN/uDIhivQJGMRpG5Frx2LWJJDy0Agw9eh7PSciKSZRdCRJARIZGR0jiA4qQLXfhUszzInDt7tn4cRCbpDPdodsFASXUBAutWoICgDPDWCgzntglO3L2svsx/JKKGsB+lTd/9WTUxzKAgIVlJ9uA5oEmEtVLNCXxJe0JN4K+MGyynvTqEvZFzOJulyzH2HG6YiLjibWhjYGh50BQNtTE/PaJcdkHfmgarL5cIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sb5WM7wy/LbmmF+SlDIIGyJgGdYTFXCgyTfe/QLwZkw=;
 b=R7AM4Q0ijX4B+rqJFK9z+bMZyk4n06eqhCSOQVez4y5Ytx/+aoRauF9QKhQDNxg+LP19zEdp+Yzg6xhKrfgEGU9EgiyXw3Toqyy4CkGmReqtBk9kL1zKSbajMWZfqHCQk04fpN1Ozb6FetVpNwesc4FFwatryDvTFTu8T/AiMCo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Message-ID: <ba100bd7-5cc0-4f87-af3c-dca887963d44@ti.com>
Date: Fri, 24 Jul 2026 12:25:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <xen-devel@lists.xenproject.org>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
Subject: [Query] Unable to probe reserved-memory carveouts in DomU with Xen
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE6:EE_|IA1PR10MB6268:EE_
X-MS-Office365-Filtering-Correlation-Id: 9da13574-7ea7-4a34-b40c-08dee950839f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|36860700016|376014|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	yy4FVBsPJWnToj7j6UBV8DxEBcrxeaFPbO/A8wJd7bvZXJq0+fKjfRAF8OzFJlnyU4fnlwwNivXP9Y2r8YOPSY4UsHNHgNhZIRbARPnyV1dnJh/8hZ4wEiIvYo9f/UweIP391p/5ZXjGNqG1ZdBSxAtE0pT42CVCbK+Lm/bIP6kdvmpBLAZ0WbhxPOBMD+g8nIYwKrNB1w8zfCc4BVWVNo89xHbJHmwvrVhRQ0GW+6Lj7fd34NELuBYrOUW8tySIVCdeTAJQw899qdNfFc70hUlP36pev1FHUcaYgQu7Sf1zirIaP3aSWeEyfAi6mLp9HXcZwOT5Co5lacqWEA4vMBj4Zhky1uyALUUj00p3MXsUtpCxEt9H5yttMKnnGWHrKB4T5BuB1sdjkHbHghc4PMuUKXNfGy4xezCFjFcP5r96WIa7gxAg5PTQrEMKe3Khn/L2SygNptMWSQ5SDYR44KSf5M2Fz5WRC7KW8u9Qm4upBdbyw/g27cCLcuJL5sl6YYGcH69Jds5SN97AcDNTQVph/Gs8YIzUe4o3PEtscTYnUZ3dwXv7ll87THRS+P7/jk0jRF3TOk7r5jZ+cWg8dmF51gdoA428FtW5cCB8GAqo0ceK0hDF2fMJnycDc5Nwg6Hl9xs2vEWg9GZLbSEgyjRfP7BU87d2TniDt9kdQR9xyl7acNjGQtnjIQtz3kJoS4H8sSZi6E1szOlLgu3oqA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(376014)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VhnRc/HFiOMAAT4C/pISpsw24aWiEmge46WUaQOktUf2ZQ/BBHdKtYCj4rniEGdaPhVrZ4mQOGp8uzmfU/SV6BrjCiGTbOY71hAx/ei8tcPHGV8VabHHBhjG9LFnGWCLx97Hq0W/keFIB/+Nb7pcFhu5aL1GOWXC8uQwtOkaEpa8pQu/Qo4mww62nZzbWvSzBIiT7z/GDFP/+Ip4ikLA6AHQFUU6axrHUEPpGFHch/AJCw7ceSBvWFEYdbuL60KItCqR0KXc63jAhfwWnTGs5zqduzjdtbFDGHtI6X3Quf9ywAyE62Lsc1+cSPQIRtpr/5oiz7AIP0AiJVbLRa5avvXwYSrkLKv3h9t20CYACZCbsxGVdzPIkpuRa9yVX7Zg4aEVS0RVxVpZJi4SQIjUWj2la1waNAwde4mGiuRsFTckuSbUZI37XABC3YJ/xztm
X-Exchange-RoutingPolicyChecked:
	OfCUPNqoGWmht4Nv6BDsS0S12X1SJ1CZzVcoftmIqpLn2slq6sqiyZctUV9NFKgP1ingBqrwfxev7t/l7nR2cCPLBFbRwmAJhR/1qe/H3NOW2EnpwIXB0a0leteBheefNCNqyJzt3xOZwruQ5KshAtrRFYnAVINScPOU00PvV/bL8zn2CQ/aCN9hKJNlY6SrjtQFh6DioWXQZEItarWZ9SPiVCQpY+n/0g/QrwJfkCXH+69bEwq9KWFvgGicr6xUKpxFrxJCYd8fYVJwt0g6/DE4q0pptdu2SeMxPnn7hYYoKdaEUiadPThJQZAGDWfRklKL7I8QN0b5FxjQ+8aOpw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 06:55:14.6846
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9da13574-7ea7-4a34-b40c-08dee950839f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6268
X-Authority-Analysis: v=2.4 cv=M4p97Sws c=1 sm=1 tr=0 ts=6a630c58 cx=c_pps
 a=FzHw5hv2FvkecWl+Aalm1A==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=pLKydCdnm037UxjljzYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2MSBTYWx0ZWRfX816rJ4nEV1C/
 rTJYG6y6CNL9KmKoBYCXAsxIEywNqGVpvswVDBbdCwDGr4J3ivkREO0n2IaGwjHxlFT9tJ0+9sM
 wOSOOJBzbj0OCi22GNwEmph9UiMkGVY=
X-Proofpoint-ORIG-GUID: tZZf209F0WORw6JUUT8iTDgr2gfFSIRD
X-Proofpoint-GUID: tZZf209F0WORw6JUUT8iTDgr2gfFSIRD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2MSBTYWx0ZWRfX2xo/OR9axxQ1
 nj1/pMwvozdNVOJP5eKo9w12oQYT5obcg1WFags9sU2u+0MBHZe1SmH2QfbaZkCYtUjSeTNHljz
 Cy7TjDYtmQUdO/3xViomHVoxhWuYKCVLnJbVDOjDTYXF6kfSC9CIdKLAfuj9ZXHofVgBAOd59x0
 CsFu0Nfl+lM71MFsVEBPLUBMytxOUgbA0+8bpFH9Mu6AVl7SKSdwgef03teAdoz5O9Va9zhOHPL
 +SPFSlibs2Tp90AnlIgEz0HEfdxggZNKCouBovHiG9Nz5C1RXcsyWXa/UZs5LkAkZRLvAd7Cfov
 1IL5SKsZuGU2mhynzH/lMChiM0Wg5I7iJSANwgYSzuWpLn4UK1F6uWV0UAJSQVi4kXez6wRD8sS
 cRtgrFPKntuCj8s3Ol/mQCv4iMp2a2NCZoXDyS8lIn78f8mDHVzEhdR+0R+m3k4wnSsASucI4Sl
 Nfh0a7ZVOSIjPeZKbWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1011
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240061
X-purgate-ID: tlsNG-33051d/1784876122-6C6DE4E9-4D19D70A/0/0
X-purgate-type: clean
X-purgate-size: 4360

Hi all,

I have been trying to use reserved-memory carveouts in DomU, but failing constantly.

This is the log from Dom1 boot:

[    0.000000] earlycon: uart8250 at MMIO32 0x0000000053914000 (options '115200n
8')
[    0.000000] printk: legacy bootconsole [uart8250] enabled
[    0.000000] Xen 4.21 support found
[    0.000000] efi: UEFI not found.
*[    0.000000] OF: reserved mem: Reserved memory: No reserved-memory node in the DT*
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000040000000-0x0000000051ffffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000040000000-0x0000000051ffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x0000000051ffffff]
[    0.000000] On node 0, zone DMA: 24576 pages in unavailable ranges
[    0.000000] cma: Reserved 32 MiB at 0x000000004f800000

This is my passthrough.dts:

    1 /*
    2 * This is a partial DT for passthrough node to DomU.
    3 */
    4 #include <dt-bindings/interrupt-controller/irq.h>
    5 #include <dt-bindings/interrupt-controller/arm-gic.h>
    6 
    7 /dts-v1/;
    8 
    9 / {
   10         #address-cells = <2>;
   11         #size-cells = <1>;
   12 
~  13         reserved-memory {
~  14                 #address-cells = <2>;
~  15                 #size-cells = <2>;
+  16                 ranges;
+  17 
+  18                 /* CMA region for framebuffer allocation */
+  19                 linux,cma {
+  20                         compatible = "shared-dma-pool";
+  21                         reusable;
+  22                         size = <0x00 0x08000000>; /* 128MB CMA pool */
+  23                         linux,cma-default;
+  24                 };
   25         };
   26 
   27         passthrough {
   28                 compatible = "simple-bus";
   29                 ranges;
   30                 #address-cells = <2>;
   31                 #size-cells = <1>;
   32 
   33                 misc_clk: misc_clk {
   34                         #clock-cells = <0>;
   35                         clock-frequency = <100000000>;
   36                         compatible = "fixed-clock";
   37                 };

   73                 uart@53914000 {
   74                         compatible = "ns16550a";
   75                         reg = <0x00 0x53914000 0x1000>;
~_ 76                         interrupts = <0 302 4>;
   77                         reg-shift = <2>;
   78                         reg-io-width = <4>;
   79                         clocks = <&misc_clk>;
   80                         oversampling-rate = <16>;
   81                         programmable-char-timeout = <4>;
   82                         status = "okay";
   83                         xen,path = "/bus@100000/bus@22000000/uart@53914000";
   84                         xen,reg = <0x0 0x53914000 0x1000 0x0 0x53914000>;
   85                         xen,force-assign-without-iommu;
   86                 };
   87          };

   88    };


And this is my dom1.cfg file:

 1 name = "dom1"
 2 memory = 256
 3 vcpus = 4
 4 
 5 kernel = "/boot/xen-dom1/Image"
 6 extra = "console=ttyS0,115200n8 earlycon=uart8250,mmio32,0x53914000,115200n8 loglevel=8 root=/dev/xvda rw"
 7 
 8 # UART1 (0x53914000) passthrough to Dom1 console
 9 iomem = ["0x53914,1"]
11 irqs = [ 334 ]
12 dtdev = [ "/bus@100000/bus@22000000/uart@53914000"]
13 vif = ["script=vif-route"]
14 device_tree = "/boot/xen-dom1/passthrough.dtb"
15 #  
17 disk = ["phy:/dev/vda2,xvda,rw"]


Am I doing something wrong? Any help or debugging leads would be really appreciated...

Thank you,
Beleswar


