Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5ACF606A328
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=oHv79CBL;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=dRzHQXVJ;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=AcuKu3QY;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=tsyk4vK9
Received: from list by lists.xenproject.org with outflank-mailman.1473238.1680919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmNk-0001Gc-R3; Thu, 05 Nov 2026 01:35:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473238.1680919; Thu, 05 Nov 2026 01:35:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmNk-0001GJ-LW; Thu, 05 Nov 2026 01:35:12 +0000
Received: by outflank-mailman (input) for mailman id 1473238;
 Thu, 05 Nov 2026 01:35:11 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmNj-00017F-E6
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:35:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmNi-00CQOL-QF
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:35:10 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd2a-e002-0a2a0a5209dd-0a2a450bc7a6-42
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:35:10 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd4c-b7e8-0a2a450b0019-94a39217a1d8-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:35:10 +0100
Received: from pps.filterd (m0482517.ppops.net [127.0.0.1])
 by m0482517.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6A50mp3B1644786
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 17:35:08 -0800
Received: from bn1pr04cu002.outbound.protection.outlook.com
 (mail-eastus2azon11010011.outbound.protection.outlook.com [52.101.56.11])
 by m0482517.ppops.net (PPS) with ESMTPS id 4hra2g3ajj-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 17:35:08 -0800 (PST)
