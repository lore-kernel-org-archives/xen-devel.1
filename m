Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10383606A333
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 19:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=LnbfqyCp;
	dkim=pass (1024-bit key) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=YSv2dLn7;
	dkim=pass (2048-bit key) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=Ss1alajM;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=a1e/2NPW
Received: from list by lists.xenproject.org with outflank-mailman.1484827.1688208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREJv-0005oW-5N; Wed, 11 Nov 2026 19:49:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484827.1688208; Wed, 11 Nov 2026 19:49:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREJv-0005mI-0P; Wed, 11 Nov 2026 19:49:23 +0000
Received: by outflank-mailman (input) for mailman id 1484827;
 Wed, 11 Nov 2026 19:49:22 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xREJu-0005VO-0Z
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 19:49:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xREJt-00H82K-Az
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 20:49:21 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c6bf-2eae-0a2a0a5409dd-0a2a45099454-4
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:49:21 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c6bf-be1a-0a2a45090019-94a3921783da-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:49:20 +0100
Received: from pps.filterd (m0384718.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIYXWY2313307
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:49:19 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11010016.outbound.protection.outlook.com
 [40.93.198.16])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4hvuucsr8g-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:49:18 +0000 (GMT)
Received: from MW4PR03CA0069.namprd03.prod.outlook.com (2603:10b6:303:b6::14)
 by SJ0PR16MB5198.namprd16.prod.outlook.com (2603:10b6:a03:4d4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 19:49:07 +0000
Received: from SJ1PEPF000037A5.namprd04.prod.outlook.com (2603:10b6:303:b6::4)
 by MW4PR03CA0069.outlook.office365.com (2603:10b6:303:b6::14) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8
 via Frontend Transport; Wed, 11 Nov 2026 19:49:07 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 SJ1PEPF000037A5.mail.protection.outlook.com (10.167.244.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 19:49:07 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIXTVD075700
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:49:06 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4htkwgn2g0-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:49:06 -0500 (EST)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id REJbxf3GWQVyyREJbxG2vO; Wed, 11 Nov 2026 19:49:05 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=3x1
	ONJUanBGvzivg5LMO4ZoRVWTSyHrt3t7m5UtrGIM=; b=LnbfqyCp0qEVw+LPB2a
	ss9In239Mu1ozm4Yvhg64GBVe9TdOCCUpdrsinYOxgGRg+e2g+vM13r8nWYaKyi1
	1Yudkj5GsXarV1KUX61qVYePnhdcHS+VR8pycsbJ1UhhfcAJIck0Avi3RahJ6HVF
	ee4Tu14OWS5l7qNvJEF6UO14J8qugjRL2r+EBuQftEeg6JCu6wXm5yzFClA3dI9N
	RAR0yscPc5D9oEljFlR30iwvRbscAG8xG9rkbtskWS5enJI56l85NlkachCtq3XZ
	icWHNBpW9JEZYeyvreSWj1m1Q4dVz+qRu+mEMRh/s1XBtF26tYYQgj8WMphhtV07
	gSw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=He7gYk7vZ8m192IlehwucYf4Srktuq4IkTCjp8i0x5VFeGl7VRWCcMi6CYQYg5Fx65eoO/gi+KpuMlyvl7PXhGP9i99zg6pdW2BHFri1mT54DbqFTu9dcgu/v+yThRhN2iW6SfvslwoDYvc53cQUo3LCSuiZcB1jKJbYLFtsRWyTq0+l8WE+qVJi+Vf3AZ2B5hGQjjVJDTk4VGP+SJnXWAcVhUj2RffyBK2Stz20Cz4Wv6rwJOgxSFIJINXWv2wf0v7RzAwZQm94NGG2A59bQoCs5wma30rld8DVDSxVuMr+vok8/3b3/2mdiJ3h+gPFrDm5hj8CHY4obSqNDFzYnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3x1ONJUanBGvzivg5LMO4ZoRVWTSyHrt3t7m5UtrGIM=;
 b=LGp3mKe9Pu0u477LVFPPAnnL48z4MMNfiZIZ3JJ1Qh/355K8udRJDskt/dUSbVaVDqSZTQstaYYFqAH6QhQaCoTfAxVMOan4tF0ZgKMveBb8xUyRXhjhsqut1fmnNx5pKVf8wMYzrRj8+x5tgEK/gzey8V3BBPFJM8bFFjEoaJvuwEpnslBgX+bkQezM8B0G6/3YPbt7eiElkAtKj1pha4J86NSt0Z+HnNXzdm37woPdUavmp2szcbYvKxLbGG+fSV+xY/YEmO0nbeEqXDQQrm1Ks9LaAMyxfOYN8kZjf1NzQCZTp773noGAeRqmCCRZvypgugbGCOerudmNeXx1fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3x1ONJUanBGvzivg5LMO4ZoRVWTSyHrt3t7m5UtrGIM=;
 b=YSv2dLn7y8SnjOjqjRlb/pOBAtDX7hJcMlgl83FyvGbllrLoC556dW05O0PaOIyuWkLpvx47+TYVwbLMeIUtNQuCwEfSTqI8eJG32O8WcLp1u92UMhOUcb+qhWcxqDCIGdCs9lPFykjdro/EvbkwQRHJ2R6v2/C8fz0FZS4L6Lg=
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
	ppserprodsaar; bh=3x1ONJUanBGvzivg5LMO4ZoRVWTSyHrt3t7m5UtrGIM=; b=
	Ss1alajMCscP9GzFeDD7QkGceKOFpQumoFEKf/TcjnuTSedjTlOUoTyYso+D/C7C
	j0cuQ5aZpxlHbV3bjrus/U7/KIt5cPQGtMx8ZFnPBTc3BYF8RGGy5DsYBzDQzNzF
	dw9uHLqxDUfupzbSoR0jbbolFbpB9zkOo4pGHLR/ras0Eg9nac1EXPPlXLs61sBH
	dnHe7kI1ufoFtnTdGoHrvJZXnRmIVZBVB2nnmIhD57uSqL0+UqXQ8r59jEZH0v3i
	E3huAanrdDJNy/3uv3QTKmO9PMU5fOWsn2Oa7LzLtG7281KnA4kx+anNihYCNzsP
	LGw77IFgcZWsaU633BoQ0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=3x1ONJU
	anBGvzivg5LMO4ZoRVWTSyHrt3t7m5UtrGIM=; b=a1e/2NPW0g4X61CMr4v+ImJ
	7tjA/3Dg4y3VuGAdkKKfHDcQqUqs4zO9avD/bWP1cR3z+UDBTp6ATqff/AxlYGM5
	LqNeecTcFGiQkwBlSwg5Rsal6VGeAUZ+0DmpnoNLvi1f6aXFouOcWPdjMZRmPpFC
	89e8bdciY2Y604zsZmGq3Czgv1kGLZ8LGtBs7VWo4JxfULWQbXXrL56PxvZ0hIad
	f5p/4vqLKJEh3uTZFtLWeixUbnmEQaoV9LWbi99ChlCTgFkfzdt6roxSiIBviqWs
	gnjRwVcCUL4UYSBW8U0qqPYKKVAvdLMVNNt1TnUz2+HqZV13+vzCM1Ib4deQ92A=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: REJbxf3GWQVyyREJbxG2vO
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v8 21/26] emul/ns16x50: implement IRQ emulation via vIOAPIC
Date: Wed, 11 Nov 2026 11:47:55 -0800
Message-ID: <20261111194800.1070016-22-dmukhin@ford.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2611040001 definitions=main-2611110078
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A5:EE_|SJ0PR16MB5198:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 03031f4f-17e6-4ba8-d19a-08df402cd8fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|23010399003|36860700016|1800799024|18002099003|22082099003|6133799003|5023799004|11063799006|261026121527099003|261022105027099003|261026140227099003|261028144727099003|261021123027099003|56012099006|261021121427099003|261102123227099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	ln0y28txzSR4md+z9mH89mI+cxg6unhCVm2yL51EFHnjgzZDfP+HJapUB8+FmXghdBP0UMPOUFhXtMdh/d85CeMXCfIipH0wJYSFo1l5G6qZJtL2ZIfMuFFlTUz+lFyUnpuwfoyW8qVS/hg1/J0FRJuylR3K2OR9snb8nVwnxkZnFt1zgajw0dbMTYpWqlaZHwWwk2eEMxoYdPxWR5E6Pk0FxyX+NHpwZ3iNCSrMLIbF28FfchL3j1VzVxZ2YVKMDSM2p+UxKGKTwoMR0PYfoClQxOtT2xj09E76FReTDejghX+FU4PvOhvixdw1BUayBV7gLhrIaEvCgOEla+VJSBJhpJVPuG5mUF5LhMkCNj3H+REqGJOg1Obq3bvejkivhb5FtEUpzdFBe7gR35u50divBCz+8MhbqN8UNnQVliW50+20TRkzj2OexNYw6dapOgUIyhOo02G84/qegioH+ionD3OMRqZwzPTIJ1zaNDk3iXbf3uSHr67Gzcod4zBckxAoAFYyyR66yQzptJ+81lI9uJDUWSfdjQWJqgKHoNlgRykyFvJ1Ixe+G03XtG3IecwNZ0pvAUyq2El7YXHC/97IiLpdieP4gjWeC725ysLtC8BbdFHFg1jV3ejVvXf4JGCCRgfKHClY2GdZJZEb8RSj6lT0tnuPY+PqftEkZCGvs+HKwJEq9iE9+3NXPA26WDpE+uNZv9OQ2FbIMI4woQ==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(36860700016)(1800799024)(18002099003)(22082099003)(6133799003)(5023799004)(11063799006)(261026121527099003)(261022105027099003)(261026140227099003)(261028144727099003)(261021123027099003)(56012099006)(261021121427099003)(261102123227099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BVSXJsgfkadREAHvfhITt+nojz7CKmrDaJ6mDd4xEWexrnKlsMb0PpwWnLS64/ktAKJB+KXiGHGeJ3fAnvOtpE8Jd3T6ju9eZroqN6H3lTBR541TiiKqlN29oKzVk+N/J2l4mSHqwwz5If4az+D/YaYhr5cp9Fxj618mSdYkgTiBzcfS4hfmZ63A3ZmZJSBkxxkOCkph+nqpQ5ktbmF/B1C/yFm7AJfBaJ3SQumMWaH3BVjM/H5DHAzfMUnPcXIVEx3X97UhBGF7LOzDoqXmmfqtuVCdTsxbZ5GLb9MbPWMJs/nQR9b8GdjCo+zXd8oFwGt0es5NDGrfhk9Quo+24h/+YzKkLhh3zu8zPR0qneVr5VaxswkvozATCKCuBji4mpnl+0daIEnDKS3ieDJiPn3JtUBHdZXYBSzTL0Ak2d4OPhI/daOMnVTGFP9/ACQU
X-Exchange-RoutingPolicyChecked:
	2pVH40MwZ3QkCJ6FgHgEJAVFD6wSaQ61ovlszRN50LgXDv4+gYiumif2lnvxaPSvtcCZ/I1hDjxLo3aclnDde86Dj3Tomk1Fp8GZmK31NL8QcUJ7JGomlqK5xJNhEfbRHBaZYQ+0kTkIDXY+HvSDIwNuCuKIRPFWlEZDehvluzuLp8myptG0Ud6GMqj91MzzCHO+WvAt4TUiLjg2Wp0jZCzV+Mof2n7/RJHZjQ4wCVB2DnJdDAbDB5BIZ/M81Ez3B+ETu3bzjxm1ytNJqFQCFnoBQJbVIN0Ql/Y9rqj5bsocKHthUrilQtA0YLAWzOFiK826PG3wGu8NK3Io0vne2w==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6jaxExRDowtuGZmza+wtk9pNtaChjr9pN0REbe7mbNruVD+AZ6zEUPSAwuS0g2ARhYzuOKrCDBCucfcHO+vme8x04eNUV0sxVxP6ZEvzPOj3D34zxwdXyg7hFeJJrgniC07YSjbqSkKQlLrKgldXMPkg2iFkaqlPWKcgbBq/nXSY3SKc+zEwB7gV1ZWNESnIRBwg3ppj7YIeybRms6y9NYTAft6uYYRdIMCbKLQTni7NuqrzXAZuviOORheqYlYwUGEE4rGcTp+whhGcd8cNEpd2v0A0Bb3GnZSnvR1N36TwWLgik2h7jCC8KCaY2uuVHj/Pcp5yxHHL8HLxLVNbIrZj9vGghL0eaq1CfZESG8t5qVO9HyOHlWfT7dlr5mhrRCMzwrSdnqI3+faeEUx1HZr+yxc4waR3EOEi6rWNDfJTTiDjUtxq93uSyGvh9wS6OdEP0hw72jxBWzcRkbiWiVRn06YKDG6DP6hWr2iVz49+tQ/F0Wn8c+Pm9TFN9yhLV15TnAq0v62PhDHG8r8sL6X9j3MDbr8QligzFfZbIcDcQ0xruPTENvfbvKJH321wRJWG2qUGSr//iGysima617UJOnn5HqiUmyJcO2p+9RpRUoIJTwsUZcBsAoHEobCtJEmCfyVSI2BF8JkYNcKOhQ==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:49:07.0439
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03031f4f-17e6-4ba8-d19a-08df402cd8fc
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR16MB5198
X-Authority-Analysis: v=2.4 cv=YO0KWhGx c=1 sm=1 tr=0 ts=6af4c6bf cx=c_pps
 a=YvyvOXr+GU2iduXSFDI6sw==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=ARvDHhclS48edyKYUbLB:22 a=cbNQJ9GKAAAA:8
 a=-dbgILNXf1-h2M8LFzYA:9 a=DqJYxgmhk6moR-_7_KoZ:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX4vnkLzYUTVun
 A2Jq71Pl21/ab0VMePOFXFoIf96Tp+qZK3W1NT4Fx73T80gGoQFBAPz6DUwmduy4hj1lcbuXsru
 kAm31iTlCUoJIRtaKbKOtrAq2j8Q6oz0KzT+kCSFYfnGwBIj5hTP
X-Proofpoint-GUID: qCA6qRcBScOxzCXhMbnWD5cjy9IK72zc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX2LHHpqSZn68f
 YhKb/2JAf5Zx+abMBwRTNClvgr9ClApN47kZGIvVQwSNSod0LByXcB9T1mbhvrdzdqFC/Smq51K
 CUqfx7kK6XWJG/yVcVxPDFHTrpEg/YW3csVlwlrdrSEiMIxkE3XIeR7jc7wurYC6u++cdAYOtDu
 iLxCyC32CCgJv1dAlzbwoNsKDeEsB6jUvsRLz4tzae7KOcuYM3XQfPD0IDS9SXvVTdCZysbKLp3
 n4MA/LhqiU71HnyVrz/ELwnBUCylCx6R0VIXGM3/eg046UwlEsVRFuoT+DoLVz2J55IYbIPgxao
 1mQIcGJagl1AE2GQZb7ctKm01pkw155VEQsVesTymHkfETpMK5Ni94+eXu4UBrSXrILm+a6FwfG
 C4LIVDTe/+yw8zW/xANhho1Td3lqkF8DzO0AL6dQhQvUiTlBNZdxrFmUad3+Oqfbiy/6SRfujo8
 uAyDVXoPK56jktzJ5mQ==
X-Proofpoint-ORIG-GUID: qCA6qRcBScOxzCXhMbnWD5cjy9IK72zc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110078
X-purgate-ID: tlsNG-bad1c0/1794426561-FC212034-98EE0DBE/0/0
X-purgate-type: clean
X-purgate-size: 6343
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

PVH domains use vIOAPIC, not vPIC and NS16550 emulates ISA IRQs which
cannot be asserted on vIOAPIC.

{map,unmap}_domain_pirq_emuirq() infrastructure is modified by adding
new type of interrupt resources 'IRQ_EMU' which means 'emulated device
IRQ' (similarly to IRQ_MSI_EMU). That relaxes ASSERT() in
map_domain_emuirq_pirq() to account for IRQ_EMU case.

This is necessary to for IOAPIC emulation code to skip IRQ->PIRQ mapping
(vioapic_hwdom_map_gsi()) when guest OS unmasks vIOAPIC pin
corresponding to virtual device's IRQ.

Also, hvm_gsi_eoi() is modified to trigger assertion in
hvm_gsi_deassert() path for ISA IRQs.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/hvm/vioapic.c        | 10 +++++++
 xen/arch/x86/include/asm/irq.h    |  6 ++++
 xen/arch/x86/irq.c                |  2 +-
 xen/common/emul/vuart/ns16x50.c   | 47 +++++++++++++++++++++++++++++++
 xen/drivers/passthrough/x86/hvm.c | 11 +++++++-
 5 files changed, 74 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 995fae7b3c0f..03a63c048ea6 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -178,6 +178,16 @@ static int vioapic_hwdom_map_gsi(unsigned int gsi, unsigned int trig,
 
     ASSERT(is_hardware_domain(currd));
 
+    /*
+     * Interrupt is claimed by one of the platform virtual devices (e.g.
+     * NS16550); do nothing.
+     */
+    write_lock(&currd->event_lock);
+    ret = is_domain_emuirq_claimed(currd, gsi);
+    write_unlock(&currd->event_lock);
+    if ( ret )
+        return 0;
+
     /* Interrupt has been unmasked, bind it now. */
     ret = mp_register_gsi(gsi, trig, pol);
     if ( ret == -EEXIST )
diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.h
index d26cb5c1daba..58f32026e033 100644
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -169,6 +169,11 @@ void free_domain_pirqs(struct domain *d);
 int map_domain_emuirq_pirq(struct domain *d, int pirq, int emuirq);
 int unmap_domain_pirq_emuirq(struct domain *d, int pirq);
 
+#define domain_emuirq_claim(d, irq)     map_domain_emuirq_pirq(d, irq, IRQ_EMU)
+#define domain_emuirq_unclaim(d, irq)   unmap_domain_pirq_emuirq(d, irq)
+#define is_domain_emuirq_claimed(d, irq) \
+    (domain_pirq_to_emuirq(d, irq) != IRQ_UNBOUND)
+
 /* Evacuate interrupts assigned to CPUs not present in the CPU online map. */
 void fixup_irqs(void);
 void fixup_eoi(void);
@@ -222,6 +227,7 @@ void cleanup_domain_irq_mapping(struct domain *d);
 #define IRQ_UNBOUND (-1)
 #define IRQ_PT      (-2)
 #define IRQ_MSI_EMU (-3)
+#define IRQ_EMU     (-4)
 
 bool cpu_has_pending_apic_eoi(void);
 
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 3fcff671c27f..a1f0f3e05dac 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2814,7 +2814,7 @@ int map_domain_emuirq_pirq(struct domain *d, int pirq, int emuirq)
     if ( !is_hvm_domain(d) )
         return -EINVAL;
 
-    ASSERT(has_pirq(d));
+    ASSERT(has_pirq(d) || emuirq == IRQ_EMU);
 
     if ( pirq < 0 || pirq >= d->nr_pirqs ||
             emuirq == IRQ_UNBOUND || emuirq >= (int) nr_irqs )
diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
index 389c58f94198..17691dd2b5eb 100644
--- a/xen/common/emul/vuart/ns16x50.c
+++ b/xen/common/emul/vuart/ns16x50.c
@@ -353,6 +353,14 @@ static void ns16x50_irq_check(struct vuart_ns16x50 *vdev)
         else
             hvm_isa_irq_deassert(d, info->irq);
     }
+    else if ( has_vioapic(d) )
+    {
+        /*
+         * Inject the positive edge only on a low -> high transition.
+         */
+        if ( asserted )
+            hvm_ioapic_assert(d, info->irq, false);
+    }
     else
         ASSERT_UNREACHABLE();
 
@@ -896,6 +904,36 @@ static void ns16x50_reset(struct vuart_ns16x50 *vdev)
     vdev->regs[NS16X50_REGS_NUM + UART_DLM] = (divisor >> 8) & UINT8_MAX;
 }
 
+static int ns16x50_claim_irq(struct vuart_ns16x50 *vdev, unsigned int irq)
+{
+    struct domain *d = vdev->owner;
+    int rc = 0;
+
+    write_lock(&d->event_lock);
+    rc = domain_emuirq_claim(d, irq);
+    write_unlock(&d->event_lock);
+
+    if ( rc )
+        ns16x50_err(vdev, "virtual IRQ#%d: cannot claim: %d\n",
+                    irq, rc);
+
+    return rc;
+}
+
+static void ns16x50_unclaim_irq(struct vuart_ns16x50 *vdev, unsigned int irq)
+{
+    struct domain *d = vdev->owner;
+    int rc = 0;
+
+    write_lock(&d->event_lock);
+    rc = domain_emuirq_unclaim(d, irq);
+    write_unlock(&d->event_lock);
+
+    if ( rc )
+        ns16x50_err(vdev, "virtual IRQ#%d: cannot unclaim: %d\n",
+                    irq, rc);
+}
+
 static int ns16x50_init(void *arg)
 {
     struct vuart_ns16x50 *vdev = arg;
@@ -942,6 +980,11 @@ static int ns16x50_init(void *arg)
         return rc;
     }
 
+    /* Claim virtual IRQ */
+    rc = ns16x50_claim_irq(vdev, info->irq);
+    if ( rc )
+        return rc;
+
     ns16x50_reset(vdev);
 
     ns16x50_irq_check(vdev);
@@ -953,12 +996,16 @@ static void cf_check ns16x50_deinit(void *arg)
 {
     struct vuart_ns16x50 *vdev = arg;
     const struct vuart_info *info;
+    struct domain *d;
     unsigned long flags;
 
     ASSERT(vdev);
 
+    d = vdev->owner;
     info = vdev->info;
 
+    ns16x50_unclaim_irq(vdev, info->irq);
+
     ns16x50_lock(vdev, &flags);
     ns16x50_fifo_tx_flush(vdev);
     ns16x50_unlock(vdev, &flags);
diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x86/hvm.c
index 9f8e6c8cd50f..e108f2c69a33 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -934,7 +934,16 @@ static void __hvm_dpci_eoi(struct domain *d,
 
 static void hvm_gsi_eoi(struct domain *d, unsigned int gsi)
 {
-    struct pirq *pirq = pirq_info(d, gsi);
+    struct pirq *pirq;
+
+    /* Check if GSI is claimed by one of the virtual devices. */
+    if ( is_domain_emuirq_claimed(d, gsi) )
+    {
+        hvm_gsi_deassert(d, gsi);
+        return;
+    }
+
+    pirq = pirq_info(d, gsi);
 
     /* Check if GSI is actually mapped. */
     if ( !pirq_dpci(pirq) )
-- 
2.56.0


