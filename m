Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA63606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 18:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=fqodlUE6;
	dkim=pass (1024-bit key) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=P/JxDGwK;
	dkim=pass (2048-bit key) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=eUH5oP3F;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=n7esxVw8
Received: from list by lists.xenproject.org with outflank-mailman.1486343.1689077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRZQA-0005aT-Vi; Thu, 12 Nov 2026 18:21:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486343.1689077; Thu, 12 Nov 2026 18:21:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRZQA-0005aM-SW; Thu, 12 Nov 2026 18:21:14 +0000
Received: by outflank-mailman (input) for mailman id 1486343;
 Thu, 12 Nov 2026 18:21:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xRZQ9-0005aG-00
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 18:21:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRZQ8-004ohp-D5
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 19:21:12 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af60378-e002-0a2a0a5209dd-0a2a4507be8c-42
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 19:21:05 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af6038f-b4ea-0a2a45070019-94a39217e7c2-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 19:21:04 +0100
Received: from pps.filterd (m0367123.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ACIEKdB2750654
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 18:21:03 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com
 (mail-eastusazon11011058.outbound.protection.outlook.com [52.101.52.58])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4hwgqe9fd4-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 18:21:02 +0000 (GMT)
Received: from RO2P152CA0068.LAMP152.PROD.OUTLOOK.COM (2603:10d6:10:29::13) by
 EA2PR16MB6180.namprd16.prod.outlook.com (2603:10b6:303:25f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 18:20:59 +0000
Received: from CH7PEPF00000017.namprd21.prod.outlook.com
 (2603:10d6:10:29:cafe::87) by RO2P152CA0068.outlook.office365.com
 (2603:10d6:10:29::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Thu, 12
 Nov 2026 18:20:57 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 CH7PEPF00000017.mail.protection.outlook.com (10.167.244.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.2
 via Frontend Transport; Thu, 12 Nov 2026 18:20:56 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ACFeHaR2307304
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 13:20:53 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hvjh2a1w8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 13:20:53 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id RZPmxcfAWlFtURZPmxPiym; Thu, 12 Nov 2026 18:20:52 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=cbU
	2Q/j6AzfoIqdHBWmymmyRc3Mf/dsqmJnX+cnrAp8=; b=fqodlUE6rPIe9Yb0J6+
	Bz2RvmMNQR1O880h2OwLDXb8iCSQLu2nHA2UzXuS8znLXVfEHD9S9qVkeZflA7u7
	X9RMzCCP4CqVG74UXeWkiYWbEsMjnZj1LijSHVEHa8qxjKax156GZ9KjjgrWMGVk
	A4bNQzDPtXHIRVodwVF+O3ubgJrR9uHFocQRIKU9h57NRSF+1XIjU1ss3ZYcp3rD
	3xErFQpLGFPFUyuUsw9zYjCmNTTuZQTCGeyulePJ7atbT1OgR8fjuL71uKHowMR+
	colgBPducsEjeZ+oVjwq2mzwuh6RvWCw+bDp7LVD7UXVeaSj2sCxHcYhorKd+dqo
	9Ew==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dgIfxY7GCw7GOdgbCR9uDZmSObRc/LZM5AaH9vlhjcymOyUBHXzUPDc+5w7JcXffCKm2RGHoyy8Znjz85N6VrvFfr+98S/wKUg+GdBi7DrA3ODit4JOv4S76T1I9lpP///DcMfCe3aLOeZ8VIWOItbZ0oFuhRTOPI5pPGpIzrt7J+mk668Xp/iyW1ZQWXP74JUCwGvD3JdzHAzZ6pdWlbhAKrIBelXTPY4rPJuFBiMCjh0Lks/WG9WFwZV6JH6xIc9tycaSh3EoK5DC+PfTrGINPMDSx6ewINgM0FA4kMNSOpSNDty9m6x6HuUqLHiu8qGqc+RTcJW4hCuC/NSaQOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbU2Q/j6AzfoIqdHBWmymmyRc3Mf/dsqmJnX+cnrAp8=;
 b=u/hjAYr6nOgyWwGkN//Fnd7Znjptdb09mK71MTjvOf7pEqZZRpeJrqUPieUwILXxb74EKBNLpEbztWNJkr2aAfFG4vCRm5sYEz5iZ+sDfSM/CCgSPeNH9Db2zy4pq84LWwBhGLDenAh7X6C2t+DM41AFUhC0bCm9buFUWPT3TWc3VGLTaz9uOoFsC1ptG8Ud2ZO3+UBfsHZI7HVGz1liyc12L/X5SwyUFu25IZH5dK8uDrMh77qDGBXtiTVTKDk8yFGl+ce6u5KZTkQ0JRjYfBZEcIJJO2NXNvuNyWaAyADuku8Ql0FoLEgQtR7PcO5fsAcBP1lU935vFdByBmoBjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbU2Q/j6AzfoIqdHBWmymmyRc3Mf/dsqmJnX+cnrAp8=;
 b=P/JxDGwKoJHIhRBFVlkPpPyQlaBmGauK3b3RFCd2o7WDaFFcryz9yTtxIiNE4j2zp1kBhcc7wML/AMsWVLDfkIJeAZz6Z7P0P2lolzIWj1vT3WNE5WARZ4PKtvlIprzIlFOQ/qS+iWw/turwFBY33m5G5h/JXOP2V9SYyTdG2f0=
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
	ppserprodsaar; bh=cbU2Q/j6AzfoIqdHBWmymmyRc3Mf/dsqmJnX+cnrAp8=; b=
	eUH5oP3FWfemyIKn5d8f9Vk88Ny/DFkj+mVtbIjQ6TpDsfz1I4BSnCJlKcUMqK6n
	VW/Z1J2UCzzPioQMszZGxblv9+I1SwMp6tsOEDqNwcjlTzq8e+YG3Uk7HtgTAkGj
	GrzDuClGqUz4wJyoKeT7kRPetU1iPtoaKUsmP/JU1EH2ZYL19du5kzTmzLtxvagO
	I5Vk4CeOPBBPLcxv7k80ktRz/qwR2fkVtp3dRs8CLeFBJrEWd4vNKpJQB6ryTDqC
	FGiD0j53+ONgIhQM4jbTJBzvEpfOw/9d4sJbxlgmCNzlB69lswZkHlnTuKU5puq3
	rE5pDp7om4hZ8PbMw3DYgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=cbU2Q/j
	6AzfoIqdHBWmymmyRc3Mf/dsqmJnX+cnrAp8=; b=n7esxVw8rXgSGwGD8F+tA2+
	lZcgwpAqv7jgixg3PsYZlB2ySVxB53P1UOH7rmYPXM3HfUhiY/21dTMHjD8QRzQd
	g0ALwSyaMIEKwulhfziMpMGPcV/GcqK0DLloIiZXM6xkDeeT6rrmmFtQL61PuGzt
	52ywNeNW+7homD/xav+tam9Vtebf3yTH+9Lfew/uyumKNVMf0Dxi5Jsu+lxvgH5i
	Cx8vqe7j8K/g5QwjLvz8OqJ8oLZAnOd7m4BOTl49UV7hdzeAw/ZZE3938Twfs9+9
	ULlE2D4gtct/dqXP9N0OEckziNPZmhXJiD/Pgq6d3dukpfEALXMEAnWgX0b42Vw=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: RZPmxcfAWlFtURZPmxPiym
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v6 2/2] xen/console: re-calibrate rate-limiter based on compile-time options
Date: Thu, 12 Nov 2026 10:20:42 -0800
Message-ID: <20261112182042.1104699-3-dmukhin@ford.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120072
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PEPF00000017:EE_|EA2PR16MB6180:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bd69a9d6-bd77-4e66-0258-08df40e9b1f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|23010399003|261026121527099003|261022075727099003|261021123027099003|261009223027099003|261021121427099003|261102123227099003|261022113327099003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qqG6NvOxQDGdSca3S4whEGrFxiGFxUlUWh0sGmK4eAb+EDMarjTP/MT2TTfiaf15KYZ0zFubKjGyKvZfJoJoSFP+DIVLAAzjRMs0yRgoNia6FyWEFdva1O7fZNnjhIiMNQL1E7p1ReVRbH3X83vo1rtBLr487Tg6gUahnNDpdd8akmP5y8TWXyvXeLtrF0gWsPwDjjx7Ha8LKmjY0zL06RACLQ6DsV5nohoLl6Zow9RCS7NVCy/ibN1qyUXiQ/KUbHXO/Zl3OOJDipKBvuvU/gebQ5nHJen5FHVAzJPOR+eJkFrzZrNMpGxGyE3Yx2QKePlZukj8Cd547Cox0rmSkraE+GGOiKNmhSsOSYrF2WR6jI2gQnwNy95wGTgkO2vNlpuOplfrXDXmwO/pdxVVK6oxWHex5O8ZQBE4oMgpwnz1DFgcnw4PsTyUfOcJaNGa6I6oiYV3S6CvOZFT6Sfo5jyXV2+iiHym1UOeA9vc9H1Z8qE1mt50+8WXgG+fHbEsEPyXcs4OV3wwXE+J650xM9n+ILuInKy5pW5T6cB/6s5Vg8rTLAnNpHiw9YrMFU1bONWVvK/0CkQpt1nTLqcc+HN4m+tSuFA1ZCT/BPQ5tlabdCZV043nTc5P6Xv4rGHljCV0rvZEgeO5RHBvHBSrLxuw9mHdFpCWWZPflV48jHeYt5WBC7hWoPJerZgMRT0EXMjQYWpvVArSsvihMRFDNA==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(23010399003)(261026121527099003)(261022075727099003)(261021123027099003)(261009223027099003)(261021121427099003)(261102123227099003)(261022113327099003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	w4iErxATC7RVL+SexpAgFyXaEoT70/808K2PERUiaUt6R8tW2hbwpyAFV5C/xwNfrnp5o1c17hjIqwSCL+fmzOJWfpVzbXxAB/VCGnuyuSZcuEN7gM52PPdyT6m78JHkpNlhjego13vIi5FswBlyP1pYd2JIbVVHECukcyEV+1czpBNfBb2h56ahh/ZGQcfLxNmJNUWaALZaemiI1WsMEmrvbmFAwIJEdOcQPBFuI2h8B1IOxcAuLCzIFDqnP4gORZyFKtSPS+Fm2/K/FVnK652fv6h7LnjttWPVlnWPjRBX/hSy4E7djJLo13V58NQUtyvoBxdK3e7mFvxFSbQMOVHpoEXQmS7yn/nKk8l90xrzgiOFG46yw1pFluihoZle7FtDE5y+wOZbGMHpO+0aeRUpHo7tzxlEUmtrMpYt8M3Sk+y6jEQkld4hkvu/xnH7
X-Exchange-RoutingPolicyChecked:
	U4Zl3FvplI6e3jABo8FOLBOw3ATbAMYR1+LbEYeezz1LM83Yxmz0XHcOBzZOtqy38z4tznBAmS4EKbowUF2QZkuewWAzQnu9fiC4irDAiCbDB+WJTomu6uNZAeesHS/W71YofoLPq5BqQeB4BAerKxU2ki4kPhWrV7ONm9kLvv2J1fWbAiCJyOThM1e/gWGHNSLsKzCVj5JlFr5MMN3XglxdCOE6qYXz0eerzqIQhX/Na6T3mTTVuECppRTdPuCzNQKnfc6+2CDRJdBYHZJA7wMXbim9Xvs3zIDLxQFCP+wLVhZJsOK0qNoaTBeUrb4GCdJfbTuotkILvZ6l2+doYg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dsmHlrs7II6veyWf8akZPd/GItDSEiEG1GS0istE6POSCHZJ+exrJMWqoO2LBQLIgb/G/+fJeg+OpnyfRAiWnqmJb2HetqdgK7ymuqgHHCibQpmj4GYr4uVObeQjry+sQpl60mXtHFgb7Dvw+IohkSlRmUP66Jyp5Klc1fszmqWlGnHKrKjL4ccoXiwyUWV5VqecK6aHjgsLFlul0AjRq0uz0ClzWGTz3Zo3rl1FZjxdsCy+byP/iNJaNNZNWSiXZ15VaB80GenVWiBTPO8ezQEzjcLOhqJ1T4BLCuyyC7sIUe74C1J+fjFKoJQRErLh0OdvPO4Sh2Py211DnSGnnNr7rVubZtnuU+purR0h7b06JK+zyn80VI2T15w+/N9/lvuMHrw7kv5KDPweantMFhckm5mxKsQJy/u4W+u0V380nzhI4zni7jey8zRCUkE46bszyD4FeOCMpLYfTB8wAb7eFZNogsBTtywBqVq1yEaPNBTpfwkPfw2q1cxhdkSe+Z2RijYWoqwFFvzSywv9sYE03fhvI9PPjxjuFliiH0zwPJuE8XNZcPEy6T7IXdol+cvMK4jD1W/sASUwfPh2tyPI2ScJzUa3t8Itc05OHzS5CnoPrzYyiSMg4pKYKM/hvIRYCV+9YDT9hUCZldRLQA==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 18:20:56.4452
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd69a9d6-bd77-4e66-0258-08df40e9b1f2
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH7PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA2PR16MB6180
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA3MiBTYWx0ZWRfX5bmYwdf7UPZl
 Yf1Neocvv1gaogLrLtzig3Fz0z42qW/zbP0iQy1JkngYwa5WPA4yUXyZ4qhiCMewh4BlBpDy7FZ
 hPiqhj4GnisPovD0DtQO/oonLapUCEid4Pp8RPLXOQHxPwPuexGP
X-Proofpoint-GUID: e3z5ypxdnUW75rKqMVpXdSzOBn3wSLCA
X-Proofpoint-ORIG-GUID: e3z5ypxdnUW75rKqMVpXdSzOBn3wSLCA
X-Authority-Analysis: v=2.4 cv=QPf91QLL c=1 sm=1 tr=0 ts=6af6038e cx=c_pps
 a=V6MklVWPegrOQeIbI7BYwA==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=N9_n2FxmZfwfyRXvS9-E:22 a=cbNQJ9GKAAAA:8
 a=b0H8GbpSBErQtZ0IwscA:9 a=DqJYxgmhk6moR-_7_KoZ:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA3MiBTYWx0ZWRfX+UPbE4HPwhe1
 wNweQQ3lD1XI+P27g9rEDD+XLg9r6rNwIYvNe3JN4F1JibzRQ5fh4PA8e4YXcuhmg6+WCd/zNF3
 bgC762MbkzctQKybfW0U04tVDwyPQ/pRGm5MZa4iABx2IAz95Ghagy/jcfDiMTJFttLKwqiDKwO
 Koytc/yrRq1239LWXU695FZtpHK6m2IHaAE9bmZ/5NrdOMZHMMZKFaD70+NfRzr4WSTPUzZsfyc
 /XEYhEHxmRkg9wKU5/kWTDH7u4YPrNRL2VG0GAVwVyvvz1jw9HvIrYhQgUPASkArTNFd2YbbuDU
 VZeY7lKnW+nFf85ozAjZ5ysX+TZmm/9atycevS9JzDqDP3KuwMGbM2PPL6InBbkxylbC36WuyP7
 J1s4hyA/017qk9sy/xahAdaDYKu/OgHpz2+syIoFHZsTDA6QKfyl0EnTXp26YcVZ0MWKzACk6HD
 8pYXnH0e6F+8WYePfDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120072
X-purgate-ID: tlsNG-ef75cf/1794507665-A4CCFAE4-4F778E60/0/0
X-purgate-type: clean
X-purgate-size: 2278
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Current printk_ratelimit() relies on hardcoded values 5000 and 10
respectively to program leaky-bucket message limiting. Now that there's
compile-time rate-limiting settings, the algorithm needs adjustment.

Use 'ratelimit_ms' and 'ratelimit_burst' variables to re-calibrate
limiter.

Ensure rate limiter is disabled if either 'ratelimit_ms' or
'ratelimit_burst' is 0.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v5:
- dropped "Fixes:" tag
- updated commit message
- dropped use of DIM_MUL2() in favor of open-coded __builtin_umul_overflow
- re-aligned use of integer arithmetics across 32- and 64-bit hosts
---
 xen/drivers/char/console.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 1a8beb6665c1..e2310b9d3c9a 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -1286,21 +1286,35 @@ bool __printk_ratelimit(unsigned int ratelimit_ms,
                         unsigned int ratelimit_burst)
 {
     static DEFINE_SPINLOCK(ratelimit_lock);
-    static unsigned long toks = 10 * 5 * 1000;
+    static unsigned int toks = UINT_MAX;
     static unsigned long last_msg;
     static unsigned int missed;
+    unsigned int limit;
+    unsigned int elapsed;
     unsigned long flags;
-    unsigned long long now = NOW(); /* ns */
     unsigned long ms;
+    s_time_t now;
 
-    do_div(now, 1000000);
-    ms = (unsigned long)now;
+    if ( !ratelimit_ms || !ratelimit_burst )
+        return true;
+
+    if ( __builtin_umul_overflow(ratelimit_burst, ratelimit_ms, &limit) )
+        limit = UINT_MAX;
+
+    now = NOW(); /* ns */
+    do_div(now, MILLISECS(1));
+    ms = now;
 
     spin_lock_irqsave(&ratelimit_lock, flags);
-    toks += ms - last_msg;
+
+    elapsed = ms - last_msg;
+    if ( toks >= limit || elapsed >= limit - toks )
+        toks = limit;
+    else
+        toks += elapsed;
+
     last_msg = ms;
-    if ( toks > (ratelimit_burst * ratelimit_ms))
-        toks = ratelimit_burst * ratelimit_ms;
+
     if ( toks >= ratelimit_ms )
     {
         unsigned int lost = missed;
-- 
2.56.0


