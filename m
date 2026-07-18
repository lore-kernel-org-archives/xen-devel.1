Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0F3C4451B
	for <xen-devel@archiver.kernel.org>; Sat, 18 Jul 2026 02:29:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1365314.1615868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkuo3-0004HK-GL; Sat, 18 Jul 2026 02:29:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1365314.1615868; Sat, 18 Jul 2026 02:29:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkuo3-0004HA-BX; Sat, 18 Jul 2026 02:29:35 +0000
Received: by outflank-mailman (input) for mailman id 1365314;
 Sat, 18 Jul 2026 02:29:33 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wkuo1-0004Gs-Iu
 for xen-devel@lists.xenproject.org; Sat, 18 Jul 2026 02:29:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkuo0-00Cenx-5D
 for xen-devel@lists.xenproject.org; Sat, 18 Jul 2026 04:29:32 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a5ae4dd-bab6-0a2a0a5309dd-0a2a450ceba6-26
 for <xen-devel@lists.xenproject.org>; Sat, 18 Jul 2026 04:29:32 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a5ae50a-f479-0a2a450c0019-94a39217c71e-3
 for <xen-devel@lists.xenproject.org>; Sat, 18 Jul 2026 04:29:31 +0200
Received: from pps.filterd (m0367126.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66HNDja43130698
 for <xen-devel@lists.xenproject.org>; Sat, 18 Jul 2026 02:29:29 GMT
Received: from byapr05cu005.outbound.protection.outlook.com
 (mail-westusazon11010001.outbound.protection.outlook.com [52.101.85.1])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4ffr68vd01-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sat, 18 Jul 2026 02:29:29 +0000 (GMT)
Received: from CY5PR22CA0061.namprd22.prod.outlook.com (2603:10b6:930:80::6)
 by DS5PPFC0EDA5D61.namprd16.prod.outlook.com (2603:10b6:f:fc00::7e4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Sat, 18 Jul
 2026 02:29:27 +0000
Received: from CY4PEPF0000E9DA.namprd05.prod.outlook.com
 (2603:10b6:930:80:cafe::78) by CY5PR22CA0061.outlook.office365.com
 (2603:10b6:930:80::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.13 via Frontend Transport; Sat,
 18 Jul 2026 02:29:27 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 CY4PEPF0000E9DA.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Sat, 18 Jul 2026 02:29:26 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66HNI88F1682151
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 22:29:25 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4fc4wr05yv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 22:29:25 -0400 (EDT)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id kunrwlpSY1yXdkunrwsCDU; Sat, 18 Jul 2026 02:29:24 +0000
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
	:references:subject:to; s=ppford; bh=5yVO1UuA+36QQeeD9VG4BCCrsK7
	AyjVu/uPnJ5UAe8U=; b=WLZUF/Tix5pj/D3ASuqEcQS4f+gndaffHWZwx0/JLKg
	zsjlXAyr253LCTBBj/Ilv83LFDb51G3KjsyeSPxz0ONoAbPFfiEJ5Jgp0cIJA3j0
	4hjlNCQOcfwbdcKbwHk+22/P5GOLtlU5GCSk9eS96lq9ib89z8WB+mrFON9klF4T
	KD53xLsne/ePRxhKNYI/jAOQn14NyMzrnDVA3Bj9Y2dACwTTmq9VJ/qxQW5/ZC7F
	y//VlXZSBdZ5YuohPQBR9t12rGp5qDeDrMhiXo2bXcw0bb2Jal3G6vt3WP1s9E9e
	zczKmtimUjTv518uqRhpZQ3y5q77L366aWIqFkK3N+Q==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=urUJkZKFOt91+F4MUZk9J+Geh5Qo3gPc4CzY1QTWGzzOe3haG8U8xYaFqwFNNZ9OVLDSC4FC0GDNcPptbvKU8kSUXDp2BSN68RajBdR7f3WV6/yXHffS02bRJJslxQPI0a/GVNDqArzKnrBDin1Th6iBg2zKyzOFbXoOqrLjURm7ZJyN0OOKnqdCTfEsogtRH7UNTPOkLP0SGlsgNu24YpoB9orzx/l5mr2RqBH0+XXeG83ktJO8SFLHPDrvNSncouLFZq3AgRrb97xW0TVV/oXsZB2ohkh5SLXOVNfT1TLFWK/UMC/9lhICJKeAuwPu700fzgGMYRnAjSSqPI4gTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5yVO1UuA+36QQeeD9VG4BCCrsK7AyjVu/uPnJ5UAe8U=;
 b=rvrhlTroEkAWASg9irmRX/RRag7sB/IuYhnwCyRBvGBKU79S7AQ37sWxOYnobhaQ3q1rojSda3+P4oxcYOR7IW4bVL8lBp3Vao3x3Q09iI+o9w45g2Wl152+H+l4UEpTF6kWWLr/ab343YDKmSxdibzQpYADAFKs+QaUd4Rqyr7K9OqIpCa2Tkl6COijWssAx45rgDKVWpZwpTkLP1+bQ9y5uU2EJy+zxrz5K+4Q1i8sQJwgqlKq161zqWiaqwttx57v0iGMKVPooh37BeY5t0G+8WLA6C/PPaNpmuV8OMHvVWfWdDdtg+ZrTGveDSBtd9bI9ywOVOsDyPnS/EpIkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5yVO1UuA+36QQeeD9VG4BCCrsK7AyjVu/uPnJ5UAe8U=;
 b=WPdYFvjk3XaGddIw+n22vc1ERoQFtlkabCxbBzLg8grPSC9aboZq7FtKRB6mIWcBT4zNMw3Wlks8L5IN2DNVFM1WP0T6RJY78IVTucMkFLVggTIm6RPVp6lcHNcfiqNFkr0fTuH9SH2prhKlwlyvnCAZMx2/Nt2A7TXjLlY4T/0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppserprodsaar;
	 bh=5yVO1UuA+36QQeeD9VG4BCCrsK7AyjVu/uPnJ5UAe8U=; b=eqF4Rsagh9UF
	qqOVfFLLQ9mKQF4LCdVdjjAeNURdRs5xUU9t2n8IYK4qb22CxhgDgfaZRby0Pfth
	wM+pTUpgmcqMRPWrcOjaBfn9h1GTyvTK8PJA01D6z0iS0AMCTlp9Nd36U7oM7/lB
	10aHhLaPL9JRJZjjhS0H5vnNLNaTqPH4PdX4Vkr4Zby90KEc2rpcsoWkSIRmhpsu
	FyT2VKppHPe7r1VrvMQ+IaDg4TGOhOxEofvqcK2USFGmuA/dLctpnbgRpXjbXQ8k
	F5RztP+McWJcsyPnPEpsfeqSxVCp0gtDbAxjwbBehNn/6SENkcT4jGh5DcOt/sOT
	9c4DzS2eSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=5yVO1UuA+36QQeeD9VG4
	BCCrsK7AyjVu/uPnJ5UAe8U=; b=SGPlusCWO0mejU6t9WqYSuQLSPtKfPmNg8VX
	KK8aq/W6Suz1/yceo+uyg1jkT6BwGElLE+99lMy7emV/yzo5QFyoDecUdrXWvGVa
	AeVlpd0amhDCRlFn1y+V1Gho+Dk2gNI5Vw9+V8iqhpaHxe5PoYPFFJStNuh8aAgW
	tF7JbrJ/Sdlb7YWjlql01DUFo9MEW9jvIBDPzPg5VaVTbG3lXqLsZSnDDx7SEfJz
	uYq5Fym1pX2jMtO95BWdVGyg9z7TKJbD8tWfLG6Xr7nQXOsS6rIwkyPyMYtGn4dt
	XQXcYCfNnQr3AUe1crRnGyZ6PwLCZ1zdMnR4iSFjIi3ZuDDLsg==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: kunrwlpSY1yXdkunrwsCDU
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Fri, 17 Jul 2026 19:29:22 -0700
To: Jan Beulich <jbeulich@suse.com>
Cc: dmukhin@ford.com, andrew.cooper3@citrix.com, anthony.perard@vates.tech,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 4/4] xen/console: reduce number of printouts in
 __printk_ratelimit()
Message-ID: <alrlAq2/8HHkL8ty@kraken>
References: <20260715201902.2984407-1-dmukhin@ford.com>
 <20260715201902.2984407-5-dmukhin@ford.com>
 <020cfca3-5558-422f-b267-e498bfdf36bf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <020cfca3-5558-422f-b267-e498bfdf36bf@suse.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180022
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DA:EE_|DS5PPFC0EDA5D61:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b6ac991-3624-42bd-0055-08dee4746320
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	r9x9Rv0eiMDRVOGmYMIeUX5dniH7MUH1LSmeyBooFQdv4iE9/3bSi3Z9q3ZUWlgQ/jh4IBCQni5+kcospGBx8HnyP8m8/g8ien3Wl6AdlNOM9BMorlWHoVETSRbvuV9l/98+eKlbGs1w3A+ACDKNBsOpFVAcf9zmWogxBErTflyN348LqA/KQw5ORXDZX68N6iJcnBTOTpgEPyeCsOcPVqt8WOj4Tupc6JlCAQti6D3zLxXKwuu/UbxlJtm1TzlH7huPtn111HRpDjKQ+14197Wr9D83CGroMsiFgzMwq5fWH0+0mDjBbFfMIC92ZNfjN4beVjTinFETKTlJ2CFVSBs1A5AsVS/HU4/7dms/Gzqe1M43lPTOwWiY4Ig8WgFh3Lg2u/I1SsvXSO1cPX9241/SYDT3Oxqdeby87ld/SOLAq/Dr9dnwsGPXmPjzpvxUtabZ3bQtqMY609PYCrjrX+GCtkW2e22rWFRtfTAqEr5yzFYwumyInqiLu4ubAWvoakKHBFOFN7akIw/LcCkZ8rGflR4f77zFn8l3QgLnULxpOdxlgyS0n+9hSuF92LAzzHzKDd3a0khaaNK1YwmiLVCphg8IHtePM8zCAeNjd1DBb0XXbfytgRHPtTkMlbpFg0d9zpyl4/ew117ZBwBWera1cu3L5msvkOJjNDUwJs3DMrnzYK08Qe4OptmwiBYp556UrEMZ4HVyS37dT9e/FQ==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZwMMLbXC89j6e+an4UM7eJ+Jj59Yd5nd/xPB6fUdHBxjiP9BKL1gdnO2pV4AOmVXNrffejN0875hKfUytdchBU13eO/n94MDMX9D2zCMl46+Hle4EOVjPlFiQlzJ6Ft+Bq3riiDY5rQFV0X78QP8V6aFIU0KxHPsgkCdX5SWD4eT5IjOLxnzxEhXesmjR2fpjHBB0XsznHDQSMyawyTrgV07U1Zh0CLjowgFg61S3z5fYTU1hJUC9T9xUFBafZZZCvRytzKLahC4cgo69buZiT34kqhjOS4v2lM0+tkMhzaJMVLtqvv/5ZU657dZ1Hp44nnnFh/4NDZnJkGlitcL5yHNvSH1y9lJfN0LEVzS5wToC2ud+jUQCCP/VHmvbLRjEvfbOGDsRa0J55eC+af+AzBO/L5DltRCcEb4UoGV9ZhTRXHOgv9xmoCcQeqqQxTl
X-Exchange-RoutingPolicyChecked:
	pIe9yJ3/Agr62pAJ96EmDKCiMRP1/xtpNtHi6JHXCopWM/8oqMCGhSgWRkjNiKwHqx014PJzCL1vudnl50NTF4i344SShgp8kR5EXisQBQUC8zaxKGm5F9OGVfQUtKulhuStt4AQ+oHqXtrEDbvojbRPlw+OR7y7AuDdWuGfcaFGvcVbUh4o/hdevWU3cEAOLUUNsnW6n3xT2RAu4cinDq6/MZSN7/O7ix0zk/z/mIjDkf2qbwqyb013KPyYU8bA7tAHQRPgW/7XAIvtmALQ50lIDHwEHdrSWQWVlkFkFsIMedTmiJc2C6vnG7njYe/rpXf5Tc/VmjHk5kuh8cQYHA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/n1lR+XE2dhYdcqy2qH9NiE+yZmgerw+6DbwxEhgxCC4dVffAAi4E9wpFMruS96F0/yiijut85Alg5WDkBUYYpDTSmUvsH+N/lkKszQQLZyRyohf8R1dxe4tYRTAq8KpG2lff8NY3zpDo0O3OSV1j0fUxgfy0HC5tgpmakPKdu5rREtYBNs6SBUStAXq6ZVEOK5eLtSBBpYWwExV/7qa2AHtTiczH4iQklfhVPgRiYhYdyhEU32BxwsD8wDWcADgRad0Q6UArfNZCNmffp/VxYtA726ejgB9Q+xHbSe9fRbQ4xxLepNcC8IJJKMSfz8SFjYgUAgwOpals5VOm2HZDRXdgQk8/77Eq/QIIWipfsS5kl2EjwF3HJm30tkMAyIo3SXlVbjgtZz71cMd5Pe73dJMl+U574LGApKC5V7a9w4iU4GcpCI+xUZzKE9Fwgs9pe3SJu5Te0WbOD0rBoQQBVx5IB7cw4yBeb+LfGm0ZGWK3ql7kLuWY2YUoKLsGqZPJFujGNkWJGoCI+OzHtdWJr8bP3l9lCfFnU4pddU/IoUA/mpKgC1DRAVfQE79wUHL8JV93fX9CnM9oh6OVDq4fJkNwOCu4HYUskST3tNXj1lT+zzIQKqHsD3xoT84TgNhEHSyfY6KEAsaK0zE7qdsBw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2026 02:29:26.2094
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6ac991-3624-42bd-0055-08dee4746320
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFC0EDA5D61
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDAyMiBTYWx0ZWRfX77r45xQCgG6T
 L+wDlBXKp+Vesg/XHE3OhTkpNA3/H5TENqgvSvwhnGsWp2ytS+kTP71Z10Sp3NryYQRp2SDk+Pd
 YPsPug0vrDANXyF1qAADVVGqXMMlSRcglG1PbW4PgZmFbL++JWPy9LFlPcwztEX1UqnwVojP+gu
 c92EGTKM1uaq73+EsiLO/ccdPOlDUaDrdMsK66Yrci0uJC6dhgV9/3bp2zVBqUig1z/2nbt4Ei0
 U9BQt21eDekpJAoeVA53GgqM5NLuxqjsyB9nG7cw6zyxDN7LKUMX+RSeczvZgnC+nEr3dlpJjyp
 f8NYkPczWMcGASgdLcKaGfuLuB5mFdLBR3OmIl1WT6NCgBf04kZYqnfnNIG+4q7n/5uqGcE4rH8
 uTrpwKTlPslzkIH4HH2/vhvMsIBid5zN0PsW7NbmdQuN3SdwY+wqnBUWvOw5m3heWPo6bpL1Etd
 P1soIbyXaVv8l+51rCw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDAyMiBTYWx0ZWRfX9f7GJ+O/FgfC
 GUMdocxePylGtPSxYAVUYGVfyDhbsPAJDjvJsM6XrMqaoSNFetdZsIs97+0nZ94qpcWmgjsLejg
 SMjUKhfGdc0H+kgr9xcG5L2mlkuDsHN22LxlLADNyjQGanROUuy6
X-Proofpoint-GUID: ANSEpkdtLOMVtNhAVxtsOR_GYSuwuLsn
X-Proofpoint-ORIG-GUID: ANSEpkdtLOMVtNhAVxtsOR_GYSuwuLsn
X-Authority-Analysis: v=2.4 cv=IqIutr/g c=1 sm=1 tr=0 ts=6a5ae509 cx=c_pps
 a=BP8zQLqIaVEyLeHVCiSdtw==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=-OawqTZBqJjt90xPb8wn:22
 a=cbNQJ9GKAAAA:8 a=KWXIm9auo01guOTqcqQA:9 a=CjuIK1q_8ugA:10
 a=G69WFyCBNqGPyalROSdv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180022
X-purgate-ID: tlsNG-d25034/1784341772-50D3CA5B-A2B83913/0/0
X-purgate-type: clean
X-purgate-size: 1646

On Thu, Jul 16, 2026 at 05:49:35PM +0200, Jan Beulich wrote:
> On 15.07.2026 22:19, dmukhin@ford.com wrote:
> > From: Denis Mukhin <dmukhin@ford.com> 
> > 
> > Fold several __putstr() calls into one around notification of how many
> > messages have been rate-limited.
> > 
> > Not a functional change.
> > 
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> 
> Hmm, the upsides and downsides aren't being discussed at all. You're ...
> 
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -1303,15 +1303,15 @@ bool __printk_ratelimit(unsigned int ratelimit_ms,
> >          spin_unlock(&ratelimit_lock);
> >          if ( lost )
> >          {
> > -            char lost_str[10];
> > +            char msg[64];
> > +
> > +            snprintf(msg, sizeof(msg),
> > +                     "printk: %u messages suppressed\n", lost);
> >  
> > -            snprintf(lost_str, sizeof(lost_str), "%u", lost);
> >              /* console_lock may already be acquired by printk(). */
> >              rspin_lock(&console_lock);
> >              printk_start_of_line(CONSOLE_PREFIX);
> > -            __putstr("printk: ");
> > -            __putstr(lost_str);
> > -            __putstr(" messages suppressed.\n");
> > +            __putstr(msg);
> >              rspin_unlock(&console_lock);
> >          }
> >          local_irq_restore(flags);
> 
> ... trading slightly smaller code size + slightly better performance for
> slightly bigger stack utilization. It's not entirely obvious that this is
> a good deal.

Thanks for the feedback!
I will drop that patch from the series.

