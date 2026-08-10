Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52ADDC5B567
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 17:56:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387737.1628977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtUEf-0005yF-Um; Mon, 10 Aug 2026 17:56:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387737.1628977; Mon, 10 Aug 2026 17:56:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtUEf-0005y8-SC; Mon, 10 Aug 2026 17:56:29 +0000
Received: by outflank-mailman (input) for mailman id 1387737;
 Mon, 10 Aug 2026 17:56:28 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wtUEd-0005y1-PW
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 17:56:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtUEd-008Ycq-6S
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 19:56:27 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a7a10a9-2eae-0a2a0a5409dd-0a2a4506d452-32
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 19:56:27 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a7a10c9-195a-0a2a45060019-94a392179362-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 19:56:26 +0200
Received: from pps.filterd (m0367123.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67AGEb9Z1908470
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 17:56:25 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com
 (mail-eastusazon11012061.outbound.protection.outlook.com [52.101.53.61])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4fyha31x2w-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 17:56:24 +0000 (GMT)
Received: from DS1PR04CA0008.namprd04.prod.outlook.com (2603:10b6:8:44f::15)
 by SJ2PR16MB6251.namprd16.prod.outlook.com (2603:10b6:a03:592::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 17:56:19 +0000
Received: from DS2PEPF000061C3.namprd02.prod.outlook.com
 (2603:10b6:8:44f:cafe::26) by DS1PR04CA0008.outlook.office365.com
 (2603:10b6:8:44f::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 17:56:19 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 DS2PEPF000061C3.mail.protection.outlook.com (10.167.23.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Mon, 10 Aug 2026 17:56:19 +0000
Received: from pps.filterd (m0426315.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67AGFTA3499565
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 13:56:18 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4fxpbshp02-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 13:56:18 -0400 (EDT)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id tUESwf7SGQLYTtUETw1jGb; Mon, 10 Aug 2026 17:56:17 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=Gz6
	pDUp5rLV7SS4lZjhFrNaNaJ+FdUpeMI3ZZ3G7QvE=; b=tX28oPUFqdjZqIBuy7s
	8hO2V0D0Fdxe1+5BmA0I82FucKEr1g3LOcjrrfb4UI1Jzvhq9EHDRksKxEToZZLo
	g1GVOBXLtkbVbJ3tQLU0jH/zStInnS3t4u1X94Hp0+eE/cSEXolhwbMKM+RakZYO
	qBtiwgQjF0OAnOJaJNuHMdLB8WHGHzLaX1zNwF1cx+x+2/qeJvZZ5ysk80mVuQMJ
	SJNqMA8ELD+rHlxEXS9hnhWY1BySUuzDZv3rx4geCiG2VYjiynCNXlsXYe21SjKL
	etQvcPXsCku2VYJ3ANZ3/46eajcc6TW16eo/IGE13EC/71++CHYZ4KUkZBi/udzb
	j/Q==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VZ1LKXPtRVbKqm1hOmFUycC0ZinT1rZHtxollgPIxUoFI++RCMiCPrQlNZ4NFC+swUDaVngGF2bFBrJ4P/AlptCA///Y87J/z3j1BpEQSFjlImA7Op3tjDsgfAiCeQlkss+YDyH0n3cu70zt7ML0u3++LCb0/uuP6R9wlO36Ex7k2TYoHztbB9Ow4aMuMFP3re3lSMtUjlNm05qQ4XWQ657sYudjO6cf/g9cog/orrlO9rgVEaRPnpzgEwrNu0vrbqTamN3A9L18xmB++iOPSB1DUYPShkDCTSND5LLQpY1XFSuEfBTQQWQl5DIQ/eMgxKHOkMSxi7ECL6HfKhZM9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=90aLdj9xpoZAg+4D/L3YjgL0OFuZL96uidt3wVPvCGE=;
 b=qWhj0UzYYZVp3G2S4/F/7QqkmaO4ExmjOSqVLY+f+xqd4zkjoZrkGdErt5DgMdQUvvhd05FJDs7w8I2dNLDzpdV/su2wCsX3VYz6udRYVnAVjTb+Z/CHwfvfqHI6C2qnB/NvSKfWlG7lRwe29h6fGLSICR7CUHpaSzxfhzLEDscVYvk0iG9IWt95MA35/JOU9X/x6CuixKMXkfESUjCWG+vUnHDh9LbtBzqVri6enAF61q4NkUO4WHSQZzbk9S4b3vyR0956LfyueQkOcHqJtcvYeyfTEEeYJmsR+FKKx4+4nAuXL0nqR0MTN+BkC/zoEka8vUnq3Fr07whz9YTyUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90aLdj9xpoZAg+4D/L3YjgL0OFuZL96uidt3wVPvCGE=;
 b=IFwI0mRl5CyJBN34mujWY8FwjF9vuHDOqFoVO+ffUCLIJIqRnkO4nRRRzAoDnTjGMIHHhCZ/MvUfUZ/z38MP6mEHIQFEWHWrZjNLxQZnbQsCI/8HXOO3YSCdGIPhjcjKilaTatZuO7EIeVWK81tg0nLJ3VEgwO4kKWwwEa78pdg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to; s=ppserprodsaar; bh=Gz6pDUp5rLV7SS4lZjhFrNaNaJ+FdUp
	eMI3ZZ3G7QvE=; b=OLdYk/+GyQolBDt6NFuzr+SZEaN7vQ1z8Ures+SvUH0Y31x
	i1eK+1NgKrzXDrd7f7jRMx2K+k2/KztIFdWrE77hMVuHASc2DIsw0A8DJ9xufuPF
	p9Ccw2y0TgU0PpY1PWepdWnfIW9pWEBESjgy+nAiSNCRi2oOe1SrKztwAiMwiO0l
	uJmJkXRLJkfjBdIlqjkVNOJs1d1SiwB+e1XVdU+E/yZKiq1K5bWN7WCtDaJtsnSt
	v/HOnsFDr5Y7R/MCs251lIjgQnTh2oohHf5g4s2pI53i/7KuIlUSG5bQmQJl9lgJ
	N5c9sRQvuaqJZ2ZoTR689vdI13gXCbDneTEG0tQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppfserpocford;
	 bh=Gz6pDUp5rLV7SS4lZjhFrNaNaJ+FdUpeMI3ZZ3G7QvE=; b=I0tzNdRZXj7U
	myx5gR9XNF/qC29a3zRs0vt/24FkwXp/+eOcThd/BZObOCjaJzkvJmNaBHWUEK46
	fqIMqSxZpA08S+QB4AbtPlmkgdSm0VVR3LvmBjOItpxMm0tSek709rgBLYqwxWsX
	+om2fldlkpxCaVoDArPlELW2vN70wgacsnzQn+lk1Ic96VsL+48vWUJJQU3KxEEr
	bFGh2x7dK2/yzDdpcs/87aHi111cO/s1c2MTurlx435n4GgL85HcfyLmJzIk/vAA
	iy0Yw/pJq6axNrG0SjG63vye5gpcScBgy8qLn8o0seBY8Ftqm5CgESIoQZQ1/Pbe
	2Pv1vJm5aw==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: tUESwf7SGQLYTtUETw1jGb
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Mon, 10 Aug 2026 10:56:15 -0700
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger@xenproject.org>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org,
        andrew.cooper3@citrix.com, anthony.perard@vates.tech,
        jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com,
        sstabellini@kernel.org
Subject: Re: [PATCH v4 2/2] xen/console: add compile-time rate-limiting
 controls
Message-ID: <anoQv9sWca/mLWQR@kraken>
References: <20260729072520.1556970-1-dmukhin@ford.com>
 <20260729072520.1556970-3-dmukhin@ford.com>
 <annMNjOodiS3hHp7@macbook.local>
 <annM2322Ig23p4RG@Mac.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <annM2322Ig23p4RG@Mac.lan>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_04,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100153
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C3:EE_|SJ2PR16MB6251:EE_
X-MS-Office365-Filtering-Correlation-Id: c5900d05-ce6b-475f-0908-08def708ae78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|18002099003|22082099003|56012099006|11063799006|3023799007|6133799003|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	of+8K6UXo6HVjp/yQGV0USQZWukpLUfxKzy10o43BOsVvRHW2o5yGrXXOfacT2dWTvELFoAzIzxXCMdL22TEVHGrVyyXI+8Cz5YzTcyBzIuN7RTa8n1P6mebnzFQsS3mKjszdtcgT4DOt1LCN8Nm1wpcRoMAQ7XL+GlDVVkgDM3kaheKX9HO5omHwntN1m4gpMCWafil/EY+mJYp+x3pGkdPdHK9aczWjkqHivPDjJtgtSQBzF/3DlRyvF5+9E4KXAEjo+5edq2ysE/2T/QpXixej1GrtdZ6Bgz/OuyqMQHKTqnYk6+VyVDOj8lPp77k+XL1xfP8HukAypXIoWj2u4NS6mDh6RQoIlH6Qhws4vlDADiAio/sTXiZ1Iva+0gfxlTOQfUh/qk8dDg036LSFkNEObH2SJJRDqEC+m8CZ6utWpAxFUGIRQoIdVAW5M2a3nXvsityO+mQSMBUu2mG4YaQGHDp0PfUGuqzb/gUBDQUJnjphV2oYzZ22UsOX8CQicnV2oadsjmeoPsrciCklM5HscKD35pyP0oqM+L55loLwxPTK3gC/HnKG6bEtQei/zV4kVJipI3R6pnhmep1H9C9+3z3u/zWPaa8DyYpyNb/i7EUm02/5ugC8XFOw6E2Sj62yknhA/7381tK7A2gNImtzBeIBnwym4GJxPMy4Oy4Z57cIX+auhVPN6QHcow9x4dVNiyR7BgmZAQjM2Q8aQ==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(18002099003)(22082099003)(56012099006)(11063799006)(3023799007)(6133799003)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mjMwknj/dCb6IVPpUDxCywhz7ZPgeGL1/TUhATS6OzNd64IDymuOFGkhAeofO1FkAwQhwPy3FQXHobP6fICgO6JB3TGjVbZwxEX6BKYUueK/FMB5M1zvK8yTX/UooSm/9uTXoRSc/ZdNDASn2xIfB9bgj7YW1TSgj5RvtfSFkl/FzZ9YQ99I6HfU7TiC+8u8+C76ZnuqgEXja3n01dUCUiIsPFTal3GXZAJmsR26rgR/nJG2CjNuWHHfNO/vnhOi3y7l29UgRjXkUEFYOCVXXtIQKCmpjTLrkBQtOevcJLZ46Zo5Cn+J+W63k921MiIx63VBrgeY5o7Yg8xG2oQq5j/XD+ucuJDr6BDQvnfGrH82J/vEf+uM/7bFo8eCuCCV/8/1u8vGHFbKAb9Cw+tkevOLe0ldL5iJA91lSh+0LxiCnsQoucGElpsSAKe6xSU2
X-Exchange-RoutingPolicyChecked:
	cAMGfj9UUkhjo34bWMXF0gnGvE9ak5Yk11oDnbdtAVCrAdKBblsyVUCMxqE0bDo5mC2p/pKy5trTmsoJk7xhTq5HGGxbqthmFCxyqFMMm8Tk3gwTda3O7tLgrjYidCwQK2k3GrzJ3YOm23XumJlj8cQ3vmIT8dh4+4Rf/wXOMHS3m6UttHjYbF54Be8xfXQLViMWXYtpitHVAcQ6g+WxI75xogAZw2kaGyGAZCcM7Jm6Svu9KDRFyfeB7Df7Y2pqr3p85N+Y/HuZZp7oIPwniOOxGn9nzSgY8zki+8VVVkoWiwhQdk19tGv9aj9iyo6/0/A4fhunwyr7Pz4VQYYybA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6IQ2hPZ3WeT0LSG5sCPASC+BmMwkm7orVC/SmvIX6E7iZmgpIUPgYcxzfpb+ywvBmC2bX7hJadoOhMEMMmMn6LL0FhMH7exp/sxhQQGIQLuTN8FNW4Itq0Eyo2ep7zCU/dXy6WtlZRw5Ws3omlh/jq68b3Fk0s7DlPjhGB8ae9NfUijex2St0CTH4SlUQ5/L8DTJFp99z3ej11F1ybfX2T+3cUYq9FZ29kDW0h3Qv7Y6QmGEwCVVL0ssF9CKn1pLlTwJlplV3AYQvQjOC6fV8PZOrGUE/YZhVqsJndHw+2fUxxZGIhanbZyrTejag77AaCMi1uFpDbn/T4J8tkFwjVoXA5qqF+FMwTVI6FWDl23JVMAkXR+K+efcPwZpBngagdD6YVLoYaZGk92kGhCOA2P9bEa12DqBYQLgdVD4L1/P9cJFOUxwCQIYSDTknDaz83qm8oNj1eGEFbvc5GbsKbA056zHLLe53Kb4ZZYgcxxwI4HGwJhdPOPhe8UiMCKMuBA6Y1RPZ2SCmWevGxI0tieeGwetU33ys3ZWAH2erQgHNj1nrf5B5hsH+iDW7aVPJMKqDg1aEumJUElDSmsYF+7otquJrydQT8F43mGLE6PgJ01ObdVpJhIt7q2o1N0oBa5IiseulgFKmaB67ts7hA==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 17:56:19.0102
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5900d05-ce6b-475f-0908-08def708ae78
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR16MB6251
X-Authority-Analysis: v=2.4 cv=AL134PXh c=1 sm=1 tr=0 ts=6a7a10c8 cx=c_pps
 a=HO36DfDzC3pv6rVb14NK+A==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=8nJEP1OIZ-IA:10 a=Sv0fKeRqtYgA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=N9_n2FxmZfwfyRXvS9-E:22
 a=VwQbUJbxAAAA:8 a=iox4zFpeAAAA:8 a=cbNQJ9GKAAAA:8 a=7fQNACYqGrSk0fLGjlEA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=G69WFyCBNqGPyalROSdv:22
 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDE1MyBTYWx0ZWRfX3N1ivz/zpM8Y
 KHWjz6nnh3yhq2y4KU2wDXimjCNrJLr7qT6dIBdWUFCdqNxgbdAaucRGEsJDB130g+suHobDA5q
 R34r1ZzonGkXey1/mMwXD8jh7DESsxMSt2zzsoeVHPskolsm2rW/TRlmhkRtSPjTZ+6pgD9fyE8
 lTs3pV+pbAM+yUPhOddSIJKtuVZczOpQcuiG2RvtamT+TF/q4qhXxtoKf14jKPmihYNgNZYzzjf
 0qZ3ySTC4I183cWx/tNiKy7AXtxyVM3X0byeoxJeY+Th/m2uKeJ7APAN4XsroKtj3/ZPL0/TPNW
 VBQampdKIt6B50UXC/CGE7gH/cdxxqj9ebCYYdES2aOSr13d5JH8stsJnSRahlX+0OLTvPu48E5
 ExYfc61LEWV4dsCzylsIdZGJK8IgJDvqRxGOk+JmcWNy93Kn39+2h7DkOLx+GaYWsTv0EdHYVvt
 n7Y9Rb0hpaM5f+qQtaA==
X-Proofpoint-ORIG-GUID: j3-rNN05blIRF6n3b-F9A1nz0TBaf4qP
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDE1MyBTYWx0ZWRfX3UzmaHIIOv88
 F7QQX5eKzCA8Qm7cd+8oPRRdoIDYR3pc0pf5LLYFCmUrjWjRwWdYbzT6RJ+a8pRm1wCTkVMuc3d
 Xubnm5Ub5YzqcclnYVXmI01MAxKtftkqvgunLYMgbzAG5PlCXYKk
X-Proofpoint-GUID: j3-rNN05blIRF6n3b-F9A1nz0TBaf4qP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_04,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100153
X-purgate-ID: tlsNG-16d1c6/1786384587-FC20077B-C2303150/0/0
X-purgate-type: clean
X-purgate-size: 3335

On Mon, Aug 10, 2026 at 03:06:35PM +0200, Roger Pau Monné wrote:
> On Wed, Jul 29, 2026 at 12:25:20AM -0700, dmukhin@ford.com wrote:
> > From: Denis Mukhin <dmukhin@ford.com> 
> > 
> > Introduce CONFIG_PRINTK_RATELIMIT_MS and CONFIG_PRINTK_RATELIMIT_BURST
> > for configuring rate-limiting policy at the compile time.
> > 
> > Use symbols for global rate-limiting initialization in the console driver.
> > 
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v3:
> > - added note on security support for non-standard configurations
> > - gated menu with EXPERT
> > 
> > I kept both settings for now.
> > ---
> >  xen/common/Kconfig         | 36 ++++++++++++++++++++++++++++++++++++
> >  xen/drivers/char/console.c |  6 ++++--
> >  2 files changed, 40 insertions(+), 2 deletions(-)
> > 
> > diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> > index da80fdba8469..749d3bfb08e0 100644
> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -672,4 +672,40 @@ config PM_STATS
> >  	  Enable collection of performance management statistics to aid in
> >  	  analyzing and tuning power/performance characteristics of the system
> >  
> > +menu "Console rate-limiting"
> > +	visible if EXPERT
> 
> No strong opinion, but there's a drivers/char/Kconfig which might be a
> more natural place for those option to live, and then there's no
> reason for the extra menu?

I had the knob initially in drivers/char/Kconfig, but moved to
common/Kconfig to address Jan's feedback:

  https://lore.kernel.org/xen-devel/2eba7de1-a8e2-4c45-affb-8ecb91278707@suse.com/

> 
> > +
> > +config PRINTK_RATELIMIT_MS
> > +	int "printk rate-limiting time window (milliseconds)"
> > +	default 5000
> > +	help
> > +	  Specifies the time window, in milliseconds, for rate-limited [*] printk
> > +	  messages. No more than `CONFIG_PRINTK_RATELIMIT_BURST` messages will be
> > +	  printed within this window.
> > +
> > +	  Setting this value to 0 disables rate-limiting entirely.
> > +
> > +	  Configurations using a value other than the default of 5000 are not
> > +	  security supported.
> > +
> > +	  [*] Rate-limited messages are those controlled by the `loglvl` and
> > +	  `guest_loglvl` command-line parameters.
> > +
> > +config PRINTK_RATELIMIT_BURST
> > +	int "printk rate-limited message burst size"
> > +	default 10
> > +	help
> > +	  Defines the maximum number of rate-limited [*] printk messages that may
> > +	  be printed within each `CONFIG_PRINTK_RATELIMIT_MS` time window.
> > +
> > +	  Setting this value to 0 disables rate-limiting entirely.
> > +
> > +	  Configurations using a value other than the default of 10 are not
> > +	  security supported.
> > +
> > +	  [*] Rate-limited messages are those controlled by the `loglvl` and
> > +	  `guest_loglvl` command-line parameters.
> 
> Is it common to use footnotes in Kconfig options?  It seems a bit
> weird to me, I would probably just expand inside parenthesis if
> needed.

I'll just drop extra text.

> 
> Also, I'm a bit confused by the mention of loglvl and guest_loglvl
> explicitly here: messages outside of the selected level are just
> discarded, and hence it's kind of obvious that just messages inside
> the selected level are controlled by this rate-limiting.

