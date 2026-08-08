Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88514C5AC82
	for <xen-devel@archiver.kernel.org>; Sat,  8 Aug 2026 02:39:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1386416.1628312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wsWxN-0001y9-C3; Sat, 08 Aug 2026 02:38:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1386416.1628312; Sat, 08 Aug 2026 02:38:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wsWxN-0001y1-6u; Sat, 08 Aug 2026 02:38:41 +0000
Received: by outflank-mailman (input) for mailman id 1386416;
 Sat, 08 Aug 2026 02:38:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wsWxL-0001xv-5f
 for xen-devel@lists.xenproject.org; Sat, 08 Aug 2026 02:38:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wsWxK-002dkF-4n
 for xen-devel@lists.xenproject.org; Sat, 08 Aug 2026 04:38:38 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a7696a2-2eae-0a2a0a5409dd-0a2a450387fa-2
 for <xen-devel@lists.xenproject.org>; Sat, 08 Aug 2026 04:38:38 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a7696ac-fae8-0a2a45030019-94a39217ca32-3
 for <xen-devel@lists.xenproject.org>; Sat, 08 Aug 2026 04:38:37 +0200
Received: from pps.filterd (m0367124.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6780jSmm1685007
 for <xen-devel@lists.xenproject.org>; Sat, 8 Aug 2026 02:38:35 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com
 (mail-westus3azon11010018.outbound.protection.outlook.com [52.101.201.18])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4fwmjyap7y-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sat, 08 Aug 2026 02:38:35 +0000 (GMT)
Received: from MN0PR05CA0018.namprd05.prod.outlook.com (2603:10b6:208:52c::30)
 by BLAPR16MB3843.namprd16.prod.outlook.com (2603:10b6:208:27c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Sat, 8 Aug
 2026 02:38:32 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:208:52c:cafe::97) by MN0PR05CA0018.outlook.office365.com
 (2603:10b6:208:52c::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.10 via Frontend Transport; Sat, 8
 Aug 2026 02:38:32 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Sat, 8 Aug 2026 02:38:32 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6780l5xw1815968
 for <xen-devel@lists.xenproject.org>; Fri, 7 Aug 2026 22:38:31 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4fsyvwg463-7
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 22:38:31 -0400 (EDT)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id sWxBwTb4fSqacsWxBwv8E7; Sat, 08 Aug 2026 02:38:30 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppford; bh=VVocyPjs5xADxPDxMphRRc5RXD7
	ku5EpzkZWOv5SIjQ=; b=m75gY0m49hZT3uNrqSt4mog4Kxa1csBrgs4fyw2tXok
	anKQkyGva47M56lf17AZhOwcuKcfwq+wNBW6MXlz4idRi75zsnMWL3iNEDazfpM+
	FDPcoVEp5e1Y9L25ftJYrVhKvSGNaA7SMJ/4V6avHbz0WyupBqYbT+jkRxirSx2e
	Omt/Ip521u88RdnIw8NOf+CulZzUnUXtdRUAgUUmPAxgFkVROhe21mnC4fS2VB6t
	G73TAO9U4hSlGuJp1+ArA/ibnxkcmYh40HpcHTYyG4TZx5ylJ7u7uBN1KUAjxmgN
	Y7vhWp4uDtethozEe+Swb3bBX+dNeNrshVP0hFjLHew==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o2hZhpHS6/VsLyAbbbfh1MyiVI90ia7LsJEwmFJ4hnacOaliaf1rT1uOKcHhxTfaSJXK19uV2adC0oyv34P4FN7U2rxGOY6ZWnyKNN/ninrBSWjySoVpv/csoeINC87mG0g86V4DJF+OdLBajtH/RBXIZGrEn6qPNeBeK+UimFx9H5zZlNf4F6NiTcH3Ii9Mu/11IUadXj8SLK+q3udWyV6t8npLqvEPraqbo1boilOjnUesMbdKyxhRy1byb93G6LbdXUoin9+qvSLpPCW0yeM1z2b/STKyEQ989+0rY3ZAWLw9P7CZOH0+DShrzp+7fYUxUBU8Ie0I5R+c0rnIPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VVocyPjs5xADxPDxMphRRc5RXD7ku5EpzkZWOv5SIjQ=;
 b=jDrGTTkI/hEvCffUQ0Oi+g8KQSi31J9erkQ3ZFD/AEGeNsGW5tySuDThWpZdpbBkiUtUXmYSy8grFnk1H7b3GlwTbwLlWQkqjsMfj4vkEDmznoFgev0qd0gbdo9lCs9ShWG/QQCYLG2+QCh1u8hglf9WsInQK2ebDkQ2uF63gPOFF0mXqf/wiSDYzni+iPEBPIekqrQUwLvFgis4/HnYfVeGTfrOp2E7UxNcFNKojIQAhPuymcOILkfpiZntQ1/OYu3gmxjxtysxdcxQNlnEG8elK+oD1Xfm0YNBg61q6z7ZCxL4vyA3BHtDyfjdbPCFW0nQJ5qxegDls0a2+CsU9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VVocyPjs5xADxPDxMphRRc5RXD7ku5EpzkZWOv5SIjQ=;
 b=KaGOw8ALV/QCf6xIA0uJIpxjmd5tgibm1TWWrcNc0TxW40+gpNFAdBUIkltfSid3DkGOXEchhJvY2nIblPJw9AaJ2cKJClY3IoNfssc9cHSpXcykipIUJr3wM5mucue/egqNbk+axWmjWnFem0IOwXY54k5NqGEOM2WDaJ9qtWs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppserprodsaar;
	 bh=VVocyPjs5xADxPDxMphRRc5RXD7ku5EpzkZWOv5SIjQ=; b=B+gu6SccxuV9
	Z8eE4fjHPdQxpqXWQbGoxAe3Fwa6NgwZnKqMg1xE1kFP4DU/pBAsLss+Wnzw4H2B
	jtP4AqPxi518ErzH+ln70iHbrVXiNCrdNBTkLj5zxa88PTlfhjS81l12tTr0TUGO
	wAKEtVCT0w4tOD3aw16RENT3JfUhiENk7pHfO4oLcP3ONqZyeYx48oJbm0gslGbC
	Tn46rOJSaO3pc+L+/QdSHZD6jWdEQxeitwJL+rmpPoCaw5Un+JNyNnLyNvWJDj9e
	HVQQbDlPXO2qLiy+Zl2pg/kD1q50NTzigaOg47Caq1NXhVPBQqBM4B0KjcokPhAH
	GSOFTatMaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=VVocyPjs5xADxPDxMphR
	Rc5RXD7ku5EpzkZWOv5SIjQ=; b=Aqo+lMzp0GtEvJWv/r2AKR1vfmDRZCAnPULi
	OXZjh+/AIbORYk89jRnePNc7Lf4gwgKDXxTKyihSJC/j7+kv7Jw6NbHvFmEnZg/8
	Xaf8AI0O7cqJbQIVtnbJdhanu7kOCIEp8EdeZip7Gv8cZesTjJ/4ndCFoHId9az9
	Ja+VQFrhHdZvPusRG2mi4GqC26df07zQYyTxsZamcOcrc4Tz4gilGBS3Xx1P9rvU
	0sKKJbb479hZTJtAChSSdEi4JG1AH12vuaAOCSdtfcjL1w01CzX2savpxHGWlvy1
	9Dci+4/sf7NrBSRtvYPXwvhY6A8KrPsvDmJslxLPzHfH/NPQuw==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: sWxBwTb4fSqacsWxBwv8E7
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Fri, 7 Aug 2026 19:38:28 -0700
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org,
        andrew.cooper3@citrix.com, anthony.perard@vates.tech,
        jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com,
        roger@xenproject.org
Subject: Re: [PATCH v2 2/2] xen/common: add keyhandler to show Xen command
 line
Message-ID: <anaWpO/zu5sI4A9u@kraken>
References: <20260803070047.3097846-1-dmukhin@ford.com>
 <20260803070047.3097846-3-dmukhin@ford.com>
 <df43b4f0-9973-b80e-47a9-f0cfa65651aa@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df43b4f0-9973-b80e-47a9-f0cfa65651aa@kernel.org>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-08_01,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608080019
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|BLAPR16MB3843:EE_
X-MS-Office365-Filtering-Correlation-Id: 37698fbd-f206-4af6-c3b0-08def4f62374
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|13003099007|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	MlAmNTfO8wAQMFmPiYJc+it6uKR0nq6u3z8HLJWQAzChB0bDuEV/Xz03ucgB37WPJ0p/p7nqY0u4imlock7ea5JpsUDZK22SEoq7bYvj68GzssXfwDr4WcThXgffiPIjVg+vStem7STyGnpQqHbqRRS6+O0Ad7YavISPB2mKEsi6Gff/A+IvXTYUsMwHrvYwTnNv7hNscyICqzhkABmHCwuePmklu7/YR2h01S8h3icFFSI+b+wZAc9iYUUEdq1qDeicv66DQUyx66zVnTARFM+JSv2VJC12ETiiIV1dqct5SeQCwMwv8Hvn8Ny6GZwjwYa0K1mn8NLjClSRwkbCzvNzybi0gNiCz/YlrGOKgl3ffMPN+diaqiX3nh3n0xKfIZW74pQTiMZpKVQ+55BgTdHPLyvacoU+ZPRJ/mW38aBCLg3UOH1F2ub8LbvfhbdZDA58eq4c8hSFSHWal8+36ytpmUBrS45vZy3ct5W3Sc5A88IMsUVTUKaJrR6yhfm/sdRtUszcoqtNszqxNiYjOlMK57uI4/VnTzUNuaULbfMwG3XFa+MK1XIIF8GTduGR62ZSjVZEaxWnd9NyCA5gF74HQDnZV5fKgIBvpV4zTX1zVxR99SbJ7rhpmM/+fYWMXx5Cr5wSg3KOo1it63Plx9XRvtUPEpX10RYgZrm/NSr2EfrgrNMteVFJQJ5cafuPgkxAxzakbVKPmpQnb+W5qw==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(13003099007)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	y8oeqO9haz5v/5BpcdEnvV8tFjAHSOJxVp02xba5XozKr5MsIpejqpIN+aIS/8DF7586oc0xp1Ti0Wi6OyNDTxsHpl28gHWOngq1CwZpbrs42kZ3fb2yub99IhifH/3WI4hCACNNZYznl2axG2PhJw75Cr8rfqv7CFg+T591R+navkTF6QqRX4wJJTKTj2a0DK5hLBJdEF6oU1g3H4qHH6/Fc02oPHybOauaoyGOFecN3RwenGwuYIGR883RjfhDt8gHIkuDUdToi9Dxsbvp0V+3m/Bk4zpZwgqMs8xFc28n2cr4c6nRe/fp3PkqTxRNd1DHXCi7R9W7hnLI96hb+rFpktG0pq6Bg0BQ/czdaIfErEydwqwPZQ2QzqteOAb0gcPGuu9qvOEtcs/y51ly3VtjpMfQKGpCb9xRxCzd2lQPQJRxgi+706u57hZ/AUAF
X-Exchange-RoutingPolicyChecked:
	gXddJERaxPSpqJMgy1pO3stgbF1xrMNYT+SWc914Qiu/w6Ze8yOQqTEX+yvYSb56qTs4wD1vPY4z4ABeD6ruVfcKnKmaT3Zg/7Jllr4qbCp16w7VqKfCt/7fxzTiHpD+824+l/xzYeHjekpLbevtid4a3qyEe88k3qmzhCEnJMfcIN17fVDhD1wLjsjJxY1e5M79ZyMgS3suM1L5qK1gmNO1qGKb3uJvmslj4cjJywadf/D+5KAtJ9o5flegNCAKgDBoUTfSxNzeoqjzwcGjZDJzXYaHWra4Ey6tluE9+APZrV0J2zl1vYyiZwODtYGugeJvSRwxAzq56CKgyRVaTQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	M0rORpk7GN9cEZRzEHKS1XXnHoyQ93XSsyZP4Mg+2Pw/4YkxU/CzUBgnUUd5o9zriiOmnKe+hS39yLmNVGxizymX//SsRE4Oej4iUQweQKGkoqzx4OgLWpPPTxeKi6/2PrOf+f8YjWficWmMZE2DNCKrvKavQ/mRNkpPQxZQrQ9LGX5cVkIUrQc8JQAIrt655+yE9hRP8IxFPA/7Pr6MWDx8RqN7Of3CQQ5gPqSAVJOWVroQKlYIyDz0POZqzpKBSCGUoHvFbLrue73xdNvXCeckbGv62rl9ZxqwR7JMRyGijJcw894engZAEtrh7DHnWptjUFFkjyLa80HFGPpkFdC8YBi3eB/qpIfPwLjxj/cKI1WVQ2/Y71YIZt+HsDzWUzu+NfBWGl4zRbrvZwYPXo055pEk5KRYGaP9e11TG73DRvUhL61XsOBEF0TjoE+WbmIENm0HRdVWmvP+S38XMtaAVy6ZSq4VAOM1Ct4SszLxoSQFR7HYg4grNDPyO0ewt9I3fFD9kDvOct7uliLiHXHiIuKZxtPjUPOxRJQCkjriRKuIfqYQDHA0Pl/hcFdkbN0Tki1m+TXrqACj2L5j/rs4hmVhK89qQiz+cIdHgyyIr9+T3umfXwvd+WSgSCAh
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2026 02:38:32.4014
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37698fbd-f206-4af6-c3b0-08def4f62374
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR16MB3843
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA4MDAxOSBTYWx0ZWRfX3xjDHc05s/a9
 8N2OSC/yW3YNiy3LBwl84FFCX+nYgb5lb0tkVIl1yPueV6xhydnXi6TFsHSAYpKPy12aJEV2i5t
 VbshUYTNqbepWltFgES8pdcfgRgAM46hQ+Gj9JkMyXcgy5aIDyuJ
X-Authority-Analysis: v=2.4 cv=dJ+WXuZb c=1 sm=1 tr=0 ts=6a7696ab cx=c_pps
 a=mOf1MaddDbw/YSD//5QIpg==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=YJXg7OVxOWrJwj3yZo-i:22
 a=VwQbUJbxAAAA:8 a=cbNQJ9GKAAAA:8 a=aJccLSbELdoR-C0BZckA:9 a=CjuIK1q_8ugA:10
 a=G69WFyCBNqGPyalROSdv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA4MDAxOSBTYWx0ZWRfX0VBqGGVrRB6v
 JPg6cEBCkFx3vdL+Vp1MIVMd5QbMa9V007yeFTcVqIx7t9mKF8RCM0q3fHwIqsvFyzWRzL93AW0
 ZmMxBpyPN4bAcRmI8GzQOVqJ+GWuS1TvGo4cwKjsqZeRQMq1/LfDBPZJC49TixE0mpXMcSyYRgN
 y67cGAJqNseRIO4qZ3wDg189VJqZTxbgZ/ObYHZUdNlCXiXKhqNahc83GEc76hJSSN4316sv0iF
 GnyMdzZBwuCCIgRSy7ma1bbq7P5AM5BjnSxVNCsysc26rYVECNGf+1EN/gqA5XZR5vgc35gENa5
 Ix7SiikZghbA7cjnYzaU+EYJBdVUQ0JJRa0+D9RIDL8VO8R6KKfLD24kSHK132bR6VQbyXPnbgZ
 38dbRZ5hL8SJSyFAa5L8FPOeg9s1TyTvXIY15LxP0hvfQWc9ZIZsK2JJzPi9kuPPK1pQokVa/J3
 /pnsk9mx0bPqJc+804A==
X-Proofpoint-ORIG-GUID: EIlE6y0uOYUcrdH2QAEHziZwBEFPlzUi
X-Proofpoint-GUID: EIlE6y0uOYUcrdH2QAEHziZwBEFPlzUi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-08_01,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608080019
X-purgate-ID: tlsNG-33051d/1786156718-6F6C64E9-16307A8C/0/0
X-purgate-type: clean
X-purgate-size: 2444

On Fri, Aug 07, 2026 at 05:44:41PM -0700, Stefano Stabellini wrote:
> On Mon, 3 Aug 2026, dmukhin@ford.com wrote:
> > From: Denis Mukhin <dmukhin@ford.com> 
> > 
> > Currently there's no way to print Xen command line on the emergency
> > console for debugging purposes (e.g. 'xl' is not available in dom0).
> > 
> > Add new keyhander 'X' to do command line printout.
> > 
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > v1: https://lore.kernel.org/xen-devel/20260730061459.2702672-2-dmukhin@ford.com/
> > 
> > Changes since v1:
> > - moved implementation into kernel.c
> > ---
> >  xen/common/kernel.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > 
> > diff --git a/xen/common/kernel.c b/xen/common/kernel.c
> > index d1bef9ac2b2b..9f334c92e3ab 100644
> > --- a/xen/common/kernel.c
> > +++ b/xen/common/kernel.c
> > @@ -5,6 +5,7 @@
> >   */
> >  
> >  #include <xen/init.h>
> > +#include <xen/keyhandler.h>
> >  #include <xen/lib.h>
> >  #include <xen/errno.h>
> >  #include <xen/param.h>
> > @@ -505,6 +506,21 @@ static int __init cf_check param_init(void)
> >  __initcall(param_init);
> >  #endif
> >  
> > +static void cf_check show_hypervisor_info(unsigned char key)
> > +{
> > +    printk("'%c' pressed -> showing hypervisor information\n", key);
> > +    printk("Command line: %s\n", saved_cmdline);
> 
> if CONFIG_CMDLINE_OVERRIDE is defined, saved_cmdline is empty. We could
> at least do this:
> 
> #ifdef CONFIG_CMDLINE_OVERRIDE
>     printk("Bootloader command line ignored (CONFIG_CMDLINE_OVERRIDE=y)\n");
> #else
>     printk("Command line: %s\n", saved_cmdline);
> #endif

Actually, CONFIG_CMDLINE can set the built-in command line which can be
non-empty.

Perhaps, something like this:

    printk("Command line (built-in): %s\n", opt_builtin_cmdline);
#ifndef CONFIG_CMDLINE_OVERRIDE
    printk("Command line: %s\n", saved_cmdline);
#endif

What do you think?

> 
> Other than that it is fine for me
> 
> 
> 
> > +}
> > +
> > +static int __init cf_check misc_init(void)
> > +{
> > +    register_keyhandler('X', show_hypervisor_info,
> > +                        "show hypervisor information", 0);
> > +
> > +    return 0;
> > +}
> > +__initcall(misc_init);
> > +
> >  static long xenver_varbuf_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> >  {
> >      struct xen_varbuf user_str;
> > -- 
> > 2.54.0
> > 
> 