Received: from SJ0PR13CA0192.namprd13.prod.outlook.com (2603:10b6:a03:2c3::17)
 by MW3PR16MB3915.namprd16.prod.outlook.com (2603:10b6:303:51::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 5 Nov 2026
 01:35:00 +0000
Received: from MW2PEPF00014674.namprd04.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::a5) by SJ0PR13CA0192.outlook.office365.com
 (2603:10b6:a03:2c3::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4 via Frontend Transport; Thu, 5
 Nov 2026 01:35:00 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 MW2PEPF00014674.mail.protection.outlook.com (10.167.249.181) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:35:00 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mViX3091702
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:34:59 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4hnycbnhgw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:34:59 -0500 (EST)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id OmNVxcKX5uKemOmNWxhKEH; Thu, 05 Nov 2026 01:34:59 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=KVy
	Hg65VjisPRHtr2bi3zOba6+8hFJxogzy5Htt3tIA=; b=oHv79CBL0tFjhrDJN7i
	VQe4fcbcB6Zzpe7q3qUBQJ4f0UCZUwwnip+fy3hEviztNjVKnQ7THNItde04AIQG
	YQF1aqYqTcP/gG2utcWyH/pOrvM7tq5BMUAJEUFpNmyJrrHAoNXabfuQ5krzyFIu
	KJ82USVILxsjW93ki4U7X1YQZZpJlUzXdMSCfDySYcotGw9nosTGhOe8F6RsocXx
	Hg8qdO7XGylI9qLzUIO7tL93Kh1uGE+UcN/+wsbxKGIoiP9heZN5lbKnW5VdTJ+W
	9IqfNr0ij3pCNJiu5k9D4lntbCJ70Eua85asDoLq7Z/Dzu3snHpCAXiwqUPGnYVx
	WFw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oN32ZjSXMeUgAeAbQgRqTcSOS9PzvwRUAgpE2l1IBS2XlzAY27M7Kw4XRqVoCvQVePfORLzvtk2mNU2ZfYdcQduufqu4nVflH+94pDV5xMHswsmYrP1CPYhWL1FZh3xLzQzBTNF/tX6AodYKiTU9CRbNTP8/weXl3W/Coc+M3JeDlmUUewvfYCmoMIz6RCfXC3tgFq1i0Qkosf9QydWtzzdA6iGnuwG3TozbcGuqkoUULwsGghCALS0hjkIVurarBNldPtfgWeA3JLAFwzFXKmtV/UguqPQrnF/MIs5X+L+PS6IZ64jt21m9oxY8WjyYntwODLmFOPEEqriHDFBpuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVyHg65VjisPRHtr2bi3zOba6+8hFJxogzy5Htt3tIA=;
 b=xuI99meYZ88eoqWiLiJJ7Z6CMzqYAyVR7fJcl3n1b6KXZHDoMTklQJo61kUHZwyBfiBC7BkAm8E4ikAJUgngYiZP0HYmBBuHHjG217lZVc/TdoAQ7Ahq5vDlCFeo0Udy8YVMJO3goOLF5Ml5ifT5owCfESYh4YmgYDUwvvSWIcFKEHuCNR2MrqLjeWvA0xNK1pbcYTTMJS1pcAujT4SjuJBeTYj6vv5dtASDhf12v2kdFoXm34C+cuWFuyTHM8YRNIVGzPNFL9Wen8HuDR5GrQKiSKft1q3So7bYPXnldmqU4mtHLBIXHT3uLj2g/c82TNlgwguu7FlwUfCEioWfOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KVyHg65VjisPRHtr2bi3zOba6+8hFJxogzy5Htt3tIA=;
 b=dRzHQXVJldt0HD+OQFlP1QHAXiN1jLsDqpiuO8ztiTSGm4Y3fbzF7Ht9nTXN7aHv8K2ZXdqpyK5NpkbSDdgKrMe8rYLoISL5c8NzMcK+PMRnSRNTCkJjhnRMgpV1kcI2030kD9xkkr/Z6/27y5xXKaqTtjhSfBYXAVkRVTIYFtQ=
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
	ppserprodsaar; bh=KVyHg65VjisPRHtr2bi3zOba6+8hFJxogzy5Htt3tIA=; b=
	AcuKu3QYW4YMNS0RliRJDn579SqAMYrYC03C2T7hNv1zFEq9PMhgRW0Xq2u5mUF7
	SG1JrYy5AFcAUrEyVqlRs4lEYKdmool7WvUBTVDfgH4XDr+H9O1SSNX1TmiUO+vU
	OnGhgdncN5p2razIjWXd2BpMDG7gswUaSfzwz+LoDjoH5UZtQi72xx2oEM7qKFlR
	rdKcZeWrvsmYPVcW7TfGD5Hvl5m72SkG4Ap6Ah0cTQYif+OSN5nzHUbso4f6Y3rw
	cDxmjXQ3xW+37143KDyHEZiktBZ+SOAY+U9qY3mTiWWvGY+D87fNkdkLtwo/a07t
	r9y0duFLRnsncJsYSuXWtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=KVyHg65
	VjisPRHtr2bi3zOba6+8hFJxogzy5Htt3tIA=; b=tsyk4vK9gOx8aFZy0xksHsD
	St+xHDqlfSrQFU2jZh91sDV18vTjcJ+ADnJ+ZQNN2rcT1ttyPmByXeSt2gZIDc5J
	0NkO9WxeCTR3YuLehXKfP8NFe4F+MfdcRuoNzj4vpoR4HA+drvg5ozWa9PedAhpv
	3kyBhwK0X+h01XQ0FQX/7eR+WfQVB2MsWNAgcAyyTgdrEuSQffSWCqrdj8p9M8AQ
	g1hCR1sSuXd99Z8x+W27KHNM9kYP/4T0hlEIh1XcUHz9QNG1qWHknT+F2joLfq81
	fDYwSG/N+O/qY+15jMBsBYpO448YoRpVBATfGaQgtgi894jJ5glanCrbyDxwZEA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmNVxcKX5uKemOmNWxhKEH
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
        roger@xenproject.org, teddy.astie@vates.tech, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 21/28] x86/hvm: enable debug hypercall for posted interrupts
