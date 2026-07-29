Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 582E9C54F55
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 07:25:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375210.1622426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woyfZ-0006PN-HC; Wed, 29 Jul 2026 07:25:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375210.1622426; Wed, 29 Jul 2026 07:25:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woyfZ-0006PG-EW; Wed, 29 Jul 2026 07:25:37 +0000
Received: by outflank-mailman (input) for mailman id 1375210;
 Wed, 29 Jul 2026 07:25:36 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1woyfX-0006P5-NL
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 07:25:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woyfW-001hkJ-Rv
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 09:25:34 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a69aae8-bab6-0a2a0a5309dd-0a2a4503cbd6-24
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 09:25:34 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a69aaec-fae8-0a2a45030019-94a39217c184-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 09:25:34 +0200
Received: from pps.filterd (m0384718.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66T73r7T328964
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 07:25:32 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com
 (mail-westus2azon11012066.outbound.protection.outlook.com [52.101.48.66])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4fq8k8hpcv-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 07:25:32 +0000 (GMT)
Received: from BY3PR05CA0034.namprd05.prod.outlook.com (2603:10b6:a03:39b::9)
 by CO6PR16MB4258.namprd16.prod.outlook.com (2603:10b6:303:ac::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 07:25:29 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::84) by BY3PR05CA0034.outlook.office365.com
 (2603:10b6:a03:39b::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Wed,
 29 Jul 2026 07:25:28 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Wed, 29 Jul 2026 07:25:28 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66T4eI3M3315476
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 03:25:28 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4fnc7qcapq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 03:25:27 -0400 (EDT)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id oyfNwCp091FgloyfOwSkg8; Wed, 29 Jul 2026 07:25:27 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=5JO
	3BAzhqckGmmnhQpN4I9aCz+F5+1HfZtzpqhvcsCc=; b=ojuk2jTh3aunHjtN/OZ
	JkvN3Mld7hK8gHKjmqFHGCJLX0v0HZcdLM8lBWo5rn//J/PZQV0as/m3DOTILNpL
	URwVF1LVsG4/R8DylZEs7d1Hha6W5ihQOPvshjcWscFK6aZ8eEVYgRWg5ylPKFon
	0OnZWcF4+HV/ds1QfMVlcDl5Ub3ddMJmBZW5nyrm1saZCdYCb7eF/uvX/UWUNgdz
	Fa+Gly+aLFs7n0DASsyiDX+mfKvwTaHya3oTrWDCnp23Y6kWUVpIcQqWqOVLHW1O
	RXmQj5YjdCiawZEYiep4azmhY6SF4U7gwStmH9qnSSUsJ9HfjielpjgNLTvZNYRt
	P/w==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aoDxM80Gadt+JCzQKmG/xAqCam/DwgWyA0eTt6RVg7LXwkXnmMnTMhJpgzcIYJi9uarjPau7FXFvzCke3TUmH7JV9MzZmvNKTDGPIaJVv/rJEvPL80Tk2xkXvsoe4L1PRD9SWJlt8ai2YQvsblJJT7IgQJRZB0h7xL96q9DI6UZVS6/qVuTMdxbbQTWv5Prz3lSyifj/EYM/aLIW0ZQAFoS07BGiqE0aBZCQLUdNTX9FatkJ53R5z1UdPTYSYLBB+Q4jrXlLqQY/EiPpXKPGznlX3Vwt7koC1bviIPMyMT5krxC1D06TIdKc+l33dqO1NPH7saLS2E0/+lXUgVf14Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5JO3BAzhqckGmmnhQpN4I9aCz+F5+1HfZtzpqhvcsCc=;
 b=emy44zpkXIhe0zykuMLjB22m9QwNeI/alwJuX89em2l0x0r0x4VFd+AQ0TKWjn8LH2InSp8Y4YCaEgVjsFvmQTrSmhHoJHgOMx0xvEAfMEPUwPcNsl1JbrkaNyblh/PhNFLZJpmG1CkdIIdIlx14v9aXutNBpcWLJKV3sbBvKmdsIjcGs5tjkwhECXVIxPW79Omy5D8KGXTSI+vx7vzPDtUnsJn/H3AOTrQMqVc+HhyJKGraDmeP0leVmgOMlySsSCuJz2CMfd1ZLkLC5+98jiylq8fVRCV3YI5Qbsn0QzJ9m4o26v3THbZ7jZzSlM9PO9uIPhODAOY5QDLgMmdMmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5JO3BAzhqckGmmnhQpN4I9aCz+F5+1HfZtzpqhvcsCc=;
 b=JlHBuokBEuO4ss1AqkSvUcVj46pNUVJg5BnrizPwZhjdV8sFgcJonwZHUqyI0+ATZQOmhIwzmaOFYhU2eEgeCYWwq4ELIGMpLjVuOLsBq5alP+ObvDI6cY+ArTkociDshrvbeqWQJn+K6rkROcpAQbkr+niGKvnBS4fmXWbzmDs=
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
	ppserprodsaar; bh=5JO3BAzhqckGmmnhQpN4I9aCz+F5+1HfZtzpqhvcsCc=; b=
	d82AFjk6dRXFn1wUV6qwye+lGIfYLMiaGU6DbyxNL8+XxpU2Tvydga4ob1romrzE
	GtZLK+we7tptJTvqAwbXDehOF9Qp5MbRR+O4V3ySxOsG/6/inksnvZTSTAKHABBs
	+weBXUN0EXctmXK85bV8SQ0ZwsGfEvCtBZQUHd45fKjHUk6qzthW9JqFr5UCW4IG
	2rt9XImEeG3WOZTI8kz1KiBwnUMCqpRXVQosHUOUIBHvlXrasvTqkccM2b8EUBJ3
	dub2pbuL4B35kMLessfowUldzqsE8Xn1Y3HLG6ppHiUwZ4fI97YRr2tTA+uhMz28
	PtTvTwoV/LONfR3bba0rdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=5JO3BAz
	hqckGmmnhQpN4I9aCz+F5+1HfZtzpqhvcsCc=; b=WdIDGdc7CcLPOZWLcxUlpcq
	o5d/OfrRBwC8JqtYyV+bgKYttBw9jqCfshmysRMfabT60mDxnkDQla+1i4XGphvr
	D+CTFqs1drHIOd7nGcK/N/sWPpOmelgNDnnWXWNpYwiN5vmLD36wiFJ+Y/Qaec1d
	Ri20TNi8GRMmJI/unfjBXAV7jgUrMqQ6IxwstLyJM14R5NK8mHjeTuL6KGd9HIvs
	Qoy9wy1+UAcds8erN684AvKH5h5Lyo4SbVXIqQp/L6QYDKe+bmgS5QzBe9nVIX89
	lBk0EDfcK0Tyoz0nzsCxRawWKUQtgM/Okq1/s/7RhWMvUJ/LGBNSB0nf5Nz0CWw=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: oyfNwCp091FgloyfOwSkg8
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v4 1/2] xen/console: correct leaky-bucket rate limiter
Date: Wed, 29 Jul 2026 00:25:19 -0700
Message-ID: <20260729072520.1556970-2-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260729072520.1556970-1-dmukhin@ford.com>
References: <20260729072520.1556970-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_02,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290058
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|CO6PR16MB4258:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c4e78184-b43c-47be-bae9-08deed4290a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|36860700016|376014|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	UYQ9KKSNwLmJR8jXlPxf7mpdgzh2dzT1hXKHYwbsdtkudVUjcZ8v927rBKUYEzJGRgSSCqYHwY4xeEs8MJJRSUzMjlQoidQPfP0GxzlZN0PERJEtFEfqdUmoX2jU1KbbvevZW0eZBv8/qwoofFlNcDXV1COjdN0eYg13AvZyC4T0igEXfg1Hq+9rxbKDrKy3/kfSD9OSlIh4XQIDXKS6OXusjo1L1v8fX9geBfrTCPW51B2rALq6JXEeJJlpfJz4rSkmGpYtaItmO8/vNRoY85SEtIQBPUE476ILh7U+OeSY/KfrGj5rUYS1N6kGXzBFtCH6O1AuRd71HnCHvKf6/7hOrIpj4aqZX6mBeLoaQDGOae/VvGtxUpdntjmPMwioqTjI7a6I5ot5DdLJVD7uCMpYvvdAorD1QZV6jvhHqcd4ppxsdtxG5U5IwY8E+OD6Z32kgojEFRl8p6r8maYXEv6NHA0m3obzLtQVST48wU7gVZsLU8PpGtaWasK2TrGk6XVLAYmS6QQkHtFXCwmkpC83bd8M1aKL5F8yGyDtoUB4Lx96E6oQ3KDmZ+loGFSyn40Hjm4g3NhATKsmDs3sic+h3XxLxYAk9j/aLNdQmDvBlpRCWHae4qqnnm9DpmqamLJeVr7EQwJDHpGEA7iAOEAozkVmzHT3+I+Ybj6Z1Nq47gdLoMtPcTqIG5l461r/iFIA/T85e9TWYvo727D58g==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(36860700016)(376014)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fyQrw9t6jCJL5tMZp7SM1C7KXVPZmKzYwU05RfySTjONUJUe8JK88O0IB5oxvMpen6CYnVo4C13wQa67SH0bDvcnO+DkjCZ7EmpOQr+15nY9ew7lYgDFGTk8TX/PrPr3RKnxQx3Dd6klKNwaMRSgXAl0qqD+qGyCfDpruaI37KjddOMWVYqyOX2QEXf42r+IZqs2XlDSma+kyMZHDZWiqey3O8NmGh+81q/hqNlFjliNf8U003T1miRfUwQvLrVzDI5IctVVkUK3dmifetkSoFd3A85Ip/4xthI4fXBu4WNImBCdA3VGur/THk9XArE3uZbZjVv/l5BgR9gs195SVctg0CG5uFdNPSNlU5oUpYL/kj2c/JrWr9y2DKb5fTV1dKmeP9lSKjkQdAttTC5AF4aKWZVTji5JXMI3nbdSOtlxHk/XIMgN43OLXL6WFqFj
X-Exchange-RoutingPolicyChecked:
	TG85h6fFFAo6cISSmbNIVdseIxbcw4RaH+wnIfVTIifj/Fk3O7vqyvGCVxTTDTkPTRi9QMAARoeEH9plFu0uihHip6OoZ3jrTNZ4mp6topqoFZiVchuptUtH/L6+mZK96CoA2OF5O5hE7ZL4ZmQyEstqWVC1+y/F34aNmJ90/feKmxnlhid4xkwJqXE9VN0xvwSfpMUAoqJaA6KqGXKwAlZ4d3sCz2rM9SeaUaNd+oe5AjV8TuJ82wfkrL3G6NRAPHTt1NlaDmWfYoMUy3x7p0IuUFvUkJpTqVYN03kfWiWQLNksJqWpwsquveeZ7tp3Cd0RfClFuMi4z+JYdvNlOg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vuia/lOiZKu5TCdvtPAGa3A8NlZH+Zit1jxWRSm8k1bFVfibAINfAIEgY+e7S98HPnC/qF899fiJfQIT6dBaBVYaZfgNINAC1TcVASUA727RP+1nl/iUcUgqZ0DzexNhn5RsybX3lWPnait/x0pCHJxGg9O9eBPd1Y85D5SZxOOmKHjeouqxxPBGr1YIW88lh40BBqmdqJay5f6TvSVeSFuxvSWS3ebI/VOlc1lw84pivVECTCA/mhmjyMdcV2l4yk4Ib1hyCPRcEV7UHEMCxYn49uDBcY97EMux0XUXYV25kRd0MIfMzjGmbjvMRuRcdhoyLKT0tS7Jmj4sDsUSij20uIwH0DgVbhpZr/i+0HJUxZg4Pq65SrI53Jp1KlqMs7WXBuQAd8CPqvMISeQs3CMK2snBOudnK/Kjj9jtaa5T56UJUum/IArE0CwQbTP7CGianwILzPWe/bNZs/c8l7Uq6YaVJc70GyOIZofX0foWhYdoHVHICl9rmNRNdLcPyJM0FlzX8nnGx0AfP/B6mch6rgZXGuuT8U4xYbEVDsbFMpGUVak68Ch19zUKDe86xFussY+F25qfVRvOp7MEA9JSDnlrj01CbPsg7uasPdKUEmEyHAOWr/cnXl7zOr7/dKqdTPuD8JgnsJzByxMGOw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 07:25:28.3181
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4e78184-b43c-47be-bae9-08deed4290a6
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR16MB4258
X-Proofpoint-GUID: fJ4wOrFi2x6HYP_-SB7TjlpynkJBjdG9
X-Authority-Analysis: v=2.4 cv=JaiMa0KV c=1 sm=1 tr=0 ts=6a69aaec cx=c_pps
 a=iFPpiVoc/n5aJfOMV5u8/w==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=ARvDHhclS48edyKYUbLB:22 a=cbNQJ9GKAAAA:8
 a=Ur7VaZulqHfjkGLC-EMA:9 a=3whSkbs7g9Me0DR5EJEX:22
X-Proofpoint-ORIG-GUID: fJ4wOrFi2x6HYP_-SB7TjlpynkJBjdG9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA1OSBTYWx0ZWRfX87HCaKu+a/+l
 WVB7XsXWHD4NxfGAdw3afcY2kvez/f9bDKzeYJ6FshgUuxn4grIZr6PPNmjiWXzoNyB8ATUFQUe
 xH0fdL5ix7lk7dCvNu1ZKvrGuE37yqItVrUt10nI9B6fogfVEukG/cXajdJOHfrFKLaaf0lflJP
 79If4TZi0S1sApDe5DnxWgbD/KFQTLuy+op0MOwfFQUlJO1aWWicyUpgh8Ce6nzQnBul+UDgQ76
 aYKqrIZH0sfQPqSqAUVQ+tJMWuEB7KqQYX6fy9UpPLRMwEQirL3FY5+cPfHYVuL/Rb1gzmnMHaW
 LbDFst4aVlUuynTdbl9s4JTIsVI7pOwlX/9DWtZ90a4Uq/HmjfNh20RDSt0tTlYxMs1IB/FUGST
 rcxFJgvR6EDil/P+VIJpKp9jqKlX6f2gk8YfSTyxDYMz9zFunNxrGAkvnRzIejWQJbMxFRilfEz
 5riKyOvskv7Z3NuNoRQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA1OSBTYWx0ZWRfX845zT//XBv0D
 aWR0MEU7x8OXZB15uGM3LXBLr5NsVsVoU5WswJHB1TtsjTstvbFNr4Rxqgf2188HHjiAkUVyKot
 DERe8X8XxJNZZ48XbxTX36c3Ck33uJB3f5WbjTertNyz5SP+8oYA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_02,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290059
X-purgate-ID: tlsNG-33051d/1785309934-77AF14E9-99BF3923/0/0
X-purgate-type: clean
X-purgate-size: 2621

From: Denis Mukhin <dmukhin@ford.com> 

Use existing 'ratelimit_ms' and 'ratelimit_burst' variables in
do_printk_ratelimit() instead of hardcoded values 5000 and 10 respectively.

Ensure rate limiter is disabled if either 'ratelimit_ms' or 'ratelimit_burst'
is 0.

Account for integer overflow in the rate-limiter logic.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v3:
- fixed types
- fixed integer division logic - I used DIM_MUL2() from xvmalloc.h
  I hope this is fine given another pending patch which will include xvmalloc.h
  for heap allocations
- fixed potential problem w/ overflow of toks (introduced elapsed)
- fixed potential problem with toks == 0 which is also "uninitialized"
  state.
---
 xen/drivers/char/console.c | 37 ++++++++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index ea4e3ff34178..76a1681670c1 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -33,6 +33,7 @@
 #include <asm/setup.h>
 #include <xen/sections.h>
 #include <xen/consoled.h>
+#include <xen/xvmalloc.h>
 
 #ifdef CONFIG_X86
 #include <asm/guest.h>
@@ -1286,21 +1287,43 @@ bool __printk_ratelimit(unsigned int ratelimit_ms,
                         unsigned int ratelimit_burst)
 {
     static DEFINE_SPINLOCK(ratelimit_lock);
-    static unsigned long toks = 10 * 5 * 1000;
+    static unsigned long toks;
     static unsigned long last_msg;
     static unsigned int missed;
+    static bool initialized;
+    unsigned long limit;
     unsigned long flags;
-    unsigned long long now = NOW(); /* ns */
     unsigned long ms;
+    s_time_t now;
 
-    do_div(now, 1000000);
-    ms = (unsigned long)now;
+    if ( !ratelimit_ms || !ratelimit_burst )
+        return true;
+
+    limit = DIM_MUL2(ratelimit_burst, ratelimit_ms);
+
+    now = NOW(); /* ns */
+    do_div(now, MILLISECS(1));
+    ms = now;
 
     spin_lock_irqsave(&ratelimit_lock, flags);
-    toks += ms - last_msg;
+
+    if ( initialized )
+    {
+        unsigned long elapsed = ms - last_msg;
+
+        if ( toks >= limit || elapsed >= limit - toks )
+            toks = limit;
+        else
+            toks += elapsed;
+    }
+    else
+    {
+        toks = limit;
+        initialized = true;
+    }
+
     last_msg = ms;
-    if ( toks > (ratelimit_burst * ratelimit_ms))
-        toks = ratelimit_burst * ratelimit_ms;
+
     if ( toks >= ratelimit_ms )
     {
         unsigned int lost = missed;
-- 
2.54.0


