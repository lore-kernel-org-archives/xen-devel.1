Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83EC606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 19:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=TB13zARf;
	dkim=pass (1024-bit key) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=RJ/yLQ3c;
	dkim=pass (2048-bit key) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=lsJkVp/v;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=kpbS6d+K
Received: from list by lists.xenproject.org with outflank-mailman.1484773.1688145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREJb-0002t1-UX; Wed, 11 Nov 2026 19:49:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484773.1688145; Wed, 11 Nov 2026 19:49:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREJb-0002ss-QQ; Wed, 11 Nov 2026 19:49:03 +0000
Received: by outflank-mailman (input) for mailman id 1484773;
 Wed, 11 Nov 2026 19:49:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xREJa-0002eb-Bv
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 19:49:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xREJZ-00BkX7-Oi
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 20:49:01 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c68f-e002-0a2a0a5209dd-0a2a4505ad30-44
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:49:01 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c6ab-4cb1-0a2a45050019-94a39217a7d0-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:49:01 +0100
Received: from pps.filterd (m0367124.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIYaTC2829295
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:48:59 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com
 (mail-eastus2azon11010033.outbound.protection.outlook.com [52.101.56.33])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4hvuxm9pxq-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:48:59 +0000 (GMT)
Received: from CH0PR03CA0448.namprd03.prod.outlook.com (2603:10b6:610:10e::11)
 by PH0PR16MB4166.namprd16.prod.outlook.com (2603:10b6:510:5d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 19:48:54 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:610:10e:cafe::10) by CH0PR03CA0448.outlook.office365.com
 (2603:10b6:610:10e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 19:48:53 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.0
 via Frontend Transport; Wed, 11 Nov 2026 19:48:53 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIXKmf1790364
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:53 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4htkgbn3t3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:53 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id REJNxf2khQVyyREJOxG24O; Wed, 11 Nov 2026 19:48:52 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=LvN
	0dNJoLAhoz3gqUbFD9arKeG75QKPabxxW0qXtj3s=; b=TB13zARfX7M/rhzqFXQ
	5ajtAA7OA7pw4eOpTIkxG9VcDIrwcO7uGyENrKZWy0znnt5OrGzv5jLFBcVbkTyX
	d0Q7yMj2zRw9I0w0SImxOCbSGJsWwDqtbrtkUo1bcIh+IVLtPslgDeYjYjx/4hji
	DkXqB6csW92VDmKs1QKBjwVrpzqkopo3L2uyyCdS20aOUMGBDRbpzT3dBZQkcFlG
	WXL88AV00pp0bn/Mue8eoDCRza/nin7ptBJdPBGP4UkFZ08xVC/SVPfXuoHSGQ9d
	YoWbeJzqxd6c0ox0BH+5bn7WtWGWoXfJ27W9YR3gTTlq5aryxIryJcC9+hE/BlLZ
	fxg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TLCUdSEJi0N8DqyVktpllbfpP8HAPCAJu9R1cBfyUCi7338O3M0ih8KPhAPaEjxyh0gmgJo9kjAB1mEqzCGCENfNNh81876Pfq+AMHAxrLXOWkVVCr0gUE34hwbdYq8NVKv9GAdDMqUQWQtYM6CDRzzp9bR01Jc8kX9ovXYIsplocxRP9qWHEc2m3qBbxIUf0zH76fIEACV/xLhRehiGpgKYX6dj0eVyGghxOuS3mJJgGClaF+OIqbaIaXQbL3GJ7+dOUSgUE5v8hIFSfxOwz1GWSFPMGqNYZWTdH9a20A3AzgnEWTTZgBU4QQly4e3vjfIpYDXH7tfrwjqn7OqrOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LvN0dNJoLAhoz3gqUbFD9arKeG75QKPabxxW0qXtj3s=;
 b=CQBuPDezxyqg6X+Sw58oiJsL92dlMwE6M8AMr8k1SNTvu0ovg2oYGIP/2O8OnwYM59S+IaL8twIASEEaFSBBeHkxKNklsH7ifYWCzcp9x4vZHG3qLlfiEF+5dBAbN+dS357x58GNtk0jWMasLuLk0uEQTYnKXQnJeZwghD71Z57uyx5M8B4vn0vqLEyliKeXX7GWMIGJL9iQIazmsj80+wo3od9qcHedfxvFMZfqtP9e+EZyyUe2gXQn0kD6aVF3xUdx3GKc6QhSH0DI/F73Oba3WuI/Tc0/BWrX5XrhQ4MkdEdsJNRVy8L8CQLybd0nGBEsR2WJBkjGpYhWQIFZNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvN0dNJoLAhoz3gqUbFD9arKeG75QKPabxxW0qXtj3s=;
 b=RJ/yLQ3cOktiI4BU+dEqnqnBeYVxShkVysmWXe1awd5L3sFwVRtfHd3Qhfrsp7C3hBQwWebVDnzqzNvDLoccvSCZC3NCqtQqCyJrR1AvLHGqE/i5rFRqnuoP7pI/PGqL2DTSn5/eJDcrImhynSoBwh4voOBcdyVlniKT2bT0IX8=
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
	ppserprodsaar; bh=LvN0dNJoLAhoz3gqUbFD9arKeG75QKPabxxW0qXtj3s=; b=
	lsJkVp/venpntqf6V8KOWzT+QIDvFSViNa5qAhMFIJO6gWIrO9K62vOOGStio7JT
	fkJmNYegGiWQpap7ENx8Ci1M7oeAWWlipto6LZlBqDr8aBDANTZr9HiFBQKZC6n1
	2sg60H2jgsfHb1TV+yZNjp8hN9wE9x9SLIZw/WLUBJOGX/Xi6QBMKq19goSnJD86
	biMPZjEi3qq+/LcHemCe5gzQSvlNSRNmGWzVKptbBmcLO3SbBtewbJ0q91i9A4lm
	qpIVi5bUpqLC2Gtf/VzN1KdJsiXON6N+8Pj8uk0lAlIliwFQ+VTJc58pSC+buCKw
	1Bmr6H7dSmZFhRtlo/1+Rw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=LvN0dNJ
	oLAhoz3gqUbFD9arKeG75QKPabxxW0qXtj3s=; b=kpbS6d+K3La9XzGuE+hpVpS
	aPgvb/ksh8U1pVNSwjYbeuiLLU+QOrvUZu+CPhClhcUeryhr6Nu06jKM4nFIBmT0
	WTqM+/1ZMQqBm5saMEpuaS8O2qCbV70a6g5s+xPImubnfpXkhLw2Y1R4B1I87jvK
	BhmAgVXV4f8sf91JYgw7AOkFocSKjASliha9lQNLMa63ITCVcA7y36Y91UyWFRVl
	QSwlboHqhsF6Rt0zxaBR+GZiAgaodc61JWqHH6bqqs4DVGHMFPZ6UdBI8c158SdB
	Bo/LEWXfp8Ix4YN9TIzyNQUG7+k37KLXiwN1SfpOTUqrCPhc5aktIrMFtrIFY4A=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: REJNxf2khQVyyREJOxG24O
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v8 16/26] emul/ns16x50: add Kconfig options
Date: Wed, 11 Nov 2026 11:47:50 -0800
Message-ID: <20261111194800.1070016-17-dmukhin@ford.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111194800.1070016-1-dmukhin@ford.com>
References: <20261111194800.1070016-1-dmukhin@ford.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110078
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|PH0PR16MB4166:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 10454665-9454-43fc-a7cb-08df402cd0f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|23010399003|36860700016|1800799024|18002099003|22082099003|5023799004|11063799006|261026121527099003|261022105027099003|261026140227099003|261022075727099003|261028144727099003|56012099006|261021121427099003|261102123227099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	7cd6T7WnbWj7YXUlxQk6gxxcpI0tIHIqYusB6vl9n63Weo5BCzeRURkmymEjK56Cgabi6dKCVC6eCkNYx81MH577bLvLLCRaFkXz6yvhL6AXcDLe6RIaep/RsPKoRa8FunDW9vo3VPlE3rFLdkJghpbTvak7iSBdSMojsOZTcyIKqana/KYCmYLhrgxYpfMnXP/hbpQraLbbyyHk1CCOoX5RT/cVH25kc+AjRrwC9qYKMpLDFf5gbrwS81/3a/M8B8k96vnaCIicsb33Kt7PPYWnasJdWqJm6x0MAkBwE1uy9Xj8yyyIRtMjQn32YMUiqS+NHbQsAoXyI8Og+VYBmsfD5itLXWdWlGMNMJiJzgLGjbfSnIwQgO8LeARZrKay3Ff4fN4YRWSiOACxKBI+frrAz7DAag1+oW/ydyU24fm7xDufKoctHP9GkuY8ok+FiI0KKyIn4fljV9FtvGlRywVqxyc4miYhH5wM57HAXYuLXSfuwod8XgC5iMGsJ/A9KPsk7EFR9eYf6zQCIDIMBo5DA4O9HxdIYgK61Ylj2XjfKncpgzhiiNnHj2GnAKYFf5egdnXI9gvR/3oV9xBwgMNGmxCDtY9eNFCyaVn0lYwSldTRsiVHPpppLlXGM7r9kLvJo8pMo7cWl01PaVvtKX/UFrvq4rZ7WFr6nhb6BZ3pPLrsHBjNbd09H1yzlUyvZpFdHXHEl7+oeZ93CHuSeg==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(36860700016)(1800799024)(18002099003)(22082099003)(5023799004)(11063799006)(261026121527099003)(261022105027099003)(261026140227099003)(261022075727099003)(261028144727099003)(56012099006)(261021121427099003)(261102123227099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VbWfUOOwVyuOS2FjGNPw9wRVIlen+4VoxYO7S3Cki/3pymMnrBS/zsPwSO8TbZnAWXjeYz4s1KwYFVzhPVzzPrsgygxFzJsSO4ODrdKVDAWoY49NUYrQ2KimkQpkseLSVF8BXPE7VT4wcL+Zblrl+nIgfc6KUimC3nTujss2SuWTZlpsIbk7ee7+4m/cVEnP20W9UpG+Q/UHTsF5s0g4KIvwgQDcTxjBOQZxMVFSB5oVGxzHyIDz4Vc+kS0xrRyIK/LWdGblMNUYPYVSvksOcXxkksbmWpb8ICwVGWZk8LciWmWbrqdslsZGVv80/XLc8nDdeQICEOdFuy1y/KyPdpeVAo74xjhdXKsTDgWSMvrGpVFdvV9HMhnRS5m1TvTT7UI6riDU2sHYfcIt4X/9OhK6FnaOm6sCKdt7yiBCKSpDdciLxhIjw/zSdln0sN3G
X-Exchange-RoutingPolicyChecked:
	L70R4l/zDAKivbEBFgJqW4t4cOjDX8lyQDsBZWxjT/mfzSPyiiNqvs7XU+KwUMSAmqKVwP5gwZNQaBLF/DYLk4J4y0KdUibyI/lwUDKoWIA6lkMalX7CQfByGZWAk9hcX9cDA8L43kGb/Mt0dCFzVBbH6xjUAldJhkqnCwTFWs/M64gdVEZ018ME1A2hCDtkAfv2U/EfWDEmIy6K4JgL58ntWdmS6+KaLIyq8cM7/e6z+TxqB7IEJptZIppd1pw0ZqEw5d9MzTk9jamr0a0vhxn/9dQQ9VfTQq+Rnk+uZS/ahIdIEM9FXPBLN0k21IjNpCKA/CKC0WiipFsCEZbvmw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zIgmFwd2pBeft0/bBXwGWlqWhDWJx9v9lYugOeKf1l5YddwbI7nVP/4z5+2FCN5oQVa9GhQcl6aaqkHxXjBkUC2M6IZW1A9JowqT96o5gT3Njhpn/qkipyHXNfn5BGiEpj6XEzu7/OA0WiKkJfKP7R4Fe1rzmegsCeY5DvGq8NNaiaX7AoqOUWvQklWeT/cQ+2NBOBSmqjHjbxrmYhkn/4YrtQX1dQxj9ee1UzgiA6r3kelSI5GhNZl4VWFLCenzsWaH8/p3fZmV6StvdiwX5Snb7voRdrJY7Ln4V/USbTYExXKvrDgmuDiqLsaBKjgeSGJf3t+SZH7+mjpkR7yMogADqOgyDJyeO1w0S/asflAe85ZkEC37tyNiWoADCemc20MPTYqG8C+qHfhPkHTGzMyMgLEbtNWetEiP7fvyueENle/JSPJQMCgQ2ytRZM3EVW9aeY4+HrNLLkfga/ctoJ0um9Chp5Bl5YdMlvPUVAK5DtHXfB91Skip/voNTTOONQ8fMswZBAQwibaSjJb4WA9Jzj0NLU6k8FLE4IDr09G71HqrrtPR8vDhsS9IXkl07myV2XU6LFCljfz8YPhS7cGp2YdeXxQqfL7O5gByQygCC3tzCuqfmpRd9/0ANrkSNnT+x6gq/fT0s3k4YLTKcA==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:48:53.7191
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10454665-9454-43fc-a7cb-08df402cd0f2
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR16MB4166
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX79ikg/7LFwfT
 m1mx7cEcEHXG/Lt4Hu60IF/W31fNZajFLuXdxXo5gtFmbJM/1s+4WnXz90cFhE7b/69MIew7ocH
 WfG0K3tqh73fSXGzuvjJ8LXdJtAf4rXZO984S49ANV07VYqPapyI
X-Proofpoint-GUID: _AHXp0k6R7WPQyYlXZ5_Qz7fQ7hl22hC
X-Authority-Analysis: v=2.4 cv=ZKBCCn7b c=1 sm=1 tr=0 ts=6af4c6ab cx=c_pps
 a=3IxC/HLiWPPRhiYFHlIRMw==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=YJXg7OVxOWrJwj3yZo-i:22 a=cbNQJ9GKAAAA:8
 a=I8d5eQihHCNpJxEVSrsA:9 a=DqJYxgmhk6moR-_7_KoZ:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX0s6P+KM4cuIe
 uGnERcSAIEaxblyW8Sv0hd783X8C1TRJzLJG0iQ+J9xiKIEhclIXNNnWBxuc0ZRxfDfHkSHcYDF
 N6EPT6Ihc30Pe6GTu6lyNWi5S16FsNZZlaNqoTAPLwf45darNR2Tzree4w/YTa0FWPb9tGMZOWV
 7yTsHCO2/k3IUhY5TMxlh5x17+gu8C+eGMawD2JflhcYq7pdOIvNjuf6cNhH0Zgh78KfdUmQhB6
 QZHuV/NevRaYeZEzO6hOAbz9aJxW98pPz1r4wTSHUBJ2rVhJw6WtW5eQK3TEWd20QPR8uBJoYVw
 qnVCtAttNgKvqjU01RLbBAcNXISkSTpMKqsD9ev4vyiHKFmDMHdJd7qHgx3WG7r8eGcuniVgz8C
 rNa9O4b/E0IDhDy2eIeC1s30IReQANWuQoVV/PsqQB/WI8K6/hvqWiCAeISX9Ia40hnRg9crgR/
 IcSlzS5dczI8oz37dyA==
X-Proofpoint-ORIG-GUID: _AHXp0k6R7WPQyYlXZ5_Qz7fQ7hl22hC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110078
X-purgate-ID: tlsNG-c201ff/1794426541-73CB82A1-6BB4509D/0/0
X-purgate-type: clean
X-purgate-size: 1209
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Add initial Kconfig options configure NS16550-capable emulator.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/common/emul/vuart/Kconfig | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/xen/common/emul/vuart/Kconfig b/xen/common/emul/vuart/Kconfig
index ce1b976b7da7..353a6325180e 100644
--- a/xen/common/emul/vuart/Kconfig
+++ b/xen/common/emul/vuart/Kconfig
@@ -3,4 +3,24 @@ config VUART_FRAMEWORK
 
 menu "UART Emulation"
 
+config VUART_NS16X50
+	bool "NS16550-compatible UART Emulator" if EXPERT
+	depends on X86 && HVM
+	select VUART_FRAMEWORK
+	help
+	  In-hypervisor NS16550-compatible UART emulation.
+
+	  On x86, only one legacy PC COM port is emulated for domain with a
+	  certain ID (set via 'vuart=<domid>:<compatible>[,com[1-4]]' command line
+	  setting).
+
+	  This is strictly for testing purposes (such as early HVM guest console),
+	  and not appropriate for use in production.
+
+config VUART_NS16X50_DEBUG
+	bool "Development: NS16550-compatible UART Emulator Debugging"
+	depends on VUART_NS16X50 && DEBUG
+	help
+	  Enable development debugging.
+
 endmenu
-- 
2.56.0


