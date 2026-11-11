Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5A5606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 19:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=X4FDSAEx;
	dkim=pass (1024-bit key) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=JQKX6NCY;
	dkim=pass (2048-bit key) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=RTJLxrMi;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=m6fkbkQ6
Received: from list by lists.xenproject.org with outflank-mailman.1484861.1688244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREKF-0007xX-6K; Wed, 11 Nov 2026 19:49:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484861.1688244; Wed, 11 Nov 2026 19:49:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREKF-0007x0-1M; Wed, 11 Nov 2026 19:49:43 +0000
Received: by outflank-mailman (input) for mailman id 1484861;
 Wed, 11 Nov 2026 19:49:41 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xREKD-0007p9-9K
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 19:49:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xREKC-00H82K-M6
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 20:49:40 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c6d4-2eae-0a2a0a5409dd-0a2a4502d428-0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:49:40 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c6d2-6ca4-0a2a45020019-94a392174cee-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:49:40 +0100
Received: from pps.filterd (m0482517.ppops.net [127.0.0.1])
 by m0482517.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6ABIYYb82999155
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 11:49:38 -0800
Received: from cy3pr05cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11013014.outbound.protection.outlook.com
 [40.93.201.14])
 by m0482517.ppops.net (PPS) with ESMTPS id 4hvwah0tgk-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 11:49:38 -0800 (PST)
