Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247B4606A332
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 12:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=G9Ykkhyz;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=Jpv5gyLg;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=SAE+FeDp;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=otTDQfbW
Received: from list by lists.xenproject.org with outflank-mailman.1487424.1689864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRqF9-0006Wl-OY; Fri, 13 Nov 2026 12:18:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487424.1689864; Fri, 13 Nov 2026 12:18:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRqF9-0006We-Ld; Fri, 13 Nov 2026 12:18:59 +0000
Received: by outflank-mailman (input) for mailman id 1487424;
 Fri, 13 Nov 2026 12:18:58 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xRqF7-0006KD-Ap
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 12:18:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRqF6-0053sB-Nl
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 13:18:56 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af7002f-8faa-0a2a0a5109dd-0a2a4502bf10-8
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 13:18:55 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af70029-6ca4-0a2a45020019-94a39217d9ca-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 13:18:50 +0100
Received: from pps.filterd (m0482516.ppops.net [127.0.0.1])
 by m0482516.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6ADBwuPV726725
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 04:18:48 -0800
Received: from bl2pr02cu003.outbound.protection.outlook.com
 (mail-eastusazon11011049.outbound.protection.outlook.com [52.101.52.49])
 by m0482516.ppops.net (PPS) with ESMTPS id 4hx0xsrstv-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 04:18:48 -0800 (PST)