Date: Wed,  4 Nov 2026 17:33:38 -0800
Message-ID: <20261105013347.719392-22-dmukhin@ford.com>
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
X-MS-TrafficTypeDiagnostic: MW2PEPF00014674:EE_|MW3PR16MB3915:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b57625e8-35c3-41f2-8468-08df3add0207
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|82310400026|36860700016|261102123227099003|261022105027099003|261102130727099003|11063799006|261022075727099003|261009223027099003|261026140227099003|261028144727099003|56012099006|261021123027099003|261026121527099003|261021121427099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Pwoo131EPJi5KbhXWY0dS9c2iTHqbN6WjvbUGhmnaUghq+azfwMDwzLdShoE3+2UIPy03nRhWM+4x3ceaTKHZ6PGiS7Me8LnNa+r8EUHRhojDuGykk/xvF7ps948ZDVUlOSY6W+Da41rJFOR0i707Xe35Vjn4J97pdMIls7GlfkV9kXLFrxbuwC13+1wg0+D/SSnTMQnILafgW9bmU2WQRONm3lWWNkLOwHoGWVXfWhq9SRR3BGHhrjrMQ92a3JxOnmR9AoohCD4lIMdNa7LcJFIypSQh2A1xc3Cf3Oo1Imjwtnngyj4dqYfoAKPQMwcTG+craXnKcoUfZtioPzFswSfwf9ah3yiRyN3rCKHs0F7OUtoAVtaoK3TkgG2JUlo811Dw8Y5j+3oImIJIxe6HtIuevCU6GcU3xWT0KstvfwQ8BsUQaf/qEU8ueczwKPCQEjp7BNOe6v+gooG9p4AwsqoXi9gvzno+/2T4hZ+aiNwj/VfiNwmPxuJiX75orhvS1MvSk5AWhhRYfeiTyrcAgP0BsfO7vvd+u/fLu7MMzMQKdLQ+Ec520G4mD6fmOCUnnFe+9nS0e6C8tXtyhVfYMQNFfbTqpSgggfwHuC0i91tY3IhCt+yQQ0foW5+53+YVRGijKZkXPJ8Z7z0FY2E77B4U8r9wqrkXzGUtwmfrT4P+ZQA66SVq5abSr6NLLm0f7pMHjB7ocadKorvJXmEqg==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(82310400026)(36860700016)(261102123227099003)(261022105027099003)(261102130727099003)(11063799006)(261022075727099003)(261009223027099003)(261026140227099003)(261028144727099003)(56012099006)(261021123027099003)(261026121527099003)(261021121427099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qLBHLA2X222/X5n8YXjAp9l/1YhyZyWMohgR5fezhl8X6M8KKn2L3/n5ZoKxdUrV24invbS3XWUcRtTg8JxVEz3KxNjabisQUhESx5JCdNfezUVWDKEx1xO23cpuw/MI56XAZpH3ywD0BMe4QCw8KLs/rpXdyHccWhrU0wtw1DE6s1kuQN6P/nsiVvFDLscENSFzkc6EaQeEKvB9FezyxVy3qvPmmUYVNYFTE3jnpZqKr5JQcqEJmsqXEe/HvvvyLFyW/LrY57B7/yX/npDyqevQoZJjnAocu/YscrENDTtDHS5D8TWzYKGokfuv+TIY02slZaEM2xEFrm/Jm+XsxYws85GwJk9LZSwoReDKAYuFhF0j1D8GXN/w15HookAaQaz9bCSXI4ZKrSutvusAo+OmmJuoLi/9FcOHwCQScdQdNSbEfYEOYb/i9VpLAIpb
X-Exchange-RoutingPolicyChecked:
	acjz5cgwQB4BZLVMJr7yfqK2kucRS99V0ewUSgbZGmClQcVaa10aH02bCo28hTOylkFI93mx0+Wsp49mg9cdUa/2k1K4zMRRTwk3572LDI9vCAeliuiVvquONV6gQ3HKmEkj+Byg2DG30Y0pTURmSnHH5icQ/cO2MUWfnJGnofeb9gSFeeFafgzXxyJEi+Jywk/Vqu7s9Q7b3CKpVTwYnCFCWoZRLCT3zH7wXXl9BodDz6LnCYjFhRLJ2BeS7xZVGjUxekknggStDM+NCT6TWshJ2Y7TaD4fEjmdc4nZJe829425iC4D2/puER+p4AisFY8g+qiA746Vlcqfe/QN1Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hBnGsuytwQBWptnaD681E2EF9WlWLHtVvX/lNA2ofBX/T7BlfMVn/qn4+BjsbD8ket3u1qAj0FJV1r8yG+PHhLRrdk4CkrcQzoPM9Qb9/RP8F2bKTmXSz7BB7HzsIc4aa+eNdE0hXx7wKXaddSfKimcHWzILxlPkLesBqd91ou6apsxgG5HDnt4ExOxHmTaYWgbMw+MfOieRsAr52UskdudoxZ5EeTDSJRinhteRw5plH4UsEq2/hOGV0uKzu8zGaV6inkUq7UHHj07FKcEk8m14oK3EonmEGThZgSI8W51KjK6hCy/XnJZxw/eD43kP+viOfnYCjUgmNw4e8jjw6gbwTdc9bi8p0sRjuB03nTOsre8R+adIeyw+VLdd53+yafppibk2roTk9fEEVD1TmsGgwyZd14oFbMC0zMGzuPguIz/gAiZAT2giluUR9mwz3xgRTXERv8nec6NEhjCVpRKEtM8OmuGrDhbs7Gp+IIhD7wgdYFGE1fKBmwIoRtNs+ZgZnhghZ4xD4866zT0TaLvgfr5Tfxa5qRx/bH5ddgTYZfcV31BULP3clAvzCC6AeyLPiRIsjNDzzO9u0ENgkmFUSM69FZIwLOSRIxiKLRGxoVYXL15/Q4/ByM9H1yO0i/Yz3cwjXZQ1hPIkOUoZXg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:35:00.3859
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b57625e8-35c3-41f2-8468-08df3add0207
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW2PEPF00014674.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR16MB3915
X-Authority-Analysis: v=2.4 cv=Y+ptIReN c=1 sm=1 tr=0 ts=6aebdd4c cx=c_pps
 a=zclsoE7mv10+eI8hWvbpiQ==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=MLwXIh1eZMowsRZfVxRb:22 a=cbNQJ9GKAAAA:8
 a=94UBVn76oIeqiFH9A0MA:9 a=3whSkbs7g9Me0DR5EJEX:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfX93w5sAQ56Wd4
 MPmsGSTmzGaGHWj4Mt+ARFCUCfkQNUSDwOoOk0mTSW1TXvHhlIRrssu13NpX8bti8o9bcdR1yCG
 +XCmamTr4bPKoiYABLbImx56+m52AE+nC8mS43MDJn9VLM+iuSa4M7/jg5yYcVG/fTYiwNgWuhH
 PdClNHeLSoUlJMaWAcvhzzvgFRxI6TrSlyNc4j5Z1lYM2PeiJox0KsQGspl83BUf0wwznSmRiKd
 zDGEXhziYWpUoBUATKSoO/m0H0Smzc85vdHLWlqsqRo7R37Arn8kbDrp2osEn83rxUkrAhwRAh6
 AU73E+FEoufO5Z+5KKUdQy3G9SLO297yG3z6NAbB1ZTuvo8kxMespDCJa7d2MjZfMGSUEwYINBE
 yHTrrjeH5YdYL5Ht1mUaLhyrtI9QSjhhpuLj2ff8KmTbm1mB9nIhCWPxk+C4p4YCCP8NrmICjJy
 M+RgG+MuCD7xHA0rj9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfXwGBnz56aBb4P
 2qiJ/AfIc/iCVuuOPVNNmc2BrlnfUHM7bFDVpadCrsEr8wYRb9XuNgutA0mOJnL/vrUAkuZIyMT
 NFnCQe4TjXNDALD6gFHZqwSGVYXWX6qNC6KzufjZKa1n3UW6pzFN
X-Proofpoint-ORIG-GUID: NjQdv2lWF26715IYeF41JiHXCp3DCV4v
X-Proofpoint-GUID: NjQdv2lWF26715IYeF41JiHXCp3DCV4v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050005
X-purgate-ID: tlsNG-42698a/1793842510-ABCD79EA-3D337AF5/0/0
X-purgate-type: clean
X-purgate-size: 8143
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

There is a need to change AVIC behavior at run-time to enable feature
testing.

Add new subcommand XEN_DOMCTL_DEBUG_OP_POSTED_INTR for XEN_DOMCTL_debug_op
hypercall.

Perform necessary plumbing through hvm_function_table and export
convenience functions for AVIC.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/hvm/hvm.c             |  15 ++++
 xen/arch/x86/hvm/svm/avic.c        | 132 +++++++++++++++++++++++++++++
 xen/arch/x86/hvm/svm/avic.h        |   2 +
 xen/arch/x86/hvm/svm/svm.c         |   1 +
 xen/arch/x86/include/asm/hvm/hvm.h |  17 ++++
 xen/include/public/domctl.h        |   1 +
 6 files changed, 168 insertions(+)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 42139837904a..a6ca56b08942 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -5257,6 +5257,21 @@ int hvm_debug_op(struct domain *d, unsigned int op, unsigned int vcpu,
 
         break;
 
+    case XEN_DOMCTL_DEBUG_OP_POSTED_INTR:
+        gdprintk(XENLOG_G_INFO,
+                "%pd: XEN_DOMCTL_DEBUG_OP_POSTED_INTR %u\n",
+                d, arg);
+
+        if ( current->domain != d )
+            domain_pause(d);
+
+        rc = hvm_debug_posted_intr(d, arg);
+
+        if ( current->domain != d )
+            domain_unpause(d);
+
+        break;
+
     default:
         return -ENOSYS;
     }
diff --git a/xen/arch/x86/hvm/svm/avic.c b/xen/arch/x86/hvm/svm/avic.c
index 4dcd2c94ea87..ca779be22eea 100644
--- a/xen/arch/x86/hvm/svm/avic.c
+++ b/xen/arch/x86/hvm/svm/avic.c
@@ -729,6 +729,81 @@ void cf_check svm_avic_hvm_deliver_posted_intr(struct vcpu *v, uint8_t vector)
     }
 }
 
