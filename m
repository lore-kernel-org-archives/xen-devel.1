Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E6BC5CFCF
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2026 01:02:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1390563.1630870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wugJW-0004qt-8D; Fri, 14 Aug 2026 01:02:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1390563.1630870; Fri, 14 Aug 2026 01:02:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wugJW-0004ql-2d; Fri, 14 Aug 2026 01:02:26 +0000
Received: by outflank-mailman (input) for mailman id 1390563;
 Fri, 14 Aug 2026 01:02:25 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wugJU-0004qU-9S
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 01:02:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wugJS-00Ax13-LO
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 03:02:22 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a7e68dd-2eae-0a2a0a5409dd-0a2a4504a1e6-40
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 03:02:18 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a7e6918-b57f-0a2a45040019-94a38ff184f0-3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 03:02:17 +0200
Received: from pps.filterd (m0482515.ppops.net [127.0.0.1])
 by m0482515.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67E0NNAK1611249
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 18:02:15 -0700
Received: from dm1pr04cu001.outbound.protection.outlook.com
 (mail-centralusazon11010070.outbound.protection.outlook.com [52.101.61.70])
 by m0482515.ppops.net (PPS) with ESMTPS id 4g1nbh9seb-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 18:02:15 -0700 (PDT)
Received: from MN0PR04CA0020.namprd04.prod.outlook.com (2603:10b6:208:52d::19)
 by MW3PR16MB3643.namprd16.prod.outlook.com (2603:10b6:303:4d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Fri, 14 Aug
 2026 01:02:12 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:52d:cafe::40) by MN0PR04CA0020.outlook.office365.com
 (2603:10b6:208:52d::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.15 via Frontend Transport; Fri,
 14 Aug 2026 01:02:12 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Fri, 14 Aug 2026 01:02:12 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67E10X5I1155656
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 21:02:11 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4fxk37p5pt-24
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 21:02:11 -0400 (EDT)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id ugJEw3oHNgCzqugJFwvxzb; Fri, 14 Aug 2026 01:02:11 +0000
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
	:mime-version:subject:to; s=ppford; bh=dPlCYlfRqOhy/3ft3EqkHC5b0
	wVGtmZIu46YJD3f2eE=; b=ERAK38olTBjQOygXVkYM1q7fYNSzEdAIBfzfjqmGl
	SnDuheXkODoE3WdSxL7meIAvZnMFWcThEytRqUBRtzdLdHOzLpAqEXyledDyUBzA
	fVYVDs23WrmKEaqjNE6NJkfpIDImFw07KyGOEC4wqDQMFiK3VukzmNAKHB0UzD7h
	p9j8kbIFV0p6Tlp0Ke/tkFOcjlhoT3ougTqEfGEawz7vPTD27f6cAfFwaY/tCkLw
	k3xOp7RllSkFBj2uXkGUfQK0VXXLqjruaf+6poB1XHAYkHHc4zrhJkVtA7b+O+I3
	2aMIj8DB4jSkdI5/vXpOKgFGzyIIvqWna5HPIq3xsrYhw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PkFmc7XHBQmKhOtYKJjDgbDDU1h6fVBFrfC+xk2h7vOjhR1qLgitOap+glNZGNozUusDn9pCAamumHkrSoqQJ+p60s+t4QTXuBHh4yOyawIJDfwwCCZ9UIP2oyRozHkA7WF8C22Fx/vZ/S979CclL+hgKOhB4vSnk+/YAa/jPij7ypQbjMML6lGZtsGbSDKR9jYTJtLLu7543JvV5vhEKtXkMBxvejX6QM1etCJ16BunItIFSlK0fJj2kx/nR+h/VGLIwqJxWiTwjNeQl6ywlryoxSDWeVG0iOLF0GLmSuR9dwEHXM824kiSjYMKg0hqMhA6fY95vydrO/CD60kWgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPlCYlfRqOhy/3ft3EqkHC5b0wVGtmZIu46YJD3f2eE=;
 b=Sxc3+8Y94qYeaXPSHzcFuiEhHRdj0vcZyIlnFFLaFKx+pL04e2jneuo/R2YZyZTFl4i47Bv1rV0gM3pmw5CizezhVZqe4ihjvspez/lhy1KBkMWltec8Yaki232AsEKIadI6vkewI0q/ooSFbjCZZFLw8fp9053ZuEM6B4yh2q0l1v2CXzIAYser7LkAWwa0wuW6culiIJKET5gmIwYvQRIVNw1l1jkrkm0Lbr8zOClm358Vmg7JwrycGTx/sffjkhpSBfuox5KH43ejwTOKRmTnIp4jneqGY03bF0YVts+Mwu/PkeQzDC05/bcHQEw71TlV5zSMgMq537GNupfSgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPlCYlfRqOhy/3ft3EqkHC5b0wVGtmZIu46YJD3f2eE=;
 b=EJgbWCb9xJWXHn2g5QhZmWp55JbhF50VCY0wb0rW5oCVj1ds9lV7fkVnHym4IJtwD1gQhdfPJ9GFnZpX7hqNrOmsGwpPSbWnt9VKChd2ryHGvoi5d2+zu5pDfK6YITVk9GoKkiRGez1gdhTfAhCJ/lvyHttmnQ0/JMesRJC3mlg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to; s=ppserprodsaar; bh=dPlCYlf
	RqOhy/3ft3EqkHC5b0wVGtmZIu46YJD3f2eE=; b=jyyTCRSlK3ZxXeJXYc8gR6R
	e1w6DwgWEphGde6rIxJkMqB3fT4nbU+eIzD3tAC5mZaWgGWMr7++/0YZbmFV3F+W
	TlrjQhRNDz2AuiWIDNnqHVhP9FFZ5Hbv8vIcCvhT0BWVVsFE/UsRzRZtG4Bzi/12
	fmSgee4BMm+OLpLCAtZV5Nc+/d45X52mJr7WzZBRHl7x+xO2bObkfNI7gdvd0cKm
	1eHZXUz0bPngNlb7iY45RMeDWA/gY+mXHuGjJ0hN3fWu5jzKxtESSm8ZcdqMEx82
	1vGyOPwh6GC41n7lq39G2wJfPeSqpA9ivB7faRw0ybRa9Rk4l8Iic5+/MfjYtEw=
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=ppfserpocford; bh=dPlCYlfRqOhy/3ft3EqkHC5b0wVGtmZ
	Iu46YJD3f2eE=; b=ULtLA1za7c2RVYF7IDTO5GDwjiUK7ibqSPgM2FDFnZO2uTR
	RqOdUxveTZokdHLzsiSyoJzzVfB/F2bSUWmNmxA1Dk6jzKtmhABdpdDmo0MKk+tR
	RFUn3NdHMXVigANBP/K5Z3LjFUiwh6knJDyENxd3DZVbK1LwlI3U1coS67isYw7A
	CLnPFJHG+DGLKahIF4WiixX0v7oixSHKMFdcVumO5j+WacpCmfYIxOc8uoic7q/j
	7dwCNXwmMSauwPaz+3Lt6fb+3J+mxcRDZaI76dWfIH1l97liozVE4DmmrJJ+e/FI
	iCS6VKJCE6iWzRo2V04wnlD1zQO5re67chw0Ujw==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: ugJEw3oHNgCzqugJFwvxzb
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v6 0/2] add keyhandler to show Xen command line
Date: Thu, 13 Aug 2026 18:02:04 -0700
Message-ID: <20260814010206.1321724-1-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140006
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|MW3PR16MB3643:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 88e64606-c2d6-4b31-605e-08def99fac8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|23010399003|36860700016|1800799024|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZGprwLDv7Cj5voNdeKjaf1jRwqWsKZ2wJZKun5w7ToM2k5toZx1PHiEqdooKMNX56xg3sn9aMfA908rSpVRIT0c1llCdvNY3mX9q+hQR5tncoKZHM5UT4bYvK0cEmzfAkeTm4EQG+ItNCQiCLmz0TTjk40jfSwAw6ziUBLNP7qCxk00NQE2XccK5HTGeFMhjKx8EkMZHo0bmy/26Lo0Vz+kxW1XB+Myfe/kWByVxTxAppbLP56w875U+7PA+/64oJN9FYVcm+qySbqiiDs5KWYfBgn/qjEgHKr9JH/apB+h47qq6MPooQKAbCfU4JT4Lh7TK9sXsbXgz5Y5oEFEfN6sIdh5txiWQ5WjZu/JUDhRUkWdXR3KQp/pYtGlCbon+pNF+6/4kYXYfsM0LanudfduyYTXq7CG78FsFe2C8L9o61XaHhmlpTq/FqjvARd0N3/2f+xF8FyL74bAfutmn3dOo1K15paaFFp3U7yFviKkDQk8F2DcwhXSmPqGBWhYx3Lswb35V+C0hQpqL9xQLXgUR5ipPs+AFoX1qCjmCCf/dNT4pzx6YwCSEiv+FWoElYhPsV6K9f1Q4jbyZDRM1Y3yyXLzwi6ldMDCvVpREtUNr0w9VJYN+g//8UycbemYfDwi/PRF1uA9r1AjF0vPOq7kR/XZMDiKJRLEyBDSxEhmZWvYiBkgmM3F/p18cZADEEKSl5kcb7cblwNdidqB0Ow==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(36860700016)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	exe2U+konhNI8Q+M2EUlJZuteS9LFpuau+tr4p+piMWgnw7uzC81ldEtAfimSY2toxkyJDUS/9AH/rhv0NuIbHBl9DbcJc/Wae9Py0VudQHdVF/ueVDpgaHIhQ6IjjRo9PvQ76UdrtiiflKixAD4FEDNbyztSMbKpIRrk1XonjAhpnsPt5jqrs5fDAW+R79Y3zuBZNw/IiFFcFbWqTkLd6uYrwoFMkYOvBpEqENTgXp2kCs9XAviaVeOjESC7C8oCsGRA0uCboyZdAXdjLNyYywTJhX8Os9ACuW1z5Hqf0r4oFXGGffVwL2vj/ulUYRlWc2qaI1vBmrY2GEyciFYm+s/fJ6j2lwpUjv8TtYiXyn2hbcryYk3cMLLchvThRZEGkc4U4c1jKqKg7IOedmGtzRELsAhLNAsOn7Ifd6RsFseHtYdUgX2zagVkBJHjCFT
X-Exchange-RoutingPolicyChecked:
	cexAKZlNM0810BcOgaYC27Y8KMDYdG9ODw5AS1+vDekaliMCwgY/wck2ZacCzwXfFOWrueJ3AWGMEQpZttS+ts55Pg78smeKki21DZYHHuGTkC4uSra8SyXVJx41CVrReZncYWNio9B2z0rsebmFHaUB9rq634Q8L4a+F/n+//rRu4ZiM8K18e3M+KlEcU/c44UQMjqsAlzW0qbLNWm9W7fuA0Et1z2d9FtathB5Jp7YAitXa+ToqDIMWF1UVXvngy3vkKUkP0S/JYAo8IzgKUrwoLtRx4hoeH6RoKVuRJyDIqa9lsiYMrA6SgXq5pGiFev1+1F21+qLv4jdg2JKuQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cCoVt/nCynbwLztaYDYi+UJho3fYrwq/+429FtzgHYH5oM+HcQhgbg0Ya/K+ucYSf/i1DZTAlCVD8TADFTaJ6puwcAa174EAeV7ZivSZS50yf4S8Ubst2Kvv6HpNgGJFKSxlRM8MSmE1H0ymosi2D9WNiTldAKgP8EBlkXMC+KTncoD5QDAy/mgTCcnrPpvvSlP7verjustTrQltmLZpFJUCgt6HX+7bIlo2HzvIeHKBMGHdkHdWG5hKYy6PivdsOdfrJwxiDaYQh0PcLlD1UahYe93IGQ2wSUNJmMlGXDBpvWOWoCt+KmhumdKVv2P7KFIb/h6UOAqNkUn5pwrJWX0scsiNxr0ddV1DtPJjS2iyC+RwAI6iyuN/a0XwSiLuB7esQjmTmVD1RAhRTZzYZIMLV5eetmapf+6Lt04q3JWaRHX3OuSKzgn4AS+cW4TTBerN2SLkrI5ZFMIdUiXcnpZqYbhqfQxYIR8LSPmUrwmJWZaDmeOGgAoNczepuh+jMiLfPHelTHzmAWNWzuCLOCpb/EA6megGQ8/JU7GacnZYpQrvCeLp867AlIQTddcUKll6pJOBieOscPsO7Dq3TYVYFtm5Xty0kIbXFMbgmei9l0h0WgR9EZgxzP/KVYOg/X8Px0L7lpv+Ni+LixncSw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 01:02:12.2206
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88e64606-c2d6-4b31-605e-08def99fac8d
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR16MB3643
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDAwNiBTYWx0ZWRfX/c36BpTmXkvC
 JkiGTBvQOPtx+IS71enAkRPBC3RrM5fkcC/gZU+cLzvqY2Qr0ZzlMajNBXcKiDE4wVrB+ZSG6DO
 P1T/P5J4AF2WYIEvz4QsvOTlujnSEglfwRcSw/XzfCXjO2UBcV1BPXEVSCFUyC+socJSylKi5pT
 5C4HTJvlXmgGe1Bd3a5IszBvnu3w+FGvLbj4s5Gix9m/EaV0SY478owSbbQevWiQrHcJwsAB7mv
 qjhyR44rUTFinJPiTte52OjXtLWT72JFQ6X5QPaxduz+MoQ47dnJ41OThYnRmYdMv8nDAR5VPWv
 AWBfgV0b3A8viIfeWzSU5GaMP6/nQo6Wy02xN1DznbhrSXdwIeath952g8wh62JYnktzEW6aRoi
 fNnJ16RQLNSDLJJJ3k2o0EOadelch3INutPbWU3JCW0LAhZ+QZ2514IFkTJoBDIPqJCoQyCP/bH
 lsVMOVZdf+QQZNRhoAQ==
