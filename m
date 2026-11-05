Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F67C606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=aVZoExcQ;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=Efn9NuVu;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=RsCUMx0h;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=H2gkDglN
Received: from list by lists.xenproject.org with outflank-mailman.1473489.1681180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmRF-0001Te-GP; Thu, 05 Nov 2026 01:38:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473489.1681180; Thu, 05 Nov 2026 01:38:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmRF-0001TO-BV; Thu, 05 Nov 2026 01:38:49 +0000
Received: by outflank-mailman (input) for mailman id 1473489;
 Thu, 05 Nov 2026 01:38:47 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmRD-0001Iq-BD
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:38:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmRC-00CQpG-Ns
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:38:46 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebde26-bab6-0a2a0a5309dd-0a2a450ccef8-0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:38:46 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebde24-f479-0a2a450c0019-94a39217eee0-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:38:46 +0100
Received: from pps.filterd (m0367123.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mSxu2567952
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:38:44 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com
 (mail-westus2azon11012004.outbound.protection.outlook.com [52.101.48.4])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4hr8vmvbjp-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:38:44 +0000 (GMT)
Received: from CY8PR12CA0033.namprd12.prod.outlook.com (2603:10b6:930:49::12)
 by LV8PR16MB6443.namprd16.prod.outlook.com (2603:10b6:408:228::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:38:39 +0000
Received: from PH2PEPF00048918.namprd05.prod.outlook.com
 (2603:10b6:930:49:cafe::33) by CY8PR12CA0033.outlook.office365.com
 (2603:10b6:930:49::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:38:38 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 PH2PEPF00048918.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:38:38 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mTea3091555
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:38:37 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4hnycbnhmm-12
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:38:37 -0500 (EST)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id OmR0x1H70gTjoOmR1xgqPP; Thu, 05 Nov 2026 01:38:37 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=7ZN
	6LuhG///1TOpgWfiNFXmahkcaCTnzZxgTiky8Tpc=; b=aVZoExcQq/pysBZXdZh
	sCcBOOcG07rNSbYqwEyaJu/BaHV7b6T01YzmCRLlHL2Q6teyRw404J7mm+DkRuHN
	ziUCrqFF+mfgo3/VyebmarpFabXdtd22bgRva9IK+k4Hz/7WpxKL5KEU79hCEan6
	mvzL6yxpZ8r2elaVccpYezEWRk2Y+kim9S2J315wGxuNzHxq6YAH8lYh3Whqg/7T
	36qP9hjLpDV1346P14SWrtSp4ILXkA61Y6MsfAvfjmy+eloiXrzef0ooPOXZxZqQ
	awZu83FvBc1/Sb//aw5qXI6CsH4xjZGl2rmlq+miSsPpts3O+hfFnJo/Rvn49R8+
	Yug==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OnBAlriM0pXbMAnPkYYrWizUZFGo2+jglSd3TDm7cblU+hlJ3tZjxmjuimIxYnn5OYWlZWJGdatffRUd5FskLFkL5Hq8r72m0Y77oO4pnj2hOICpM51EnK8VCYKsHOXQg9cNyiV+upAsPOGWI5H1VE+erlvVU2HzC+XTLILqE0vn/wRo2LeJBi95cmf/BFMHPXR64HO5sFVYh+CqoWSNgF881EkcS7b/JXMwn7MLI6l6kQfByqcXVNVrEzJ1x+hXkNrtyZenZ/gAVKsQ1AgcEgR6EPiuTL7qtNs2tzIW4MrvfE33DCi7m/ny2N/gSwZz8ygE2cmNMb7unEPewSmWdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZN6LuhG///1TOpgWfiNFXmahkcaCTnzZxgTiky8Tpc=;
 b=i7DgbTJZF0zyS29mfyeBwikXy6qW0jQEim8ak++ulaO1s+KOYQIf2OuuxH6WxBDk0IYcPh4H+hCq4dHSIGMHNzb1nb8SylrXKVeTs8iT0728dapzzUDayo2tfm1Ai0vPtBbyTkqI321jijPW6l1Q886BOcf4gM5uqwrz7C2D91IwZQ8DWyN3KfIaAsINEpmRm+oSO6z4ODY7L8MLJnUuFqhFUAUtF2uU6Da1QwrO1Bqq4qnNJf/z2Jz3CKDvrNihe9lVZO5tvUf7TlMUSMKBe3GEN+12CH4IQCxA4OmjyqIv7e3EYJ+kVIp3U5bf7+8OE2eG3NZ6a/mpANI8v8E3Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZN6LuhG///1TOpgWfiNFXmahkcaCTnzZxgTiky8Tpc=;
 b=Efn9NuVup6wIVNeVyBwWIrWNXc19LDSTpRA6ciXTXw1IwKIWD1NYhk6NXll2ARhdIop5GNfjhAgR+FnVGJHganfUqmpe1035frqXBSDwAFtMH1p5Wq3PPwo+nHmp9+ZiSnL2EMYwNnMtAsdcVQeyjH3jbf469RwWUk2NQV2rGUA=
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
	ppserprodsaar; bh=7ZN6LuhG///1TOpgWfiNFXmahkcaCTnzZxgTiky8Tpc=; b=
	RsCUMx0hThX2g9L2OabSsbCgQJr+aosq/MvuGZVwvpGMCIYbbjnlyAP8Ki8g44N1
	Kb7S1NrsWzqGOc3t4wSfh3RZ2jcURa1tUIqorvc41aEgJ4tmsNZJnGApovAL7gLV
	0t4RZ+hZruoQ5q10VKnUKx+w+pAH7sgYfYn4cmHJb2uZGtWgi7+qIsdKM2/AhxYv
	MSJc+WRgGZ+EHajgswvCtdICCFmtkHjCtzYqc5XUBbYgE7RGc8c2ghjZWR6SEDlq
	iE92MEDiZXcbHzIv2JIin/xr/Vu9rNAW5KKi/gfu4Mt9rC95R299ruJi4Xdl6Rxa
	9cye63W2xDRzpsv68GThXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=7ZN6Luh
	G///1TOpgWfiNFXmahkcaCTnzZxgTiky8Tpc=; b=H2gkDglNYAEJverh+imwrGN
	RryM65af4vX6l2FWpQLLqfamzgNTEwYMOrGjDQGh2Hj4zjYE7Ep21v3Evo3Izpnb
	AXgIW9JKiaD3x0/akmGl1eZk38oKi0NtKBfmZm/J57GUon5SqAjZFnnx2YPfHHpQ
	rWstnPK5J+XRUEkz3HH0//dND1jMpoVqLbxVZSBN/WU17W6GVktIVNxe0tj2JRt3
	nGFTZHOqqCCqAv6fKbcp71PEiCWxYi7+7DNbOSeYKKzIxJ0qJyPpdT8ZNAqGVx0B
	RIBW39Nlp3NsivkuAB9xQ37SgF9SG7DIid8nGlAsaZtbTEmlN5CPzEUv/gMoMsg=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmR0x1H70gTjoOmR1xgqPP
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [XTF PATCH v1 05/15] common: add simple atou()
Date: Wed,  4 Nov 2026 17:38:07 -0800
Message-ID: <20261105013817.719823-6-dmukhin@ford.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050006
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH2PEPF00048918:EE_|LV8PR16MB6443:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: adf7b269-f834-458f-a421-08df3add83ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|11063799006|56012099006|261021121427099003|261009223027099003|261102123227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	b8Pb36MCw8k46pK9sOf/Et0vSPCqNsgbGDinv9KI/5dBcDPVbPHslXePxY2RIymeA7iPOkuxaldIPcizuHySAACe+WUrig4deTzJR3HaEo2B6wZnqd3c9ROOOwTyIPR+PVNXmbrRSgyJ5PzvGImSS/m2S65BKoDYXjILSIpa4R2iQ0lcGPTiLsH8nqNhP/VxnNoHW8SPDVZ2p9RgkFQcz3E1+YRVbVPTMwIcYdyEK5l5YFbsXi9OVFGzVg8L6zVRNqUY8XtVaC2PYAg6Brr2VIXjLlCLlHUQRrO9fI+awdiL4LU5Ziq3MYzqP2Vtod6cHlH81m/QloudfoCwzBb1Fw2tHCij6jK93FEV+0GpU+4GQ1H12UvEBVmzMJ1wH9PaULeRsHHM6ve1t6t/+VICijWE1gmbsNpsDgg5M3gwzKoiBKPhH6WVpl2NzlOaWGwGQMHY7X0/VSLRmB9dbPt5CwEpR9A0syN1GJCDLZYgOitY6rrG9PrrmWuVnr4bsnv8oZJmDw0gSGAjCnmWo1LOkTLmLD8rzDcLqa7PFK+oBl55vP/6NFsiO5RryaK4t/cj1KDu50tRo/MGckH4cnleGiWt7BXAAuxOldidc+tFydJbYtpiplhn3ty26YR+zDWPr05HcrIz8fPk+abUKhAe0OK7EYhEH2PxmafX8IbrYYAp61wcDzhrAsKpRsSDb7dx0keAX6WUOx0JXT4TA1/N5Q==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(261102123227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1yJ5StI0hg99uf2v0XBzXvmzHSwDSKCKmXREXV73bMPJznRPkJTMAxjDtflaiKWxRCcjOvEJ36LEinI3ZHKIRf0+fCEAxJXiw9dM6UaiOGNKLic3DHb2N68mXyub3aK9Qco54l/XUuccCcBkwWJt4O80dk2Yu8moBTONf/Ov1ZClXxvrELSMA+f1G5VKASHei9ku1KQ/0RjeESvZ8CwUolVOMxQxiAo2qBBkTmJwXlhs/2/UhQO7yr1xeQ8DmipDRQZBbcXYB7gfmEIpZz7t5rDuDjB/Op+HiKILvEx0+7hr3ND0OsKtwSfxSnIf/niG9sGcR1qLRVGt7mE84gSG6o26nwAkRKygv41DrZma0PQ2UArnZC7sHcL3qDRLYstqBYqi0J9Q2pFQ9gbppRKfbOnGl0r21hUO8d+7zXZ6F0XyUJW5Yp4Npv1VtvoTyBUp
X-Exchange-RoutingPolicyChecked:
	bMyVn2j7Kh1f8Be8sBfvxbDzc5K71HLYbepeJAz/LyLxWYI2aDuZA4Fk1nS6tOhA4wKMHIH292LJoEKxt70yywG/t/T9HX+UYn2qVArk2bWXjq3PtxRrm+5DZ0C7AIs8tPjkBc/buf5GmmSaxievwH0O6Wj3Bkoyrgselfo8sgr64Pfk6VrcOrRXiuVMGW4wgSHgORTn5ridT6XAE5PtO5zcqAmgQXt7v07AOpgkAKblpPJJhzLtmlnm3V+q6MebJXHir578cJY4rAOdFQC2VcUR4hZ41eMkBXV3q9JVW1AEfJ3WlBTf6E0DugdiQGLvFh1lw6XwApSyfV2n5drEsA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XLgQudZ55KJ4o4rvJZpIpTVE7gYGf2+JJIfd/vVsRE7wNdgrKIcQ+CMRuT8GcaRuT0UBGkOfPMt7jXogDqnlfdkMkuGf1SJp51VW8ZTAhjquulyZ4G711++H6grODej2dQTgEs2B7R+/6RyCuNqEI8Yh7hRiYTJA2g/r6ZjXQ/7zyjqNbRxN7Ns4gsjtda/8PlVrp+/qHUC4rYUmm5Hp6DsDZBgI1UiznQRaPlPsEdEV59igV7c+fouu2jDQSYhX5UFBYDdRSN8aTEtceEaXMUalBFl2nLAs88ybCAyLcUHUJXhaywFjgX5njJw0IjuHNgcIwRCFOTz8k4QwHX6Jui9CUZl8HJS2i4BUdeudjNvk5m2qKr7tfNwUmSEYiktHO7sSEKiHBDtLlKVqiLX+354mtBIGMi9iYkRHPkjJy7gsILQUlaQKE0gp+Z2v6wLCNBVTbU8+uh+clMfO7z5j0tlBF6cFdDDArGMCoPFNINSkPloCyU4xSpuBFAra5I64AAjZK+iHJcpg4WbeA1AKcytTw283IbMOx+fKJRcJScPjr6yFvAuZjhxujbmql1I+/23PgDuhDF/MqqNfrhL6CzAV8ACP8b9NqP5TbdzHxNq7vFJ6vzOqSjYg6FK676FwplcgyR9AXAv0jJ9a/PAXtA==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:38:38.3549
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adf7b269-f834-458f-a421-08df3add83ef
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH2PEPF00048918.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR16MB6443
X-Proofpoint-GUID: bUpQXXN30HAeZ0J2KmLEpkaPhwGM0ZXu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX6hjbYLrGhX3Z
 ho+zXEFzOrr0WAajN0tAamdg9D5BcZDBoFH6vVS95WXMdCh4W7hVc8nxz+8S/srK7pgVXeQIVxV
 8tox+KOWqP+Ei8x3NsvaVvWdVeTgIgXw45gXKX2Bd4eyPjCTL06MAyZyZwkdCgeWhPaLPedRgra
 RfpOElkugMJYz5CYEfwYt184vWT4yAjtVQVhRyDKzryc1g/eAO85uHHLiMKiGLCDy/qKrjqe/mK
 T/cuhF6tu+6eByS0iWDqPOtEUlqSXxxu1q8XpQQGvJdmeho+kpyegkPdGFEgbLhQP2OQRasQKMQ
 LzqMESqXoATysRES3aT0rY/lWfeElA/TpTBuORNQJg7KzdcjHJg1u7LWySfrQ1qW+/4zdAHdHVM
 GCDMSWP3BOjN5NTye524eQdYVTaWxyu3V2E28vcEVzhU1avMCiIJ++BYSb8NE+BXwriSZ4dfFgr
 iW/xvfUD6Zm5OeNsbqw==
X-Authority-Analysis: v=2.4 cv=T7AZ3PKQ c=1 sm=1 tr=0 ts=6aebde24 cx=c_pps
 a=2pTyoxkMaluYXS6DGsynPQ==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=N9_n2FxmZfwfyRXvS9-E:22 a=cbNQJ9GKAAAA:8
 a=QxTsT6-JQxPL54EDDM4A:9 a=P0bj-C3X3jJDpopQwM1U:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-ORIG-GUID: bUpQXXN30HAeZ0J2KmLEpkaPhwGM0ZXu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX/9RxMCe/brvW
 vYgtC7HXalBicM40cxa7Us4SNiHfsnVAmK03Facwp5lTtQk8S4MEz2qAw0l+1eK4xPBVT0yMmCT
 lm2EC8zvNgSOrs4YvpipMVoexjv4xyKFcxzEPCBdIH6NwW2KTXnZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050006
X-purgate-ID: tlsNG-d25034/1793842726-774D7A5B-42EE9F0C/0/0
X-purgate-type: clean
X-purgate-size: 1387
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 common/libc/string.c | 24 ++++++++++++++++++++++++
 include/xtf/libc.h   |  2 ++
 2 files changed, 26 insertions(+)

diff --git a/common/libc/string.c b/common/libc/string.c
index 8ddceab7419d..e0e40ccfa1df 100644
--- a/common/libc/string.c
+++ b/common/libc/string.c
@@ -97,6 +97,30 @@ int (memcmp)(const void *s1, const void *s2, size_t n)
     return res;
 }
 
+unsigned int atou(const char *s)
+{
+    unsigned int val = 0;
+
+    while ( *s == ' ' || *s == '\t' || *s == '\n' ||
+            *s == '\r' || *s == '\f' || *s == '\v' )
+        ++s;
+
+    if ( *s == '+' )
+        ++s;
+
+    while ( *s >= '0' && *s <= '9' )
+    {
+        unsigned int digit = *s++ - '0';
+
+        if ( val > (~0u - digit) / 10 )
+            return ~0u;
+
+        val = val * 10 + digit;
+    }
+
+    return val;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/include/xtf/libc.h b/include/xtf/libc.h
index 86d2abdf2c6a..62fd37c77d65 100644
--- a/include/xtf/libc.h
+++ b/include/xtf/libc.h
@@ -40,6 +40,8 @@ int memcmp(const void *s1, const void *s2, size_t n);
 
 size_t strnlen(const char *str, size_t max);
 
+unsigned int atou(const char *s);
+
 /*
  * Internal version of vsnprintf(), taking extra control flags.
  *
-- 
2.55.0


