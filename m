Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E82606A321
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 19:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=wdrhqzDT;
	dkim=pass (1024-bit key) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=ZaqQ7Uoq;
	dkim=pass (2048-bit key) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=cSMyuV9p;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=hECHn+vI
Received: from list by lists.xenproject.org with outflank-mailman.1484927.1688271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRELs-0003ph-5p; Wed, 11 Nov 2026 19:51:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484927.1688271; Wed, 11 Nov 2026 19:51:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRELs-0003pa-2p; Wed, 11 Nov 2026 19:51:24 +0000
Received: by outflank-mailman (input) for mailman id 1484927;
 Wed, 11 Nov 2026 19:51:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xRELq-0003oI-Pu
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 19:51:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRELq-00BkwE-6r
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 20:51:22 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c700-e002-0a2a0a5209dd-0a2a4501e8c0-28
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:51:22 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c738-5984-0a2a45010019-94a392178a92-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:51:21 +0100
Received: from pps.filterd (m0367126.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIYUvD878143
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:51:20 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com
 (mail-westus3azon11011035.outbound.protection.outlook.com [40.107.208.35])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4hvsu3u657-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:51:19 +0000 (GMT)
Received: from CH0PR03CA0076.namprd03.prod.outlook.com (2603:10b6:610:cc::21)
 by DS5PPF15CEA7AF4.namprd16.prod.outlook.com (2603:10b6:f:fc00::7cb)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 19:51:16 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:cc:cafe::6c) by CH0PR03CA0076.outlook.office365.com
 (2603:10b6:610:cc::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 19:51:16 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 19:51:16 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIXnfq1791048
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:51:15 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4htkgbn3vp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:51:15 -0500 (EST)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id RELhx4JFCQU3xRELixSsAi; Wed, 11 Nov 2026 19:51:15 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:Message-ID:MIME-Version:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=ppford; bh=X5vVY5mmGle2Pjt7eq8o8sD2P
	EuDXzQzmlbhwuxG4as=; b=wdrhqzDTP1G5N3ZN/jzpBzUnPr9PEIMrmaKySTEk/
	E3Xa22WslA4+FZDlQkbLDkjVIs4oFUh3QbmkkmC8P1R5Xvj90a1KpRvzAU/k3Fpt
	Yn62nQ4DB/kTWMsfVCW/TaZnaW8MV9iM1GUQDmLqQnNy55n5Rz+vtvTNtWVx+ynp
	W/4D3Gg4gSv59AOClRDjoR9oBVuMwGWt3XDBmN343ixkyRBmcLkmS2E0tAIsMenx
	G+llITkSVHJtp5KcX+iDUD+laD/A7nECSMqdCQ1XxjM0YMrTCfCpzxQ1HDi3Qvmq
	uV3mDHBQ8xzee9ba4MWXAVzPk3LHCQEcZEmgIIXo7mzXA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NWc8rEWN52sOkFl+yZ/ckR7ojyNhW5uMfq+UQf141ddGLkMdNHLiCQUKdn92k+YXzgxGEOFMu2znrkXNAvXcC1eMBd5FdjX6S9bIGKxyfaltpEImCJP0fF4XeOLYvoWQD+/GSxbQOHJ3KPPI9NXzUbJVVGthMZYihTc9OdLZv4HnyAZMKWGIT7o5HFWbfo3GSMx4l8WoOdAg2LoqxW+/hSDsluPR1ZDn5mJZs2fdlTvUX/IRCe/QzBFxunJ119CYvW3songncr2Y6l7sXeAjxD7TVOYp89uD7eGs3+U40iXQmKriv1Oe+zAvUmjRf8pl9X5l8gzK2j1YvT1QWuyrCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X5vVY5mmGle2Pjt7eq8o8sD2PEuDXzQzmlbhwuxG4as=;
 b=NROD6v6QmCPSnZmQ7X+jqL72lrymeKYTf4f+lOIKOAnfU0WSLYF+PMy8REPdsfNJ2YqfDP7sQ76aUkDSmQpRMwrKq/xauUOXOUdg6i2Z7WFfgS0Eux9ZvYBqjLWgE0aSctLyDn3vVp6CC8/lV6KnEX75Obei/brXTwlWXV70QE7PSlpgKXmXPNN8MPlWwB6IJcCfBVNR/larBB7e/7+LhO/dTBHaqaFADKOG42mnAL1xSh4NNPWI8a/0P0IkuEOl5BDSQPRXyyvljo89OrZxyDZX2eU34fZF6EAEFa/B3MsiRhGHvmNw/3089YAAMXYJ/l71NV4KE7ZM1St8PNMeGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5vVY5mmGle2Pjt7eq8o8sD2PEuDXzQzmlbhwuxG4as=;
 b=ZaqQ7UoqrZxgWOzOtRSYUgIZhXg3zaE1q2+NzrDJO0eMR/L+Ek/ECJr7R53sZ7vGlb4IqcC11PWpqEXr6Acbe++hsVbIw9Nb6IlFlc5WlxLL95rZpEJchcb0ILbcLD+vyC4QxBgfb8HeJGptUOu+ExAV5ZvCwo08/JSzHtcywWo=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 148.163.138.245) smtp.mailfrom=ford.com; dkim=pass (signature was
 verified) header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to; s=ppserprodsaar; bh=X5vVY5m
	mGle2Pjt7eq8o8sD2PEuDXzQzmlbhwuxG4as=; b=cSMyuV9peFyy/PXSct+i/Gk
	VpghoMZ5XSuxIKqeR5PLGUzEbb8kgypY+nRqNySZQnrdoKHcewz0qy269lddzdkb
	jDortO9NbqwOO0x+iIbgwHofIi9FQ3o90DnAy1QdDVeLs2RlEuE1rfAyqiQ0Mbfq
	iZDX5QFWse5ZajZTFjlz6F4BFKvjVph68xWqYaDyL/ZueZKw/rTDbeolXjzpZ8Oh
	wutfhbqKZustXdZtY9mDnHmIkpIiBVhlSG0HyVAHzKxpuqjZO7c4D6a37Lb7NDhW
	VIODTdZ3Hxed58qG9fRjlux+upEKBzAOcbJvSvXCrZH17Ymfp3D2+qxaZsfvpnA=
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=ppfserpocford; bh=X5vVY5mmGle2Pjt7eq8o8sD2PEuDXzQ
	zmlbhwuxG4as=; b=hECHn+vI3Qqhka2SrxjUoXUKAGmd+iFYGHHrRGgJEMinspD
	3YdGARB/7Vg3yLe/KoamKU5Yc7g/SzqmCFvHz7onMyVJAJ0Dwmy+bACglsruszGk
	clTi6OAFd/vowSlpt20PodJ3nONieWPvew1+w6Z/FZNFBOUcbBwdYVlRjkXPEGeZ
	XSBAoGnNNiHK4yOIrxVq1p1qrYxmXoYElsaTIIwlgof79J9v5S7sEcXGjqeFWX5N
	VDYTvOV6xaOyWhWQmsjmA+8gFv/eUyL0jnrnvblojeWTQ7rhNPCDW9uMsij7Zk49
	X9az/e7eqb3mHVSrr+LrgoPQ2jiYRYT/ALacJKQ==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: RELhx4JFCQU3xRELixSsAi
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [XTF PATCH v1 0/6] x86: add NS16550-compatible UART emulator test
Date: Wed, 11 Nov 2026 11:51:03 -0800
Message-ID: <20261111195109.1070169-1-dmukhin@ford.com>
X-Mailer: git-send-email 2.56.0
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|DS5PPF15CEA7AF4:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5fa2ddf6-7194-44eb-5d6d-08df402d25cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|23010399003|1800799024|260925021911599003|260925021311599003|56012099006|11063799006|260925022911599003|18002099003|261021123027099003|10067099003|261009223027099003|261102123227099003|261026140227099003|261021121427099003|261022105027099003|261022075727099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	rrP5KhklOXWsSwvWnSlOBpjpuTs7sEcNYJgseyrulKFxqV3oI5sCwGef9vNOO0dQbWcsR1KP15+t/oolutFFJlNquK/iYS1K1UI5obvA2J7gLLttc5cz56nWm6CerUQTpvJoEfUJ0yrVDkdboxNexNXKwdFHmFj4ZmxO2v1qXdfhW5/FBCDOO8etoN41H9fGu4a2Ip9t0haQ6vtxEYxr2UkAHqK6pGNUg39u70mP4ymAbu4+1o1g0yCkj1QHWra7mII2kaM21PRmRsVDxz5yON07+17FExytYsvNdxLhUvqihQjDvBpVll+r0Y1/iLg4Qi/qe2l2nwA4Nwk+LO33MVAMv4GkC40onc6s2dkBlspYoMzcT77WpNYZIe2uEeDbHsdWd9jx+6oZuMu2hiyhPFP18TvFahxWoKMSyPse/meaqR4gAxlLFKhKf65LT8/UDsaV1ehl+5fjdmO51fNeZ32bE3ykFAWEoomG5JHuzWv2TFi2c639G6SRgO//SzHysD1jfTGaKNRRjDQiAexS9ouSXo87h5gJ+s7KExj67nkUQvVkSfoDmEXvT232IaT3gBZ7QXIhnLODPtzJ/CO2gBhJhIaK3J5q1pjUvldq42s7EJ+6KDHKrfQwwoThgnO7U2qlBwlWOYlqXgap0aV9/A7PYHOUADYazqKmUDLmE3wz/wQSY2J1SZv+T1bs9X310sFRywzAanUsW/18y2eXYw==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(260925021911599003)(260925021311599003)(56012099006)(11063799006)(260925022911599003)(18002099003)(261021123027099003)(10067099003)(261009223027099003)(261102123227099003)(261026140227099003)(261021121427099003)(261022105027099003)(261022075727099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/L1yC3GDMluGuecZDwBZzZvFVaJcPmAk2/Xte80iDuHGTGqJmhcQ2yg+mcpfvFTPgYaVKZFSl0PFTMEh7djCZJcnyjvPIqafyqXmliNHiuW3C34psYMe5fB17V/ZEuKA9297+sfMf9/oXI5SHkPT9kRWVbdWa+kphlxh/SSuzHNrJqtSW73wY8BI9Gdi2ZxIKyXOAlSqdZV6ND4lrwrd058hYeCi1JHqhX4GhmYKjq4I96BDiGaFOxwasMuNc1eakWTiJivNq1JiHlyI8ouUcsaHu71pUDKa+hX7oWZN7XZODpBb6v2ZEae3O4LLDE5fKYqYEwLVkGfSdzzGXzd/umd2LFdxW4aBoBK6PTaMLU/AAajhvATElk5XW0NVU+UuAqedY2lXGpJq/QJAv0bmamStYtnvYjFgsV8Uiyk1JMH+AmG1YVGgJAHUP0aB8mFS
X-Exchange-RoutingPolicyChecked:
	aEF1XtqvmghlUAWTcI6FROFzuFlCBlCWygJPflzZ0s2gCYb09e1Gx28PKtQ60FBpVimnMrOnt4ZarZ2o+s7z0Z6RrLC+WLKc4eYuvYnfZTqamf74ssngxJvQmpqrpXwz1Xw/maYf+Cfw1iB2JyiryPqBQ8vaLbGV/jY0/b8ZgmgjPzVpcZtwIz+O8HnSaLLAPckgdtlj+VcdJKvmmFOTcMBq4ncN2NmgfpfSZt1LdC8l+ndqQWRUfUAHGk8ixv+6rgTkPNnDUnSCnnwDcEO+9PyGUQOvcRjIO8ubejcQFTGCw591jDswb2C4d049/FMIklFUk62L/XQgmivxEMQUsQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	x39huNlCGzaw/ifhZHSfVRB6BE8YmV+QrYfJ//tjkrhxU63S1Z2fTRKln7Uj4l9VFZv/NPWjAtfWJLz/IomR+RtNbXDRw3NUbq6j4oKQIIEFsMGPG6LMb1ZznwHgo1p68RWB+xwM555l6COQeSfyaLBUDuHVSloxGRGzrtKLipM80uAvV4slniWLS/3qxwbOizg3PRZMMt73nj9iKrczPFTRktElaIfHFiu7Sp8Uuvt5ZUYKMS56Z8kJTyvT1P7JkSVxVdt4NPpiHLidA9osLKkwEeWx5oJsQCctcOKWy3ZvSeZhVPen5ZF0zCp3//HYp506GJoRGF75EYWO7Cel8TLssTr/L4aB3d1ibKne8usaP+zwCHEqNv4TQWpKqhzDG/XRw0Q3v6twEMQUjnPGSWrGXV+XhV8dzwHWPnE6xpheCVI2Pxfd6QbNGCQnNfDLtWrY7EUXcSTW1BCy6L6495WfHtPGGSHEB2PRyeLaH/MOt09nhUAhlRXA42DNW0URjKKLGC15wNaQ8SGo76f3yki8zGKYf43XZmS3WsabURBd7dP0n/7wMXymjj4SgLBo23OXf/tpwcWPaYUIcZ3MtTCRlHHieDzXWczOj+MaUltbS+w3a3wr+bnbbE3vQJ9Am3sl4MBfM4lWjA989dl9Kg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:51:16.0488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fa2ddf6-7194-44eb-5d6d-08df402d25cf
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF15CEA7AF4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX6eEmoZdszqUO
 KRBFWGRDmZzv4Rmiji7oxSTXt/38YI8GoPsT1QyPgnt7POYTlcHXswhl0KasF6OoHRbY4SHnncV
 v/og/V4R4b/7Uf5O5Rgrlmxyhuku04hllgvjzBaqE6WMOhUA1GBc
