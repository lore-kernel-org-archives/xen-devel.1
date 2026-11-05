Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63191606D81B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 20:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=n0RhYhlZ;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=HxI4S8IR;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=V2PdolL6;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=WJsT7/2h
Received: from list by lists.xenproject.org with outflank-mailman.1475477.1682136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xP3n0-0001w2-15; Thu, 05 Nov 2026 20:10:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1475477.1682136; Thu, 05 Nov 2026 20:10:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xP3mz-0001vv-UE; Thu, 05 Nov 2026 20:10:25 +0000
Received: by outflank-mailman (input) for mailman id 1475477;
 Thu, 05 Nov 2026 20:10:24 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xP3mx-0001sS-FA
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 20:10:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xP3mw-00FPFb-OJ
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 21:10:22 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aece285-e002-0a2a0a5209dd-0a2a4501c1ea-32
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 21:10:22 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aece2ac-5984-0a2a45010019-94a38ff14fea-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 21:10:21 +0100
Received: from pps.filterd (m0367130.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A5HgAQ8339101
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 20:10:20 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11013010.outbound.protection.outlook.com
 [40.93.201.10])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hrvnm3fyw-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 20:10:20 +0000 (GMT)
Received: from DS1P221CA0001.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:451::6) by
 PH0PR16MB4710.namprd16.prod.outlook.com (2603:10b6:510:14c::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.10; Thu, 5 Nov 2026 20:10:15 +0000
Received: from DM3PEPF000265B0.namprd02.prod.outlook.com
 (2603:10b6:8:451:cafe::31) by DS1P221CA0001.outlook.office365.com
 (2603:10b6:8:451::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Thu, 5
 Nov 2026 20:10:15 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 DM3PEPF000265B0.mail.protection.outlook.com (10.167.23.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Thu, 5 Nov 2026 20:10:15 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A5HiN1U977248
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 15:10:14 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hnydrpwad-7
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 15:10:14 -0500 (EST)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id P3mmxKzet7GL1P3mnxc72w; Thu, 05 Nov 2026 20:10:14 +0000
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
	:references:subject:to; s=ppford; bh=ersnkD1Gkm4Hfqlsy+y7Y7pOziu
	4aoNXDL+Od2HaFtg=; b=n0RhYhlZHpDirnlIZwDIfttjA1zhgojABxW1ewgY0bP
	76rYOu9E8Dn6xEGuBX2hUaSBjELa+RVq2g/YSlfTBCVJrW0IoD9M6/XM49KSj1pv
	nwhO/ynDlDXrq16XOJpyZLgVa2kT2/Sq12GiAR40YqYDzVqrM6mcTBf/JUHw54mZ
	ySB5oF0iQuogJFbt7CUkKrue+eW/3DQYc2YU6gOfPAic2dBQRDbwOVUslPkWOjsT
	nuUeyK0bmbELjP3LHErJieesN4xHbbo4kMpTr16/nLmSwVIVYj9gTl3tbt4mtI//
	bChImPW6pmUQF1TF5vBR1jjrl6T97ptTZa1dWnMM97w==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i4TNRh++eEIVQufUcC1crCvjmJ791OtIwiEdtweTvXAz60+gJTz154CXLO/3bbeYcOaZ49eVUdq+VqckxyHtpiv7Ds8oa3UClYMKAUxmdOXeWPYflV4M4relhtUMn3duktUiF1ujxX+Eq+G3cDjwmIb/aZQSiE9SZveESZkM3VP1BY8Yy3wWGgqZ0wBmomtiC4lTGYsp9P4M1MTS6BBDitimqVlmHKuLRv18TX6SEzaZCWB7ACxoHLKu+NIFqI5jdwrHUAZJvsHyQIW8SCv2pqK5HPx2kxP/NGnTITT0a3lomTevEnnSUmmiDbnc3COg9+KvbH34zjNuHZSFsc8fJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ersnkD1Gkm4Hfqlsy+y7Y7pOziu4aoNXDL+Od2HaFtg=;
 b=m7j2TFsCHmmvY+zIqYaNGhFTov6y0W3XRT7FNyD7z6qH8KbTJxklVZe/0FhwVDmKAJ5PCOPgD8kLQZ/13QRgCRYW7Wp/FYRmSU8CzHyagNJlBPS75WlOM0C7O5bOKz+EYUG8h4lf/Ikb5w1b8nFKATX9xP9YN9+A7aurXUEoe2o/GaHQPYjQI4kim8HVFqdBSbE3zWywy5xRQHExtR4y9gUUAJjGoVDHQvql3+XYRY3eAnqw63nSidnnpg6PbjtNTtPvARr/lYS5rqpGa2OWhWGnyxNoNLc2rTbQEqv/RPKvkXr0oAaFHWZPh3rz+WsiJie62KwoWxFu7CjvsiGJBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ersnkD1Gkm4Hfqlsy+y7Y7pOziu4aoNXDL+Od2HaFtg=;
 b=HxI4S8IRHFt11lgHW3ck9Pll+TaAxkDgpNv6jEjOlSqaw5vAIBPDB79Iy+nbq1KNgFzChjRSXpHzZfmg/1RNW5z7v+yyVrvqEAaHURVWJ6IYf42dNP9yRJXmsDNvEKgma1RM8PPACuB0u1/+Dn4NwdJR7XFAgvEXfwBNnaVPSbI=
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
	 bh=ersnkD1Gkm4Hfqlsy+y7Y7pOziu4aoNXDL+Od2HaFtg=; b=V2PdolL6CBs7
	cBwN53HXI+7OWO2BfDclzy8QFPv3BQbVaNXT0ItlNunCDOKbDmXEP7jAuXp+Fdep
	Yo52/nJAtyZ1AoITDpgJ0cKr2LH4AaPoTzl7WFFaq0AHidPA8l5ZXYa916VhZ2s8
	dAoydPUzrNFDxLRrKQJnMgjDaHq5EFWmY6fwAJsyXXrfhb+LRcShB32TKgLvoNjF
	Q0L5p8lM1NEfHProKpY0LVb3peS/a38vETp68A8LfbESJor388XQKGtHl4YzhLON
	UmAofvoyFlpp87kpRGJgFoLImCh+vWw8AnN9llv3Q/mzC39gw5V3slpqrB/VLw+l
	gBzQ+lTAag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=ersnkD1Gkm4Hfqlsy+y7
	Y7pOziu4aoNXDL+Od2HaFtg=; b=WJsT7/2hEQXOUIjDXT5euJc5BGWSDbVRl0cb
	0HGSLiiCj4k4zrMDnIaqQ+bMX2BFzFgK+K4GCS+BUtp5AVByUxKqAg4VPY3Tmgum
	SaX+padXqtuDZJPLvqT+BP6TvYr/vhtCZ4Vf+uHhta1Ami8xUakyXKq/IHFvYIr+
	TBVgh+xcRU9z8HiL6XkeSNgKghe8ztK07/lQIBvavoQmqLjvLuj5pUVd409+pLVl
	2qmI7A8Xa4cSLkoMuY65kU8M4kN8eWSPQ1lesHYsx2sMWox00wM++yldhrLVkMcp
	LLvg+0bJgkMNsnc2HSIPcI9sd5+hJTnzfn4J0DB34MDMNghGqw==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: P3mmxKzet7GL1P3mnxc72w
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Thu, 5 Nov 2026 12:10:11 -0800
To: Jan Beulich <jbeulich@suse.com>
Cc: dmukhin@ford.com, andrew.cooper3@citrix.com, jason.andryuk@amd.com,
        roger@xenproject.org, teddy.astie@vates.tech,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 09/28] x86/hvm: fix hvm_emulate_one_vm_event()
 definition
Message-ID: <auzioxAtHJ1/3MZA@kraken>
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-10-dmukhin@ford.com>
 <421bbdc7-400d-4ed8-b000-2d845ab88e9c@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <421bbdc7-400d-4ed8-b000-2d845ab88e9c@suse.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050080
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PEPF000265B0:EE_|PH0PR16MB4710:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a09a419-c7e6-4aac-3fd3-08df3b78ce72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|36860700016|82310400026|11063799006|56012099006|4143699003|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	F4vj0AnG6jeC3+hurJ836Esj3TD/7uucgEC5vpmqyPfZx1byCxrTvTenelNs/wH9e6DN5TrK+wek3x/jA7sFp8E7Eqf0dwMzo50TE1VKF+v+hkLj26iyj/BT99J/jweadM1xHu0VLzh/ep5DGI9OUZ2/Mds0KvPETBAUOXbqUx5ILXAGZIRpOjRMyLETiNptLGBtqcVnQr7FPPl36Ymrv/wWe+0asx5dnW2XV3t+ReBi68QYbR1p9tQBpaVvFZnWzt/c4WbHSAXAao9E6zxHjvonHt0VD5AJkZJ8XDvg7wGdkuTJhk5jBrEAfgpNAhRyLLWcr9T73292LcJ/tmtiq+g6K5VI+ofkwOPWcsN3zWHGBe4DRXcIHmJSEg+KgCogPrDmnYVX5G4TlqtA8N9yWONvlXpobdJ/XkaSrnYPZQ4GQ4oyWinvzbuucO4ZKQIIu8hdzCRQpa42pm7u1wHSDf9rIa251cWBN+pz5wFabEZytkF3E1vBgHA7RfyytgVBtQG5ugZ+tNmEz41viKDyqhhxaWkJ4f68KHfHuh8HjUouPP1RHmLwuf1b8tfdbweoVTHLKxAu7QL3ACKeNholv0YWkkZWQai4L0GkURw3xRuSMtsrQU/3+lHTk3yhvoqXiKsM6meujQd8N6zRaonjCZdd5yFm6Hi+mwFqzgQYRpAqsphAwBMMQJx8mCEKiIdqAB/q+Z1EXRx3VtA//9EHDQ==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(11063799006)(56012099006)(4143699003)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3r9a1SG8P6FxqxJOgTg8egrQAGdcPQk6k4Ut+UBX7Ufyw4U3HPRb/yJ6MHZ7qD7t6NOmPYpxDceuPK2A+A3rM6rsAsjiF4HRXQE9XXxUPNVgD94DU+7OHhlc/TNaFJ7oyiVeb2pL4nPMgt0yv63UUd+EhhNESg1n5arAZpRqNMyvM2bLCwt5TYem0AygruhO/3wXy+rVFUuPuZgXmIi6v28CzR6bNKleYX8XiLS4UiGNSWP32pYMbM+u/Yul0y8WZ5O1qQoNziOjbSTFKhu8WRgH7tgIudLNCflLlSKC/m7QBhuBsGe2KhiJA1hzT1VQ2ZIsXA0cerVuaHZqpgyDc/zAayxNmDvSCmdroRSTMwzMYgfF+FuhFYU+koDWuns0kck1CekbF1UCv+l3sqJuiY5nUxPQBacix8qrgaE8wuX46/AZt1for8gz9fabUbcy
X-Exchange-RoutingPolicyChecked:
	FpSJxukWGcghAVRz7PH+oaHoXsahXm1wKlFfpTF4XTap5Pc35EGFu0nbWLbjiJwYbnYayEYGwxrIRrkbGxnR5Rm6UFnZ3Lj4Tl1fB6aKGrkwCsVtnU00u/rn5d5m69oKgOEQGmk8KpK1lKEdarDYpXu6uoFZXraNR5QJeffOMngtjKb81J4BKLRXB6xE4ucDEyRf14ScLJQjfftHr2Bzyv6e2bELIgdB7OruPfGQjr5J9ijJmniinII7T1+WHRt0HtI/HGNWEeqfvodOeBumptFVXKGrd6ROqOgtEGvn+qZrPk07iVDIg2HcZ8X4xJpKwS3AK8AAEiNKhI1oP2rKbg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AKpmlg8g2CvqBoDrLFxRGqOL5HfQWAnUNWQIzFnq4zaw9Lp+fsYnJ7fNRhF0fDIxSMykaoXRxlwWwMX4eL6LZhuiEI2EAwb8JELv0LC1xeloWrwm2TpnrsKKzV2SDKZr58Dl0py7e5f3/hZ5PmxHnMi5XP3/ESf26IhG7POAFctknLBG44kPuIZACNrfHdzYim8NU7WCWGn3NT0oRWi76pspxJm+H99owEXHje0tQtOCrShSYWXnDZlcV2u62GgftwD94d4PRskGFBtw8C5oVfVvfNY/CE7nlMVibXTZI8GftqKGqTBd5OtFbQqCbgpUD4m07ezwuy85ZsO02jDN8ppuGtXhVmq4kOc9bTmAunQslIHkGuwGmvsB5/cahtCA52pqFc+iykQh5zy+Y0NyyGEPSbgVicFBsa9aNTe0/1a52VLkSDF4uJtEoHEtyld9DADP0NOC5Z1Ps466ecgFBt0da9FHgFb5jAEq3DdkY7yft+u1DCokt9GNIrSXMbowe4iCJ7P2CILVA/LzSlyXJd1Hw2A6xAuiFoMYaH+L/+qSmz4K9AFaTI8IQL63KzDCb9foKSOBYAk+gCdJ7YZPRrDlo8OA4YGvJRpsFt5YPZqC+iXHV+k+3aTpp5GK+Ll+b/p6cjiP0UoO05+xRUNKqQ==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 20:10:15.3004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a09a419-c7e6-4aac-3fd3-08df3b78ce72
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3PEPF000265B0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR16MB4710
X-Proofpoint-ORIG-GUID: UOOKT-mkVT6JynH2rayiDWX_9H_Q_65u
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MCBTYWx0ZWRfX6FD3jhN2d1gg
 eJrcuogu39ExzqHmWCQdRdIMreJV1q04gs3+7NDVa4RGOZCGURbKDNHZg6E5SB+2iTGvQowQVw2
 bJ0/gnbPomerOwuXDFRJHsPGu6uKup+YTUq39eHspNuDWm+FHlj6
X-Authority-Analysis: v=2.4 cv=QfjzLcbv c=1 sm=1 tr=0 ts=6aece2ac cx=c_pps
 a=dDG42FMqTjgm/c7QxIpGBg==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=vnUQfov-gS4s1L7hHvr-:22
 a=cbNQJ9GKAAAA:8 a=ADSr9sXkiUwMa2rtvkAA:9 a=CjuIK1q_8ugA:10
 a=DqJYxgmhk6moR-_7_KoZ:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-GUID: UOOKT-mkVT6JynH2rayiDWX_9H_Q_65u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MCBTYWx0ZWRfX6LngpkItUk92
 ZyhPhjmaPKCxKiHt2HtA9H+KqxUyJrWuGk3Dc9OHmM+LUa2lhAuJ4gwDqT1xKq1Og843dJsKUkW
 M4cpQ0rlsApcj4GhFqUNSGA9u2s8dysGy5F+gY/uuKCTm8KJZu6VIiy1eZEcHD6207e1bZbmfOn
 2igB69SxqkXo4qn8zAEbf0Ocw5imTu8kWuHU08/B4d6HedPFfx0OG36QBgWKqFDwp+9hIyTrGds
 CiITYsz0gZ6AG3ZjnSQWyWwVjShNfSCTyfDIPvKSqPrlUFmM1JUzxqghJirEKoZyG7+N1rucAYJ
 mciI02hRhJHD1ONSz2qE0xraXvwpDMvzYctEK/Itrl76jRBRjGMh+p6MGXhkfBtegkS/yRYnSbZ
 PXlDWHyAtiKTbFlDYIwfATWF5NweC6xBhzWetdqhuo28C8PvvyBqUZn5vYf5b0f3voV2PYEtZ0b
 tBCiLKy/8P3jNn2XJRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050080
X-purgate-ID: tlsNG-d62444/1793909422-1DC79757-1BF72C8C/0/0
X-purgate-type: clean
X-purgate-size: 388
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 09:30:02AM +0100, Jan Beulich wrote:
> On 05.11.2026 02:33, dmukhin@ford.com wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> > 
> > Add empty definition for !CONFIG_VM_EVENT case.
> 
> Which is needed because of?

That is a fix for *-randconfig runs with AVIC series:
VMEXIT_AVIC_NOACCEL handlers can call hvm_emulate_one_vm_event() 

> 
> Jan
> 

