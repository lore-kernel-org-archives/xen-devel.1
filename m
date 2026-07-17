Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C0F2C44507
	for <xen-devel@archiver.kernel.org>; Fri, 17 Jul 2026 06:18:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1364658.1615675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkbu3-0005eo-Ic; Fri, 17 Jul 2026 06:18:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1364658.1615675; Fri, 17 Jul 2026 06:18:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkbu3-0005eh-Fn; Fri, 17 Jul 2026 06:18:31 +0000
Received: by outflank-mailman (input) for mailman id 1364658;
 Fri, 17 Jul 2026 06:18:30 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wkbu2-0005eZ-1v
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2026 06:18:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkbu1-008NPZ-7g
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2026 08:18:29 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a59c929-5cb7-0a2a0a5109dd-0a2a450a9144-10
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 08:18:29 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a59c92e-f2d2-0a2a450a0019-94a38ff135e8-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 08:18:23 +0200
Received: from pps.filterd (m0367130.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66H5j7YS340102
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 06:18:22 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com
 (mail-centralusazon11011009.outbound.protection.outlook.com [52.101.62.9])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4ffeh805u8-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 06:18:22 +0000 (GMT)
Received: from DS7PR03CA0119.namprd03.prod.outlook.com (2603:10b6:5:3b7::34)
 by DM6PR16MB3862.namprd16.prod.outlook.com (2603:10b6:5:294::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 06:18:16 +0000
Received: from CY4PEPF0000FCC0.namprd03.prod.outlook.com
 (2603:10b6:5:3b7:cafe::2b) by DS7PR03CA0119.outlook.office365.com
 (2603:10b6:5:3b7::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Fri,
 17 Jul 2026 06:18:16 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 CY4PEPF0000FCC0.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Fri, 17 Jul 2026 06:18:15 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66H31kkl3450902
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 02:18:15 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4fc493q20g-4
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 02:18:14 -0400 (EDT)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id kbtkwLJGmuq5TkbtlwImaW; Fri, 17 Jul 2026 06:18:14 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppford; bh=wTbv5APj0X4h+JTSNP+IH6Ed93/
	aqOG9yhDTnqNdTgE=; b=Ldj/dtnjoemiy5s+/ebRxq1JHdPIv6G7UN1SD5uJMe6
	XfexCAYF74E1AWg2sf4RGigJ4fxE3Pg5kvB4RsDilhNMmsF3eszcla702x9lIe1T
	VP7DQemRbhLX+meXMbwxnMKadQBGM4WdRl85f71lOXxZDKM93ZpF1h/q75R3yXWa
	w65fUazfWMfZfQty5ahes0eZN8767Y8PKM1GK2NB9mhP0uvwiQyLUWK5nATZfATv
	BEzcAPqYkRjK4AP+cyqWmyCvGtnwcf4kkzDV13a8rOrASbEdW0uAPYlOK0e9Co+F
	CZnPj4GkbHQMJKt26DZyHKp2vBY1kaemDaco++pl1+A==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G1zGPxhjgv5mguwRsmaPEAO2rnzy0I4YfnjB2S3Z4PAPFEF6dlKmqtCuaPgG8JGhY9tH0g1QDze2masjoFqzRUyDF2Apgy6jWbUHucdlEYJrkOqzt53/PyxD01/PsjxlRCZqugdNY1UoES3p+eSMHRKLJERLl8UM3vPIW4Gxx3lTQi3SSJ4VDnCLahYTt9pTAsG1IqzbENgFpn1ICKYASflscg+x4fGCTJN5LvZvmUnbqmMHATbruhFYBwhE+hCeJoCAFH0PUo6E+9o7rEL8ARG3OjpwELyUS6hSVMsbciaOA2Nqw2lgayMuevr7ogFNOM8wfPedoTsJZ4rvvEOwWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTbv5APj0X4h+JTSNP+IH6Ed93/aqOG9yhDTnqNdTgE=;
 b=ah5huPgCsHr9tMrLQQkl6MGpVS8KcjUBugR+OrLvsughge9loHKq6WSwSi9ggxIdNZPSRsbn1S9wFEYlpJOQbPhC+IEl6UPwLwFrHawG0SlRl33YEPlu3iXz7bH44x/AHc2ATuYM6ZExNzNi5eDrYquHIQlMJQTeDZ2vHsEQU0fRj+UL7Yt11nUajBVJR92n2mK7OGKwkzAIodmc2bhZmyUqNWeDJbQU7RhUTEVshrBF/0XtLM61kz8+f3/fyD9u1siYEKk12L/W8kL8dRwz8gM0iJ0HFthMVpNnpm1KNaOQGM+x6HSi2T8Tmqm3DZGNBoGFXmE7La82YacagS9ZzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTbv5APj0X4h+JTSNP+IH6Ed93/aqOG9yhDTnqNdTgE=;
 b=HXHiZjSRDv+F2fs4QOg9/0NEHNpkQE8ATJYC+IIp+Idu7yC37ZoiVCEYbrNfP/EfwWGyF4hY1V410o1f3KgrGo+J7JsxrBDLhxqvxKcjQGk0SD2jX8TFr1T5++ew+sS0/BwxbuYWUQdmFa12yHZftwZKqpl+/N/rsgmlmmKTna0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppserprodsaar;
	 bh=wTbv5APj0X4h+JTSNP+IH6Ed93/aqOG9yhDTnqNdTgE=; b=TVoBSZFpeKdW
	UyfYXnX1icRRDdxv/6jQ4gFhMv1Y1WRHNNHNk6MCqpkJpMwdLVXrKnxpVReBkSOu
	A9LkTqEQpsDj1IGKK1jz3VmSARigT0j7fAPx53bKAcV4TIOQgaarE3LO0KDCD0O/
	DUECHMKDQlNWC7IPDv+wLF3JXh6c6BUE065ulFpIc8QXIQ5MLclhSwzSUZudZVaz
	g7YdrlQBcKzU+PKpVYKMmm9ye4pUq0mWA5fSLYyCPlBUunGyIi0rWpFHFgAW7Otf
	O08fGMIeaXMgkKENZS/IihTvJXMPSjuA3sIaZVGFkSiTC5XEZlYgOz3sw0aziW1b
	Oy0D6kJr/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=wTbv5APj0X4h+JTSNP+I
	H6Ed93/aqOG9yhDTnqNdTgE=; b=H29E1baOZS9kS7Uyps0qs1MgRDGY8b7d2vAR
	PXy1AEETfJe8zEysrWczHiU8c70frQZiFD71ORBM6LAJq8OAglrz73yiVeFyjmV6
	rF1TggFbjCHSc2psCQSvgfiyjx37wDQ0VaQw1W10Uds4OJWSeajeb9+9heoluZAY
	c2spEGrA8Ko2nl6PgwlZkmvRjlJvlh4dPEeeQijFPV0Tn8uakODIb7l1Dg81pALY
	0Nj4SlbFza5s/3ec3slkNQHT4l3DB4cqF/84uMSy8rVSbTzbg0EUCJwi29bf4EK0
	nfI24uItTxqe0o73m1lRSPEgCy8vPH4U1KfIrnGfBt/AtDwnnw==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: kbtkwLJGmuq5TkbtlwImaW
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Thu, 16 Jul 2026 23:18:11 -0700
To: Jan Beulich <jbeulich@suse.com>
Cc: dmukhin@ford.com, andrew.cooper3@citrix.com, anthony.perard@vates.tech,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v7 3/7] xen/console: use memcpy() in conring_puts()
Message-ID: <alnJI+8Whp3ES3Hz@kraken>
References: <20260713181619.672176-1-dmukhin@ford.com>
 <20260713181619.672176-4-dmukhin@ford.com>
 <40223b4b-4cf4-4cd2-8085-5323784b2d33@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40223b4b-4cf4-4cd2-8085-5323784b2d33@suse.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170060
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC0:EE_|DM6PR16MB3862:EE_
X-MS-Office365-Filtering-Correlation-Id: dc8574ca-fb71-4a4f-feae-08dee3cb3029
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|23010399003|18002099003|22082099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	LMwgi6cWbnD/byMoETZD9/TDWW52tNgjvEqc+lf1oLBR9YmRpbvKgIPDUwZxOeFXJWwm6Y+YcFoGekr+L42/tUSonYNwwtLq0+iWTUeT/BefauM3Zc+ig1zPaoy2GQXALMnuF6i7qHeEyMhfeFhXZAZmd5uoG9n2vSLmwSC6BlLjlqggTBvGr9/IntHZB+17dLChUNfsotSJCs+8VrqU0KX3TmdKEx74i78sfG06tvK9Q5n72v1Uf1kdLbnHi0quBXgxWhT3oBZOt4ZxGji65+HiKg5ZdDZ5Ld5UHqNE44ABsGZ2bBpDGHRSP94yNxT7EaQ0PgFoq5H1AODaRgtJz/F+CiqO09fA0Qd2ASYQ9Ij65XBmtvCvmsGAVIcyrjKNbVsMVDxnaWFcVtM1RNO/ts+rxbQBxGwDTBhokCxwZs31VCkXWiMWBT55ZHc+XyDA6xP512vEdABuxS8acrlFgr3zCbEN3h2t6dxW3yWIoZWrMLG8XdwN04cUWQITf60ffa9wR1OtHTI4/e+HQZAI1e8QcKzaU4uiYSE03ydq1Ez6yMuIOdU1wgmF/CKsOwcZGf2/6fRqW6jKS/kzs1S5dcXjSvIMn5+jk1BqJvAWev01RGfgIHeE3xtnDibNbybN+NiktqKCm73Nq6z38uXytL7egr384j5jDImJYSUeu1X+m949b26hO6tmzWWsjOIeCjhwHh0tA7p8bzbCLK8Nvg==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(23010399003)(18002099003)(22082099003)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	a+Om6Z4H5IesHoj9hha5vwcrYUWTZErysxyKzCf7hDj36oRBN8fgRKSCakMYtzbMCsFH2BnytATvIts+XZ3jSOYdCuoCIPUC/tAG7dCkpyb1OAl2A/tw6A5Q9uPgPvvyuNOOLmrnOHuLe6Ixb8UjxEiTbj85m5TaT1HRUcWBY1HdKI6OtROpLBgnPA/5CPAjEl0FLUF21E46U+b0aQKrjTRV9nYpm4Uh4a5fHIiHrUqIDosKU7LCee+TwOAb+KAvXdsmYjNa4oGgA4wAiRyR48xKgVsrcA7jXOertciUdXg/yhVlHUa0lMjmNDJvW4ASCoUipSPWrw0UCqRSTHLK3bvptYv+42THgNgmYsmoYuadurQWP/v0LdfmrjbiVY2MIhE+/j1DKI1lCaT15mrSr6OfTaTBeB/wnHckddA0VUe0jxLh9Yf/Smq6d/VqcV1M
X-Exchange-RoutingPolicyChecked:
	j7lG9Ag/TmqDSOOlx54FD2qvl2k/pzKxIDR1NUlXk5OoyDbnkA/R8dF7H8oXO5D8SWh6Ln49P/NfgXRzcm0ml1TCAL9gLpYrSUcKTn5/IHiTZHVw8IKje7PEgtK/zyPNTrZRt0/PwKoW5VegRrtI25LYgy52HQiMg195/o+YUa7ZRTbg9NREqF7mVroCa37zy0WL7uKEnsR0JdADeL5YVy/VvEnd2NYCC/PdwRv/7zTk2R+6wpQfULhomfTVvhQvyy44frBLtAgo8xspj/DyBTNVH858XIU0D68+lmtdtJBnLqhDZGHkCoilkL+aa0NkZeHoDT65l2TMylOszbvaOg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	T0eGF/2GmKVruOhzWCLIl29JLRcmt8Vqa0jFSBb6mBo5lN1EjiscAo7NhJJI7qUYgBlgoyF/cI2VbSYZMrIIkGsJixsDfBX2nL7huamCD3n8ZinoYAfmA2aUgcqQi1MqqvYX3C0ujz8dRU81UTBWXpQCfOi+M8loMQFhKIQ5yqF49LQKpouqAl4GJzoJZYlNZ+47QJsUdR5tVLCD2/12Yro+0AlmGbbrLUViRfZwe7ntWy+EhRA+IDXxiekRbXwW6RuEMTtEUSMBPKwiLUe1/JB8TipISCDhpOE+dQZPGQPhmMq3AfLVm/4sbiTRm/XVCnnQBYsyAyKiqy6Lt2uZR19ZBAmmSW0frMpw3E2KJf/kTVQrkDvbSVTxS+KHnvs3L2QxugcRiOKYYA9q1+UM7znKTGCGIo6yjVpG6UavGXDknkJC8w7T7t8bTaLQZ+lSAp2JJ3HgrCD5BHEHoGAJ+y0DYqV9kYdp/aBHUwoB51eoXzEORstgF77HEh2hVGpNggA0Ohx1pqCgJzL3hofKXUdIgOHOf/6ZUaGDd4vSbZ8DzJAMeWkAdVGQz2D7f4qeZ7WwYn1OjNxQPhB9lIfWxZPMjY5PY6r/HvQsLL8ly2qHg/fTbYvaKtmplTz0BVmhsLLYOmmflpB/5hYRjdpveg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 06:18:15.7631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc8574ca-fb71-4a4f-feae-08dee3cb3029
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR16MB3862
X-Authority-Analysis: v=2.4 cv=JPYLdcKb c=1 sm=1 tr=0 ts=6a59c92e cx=c_pps
 a=2InGsGVdz7DAox/zTLSmPw==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=vnUQfov-gS4s1L7hHvr-:22
 a=cbNQJ9GKAAAA:8 a=-g9LuZ6nVvH6MlV1zgMA:9 a=CjuIK1q_8ugA:10
 a=P0bj-C3X3jJDpopQwM1U:22
X-Proofpoint-ORIG-GUID: T5dbgBKbf43F2mqXp1iGBWC94XYVypU_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA2MSBTYWx0ZWRfX1J2rSZ0IaSwL
 4IVN1ll3G/PhWXNoJJPODjh02NvoRTCegfTGw16Qk9YRAo3JiKTZlYM8uZazKsbgn5xFiLJwVy5
 oPT42ggTUXWq91+nWNSAC5H4dsm4kg8ETkBcGtUYaQvt7QiJXaLL6x5j27aIl9LHwVwur1TCUvq
 tbuVg83nfzt+CymNmL3lrmRgtnBdZiTEjWCOCDVoSdIWjzTqUMDRvXKDmnC5k09ftstfVjVtHec
 FLKzYBI0P/jMaf5Bch0AC/jn1wpQ7TQ061tCANOv6DTJOI5Dbj2V/HYMqmQAeJkGbHk5IWTMUbX
 X+jcofyoxu4aqdBZYle0dYRt3qSmduNjPSHUQJaXAW7HzYRLpNEAUNTq9UnlEyp8Nb3YF3BoKfc
 QErETyDRs9rgo/LqI/9lKywc3bJHI7ppkUUgidr/Csk3/nBDEEGHBsSeO3kHvgDJJVCKUXlvx5A
 B/iYc1m5zOAnVV5Garw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA2MSBTYWx0ZWRfX4toIsrB0rJb+
 rFw0aGvSbEH3xVlgXN4Bzs2/rFbIZnq0T2kCc7kYoPqijJwduJAVHrIyQ84vx15WoNbBqjqEYxt
 fgd0XoR08eEVtjJCE0OKzz3Tk1DrEHHtVxwpqYkf8ljx7JQoIdWe
X-Proofpoint-GUID: T5dbgBKbf43F2mqXp1iGBWC94XYVypU_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170061
X-purgate-ID: tlsNG-4011c0/1784269109-51AC4CFC-C7E38F78/0/0
X-purgate-type: clean
X-purgate-size: 1078

On Thu, Jul 16, 2026 at 06:08:01PM +0200, Jan Beulich wrote:
> On 13.07.2026 20:16, dmukhin@ford.com wrote:
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -360,12 +360,22 @@ static DECLARE_SOFTIRQ_TASKLET(conring_tasklet, conring_notify, NULL);
> >  /* NB: Do not send conring VIRQs during panic. */
> >  static bool conring_no_notify;
> >  
> > -static void conring_puts(const char *str, size_t len)
> > +static void conring_puts(const char *str, unsigned int len)
> >  {
> > +    unsigned int src = likely(len < conring_size) ? 0 : len - conring_size;
> 
> Isn't the attempt to handle strings longer than conring_size pretty much in
> vain? Things look correct as far as the rest of the logic in the function
> goes, but is this useful? It certainly warrants at least a brief comment imo.

Thanks for taking a look!

I don't think there ever will callers of conring_puts() with strings longer
than conring_size... and I could not decide whether to keep the extra check
or not.

Will update the code with a commentary.

