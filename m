Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 192C2C55184
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 07:01:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381175.1624745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqmfd-0003WX-0G; Mon, 03 Aug 2026 07:01:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381175.1624745; Mon, 03 Aug 2026 07:01:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqmfc-0003WQ-TG; Mon, 03 Aug 2026 07:01:08 +0000
Received: by outflank-mailman (input) for mailman id 1381175;
 Mon, 03 Aug 2026 07:01:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wqmfa-0003Lf-VJ
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 07:01:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqmfa-00Dx4z-Al
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 09:01:06 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a703ca5-2eae-0a2a0a5409dd-0a2a450cb79a-48
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 09:01:06 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a703cb0-f479-0a2a450c0019-94a38ff19176-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 09:01:06 +0200
Received: from pps.filterd (m0384717.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6733QgDQ149478
 for <xen-devel@lists.xenproject.org>; Mon, 3 Aug 2026 07:01:04 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com
 (mail-centralusazon11011051.outbound.protection.outlook.com [52.101.62.51])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4ftk39s1na-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 07:01:04 +0000 (GMT)
Received: from SA9P221CA0011.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:25::16)
 by LV8PR16MB5909.namprd16.prod.outlook.com (2603:10b6:408:1e9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 07:00:56 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:806:25:cafe::9b) by SA9P221CA0011.outlook.office365.com
 (2603:10b6:806:25::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.10 via Frontend Transport; Mon, 3
 Aug 2026 07:00:56 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Mon, 3 Aug 2026 07:00:56 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6736OAVX3620404
 for <xen-devel@lists.xenproject.org>; Mon, 3 Aug 2026 03:00:55 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4fsyuch9af-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 03:00:55 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id qmfMwSXbfJrM7qmfNwfg4Z; Mon, 03 Aug 2026 07:00:54 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=dlZ
	MsMtUd8O/k0DHPgYEcJOApxOGUU7AlcWmznVSQRk=; b=l9Ejmnvy32myzL7JYQL
	nNDSxKy4iNteJtSOZvZIDrmlM6LRdjcJ164ajuYJTdlkFBMbZdkUuokFrAJ7CbUd
	Oh7ccpWSCKLcE2hPDUmRnautalwuaxjMAgWS4w6TWRXup2CpRkyw/iLGe3FX/fj5
	NwC87HijT8z4n8D5qtmvYlTeOMouzHqc+rTszSORd50V4Kw8P2aD7g28zgzGeToi
	Rth2Dh5Z74c2NubOcaMhLiScJ721KlItO0uMuxaarTdf0pG/u1R9+YmdtjHy2xB/
	dKOQ6PMwvCBcQ1xpoTyr5Pe47KDilm3bSXttAf5U3zO7lAATo4G6lVm5z+uXy4mr
	1Uw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H+c+IdYWAjKx16L3JnxhYktEPqSXgYX4bwvKb5LCN74wtCtvqU4WGUvcjKEGmgxtb5FBzsm9ERPiLByFdk9XWnejbqHztdTfagk3fFKe/OQ394Hux8NQyBq6lY2BLX6PfAFJampJ1r8PstCrbKNeAOpkILhw59TYsqMI+UZm6tEcJbpxSRGNn1iWh5cI6lXRMx06QRZn+8hIV+YYwO9/v3P1I3FjWuVK3Ak8ixSJPJpRVZvI/nQcR74ES/DFTVwO7ihanay8o844zL8ozzrmSWPfP1sdi6toUQ/JYhFgeXgt8xcpCrSJPPzy14wi2vvprXSVG5/dVb+sbBjbb4tXAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlZMsMtUd8O/k0DHPgYEcJOApxOGUU7AlcWmznVSQRk=;
 b=QY4CCa/feMtP83h5EbfInZmQDjWin+9DhLtUgEMWSZzhCqPvyQS3tYSCk9l8a0B96HXHDxv3rTJhfN7Gh6DNFf7GSjwScHUTnScNkNxwH53wQsXErJhaarDy0E3YWlQJ46xVwoydpUKVbgw9roNWyF89lLlwHbK6PStIFJ09AOrP0KUhWUPTTQnPS249YBHX6xyEztmB+3n4gIX6ycdkoQuv9+WelvH+/NCEYOYj2Pu3mHinVkqvQGg2Ok7tTkNUBRk+3ZKynBq+xwuIrFAo+icXIpdVjWb7U5twzDKlBX5vQNBio3tnjhUeVcm3GnHFi3JLIPT+Kv1YmyOKpxIbPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlZMsMtUd8O/k0DHPgYEcJOApxOGUU7AlcWmznVSQRk=;
 b=PQVr/tF7IWf/jLJbNSjNrE6j90QZW/hQcFTyHH40CUcBzcp8+RFwbTHncoyWulee+Gwh9Yu9EULpxCH3rTMavzAEd6Y1Ojcxb6t8dOwVe+9tDhPpnwId1BkjQC8fnMTUW56vGzP0rxSXYS/K4Qavl7ZsyLrhJvhQ7gSPWmu+03c=
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
	ppserprodsaar; bh=dlZMsMtUd8O/k0DHPgYEcJOApxOGUU7AlcWmznVSQRk=; b=
	AoLbcI7ROBr3tWuDESzxC8wCnrPWm/3VOivZenSqhvgtLgfCuADy3vFGC/kN8E7l
	UVLH4dbMbrmjwrzfppm/RFf8JSNDAdJ6Zceb+5J/hHWA/2GMSQNxy7c/8xApvVky
	kPrs3otByXZyhvS3xA4gMIDw7oNh2fjwJ7qmBy3M3xssKgZvCOBHuu9PYZMGeHKx
	dLK80Wp796nhghwVpPOXK4zFCbmigwHKd9Z4LUkK47xPhExvlzQch+ON6P4gqdt1
	300tSzZdtEHqnIv5/7rqUlJGcJ6AYaJJRkSAVlNajs+iE1hG49OKpHuMqICKGT5R
	LQlx9KZs+0CqnxtLkidSmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=dlZMsMt
	Ud8O/k0DHPgYEcJOApxOGUU7AlcWmznVSQRk=; b=pU2dHdnKv3d+j6pxCJ5HxFY
	FqeNt/YBPTpl9j/e2lO0zqIeR3n6hg22nNaJI/WX5ZcMhVZUD3rd0t4ATSEEWBNz
	woCg4SueWH/76msf4noJhZTHBY9RkpQKnWOegi9XazklHc8FCUxxBTdHoJokXCQD
	PitXHlgu7ZuMfwbwQgdxP5tprj3bsrn7GoNghFbi3gCkf2B0bGADsMfXArZRmdj/
	CJMVyZ7WHMEsOXJGHlDXh+Kf+gChDn5N2Okevn/GOhZUSGgY15wU2sb5AyaxV9/O
	onmNQIc/t9WkRF+mMJqqPLvdSMcHKrHM/29Dk0Yh7ptn6QTp+HAjRbCwCojX23A=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: qmfMwSXbfJrM7qmfNwfg4Z
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2 1/2] xen/common: annotate saved_cmdline with __ro_after_init
Date: Mon,  3 Aug 2026 00:00:46 -0700
Message-ID: <20260803070047.3097846-2-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260803070047.3097846-1-dmukhin@ford.com>
References: <20260803070047.3097846-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030060
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|LV8PR16MB5909:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 825b73d9-e5c0-4f17-eb24-08def12cf75e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|23010399003|22082099003|18002099003|6133799003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	43+gtYv8ZGfgHWK6sPhM5Ck2V+wGDsyYWmiaK1LQJLccCPgR0KIs6hahnIqtXszGQSrtTH57dEGssvl2atdan6M+5KtK/7pmRi5Z189kKwjPwVmwLiaYpmwRAAtpqirSaOeix5TgDnw9DROkyuv+yS1MyH5I6nYD7qvUypmBXufOfn9w6rXNIPchgWtkiaUsGpu6W2Q03lz2rviqdHDvuNhedOIc/T6eYDJDNi9kQ/8itVW5fefy45pdViL7eOtvUtGLgMH62Tidhd/jrGJAYEwRt0GS7QPLtmh3eYp81E18IyjQVVikd27Jc+YXJS009WiHscHSF4LN1vahyUt73qqiNOyhl8eKKhep3EXqnTivuaBpohlET3J37W/wGYeOVtt4DSeNxZocOBKpJHSs1ibfOfOs9yi5PhZct1kJtK3mnItOPbbbDr+CYBsKcVBKPmJ8bUnCZwxrhGW85O9370wdvdQhF0mzNzb27JY//jh59UnurXj55+7gYw03wror0LUCUqtu+jiIHhLhIx9NENQYqk45/7YyfoAG0JHYD+xql4TA+JNGWN/riu2ROuoBm/c7EQtCk540VcGYjJ+QuXtv9uraW1mKZ1yJOzYkiy8JmOFuiRJmSoXnGWWMQtjhqr63HXmE4uyChyu+eBfYxuuFzYj2XGoO3zy34/Yszrp2oZGZ0fheabzESVlLzY689e2HYwtqanGl+eSECOTFkw==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(23010399003)(22082099003)(18002099003)(6133799003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CBDoDr/LahqAqadldgtjIrGrexhjkBehQw7Zv1zmA3EPaGA61Zx4oMyxbtYwqSIB3zRE5LMJw63hGHyGavLFcl5NDeOU2v2V0xnLlSDlTrCFAFkQnl6QFg91AZHrCPU003norlf0dq/ulc2sAhWgh9SjbbUo6jTGUYQQ/kaqZaorqUy0oviwydIRqS3HMHP7BR4OYysPPFrkwctlrzEiLM+ykarqUiu5gOJtHjGBP824p6qzzBwDxDVkMwHikiSqnTvn/8LArnBZ37Qhn3nny4VrGy2dk1XxeqPT5K14Qgbp3slaadi04h7EogdhyUbwbiG3wlk10SFN7i2zX3J80OTycCrcEd7l1Qn1TsgJXTDiVCXWhpSF7kqnb39unIVkfv6pXZ5J4gi+5BOmrDoKQkePFcBV8YRfE2wuMaoJqFnOPQWISqtuQcfELriW8nzn
X-Exchange-RoutingPolicyChecked:
	qpUYF49fGlPh3fEyP5XAcUW9Wrau1rXP89G15qqKALdGD6gmAJG0yAgJRuA0B7QgKxGeX8gXv7kSx6cPN/s4pQzTkKqc5ULk78QxoAQrZAcEs2ANqKqQIwPqvRezCCUVNXfgYEr+uJ+zgERHxxJZH17l2cTJrKGwaxe1cLF+7M0K8n2J8OEM4rby+e0g3boXgI0OC4Y1g8GsmEIEQ+wUGX3rGoTRe4oIGvONk6NtpfIbFcXrDpd3Shuefoy9hEraNqj2jctgRl2aevdmjF2z+4AGNXBI50NlwlVpyHuVknEExa0BxwmJTdDyi7q4NMNhVIAwJwRjTlNpP1Z4mw5hhw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/yyqXSja/+MdHqdwABC3LLhHN8KMiQascLVGao0vTuwBJDHn2agkLTPVH2Cx/NkGzyIEeEmt7Xb3woXok/Km0ZlmhWEbYz6K9hBVFeIZBh9+0mhhYyYDNKAk47h7IyzAygRxbuwUP3+jR+tSf5c9gIMrrO+dDFwEDZpojJUiBo44/s/Gd8oPsMQPNOYPhGIV25V0E7uvEPAr7iwTYqtKt42mndfBIidK22j5oB0Dho2UtbQE2ntXumZxWtk6XK4G/awLZLnn0c9/ewzSRk9LI/1y/8Q0ErS8wY7x10z6K62yV9oSguODAuZutj0xEerYeyEUttZYj5Rj1+M62rN3COCL1ph/YUldLRjy/rtn1q9UumZrRBd6yan+IdQZk7XEgQxZVFC+Rd4wEogmhHlpd0iNAqfXVhef13Gf+4b3REp0+5Fm06+3m6jxHMq59CI5q7NyEYlz22APGWwmHpomceu2Uh4sKrps84Ao/In7/0ZY7NKZ6QqBSlHueMEkC06CMDuxBrzt65gO/TR4w4Hkob8o11lx/51Ip0mZB/LBg7dZN9sIatqjZdxroTIiLt/BdKOzvZRxLrd9hjJRWrYGHcon3pYsYk+T9lhiSOpW5/wZHEcZ3s/efr+acwab5x0g
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 07:00:56.2117
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 825b73d9-e5c0-4f17-eb24-08def12cf75e
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR16MB5909
X-Proofpoint-GUID: pvtjZgQwcI_eWl9TBq7J50Wys0Ft6DPv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA2MCBTYWx0ZWRfX2ExiIPB5yj91
 vlGuMp0GCiKpZWCoFx9yRvwk+TXBgwH6pxGgj7RpIgn5392V6pggkuWEe27xQR4FLUIqmyoIK52
 MsXoY5Vi/BjagaWaxHFTk8Pyfbg2FlL3PJxi87arPK6PNO1fF2a1XMPKu4pcimG/HoJaFJfH0Iz
 igM1MwHvspTVcRaW5ii8MwoOl7fsi702PAwoejPpQaQI7+ZxQuXHg2R5cBYHSjAPbOqonY1sBYq
 cL2NU6ByGtW13a6k9i35Ca6g8exIolVhBVM2ubR5kpkkUWZerx2mQIO5ijRWK4/d6/wMeddmE/J
 w+ZpPJrOQFYl7xQR7i3fUj5IZCDb2fXxqFy/WWKSgmm3UWFxzKZw7Sl+riW+YPVtBmb17pvnc/X
 LUfvRVmhVaQ7sFhm/sw/qe6B6F9Yvvto9jGLAS1KcKH+h149VBzVXrkFHmCgDXYPgiIz1xDMX3N
 noUDGbkyohNVBTOAukw==
