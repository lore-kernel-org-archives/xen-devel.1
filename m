Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66A2606A339
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=etXIn6NV;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=jGEQGzN8;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=D33nwO+c;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=JEsDO8gy
Received: from list by lists.xenproject.org with outflank-mailman.1473249.1680942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmNq-0002CZ-4X; Thu, 05 Nov 2026 01:35:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473249.1680942; Thu, 05 Nov 2026 01:35:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmNp-0002BJ-EA; Thu, 05 Nov 2026 01:35:17 +0000
Received: by outflank-mailman (input) for mailman id 1473249;
 Thu, 05 Nov 2026 01:35:15 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmNn-0001iC-Fi
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:35:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmNm-001x47-SV
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:35:14 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd17-bab6-0a2a0a5309dd-0a2a4508a5ec-32
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:35:14 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd51-f659-0a2a45080019-94a39217caca-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:35:14 +0100
Received: from pps.filterd (m0367123.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mSps2567972
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:35:12 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com
 (mail-northcentralusazon11010046.outbound.protection.outlook.com
 [52.101.193.46])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4hr8vmvb3g-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:35:12 +0000 (GMT)
Received: from BN0PR04CA0119.namprd04.prod.outlook.com (2603:10b6:408:ec::34)
 by PH9PR16MB087844.namprd16.prod.outlook.com (2603:10b6:510:418::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:35:08 +0000
Received: from MN1PEPF000793FB.namprd05.prod.outlook.com
 (2603:10b6:408:ec:cafe::5e) by BN0PR04CA0119.outlook.office365.com
 (2603:10b6:408:ec::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:35:08 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 MN1PEPF000793FB.mail.protection.outlook.com (10.167.249.198) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:35:08 +0000
Received: from pps.filterd (m0426315.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mr833109156
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:35:07 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4hp33swayr-10
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:35:07 -0500 (EST)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id OmNexkWXaqQa1OmNexYlM2; Thu, 05 Nov 2026 01:35:07 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=TID
	9m9slSC/X7gfNkK51xRN4bPBb6TjSoHkpoAhZQu4=; b=etXIn6NVUhQDxbhFALw
	YmgJJozMju+QH6duJTFvuSGIQUefnB1xHv0hv0xRLY+g2eivFBc1n174quZe9Suu
	bcqq5oVrfubXxmzqJ49gVyBfPnSL0LDSr0hsyR41eABtpW8qacHGtIO5STnagEur
	IoVlN/14Pe8v6XEJSDYUvE0n19DOGZLmzo2VxG6tMF9hW4ZWn+eamu1QX8M6rC4o
	apOXFANOnHPEt5s0e9Ygn7wJHPlD16m0bQMmCjxpXfod0HrKYPphp4Kspgms+djn
	8zwELPqKguuxbsFEPZg4nZDpBYXnmFIb1FX1NmWIjNB1ZtPvMyVluMlZO764cSEw
	WZA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hfXGVsK0QK+zOj0eM5gYb/djcrEZcvk7IqunWupE3D7aRhL1Rb23vcORo2fm2PIFVnPPqRR+Ma93BRdUrNvESHNJjcKmFblsTCkuAH5o5cZCznJw9KBWiBOmjabkzct0H4rzupePvIkVZS5XdcRvw1ejM45bV1J+DKBqxmusm3+oYPpDLLD2VSlOr1KapjcrJuPm0zvhEwRaSF8fa3YPQMITFTUIbp8WxWStJ2V0HF4x1ZIfI6pEZSC4/xRKI6jiTbWmBe6fh004IM4wHWgJpSCEdjAKFKlgSR8rlrRhmha0396Ox318IayICZusMoMr6oZ3jkH00XNfV6EV4BjVUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TID9m9slSC/X7gfNkK51xRN4bPBb6TjSoHkpoAhZQu4=;
 b=UodO4KEmW1migpj2cLMemhgUUaBBG9TuRJQ6vXL2h1Y0fPF4YMCBH7sh0gVvpTDTr2527LUAd+LnTkEE9CAHoOhD0nV9SgJ8hf0vlnv3qNZoLYrgaL1GUGCVtoyQe4E8k2tVjIOQrW+MQv63sZu4j6IIEIpRUM+WEl62sWmMtme/erX5a1nKYoxl5T56RYzCOUZB3uNgZw5kqzIMxkr+/NIaP4Q/CzYrXmBli1W0hvXTBSEbX1S4kpXiXwbfWEq8uLuACFfTviBNA5Uzlj49iKZbq9ohoggNJMEvP10y/Su6hUiIPFJc7eZOgfk1yK/VSkgtU6NWgK0qQta2mCOmTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TID9m9slSC/X7gfNkK51xRN4bPBb6TjSoHkpoAhZQu4=;
 b=jGEQGzN8OZjay1djeDFziQrkhVfp3BoCK2XiLTt6wASf1fV8PcnJ2p6EpbmBfLvYP6qOP202kVkPPi/SlkR7zkbMm4liE20FqdkTeEWD4uPmEco4uY1BGUZvMmb86hx0hRFJW+fdq0F6/IsIOH5s5WY6FixwYRkkWvz27ZLyuiY=
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
	ppserprodsaar; bh=TID9m9slSC/X7gfNkK51xRN4bPBb6TjSoHkpoAhZQu4=; b=
	D33nwO+cbfornE1g1riOSyfEbiJvAVji7bBHl6rGQrYO3p1d6WEke10FeeVzq42R
	9nta5DlpodYIIlFTQFo1uwhbRGKEyrah4/XiHTR8zV4Su4SFnSaE1IyxO0pDhhbg
	hgCrIQYSo5YpBa3YZBPehUrOI6XmzIKAVKs8FXPI/ll1Plcz3Ul/AABPU/rsrIXy
	m+8rufxDSNmDxA84VmReAAfyRsVPEAFYgYUw9tLYlwUBHLb/yixO8Kx1hyOAQAu1
	pfF/geG6x9vnuwaxRZzinO01T32ASEhXspFNDauEIX3ZVX2jl/N672BHk1GORHJ0
	3VlVDR/DAdMrSxgyOPbqbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=TID9m9s
	lSC/X7gfNkK51xRN4bPBb6TjSoHkpoAhZQu4=; b=JEsDO8gy9vW0vaQ1O1z7Afb
	gfkLdsWy2lilm7UtxeGroJ/q19lZ7X8eGPrVn4OJjfFkXkfE4a3RGBfz2N9nU0/m
	nvC+pD0SjFl80cu5V4Aj9uU26HqQzYWWp7olEEthaDWUJEmP57sVQR/zW/fFgLI6
	hd7sxeDPDIvHSIYEziAb3wshGNK4Gw5smSbCtHF9t5IjwBcm4/ol92c6/C9++KWR
	SUWGjPncF+c7auUXR4KKvLaEnT6ZRKttXCB80X2oDRw0HiEcxuqPaq6T+/2aumPn
	VCJXN6angCfsPTLxie+8A9ovIdlFwScmN2lPxHUPZGLxFdrQikSsBbmYG9cINlg=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmNexkWXaqQa1OmNexYlM2
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
        roger@xenproject.org, teddy.astie@vates.tech, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 24/28] x86/hvm: avic: ensure SVM AVIC is disabled with nested guest
Date: Wed,  4 Nov 2026 17:33:41 -0800
Message-ID: <20261105013347.719392-25-dmukhin@ford.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050005
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF000793FB:EE_|PH9PR16MB087844:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f803c5a9-24a0-4854-6c6c-08df3add06a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|261022075727099003|11063799006|56012099006|261021121427099003|261009223027099003|261028144727099003|261026140227099003|261102123227099003|261022105027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	u8Ud374LLM3X7yaNkOBJLn4f2K372dC43ntbCY3+FahlbP8YSEKqySUWULoI8+dZEFnORODPhTeGLcerGZKjDTA4kWfa2aILD92tlidwhtI10zqwiAl6PxuOlmDVTFzvktnGNj4FwOFaCIDfXxXVgYvN0Yct1KJ1uBxt+qBvk69UQPq/B5QQ6I4eS2d5qIHvqqGXg/3AoXqlQYoYAmVkm6ofOhAdkx4oPJUyKBC0O/NMB/BlGnRWxLmYnpT1R4qsvTwrWu1FXIrYA6RYr3LzBJLtG+RMgeVbctRaxwWR6OI33abdJhogk3y0jGXZXxI9vT2kj4BLqZwzJA+pOSdYxFbY8NZvRWPT3RSZpGj/FUQ2gnASpDr6zg4Cyb0dLQUeyYPM+VRPhiH+QWlH2SBoWp/P7ShwEt51HXLOo1gU8u7xO1JzTl7EJdJwUr5VaWR9LiXXyhAGYoU5Spb7gHY0tv1oMvb3sJZS6BVluBaCQbERdsIhfdLSIUmhfGJgvTMV7DS4mwxr4FwDQVdMrAZLUCh9c+rtjnvf/h0NbAt4369DJaq0nzXyb+hE8a7wrFbrCTd6YWoyOGuY/VZzj52YjzoTQ9Gbq+jMNHwV6x4LnNcUXR5xEHxacEplC6qqJqghi71M9e+BhRACQTqSLtOBmnpoyesZPoOKxzLFWcFtTdoz073o+AMUHTAccIckRXyiRNGB3cu05kiDwrDhO79xOg==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(261022075727099003)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(261028144727099003)(261026140227099003)(261102123227099003)(261022105027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0YG2HBQzSZ1Al6OM+s9yZP631oM0PEB0XV4Baly/kaYXBc6sOl5Y7R20EHDDSBsUxUzf0cLL7tELZlHtBO6OE6cMUmOjEMqpLKFC7G6Q8QUf9KrV7ukTxvDjW3OufoltkHppAbEpq0KwSTri0Wz0k7Y626fkXfKKjVibknA2CA5mti7JWsJlxyIVZb2rlfo8rTXsHwdk+eFP1rVyeF71lTKhI95e90443OVdNu1ZHd3NV4IB0vDPxInYQMPWK727XSxhX+RXlS5MxY+s6/SEArQYshJeFK0I+XbvKBEruXK4X4tLQ6Aor2cFbEVlqW9ZMYBSRPSBlbrwRf8NjUtQmOhGdxvxF0W0jDMLY/Q2JXBJ/cjn3ptuVZpF+Q1C21SxM4gw2pUa/QJCNiYAjdVsknJU4yo8AqLNfpxrZFYea6MpmJ+JWvFRz0wZo24f0/+L
X-Exchange-RoutingPolicyChecked:
	QVeObkV2QivwosxHkvzFqQAuXfVCMNtUrGLdsubxkaV2gTf33mi3U/DxMn5oYK5fAe3n8wzHFN4h+GFYyQar85+KIeCmiiolISA0F/uXbSX1cLdZVKHKrZgCITgbwvptgx4tj8geBgsYn0UdoWatFn+gsVPKL4Ducz4k7CQ0yeoIsMTeuC7jmvTIFC/m/2Co0+h4RrdDqZ4iuxacGt83Ed8PXC8D2LXkHfpmT8mcZjioksNLPv2gavPEfN7k/Z5SLDQAqf9yEZVAYlmT8u5RJMDqGEZw00T0Hq3ZnH2DQ+FryM0lCHI0HsG63XofsPJ7IuKwqgwVtrbKY7XFvAlWPg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	u4XT3zLA5awHBXZseEZPVw0j0tbPJSbFeNZ4d+Gyd0ZDUxcvCpnW9UWlOxgvtfe1l8udWMPAcmabbdwntnduC1GxDlCVC4AQXKbpzp0ep6yck0kb2NALk8bH9sca3xzW6XUeKzh6WmFtVBl1Hpgl/lAEHOU0ZRlNgVYvoEph5IBVb5I1tNohHJkDlhiPFeRIA3HGqJZp1gE/oXptZIecsSPggUZZxnoj3oiFGviZkAzY/3MADwLXmBmIilXlmJNnJtwd8fDaiYbwP8oFQufab4amuMlk+t2injjRWUfR2QP+03bayTX4f29xNrQkuLE0fVVIt6fIrALqKXwKJ+mEeuxm8r/btFYrA5LpeDJeAMAOUbqUiGN5Dxpqr3G1u/6VoxFgfJt0Exu5g/qDtGj9DkQhrMaxjkk8Id6YqnlDMXwUIScodo6yW6NvVqJr3EzK6cd6jwT+jMeeIeq2ucwbMQ7Q/pLseq776dxXD6je5vb/Dmpvppd62mL122EBsvr2B4rEJEHCbKEKrsY9N227UQwsbkQE0sKspZBIBNe4DlCN4CuuJlWBZ40fl3X8XOvn67CfhF8myrDHLMoJr2yK7lqfW9eFI+y7bUbwG6DYTNB7Lrsc4gClXQpHZvyZU2IZxtCDNb329RLBCGchrF4gTw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:35:08.2255
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f803c5a9-24a0-4854-6c6c-08df3add06a0
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF000793FB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR16MB087844
X-Proofpoint-GUID: oGQYiwwe1Qv4fqW-RitbcpiyK6k3Ox_G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfX6tRb3zyQneHK
 oBzZoMlbdJDQIOuhaiq6mGC/0agDm8T1OcajNHayOHhjYiSyNQXw+ST9Q4NR47H/IJyvIpdt0sA
 nHGE8X4JFpTYi7GYHW3Gfvs+54gqEtTlA/HSF3ghJYrbARYJMyoa8EjI2AG39F0WfTx3zjjjJ9L
 KxRItPxjz9zADonq8DLzS0FXZ7eNKX1eEogc+kQJwrkq2kKCNcWK53CyrsIotF0Fgc5KWZUAx/Z
 H/VnWnYyFu9eAAHQs2jgoP353Fykgukrdye5+VIaJJqeRrqXWs+8DKPCjc8RESPB9uI0sSgm3+Z
 8Vfa4/VXUjL+ROLs0ozwqpGwdPaF/AVktGC9mS5G5+p+xou59MpTRotw9qy42NV3Tx7hEZF0WJn
 QxpUHREbhS3npq/wQMW0DZaY9LNT3AgPwk5XYtk+aUPWZ/9GfqYOi9ePX/xBcKUVtWJDe1BV8nk
 aQq6swb7RgqFUQq9YPQ==
X-Authority-Analysis: v=2.4 cv=T7AZ3PKQ c=1 sm=1 tr=0 ts=6aebdd50 cx=c_pps
 a=imb72M7KABO0D7Cp285+Zw==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=N9_n2FxmZfwfyRXvS9-E:22 a=cbNQJ9GKAAAA:8
 a=PhQ_d4hdkDVKxeSN50QA:9 a=3whSkbs7g9Me0DR5EJEX:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-ORIG-GUID: oGQYiwwe1Qv4fqW-RitbcpiyK6k3Ox_G
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfX3kiFhynsj+dj
 M7QMTpHRGLRF+66OQlKkroXs/mLKK4+GrGsP0COXzrK5GgnW3P+j0KwGj3Vp2UVzAx531D2ANV4
 zhxFiXGmODiB4yS5EABWvmM5zHyuPtRPE0eih2aspdYkzM31fJTV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050005
X-purgate-ID: tlsNG-c1860d/1793842514-D477387B-5F0F9D40/0/0
X-purgate-type: clean
X-purgate-size: 1201
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

AVIC in nested virtualization environment is not supported as of yet.

Ensure there will be no problems in any production environments if AVIC
got enabled in nested guest by short-circuiting logic in
svm_avic_create_vmcb().

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/hvm/svm/avic.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/arch/x86/hvm/svm/avic.c b/xen/arch/x86/hvm/svm/avic.c
index 37a857f28d14..e19489bd485c 100644
--- a/xen/arch/x86/hvm/svm/avic.c
+++ b/xen/arch/x86/hvm/svm/avic.c
@@ -4,6 +4,7 @@
  */
 
 #include <asm/hvm/emulate.h>
+#include <asm/hvm/nestedhvm.h>
 #include <asm/msr.h>
 #include <asm/p2m.h>
 #include <xen/param.h>
@@ -170,6 +171,14 @@ static bool avic_vcpu_supported(struct vcpu *v)
         return false;
     }
 
+    if ( nestedhvm_enabled(d) && nestedhvm_vcpu_in_guestmode(v) )
+    {
+        gprintk(XENLOG_WARNING,
+                "%pv: AVIC: nested guest is not supported\n",
+                v);
+        return false;
+    }
+
     id = GET_xAPIC_ID(vlapic_reg_read(v, APIC_ID));
     if ( id > AVIC_MAX_PHYSICAL_ID )
     {
-- 
2.55.0


