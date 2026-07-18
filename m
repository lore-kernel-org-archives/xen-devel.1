Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920C9C44515
	for <xen-devel@archiver.kernel.org>; Sat, 18 Jul 2026 02:55:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1365345.1615894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkvD3-000104-Ul; Sat, 18 Jul 2026 02:55:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1365345.1615894; Sat, 18 Jul 2026 02:55:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkvD3-0000zx-RO; Sat, 18 Jul 2026 02:55:25 +0000
Received: by outflank-mailman (input) for mailman id 1365345;
 Sat, 18 Jul 2026 02:55:24 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wkvD2-0000zp-8c
 for xen-devel@lists.xenproject.org; Sat, 18 Jul 2026 02:55:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkvD1-00B3GI-LW
 for xen-devel@lists.xenproject.org; Sat, 18 Jul 2026 04:55:23 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a5aeae2-e002-0a2a0a5209dd-0a2a45088f8a-12
 for <xen-devel@lists.xenproject.org>; Sat, 18 Jul 2026 04:55:23 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a5aeb19-f659-0a2a45080019-94a392174da6-3
 for <xen-devel@lists.xenproject.org>; Sat, 18 Jul 2026 04:55:23 +0200
Received: from pps.filterd (m0482517.ppops.net [127.0.0.1])
 by m0482517.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66I2rv3G3597608
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 19:55:21 -0700
Received: from bl0pr03cu003.outbound.protection.outlook.com
 (mail-eastusazon11012008.outbound.protection.outlook.com [52.101.53.8])
 by m0482517.ppops.net (PPS) with ESMTPS id 4fft0yb3nh-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 19:55:21 -0700 (PDT)
