Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63406606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=Uv5g86In;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=UQ2wkzkg;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=MB2rB/t5;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=eo8h1Mz6
Received: from list by lists.xenproject.org with outflank-mailman.1473478.1681126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmQy-00080Z-Hj; Thu, 05 Nov 2026 01:38:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473478.1681126; Thu, 05 Nov 2026 01:38:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmQy-00080S-Ej; Thu, 05 Nov 2026 01:38:32 +0000
Received: by outflank-mailman (input) for mailman id 1473478;
 Thu, 05 Nov 2026 01:38:31 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmQx-0007y9-48
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:38:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmQw-00G6uF-H0
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:38:30 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdde8-e002-0a2a0a5209dd-0a2a4505b2da-24
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:38:30 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebde15-4cb1-0a2a45050019-94a38ff1bf50-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:38:30 +0100
Received: from pps.filterd (m0367127.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mrKT226617
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:38:28 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com
 (mail-westus2azon11010062.outbound.protection.outlook.com [52.101.46.62])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hrfaurckv-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:38:28 +0000 (GMT)
Received: from CH2PR02CA0006.namprd02.prod.outlook.com (2603:10b6:610:4e::16)
 by LY0PR16MB450305.namprd16.prod.outlook.com (2603:10b6:404:201::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:38:25 +0000
Received: from CH01EPF000BE94B.namprd02.prod.outlook.com
 (2603:10b6:610:4e:cafe::6f) by CH2PR02CA0006.outlook.office365.com
 (2603:10b6:610:4e::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:38:25 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 CH01EPF000BE94B.mail.protection.outlook.com (10.167.244.200) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:38:24 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50nXK4060892
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:38:24 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4hnxy7wh8u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:38:24 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id OmQoxuk6nz55iOmQoxXMoQ; Thu, 05 Nov 2026 01:38:23 +0000
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
	:mime-version:subject:to; s=ppford; bh=jBRiD9h/ZX2roh54YQ1pUbgyR
	VmQ6R2m0JJUxrli01c=; b=Uv5g86In65OxqkhKbP0HXDB6dYBMOYqTyRKERPSlg
	EHDGUaFaZeDgjwxXd8CJ7jNM6zLec6FS1dL53i+CJfHEn5OuF7ZTAfxDTdgUQmvW
	5eK3JUjEUUzeHxBu5tPxhA8Ov5nuNGVW5b897tpJDN0lLldjihBDKa1aqwwubl/y
	X5P85mmvx+f+18peZvmiNLqVfDu5rCf60XXRECPPxrGZnqyvRYqBfMqu6UharxQJ
	+7XkD8XXbrlXze4E+alkNwpOnavTKn0Yu3xv0RZIN13hS4wf9ydyyiOgQAvHQ9EY
	DfF1xH8xC0daYae9NK6nXfXMe1anE2KXjIMcD/CtWvT6A==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OkaG+qMMVjXts+V9Z+zZ6Zi/JsCgEhfmGMDbB+sAqFwQw8yiZ3uUu7FDA9hEfEZWBV7t+oeidytXc5Hy0aErLedvQog3NKLIW9PqUTG4Y1xBTOcxK+Gi3y4XT23APDAVzdjem7hIMgGV6PjEQC51W7f3bJ8OBhJpOntptumX4a+CcRxQKXPdsiIE6UBBjtsspNyCQZwrXG16nOau3DVYghKCgoWEdXRwXxdTI+Gw1+fEIofbAOrZ9a0b2Niy+E+SacsHsz6M6L2cWBwiBUlF9T/t+VMTGGuR07Zi4zQ/7f1F8wuqjeTnWbEt1ro/48DbOCGjaYJOXW5DRYFucLGEcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jBRiD9h/ZX2roh54YQ1pUbgyRVmQ6R2m0JJUxrli01c=;
 b=lpfJCoIm7euhqeVLnPbfotTILcJrCwpROUvhe1fd/gZ19MSDqH2TFvPlyJJ4IL2R0kAYV/RUZKmHqtvtcI8ksOykzwNRxHjgSZ9X6+9W3Ujk2b1y3F2tuPfd0yro/K/4lkDzMK2vd9GzJVANStfh+ROiN6hcN0GUgvvckxmrqxbsJC1VyHMjdaA87+S/AieLrBavt8E/dHmvq5RyvdvTnQtpaksEeFk7vwzb4J59bwBrg/fbNS6Eabxg9uaWV/F1Wh7I1xnNvOwRsbjxXF6RjuJBbGkvhQnEqDOkqi9aw2ITJutIuTEypDQrxO1cAgIlJwitXGtPdi5VeGsET1+AiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jBRiD9h/ZX2roh54YQ1pUbgyRVmQ6R2m0JJUxrli01c=;
 b=UQ2wkzkgSTKHIs5ljffR4Rbp5sRLx/4ZYZ0Pobe4+Lr8c8TRAvuX1BEfhdw91L5BTHfPfM6u301haF4hlUdecW1ERvShXgIxX0LbopLP0Il3EwR41iJwAXUGatOFIEJoCMR9NLntGqDQzAfUWj+1tZrhIIzxeh7yza0x9r7/z4Q=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 148.163.138.245) smtp.mailfrom=ford.com; dkim=pass (signature was
 verified) header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to; s=ppserprodsaar; bh=jBRiD9h
	/ZX2roh54YQ1pUbgyRVmQ6R2m0JJUxrli01c=; b=MB2rB/t5rgaG1q5UkwUHooN
	keWYk8CohnnAWTJiwOXQMmut+tCzjn+aPYif7vL08w9AxY+BrBNurkFxXL6ibn0z
	IrLA2uhKzJ3jDDz8CQ1UclCU2y4ffXLtvguTfyPqzTEbQ8KKx9NOzM5P6l4bYXZG
	Qd2Mj6NaEnW4+eQla/XuHbAuhVowTktd8p0Ja1+hqNUMcGiLUUgU4yxRjFrS0wmh
	hh+sM2JaRAdU+2DCNr//izvt0Z+CQsIeUszeoh02V8pCLVrtZegrtX4TT760f+bR
	Fg6o2cuZIBn0cPiVUiRcQIfJIQPAPw0uu8Efd036JLhFLDmrZf50/0bfjGDV4Hg=
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=ppfserpocford; bh=jBRiD9h/ZX2roh54YQ1pUbgyRVmQ6R2
	m0JJUxrli01c=; b=eo8h1Mz6Jl7NtSdt7O/NB0gPCGDwRMG8R06One1BuVyVOXL
	GpNTXdYrocL+8Wj87W2vNoBv5lWQnrEDRlVRk3GcOxbQm0BVa87Fp7xxweQjW9gL
	tUcNoaXveuv62VMyfeEaHBkWPIoFX/78D+8J76tzasVY3/RJbnBTRabckDzUl3Kf
	sqGMpWT/zuUISmi0Yj83/wSxhrdk14bMXCdOqU+97JRljtpvPpMA5c9gdkLzKybN
	f1ZkQ/44tRSYgSfBFApMwNLBRgHpMfVYkCXgfzqr8Gl1PB0NMR2Lu514n06srwjD
	U1yHHBmlO07dWN/emqadVnvHCWBlj/yWVaXEqFA==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmQoxuk6nz55iOmQoxXMoQ
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [XTF PATCH v1 00/15] x86: add interrupt latency test
Date: Wed,  4 Nov 2026 17:38:02 -0800
Message-ID: <20261105013817.719823-1-dmukhin@ford.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050006
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH01EPF000BE94B:EE_|LY0PR16MB450305:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ceeb114f-b928-436a-bbd2-08df3add7be5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|260925022911599003|260925021911599003|260925021311599003|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261102130727099003|261022075727099003|261026121527099003|261022105027099003|261026140227099003|261102123227099003|261028144727099003|10067099003|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	yHn3XB81B0lt7TYPieDUzGVId5vos176eqiC205GenaAwdFE2CPcEEeaIt0aO6l+MHotm6X6X02zNXfhWNaeOKZCdrx/Rcy5q53QPxo1su/e64Z4SWUZHK/fTJeoDF9C6DcSKgXm88INGxY8LlJZQPmuX9YaSfImdUs8JuBNBpYAeo+s72zsPbOQZa0+Lzrkvtn+Du3YI9M6awPw1lzossAToIRA728vs+MONBhKVAIVi701NRBGRyMc4bYPtVG/PZByPZZK6+HdRVofX2rktL8uy051SEgE7Q7hFFH7ZKseCEwyxeUqf7jUiu4fW3z/msIQuS5kPyP6n+r1mUCJH4kqtMduXSKKcDZqcJd/afMA4NuxrWCZxIlO9splvXTK5jYTEjE2nTd7afAJsktNLs5wwZcAqBk5GV0PBcpbov28HjFGshKbuuoz82avWtcVuEK4raYIw/zaytzvwEktnlSmIz9wG+CakX1rQPadf5yhEvdXxhj6r0tC3lAFf7jepnIC8D+ne3xnVhQ7PoAdOjCFoPcPrRl6jMvHjootXPEDP/3yfAfM3qG7yGu1XzE5kjhGYsDUBtIf+d4kMf7XRNR5AWGr8yIt6em19/FEklPg7d8510fjrE0+bQ34PdLZwqoUNS6AwDJjxudY0aKe3uNxOAGQXC2AgkaJuKyP2xKHTkbg4mFY95tdt/79lMc9ruxtWBSvX+CUxe+zUtAuZQ==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(260925022911599003)(260925021911599003)(260925021311599003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102130727099003)(261022075727099003)(261026121527099003)(261022105027099003)(261026140227099003)(261102123227099003)(261028144727099003)(10067099003)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jo4sPQFbBm51JBxlp/mJIhtStjeIAYVfrp7pKjkN337nca/ReZYGR2vr1oDHhG6m6E1QwRBOKmNOwOv87jTLlXr3h6YLEK+xB1d+L9249TeBXkcEVlAGjqTBkRtYD8jsOkwMtNcJV+WOxcMwVdcSggWtX3GDiL5clM2Ue3figvmgruX3En4OeLbekfVnmOzMVFUVhyVYcDGU2Kku/EwYSDyPjYcJIhES4EN/JhOkPRihINYqr+lR7g1oeEj1lGDbE7A/5a2IieL+Ay47g89s0jdyyub4O/jt7d9Kp0hS5iXd+4y8ZZvyL6kXTwZJMfYwZQcXQ7p+byWFD+WzmzS68u7fc2Ixh2ljTwKtb+XQLQ03CPqOUXZ3fE/X9FnVE1dn+9UuTlnQ6aYGM2jczOt0FMV87yiQI0cXxQVdv/mTJPjiPerl8Pq1VEJCfmT7UIQk
X-Exchange-RoutingPolicyChecked:
	R3RB8DdD/PrtDi1/c7Ofl0iGtpSUzA0IyO+4kW8kUoPrVj3SMGR6d/Bkpdym1NKf/G48AmttrzX/w85YnqLgAP+VrKG5720E3SPcQzczTdILCUGRcJE6X1MYX5/yQEt8fuaEanywau0rIz9RAfVHYTF4E9dkM9Ync6EPOQ8B4vRnTRwHWCNbIb+lLqt2d1JqOJqMaMwcxAhXTQIgPIwCNiH812WwFkVl8UE3ZxluwPQ2Ze8bpC5yXPCRoZgoZFtpLtPOmGxsY0BEDdZTPE9s7OFEvCqQW1eT6YD4OX3JtUiYjKAPnifYbu/GOigtBIGnAWTWudgYRcfuTisohp7ERg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LM3wkxT1Z6CHX4o1jF9G99ywHbR7ZC/glEHcFtrH1WdEW4CbiIX5CddWCplrhaJL6sVhc+cC8AMoT4pr/hsmkcL5KrN8yEVaGSE6GeHqib/MgdfFom1l0g+3q1P8jKNeUnrGAc39rbFQU3E7Nsj8gmZeCv5Ffy/pJPs3EGvfSPA8Q+ra3ASigOL6UNl94tcTliDXU993fI7GbnkVuCJMNIeA6zAatLNdhOmWoi/FcT+Vp9iIWceCnJRicea3YosienCW+Q7ZNf70IIc0lCbEg8SIKbteBP6+ttR7vIKTmlOaPzTKjtEv7KOp3LVHQMeFbR9frOaAG6EqWnqJF02t8bGshc7UlQXi+qTxSgGxTIRpxs2+6gad7s+ekM1ciCNd2w549XUWbIvvs7SeKgj9p7CrC5I22z1qS7bze1+c/QOVLJjp4atM50j8K5dTyyian4cN39oEGZpLWhNpNSNundsgJ+AnlpHSC841I2Vnd3MuMOo15bv8dWpDimylwk6PhXRm+fUi4ha2U1HrV65GsMf0mFbARjHhCly8DaZhl2s3MIiL2J8o8Ghc7qf+CSsEqBNr0/br31RKWZQSh0Af7GYeQr7XqmnUnQOrRx39wCTGkOP6ITd0J1wvCUQxhi5abxc6bvUEEB7tOyWGW49fcg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:38:24.9272
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ceeb114f-b928-436a-bbd2-08df3add7be5
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH01EPF000BE94B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR16MB450305
X-Proofpoint-GUID: Nw7rVIRUSXY1GuasFGmTsG8ecHOPzCIC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX4+9OEqoHz5qc
 Mfx6J5T22h1N4YGlXQSlQIPqLtUZguwIJg1YFBfQxblrSPUtVmyEOUDbfYF6cqtAyoQAl8fMdkM
 7pA99W64eRhwGw+Xl8H7GntlXwRlfhe9LYFn9Su/h3co2WfQInYz
X-Proofpoint-ORIG-GUID: Nw7rVIRUSXY1GuasFGmTsG8ecHOPzCIC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfXwoX9Yti6WdYd
 3bprgIMoh9H+QUj9Z5LP723F+pkBElb6ilBVPGMXAMvDsCG1hSG6tcA0qqqoyCuajgM41VXVhAv
 gdu1hLRIScIrk8YVJgkZHxBV3kceHuZWh7mncnuNX9fHPhD1s3aFAeONg9mxpA7NVWPX3a+aIHb
 cmFLWfCqL+OMkrIj+QNGqMjuSjKgIGRGcQGmMNNKfxrS6YVwfIKi8NyGMaKQAUrR8Li393k/lBZ
 0miVSe3r9r4f0dwsoQn+uACxTeMzK5DspUImP4eFX/Y4WZF0PqvALe0KlDS0weYHntZ08gGSM2x
 fk33SS0wk+an42oK2dnHdgtVPf53KbFcSg8hCr6aMmFbLTfce7wzRLwOvHJZpp3b/gpFGyTKP/6
 QUAW45WHwLNceg43SQFm+8tVgvPUeaoSMy+I4ozDb7jqUP+iTu742wseOxRQ1+CXDg3O1d6jqjY
 OgSJbtn4MxRc8kGzcEQ==
X-Authority-Analysis: v=2.4 cv=ScVi5fRu c=1 sm=1 tr=0 ts=6aebde14 cx=c_pps
 a=QjrP5IPIVlaYm/X31SuGbg==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=dw5MciS7gY-znkhJuOLE:22 a=p0WdMEafAAAA:8
 a=6GFfu_wQOdvJcrVRfoYA:9 a=G69WFyCBNqGPyalROSdv:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050006
X-purgate-ID: tlsNG-c201ff/1793842710-F6EB12A1-11FC6F12/0/0
X-purgate-type: clean
X-purgate-size: 4326
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The series introduces updates to XTF to enable a test for measuring
IPI/posted interrupts latencies required by [1].

The test has lots of dependencies, so series grew big.

The series is available via gitlab branch [2].

Complete CI run is available via [3].

Patch 1 aligns Arm XTF with x86 XTF; does not affect x86 XTF runs.

Patch 2 enables per-test Xen configuration.

Patch 3 adds hypervisor cmdline into argo test artifacts.

Patch 4 ports ACCESS_ONCE() from Xen.

Patch 5 adds simple atou() for test command line parsing.

Patch 6 adds missing evtchn management hypercalls.

Patch 7 adds XEN_DOMCTL_debug_op hypercall.

Patch 8 adds minimal measuments sampling framework.

Patch 9 adds cpu_relax() for x86.

Patch 10 adds TSC-based time management.

Patch 11 and 12 are small updates for setting up test environment.

Patch 13 adds primitives for enabling/disabling interrupts.

Patch 14 adds few more APIC registers for tests.

Patch 15 adds the interrupt latency test.

[1] Xen AVIC + CI infra branch: https://gitlab.com/xen-project/people/dmukhin/xen/-/tree/svm-avic-v3?ref_type=heads
[2] XTF branch: https://gitlab.com/xen-project/people/dmukhin/xtf/-/tree/x86_64-ipi-latency?ref_type=heads
[3] CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/3028917985

Denis Mukhin (15):
  common: account for installing *-sym files
  common: add per-test Xen bootargs file
  argo: export hypervisor command line for test
  common: harden type checks in ACCESS_ONCE()
  common: add simple atou()
  common: add missing evtchn hypercalls
  common: enable XEN_DOMCTL_debug_op domctl
  common: add primitives for measurements
  x86: introduce cpu_relax()
  x86: introduce simple time management
  x86: export per-vCPU IDTR initialization
  x86: isolate FEP in setup_fep()
  x86: add primitives for interrupt enable/disable
  x86: apic: add few more registers
  x86: add interrupt latency test (hvm64)

 arch/x86/hvm/traps.c                 |   7 +-
 arch/x86/include/arch/apic.h         |  29 ++
 arch/x86/include/arch/idt.h          |   7 +
 arch/x86/include/arch/processor.h    |   3 +
 arch/x86/include/arch/system.h       |   7 +
 arch/x86/include/arch/time.h         |  48 ++
 arch/x86/setup.c                     |  80 +--
 arch/x86/tsc.c                       |  32 ++
 build/files.mk                       |   3 +
 build/gen.mk                         |   4 +-
 build/mkinfo.py                      |   8 +-
 common/libc/string.c                 |  24 +
 common/statistics.c                  | 364 ++++++++++++++
 common/time.c                        |   6 +
 include/xen/arch-x86/cpuid.h         |  26 +
 include/xen/domctl.h                 |  63 +++
 include/xen/event_channel.h          |  13 +
 include/xen/hvm/hvm_op.h             |  17 +
 include/xtf/hypercall.h              |  31 ++
 include/xtf/lib.h                    |   6 +-
 include/xtf/libc.h                   |   2 +
 include/xtf/statistics.h             |  23 +
 include/xtf/time.h                   |   8 +
 tests/argo/bootargs.in               |   1 +
 tests/interrupt-latency/Makefile     |  11 +
 tests/interrupt-latency/ap-asm.S     |  50 ++
 tests/interrupt-latency/ap-main.c    | 164 +++++++
 tests/interrupt-latency/ap.h         |  12 +
 tests/interrupt-latency/bootargs.in  |   1 +
 tests/interrupt-latency/extra.cfg.in |   1 +
 tests/interrupt-latency/main.c       | 706 +++++++++++++++++++++++++++
 31 files changed, 1711 insertions(+), 46 deletions(-)
 create mode 100644 arch/x86/include/arch/system.h
 create mode 100644 arch/x86/include/arch/time.h
 create mode 100644 arch/x86/tsc.c
 create mode 100644 common/statistics.c
 create mode 100644 common/time.c
 create mode 100644 include/xen/domctl.h
 create mode 100644 include/xtf/statistics.h
 create mode 100644 include/xtf/time.h
 create mode 100644 tests/argo/bootargs.in
 create mode 100644 tests/interrupt-latency/Makefile
 create mode 100644 tests/interrupt-latency/ap-asm.S
 create mode 100644 tests/interrupt-latency/ap-main.c
 create mode 100644 tests/interrupt-latency/ap.h
 create mode 100644 tests/interrupt-latency/bootargs.in
 create mode 100644 tests/interrupt-latency/extra.cfg.in
 create mode 100644 tests/interrupt-latency/main.c

-- 
2.55.0


