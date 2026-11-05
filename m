Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8335606A326
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=GQLUnvPP;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=LngqwtMH;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=K1mQyhsn;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=Jbv4/wiC
Received: from list by lists.xenproject.org with outflank-mailman.1473598.1681270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmSa-0001OJ-Gz; Thu, 05 Nov 2026 01:40:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473598.1681270; Thu, 05 Nov 2026 01:40:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmSa-0001O6-Dc; Thu, 05 Nov 2026 01:40:12 +0000
Received: by outflank-mailman (input) for mailman id 1473598;
 Thu, 05 Nov 2026 01:40:11 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmSZ-0001N3-42
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:40:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmSY-001xd7-Ct
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:40:10 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebde1c-8faa-0a2a0a5109dd-0a2a4504ca8e-34
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:40:10 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebde79-b57f-0a2a45040019-94a38ff174b2-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:40:10 +0100
Received: from pps.filterd (m0367128.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mupM2612052
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:40:08 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com
 (mail-northcentralusazon11012068.outbound.protection.outlook.com
 [40.107.200.68])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hrdw8rw9t-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:40:08 +0000 (GMT)
Received: from BN9PR03CA0656.namprd03.prod.outlook.com (2603:10b6:408:13b::31)
 by LV8PR16MB6305.namprd16.prod.outlook.com (2603:10b6:408:1bc::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:39:04 +0000
Received: from BN7PEPF00000094.namprd03.prod.outlook.com
 (2603:10b6:408:13b:cafe::3f) by BN9PR03CA0656.outlook.office365.com
 (2603:10b6:408:13b::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.9 via Frontend Transport; Thu, 5
 Nov 2026 01:39:04 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 BN7PEPF00000094.mail.protection.outlook.com (10.167.245.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:39:04 +0000
Received: from pps.filterd (m0426315.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mM4E3108343
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:39:03 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4hp33swb4q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:39:03 -0500 (EST)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id OmRQx1HWxgTjoOmRRxgqva; Thu, 05 Nov 2026 01:39:02 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=BDm
	abGfQnILh3U1P9bmeX8e0pffiRErfGCa95EvFXp0=; b=GQLUnvPP0njQel/u5MC
	SYM1I7KAhdGtLKMh4L9VV/IuKwvkK9y1W+Z1bUa281Vn+BHa4oZJ7KIGJPDXsah8
	Xlaa90kT8rcCO98yb4PuHVKGMPoEmr5lIXJ9N/5ReXrD1xKqW596eavId27ClGyP
	P69BKNKOYFQj5tKt3RPabZK8pEPkYblHhrvVMPEhMO+FS2MznqTavBVRBcYFB/sM
	KWHzroBFQtXP4OoBdPZI4VjN7UpT6uo4/U1iueEbP0n7gYydC96JPIcyMdTfwHDB
	D26/kuO1xFX/D9AVluYpSfIAPesfgABkmfdU23L13FYFel/a2s/IQtkoq5qvpz7n
	1XA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bEFJ/BDNe/Y81i09kPocEVSWroveaHRDahaomo3ZvKP+wu7S+c/kKi632rfCGQfZ6o0GttnRtoQgpgOvEFJ9bQOJ6yHD2StJ4AVBrlqy4LzBvnpZo+703ugpsQ+O3lLd1ZHav0A8BhkPGwhlg0kWVcr26h5+ngWCt5W+VYP4Y0p9gGsdAU2y8dTX19Ao2gocSyjqj1a1NycnBRRcTexAC0xfcEj+ZJr2TO0bKJH1FLC4KMv3Zrk1gnrAorFHkmyb3sCAmNzmGEongMtgAxkzug/HQW1cxnqig9m54foI58ZGbVgmUajQvEbUCN/98wFGI5KdYTOhaJKMFlE6lG9I0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BDmabGfQnILh3U1P9bmeX8e0pffiRErfGCa95EvFXp0=;
 b=uDP7/x6TIw3btVjmkMU5oH6z2U1hGz1dFe4G+8mGvRCtXM+V8oGVvZhMF/FI/5Jr+uHcd+v1mUzuQkcj0yIj5A3nSOP1RaB0bmXPb6dqVUkYRxX/ff9dxe+2ejp+U3NGDY5NqkCu9giREE02viTfg0Ubq2ZQfy3nU4tzuwZA4zphFeU6RbdbCBHzfUHPfTLKfKXR06jdpXm41a3/NPS8XqsZ31ChzTsAtpFg3OGmPl7541KyTspD6ME2ogWA/J79R8JLLtVsYtRjeSq5Gk19c+3tb1o8b+fdQlIwvJwJ5Vev9FDtgyI5thjILcsnSaCB12/4eTNft6Anz8U+2PoNZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BDmabGfQnILh3U1P9bmeX8e0pffiRErfGCa95EvFXp0=;
 b=LngqwtMHYpC1+zQhII/+owKHZwvVp8WnmD8e+W95YPJe1VHRIk3xTmqWfHiyaUijG9R01Qet7i/J9i8Pq9ZH5QjBO6nEf/Lkxpz8F0zccGiH/ZLQEvp9SVURxgGoTYJzGWZ4yTwUWl8MV8Bjc0ycdEa50FXxT/0R0qkR0tDOMgs=
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
	ppserprodsaar; bh=BDmabGfQnILh3U1P9bmeX8e0pffiRErfGCa95EvFXp0=; b=
	K1mQyhsnJJovs1VYmeustH3Yqi6ynbZ3vg1HSUPYOj7wYyq39zHp+9koHPoftzxB
	cUryl+UcVeBW8MX/tB0Hz9geLsovCznWXC0zWaGGxTmmCA/vCIXr5coC15vYRv3U
	3v/wxf6fpQE/TsZh57d1gfpobOdZM8tVoRPr1pPQIJl4uG79tRnkn8TJxnfLLzW0
	TF/wmdBas7AmtvcaGq18ENgkgjW9zaeb1HLyQxApEkib6bqBULzUE6zGh+fJ+p3/
	9Ho1fWqLdRqJTgu3UdEAzPIjI3xpVNKRvCvJAXrgH7hsBPkpQXTJM1kZRSWxXhHA
	qswC+WuwkbfMukeATAtO9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=BDmabGf
	QnILh3U1P9bmeX8e0pffiRErfGCa95EvFXp0=; b=Jbv4/wiCDQWCAb98EXahxkd
	eNdPL+XbnRdVAv6hlB79UKM0w/RBJzIR0W1nDDpoSt9YSHlb3kJqcaVMmLcte0En
	sGaigY7P73Y9vuVadyWy2GJX61n5KHnsLW4228jaSVfr0AIfUxoYg5R4Qz3Msfe2
	8uKw3UtGV+kE588aV6hDIEsu1tyImJTp5KMGOM4wKDeHUYvLlYoW/KqMUHZ10Y5G
	0FR3unkLCsB/c2VvHTC8KhhhQKkX/8hWidSCioTDlDgV8esZqrn0aLaerNCMzyjr
	g32Z4ZzI7F8YN0DhMM/XIaqtNP5up3b0d7Wuz8FRifJwaCvJdN69h8NxrDEtf1g=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmRQx1HWxgTjoOmRRxgqva
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [XTF PATCH v1 14/15] x86: apic: add few more registers
Date: Wed,  4 Nov 2026 17:38:16 -0800
Message-ID: <20261105013817.719823-15-dmukhin@ford.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105013817.719823-1-dmukhin@ford.com>
References: <20261105013817.719823-1-dmukhin@ford.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050006
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF00000094:EE_|LV8PR16MB6305:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a9da4333-ef4d-405b-a736-08df3add9364
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|23010399003|36860700016|22082099003|18002099003|261009223027099003|261021121427099003|261022105027099003|261026140227099003|11063799006|56012099006|10067099003|261028144727099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	XBj9OERz844k4q8LAwfAqINEPMBq2OWGaGDpuD1P7dZ+rT/O76Z3hBQDNO9C2JV6ElA7itxysn/Oa3Mmio2kgiMeKvsrXsNqK+lDAMl2TO34pWJjlTBv+PPMP81fcyTSc32/nUE04rdswsIkjLZViDq0dFAB4FUUSm03GGiV3eAmglOS18StHWZIpBcf2V8l4J9P0RS9bzGsaeRroamkouII8drvnU24PhljL1k2sY6Wczcq9y/gikOI51snUIHVhJ0QCoZAAXVUcB2WVAYSi+TjwS8jS3VjVV2vZ51F7qZKBPR9cBWk0vc/A3ZW2vCqjzjr7NzpuXxfHHQxX+Sb62Eb5sCIxjtW+x6GIfyK3OK/jjQxV1GQCfBQHAMottKCoMaY1r/1QnAgRV8BHUnDGkRPOUYJhJyuYFpuutUAP42osyEc1Ucy1bTtc0ZQ0H3SVqkldLjB00Pds5BG7RnwsWgUPeDf9RhoS17v206ekgmWGacG/r2GweT8ZiNYbk6iRg54NvuOrsNPhNLOGkOZI/sjkM7a7OynxbyDhn5OXKt/i0ww1qtFBkWlG/jj9Ld6oIdS6JsVQsfsbd/JmRnm31kXs+D0ErDFODMvBildKbzAE8cjsqBYTysH4W0svQqx6VOr3D4aU/vZKwmd1UrL+CkoVugsLNSQmtHB5h5SGzn2cXWVnaAYoYXHBSUsTjwcCbbrOyI4+xgZFc82I0ld+w==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(23010399003)(36860700016)(22082099003)(18002099003)(261009223027099003)(261021121427099003)(261022105027099003)(261026140227099003)(11063799006)(56012099006)(10067099003)(261028144727099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TW0Goc3oxaPx/eBB9jdtICQqCc3acGGS84oCQXu4Pd7Hen5L36OJ5BlFBnkGhLV4XygKGCCcpaKmTZJWHiOZsjWEvuFhbUdzh2/AwUC5CIZ3VaLBdHhJCAuyq9lXNVCnMaxPkhxIAy9TZ1qHxrbDRj1cup2B43RM+FngPOtwbgLFYCMPgY2ACDESwJKQ5wdlrhXlwDn0yG9TCGLKlmBK5hkXWDpkUzHNLZbByU4q3hZO3JuIaBZFdVYCiaa+HwDgtZ4u5ALDPAhyduo1jA1yXd6cv3/iDioTb5MxhabmOMeFVisz/pXEMzWy8I2YP5C+CpDgx72p61xXnfjoGL09KQb1zY8XXMxNkX7WNEuhUksOHg09qVeLm9kzBWyQ20xkKwmfZ/52peujnPy4EGEmg6hWJfNDJbFhYYnmiYE5fmIq59qHlqhtr4DUgbJR3nO6
X-Exchange-RoutingPolicyChecked:
	d53I9eKLhTKQeJtGXaLqcwltEc7EtkqxT3urMeswC/iT1NkQ92BhwqdHO2RBidlgdf66y1+uC26VbcWEASTrigiVZ9oidbvbgcF7G5nj2ahtNOqoPZn2JKhWg2s8Mt5dk7hPGvaAPTfTsz1739mDL6pDXWRxPl1GiMhpP4KOZct8DZ2JY1nE1/FfpNnjJd2NMMBpX4t0d7pv2u0vk7iOHYTBEcrB/r9WCx1kzeY0h0A+hOX4tCUyp3GCg82iJBgFkS8usTX5kcnyj2J7Do16VLeJ040KJcl6OSzVHkt1vRTbuSkmhNHbg/RMU4NdGg2vey9ExvWh6eZUHz6nHJam1A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iFIVGx28kM3o9DFt5a9bjHoHC8ULLY+8Yi2cOrx7cDEDt4/fXsfvkeFz4F9oc3zhfAgadXwW77dkCuGfYttjMumlSVlfe2naXWgjpazzX9QT/EeMXF94H4WULSkQhN0lqcQzSzAm7IZuHp/Z5GJs5Ny6IqgMy3qnHN+Po8Bh9SWxntmkyNt0g/nrVSppCJdvRLGhI0VkRVsUxT+eIOIE9T7MSaN2Ikm8JGtAWI11tMASU7WRJrUD66OAVB6oeDA46isFcmzwlqjluClbwgU0mfAn9ensFrLZ+fSZyyesmD0bOIM8T1qxqTLQjUn0N0QbMwoH0goBT5ZLAopKS7X6Th21scSEzSKdR/WbD0D4rdRZLR3Wni9V7gIAvJ3TkgljmO+7RT1tBhV9sbSSDO8l5O8HADVLCmufV1qWClhq7avtROx62feky9G5Tju22sMlJ/YvCYIqK14N/9y3IoILHaWIwMD2jhO1n4+0Pae4FghS6KFpDco7DirPf4vN72sITMcom1a4XjkMZ0J/NqBTkg1qMSBno+lZWQDKtrnxOLrU0K/guQKFp7LPg/iZIEzxbsR/fWu6vFBQWNON04AOhtDohNXPpKQz6cPc3k48f9kN0dMWziV2H9WDGb5ene5+R3huot3y8n8hXlkKODeEaQ==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:39:04.3922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9da4333-ef4d-405b-a736-08df3add9364
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF00000094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR16MB6305
X-Authority-Analysis: v=2.4 cv=JPiuIMKb c=1 sm=1 tr=0 ts=6aebde78 cx=c_pps
 a=hdF+edV3qND9tYm1xB2jJw==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=WER9OelvoqQQjwJToBYG:22 a=cbNQJ9GKAAAA:8
 a=oPC_3ZP6ZZf3ktXkmvMA:9 a=P0bj-C3X3jJDpopQwM1U:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfXwWmZUH4EO8IN
 xWiW1TTnRhWLPf6mdNv+HKeyBWdwiqqU4n0CjUK/JqpNrn7QNTfZ5y3OISMTgawdcq2pbAPY+9p
 /WDulsvGAUOCANiyebiSCErf4nszo4NfHVFgd4MNoQb7B2sSyaHl
X-Proofpoint-ORIG-GUID: UmexJFntBELCuqD9TyApYI7uuypCG2gG
X-Proofpoint-GUID: UmexJFntBELCuqD9TyApYI7uuypCG2gG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX1nwyY/TguEG7
 3Mt3m65aU98Wlb26a/zcvvEMDrIOBXTAc9hfwH8qb4WlX8fPAlu09HaMQOrB4B3MX7oAyM26pVr
 lL4/xTV2sYt7Gp2j9h/OGi8tulBTyOyoS0wxS7FSg9aJu1M4hh77ZLtEtZdde31DLPCRo01aEF/
 GjIaEtS2KrMnEn/MFMDnzum1FTraTgxqjxNK+cfiYgqb3H5FEQ9Z7rkO5D1HNqetbZXHKYq9JVr
 gmZWFF5x7naSPsB9/yLSbJ7AKQYl6N26QggEnu3svxH6aiM/GdXihuiFMYSMblyhY1lP7+taYvs
 tY9VOCD68y1CRdEUa9Ne8dpmdbqv44l8TyaxczlTQNtLXcIGN0tVZ1insZIjlGO7TO0miBYUHEX
 +3+53E4e70ao+seHishSeDS17vNyVS9i0y4VXgYR8RZvPr2sswoS/XwzZ9xGQ0o79Esf+IhCL3P
 R2yuh1/JtDzqc/WdhxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050006
X-purgate-ID: tlsNG-ebf023/1793842810-C26CAB50-75914A91/0/0
X-purgate-type: clean
X-purgate-size: 1808
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Add few more registers definitions for testing: TPR, EOI, ISR, IRR.

Add routines to extract APIC ID from register 0x20.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 arch/x86/include/arch/apic.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/x86/include/arch/apic.h b/arch/x86/include/arch/apic.h
index 71c09a836998..8cf28ba5a39b 100644
--- a/arch/x86/include/arch/apic.h
+++ b/arch/x86/include/arch/apic.h
@@ -17,10 +17,24 @@
 
 /* Local APIC register definitions. */
 #define APIC_ID         0x020
+#define   GET_xAPIC_ID(x)         (((x) >> 24) & 0xffu)
+#define   SET_xAPIC_ID(x)         (((x) << 24))
+
 #define APIC_LVR        0x030
+
+#define APIC_TPR        0x080
+#define   APIC_TPR_MASK           0x000FF
+
+#define APIC_EOI        0x0b0
+#define   APIC_EOI_ACK            0x00000
+
 #define APIC_SPIV       0x0f0
 #define   APIC_SPIV_APIC_ENABLED  0x00100
 
+#define APIC_ISR        0x100
+
+#define APIC_IRR        0x200
+
 #define APIC_ESR        0x280
 #define   APIC_SIV                0x00020 /* Send Illegal Vector */
 #define   APIC_RIV                0x00040 /* Recieve Illegal Vector */
@@ -126,6 +140,21 @@ static inline void apic_icr_write(uint64_t val)
         return apic_msr_icr_write(val);
 }
 
+static inline bool apic_isr_read(unsigned int vector)
+{
+    return apic_read(APIC_ISR + (vector / 32 * 0x10)) & (1U << (vector % 32));
+}
+
+static inline bool apic_irr_read(unsigned int vector)
+{
+    return apic_read(APIC_IRR + (vector / 32 * 0x10)) & (1U << (vector % 32));
+}
+
+static inline unsigned int get_apic_id(void)
+{
+    return GET_xAPIC_ID(apic_read(APIC_ID));
+}
+
 #endif /* XTF_X86_APIC_H */
 
 /*
-- 
2.55.0


