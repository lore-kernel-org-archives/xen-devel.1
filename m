Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330D5606A328
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=kXZy/2Q2;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=HThygJ7n;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=laEgtucC;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=N1cLg+bA
Received: from list by lists.xenproject.org with outflank-mailman.1473214.1680865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmNW-0007P5-OQ; Thu, 05 Nov 2026 01:34:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473214.1680865; Thu, 05 Nov 2026 01:34:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmNW-0007Om-Jq; Thu, 05 Nov 2026 01:34:58 +0000
Received: by outflank-mailman (input) for mailman id 1473214;
 Thu, 05 Nov 2026 01:34:57 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmNV-0007JM-3f
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:34:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmNU-000xGY-GT
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:34:56 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd3a-bab6-0a2a0a5309dd-0a2a4505ed80-6
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:34:56 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd3e-4cb1-0a2a45050019-94a392171e92-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:34:56 +0100
Received: from pps.filterd (m0367123.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mWtX2568283
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:34:54 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com
 (mail-centralusazon11010004.outbound.protection.outlook.com [52.101.61.4])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4hr8vmvb1u-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:34:54 +0000 (GMT)
Received: from PH7P220CA0179.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::27)
 by LY0PR16MB450305.namprd16.prod.outlook.com (2603:10b6:404:201::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:34:32 +0000
Received: from MW2PEPF00014677.namprd04.prod.outlook.com
 (2603:10b6:510:33b:cafe::33) by PH7P220CA0179.outlook.office365.com
 (2603:10b6:510:33b::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:34:32 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 MW2PEPF00014677.mail.protection.outlook.com (10.167.249.184) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:34:31 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mTd13091555
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:34:30 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4hnycbnhg9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:34:30 -0500 (EST)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id OmN1xdHLJmeVDOmN1xZkSG; Thu, 05 Nov 2026 01:34:29 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=aIj
	ZuqVWwlCdqrpZV1nVy5ZvbYSxc2s85Odwd4BoSOI=; b=kXZy/2Q2heTvuwHvsHc
	pGbiRrSvZenRBSPXX+sLWolAYGllmfXUDKEOmM5nJTtXA9ZBALhYxe/YonpbYTYk
	p4NIGbU9NLSMimQr4oYInKHeZIBACgv5EyClD1/J04Gp/zXv17s5eQQrx+tSTUvU
	rJtZyZzOeBvMhyLcsArQflYWuoJ5R34N8MD5jer7oTn7GfLNsbYIqkLw7zvlM4Xn
	SVB4dgXo8NgAsOOTTiX8rqKyJUMZ710NopVq1XaGx1+zS/Csb/knX5DKh06BdQ9f
	nsIE/Wv1gzU3mIJ4kfF5nHARUmDta8efrb+IWk4JmDFu+jjtVzOQHgNwC9Gio8f7
	Tyw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gCyz5K8il4bPwxEo6dLcI/ThcsHVFL30BqxMGdjq31u8VCAu58GcCJ3IuhdT2tXlmkFT3BaYpsEk0KOpiwAPJn2k7zMR8csP5Pjk8Thl8aip8h4I9rd+LMmqI3vVWx5jLVY1P0jtS5wnid/3ImNLsRHIB9AQLWqMdM1cJDcaXKIhF0qAXufasXSCXW8SfMNSHm3gOQyJQ5cZr5m9nLsWSUzK9HJUNUgj+c2H7fPpMbUXd1+0+vCQrzChOkxF3oT0iOHffvUZvbJK2udHU6KwX8WCU4e8MHLLf+gz/J724bUjDPmZ0jorrPisqJl/9HxjKbs8+O+2vtVzB5fsyM6Xsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aIjZuqVWwlCdqrpZV1nVy5ZvbYSxc2s85Odwd4BoSOI=;
 b=D3t+mek+f+K/LrZcYCYSA36gK4YMRpBq8xIhxZSLQPftDzkmYcMVAABj9BEQ6AgD0XzwFkfK77aiUkhH8IQ4ozRkOQYG8aCLL6VkHOhzz4popghYXy6URKortGwyNbfUtdXmktjc8fDNgNgaRHgq3CYr/lD0DG/5wF8anCgKnvHTvP0sJ/ini6BRE4Q4a6mPpeUmbFO91glDl9Yr23acFlY+6LqB13DDPSc0s6P+qW/H0F2fgN7qO5W/pzmTT834VeaK//k8jLTJkD/+6g4AQppuMFfquyXmNGkkUD+UzCUC3+D7xmwZvJuqPEMJBpNVc+vhjGg8SZ8Ohh3szUvZgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aIjZuqVWwlCdqrpZV1nVy5ZvbYSxc2s85Odwd4BoSOI=;
 b=HThygJ7nPa1gzIx/pjWe6nLXuOGYkghMzXoOJL5U69t+4H5mdEz7Lay7wfuL6biXsE4ySZ38V1FFfIUev1c9LDZeCUppkzObjCNsBEBuzHW+4THleJ0B+NXc0ygQZniptwM60A1QFD/7lvr+Wv4NH/sxMh6rjDxOUGKBZfHQuWM=
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
	ppserprodsaar; bh=aIjZuqVWwlCdqrpZV1nVy5ZvbYSxc2s85Odwd4BoSOI=; b=
	laEgtucCNfUaZSjrlycTQLtO6GygvzKjstPnmMisS9PHKKwPrzspLHxwryFv04G8
	n4NtnOc4KWIZc/aTddIngjR8qS/4UXFBuHK1zqUzq45os/2FHfWN0X+MmJJthr5R
	GwAXf1ZxANe2Snjk8cOPqkJGRm7bu1c7NzSEPUkNCAn8UJusPzJebfQtakClMUaI
	Qf8kHPnNUgkV1mzetcw5vhOrFi/GbGftGK7r58mu/eUvjJ/G+LSHlvnlzrH+C/TP
	p7dKHuLkBKh+9arUCecic32lTHicnHqHuWGUE9ArcJD4sLDwxbnSk0BzX3qS/fj1
	yDETdN5cxjEEkjVPoiITBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=aIjZuqV
	WwlCdqrpZV1nVy5ZvbYSxc2s85Odwd4BoSOI=; b=N1cLg+bAfhgnVEAcB51Q+Wd
	M5TZm0gFYWOZz9L24v4pp5sgRloYVY5W/5AEk0Z8wlwOidHiH90jrNBFuCUxnzTS
	Bm89GzcOBIe4RYiMfwAURoLsUGO8Zzgy4UJ63GQvamKwYk63bVVrJcL6+xfdNMSZ
	2csar1ajph9ybE7UtF9oq7sOdxW/9VpkFTCBv5dMWCl+2H6BDvZ4dYOv2d+v+4pQ
	Pq+ZE45NDD+chTE886B/BUhWthItQKmcYf4ArO1SaN/LTBc6CZAqIUObb7eXHBd2
	2EDjmwhoJGfSzbfkgGR1jYq/qrxatgA5rAi2cFTSswEwn/CBHoMdVd6JdOCC8YA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmN1xdHLJmeVDOmN1xZkSG
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
        roger@xenproject.org, teddy.astie@vates.tech, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 08/28] x86/hvm: avic: add AVIC_INCOMP_IPI VMEXIT handler
Date: Wed,  4 Nov 2026 17:33:25 -0800
Message-ID: <20261105013347.719392-9-dmukhin@ford.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050005
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW2PEPF00014677:EE_|LY0PR16MB450305:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8c4fd31a-bd1b-4204-587c-08df3adcf098
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261022075727099003|261026121527099003|261022105027099003|261026140227099003|261102123227099003|261028144727099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Y3zgA0xg1/ziAKYCon/Einfg4at83zcCe0QBktFX3ytSkISzdd2fbhXMUHQZiDbgOyjtWs5W6lt2RxydtPUwrPQCj79/4nvILzGpLtD2odnzAMGi1xsWEaqyRTMdJhIiiHN4lUdh0TKV1dwrj6blVLPJXtwi9btS6WvG8rm39+8EViqAcIpbeQwYY1/FR554jG9H4Hq1tE9TcKeHSiOVMFBbr2k7hJNrbuNW35QIRQthANGaHiVtQQXuS0bH1jcmPw1PI12GVMlVR2QCSU3rko0ydVP5bCXQB234nr6d3D/QDMPiOoGvva5RG2An7+kTO3w6v4UBRw0QfXIdRChkdE/Fjbi1sKPPILA5ZafoWfSVejvt9E2oLu9/ymuGaU6lhpjUu2cP1idUJIwPjCc88GJUiubDW83ncp4Sezt3suH4mB3n+zqzQIyr32DEerAc3MTILeM6jYrK3szu8JfkvDqVevl2vjbvsTPSgp567Vi5zAhS5OrPKfKCIQabotooM+42TVjcrjtnbWaJBs8ZauJM14CH8saHkEsE6RMuOsr9SuLnr3wsZAhVzfVrURCH122pvLstiZuFSI1350CoCJBNKYXnUxFjMdmIoaf82rVYAmXnO9m6JmAk/xnBp11FaEy6VzgR1cEtKQsMLOBNlY+yEHoXgslGQwdjo4DjscLGQfUtj/zdqxXdgt/WrYAOyVBwLGTSQ6rrbqhcNa7CJw==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261022075727099003)(261026121527099003)(261022105027099003)(261026140227099003)(261102123227099003)(261028144727099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OSjodAyaewIkS7Xx1sVlTraK1ab8MWa0eNPA4CNPwu8165IqS3eLcVqUPQ1vGlhQRIPMvj4mxwQP5Vbusuh8/tpeGm5YgYyD5n7JkyJ5/LAalRgdgxLb0qjDiiG+sGnsL6b2HXgQffTX+mox/BiFxalKXLbuWiyXojDRlueN4kzIFT7fAOrY0BLwqoqlIK4PLCR8plYgvef8vYPotwwyGnHHhyZmHoLRF8EJ0NIxBLXgu5yRWFe2R0OX4Z6cZSmmsyaXjVSgnfWtVHNqFLB0PYqpkar62pzGI8O6IaWOd5ThUJXwpcv+nKMz+Qhz3Mt01NKSuj7MFbHcepJSqbdPQl1XsGau06JQ+tviRdFhfF+Akun0C+kyJD7CSettZgttHn9jU9GPGWrJBDzNzna/h21LHH/217VKlzYQvI4a+/enb7PyFAXjuNnYriQTPI8+
X-Exchange-RoutingPolicyChecked:
	Rm94ts4nTv4tcQWq3688MeqGDl37/wmfBVzf+oVmY3k5E056YtTVUUDjkqOmXkASAcmbWQEdJWXPbIviaJScyukbi5awzXEq+pfwPh06KBhVlnPVqlQUvT8YvQX9l4b+CWHEZREqAfi66XxqkaEo2V8kPLWDbm/h7CxiPG7nwqmZ309LHBZMqeJ4PduCDkpdlPLfkjSACE2v98bG/DAHsY72QKVqb7ea2hX/0JYTVM1UtkGhVOMpscbMQHuFGkNyJZSlkNLUyt8Qtv9X/yIt24BUq0rYFqMHFuy5xaB0cTp1s7HqAst4EH46Eio6hBLiEgcvm75fTo/pGTWcgrtDKg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xQ6ya1+GAHNStCvykCauE1RcC5rFSAZnBpRPBmVvtsoHRoMU46veNdbSg/XwSD7elFjy7ddzK8rgxLQ5FaWEkHl4IltJWIYH97Amc2pR4DiyxWT3hxx0gaRntlhy013f4mdWmi1ttIRLLqdq8h1nEvpb7XH82qCH9VzN9dLWJQ6s914wOAI5RwK2MPLMIrUbC/f9DngKvXv2CCE4J5baLQhD4U0Oc0HY0VMOrXmM7eruLhtP34aPbran5hpWmscUoG3hmg8wBlXNv01C5KbeRG8cMDjJso+1pgwsVSRDzZ2sgtbJe5DV3nkETrEnxzuSOn6wA86+rLu3Nbnaq6QzsPliuzEg3sm76StG9VMA8yO+Pxmf5knn9QvVKJy00IWUk74ufhxKjFvNkWaQ1q10c5spD7dq4sH+/Cz8JiwXI2RpqJ+t42fZD76k0dOfelxf8aeXyB8rURVYQTHjuU11VlOqWtwh+mW7G1gWxh7YYdOvrzmB587hfzeUZuTvKAtt+jSallMQ+kTfcqB1UFFxc1Rdiu9fzaEljPGZ9PaXiP+Yb4EJVUypPy7uKCgquHedL23U/kVR7HNKWV1G2Ey1Y4t7TAUNKDknNxGHaVdEjDGPKQ7ZCTVQQHhSwCa+aCbQsrNqTZDdd3grOpgHkjkpEg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:34:31.1365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c4fd31a-bd1b-4204-587c-08df3adcf098
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW2PEPF00014677.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR16MB450305
X-Proofpoint-GUID: zokRtB1cl-3Wn6I9nNuTCN5wuABKhg4_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfX4Xk9tr+/PRjV
 5MnM5HYgDD1raUXK10BAFXDQlhtAqjvwuvUVqGschXcame3A4Gh/ZzzrelMohjJsciLMaR3m37H
 mI7w7KbfpLNS3fgxrUsaMLC+YflvzEgVTlj40+snChyC0/J1X/NN4KtDGBrr0U/TU+nNv1Y1map
 HM1PkDuzo1cXI9m84hKovb/AWKAocYTGBe2efpjEdNGlmj/3EFLYz4HcmWGQviHSMhMlgMTRfWW
 KJ17V52+LTdBP9rL4ZxbpKAGi4RkjRs5tDonvGo86hKyXmvTGrN36BT4n/8jeqAzfKe3fGSzfak
 yF5tS+o/U23Rg4l6bFneo5uD2DTE/1rkQ3Xyv14F5Le0CE+EbXba6Xp1zKqwLc3jZQLuOtoRqQD
 baZGz4ln0j5fIqL2MZIGGitwy5+5DIXqWAyd6L4HSwzCpPouRr7/SD2rW0VJp+N9RPoMliE0oGJ
 k5YXAiUF80AjiuFv+cA==
X-Authority-Analysis: v=2.4 cv=T7AZ3PKQ c=1 sm=1 tr=0 ts=6aebdd3e cx=c_pps
 a=R4qMYQySjg0trGpnu7oNJw==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=N9_n2FxmZfwfyRXvS9-E:22 a=cbNQJ9GKAAAA:8
 a=3HVv6gUSBiGGIqaBedQA:9 a=P0bj-C3X3jJDpopQwM1U:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-ORIG-GUID: zokRtB1cl-3Wn6I9nNuTCN5wuABKhg4_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfX0H/Kb0fcZ+MF
 oJzScU9AwVRY0UryVEV9mdp/il0nojZap/HxLW0kf1jMlsCdQv8WEOovm8GWOcG+3C9MiWPD3rK
 gJ2yTRbRf0k7RUxjwqthr36+nw0Ftdyv/bEM6oNQwZFWjwkN08sZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050005
X-purgate-ID: tlsNG-c201ff/1793842496-F7CB82A1-FF241251/0/0
X-purgate-type: clean
X-purgate-size: 7841
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Introduce new VMEXIT reason 0x401 [1] to handle the case when an IPI cannot
be delivered to all targeted guest virtual processors because at least one
guest virtual processor was not allocated to a physical core at the time.

If incomplete IPI occurs, try to emulate an IPI.

[1] AMD64 APM Volume 2, Table 15-22 "Guest vAPIC Register Access Behavior"
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/hvm/svm/avic.c              | 115 +++++++++++++++++++++++
 xen/arch/x86/hvm/svm/avic.h              |   2 +
 xen/arch/x86/hvm/svm/svm.c               |   4 +
 xen/arch/x86/hvm/svm/vmcb.h              |   7 ++
 xen/arch/x86/include/asm/hvm/svm-types.h |  10 ++
 5 files changed, 138 insertions(+)

diff --git a/xen/arch/x86/hvm/svm/avic.c b/xen/arch/x86/hvm/svm/avic.c
index bc98661a7057..0cfb21cb8e3f 100644
--- a/xen/arch/x86/hvm/svm/avic.c
+++ b/xen/arch/x86/hvm/svm/avic.c
@@ -9,6 +9,7 @@
 #include <xen/param.h>
 
 #include "avic.h"
+#include "svm.h"
 #include "vmcb.h"
 
 #define AVIC_PHYSICAL_ID_ENTRY_BACKING_PAGE_MASK        GENMASK_ULL(51, 12U)
@@ -235,6 +236,120 @@ void svm_avic_vmcb_destroy(struct vcpu *v)
     vmcb->avic_vapic_bar = 0;
 }
 