X-Proofpoint-ORIG-GUID: pvtjZgQwcI_eWl9TBq7J50Wys0Ft6DPv
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA2MCBTYWx0ZWRfX0M1M0ZaywzAl
 RTIBj8mmEjjmsfgqbweY1y+OKXU4VchlsbdUm4KKC8R3ZD45s412n9/fv8DfeivJTc+Mr6euQDS
 jqVkyhQTSWkKwReYZXg0cyOHAmV2X1EZHgG5dp/TinqHcBPdVbf+
X-Authority-Analysis: v=2.4 cv=doPrzVg4 c=1 sm=1 tr=0 ts=6a703cb0 cx=c_pps
 a=qX5DP9EEIf1faxnBSU0rOg==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=AHe91QgOk3R4nFVtG5At:22 a=cbNQJ9GKAAAA:8
 a=iox4zFpeAAAA:8 a=SOBqYn4TATFuCMYqiXgA:9 a=DqJYxgmhk6moR-_7_KoZ:22
 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030060
X-purgate-ID: tlsNG-d25034/1785740466-76EDAA5B-3175B481/0/0
X-purgate-type: clean
X-purgate-size: 942

From: Denis Mukhin <dmukhin@ford.com> 

The hypervisor command line is not modified after initialization.
Annotate saved_cmdline with __ro_after_init to place it in the
dedicated read-only-after-init section.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v1:
- new patch
---
 xen/common/kernel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index fb45f8139995..d1bef9ac2b2b 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -34,7 +34,7 @@ bool __ro_after_init opt_dit = IS_ENABLED(CONFIG_DIT_DEFAULT);
 boolean_param("dit", opt_dit);
 #endif
 
-static xen_commandline_t saved_cmdline;
+static xen_commandline_t __ro_after_init saved_cmdline;
 static const char __initconst opt_builtin_cmdline[] = CONFIG_CMDLINE;
 char __ro_after_init xen_cap_info[128];
 
-- 
2.54.0


