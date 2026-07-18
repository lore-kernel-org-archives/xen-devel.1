Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1C6C44520
	for <xen-devel@archiver.kernel.org>; Sat, 18 Jul 2026 02:29:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1365306.1615858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkunF-0003pk-2g; Sat, 18 Jul 2026 02:28:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1365306.1615858; Sat, 18 Jul 2026 02:28:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkunE-0003pd-W4; Sat, 18 Jul 2026 02:28:44 +0000
Received: by outflank-mailman (input) for mailman id 1365306;
 Sat, 18 Jul 2026 02:28:43 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wkunC-0003pX-Bt
 for xen-devel@lists.xenproject.org; Sat, 18 Jul 2026 02:28:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkunA-00ANAH-9C
 for xen-devel@lists.xenproject.org; Sat, 18 Jul 2026 04:28:41 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a5ae4d3-5cb7-0a2a0a5109dd-0a2a4507da0a-0
 for <xen-devel@lists.xenproject.org>; Sat, 18 Jul 2026 04:28:35 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a5ae4d2-b4ea-0a2a45070019-94a38ff1e87c-3
 for <xen-devel@lists.xenproject.org>; Sat, 18 Jul 2026 04:28:35 +0200
Received: from pps.filterd (m0367127.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66HNEiu63205630
 for <xen-devel@lists.xenproject.org>; Sat, 18 Jul 2026 02:28:33 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11010015.outbound.protection.outlook.com
 [40.93.198.15])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4ffwryrtq7-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sat, 18 Jul 2026 02:28:33 +0000 (GMT)
