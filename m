Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCF9606A326
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=LMKjWv1J;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=QuiAhPKw;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=imAu+JQY;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=gKa6qhO2
Received: from list by lists.xenproject.org with outflank-mailman.1473402.1681109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmQC-0003uy-I8; Thu, 05 Nov 2026 01:37:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473402.1681109; Thu, 05 Nov 2026 01:37:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmQC-0003uj-BJ; Thu, 05 Nov 2026 01:37:44 +0000
Received: by outflank-mailman (input) for mailman id 1473402;
 Thu, 05 Nov 2026 01:37:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmQA-0003bJ-LO
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:37:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmQA-00G6uF-1N
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:37:42 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebddbb-e002-0a2a0a5209dd-0a2a4503e104-24
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:37:42 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdde4-fae8-0a2a45030019-94a38ff1c9cc-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:37:41 +0100
Received: from pps.filterd (m0367130.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mYBZ2064415
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:37:40 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11013025.outbound.protection.outlook.com
 [40.93.196.25])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hrbp3t6h1-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:37:40 +0000 (GMT)
Received: from MW4P223CA0027.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::32)
 by SA6PR16MB6693.namprd16.prod.outlook.com (2603:10b6:806:418::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:37:37 +0000
Received: from MWH0EPF000D894C.namprd05.prod.outlook.com
 (2603:10b6:303:80:cafe::8b) by MW4P223CA0027.outlook.office365.com
 (2603:10b6:303:80::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:37:37 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 MWH0EPF000D894C.mail.protection.outlook.com (10.167.249.212) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:37:36 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mNQH3091282
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:37:36 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4hnycbnhm0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:37:35 -0500 (EST)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id OmQ0xdKbtmeVDOmQ1xZp2h; Thu, 05 Nov 2026 01:37:35 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=EBo
	lYqzeKQgYX1dht4yk+gCZOOLYEi83ixWjkx0D5VE=; b=LMKjWv1Jv1khdcKLykf
	PqeVrFkKnyXgunJTSPHQD/KSTDMbAwN44DDB7KRjw5NBlsWPo31Du4+6L5ZqTOh/
	aTSkF6kzUvxwF3eRrmHCADL+CQR4qdy+Fa/UNTqZDcQFf+i/Mk99SRyvykp248+c
	dKqGxnazdfe4SESR7TIVoTrLrkS1GrIYOrDa75qmzfJ8MwZ6Z6Ho8+tCaBHZUMqB
	7fYLfR3gczvNrrx879tVx3WTGby9QQ+s1HaO+sRDWpOw9Y24AVJX+GeJ440wI5+h
	53XoQviOnJZVmwKwF3v2KWtwy+U7FNYdL5vgHxBd3++utsQqWKin9LpC+XsKjf9F
	bOg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a0OvVYpTmIcL2sDVGUQ9pdyNhYx3cf3GbnLBubjIHiVahF98CG2DFBlPIlSPOD8oJDhdSG0MU9/NZQjV711fYwXi4xDswXZKpiinn6a16uWhGKU/Te9nfVk9TF1bnyu/piwiMqLXgiNO+cANs6oFirbOPWSy87I9kwMYzp1SXhJ2FwwNT4aSlL6psXw3C6z1sfps3li3Us6VmEQTJWHfmJN4QU5z7Y13VKuSunrkBjDBTk0K3tLHgvNS6GlvKnXTEBf0DxOqXbl2tReP1canIaXrPJQjWt6KYaN2Qiyve3sXbUUflKy8w0ijFrCj5i8WlC4KXVX15BDB4bmxcGc60g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBolYqzeKQgYX1dht4yk+gCZOOLYEi83ixWjkx0D5VE=;
 b=MDgcAe0GJCuidaUoz+d1ek8q8q6mzbg2zKXEanxnRmlZCzlg39lN3MFTXn7Tps9x0wyj9MCq4061O3oGTovryHDBb9HBJ6KRmqIyRRxAyRyhr1pIdZ6MaVbA5HxMqmImFdQa/bEfqRrHdUpdBK/wMhzZiS6RWbb4fXe7exawXtbVQslpBxl909GVuc+JnMWl0O48vOutoE/h4LNH5mswL+J5MNdytWQfUh/G/ONcWvGbPpWJRpz2SopCYRHnXU8TQKZ9mTVSikWdpLyGCZxdgcSWwd/Cj8Qu+BXQ54oqhQYf6Lw1Nt9kIePdyXEdNO0xZwbqejYL4vNZhMzHp7b6BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBolYqzeKQgYX1dht4yk+gCZOOLYEi83ixWjkx0D5VE=;
 b=QuiAhPKwm3qN07QKjvqw7qPAdSdGdIn129EOUJRlHpe0jSI068qjcjK9+QDJM1jyyzCMhI8EFgcLdZc7A9wXA8hehoZB62EwRRI5jsx17P1/Bmjo9E9LB8D7krMtrufWc2ANIWVxuNdGmInZUqPCTDMrQnB6kM652sAY/dUFce4=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 148.163.138.245) smtp.mailfrom=ford.com; dkim=pass (signature was
 verified) header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to; s=ppserprodsaar; bh=EBolYqzeKQgYX1dht4yk+gCZOOLYEi8
	3ixWjkx0D5VE=; b=imAu+JQYTcAA06SFuBZRzRHW5ptOX/lWgH3lWqWz9JAvcMz
	Q0VgKVjnvDW6iHXcTjBv6OQcEmoobMfzHxl5JzOJwlAllt0UOxObpZIImIrPGAXs
	EfoDS9igQtxk/lxe7Nrr294OdutDAKJqrRqajCmfGSjEw0+wlPD5y+i5mIYXypD9
	uGkdPhTHK6UnmsYBl2ebdGQ4EAkMWWc2OJbrQTKmjXbgSsB3oOfBdIiQghN0A1Qr
	hFcUQ6adYxq7bfRyKe41HlnooA/CEYlHYaTuZCadLQ0WGInyMsZtHBqo1sMgOLL2
	gZuhx7SA0PaLvbUzaULnucNRFiSKoNfm3ZDTJ0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppfserpocford;
	 bh=EBolYqzeKQgYX1dht4yk+gCZOOLYEi83ixWjkx0D5VE=; b=gKa6qhO24sdn
	xmEC9EjGfn0Ngt6okixwaFXD4uCq1355UlKdfvmVgaDTrP8CpwPEjRFvE28MvY7K
	SVfkMFTXP15BgTVN3a9sL/K6Ve0DWFBLDZzqPUWwDmVSMKtf3fn8o+2hw9A2baLo
	obrpLGSHS12XQanMtknpquMDLKdjYkJ7cOgnlim7h2RU0VvPPKwlyfVxxaTxrdJX
	uPB448BTpnhuTd1m++O5SDsE6QX/vWYCKLe5aoCJSoqCWyDNA2lvTq3rmn/2Do+G
	P5zRPakWYot8DQv61De1Vo+lrizfRJuBEe7dclltVky7wF/kHrMhMpWaecnhVub5
	hkqwpKewPw==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmQ0xdKbtmeVDOmQ1xZp2h
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>,
        =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v1 11/13] CI: add test jobs on AMD Zen5