Received: from PH5P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::16)
 by SA1PR16MB5744.namprd16.prod.outlook.com (2603:10b6:806:3d9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Sat, 18 Jul
 2026 02:55:18 +0000
Received: from CY4PEPF0000EE38.namprd03.prod.outlook.com
 (2603:10b6:510:34a:cafe::33) by PH5P220CA0004.outlook.office365.com
 (2603:10b6:510:34a::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.14 via Frontend Transport; Sat,
 18 Jul 2026 02:55:17 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 CY4PEPF0000EE38.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Sat, 18 Jul 2026 02:55:17 +0000
Received: from pps.filterd (m0373460.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66HNIJ5U3443497
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 22:55:16 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4fc6py04rk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 22:55:16 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id kvCrwfHLT4QlWkvCswT3H3; Sat, 18 Jul 2026 02:55:15 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=M6E
	FZXNDmLdlof77oLNKidYOiydwJvlB1hpV5kHz2vg=; b=vWSPfmLrdmlC0a9TGpt
	NuNn0niphrX1B/Oj/Q5hVzjrhzDX0KbiKl8DNls1Q1DYdjLDhG2fLzGmp3O9dvGA
	lYSxfF8h92m/nIZSxe02/GvIay+GJjay/UjSmsZo4njhywXkFH04dRlZgbEiDt7R
	aQlhOF9d/zni1oy+hnaUZiDXAcmYxSmeKZoUh2EXBjmM+UxY3aCMKmAbLpK/FGp6
	EH4kX0vbcigmXQ4lieDxZa4g4PsV9IHAYL97tZupzlewhK8N/zx0wqUS4SdC6NSF
	BWpeSEUV3OUsop+KyPSXEbC/LTtKtLYWjBYTEY76utVhVp5K8ap2wY0VlidGDBd5
	8DQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qdLS81o3mUKvw++7fcFRZ41M/MzAHcWo8WjgZIxWJLbxKle595VaM66R6nb2VWNKN0kvcLdtazUA0sJr4yQtKNsetx7HuRjsuFBc4JRkNmJEvfB7WnV+JJ2uIfWtl0hbV2hL5uTL7Y1YPxiJqUr0yeJzdncnQxesb/TQ6tiB4JYcB6ptgoOvOf2P47ytsK1pV6gMyXyTHSgn81kFjeLNyJLCQbj4afJBL0twptKoNbuTq/cO4tVjF5FBzoYVaM95hCqvCBMMye5rntELHHa3ArcyG5P8v3DgUGOeOmNRfSZQLObM0j7GOmy/l8xT1ktEV/ic7za8qbKTHTNtYgzRZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=24Xsuhi7oZ6eiVhoWkhf6/X8FCPySQ4HnBJ/b6jNeV0=;
 b=TO0drwQFTcPFNFpnSmpB//r7ZZoSCU2XZcO0V2YaXrkG+ayVknlbM3Bf+3mIeD+1WaH93bb37lN8Cj6YFzGM8QxaP6qgpoGhrc4rg4KfimBc0TkZvApTtaE4btz00Kyr/kx5zKo09rPWl7uHQjn8ZdqLqnCltpPwUKUfsBLnVzXJQeKIn1Cg68TXuSb8mf953jm8PcPmp3/F16HV8UzU4xBye4UDfo8TMgFvh/ipdNbDpbYBmwoEUsWoKhl8gN+xKHeIUyy2f6bw2V3dOS6SMN1eG4OcvH4t4lt0XGjMJjKOb+gGqPxcNUg4+lbgnANn7qqqMwCaxXkNOpYc9PmA/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=24Xsuhi7oZ6eiVhoWkhf6/X8FCPySQ4HnBJ/b6jNeV0=;
 b=LivgX51jkTvH2ClQwFYf+8AobbVT0JGkp7E+MTi39kib7NE/go7ztNU7YFYqYVPPz/DT/J/XG86dEkqFaiNyX8C7iPHwGp+KlbGVYoLvbgNE4/lWIKeGLm79VEn+0imyjKZtnEO7S0XXJvk5s1hLT4gefwmYF8LnppBJtJOkHV8=
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
	:subject:to; s=ppserprodsaar; bh=M6EFZXNDmLdlof77oLNKidYOiydwJvl
	B1hpV5kHz2vg=; b=Lk5Bm78YGClhQ8A6M1fjnul0Efk73EzaO06bABiaaHbnSp9
	hSGpycX4PVzwbjUJ/l62v/h4qHZPuNcg09a9ndk+Q95tUhHx5W6N6mkXdg74Kysb
	maMwk8kKFjvBZaunam9hG3xvQ2cXwMQFN0kB1oIoJku9j7AuEFgV28Bqhp2Du4kO
	4xaOw3VcLm23s5G08INxQKav2dj94WCCPaoRZdos9VJjfokVrv/fjQgmumO/QXB8
	yWB9a1IIwo0ct+iWd1epA89Z8Q4r/9ScnH7E8+CgfYUNJ7U2fDwAM2Flb50mM+C/
	w41LVs3re3GXMJ9MyU56v2hKb7iMZS8ZURKy2Bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppfserpocford;
	 bh=M6EFZXNDmLdlof77oLNKidYOiydwJvlB1hpV5kHz2vg=; b=sPTHKo9KOQZr
	isPJH4I4tDDK7Ac246dAjbDxyOhbtEEswQS9f3OW9z8gmMoiP3ULMe5STRV6SzOx
	wvREb6yI+qC+Kfo4rKP3G7fo0+nAynTNDMx5ehX4R0eJUqtxVSDW6bxs5wBBTRrR
	5ipludppM7huALriS6OP8Tb5RK+oYmdB6uGp1RBiZx9MsN4bed+DDyd3ltgmszEu
	DofJ+/5MnL5J0GHKQI+qmCvkbvEp0FRRvUOZWV1sdeMZHpJl0ajPgtalSaePyMxN
	lr3P7+w/MqN7JLzGcgfDAaL8yFqsrPyw4PVUwIvI19fjnWGXjYckyRAh5kNOvtOd
	j77adS9Udg==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: kvCrwfHLT4QlWkvCswT3H3
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Fri, 17 Jul 2026 19:55:13 -0700
To: Teddy Astie <teddy.astie@vates.tech>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org,
        andrew.cooper3@citrix.com, anthony.perard@vates.tech,
        jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com,
        roger.pau@citrix.com, sstabellini@kernel.org
Subject: Re: [PATCH v3 2/4] xen/console: correct leaky-bucket rate limiter
Message-ID: <alrrESRtt7pkLowv@kraken>
References: <20260715201902.2984407-1-dmukhin@ford.com>
 <20260715201902.2984407-3-dmukhin@ford.com>
 <1784195449.8631fc262581453bbf619ec5b2062170.19f6a5603fd000edb5@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1784195449.8631fc262581453bbf619ec5b2062170.19f6a5603fd000edb5@vates.tech>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180026
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE38:EE_|SA1PR16MB5744:EE_
X-MS-Office365-Filtering-Correlation-Id: 49071d4a-84b5-47a6-cfc7-08dee477ff81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|4143699003|56012099006|11063799006|10067099003|6133799003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	f/+az3THIR0bAazn5cJ+V0VGGaJ3FXqlVXihW59+lLf93iKHQYZNr2IWe6Te2xQON5Oxxa1id/h2jQPEzK755VKfFIRZIteIaEIr4nyRgy3J5eNt+qGR30oSlQNSIqeCLykh+4wDLJUhsoRqkAL1EcSUftAIgL3oOG7ydnWWzu8W6mdQM+NqpAdNILgRx2YKMvnWyCpObbNZopKeZkStMWYHE4uXRFMAt092yqu1aeFnMFljughhjD0qHiAwH277aoGlnYT5IA2kIuEueRpRdqQPHu94FzluJ4Gj+m/mgq13mo0feyGEc4K5Y4JjjSZkspL1vuCCCiE7WRKBO5qkCIdESdfmuEDqAkfx3YsbeG5WJkLgnKbOmbzfwkzVikvqOIl/2Ha5uJaUZeZgOoaCD2ZkyC4lZy0ENfCrqfGfZGNpO//6kukJ8PmdOWmCawlPhSb6GTecQQFFbJ0wLUJ9fkirqHenkvr8vjoZM+Hn2RFK0c7e+uvarCiF2sz3W3vNLfwyW9ORRPh/T7m3HZmzKb/GJpQ2xaAUv5/WhrpxCGPXldNDpJ38KFx8TxdmTsXDgbRUgNa2NYojfcv5a08Z0+3M+rbvzJX+Komq4RZ9yNdaxZaa2eCU38sbvrscpYzzAe6FZEx3yfNeMcD77SbyAG8EG8Y/kuiRg11e4jvgbVsIwOtP3PN81L+Nh2CWj1cTW3jrUUw8b1QNZ/JfKY6Qaw==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(4143699003)(56012099006)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7fJTWKNCHkkrLxUwQ/ceXk5C0y2vXqJArwdJ8lcUv+0zssW5lVfTr/omT3JGTNtDQqVy1lSCK55bUgW2E7Olhgp8w58O9gVnoyZsFOsHj+io2UHwRxSlusFhZePlS7G6mAZhP1cKhtlFMPl6Ium75OUAF/VGZuoi54mHzmyf9LpiCkwSoSIuWuJiHS72kFdcv5TPjMxFgrNrJ8CnPH+9q/3YTRqbITfOo1V1zeQ74LmmuTbVegEDOS/xZIpi2ZDkbI6WEtDMo1DWg+4218Dg5MeYFnNImPmC0i9lbNIXOEaKgQKUTCY8JZNCnMq7f+YcpYbwmUql2BdXgQMle6/mfg3IT8QKhYL2Tgii05Qs1sHFuO25nkhRkCRQ/U/0mJ5hT023RLW1J26N9xAiXUx1PR69TDo+Ki3MD8mObIWNaTbAuN9njLhiWhbiEObUAkmK
X-Exchange-RoutingPolicyChecked:
	mWbO0xmi/GV39jB5qJePo5jZvZCNFlJEmza+CFaNjw3YWrHHW5t6ZLvIrV1xB8X1QWhKA7RpKBZFzyMbX0bSVH1Y+DQk+HwLU10jP8Y+oe6CzLkb/LEob3my7W6NWERQuAHn5rkyB8WzCrogM8Shex39UcdW+0GLc+n/1+CBUwK/MtR13nqOYy/GR3U8z6F+OtoBRdSc8IYGxIwG1nbkgp9uJjoPJqNas5mNR5I9L6Lusq/WXi9pOILaKu+Jh+3b7zc6fMTv+ejj3m+QnEFfocongUIAJBObWuntH0SvFkQDVgmCUaOteDQgaYz/uROtYbu8y4/XsfhA3WwwvCLrRw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	f+wNKZwAelo23MV1j9uP2MaKSxNrSvINAL5rOi7mlK/v7RlUph+1C6+dfCxZ6FYuWBdHc31mA2vbNOUIX1HnYHTNhL0MjlUILheh7tesZnAkILEF5cdcAGuHAOua+jou/A/PkOYSxyYLlk6vrLFeFAzBj9euHkfQvFpXbAWP7XQ4cRtJPeWwVF6Mu/4ANNucrK+THMYyGvGZ4hULDEbLp9Q96688Zk+C5uNueukJmWIgzHIR6DgHUAB6SN3owwwZXpE6d6sDlYBJ6V0MMzkHSNi3OCp9Gx1R3dJ5laEazYl8sJ4AgOiyw0dYTpgM3TOZWAO0k7sshIon6lgX4ZEjAhOHuODAz8TOPBc0rKau6z6JXoqezCRbFvcU9tLjvC7dJrkA7kdbykinLA3spLg/DFgG7O1C9IERvVzg4rmfrudyXlX0wyPMfeWMBfd4Vs7Ha7tLwltKkypOFm57LooRsKfVqjVknLxoXHnAEGSl9cvuAZFWdPnrgXtyr4h2Bv5glulZOLYCm5vqb3A2NwPrjvbmzGkJCwMci7nsYuH2Tvv85UtL9eEy4O7HlUoWuaijOLzsVfpJu5JQMYjn0nxPIl/Hgarl23iH7ipsL894YxHv79GRf4zRTFx1Ugj55NqKfDwtyMcztXofcSFfMrZeOw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2026 02:55:17.0669
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49071d4a-84b5-47a6-cfc7-08dee477ff81
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE38.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR16MB5744
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDAyNyBTYWx0ZWRfX0g+m3ttWvbid
 Iz5AkS5j61fEfTQJUr2Q8YA3FADcLoXY1yBt0qxzMpoPk4I3dex8iys9vD+eC1IxY6wsM1Qfa87
 X7353kF4CqQgF8roHE39UwWGedpn/pbEC19J5OPNB4CwZOEYCszO
X-Proofpoint-ORIG-GUID: wrwsOyFSXirzaIYaCuvdpBdZyjwyairf
X-Authority-Analysis: v=2.4 cv=WPBPmHsR c=1 sm=1 tr=0 ts=6a5aeb19 cx=c_pps
 a=JgOmb2+ItGzuqF5frRSN9Q==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=MLwXIh1eZMowsRZfVxRb:22
 a=PeOOapuUAAAA:8 a=cbNQJ9GKAAAA:8 a=d65vQ875o1Adj3X0mQ8A:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=3whSkbs7g9Me0DR5EJEX:22 a=0BaqRfgCL6CLbWgV2pdm:22
X-Proofpoint-GUID: wrwsOyFSXirzaIYaCuvdpBdZyjwyairf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDAyNyBTYWx0ZWRfXw27EXxlq4xJd
 CX5Za9IJ87NYLJjFwGzAbS0p02sVYBrSqYR2ooHrDjguD787CbX7YVr/7bACg3x2GxKj5DOyw21
 3FQEvy0dYH3axzZ6afJAQfoiVoa8Jgcnq57upeLYTus14I4OHAVIuBiTysGnW3Zw7DZu6EkLhWL
 K0j/Kmcbp+H/yYunLYKgy/uvKxqpRC556Ae5oQrHrvwNPA5eeq2ZTqLIuSFlt3GRVGiHSj+/+w1
 WVHNIpH9kIIvIIhNgwtRGl8F3OcN5RLEhg3lCfYXjiaQYw+6ZDQAOSOXjqeTj3WN55F/hWEhg27
 8QM7CTCP3ciWb8OeEkMpUdqqsLd1IAYFnnAxLue4w7sFBPpGPTtICwx2PTvnJ9si3kGwhXDsmCP
 JVm2cHNgbmQWigH3LlEjgZzgXJ6DGBSvDiuxhiVCVCFHAgnEFxLmxsrFewxn2FL9ZDtn3RJBS88
 UuWJASO/J/q8/U1jBmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 adultscore=0 clxscore=1015
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180027
X-purgate-ID: tlsNG-c1860d/1784343323-D5D4887B-D77316BE/0/0
X-purgate-type: clean
X-purgate-size: 3097

On Thu, Jul 16, 2026 at 11:50:48AM +0200, Teddy Astie wrote:
> Le 15/07/2026 à 22:24, dmukhin@ford.com a écrit :
> > From: Denis Mukhin <dmukhin@ford.com>
> > 
> > Use existing printk_ratelimit_ms and printk_ratelimit_burst variables in
> > do_printk_ratelimit() instead of hardcoded values 5000 and 10 respectively.
> > 
> > Ensure rate limiter is disabled if either printk_ratelimit_ms or
> > printk_ratelimit_burst is 0. Make sure no unnecessary initialization is done
> > in the corner case.
> > 
> > Also, simplify the limiter code by using min().
> > 
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > Changes since v2:
> > - fixed typing and 32-bit integer overflow problem
> > ---
> >   xen/drivers/char/console.c | 21 +++++++++++++--------
> >   1 file changed, 13 insertions(+), 8 deletions(-)
> > 
> > diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> > index 5d395f882e08..de9f2432445d 100644
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -1274,21 +1274,26 @@ bool __printk_ratelimit(unsigned int ratelimit_ms,
> >                           unsigned int ratelimit_burst)
> >   {
> >       static DEFINE_SPINLOCK(ratelimit_lock);
> > -    static unsigned long toks = 10 * 5 * 1000;
> > -    static unsigned long last_msg;
> > +    static unsigned long long toks, last_msg;
> >       static unsigned int missed;
> > +    unsigned long long now, limit;
> >       unsigned long flags;
> > -    unsigned long long now = NOW(); /* ns */
> > -    unsigned long ms;
> > +    s_time_t ms;
> > -    do_div(now, 1000000);
> > -    ms = (unsigned long)now;
> > +    if ( !ratelimit_burst || !ratelimit_burst )
> 
> Do you intend here ( !ratelimit_ms || !ratelimit_burst ) ?

Whoops, thanks for the catch!

> 
> > +        return true;
> > +
> > +    limit = min(ratelimit_burst * ratelimit_ms, UINT_MAX);
> 
> That looks no-op (at least at first stance), as UINT_MAX is the largest
> unsigned int value; hence `ratelimit_burst * ratelimit_ms` (both unsigned
> int) can't be larger than it; even if it overflows.
> 
> I think we need to cast both ratelimit_ms and ratelimit_burst to unsigned
> long long before doing the multiply, so that the multiply can't overflow
> (not sure exactly how to write it without being too verbose though).
> 
> https://godbolt.org/z/sxWaPM3cr
> 
> > +    if ( !toks )
> > +        toks = limit;
> > +
> > +    now = NOW(); /* ns */
> > +    ms = do_div(now, MILLISECS(1));
> >       spin_lock_irqsave(&ratelimit_lock, flags);
> >       toks += ms - last_msg;
> >       last_msg = ms;
> > -    if ( toks > (ratelimit_burst * ratelimit_ms))
> > -        toks = ratelimit_burst * ratelimit_ms;
> > +    toks = min(toks, limit);
> >       if ( toks >= ratelimit_ms )
> >       {
> >           unsigned int lost = missed;
> 
> With the if part fixed and the adjustments in the limit computation (cast to
> unsigned long long before the multiply) :
> Reviewed-by: Teddy Astie <teddy.astie@vates.tech>
> 
> Teddy