+/*
+ * Handle the AVIC_INCOMP_IPI #VMEXIT when AVIC is enabled.
+ *
+ * The hardware generates this fault when an IPI could not be delivered to
+ * all targeted guest virtual processors because at least one guest virtual
+ * processor was not allocated to a physical core at the time.
+ */
+void svm_avic_vmexit_incomp_ipi(struct cpu_user_regs *regs)
+{
+    struct vcpu *v = current;
+    struct domain *d = v->domain;
+    struct svm_vcpu *sv = &v->arch.hvm.svm;
+    const struct vmcb_struct *vmcb = sv->vmcb;
+    uint32_t icrh = vmcb->exitinfo1 >> 32;
+    uint32_t icrl = vmcb->exitinfo1;
+    uint32_t id = vmcb->exitinfo2 >> 32;
+    uint32_t index = vmcb->exitinfo2 & 0x1FFU;
+
+    if ( id >= AVIC_IPI_FAILURE_MAX )
+    {
+        domain_crash(
+            d, "%pv: AVIC: Unknown IPI interception (exitinfo1=%#"PRIx64" exitinfo2=%#"PRIx64")\n",
+            v, vmcb->exitinfo1, vmcb->exitinfo2);
+        return;
+    }
+
+    BUG_ON(sv->avic_physical_id == NULL);
+
+    switch ( id )
+    {
+    case AVIC_IPI_FAILURE_INVALID_INT_TYPE:
+        /*
+         * AVIC hardware handles the delivery of IPIs when the specified
+         * Message Type is Fixed (also known as fixed delivery mode) and the
+         * Trigger Mode is edge-triggered. The hardware also supports self and
+         * broadcast delivery modes specified via the Destination
+         * Shorthand(DSH) field of the ICRL. Logical and physical APIC ID
+         * formats are supported. All other IPI types cause a #VMEXIT, which
+         * needs to emulated.
+         */
+        gprintk(XENLOG_ERR,
+                "%pv: AVIC: Invalid IPI type (icr=%#08x:%08x, idx=%u)"
+                " avic_physical_id=%#"PRIx64"\n",
+                v, icrh, icrl, index, ACCESS_ONCE(*sv->avic_physical_id));
+
+        vlapic_reg_write(v, APIC_ICR2, icrh);
+        vlapic_reg_write(v, APIC_ICR,  icrl);
+
+        break;
+
+    case AVIC_IPI_FAILURE_INVALID_TARGET:
+        /*
+         * AVIC can report an invalid target for guest IPIs, for example when
+         * a logical destination mask contains IDs that are not backed by
+         * vCPUs. This is guest-controlled input and is not a reason to crash
+         * the domain. Handle invalid-target exits like unsupported interrupt
+         * types.
+         */
+        gprintk(XENLOG_ERR,
+                "%pv: AVIC: Invalid IPI target (icr=%#08x:%08x, idx=%u)"
+                " avic_physical_id=%#"PRIx64"\n",
+                v, icrh, icrl, index, ACCESS_ONCE(*sv->avic_physical_id));
+
+        vlapic_reg_write(v, APIC_ICR2, icrh);
+        vlapic_reg_write(v, APIC_ICR,  icrl);
+
+        break;
+
+    case AVIC_IPI_FAILURE_TARGET_NOT_RUNNING:
+    {
+        /*
+         * At this point, we expect that the AVIC HW has already set the
+         * appropriate IRR bits on the valid target vCPUs. Kick all the
+         * appropriate vCPUs (e.g. logically addressed or broadcast IPI).
+         */
+        struct vcpu *target;
+        uint32_t dest = GET_xAPIC_DEST_FIELD(icrh);
+        uint32_t short_hand = icrl & APIC_SHORT_MASK;
+        bool dest_mode = icrl & APIC_DEST_MASK;
+
+        for_each_vcpu ( d, target )
+        {
+            if ( target == v )
+                continue;
+
+            if ( vlapic_match_dest(vcpu_vlapic(target),
+                                   vcpu_vlapic(v),
+                                   short_hand, dest, dest_mode) )
+            {
+                vcpu_kick(target);
+            }
+        }
+
+        break;
+    }
+
+    case AVIC_IPI_FAILURE_INVALID_BACKING_PAGE:
+        domain_crash(
+            d, "%pv: AVIC: Invalid backing page (icr=%#08x:%08x, idx=%u)\n",
+            v, icrh, icrl, index);
+        break;
+
+    case AVIC_IPI_FAILURE_INVALID_IPI_VECTOR:
+        domain_crash(
+            d, "%pv: AVIC: Invalid IPI with vector < 16 (%#x)\n",
+            v, index);
+        break;
+
+    default:
+        ASSERT_UNREACHABLE();
+        break;
+    }
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/hvm/svm/avic.h b/xen/arch/x86/hvm/svm/avic.h
index 1084ae683944..2668d4481425 100644
--- a/xen/arch/x86/hvm/svm/avic.h
+++ b/xen/arch/x86/hvm/svm/avic.h
@@ -14,4 +14,6 @@ void svm_avic_domain_relinquish_resources(struct domain *d);
 int svm_avic_vmcb_create(struct vcpu *v);
 void svm_avic_vmcb_destroy(struct vcpu *v);
 
+void svm_avic_vmexit_incomp_ipi(struct cpu_user_regs *regs);
+
 #endif /* __SVM_AVIC_H__ */
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 8b7bfed0049f..693b5c29287a 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -3078,6 +3078,10 @@ void asmlinkage svm_vmexit_handler(void)
         vmcb->bus_lock_count = 1;
         break;
 
+    case VMEXIT_AVIC_INCOMP_IPI:
+        svm_avic_vmexit_incomp_ipi(regs);
+        break;
+
     default:
     unexpected_exit_type:
         gprintk(XENLOG_ERR, "Unexpected vmexit: reason %#"PRIx64", "
diff --git a/xen/arch/x86/hvm/svm/vmcb.h b/xen/arch/x86/hvm/svm/vmcb.h
index 1ee5da053a9a..532382bd02f3 100644
--- a/xen/arch/x86/hvm/svm/vmcb.h
+++ b/xen/arch/x86/hvm/svm/vmcb.h
@@ -291,6 +291,13 @@ enum VMEXIT_EXITCODE
     VMEXIT_BUS_LOCK         = 165, /* 0xa5 */
     /* Remember to also update VMEXIT_NPF_PERFC! */
     VMEXIT_NPF              = 1024, /* 0x400, nested paging fault */
+
+    /*
+     * AMD64 Architecture Programmer's Manual Volume 2: System Programming
+     * Table 15-22. Guest vAPIC Register Access Behavior
+     */
+    VMEXIT_AVIC_INCOMP_IPI  = 1025, /* 0x401 */
+
     /* Remember to also update SVM_PERF_EXIT_REASON_SIZE! */
     VMEXIT_INVALID          =  -1
 };
diff --git a/xen/arch/x86/include/asm/hvm/svm-types.h b/xen/arch/x86/include/asm/hvm/svm-types.h
index 30bdaf27a856..93629418c225 100644
--- a/xen/arch/x86/include/asm/hvm/svm-types.h
+++ b/xen/arch/x86/include/asm/hvm/svm-types.h
@@ -25,6 +25,16 @@ struct svm_domain {
     uint64_t *avic_physical_id_table;
 };
 
+/* AVIC_INCOMP_IPI #VMEXIT reason. */
+enum avic_ipi_failure_cause {
+    AVIC_IPI_FAILURE_INVALID_INT_TYPE       = 0,
+    AVIC_IPI_FAILURE_TARGET_NOT_RUNNING     = 1,
+    AVIC_IPI_FAILURE_INVALID_TARGET         = 2,
+    AVIC_IPI_FAILURE_INVALID_BACKING_PAGE   = 3,
+    AVIC_IPI_FAILURE_INVALID_IPI_VECTOR     = 4,
+    AVIC_IPI_FAILURE_MAX,
+};
+
 struct svm_vcpu {
     struct vmcb_struct *vmcb;
     unsigned long *msrpm;
-- 
2.55.0