+static void avic_domain_noaccel_state_sync(struct domain *d)
+{
+    struct svm_domain *sd = &d->arch.hvm.svm;
+    struct vcpu *v;
+
+    memset(sd->avic_logical_id_table, 0, PAGE_SIZE);
+
+    for_each_vcpu ( d, v )
+    {
+        struct svm_vcpu *sv = &v->arch.hvm.svm;
+        uint32_t ldr = vlapic_reg_read(v, APIC_LDR);
+        uint32_t dfr = vlapic_reg_read(v, APIC_DFR);
+        uint32_t id = GET_xAPIC_ID(vlapic_reg_read(v, APIC_ID));
+
+        sv->avic_ldr = ldr;
+        sv->avic_dfr = dfr;
+
+        avic_ldr_write(v, id, ldr);
+    }
+}
+
+static void avic_domain_enable(struct domain *d)
+{
+    struct vcpu *v;
+    int rc;
+
+    rc = avic_set_mmio_p2m_entry(d);
+    if ( rc )
+        goto out;
+
+    /* Re-load LDR/DFR from vLAPIC */
+    avic_domain_noaccel_state_sync(d);
+
+    for_each_vcpu ( d, v )
+    {
+        /* VINTR=0 */
+        svm_clear_intr_window(v);
+
+        /* VMCB.avic_enable=1 */
+        avic_vcpu_enable(v, true);
+    }
+
+    return;
+
+ out:
+    gdprintk(XENLOG_INFO,
+             "%pd: AVIC: failed to enable APIC MMIO access: %d\n",
+             d, rc);
+}
+
+static void avic_domain_disable(struct domain *d)
+{
+    struct vcpu *v;
+    int rc;
+
+    for_each_vcpu ( d, v )
+    {
+        /* IsRunning=0 */
+        avic_vcpu_clear_running(v);
+
+        /* VMCB.avic_enable=0 */
+        avic_vcpu_enable(v, false);
+
+        avic_stats_reset(v);
+    }
+
+    rc = avic_clear_mmio_p2m_entry(d);
+    if ( !rc )
+        return;
+
+    gdprintk(XENLOG_INFO,
+             "%pd: AVIC: failed to disable APIC MMIO access: %d\n",
+             d, rc);
+}
+
 void cf_check svm_avic_hvm_dump_posted_intr(const struct vcpu *v)
 {
     const struct svm_vcpu *sv = &v->arch.hvm.svm;
@@ -752,6 +827,63 @@ void cf_check svm_avic_hvm_dump_posted_intr(const struct vcpu *v)
            sv->avic_cnt_kick);
 }
 
