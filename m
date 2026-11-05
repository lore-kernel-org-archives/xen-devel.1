Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA21F606A32C
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=hVk3jnYP;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=PRWQzP4c;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=cTCVJYZk;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=N4NSYfXF
Received: from list by lists.xenproject.org with outflank-mailman.1473248.1680937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmNp-00029L-Ay; Thu, 05 Nov 2026 01:35:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473248.1680937; Thu, 05 Nov 2026 01:35:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmNp-00027M-0l; Thu, 05 Nov 2026 01:35:17 +0000
Received: by outflank-mailman (input) for mailman id 1473248;
 Thu, 05 Nov 2026 01:35:15 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmNn-0001fK-Bk
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:35:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmNm-00G6d6-OJ
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:35:14 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd1f-8faa-0a2a0a5109dd-0a2a4503bb5c-34
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:35:14 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd50-fae8-0a2a45030019-94a39217c9c6-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:35:14 +0100
Received: from pps.filterd (m0384718.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mklW966588
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:35:12 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com
 (mail-centralusazon11011046.outbound.protection.outlook.com [52.101.62.46])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4hrc5ghv3w-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:35:12 +0000 (GMT)
Received: from PH8PR20CA0006.namprd20.prod.outlook.com (2603:10b6:510:23c::11)
 by LV3PR16MB6171.namprd16.prod.outlook.com (2603:10b6:408:1ae::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:35:07 +0000
Received: from BY1PEPF00026967.namprd05.prod.outlook.com
 (2603:10b6:510:23c:cafe::62) by PH8PR20CA0006.outlook.office365.com
 (2603:10b6:510:23c::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:35:06 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 BY1PEPF00026967.mail.protection.outlook.com (10.167.244.151) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:35:06 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50nDhu3230937
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:35:06 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hnydrnp9a-11
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:35:05 -0500 (EST)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id OmNbx1A3igTjoOmNcxget3; Thu, 05 Nov 2026 01:35:05 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=f6p
	UCrSAnHxjf21Dv5dCHT2C8S7asfpdB8+/fRI4YCM=; b=hVk3jnYPtSRJGvkozNH
	hEUO5U4G9l/cv3f+i7e1gyhkMaJ8Q8Yl0+daclcVYS9k83G/DZc8Y7QEM/HyLUh4
	KBwb3dARcAiScjVvOdfu01haURqAOEPUGHQa2R5/IGVDnYZ4Hvd1NOPNTkEc7/5O
	iB3WjOkxwnJTO3A07Dbw7Smu9W+M2LDGw3tuD80vkwGIz8rZowsRG8I1oGny7B62
	/IOgQc+EHV+hJni7vXL7ATc0gV6/e9VXsLFvc5GCFdRvwD7fUNF0bm3S02oMHWlY
	IyXe+I5SrA1CbYhO0FKXNl6CdEU7Bl34lqaiLb8JPT6zBjzELG+gxXPvPuwwpuNS
	Xfg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f55cWL0mHCpkmmrBRMud5SSrlVhwQGZuHtLyztB/mEzTFmA/h+svD+MVvrdhRnNNR5X1oeTAnh2eMfSCN2QJ3xlzN23z0en4geg5N/h4moA3Qt29IBUi+La+GBtAgZEJykUUgbL9WFYiwngAZN3TCa/XL4+DyIDW2IyLN08BAbHLwFNpSHEAFuGVaZ/oei5fBRnjQgdeMK10ChhMERzupiD8hG96hvolmjdFvs8TO8dkBotz3QBDKFkYHMDgNEykgNiNtDK1DOgn4YvXkUodxotaFO9yBFTOs2AahNHlvMSt5ADHxlZnHYOLq9tdNpauojtSiBjH4ExJme1IKhEezQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6pUCrSAnHxjf21Dv5dCHT2C8S7asfpdB8+/fRI4YCM=;
 b=hz/z/RCw+vPcpm5D9KD2LokVLZw/MC/3z5wdFxISqtj5uTZ5zVcYuyNEgsXXS81N7Wp2uaUlt0MUPgdS2RcxQVSkArB9hSUUu18QNUeAJYeG4LCjewmTLlz9IeJ4iMtD1ELQOw8RlBo0CR2YGwq0ThyiMKcTcHLTPUupeqpXM6h0shCyhHvoe0AdioA85/WYJ2usxNnTGxepEGzjPl6lg7+L2zBM3r9GWsiO8lOruBIuh4fvLpZaC2WKap3p2wG4PClN85Yc5ZJsnHf1jSo0FC8IMDnoTB5AtuBiNtUZ4r/svBUDvl8HPsneHbLTpzdIGPWFWyqn09RKDgJ+cMqmZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6pUCrSAnHxjf21Dv5dCHT2C8S7asfpdB8+/fRI4YCM=;
 b=PRWQzP4cftxl6aMsAKXmhXNctHXpZTg8sSSOFpIYGYsRdIZBcCppjdAjxkheNtuuGhFlMUiFeoeWnQwZn4pVz4iOm0FSyW0U/z4tzjH8zDssdxfQ0VWnE4F8XExfrWYulNY/8PfaGaSno1LFbSIsFeTlVjQcpj+GyJGtK49TLnY=
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
	ppserprodsaar; bh=f6pUCrSAnHxjf21Dv5dCHT2C8S7asfpdB8+/fRI4YCM=; b=
	cTCVJYZkAwS0VwqYzCCmc2xZWN59po6vyoOHwVc4L00ewIVusQzt1sTuy7BL9zGJ
	YjyyO60gtYI0iPid9GMo033QxvV8cEqzuZMOSfRUzTY1TcMtfH37PNapadIZkScx
	0Lh/2rj8WS6GSZbEIJmbJo3DRDoO5Lc+zFERv9isIUOFJrtaCDampcwcOV9KzmYM
	kLvEm5G+dxrLA9VSnpt7B2s5kzUuZv9RE1fj4L83o8xqaQ5CHcFCrAG6gSXahJIA
	/DEPryc/hC9nGhJ38c/LThYGCn0QPsL5GHUC91Zsh+j+kKYKQ9sRV9o9vXERKQ+D
	7pPF2tTMQ+fp+Af19Y3/KQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=f6pUCrS
	AnHxjf21Dv5dCHT2C8S7asfpdB8+/fRI4YCM=; b=N4NSYfXFUEihgGDZlLcnmj9
	6JJb2EzkHk864XHejMDiUv1m6wqYcMeY2m21rohxoCao4ARz615sym+So193YaHw
	m8u6QTnRFjvaxbfg5zjJFfX4yN+hwZt38xNCV8fgMbzS++iqmjx50E+vujdBYPe/
	hpUueq5yyZLmpN8yroVBLfsEcyMNgRNM7++VJu1KgIrabfX25cgeWaTCBDnxNpnq
	VT7R5vjITQolK7rT3bOCI4nMkk5a2sObXvuQZqFkdCqoKd1zE0r5TR9P8Ga214yU
	abf9SaNejr8bKYU1XmpDSTBriG4yVSEpWQZeKbyyUAsJ+CU4WfeUPlC+GXX4BUQ=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmNbx1A3igTjoOmNcxget3
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
        roger@xenproject.org, teddy.astie@vates.tech, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 23/28] x86/hvm: avic: enable vLAPIC mode switch hook
Date: Wed,  4 Nov 2026 17:33:40 -0800
Message-ID: <20261105013347.719392-24-dmukhin@ford.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105013347.719392-1-dmukhin@ford.com>
References: <20261105013347.719392-1-dmukhin@ford.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050005
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026967:EE_|LV3PR16MB6171:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: aa652974-ffc5-4f0a-fca8-08df3add058c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|23010399003|6133799003|10067099003|18002099003|22082099003|11063799006|261026140227099003|261022075727099003|261102123227099003|261022105027099003|261028144727099003|261026121527099003|261021121427099003|56012099006|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	VPElIBkCeuYP5cXp6I1l9yOLc5usi761014ipNe9GdtUB7miWaBZOLMj9p+lDfHONNqBwqEy34da1rPKNnX8Bq3kwt63E5NE6RPjgDgC5S42+kuKdA8HVy3HPxNkFTbWfml6eA1mLeNLTBm5P5DkN5oQwmniwH2J/PM3xzwxLdyO4XGbmiFGWIVyMyG2fVPApCOgGIiUoy/s4ieYQ0GnjAsFRMv2ZONDA2JCcZpm5d8mogAz374ss2XNLmTsE0+xJ0l9NKWU0ks/3VOWgjp2dsOE+A/FSyUps2EDhDGCAINeHGRg8/egTZp/5iCnHSF+l1jHrI1hnc2fMCW8EZIF8IQHbB0krKZPaY1vX7MjXIfZ1+QiQbTaoVvxgV3proIJXqDDGO9FZ0DcW6kImHzwZEAZIsCHX1MsiTGNXbgo/eUc2pPJ6Gjdroa2QH1JDhEgyliBVqwAygpwaFvIC1+UR403fn9htzP1tixtZQ3pXivO6ujIAgFxl/h20NjotszP/b5erVcgvnUFhR9sTFqPDygY+J8jV2m5u5gwV4AENiGY9Nklf3VAzcnvm1za3BumsS3TBRJMPfiRY2Ferff6HCu45ELFTUbDuXopGB7cVl5sN0fMk77ws5uUNeP9DdqquJqGYnBte+/SCug7wixyX0Xm2BANBxc4NHRr+I4ituJ0HCWr59jj8andnkv65ypSAOXvPK9vmwJiMFX9Aw9LBQ==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(23010399003)(6133799003)(10067099003)(18002099003)(22082099003)(11063799006)(261026140227099003)(261022075727099003)(261102123227099003)(261022105027099003)(261028144727099003)(261026121527099003)(261021121427099003)(56012099006)(261021123027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UU3vscGxiAbmaAKqTHKMboeVPMzC3aHu71tBTBMNR1Vin9vlEUaGqwT4UBBIrqcxA5zi5jDk5NhP5wVm9fHUD5nGfYOhEwsHOie/XYdNKOUFSBxGvZKu4icQ4WDvjqAssyzziUjJ1JLvl6VIBNLplKc7vtHP8NEWvZTiMWDiHK8op+pXywwU5NsPNdxNuJZ56OVrUMsjk+iuQLszUwAFahlWI1PQssV6vzv712anN1d+N0EH2yqv3q47Bdg8eanv9Xz0nma5yM+W4jsLhSyHyJZSomtdxks6kjoips+Tt4A/XKyfHqkc7IIz/fB9Ed4RC8r7hKEOK8WaArpvhb6fjmljQmkS7CiLax/FJHdpiJaZln/e1j1lYIIunp3baa2MFpOLGjZm+BTV56VVfEx50ksJqeCvAAzODz7dMPN6MBu+Ay25bTdiv0nYciFd9/17
X-Exchange-RoutingPolicyChecked:
	iLMPd+pDGlVOrQwqwaqYA7f/pvOUkwmvrDfgq0Fkhcb8ZfaaKPIg9KKPcVNa21ogA4O+QaM6u5JUOkKzeqU4N3usVI6YRosKaL68A30sP5AIUHST+Gbk2IEU4nk9n53bIxj5IGrKHBfQkTiccbhjkkGuAzXQcrmYUNFdR8U9W/kUKGz2p9NREybhKhZ/4H7ri2vP/baMl7iKELFISI1vzQNfdCyR11cdKoc0n4+76Z8zjT5iBOO5SUkLJjzJtdgbLG2M3sElI8IkbYELMdhtF7kJLGj95t7UEkim/wlqzMGnCA1umsy1DA4i9NkP5wo/uwwHjOhFcOx7T9VKq+4NOg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ew4//NccEg/TLpivDMq6u0mpyoSMpwczG6SAquWOMwoxEAv8aT/AY7uGK9mOq1WGDbsBIGSE065x70GjkZhA+h5EuW77nuwbFeXOQBp5wtWLHhR1vyZwLc5fYhHRx3akyIoEw6FQJr+k48LmPrzZqRZ4SmNIkJAMgb37L4JDW2tuSKRNFjXj21HTzOKQ1Uk9s2rtFKz2Bye/5MuDEj2uwNf3YghxAUa6DrxNwwAvDJ4q3wV+CCa/wt5zze5Kjma1nrI92oG6uMYgO/wQp6Ps7srfDHx/lmSRwfDiXOzuzLCzo5wOLD4MAwyTqn7PUrl/L5St4XBUnn09t08CLhxEWOkey86cTmeNZR+/IRtoqDD/6ZEmQnlTq/NYbK0LihgVJvlhjvVeizXvljSC797bYHHGkOkaAgSJTwylSW8ejBSpPjoipjSzmlXR+ehuizLBgSpcEYyT7GkqPv6PReggtcTn22V8GDwkUfGbXCy5wPVgIL7w5nl+ratHdHq3CqRYbeT1yoStm0Urcqqx5ND3l3Le7JoMgJOLPJMlJECzirCsv0xPGQoC3476suKi4Si8ncP82Q97304qF9TICuVQUaQ38h/po0JxPSnVaSK4om6kdEmJhc/GEfJNtTESBg/6fRyEJ9scl+6maZkU/oMWhg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:35:06.4681
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa652974-ffc5-4f0a-fca8-08df3add058c
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026967.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR16MB6171
X-Authority-Analysis: v=2.4 cv=JawpPkKV c=1 sm=1 tr=0 ts=6aebdd50 cx=c_pps
 a=m/LAOfpIcXRJv0ug5Ru3ZQ==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=ARvDHhclS48edyKYUbLB:22 a=cbNQJ9GKAAAA:8
 a=gxlwDS1KxA4S_MIEyUMA:9 a=P0bj-C3X3jJDpopQwM1U:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfX1DPhimV95HIg
 qAOjW9qRNHkh0y7RcnnEpcHxCr5PM+J0583mmgdbv/tzcCiAd5FlLPYgMesqmUB0s9oYFqdjWbs
 JeR0R8jdV8DUIu9pA9JUJEC/ArS694X4kRS6h4HEIyR4Eow8+4SdgqEjWfFmwp3ukz19Df0kQF3
 3JE1HbUxuuey4t80frqVQa8ySIVRX/bPFA5sVwuG28ghM61t7LWjjt8+oIEKjDuc7CpGECkNzv1
 D8tR1I9ewsvKZyvMNUyqP/dK9AxGteXO8JfGPbuImDHDBdNm5prGTp7N3qfkBoHNgC4TJG0pPHm
 n2YKCgbjKz0W+R9bUkx2g07NPt2AzNLBiEgvd12SdcNFNJPzGbewAaZkSe+StnnqZ8IK3jg93YO
 peo/TjP0K+7Ax+6Hbf5FhGT5Izks3i09V7gjQDlVQJhC/3cbp7BNPj/YxzDCS3UDDeehrLxNB5W
 ORaSB1Xh1cF8qR4epRw==
X-Proofpoint-ORIG-GUID: 506hmCYN783NJh5m-5b84Siclx3YlG1-
X-Proofpoint-GUID: 506hmCYN783NJh5m-5b84Siclx3YlG1-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfX8dOOYPotzhyl
 mp4vu2fWbbeh8l96SNpszCdxjauhqbKPSpzIBNSwN/WxlSeGI0kDhUaxIv0w4oLXj7EbhBcqp/b
 Va/MPqcKUsi37PPuC+ldWMiJbbDc+DvVL6oB09JMjSu8PdaB2tQy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050005
X-purgate-ID: tlsNG-33051d/1793842514-6E8CD4E9-055C4F4A/0/0
X-purgate-type: clean
X-purgate-size: 2452
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

xAVIC does not support x2APIC operation (yet).

Until x2APIC mode is supported, ensure that AVIC gets disabled
if guest OS attempts to switch vLAPIC to x2APIC mode.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/hvm/svm/avic.c | 17 +++++++++++++++++
 xen/arch/x86/hvm/svm/avic.h |  1 +
 xen/arch/x86/hvm/svm/svm.c  |  1 +
 3 files changed, 19 insertions(+)

diff --git a/xen/arch/x86/hvm/svm/avic.c b/xen/arch/x86/hvm/svm/avic.c
index ca779be22eea..37a857f28d14 100644
--- a/xen/arch/x86/hvm/svm/avic.c
+++ b/xen/arch/x86/hvm/svm/avic.c
@@ -827,6 +827,23 @@ void cf_check svm_avic_hvm_dump_posted_intr(const struct vcpu *v)
            sv->avic_cnt_kick);
 }
 
+void cf_check svm_avic_hvm_update_vlapic_mode(struct vcpu *v)
+{
+    const struct vlapic *vlapic = vcpu_vlapic(v);
+
+    if ( !svm_avic_vcpu_enabled(v) )
+        return;
+
+    if ( !vlapic_x2apic_mode(vlapic) )
+        return;
+
+    avic_domain_disable(v->domain);
+
+    gprintk(XENLOG_WARNING,
+            "%pv: AVIC: x2APIC mode is not supported; AVIC disabled\n",
+            v);
+}
+
 static void avic_domain_dump_stats(struct domain *d)
 {
     struct vcpu *v;
diff --git a/xen/arch/x86/hvm/svm/avic.h b/xen/arch/x86/hvm/svm/avic.h
index e40aa77264ad..61bfca7a9239 100644
--- a/xen/arch/x86/hvm/svm/avic.h
+++ b/xen/arch/x86/hvm/svm/avic.h
@@ -36,5 +36,6 @@ void cf_check svm_avic_hvm_deliver_posted_intr(struct vcpu *v, uint8_t vector);
 void cf_check svm_avic_hvm_dump_posted_intr(const struct vcpu *v);
 void cf_check svm_avic_hvm_debug_posted_intr(struct domain *d,
                                              unsigned int arg);
+void cf_check svm_avic_hvm_update_vlapic_mode(struct vcpu *v);
 
 #endif /* __SVM_AVIC_H__ */
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 667e8b05eecc..77f8278c598b 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2525,6 +2525,7 @@ static void __init svm_avic_start(void)
     svm_function_table.deliver_posted_intr = svm_avic_hvm_deliver_posted_intr;
     svm_function_table.dump_posted_intr = svm_avic_hvm_dump_posted_intr;
     svm_function_table.debug_posted_intr = svm_avic_hvm_debug_posted_intr;
+    svm_function_table.update_vlapic_mode = svm_avic_hvm_update_vlapic_mode;
 
     svm_function_table.caps.virtual_intr_delivery = true;
 
-- 
2.55.0