X-Proofpoint-ORIG-GUID: NhXyacGWmKfQ8nFWGmVuCx0g5Qqikj0d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX3OGKvJfjpdrG
 tMC5hAOawpgVI8d5tgWPFbG9EjiMLgMyG3WOQwvrWkefEBewLGd4L9Pt513lh5RqP7YQv34SOR5
 5GMQZTxC4ol94q/QdvXdp7jll6laF3I7Sc5iiDhw0peVbgdQ9Zg7mYlzlDWsKsG3QfDGq54+YZ7
 +VN2Dn/jnXI3k9qkoKYDvQ8jmq9n+1yy5BBbPqziVz09s4UgYqsO2dG9nhayNl3HmjDhqMvR1n0
 ns9Bn0GMX4hNyh6/gXRPK1CXZ+g+xG/WyBqtfzL0dxIlyJgD1wfaXOMRMcoFo76SWMl/ay1g6oU
 bSDUj30pzw0wDl+ul+a8CvZHO0PEyRnMBliQil/NAdDp6bNMhTBVrI4KrrD5bjCP7dQgfCEWxsK
 T95KM+p64u4Ad9hwBSgqj89sb5kh45WHtkhZOPe1dsAO1SHBRkOgmIXTB+Ti/gNtakOTfhJbJCM
 L5BbA8H6dCAFSJq3ePA==