Received: from CH0P221CA0032.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::11)
 by SJ2PR16MB6061.namprd16.prod.outlook.com (2603:10b6:a03:568::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 19:49:21 +0000
Received: from DM3PEPF000265BC.namprd04.prod.outlook.com
 (2603:10b6:610:11d:cafe::50) by CH0P221CA0032.outlook.office365.com
 (2603:10b6:610:11d::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 19:49:20 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 DM3PEPF000265BC.mail.protection.outlook.com (10.167.23.249) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 19:49:20 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIZFbH196201
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:49:19 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4htkxw5635-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:49:19 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id REJoxkebBSDpjREJpxIWBC; Wed, 11 Nov 2026 19:49:18 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=ShI
	N1l7YeNlro/1LWovdP4isXAcTRbgF5hEDM5FMBuE=; b=X4FDSAExQA2MQ7JS92m
	pvBioxOqX+0W361fne2yQyWEOoefa81sIzBMcgID7S10EVOGwc1P3iUTlGBX8I9B
	j6iHXO1FDwf/aHmzBU4IzHJ1cCIJgkrq/Lk3d5eAwDnkXY15QGzpMuEOkyFvPfOr
	pENn5AzTVXPdnMNCxsb/wVRCYs9jSeC5savLzytc9/5CTtLgPp9ig8H4o7cgEla3
	nP+kcK8+o+fZki6wdYniLd8V3NXaOW0NBher6ssKTorlsy7TtbeNclY0rwxoLuQ3
	DT8ibKG9bHtT9DD3PCZ16xcIipNER/p7W7OYntYSYk60ngEEil+R/wxN3Zo/7axF
	iCQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X/DXQBO5eUhWcwAX2aqEC0lCsmHgboQdE0uQGFgySkxV++Zy0MjHtqYCYC1v4rdfx6EsWiwf8WHE9Y+WYdpP1uN/U1/1tpHXMFy8jxF2tSptLUQPCu739e0mYI+WuDofZvdmqKNODtvYc2g6pEOsw0IxMP+ZK3ynxp/YJT74OFsHyGH+hTZAdNrN1TpzO8VGqBRrlYWE3PJd2SbM8aXwlRc6XERqJRKvj1qRApeN8imn7Suqgfm6g8BdFgWmvgzXOX6iwxq1fmlzzDHx6zZqP10g9/i0xEjYnAKctMe976anRiX8TXi3e3/T/6OYIX7+knN7oJL5JEMbPCyNKAiWyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShIN1l7YeNlro/1LWovdP4isXAcTRbgF5hEDM5FMBuE=;
 b=Sft9MNDc5hah3CXT8cqXHW4HoKS4vb6dum5N2OQpRM2vojpYPvKNVUHIb502VSk4GhxrCq6zzmidvp5uh+Tv48mDSLFuInAt2kwaYbWzWC7WnB9y0cGz+ByUbm0oIczTuziScVTbG074ZKN6/v9o0isHxV1ybSdpm88NstGOlOp4i7cu31e2il5CJ6rSFKVHIinyfCnb114FDOjMhfnnZ9/hBhWrqNceqkI4Teq4Dm2TN3l/XiJKjMgHIP+Tt8rSzoWgLJpnqgO3a1pMbVFp/I9NjDaMOWa8syE+en9dMdwRwZ7MoZ63K1g/J0RoAHYHHnJ18vEWE7FED1s9O0S7Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ShIN1l7YeNlro/1LWovdP4isXAcTRbgF5hEDM5FMBuE=;
 b=JQKX6NCYEHnbPxvXjQlMQibAKXTRdEK9jNq0j6RQQathA6+4FbUw9qyUsgfKIZfQYmmw7m0qDqRFxvy7neOyhn2yIPYp9boBkeUgYnUzk3L9iQDkOj2kgQKiMNOMdiIiiGBNqHoeciD7anHSM0vHx2wINixxWQ+zjtsyg1ImgjM=
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
	ppserprodsaar; bh=ShIN1l7YeNlro/1LWovdP4isXAcTRbgF5hEDM5FMBuE=; b=
	RTJLxrMi2e+Og92zSPo2t0U7qdYfo+OEZdV9dvwCmfn4u3oJ8LayXidyTLqM/aW9
	4/E9lpu1fZQNe4flZXykyj5wr5Y5Bzlj4287hmS91VN/Kzn4GW3s7hBJATmt6lL8
	yL4+Nhwv4IlwDwJbDCTNSUX7Oz8E9D9d2NHgpM3ys91U6m8uXWI2WybE8b3SEok6
	+Fba+bvnz/0SWykMC0+ASLM1+GSS/F4HBAGPgkb1H01qMyKY5+Q+yg2Ei++PIb43
	BzEYJLy9Mlf6FSznkJJ0MrmBS8XKgT6BQB61bPYtQxQjicfpeoA+U1hU5l1nY7Uw
	u+wlfI2pZ4AGFnJodf3+zg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=ShIN1l7
	YeNlro/1LWovdP4isXAcTRbgF5hEDM5FMBuE=; b=m6fkbkQ6znZpK8vw+0GPraK
	i3f0h9viWb1h2Mb0PFiF/PLFK27GGqls3Awr6doy3my0Q6H/dN7HMherB5RWVHeB
	eK1quOBKMcPe0Xf9s6mMTslk+CUlUvGbi0CtfUuuuSjAFclJ6fUD2nvT1YwNlIfd
	QQvE6orFN5HkIPMGWGMqumnrS8zR8i2FoucMsawZUwSwkCcGmJdRJxK8AVaAY8By
	FyeuNGSq5ju397s6/wBr99gdw8PUPyrZEXST2K+dxI8hMP96fKFrQ+YP9LTt/VEy
	DCwPs4S48oYs3Z/F/FSTqnbGHssQfeD+3WoFnskeFLsMKhuCfYTub/mSAEU15sA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: REJoxkebBSDpjREJpxIWBC
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v8 26/26] ci: do not merge: test
Date: Wed, 11 Nov 2026 11:48:00 -0800
Message-ID: <20261111194800.1070016-27-dmukhin@ford.com>
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
X-MS-TrafficTypeDiagnostic: DM3PEPF000265BC:EE_|SJ2PR16MB6061:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4779ea77-8c9f-4412-521f-08df402ce0ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|23010399003|36860700016|1800799024|18002099003|22082099003|11063799006|261026121527099003|261021123027099003|56012099006|261021121427099003|261102130727099003|261102123227099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	sLFzvKUyZZKozhHOEnGzYO2o7TqWlDfBO82qJ1qpbfX2dtbnrQ60PMyZ1bk2h8+57dORJsVBrUO/PA7K99McZAy5Iidm1nUD/u0k9UxKehGktDav5ybMxDUI/eZC/Ove7k4h4IaFD+Heo4eyS/H6OzGQpxkssmaBtty58BRNQGQoMe5cUFZHOolrlIextPnd9hAxUCIBmr4t8dCQCLgMX4330LQMPBi8ZMFVNxS+7Aa6KZfa3SatvOU7/+3nUECPhMpydbvSvXF/nKAqVxZNTAUDQZfvdUoBtq1dT70STzlixxtGUcZuIXQ8rPdE6cd4mG5Gy6VLLQg87y+2K2MX463wD+3FOh2RAAC/SsxPJ1cgl7JPuWa36wZYUnyhQtw03eXqi+9IPz5WGW0ah0TF4DXCeaVlRBzv9WUddq8HNUSScTdoqwLi+10Jau4uleMVyIskkLIDDEwc05ud08cGFLopjKcpBiI+LtmjMWu3FXO0msnM9bfMNkxEqnYjipzKHPsjs814LTzDvJSEaBYzcl/8Lu39FKYHOTfMr5ApJkJwaunTa45YbtyT3YUvOeYkElcMmL3TYJyRe0IU44HFkFBc16JrIFVwXQQDNad/ycdtpZNN/+e8CxEiLz0yer/vUAH2zv6Id0VxbLd3J78A9f7V/BiHHZXgL1L/QDY2Ecw=
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(36860700016)(1800799024)(18002099003)(22082099003)(11063799006)(261026121527099003)(261021123027099003)(56012099006)(261021121427099003)(261102130727099003)(261102123227099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vXnzb/lqxXg099F4gzcMh99M8e9BeCuOAJwoL5076w1hLOLuLwDr5xdgLgBxqVcF4MS/nrCyVstKqT6Yum28QUkueRsDBkLBAS4c+2tBOGVCR8VIeQ6B7R9DxVkd1c2EEdBxAlRDrSSJRHi5uTpBcfe3Cb73HE21Xhme/NZtBgCn03quRox7Mfdfhy/4OcytqaP+f0f95zcONd5E1nphE8AmlCWDa3qLP1unU78/Nf1kY0PAO++tMz+omZ+6ywyv41rNJEQy7EMwYO5YMnGbBdT0MrwGRoNKpbex7d5yGa9andFqo62uRyu77adAGUOr1Py4IZ7hjZt8PBO9T/cmTZE+YQilAWq7DbjYRQk4SA7X0fkx69b0E12idiDEeo/92VmD2r6kB9s93zNsiLGcozNpCfk6a9YSuYvnWlTc8dCMKa9O/6fA4ayaeePOVSOy
X-Exchange-RoutingPolicyChecked:
	M2EpMkr3MeZkXpjeY8S4WUYAmGeKDTEkCUMCPwnNz/vkgbUcVgus6Jugo3tByjezLlfHVOnCIT8KP3uR4Leds5uNnQQ1Dj5ODzRyqQKStXU/suk3uyHlCJfUaboyBrcrzdyyCUlKY3cFcmh2TU8BGSX3L35VGvEUjN8Y8qM/91nkwj4qs1lkSAU4tMLm8HJPcg3vG8xJIES8hEWz7/Po2ChDSpyygYjL9iMW/WwWZdDpeezdXyjgBu+7TTSr7WwpOcDFejM9gn2StN1r/mip78XS3Um3hsQ2zAQ1FsvAcFotSjJXZ5elggY95OYbhwHsk9sFiEiXH/w0wpC2pKu3yg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RykdPNgNUmLz4vfGr4PmHA7EKZ0kCSOX4UmcpfqKWSSYvkUdbklJwHyIZFb0ykmuPWU6f5TjCqJoEhzjpdHmU/n9XqYASgWUgyqaKkiW0jVSPESRLyMxUxOyZwZR4JeuprwV9nyLGAO9ubqrKQhvH85yveZAN4WpPtu0x8Dvz0/YXejlFIv79Z03NVGFkRGifVGWPG8MmibCqUDWLBkp7HXnoAb9mPd+vyJz2pYRCJ7OnG3imfNqHReXBuilrDAI2UHyzUjFxCygikBt+IyFXxbGgUbJgbW7Jnpzzv59O+8RZaeWqLNASqedOE8hydBuwITnGuYAdsGDMFfvAqvxWrwxbMKFXU0jHD+X2IvZ70Wp65z7Zq6kCEvH/CTqS5QpbeQ1fWyVMz6tgbLCu/cI04ZtddgR8EpmvMwXVPnNmUxLw8jHhMEPlZXbbBw58jgKXLFS4rR1fB6Pi2xAR1Cjmf6ZP/34AcFCjHeXq5I9DyLoLoLDcd96B4ycATDkdgjPE/xiEiZQ/dr4raoOEC9FOcXQvB2gomqtigHrYbZqlIgwcIxOIaEpTsq70RWWxkjmpBwGFW5kg8y5F91+sBMD6Y43N9BeGmA+1pO4lVFJh0JVGOyKoyzif+QBKRetcrkGd6MzDw08ufp1E6OVwK/stw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:49:20.5314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4779ea77-8c9f-4412-521f-08df402ce0ff
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3PEPF000265BC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR16MB6061
X-Authority-Analysis: v=2.4 cv=NLdAaE6g c=1 sm=1 tr=0 ts=6af4c6d2 cx=c_pps
 a=U8Tqu/vdlUTsaY0Seu/jpg==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=MLwXIh1eZMowsRZfVxRb:22 a=mLnsDVdbAAAA:8
 a=p0WdMEafAAAA:8 a=cbNQJ9GKAAAA:8 a=37N3_hwG0OgyKDAWpQgA:9
 a=G69WFyCBNqGPyalROSdv:22 a=WmVTiCyuxqgg3mnwYu6p:22 a=xnp1pY6zelCj5OLna2To:22
X-Proofpoint-ORIG-GUID: vqSJw-NktvZHLrv3WAfchyNhf6jal36w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX3Vpp+xWaI4EE
 N7aaFeK1UGgQHVdl+227K6Xi2ebSjsdlimH5Pp+GdksWKhrwv7IrLydzcGuq5I4AUMJsx1NjyqI
 AtEuOWhv3gN0GBAC7rq5n9cJT7yP450D/uCSViJDMtYQKANi7GZEHfb12Ofd7PDZRUcNoLprzhI
 ZeFJBbm05LJLVeIBknGJ/MUgFd39F2arAxpZLJLZCFdQvMqUInVTEV4MjBtri2PMNUb6r1WsdmU
 KqLFbxnfNzkjJuVdnefAnUzjm4RDYT+zw4BE/Uk/uZn5bLN8YHBwhsyXW2MPyvasex/MI99C9aU
 chf7A0zmV0nNzNNlkKqIXEW6tpeGB1MTzq5//hNrdUWLOkuxJP2TIf8CoSUPIupSZZhW3VxwF2v
 EUkPnpFOyNA4+gMS2URibDINDN5SCBQ8bxCVCtcqTC7VR+xMmV+505l+xDckAXA9swSh4+Fhr2z
 K2RBH5ZtW0dplgNeKnQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX15NtR+Lcg932
 XJioIReVtjtcEMpUGKHHouQiNDBKQ4SwW2SnrNl8URsjIYFfTqQQqQAqiW+glDLK8RClvVIn50m
 OE+/DHF+xITGlUsrfsFypa072IJsgRy4FdkYo6OrqHv/R33pxcEA
X-Proofpoint-GUID: vqSJw-NktvZHLrv3WAfchyNhf6jal36w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110078
X-purgate-ID: tlsNG-720697/1794426580-668B42AC-C4C93A28/0/0
X-purgate-type: clean
X-purgate-size: 1311
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

This commit only enables test jobs in CI to demonstrate NS16550
emulator is functioning.

Note, qemu-alpine-x86_64-gcc-vuart-hwdom and
qemu-alpine-x86_64-gcc-vuart-pvh jobs likely will not even start in
public CI since there's no suitable QEMU runner with /dev/kvm in docker.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 automation/scripts/include/xtf-x86_64 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/automation/scripts/include/xtf-x86_64 b/automation/scripts/include/xtf-x86_64
index 186f074bd8eb..e1e839d3c925 100644
--- a/automation/scripts/include/xtf-x86_64
+++ b/automation/scripts/include/xtf-x86_64
@@ -10,8 +10,8 @@ function xtf_arch_prepare()
     export QEMU_PREFIX="${QEMU_PREFIX:-}"
     export XEN_BINARY="${XEN_BINARY:-${WORKDIR}/xen}"
     export XEN_CMDLINE="${XEN_CMDLINE:-loglvl=all noreboot console_timestamps=boot console=com1}"
-    export XTF_SRC_BRANCH="${XTF_SRC_BRANCH:-master}"
-    export XTF_SRC_URI="${XTF_SRC_URI:-https://xenbits.xen.org/git-http/xtf.git}"
+    export XTF_SRC_BRANCH="${XTF_SRC_BRANCH:-emul-16x50}"
+    export XTF_SRC_URI="${XTF_SRC_URI:-https://gitlab.com/xen-project/people/dmukhin/xtf.git}"
     export XTF_SRC_VARIANTS="hvm64 pv64"
 }
 
-- 
2.56.0


