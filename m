Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89074606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=dEgmJz1Y;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=RiZjXfzB;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=ncoBhTJa;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=BQnEb7Z3
Received: from list by lists.xenproject.org with outflank-mailman.1473164.1680757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmMw-0003Sz-0Y; Thu, 05 Nov 2026 01:34:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473164.1680757; Thu, 05 Nov 2026 01:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmMv-0003Sr-T4; Thu, 05 Nov 2026 01:34:21 +0000
Received: by outflank-mailman (input) for mailman id 1473164;
 Thu, 05 Nov 2026 01:34:20 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmMt-0003Se-FF
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:34:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmMs-00E0LG-Ke
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:34:18 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdcc3-8faa-0a2a0a5109dd-0a2a45098d66-38
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:34:18 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd18-be1a-0a2a45090019-94a39217b6d0-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:34:18 +0100
Received: from pps.filterd (m0482516.ppops.net [127.0.0.1])
 by m0482516.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6A50mali1531031
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 17:34:16 -0800
Received: from sa9pr02cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11013018.outbound.protection.outlook.com
 [40.93.196.18])
 by m0482516.ppops.net (PPS) with ESMTPS id 4hr9tfbh7w-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 17:34:16 -0800 (PST)
Received: from LV3P220CA0015.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::25)
 by PH6PR16MB682182.namprd16.prod.outlook.com (2603:10b6:510:3f7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:34:13 +0000
Received: from MN7PEPF00000151.namprd04.prod.outlook.com
 (2603:10b6:408:234:cafe::a) by LV3P220CA0015.outlook.office365.com
 (2603:10b6:408:234::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:34:13 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 MN7PEPF00000151.mail.protection.outlook.com (10.167.254.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:34:12 +0000
Received: from pps.filterd (m0373460.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50no211488046
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:34:11 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hp232whvt-6
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:34:11 -0500 (EST)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id OmMjxugK2z55iOmMkxXHqZ; Thu, 05 Nov 2026 01:34:10 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=pv6
	n2AWX+aK3aExx3SOvgOayNtOgONeHXWipd04265s=; b=dEgmJz1Y46YWgbbjypC
	n3+5OxcWz5JD87TR7YaCkxWW43wrgWcyQeeixyAeRZuv1eJDpgVzN62dFs49R5Q4
	BcrJ9X21+uGOTZk5FxL5qQCmGHqZ0reJj5Y1YLyipSDf2ZFr8N7t/gc49y2tEmCz
	5fxKthyiyCHonmGsI50bWtdlD01oj8UCczFeSMnyBhxEdyzbJpfpvaVN0rgqmVqt
	iPULZupRp/lbw1nuj+g0lyLeFBzmCDnqcs4WsEOQ5FTG5RJud7NdtfPi8GWGtOOG
	2ObARAWsd97YdGTufHd8t6V0kAgysnag5OcecgOy+KF/EElsWVD/KNiwYbrP3dzp
	pBQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CToBE0o284YyW82BFjzhfDk/Bx77Lj4S2R/ktdTaNUKn5OLXOXZGR7c3umxy0JaIf4DtLcPfrOwo9JtgXLF12VL6VUz7PVId3ZDN0jfa7DhhaG4MnPTBtXWjihPXAq9wNrtyHJIZEQ92z0EbDT+0EQZuUcrTLFCqYNlRq2Ka2ckZKWPt+5uvazhRMhFUwndrbFlEKTkcvGKN8kLMRdBpjoDOpV3sJ0NsRkFIYkBaCiGUTnNJ3k1Z4ldqqcrr/z/xWaErnUgCRCqKe4zXbz0HA8UCFGXwJS/pO9HESj79hutldRfCVIpgwMTq81JQBkcj71y/3V/njHuTyHoE4KRW5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pv6n2AWX+aK3aExx3SOvgOayNtOgONeHXWipd04265s=;
 b=jre0OpIHWEWWL7TUYpZ1EDN//HGOUhHJGJ2pq4ATOkIZlDV6OO9Hje+Z5rpAPaTlFaT+F9DkvNVEzemfBe5cESnyZ8DfcXK/e0vHKnWZnZAtNhSPhP8lV/KYtTQJhcLcbtNApdm1jJ0CMwso+3QLd2btCE4c9zapi2M31ye1mTDRxj3aKA6UnkZdDACvMqRjm+ZTnHHA5EODa8gekzu2kLe3klqk8TAD8lF2IojzhzyDJsox0H16l/iAQB5j0BKaFQFGtNEz+GrtKg+bPlGDR/ONX2Qfld+EmAlYHKDblozIiV1uokfASOv3JOc9jVuArPlrAVIDxi6ZFiVEs8Xdgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pv6n2AWX+aK3aExx3SOvgOayNtOgONeHXWipd04265s=;
 b=RiZjXfzB6VCx6wa0oQDxgwz6sxOFM9+yUBrilsTm+21XPiEbNjg/bRq2jqvOQGa2utfmOkX1KvKuoiTFL3C0pLj/XC4vYJPjmItg9I0PPVGPp0qynmos7qvRE5v581HplPFvR79hv0cgZHSYVtMpFz59YXKzYwXUStBtV36ozsU=
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
	ppserprodsaar; bh=pv6n2AWX+aK3aExx3SOvgOayNtOgONeHXWipd04265s=; b=
	ncoBhTJaO4DjOokWgtq/XpfhNOpSjtoFiakFr2/CubQBkx/fihJ9vchNFLxTDUmo
	XghEv5K8LGCkVQKA9foY1ovB7wtquW0DXsm4Lsz5u/obtO3M5Y847FpM5Fig+RIY
	YnPeBBO+zgtKSrPb6OZBqmchi1ZOrRf9bIiHbf0jPqAtGcUfJUGiwaAiZaEDdDEo
	vUrMGZ3JVG77hasgZkRuW2fDPC20yH2olWXC92IQNS4x/9MBu8+2W5dT8pDEkYvp
	QnElU4QygMsQO5WRnr81ETENikbnmDkmjHIgFs6B7kOKFRKvMfuQB5uTgttawOt7
	Xk292o57T0qzp1KLFauYrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=pv6n2AW
	X+aK3aExx3SOvgOayNtOgONeHXWipd04265s=; b=BQnEb7Z3rMnONoJLW+0oRGM
	fA9EdipsJQBRAUaovRjZDQTDenYK7qD/S3gbdXo1R4nJd8UsQLQj9cqORT12Ws8+
	iOJnlIRhwlBq56EBUmuoeZEMY+ibainDF99e5agH8X84MDvNu6eGa3y71rzPbdcy
	aaRcKtwquQK4Ccu6fM2i0/cHXnY585qnP7DRMDt1izGJI3nwm7rATtYzt6CJz+JU
	OvLVi0ToC2xMeIiXqiqezJXikDIiAYIgBphmzAsZDUy9nBPpAyVtF/SFhtLSa1sp
	HEHeB80JbeJSE8+HMQFsMAwrGu4AJ+cyDhymmclHz9B4meun/v4VsgFFCYFixyQ=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmMjxugK2z55iOmMkxXHqZ
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
        roger@xenproject.org, teddy.astie@vates.tech, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 01/28] x86/hvm: move SVM feature printout to a separate function
Date: Wed,  4 Nov 2026 17:33:18 -0800
Message-ID: <20261105013347.719392-2-dmukhin@ford.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050005
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN7PEPF00000151:EE_|PH6PR16MB682182:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: dbd45c27-dfca-4fad-8e87-08df3adce56e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|11063799006|56012099006|261021123027099003|261022075727099003|261022105027099003|261021121427099003|261102123227099003|261009223027099003|261028144727099003|261026140227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	829yYN63s6PoNAgKX7HtAdrljif5Vd5GdSce5wCZG3Z0tZP2dl7HuVXgLPTSyn0H7neWo3qVpXRWzkaa9sZVA+ihvCWzrrBaCjlQ20HUbZVZLJJHzF5bMv7d5gYP57UoTp/+xtaRlNqMfWJjq84+eFML+WPozPkdBEKuKVkxJV1DqorEwYwFFm1ZNpqYQpTiXewTM6XtwQuIu+Oe28trGJmST1/NDJ+IsUuU1tbhQiEPw/rVkRxAXZgCVQm6GMEc2FebeH6Y/GhU7GwdADTgoKP80j/SXHlh8lgiDfwHoIlpdz6z3Mr3oDW9eUXGpMBbiVQtByL7abVgqAtG2TbaQMbIGoL2iZn3a2xBci/PPFKDFXRd8u8kG3MVbxwLWEQC++tQfSM45WPXlbmF/SjtH5kEwS6UWLu9xG/+8VoCPNFFz2cCWPPuvqtm7W5tteJaDbwrfYMA/hCX6Tey311RDcmRE/Ke7nANuOLoPIHfNIAXbzIxwMB5ccKf5R33TnjnlxnaUl23MiwaMwtceaSt8qjHnscrUbcWmzekKF3CTGVrNaqJbnpiDaJTvr+amKxGdjbaN0LF3iCCzsbxV3L2+WEQKXu4mB7L77wo9Sg8MO0W8QGatAJC/jRSwrcrFqaKwx3M4FQk4Kua2rrLdEjrS10UdG91kjZyhnsPllBJc/++7eb0VrsShCZI6LiCnac9tBdDdxdkSn208MTVIbrrSw==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(11063799006)(56012099006)(261021123027099003)(261022075727099003)(261022105027099003)(261021121427099003)(261102123227099003)(261009223027099003)(261028144727099003)(261026140227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TrpEcCxRkUjKPeVyoAy6Utv53m8HLU077qwL80Wf9fiBVWMHWXMABNp/oCj3cU9xYaMcQgHBqb8vIcVKKG3svF40nkLNs7Ao7VH4cNfEpXfX8XWEOwh2JUijP0HnWhYOgzIeVnfUXOsP60IbMentx0CLOcSJJYsNH6jT6mNQyAUZyMDcyLylI0LsDwwlZZ1v3ElAgp2oY0ulgCWgSkEXpQvnmjdWtksoobdgUsvD4c+2r+9piKyIBDOPPAqzddx5EQXuVk28ENVk3tmwDoPIJAQnxPDWP+9LFrCWqyQqfMzgBssgtKNjpwyhTDdTgX4lJWGFdTQyPEnhsm9O+WiHmWtwNlVyBdqDFNBvT1NUC7iZBtvhu5A+AOa6smNx5Fu6P8euvyw9QmNxqTEwLRG+d/hMwhNs0PNGCx3JyLL/UCHSN6WhmZBczdbr3XVcnCf9
X-Exchange-RoutingPolicyChecked:
	VS0Hmu+eIjwk+htoLhc++AGD4KspfF0N6qUbPYqC54+/dvAvf/URNRPnq/xO8rOZps7yBe78QvCUIFx4hedrAg44d4yz1wl+IkZaAF5t3TraSz+QTPIAyvod5VcLBC9XAdkHtvoBR1RB46EL4v0TYgvNeRddiZAyVjCmW6CAdRBxsNABI4aPK+YMSAqCTj7d6cAYbpoiwY8k8ceNM7mp+YDZqLRkvxH/MvFX08yRaVNImYjM60wnln4xyZbKqsR2ZZqcVBerJ80tbhNUQAEXyFCRu8hZLZ4ycR+CbxjR+PJiOygrqnrjNavMC/4sfcsOkI7sYoC2xvS8Jla9vE0urw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	p4LE+fDPC3p1SIb4d1E4JZl7liThSxZaq+CVuxFMS2Ph4QNrdCLUeBKrBu6CsN5mh9F7aSSxJTzoME0f2Vimqj74jHOfxSWUG5OQAf1xGGrfEhPT6WzPgGRFqr67OLpwDSmgNL1u9GcD4BLQ1rdrTCWiyqdH68NbEodv0+YdW6UIktFiq+DmyoH764hWUAHTXgxNYpRiRXZZ3j+szVBke9+0ZVVPbX9DVBkqT3I+aEhZ39VWnh9/HI4L4hwPMeJtG5rb3sPxZ+hIUn4+dkxcd755ahwo0PivCUb4CaPOiGBhsTyyb4up8jG58qpz30Ivy2CX1Ff/hVF3CWwOMPelglrv5cbWqjBUa7kcbTBKH/4v+infTl5+OQ/fOQDGD6KTUVpVXGIJq4203wBhdXqxdOaFOReX9SAk53rSaDTje4QHYfDuswYvovFk3QgYZU2dloVNDgf50+W7Yn+/t+vYG93xlhva5yNG+HQwM9sznE9zDb8rXfAkineuhGW5jO9cWlX28EBEQ22s8EqtWZ0H1gqkMWotG7CkFt7t4cF+gDFHNksMKw9yzTBBcwLE9+w9rP6Pha4Tlbt+8vzt60gL5z1CpqkCScic7AG8CJZTGq5TSgNZKxJauR9/secPkagNkVduOO1ilfrQys/pjCUGKA==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:34:12.3203
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbd45c27-dfca-4fad-8e87-08df3adce56e
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN7PEPF00000151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH6PR16MB682182
X-Authority-Analysis: v=2.4 cv=XfAcX455 c=1 sm=1 tr=0 ts=6aebdd18 cx=c_pps
 a=H/ESeL7FTwDXaNlIHo07Cw==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=NvsXeTrgx-CJMFV-xl94:22 a=cbNQJ9GKAAAA:8
 a=kKEyoEiVLeL724AGoU8A:9 a=G69WFyCBNqGPyalROSdv:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfX7kKxUmBHjp9V
 V9oNDXzM0Dw5UAaMEjI/xFp5IAXmpvYMaCtSl+P6TiCNKjqwxj8mgXwd4hYZj7EfXzmS9C4hBv/
 k7yzsOuKqKjuJ+O7huD4eB7M62eI3dtEb9qfL78YdfRqaUc/OcK2
X-Proofpoint-GUID: O1eLQ5L_I3EwiYXj6igzbTSAPVjNzFlP
X-Proofpoint-ORIG-GUID: O1eLQ5L_I3EwiYXj6igzbTSAPVjNzFlP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfXyH9TAmwnevWR
 OkgvROeN50guXi8tUJGBmYoaiWvNbBBEhXqKDjzP5kehlKaY9VTI1BWBKuJQNgVKoWBsllfjzsl
 HWe866V4KzDviChr67Qnb8OaAh/7bCoqDfMHer96N94sOSIg6tmgYIGWPF3eOc/ncp00X6pYhY5
 L4O4O68fOvF5hLofPxGrCloL/C6+QGKxmLBw0jQ6bMRe4Fs68vVEaiBKwefNM5awkfffnsfk2QQ
 m27RAsOCY02hNXoDsUJR9sYkhPgMIhlrKL4k5YEo1JytaD+xaCXZUxjgSgQGEdcxu3DonaVEH5e
 3sPccYzdcdmqanbFMv2UtZTXCscglIkb/tN9V22l6RQmjX0nw2G8OJ5ou5mGcx895hW96CX7Zxq
 KldFAi6Imp4orjaXjPWEiFREjmaTVv0ciiCD0P586OdYF6YVfskVCGbEZeDYcK8CPTNlotWfFNp
 Xkv/mzza8rAj+C3RrQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050005
X-purgate-ID: tlsNG-bad1c0/1793842458-39CC7034-D306E108/0/0
X-purgate-type: clean
X-purgate-size: 2767
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Isolate long SVM feature list printout in a separate function to
improve readability.

Not a functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/hvm/svm/svm.c | 49 +++++++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 666bcd3eb483..e11d5c55248d 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2434,33 +2434,12 @@ static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
     },
 };
 
-const struct hvm_function_table * __init start_svm(void)
+static void __init print_svm_features(void)
 {
     bool printed = false;
 
-    svm_host_osvw_reset();
-
-    if ( _svm_cpu_up(true) )
-    {
-        setup_clear_cpu_cap(X86_FEATURE_SVM);
-        printk("SVM: failed to initialise.\n");
-        return NULL;
-    }
-
-    setup_vmcb_dump();
-
-    if ( boot_cpu_data.extended_cpuid_level >= 0x8000000aU )
-        svm_feature_flags = cpuid_edx(0x8000000aU);
-
     printk("SVM: Supported advanced features:\n");
 
-    /* DecodeAssists fast paths assume nextrip is valid for fast rIP update. */
-    if ( !cpu_has_svm_nrips )
-        __clear_bit(SVM_FEATURE_DECODEASSISTS, &svm_feature_flags);
-
-    if ( cpu_has_tsc_ratio )
-        svm_function_table.tsc_scaling.ratio_frac_bits = 32;
-
 #define P(p,s) if ( p ) { printk(" - %s\n", s); printed = 1; }
     P(cpu_has_svm_npt, "Nested Page Tables (NPT)");
     P(cpu_has_svm_lbrv, "Last Branch Record (LBR) Virtualisation");
@@ -2481,11 +2460,37 @@ const struct hvm_function_table * __init start_svm(void)
 
     if ( !printed )
         printk(" - none\n");
+}
+
+const struct hvm_function_table * __init start_svm(void)
+{
+    svm_host_osvw_reset();
+
+    if ( _svm_cpu_up(true) )
+    {
+        setup_clear_cpu_cap(X86_FEATURE_SVM);
+        printk("SVM: failed to initialise.\n");
+        return NULL;
+    }
+
+    setup_vmcb_dump();
+
+    if ( boot_cpu_data.extended_cpuid_level >= 0x8000000aU )
+        svm_feature_flags = cpuid_edx(0x8000000aU);
+
+    /* DecodeAssists fast paths assume nextrip is valid for fast rIP update. */
+    if ( !cpu_has_svm_nrips )
+        __clear_bit(SVM_FEATURE_DECODEASSISTS, &svm_feature_flags);
+
+    if ( cpu_has_tsc_ratio )
+        svm_function_table.tsc_scaling.ratio_frac_bits = 32;
 
     svm_function_table.caps.hap = cpu_has_svm_npt;
     svm_function_table.caps.hap_superpage_2mb = true;
     svm_function_table.caps.hap_superpage_1gb = cpu_has_page1gb;
 
+    print_svm_features();
+
     return &svm_function_table;
 }
 
-- 
2.55.0


