Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAE3606A324
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 19:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=ku/VB0qD;
	dkim=pass (1024-bit key) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=RaI3iDgc;
	dkim=pass (2048-bit key) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=nUlkfJXF;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=ZENamGa7
Received: from list by lists.xenproject.org with outflank-mailman.1484940.1688316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREMF-0005S3-Ue; Wed, 11 Nov 2026 19:51:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484940.1688316; Wed, 11 Nov 2026 19:51:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREMF-0005Ru-QV; Wed, 11 Nov 2026 19:51:47 +0000
Received: by outflank-mailman (input) for mailman id 1484940;
 Wed, 11 Nov 2026 19:51:47 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xREME-0005Pp-Q6
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 19:51:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xREME-004llA-6Q
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 20:51:46 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c74b-bab6-0a2a0a5309dd-0a2a4505bcb6-4
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:51:46 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c750-4cb1-0a2a45050019-94a38ff10f0c-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:51:45 +0100
Received: from pps.filterd (m0367127.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIYTVc1667195
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:51:44 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com
 (mail-eastus2azon11010048.outbound.protection.outlook.com [52.101.56.48])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hvuej2442-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:51:44 +0000 (GMT)
Received: from DM6PR04CA0003.namprd04.prod.outlook.com (2603:10b6:5:334::8) by
 LV8PR16MB6176.namprd16.prod.outlook.com (2603:10b6:408:1f5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 19:51:33 +0000
Received: from DM3PEPF000265C2.namprd03.prod.outlook.com
 (2603:10b6:5:334:cafe::a) by DM6PR04CA0003.outlook.office365.com
 (2603:10b6:5:334::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 19:51:33 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 DM3PEPF000265C2.mail.protection.outlook.com (10.167.23.183) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 19:51:33 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIXSBO1790779
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:51:32 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4htkgbn3w0-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:51:32 -0500 (EST)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id RELxxLT6yjpGfRELyxkJR5; Wed, 11 Nov 2026 19:51:32 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=kPB
	8feFs0W+8NaBr9o27RH94qglQiHpoq+WeRob3TK4=; b=ku/VB0qDKWmeHEAz9eS
	J2EFe7Abtwhlq+kDm3uCJUdbr/xYmmvdHuvrvOQ5v8iqLRaeWktudBCO8NMC/kLt
	iIKCSj3KA6pvcEz1BvJ1+i1+ZcEugUGd8Xq62eSdZwfObooPCdRiEaIL4vzn3iTy
	FXRKLbP2ghidDHZplCoChkV+7qVNT4zZCTY+mAFxkyFkkt5Dcwzcmiu/QftCIU/+
	uUoYmnU/ZdACfanEre3ffuF1/Rqs4aVKK4fZy5rO4WFgfl2VWf06Ig9li8ASwvn1
	jiVv1Ft83t6m4XLU0qHd2bArg1stfEGZms235kmNleyaPy/z7fOlH7EoH0pA/ZmU
	NIg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v4C8fkqPTNcVbQSdZnpLAoBZanHnNS9iAUg4JWkezzbqd4UIDMdx2S6Nsnx7or89oWlq444UtgOt2BWeRExsgRh2nduXZaLi47LxN0jOIPetbOUySz0r9APYbjyZQ/ZGsHpQJy/Z4zoseWwmW6sB30iAiG486IpktQQRVGAUFodv2MXwiMBWWXKWg8dNRAiK1WtJEgNCVrpQDaF9myrLWKdzyWWseDs5VFbi5p7c5/mN5zXB6fCarEyQWgpXomBsq/IwpF7Bni3zW88KzKzlUaV8qUJs3lmKYFoWcPya70HK+h0dgea4Zq9IRKd/IhlWhmtA55yI5lns3UaLJRTHPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPB8feFs0W+8NaBr9o27RH94qglQiHpoq+WeRob3TK4=;
 b=UlfMzC1ZvyZwjAhzOPNDvVsUONlVcGQQJtoS3qia4jK/00sg2Id0jkihqU9pYLxpmV8kV7E+/glzYvmNLu01w7HZG5fiJWVL93v+4VbC54NwtRQRkpnzUWQHe1p943YMmsB4K9gxklUxZQKB/DvDMrlrAbUnNmwze2WgVRz+nVnVIGXpaXxsaxp9d4d6lek4fHG1H/CIbucR07VmU2+mVLSZUwviOQOTxBmUc8USq1Uk7FKDMFwdxpQysL1iZ/09d6D1Ay2h5njTLBaZWRGcW3cY/TfuTMbjfAeCGUxITz/ilf2RrmkABB/0yI3MV4I8EXlFBguFyRs2Z63BF613iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPB8feFs0W+8NaBr9o27RH94qglQiHpoq+WeRob3TK4=;
 b=RaI3iDgcowVZMNCkHRRm3iBumBBbnIRybFO5EXXbjmjsF8ngWKN5AeXpUlhtQo4hHY5deCGyPFjAisyi5eOu68UjduV0RzM1u7sYUgLw5+Yhb3Jm3ufS5IF16TuFeXtQ3/UuG3BP3hbywp7YFXvhyLpAEJFoNNJNI+MVfbpdINU=
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
	ppserprodsaar; bh=kPB8feFs0W+8NaBr9o27RH94qglQiHpoq+WeRob3TK4=; b=
	nUlkfJXFMhnpg5lFloCOcJocLVErKgcAUHjYPhV4mytsaTQbkcYqNY29lC5Lw88P
	q5a1VSljqWC6rBk1c0+RSYQq44tH7wshWqEmc3/LKbT0QUdaL/LsR7JTlpKR+loo
	BqfL8RTYxRgNoviNjZPExId5LdlnY3RHByo/ZsmSsKDA0EXnT6LjHCVCMUxlRoFY
	U3ILkDJUD+kaPRePHSHhF8iKAKmiO3CTz5EA6G4fkfZq73ZIUszmxG4T+WzxLFn+
	PHEhsdsEH1LG3k06e9hfewHZ2DdPCanG362eIiyMvo3w8i3xtFiXQg+eXOWAmIvw
	NJ1XZlaP7ymBoHNa3uKSlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=kPB8feF
	s0W+8NaBr9o27RH94qglQiHpoq+WeRob3TK4=; b=ZENamGa7ieYY3U6wextGp5z
	dF8IBC+d3V8WNuLFiU0qIAOXwtNHGVvzWTE/VcpzKq0V7AkC2J4mVJtpLCrQe4u7
	jLg9eawO3KD2f5oQk16SF7G4hCg99AvUHic/xciuTx1Q1tCAUNMu77CfLNdPceyh
	4RoLgwrf4RITbRPhVUuYESWXmr79NCDp6ghN34PRLwp0y0CY33lWMsQOdG7+ILEw
	B5Xa3N/pJQG5GIAoLenN8sxqr+10oeZVMLZFWo3fuP5iiAb8tNFoHM7tLpE3cpBV
	ceXAg9OShEsAA9ciF0LNfg7JzQZ5/Xf8Ocuhli8k0e4xniFEBy7mR+BB4/41rVw=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: RELxxLT6yjpGfRELyxkJR5
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [XTF PATCH v1 5/6] common: add simplistic NS16550-compatible UART driver
Date: Wed, 11 Nov 2026 11:51:08 -0800
Message-ID: <20261111195109.1070169-6-dmukhin@ford.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111195109.1070169-1-dmukhin@ford.com>
References: <20261111195109.1070169-1-dmukhin@ford.com>
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
X-MS-TrafficTypeDiagnostic: DM3PEPF000265C2:EE_|LV8PR16MB6176:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a1c580ac-1017-44c4-fa31-08df402d302b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|23010399003|36860700016|1800799024|18002099003|22082099003|3023799007|11063799006|261026121527099003|261022105027099003|261026140227099003|261022113327099003|261022075727099003|261028144727099003|261021123027099003|56012099006|261021121427099003|261009223327099003|261009221227099003|261102123227099003|261009220027099003|261009221727099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	XP4ibkLVefctwKtCw84rwgh3k/uLL36z/fGfCO/fP4MeK6q8nRNpjTc3mOFobHo43yfZU4hzCFsoe3iptRbhfpHlGbDMne4HIJls4yHKbCaFHReDDJUJiukX+eIJLMIwjCGOzVGf/jpjyWU8I+IPerzfRmiIRkBlGafYrE2ugq7RIPtYovH6/UXRCt65L3N46CWZfEjHcbd5Cp6LY8WqrcDgfC5nsUBBXrk9IkvXUZzh/+j+hxEyvSKWhbaYf4yxhYZIGleTs1c5Sfa8NwxYbNZ9rBYL5b6ORMGn8zP7+KAIAkYT72bit99P/or77YNo+P0TNJZ6TGyc7/y7W0f9ZJfgminB1q2NnpsfIWo7huparg1XhkR1zC88+TxSJwe/BFI9rKroqA95rGd0mA0KSq5gw995DhNYPhvUaIA5zsQgB6osiLrJh5K6dCfb1LauW+0yoF/5gAF+llZTBQVa1e1AWpg+FZ/pQo+uRjUZiSrFJ/+YA7Mi5N29GWhWLdGABBE7J+f7qMTw9gm+xc1sDlRWjsFQFHKZARk0Aw/si8xL+P7ZuGDaHPHvjhRWuzt1XqJ7Z4Tf7wk/OuDD9Op474K4JEfKVFUqhPKRZPyzoDGckqqWpjS7P7ZCwnjAMNOtzT7y7+JkqSpPbjdUTwThqD3OMuqL1pkeAJAXLIa03/BKd/0PJx7NDunmUfBjvdnLkIZv6TXK9EAOl18luaCRag==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(36860700016)(1800799024)(18002099003)(22082099003)(3023799007)(11063799006)(261026121527099003)(261022105027099003)(261026140227099003)(261022113327099003)(261022075727099003)(261028144727099003)(261021123027099003)(56012099006)(261021121427099003)(261009223327099003)(261009221227099003)(261102123227099003)(261009220027099003)(261009221727099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	K3j58rC7Dk9ws/tJ0jx+cOdsVVm0xiTrOBko/rW35zlFMyxkIF3FASqBIjoaxJQIG/Pr7FEgUxxUtVFvezY6jzJwiNLRC9aZLLZTZwdvxfesVrMVnxSMOuSpym5CSt9QNhVQjSS2qZ5PbooCjrUxl6t2G/1SMHdk7oavs74t/Z9UCkSQ+dLyONILu12PSZRcDcyix6R2K1ncI0iIZuCxT9UHHM8dY/X7PMObnRsQeQ+jDBNb1h2bpYIVn2a9Ts4t6VYwosAPw1U/l2nJZBAQ2aCZr7E3X7Gq9pcg+1orkhRx3NFAf1rBEQRizB8KIdT/UCjy08chepKl5lyk8fR664em5Egbq0ERp3OdkivQMXhxrm9pwNb9D/FureTiPUTa1Dlma0lp2HsHRjLzEItw9x6iY/gPgtBZ+E0Lbk91n+LYOmNbamROGMZFd2QRVLGk
X-Exchange-RoutingPolicyChecked:
	pIbTIpycga+xOVwXnG/kXYeUns1RsTSspaQQCI1ZEIwzhg5CtSbbr5cI9XJ7qBgO9d/rC2ttH8Xh8EPyqLtnuvZwRyKf5A2VA8592x7tNNUcmwA6MKB8+dEyb75TFvmrD4fY5ppobGMLLhKjjiJLiLyay2CFoXExbuSeIitTVoVr0BQ4QQQIT1wIJ6yFD9IwO+oxyakWzpSufUDx6gG1VmjiUGtpxfTdPISDqeWNaW+9siHXLh49eB+1OtBmV1/I1KBghwRT2EZ9SyWbPy5uBUWB584ft7IkEXrMUBvPONfbBHl4z5vDlWwiEi4+o6j55qhvAzH5mG8VSFNWA6UdNg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GWmSr2eNI8XKfM5igoPCDVvSy42IizY8eEeSE9ga8fRkKTLWmL+Zklpqrh25VC+zVduXwD5xoNTZd+BRpGuC4KBvWN7vKLiEJ92M3BGnlKox/PjLsVUXbvdQS2AcxvhNtywdWR63gH2+EHya2qQ0jRvkQDAQPvt/hzLpBlFRRZELSPENPtlpPhivq3YoChrhIkDTQI37tDL1zMrr2oWrVxFTIaLB/7n7kPPXYo5Q+8+O6Jcg0TEVwLAUvtQKz93W7QZkvIf7QoA72P3NrbMf6g/lEj2LTWophBQfDNAop68n7rU9rtudoQoLfyMjfm6D95HcGW5TgL0zdyt6xrxnkVeK8m0cpaEmyX7qGRqsjjg8/nAI1Ff2ZOGy7DP0wy/zTuy+U+lX7zwL/wRitTtPlTdVgPhF0UOe4jtIK84fqc2ECjb4QWlzIVM/DKoF1ddNZlMXQhb+bhuIwThB0+2qtjct4/pPfyAZwRM9KAMmDuM4xRnnXueoBGCF4Eq1hiWUAHm29pR0T5iyJ+PNe737X7VxFXhB0PU1ub+OQNSf+tyJZXAzoXBxULxI+n4ce7wMzamtq5hZ8z1kUe8rLy82TPL1+KIlU6Mi7cR1IIXGeturuxjrO2N00Kh4SI8EcRushBrtNsmAVgX1BEEdSkRt6Q==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:51:33.3989
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1c580ac-1017-44c4-fa31-08df402d302b
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3PEPF000265C2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR16MB6176
X-Proofpoint-GUID: cZLQqZUPWqhIVISiYEo8uZ5eCeu2mSvI
X-Proofpoint-ORIG-GUID: cZLQqZUPWqhIVISiYEo8uZ5eCeu2mSvI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX8u4MMDjSjfsr
 eQi+ofP0VaKTbjU7JGNowubeGIZqeYZVrb8qapTMiaCfr4MASAzulPZeXfgO0eH8WEESBS+uSf9
 mmwIIFNOM3r9l5SrTYGdCwqGedNwLnvxWw90rXOxHh7PYYiORWJhCi+TBtPcCI2Z2P2QobrJeIr
 W7qFYRGeMSZ0ypgE5XPY99XCTvOY431naHuPNOmks7OKC/In32YS7rJRbYAk/+lQM+47q0/ZmLf
 xkxyub1EFfkY6xOF5F/v44zpFSinJ8asIHZcVrgU+I69epQjZF5VeOW3NskOP3iYWT0iOPXuAen
 MZCx4f3dXGlsJfMmrvJh+MRjv5arg3TSxJpsEPQVlnvcBLjUiBed239lNnU63+tM6YGW+7Sf9eT
 bDKi0nA+IslUJzkD+Cs2LMIxMoNTZHWrZrN7TSbSEVUUh9YqWs+9+lctHa044sKHXZyEsEULwQE
 Dx+54SVn6unVYtbPE7g==
X-Authority-Analysis: v=2.4 cv=XspvqlF9 c=1 sm=1 tr=0 ts=6af4c750 cx=c_pps
 a=TQumU+mCWarTt0EIZfG+ng==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=dw5MciS7gY-znkhJuOLE:22 a=cbNQJ9GKAAAA:8
 a=DItcFVcSLPF-65BW0aUA:9 a=P0bj-C3X3jJDpopQwM1U:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX5UMoysxiDxh4
 MIZUFd1Ig3tiNKgYNoHp0Vlbmw1k7nrtREeKQwEuJmTpuxwGtDGukwI9r5AvQVH6q49KlqT/GOl
 VbLVPn036VqBHyVHFoc0XDE/WNbxGBZr93OGvfJ9pz2jplX4+PXc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110078
X-purgate-ID: tlsNG-c201ff/1794426706-F4CA02A1-96AA82D8/0/0
X-purgate-type: clean
X-purgate-size: 10593
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Add a miniature NS16550-compatible driver for hypervisor validation.

Implement polling mode and putchar only.

Place the code in a common place since NS16550 hardware is not limited to
x86 systems (although the current driver uses few x86-ishms like I/O ports).

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 build/files.mk        |   1 +
 common/console.c      |   3 +-
 common/ns16550.c      | 153 ++++++++++++++++++++++++++++++++++++++++++
 include/xtf/console.h |  15 +++--
 include/xtf/ns16550.h | 117 ++++++++++++++++++++++++++++++++
 5 files changed, 284 insertions(+), 5 deletions(-)
 create mode 100644 common/ns16550.c
 create mode 100644 include/xtf/ns16550.h

diff --git a/build/files.mk b/build/files.mk
index 11624a89a21c..841ea9ebc70a 100644
--- a/build/files.mk
+++ b/build/files.mk
@@ -34,6 +34,7 @@ obj-hvm += $(ROOT)/arch/x86/hvm/head.o
 obj-hvm += $(ROOT)/arch/x86/hvm/pagetables.o
 obj-hvm += $(ROOT)/arch/x86/hvm/traps.o
 obj-hvm += $(ROOT)/arch/x86/io-apic.o
+obj-hvm += $(ROOT)/common/ns16550.o
 
 # Arguably common objects, but PV guests will have no interest in them.
 obj-hvm += $(ROOT)/arch/x86/vmx.o
diff --git a/common/console.c b/common/console.c
index b3e89473a7b4..02ff90c5428d 100644
--- a/common/console.c
+++ b/common/console.c
@@ -13,8 +13,9 @@
  * - Xen hypervisor console
  * - PV console
  * - Qemu debug console
+ * - NS16550-compatible emulator
  */
-static cons_output_cb output_fns[3];
+static cons_output_cb output_fns[4];
 static unsigned int nr_cons_cb;
 
 /* Guest PV console details. */
diff --git a/common/ns16550.c b/common/ns16550.c
new file mode 100644
index 000000000000..fa2bae5ebf98
--- /dev/null
+++ b/common/ns16550.c
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: BSD-2-Clause
+/**
+ * Simple NS16550-compatible device driver.
+ */
+
+#include <arch/config.h>
+#include <arch/traps.h>
+
+#include <xtf/console.h>
+#include <xtf/ns16550.h>
+#include <xtf/types.h>
+
+static const struct ns16550 *ns16550;
+
+static inline unsigned long
+ns16550_reg(const struct ns16550 *uart, unsigned int reg)
+{
+    return uart->base + (reg << uart->reg_shift);
+}
+
+uint8_t ns16550_inb(const struct ns16550 *uart, unsigned int reg)
+{
+    unsigned long addr = ns16550_reg(uart, reg);
+
+    return inb(addr);
+}
+
+void ns16550_outb(const struct ns16550 *uart, unsigned int reg,
+                  unsigned char val)
+{
+    unsigned long addr = ns16550_reg(uart, reg);
+
+    outb(val, addr);
+}
+
+void ns16550_wait_tx(const struct ns16550 *uart)
+{
+    while ( !(ns16550_inb(uart, UART_LSR) & UART_LSR_THRE) )
+        cpu_relax();
+}
+
+void ns16550_drain_rx(const struct ns16550 *uart)
+{
+    unsigned int i;
+
+    for ( i = 0; i < 128 && (ns16550_inb(uart, UART_LSR) & UART_LSR_DR); i++ )
+        (void)ns16550_inb(uart, UART_RBR);
+}
+
+void ns16550_putc(const struct ns16550 *uart, char c)
+{
+    ns16550_wait_tx(uart);
+
+    /* Inject carriage return. */
+    if ( c == '\n' )
+    {
+        ns16550_outb(uart, UART_THR, '\r');
+        ns16550_wait_tx(uart);
+    }
+
+    ns16550_outb(uart, UART_THR, c);
+}
+
+static void ns16550_write(const struct ns16550 *uart, const char *buf,
+                          size_t len)
+{
+    size_t i;
+
+    for ( i = 0; i < len; i++ )
+        ns16550_putc(uart, buf[i]);
+}
+
+void ns16550_puts(const struct ns16550 *uart, const char *buf)
+{
+    ns16550_write(uart, buf, strlen(buf));
+}
+
+int ns16550_init(const struct ns16550 *uart)
+{
+    unsigned int divisor = uart->clk_freq / (16 * uart->baud);
+
+    if ( !divisor )
+        divisor = 1;
+
+    /* Disable interrupts. */
+    ns16550_outb(uart, UART_IER, 0x00);
+
+    /* Set baud rate. */
+    ns16550_outb(uart, UART_LCR, UART_LCR_DLAB);
+    ns16550_outb(uart, UART_DLL, divisor & 0xff);
+    ns16550_outb(uart, UART_DLM, (divisor >> 8) & 0xff);
+
+    /* Support only 8 data bits, no parity, 1 stop bit. */
+    ns16550_outb(uart, UART_LCR, UART_LCR_8N1); /* DLAB=0 */
+
+    /* Reset FIFOs. */
+    ns16550_outb(uart, UART_FCR,
+                 UART_FCR_ENABLE | UART_FCR_CLRX |
+                 UART_FCR_CLTX   | UART_FCR_TRG14);
+
+    /* Assert modem control lines. */
+    ns16550_outb(uart, UART_MCR,
+                 UART_MCR_DTR | UART_MCR_RTS | UART_MCR_OUT2);
+
+    /* Drain any pending status/data to avoid stale state. */
+    (void)ns16550_inb(uart, UART_LSR);
+    (void)ns16550_inb(uart, UART_RBR);
+    (void)ns16550_inb(uart, UART_IIR);
+    (void)ns16550_inb(uart, UART_MSR);
+
+    return 0;
+}
+
+/*
+ * Console driver.
+ */
+
+static void ns16550_console_write(const char *buf, size_t len)
+{
+    if (ns16550)
+        ns16550_write(ns16550, buf, len);
+}
+
+void ns16550_console_puts(const char *buf)
+{
+    ns16550_console_write(buf, strlen(buf));
+}
+
+int ns16550_console_register(const struct ns16550 *uart)
+{
+    if ( ns16550_init(uart) )
+        return -1;
+
+    register_console_callback(ns16550_console_write);
+    ns16550 = uart;
+
+    return 0;
+}
+
+void ns16550_console_unregister(void)
+{
+    ns16550 = NULL;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/include/xtf/console.h b/include/xtf/console.h
index 16a6a23e3f56..4830e511b080 100644
--- a/include/xtf/console.h
+++ b/include/xtf/console.h
@@ -3,6 +3,7 @@
 
 #include <xtf/libc.h>
 #include <xtf/compiler.h>
+#include <xtf/ns16550.h>
 
 #include <xen/event_channel.h>
 #include <xen/io/console.h>
@@ -16,17 +17,23 @@ typedef void (*cons_output_cb)(const char *buf, size_t len);
  */
 void register_console_callback(cons_output_cb cb);
 
+void vprintk(const char *fmt, va_list args) __printf(1, 0);
+void printk(const char *fmt, ...) __printf(1, 2);
+
 /*
  * Initialise the PV console.  Will register a callback.
  */
 void init_pv_console(xencons_interface_t *ring,
                      evtchn_port_t port);
-
-void vprintk(const char *fmt, va_list args) __printf(1, 0);
-void printk(const char *fmt, ...) __printf(1, 2);
-
 size_t pv_console_read_some(char *buf, size_t len);
 
+/*
+ * NS16550-backed console.
+ */
+int ns16550_console_register(const struct ns16550 *uart);
+void ns16550_console_unregister(void);
+void ns16550_console_puts(const char *buf);
+
 #endif /* XTF_CONSOLE_H */
 
 /*
diff --git a/include/xtf/ns16550.h b/include/xtf/ns16550.h
new file mode 100644
index 000000000000..5db515b7fb91
--- /dev/null
+++ b/include/xtf/ns16550.h
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: BSD-2-Clause
+/**
+ * Simple console driver for NS16550-compatible UART.
+ */
+
+#ifndef XTF_NS16550_H
+#define XTF_NS16550_H
+
+#define UART_RBR            0x00
+#define UART_THR            0x00
+#define UART_DLL            0x00
+#define UART_IER            0x01
+#define   UART_IER_ERDAI    0x01
+#define   UART_IER_ETHREI   0x02
+#define   UART_IER_ELSI     0x04
+#define   UART_IER_EMSI     0x08
+#define   UART_IER_MASK     0x0f
+#define   UART_IER_RSRVD    0xf0
+#define UART_DLM            0x01
+#define UART_IIR            0x02
+#define   UART_IIR_NOINT    0x01
+#define   UART_IIR_IMA      0x06
+#define   UART_IIR_LSI      0x06
+#define   UART_IIR_RDA      0x04
+#define   UART_IIR_THR      0x02
+#define   UART_IIR_MSI      0x00
+#define   UART_IIR_BSY      0x07
+#define   UART_IIR_FE       0xc0
+#define   UART_IIR_MASK     0x0f
+#define UART_FCR            0x02
+#define   UART_FCR_ENABLE   0x01
+#define   UART_FCR_CLRX     0x02
+#define   UART_FCR_CLTX     0x04
+#define   UART_FCR_DMA      0x08
+#define   UART_FCR_TRG1     0x00
+#define   UART_FCR_TRG4     0x40
+#define   UART_FCR_TRG8     0x80
+#define   UART_FCR_TRG14    0xc0
+#define UART_LCR            0x03
+#define   UART_LCR_WLEN5    0x00
+#define   UART_LCR_WLEN6    0x01
+#define   UART_LCR_WLEN7    0x02
+#define   UART_LCR_WLEN8    0x03
+#define   UART_LCR_STB      0x04
+#define   UART_LCR_PE       0x08
+#define   UART_LCR_EP       0x10
+#define   UART_LCR_SP       0x20
+#define   UART_LCR_SB       0x40
+#define   UART_LCR_DLAB     0x80
+#define   UART_LCR_7N2      (UART_LCR_WLEN7 | UART_LCR_STB)
+#define   UART_LCR_8N1      (UART_LCR_WLEN8)
+#define   UART_LSR_ERRORS   (UART_LSR_OE | UART_LSR_PE | \
+                             UART_LSR_FE | UART_LSR_BI)
+#define UART_MCR            0x04
+#define   UART_MCR_DTR      0x01
+#define   UART_MCR_RTS      0x02
+#define   UART_MCR_OUT1     0x04
+#define   UART_MCR_OUT2     0x08
+#define   UART_MCR_LOOP     0x10
+#define   UART_MCR_RSRVD0   0x20
+#define   UART_MCR_TCRTLR   0x40
+#define   UART_MCR_RSRVD1   0x80
+#define   UART_MCR_MASK     (UART_MCR_DTR | UART_MCR_RTS | \
+                             UART_MCR_OUT1 | UART_MCR_OUT2 | \
+                             UART_MCR_LOOP)
+#define UART_LSR            0x05
+#define   UART_LSR_DR       0x01
+#define   UART_LSR_OE       0x02
+#define   UART_LSR_PE       0x04
+#define   UART_LSR_FE       0x08
+#define   UART_LSR_BI       0x10
+#define   UART_LSR_THRE     0x20
+#define   UART_LSR_TEMT     0x40
+#define   UART_LSR_ERR      0x80
+#define UART_MSR            0x06
+#define   UART_MSR_DCTS     0x01
+#define   UART_MSR_DDSR     0x02
+#define   UART_MSR_TERI     0x04
+#define   UART_MSR_DDCD     0x08
+#define   UART_MSR_CTS      0x10
+#define   UART_MSR_DSR      0x20
+#define   UART_MSR_RI       0x40
+#define   UART_MSR_DCD      0x80
+#define UART_SCR            0x07
+
+struct ns16550 {
+    const char *name;
+    unsigned long base;
+    unsigned int reg_shift;
+    unsigned int reg_width;
+    unsigned int clk_freq;
+    unsigned int baud;
+};
+
+uint8_t ns16550_inb(const struct ns16550 *uart, unsigned int reg);
+void ns16550_outb(const struct ns16550 *uart, unsigned int reg,
+                  unsigned char val);
+
+void ns16550_wait_tx(const struct ns16550 *uart);
+void ns16550_drain_rx(const struct ns16550 *uart);
+
+void ns16550_putc(const struct ns16550 *uart, char c);
+void ns16550_puts(const struct ns16550 *uart, const char *buf);
+
+int ns16550_init(const struct ns16550 *uart);
+
+#endif /* XTF_NS16550_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.56.0