+static void avic_domain_dump_stats(struct domain *d)
+{
+    struct vcpu *v;
+
+    for_each_vcpu ( d, v )
+    {
+        svm_avic_hvm_dump_posted_intr(v);
+        avic_stats_reset(v);
+    }
+}
+
+/* Interrupt acceleration control operations. */
+enum {
+    POSTED_INTR_DISABLE     = 0,
+    POSTED_INTR_ENABLE      = 1,
+    POSTED_INTR_DUMP_STATS  = 2,
+};
+
+void cf_check svm_avic_hvm_debug_posted_intr(struct domain *d,
+                                             unsigned int arg)
+{
+    struct vcpu *v;
+
+    /* Ensure no vCPU can VMRUN while updating VMCB for AVIC. */
+    for_each_vcpu ( d, v )
+    {
+        if ( !avic_vcpu_supported(v) )
+            goto out;
+
+        if ( v != current )
+            vcpu_pause(v);
+    }
+
+    switch ( arg ) {
+    case POSTED_INTR_DISABLE:
+        avic_domain_disable(d);
+        break;
+
+    case POSTED_INTR_ENABLE:
+        avic_domain_enable(d);
+        break;
+
+    case POSTED_INTR_DUMP_STATS:
+        avic_domain_dump_stats(d);
+        break;
+
+    default:
+        ASSERT_UNREACHABLE();
+        break;
+    }
+
+ out:
+    for_each_vcpu ( d, v )
+        if ( v != current )
+            vcpu_unpause(v);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/hvm/svm/avic.h b/xen/arch/x86/hvm/svm/avic.h
index 24d5fab59b29..e40aa77264ad 100644
--- a/xen/arch/x86/hvm/svm/avic.h
+++ b/xen/arch/x86/hvm/svm/avic.h
@@ -34,5 +34,7 @@ void svm_avic_vcpu_switch_from(struct vcpu *v);
 
 void cf_check svm_avic_hvm_deliver_posted_intr(struct vcpu *v, uint8_t vector);
 void cf_check svm_avic_hvm_dump_posted_intr(const struct vcpu *v);
+void cf_check svm_avic_hvm_debug_posted_intr(struct domain *d,
+                                             unsigned int arg);
 
 #endif /* __SVM_AVIC_H__ */
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 83977d411b0a..f2eb01799c63 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2520,6 +2520,7 @@ static void __init svm_avic_start(void)
 
     svm_function_table.deliver_posted_intr = svm_avic_hvm_deliver_posted_intr;
     svm_function_table.dump_posted_intr = svm_avic_hvm_dump_posted_intr;
+    svm_function_table.debug_posted_intr = svm_avic_hvm_debug_posted_intr;
 
     svm_function_table.caps.virtual_intr_delivery = true;
 }
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 6efc533b35df..d44f136fae8f 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -218,6 +218,7 @@ struct hvm_function_table {
     void (*process_isr)(int isr, struct vcpu *v);
     void (*deliver_posted_intr)(struct vcpu *v, u8 vector);
     void (*dump_posted_intr)(const struct vcpu *v);
+    void (*debug_posted_intr)(struct domain *d, unsigned int arg);
     void (*sync_pir_to_irr)(struct vcpu *v);
     bool (*test_pir)(const struct vcpu *v, uint8_t vector);
     void (*handle_eoi)(uint8_t vector, int isr);
@@ -859,6 +860,16 @@ static inline void hvm_dump_posted_intr(const struct vcpu *v)
         alternative_vcall(hvm_funcs.dump_posted_intr, v);
 }
 
