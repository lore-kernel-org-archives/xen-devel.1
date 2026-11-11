Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2424D606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 19:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=KyOvQG53;
	dkim=pass (1024-bit key) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=iR0W9e8c;
	dkim=pass (2048-bit key) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=Lnqnsb7R;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=P4MjwwaA
Received: from list by lists.xenproject.org with outflank-mailman.1484822.1688199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREJt-0005Tc-Kl; Wed, 11 Nov 2026 19:49:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484822.1688199; Wed, 11 Nov 2026 19:49:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREJt-0005TN-Gh; Wed, 11 Nov 2026 19:49:21 +0000
Received: by outflank-mailman (input) for mailman id 1484822;
 Wed, 11 Nov 2026 19:49:20 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xREJs-0005IK-7Q
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 19:49:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xREJr-004SZD-Js
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 20:49:19 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c699-8faa-0a2a0a5109dd-0a2a4502b0a6-30
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:49:19 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c6be-6ca4-0a2a45020019-94a38ff1debc-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:49:19 +0100
Received: from pps.filterd (m0367127.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIYS7N1667171
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:49:18 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11012069.outbound.protection.outlook.com
 [40.93.195.69])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hvuej23j8-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:49:17 +0000 (GMT)
Received: from DS7PR03CA0190.namprd03.prod.outlook.com (2603:10b6:5:3b6::15)
 by DSWPR16MB022189.namprd16.prod.outlook.com (2603:10b6:8:3b6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 19:49:12 +0000
Received: from CH7PEPF0000001C.namprd21.prod.outlook.com
 (2603:10b6:5:3b6:cafe::97) by DS7PR03CA0190.outlook.office365.com
 (2603:10b6:5:3b6::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 19:49:12 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 CH7PEPF0000001C.mail.protection.outlook.com (10.167.244.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.0
 via Frontend Transport; Wed, 11 Nov 2026 19:49:12 +0000
Received: from pps.filterd (m0373460.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIZjjN3211983
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:49:11 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4htnr35388-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:49:11 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id REJgxlrjYam0hREJhxXeZv; Wed, 11 Nov 2026 19:49:10 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=dvZ
	+bJR/7u8Go/qdqiHtcJwrh7qguxe9jq6miI9Xb3c=; b=KyOvQG53Gt714s/yQkG
	7hUD/SD148Ltik4xl9CAY4BuwPZQY0/a87+1QLlRff3qp5mKgwVYsGXbmvQsF7AR
	i533rjHZYoZHTpvUi0t1VEzQH5VUq5fDndwN4XZeNAWC03L5hAP49CqfKxU4hrT+
	RGY7FyeCDxCYh8/eg121Z4veOYGiFA+GkoYWdDdC+puuG4qxdeK0gDCTWXA0iaA3
	omRKP4AuO8YEoMjMgaBah6sKAKV5NILSWAcqJD9hA7ulLXOCpzRKKNL8ofgIzmA+
	NgnxXpPRREXEfOC2tipl6i3nKfXVZrf8AHrpKfan6aJrCd9qKVUn+iZYcLXoQvYP
	aMw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ewhW9yZR/OG25H0CLSBqzimeFHH7mR1XF6SXkqSxwctAQyfvRpIGW7xDvZTO5TVDNSOBZaqDGsXnXT+cAMm+Qk3S1ibLfD30NCsqljZ/TG9CR7N66MPruZNChDbt7JoMJdBPCZW2LRJPD+OxP3d6aMPAyvrdQBFxH0iaZbs0n1Htih5msrJL5T/erC/svXDgB6gQ7VrJxBS+HnkYjW7O0hdhnqa9xA8ecZNpAErFRjXzY/l3QAeDIcWZsXmdoxteR/TwIcdTXM2sVdTc48Slu971zgoxfaB3jMBY2TQrogKPH0XYwtmo6GvjE6yab6ktOuJD3KKUjZ1aSNQN/mL+mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dvZ+bJR/7u8Go/qdqiHtcJwrh7qguxe9jq6miI9Xb3c=;
 b=RmCVDgVjFs8JCjsmcefKeGkXa45q5WJCD2v+lV4TJvhuHiEP1Ixg8c+nED26un0sP6Zc+hZ/vDVusKnwNxtOEe2Q1mgQHeSpUQfCWbiEjrHsZ+EAo2BLR20E5o3kZqW1P6BcAHUubWn953QAjMlws2nKZkzMEyQFcwuQL+1SEDMgaGxpYSIkH/ZEO+NxzITmvHxostkENpBTTUSxceuKM8SYbVFf7BcJOWYL4iQJ9jkFRlKZTfTL20xuYEGXQMtXRejL313jRB75jySYUkL5P0wcgO6ZR6GvaejDevLcAU34VSm/qJopiDOzx5ISVfwmrAhZROx8oIA399IGAA2pSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dvZ+bJR/7u8Go/qdqiHtcJwrh7qguxe9jq6miI9Xb3c=;
 b=iR0W9e8c5pnrH7GwTgN8HByXG4XZHFj986AQaqIbMMgv75OtgpVxMtJWKimiTeU2pteoveBwIIu+zrH79LqYVblIPcOfdxbl3t8u10qkOlIr60+gLZnkY2A0hnzP6AODwyfZrQdVXGs592UrMinanGJwHzg6BETYs5kkI1EgZTI=
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
	ppserprodsaar; bh=dvZ+bJR/7u8Go/qdqiHtcJwrh7qguxe9jq6miI9Xb3c=; b=
	Lnqnsb7RtBtOxg+U8fy8yo4mY48mBUf+hHCC+aV2/XwaXvgtVh0F4q6h3cigCxSv
	O9ed2qTVhxXG4cU6PY33IQvJF/B0zLHEGmA5ZIv/npaf8Y2QPVj7UjfLHLRElq9C
	SFmetAKn951BDoFcoI485vvQucgd6p4TyDi3dCgfkq+wjucAQcLg+oe81ENdj6iE
	J8+hP3SS6lVA7AqRGhMN/t6gRxm0v2JPrBefbgZdpI1k8MQq1a8tS53rspRYMqNw
	moXZyAca42dGFadSU3LDwVHEvl0xvfJzUeqRtsxPZ6UsLq82+DInokxcIDgw8eCj
	5AFtthfVCcfE6+l49K98VQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=dvZ+bJR
	/7u8Go/qdqiHtcJwrh7qguxe9jq6miI9Xb3c=; b=P4MjwwaA4/2qMNDFqiigJ7x
	J9iXNNqdYXynm4aH11kTd62SGmWgP48CB7VJTdtjxY+AsQ2u03h+3DFu/3Dh1C7Q
	3yMkuQ++R37Mag//FJjNiV1TeUDcRNLEV1O+Fkze753F4v4oZbk5JohIJwEIF0E5
	VfDac2AjumPAtbOCZMvDmog2QfdhjqyMaoRmb5Gje8DpBThNZ0LubpuzMR8trpRr
	2rwBDFopA4BAxuB0ZLnvoZ8HXjK9wGlS5BiTSEL8oFSY8e5sKHzM/3gDz0IuUOLT
	76/DzVr1VLomgFuRrvJ267Dj6nHe+StQVdKBtpIegtQmB6L0AaDVehzVIb+tYWA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: REJgxlrjYam0hREJhxXeZv
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>,
        Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [PATCH v8 23/26] docs/fusa: add NS16x50 UART requirements for x86
Date: Wed, 11 Nov 2026 11:47:57 -0800
Message-ID: <20261111194800.1070016-24-dmukhin@ford.com>
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
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110078
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PEPF0000001C:EE_|DSWPR16MB022189:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 906ff602-9e3d-4be8-2e42-08df402cdc37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|23010399003|1800799024|18002099003|22082099003|6133799003|8126099003|3023799007|11063799006|5023799004|261026140227099003|261102123227099003|56012099006|261026121527099003|261028144727099003|261021121427099003|261021135927099003|261022115727099003|261022105027099003|10067099003|261022075727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	29sTHozo1Bi0GmTjQSyhVbAUW8cPYr+8EvwwxhR6UWogvqc0okSB1j/50mfsTExoXKVyTTuVuAKzbh0uLm2A8Rxx7SMKuUYHz/x314MUVfwMLjpe7d6dIiZJquM0/ZQG7cmMeKvclCQ1mXozCazajwEdm1hbDGCmeNNJJ1qfI0jjcJwLFBovhf6s/cNovgen3Fko2COeE1ixzgxVyUJOnCdwxsVRLqPmHf0rN4VNcLM7+d3z0hUmsl6ekujxUIncKNFce78WGoeq+vI+ZJxxrInGJlgnVFwT+Rz46IZKCNG3ldIAzbVSVQ7Rp6KtKzwQH36HSZn5LQOU+jYTUF7hL5T0GbWhLtdqsUD294bm6+u+nCJpWyMH9DcExL3vloH6mthh2qM9zUrQu1tWvSQjMm6MnXo4BwA5Y5VHMMIxJfNGnjVHy4qZlkoWYKMCAEnTZrDeURAz51n8xosSrEX0uGyFgAhuF2zDwCSe1moODUqugGGQm2wznBzYYe4ZRaQKe4NKCOe/glxEO3GjAvgOFS2Kb6TW/+tuQK+zPsX94PiFiXfdT9MTxnNNH5UgVuPlMFDTDzNZO22ftJw7aegyFSP9EMt4XWpZrgikf5Qsj9yiWlIw8JYq7qJmySE7V3iDo3Y1iSa18EAqngO4KLJzSUoehrrlnkw5wOsIeic4gJ0vqtuzNe8gaKl7Jg6WQAlGFKJEpOtEs1BWENCXIUEhpA==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(23010399003)(1800799024)(18002099003)(22082099003)(6133799003)(8126099003)(3023799007)(11063799006)(5023799004)(261026140227099003)(261102123227099003)(56012099006)(261026121527099003)(261028144727099003)(261021121427099003)(261021135927099003)(261022115727099003)(261022105027099003)(10067099003)(261022075727099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kjglvuGKEABdDdT+Jm6Zd366x04H0OGJIWmxl575DdCyFpYH/nHUtXvAlug5IfXe7u4EMqW2/MJ1NnIEVymnT4tufEyPY43s1zIPOXPcXmt1QvG7Yz9iSYJNzAI//Yup33L/H8Iak8jVQIRr2ezQKnknCmPFEmX2dS5OAONC5tAl/yxPX5I5aFC/pt/qWVIUAjVgdE9BcCZUzGWOlwspH7TFzV5E+H9sWBCimgeIKZLxlH15vtHXtSTP45YGJH/EUaLLSxVEMoAi9jQ8HJoRAMsTmnM/2hAkgJTGpN9KC6Ak18W4TnCNXkpwpnbhhnGVrZI55xyFmzO7kYP9brhJAtKLoUs/siEYOAl8qU2lhcf0j308X9PEinRwYOe/XZc3t2GvayBKORZF23Gj8yXX9WjD8mXJ+d+GioCcghW1HdGneJyh0kR05BC2HVygCGHR
X-Exchange-RoutingPolicyChecked:
	WIvTGjDvqwckUxHXnVBJ3lVWopzgXpti0rCbrbKAtTsEILrqE0zXzOnoD8CKE+lthaqZLlchx5Vq4pOTx/OCbgoQVXQUwKwX22c94Ebym0ERU8G859NMTOkowJ31Y7DkznoJINBa1E8Nx4J1ErsJ446KPOajcti0NWAw0/8N4n3sqW2NbbB/lICKf721EIaRevLXDrqFEB5RqQ6RpbBupvH4SkvjeFYNixaHHZhu49InsCxAo7uDU2cH4XlaSoQOCsKjOzzl6Hhs3gMUNXeDFS2ZYvttcotLwVYk8ou/kzAeqzUJrXt36Woz6ICL9jSnsCCa/mMXRddyMvb27BZkXQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KpTMkiK6V+oOm+j8NExseZC2IZ6jrVlAHFnKMuhb8CT30sTqMz1tUfbCifX4W0obevRH1rvRr4HhSLNK+bZnWAiGPu3PWSLqF4bSaZ82RMEGBnLzOjtHaypzh4MG11f10vVTgsIQDMrfaEJ4YaoU7WP/gdKqSpVjZ4PB562NO/au4fDRxY+Yr68E5SfsDD+UQCLKH8qiFf0PPHwUHmJEZGmVlOo/luzuA3CabSptpVQEb7KurSfuHB7hZlRL2bIC9aSEOZnEkXfADtXPnvqm1B2tLJzqqI60Dhc6H8wdqmt8MzWa2cXC4P0TTPVWAxAXMGTxIDnU8AnCVly9VnV/4XQH2doGK1Vf8L1EYKnFrZ0T/9ApfC/R0FT/krPmCey/I4OXEN7cMLfefUTY4GpiqBLC2CbIW7qyhPwSin1N/8bXQkEzgjwWdZYjgzviV5JUvJ2AbWdGSMgX92SUTk86If08kaVTz5HrOVANf53fzClRIhQVgBXjsp3rx6TNvGKH8mS2rAfiD04gPxUHDM5jz6ipLdDqy5z861CLzd8QGrLl36k6g+PAKCg+A4Vv9fU72pAHg7OLn+VGUJbeC32fhIevNiRHgALct1+1srn7ArpSNysBzf9ODGpMvpxnGQDtvCrihbqzA+oo98z+zdsFsA==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:49:12.5416
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 906ff602-9e3d-4be8-2e42-08df402cdc37
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH7PEPF0000001C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR16MB022189
X-Proofpoint-GUID: cTFLp-rQ4h2lcnyJU36l_qCWdxzi6Kqa
X-Proofpoint-ORIG-GUID: cTFLp-rQ4h2lcnyJU36l_qCWdxzi6Kqa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfXxFMhkuliwn7D
 V/mEP2BVy+1M9eB7saI4UPfuWQj8OVOcoOK7Ik1C1SgYazpcgbXbdhhjT/DKBRzUnXCqytUAdPj
 ggkGPrN+z+7LrE5o/kubhWbaLWRQBP48PGr+oABCrgwdfzlRHAaTmwi5jvkR6FAcA62RQfYQoOY
 qW/2FkKH5wiDfZEDHfiGdTPOxJfbwGlGeW6bXuqDEQCK1PUG5t8HEJfay/N+ztYdQ0taHQl69iB
 D1zRzeycsIDeyUixNzxJMBHv/phppSgCdXAYt3uWqe175T5vYHLD3ZTbLiMQDjOgmBakx0sqWy5
 JO6LQCmy+0VQ2Jb4FdBKZj3KBhs2iDbdsz8gMtmAW2rhweY3AL3A1SQ+dum3PUTXY+otzaiF0bZ
 tO1WN4dvCpI+2xAziZQytR4zdSCZ6J5pVRs3Faht23sBEUN0fwp0lnD5Au6KGxGfakX5lFZcpGo
 XjH9dYybV60+LRxeibQ==
X-Authority-Analysis: v=2.4 cv=XspvqlF9 c=1 sm=1 tr=0 ts=6af4c6bd cx=c_pps
 a=LyZwXkN/zJaPlZXKe3eCLA==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=dw5MciS7gY-znkhJuOLE:22 a=zd2uoN0lAAAA:8
 a=cbNQJ9GKAAAA:8 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=VKpufBUaxG8ffhOI3wMA:9
 a=G69WFyCBNqGPyalROSdv:22 a=WmVTiCyuxqgg3mnwYu6p:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=5nT1WH0yq-OfmyJs9xx4:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX0bwX+5oKwHc8
 UwG/ID7m42H/8CaWXMAbUUOF1aChg/yX9K5kPBAPLHkCh9MaN14ts66iCvywVcEzYloZiCmA97n
 lher/6IDuGlXFt0A6aCJ3dwRRg6iMD19SmG16U67i0ZEEkLFZhR6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110078
X-purgate-ID: tlsNG-720697/1794426559-313CC2AC-ED5B137F/0/0
X-purgate-type: clean
X-purgate-size: 12992
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

Add the market-to-design traceability chain for the emulated
NS16550-compatible UART exposed to x86 domains.

The design requirements are written one per row of the test_suite[]
array in the XTF test tests/emul-ns16x50/main.c, so that each
requirement is covered by a test case.

Additionally, document the assumptions Xen makes on the domain in order
to provide the functionality.

Introduce XenProd~x86_emulated_uart~1 as the product requirement the
design requirements cover, and add the two new documents to the toctree.

Finally, fill in the maintainer of the FUSA (x86) entry and extend it to
cover the x86 product requirements.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 MAINTAINERS                                |   7 +
 docs/fusa/reqs/design-reqs/x86/ns16x50.rst | 386 +++++++++++++++++++++
 docs/fusa/reqs/index.rst                   |   2 +
 docs/fusa/reqs/product-reqs/x86/reqs.rst   |  24 ++
 4 files changed, 419 insertions(+)
 create mode 100644 docs/fusa/reqs/design-reqs/x86/ns16x50.rst
 create mode 100644 docs/fusa/reqs/product-reqs/x86/reqs.rst

diff --git a/MAINTAINERS b/MAINTAINERS
index 327adf4641a1..2c0eaaea2d24 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -335,6 +335,13 @@ F:	xen/arch/x86/include/asm/x86_*/efi*.h
 F:	xen/common/efi/
 F:	xen/include/efi/
 
+FUSA (x86)
+M:	Denis Mukhin <dmukhin@ford.com>
+R:	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
+S:	Supported
+F:	docs/fusa/reqs/design-reqs/x86
+F:	docs/fusa/reqs/product-reqs/x86
+
 FUSA
 M:	Stefano Stabellini <sstabellini@kernel.org>
 M:	Bertrand Marquis <bertrand.marquis@arm.com>
diff --git a/docs/fusa/reqs/design-reqs/x86/ns16x50.rst b/docs/fusa/reqs/design-reqs/x86/ns16x50.rst
new file mode 100644
index 000000000000..e3995dc9defc
--- /dev/null
+++ b/docs/fusa/reqs/design-reqs/x86/ns16x50.rst
@@ -0,0 +1,386 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+NS16550-compatible UART Emulation
+=================================
+
+The following are the requirements related to NS16550-compatible UART emulated
+and exposed by Xen x86 domains.
+
+Access UART scratch register
+----------------------------
+
+`XenSwdgn~emul_ns16x50_scr~1`
+
+Description:
+Xen shall emulate a scratch register for read/write.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Access Transmit Holding Register
+--------------------------------
+
+`XenSwdgn~emul_ns16x50_thr~1`
+
+Description:
+Xen shall emulate a transmit holding register.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Access Line Control Register
+----------------------------
+
+`XenSwdgn~emul_ns16x50_lcr~1`
+
+Description:
+Xen shall emulate a line control register for read/write.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Access Interrupt Enable Register
+--------------------------------
+
+`XenSwdgn~emul_ns16x50_ier~1`
+
+Description:
+Xen shall emulate an interrupt enable register for read/write.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Access divisor latch registers to support various baud rates
+------------------------------------------------------------
+
+`XenSwdgn~emul_ns16x50_divisor_latch~1`
+
+Description:
+Xen shall emulate the divisor latch low and divisor latch high registers to
+support baud rates - 50, 75, 110, 134.5, 150, 300, 600, 1200, 1800, 2000,
+2400, 3600, 4800, 7200, 9600, 14400, 19200, 28800, 38400, 57600 and 115200.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Access Modem Control Register
+-----------------------------
+
+`XenSwdgn~emul_ns16x50_mcr~1`
+
+Description:
+Xen shall emulate a modem control register for read/write.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Enable and disable the FIFOs
+----------------------------
+
+`XenSwdgn~emul_ns16x50_fcr_enable~1`
+
+Description:
+Xen shall report the FIFO state in the interrupt identification register
+according to the FIFO enable bit of the FIFO control register.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Select the receiver FIFO trigger level
+--------------------------------------
+
+`XenSwdgn~emul_ns16x50_fcr_trigger_level~1`
+
+Description:
+Xen shall accept a write of any receiver FIFO trigger level to the FIFO
+control register.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Clear the FIFOs
+---------------
+
+`XenSwdgn~emul_ns16x50_fcr_clear~1`
+
+Description:
+Xen shall discard the buffered data of the receiver and the transmitter FIFOs
+when the corresponding clear bit of the FIFO control register is written.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Transfer data in loopback mode
+------------------------------
+
+`XenSwdgn~emul_ns16x50_loopback_data~1`
+
+Description:
+Xen shall route a byte written to the transmit holding register back to the
+receiver buffer register when the loopback bit of the modem control register
+is set.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Report modem status in loopback mode
+------------------------------------
+
+`XenSwdgn~emul_ns16x50_loopback_modem~1`
+
+Description:
+Xen shall reflect the modem control register outputs into the modem status
+register inputs when the loopback bit of the modem control register is set.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Report no pending interrupt
+---------------------------
+
+`XenSwdgn~emul_ns16x50_iir_no_interrupt~1`
+
+Description:
+Xen shall report no pending interrupt in the interrupt identification register
+when no interrupt reason is enabled in the interrupt enable register.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Report the transmit holding register empty interrupt reason
+-----------------------------------------------------------
+
+`XenSwdgn~emul_ns16x50_iir_thr~1`
+
+Description:
+Xen shall report the transmit holding register empty interrupt reason in the
+interrupt identification register while that reason is enabled and the
+transmit holding register is empty.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Report the received data available interrupt reason
+---------------------------------------------------
+
+`XenSwdgn~emul_ns16x50_iir_rda~1`
+
+Description:
+Xen shall report the received data available interrupt reason in the interrupt
+identification register while that reason is enabled and unread data is
+pending in the receiver.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Report the highest priority interrupt reason
+--------------------------------------------
+
+`XenSwdgn~emul_ns16x50_iir_priority~1`
+
+Description:
+Xen shall report the highest priority pending interrupt reason in the
+interrupt identification register when more than one enabled reason is
+pending.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Assumption of Use on the Domain
+===============================
+
+Configure the UART for 8 data bits, no parity and 1 stop bit
+------------------------------------------------------------
+
+`XenSwdgn~emul_ns16x50_dom_configure_8n1~1`
+
+Description:
+The domain shall configure the UART for a character format of 8 data bits, no
+parity and 1 stop bit.
+
+Rationale:
+Xen stores the word length, parity and stop bit fields of the line control
+register but does not act on them. A domain which configures any other
+character format observes the 8n1 behaviour regardless.
+
+Comments:
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Program a non-zero baud rate divisor
+------------------------------------
+
+`XenSwdgn~emul_ns16x50_dom_program_nonzero_divisor~1`
+
+Description:
+The domain shall program a non-zero value into the divisor latch registers
+before transferring data.
+
+Rationale:
+Xen treats a divisor of zero as the serial communication being disabled, and
+discards accesses to the transmit holding register and the receiver buffer
+register while the divisor is zero.
+
+Comments:
+Xen resets the divisor latch registers to a divisor corresponding to 115200
+baud, so a domain which does not program them at all is able to transfer data.
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Clear the divisor latch access bit before transferring data
+-----------------------------------------------------------
+
+`XenSwdgn~emul_ns16x50_dom_clear_dlab~1`
+
+Description:
+The domain shall clear the divisor latch access bit of the line control
+register before accessing the receiver buffer register, the transmit holding
+register or the interrupt enable register.
+
+Rationale:
+The divisor latch registers share their I/O port offsets with the receiver
+buffer register, the transmit holding register and the interrupt enable
+register. Xen discards received characters while the divisor latch access bit
+is set.
+
+Comments:
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Set the out2 bit of the modem control register to receive interrupts
+--------------------------------------------------------------------
+
+`XenSwdgn~emul_ns16x50_dom_set_out2~1`
+
+Description:
+The domain shall set the out2 bit of the modem control register in order to
+receive UART interrupts.
+
+Rationale:
+On a PC compatible UART the out2 output gates the interrupt line, and Xen
+emulates that gating. A domain which leaves out2 clear does not receive UART
+interrupts irrespective of the contents of the interrupt enable register.
+
+Comments:
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Access the UART registers with the supported access widths
+-----------------------------------------------------------
+
+`XenSwdgn~emul_ns16x50_dom_access_width~1`
+
+Description:
+The domain shall access the UART registers with an 8-bit access, other than
+the divisor latch registers which may also be accessed with a naturally
+aligned 16-bit access.
+
+Rationale:
+Xen discards an access which is not naturally aligned, which is wider than
+16 bits, or which is a 16-bit access to a register other than the divisor
+latch registers.
+
+Comments:
+A discarded access does not raise an exception in the domain. A read returns
+an all ones value.
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Do not rely on the reserved bits of the UART registers
+-------------------------------------------------------
+
+`XenSwdgn~emul_ns16x50_dom_reserved_bits~1`
+
+Description:
+The domain shall not rely on the value of the reserved bits of the interrupt
+enable register, the modem control register and the FIFO control register.
+
+Rationale:
+Xen discards the reserved bits on a write, so they read as zero.
+
+Comments:
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Do not rely on the UART state being preserved across save and restore
+----------------------------------------------------------------------
+
+`XenSwdgn~emul_ns16x50_dom_no_save_restore~1`
+
+Description:
+The domain shall not rely on the state of the UART being preserved across a
+save and restore of the domain.
+
+Rationale:
+Xen does not include the emulated UART state in the domain save image.
+
+Comments:
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
index de19b0cda252..6c1249c9f18c 100644
--- a/docs/fusa/reqs/index.rst
+++ b/docs/fusa/reqs/index.rst
@@ -10,10 +10,12 @@ Requirements documentation
    market-reqs/reqs
    product-reqs/reqs
    product-reqs/arm64/reqs
+   product-reqs/x86/reqs
    product-reqs/version_hypercall
    product-reqs/hypercall
    design-reqs/arm64/generic-timer
    design-reqs/arm64/sbsa-uart
    design-reqs/arm64/hypercall
    design-reqs/arm64/version_hypercall
+   design-reqs/x86/ns16x50
    design-reqs/version_hypercall
diff --git a/docs/fusa/reqs/product-reqs/x86/reqs.rst b/docs/fusa/reqs/product-reqs/x86/reqs.rst
new file mode 100644
index 000000000000..ab517c02471f
--- /dev/null
+++ b/docs/fusa/reqs/product-reqs/x86/reqs.rst
@@ -0,0 +1,24 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Domain Creation And Runtime
+===========================
+
+Emulated UART
+-------------
+
+`XenProd~emul_ns16x50~1`
+
+Description:
+Xen shall provide an NS16550-compatible UART device to the domains.
+
+Rationale:
+
+Comments:
+The device is exposed to a domain as a set of I/O ports at one of the legacy
+PC COM port base addresses.
+
+Covers:
+ - `XenMkt~provide_console_domains~1`
+
+Needs:
+ - XenSwdgn
-- 
2.56.0


