Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05937606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 19:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=EbE6xjjy;
	dkim=pass (1024-bit key) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=ZFY5NRm3;
	dkim=pass (2048-bit key) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=ZvOvI7fa;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=VgSOSmXk
Received: from list by lists.xenproject.org with outflank-mailman.1484897.1688262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREKT-000129-Rr; Wed, 11 Nov 2026 19:49:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484897.1688262; Wed, 11 Nov 2026 19:49:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREKT-00011v-NR; Wed, 11 Nov 2026 19:49:57 +0000
Received: by outflank-mailman (input) for mailman id 1484897;
 Wed, 11 Nov 2026 19:49:56 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xREKR-0000xf-Se
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 19:49:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xREKR-000q7O-9J
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 20:49:55 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c6d1-8faa-0a2a0a5109dd-0a2a4507e2e0-16
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:49:55 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c6e1-b4ea-0a2a45070019-94a38ff15248-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:49:55 +0100
Received: from pps.filterd (m0367127.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIYWAb1667331
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:49:53 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com
 (mail-centralusazon11010028.outbound.protection.outlook.com [52.101.61.28])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hvuej23pg-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:49:53 +0000 (GMT)
Received: from MW4P222CA0009.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::14)
 by PH7PR16MB5114.namprd16.prod.outlook.com (2603:10b6:510:2ba::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 19:48:44 +0000
Received: from SJ1PEPF000037B7.namprd05.prod.outlook.com
 (2603:10b6:303:114:cafe::66) by MW4P222CA0009.outlook.office365.com
 (2603:10b6:303:114::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 19:48:43 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 SJ1PEPF000037B7.mail.protection.outlook.com (10.167.244.201) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 19:48:43 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIXgYt1790914
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:42 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4htkgbn3sv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:42 -0500 (EST)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id REJCxf2JQQVyyREJDxG1Ls; Wed, 11 Nov 2026 19:48:41 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=UIs
	++CYhWmZWAoIhqdpJNKQ5FrJCy/T6Euvx7t4l9F4=; b=EbE6xjjy5XPUdC2cn49
	slyJ+1dywmgrOI5FUwwbf8X29YW2S9AHTZwQDeLrbqfwnVmsvHDCfOtz4y3D3x2Z
	B3pxEdvtvxrKGt6QQWSJL8kn4bmu/OjvsTXQBwuwmwwyKHWZj1TI1+M+FRzZPR81
	P8mUXcy6XqiuKOgWEbiF2Pdia0fzUb8qe7IRocDrs3lkazPEySi+XIp4qgb8ywTc
	i4FhOfdo3/v3+zTc2M1bUGIEqx7IqZesm989Bc/VpsTRjimglq+rTA96/OjRjuJe
	lAjgb2nkYmrAqOa7+uPBq7VKqkpT/YXhv5zKU6P6AhWtkgqpSGxadkuxYvFEVJXt
	HCw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iKNFmXb2PWOTJJpco3q/cVRTaZpGlg/nOKk9ua5CuL0o218NQ2Wf6u0mUwXSUhVhfIzKJ0sCF0wt0iYfWq0TdEDETQXAvbrY+hPmwBF5yC0DopmwWWTbRPP+dFXe59XDPnxeYtnDLqP1yiZLCp5DKzl/cXSYAmjPKTaaI49rnYgbbgUjD0/w1IUdBabEXFBYKPwE/On76gnTJt8x7Vm7LSQ1tWwiVv7Kr68JM52uIOaDHLeVzqxB7LdDqd8BBUXeRpkOETFSbWtWsMR1g36O9YzM3aUvUm1z9aqBL1RFE01c9w+hL8szt/6gykisYWrBZMGRidOeskB3t8txjvj6lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UIs++CYhWmZWAoIhqdpJNKQ5FrJCy/T6Euvx7t4l9F4=;
 b=v/uqpQmVyzP/wJ5vkvuNetJnMwUZfmUNUwgBeGSJ/rVSafVA/opqyhC9nHhtEvGb0PcYvg6OfWHVorRJo7pBTq9iQmw2O4oSqxwSSW9LEXQ/TaHRJYKEvGrtFNTcan8p0//eFK0MApkzc4WbKMEWpYAoQjSqpeiPtKvnLdxoIC43mtcsD72yEhvyXux8ItQxYaqGPRWhL4LAgnm3IOThsSyqFwYM64QVXGCcgWdnkn8v5pNwUO/Zi236L/Jt/zE0EMseQwjbJi7YXOknQXQmrXIfM7JVX2hrS+OTiC3f8SEn84OTQT4crlWwWbgK7LTpI/Ksrj/nsr/Z7567dAdq/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIs++CYhWmZWAoIhqdpJNKQ5FrJCy/T6Euvx7t4l9F4=;
 b=ZFY5NRm3+BhsnV42mZ77jWkuS6cQ9w7YHUguyLnDfQr9dvrm4pgi5n3cSelwrvO7fksZ1H43ALvOXP7DTS1IikjBwFPY0STJSJAq31gVeu+yfBY3XSUBcQtLawbqaV130Addg8zO/01hJkfCFCyHMELDCa0lbtIm2iwIdnmGUkM=
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
	ppserprodsaar; bh=UIs++CYhWmZWAoIhqdpJNKQ5FrJCy/T6Euvx7t4l9F4=; b=
	ZvOvI7fad0tXjrkB+XnEuVF7Zb1Y5w/7vYbBduAOtYPItW0eHf/YOPMUR4C49taY
	qx7xYBmASb4clWRJDS0dYAN+0+JzjkoW86oNluGlyZcDDS3hTxVeI9eAW3r9eJGD
	m7XP18OtqSweALyoJY5nY7egoBUXUypBlwcSHOhDd3m+J0P08KmQRFyTlshzjIsm
	/gASjoQNufl9FgjnegTHMpjca4r7qFe/7K0s7CYfisC2qRMHWIhQcYgjX5C7x/4O
	WcjLNMzx5ASu7VEbWeSKSWwAYPIA981wJi3ohEuNLIhEfoULIdmHL//8ZTuxvC1J
	XR85I7zXrqbAFGhHhxRxiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=UIs++CY
	hWmZWAoIhqdpJNKQ5FrJCy/T6Euvx7t4l9F4=; b=VgSOSmXkpAb7APCH9wKyhp/
	0kiT8O5EJzeq//ymGO+lM33l/wjUxVHtDqiuempQRWQn0/u1GiwrEyJaHCQbv5P7
	wjTtL1zsS5iEELcGiipRmBAK1mK8cx9na1BP6oEKz9dTP+g1cnGdC7rVFzn6Tlu2
	lb53ps+cm4syhweJL2yEIOyw9c7vqddOyL9pl/dcUtlKZajRmM3QhQW9t/qZ8TtJ
	tYql6DL2B5+3Mf1y13TVch+BiXX02T7taRyPWDWx5Onxx6QubEuHzrEBs4AaVsLA
	V8+/saxMpndB3t8F1AqUNbcPoBL2dY/SsmD0dDL/jyqUi6do8kxGjX4Sta/Uq+A=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: REJCxf2JQQVyyREJDxG1Ls
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v8 12/26] emul/ns16x50: implement FCR register (write-only)
Date: Wed, 11 Nov 2026 11:47:46 -0800
Message-ID: <20261111194800.1070016-13-dmukhin@ford.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037B7:EE_|PH7PR16MB5114:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e973442c-ab0c-4fa6-c89d-08df402ccabd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|23010399003|11063799006|56012099006|261026121527099003|261021121427099003|10067099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NnaYJaUyK6D85hMhZeM2XpBn5Dc5POWUilCFzlgVvZHXBld+Njh/fOT/sxavQw71QhqOraczSi5nUHaA0c+uiQqJsdf1rZH6Gw9sW6oU/TjVDxa6mq0kIL+BDLgfLIn9FuZBKBVkDX2/nrcWfdhen+pEaOHjTDQKQowhRWXCvusrENb/bxtXgOkHm4xBX2gH6qrPSP0YNX8j7wk+KFHzEBX/hUbebW1CMtdVPTHGroivOLV8vhy3jL/1tyCJQv15vzKhGTTmPihMlL7j2bV3CEJN+Zy/br3ctfoBcD02sohkOzFIY/DqFfriy0TQm9Tx1nC07FKMJHa/O+cd1U3MP+9Ag83rvJk0SwCa5/CJO57uteLQEsYTAhQMDI0t6652IgdNGmur5swPgHBylOW0NrnaINhiJT+Yhm3hoa55YHo09ffnxWAQWipVIqkzeHjPWPSOAcVaiWxzADo/5KYvpevlu6qerMhrUQ51Is4PY6s4AJHrJwSBi6eL7+mU8E+CD7C4XtGLWs1mTV1gEJL238xgt3StpiyT+h9V6wZT0YgmAKNYetTg9Z/mHbw8UXEAkZwgOOuUXikSCVbur8VckT0VLqGdroJSzRhPjndaKrxN/hjEOUSf+eqfgk1xcAdqXVTujnufm3Mt0CEChdW32ulj1mKRYPgld6u1s3FOwsUzK0GU0eYSXn8hc4raIUEbK1O/ouM+dO+hfuBt9/w8Bw==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(23010399003)(11063799006)(56012099006)(261026121527099003)(261021121427099003)(10067099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UALpJQhgzCs+9gJtmYsnTxMMZJw+ungMujoQYMrXanAJ06jbK68juRhApJUknazNxcrYYiAC5mipG6rlnv+CJJTEJnEA2DkW0wvqGcS2Ns5CT2pCKxGnZvpUkDLzGx2g2AlvImgeOkEN64u79fiIAXVrz7PqlT4hFJtFt3r0/MyBL9saSJrNGkb0PUgb5DqhKPAaqGhrdZE3qV+MUBQfZv9BA+t0ShW+rQKKI6izF24SA4SzVfAFgDu0vWUx/IC9I8chn6mESb8gaAOhhhEr2Bsf6eo1YS9fFHk8SYM3C3w55tjHYBuYQe820tt6pUXjXhpQvbJEbpKGdcSwfDLhwWHFiiPxdsJFNwpux8SY2PNQ3N/omhqukzNcUCKeA25fkcGkxgxEpvfmz+2gNfeY2xHDeKUj9DaQZuGWnl73gIjEuK7PrTj/9QdVTrJoKxee
X-Exchange-RoutingPolicyChecked:
	DCJdIUAo/a9QLN4I1w0JxmNb7NQVTIWtjwoBuytKTggLMKe92lEzt++S9AbTneLHo3rXzpd6pZjWVFeFIl44ahwSPzi68Ad0yztt/QWKEzUxxMKCW0nk1QreUZkc/+m0y0cODnd9Q0cIYQOf+iUVvRRKdxxERFK9zlDgoY6StQFntMMOfTl07HU2ByHehAeEhczDRjL1KqODybudVObAeWFCeNXvd+T1OMUIVFryYB2h4eeCMd0PVq6lVNmA+1fgXFI/jOEXGcsDWz7GZ1uFeE+SaKIF91aWdfVcNAaGHnx/o402cV/2ZsDPmgxBqcqaD9W+Ks1/uB1n7XUgcdhgzw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hB5gdyRjQiTHhnjevnQsrJ1py2xIIZEOftiQwbCUmc09iLbeBJi4WUCEp7firUS2gt+Q9xZahM48HpX0bEke0rtW4BU2CWdo7TfSmdvRcsMgm58p1VPnfjLBTfe35We8djibY2o1pc6eCKqRLtEeceDz1usGgfr1IaUUjczJu09Rs7sBe+J++RkJ7Gya6DjadFz93KrgchqXpVpwzXLNY5PeNufoh4j1GlMwfyQN1rsKjLKE4lMj4Yx5q/vJVIHm4cqJx0OWDyzR/p5XB8JCXyts439bsfAXwSD5Tma/TjHsKQfmoV5a332Q/i/IYq+U6WQbr1++jCF69FpRExKBwh9bzQK8BODofiyKhLQj+ZLGUeierP2nhqmXqTqLys7hPfLMbY5AaJysI+Jv8qIw6KG4znlNsPohqcNyFbZRa2sbBV/Je7K3Ic1VIq098nA8xGukY/MkbncHmH/WV7oGD9lYTz2DyuO2I23gBJm9mU+daMCpTXMHoXwEkXLrgRu39L5m0o13hb/q9/hyM4e/KkjGVNYjk5GKh/MqbHR3L+BaIdAHyKO92BVvXCdNcvNYHo7poMtOHkJA0U5vSorrwHgZYcMhIdqPytC8/LxFr2InaHEQ1tcEaF2v7SUmi4ZIkAQv9NzT1eaw+WFTKY79pQ==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:48:43.1383
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e973442c-ab0c-4fa6-c89d-08df402ccabd
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037B7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR16MB5114
X-Proofpoint-GUID: r1EpCYjZLA7pg__R_Y5yFKakIE1FB4eB
X-Proofpoint-ORIG-GUID: r1EpCYjZLA7pg__R_Y5yFKakIE1FB4eB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfXwCE2662g8pGs
 Zjr0Mpvqgn42SHFb3MVi7YkpgLK9bwzeR9L+wa2yhciObtbeJEmg8ZGUSls/H6RSUY2ZzHW5aFX
 GMQLbK2j5fuXRKinsoP4CCfVTN9VsGG8dfmJ+K2nnR3vxZppczWEbdTs9oJ+DIhWR2ByuCwH6c1
 1i8kudXO7rfEVOwRSVGxlbIhr3sK/2wJcZm8Du+0UkYFujn+Vkg2QL2lxTZfQqd6yEUb6db4rqO
 5eoLxS7E5jc7FtW0Azc+pO2cmJHdLK7iwj52iU3Vu7tftyR7cXUtJE/43RRHmYt79q9kYARQTM2
 Nn/K4KypV9jcmijydC2I+Qm14D4pVzh9nGCbgJEqjxxbtcEOmvEVnQh/Vznv3DzPRBau02H9Uk8
 d6vf2Lsd3SB2cR8D4DoSKkKSYFohcsoLncnKTEG4ld7Ss8guCeA4LlD55i3EnG1kEeDDMm2WkSd
 NrsL3eJnaX7ewPMs+fg==
X-Authority-Analysis: v=2.4 cv=XspvqlF9 c=1 sm=1 tr=0 ts=6af4c6e1 cx=c_pps
 a=zBqzCUVTuw7ADAyXD+R5NQ==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=dw5MciS7gY-znkhJuOLE:22 a=cbNQJ9GKAAAA:8
 a=gYP4Af6Lc_8I-dY5WDQA:9 a=DqJYxgmhk6moR-_7_KoZ:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX33ZtR0/LGZVi
 HHRxDk0kJMvp4xa0mWt+x0dGcw3Ww8BeuI1w0HLuC8EjIaYcgv2fbma0pf8rKcCONpHjuKebq86
 /jC4V32ax4LAr5AfR85XAqDOSMafwcSf6mJ9BR1WoVC9mS0XCrwA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110078
X-purgate-ID: tlsNG-ef75cf/1794426595-356C2AE4-E47A4DF5/0/0
X-purgate-type: clean
X-purgate-size: 1673
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Add emulation logic for FCR register.

Note, that does not hook FIFO interrupt moderation to the FIFO
management code for simplicity.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/common/emul/vuart/ns16x50.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
index 8d3845a8a4cd..404e12311090 100644
--- a/xen/common/emul/vuart/ns16x50.c
+++ b/xen/common/emul/vuart/ns16x50.c
@@ -436,6 +436,39 @@ static int ns16x50_io_write8(
         }
         break;
 
+    case UART_FCR: /* WO */
+        if ( val & UART_FCR_RSRVD0 )
+            ns16x50_warn(vdev, "FCR: attempt to set reserved bit: %x\n",
+                         UART_FCR_RSRVD0);
+
+        if ( val & UART_FCR_RSRVD1 )
+            ns16x50_warn(vdev, "FCR: attempt to set reserved bit: %x\n",
+                         UART_FCR_RSRVD1);
+
+        if ( val & UART_FCR_CLRX )
+        {
+            ns16x50_fifo_rx_reset(vdev);
+            regs[UART_LSR] &= ~UART_LSR_DR;
+        }
+
+        if ( val & UART_FCR_CLTX )
+        {
+            ns16x50_fifo_tx_reset(vdev);
+
+            regs[UART_LSR] |= UART_LSR_THRE | UART_LSR_TEMT;
+            vdev->thr_pending = true;
+        }
+
+        if ( val & UART_FCR_ENABLE )
+            val &= UART_FCR_ENABLE | UART_FCR_DMA |
+                   UART_FCR_RTB0 | UART_FCR_RTB1;
+        else
+            val = 0;
+
+        regs[UART_FCR] = val;
+
+        break;
+
     case UART_LCR:
         regs[UART_LCR] = val;
         break;
-- 
2.56.0


