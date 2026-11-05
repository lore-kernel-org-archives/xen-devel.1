Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4844606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=r+V1KcKU;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=WRDbdh/Y;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=Mz0gYGj6;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=VbwhICTl
Received: from list by lists.xenproject.org with outflank-mailman.1473182.1680838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmNL-0005tb-DS; Thu, 05 Nov 2026 01:34:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473182.1680838; Thu, 05 Nov 2026 01:34:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmNL-0005t2-3a; Thu, 05 Nov 2026 01:34:47 +0000
Received: by outflank-mailman (input) for mailman id 1473182;
 Thu, 05 Nov 2026 01:34:45 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmNI-0005Qq-US
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:34:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmNI-001wz8-B2
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:34:44 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd16-2eae-0a2a0a5409dd-0a2a450285f6-28
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:34:44 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd32-6ca4-0a2a45020019-94a39217a804-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:34:43 +0100
Received: from pps.filterd (m0367123.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mSm22567967
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:34:42 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com
 (mail-centralusazon11011022.outbound.protection.outlook.com [52.101.62.22])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4hr8vmvb0k-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:34:41 +0000 (GMT)
Received: from PH8PR07CA0030.namprd07.prod.outlook.com (2603:10b6:510:2cf::16)
 by SA1PR16MB5804.namprd16.prod.outlook.com (2603:10b6:806:3a8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Thu, 5 Nov
 2026 01:34:39 +0000
Received: from BY1PEPF0002695A.namprd05.prod.outlook.com
 (2603:10b6:510:2cf:cafe::77) by PH8PR07CA0030.outlook.office365.com
 (2603:10b6:510:2cf::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:34:39 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 BY1PEPF0002695A.mail.protection.outlook.com (10.167.244.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:34:39 +0000
Received: from pps.filterd (m0373460.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50nN3g1487541
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:34:38 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hp232whwt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:34:38 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id OmNAxrjDUCiSDOmNAxv3zn; Thu, 05 Nov 2026 01:34:38 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=fSW
	o+rzVhuBSLE4305o2x3UcvXK/wQrY+oQkdfxG9Zw=; b=r+V1KcKULE/CbiAPPHH
	fDneC4+xhMTWBaMIW9SxzKTnlcHlCGM29chMFzOnu3zyu9Dae0jQOGZhY0JH6txk
	Aw6U3U2cz4cGKbGjnYQpwyU986E7rCneelYmTH8Ka3sQtQbVKVynqA7R3HjnbOag
	kwEWkxR0I9vePGxxz2vau2HBVoAbReQ8sU666wuy7YuS/pP++tCD8uIqvTYgSoMA
	sXCGA7ADX8e90EeXXJhcrZOqknB0lpVjs3c5gjSJmeWPiP9wsfwMg4/YQ26oLnHG
	ZjJAj/gDIr/iQ2sBp6oYE31o9+nXi/QEmaQgw2SeAfXsmrTGcahDsTET+UB/52T/
	b8w==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=urhZIDY1gT1c4qP2x0GhvhgYNgBWskkT78sfLHHvgalq58FpUJL/SuPnhESQY+AbrhXFPm8Udu2UTKokShVRfDbwENL384ZpqlqNMi8lAu9iK51GwfYkjRZzyQI6Ps8Lh/x2bd80j5G1YkUbYs136s8KEZ0IhhxefZWhD0w0qNpJxYLj9mIATH1t0bwo+0EHhAZQchotV0YfLVUSe92jlsl9fWZL/ClQ7XqxMFYqyBarbx+QaP+NpNBYxKCKmQWh19vptR8TjJSll53922PzqYh53Bi5+9N3MHm+snt6jQ7YJSCnx57NYOAtaEVR+JI+znTKTuyQsA1kzuOCrOAcEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSWo+rzVhuBSLE4305o2x3UcvXK/wQrY+oQkdfxG9Zw=;
 b=h39SDFUKWG2OgGu/VtH0+urXvm0JKnTdbLMoV4BMLpn9SQpHywJtk9LLJtNYJfmKBNBFXrWZafBIatf4rK0yCzQjE2SfqCSEsEoVBwGPidpdqpQ1vPoTEnTrvtyXMrjxRuy4eywvdvgj/8hDtmJ0jyGG/Xq0Y4KGqtI6l3QYc0e5jSmTCyG6vLZVV+mKFJ5FaJNeqfaLDxQpPhEwy5nx2wCBhWj40KB/CJRDnwgXmnRhFj6fCJAbA+v3BFPhHUz1NsdeiUkNMaHtii5OfXCxMzxdEHZMRjpg6wKxydmXDnUvEOCO53qjubq2G3K39ZEvDrWfQYg5NbuG1gjpEIytVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSWo+rzVhuBSLE4305o2x3UcvXK/wQrY+oQkdfxG9Zw=;
 b=WRDbdh/Y1hQp3jbdGvN0rpYU4RdV2elzDA4I4Bx3k/y9b+V9vIDc7hmWfCH5psY/+ax28n9M4PKbUk7b5nOmfSq2QUYroqIwV6OKejVaPaOM3JCdFSBhDJ0AgBhSnW0IHKmU3ox5Ji5BX4qN8jdh26k4W3eT6gs/yQgmGVWcfL8=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 205.220.161.53) smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	ppserprodsaar; bh=fSWo+rzVhuBSLE4305o2x3UcvXK/wQrY+oQkdfxG9Zw=; b=
	Mz0gYGj6ogWNDxCzvW2ADZpmCF+nIvYkrvrmJyhtFEc/ND9VnybZTmr4HQUtC8QW
	+gIkblH6/XRsl+3mWp0vmihx0f8GxNM59dMICUkG+domeqZ9+BoJLcXMoqn/Mg/m
	64nCEAy+/Ek0ZtBVCAQJA3bCMow59XGnV4M9qixCT6hOvWajYi0Be1yhnkCkzlKr
	uOIbeTLYjymS/tINCjisoXlKMkYCPHl5EpNgSMWuuLEP5zrmJbasPgLC8N/xgkFe
	oCwr958EYyTRBlUuva8OFKK6iugx+9JyyG7mVHaPxgBU3HIopyQBwb61be5+G2ph
	ipBVXG2XN7dzJdCwYUfGKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=fSWo+rz
	VhuBSLE4305o2x3UcvXK/wQrY+oQkdfxG9Zw=; b=VbwhICTlVy3zABVGouCLcMB
	D8LAQwpwj5smmHaWR4WAOqhtQOjx4xvXOBDczOppkuxwW/TVKvZFNL/9dbV0cHid
	RfDtV5r4QeBR1r40Q/q+9bgtEJ0r5ROVQAkIPHtQ1puK7dPT/sej36TT8hAkt2Uf
	4xPtLi1INb14REbv9KzGm7qbo3llg+rmM5rFZM+fHIdLd5hI0olNuIgtD4jpqRI/
	L4ARiUR6fpLFzd/3FPR1tY8IA9Q7rZYYvYUo6XG9jIKQWBB/qThyPR2tO/r/LLJz
	PgNfGCco8BbrAvr6yfUHjpq2sDt09dO2gaC0pvuuvO+kjkvwsnS9eVVirna35dg=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmNAxrjDUCiSDOmNAxv3zn
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
        roger@xenproject.org, teddy.astie@vates.tech, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 12/28] x86: apic: use APIC_EIO_ACK instead of open-coded 0
Date: Wed,  4 Nov 2026 17:33:29 -0800
Message-ID: <20261105013347.719392-13-dmukhin@ford.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105013347.719392-1-dmukhin@ford.com>
References: <20261105013347.719392-1-dmukhin@ford.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050005
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0002695A:EE_|SA1PR16MB5804:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4aafd863-a241-458e-8ad9-08df3adcf530
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|23010399003|10067099003|22082099003|261102123227099003|18002099003|261009223027099003|261028144727099003|11063799006|56012099006|261022105027099003|261026140227099003|261026121527099003|261021121427099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	WuSigKOZbQ0gAC5SBT42MRFvnEH1z22R2s0RZIYGYyRN9mObT9x/awRBBlEFLuh3NCJ9pfr8fnoGcnWc7UsC03dX/kgaS1/ihWuFh5P++4kRSxSCk/Fc0KdFSca3CBUb3FL+ZV3Og85175Fi1CUhFW+WAla7g4MPPjQoGSYIM/otuUxBLNOw2tWth7pLgpKonTaEmz1eNQUYoXfsfeVQqEaZV4Ofr5oLHPoNw9pln8yA8ZuONofuCg4Bp+5wACWUiKVhlFDPmdAZKbMJwXxOjrw5vj9RrACvUY6FKbttUrObj0SbKsO0Gcnrc/fg9MttF2kCJq2DgSk+0qxOYWRslRIgOhQjWl0aGziJSnIgcj3AKwgLI0zQekYxx9ThUaXU4hO1CiNIyBU1QE/1eaPj0Y34GW/EnAmNqhAgFm7nx7jS+1JESkmdpw0T+aAt6hUC6n8xAzYitEWm0B9mMRT2M/JE+k0v184Wh6mHb7YuPU7FMe1nN3BJz7YFG/fTJ6yFq2byMvFzQbl/b7JdOuRQJPS5HaD4KUNMxO4U+E5BLj2SBz3TqmQVZvgBsEQOyn6RyWlL6JqK/4lkvrifQfKk9tmY6cTfun7KLXTp2Tu5pwXcb0uDDo53Ve94GRuSiQlq7DWmPIZRSOkb7FVydnNlm8V6spc8E6PojjEfGQgCgzDRMtNtuAeXc+gda0g1+BS0GovH1WTGZsUhAO7rP4KobQ==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(23010399003)(10067099003)(22082099003)(261102123227099003)(18002099003)(261009223027099003)(261028144727099003)(11063799006)(56012099006)(261022105027099003)(261026140227099003)(261026121527099003)(261021121427099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	emGIfYYIRw3FUolnJpPUzPoBs+IVZKjz8BSWn/yndpKSkxoimXFW1Qh14nPS36nrhvHF+lAIo6AI4/nc+BPqRCwPhSZiMhbSd8O2zmVWYl4D0Q6oU66tOFknuaMqEOgBhdKiTaMogqLEed7Jf1k7asyweOd8idv1tTiC4n0kbBschGhY6AlobL+voaH6YU24Zz5KuWmAyucW1WpN45bXvvXs1J6oSAk9RNo8ddjm7r/D0l0gHws4jHSz/mHDP6iCfoKaqmXENeEjW1FOiOE3hpOMOe8vMrRDeU3hACZODDHDU3TYER+7uTsjiYPv2Ep71EZtaTMuYZFyeqsZRof+VjihCFI+/2W5dFk+CAZ5t40tSJP9P/DMeLFlTAYNSLyK8zch04U0KiIhK9ZsTCivdR+QMThzXLXBf8ZMn6kSmxZj8O31/MZ6QYAdh98kjJqO
X-Exchange-RoutingPolicyChecked:
	esV55IRQCGV6nEkHau8puQPAZ7I9tjzEJMYerJxDSjE2F/vd3O7opxO6lZ4ZDpMhwKE5mYLsSKjd91yV0C7RdqJh2gdr+hp3vXldbhG1y/xD+ouflXSSTrwqg11siJdbF+apemJF0B28H4XJOH1W88LvRvAYjfaDzJrxTXwpSIeIF2UJjq86Q9kgzTgXMp2C8Cxkhj51VxVPwSbE06NXX1LacP7OQz0IZf6vbaGM7GyyBRPCwTMEkx9s3/PCvsdkkdhjtvpM3u740bxKSquV52VAVdW5ks3jrxRsqKqVI0WFyAcJnbNKpH6C9p7qpAzk6vgMP7pc4wh4vxAenhs5aA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jLwLrbgpyRxcsCTU6HhWQtPf7SmZplmMQa7Zd/vpTyjyhXPyh4ATjuzkGgD53QOboC3Am5+wA+igVbyfpR2ZjmSMs3cIzqFLcR0VgFE8+TWqVc9W/FSvn7WFjst5Xnm4x1o+BSs3uWIFXVXgrhVAOlS4oO/Jupcuagk3UnAIVRl2zS+L6K6L9/NHFSphOmUukbAX+8HHdfaNFnpdvDmMqIjXvzT/noNF3UGd8MWe2Q7Zn6wFqWUMZuC5wGlJRxafRCqtN/qQnYoQWtRNs0hWAJPOhlSt3M31dAKKpeLuerCmcat8+DYiwTf9uY1AiBxNGKU3UGa2OQJ3jNDyexZWxxlPEo17WHCZe+nQsUUNm46uuRHTduaLHzp+gCeW52pdUBaP0ES6UDLWsi4psZK5p/uUbcokiPopKyw31XWFobIq72z3QTPyIi7XA77CqdbdRjINCmZHWhdALqdp8Mk9kWcQnLVGLObIIS9JFx1M5xeD2k10mjBSTvPBgTSFjpsKaUdVRDK47WtWdOK0NGEStigXHU0qoNO3szs3rMp39Lt0e6YFBZmAmUvYk3/y38uEqk+rXASeCPA4EbatzobVzTm2+7WB8SVQ86YuJsCxDNs+/oo+7KZEgriYctrePAG08czm58Z1Fubkg7f7+WLg8Q==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:34:39.0218
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aafd863-a241-458e-8ad9-08df3adcf530
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0002695A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR16MB5804
X-Proofpoint-GUID: WlIS0IacexTMsJhDVYgMMFtwm5cs_GCK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfX2hWtmBn7Bzp7
 Z8O0a8a8uLLdka5SkvS/QdZVGdSz5EcUOUj5Efw1LEdFlj9wr3XOzgWpelkbvtUCrOwLmQeQuwv
 oh4dNpEW0Feq7yGRFnEgU8HDbls1G2XOUACHhI7A4J5EAzEXcR9q7f1yAtnZQ4BOcDZFkCtr+Wr
 a3wlwIaMo8/Tim58WkSW2K4ER22BOKLZKGRfqJXEjZcmbtdoT0WhrK4Jl42dYdzIAQwvG53qFFN
 R1wNQYAdHxpySUtZlu8fqO+9L54rediNm5yfQ+h/VIvOfhmfAM+vJJJWG2G5s1lDmoTFKs0tXwY
 k/vsNLY8T3KqKF2R/0AchbIdwnWmUpt/hku0XuR1oIHzwCt8u/hIQp8zQ850lXfvjpY3f3PB8F/
 kdl0UFNfjcASaxOm3DnjrnYhKsDuixiH9ApKnPOsAaHYqd/9YBy/uqh5RgbgNQhgV2d8jcvQ+Ky
 WGWaC9d58i/EZXL8FRg==
X-Authority-Analysis: v=2.4 cv=T7AZ3PKQ c=1 sm=1 tr=0 ts=6aebdd31 cx=c_pps
 a=OTtHDJnq+OHIMh0/YV57GA==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=N9_n2FxmZfwfyRXvS9-E:22 a=cbNQJ9GKAAAA:8
 a=150EHzJ1OXbf-ekTTTkA:9 a=DqJYxgmhk6moR-_7_KoZ:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-ORIG-GUID: WlIS0IacexTMsJhDVYgMMFtwm5cs_GCK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfX4hqtA/c8bBVJ
 JA9kZqRR/PwwxxjG0fM9EDEpBLfaKxUIO3znYXmsnv7Z0tKWU4BJ87pIrfhljaVvho0m21arSKO
 nezlpwkK7GswzWKt4mMEDT7UbfSv05hSWnt1eB0t2iKnCko9Zkxi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050005
X-purgate-ID: tlsNG-720697/1793842484-31DC92AC-D6E5DDF5/0/0
X-purgate-type: clean
X-purgate-size: 1383
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Use the symbolic value in ack_APIC_irq() instead of open-coded 0.

Also, correct the EIO -> EOI typo in the constant name.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/include/asm/apic.h    | 3 +--
 xen/arch/x86/include/asm/apicdef.h | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/apic.h b/xen/arch/x86/include/asm/apic.h
index f30d57ad22c5..a4f6d2c26ce1 100644
--- a/xen/arch/x86/include/asm/apic.h
+++ b/xen/arch/x86/include/asm/apic.h
@@ -155,8 +155,7 @@ void apic_wait_icr_idle(void);
 
 static inline void ack_APIC_irq(void)
 {
-	/* Docs say use 0 for future compatibility */
-	apic_write(APIC_EOI, 0);
+	apic_write(APIC_EOI, APIC_EOI_ACK);
 }
 
 extern int get_maxlvt(void);
diff --git a/xen/arch/x86/include/asm/apicdef.h b/xen/arch/x86/include/asm/apicdef.h
index 112c1dc613a1..d3dc7b1d7643 100644
--- a/xen/arch/x86/include/asm/apicdef.h
+++ b/xen/arch/x86/include/asm/apicdef.h
@@ -25,7 +25,7 @@
 #define			APIC_ARBPRI_MASK	0xFF
 #define		APIC_PROCPRI	0xA0
 #define		APIC_EOI	0xB0
-#define			APIC_EIO_ACK		0x0		/* Write this to the EOI register */
+#define			APIC_EOI_ACK		0x0		/* Docs say use 0 for future compatibility */
 #define		APIC_RRR	0xC0
 #define		APIC_LDR	0xD0
 #define			APIC_LDR_MASK		(0xFFu<<24)
-- 
2.55.0


