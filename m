Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499AC606A33D
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 03:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=QGPVvn5B;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=DYFYYvT4;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=hnQycp8T;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=i3IO15sn
Received: from list by lists.xenproject.org with outflank-mailman.1476147.1682406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPAl5-000351-WC; Fri, 06 Nov 2026 03:36:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1476147.1682406; Fri, 06 Nov 2026 03:36:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPAl5-00034u-TU; Fri, 06 Nov 2026 03:36:55 +0000
Received: by outflank-mailman (input) for mailman id 1476147;
 Fri, 06 Nov 2026 03:36:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xPAl3-00034o-Ol
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 03:36:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPAl3-00BWom-5k
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 04:36:53 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aed4b53-e002-0a2a0a5209dd-0a2a45048f46-2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 04:36:53 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aed4b53-b57f-0a2a45040019-94a38ff18e52-3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 04:36:52 +0100
Received: from pps.filterd (m0482515.ppops.net [127.0.0.1])
 by m0482515.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6A5NgYnm392855
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 19:36:51 -0800
Received: from dm5pr21cu001.outbound.protection.outlook.com
 (mail-centralusazon11011066.outbound.protection.outlook.com [52.101.62.66])
 by m0482515.ppops.net (PPS) with ESMTPS id 4hs3q815cb-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 19:36:51 -0800 (PST)
