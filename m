Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798D9606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 19:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=H9F50oMe;
	dkim=pass (1024-bit key) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=iLyY10UA;
	dkim=pass (2048-bit key) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=RvcFGmhC;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=cAdGgo5d
Received: from list by lists.xenproject.org with outflank-mailman.1484761.1688136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREJW-00029L-I2; Wed, 11 Nov 2026 19:48:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484761.1688136; Wed, 11 Nov 2026 19:48:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREJW-000296-ES; Wed, 11 Nov 2026 19:48:58 +0000
Received: by outflank-mailman (input) for mailman id 1484761;
 Wed, 11 Nov 2026 19:48:57 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xREJU-0001ro-Ol
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 19:48:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xREJU-00H7yO-5K
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 20:48:56 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c69b-2eae-0a2a0a5409dd-0a2a4504a988-14
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:48:56 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c6a6-b57f-0a2a45040019-94a38ff1eb14-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:48:55 +0100
Received: from pps.filterd (m0367129.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIYWFo2293452
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:48:54 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com
 (mail-westus3azon11010061.outbound.protection.outlook.com [52.101.201.61])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hvuayj3py-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:48:54 +0000 (GMT)
Received: from CY5PR15CA0077.namprd15.prod.outlook.com (2603:10b6:930:18::33)
 by LV2PR16MB246186.namprd16.prod.outlook.com (2603:10b6:408:421::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 19:48:51 +0000
Received: from SN1PEPF000397B3.namprd05.prod.outlook.com
 (2603:10b6:930:18:cafe::51) by CY5PR15CA0077.outlook.office365.com
 (2603:10b6:930:18::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 19:48:51 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 SN1PEPF000397B3.mail.protection.outlook.com (10.167.248.57) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 19:48:50 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIZH6a196217
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:50 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4htkxw562f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:50 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id REJLxlrKXam0hREJMxXe25; Wed, 11 Nov 2026 19:48:49 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=aO8
	7XBPCOsw2KMeE0QjjyNNPLKb7he3ta/Gk66oZ8M8=; b=H9F50oMeWCCNfIjDhcx
	Pq9GZpz+0KOJG67UknmzFU5aqZF7u6LY3pg00r+SITLegsZvfjdaCEKQAiEUnpdx
	UWXZqoVpazqp4RCHdCwpgIPcOW4x2QoesglD199t8mkaeMvBjrmy3fmXHHMhPjzl
	KG7tyAW2uAd2lLz1b9RpWf9tOSh9eIbz2ZVjCUB4OkOqcdeEMaXBA/vvfM+HYbuX
	LvI2hF0PP0PBIJY5W8NckbTretaHwUADh6wrTdoXv4uRwkNFtK0i28MvsF5CUyV6
	C8/arHI8O+Bw3NXkaTzEfkPiVCpSvAaPLBQkfGpNElXSOr1Se1+azUBX5uaZRb0A
	IZA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s/k1mCEZgDxLIUFVFBYqBEwLY4GFGt5uRRi/5eawiUmq8jJFGep+fq8XC2Gd0AtcJg4dMZ1FvVEGfxlW5dkrZIe2HF2dIrtsdMhGhHvsJ174A9nmi3fwLWJlOS30mnwAT4lL6cgxDf3vD2k0K41JMnTP9CpcH/YRS/9H2FSV+IWgyirzGj32r+G3QCFLaSWrwjm96aQ2DTIpGzJzh7bRkmXZEcNgWT7bTp5XTtEfeQhWpwmFlCezBzm8U5PgF7uzhPKuMYtC7ZMyTAO2gQDOZUXSmbEVXqWzJMmUayuxI58kWIfgqaEC6kUgK5uo6LzG8hTMgy5U6OaTrivrNvq7AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aO87XBPCOsw2KMeE0QjjyNNPLKb7he3ta/Gk66oZ8M8=;
 b=r8QhUZgAoJaOGCTyKN+7zanQSfxf1y6hg8N6+94n0rJ+BQ960PVugZyODAEVb8xqngBrMrQkwFk9mE2HTbQ63YbhrGyQIwYIhFNunMAXqwQlejM43zRCkW6Myvotdad3f+I2oE5EMN2TWjaFd1fmux2olNq1lCgIon785WFvcFfonUxK2kXaXomNQXvRaNydWICbe1HPjbQTsdsvLI5aorYZY/9/oZz9BsREOYtZ7kXHpP7yje9luOfv8+qZcoidUc55+E3oumGG9BoVbOhf3+IK1nS/3kga6DQDMh4DbktbuZKtZ7YqBfJrfPEVO03pEENX50m92qCGy3t2JVb/Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aO87XBPCOsw2KMeE0QjjyNNPLKb7he3ta/Gk66oZ8M8=;
 b=iLyY10UAVg7M5ko8BkUTdjiq1pQvRMcILcDJk0Q7L6pdhqItsuSaq8vkrX8XB8dFZvOY3L81263XSF+aR0xnjGNttK0A5wPT0xBsop37dgRnHtFvlR3N3JrwntZESn6xrwToTQAwTLW3f6lJWKiB6QDh2SLdrKDBjRIpum/y5a8=
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
	ppserprodsaar; bh=aO87XBPCOsw2KMeE0QjjyNNPLKb7he3ta/Gk66oZ8M8=; b=
	RvcFGmhCpui4ggQ14cvMloVqevg0KjpzbEwvUI3dbBthiJ521P5d67U8/qLMiQHe
	AF+HInMBgZtPDIO1PFqiPnF96+XNQ/7Mb9878thgkEzGP+T9TClqAa+BPKwZDinz
	pciGAqHWbJmd/5HwTxp+V4P0MOXCQFC0mrARpNppAUh3eOXo3GvjOq+vR1swRRNq
	VhXFrSdYnlITN92yS7UX9z6FCz6gDt7qaUDyFbBAn8HNQtnLegsSzRXqi6af6ES3
	coT0uXrhVCR1b78tiz6XjMPu5SCgYTWqd+879UQ9esTGuWqkHWXKP92SZ8jbWCeV
	y6FfhiMuGyjIhfQ0vy5JbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=aO87XBP
	COsw2KMeE0QjjyNNPLKb7he3ta/Gk66oZ8M8=; b=cAdGgo5ddTUBtOPcS9JYB2v
	eQtlJauwOIXEY/hwqdXplS+xYat9K2OZ74wA7MhhR0/Dr6kvkf1viyKTIi0CDrUb
	+wd+OlAwQ4JZJQ5uPSqElUtEBRfpd7hpPP6P7kcCyeQ966XpGQnb6afOawPR25qu
	RjIEC1eYJ3J/mbr/Vtwt1iFJoUA/Gv9w+v3IFWyse9rU+IIXFuSw9tdIq0xWRuLF
	W14Op709Ld1gJ9nmLi1LELl2kpTxajRVh7YsvV7r7Y92CQDn8djzrG3e/7wToQXi
	48SxswKrUVHpsrBg/gcRoAWJv7TUvitGDHDu3U+RgHawShKNAZhW0HeNZgTM5Tw=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: REJLxlrKXam0hREJMxXe25
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v8 15/26] emul/ns16x50: enable emulator
Date: Wed, 11 Nov 2026 11:47:49 -0800
Message-ID: <20261111194800.1070016-16-dmukhin@ford.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110078
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B3:EE_|LV2PR16MB246186:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ceff47cb-3740-4691-9158-08df402ccf60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|22082099003|18002099003|6133799003|11063799006|261026140227099003|261102123227099003|261028144727099003|261026121527099003|10067099003|261022105027099003|261021121427099003|56012099006|261022075727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	mAP7qS9DgfGMDxT86fJj9kCiNxzE/oaktmERhZQnWX4F4lDuAC6WxWsE/X/n4bUym5EwHxwBQJuDZcjz0OwCS7iEyzh5rgLcsFY51kZtBvaAQ/7SDMoOvlC8+fyQtV6bDfyBKPkwFNLx/GHpYrisSHf/6wTZGcytPvkgJp6O6Y0NA38C7RFrroz5Mz8NOIgAnfsYkdchVGCyL1xD3ObQUEtvCsh39Ic7gfdwt3DpWs1DqujAkv97pQ6xDxG6qIcsgS0HazlprvrXtQYfVQcOteC2ZLZIF/8Q6o1agCSJTdKyZFq0c6WgdQjlEIi+e5B0JhHFWg8zCL2U4iyMXl6nrurdCRDz36VD+EM1jSPmz3/37ajA/frlWUVGn/9CqYWPsht/girtZTUSWTVhnYncs12l+5pO1Pen5QdwoqKWYozKS8kQYdd+j2+STaagyU/ZxjpMqgfFZjICNJCeN6KfP2pskpoWOHxTzih3Iuo24SJDmlyLuuSGsueaPdo61r8qKAlaL/6CY4gKtISpdT2IvhPHLHpC8lghd0Up2Dsw+jcWJoz44zNAKMfd8PuYagP14JaNgFlFn9+erdQcKJ8cpIe+vZpi5uwQteCtZ0rdR7Yn536WwsnvI6JrIeINAouA/uGcZy/0x2nCfnV7oXJ+4DG5CBPYqP5yJ07WqUJRieaXx09M5UgBWIbhXJIKX1hbYcJwnUZ1T4L1MCGsf3YPvA==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(6133799003)(11063799006)(261026140227099003)(261102123227099003)(261028144727099003)(261026121527099003)(10067099003)(261022105027099003)(261021121427099003)(56012099006)(261022075727099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VUy0H/9mqJCsnqPTyXU1lXoM1Qbp4qm/PUD42+pFNP7g83xVeU56ew3DXkYmH8r6GylCQTHOMmdWdYk3xJz3CQ3rKJnpFyHMuSJbQM2dxLxmuwjqSfrUdLaRee5SU1Rt3FZTbY3RWxh8cMVEeNu359yilyiAne78vUZgMnhlNp6fF4b23czXXV+UuiiSyMdwO2Y/FA55o2EIOKQpaCXQpXWBYwYV0NdZEZsb22wgnW8FDizfIiAPZ41UUZZKcj9JSFG5KURtGMg7dP4JtNSJV/jggMKOV89BdUioAhxd3vDtRsuTPrs8D+fGKRIqP7y7qi4ks5TZHrU6i8AWryWBBzTMCOpsJtjER/07YXeg67rdGmR/IUbsPvJVQ3iG7KZJ9sdRcaW1LBap6MM8+PUgbjryUvMTksmC2jNd6j8G1bODbxpexsiI9JA9G1DrNYNm
X-Exchange-RoutingPolicyChecked:
	jmD9ClsFey1k5MnYISJzgPoyI9HO3vIPDBo0ls1qgvNn/oDt4HQ6jLaOFitcrNuhAu/ZMOoilKxZRTjAoPD0HGeYfG1is3d8QU8XgOPbyUIOr2bDOCx3ENXzqZQgUHUtXW6WWC95Ll1o9pIPddeXL0eCmCCy70vl2z84eEciW8w2ewGBTYODwIcKrkgwog09p143uVm6PA70HysbIgXSWxeJzHamIKSWPjOlcFb+qt86145uxRRziSUlAlQURJm90u4M2NG2cDbPEXYLOrPVA+AX1oAw1Jcc6+mywTj9PHu3Lt75IYl2Jw8g7HQIXJ/EUqCS/HRihWh/bufBFynTqw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	78Q/g4uQGkYH8fL/Gvx329i/sC5xscWny8pSVKvHwn3Wm3x6cccBDUKf5UYdHQvUOMKlILT985PRzBVvDmB4K4EN9mbnyW1ts7kZCGLAmhO0vRrIdvFmGgUx60t6zqdp041L5NtjQEl4SSwq5JSn6JvfQmxgR0IrspMAKb4c/h4pMGLJ/7cTejlmbA7TWsdluNEv46zNUJg+3tJJ+Z5Ax84PbNRqthQLe+B5dlMFmwqAR0XFtSgGChaP9qJjYPE/hNSNCwEd/Y2YJzlmbtvXXa2dF3Q/x95QqFl9OX9XJUcuo23QWNqJegUqqjxUt1ybiWj9oLo+FhFfcD2Y6gDomQE0skeyMPXXvUmSKD6QDSw2wXU8V4MFD0BeIlng9jqCrWSL+Y3Nvlp7R9DvKDTRt0ltSJ/LxpuJZcvEtxXe9FcP4qjoQY+u6OVVuS6dDm1HbB4ERDgIhE+Vraj+7A/66GeFLNqZbZmnc3SJKU+Sjrc9AeL7JTcgkgyjIQUvLCKvru45WT8LC1Yk3itcgWTqU+O1uGIOpZW1RuPR9VTOemefEw1jwvcc50fYGYbf7pI/YlrCUdsUC5EDtYfzEJ8uwsQCh7K8dGXLjOf/tFDtggn6NXgTPKLWGGyIjEuKzCEZwSKYTGOcJQiYb3rxYKc9eQ==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:48:50.9658
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ceff47cb-3740-4691-9158-08df402ccf60
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR16MB246186
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfXwVnSEZLI6PYX
 kxjZpyoBSzWy8zCTeNQDL1839LryLEs9DIg6gdyLD6kXfQ61pLaPEFqRPMhcwJUx1lcd5JFasQ9
 VzE4EVOep/3IOVm3hXfH5CmUciUYkESq/hs1dKiB1sXn1Vi+nzAs
X-Authority-Analysis: v=2.4 cv=DPEacCNb c=1 sm=1 tr=0 ts=6af4c6a6 cx=c_pps
 a=0p5N1A/s2xr2YPsuh+j7dg==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=X3KReqg2EL6A36SYCKpz:22 a=cbNQJ9GKAAAA:8
 a=VF6StGDLig7XDZ0OXIsA:9 a=G69WFyCBNqGPyalROSdv:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-ORIG-GUID: mCa1zRBDQGytfcb6HvsAYeAexckqEfab
X-Proofpoint-GUID: mCa1zRBDQGytfcb6HvsAYeAexckqEfab
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX94nEAS9yNt5g
 mzan66cXpLuCHasZy6YR771lSQ85JvUjD0Si7TP6ZEM9RSwoke4ws9wAGeZ/CdFSfCPS18/pFov
 MDNU4lSR21JOIIr/Bp2mn2hci4w+TNoipT756YTuliO6NahnQEHIGtXzcsURVywfkjhmSy3eJH1
 rNfsvhPoocZD8HK9a2ceagXsEu8N3w/EAfJuf8Fs28cUsg+bBx/YOEK4A7KWRuNsrexUoXBXkrO
 9egHJOPChE0nerN0BRmmGPz8az8IkZlaizkNZYhPVc9bJlNJhRXe1bDtsMdUdEsbl+fReYY/mV5
 qRwRzWClkSjZZV6cHE9faYHB9d0hwMA48FihdCfByIGYhbLufkFWN0fbmjjLZYz4AXeYIHYJT34
 ZVFV/ZppR/Xb29YCNH4tCo0gvvO7QsWPxkxXB/uq4G0krOqDMJF+g5Y3J/xaD5G/b2GYMn+j7td
 0geoAnAsmZyYOwNeDNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110078
X-purgate-ID: tlsNG-ebf023/1794426536-53EC6B50-DD80DF3F/0/0
X-purgate-type: clean
X-purgate-size: 2883
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Wire emulator to domain creation code.

Introduce a helper `vuart_probe()` call to get the parsed vUART
configuration settings and use it while constructing domain with vUART.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/hvm/hvm.c        | 9 +++++++++
 xen/common/emul/vuart/vuart.c | 8 ++++++++
 xen/include/xen/vuart.h       | 6 ++++++
 3 files changed, 23 insertions(+)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index ef9c7cd05777..f4d2fbe75fc6 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -29,6 +29,7 @@
 #include <xen/trace.h>
 #include <xen/vm_event.h>
 #include <xen/vpci.h>
+#include <xen/vuart.h>
 #include <xen/wait.h>
 #include <xen/warning.h>
 
@@ -699,6 +700,10 @@ int hvm_domain_initialise(struct domain *d,
     if ( rc != 0 )
         goto fail1;
 
+    rc = vuart_init(d, vuart_probe(d));
+    if ( rc )
+        goto out_vioapic_deinit;
+
     stdvga_init(d);
 
     rtc_init(d);
@@ -722,6 +727,8 @@ int hvm_domain_initialise(struct domain *d,
     return 0;
 
  fail2:
+    vuart_deinit(d);
+ out_vioapic_deinit:
     vioapic_deinit(d);
  fail1:
     if ( is_hardware_domain(d) )
@@ -784,6 +791,8 @@ void hvm_domain_destroy(struct domain *d)
     if ( hvm_funcs.domain_destroy )
         alternative_vcall(hvm_funcs.domain_destroy, d);
 
+    vuart_deinit(d);
+
     vioapic_deinit(d);
 
     XFREE(d->arch.hvm.pl_time);
diff --git a/xen/common/emul/vuart/vuart.c b/xen/common/emul/vuart/vuart.c
index 0df29540b1b6..b2680711ad09 100644
--- a/xen/common/emul/vuart/vuart.c
+++ b/xen/common/emul/vuart/vuart.c
@@ -144,6 +144,14 @@ struct vuart *vuart_find_by_resource(const struct domain *d,
     return NULL;
 }
 
+const struct vuart_info *vuart_probe(const struct domain *d)
+{
+    if ( d->domain_id == opt_vuart_domid )
+        return opt_vuart_info;
+
+    return NULL;
+}
+
 int vuart_init(struct domain *d, const struct vuart_info *info)
 {
     const struct vuart_emulator *emulator;
diff --git a/xen/include/xen/vuart.h b/xen/include/xen/vuart.h
index b5785b3c6b8f..43c6759c1f97 100644
--- a/xen/include/xen/vuart.h
+++ b/xen/include/xen/vuart.h
@@ -75,6 +75,7 @@ int vuart_put_rx(const struct domain *d, char c);
 
 #ifdef CONFIG_VUART_FRAMEWORK
 
+const struct vuart_info *vuart_probe(const struct domain *d);
 int vuart_init(struct domain *d, const struct vuart_info *info);
 void vuart_deinit(struct domain *d);
 void vuart_dump_state(const struct domain *d);
@@ -82,6 +83,11 @@ bool domain_has_vuart(const struct domain *d);
 
 #else
 
+static inline const struct vuart_info *vuart_probe(const struct domain *d)
+{
+    return NULL;
+}
+
 static inline int vuart_init(struct domain *d, const struct vuart_info *info)
 {
     return 0;
-- 
2.56.0