Received: from CH0PR04CA0031.namprd04.prod.outlook.com (2603:10b6:610:77::6)
 by MN6PR16MB5353.namprd16.prod.outlook.com (2603:10b6:208:471::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 12:18:46 +0000
Received: from MN1PEPF000793FC.namprd05.prod.outlook.com
 (2603:10b6:610:77:cafe::6b) by CH0PR04CA0031.outlook.office365.com
 (2603:10b6:610:77::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Fri, 13
 Nov 2026 12:18:45 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 MN1PEPF000793FC.mail.protection.outlook.com (10.167.249.199) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Fri, 13 Nov 2026 12:18:45 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ACFcflV035161
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 13:20:50 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4htkgbp8hn-17
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 13:20:49 -0500 (EST)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id RZPixLxYkQVyyRZPjxMzYu; Thu, 12 Nov 2026 18:20:49 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=iu8
	8BXIsjZUIxJM2ma9TdD9eNdYGgctO4D7rLHkMF4k=; b=G9YkkhyzgCQENpI4zWq
	mdRgJG5PmCeiTDXWnqtxjbDr49OmtdxUW8L8QaC2b1RZHoHUQoAWl6pi4DUBiUc2
	Hy5ClzFfqRu2OV7Pd9aVlHSN/qqdn6gbb3e5ZyoBovg3nj8sDqpRcKXlQv58YyTS
	/cHrGk+tRnRMHPlx5KpiQrr0XGPKygXlIkKnoGhhxEXd2E62x6HLS4ng2Cw3OTVK
	offEmOVz79wcHrjSBXfO2T5NYdUEkLGWeKtgVrJ1z3X3t2VYZE8TUU/+2hDDhbr9
	pkXKIHjCyvxdNT6GoyAPQH1OtIFsgaRiQhCZ6qwQ3LxSBCoPYQP1savLl0UI5Kh0
	A6A==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I4A6YtH2G9r1lJPAFIMGDHraA0AH3UEsCzda14EDzZcrqZCS0UX4cR6Duk5dpmvRTQqKzxHGBkHcw0mJhVRkIuwu0GDq2j8LmdM/n7xrO4374Uzx6NQsClSuhvnunx1vJmZ4M+bfXIsg2VpyYmiMHo9uOyiUyPZ08obuqcQu23ci/qHu+NC8+kUA23g7rsfM+r02Ydko7d3gWIew1WN04S2RrgbFVa+gLx2VMpEz2NSToByzg7YQeFEeofLYlSLLmu7P7ugp9BmmxQmjSDtp1EahjMxZxrbowalxm/lki7692H4WZJwF/HRv9IpFiPsnKq8hI2Syq+i0wIgB1DJKUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iu88BXIsjZUIxJM2ma9TdD9eNdYGgctO4D7rLHkMF4k=;
 b=DqqxyqgTYrk00Sk5PnMPRQkS8V+xUT9BJkg5JfJi30WQtECZ9NO9gMRj6W8qP+tfo0DSqWxRxtXKlA4+7sjidnMeC2lHmP6phTtMRtluK1pIcrcmuje6FuRJH1PNqeRQdvXgF38eAZ+90myR0JYZ8zTjyxBkMOuQLD2sHgsVZnT7ZlLiX6QA6LMETCr7/BctnbPVdHdgg75HRCTONByhoD8Y5CODGZnTgnoW0kdPd5TwfrtcBTI4GlJ7rHsG/HLQMKQZpqd7DMAWBTcMR5hXIcmTvXTIA2FeZ/12WZt3V6X3NmpiIDOyda2E2BpO8Komz6+PSnmY23z6VnxdhDTrRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iu88BXIsjZUIxJM2ma9TdD9eNdYGgctO4D7rLHkMF4k=;
 b=Jpv5gyLg69HtUB97cQ/jZaRd912p3+AqdpVlqlaC2eNCfls/UjzhBbBe6sMD5+wVG0E1uWmJKMX22On8jaChK2/MutYEiXxvUMa57+JxcHK5yw/uHlR5vKTUT27KbG7WlwsHR6wige/w6seVRTcZSYEgt4eCXu9XuLAGvdbS5Ug=
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
	ppserprodsaar; bh=iu88BXIsjZUIxJM2ma9TdD9eNdYGgctO4D7rLHkMF4k=; b=
	SAE+FeDppnhjBsFCamV1u/FwHKLlKaV1/GoKm8eVE8TtWucQczibjntvtE+b2ddu
	gfTECcvJAvtBql+RCnKoeoAhSh/fD1vCTIsqEuAWfHN7VSiHfskgLyc9xcVEqt+4
	PYkOpmX5/opnRIMBW4PlTlWQmLNYAspCTuK1gcUMQEardabgcbrHG6iPw2fGRY2+
	w9RgQgW2Bixby/IYvEzQQZPvlMMZjghuRGuMoj6piDJP1Z5gE0tz+nDqbvsx3Mio
	GVKVaDW1GNms43TEqir9avEZEvRv6vBd3vfIk1aICeAueqQIxbf7JE7E/V8c3XYR
	L/abRwPBWsW7g+//UN2OQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=iu88BXI
	sjZUIxJM2ma9TdD9eNdYGgctO4D7rLHkMF4k=; b=otTDQfbWtjVv7BL9GuynMFV
	H6c2R75g+pSzsegLzZtrvo4+RU/Y1Gs8qe41T1n7FN5DA399OdK/A3Upz6FX5SWG
	Oei/VwFg6PU3k9o39Y7yew5c1zpEXvIVGLiNR+j+dImentQaXjEChpfEMUfoJCil
	6HxHmTjsOIMjbJGcjMc13Udzd3+3G+sGoXX3tjESH9oWhrxse3WNUBWVDCyhh4GK
	4Y9+78VwEyNaFPLTYKt1Pu6s53X9Q4h0FzNFr6VI60OAKMNPr9eI6MFapii0F4ru
	x8i+YiX0UPnx5mkuQ8kvRKcaFXoe9xUAH3MIqXJS1GUboazQEYh/5d9VJwHM3nA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: RZPixLxYkQVyyRZPjxMzYu
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v6 1/2] xen/console: add build-time rate-limiting controls
Date: Thu, 12 Nov 2026 10:20:41 -0800
Message-ID: <20261112182042.1104699-2-dmukhin@ford.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112182042.1104699-1-dmukhin@ford.com>
References: <20261112182042.1104699-1-dmukhin@ford.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120072
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF000793FC:EE_|MN6PR16MB5353:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a07d3929-aeb0-40b5-01bc-08df418043a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|376014|36860700016|18002099003|22082099003|6133799003|10067099003|11063799006|261026121527099003|56012099006|261102123227099003|261028144727099003|261022113327099003|261022075727099003|261021123027099003|261021121427099003|261009223027099003|261022105027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	8AOVsvKHPlESMz8LAWvs3le9PuXHsASmeucZyhWsPlvnycNpOzEV84XUvEdesyEgnUEoKBOFuNLHGm+BXWb9PaN+6FYomW3A2kIu5vMj2qJNBBLTShO41vQZ1qqa8TnciFwWq4d0UDALDgemw3xZV1PCwpgUrBMDdbqmSWBMGePP71Cbq5xVfplqYj4Ok25yKmcsSMzNlWHk56xExyFmtWD681TBhBLNkeVlHvsGVfTAfoYXsJkTnKcbFpjH5XkauRTPLkwr+hdqpxgsWGVy7NhX/bRTPamJ1JFtZz4lRNM/wkthW/r8Xw+Q46meSVInZKbvYu+IQagpFuy9GqQQ8PAPgGPpaZ0TrDiO/v29VXHn6Np0sWA+cdqYfN2gNmUXSMQJSSf4TYZKIRtGgXSFL0yRCmgTCw7NgjJwinVQFS05GWY06ZtuXCbKBI9EvEJx9Xh56tfQ4n9NTyCiWX3Zyu3a/e0RZokxu90qFzVM2+pR9VdaErrRM6FpPnb2ETocbb+E+IpqbGP1N9KmYs0yF3oZckeH3bFTXYUr5yeIkAiG/qYoQ27pMXDP3A+3IYXX2LUviAZTgUqTU9ov932B3ti4mzANzZtVo0ieVmnH58kTvIttLsepMiKLGoLkcC0QXiZszg7dP/P1vCAExeDKuNcHYmZYpODqesrJtEjeegsuIqLXIycxMLKS9awLAdH5sTUJUocfCdkzTU8IhbE+JA==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(376014)(36860700016)(18002099003)(22082099003)(6133799003)(10067099003)(11063799006)(261026121527099003)(56012099006)(261102123227099003)(261028144727099003)(261022113327099003)(261022075727099003)(261021123027099003)(261021121427099003)(261009223027099003)(261022105027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HwrqEYzQ1gVG09m7cR7GsWKOQiGXd4u0OB3vrlkqrOY3VjzAJxBFCaWie3qP3H9bJp3Fwgkz4jzyS1L6yo1qT3q46mFWWapT69KLKt3ZDQ0C2OJRqU7K0vDLnNlUtgkC3Q3cQ1WVNJLxGo5X0yyfvxijpDIdI7m4bn5kPBlHXtjZORZk+RiKAJKMrwj/nnV4yJQ5djfb5RlgBH85AKoWABj1Clo33iPBRZkhSMzckc5IArodis9QNLek4TvBjfNXbVHuQN12LCoEEUCBSBCiYDmryX18z7RD6eVONAVum9MnWanV9SLEBtJvazsMtFaK8/Fp9D186IWya3GHHX/gbM3ky6bYDiWyQCeGOjzsBnxbmCjTB6wYKmp4JNSj1IxqKZce92pCR24dgFqTIyMGbFQBTp36Nb26OsgNmSZYVGEkR85Gnt6hjOImkdtf/ult
X-Exchange-RoutingPolicyChecked:
	dsFJigSIkwRbx6dO4J37fdvSF8KG01zNkJp35T5K9yRtKMLJ9l99ujEdtEvwMQLz1wx+ckWLctEYRjZljOlwwwDIpDkivPxKodCuqkZ/lPYm5kQBqZUpfWlP/uwu13belAncqcf2eE9SWW27GQqqolKOv4LgtooRVJXIpqfSNrCPyVd4cD4fu9GG0P3wFpsMyHF2YhVwUUPnQZsC++vj7ERwmct37cj7PZU6SdC7Ivc2qSIkoxFadFc3EezpTF8rJBS6ytAf7BkRsyREqvu1GmJy/o69J79hPSyPqONyEY+/PX2C8Eu0yM8cmFL+kVc9G7aMppCpp09dPduD4uwmCQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iFdocKYOI+d+68cpXyprQ68dhnDtwIK+/YBldb1r4MMT7maBqpVI8R4320EBVIu5ogIim1vrCknJVEjLLG52eelDReXTfUuqRDpiyZ4tsb4AQz6CfQa7DKUszFZhoask8V/1iswtxf4EmfeVHZZyxn1wYpLdwqmdwI4INK0WejuQSub2pxfMsGH6u6ZRaPbx4sR5vFKY3zGwxcVwytzGtf/FlFVNg1Nmg/0UTOT7NprAIsCeRbDuTuas3GiCW1oQtplV9tYoKi5VSHM1h8G3Ce12ih5DBpO64sXvT4MVuMceqH7E8JHM1eazLpWzWas7XwURv+QPy71T1UIingPkTJ5xtIAT/kyY95t3SPZLz9VdwBofZt1BF1wSQjTNUKyxna0Y7rAFNm/3IsaaYIWo4RbkWzT+3i+PItMZ60iLP2944F6HREQRqKB4FhkUFDwSn+bTXRCwZkFQkL4bCjzeJbt2K9REaCHDCJdftcubu/3vRwJ0cn34+Aa3a5SZanDYsqEdnZ03McaplHLNU2HZn05Uu9u238B0y3BAji/zWlc4ETg4wHpholKei8OUEW256Po5ybDqGDMPZVBIXgy9IGEJCGvFogFxTRMl6nSZ1Ur2ewlVWWx17Ii0rZmdOWxzAAp53c97PM7yLqaQkbXgpg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 12:18:45.5654
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a07d3929-aeb0-40b5-01bc-08df418043a9
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF000793FC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR16MB5353
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfX6HaoxYPnlqm+
 qVRHzJIAajY5Ht68sMSq5s4BHwQuZroMSmb+t9KarjaJAowI4SO2wIYzyDAbZdIZwaEKIjBmB+G
 kC08lNufw2bMzBpZdsClSrTRwlEOKN0d+4GMm9GjIjH0SHbXIk4qubob12I/ywz53WahtYekME6
 8OCa10l9HnWZJlPF5iK46aka/AqrmXfUGbuZs/YsFPCKa54lIiRWKGC5O/RXo8Rswuw7JvrX+zN
 qChlmuQfXDx7WrdG+7eEgBESS08X2bbg0t0AXqg0w+FLMdRXuqULFW7Pqi0lns//oO5mTDqggkG
 amJUyZghe0XXa0u12uGIJSjZaw7fIgqg52xcaecLCN/v/URG8WQieX4eLlWtseNTABU34SOkcoc
 Wux/Sc2bF4eYwAUsAEoezONt6sRZF5J8Jr3LMi+mzyVU87VeHjRExRB9bWULmgk+0jE8z1hIzZH
 Gnuy7+Mr2FpFJL53BGA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfXx66GiXNzMKDj
 xXmoMT7oYmNP+7SszxLx5kNcDK6J1aQMF2LGCeQ0JYhkh9i9lkOqMwnIZUtcViRdP7mfjSfFZAA
 tT9cQJLdmULXKS2YN+RO/X9Pb6BlXAxrtoCwNrhxQFuMbYGZ7zhw
X-Authority-Analysis: v=2.4 cv=C7h8WgP+ c=1 sm=1 tr=0 ts=6af70028 cx=c_pps
 a=23BBZRleo/1KOgyGqX6yRw==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=NvsXeTrgx-CJMFV-xl94:22 a=cbNQJ9GKAAAA:8
 a=NNVgaHFa0Tc0tJPwRXQA:9 a=DqJYxgmhk6moR-_7_KoZ:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-GUID: ad2Q-qFiyzcVUTZPmksrbKsuYDqYsEPO
X-Proofpoint-ORIG-GUID: ad2Q-qFiyzcVUTZPmksrbKsuYDqYsEPO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130048
X-purgate-ID: tlsNG-720697/1794572330-30FCE2AC-E71F5539/0/0
X-purgate-type: clean
X-purgate-size: 2559
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Introduce CONFIG_PRINTK_RATELIMIT_MS and CONFIG_PRINTK_RATELIMIT_BURST
for configuring rate-limiting policy at the compile time.

Use symbols for global rate-limiting initialization in the console driver.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v5:
- updated notes on security supportable rate-limiting configurations
---
 xen/common/Kconfig         | 30 ++++++++++++++++++++++++++++++
 xen/drivers/char/console.c |  6 ++++--
 2 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 5b289e444fa5..539cccf21029 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -675,4 +675,34 @@ config PM_STATS
 	  Enable collection of performance management statistics to aid in
 	  analyzing and tuning power/performance characteristics of the system
 
+menu "Console rate-limiting"
+	visible if EXPERT
+
+config PRINTK_RATELIMIT_MS
+	int "printk rate-limiting time window (milliseconds)"
+	default 5000
+	help
+	  Specifies the time window, in milliseconds, for rate-limited printk
+	  messages. No more than `CONFIG_PRINTK_RATELIMIT_BURST` messages will be
+	  printed within this window.
+
+	  Setting this value to 0 disables rate-limiting entirely.
+
+	  Rate-limiting configurations within [0..5000) milliseconds are not
+	  security supported.
+
+config PRINTK_RATELIMIT_BURST
+	int "printk rate-limited message burst size"
+	default 10
+	help
+	  Defines the maximum number of rate-limited printk messages that may
+	  be printed within each `CONFIG_PRINTK_RATELIMIT_MS` time window.
+
+	  Setting this value to 0 disables rate-limiting entirely.
+
+	  Rate-limiting configurations with burst size larger than default 10
+	  are not security supported.
+
+endmenu
+
 endmenu
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index e4df0bbc2eec..1a8beb6665c1 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -1330,10 +1330,12 @@ bool __printk_ratelimit(unsigned int ratelimit_ms,
 }
 
 /* Minimum time in ms between messages */
-static const unsigned int printk_ratelimit_ms = 5 * 1000;
+static const unsigned int printk_ratelimit_ms =
+    CONFIG_PRINTK_RATELIMIT_MS;
 
 /* Number of messages we send before ratelimiting */
-static const unsigned int printk_ratelimit_burst = 10;
+static const unsigned int printk_ratelimit_burst =
+    CONFIG_PRINTK_RATELIMIT_BURST;
 
 bool printk_ratelimit(void)
 {
-- 
2.56.0


