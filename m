Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BF2606A326
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=WXE1jCTQ;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=U4ub1Q3d;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=Nm+tR6ne;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=Kday18v9
Received: from list by lists.xenproject.org with outflank-mailman.1473171.1680802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmN7-0004dl-GU; Thu, 05 Nov 2026 01:34:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473171.1680802; Thu, 05 Nov 2026 01:34:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmN7-0004dd-Ce; Thu, 05 Nov 2026 01:34:33 +0000
Received: by outflank-mailman (input) for mailman id 1473171;
 Thu, 05 Nov 2026 01:34:31 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmN5-0004aF-KQ
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:34:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmN5-000x9s-15
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:34:31 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdcfb-e002-0a2a0a5209dd-0a2a4505afaa-26
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:34:31 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd25-4cb1-0a2a45050019-94a392172a28-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:34:30 +0100
Received: from pps.filterd (m0367126.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50n2FD3732573
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:34:28 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com
 (mail-westus3azon11011008.outbound.protection.outlook.com [40.107.208.8])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4hr983v0mj-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:34:28 +0000 (GMT)
Received: from SJ0PR03CA0174.namprd03.prod.outlook.com (2603:10b6:a03:338::29)
 by LV3PR16MB6148.namprd16.prod.outlook.com (2603:10b6:408:1ae::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 01:34:25 +0000
Received: from MWH0EPF000C6187.namprd02.prod.outlook.com
 (2603:10b6:a03:338:cafe::68) by SJ0PR03CA0174.outlook.office365.com
 (2603:10b6:a03:338::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.8 via Frontend Transport; Thu, 5
 Nov 2026 01:34:25 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 MWH0EPF000C6187.mail.protection.outlook.com (10.167.249.119) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:34:24 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50n7xA3230794
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:34:24 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hnydrnp8m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:34:24 -0500 (EST)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id OmMvxjRLZf5COOmMwxlL7c; Thu, 05 Nov 2026 01:34:23 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=l3V
	I2UqiyuTXtjuzK4WdaMvCnS6o/o+hC2gZAMXBQR4=; b=WXE1jCTQ+WbgVcdqpN0
	P0I6aHik/4TV1WNTXDbw5HqtJ2ZELhbMZuxOVZjtwWl9Zn3YN3/tlQWd3msN7pSo
	YXt/HP51pY4PwtUR/9z8WHL41+tQLZuXHHGzndhWuJE8Nuq/1fWuB5WT0YUe919X
	bcM8YMV95tK8med1Bf0cRR8QHdcaZ9hBtbdaPBpGduxbuZaVIYAAgbs03y6ERDMO
	Dnd9SSb4WKPX5+VxZEYmxJJSs4CxzH722NGGvjPUmBmpRpY3jI2CrREWPMObuT7T
	Zu5oDDrsUAwaTGhHruFkOYP/Cm3wCL8ahNf+dk7UPHY3UPdo36sgl1h/plSpRV5k
	+xw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vIaCAtprUNX6oFPmVXmUftqL2Tzin78b/Jo3F+LC+7Beis8aHaGYvELyhF9TCOSqFiOL65XNDlruza0B+ILLgWce29hxFTSvXEJ1eAu4gI1We9fhTvLBN/L3doAA6uqQw79MjzaDt6d57ojb4DWQT5Ocsa9MNCnQPOexw+i6iMzlPfdqBrTCBO79tV1pEu0wufYCPXf3AMz2MtryMJtx0nOrKFJxDvamGrz2a5c5La4isD/K+3q10M2pmckHOdTw0i+2QXvSPEBFl98sNMpRFjJK+0TX6HMho/YNb1wikIJaX+Z4TxMLTWUJwt8wNw1ZKpcMdgyoovSkEN+AHwOPvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3VI2UqiyuTXtjuzK4WdaMvCnS6o/o+hC2gZAMXBQR4=;
 b=Ds3ky+rYAGkOc0mAE6OWMMzq8TU2xvTvDHLAu2S1YkY1P8cimC2VCLUeV4NirvWb4fzRyrUnhdpqFfldy035cyw+B39VgmIpO1nmHzSmC2jxncSPJLybuOw3ANxEo2So78BYHV98bGHxUkeHwjaCsujbnMNEBS8hMbvqw/vpiurqGgepRaXbgJVtl11rAVsB6CKpIgJBIzJeSCSwGfFiGBZXVjpKSPAieT+RSxM25Fe2nOvRrH40FeqQSDs48PN53Mga1da5hWsvHmQDj+JpRNHDIEsxckVEmzAXM/ZTtAt3DayD20ariGs4hZCPCkVdQou06LM2yYlSpbpjRBxpKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3VI2UqiyuTXtjuzK4WdaMvCnS6o/o+hC2gZAMXBQR4=;
 b=U4ub1Q3dXhIYKr4XNKsQFiyS2yxpbkuodT7jkCZNQi8VbxSBOdiV8rCmaN4Dt/fYG3ShbzEYk/IjZXC0LtInY8Rbp5zH7O5yzSwlLYVWbdyVy5RVEKAO4AdA8CqhRjtNhJtFfkwjqGJgza5TpWRgHAzEa29IXtEwelEIcbZVkaA=
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
	ppserprodsaar; bh=l3VI2UqiyuTXtjuzK4WdaMvCnS6o/o+hC2gZAMXBQR4=; b=
	Nm+tR6neIIrfeQY9P3c/MSTJYvowbkzp+vJBU280JAReWLLZKougDDb9jBevgaAj
	jeb27WoO2iZv680AA+HmwBW6BmoxA4eTpfHTpxAzBMCWg65Ck3F/pvxDvQw+urms
	g+iw+sfbZNN8dgKEFXavp534AuyYyBm7maADXMf0t8Gbpq2BQ5QzlvtiuZ4J6rr+
	wcBG/Y8aCZftg8yqP7OLC6UR05gTQ/SA4onsR8C07MNyqW7grDwQFuBsOxH82V05
	yDcM+JBCflz8f+2dEa6vWVyJE99TuKL44KEGXZJ0d3p+aZ4x2Dxxn769cmSILavB
	cEHcTAjXZVRwrvOoBr8nqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=l3VI2Uq
	iyuTXtjuzK4WdaMvCnS6o/o+hC2gZAMXBQR4=; b=Kday18v9AP2nwQDvjmm48oS
	ob2iwendLQHRgRbkF80m+QFtCqcxGigD1lM/AZfFtpU+LUts/VhYWwC8phzdCj/L
	W3tqDhtzzTzKia1glkQeZX95nKzgihuzbsUZgrnihDe9mk6cgld5diK1htB5DHS4
	sl0KKTat7uXyImOEtLH0IsBDeCz25aqC+f8YeJ1FCwIFRhqg7wyYdbpG5oAKlFoX
	KuQtMa3iMfv8YBlG82/Ji0lbxir+21oVeh0cYJLcxggCQKMfgfQT+R9hUdWZIlqn
	eii94LZotLlz/elWjYFKvXcdkUGmlZnogpL3fBZ+O64hnit3LVPNSmzt9Q31FhQ=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmMvxjRLZf5COOmMwxlL7c
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
        roger@xenproject.org, teddy.astie@vates.tech, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 06/28] x86/hvm: introduce vlapic_reg_read()
Date: Wed,  4 Nov 2026 17:33:23 -0800
Message-ID: <20261105013347.719392-7-dmukhin@ford.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050005
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6187:EE_|LV3PR16MB6148:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6e4dc320-b287-4952-b5ab-08df3adcecc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|11063799006|261021121427099003|261009223027099003|261022105027099003|56012099006|261102123227099003|261028144727099003|261026140227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	XT/G3HyibNJZGhhEUFRp0y0Pn21VaG/psZteCbcWYHikXxGofoaUrD7UELCb53F+sI4U2xWhIcZPJ51CWNTMOu65AnAk/kzkZhfwsUeUSHkPrKTQrwvcIVoyx2etahGoEcDY5FADFWpgqASOTJAdroc9kBdeqtBqw/2xzspNG0wB7Xg3E1ErniO57ZFBgTh2GXfQ2a+9FZQuxT/v0j0xTytQVXBO0xy/f6iOX2JXDiU4HDCaIEgBbZ+pspSqMdd/U0Kv7S6jKJgpBowaTt8bKKmYgo4jTDsXVAqkkX1ro77P0Kb6A/I+a7uFaX+hXwUascrC0SIB7E15hU6h+5qmlOnUuk2XO0DMrLZsIvfREbG4mpI7hg6TVs9q0uKO2tb47vJhiVpkizuY6GqEi6OczJYtLsdefVzpx+9zo+p4m/ZQFJ7N5A1qJ6tabDICSHMXQA46+UlNtGLxvW3uGaM6qDynmhWIiWaggNBoddJalZsZyORnD24MZNcBI6/IvVCyOBlhMjSnL3NIPCwnmF7szBnvog5AE0LdS/OZ+LRZoHwM/dCQYsiXN+00KHIZS5f99YzVdhGLY7NdQZAQv1xm30YFC7zUGgghTEbDi+uFXL2H7N5IbpqoMWtaNpM32mXRbr+dB3eimD68b0uLZDMMD0G0zSW3CqmdqP7bz5m02vEGsuy3ebxcR7wy7LnQm1Db+8NaM2h7AEnxeQrpZ1/0QA==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(11063799006)(261021121427099003)(261009223027099003)(261022105027099003)(56012099006)(261102123227099003)(261028144727099003)(261026140227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	G9rRAs2m4fxSgJHTJZBttB78kDwmtL91VZp8c2CUe3J21qWESRMXQOZdqnwLdvahZ6gxyp7r9wuyguBQKa8HS/MnaCKJOoy7m9nSIz+JeB3iQ1k+skFZ9mww9vM9vO/B76i2LaQNcSggpWLF5t/6zub7iqZ4ANpEo3J0xdYpZQMZSlUDtAwWkFGkIYF3lFGt5K0nXkCNdx+0THhVt4Qzjjz6nknENk3UjXGuEu87CAWdvJpXbamSAUa7RPUn2IZfD4cQu07K8wHGQUWSXwEE1mzhRc3gEmWxm9T0gde3OWLx3kOKosa6/vbY7GoOGvbKrQflwNAmUnH+Smro9iS2F8dUOwlJLBgVUbemEg1W9QruDIp50OaffeiFn6/UOLhbpoTBLKzaHkKRPkZQmpwmBagUnx6oeKARlVcmOtVWM/pn+TH/Uv6ipBz6JtgFb3m+
X-Exchange-RoutingPolicyChecked:
	YCcOHLDnsuzMQGM5fWFKgyh0jefqCqgE8dNOhY3NYY366lFv3HXlXi3ypIJVOtTkC6BjQuPWpQTByW/IBl4uDOh+u8BEcBOw+6m3D1veBjzqrB1z9hSkQiIhXuh7HK55UQgFSFdsCeab0xMWD51PU64WncKtOAnrxCIbOEokRfVuxGn4PqPhLhoRTE8p4WUOKw5Q6GvQQkkOwltYtWsZ5cWJ0SY4chJio7/2BirS2aS6o83ZVXgrCXzO/mzkeh468zBXophrvarwGbiLwHvYZhntWZvOkIdjBeD73BSH43lwxDuPaBRRwZMKAHe+Ay2dek3aDv55AElRP3GUPp1YPA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bH6aZ+6HzvtHRAlO1iEkhVzMF/AbhHgQziS3AE3aqlNiuSMCkyEyXbEbjQHepFA4O8VJzZ+mvokasOdjICZBL6VudzDtVUIG03K1mlF7dGHj0Pd2FYCgi2FSeUZba7V1XWOUMpF1pWVw0YjBVJSI905eyNpOgeOI7YOqyKBoMPQR5E602RPMieFp49BKs+GRUZZxL5QkSSvf9/knWu3bO7UEC133Np14GyZnoIP49CE8My3z/8V3+DZaxU7HhzjgTN0HALfkCu9LTj8Ztou7sQm0/76iwfTnQX1UlizyES6L5DNxxCBF0lUO+phh3Fl0vD0t66WnsI4uciLqwOZOqGzOwi6DBrfJ3bZBtlfUg5p0ZRvI/cMoKSmDs8XS4y8OrbwW5XLllCK/nuc2v3m1gz9BUu6BecnVcgQgrbW7m/6EIw63Ahkhj8gv/oHro6+A2EcyqSDPOOhb8l5eH9RCmzIDLdBVhIbI6UMiEcbTGwxIgNO8lKyvoDguwBkfjeYQajuRK+asM/njMgqqgNISS8WphEyzk2QtjGD8+lChueQXuxiRcBGtFEljIHoDXm1qhHoXbIfseBnfR6Bd4eEUuR0Hx0O9YOzRUqP0q+Ql/5vFYbr8E3Bgbbul5f7y2pm7Ft9o5MN+rJQomDZBF8vuNw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:34:24.8096
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e4dc320-b287-4952-b5ab-08df3adcecc4
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6187.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR16MB6148
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfX8owVnu/EsSNi
 S+cgn0gUqbtQdZE4HjOV6Bd4tmoRS4nbtX9m+oTi77/rhnOmbO189QJHnrCoQJDb2e1xCaJirqI
 LmMjQ80TH+Kd6Wr6MUmj4VFPjBgXfvfUk7qcqiNcYDfC1xMwMPyu8719yTM1HNEJzcddWMAMOz3
 70OaKPj6iuDN+Hu9uTUPtE3HeQEVuHBFmRlAZcN2Sn1NU/maDpyo84fe65dLyb9AR4yGgy6CRsZ
 EZtxPlH77XL5TUMmRX6IXWRtZUxwizqDlIwO8zrGMFhJvwGr8cLEQ2dJ4dTzg3qqB+8D1UXYnTd
 QP62hecB/SEz30G/cdU4JrknQZxO4Wl0v3N1ol2TMXiBJySLJEVknZGyhz7EDVMcgFvyhYAHzSM
 DNo1lAzojhpo6lrZ6VbfkM9SMdLt9dj1AnHnA8tTXxKuuMq5I3SlI9TsWBt15XV+pmbiWSshW4w
 NiZ77Y4ckOv7RcVNJpw==
X-Authority-Analysis: v=2.4 cv=AYYkjHXG c=1 sm=1 tr=0 ts=6aebdd24 cx=c_pps
 a=1GamL6rn6SUPLdETXxLFew==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=-OawqTZBqJjt90xPb8wn:22 a=cbNQJ9GKAAAA:8
 a=F9tOGt1jHpDytgJGuyAA:9 a=DqJYxgmhk6moR-_7_KoZ:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-GUID: MZ-sftMiLuKeln8qfxirwgBNNxbqC3_L
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfX+xpFQ7TRVfe/
 iALExdwUs3Ap7G41Dbm+bJ1g/VAmR84RSYHJ0GbgQYHlvMeVTaNsNXmF+NlqvmNx08fHvUJdEWa
 TeVyNwSqJT1KhOv+yf4+laMLJjxFhJ2AWl4avfVaxcn1RhXY5P4N
X-Proofpoint-ORIG-GUID: MZ-sftMiLuKeln8qfxirwgBNNxbqC3_L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050005
X-purgate-ID: tlsNG-c201ff/1793842470-720AA2A1-2A1305D2/0/0
X-purgate-type: clean
X-purgate-size: 1370
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Add vlapic_reg_read() for integration with components relying
on emulated LAPIC accesses.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/hvm/vlapic.c             | 5 +++++
 xen/arch/x86/include/asm/hvm/vlapic.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 6698779e227c..f929fdfd74ee 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -618,6 +618,11 @@ static uint32_t vlapic_read_aligned(const struct vlapic *vlapic,
     return 0;
 }
 
+uint32_t vlapic_reg_read(const struct vcpu *v, unsigned int reg)
+{
+    return vlapic_read_aligned(vcpu_vlapic(v), reg);
+}
+
 static int cf_check vlapic_mmio_read(
     struct vcpu *v, unsigned long address, unsigned int len,
     unsigned long *pval)
diff --git a/xen/arch/x86/include/asm/hvm/vlapic.h b/xen/arch/x86/include/asm/hvm/vlapic.h
index f442dec3d975..95f6dfe9e941 100644
--- a/xen/arch/x86/include/asm/hvm/vlapic.h
+++ b/xen/arch/x86/include/asm/hvm/vlapic.h
@@ -97,6 +97,7 @@ static inline void vlapic_set_reg(
 }
 
 void vlapic_reg_write(struct vcpu *v, unsigned int reg, uint32_t val);
+uint32_t vlapic_reg_read(const struct vcpu *v, unsigned int reg);
 
 bool is_vlapic_lvtpc_enabled(struct vlapic *vlapic);
 
-- 
2.55.0


