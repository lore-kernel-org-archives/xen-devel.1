Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15DE606A326
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=Ec5I2hdX;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=CBiJeunL;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=nvlXwP/f;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=LUhkvlVq
Received: from list by lists.xenproject.org with outflank-mailman.1473395.1681099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmQA-0003WK-7g; Thu, 05 Nov 2026 01:37:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473395.1681099; Thu, 05 Nov 2026 01:37:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmQ9-0003Vf-VT; Thu, 05 Nov 2026 01:37:41 +0000
Received: by outflank-mailman (input) for mailman id 1473395;
 Thu, 05 Nov 2026 01:37:39 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmQ7-00034N-OI
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:37:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmQ7-001xPV-56
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:37:39 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd93-8faa-0a2a0a5109dd-0a2a450a8d3c-36
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:37:39 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdde1-f2d2-0a2a450a0019-94a392174776-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:37:38 +0100
Received: from pps.filterd (m0384718.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50moFM966677
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:37:37 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11013043.outbound.protection.outlook.com
 [40.93.201.43])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4hrc5ghvjb-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:37:36 +0000 (GMT)
Received: from CH5PR03CA0011.namprd03.prod.outlook.com (2603:10b6:610:1f1::23)
 by LV3PR16MB6320.namprd16.prod.outlook.com (2603:10b6:408:1d4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:37:33 +0000
Received: from BN7PEPF000000A9.namprd05.prod.outlook.com
 (2603:10b6:610:1f1:cafe::1d) by CH5PR03CA0011.outlook.office365.com
 (2603:10b6:610:1f1::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:37:33 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 BN7PEPF000000A9.mail.protection.outlook.com (10.167.245.233) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:37:32 +0000
Received: from pps.filterd (m0373460.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50o3Kd1488836
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:37:32 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hp232wj14-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:37:31 -0500 (EST)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id OmPwx1G7KgTjoOmPxxgpBO; Thu, 05 Nov 2026 01:37:31 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=i59
	xJQT544TdeZe9R8pJlXN01S8B9AW1arnw7L5ocSs=; b=Ec5I2hdXCoX0w2bzS1M
	+2VmTK95/mlrKqQbO+8YlVQ5j+KAn289YcjOE907AQwLPCWhkpVu6idIBYE4PxTr
	tLxRrSDLZ7Rq7GYgaMu+ne4YxHz72Plhe1dtXYQZ16tf9Yv39HK6mz9oGgqQgWS2
	j8DUY/kZhHUW9y5R71NaXKNKB8pjVCBegqa7vzEGM/jyW5yEHoNXHIEAGDmdfGps
	9xvLrzQMG//fo9gxFfxOJze4pCRE94YW6PsBUi7Fs/C/ypx/7nvoMoUv1MGV/wKt
	5NrqeZ4u3jQI8jn+qdzSE8k09/TDTmGi4rbadgjxjTHPzq/9HifA6oUCdFRXa/gr
	PtA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QsXQTRRi+Bwj87JGtWrnAp+hL9YRkGTeTW6fgQdhCpKmxMqaNSsIR2lYCfK+mZ6lUk4LNVlb/gNytR76uz55edrBzOY7aoWA8CI/rNlXDfs1OfkN63Dpj7JJOIZlYL7mABuepTp5z7bchoJlPAwPD9PPLBk8NEqdX3ymNFv82RtdjNtsgfLRupjaIVrsQ16Lr4EoARfWY+MCz/gfu/xGLGqLo7CbqCL1G1d422D9Qmc1PX8Ke2k2grBfeBubbIzO7919r08edpQkUZY+5LURHb6mDadTwchs/L0YiIXyZYe2SKGf4KBpeiKLBA/SwweWsRt56ySD7G7LJ2jXm58bzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i59xJQT544TdeZe9R8pJlXN01S8B9AW1arnw7L5ocSs=;
 b=ftrz6GBOvP7FqEyt/b/HE10++DymrtqPtQocOApgcUsQJyHhD0HbP1gJtjWJbzYkVWJSR8Cz6M1MnavSuQeJ7e2FE9xCPQZRCKkN0HsNyoybt2c/iv4vQmD1hPrRoKuFCYAnHOjcUyp1QgEnostePzLwv5g7KngYwU4A0gmGdsvi10FBeuk+CJD4eyZPph39Q9iL3ehWwu3BhMvndVT9VN+oulsmIeRxcx/HmBwa9cnIixw9MAIbgdRfvXtWVEA+Ja5Rpp2kQTOZtHShvZBR9pMMxaXxk3LgJtXhtPw2iF2Exnbqe8XFMaVXCLPDLkVpdtpzTPc5WzcEkkpcplL3Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i59xJQT544TdeZe9R8pJlXN01S8B9AW1arnw7L5ocSs=;
 b=CBiJeunL/gxzdGjx3275xh3mJSKIvCiynac6nYjktXJD4C6l9eltT5ZQeDOCBOCG7/JIimhhnZ/X9SrB7TR19xHeMkabXG0bei9tkxlJ41UTGn3cwaBZ3upl/gB1bxSMEadUDkVoRoHD1+EJPa7cxtzebVEeowcmzRGvLE1LQCE=
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
	ppserprodsaar; bh=i59xJQT544TdeZe9R8pJlXN01S8B9AW1arnw7L5ocSs=; b=
	nvlXwP/fXW2sby1GFETowQbpgUhFfHMbfrIi2jcmqMt3QKvq+BoW8nCPo7MlZhg+
	vnTNrYgVxs2l6Z1Zm2yxC1EXBrQvq4/bzG/qkuRBvhjwj89sHRaHuRkfZu3ApV24
	l8CXCCWiwLbd2VRzUQxaBlQbFK/W3IUnVInwyQRWBPU9awfiPqa5IAl3B2eHNRWq
	Lv+NRZq19MS8BZSfECTEISu1UVAh03eLGKp9v3iqiGyEz6ZU3l1CZq+f4nwgKa47
	V0rk3cXGvBkwfhw1TLo0wF+AWVZo8o1o3NBx3gzj2Bvv2Q+vmvUTELYQDXAw+Nd4
	bvky7gadBLFq5mXRfhgbsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=i59xJQT
	544TdeZe9R8pJlXN01S8B9AW1arnw7L5ocSs=; b=LUhkvlVqemEUHfEuX7mEdoJ
	DiWe/4eOiPJ8IpN1XyoAU4/N/mJJt3aUcth/rkQgSMh3sk6Kwk3rm8bhkfjpgW7u
	mEG7exT1ldwcWezwKLwm1HeT+z/1kdJ2Ayr8O3//sV+zeOHb4oH7ACjd5rYK/fto
	HJu1ttkYXIiXBaoSqrpFf5IFThW7pKnybdhmwnqlRFKQo/luOFEKf+GGgiJObXsa
	m20CmUbWtmu2HzJbZ9rKOPJHlbyVJU7iGTSetqoKoVv2BOOyK4nb1gMSjQeh1mHC
	zgENkIjCHohn0DsqnXtcyxzCj4wiH3aUo6Fw3s6tYmN2rQArX8FHvglEw8oi0SQ=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmPwx1G7KgTjoOmPxxgpBO
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 10/13] CI: x86: attempt to fixup flaky tests
Date: Wed,  4 Nov 2026 17:36:58 -0800
Message-ID: <20261105013701.719658-11-dmukhin@ford.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105013701.719658-1-dmukhin@ford.com>
References: <20261105013701.719658-1-dmukhin@ford.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050005
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A9:EE_|LV3PR16MB6320:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 178ff83c-dead-4ae8-2503-08df3add5cf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|10067099003|22082099003|18002099003|11063799006|56012099006|261102123227099003|261022105027099003|261026140227099003|261028144727099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	seHy3/qpZ8zvmDzE1P2a1jnnWDYGDF3XAa4ZIVBdgDp7N+Eppm0VBjDc1b7kZV8+uhCPOCUjgOvQNqjvzm2RI07zwLbwPll7XbfZ1vTIVKr2oge20G1YmHEk3ZShgj02mzjRmatsrfZg7vPTks2yvVxFOJcW+5PGrXQK8ssXPsstRlOeN9Rwk5xsssP/Mbk0UoPwJgiMtgfjUpucc4Xco7Nl0ppCyAgAQtUv2jgqQ3DGBOyKEaE1Vm/7+JYGi8j9epI2jiTNKNoElV4PzqiUQhvsx4xxlpuo96VL6W9dRNwNEc/J6nzBke/av1C8x0MUDVgMdaCMB/XMYW0JskK0cuPkauIdOWpIQpuKWFqwUDz8NtW2cm5p5UqnUh90epII57T8EfQUPBgAlVD5ZUBIUbNJIrAAC1DbZQkMzp+sX6mbfxakET02x4vVnoO3/JsCu82jRGxwV3vKV9lHARE6HTo2Qve2cp2zigElH48J+yadDi4Qo+XpCp9NYbdigxQd5dy+n7DN1d18p1EYY/P0W08Gr0Ru/8n3zv10qA+t0jBkfKoipgz8NHhE2Rjd0Ws/rDQspX4ldywWzQF/oI83WS3trGa0arwwv3IpL7AqzTW9Wva2y9tc9hpuVF75LT2imDwUZPls1OfsAvX1n+3RBu/Zt3P4nBZTudf/mnwaoYzEAeAZkqTNSuM+A5245nI8THuIZnZcn8+7jjXadZLHeg==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006)(261102123227099003)(261022105027099003)(261026140227099003)(261028144727099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	P/qMQX6b3WOG4fO/3KCNFw4a6HtKHPqnrf856NeW3Wa83QPOBuO+AhmAzlQzgPrKmw0LWsFmLNzDbrJTReRcT6q/aMadDVjFZ665V3rl7oYvhEC8K0XAIpisxKgCC91u1LPOBscbYrU8KPz6plAeAE6mszDCe2qNK60ArMI20mob2kZealEVffg71kMt9oREjXKBazojmm3z+0Gji/uJkqDZcD7YTV736COldVTEf8BgJzUB0YKV5SGYMmsJOojZoyfMnElbphkuJW0D8/IieEJ9uGFsEgjRq/ypRrF9nL00imx8GNbTN8YYplZA3s9dScVaS0vC2804Zc2s4yb9zVR1QJBHH8D5oFRn0NuAM8Y3Iq9q5NHm5gjeFnXpA4/4lpWSCWw9cFuNWH4I99p48NtLrdy84HB9SyssIWXVPwcp3fFeBS1K714eZTerVMgy
X-Exchange-RoutingPolicyChecked:
	CTmx9ukMAjSKNqlmZt8spWP4xzDpSxyyk/ewGsUKevFCX21lerLnzlGjBwjba+HYMo2bgswEI8+fLAjliokQb9MzM34bjhcGJZmKYCP3aCUrOC8JAdd+QZDeOxccw4wOiLZJgEPzVFN0AzhLROePF63eVqkKTApURZoqQ9YstbTPxlK9OQrs+48Ky4Q1Q4jsneJ1bf7g8IC95jeFF3upwU0m52fjbiCKY3W4gMEJgfUrLCYrWx5lyqdI6wMQdHhjucw7E4TNU+Rc8BEdNj2AL1eZfD+dNSdbvt109fi9gdcf0m+ffPKAEk+Ld9gJFAQm8uitZB9Rbs8SRUw+QwYYZQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/mN4iDg/wFKI7HD1DNJrYqPnOA4aBGivvrSdodN8Wwng8tzIC6BwsuGy4qoHI7FNGDz5+BKUq4BwBXsVRDk9fsaqxXRpTKBg4hSYKo+VuO7S93lOEk8h8vaCTvqoa4TwUXOPjqTQzui6U1WZnF7046CMzieF9cGxhSJHCR+f8Kh006vQVzRnv9LddisOZZRZCzcv0QDcaotcwzkGWgGdGq8nI64tzsHVECkMNQJ03kMpQP4ecUpGbLadgOvNvkJ8zdS5UbSze2CXAY2uyTIzkpzZbTjGoltTbG44vZhRVZi4WZLxgaEQ6CguahPpbUyAFXTG8uWI4XMXK0r3iVo+og+lCSr1w3YazbBmj6UON7NUugjcZF8dKJawS0ytsxcTEArZr7aPMnjEDemvOjoc2YEFfzjg7S4xtMgrwy1Cdefm+NowHVLjRu5zLNEHV6Wis8cq2RD6g1UjM7Wfs35Jp+U2wB4UAArcZx64/xLXgFvIUMn4DQ6YPIoA+KrXm3gSvgdQg+vDx7YYA9x4a1uMTsdSBgDGX1y2NR6WKgefsWXyfsPMP2kqiMgYwBE/NB+YyHAt94HZd8sp/7dNSwdQJzLHPqaF/0ima+18lKhFSGyrMimEh+etYV4OXaMCEi5Mh1RYNMjFUJ4knpnTf0LcuA==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:37:32.8436
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 178ff83c-dead-4ae8-2503-08df3add5cf3
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR16MB6320
X-Authority-Analysis: v=2.4 cv=JawpPkKV c=1 sm=1 tr=0 ts=6aebdde0 cx=c_pps
 a=XNh4DmHdy4Cg7KTw7bneTw==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=ARvDHhclS48edyKYUbLB:22 a=cbNQJ9GKAAAA:8
 a=seZbWGLfxG4hbgvkuS8A:9 a=zgiPjhLxNE0A:10 a=P0bj-C3X3jJDpopQwM1U:22
 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX8oR30Ck0mbMz
 oD+xUxQV8VaX96ZOHFI+iwT6tnCSiPLoP1kcfIhKXN8j8vzCjQXiETxM/jj2mMhZFZQGa44LpU1
 QNUbS9RQxwoosDU8Ii9VUP/8BsvKCW42fVrAsMpc0Iyi3PaTe5uB/eTUocZLaRzIitjdDUotw99
 OgM5vLdepWr5vzucFvJFIVVZ4kHJAe/W0Z6U/nTCf8mPfCpDjPnQw283ArrkhoOoF+s/6Ybm/Ay
 xwh0Mcma7k0VDh/SKPy4is+KsPfA3WB9Fm9rC09uCYc2QFZ1Nc3UyrwY9HUkFob3ajUQOYhHk+B
 t17SvvNANrzMl+PmbdqdTiJcb7E7NbSrek0qs3V6a95BKYy7TOjE5+QcVcyaEW8A4JUCpzgDHjm
 8aIrNhQNYHN5MsI9saIRKEKU9rFmBzWsIEVn/uFD+L7PkwI3WLi7KpsKc/cwW+Zko7L4FHetUBV
 obvk0ndUcuGWtf/WUyA==
X-Proofpoint-ORIG-GUID: wg-2z3iIUI0pFlZ_mVV2lzkhx5GhfSNK
X-Proofpoint-GUID: wg-2z3iIUI0pFlZ_mVV2lzkhx5GhfSNK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfXw3bfECyeU/CU
 Gth/RPyMbNuVjItn27bBRUEv81gSeVZ6gMxmOVsgc2Kuz/CWPWZ07ZegPX31HkFwNTDDvsiFSQv
 oN2hUTOGN8pt/jm3faHBf2Pbw4VXYgcM08XyqoOkv38nn+w7OhEu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050006
X-purgate-ID: tlsNG-4011c0/1793842659-59DDFCFC-0B8D2E4F/0/0
X-purgate-type: clean
X-purgate-size: 743
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Allow maximum of 2 retries to account for flaky infrastructure
scripting for powering on the target board.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 automation/gitlab-ci/test.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 98edf7eb9ff5..bf12b9123f1e 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -192,6 +192,10 @@
 
 .adl-x86_64:
   extends: .test-jobs-common
+  # Account for infra failure
+  retry:
+    max: 2
+    when: script_failure
   variables:
     # the test controller runs on RPi4
     CONTAINER: alpine:qubes-hw-runner
-- 
2.55.0


