Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A32606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=DlsJOiWY;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=BxQ5TbAF;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=e0HAnisL;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=SaTNFzBs
Received: from list by lists.xenproject.org with outflank-mailman.1473484.1681161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmR9-0000n9-OK; Thu, 05 Nov 2026 01:38:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473484.1681161; Thu, 05 Nov 2026 01:38:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmR9-0000mv-Kq; Thu, 05 Nov 2026 01:38:43 +0000
Received: by outflank-mailman (input) for mailman id 1473484;
 Thu, 05 Nov 2026 01:38:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmR8-0000ht-MI
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:38:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmR8-00CQpG-2x
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:38:42 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebddcf-bab6-0a2a0a5309dd-0a2a4502bfa8-30
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:38:42 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebde20-6ca4-0a2a45020019-94a38ff135ca-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:38:41 +0100
Received: from pps.filterd (m0367127.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mhQq226494
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:38:40 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com
 (mail-eastusazon11012002.outbound.protection.outlook.com [52.101.53.2])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hrfaurcnf-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:38:40 +0000 (GMT)
Received: from PH5P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::8)
 by MN6PR16MB5452.namprd16.prod.outlook.com (2603:10b6:208:479::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Thu, 5 Nov
 2026 01:38:36 +0000
Received: from PH4PEPF0000B60D.namprd21.prod.outlook.com
 (2603:10b6:510:34a:cafe::38) by PH5P220CA0001.outlook.office365.com
 (2603:10b6:510:34a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:38:36 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 PH4PEPF0000B60D.mail.protection.outlook.com (10.167.243.88) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.2
 via Frontend Transport; Thu, 5 Nov 2026 01:38:35 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50nXK6060892
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:38:35 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4hnxy7wh93-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:38:35 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id OmQxxhfsGkWyrOmQyxKFdO; Thu, 05 Nov 2026 01:38:34 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=1d8
	+XzUZdonsIHMia6oE4cdHIDpUnF1JMunvXbneVCc=; b=DlsJOiWYgKR1OQAnfBw
	KW08FMam1tp3CXrEmtYDpEeFSTypXlctrBU6eXon+wa5uwBi7wrj+VrAjhltCbZf
	yUAWuTCEL4T3vKzasLe6HNZsn+cSh9ncMZrYR8Xw+gbxfeT/QKDvbmrCpt+KIXaP
	eXo1CphjOl2puBOXTt6iMJduBdmny33xVtVVt7igdkRrLkA8JBfQGMczfe0FaXOJ
	bT9DHAeowycAPLK0C4V2aPKKtQAPxdr2ou3b/pNHG9fRouWT7LyAzE5IrmILcrrX
	cwmYaE5TqEgLXVLXsKJSbTF7MqD3S3FyXC8tSyd6DpNLchk1sFDFPyYHyLAbb9EI
	Avw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UyBoGwEYrQVoqR661tKCRVlKPbdiyMBKmVJc2b+gNDa5To1yc6JcxDt/n7FgnVQPrpjvOAFkgAjUwzh3uau4+n7+2VkChIkZUwig9hSWY7YcAYP2PJ00v6y3ENuWIWR5Bl1zM/WJrfji0hc71VtR7oy60s269a+4ruRO1AAIb5iDntsZdImhFqwxevKon875QDxWYYMSx0Ods+IU7hnvhTVg9TQ52ZuuSb563uYH/80aKQras9dB70iXsIV+xFr4s4uDaH5WOloqyGDCA4WYI/GH5mth1iaG3BNhi4qAJpiZwEdNTxBr8UtCpBfct/AtRqzGCercAg6ff56rCtN8sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1d8+XzUZdonsIHMia6oE4cdHIDpUnF1JMunvXbneVCc=;
 b=Geq7il4+3qJhoGXvNmPaCgNodzKe0bvu7I7AIBACX8HRLEuHqonOek9JuHh7MknW/jwAuZoybTn+aWJc142YRJu1EYEo2cgrShuvyhROEZJatABr3YS7nun1uw9CwzOGmZcI+In5dI22knicGSWALOyEJBQSFK3VFX0yrXZ21oy7UDFb/dbsf988qBrHgOgcv15LxsKIVKf/5FdhfQDOFo+r+CIwqwteXlGSqxJvl655/WQQ9Pl4mCaTdWgbYNHaAJsVpvm+yXgCR8AQ0LTL0P0yjdO7BH0Vrz2n63bZtl3ISxfk1bOyQJ15MNuOezCX8fMpmHeIEXyMZ/l65m4jIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1d8+XzUZdonsIHMia6oE4cdHIDpUnF1JMunvXbneVCc=;
 b=BxQ5TbAFgX+7BATJ4a6MnZ0IwLauVmJaz3kEzKw8EBCan3VGn9mx1KYuZRAxJtxxDJF8GeoES2evcwhV6/kzL8qihNyRpKIvqqoKtRgJALvzncFs4ljkpRNa9jx/oYeqvgCOqdPNe0LhsZmmNS+3e67cuwRlcCxQx4duAiTSSm8=
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
	ppserprodsaar; bh=1d8+XzUZdonsIHMia6oE4cdHIDpUnF1JMunvXbneVCc=; b=
	e0HAnisLpA6KxGg5rdnrhffBgX0ISDGXfLi/PXikEfEY3x1cuGeQW5+kKOxWwiuR
	6vycQH0WOcY1QAunkYFIuNHKVccMsWQKg4bokuBZtogudDh54C4tqJnAo30xfIGT
	UWdJaD97Gd90CxECWjKLPaTTNUnvITl7EPUJXbSObNlIOgaxbHsEsaIXFEOK7UqG
	VqgfwVU6P1sWHv9avVhjYSYohpRVJazYfqjgO8AjPiVrMlgIlOW81hwFlwRCmHwr
	8GXduETWmxz7xgfQ2He3TJeYGoEinOlbzUsyMcqb/5f2rXE4IYZAr9/YFeCYsXVB
	vopC4MK/cPE9OPJ2kcWgHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=1d8+XzU
	ZdonsIHMia6oE4cdHIDpUnF1JMunvXbneVCc=; b=SaTNFzBsQBWZ8h44Q0rMbci
	tqE9bIp1s4BDHVQqlhxD0XUC2V/3ZzF2zYur/ILrWwWtwI4Z7jCBf71AKAbphdmT
	3gHesqb6xVZn4UnlblnnOdSPsXkDBWOToUP0QPcO814OywvmplP1HFuXC9ww05LE
	EE5zuUga6OLzgvOFJOx3yGihAQa5Vf9O6e88mLErR5j0Dw07KgaghCUdKlGtyV+/
	v8VIOZBwtqthuVFjAixK58I72wy2Abi8GvdFt1PEsdPOaYsGJ2xmWO/fxegAU8vG
	GQhkG4e2YDN3r/6SLhCOw/DThAPdYRn2bWJfJi+T608eAsf1YkslWWJbRMcCifg=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmQxxhfsGkWyrOmQyxKFdO
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [XTF PATCH v1 04/15] common: harden type checks in ACCESS_ONCE()
Date: Wed,  4 Nov 2026 17:38:06 -0800
Message-ID: <20261105013817.719823-5-dmukhin@ford.com>
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
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050006
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH4PEPF0000B60D:EE_|MN6PR16MB5452:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9b1a6963-3112-4a90-e72b-08df3add8282
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|22082099003|18002099003|56012099006|261102123227099003|11063799006|261021121427099003|261021135927099003|10067099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	29zD2W00C1V7375MskNb2i6S8vlqTPGTIGCCvzw+D4za7g66iWVklO5gw3cQGHtqukLSRp5NaOg3VwKagzkCY8UlPtPBzFY+32Kw+Een9iHr0KweMa0/RDfhTMds3RNkytN6rdA/0pad/337anvRBAf/WeAFxAVKkB6CSTyNjF3dX7wsBt+AAW0/rOtEaisbdJlfJbTAM47quLC3nHIdUfLRzkS+wnvMJeUIlIUZqkhxjhlP2eFTOe+04hf030W7s1XYbvlguKtRX8DLA+pV/5bQnN/cZatKH6woPpJ0RP8BxJ3qNNsDwwqppbkaE6fDXUiU3eg6VEO+HjsA5IVh4mIpOd2f8IrIgZI7/K2oLT26V9dphNyeWXXxdWYxKMxI+COIyihKDPAAuypm/WiVOXPfTkZKjXcRnSNyvYOwL9hW0AoGjDrHBFz+esLcyTV7n9XPNJDYowIryzdnn70oeaSHwDR7d3+HPNmmQxTBhoZOp1hR6XI/SeWIVb1Kh9ubsXgoCDnRzd7pwWmkVdpThtm5zCqHpXJew1axa5AsWz0Nj0jCcEEfz05cT/L5+TIXd/jvTw5BebBUTdxCIWbRFFiQQyn503gOUJhsVtKUKP78TIx+FtqeoxnLNArjGpjp+HWkw6QEo81DpEC9NlVJoBQ2/GxpEbLBiBgz8X+2yIIV33CnU7xt6mR70FD9UK5RfnkiKf2XfX3BLyGVzQrcjQ==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(22082099003)(18002099003)(56012099006)(261102123227099003)(11063799006)(261021121427099003)(261021135927099003)(10067099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1FBZnCR1GN+ZovZif1KrfHLpgcCZctDEM2bYvNus6cWMndKC77LFC5q2UlJO/iYC2MNQrC/T82vdfFGmSTGKLz3jIgJfpiZwf2u42KuivTHHERS2P142VG954IxSXXgDPqDjOuRrWPLiB5Yq+WpQU4B/01lZHw7owpWtOnoWT6wnPKInXMLfMYYn0EQ22FTddeJl1n2r0IX5fFFDsrLo2s+uR6g3U/q9xy82JtKDVA5fJid6WhiDuKGPVZH/Jxw47MpzvWjfJ+y8kn+82i9vJr4JC9wWV9wF4JQ0uRz0+KDRGEeDNYbwy64jT/vFawFNoTk8/jJOQQRkqpwWiLe6pPcm/YD2X7f1qimh4HjY+OvROdUjKQ38B4TlRTcE2RPFbN7XCZ+QMqiTkf45GlY4nSz0BN74rJQQftUgHGvaJS6NjDb5vWBE/57nzUtLhFUd
X-Exchange-RoutingPolicyChecked:
	Gyj+jLFHRhW0jvBbKE18Cf4X0SU2MY5dPzPb7dc36L+nG0EryXGLgXh2D4WozWxWCMC+sWtpb2FdG9P6w/oqrTTVRx5C2YjlnczsKZQS5SEKSiGcPkPokk9Fzk3rXT41LVC7GTOINm/uHrDwlUkQEeUxWs8frMiv0szsp3lJQL+fYMTmMgamq2xhruRRfAslD38T0DyD4RHn1uRiF90pdpv7N4kXd/seJGu5QQwoPDNEE/Gf/TL1AIsUxLBmueBdP08/QTJDDtRHnuHkmNJsi+cxuIe6SRVMk3vHrqzXVPRLqbEFnGg7TPfvfVDI4y/B3+aN2w4pXaRK/VTNwJlFkw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0sMCvYScA748gTZvyyGgCB7NTL67YMbKgkAvWMhx5refOSp3BCMeMspbS9Qk2KIk9SbU4+ntklGaUpRYVPSXe7hNe06VSzyDKVDB49PxoMW8DZiLmVv2hb1dbAnPJpfasePZp6Cc+uk4u8Yiv2sxyYQ7H0mC1dhGC87bGkZjDHAAZargmX6QwIad/d/DretZ74ApB+c0pIWG+rPVWQzAIEU5/uDFrQP7UTN5tCLGmrl3XzBooEeYq4QbSmTHGrNADSqnL2VqWIsc5QfM2riALGGkr0XgOt5+70LMRZsoNMBKe989vwS3TUFRwFB+UyNEhxI8azfvakEi5MjX5DLBSHPSX+TbFklTrSVQU2jzFDC1CzCxeBq/9irpo0jTynR7LMydE7/GKgMggNR8r3is2NBkJF1Ztgq3Sqq+NodJE61YhVtUqZ9AKLqdqjXpWq8aznx5NN8z9QmmebaLOQ9fgsd6GtIHm5QZqSvZukhRlNnrOUKVC1YSmxUB3cDwXkBec3JEgMOocmFT20y9t5Ph7UqeHVJHbBlB1UsSa+BQbe3pRcyijW6x/Wgkqv6Mjl7SayIBBfh+uUIy4pjB8JrRTI4KGC0AqGQGB9zwgr2/Mi3bdv10hKkN+wMcYQtHyH7LagDe3D6J813if9ZmSW7+2A==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:38:35.9245
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b1a6963-3112-4a90-e72b-08df3add8282
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH4PEPF0000B60D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR16MB5452
X-Proofpoint-GUID: eq6P0PPodglDVPmRmvN8S3zBX-TSn03G
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfXyCj6vK4j6Ozc
 N+D/jmRLagX7ZdwOkztiN7LTC7+e5lP7BKrdF1S2/Qo4PD1MExmOY8Q+JQKhFBKkLFxfVAhpe9P
 YBKBb9dbxqNk6oGhLPD4BRddq6+Iu+8/lxxGz6SxTU6ieiBBuRM8
X-Proofpoint-ORIG-GUID: eq6P0PPodglDVPmRmvN8S3zBX-TSn03G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfXxb3aHIpGHFSj
 7kgndsf3sg0yWaFEZPDq6A08w3OqNAoCVb/vfEwYnQ0ZoLLPr9Om+2npk3hvzm82Ngm0UZ4Fer9
 HjzrJGdJWaIszSeFSSlUZqg4Vjeg2IxePZu+OS4h/02832C2913kv2pWwRyXT6AxgaYOtMVA13j
 u+VMAKQmVi7TwF/739VcEAzOpQqULEf38DaX8RWhaxbTaQ/vXZlyXyuYbbEUfeo63aGDSlgnzcw
 YHeNuC1ckNdlAPg43UUuy+2V7pUyW8L3KZeLphO8OD3tLmNDFk2WntVifBZXB7OFWlA1SQtUEiw
 jwIfO8qwt/4CE7tpZrUfp+QHiqatsWOyg/MEFpofpYTqRbGhfrEu6TBFVpqF0FP194RMl+muqLU
 daGWk+7CtzSP1cKZmNlgG94Sj/5pEPQxr4SBU4PHWa+ZzzN3quJJaai3AhxGA1Q9KgrBSUgH/il
 BLrrvLu/ZdQ37JWJtRQ==
X-Authority-Analysis: v=2.4 cv=ScVi5fRu c=1 sm=1 tr=0 ts=6aebde20 cx=c_pps
 a=boTDQTO5XcRoDQ12XycLVw==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=dw5MciS7gY-znkhJuOLE:22 a=cbNQJ9GKAAAA:8
 a=oX6sQOh5f4QriJ02HC0A:9 a=P0bj-C3X3jJDpopQwM1U:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050006
X-purgate-ID: tlsNG-720697/1793842722-30FCE2AC-56F47DC7/0/0
X-purgate-type: clean
X-purgate-size: 683
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
 include/xtf/lib.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/xtf/lib.h b/include/xtf/lib.h
index 9ced1e795258..629de4904d60 100644
--- a/include/xtf/lib.h
+++ b/include/xtf/lib.h
@@ -7,7 +7,11 @@
 
 #define ARRAY_SIZE(a)    (sizeof(a) / sizeof(*a))
 
-#define ACCESS_ONCE(x)   (*(volatile typeof(x) *)&(x))
+#define __ACCESS_ONCE(x) ({ \
+    (void)(typeof(x))0; \
+    (volatile typeof(x) *)&(x); \
+})
+#define ACCESS_ONCE(x)   (*__ACCESS_ONCE(x))
 
 void __noreturn panic(const char *fmt, ...) __printf(1, 2);
 
-- 
2.55.0