Date: Wed,  4 Nov 2026 17:36:59 -0800
Message-ID: <20261105013701.719658-12-dmukhin@ford.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105013701.719658-1-dmukhin@ford.com>
References: <20261105013701.719658-1-dmukhin@ford.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000D894C:EE_|SA6PR16MB6693:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e7d71aa-2e33-494c-153a-08df3add5f5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|11063799006|56012099006|261009223027099003|261021121427099003|261026140227099003|261026121527099003|261022105027099003|261028144727099003|261102123227099003|22082099003|18002099003|6133799003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	7u0ZN9/oP0Ww4BYkg4Kl2DAKaj4Ff0GS5JGqI/nm7kD2cgT8ewiaNj2bN2cpI/vmblWubbON18LpfFqCo1Zoe0+poDrJiU6kg9vWHO1UcZjbT6xlwFARBdtUc9HGFNA/9tmfbrtU4hGkedUVmU7nxpBoz0FiFNDc8tk8wV4FFjkcwQlzQ4uwFqN/a/xGGpPWuER0z2/EKZ1X3Q7TdO26BsY4kXHOSg2ho7JVDPPEl8sx4xOuyu53wfWQ0hHMCmIiXb5pllphiLsbRn+Mxn8DO0zqCUhjv5cNLtZsQUTnXPSdNYYXn/KewgRFgrkUFt67tEtbogNm50C8a53qtcJ+5k9b5ovX0LzDQCFm4+KCd1ktqnQX2AsIdU1cP71Knn/QbIkFZSB7d24EzwD4ErHd/j6cmBdWK1Ksmw28/M3/pNgj4gKzTccswlNps19JT6VLJudvqetMsuQmdevdxTOWttOQb1BVl1NUiMHhn52oPn/rYzqFzkbaH8dRyXP+KtxcyJucMPepzRs2e/xQIsYqqysyvP9lbqMJyKEH5UD04Jirtm8zqu/XeESbvoaueGy9eptwtIoxo/syJivTGPiVDPZVpCXR2AahGz/IyV0ZzwAzgj7CpqVKM3xs0XOxOSLqWss3YRLCLcA4xZqLB/DqXSeRtM3wwmyRyFFYXsoWwZS/Pg7LY+8u3lafJgE+yoOMqLFYvXlC9C3OZkd8v0iyew==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261026140227099003)(261026121527099003)(261022105027099003)(261028144727099003)(261102123227099003)(22082099003)(18002099003)(6133799003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UZs5efE0mqLve7HUNeydX7Wh72oa19pRgXcLDIKcNMj64D6bJbOdhtBB4ii5FBInu1wyImTr7L+DfUxnQb8wiRu35WJn1Mt5ZYNYOnpIc3FFUN57NQfE3cn0w0xFhR1ozsAM9Tle0+t7d3yXoystaRFC8OFbR83ATCCwIWeZog8Bnyk3RJ+OTRQXuKHRBfjOKFuuMe3dNdMl8lXoPM9w5BV4+8upjl9nVegzp6zcuBevmuxq25sbsKWfvBL0Rawulg2+IRQKtjBWBOMI85pbOOOHr04H333SYgfWrNRKdbM59KDwkmZ9v0XARiEsYIROZK0OsDRD3QUD7WZbj7ClkXWWqaGZCLja/zpAUY4gyQu/cDvySw/lL9grAs8b13PqEza/qdBiqNPXCd8o8awrnCEAhhenC7wGyFmoiBzHcTuqXjiKG41w9pzTzXgaOaUs
X-Exchange-RoutingPolicyChecked:
	TLSmT7pvK1cmpCeHHmA5B61h7XIeJgCS3jjmLE/+unkcsAYlkhUKNZEEmRjvM0DS/XKSAKCRMLtqXeOkxU7diRm/2BdzOWj2m7zczIF6TcKClRB0vQNjgfN8V5/1dNnt7YxdKHnwXBhVhHBTiKcacP26m5lweOyn0kOY/+cDl6qeKVhHdhD5L/RBDdG7QM/9RXt5a+IWznjZ0Hle3nA++8dcc6Vv8KAxXwh6R7qe5voiQ6Qb+ieX8yVbQT20K/udF1opvPPMXuEm2fAfK3y/HyyB/MmiNKKRDM6+cxtl4zh9TwkBx0yfEn9U30ygjoOAMpDkfIrr5/SPaueMSEve5g==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zFAcsE+4pzkunabw/tagI8MFdqHSyJ+Zey9QyltduaKaUFgnl4QePvDDoza9Weo2VaWxgRCd0J2LTU60MIxBCcdoMPNfI+FXuO3N54T7Xf+GNJsifLrunwqTAa1bCDVOM8B3rvjuZRTzh11jYjPcOmNxBBuvyVc53J/ABv8ll3i+g2X4APFbOh5NtWH6y/wajqQMV4YiDqaU3hCZNK+MEHdZjgQwlT2+HgMZjoyPL5MJoN8ZDihfkNv+zq6KQg++acd49bN8rKuq1lypJjw8cXTTXPX1HNTUvjX/vXkTFXCvSo1onCFQrnF1v08my5lyRuG35Q+Qm/EfueO3qdYZUBo5rntOlGsKvC/B7SqrVHYh3x0SRfVIx6VonG5BlU4SSbaJ9UoyhzIkuKnSTcGPvBcK8rStkjl1ZtpwEZnvOozekUWt1m7dvFfITFjwI3fLrrwB/aLd2Hq9EDg+Ooly6k1qgM4svnOx/Nsrh68JqnzEpxJ+iYRUbRFe7GA+1SbabUWbB+9bsbApm7yYBL4xdZLo1L1012Fv4vuKgrt+NPH7MPJODx3K/zDBI0YtuF/7tDqezh+NoQDR6r4Ppz3kA5AtR5y4j73+qT/R1BQg8y4vtuyeeXxvhfUJL3feOfV4wxhCSLMAPz8tjmU59BiRJQ==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:37:36.9015
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e7d71aa-2e33-494c-153a-08df3add5f5b
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000D894C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR16MB6693
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX9TgWFdV60PMh
 Ze8ZZzddVDznnuYAhgmsgVkLJ1rWyxGZaXXoZttEBFMSAfog6nyNydYwb0OcvWfoAAKksm2QC15
 MLOsrRMNp9SksshQ0DP5gRMPVVPNZ2VcML8cOGZQvm/Sed9mvaM9
X-Proofpoint-GUID: qO2MTXGcDl0zfk3lwW2Y0A6lnpQriLf5
X-Authority-Analysis: v=2.4 cv=XuBvqlF9 c=1 sm=1 tr=0 ts=6aebdde4 cx=c_pps
 a=XslAgrSL5Auaid5C2fKBmA==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=vnUQfov-gS4s1L7hHvr-:22
 a=vkfgAjWNAAAA:8 a=cbNQJ9GKAAAA:8 a=MLJBxw-F2uju8ffh_fYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=P0bj-C3X3jJDpopQwM1U:22 a=WmVTiCyuxqgg3mnwYu6p:22
 a=s88AYcEWOXMFsoP9cgP2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX4R6WdNnG9ZiP
 Vim+WNxjPixbqHtIZsaoER3x+9gYwez/deHb2pRpuy7DS/y5S59uHAL0bwG+YvP9fqxYZ1sO6qe
 0hBwWo/MPjNtYwloD87wSlmNv6Zq4ZmdvSka84t/kc21k3fEGXf0O+Q0x9Ei2vDhnR2MfSVQv6R
 N5F39tNwcaN2qSa7lfX1bI1/c6zjaVbUk06wgncZJmgBmAqxJ7NhMY3wQHjwDhle5fTjo9dOrpS
 Y5uPhtaaHyEDmLmnL7sTd3L7RP9WF2t83kHgzy7OhuD1wTFq82RXBC3P+S5kmqzrQZsiu3xdweL
 avfeVvHZSc64QvlvzPH1oWnpgql7eZax9+c/1Sd0zIwnkbjxoQ3T2IHCxFgxva2LcYaByy/cx7x
 2ZPluQRkY5qf89LXWwmZdCVKxjwJK4tqsc+lH92a2s4wrYUP8kJ4gJs/zvI+a3KAIw6umO3EOZS
 usyRyFpu3KOIjyJ+8tQ==
X-Proofpoint-ORIG-GUID: qO2MTXGcDl0zfk3lwW2Y0A6lnpQriLf5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050006
X-purgate-ID: tlsNG-33051d/1793842662-6C4DF4E9-3CCD6F67/0/0
X-purgate-type: clean
X-purgate-size: 2955
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

This is Minisforum X1 Pro AI mini PC with AMD Ryzen AI 9 HX 370.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 automation/gitlab-ci/test.yaml | 74 ++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index bf12b9123f1e..05dbd0d3e07c 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -264,6 +264,18 @@
   tags:
     - qubes-hw11
 
+.zen5-x86_64:
+  # it's really similar to the above
+  extends: .adl-x86_64
+  variables:
+    PCIDEV: "c3:00.0"
+    PCIDEV_INTR: "MSI-X"
+    XEN_CONSOLE: "console=com1 com1=115200,8n1,pci,msi"
+    SUT_ADDR: test-21.testnet
+    XTF_TARGET: qubes-hw21
+  tags:
+    - qubes-hw21
+
 # Test jobs
 build-each-commit-gcc:
   extends: .test-jobs-common
@@ -653,6 +665,68 @@ zen3p-hvm64-interrupt-latency:
     SELECTED_XTF_ONLY: test-hvm64-interrupt-latency
     TEST_TIMEOUT_OVERRIDE: 600
 
+zen5-smoke-x86_64-gcc-debug:
+  extends: .zen5-x86_64
+  script:
+    - ./automation/scripts/qubes-x86_64.sh dom0pv 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86_64-test-needs
+    - alpine-3.24-x86_64-gcc-debug
+
+zen5-smoke-x86_64-dom0pvh-gcc-debug:
+  extends: .zen5-x86_64
+  script:
+    - ./automation/scripts/qubes-x86_64.sh dom0pvh 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86_64-test-needs
+    - alpine-3.24-x86_64-gcc-debug
+
+zen5-smoke-x86_64-dom0pvh-hvm-gcc-debug:
+  extends: .zen5-x86_64
+  script:
+    - ./automation/scripts/qubes-x86_64.sh dom0pvh-hvm 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86_64-test-needs
+    - alpine-3.24-x86_64-gcc-debug
+
+zen5-pci-hvm-x86_64-gcc-debug:
+  extends: .zen5-x86_64
+  script:
+    - ./automation/scripts/qubes-x86_64.sh pci-hvm 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86_64-test-needs
+    - alpine-3.24-x86_64-gcc-debug
+
+zen5-pvshim-x86_64-gcc-debug:
+  extends: .zen5-x86_64
+  script:
+    - ./automation/scripts/qubes-x86_64.sh pvshim 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86_64-test-needs
+    - alpine-3.24-x86_64-gcc-debug
+
+zen5-tools-tests-pv-x86_64-gcc-debug:
+  extends: .zen5-x86_64
+  script:
+    - ./automation/scripts/qubes-x86_64.sh tools-tests-pv 2>&1 | tee ${LOGFILE}
+  artifacts:
+    reports:
+      junit: tests-junit.xml
+  needs:
+    - *x86_64-test-needs
+    - alpine-3.24-x86_64-gcc-debug
+
+zen5-tools-tests-pvh-x86_64-gcc-debug:
+  extends: .zen5-x86_64
+  script:
+    - ./automation/scripts/qubes-x86_64.sh tools-tests-pvh 2>&1 | tee ${LOGFILE}
+  artifacts:
+    reports:
+      junit: tests-junit.xml
+  needs:
+    - *x86_64-test-needs
+    - alpine-3.24-x86_64-gcc-debug
+
 qemu-smoke-dom0-arm64-gcc:
   extends: .qemu-arm64
   script:
-- 
2.55.0


