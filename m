Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67A6606A321
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 19:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=QSd6YW8L;
	dkim=pass (1024-bit key) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=ikiDUuMV;
	dkim=pass (2048-bit key) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=Xh0w+1Nf;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=A6vyS/Kv
Received: from list by lists.xenproject.org with outflank-mailman.1484719.1688064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREJ5-0007bJ-Ly; Wed, 11 Nov 2026 19:48:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484719.1688064; Wed, 11 Nov 2026 19:48:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREJ5-0007bA-J2; Wed, 11 Nov 2026 19:48:31 +0000
Received: by outflank-mailman (input) for mailman id 1484719;
 Wed, 11 Nov 2026 19:48:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xREJ3-0007Wo-FM
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 19:48:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xREJ2-00F4YV-SN
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 20:48:28 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c67e-bab6-0a2a0a5309dd-0a2a45028f0a-22
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:48:28 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c68b-6ca4-0a2a45020019-94a38ff1c7c0-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:48:28 +0100
Received: from pps.filterd (m0367128.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIYbBR3992251
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:48:27 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com
 (mail-westus2azon11012001.outbound.protection.outlook.com [52.101.48.1])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hvrf7v26j-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:48:26 +0000 (GMT)
Received: from BY3PR05CA0041.namprd05.prod.outlook.com (2603:10b6:a03:39b::16)
 by BL3PR16MB4372.namprd16.prod.outlook.com (2603:10b6:208:353::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 19:48:21 +0000
Received: from PH7PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:a03:39b:cafe::5d) by BY3PR05CA0041.outlook.office365.com
 (2603:10b6:a03:39b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 19:48:21 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 PH7PEPF0000000B.mail.protection.outlook.com (10.167.243.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 19:48:20 +0000
Received: from pps.filterd (m0426315.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIXlGW080917
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:20 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4htprw4x0q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:19 -0500 (EST)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id REIqxDxoBlFtUREIrxqu04; Wed, 11 Nov 2026 19:48:19 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=Ktl
	XuOyEUfBB6ob7e2noKsAOwwJwUbx82BQuyJxLIlo=; b=QSd6YW8LU+OYFPBIyUi
	QDgRuaqEvNnxG/OXD1NKiOPGzO3iwEw3hPhwdD5K+ymuk318afXl2NmFhdRzL29B
	7qAIpL+qWoCaTrfKJo88vjNoP1b+GhZxRvdxEchWoEK5pBQBTNxA/polJNdtnGQT
	d7qzqtKzq6n6SXYESk/spHobdUu1d8+guKdmiVUitdZPA3wgHqC57l3xQRDQHsI3
	48LM6ky8BVdxSdUbBB7ifHXMofWo76qRmlABuMwil2mG2p1z1NIKjpkolvefkX1D
	dM7B86PSuSBJsncaYVGOtPGP7LEXD+2B/2tUrpcwOWqq0z0tDGfdlrJ1R0zUStmt
	17w==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k3kWjYLME5sou/w46cCC8OoPcMZy8Fl7lJsp3hDcVhdEMTAN/y+20xtmJMGbi+4Vf/caHmzCSs92lmNuCBICSXvGU63Qd7wGFyoGhTum9VvgoLs7oBL3H82l2JuBr6GSUpl99tcG4cTSLSIPvfublXr7FY912v3InJtOCC2+9hbbAJCufHwFMzhJzqOHYgM22fgsw90oSBmi3xG+scU5IqXCfRTv93Mswf+jUheXbTUC5nzl2rmn6HUb2XZm4X83m1IGGn81NnYshWaS9qEVhYabEbmm4/7lqzfzg0uSRE9sDpM61Qs52e5NtQKJW6R+fExajCo9vbyjQg7eW+p6yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KtlXuOyEUfBB6ob7e2noKsAOwwJwUbx82BQuyJxLIlo=;
 b=GWLcq4XQCHduzzAigG5wvWc7rWdbS7mitXSc4XIt5399SOdHN035YelJ+CQiEfCw9h2zBJy0HP1PsazjEL7yysPi2EQlmZ4uDD10s/8fVcgvq+O0bCSCWlcts3JURWJNA74AByGRqruLRAfDpHUlBrjHTnApS98BbXiW7aJhexmrNQwAFqZ0ffObNlPDoxDpAcOZKJ666Mq4RBP0MPTabb8xqq76MIzltahYUBMBFUWQPjy0ayjDFrbFV5Zqfpdzk4HBeS750y80VtEiW1JU83IA9RxtC/xVTpU3NiT2iwhAAfuWUXxZfxVu2C3IOKgEt4PSgSZDGV4iEQJZu+WsGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KtlXuOyEUfBB6ob7e2noKsAOwwJwUbx82BQuyJxLIlo=;
 b=ikiDUuMVc6xlvdMJtMVriB8+RrEwm8wppat3CZNxYlEzV99uLtoPemm1eGaG1+z8Xng5WfxpA64uDa4QfkOPGI0fkxTHJyzfoCVGnr81PizCNgFW3cfvUXDxe/Plp/Aj0B78qXGm7FQgrixdNELZyckm8UBHs4S5Zqx//HnzGVw=
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
	ppserprodsaar; bh=KtlXuOyEUfBB6ob7e2noKsAOwwJwUbx82BQuyJxLIlo=; b=
	Xh0w+1Nf8ZzdOlZxRKIVm+UHJWIs5ZEBGsoj6fD2DOKlq634E4W4p6AF5eiIx7CR
	RlxUkxk/enPQHK4ELGr1c2+cdZ2uNa/yvIOt3uB9QYm9B1I0iOKiUEklcAGxbcj/
	ZFc7+gn/043SUj5+tjQ5mE2Kuvmh/L7usu7cqOXHi3PKVKbdmBOX29PSb2Vs+kh5
	gzeak57wPARQLzKtqqM+cAokhzchwDZd7RXL7o+ioM/KKQR+r09KSnHKp0bV8omt
	46HpRNKrS6+CMs0mjkX9YzUUTGlji/ZnkgoQB+rtlyfmrmewr6ah0KX/fazjbb4U
	vDZ7xACgQczWnTfiJMkt3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=KtlXuOy
	EUfBB6ob7e2noKsAOwwJwUbx82BQuyJxLIlo=; b=A6vyS/KvBZCGUMlfJBt5y4T
	V2vjKRe+uLXpW5yx3DJlcqkIbMjNDOCGKadaAWfwgQazDND3tVnFXxOi4JoBEkji
	A9y8+GCTzueq+VuJ/gZGxiq8x2cawvehk+YHCZbNAIeVsF78aVuHrrLbW8bt5AlU
	CcR7A/ogCR7vk67VcSmZUO8bv06Qyl65qURyqvnmrzxwrWxsM8btzG5Qi/aIda52
	WtZWsdcelsUdaV/P41G56uVPwrr6cUBcf8PNpZhraeztiAX/2O4j1MZVZfeGi++c
	AD79DzUxKvLM+0tgLRJuj20UYA2CHYXaSBw/Y7eCUC7YT99fWJjehZokIH7yJ0g=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: REIqxDxoBlFtUREIrxqu04
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v8 04/26] emul/ns16x50: implement emulator stub
Date: Wed, 11 Nov 2026 11:47:38 -0800
Message-ID: <20261111194800.1070016-5-dmukhin@ford.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111194800.1070016-1-dmukhin@ford.com>
References: <20261111194800.1070016-1-dmukhin@ford.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 adultscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110078
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PEPF0000000B:EE_|BL3PR16MB4372:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: eb25d4c4-0d29-4cc5-37fa-08df402cbd7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|18002099003|22082099003|6133799003|261009223027099003|3023799007|13003099007|11063799006|56012099006|261028144727099003|261102123227099003|261026121527099003|261021135927099003|261026140227099003|261022105027099003|261022075727099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	8oaupOXGCgL15b7BCCHSm46q6uTY5VTvE/WSoLkMP5FM5exHNIqDUbMbqDJ5+b4c92oQ8SpMp0y+l0dZ2pKgR4O+taKF8Y4NGRd9u1g7LuTlCswW+nPG8yXisA4/+qYKdQu2Dwlo0fxyHDCdEo3k+WYEDJssiyX7jRmoXoLdfkQRSe1Rk83RJb+O4t+AzKZGcvujHsV8hg6ed/s0PsNYnnksQp2z7U34BRs/506ksRP6BaWTxVp+Wto2ZYfPMii9Jb0MaOVglYfI7b/V9yk/3UrFEdn/ng9kngJO9hlBhYSiOXTwnqonBrCiSYSvWYaIHZfaViRSO29ZShZF38z6S5PhD0TAVa6YCgLjAaCSOkHwSY2BR7VGKyFJvNk+AZKBecnqmFSE9vtdSbtH0xpa8CodrFCFLKCcbzzTsz6nhKfojdn4or/0XZB7imAoqsPLYsIPEqkIc0N5OFuONXs/E8PACfRN6S62aMi7EWT52SgdQiT23aAKR3bVutIQsxq+X/MkJWcnzpld5vtt0BwZB/+qXehH/9FMKQYAcdhpDXPlfQPc8PjL9SmGrb/qHmFPCfOEq87mYfPi53u8gbK0Jb/hJ+3DdvlnG04k4eSbEuGjqdWNH5KhaSw6dScgAnrMPP1ERJR4kzKhaqVR96GXYg==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(18002099003)(22082099003)(6133799003)(261009223027099003)(3023799007)(13003099007)(11063799006)(56012099006)(261028144727099003)(261102123227099003)(261026121527099003)(261021135927099003)(261026140227099003)(261022105027099003)(261022075727099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4okt7n+8WBy8qITFVhW90oSjrbl8p1XdSEZVvx9NxjLuL6vc0qP2Kw7zILaoG1jC+Y91x5+lDqX2t2gVr3FyEvbvAPUhStxilf/5x5pfsuc0xUZJcBh1BbWyZDhBK37nzaOYL1+k2qE0xMzF1qWAlvdMgvnP553aq0M0NXxFzdFyM0jjV/DdXcTA78yPv4GnMQmvPX59LszGJ5WiLg72J+bA5wtCsWz9ym9OUo/JUJd/SxBDrM49NFcgiZB9BwaosBDZpCEn3ZrfBZPozqelkOP//wCVY8DS42puvTDBQb6mmCJ6pdvvOOwXxU03JSV/wRnZwSioXfUnLKp+w/EEZUCBE7hr8CxovSEuYZwq2Af1Po1XzSL80+OFWJgcce7GeiL9gNhdf3a1IIE+f1LRobF67YOK8Xw86zqMJ0TLVernOGuxdqP4Dd6l8j9pUJ5E
X-Exchange-RoutingPolicyChecked:
	5ked8DAnzkdeiXolUHO3U4cuDrGBjEEL6I0p8QPJdjJrEGFBDH0AvZoqVhCUq6j8t/Zsxxnfvm7UTIs+FpVPG2paOunGNbau6cTQSMdaUj+/COpFerrCI4Ys1RBOr+bg8rhjbu7FL+UA+mJiMUV6xnEmddyJvQoycN/ap//6R1yAGltXxOIplEv3KGNyHnO9wR42blrXnGRg6oeP8kbG8Jt4rGUbEm7BoLrRxQFTErX+GitqaTsTW5vujNbeyg1Ha//VJtTNRMiAcwD32utVhGLpHQvDxBEtnybA2tBGsxX/485vFKadEFZRtAoWH8trvFhxRtrtlWTIDEQTfe9Wnw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	s9UKfNVScXvjO3fpUpgsoBq3Z0qg5K3wINnBvHfz9I2fmS+ybg75QprkdRY0WG8nXgOLZo/ATASt1BywpzEPH8HYaPuMoSxlx5sZNekaqzo8deFyP0z5lmSyRPm8mB3C368qxudrgKVJstC6uVCT9n+0SE5CW+0tozpLKW3LhritGMGiO6tbWl4GgmGgiH+npUg52LGsFTFEpwZF7xf+4ZzON5w+n7/ZLvr1lUqny98ZxqT5YS/p+dmQ6DUSFDgEK4Kt+N+gp97N8/0IF4KVip2Y/0c1SrB+bLCkSB5KCvyj2vJXN3B+dwhvLD8c+IJZTRDuGQnpw5P1tlvVDoFRiwhzhb6O/j8ur5r5wNl639gbTE5gW3eQYKfDgxPWEdz3s+wKn/FwUHM+esnwAPNkdDp2URplCsJAL/6YPDfpQq0MQKDJZL0pTrfwsO6Mk0ExrezdVl7h6CTpvmyS+1npTvujoT1f41mn7PJs4sKaEfV+x3SwmW64iMMf3Pb72fHwo5t4OtmPP3hBPJ/7v4jVstN6h7gEFckJ5xS4+QieliqOFUlrRB9ksgzDOC/2977R8KAaaR+siwqG1kYhp01q/s+akyxF14TYqyr0hHtcy2YVtUMUuMmtZYmWmXS3FrLdu+DlFqD06xXmAErbIzUkAQ==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:48:20.9792
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb25d4c4-0d29-4cc5-37fa-08df402cbd7f
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH7PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR16MB4372
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX+g97szoqUdsw
 BqN3owOQDqUdElairJ4pIZMWD/tgbhoeG/800lmcwZfs8k03C7KctQdHKRABTgu25/cvUUlNWzV
 tPOqTmJy94bpFvwfdzURxHbpo8d+1izHS+BDSefpqzzC0yYKU0e3Cg7mwVWPGmdL24n2WqoETIv
 KdjJSOK2zJIlNzOdI4BC1ZuVrf6Cacf6SzfHT3tMOTPMlhd7cDXtLk6Y2++fYBxaJT7dgjfJkgj
 d6Yf62CqTvs8cqae8b50m7kuDpqR9xZVvxAt9LMzPdxQZGI5ZkL1Kah5utv9hbF1whB+c3y0jRS
 WhzKk7Y7Pm/FnrOrOyJdessej3xwdB9nnHGiGtpOj2EriHygOsHp5zeMjaHuC0W2kVnm5RDPnga
 /mwPt0iTGO/zg/7CrElYhlyDM9IKDvghCFy79q0466QnS+cLdMHVSj79/IEyeUJCjs+OxBV2W4h
 c8At18L9GtLhiKRogkQ==
X-Proofpoint-GUID: 55afIlg6c2IeuOY1A5waqx4tk4jzPXfX
X-Proofpoint-ORIG-GUID: 55afIlg6c2IeuOY1A5waqx4tk4jzPXfX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX5kKJMyo2UG0/
 UZQlFxn8QuoJtRZKRnxW6FY964SJmGsRSj4BnMHSNGOwMehfMQdwOtmdY+94TGaxxhkKL7dF6in
 RFiu7CyX4Y3qkaVf7V6VMvmwT5emtZqyh50wUZ17waUtS2+VpuYT
X-Authority-Analysis: v=2.4 cv=Ed9d0/mC c=1 sm=1 tr=0 ts=6af4c68b cx=c_pps
 a=qHyJGWWDR7+eWeZXJqH6eg==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=WER9OelvoqQQjwJToBYG:22 a=6I5d2MoRAAAA:8
 a=sozttTNsAAAA:8 a=d_n7a2gbAAAA:8 a=cbNQJ9GKAAAA:8 a=Zkw1ExCezyJid0pGuwYA:9
 a=DqJYxgmhk6moR-_7_KoZ:22 a=WmVTiCyuxqgg3mnwYu6p:22 a=NvLp1ar72F_suV_I-ZDO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 adultscore=0 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110078
X-purgate-ID: tlsNG-720697/1794426508-66EB32AC-3A75FA80/0/0
X-purgate-type: clean
X-purgate-size: 11766
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Define the placeholder for NS16550 UART emulator.

Implement alloc/free vUART hooks, add stub for I/O port handler,
initialize emulator state and define debug logging facilities.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/common/emul/vuart/Makefile  |   1 +
 xen/common/emul/vuart/ns16x50.c | 417 ++++++++++++++++++++++++++++++++
 2 files changed, 418 insertions(+)
 create mode 100644 xen/common/emul/vuart/ns16x50.c

diff --git a/xen/common/emul/vuart/Makefile b/xen/common/emul/vuart/Makefile
index 97f792dc6641..fe904f6cb65d 100644
--- a/xen/common/emul/vuart/Makefile
+++ b/xen/common/emul/vuart/Makefile
@@ -1 +1,2 @@
 obj-y += vuart.o
+obj-$(CONFIG_VUART_NS16X50) += ns16x50.o
diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
new file mode 100644
index 000000000000..6e1cfecbaa55
--- /dev/null
+++ b/xen/common/emul/vuart/ns16x50.c
@@ -0,0 +1,417 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * NS16550-compatible UART Emulator.
+ *
+ * See:
+ * - Serial and UART Tutorial:
+ *     https://download.freebsd.org/doc/en/articles/serial-uart/serial-uart_en.pdf
+ * - UART w/ 16 byte FIFO:
+ *     https://www.ti.com/lit/ds/symlink/tl16c550c.pdf
+ * - UART w/ 64 byte FIFO:
+ *     https://www.ti.com/lit/ds/symlink/tl16c750.pdf
+ * - DesignWare DW_apb_uart Databook, v4.02a:
+ *     https://iccircle.com/static/upload/img20240313113905.pdf
+ *
+ * Limitations:
+ * - Only x86;
+ * - Only Xen console as a backend, no inter-domain communication (similar to
+ *   vpl011 on Arm);
+ * - Only 8n1 emulation (8-bit data, no parity, 1 stop bit);
+ * - No baud rate emulation (reports 115200 baud to the guest OS);
+ * - No FIFO-less mode emulation;
+ * - No RX FIFO interrupt moderation (FCR) emulation;
+ * - No integration w/ VM snapshotting (HVM_REGISTER_SAVE_RESTORE() and
+ *   friends);
+ * - No ISA IRQ sharing allowed;
+ * - No MMIO-based UART emulation.
+ */
+
+#define pr_prefix               "ns16x50"
+#define pr_fmt(fmt)             pr_prefix ": " fmt
+
+#ifdef CONFIG_VUART_NS16X50_DEBUG
+#define guest_prefix            "FROM GUEST "
+#define ns16x50_log_level       2
+#else
+#define guest_prefix            ""
+#define ns16x50_log_level       0
+#endif
+
+#include <asm/x86_emulate.h>
+
+#include <xen/8250-uart.h>
+#include <xen/console.h>
+#include <xen/err.h>
+#include <xen/iocap.h>
+#include <xen/resource.h>
+#include <xen/vuart.h>
+#include <xen/xvmalloc.h>
+
+#include <public/io/console.h>
+
+#define ns16x50_log(n, lvl, vdev, fmt, args...) \
+do { \
+    if ( ns16x50_log_level >= n ) \
+        gprintk(lvl, pr_fmt("%s: " fmt), (vdev)->name, ## args); \
+} while (0)
+
+#define ns16x50_err(vdev, fmt, args...) \
+    ns16x50_log(0, XENLOG_ERR, vdev, fmt, ## args)
+#define ns16x50_warn(vdev, fmt, args...) \
+    ns16x50_log(1, XENLOG_WARNING, vdev, fmt, ## args)
+#define ns16x50_info(vdev, fmt, args...) \
+    ns16x50_log(2, XENLOG_INFO, vdev, fmt, ## args)
+#define ns16x50_debug(vdev, fmt, args...) \
+    ns16x50_log(3, XENLOG_DEBUG, vdev, fmt, ## args)
+
+/*
+ * Number of supported registers in the UART.
+ */
+#define NS16X50_REGS_NUM        (UART_SCR + 1)
+
+/*
+ * Number of emulated registers.
+ *
+ * - Emulated registers [0..NS16X50_REGS_NUM] are R/W registers for DLAB=0.
+ * - DLAB=1, R/W, DLL         = (NS16X50_REGS_NUM + 0)
+ * - DLAB=1, R/W, DLM         = (NS16X50_REGS_NUM + 1)
+ */
+#define NS16X50_EMU_REGS_NUM    (NS16X50_REGS_NUM + 2)
+
+/*
+ * Virtual ns16x50 device state.
+ */
+struct vuart_ns16x50 {
+    uint8_t regs[NS16X50_EMU_REGS_NUM]; /* Emulated registers */
+    const struct vuart_info *info;      /* UART description */
+    struct domain *owner;               /* Owner domain */
+    const char *name;                   /* Device name */
+    spinlock_t lock;                    /* Protection */
+    struct xencons_interface cons;      /* Emulated RX/TX FIFOs */
+};
+
+static inline void ns16x50_lock_init(struct vuart_ns16x50 *vdev)
+{
+    spin_lock_init(&vdev->lock);
+}
+
+static inline void ns16x50_lock(struct vuart_ns16x50 *vdev,
+                                unsigned long *flags)
+{
+    spin_lock(&vdev->lock);
+}
+
+static inline bool ns16x50_trylock(struct vuart_ns16x50 *vdev,
+                                   unsigned long *flags)
+{
+    return spin_trylock(&vdev->lock);
+}
+
+static inline void ns16x50_unlock(struct vuart_ns16x50 *vdev,
+                                  unsigned long *flags)
+{
+    spin_unlock(&vdev->lock);
+}
+
+/*
+ * Emulate 8-bit write access to ns16x50 register.
+ */
+static int ns16x50_io_write8(
+    struct vuart_ns16x50 *vdev, uint32_t reg, uint8_t *data)
+{
+    int rc = 0;
+
+    return rc;
+}
+
+/*
+ * Emulate 16-bit write access to ns16x50 register.
+ * NB: some guest OSes use outw() to access UART_DLL.
+ */
+static int ns16x50_io_write16(
+    struct vuart_ns16x50 *vdev, uint32_t reg, uint16_t *data)
+{
+    int rc = -EINVAL;
+
+    return rc;
+}
+
+/*
+ * Emulate write access to ns16x50 register.
+ */
+static int ns16x50_io_write(
+    struct vuart_ns16x50 *vdev, uint8_t reg, uint32_t size, uint32_t *data)
+{
+    int rc;
+
+    switch ( size )
+    {
+    case 1:
+        rc = ns16x50_io_write8(vdev, reg, (uint8_t *)data);
+        break;
+
+    case 2:
+        rc = ns16x50_io_write16(vdev, reg, (uint16_t *)data);
+        break;
+
+    default:
+        rc = -EINVAL;
+        break;
+    }
+
+    return rc;
+}
+
+/*
+ * Emulate 8-bit read access to ns16x50 register.
+ */
+static int ns16x50_io_read8(
+    struct vuart_ns16x50 *vdev, uint32_t reg, uint8_t *data)
+{
+    uint8_t val = UINT8_MAX;
+    int rc = 0;
+
+    *data = val;
+
+    return rc;
+}
+
+/*
+ * Emulate 16-bit read access to ns16x50 register.
+ */
+static int ns16x50_io_read16(
+    struct vuart_ns16x50 *vdev, uint32_t reg, uint16_t *data)
+{
+    uint16_t val = UINT16_MAX;
+    int rc = -EINVAL;
+
+    *data = val;
+
+    return rc;
+}
+
+/*
+ * Emulate read access to ns16x50 register.
+ */
+static int ns16x50_io_read(
+    struct vuart_ns16x50 *vdev, uint8_t reg, uint32_t size, uint32_t *data)
+{
+    int rc;
+
+    switch ( size )
+    {
+    case 1:
+        rc = ns16x50_io_read8(vdev, reg, (uint8_t *)data);
+        break;
+
+    case 2:
+        rc = ns16x50_io_read16(vdev, reg, (uint16_t *)data);
+        break;
+
+    default:
+        *data = UINT32_MAX;
+        rc = -EINVAL;
+        break;
+    }
+
+    return rc;
+}
+
+static void ns16x50_access(int dir, unsigned int type,
+                           unsigned long addr, unsigned int size,
+                           uint32_t *data)
+{
+    const char op = (dir == IOREQ_WRITE) ? 'W' : 'R';
+    struct domain *d = rcu_lock_current_domain();
+    struct vuart *vuart = vuart_find_by_resource(d, type, addr, size);
+    struct vuart_ns16x50 *vdev = NULL;
+    const struct domain *owner;
+    const struct vuart_info *info;
+    const char *as;
+    uint32_t reg;
+    unsigned long flags;
+    int rc;
+
+    if ( !vuart )
+    {
+        printk(XENLOG_ERR "%c @ %#"PRIx64" %d: not initialized\n",
+               op, addr, size);
+
+        ASSERT_UNREACHABLE();
+        goto out;
+    }
+
+    vdev = vuart->vdev;
+    ASSERT(vdev);
+
+    ns16x50_lock(vdev, &flags);
+
+    owner = vuart->owner;
+    ASSERT(owner);
+
+    if ( d != owner )
+    {
+        ns16x50_err(vdev, "%c @ %#"PRIx64" %d: does not match current domain %pd\n",
+                    op, addr, size, d);
+
+        ASSERT_UNREACHABLE();
+        goto out_unlock;
+    }
+
+    info = vuart->info;
+    ASSERT(info);
+    as = (info->base_type & IORESOURCE_IO) ? "ioport": "iomem";
+
+    reg = addr - info->base_addr;
+    if ( !IS_ALIGNED(reg, size) )
+    {
+        ns16x50_err(vdev, "%c %s %#"PRIx64" %d: unaligned access\n",
+                    op, as, addr, size);
+        goto out_unlock;
+    }
+
+    if ( reg >= NS16X50_REGS_NUM )
+    {
+        ns16x50_err(vdev, "%c %s %#"PRIx64" %d: LCR=%#02x %#02x %#x: not implemented\n",
+                    op, as, addr, size, vdev->regs[UART_LCR], reg, *data);
+        goto out_unlock;
+    }
+
+    if ( dir == IOREQ_WRITE )
+        rc = ns16x50_io_write(vdev, reg, size, data);
+    else
+        rc = ns16x50_io_read(vdev, reg, size, data);
+
+
+    if ( rc == 0 )
+        ns16x50_debug(vdev, "%c %s %#"PRIx64" %d: LCR=%#02x %#02x %#08x\n",
+                      op, as, addr, size, vdev->regs[UART_LCR], reg, *data);
+    else
+        ns16x50_err(vdev, "%c %s %#"PRIx64" %d: LCR=%#02x %#02x %#08x: unsupported access\n",
+                    op, as, addr, size, vdev->regs[UART_LCR], reg, *data);
+
+out_unlock:
+    ns16x50_unlock(vdev, &flags);
+out:
+    rcu_unlock_domain(d);
+}
+
+/*
+ * Emulate I/O access to ns16x50 register.
+ * Note, emulation always returns X86EMUL_OKAY, once I/O port trap is enabled.
+ */
+static int cf_check ns16x50_io_handle(
+    int dir, unsigned int addr, unsigned int size, uint32_t *data)
+{
+    ns16x50_access(dir, IORESOURCE_IO, addr, size, data);
+
+    return X86EMUL_OKAY;
+}
+
+static void ns16x50_reset(struct vuart_ns16x50 *vdev)
+{
+    memset(vdev->regs, 0, sizeof(vdev->regs));
+}
+
+static int ns16x50_init(void *arg)
+{
+    struct vuart_ns16x50 *vdev = arg;
+    const struct vuart_info *info;
+    struct domain *d;
+
+    ASSERT(vdev);
+
+    d = vdev->owner;
+    info = vdev->info;
+
+    if ( info->base_type & IORESOURCE_IO )
+    {
+        register_portio_handler(d, info->base_addr, info->size, ns16x50_io_handle);
+    }
+    else if ( info->base_type & IORESOURCE_MEM )
+    {
+        BUG_ON("unimplemented");
+    }
+    else
+        ASSERT_UNREACHABLE();
+
+    ns16x50_reset(vdev);
+
+    return 0;
+}
+
+static void cf_check ns16x50_deinit(void *arg)
+{
+    struct vuart_ns16x50 *vdev = arg;
+
+    ASSERT(vdev);
+}
+
+static void * cf_check ns16x50_alloc(struct domain *d, const struct vuart_info *info)
+{
+    struct vuart_ns16x50 *vdev;
+    int rc;
+
+    if ( !is_hvm_domain(d) )
+    {
+        ns16x50_err(info, "not an HVM domain\n");
+        return ERR_PTR(-ENOSYS);
+    }
+
+    if ( vuart_find_by_resource(d, info->base_type, info->base_addr,
+                                info->size) )
+    {
+        ns16x50_err(info, "already registered\n");
+        return ERR_PTR(-EBUSY);
+    }
+
+    vdev = xvzalloc(typeof(*vdev));
+    if ( !vdev )
+    {
+        ns16x50_err(info, "failed to allocate memory\n");
+        return ERR_PTR(-ENOMEM);
+    }
+
+    ns16x50_lock_init(vdev);
+
+    vdev->name = info->name;
+    vdev->owner = d;
+    vdev->info = info;
+
+    rc = ns16x50_init(vdev);
+    if ( rc )
+    {
+        xvfree(vdev);
+        return ERR_PTR(rc);
+    }
+
+    return vdev;
+}
+
+static void cf_check ns16x50_free(void *arg)
+{
+    if ( arg )
+        ns16x50_deinit(arg);
+
+    xvfree(arg);
+}
+
+#define ns16x50_emulator                \
+{                                       \
+    .compatible = "ns16550",            \
+    .alloc      = ns16x50_alloc,        \
+    .free       = ns16x50_free,         \
+    .dump_state = NULL,                 \
+    .put_rx     = NULL,                 \
+}
+
+VUART_REGISTER(ns16x50, ns16x50_emulator);
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.56.0