Received: from BN9P220CA0022.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::27)
 by CH8PR16MB376233.namprd16.prod.outlook.com (2603:10b6:610:31f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 03:36:06 +0000
Received: from BL6PEPF0002256F.namprd02.prod.outlook.com
 (2603:10b6:408:13e:cafe::9a) by BN9P220CA0022.outlook.office365.com
 (2603:10b6:408:13e::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 03:36:06 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 BL6PEPF0002256F.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Fri, 6 Nov 2026 03:36:05 +0000
Received: from pps.filterd (m0373460.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A62ncnZ4186117
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 22:36:04 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hs3qx86j7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 22:36:04 -0500 (EST)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id PAkDxadh27GL1PAkEx1cT2; Fri, 06 Nov 2026 03:36:04 +0000
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
	:references:subject:to; s=ppford; bh=8xkiZXikiFrLxwGk+O+uqXtlkUV
	R7fuLR3HnwmQ/94o=; b=QGPVvn5BSG6UVad8LAG/fBbq61fkNxjeI+9Q7qZ0d9k
	3z1KvkdHitjVdmM8M2l/cpOP4VwYk/ou0ChD2CYK5CMfI3i63HqtFcZar/BgaE21
	WzLg0n9SS8z02jH1R5SI+KDAsKFfU9n0+AycISlvFkGESpVga2CAcphURDm1gevn
	ehQVI6MqyRODa3Yd9XdBZArsANyjLIuN66AFzIffOrS4oOTT882FTrxBKwdBZULf
	7bxdFAtwBVxrcUNSjoupA2+jH11tzoCz46sdn7sSD4/1QPDWua+gsL8/LI0FEULL
	ln1JDGfErngGT+fJg5YsRROU+b0sEhCguzV4jPpezFg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jKiRed81WPEx3QOwuOKgXntl+QPS7BbrOv8/IzcKrZx4UP5osUq9dkcupTTvvGuDDJNcB4hwwpKZsxn9iCcrDEO8+U5xJRajTj7vPiSVhwDwXCnhh6ChPitW9VFxdMpfxHz+iCu8Ph8TDaaH9jL7+RZ2DWqZVi/tXw9EkppqihXGDaoIachYmgSE5JXNUebzIKxHCGmRlfA0gF7yIhM5CyfmAjkaYMnYjofH5bZqZgdRZR+ZJk2MgGbygBfsmFdVlvvrHp6NfATSAmevAIESfU1szgQz2SaMuttbSkCklakf+Xps9lh14PCT8dg4nyQByKkFQFrP7FmHuOpydOFZJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8xkiZXikiFrLxwGk+O+uqXtlkUVR7fuLR3HnwmQ/94o=;
 b=vOaX/VULVXVObJAtL3S236TfwRmYtvg2EZl1AExEEf/Vwuq9SSNYuPwEPvb5a02W4etfHbiwWnPvBV80XOIECyM9KnfU7E5Ietq7zUKy2PE77CBJsth7QvW0ug8QrfTQ44gj/DmfIYzbpu3GZWKwLrcqZHEXKtMa7Il09B4+IgSeQuYk9OhoFl2roOL33/9NJPU2pvQUEpK8NtNmIBrPJ1E/ZyRk36wC8uwNvE9yuokePXhveDBSJCZPnvfI7uYTFcexIrOyVX48lM1ZBb+M8WknL+P/bBfoX/CJLxPS1JSFX6xI7vtwrv9DBcl7sUoQB79c25IwklZsn75EfLQ6Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xkiZXikiFrLxwGk+O+uqXtlkUVR7fuLR3HnwmQ/94o=;
 b=DYFYYvT4Of6x9CJthdCke7RQdO5w861uchN0H97mxB9YR3i6cU7sv67K5MWUTEDsgO87BCgI+wY0Pa9WagSofC97sSOrcvds10WLfM3TH84u4XsFzpLbPdaWD+86yFFt+Dqozu9LAgfDy2pQe7rHRJdJsQ6sKOQJJorhM/JZQgA=
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
	 bh=8xkiZXikiFrLxwGk+O+uqXtlkUVR7fuLR3HnwmQ/94o=; b=hnQycp8TVzvM
	qGbtaO/wDPOgsjmUU5/H4E/frgL6JvruhbdmRQASrirWmx+WQUkzglroQEJhqBeR
	nHoxI1HrcclYAGHS/ngsYE1ft9kBmd7sbdRgpxLPJWEggcBxTSgJItCoMn7066pi
	9QyaKBLctrO8U/IjxE6zJ5O/+poTOuOqnhw2j41mzxQvCmIXOKqOecC3O/75bqko
	epuu+r9kTCRij+8PzKMzgifUHw4TCW4Wfnf99tReSHul3losNCBVF5bU48onZIiX
	K/VHG+Ek2+91ajOrNVQaw4XKJL7urH5RIBoXjT5z1J8hRe7jYurQuvASCaCJZ4Xx
	t5h2KiES4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=8xkiZXikiFrLxwGk+O+u
	qXtlkUVR7fuLR3HnwmQ/94o=; b=i3IO15snlrpZUdibbxNyEd6y0CkFwtyNIbgs
	VcCg6oXOS9jol73VcZCm8FMw6mBb6lE4bCmaxs4gC6T0fjQkrVJnk8Q7CSntLEi6
	vRPrii+Nz9mRtiNt2wJkSqfMCzTJ2Ce4bu9FzdsWXNZvN4AuyByKifa6r89i9pcM
	gyY/dW7HrWCjJXAavMCEoljpdEJcfBkqBDkBhUAN0t9BLSFRcEhxSz1mDTEYv3r8
	hUTe8qwxqyHX/odR/Z1LGQnaVDvEoyMFxcwnZnHyaVsYByBffUrV3Hj2/pmLbsId
	FQq7qn4WrvTRIfQVnXIDXL1BRg1jjxDnu8edPoXii8ZT80oRJA==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: PAkDxadh27GL1PAkEx1cT2
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Thu, 5 Nov 2026 19:36:01 -0800
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org,
        andrew.cooper3@citrix.com, jbeulich@suse.com, roger@xenproject.org,
        teddy.astie@vates.tech
Subject: Re: [PATCH v1 03/28] x86/hvm: report SVM x2AVIC support
Message-ID: <au1LIYnf2dd2l33H@kraken>
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-4-dmukhin@ford.com>
 <c36fb489-d0a8-446c-a520-78262f70b31a@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c36fb489-d0a8-446c-a520-78262f70b31a@amd.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2611040001 definitions=main-2611060013
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256F:EE_|CH8PR16MB376233:EE_
X-MS-Office365-Filtering-Correlation-Id: e8b36356-fee1-4185-1050-08df3bb716fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|11063799006|4143699003|56012099006|261021121427099003|261009223027099003|261102123227099003|261026121527099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Pt3a2oqbQC8f/EzjgDNWYedjBpRhfRdaYdQ58hssw1NKro3q7NjKc74aWxo7FqXxZxBgODoXw+xeX5Ulz/EM94ionTsl60I0hOjc1n+vz+RiMGLjRzpbHhg2ITojnIm66owbtpFMFmmcQz3kOTmJbYe7MKkT4xQ7Hz7xgMjD8ZbB8AMt2qODDZIGgxitQLhLD3i8lWEhGkexpmn1xIrtu+Gc3bmc6ngiRGyEw0GDt6pxrg6dwqsPGiWuKrC8qVT/Xb2qIzpCRPJ3nfJmFiC+ThRU1vC18YXzyQTYy5gHrc1Umkb+VktTMdS7/pqEL1CfjB61Ta1yjN5Rivvt5Czmyc8F2pjgBxWO9DK9VI9vT/b9ar9I1pPSIi22bB4MC59QEzUOaVKJw+ENrq5IcFp9NlCCylJWLkOWkLu01no4bjbgp4gs7xsQ57gQYyyL0XD94WjjfdCJ8pXevOeh/rOzAwMVwk6TrmiiAgwoANGd9+SkIA9Ko4AETc+hFCMFjRnfzQ2bjXB8aFsMMYfQ6SnoiWKfsSS2NeO1Zdgr5chWlinSUCPCy7YK3IEDdTvisZQW9A3MpaP6PS7mYMYgiXnSjgYk794uA3Tt3awpzEO6noJbaYTHHW5ElO6bLsq/NjrrKoEbwLktH2GsSr2eJ0Z5FcDtjE5lXJ7oEz+gwlxPVf1/te23rKhvPQ7gpcorW1f3mmqZ4sJd5PgbdjVgviGIYA==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(11063799006)(4143699003)(56012099006)(261021121427099003)(261009223027099003)(261102123227099003)(261026121527099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Fv/LkrWiAjWBYriKrEIiiHjU3x2zSJ8Y3rY7tEkjmsXULmhxNyIu+SCnQPZ7kx2upozsm58FDyuNniqRNTcJ3EiQefzLJarOzNiap99TVGq94k9iiIMuWYZc4PpFPqd/USIWsgu1u5TBGK08a7AM4ObnSPVzBrSB9hMClhmkYIL42rU9y2t9n+naKYEWcKJXPpSxZSmgok5TnGaTypLWSm5vx4qwE8xC0Vf+HPUeachoJPF1gzDmE1Y0fywHBNrxGN5/MWrFrBA+QalpmzdcO3leMgB5NSalFGQ1LLDq8z7ycNNImHyYx3hghvowDo81kaYH8ZWDaUENm2VAN2x2JHxldUzIIJ2OZWibx9xAx5LSprJRWsfzL1bK4ERb1Eo+Dc9QsjTrc0qh3zW3vhceXh4ZBtW3qmow+/bv/qc8/kYBb8GX5V7ydOTh3Pyd4xm5
X-Exchange-RoutingPolicyChecked:
	SHZofQD4jwGglJ0bIqO9QokCjg1BIEwoY71Uqa938mW9nqJuL5FXXrYcF9ikWW2miq48wI4AXcadB1Rp3XrkmHjYPp0XUp86ojFhXKxaqiDC0Dpo1BsbF1PgzOJjBqDCcOrfsdOgOxcZulr2bs/ChUpy1ErO1e+bQXTEcqp8sqltyZXzvqVuPsMVYAM3t2I7kzGt7yw/0lJpiXtRgwOMsM/jTXbjnlHaja2nG264yRpVu/asM4WnkZI/OAoCz/E1X1lt6x6byVzVtSUeLgU3sfYtqQtEDu1qUP5gRzBQ8J/FBjfg3cdHVr39+YyzlIqkVhx69hxVcPZfU/DD/KxheA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wf3gm6ZZ+Sv/4qhP4qCW8CFEvk9Uy80QP8aRNLL27pOh0MoEhJ3Coi8ZdoYNq/7IRJHCio98jkJGULvr8/Yiw3ZF3dBWIPQI8j/n+J3iRpmfX37Oc+XQaOM0cvxbicNrTzKSfM55oHcxCit3Oj/No9AN5RqrcsQdZc0zIaDEjPyeAbVNuvaoZrulA0XSZll921jwSDIrp8RsxI1fLm0z+NePsSkt2zki4yvwgjYk5b9uGPD9avmVBAqIaONXtRD/DyjWRByRzWxltT5YHE738FoqJ62cA+tI8LU17kONh2+rWNCA5obo+/gC4GzlzicHFKMKxILBeOvg1Y+fPO8ihcvctpb2JQnzjk0So5Iw1ppnZhJAVfE/sW8mekfbyC9s5Exs7g88YIMHVtUPGY0G3zdYexi/MFzizrDmm+lprVKmYbtsX7+kHgY4pSvljWp8JemjSNSeEYx41L1RY840thumeqVNg3lLM1A5oMwzsYQDB3GnI68buF2oaIeKSyyOYTyJCdYfyNUgxSSyEeRUBpiUdh/zQgfAyIgVhPjuApkyLfrvAfGpXSpx36Ltt4tf20SC3fzEfuUJwu/3ViPswZR5GElVHX+xEV+cpR7tqoyXQReYqKJnJyhQsOCzS2uwjdtDQGgq/nAwy74jk4Bm+Q==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 03:36:05.7524
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b36356-fee1-4185-1050-08df3bb716fb
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0002256F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR16MB376233
X-Proofpoint-GUID: 5asAGkmq7hCFDzDGRpetbrCIGBUPQni3
X-Proofpoint-ORIG-GUID: 5asAGkmq7hCFDzDGRpetbrCIGBUPQni3
X-Authority-Analysis: v=2.4 cv=E+ZYNqdl c=1 sm=1 tr=0 ts=6aed4b53 cx=c_pps
 a=OANxLEngf0bc/nxW+UjZ1w==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=0GA0A_IKJoUHBEAzNTkD:22
 a=cbNQJ9GKAAAA:8 a=zd2uoN0lAAAA:8 a=jfBEl_xDU-yQO9My1xIA:9 a=CjuIK1q_8ugA:10
 a=DqJYxgmhk6moR-_7_KoZ:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAxMyBTYWx0ZWRfX6Naki804umgj
 R013rSUYkWgPDVzmAFKk+v2V8ULCWlQSAcZHJitf+/ywV89/+WeGm04yqH0aHLKnj48o6yc+P+A
 OV3ZrfQFyi65knQXyekxDvZdDVC3pHq8BMZpCXR/kgx8I3FEwotc+ms65gTXluOJdf0SDfGG0Io
 S3NpOaiDo/J4njnY3V98aO4pU4hZfs2sPDZfwakcFTfmrinmdeMUG+uV3EOhyzFvP5qkMGXQ332
 WZcQIQzFJkDC2cEMxYjnr9a4uDGmROGhOyKfkvtP5zQzsBMW5XBAghskB9wuxd1X8+y5ogBLMBY
 G9d/pBKDTaigAIDAC9p4rXCn6rHZvSJdBre3YaBJS1yIHXQGlEUIo+u8JWpT8JAxwd7na9b7hu7
 mYZs8ce58/AjKfsIgx751f2x7ETmwGzUO/52baQt4ZRZ0NHfNYk4BJMKLVpoFIwYovfU3rhco+i
 ikN62cPXwOHYB+zmRAw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAxMyBTYWx0ZWRfX8y3Ae7PJmbxz
 Nu9KXWWoLx0kE77rz9clcBUoCGlQ1NIZc6AzekxMVBTIhiyLKfOEOhMhFK0VZP1rfi0J44wb7vS
 4L04iIWy4agM7anKyoNOCLpF4LJgXtjj2vGfvgwtEi0/g7Ysp5pH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060013
X-purgate-ID: tlsNG-ebf023/1793936213-51ED6B50-C215CC60/0/0
X-purgate-type: clean
X-purgate-size: 2547
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 05:13:50PM -0500, Jason Andryuk wrote:
> On 2026-11-04 20:33, dmukhin@ford.com wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> > 
> > Report SVM AVIC support from CPUID Fn8000000A_EDX[X2AVIC](bit 18).
> > 
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> >   xen/arch/x86/hvm/svm/svm.c         | 1 +
> >   xen/arch/x86/include/asm/hvm/svm.h | 2 ++
> >   2 files changed, 3 insertions(+)
> > 
> > diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> > index cf008a8acdf2..db81dad4b681 100644
> > --- a/xen/arch/x86/hvm/svm/svm.c
> > +++ b/xen/arch/x86/hvm/svm/svm.c
> > @@ -2457,6 +2457,7 @@ static void __init print_svm_features(void)
> >       P(cpu_has_svm_vnmi, "Virtual NMI");
> >       P(cpu_has_svm_bus_lock, "Bus Lock Filter");
> >       P(cpu_has_svm_avic, "Advanced Virtual Interrupt Controller");
> > +    P(cpu_has_svm_x2avic, "x2 Advanced Virtual Interrupt Controller");
> 
> Sorry, this ...
> 
> >   #undef P
> >       if ( !printed )
> > diff --git a/xen/arch/x86/include/asm/hvm/svm.h b/xen/arch/x86/include/asm/hvm/svm.h
> > index 0fc33f41b09d..292a9ee19b11 100644
> > --- a/xen/arch/x86/include/asm/hvm/svm.h
> > +++ b/xen/arch/x86/include/asm/hvm/svm.h
> > @@ -36,6 +36,7 @@ extern u32 svm_feature_flags;
> >   #define SVM_FEATURE_AVIC          13 /* Advanced Virtual Interrupt Controller */
> >   #define SVM_FEATURE_VLOADSAVE     15 /* virtual vmload/vmsave */
> >   #define SVM_FEATURE_VGIF          16 /* Virtual GIF */
> > +#define SVM_FEATURE_X2AVIC        18 /* x2 Advanced Virtual Interrupt Controller */
> >   #define SVM_FEATURE_SSS           19 /* NPT Supervisor Shadow Stacks */
> >   #define SVM_FEATURE_SPEC_CTRL     20 /* MSR_SPEC_CTRL virtualisation */
> >   #define SVM_FEATURE_VNMI          25 /* Virtual NMI */
> > @@ -57,6 +58,7 @@ static inline bool cpu_has_svm_feature(unsigned int feat)
> >   #define cpu_has_pause_thresh  cpu_has_svm_feature(SVM_FEATURE_PAUSETHRESH)
> >   #define cpu_has_tsc_ratio     cpu_has_svm_feature(SVM_FEATURE_TSCRATEMSR)
> >   #define cpu_has_svm_avic      cpu_has_svm_feature(SVM_FEATURE_AVIC)
> > +#define cpu_has_svm_x2avic    cpu_has_svm_feature(SVM_FEATURE_X2AVIC)
> 
> ... and this is mostly ordered by feature number.  Maybe add an pre-req
> patch to sort them, and then re-do patch 2 and this patch to insert in
> feature order?

Will do.

> 
> Re-ordered (for both patches):
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> Thanks,
> Jason
> 

