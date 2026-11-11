Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725BC606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 19:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=ugRfMHhY;
	dkim=pass (1024-bit key) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=Jpg5eVlA;
	dkim=pass (2048-bit key) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=NuzaOni9;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=ffBSN+dD
Received: from list by lists.xenproject.org with outflank-mailman.1484721.1688073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREJ7-0007pG-3J; Wed, 11 Nov 2026 19:48:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484721.1688073; Wed, 11 Nov 2026 19:48:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREJ6-0007p8-Vg; Wed, 11 Nov 2026 19:48:32 +0000
Received: by outflank-mailman (input) for mailman id 1484721;
 Wed, 11 Nov 2026 19:48:32 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xREJ6-0007hG-67
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 19:48:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xREJ5-00H7tc-Iv
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 20:48:31 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c67e-2eae-0a2a0a5409dd-0a2a4504e362-38
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:48:31 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c68d-b57f-0a2a45040019-94a3921769d2-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:48:31 +0100
Received: from pps.filterd (m0367123.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIYOK33902292
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:48:29 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com
 (mail-northcentralusazon11012067.outbound.protection.outlook.com
 [40.107.200.67])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4hvtpxthrm-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:48:29 +0000 (GMT)
Received: from MW4PR04CA0248.namprd04.prod.outlook.com (2603:10b6:303:88::13)
 by MN0PR16MB6475.namprd16.prod.outlook.com (2603:10b6:208:4cb::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Wed, 11 Nov
 2026 19:48:23 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:303:88:cafe::7d) by MW4PR04CA0248.outlook.office365.com
 (2603:10b6:303:88::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 19:48:23 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 19:48:22 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIZZjv4131341
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:22 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hvjh28uew-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:22 -0500 (EST)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id REItx9Za4Rja9REIuxrCFA; Wed, 11 Nov 2026 19:48:21 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=7HC
	KkpNOBEKlTr0ei7RZ0b9j9J+svbeaoHEGbMMT6R4=; b=ugRfMHhY+yjmUfG5qW1
	LKXgwYZOMqdxeQcvI+XCrEjZojZHWTeSMMoueShvQRN/ziGKc5ssLSmp8oe77E9f
	EZQ8t4AzJnwoz8iVS/hMAHN7xIHiB/i9ZlXOhxFKyCNv4jHQ6XrRRJmUKataO3X2
	xxdoMz7RlIxlJQgAKIgU4mzaFrX5lZzfFjQgI84/ZqxYiiC0qRUPmSRXD2c3MdLz
	iBGxTbl1P+pFf1Gd+4+jZ9SBF3nxIvIqxx+FyK4yi4MfBS0E8fdVFmhlgl8/L2C1
	efDOjQG98elT8LdStggnQULcJM1OPc1cXqQo7crQFFElSyOZMO15PT5vx4LpZ/3J
	3Ng==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8s7ZCpJRFZ1Ijo3jmw0FcIKEGdnPBs0SiWpBQJuTrA0rCtsGEnZMwXTqoZPFpZbhwq8yxcqXvRm6yd2dvKT78AajXJ0iGuz1FBuKDYfxEbsHUy1Hz8Q03WtVQcDklDubTGoSUiSahQDqzt2dPlb1ILkWEwk6jWIdoz1UXvxjOuQzeBT08A/xySyoPaGovhy9a0fuWsC6lMXRyRe1Yga+wPUPFft6owY5RDCNZG2SV/idynQ16f0ZdjiUW4FASq9c8nOlLg+TWNcKKn+JZtA82pQENiSSVr6yXF/Ju9tCNW/TLfwK6nlHMOtXynMyzqF0inUoUz6RcSrZ0TYfSF7Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7HCKkpNOBEKlTr0ei7RZ0b9j9J+svbeaoHEGbMMT6R4=;
 b=RDUIeOMhsBpmmIbLoXoHO076jGV4h0ck0HGR4XbnTeu8ccFob3qEDfZAnO6Cmgl2YnPL1f5S8t5k/Uq4t+DcLqZ9XBdqiNourkCHN5kBXu2x/SV829rh8FoOyGeJPGuSszH9db/PDzilZPyBAsb2zFsNizRfI6HfNlYv96ONpyxnulrExmPeEaUMYGqxWSVwvbTmTS7129fFpcJ8rZLzwdWJONvQ7Jq2VyyQNeWAvLX2MmbPf3NF4DBUN34rlm5TIVEfBDVmn/A5nqPO5lPspBykYynScGgnrDdQ4XSFGHpGsTtTQicF0efulG4Ly8XUU5fSD5Bv+LSEty3rSKuk4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7HCKkpNOBEKlTr0ei7RZ0b9j9J+svbeaoHEGbMMT6R4=;
 b=Jpg5eVlAFKALtxdd/Od/8T7OI4vToWhzdJ9S5NHb+qUpYN+BELtSV5BrkSzIYx1pXysSkGTKQPwMerGh/JyF6v4xM52ldEimz3PR9THCLk5a6O6GYrrih0+YQ9hpzUOpKnzB4+ujQAPfzG4Z0O/VbPJ5ZA1Fsps9pBDfbZb44hs=
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
	ppserprodsaar; bh=7HCKkpNOBEKlTr0ei7RZ0b9j9J+svbeaoHEGbMMT6R4=; b=
	NuzaOni9YYNA6DxtvL9/MHTompJtouiSq8yNObiYDlY6/I9zQYyzlCIknk/6R6h/
	JyRPZS4kjrvhiwLi0Xp90snu7shj/LrQddtuHCcpSDJp2Qv/GejPRRBGJeMJAsHY
	80Gl0U4RetJHyS1g4jkZa09rMaUSdwVY+9VqOT26GnpssfEeWZ9artha1CK/JxUf
	zNFW9HAtwin4zHDsje/qpQruh7BvHWlRvEs3kvsoBmUw1ZKv5UuV9LNlF4TesjwP
	SBH1y4fuL6GOXL0uxdz3Yh4ASSoxV5tv8SVedkVFt3LHOZyDFkQn7oMloeXTHINM
	Tx28L/zIOJvAlnKqH0x+Fg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=7HCKkpN
	OBEKlTr0ei7RZ0b9j9J+svbeaoHEGbMMT6R4=; b=ffBSN+dDllrAYg4iltD402d
	VSIMdq7zdtvDf8GE1tyRua7lS89rIbwc6vAFiOcs2zXGJ/pf3ioHOUumwzatcN6X
	eUuahk1K7vEjZL+V1O8ujWmER3121VUec38USRMZ7GObDxn5h/pos2ZTWcbD1M01
	6Nhq9b42OEhY6UQm68IsVCpBhtTkOVXv2cCDkktzibdrYIlAS0rrhZTXYxAgXp7r
	pMc8+hPbvJCO4LdusEFHBPK5Upxb7+yEBhLHLycXfLTMzIENAN9nCnYwI32KSZ3X
	S/0/L3f1302O4QLkSuJd1PGZyRr2kQBRr3npHYAk1DRoCZ7C1kYBW2gEX7zOLLA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: REItx9Za4Rja9REIuxrCFA
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v8 05/26] emul/ns16x50: implement DLL/DLM registers
Date: Wed, 11 Nov 2026 11:47:39 -0800
Message-ID: <20261111194800.1070016-6-dmukhin@ford.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110078
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|MN0PR16MB6475:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 62479a50-4480-4780-5a4a-08df402cbe9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|18002099003|22082099003|10067099003|11063799006|261021121427099003|261009223027099003|56012099006|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	MFaud2gWUbkL1TaYmDGdGUNIFafNRbrO4c1UAUm23eAlyKfDkcVJDPj6FL5dBbFdd2yhPNgk3bwyaZ1jEaWhETYg8WgnSnH6TlfwjAz1hboWdS/HqtYXXRQBvw9QEHgLaXy5kL8tbQ3RwGVfbXblwd5GPK29IRzZU5G1JOjkrnH0IeEFproZVaYU/oVtHKJMv7j+YvBqSiJP+0t4mr5oWH4O2EfzJ2GZXGDGi6ArWm3orvl2fiYI/AttLxEezWezkmhrXNw9HXIQLe59Ek2y25MIIIzvEmun59m6gsvNSBzvtgUOc8rfCslM0B3kRO7mEA67uZJy0jPueNskGZvSsut4ZlvV368JYqa670XN/4PyJqyUIKY8j7orJZq40rKZ7Lhelke8l3CX6R8Wt39TkbUHyVU8mHKyJ2eBRjgoeeBHZds6XWPn3D7YI3+bR5A55QKAkZRl8qWNIGqvQWLDHTmreaNkSePfFoE0Q3/mG4ghtGLbt07hMSZ0Xm2akgQ8K6NdH5pU+KMnN2/NLMsHJ6ORg+lWJtAFruSChlf0JZI6CcsKIn7GcYdCmeop1yfJ0jIoTlCO8eIPETuOYClleiC3+CV86d5i67XX/f2ixH+bvkvUcgD912kGIWqLVT5ELGVcbIv6JZsi660GkKy5Ae99Rm+DeZQ8Ltku6VAwIP0Uurl9JsaPykMQJQNCJU+hkfwX7g8iTetU2RlMpSSwTQ==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(18002099003)(22082099003)(10067099003)(11063799006)(261021121427099003)(261009223027099003)(56012099006)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5yFhNiEqb7q/TmwKtmqWfF4HsKRihq9XhhlQk+5mlsCQrX044jccpKswQD2/8SZWejVa9qjo54pKxXf/CNychfn/adZvbt6SohXTh3m3wtMTlTSrG0Vp9iqHdPBC3cO3I4nE6W1k/9216YgV5df4FQ5ttXSknH1777VixtJQLAAjC+MslbsREgWuz3jhI2SvSoLryO7GIQFZA7mQkM01COOAlV7ONFSn+4QTlO4qeOmgC+u/PsJQe2XEMtsdjdtXe6ujwFgeUhqTynGYj6as7l22bBfYo7THkrAMme7ALoDJ4fucTzEYUeUMfkn+TUXwjGOK6FlF6m+3v4tnQRwquXuqotCfX966f8LGfBXYZNq76yaRMxFo5vcyL6rcKQuYCYhpJPcjOMsJBjVwrtUpWGm6MY1ocLTvBSi2nzrMjD7KVDi7whmLl+5F2V3qjp2z
X-Exchange-RoutingPolicyChecked:
	k792LqLBf42HRjE3t0ArvwkmLLADWkoHfRFEG3S2IzZdCRkCw+PSkyQqQDOzbafft7UbXNXDAmd/ZWs4hXJADw+9LgM7IHGLILPb5bH/4ZsB+OfR1OyPBn/dYzGfu1l6pzvNvAi2/RhcFaiMUFDHiM1SZaJE8tX0Vt0XwKbI1USWLTpnhvPJFB2BGRJWlrQNLwrBSGZ96pV/qYV7esvpsikpUXwRXjesjjsrFpy3iGorA1LcL7BvPSorpV9NLpZIB4cvmTFzCN2mOixgBSvSKYVWmQzrE1h+PHJjBisoQI1zLR7M5FGsz9t+N8nmvJt5oZ+zJYQ9UzMgAJX10th7zA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	P5wsTx1lrumWgTsuLaXfoKy30boacWKigf51iRcInWB9j7dRGHABDUDDNWPUWaySrAhHyNZLkEfhwnMpUd0a4dDkJuiY+XpSix8obScmoXAaKXIWe54C3JTsKocy4HyQ2H7PS2l0OJ3+NyysgeNKslL4lryagYDAdaf02jq+id73IhftJ3w3SBpaGTyVFpD86AAXgSwaN00RtPCYVmchVjtDpFjGyiZGsS8Gl76oloElbTxz4UtOEiVL+bOyWmkw3d4YdIhH6jKzPoDdSFe3rBVxTuBX8mqsaFqlfwwA2gFEEL6lfMglTKDmFTM0Ao8NElnuU6TjUZfbKgvuNNLP27k8keisQABCT00rn2cst7Bs4J/nq57Beiv0CGtoRZE9kISAUiBBf8xeExf5NcfLIM9gX2r8UsOyDKtlalbjEEp0JY6UBmcLKSB/v4ykBFkEKqxtA8HV3Xt/1ll1BSpzPt3Q1ojTbC+j8rBxMtKAms+Sj4ZEWOdePVoD7cvMxp7rnY/y9Y1KymfljT44uqmA0Gobn7bogNG+nejX38DgQ19u6tWkjH6zqZ32Waxji28gorUZ+0Zkw+OIZgQ0Zd1n9ySc9EOzt0jn1qAtOQL0/tYfwBYA8iMys2AGkxxAIFlU+zPg4LzPf00ZJS+dfrdGNw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:48:22.9978
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62479a50-4480-4780-5a4a-08df402cbe9b
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR16MB6475
X-Authority-Analysis: v=2.4 cv=V6XoQuni c=1 sm=1 tr=0 ts=6af4c68d cx=c_pps
 a=A4Ph3AWZfT0pg7R4Z/C0uw==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=N9_n2FxmZfwfyRXvS9-E:22 a=cbNQJ9GKAAAA:8
 a=kMcBw35qR7WP7gP4RhQA:9 a=3whSkbs7g9Me0DR5EJEX:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX7oEy9aCHi/qn
 qPsVRMKpYdHaJPCHjMP8H72YBSof7tuWV4u8kiWBblB31QgEAfB8WqYrLPbgC/HnEW0ll7s2l1V
 UTHCXNGHV3J9IkKAxVk0uzs3lhUy5x1Y0Re1KkrYrsuDPETspWWb
X-Proofpoint-GUID: RVvscaLhLCj7atJ7YYsugLeWivOLDDDI
X-Proofpoint-ORIG-GUID: RVvscaLhLCj7atJ7YYsugLeWivOLDDDI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX6CmUyxh2aIXE
 wc/KDLxQukZhoxWfAQd+jn+9Skba57X9FeCAK8tJ2GaJphJEwEwP/9LcBzBYbI3v4R84GZ4NcAS
 CnobP0a6jFbcDQyQvqfgF6M4zecrsM2v7HrCJqxntj2aq1YinBEcGkFbgDBnnrMYEeM3DlnAIpP
 +88OEJ050MdrkvAHLGBA4oeV2wfpDfj1lt90DxCk7vdw6nF/NGRJEWqWOAJuVNxxi8WE3c1d9E/
 GJSBMxlqrjvMMLaAfMQJ6KcnkCLpCgrW42IoXYO72sDrDvQnui0S56sCE3QA3H98Zvc4+6FdIQ5
 VIx1h22JMVYdFx2nZhO/iXFmrqYC+tmGb+nnNG+zq+FHEbqsSmB6FfjGWZKrgOCxu9G4zghcREa
 uE36Yth6axkikKB8J3wWMmsjBdUa7uIzfs66v62dcHKwA9V3oTmsN7mg7RDyhKEn5r3AQLYb/Qr
 QrfMb+0Ey22ROnw+gzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110078
X-purgate-ID: tlsNG-ebf023/1794426511-C2ECEB50-127E7EC7/0/0
X-purgate-type: clean
X-purgate-size: 3887
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Add DLL/DLM registers emulation.

DLL/DLM registers report hardcoded 115200 baud rate to the guest OS.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/common/emul/vuart/ns16x50.c | 82 +++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
index 6e1cfecbaa55..80805ee6ecc6 100644
--- a/xen/common/emul/vuart/ns16x50.c
+++ b/xen/common/emul/vuart/ns16x50.c
@@ -119,8 +119,37 @@ static inline void ns16x50_unlock(struct vuart_ns16x50 *vdev,
 static int ns16x50_io_write8(
     struct vuart_ns16x50 *vdev, uint32_t reg, uint8_t *data)
 {
+    uint8_t *regs = vdev->regs;
+    uint8_t val = *data;
     int rc = 0;
 
+    switch ( reg )
+    {
+    case UART_THR: /* DLAB=0 --> UART_RBR, DLAB=1 --> UART_DLL */
+        /* DLAB=1 */
+        if ( regs[UART_LCR] & UART_LCR_DLAB )
+        {
+            regs[NS16X50_REGS_NUM + UART_DLL] = val;
+            break;
+        }
+
+        /* DLAB=0 */
+        break;
+
+    case UART_IER: /* DLAB=0 --> UART_IER, DLAB=1 --> UART_DLM */
+        /* DLAB=1 */
+        if ( regs[UART_LCR] & UART_LCR_DLAB )
+        {
+            regs[NS16X50_REGS_NUM + UART_DLM] = val;
+        }
+        /* DLAB=0 */
+        break;
+
+    default:
+        rc = -EINVAL;
+        break;
+    }
+
     return rc;
 }
 
@@ -131,8 +160,17 @@ static int ns16x50_io_write8(
 static int ns16x50_io_write16(
     struct vuart_ns16x50 *vdev, uint32_t reg, uint16_t *data)
 {
+    uint8_t *regs = vdev->regs;
+    uint16_t val = *data;
     int rc = -EINVAL;
 
+    if ( (regs[UART_LCR] & UART_LCR_DLAB) && reg == UART_DLL )
+    {
+        vdev->regs[NS16X50_REGS_NUM + UART_DLL] = val & UINT8_MAX;
+        vdev->regs[NS16X50_REGS_NUM + UART_DLM] = (val >> 8) & UINT8_MAX;
+        rc = 0;
+    }
+
     return rc;
 }
 
@@ -168,9 +206,39 @@ static int ns16x50_io_write(
 static int ns16x50_io_read8(
     struct vuart_ns16x50 *vdev, uint32_t reg, uint8_t *data)
 {
+    uint8_t *regs = vdev->regs;
     uint8_t val = UINT8_MAX;
     int rc = 0;
 
+    switch ( reg )
+    {
+    case UART_RBR: /* DLAB=0 --> UART_RBR, DLAB=1 --> UART_DLL */
+        /* DLAB=1 */
+        if ( regs[UART_LCR] & UART_LCR_DLAB )
+        {
+            val = regs[NS16X50_REGS_NUM + UART_DLL];
+            break;
+        }
+
+        /* DLAB=0 */
+        break;
+
+    case UART_IER: /* DLAB=0 --> UART_IER, DLAB=1 --> UART_DLM */
+        /* DLAB=1 */
+        if ( regs[UART_LCR] & UART_LCR_DLAB )
+        {
+            val = regs[NS16X50_REGS_NUM + UART_DLM];
+            break;
+        }
+
+        /* DLAB=0 */
+        break;
+
+    default:
+        rc = -EINVAL;
+        break;
+    }
+
     *data = val;
 
     return rc;
@@ -182,9 +250,17 @@ static int ns16x50_io_read8(
 static int ns16x50_io_read16(
     struct vuart_ns16x50 *vdev, uint32_t reg, uint16_t *data)
 {
+    uint8_t *regs = vdev->regs;
     uint16_t val = UINT16_MAX;
     int rc = -EINVAL;
 
+    if ( (regs[UART_LCR] & UART_LCR_DLAB) && reg == UART_DLL )
+    {
+        val = vdev->regs[NS16X50_REGS_NUM + UART_DLM] << 8 |
+              vdev->regs[NS16X50_REGS_NUM + UART_DLL];
+        rc = 0;
+    }
+
     *data = val;
 
     return rc;
@@ -310,7 +386,13 @@ static int cf_check ns16x50_io_handle(
 
 static void ns16x50_reset(struct vuart_ns16x50 *vdev)
 {
+    const uint16_t divisor = (UART_CLOCK_HZ / 115200) >> 4;
+
     memset(vdev->regs, 0, sizeof(vdev->regs));
+
+    /* NB: report 115200 baud rate. */
+    vdev->regs[NS16X50_REGS_NUM + UART_DLL] = divisor & UINT8_MAX;
+    vdev->regs[NS16X50_REGS_NUM + UART_DLM] = (divisor >> 8) & UINT8_MAX;
 }
 
 static int ns16x50_init(void *arg)
-- 
2.56.0


