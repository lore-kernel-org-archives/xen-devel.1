Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B1B606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=EhYkgCmb;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=dNo0IcD0;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=QndsomkN;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=TvyQYA3W
Received: from list by lists.xenproject.org with outflank-mailman.1473392.1681079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmQ6-0002j0-7k; Thu, 05 Nov 2026 01:37:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473392.1681079; Thu, 05 Nov 2026 01:37:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmQ6-0002hg-2M; Thu, 05 Nov 2026 01:37:38 +0000
Received: by outflank-mailman (input) for mailman id 1473392;
 Thu, 05 Nov 2026 01:37:37 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmQ4-0002Kd-NM
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:37:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmQ4-001xJk-3h
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:37:36 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdddf-8faa-0a2a0a5109dd-0a2a450b9320-0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:37:35 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdddd-b7e8-0a2a450b0019-94a3921721b8-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:37:34 +0100
Received: from pps.filterd (m0367124.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mcq01469823
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:37:33 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com
 (mail-centralusazon11010002.outbound.protection.outlook.com [52.101.61.2])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4hrdk5120t-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:37:32 +0000 (GMT)
Received: from CH5P221CA0001.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::6)
 by LV8PR16MB6149.namprd16.prod.outlook.com (2603:10b6:408:1ec::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 01:37:22 +0000
Received: from CH2PEPF00000145.namprd02.prod.outlook.com
 (2603:10b6:610:1f2:cafe::8) by CH5P221CA0001.outlook.office365.com
 (2603:10b6:610:1f2::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:37:22 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 CH2PEPF00000145.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:37:22 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mVLf059417
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:37:21 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4hnxy7wh7n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:37:21 -0500 (EST)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id OmPnxuj8Lz55iOmPoxXLbn; Thu, 05 Nov 2026 01:37:21 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=Ats
	0e9qcsuS0OWl1Vk48D5A1NngnKfkQlNlY/HvDBqI=; b=EhYkgCmbBNVBmrkdtlB
	3d/iC1nSNWb5Vm1rPyp1hwYX+M/dVX5GNmwr0kmCufu+8LksW+1W80GTTh+K6AYm
	CzYKeTtRnwRZSbsL/H1QOXmGFla+o3TDJXyjdPGHilwTeNXTcQzktCH+o0HIoiNK
	/iIFPKj+zmLmVcAF4OiOGnE8nKQ9N9J9kvFgWLva3GdDHnLtVuPj13wx6ZswcYrA
	h+N8kAdVu5TBCciyTJCbCOa/09EAcTqcn7E6Ye2cxffpEe5qyORuRE8cnMaDzYSq
	hxxn15WgR0S7L0R0j7kmvQzvbz9fGJFzNv5NP9cF14/LYBs/S5tmq9FKZ8efJFiS
	qpw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=krHV0HQPpkEGFEMFrTckdb/T4zO4+2S/IzbWmo3dMyeFeYoS9WKnfRKR+lG9TzvSknz9NstVqetjHbI5lnfGUQpA/E2jpFin+SQG4x9VPctXe4I6GZ6qNxO6+rSTAWzx688iCbUij8WuNSqm0c9gEbZi9WdZlCsUGgvyJhuZZj5H4qNtSP4hhqs+8CYluMcMkA9OgmlX3olo+pqkYOYrdseHgvo1uxOUTsiU1ZEGo1pAwHnFGeSJrbqNOB8/ilBPzwAAk9Jypc9AjXmY8XlbK5S6hxerVexIx9M5VpTKCGjiVxWwQtnAXE1l6TNxnExC3WmFEg9endNrCQ7YTJB0Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ats0e9qcsuS0OWl1Vk48D5A1NngnKfkQlNlY/HvDBqI=;
 b=QLN2lL5T7x7lHIpZbng2mE2iFarKV6sJDXxcm04ustjHzxRLNGOERHPu9loc2s27V5exDgr4bPCfh3H97jucpQDsfCJi+Cl6HwU5O8BYRT8c736XpmW+dqmrVV46gI0ljHxRyGErxBpgu8cpAEB1tWqNZBaB5pgJawR67RuQPjugkHSFmf2tv3yA/LyaJE05fNEXKDo9P4298Z/Ub9PsWlT2I1WNi4r6ntGHEeG9YbQHHf1C9rdlR4Xo9jfa/a5JVZ1wFzCtp+sqIHGoCO2naSNkLzzEVS9mNDseFK4LYwAvzyCelbipNsoEp8nHyQ5NVL6PvXbps6qmF1X9wDPpZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ats0e9qcsuS0OWl1Vk48D5A1NngnKfkQlNlY/HvDBqI=;
 b=dNo0IcD0/YfgcSivVPwz82t8T2uSuKZCHZBp15EQeekgOB0qiIgB0sv4b0nfyVmRniLmUckgUEWXQ8aeWgqJtd2/y5tj5IaqD0al3BzR5ikwDlit0sQmDOOX3IgGZxoymw4STR5BDVVOOzQM2UpOFBTWggFhFXxAnNefHmr+i9c=
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
	ppserprodsaar; bh=Ats0e9qcsuS0OWl1Vk48D5A1NngnKfkQlNlY/HvDBqI=; b=
	QndsomkNkoUCnt1OZKHJo/6Glz1GTbQSKkm+1MX4INnuxJcIwUx+RjuOPODl9Di9
	zc7J2Vs1f069uAykQplB0LAC1BrAEz0grES+VfyHbKWgLnpL/L8Lf6WI/ZGDZtOU
	HfSmdeucWUfFIVKaa03GZJwyBXnsPbnTbd1TCj6sPhWtObICCiXUK3QjPRXqaOeB
	6MSIj3gJMgJueKhPsiJ7ADvtHIPOxtTrxJE+x4OQ73LHgUs8yOEvnqnJ2qtw/hDe
	a5B5jI4WXqC2AP2qAeKUbaw275gpzku6c87ce9QC0GKyA19FTvFsrsoHfnWNwcC5
	FqN8HjcgYPvgfiULw49EnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=Ats0e9q
	csuS0OWl1Vk48D5A1NngnKfkQlNlY/HvDBqI=; b=TvyQYA3Wd/HJ4foUa/Mg5gg
	jgtpkIkDUrd5pHpx5wDGRcFp7Y93DZVnmqWKsw/A2FnvzlwGkhNgr9uClRlEMfow
	OU47EtP1bSSvg85NguOKVzVGv6GLuew+CvNfqOOGGGJTg4ehz/iw0lFwXNf1aOkR
	6b6qgZ5Z8JjKJx8yPyolO9OEu74q9LWoF5kacpO0zwr0Ajx5ZvJlppabKijlnyDs
	EwLnaUp9gBZ9rwAJssE9cHf39Hl2EPKZ7WEShn1OPmhKmbrcmtF5X0G2a0HcSNBr
	U9zFcuoRUSzwzZn2ealQ6AugqnzgyK7S4R+B0V4cqu80pxazli2I01vOtKVhShA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmPnxuj8Lz55iOmPoxXLbn
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 06/13] CI: enable binutils for alpine and debian containers
Date: Wed,  4 Nov 2026 17:36:54 -0800
Message-ID: <20261105013701.719658-7-dmukhin@ford.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105013701.719658-1-dmukhin@ford.com>
References: <20261105013701.719658-1-dmukhin@ford.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050005
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000145:EE_|LV8PR16MB6149:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8e60c9be-3017-48d8-97ec-08df3add5666
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|260925022911599003|260925021911599003|260925021311599003|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261022115727099003|261022075727099003|261026121527099003|261102123227099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	1LWnYal7Fnaagh5wciq5KERF3+lAu6buq6RPNKgwGOgakvrNHjnoutS17frwOLLu91v+Arpc8NdJaXejafx8lNT7e3Qz14r1ighGFbmYGRFXGecBFVEDMpwIgwqjxSG9GE1L1XoPLkMDk/DR86bIsdWKucptyGQWQ95SJy0FKjPsZuGywHaNNg0Q51dGRiH1WHXF/T9DzPMSzkmQ6xI8mVwsLGGWc5G3pFwX65jmBSqSZ5IF2ChF4jSjVAINDR/SxupKc2E77o9ekWUnBOOMkDfGxW5TzR27CORzt21LFjOUoWHVEHPVVX2+TCQ6KnIRL/RfdN973mtZ8+FjwkRQbgv7DwAq7PCyYZgvy+zeTWMKPi9LCruR9Cz14E3u8xaAB4SiDYGB1r4mLsrSsIlIUWsHCFxCyam13MEeUq1htY6GpFQX/jVpg3PJ00y4KKpqR62wjYdhax3p2PMdv1q2POCLPwc3s1EUDgp/uh14o1jvXRnZZMjEm0Iv0qWnoGP4iV+r+u7Ym7v+/yGxmBw7A7CSHCczH+4n7wjCMmVpWtd4eWnWkJfJKkIZpdTIzgD4+LeWq+nmK90la9aQFS7MK8vCpizVQCisyyuSBJJ25q8bFaeJ2FnDyWm478DF/YuRucZvjVJkB0/NfXnfPn9ocuRQXU/7AF+wWWNmQkw4WuL3ZwctbLslUQFk1hfoJygBef94QK4kcdl0TPBNOjRhyg==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(260925022911599003)(260925021911599003)(260925021311599003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261022115727099003)(261022075727099003)(261026121527099003)(261102123227099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kgqKQBdIWcx1xKOmntrsgX0Dt+RiweGUfvXrDUG/mssIu8QdjcUTWSXL9GpbIy2w/IBSQzvXNybACtIvxeu8yQb8RUYs3hY2svSysurEJjN1eT7y6CareuJzRwlHcgYSEQkn5UiAL0FvzGssCb9STRCyZ30/Cz3CjzZtO6/QiywMjCccLPXVQL03NSGGhg0o8Wos7NEO4GVCThgb8hMZ68TAJG6nFu1nAOqNJZPH6RUxHnsaTAxMA2/29yhjCyYc0SEwlvMeQt3XhAtT1C66Kl7NBWvtWnhVfCDBYa6DmtGbCVCthEJ91FSS2P5g8pggh+vqjSzjwq40l8HPP8icgR4KZDXn1XthrsGrJZGY2Dq+oZIJereno8fBklbvr7y+hkGb53Nd4w9ZxxJovmVNml5FBugAhRli1N6ZtrP7J8naVOJvNaDNcVLbtCTc4wIb
X-Exchange-RoutingPolicyChecked:
	n9QZA47WRfKwuV7jeTqUK4q9LdPGHVPasVRI2AX9uGk9g3EBxc8ARYVyyK/Sy6+QfDgyJCsfxPBgzPyt3xt26iAMh/emnxN3rFuy2XjNMMqrBKLp8Tg9BPS/bLcsN962I5o2F0z2b1rPqPEPlJgwhHMV4iNvKtm5uWu5wrExc4P3UY8jgVXb2VCYd9OwlmV3Hx7cWJrxkHrP1tolKa5s0pMFoVjl3Ovz2dgYzlWhOVzzqHsnPkPwj1uED4NghOGhqWcU+Bi2mmdzks7En1OL8wA2QYtaJkn0Nl6X8AD4OaSsmNxpcKwwJP3JPD5qPZ5256QcrWMVyGJjxkHznRbnYw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+EzKiBolm2yD+nHyFtDkuilaeiOJZ8wz89jVRi1b8SDgYnzUTBgruBoBp4Qs0YZ0GyQIW4ju+z3vYXeDOpJFFyo9WVg0CmUiWrdkfCMA6XUP4NW7+Cls3GHEXA7wGSD0ur9WO8P/3bf4XaQ+9QAbtWcgroHvJHg9ANHylJQe676V51r3leOI3VWdsVTTpkU73iiCqH5dKpa877duztdQ7ZNmfCQhjjN7ev8EpA+QbDGCzPYArSuSwWwzFmC6R9RWWVhyXToO+9j6kiKvpq3j6iAi+D46pDlYqC6ewWPRTXPm1fblPJIy02e0W9e3Rf0XU7lOnQQcq/WNe67ObgWd+OwymhWizDt/o+qOzTa/IyI4eT6E63yT68qhZuNYR2ysZcGWH5INmW9gzPUGCMQfkFUBOtb3ZIjMsVu7zuNwzLtonvJ5u9pPpau3TMKYkpR1BjB9n79+514DnzKtK1SFsx/KD34CwWRz6yHWmlmvfbC2XrXbIUqMmPmdoZJHUrUa2xIC34kWpxE6d6uvCGaJBnMltoEElXUbsf3j/uXbb6v8BZOcWQerTlUD3SUsAjRkEkj0FeFOnNWpq/cu38nK2JA+kHuxGK2Oj84CZSu2w8C42QyFsZCKP6JZcDxxec8bJb2JL/4XweUeo8+Vs0LQvQ==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:37:22.0196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e60c9be-3017-48d8-97ec-08df3add5666
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000145.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR16MB6149
X-Proofpoint-GUID: ktpeZN8BmRAW-SdQtCm1VcJnHpOiUeMQ
X-Proofpoint-ORIG-GUID: ktpeZN8BmRAW-SdQtCm1VcJnHpOiUeMQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfXxoE3BCqVVEHs
 lapkZ9Aw06V1VVqgGJ1KliPrAnKavUjEFrXAlK35pwWuiQ/znkIKSk2eqCQRqiGwEAO1CyCTcyG
 tt/MzdQdcnYsfcnzNuM5Zps3ww3dnkZxsYnKBcr0yOtZD0W2hhtF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX9LOq4xR8IwyU
 SXB8vPgoOII/8EfQCQI/oW77gtnhUxLmuzneEqFDy6Uv6rY70Y1e0tdTx20uy1kG7n240isQaSw
 L/lKm0KAnrkuWJ0GfwNWKm4/DopOI6KOWyvSbX5n3wPk/Phj+J/1TXZTLgTDd6PQlInZUP9vFzJ
 EEH5FExR6cmTfcP5NbHES5gehXfFV7VbIAgfm7woF4NNNWn2LxR1y5+L/7YVwe3TNcHsdtwlV2H
 WnuLBZKp6Gn4h62WElqEmzRsaLy0b7wTT+68XXnpuL/6YiPubcJ3JM5Dxvou0VKDxE1y053t0ij
 3B7koTwDS4ZQmLara41xZvYgQ+ApetTuZ9u2jIDIO2uKbHpMQwh5s6lgpReTV5l/Na2J2+AIe+D
 yqg1tbQ4jnB7p4IpsQTcidzPOUhvmDRmr0Y39dfUFDeys6/aWQ6B71xJQw6ugdg/xQM9aSVWzXr
 tDI1TZVmOICiBp8eS0w==
X-Authority-Analysis: v=2.4 cv=BOImP1QG c=1 sm=1 tr=0 ts=6aebdddc cx=c_pps
 a=h3cS895ItAADrFIx/0pANw==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=YJXg7OVxOWrJwj3yZo-i:22 a=cbNQJ9GKAAAA:8
 a=y7AnYa6Roqe19iSE5WAA:9 a=G69WFyCBNqGPyalROSdv:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050006
X-purgate-ID: tlsNG-42698a/1793842655-19EC69EA-DBA3E51B/0/0
X-purgate-type: clean
X-purgate-size: 2301
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Enable binutils for the docker images used for test runners
(e.g. 'readelf' may be useful for inspecting build artifacts).

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 automation/build/alpine/3.24-arm64v8.dockerfile | 3 +++
 automation/build/alpine/3.24-x86_64.dockerfile  | 3 +++
 automation/build/debian/12-arm64v8.dockerfile   | 3 +++
 automation/build/debian/13-x86_64.dockerfile    | 3 +++
 4 files changed, 12 insertions(+)

diff --git a/automation/build/alpine/3.24-arm64v8.dockerfile b/automation/build/alpine/3.24-arm64v8.dockerfile
index 5b28d874efae..7952005141fc 100644
--- a/automation/build/alpine/3.24-arm64v8.dockerfile
+++ b/automation/build/alpine/3.24-arm64v8.dockerfile
@@ -44,6 +44,9 @@ RUN <<EOF
         # Ocaml bindings/oxenstored
         ocaml
         ocaml-findlib
+
+        # XTF
+        binutils
     )
 
     apk add --no-cache "${DEPS[@]}"
diff --git a/automation/build/alpine/3.24-x86_64.dockerfile b/automation/build/alpine/3.24-x86_64.dockerfile
index f93158e0186d..e7bb73b05044 100644
--- a/automation/build/alpine/3.24-x86_64.dockerfile
+++ b/automation/build/alpine/3.24-x86_64.dockerfile
@@ -56,6 +56,9 @@ RUN <<EOF
 
         # livepatch-tools deps
         elfutils-dev
+
+        # XTF
+        binutils
     )
 
     apk add --no-cache "${DEPS[@]}"
diff --git a/automation/build/debian/12-arm64v8.dockerfile b/automation/build/debian/12-arm64v8.dockerfile
index 5cc4de822cc6..6003a8eef0c6 100644
--- a/automation/build/debian/12-arm64v8.dockerfile
+++ b/automation/build/debian/12-arm64v8.dockerfile
@@ -58,6 +58,9 @@ RUN <<EOF
         ovmf
         u-boot-qemu
         u-boot-tools
+
+        # XTF
+        binutils
     )
 
     apt-get -y --no-install-recommends install "${DEPS[@]}"
diff --git a/automation/build/debian/13-x86_64.dockerfile b/automation/build/debian/13-x86_64.dockerfile
index 784299d52dc3..f11085685a37 100644
--- a/automation/build/debian/13-x86_64.dockerfile
+++ b/automation/build/debian/13-x86_64.dockerfile
@@ -62,6 +62,9 @@ RUN <<EOF
 
         # for build-each-commit-gcc
         ccache
+
+        # XTF
+        binutils
     )
 
     apt-get -y --no-install-recommends install "${DEPS[@]}"
-- 
2.55.0


