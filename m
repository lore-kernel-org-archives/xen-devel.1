Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593CC606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=jdVAAT+S;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=gADKhpWD;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=lQr9nxHR;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=bFj/U80l
Received: from list by lists.xenproject.org with outflank-mailman.1473493.1681198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmRJ-0002B6-Fk; Thu, 05 Nov 2026 01:38:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473493.1681198; Thu, 05 Nov 2026 01:38:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmRJ-0002Aq-9n; Thu, 05 Nov 2026 01:38:53 +0000
Received: by outflank-mailman (input) for mailman id 1473493;
 Thu, 05 Nov 2026 01:38:51 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmRH-0001vR-J5
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:38:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmRG-00CQpG-VO
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:38:50 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebddcf-bab6-0a2a0a5309dd-0a2a4502bfa8-42
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:38:50 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebde29-6ca4-0a2a45020019-94a38ff18e7e-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:38:50 +0100
Received: from pps.filterd (m0367127.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mlwA226521
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:38:49 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11013021.outbound.protection.outlook.com
 [40.93.196.21])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hrfaurcpq-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:38:49 +0000 (GMT)
Received: from CH2PR11CA0008.namprd11.prod.outlook.com (2603:10b6:610:54::18)
 by CH3PR16MB5468.namprd16.prod.outlook.com (2603:10b6:610:166::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:38:44 +0000
Received: from CH3PEPF0002457F.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::1) by CH2PR11CA0008.outlook.office365.com
 (2603:10b6:610:54::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:38:44 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 CH3PEPF0002457F.mail.protection.outlook.com (10.167.252.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:38:43 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50n70b3230794
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:38:43 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hnydrnpd9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:38:42 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id OmR6xkNAB7GL1OmR6xfFXb; Thu, 05 Nov 2026 01:38:42 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=OGy
	vi42fzytVdUxeSyzYUzwhVDhaRx7lfQ6dSZh8isA=; b=jdVAAT+SUPkIPDyqq0C
	t4vcQYJoQvZmAl5DXVcL1gopmpd0rR1jc46AEVVVLuUL5gyfg/ApTUj8CqE99Kax
	IoFWz/37GamPjE0+lj7rmoK/AbB2S8ybrgZmPAugvug5j3nxne0/mknxvMdshP5k
	EiZTFQ1OjuDgEF4iLGDYrPlnF+7uD6D/+IBJ+M9YMsZY/OpC5bhTrqt6riTaaM9S
	CvCwZEvTH4vWuDtsRSEZXAn9hNOKDEHwvjhc8vXxVwVe6+Z5rgKOGMOEGzYItbtN
	i476YHEGrb8daau+/onrUZmJlygH0XjIR4DSQBr+xAfjAiCuVX8oCTnH30PZKUV2
	KEw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E3ymvlrndbYtmuFjuLAh2wROyFS/Wq3653Kn0f8lRf3xccnJzzp8KzVXvtLJcXvvA0Y7BwltU2vxDLxtlzK+I01nKPu5T2+bq0sjmGYdxIFhTD/h6d6ViVefJYGfY4IaWo0TvInbZJ02hrjyOeIfGlB/7hOaDBJmXaDuUf796HiPT4/CgYlSkD5p2t+82azU6RG6kmgI09LHhwKDlvhFDxFBVW5At/GE2qb6ElRplBqjKco8+wYIu6usHVOrET2F+gL2rYWq9I4awiHH9mC5X870dJv+sW0PqhgH4WanSiqb/nw1mKdahprhEIPgqWxujkOu8nJ/xL6I4JMZ+xaw1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGyvi42fzytVdUxeSyzYUzwhVDhaRx7lfQ6dSZh8isA=;
 b=obj1Vx8AOeW4Q+rffUJtZse6xitSHL/d1WSK53170HTH1Z+HC+LoMvQfo6F10npY/zfBo2OW/i+7fJ2QmfQhjJzzcjDOQb+PNdTmFYZRuw3lZWMaKJNHr1rBD84Ml2F8hYQMkW5MYLsLpHhUwAWTvKgkq3TZ/DHS8vmRSts1e8mjdmrieNpsJH7uz5ho2BOPfqjLlW6OkyMbyiwJQWsjP2nT8MYjch+xu+HRbOp8w2n2c4IIFxoKPqsgs11Kf23m4TKHBaWvQOZPmh07+rHJGBv6Z0TgO/Js0ovGDDaa7WB00G/Sf2AEfAc7gBTl3qBwAenzz9wFc/UMHURDSUX8uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGyvi42fzytVdUxeSyzYUzwhVDhaRx7lfQ6dSZh8isA=;
 b=gADKhpWD7GeAtFCaA5HDOVWq3FhnhXd0EbznS/ShjM3EXXaftEEa+SOACILZJF2fYpL1u3IU6Q0NCfjQYaE5zrex65uBtmmq5j/hxrcPnwpt57dJjYIbRhSEvIzC0dfJ/1BnslLYAQbnv/o33jqOdjfOjnmcDOvhsUSdVtH/gdM=
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
	ppserprodsaar; bh=OGyvi42fzytVdUxeSyzYUzwhVDhaRx7lfQ6dSZh8isA=; b=
	lQr9nxHR9ebLeMY5oLjPvaJWrUCxmPZDr1oaCJNrkS/HB8OfbW+RTeZMuvL41n6e
	PmRCRlidgbKFuFLFOZy6izQJ46xuid7nV+VWdqiJt5qTSiSM+iq11p3KmjjjNLzS
	brwf3KrCn9Us4UkPVY+QaHPNL/+PDjPakGKgLmYFK14MDUZXhyCBmmnEdasslqCI
	RlAI3i2x0ETdWkyYW0VXQicoVtBz6CIRhDzDtRFxVskxzHilEWSS5E55ynTfiOqU
	06pgygOxBDjHi59BzMXCvtauIpxzU+2u/rBrmbD+aXJ8glbChTB1Gj0HQWxSYkhf
	/vs6NL4y19hgHK1qdVZM4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=OGyvi42
	fzytVdUxeSyzYUzwhVDhaRx7lfQ6dSZh8isA=; b=bFj/U80llO6Wqi61MR0MXwm
	PYy+dZLDd4umudTb/Q17UDyf9TzegtnzpP2M9xYc5hzN1nHO/Rz6QOCzZO69oxvn
	VsO3gbkEoGimEW27n5xrBunAbt3xa9I6FmIydnlMBjpi/MR2ajmgAfB6CNEL4vEj
	PlH+oluKIi+VfXyiUxBYl61B4uFwPdD1/sVRlUx+VIQ4CPwsdVnrxtrZGyR46AXl
	SXUq3vUj6BhMKP6ozY8MspA6LuhNdGFTiFqj87M+aewiHZ/+otOmi24by2JlYimM
	o1UmUwUyck5ciI8xWnMR4uKb8cGAqnDDQC8PVydTZilysbJRx9ZO9x30JMaU2Gw=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmR6xkNAB7GL1OmR6xfFXb
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [XTF PATCH v1 07/15] common: enable XEN_DOMCTL_debug_op domctl
Date: Wed,  4 Nov 2026 17:38:09 -0800
Message-ID: <20261105013817.719823-8-dmukhin@ford.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050006
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0002457F:EE_|CH3PR16MB5468:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c8fdc2aa-66f2-487a-b40e-08df3add872d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|11063799006|56012099006|261021121427099003|261022105027099003|261009223027099003|261102123227099003|261026140227099003|261026121527099003|261028144727099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	fplAwnkOhZW4XRzfpISAtY2bWXmQl0zV5enOSwflgYqTMpc6bAuUSDSQye/5mRemiHqHULh+ypo/FZRYCGRISTwaTQHVigIqHThyHYm3U1tk3L1+LV6E4OKv5lZHblaniH2NE09RFUCjWP+Ma4fSUJ1v6hlcEFt4jqH/Uf9R4rgdTM4XzBW+v8PcMm+Lnq08yplF4Q06O2zi7ScilxvydFeOgDAGUxsPCHX190bhWq9/+uxWSOP9NLBjVbDRywndRaL+9UNHkoYXPp3jrPlFdaI/E4XMxZFrK0ySzpWGddu2W6caAC2LVBASdn0eQ3YBSrVddV5QDHWjBk31s8mAtjD8wJFRFVn1ba1nBwSUEv7VsjonH7gLQA40ulIaDBB4ylaRuSwnF744cOoyWNipFezAmm48QdHgdEBWgT1t/tOq1OhQzFjfmXHbGHk4zSQ4Bnf+2wRL7Z+VmSGKd10FQxx3nL5WRL2UjJ6JBh1cMX+FEcYTxvLCVYIFhBWVm56Lyn+8aZAZdKEl8csJxTytcFLNabr2UvePHEySyjFohKAOOnifpUQIA3fWQ0sTNMq8y7OXlhADajsyI5yZyS+24AdHefUH5X8IjAamlrzn8rfeMhqyb3bVQQRYA1cUiBQn/Chw+Uarm7jvjCokJ4k6y8D37AKyRh62y2PuxczUx0Ct3B0CLdISN1f3vYOa9EdR8n4QmEPlzGZb2kmf33FUjQ==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(11063799006)(56012099006)(261021121427099003)(261022105027099003)(261009223027099003)(261102123227099003)(261026140227099003)(261026121527099003)(261028144727099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8bL+NIM+eg51LA5Edmv8mltxf/amug9s7ADO3L0wgNjp63pT9xFKDDFMob2NORoIibBdUYP44x3yl4Shp4mMTHVrUoN9gzO2skSovfPVx6pY+/Zlnjn8+6NX2XOqq+IlzS+JHvOoXyxG255++6+KWDpTpnVQrkqnxtmv2vZZZ7c13g0BeN5G9OccApwW4L5m1YPhiYhshIfd1iX4EtKhQm8FtcVHrswEDuYP8KgBLaRQhqwvXjfDwfWL0uPyt+/229BCyuGx7ZjelfFzQA5orTbkP60M3X33xp9wEgtfxsUJ7NeQF7muBzcrCmWyaosMcl2cnU8hddhSX7cq6FDZBAZIVQ51EsDBnfhWGP88fAHrGNuHFc1FsqzHIcpbwNCIxOIeuI+3tUKPJ4VCoEBLO2Jk1mqFkFM/rb1DFwjuX7D9CM9J1opDpqgqV75cpJfn
X-Exchange-RoutingPolicyChecked:
	hsf1ukqrOIxRlXLfIzo2V6LEkK150zfRDA8w3RKX09jjW3dzThSnx/CUKRNQCHy9Erxe3o9hNQUQeB7YmJJEwYVP2Mj4BaaTeow+4rYTVAKzxRZ2CDc9tSzs3489aPeRkyJlMLuGijtLE8d9nDGcd+qdz+doIVUhhhyZ9v+eW8NMr0CngANSsD270zqz2rGQu0Ekvrmw+djzxcjOKYnU3alJqIco9rcwW7L7Ti2hLyS3kvCfUZzL3UQOdGdyOP/r3bDVun1UO6uYFv1grHmW+CfZefuIurXuhrE16IguTmQUzlEGJu5TDVRjsDarDjDflbho1hGQyakQ7vgHx5di0A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VQYpSwjj28y/79G5JIJg02girAkGo2itRQfV89YMJrCfadfVQdUusf5/MxES9686CmJN7cauxEFhYdkkPFiuFZ4RFc1McJilBm2XObVI9pHp6RF+Orn3rDZkFrjs8Mr6m3UvQgGl8i8PUn/eZsZFV8ulVQ9LpebacpXQBci0Q86ka97Es7MzyokkB6ATlKcihOzl+/0heAsIQEqg/uZq1wRs7CMUccb5QiscHoeS55H4bAOIG7msHQY1xG/5uLoSHkJLJN391ZDD6+kSX42kg8wTu9K7GU0xd62Blg1GFb9bDKHOuDzpcsBOAh9EBGyBKF+JwEl9WZbTkRmYlxeeeHUzcsowspREzbHmZ/9mjz+lpMSarNnzL6wSLX8kHfKoHXu05M4yOX7YI1N5S9lsNrctsHtyYlGVjIU/PkxldZGXYwqS368CW1aY9MRwdEmU6qHL+B7VieiURyG/H6US+2XLHsISalwyqwwIYY8JhyT2v2ViUlSf+KdoQEWAud/OS84DOL06QmYOb8vbP91YPt1Ad3R/R4iUqqRuLILG4NIAgvcM0f7C8j4EaMKmZJrFHsx9zP/Lw22/KEW8McykkoAACjfaeYVDrJG5houk6RMhwS36A8iO+4MP5qvMkUjUIvE5MxgIs+pubG6w75gTAA==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:38:43.7649
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8fdc2aa-66f2-487a-b40e-08df3add872d
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0002457F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR16MB5468
X-Proofpoint-GUID: rgm5xMh6MMD-CICUxkI_a5hPDYZ6s6JR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX6GcLVmv4welN
 3/6XE15SZQMX/lcHT0ukD7RIgbgme1VVashrSYP11+eQBzX6Y5teDjHcczkShfaKpt0qBw0cJSq
 E6OVVc6j/SBirrTHrr87rg07q0iSOm8MUFVrjCemOiC/TbRtgkIM
X-Proofpoint-ORIG-GUID: rgm5xMh6MMD-CICUxkI_a5hPDYZ6s6JR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX1dZIk9JInhy6
 aV/15xxhhkQNzpaTB2XhbWf2m8AvY5Lzw6OQ1UPk+/VlMrwMa/huJXgFBatBM0pspMf/+pr+u/p
 pKU+MxhNv8cKN/fRC1tXojIS24kDs3yat5oxhlc47AEpDoVnA1WrmKY1ThWqiDqKSL81nxe1lTx
 WPMuGokCxEO9pZuCOLRJxQAYDuF5f6G7nXuoBd4fFOzhYuscbGB1POUs8msNq9pD+UUSUWAI8vE
 AUfpAp3OS5z3lq18uFQR3kMrVIUiKIyjjyeXhBFpXR3zLDkCtNtaH3H4ESLX2LD7mAl1QipkBzw
 VihL2R8PBRgtK54C1Ona+quqz7IOF8KgzyAiMeRksc+86SbA2K13Tb3TMzKPMVjoBqH0e3o4p5j
 nPxv1nZKkkcCQ2Vc0WM+N4HzV4qppegt3hpuLgQjSMKa5Kw41EJERjGXZuVxrLSKeO9hZ2s1HvZ
 C7tfhgSht3cKBjX3ZtA==
X-Authority-Analysis: v=2.4 cv=ScVi5fRu c=1 sm=1 tr=0 ts=6aebde29 cx=c_pps
 a=L/RFU+sPSyhylg1snxNseA==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=dw5MciS7gY-znkhJuOLE:22 a=cbNQJ9GKAAAA:8
 a=26-L8s441i07vw0byR8A:9 a=DqJYxgmhk6moR-_7_KoZ:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050006
X-purgate-ID: tlsNG-720697/1793842730-303C42AC-5757E5B5/0/0
X-purgate-type: clean
X-purgate-size: 3273
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
 include/xen/domctl.h    | 63 +++++++++++++++++++++++++++++++++++++++++
 include/xtf/hypercall.h |  6 ++++
 2 files changed, 69 insertions(+)
 create mode 100644 include/xen/domctl.h

diff --git a/include/xen/domctl.h b/include/xen/domctl.h
new file mode 100644
index 000000000000..5c3241d503d1
--- /dev/null
+++ b/include/xen/domctl.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: MIT */
+/******************************************************************************
+ * domctl.h
+ *
+ * Domain management operations. For use by node control stack.
+ *
+ * Copyright (c) 2002-2003, B Dragovic
+ * Copyright (c) 2002-2006, K Fraser
+ */
+
+#ifndef __XEN_PUBLIC_DOMCTL_H__
+#define __XEN_PUBLIC_DOMCTL_H__
+
+#include "xen.h"
+
+/*
+ * The interface version needs to be incremented by 1 in case the interface
+ * is modified in an incompatible way AND if the version hasn't been
+ * incremented in the current development cycle already.
+ * Pure additions (e.g. new sub-commands) or compatible interface changes
+ * (e.g. adding semantics to 0-checked input fields or data to zeroed output
+ * fields) don't require a change of the version.
+ * Stable ops are NOT covered by XEN_DOMCTL_INTERFACE_VERSION!
+ *
+ * Last version bump: Xen 4.23
+ */
+#define XEN_DOMCTL_INTERFACE_VERSION 0x00000019
+
+/* XEN_DOMCTL_debug_op */
+#define XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_OFF      0
+#define XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_ON       1
+#define XEN_DOMCTL_DEBUG_OP_POSTED_INTR          3
+struct xen_domctl_debug_op {
+    uint32_t op;   /* IN */
+    uint32_t vcpu; /* IN */
+    uint32_t arg;  /* IN */
+};
+
+struct xen_domctl {
+/* Stable domctl ops: interface_version is required to be 0.  */
+    uint32_t cmd;
+#define XEN_DOMCTL_debug_op                      54
+    uint32_t interface_version; /* XEN_DOMCTL_INTERFACE_VERSION */
+    domid_t  domain;
+    uint16_t _pad[3];
+    union {
+        struct xen_domctl_debug_op          debug_op;
+        uint8_t                             pad[128];
+    } u;
+};
+typedef struct xen_domctl xen_domctl_t;
+
+#endif /* __XEN_PUBLIC_DOMCTL_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/include/xtf/hypercall.h b/include/xtf/hypercall.h
index 9d6d901d1668..61127eeae174 100644
--- a/include/xtf/hypercall.h
+++ b/include/xtf/hypercall.h
@@ -42,6 +42,7 @@ extern uint8_t hypercall_page[PAGE_SIZE];
 #include <xen/hvm/hvm_op.h>
 #include <xen/hvm/hvm_vcpu.h>
 #include <xen/hvm/params.h>
+#include <xen/domctl.h>
 #include <xen/memory.h>
 #include <xen/physdev.h>
 #include <xen/sched.h>
@@ -185,6 +186,11 @@ static inline long hypercall_sysctl(xen_sysctl_t *arg)
     return HYPERCALL1(long, __HYPERVISOR_sysctl, arg);
 }
 
+static inline long hypercall_domctl(xen_domctl_t *arg)
+{
+    return HYPERCALL1(long, __HYPERVISOR_domctl, arg);
+}
+
 static inline long hypercall_argo_op(unsigned int cmd, void *arg1, void *arg2,
                                      unsigned long arg3, unsigned long arg4)
 {
-- 
2.55.0