+static inline int hvm_debug_posted_intr(struct domain *d, unsigned int arg)
+{
+    if ( !hvm_funcs.debug_posted_intr )
+        return -ENOSYS;
+
+    alternative_vcall(hvm_funcs.debug_posted_intr, d, arg);
+
+    return 0;
+}
+
 #else  /* CONFIG_HVM */
 
 #define hvm_enabled false
@@ -971,6 +982,12 @@ static inline void hvm_dump_posted_intr(const struct vcpu *v)
     ASSERT_UNREACHABLE();
 }
 
+static inline int hvm_debug_posted_intr(struct domain *d, unsigned int arg)
+{
+    ASSERT_UNREACHABLE();
+    return -EOPNOTSUPP;
+}
+
 #define is_viridian_domain(d) ((void)(d), false)
 #define is_viridian_vcpu(v) ((void)(v), false)
 #define has_viridian_time_ref_count(d) ((void)(d), false)
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 546d9a8ac9c0..b72164f61ce2 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -765,6 +765,7 @@ struct xen_domctl_subscribe {
 /* XEN_DOMCTL_debug_op */
 #define XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_OFF         0
 #define XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_ON          1
+#define XEN_DOMCTL_DEBUG_OP_POSTED_INTR             3
 struct xen_domctl_debug_op {
     uint32_t op;   /* IN */
     uint32_t vcpu; /* IN */
-- 
2.55.0