X-Proofpoint-GUID: NhXyacGWmKfQ8nFWGmVuCx0g5Qqikj0d
X-Authority-Analysis: v=2.4 cv=I5Pw19gg c=1 sm=1 tr=0 ts=6af4c737 cx=c_pps
 a=pKPYWX2mfyrwmcKrUbCwIA==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=-OawqTZBqJjt90xPb8wn:22 a=p0WdMEafAAAA:8
 a=kKidwSkrUYpPo6D4stcA:9 a=G69WFyCBNqGPyalROSdv:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110078
X-purgate-ID: tlsNG-d62444/1794426682-1EE60757-29306862/0/0
X-purgate-type: clean
X-purgate-size: 1830
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Series introduces a test for NS16550-compatible UART.

Patches 1-3 are preliminary cleanups and fixups.

Patch 4 allows emulator to be the only registered console in
case console hypercall is not available.

Patch 5 adds minimally functional NS16550-compatible UART
driver.

Patch 6 adds a new test.

CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/3055921295
Link to XTF branch: https://gitlab.com/xen-project/people/dmukhin/xtf/-/tree/emul-16x50?ref_type=heads
Link to emualator: https://gitlab.com/xen-project/people/dmukhin/xen/-/commits/vuart-ns8250-v8

Denis Mukhin (6):
  .gitignore: exclude tags
  x86: introduce cpu_relax()
  x86: isolate FEP in setup_fep()
  x86: skip registering unavailable Xen console
  common: add simplistic NS16550-compatible UART driver
  x86: add NS16550-compatible emulator test

 .gitignore                        |   1 +
 arch/x86/include/arch/processor.h |   3 +
 arch/x86/setup.c                  |  87 ++--
 build/files.mk                    |   1 +
 common/console.c                  |   3 +-
 common/ns16550.c                  | 153 +++++++
 include/xtf/console.h             |  15 +-
 include/xtf/hypercall.h           |   4 +-
 include/xtf/ns16550.h             | 117 ++++++
 tests/emul-ns16x50/.gitignore     |   3 +
 tests/emul-ns16x50/Makefile       |   9 +
 tests/emul-ns16x50/main.c         | 644 ++++++++++++++++++++++++++++++
 tests/emul-ns16x50/patterns.c     |  65 +++
 13 files changed, 1056 insertions(+), 49 deletions(-)
 create mode 100644 common/ns16550.c
 create mode 100644 include/xtf/ns16550.h
 create mode 100644 tests/emul-ns16x50/.gitignore
 create mode 100644 tests/emul-ns16x50/Makefile
 create mode 100644 tests/emul-ns16x50/main.c
 create mode 100644 tests/emul-ns16x50/patterns.c

-- 
2.56.0


