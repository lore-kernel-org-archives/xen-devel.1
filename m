Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 433F5C44508
	for <xen-devel@archiver.kernel.org>; Wed, 15 Jul 2026 20:20:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1363309.1615045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wk64q-0006SM-TQ; Wed, 15 Jul 2026 20:19:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363309.1615045; Wed, 15 Jul 2026 20:19:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wk64q-0006SD-OZ; Wed, 15 Jul 2026 20:19:32 +0000
Received: by outflank-mailman (input) for mailman id 1363309;
 Wed, 15 Jul 2026 20:19:32 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wk64p-0006Rh-Ro
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 20:19:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wk64p-00Ey8o-8W
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 22:19:31 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a57eb16-e002-0a2a0a5209dd-0a2a4507b652-34
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 22:19:31 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a57eb51-b4ea-0a2a45070019-94a38ff12dcc-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 22:19:30 +0200
Received: from pps.filterd (m0384717.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66FKJSC23532581
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 20:19:29 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com
 (mail-westusazon11012009.outbound.protection.outlook.com [52.101.43.9])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4feescsjbx-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 20:19:28 +0000 (GMT)
Received: from CY5PR19CA0132.namprd19.prod.outlook.com (2603:10b6:930:64::29)
 by LV8PR16MB6175.namprd16.prod.outlook.com (2603:10b6:408:1ec::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Wed, 15 Jul
 2026 20:19:11 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:930:64:cafe::6d) by CY5PR19CA0132.outlook.office365.com
 (2603:10b6:930:64::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Wed,
 15 Jul 2026 20:19:10 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9
 via Frontend Transport; Wed, 15 Jul 2026 20:19:10 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66FJvEBP3692062
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 16:19:09 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4fe3eu8x79-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 16:19:09 -0400 (EDT)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id k64PwzRvLjgQak64QwXNXC; Wed, 15 Jul 2026 20:19:08 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:Message-ID:MIME-Version:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=ppford; bh=I8Pnrq2lO6jfFQky2ms3Em5np
	M1/2Wnqx0bhqwv2gp4=; b=u08nDJuF/qhHzy2Wl1iEw20WTmoCNnT81XIYD6Yjt
	tRTVtLEEM0X2czwEsLjX6XkPVHlT5qcT9RK/m6RncnXmxTvA+RpK4MeBT0yFsZAI
	UU4RyQdUpgK1g40Y68IEyTH+cB57yDnMetV21VI+b3lNdFLOW3GQbthG56Hf2PtT
	ypzOmL88Z0oyUu//PYBw19n/m46C5auWPpk/+kmOeb8w3kDhEgzs9hOCQSYVqQuV
	+yXIUHdafftXHrdl1Ri7kHGLrOtp5RnVTAWxQ4p5Nivf4iF5CnI+wwSf7bGDQozj
	lmee7Hn7a/Sp/hKYGSrRtqCXqArTo28Tutszf7S/kFReQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xl0MeHJokuWS0Pz2jkVfAxTQ3lvMXGhs9v/kWZT2iplO2q+4AVsYjwsAbQFllX2CgxMyiX37TuT3mhZaYumq1fnUahnGG05xQmOOp7+5FWp8khIT1kCoVAEKiJ26px2EPACzTxz2dT78a7/nYrQh7I+64F9TPLGiG63PtfYcl2V4QuJ9B5ibc3wUIK5aQRS/5hL9CR8gjdrajG6or7M4szqxpfgSo/ZN/3lQxeXSLxjpQ2GCowFn8TqlFLfT9Ty+n28EzF8VHjnGirInQ+UdWk1D3/bytmwvVEBpFIxBV3VV0NMICXTBPqKmVwHID7LKJKmkQjMlPgow8MLjDj6u7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I8Pnrq2lO6jfFQky2ms3Em5npM1/2Wnqx0bhqwv2gp4=;
 b=HtZFsQPRmu+1IL0jC321wRvtRsPn9VqqkGIuiq5r6FefLvAE/6D7txrls3+agSYH5T8ZugReHzKI8qHUWa2CkB0ZN+LLkUA/YsFae7EIkkIBANPw0dTCCMguUkyXpXaexpLYjefR2zdSozJoD6CbvcOSb+rNoIdbdJDPlh4jsq4lvuwFhcEyGShhI2Zr5qW9xf5UMTzJft8Kz8kapRC7cF0R/qWHXyiNEueOubkgN5trhZKcRz8Vvnq8HKcaisG9tMEMOPdPbh5orpvbaoLtIMsnX/R9x7R6sMP43PMc3Cyo0pgYp+fCyMBVUc0El9SdMafDX+DtIAtf+xeDrh/wHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I8Pnrq2lO6jfFQky2ms3Em5npM1/2Wnqx0bhqwv2gp4=;
 b=eNbhSYXPtmMsXVfOV48Mv60xi6cUh8zQhEaA1c2Sd5LAKzSf7tkRokAvClbgviS4ks+KtzA9QL6zVWiMBtBYSIERO9wjtwWXJ6unGVFtv90gSohti/mteMToLhovQgzGM3zoZcfX0RRWZyFXaWOSdZPNY406Bx05o1vBNfF8ZVo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to; s=ppserprodsaar; bh=I8Pnrq2
	lO6jfFQky2ms3Em5npM1/2Wnqx0bhqwv2gp4=; b=QATcmObvv6Zp9ZJZvzLqXDT
	60MDREAAGFDcjgM+kjReYLLkZJzgprXdmVkY7MthNXjqYlqjBvABL9sR8u9jIwo/
	0jitBmNfANGW461iWM0f3RupbQuoAFI4aOcgjiKteEIxEns/j4s3YphgP9ru0GQt
	elx5tUlf1IQS+lB5AIl0cQokVx0BiYiCRWIs+66ddXpJ+Elm8OE6DjzqxJURyym1
	VkSxJDZeXRyp6lShGYXSrYIsL5IG2zD+8AWCorBVKeuR9KS18LU0gv4RK7hia7eO
	Mjm+Jt38303AHF9mb8AUtLIWwg736nrzihAACx7w9H4ZW+fBjif/f2KwGadHGMA=
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=ppfserpocford; bh=I8Pnrq2lO6jfFQky2ms3Em5npM1/2Wn
	qx0bhqwv2gp4=; b=TqmOwHsDdHsQXFFr4DwQQjtaJdiTapYNo7qaMSIfSxJ+us9
	tEcR2ODoeQYvcX/ZETZ9KxEU9lzufrHKmqDPWMsh0/ySakuX0HMTyBQsZbP77dOI
	NbonOxndYwbx7/1qWQjhfUhCl1mMxHeD8QBktxkMGwgYin/a196bYojtnuJwXMyu
	Aui/eEzpZ5tszQq2iQ0+PG+ggCuC/0Qgrc4ciTtq5C2i4fvebsHdgriDOxxOYTpS
	W5fRxBLDI+OHFDgDa7I/vM0huZodAjNBG0uPHeiJle0ktwV4nQkymG3GN7/tGWiM
	1LsIOVW6mofjzcTCd3t41J91INRsTUUnP21IzWg==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: k64PwzRvLjgQak64QwXNXC
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v3 0/4] xen/console: updates to rate-limiting
Date: Wed, 15 Jul 2026 13:18:58 -0700
Message-ID: <20260715201902.2984407-1-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150203
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|LV8PR16MB6175:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: dd29e9cc-bb12-4177-9c05-08dee2ae5498
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|376014|36860700016|56012099006|11063799006|6133799003|3023799007|10067099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	wKhy8M8sGIKPGX/A75etCriuI7e9pz9zEUFSw7cvMVJKrFEA8MKfrS3/lcnNQFhPlzz9RtoeYSqABH8rAQ1WVcRBlLITWW6H151Y5IPxlb5CBkDEzSxy1nbMoztH6FX5b8N3x6zqmt8r/cTa1KOHmZxPl8OR7hAApnhtUwHQfM4dzWUFy0Yv027TP3mp9qjyu6TiiRo+aIdZ8+mtB7Elk2A8jE2Qm/ZKRMkqD3M6Q+6FDtyG/5hlNa7JIXkEgPADc8nTwq2enwQ/WY1cybRGkDpU0ccUsMoemx/0x4W/A+lqx7Frumj7qf2qXCd/CFeBZS3WK8ub6Cw7HXLsljQRQKO+crxnN/lKJ8VsyJa5GEgBgIGSHX9bNysYCJeL/DT+ojxrL+dQiyhc7QyU1RGIYWAlP8fr9zdvjGPlwO/EcMB9MV6DdRmLEOSyZU/UfF27CFJXP0wpHZuJf0Lq7y6woSEu9lu+DkqRQEaTmYMQpB80JuvzBhTdTVNaVyCKvdzEakR6PE3v9v3gB/V1Hk5cb3akvAXvlzNEFjYoEriwTK/5pPE29Zv8PIOT9/moHZfGMQNQSArk4GqjFqQZvlkkZ4DykMyY/3yJaKktkCkjynH5ygHfWyXJk8knbalWbRXayHiHA2+XOyvFviXSm7i2CHdKt9VC8divmo/5piLGAVE5lem1NzDoxNHEkPfBasNhQu/32sIloQTTFfuwBNfFag==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(376014)(36860700016)(56012099006)(11063799006)(6133799003)(3023799007)(10067099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hEAePoOB4jVLG+YYQp4sBhoOu/POVsnP8s4HanWJo/s//1XP6WnquYHTXbhDHg9ASXKHBmi1N2k8pfK3ekGUjsFTVe5N7whJ43WPyIb2xwgXzo35MlEkNEne20f8HGiASlVHcP0mDBkmno4dYamN0PjON+2mieH/nuVDhF7qaTiiOOkejxvuCtkQgCcbCFl2iNarkPwOYttWgyBprt0kkcKy9rtD2SFPI3yNwFRHNcDhpVjBWlzEsOYc5MnBHrRhozNLin8kXHWTcGcpIpQtWaqtPi+jYFOZew1uY/owFsl0izW4OV5umcaQb92HRr0a7o3uvKpLRNkxZABHiyspINBVLNniPVIvX/uCygJ8tGYABZWH9Iy3fEKem/LWyMVnpVZdIQ8o4rR8+C8x7qmIsPOzWbvt4nuBhog0fLmeFLPDdmrEps2qKAdEeeGyH0xZ
X-Exchange-RoutingPolicyChecked:
	FNTtccExqodXWQo79DXMP1JpHSu2HwGWGWRRtzvQEMiSMZbxZG5FL3ShJDM7Jt7XItin9asVODPJHaxHcyaWHMD7outG+S3gN7NRXXp5YadXlkCL2GZHY0iLnsYHS4QVyaWN5XiM+cCfhfSLjnhdaAdGFdhiGluiz7eeaTiy+e1cjtAdne0pFu8MDuP/4t0n9ispNMnkDGVy+f3GjL7tQZ7GFXat7lP82ymyn7YLxbb+Tw18FTzy26HBqK482cZa9Ff7akruyIwhJfaBpZfaIuB7ajY8ysNmZIHMIEOk/PSCSno+eSRGjcggcoWAuUD/0PEjVZdoJe3zyKGa5QPSDA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vRNT5AKrZEztxEvIywOlK+aYUBIqKoI9Ajzg672AFkErTQ6BjpXCnsGzqw9WlCSY0j9f0dJBGontOR5tV6mn+oWPXwYnah/fez9+6EmUmN7Mc5TyXk0yIXU+rV0wO+eNpkUJDKeTLIfBcCV3qhofcHYGuRNpDzGbEi09YlBZLUW8OOpCzM+S9+Ta2RSrZBaqkBglIGH4ws2CC4u1PYKqMns7ksUkl4zZtwnnFy48kPDYf3+T+hOPk1h06x4Xolb0wUnDkkutgOt8Y21QW7g+zdOp4BMasx772qkSId4RfRzfFYuenk8MHVxYy9lRUy1OMAiq1h9UJuVK9asPNolGc/PMlj8593TMuXcDtzBkZrPfs6HWpDzmPv88ZT+9Yvfkc4EybW1VXV2iX8pm14WYBXnQwYSwEhymcmr3CUZckGSK00vD3h8AbWqIbm9wsMbE7QmEYwOiaYBXxS9PPHPekT2fJtY9Ai9O7uDGmvUxCraC7eFXsCMgp3tVMKN11sKY0bkZ/CIP7Y9RM85DyOFZNf6sEffvmWRhS59LWmuEKtuRlw4TN0Idf98bh3AkVJ6UL0TowWvbJDt71UU/VQdxB7eb/0neaFOQcyCjqJ8aOsbpkbtSZ2isRzcj33hvHpdzogS98jmc1GsLsQsf+nZPdA==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 20:19:10.2741
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd29e9cc-bb12-4177-9c05-08dee2ae5498
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR16MB6175
X-Proofpoint-ORIG-GUID: sjY1HXPDSf5b3BSVADhu_j4X_btC0Zd_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDIwMyBTYWx0ZWRfX+wywCfU0NxAG
 gdNXvzwoWEYhYYylZxnypb0DkwqbSlU41OTjRZF7bDprvtLeb813VWJ1SiL4bkwr9Mg7eKyUoZn
 nhrAsgaLebv999jKWI3XWm1LkGhK68xJcc3vAnun7jEahBHd39hc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDIwMyBTYWx0ZWRfX0v2R2g2TyqfK
 b41tE5qBfIatzbi9hA8TdwU2uCW/urhRwat0sjpCTOJ/i3fephNuTtpPjpwRAUie5t6qHiPE2QV
 rj5y/tBG0ZQMbTaUsFrWozF///6TebBp+PvIkRg4+Vba6jFn+WeRhaQoIloafeomECtEy5T7WS7
 cJaDhNsgdFBaoJjRMVoSMUEyYxLWAPqt+aC6zPZ5lycBoQ9JQVkCJPS174D66+bIKNK9fq2jWH2
 mBc8awcEP0W3NZ4Mq1IzcCx2thHw9Hhxj0ddIUe5UhhTIxfMVQ1uuabPJMxSco0FVBvNan704x2
 Dw+VVrpMwhwQ2HZy6iSkI+8NiCd8vqdf3zK/xWoMsvfZr++hP1qyBWUWE4EziApMQJaaLC0R1RI
 WPweGdNv6daeLtlSTiGBJ6qj5y8vT+3ZTRGxHSbhJ1HEhghUNNLrxo+CWz/ITEywb/2EG/32bFr
 a+iEL8kL13JVSr7NEqA==
X-Authority-Analysis: v=2.4 cv=fZedDUQF c=1 sm=1 tr=0 ts=6a57eb51 cx=c_pps
 a=rl9QZQJB4f+cLtFzzj7oTw==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=AHe91QgOk3R4nFVtG5At:22 a=VwQbUJbxAAAA:8
 a=cbNQJ9GKAAAA:8 a=p0WdMEafAAAA:8 a=5Zop1DV_0Gg6xGeLoKUA:9
 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-GUID: sjY1HXPDSf5b3BSVADhu_j4X_btC0Zd_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150203
X-purgate-ID: tlsNG-ef75cf/1784146771-350CDAE4-F98DED2F/0/0
X-purgate-type: clean
X-purgate-size: 1036

The series introduces compile-configuration for diagnostic
messages rate-limiting.

Patch 1 is a tiny cleanup for ratelimiting APIs.
Patch 2 is a fixup for the rate-limiter to adjust to new user-defined
rate-limiting parameters.
Patch 3 introduces build-time rate-limiting controls.
Patch 4 is another tiny cleanup to reduce the amount of code.

[1] Link to v2: https://lore.kernel.org/xen-devel/20260206202424.2054758-1-dmukhin@ford.com/
[2] CI run: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2679857573

Denis Mukhin (4):
  xen/console: use bool as return value from printk_ratelimit()
  xen/console: correct leaky-bucket rate limiter
  xen/console: add build-time rate-limiting controls
  xen/console: reduce number of printouts in __printk_ratelimit()

 xen/common/Kconfig         | 29 ++++++++++++++++++++++++
 xen/drivers/char/console.c | 46 ++++++++++++++++++++++----------------
 xen/include/xen/lib.h      |  6 ++---
 3 files changed, 59 insertions(+), 22 deletions(-)

-- 
2.54.0


