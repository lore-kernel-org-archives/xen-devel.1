Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0C7606A320
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 17:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=GX/Tj4y+;
	dkim=pass (1024-bit key) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=hRhCoOi8;
	dkim=pass (2048-bit key) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=Vx8vMPJm;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=VicCgjuS
Received: from list by lists.xenproject.org with outflank-mailman.1496747.1695148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU5qL-00088E-10; Thu, 19 Nov 2026 17:22:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496747.1695148; Thu, 19 Nov 2026 17:22:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU5qK-000887-TV; Thu, 19 Nov 2026 17:22:40 +0000
Received: by outflank-mailman (input) for mailman id 1496747;
 Thu, 19 Nov 2026 17:22:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xU5qK-000881-5u
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 17:22:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU5qJ-00AD4K-IM
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 18:22:39 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aff3046-bab6-0a2a0a5309dd-0a2a45089852-28
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 18:22:39 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aff305e-f659-0a2a45080019-94a38ff15e96-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 18:22:39 +0100
Received: from pps.filterd (m0367130.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AJF82Ba1030385
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 17:22:37 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com
 (mail-centralusazon11010021.outbound.protection.outlook.com [52.101.61.21])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4j21mtu9cg-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 17:22:37 +0000 (GMT)
Received: from CYZPR11CA0024.namprd11.prod.outlook.com (2603:10b6:930:8d::9)
 by DS4PR16MB6921.namprd16.prod.outlook.com (2603:10b6:8:319::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Thu, 19 Nov
 2026 17:21:59 +0000
Received: from CO1PEPF00012E5F.namprd05.prod.outlook.com
 (2603:10b6:930:8d:cafe::4f) by CYZPR11CA0024.outlook.office365.com
 (2603:10b6:930:8d::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Thu, 19
 Nov 2026 17:21:59 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 CO1PEPF00012E5F.mail.protection.outlook.com (10.167.249.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Thu, 19 Nov 2026 17:21:58 +0000
Received: from pps.filterd (m0373460.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AJH3er6383543
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 12:21:57 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hy9d2xspp-11
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 12:21:57 -0500 (EST)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id U5pbxRe4fvYgUU5pbx7lBk; Thu, 19 Nov 2026 17:21:56 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppford; bh=OCBOkZc7VJa+3DpzIfHHTXheK0Y
	6gXpVhhxrullkOTA=; b=GX/Tj4y+Wu4oUf0glNSzJJgl+LXS/2PFmhFaAPvIUz6
	rPtFW8Z06ohCLFuccAwYbSqJN9ovhoz4ruN4Qvs1cmeN4erR+m1d3VwSuRdkG+H6
	jL0wacYJJQZSqDc1+2LKT2ZqtW+cncKxZgxfaB9s7gdH6Qpqy4nDYlI/GurVjClX
	iE6N78XQk6nePWtFm8cn0wVvNOg5rfVtR2g4Ax4iePB/3Y2iQCaVtDHdxdPzOQgv
	T16Jn8izqcGzc+mlzLPMqMajrEKO7sdaSKqohWUNOETlV/Y9tOefr4b4zU5B4SRZ
	41k86avf6Hpt/FKZBBxDpF1EE129Ic+REbyNCXyDpRg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iSjN9at3wo5+8dEhB0y2QsCFQpZ4UmtSSDxGxqjQuaMSYq64IvOxcjarmzJOKY3hEA0/6QvUOOGrkwyqpH0wPZVcZSF5An62epOXiZowHC6D86nPCU3cKLtWBTW03yKzB+MIAIpUgKAnuusjmmEv1AIl6W8XXbg/jmsuCACj+sro8D7VIQuSjmJYsrlmmUVhVGW6DAS/HLX0u0Aym66a8JL5IgDGzgHdKSYo+8/9dthJVIIQZn74kR6OlQW58d9x7vpmbEhNb/lJcKtwx9QAxKsDZxmxYQTnKHMbhKPEc9o245Q7qct3owea8u7zibSRZ5UcjYVhaI3SoKafCC6kkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OCBOkZc7VJa+3DpzIfHHTXheK0Y6gXpVhhxrullkOTA=;
 b=S/CPkQJzAJ4s3dXT/BP6oFq+wzHRlO4VuMqqXu0fwdyfjMwnQDDmLxoiDIqfKPYkSjcpkAYvnKquRi653pysn9PbSNPTFXxURL6PpXZqcVMhivZquW/+YOqwM/lXuC89Gv1xl7s/CoZREJm7yVu9k/22y/r6C2u31U+OogfO1LWfq1DbL22hbN/70Q22Qrur3UQl9AARGtuH5Fviq3nQyUgzTTL/MsLEu1KYjSxdbPX7xLU/IC8t8k7Hr6hgFYNv5YJRLq7WrZpLVUTVb+RCBJPXzch39rxPY2s2MvAnEK4TydHkA58Cd40NLePebAC/ZcLAByJeV68gqa+qIcUgDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OCBOkZc7VJa+3DpzIfHHTXheK0Y6gXpVhhxrullkOTA=;
 b=hRhCoOi8J2sDLzsZg5/zHE1wMyxQuLVtdz7RylFxGOWy99hufI1uDnIwKAUt/wwtziNz5zN3uXkLAcgB7FYArWlkVs/Fu3+Rc1QX1Zt1zc0RacZoz0b+x2XhvCKD+PpQDU804/ztNT9fewjySIFoRHtjpqAeDXZr3OalYadji5o=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 205.220.161.53) smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppserprodsaar;
	 bh=OCBOkZc7VJa+3DpzIfHHTXheK0Y6gXpVhhxrullkOTA=; b=Vx8vMPJmQEqt
	XXNzCF2p12ebKJtYS/OT+GrLeI0nqXX6C9Po6XjxTWhKikl6O6RUKoISg17XbCsH
	i6TYIs0QjRR+d7ynlTfWdQjUCQlaeWZlDkNoKgpghZTWrnBb7wrRqkpqi2M1rMG7
	3pavGFnDjyVdrPARRhaxENblRrGEEv3LoYxUV1pXTuwkHxaV3bp/bDlHLZ6IzhAb
	dWveT2rjOd9EIb6tet8HkanwX81rVd0UFpYomAqjbJ0i9g/ZHWGxS50+SbmCiJfQ
	jSBw0twh0uk/i7mFOzj0kQLdQwBSF+IMW55Xjz7CZiTcbiZH7TUMDwLbfCAZwjNS
	x+Y9GdLaMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=OCBOkZc7VJa+3DpzIfHH
	TXheK0Y6gXpVhhxrullkOTA=; b=VicCgjuSh7cpVVUqZy7MlZg0sC1uVioLUzNQ
	uCPuqNbkFq4dh6jCi/YcwSeXj4XBKupBKZf9D1J0CgBTRaMWkvcFwjyFjERPFJsY
	ynDkEACeMGjC/bewSj1lFAsvevIVwDBrYq+TDZTjcmNaJ8YDAuZ2hcedhan01ZXq
	RdP1bDGNcoxzGDxVWXh3jbJhUsIw06E+v6tAZJ0Eggd8EPl+pmhca391EvDJsD4y
	SHCAL3hGm0vTDstiCHuyusd61d0WP7ULFfW5g16T+mERH0yGP+ti153RGnNvMUG7
	6BcPCvkULxYolAMP1R8YKTSN9ivC4XtnF8rJniwId5CtKOiP7Q==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: U5pbxRe4fvYgUU5pbx7lBk
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Thu, 19 Nov 2026 09:21:55 -0800
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony PERARD <anthony.perard@vates.tech>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Alistair Francis <alistair.francis@wdc.com>,
        Connor Davis <connojdavis@gmail.com>,
        Oleksii Kurochko <oleksii.kurochko@gmail.com>,
        Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
        Zhang Zheng <zhangzheng@iscas.ac.cn>
Subject: Re: [PATCH v3 1/6] CI: add a Debian 13 riscv64 QTB container
Message-ID: <av8wM0BQ6/aXLEU3@kraken>
References: <1793714671.8631fc262581453bbf619ec5b2062170.1a1a1b9ce9c000403d@vates.tech/T/#u>
 <1793714905.8631fc262581453bbf619ec5b2062170.1a1a1bd621c000403d@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1793714905.8631fc262581453bbf619ec5b2062170.1a1a1bd621c000403d@vates.tech>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2611040001 definitions=main-2611190068
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E5F:EE_|DS4PR16MB6921:EE_
X-MS-Office365-Filtering-Correlation-Id: 593a0aef-5dd1-488d-8f78-08df46619dcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|36860700016|1800799024|6133799003|18002099003|22082099003|4143699003|260925021311599003|11063799006|260925022911599003|260925021911599003|56012099006|261022075727099003|10067099003|261026121527099003|261028144727099003|261026140227099003|261022105027099003|261021121427099003|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	FOFa0VD2ZjNnLlMdk3/lHiLhlq0dA9MIFbTEiVG5YcTIJIFLnfo6+vfB6RhoTwqfs0wWc0qpMW2H7GXADZcq71b2YWaP1AR1Djzctcl6h9it/spSWnGqj6tGL1lk1f02J5v5vV64mGEiX6HfS9rYN9ahuDpClfq3MsM0CgyRmPZyNeDGG/z2qGghWNV5z48GCssXY9Xx96iTtH5CtfQcbdErnc8sLFFE8XLxSV/I4SiD4GM8aSAa4zjYlh1V2sF9eemZUkTHH51xp/SyEIEACyn2KQNRQXBebC7CxdOBcAYrW8giTNqYqjxe6YnkikB/BHI+mlQdxqJl67U8Ox0y+VkokgzYmM0OcnZCACpX3Wjbo5c9FTi07M+RRi4VU0S9lzdcbd3/lz54NKxvzVDg3zOgvKZHVcuEUgRLWS4W+0HpG3+PZ65LV47+nbqzHBcnpq4q5eZHI+GdTiA1eSDeZoq0+uvigqGRG+yoc81lT0qe1SIpbNNEsMxoOLTuIMjt1p5qDi0LIFF2N+2vG63+y5zaGVRc3hyYU69wFP0xALkRo3rWlLmUDq8nUZomZvqvRiKaOUTngVglFBg2pPdXAxOGsJv4Xe+SoBGzJqHyglfQq7QedZr3BknaZFRH62T1rRBnyyTrsN6+UendyVDkQ1lQVBQhWyJRFxM56Gb7vanGyQ2IjSdKdBz+GoW0vcKfLv/13MUJ+vxSlrpZhjNpEA==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(1800799024)(6133799003)(18002099003)(22082099003)(4143699003)(260925021311599003)(11063799006)(260925022911599003)(260925021911599003)(56012099006)(261022075727099003)(10067099003)(261026121527099003)(261028144727099003)(261026140227099003)(261022105027099003)(261021121427099003)(261009223027099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FZki5VqBp3rESj99NZcKJEVMWBBq1cWisxSIneUS1KRXi+h0HyJCu6M+NT/ooQSAsKmdXu7JnBvFiGQJunDZJnwf/OVeAxmXfZXa6wJKEspMzKz/RMz/HUpQqUT1QBw5EBAtYozi/+r5SAL7ry7rB6sdMSaiBdAgj42uvzOyTzB0wb4I5bYHaN6fM7xnl+UvsXN4dhmOqXxasjJsnwFyG7mWsIfP8fzjOfy7pq2FlKSdj1cIjA4Xw0RXrwbVMBMSRmt6ovKP+xlssjTtKPEHqrbrVGUA3tOxcRVnumYYnRzfgkNI7PMBivgxAvZpMo22V4SCNV5fPpf8Ximpxwv55gLqYGrPZxVQWoyoJGkRTjRza79vnIrH6d/Dc/XvzAMqq5idK8mjFW281xUghCDl7YBujrKRaTH88n1rDYFIqpAttBfxRVpGDDcLZqQrGTpU
X-Exchange-RoutingPolicyChecked:
	zKzV3KLwrUbXrVLNpb2mNWRkqSMECxOvUuGfchO+zSffUJ+26zD1bMEql/08XgckzznXSYagGJinQ2g3K0NEt3nGiG+KME7ZKIXFEjSLaEsbZDMrajKfqowtOUJdhXgLp0VFJDrMfiaXIyizkdgCHw6gUhScFBnI311iFd41u9ZQLKwI0cH52d3z1fcdcxFt44/hfzFLgRAx++Tts2zNThwx5FVywxZz4fB9u9drj73EhkyUDumozpqTasfj51u2CPwWcJtIypGBrZxxv4yC0sYiwFFNLTnCg1BnCQ3UHZL456oDwoYEwVZrEQiZqalctg6ZzpBj3X51YItmc2h9zw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TuYv7yq0rPnGBg9PQI1BUL9Fv1jWdd9+PUQsXjFBpKzrQ2wzAsnns/g6RpACBstY7EF69xvHEiK2pmGrlCW8ttVv439fN1udVqkYtgUdBJx5KNpqIB7K9uvmYpLqZZmlmIjut5GOPOyTYAOuleLJASN5NNwojSkjIyK1clzIBr1NADv/6ux73jNie7MMTMp5+PIB+5DY/XxhsR+F9eumSFPTgKqwK63q37Y4U4UvLi/tP7osaqCOXYImUgwsApo6Sl6sU3m6uqdBmnNL26k1pmxUS2dVkb0Pd7k+iTrT0iYhYaSuZwZbPDphHqwIWdem3pcyLMTKrvflJKy9T+l9S6zCIxdCRyBs8npAxEm9Z6Qr3TH5f+wF3EvteDe8qge9v+pYuEBVq+fh6NJwawKTet1VtWsla5WIolMTIuI8Tva5KNKHPH21S8c6uLm4IDFNxGBMwO7UwaVFSn8kXVU8pd1seSqryra4PLDuJgnMku8V06WesNXjjMKTE8KziRI9ItL1Deqi+9HNBJtmV0cYNM3hUUKbxY9AW5LjBM0MBECaSRHapW8qUGUG7hXoea8ARGa7s7OU7nO7nI4qVc/OB+cMIiigRUGXvPJh5gMCAejCHEKiupU98a11bBYujxgJyBRXCKf3NpL7nYZha9bn6A==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 17:21:58.1968
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 593a0aef-5dd1-488d-8f78-08df46619dcf
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E5F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR16MB6921
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA2OSBTYWx0ZWRfX6+0XxJehT8nX
 5BKZFs6+NquAqwMdZIAxyoJyV/Ecid+XQaSB+oxGgb//T3HYzHumaGBHwXSr2Mbglo0rQaMOnCL
 HpckTaiR4BpN4hHKvCx6UwhAPxkdnr9N9anzA7u1d1cT58cY0siW9cQGqdRTuUMAlCuFzDcc1OX
 u/ckjq0c3Q3wPQjGS9uexeZMfc1x0cXPb7YYWov5datvvldFC4t0y9oHjELdIRIQO/dEBU17S7S
 Sg7wfbBUkfFlw0t1KWjLSMWSawLyboT8zeqx8ooZ/5Stpe8DDW/YV6jjRl2OKGozbzZzXwDNvVG
 1v0fugUHhnU0W/1+Mv0a5ti2uEzDlQZSyFfNyJ5VTFY/jMY5dJvJngkGQNQLoz7F8yRZYMD5mf9
 9xObAfmLe5v7rOlxsuPXcw66sXVrQPBJOP81YZZ7YVnZ8EBXJ7PUG7NVW4uWp3muGVhVOTtguQF
 2hfTXrZyA4x8LogAL0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA2OSBTYWx0ZWRfX2QYBEYHACVo9
 Csn1gnCGdTp0pPgFOyjHQQlY7F+1xdnXPsa5tMC+MnG/3d3aACMYv4HNw6ggPZiBFaWsARmG1Ic
 2kIwRFclq5/cg+qa/h5CeBAA8MqmjJxiz48Z90oc20Dd+3YW/ZIQ
X-Authority-Analysis: v=2.4 cv=KJzPn1Fo c=1 sm=1 tr=0 ts=6aff305d cx=c_pps
 a=RSwuJLpHzOwHBpypAu37kQ==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=vnUQfov-gS4s1L7hHvr-:22
 a=p0WdMEafAAAA:8 a=VwQbUJbxAAAA:8 a=cWRNjhkoAAAA:8 a=cbNQJ9GKAAAA:8
 a=p1AbytjELuF637EnVU4A:9 a=CjuIK1q_8ugA:10 a=3whSkbs7g9Me0DR5EJEX:22
 a=WmVTiCyuxqgg3mnwYu6p:22 a=sVa6W5Aao32NNC1mekxh:22
X-Proofpoint-ORIG-GUID: vfIVQRK-DOTiPkix3MMyFkKBUkiazO8O
X-Proofpoint-GUID: vfIVQRK-DOTiPkix3MMyFkKBUkiazO8O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190069
X-purgate-ID: tlsNG-c1860d/1795108959-D614687B-E1B6DA39/10/63158204843
X-purgate-type: spam
X-purgate-size: 4267
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 03:08:09PM +0100, Baptiste Le Duc wrote:
> The riscv64 QTB tests use QTB (QEMU Test Bench) Python package. QTB is part
> of AMD's work on the 'safety' branch [1] of their QEMU fork and is not
> upstream in QEMU yet. The tests also need pytest and qemu-system-riscv64.
> 
> Add debian:13-riscv64-qtb, a Debian Trixie container with those packages
> and the QTB package installed from the python/ directory of AMD's QEMU
> fork, at the commit pinned by QEMU_REPO/QEMU_COMMIT. Make it available to
> containerize script as trixie-riscv64-qtb.
> 
> QTB depends on pexpect, ptyprocess, pygdbmi and qemu.qmp. Rather than
> fetching them from PyPI, install them from the wheels vendored in the
> python/wheels/ directory of the same fork commit, with pip --no-index.
> 
> [1] https://gitlab.com/xen-project/people/amd/qemu/-/tree/safety?ref_type=heads
> 
> Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> ---
> The CI jobs running the tests in this container come in a later patch.
> ---
> Changes in v3:
> - Move the container from test-artifacts to xen.git (automation/build/),
>   renamed debian:13-riscv64-qtb.
> - Install the QTB dependencies from the wheels vendored in the fork, with
>   pip --no-index.
> - Add pytest, drop jinja2, yaml and device-tree-compiler.
> - Comment that the pinned commit is the tip of the safety branch.
> - Reword the commit title and message.
> ---
>  automation/build/debian/13-riscv64-qtb.dockerfile | 47 +++++++++++++++++++++++
>  automation/scripts/containerize                   |  1 +
>  2 files changed, 48 insertions(+)
> 
> diff --git a/automation/build/debian/13-riscv64-qtb.dockerfile b/automation/build/debian/13-riscv64-qtb.dockerfile
> new file mode 100644
> index 0000000000..34ca1f2b7d
> --- /dev/null
> +++ b/automation/build/debian/13-riscv64-qtb.dockerfile
> @@ -0,0 +1,47 @@
> +# syntax=docker/dockerfile:1
> +FROM --platform=linux/amd64 debian:trixie-slim
> +LABEL maintainer.name="The Xen Project"
> +LABEL maintainer.email="xen-devel@lists.xenproject.org"
> +
> +ENV DEBIAN_FRONTEND=noninteractive
> +
> +ARG QEMU_REPO=https://gitlab.com/xen-project/people/amd/qemu.git
> +# Tip of the safety branch
> +ARG QEMU_COMMIT=24cd7e5c0d7e4db8e651f091d0b9da2e7c58dbab
> +
> +RUN <<EOF
> +#!/bin/bash
> +    set -eu
> +
> +    useradd --create-home user
> +
> +    apt-get update
> +
> +    DEPS=(# Base environment

Can you please move the comment to the new line?

       DEPS=(
           # Base environment

With or without that correction

Reviewed-by: Denis Mukhin <dmukhin@ford.com> 

> +        ca-certificates
> +        git
> +        python3-minimal
> +        python3-pip
> +        python3-pytest
> +        python3-setuptools
> +
> +        # QEMU for the tests
> +        qemu-system-riscv64
> +    )
> +
> +    apt-get -y --no-install-recommends install "${DEPS[@]}"
> +
> +    # QTB framework
> +    git init /tmp/qemu
> +    git -C /tmp/qemu fetch --depth 1 "$QEMU_REPO" "$QEMU_COMMIT"
> +    git -C /tmp/qemu checkout FETCH_HEAD
> +
> +    pip install --break-system-packages --no-index --no-build-isolation \
> +                --find-links /tmp/qemu/python/wheels "/tmp/qemu/python[qtb]"
> +
> +    rm -rf /tmp/qemu
> +    rm -rf /var/lib/apt/lists/*
> +EOF
> +
> +USER user
> +WORKDIR /build
> diff --git a/automation/scripts/containerize b/automation/scripts/containerize
> index feadd9e82f..cd078d48d9 100755
> --- a/automation/scripts/containerize
> +++ b/automation/scripts/containerize
> @@ -33,6 +33,7 @@ case "_${CONTAINER}" in
>      _trixie-ppc64le) CONTAINER="${BASE}/debian:13-ppc64le" ;;
>      _bookworm-riscv64) CONTAINER="${BASE}/debian:12-riscv64" ;;
>      _trixie-riscv64) CONTAINER="${BASE}/debian:13-riscv64" ;;
> +    _trixie-riscv64-qtb) CONTAINER="${BASE}/debian:13-riscv64-qtb" ;;
>      _bookworm-x86_64-gcc-ibt) CONTAINER="${BASE}/debian:12-x86_64-gcc-ibt" ;;
>      _bookworm|_bookworm-x86_64) CONTAINER="${BASE}/debian:12-x86_64" ;;
>      _trixie-x86_64|_) CONTAINER="${BASE}/debian:13-x86_64" ;;
> 
> -- 
> 2.56.0
> 
> 