Received: from DS7P220CA0118.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:25f::9) by
 SA2PR16MB4218.namprd16.prod.outlook.com (2603:10b6:806:14a::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.12; Sat, 18 Jul 2026 02:28:30 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:8:25f:cafe::44) by DS7P220CA0118.outlook.office365.com
 (2603:10b6:8:25f::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.13 via Frontend Transport; Sat,
 18 Jul 2026 02:28:30 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Sat, 18 Jul 2026 02:28:28 +0000
Received: from pps.filterd (m0373460.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66HNIUrR3443664
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 22:28:27 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4fc6py043n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 22:28:27 -0400 (EDT)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id kumuw5fl2qFVlkumvwU9Hz; Sat, 18 Jul 2026 02:28:27 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=fail header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=RlQ
	46LQ2KC5t/9pTVZoO6zHeJDDbacqPZi6Djs68KXc=; b=fK3hlb5zfrKtoJ3Kd8p
	qfLcfgCJeQo8VMiUFwglOn2dkcJ2Fs9qwMhN9v1FdVII0p0jPrkrz0bQWDp2zC0B
	rnPBeQdvpYbpRjX/zGBjcU3q7DBZxQlpN2g+ylaxUgMaiYUOn97Lc3GUJye32Si4
	9UmnWwyCPtnXt7pMU8nPkt+wKahUv/0NRs0/YPnHzbPHbi5VFetcR3/tV3ghDGXV
	2UdApR4P8Kq6gnrZRUkTYAoEV0MhnEv8YmYTrc5eTxRA8zBJ17p3ZCd8YvBLccgy
	mnvn27B3/z2Ap1mkJViwj0yUUHD1Sbzn1fbaOczm+ctKo2QHboy+WIJJB5Ki3y92
	V9w==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FKJphdYce3/8kJ9N6+D355QG+H7s0ujfRLNPJwza6NETH5w9w60mtOyWPkygP2xbud2U4cMiI/HY4PvVNxexMbg2o8pc8yqp0/aGy8GDNkBXXb1JHeCH/nz3WgBMhpHHJgDlXneXNPz6SlAzPWumrP8epwX2BBdMatxwxjiWce8ycTbpIweaIEyePaWYgdwlyp+CRS/u/PE4saa/p3VYZNu+SUw7vCeniKciLAfRfR5RZdYnpg/IUGjcFe5ABT1Mv2jcGW32XXG4vn2/0e0YARGYPMTCt4GoMT99LvpFqtGVuQ4JY3mLa7pXG2ahGJBLBvh+7/AhGs4SfChmdD7Ffw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+4CsLIU1bRbY4ZxswuwrvqQ+Xbfa6tIGA2PJMJ67l64=;
 b=yGDLGh8GyCJjegcYBFAKT5ILW1TZjVByKrjqpVugVQppCgl7FwozN4HuCjiqpj0JsukPrp2wLDIvtTM7JRtjL5jJ+V+AkYVR7dsE0vqS6x+tkqMUtHNup5BPycxChgJx2bbbAyobzNlfH0WicB5LkkdPmIJRWU685AcErJDfe9XfuwPkykByUfOo2qsPiv1qfiFscMXrBu5v8RZF0vdweEGxJexUKfqI9CYqEGqxQluBttrLX9PwpaS8PpFUDjGI3erHFX+EIrvCxFkXTqvtXPrfNO8ZXU0/ptY81FMO4RXOJ1cwjo8aD1ecQHaf0p+rxS1LM/XdDGXkeBjz7AEmWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4CsLIU1bRbY4ZxswuwrvqQ+Xbfa6tIGA2PJMJ67l64=;
 b=kIh0gkG/loAzzlBtEOHCh8rFo1ljWc2LV/0RtgwJ5Y4YxtMqhLO4nAnCpuCbC7e8yDfMF2FNG+qd16SYZIket7Y7WmeM5vz0r08ZfqadQflilLbSnQF0zVbs6kVA1FJU/Fr2h8NXqqPLnITuc6TUpCc5vXRiHVqmoKZgLj2xFQk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to; s=ppserprodsaar; bh=RlQ46LQ2KC5t/9pTVZoO6zHeJDDbacq
	PZi6Djs68KXc=; b=hG5OZ6P9XLsf6jjIf5KiC+f0uaVd9R9OrrO5+quAIMX+y66
	SpFN40VPisUHcXYfjZEJGO/0+DnHhKC+HvpOcaAq9kPWHXirHB0xEZ5nQ8Y7bzty
	BLlwXAmUY1ES90LrVoX92+JzmFtQpzZFC+fj3xe+KQnpairXJmPRgjZepE35rIRD
	PlLGdBqxqrq1R6IpOW1LSCYiLeZIyFRJTw3A+c0aKM2x2lMu1lBLGsn3o3XmhMdH
	r79uIVc3mxYhv3zIuoGV+ayWZmM24N9j3YpzrLxDCglZ+/fuJ3wle0tY5VoJGlvj
	65DwNXoEg4Rv5H3jg+dcPNUPFjSMVrHg4ze1oKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppfserpocford;
	 bh=RlQ46LQ2KC5t/9pTVZoO6zHeJDDbacqPZi6Djs68KXc=; b=DcZtHC1LqJgv
	IfjG69TOphqAmtDv5AMdlqiBA9GOptlVPTNfKvRzdtlTU/9SLSfgDb5M7+V2A24Y
	vbLfUN9MQapJfd+CohHRg1vwRlXLff7BcclEBv+BdLeJiCwWixub/fSbxlJ9VF0s
	zQbraxY07YvkK8/D0WAH3kCskWal4JoyrAHNj4UnBxMSvoK0RrT2mE6z+/Yigpk4
	TDnC4v++jIg4F8/c9/1wlCTNXoynNR8RKlZXPMlPbShbKtDXebAzI15WS8lvub8f
	CvAzbt9VRuiWgVfWznIkvhiAp1WX7j4HW6p7NtPp4D4oQZo1id3R1jAGse6ghYVb
	4esPMp9icQ==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: kumuw5fl2qFVlkumvwU9Hz
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Fri, 17 Jul 2026 19:28:23 -0700
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org,
        anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
        michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org
Subject: Re: [PATCH v7 2/7] xen/console: use memcpy() in console_init_ring()
Message-ID: <alrkx7XyK/pfUq9j@kraken>
References: <20260713181619.672176-1-dmukhin@ford.com>
 <20260713181619.672176-3-dmukhin@ford.com>
 <d8870af9-6fc1-4c5f-9858-16dad1401d2f@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d8870af9-6fc1-4c5f-9858-16dad1401d2f@citrix.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180022
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|SA2PR16MB4218:EE_
X-MS-Office365-Filtering-Correlation-Id: b2944120-b74a-4239-dc0c-08dee47440ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|6133799003|10067099003|4143699003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	gmy3fIcRF9YkZW5GYh4aI+GjHHQrip2jVNo/vnj1i4EupHuIqEB/M8EhpNma7X9FCjYhCCbkbPoKPZ9OoLu71syjE4QG9Y6f5lujqaCehxjbEFMkR9MIkzvjuihNh6neFIQfMSUot3p36O59KK/zeVc4rtp8S0y+ghdNHAoER/qECZaMWRT0pa7zLKzXyk5vHwGTB8i932CjxD5mMeNVAgO6CZHtJPZ+4fs4a42UnTHOM72cUpo63424qfqI82DYKW/C67xWzK+mr9aYVrZdGKZoaWllwZMfaZ+7tW93trXweKB1Xyrgctvc9C/bdyfBZQAVL1FNDMdWPtNmn24xsSSnb40+/J9kr6BzNp1XiYpmAA4rRXEd/jPKEA0dqAahcruKvW2d//yveplrPXbSY22oCyWUqXN+EeALXG557RQSYZx2yPoOmubzIvQv7cxYQ3WSX+3l+Bt4zQVZlgsDjYzeAEX9VQO2ZMXttSLWjRe6jrZvKPjQaK76+IwYTuoQQMUVb0LGMFV3ExNIsQX1GSJ4K0X0bojzpcA2VIwWShaiZKE3srsROrbjq58l99SFHQEfZboq8HFlMB9yZpBw9p3BJVxOvbL2NK8B7lAJAgBuuhEi6KZhBpl2ih3nLupHaEDzW1xAnMrMTqVIaE9PKO8M7eliLRjTkhNtP5IiXqERq95X1oG4IoxU6e4ZqHn7p2O3CRrTyZgHJjXCq9n87g==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(6133799003)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hF6jrbpHz4buXj5Olp9cf5XiktUzwsFdhW3thJhy65TENzuGubtz9Ng5niLWlz4rkfxgx9qIQAv+yTZaUS2qAfTG/cLajz67N3pT1L/LIrO4GQRp6KTTmdYIa7HZghCm1r+z0s8/7peUyTps27F3Qt6L9kD75wpRbGpPwHomhuLcNltcYUGw5aE+f/BOUnFGEUU7rKYJ1cvZoYMnU71Zlw0cp9Ys1xvZKECESMZVScLE4vEWZTtxNGSMw3gCRMlOWZlMXqKg1wRSlqEtq2A6+iw6aRobMiZ1E6mW3bltF0qh3+c5UfNmKfAQ0pjuvwI8faIkUzxF9BBcnvaOEgBhtWP/kb4SnNzn5rF177r+OoAkn6ahhvO6kP1sVDK0VjDMzZ0ACGhWMAaRKiIpy48qbQMVZ7THIlrIlcUmM/2DwLd0ds5bxK0MUc5H9ahEvJUw
X-Exchange-RoutingPolicyChecked:
	BRoMwupbcbdS9u4LZMoMtxK2D4SOcSyqn0svAlWf1OQiYEmFVYOeK/fAx7mQPQyn8B3fSOyq/2tqa06EvZw+DS9d3Wl8M489e/axGSYfBz9Qn1xq/VWjKfYFV9vJsKFWbgkGeoeNr5IX4TMbwOO66IR+/HfxDw0Q2reitpEAOhnBDPEDxkl/jHOb5bp3ZRWGqTzc327XJZ5HdoAOMwMEhfJ3nkHdsBdXSJVB2sYelA/qszf8mUVO91EbCbvaqb9WvEiw6PYURNTEK4yEOw2Em66YlYyrRt2w2AJ2/bv40efFuddbpar4+dnq0hKQFMVHYcNLwlil+bcJgn3wtI6rcw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EHFizX74HyKVUAQiskH5c1L3m5WBNxiXJsO93Tj8vOvcEp6txepX/bdgW4FkQ2jVxov4qGSTv1hrXd38SnIZbbRAeS7A0Bf2gMISJKjozNk5gDouYyKytNJ/Tj/7hByevs8C8zVzNk+25CHrJZhPuuiNso7KHES6pSuTRSm+vb765CVQlJaRlIH/OM2QAo8xqP6ytbWVWM+E2LCYXbqoWB8XRRDPwv4kCT3kKdwHa21Kp4WdSkqi5CDdj+2yvaUn2BbK6Ub7Nvq2UtuSVLjAc2DpRdcBxJwS3maP8rhpt7Y29n13UJHN8VKt9ORkKMDzGXKEPHoDzGeeAoJeg5chAIaaKP1mzTVhf7HjJEA5Ptt4dgxOfDDt95EKd8o9Jxq+pF6CTFOT9lwFUrZPUuwQ683pMyiwPEB799mLTGnvFY2jYqJ4wbgy4wipNpOukhEGEU0urZyZWDPLUpVEhjbPdgSFRk3Yt/i4hVbN7RXeur50SEK6OmKW5XgB6vF7k3sz6c/w9DyKAmwpZjEcAa+WFvZq0+ILD1YXrBs2E0EqIuQSpnJ9ff8Chl8a68t2BaA7b+o93BSji8lWddTP7Eq0HignbirX0Wr9n3HIy047eEMUzf16+8Mo4HZ1tCtdU+aHYLqd7kq7w1bQ/ruSUo7gvg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2026 02:28:28.4407
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2944120-b74a-4239-dc0c-08dee47440ba
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR16MB4218
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDAyMiBTYWx0ZWRfX2m2wEhzWotHm
 3x+XHN6suJupHftUTXbBjhDP6UhaJ/okHSflX73B2ioIpvlmRBE1rK5lReeBYyIPx7XJ6KVZW1u
 cS5odEouMAzxtJFtPCtf6HnQ2mmCHgVZFVNoQAneqMCuhVQvGLq4
X-Proofpoint-GUID: Wt3_McMiLX8CJcXyKplWnvrc-RSil7_X
X-Proofpoint-ORIG-GUID: Wt3_McMiLX8CJcXyKplWnvrc-RSil7_X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDAyMiBTYWx0ZWRfXyQfbhw2/FQXe
 +El8no6U216WtwbameI85Q/Fbvt957BR2oTGXAQOEH9IzNPoV1axFSNkT69JowsugJDtcm8ugfX
 XERLYwNeAnqXj5d+C1Xu391FKAfvUFKq5ZEnX7S8rHbPObOKU/x4uKY7hoD/rvrZGIXR732RW+o
 uUMkKuKjInH8jXKLHN6+AVqJD1CydkNPY78x9QX7K+258n0fXAqzC/iyBxHVtxDjnASPR+ozhbp
 P0h5jVlZ/L3MJtq8Rhw3yvCvyh1j7zr11/l3A1jbldUu7jEvaZuC/snrz1Pgl+O6NMwYHXbuDxa
 T36RCl95+MIAQq25G+LVuBBzg/Xk2pzPfRFMV8PXeaomDthinU6OrXR6YstWYtK9LxnvrysHWnv
 3zWkiUu5rWqTHG/ijFJ6RiHGPKJ+SQcxAXStfjMBHpr8V9wk00AEB4KQrbZcAbXhfn0iixKAKX1
 XOqWFFd5g3KeFvKL8DQ==
X-Authority-Analysis: v=2.4 cv=PZPPQChd c=1 sm=1 tr=0 ts=6a5ae4d1 cx=c_pps
 a=41oIdeUvPxzefjUhlJkc5Q==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=dw5MciS7gY-znkhJuOLE:22
 a=cbNQJ9GKAAAA:8 a=tHz9FfFoAAAA:8 a=sokI8wEBIBHMek2a-JQA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180022
X-purgate-ID: tlsNG-ef75cf/1784341715-356C2AE4-E4DC9AD1/0/0
X-purgate-type: clean
X-purgate-size: 2324

On Fri, Jul 17, 2026 at 11:01:27PM +0100, Andrew Cooper wrote:
> On 13/07/2026 7:16 pm, dmukhin@ford.com wrote:
> > From: Denis Mukhin <dmukhin@ford.com> 
> >
> > Make console_init_ring() more efficient by using memcpy()'s, rather than
> > copying the ring a byte at a time.
> >
> > No functional change intended.
> >
> > Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > Acked-by: Roger Pau Monne <roger.pau@citrix.com>
> > ---
> > Changes since v6:
> > - addressed Roger's feedback
> > - added Roger's A-b
> > ---
> >  xen/drivers/char/console.c | 18 +++++++++++++++---
> >  1 file changed, 15 insertions(+), 3 deletions(-)
> >
> > diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> > index 5ebbbf63c092..37ea84403180 100644
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -463,7 +463,8 @@ static void cf_check conring_dump_keyhandler(unsigned char key)
> >  void __init console_init_ring(void)
> >  {
> >      char *ring;
> > -    unsigned int i, order, memflags;
> > +    XENCONS_RING_IDX done, size, n;
> > +    unsigned int order, memflags;
> >      unsigned long flags;
> >  
> >      if ( !opt_conring_size )
> > @@ -479,8 +480,19 @@ void __init console_init_ring(void)
> >      opt_conring_size = PAGE_SIZE << order;
> >  
> >      nrspin_lock_irqsave(&console_lock, flags);
> > -    for ( i = conringc ; i != conringp; i++ )
> > -        ring[i & (opt_conring_size - 1)] = conring[i & (conring_size - 1)];
> > +
> > +    size = conringp - conringc;
> > +    for ( done = 0; done < size; done += n )
> > +    {
> > +        XENCONS_RING_IDX src = (conringc + done) & (conring_size - 1);
> > +        XENCONS_RING_IDX dst = (conringc + done) & (opt_conring_size - 1);
> 
> I see this has been committed, but the use of XENCONS_RING_* is wrong
> here.  This ring is not a XENCONS ring, and that header is almost
> straight obfuscation.
> 
> The types obscure what's going on, including the fact that this logic is
> unsafe with a 4G ring.  And while that might be a legitimate
> implementation restriction, it needs to be obvious in the code.
> 
> These want to move back to being unsigned int.

Will update in the next iteration of the series.