X-Proofpoint-ORIG-GUID: uYiG-cXXEA2A1q1b5PWJhQTAywcwZd_F
X-Proofpoint-GUID: uYiG-cXXEA2A1q1b5PWJhQTAywcwZd_F
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDAwNiBTYWx0ZWRfX15gTEhqYjrWy
 HWsqk1USTnQeGYdxbt78gg8+qnRBuET0xYSnsaS1QmWvHF9ixqBeb6GEL20tkzhGdZSr3GFWGlD
 JIO8ZHTefOzR56Y9WCTGA6aPzVv9iYUV001eWQO+OW4rc4mNH87D
X-Authority-Analysis: v=2.4 cv=KZHidwYD c=1 sm=1 tr=0 ts=6a7e6917 cx=c_pps
 a=xHwt0NLWInP9jDJIu2hPAg==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=0GA0A_IKJoUHBEAzNTkD:22 a=VwQbUJbxAAAA:8
 a=cbNQJ9GKAAAA:8 a=p0WdMEafAAAA:8 a=wqEq80CTKEgO30SQpmUA:9
 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 clxscore=1015 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140006
X-purgate-ID: tlsNG-ebf023/1786669338-C0CDFB50-D0417E68/0/0
X-purgate-type: clean
X-purgate-size: 609

Mini-series to add new keyhander '?' for showing system information,
including command line and version info.

v5: https://lore.kernel.org/xen-devel/20260813035139.915536-2-dmukhin@ford.com/
CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2758940285

Denis Mukhin (2):
  xen/common: add keyhandler to show Xen command line
  xen/common: move version printout under '?' keyhandler

 xen/common/kernel.c     | 20 +++++++++++++++++++-
 xen/common/keyhandler.c | 14 +++++++++++---
 xen/include/xen/lib.h   |  1 +
 3 files changed, 31 insertions(+), 4 deletions(-)

-- 
2.54.0


