Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F63E606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=eevnNSJK;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=ljDLnr6B;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=g1wiNb/n;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=XAnvq1Ek
Received: from list by lists.xenproject.org with outflank-mailman.1473389.1681064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmQ3-0002Ax-VS; Thu, 05 Nov 2026 01:37:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473389.1681064; Thu, 05 Nov 2026 01:37:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmQ3-0002Ah-Nf; Thu, 05 Nov 2026 01:37:35 +0000
Received: by outflank-mailman (input) for mailman id 1473389;
 Thu, 05 Nov 2026 01:37:33 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmQ1-00024p-Dv
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:37:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmQ0-00G6uF-RG
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:37:32 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebddbb-e002-0a2a0a5209dd-0a2a4503e104-18
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:37:32 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdddb-fae8-0a2a45030019-94a38ff1723c-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:37:32 +0100
Received: from pps.filterd (m0367130.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50moWA2064640
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:37:31 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com
 (mail-eastus2azon11011018.outbound.protection.outlook.com [52.101.57.18])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hrbp3t6g6-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:37:31 +0000 (GMT)
Received: from DS1P221CA0024.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:242::14) by
 SAEPR16MB405700.namprd16.prod.outlook.com (2603:10b6:802:204::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:37:27 +0000
Received: from CY4PEPF000392DB.namprd03.prod.outlook.com
 (2603:10b6:8:242:cafe::4c) by DS1P221CA0024.outlook.office365.com
 (2603:10b6:8:242::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Thu, 5
 Nov 2026 01:37:27 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 CY4PEPF000392DB.mail.protection.outlook.com (10.167.247.121) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:37:27 +0000
Received: from pps.filterd (m0373460.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50noPL1488051
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:37:26 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hp232wj0v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:37:26 -0500 (EST)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id OmPrxjYxqf5COOmPsxlY7v; Thu, 05 Nov 2026 01:37:26 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=hiW
	GmLd5gN5t6oIVVRWaRZVSnc3B8aqJqB2CNlBTkxo=; b=eevnNSJK40AJXdZekio
	R40bE6WKURtIi7T9xnyYVxOdRDxTPl9At6uSVhz5a/VnBqPVqYQRz4Zj6T43q+u2
	Y6Kozwrc5zbylap3RiierD6M6UBrT4zslOHL/ZISHHXpy2SA16oyCn8j8P68bijJ
	AaXbsPsk82RZE8VYI0O8yLMkysc6UMlDY0k/FDFjq0aQGaoL+R88QYzpayhmZonv
	6NZWjcEnG8npYwXTpqhuQ+u9U3RUOzx99BX5vV0osy5gc6654R/rE0ep6LDcyoz7
	a2BPSC+EkkD+6gbBAjhQlvftwYRW9l3RncM8gND5QDUprZytfiCI6/0d1xdMd1/G
	Z+g==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RsQtRySCOXfttOyQXiWwkKF+3OgBkMznpuBSxRL+kFSfoPPaDDmpPhwtbbXRsaNI+4NgYEmzen6s35RL1chqj/H01DH+Ubm3V4iS75fA+rzkxCmEmGyQJOmIuzm4ahNrF4a5rsjrv2uSYqXecqABSQ/dH08xkeyocglWWbyq9Q5R5fPWWrJUmzDijYuJOs199UgXahDIC29EE1NGzybN4SoEYGX+yo3qfgqn0L3zO2XocGb97et24fmUnoxcRZ82qVKAQZKJgZ2626KO6Lv41kqJNIc/0ZaJkL73GUNOufF8C7+V437PH0GWK6Op7Xf2Nz6tl5hXMBt9/SGbSglnWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hiWGmLd5gN5t6oIVVRWaRZVSnc3B8aqJqB2CNlBTkxo=;
 b=UA6jKtRo9jUyhCmYdEuw9qJiZlMUC+wOG2qzdEkhrSa3rS+o/dyjBNQMBMGim97eeIaPooGQWFKwdeO0YaL+NlSb1iDU0ekPyFgeuR6v/TbbdCnOpiPlpbUMOvaRE84KBx9qUvcJq71wrEdC+KiRR76p6a7tcDw/OR2WvfEbWnXri9/9ifWoAx4smIzRKQtMRwzHfD/qpQmaAhE6bJKoFm/XDcdNuoipj44wbyE0GKXAMpjQvysXnSfXLnDQ+ZiKIizbUwPB9UpFNZVE6xgmh4y5HBIbFoPJQk0nk9Jjy+1WdjrdX5CFEPwCe4x8nOnK+7DAnPMhZK80Lt2AMjLIzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hiWGmLd5gN5t6oIVVRWaRZVSnc3B8aqJqB2CNlBTkxo=;
 b=ljDLnr6BwJ+QrNn56jepuHKZ+AE7c9RElcYyyIQQY74OIHtoqCct1Ce398ljV01i/3fE2AFV+1l3MWt+briNvwZXnk9Io1f3mfYYIcmElur/h49ZwtRFva3fj9akm56sQyNjlv8H0z5NWsnCPmDjgMIDpxT45DwQiojFI8vFEYw=
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
	ppserprodsaar; bh=hiWGmLd5gN5t6oIVVRWaRZVSnc3B8aqJqB2CNlBTkxo=; b=
	g1wiNb/n4SuLEB/VhRS/nDmRtEJu2Jp9jvifpkeXNiei9Zo34A+1EZnzQHxW4vPZ
	vWd9lprNyRPuWpczxC2i2G2XuFVQlXFm+R0TXWLgktaDhzqMK88HFMvC1uGA2+z6
	9sOlleD+UB63FcaGKoJRxqng5EeHIX4hjxoC11HD/7UzqvfiYpUdpQDXOy660kHn
	f5vNGho0RV2fMuAt4JpwFeTagzCCI0Z5QnxTB3X+1yf+7BnlbRSWfVu44GG9NWAW
	IXsNb4Fy2uOiAktuFLovj32TBjDciLtNS1nROYrlAaC8HTEqsAWkwHgEV5OHyYRf
	9dTwVcV1vW8SMCymvqWfDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=hiWGmLd
	5gN5t6oIVVRWaRZVSnc3B8aqJqB2CNlBTkxo=; b=XAnvq1Eky3FE1IBdUkoKmiY
	hLj88b5ktT5pd4DAKIU1HDaconXokKCBA6xuUTIt49Mg0cUaEpz8/scuXJKx2pBB
	CSw197qE4Q1POMNhxpOO4bUjb+hDsgiFOnRYX09DJS6vzg4rHJxoTYAlKHKQeDyc
	VrMT+dcsAk9LZDgmwhGD2SqUnNsC49NkIjPeZEqOGM07QkwI66UnNQaLEn9FOSK0
	a506A6pM3JRq2HHtSmm2JPjMPb1MZmflOO7wbjR2bHULJoESSRB+ty/itu7n+edt
	+yE1dWAvhXtpBk6LHdfMPX9HF3lAbWeEws9B2QUUqSOZ3QJG6iA2Pu9/s5DlvDA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmPrxjYxqf5COOmPsxlY7v
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 08/13] CI: enable on-demand XTF on qubes runners
Date: Wed,  4 Nov 2026 17:36:56 -0800
Message-ID: <20261105013701.719658-9-dmukhin@ford.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF000392DB:EE_|SAEPR16MB405700:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 662e86e1-0617-4149-3e5a-08df3add5993
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|11063799006|56012099006|261021121427099003|261022075727099003|261009223027099003|261102130727099003|261102123227099003|261026121527099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	2oIQZAxFXDEdABafFSdbCwuIOEeOrAnSv4fBtrtWfuDNzX8ggyq+PdrFTlCHyAmzDCETa40+U0boqoghBW8D8/enshWFSbWpJOu64VztZffOVy0I/wEh6kYxGtbCr35gVjzibNsXTlkmvaqKMtQ57QMT3vHPOyoff9NlVlxs2mnH/xZTB0Q8FfsDWQ6S98MDLvkueeuwVkYKQnzK6iXn4JZ3jjmdYTmFIhyN5n3MlHOQWix6UiRU4s9I5rTxBvHWox8dWqb+Xk5m+qRbA0wj3M9RiG49JUB3liyI0duVwnAOlH73AMGPLjIyMlywZmfdHMvuyWKX5g42hHyfb0OBY7NMUi/jkyBVndmxS7AHvTvuPe0P/yxV0OOAJA899HjCVc9eLhJgcf9gU1zJPMSEgmuQIv2XSlY+nJCIfW7Up5sSWjiFBxuYLzTMyHFo7LFY/nHZDJ356x+CTq6OopWzbbZN9rwzXkgz30x/SqdEyaK0uwWQvl0CByW3amNli5gbFsAqKAijP5ibLfpA9LgwSWTsf7/UKZ3oal2qBDW3wSjsPr2nHSCXZ1wZhkKw6DwHmOQT2ugsx1vvapt9xVJNvq2Zg8cu55M3mcMQmE7vWaR0wZ+rzoWKKXU+Ot2f70Ivl/cLzy3J6l5J+7n2Ja8ICDb7v2r0AlY6wObCzbc+3cd7jXTyCIoNRGU3QLHZxM29JMjZqnD+YQuOnIHgUJml8g==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(11063799006)(56012099006)(261021121427099003)(261022075727099003)(261009223027099003)(261102130727099003)(261102123227099003)(261026121527099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5SXn2/abMPSnVpUfxsyuia1ROGFqXQ2vzbaRBxXADquKmsaeLZtlE7n1cR3MW7/PqyqvQsVW0kqbsz5W423Hwf/tl5ZXn3N7HwVHHZubM//2uCNTTZrF33bWzisdMxOsmK1Pcb+orU3DYipLAoY3c79kv8NxKcwEdBmwE5BBznXB0viJTzw2CdP3sitnHlvXb3OozMuq7vtx0GZ/3JkU64NamCXxGTTSs8HVESjTM9NzM2XXcZZJA4sdJu6zMekC9eQ59ho2jEDL//3xrxrrZ98eS6obqruLx70s+IyIue8CLPJ97NXUak9SmGQiR3gB+PxiSJsoHy2+Ue0AXiEBCjV8Oikb/QHqL0U5okmwKkXPYgA7NwA0+x6kh7aK2iLKm3L0CTWf5g4FLEsSRq8qP2aNe9GU4hyY9rzg2Vz0B6iJkMyXtX4tIxK75Ekoifk6
X-Exchange-RoutingPolicyChecked:
	ue1U4RnesL3Dv0UgzIUk5cGrGsEFlvTihTNcTLpw9sl7vd2uJd3qlASOicqdIOTdNnLrIEX09NwJdZgfn0taAJtyR1PogMZQCDPw3xI1IYvkV31kWV/mru+jDJ3zNqx5tsua29dl8DHtrzSrN8m0p7rGoXhzMt+bqQZ9h4C61VIVcgfyQdxOBmjN7mTrbJ7uxhOP9+Lb3w7bIjhIMwt3V5nWvHsxXzJ/25WKRHpz3TV+kklXaUm2h0MMBkY/zLy2K7d84letCbjJQnTl3e7PSycFWdrH0IhwrXR0loRtS7FpiW13alZjoIjp+Q8yb+ad5cKLNArP9idl8EbeyvpHjA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3yGF3KpKvqT3gGc/545Nik3dLa92wqFP8xSwZthFTq0Ok1g4hVIPlCMSzsuXkAAVtzeEa8sbZxp4uTF9hPMVSqrUPZwDjyy5YChkrNhU7NKynFiX8JgZTqqIKU3mnJXkWoIF+hElKLFDEoEKDqXm6EiG3YwTnRMWj2iKZDtKbyktxZauZAdWOrScJEEpgcGviw8xVGz97kDTFcfMo1ir8mMzUhp8HbWEwmUnX51FmOLwqs45trmXyx9D23Eg1nlxofkruWOAkZsqOdV58MvhsxtNUaIUEEVqiMJ9rsLMg7mWmotOA+/A6RAz2ePmafaqrj0bYpgCIVSONq8qFZQ+L1uWhAzF6nUPmQkUsyjXvnz4eKFqRYx3ssxXKNKcvDB1HPzwGh42OQiL654XXJdGoDxwdYn6Pp0ql7ZemktrwIe+EdyenRSHS6TrScKad3pRjtg/crQL51fIaXK6u0nRaqVsTJj1owXRgqL1w5xV9OPry9u9e0m0KbFe9eEOD4C0vWdGrYQwlbvrLYmzmqZDcSBT72TsQ5KtoA55ZTLpwn2i9BD4cBou42VRjNIYiaeB+jqrmIq+8jizHgnlfo7jJDyax3iVaL5Kh9UP64aAyVjjB0pH5bH5ygE4Wis6CLdCMiVeHj18zCc5Kxzunp60sg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:37:27.3417
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 662e86e1-0617-4149-3e5a-08df3add5993
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF000392DB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAEPR16MB405700
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfXyNBBprHDkJHG
 snA2yUqNkFso3YTeowFLmtUdH6HgCKD/76xUNZDVoUORzxSzVN/BGGjC+dCV07gZ7XHOUv53Hsy
 hlwDz4M/iw55y9HyOwfAY3QMHebamd3oHPNwzestDuo5a4cs7K4Q
X-Proofpoint-GUID: 36881nZaHXi5zlNKuG5PuuogFUcykD6u
X-Authority-Analysis: v=2.4 cv=XuBvqlF9 c=1 sm=1 tr=0 ts=6aebdddb cx=c_pps
 a=f2oOq7llzQIcdXl5NAnHtg==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=vnUQfov-gS4s1L7hHvr-:22 a=cbNQJ9GKAAAA:8
 a=VcXuASJrcN1Qb-N3H0wA:9 a=DqJYxgmhk6moR-_7_KoZ:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfXxueltAkUkch8
 So3S2FldrOsjnYVWKdhvdHoCF+SH9n/Vl9Bi1xhJ/dgHTvcc0FpH3hCcqXX/UgrG0VfSQjavhgC
 uFDQmCG20yF7uH0gXOuvtujXB9FadhNJleE8nvS1lLk3eeHXGoVRPyLbCTbsO1LIyazi3hMoVtm
 9KgUlouB2GtKvBzWWBETvpNC7fJLZd2lplE1NY1SYDUAToKj4qqtwb/z1dm3rDPeLSppDjwNBGV
 6fj+dxBeJOnUS7I3HeQRFXbjlNC9Ch7t1nCTqVjGfh9hdZVAHT9T5TDe1XFiSXuwd4m9RFn385Z
 9Y4C0n+D28apwEj08v761tPh6w+cMVn2uVlC9Zft2p2W6WcEwmZcgHvP4z5Sk/VWi/BMbwLJYwz
 JvVODX9AmhrIRDmUVBrvC/21t6moExoY7GMJiJtS78kL1DPgp2cBF0xNJ8ZD0Esw/D0JmBcF7pd
 J6gVknmvZ6aIJEv1zOw==
X-Proofpoint-ORIG-GUID: 36881nZaHXi5zlNKuG5PuuogFUcykD6u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050006
X-purgate-ID: tlsNG-33051d/1793842652-6D8D54E9-6361D09C/0/0
X-purgate-type: clean
X-purgate-size: 4614
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Currently, public CI infra has no job to run an XTF on the hardware
runner.

This change enables running XTFs on hardware runners on demand, such
as test job on a development branch.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 automation/gitlab-ci/test.yaml              |  2 +
 automation/scripts/include/xtf/qubes-hw1    |  1 +
 automation/scripts/include/xtf/qubes-hw11   |  1 +
 automation/scripts/include/xtf/qubes-hw2    |  1 +
 automation/scripts/include/xtf/qubes-hw22   |  1 +
 automation/scripts/include/xtf/qubes-hw3    |  1 +
 automation/scripts/include/xtf/qubes-x86_64 | 54 +++++++++++++++++++++
 7 files changed, 61 insertions(+)
 create mode 120000 automation/scripts/include/xtf/qubes-hw1
 create mode 120000 automation/scripts/include/xtf/qubes-hw11
 create mode 120000 automation/scripts/include/xtf/qubes-hw2
 create mode 120000 automation/scripts/include/xtf/qubes-hw22
 create mode 120000 automation/scripts/include/xtf/qubes-hw3
 create mode 100644 automation/scripts/include/xtf/qubes-x86_64

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 9ca93842dfe7..4d7d5e3d9a11 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -244,6 +244,7 @@
     PCIDEV_INTR: "MSI-X"
     XEN_CONSOLE: "console=com1 com1=115200,8n1,pci,msi,04:00.0"
     SUT_ADDR: test-1.testnet
+    XTF_TARGET: qubes-hw1
   tags:
     - qubes-hw1
 
@@ -255,6 +256,7 @@
     PCIDEV_INTR: "MSI-X"
     XEN_CONSOLE: "console=com1 com1=115200,8n1,pci,msi"
     SUT_ADDR: test-11.testnet
+    XTF_TARGET: qubes-hw11
   tags:
     - qubes-hw11
 
diff --git a/automation/scripts/include/xtf/qubes-hw1 b/automation/scripts/include/xtf/qubes-hw1
new file mode 120000
index 000000000000..c6b7de7308b6
--- /dev/null
+++ b/automation/scripts/include/xtf/qubes-hw1
@@ -0,0 +1 @@
+qubes-x86_64
\ No newline at end of file
diff --git a/automation/scripts/include/xtf/qubes-hw11 b/automation/scripts/include/xtf/qubes-hw11
new file mode 120000
index 000000000000..c6b7de7308b6
--- /dev/null
+++ b/automation/scripts/include/xtf/qubes-hw11
@@ -0,0 +1 @@
+qubes-x86_64
\ No newline at end of file
diff --git a/automation/scripts/include/xtf/qubes-hw2 b/automation/scripts/include/xtf/qubes-hw2
new file mode 120000
index 000000000000..c6b7de7308b6
--- /dev/null
+++ b/automation/scripts/include/xtf/qubes-hw2
@@ -0,0 +1 @@
+qubes-x86_64
\ No newline at end of file
diff --git a/automation/scripts/include/xtf/qubes-hw22 b/automation/scripts/include/xtf/qubes-hw22
new file mode 120000
index 000000000000..c6b7de7308b6
--- /dev/null
+++ b/automation/scripts/include/xtf/qubes-hw22
@@ -0,0 +1 @@
+qubes-x86_64
\ No newline at end of file
diff --git a/automation/scripts/include/xtf/qubes-hw3 b/automation/scripts/include/xtf/qubes-hw3
new file mode 120000
index 000000000000..c6b7de7308b6
--- /dev/null
+++ b/automation/scripts/include/xtf/qubes-hw3
@@ -0,0 +1 @@
+qubes-x86_64
\ No newline at end of file
diff --git a/automation/scripts/include/xtf/qubes-x86_64 b/automation/scripts/include/xtf/qubes-x86_64
new file mode 100644
index 000000000000..d183dd33e4af
--- /dev/null
+++ b/automation/scripts/include/xtf/qubes-x86_64
@@ -0,0 +1,54 @@
+#!/bin/bash
+#
+# XTF test utilities (qubes-* hardware x86_64 runners).
+#
+
+# Target-specific environment overrides.
+function xtf_init()
+{
+    export XEN_BINARY="${XEN_BINARY:-${WORKDIR}/xen}"
+
+    XEN_CMDLINE="${XEN_CMDLINE:-loglvl=all guest_loglvl=all dom0_mem=4G console_timestamps=boot}"
+    export EXTRA_XEN_CMDLINE="${XEN_CMDLINE} ${XEN_CONSOLE}"
+
+    export TFTP="/scratch/gitlab-runner/tftp"
+    export CONTROLLER="control@thor.testnet"
+}
+
+# Perform target-specific XTF environment setup.
+function xtf_setup_host()
+{
+    cat > "$TFTP/grub.cfg" <<EOF
+serial --port=auto --speed=115200 --word=8 --parity=no --stop=1
+terminal_input serial
+terminal_output serial
+
+insmod multiboot2
+
+echo Loading Xen...
+multiboot2 (http)/gitlab-ci/xen $XEN_CMDLINE
+
+echo Loading XTF...
+module2 (http)/gitlab-ci/xtf
+
+echo Booting Xen...
+boot
+    EOF
+
+    cat > $TFTP/boot.ipxe <<EOF
+#!ipxe
+kernel /gitlab-ci/xen $XEN_CMDLINE || reboot
+module /gitlab-ci/xtf || reboot
+boot
+EOF
+
+    cp ${XEN_BINARY} $TFTP/xen
+    cp ${XTF_BINARY} $TFTP/xtf
+
+    export TEST_CMD="ssh $CONTROLLER console"
+
+    trap "ssh $CONTROLLER poweroff" EXIT
+
+    # Boot the system
+    ssh $CONTROLLER gitlabci poweron
+}
-- 
2.55.0


