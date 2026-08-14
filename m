Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4651C5DF66
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2026 01:02:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1390565.1630886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wugJY-0005GW-Nx; Fri, 14 Aug 2026 01:02:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1390565.1630886; Fri, 14 Aug 2026 01:02:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wugJY-0005GP-L7; Fri, 14 Aug 2026 01:02:28 +0000
Received: by outflank-mailman (input) for mailman id 1390565;
 Fri, 14 Aug 2026 01:02:26 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wugJV-0004qg-PU
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 01:02:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wugJV-00Ax13-6K
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 03:02:25 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a7e6901-2eae-0a2a0a5409dd-0a2a4502d3e6-12
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 03:02:25 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a7e691f-6ca4-0a2a45020019-94a38ff1d05e-3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 03:02:24 +0200
Received: from pps.filterd (m0482515.ppops.net [127.0.0.1])
 by m0482515.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67E0NPsM1611567
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 18:02:23 -0700
Received: from bn8pr05cu002.outbound.protection.outlook.com
 (mail-eastus2azon11011017.outbound.protection.outlook.com [52.101.57.17])
 by m0482515.ppops.net (PPS) with ESMTPS id 4g1nbh9sf9-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 18:02:23 -0700 (PDT)
Received: from SJ0PR13CA0160.namprd13.prod.outlook.com (2603:10b6:a03:2c7::15)
 by PH0PR16MB4117.namprd16.prod.outlook.com (2603:10b6:510:52::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 01:02:18 +0000
Received: from CO1PEPF00012E5F.namprd05.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::94) by SJ0PR13CA0160.outlook.office365.com
 (2603:10b6:a03:2c7::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3 via Frontend Transport; Fri, 14
 Aug 2026 01:02:16 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 CO1PEPF00012E5F.mail.protection.outlook.com (10.167.249.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Fri, 14 Aug 2026 01:02:15 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67DLVf4K1262541
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 21:02:14 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4fxkgce5q3-33
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 21:02:14 -0400 (EDT)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id ugJHwhMUDXy1iugJIwoMpX; Fri, 14 Aug 2026 01:02:14 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=B2C
	eXgWbeWAKBBRE8vrqNf21nSh2X7vYMlI+F7Op07I=; b=RInRJ0v0wQg5Bwsy+J2
	y3uKmH6I4yOHISreKqSDZfTsAd+XVsoO0oF2PApqgTpJ18++hIcS1qo+tpWdHXJb
	JlF+82AKdSOy0tlt2uA3acNAn/60JR96nz2qFx+STJ/SEVDM5+sZy7hQhu7RKEVJ
	/q4BVXLqP/nWW0+xCJu2P1jRDnTRXAY6Ws8EUml1ukHWufTA5hMzRc5VsTyt5tmz
	TESvolo/Ewond6+w/8ZjfA7tRr0c2PVp1GJBajQ9JrUsmJtwWTSp5eofN5Jd7LXB
	BKJqELiw/cXyfCXDI1MiLFK2iEwvjU6/FCRm6rymQrqU8nNXRnOXFzB752UJXXkl
	HPQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EjFM+bMEyrFxLUd3oSCaI6+dQZPuHW6+xagaOk7xHj95parbIESanvfM6gB3xsMvv5VQCvh2pb3STeRJSFZGPDg1UM8qjcUPO4mKcYSG8yGRROFQ+DiMcB2g267t4ya5sFI6QPqICn93+VLb3wFC5z/+vyItkdcRpTVbzgMQPrsljVFuW1BxZEksmmGcAxcZd4rXvMcHWSIoH90IMLxdzFBgOMR7qBPrWYCRxOKyG3XUKy9/VWSUaFiRenF+EEEhny99Mxf5t/Er7G8nvkNunlfZH4USs0w2ZmiHiOUgbYB8LH9jOp456e1ncx+cYkcRKEVET1Ymb3/0AQhS/hiftA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2CeXgWbeWAKBBRE8vrqNf21nSh2X7vYMlI+F7Op07I=;
 b=ZbNfVtC5vD7aR7A6N0Bj5TUEJwbm4uXsaUsf9cEVAZvEPXus6LJ8ju8Dm5kZ1UeVbms+5CAp+62bY8CIkb/I022dHr7ANjMWJm3RN8GQdWopIcO1wqJ4DQaR4dXL1kh1sz169W0z10cSJeKYOcY8fFXKkaGNFnl7aLD/gUodN2rjkulOGLL+J8JIE8dlJbuRWB85g4erlQaWdzfP1EPlL20EIwyY8uQ3BKIIB6dBtoE9m8AUncfoz378lJZGeoVa5DArCIhul+YqC8+aTjcgP4hvIXclrPQur2CLZpYHHlj7rao9kiiybXHeFyIB7SrRsZkxBhwQ0wugLQNtad5bRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B2CeXgWbeWAKBBRE8vrqNf21nSh2X7vYMlI+F7Op07I=;
 b=b4eAczSnWznOGzfzJSe6TII5tQ7YWnKAhbEEXjfEOAaVzacLdr02QNFO2PHf+I++QYETtxc7+5fqmI/qgcUCod526Z6jZGt4/ILDslzWXgUV7aNcCDrvwmmnwy8AfXVtkKag6oaIIQX/nD36kx72XtXGnCR0DdKbvw+Nm29VKdo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	ppserprodsaar; bh=B2CeXgWbeWAKBBRE8vrqNf21nSh2X7vYMlI+F7Op07I=; b=
	k8pICEF93n+zhhbWANQa7c692MkubiQ5+oGDLZJ2BCG04JL+t6kVClKufBXoF80p
	PQzbxHpNy40e9dTU4MSswbX3s+N7Guxhaiee3K3IdWhK7lBjdynZkbGbdCLp5DJM
	sZV9lDAZ90iPxyk98PVPq+4qabCBix3IO+9oBOujAONjJTkVqtsaFGGQf9/ALUz1
	iZ1qQRJuRE9+P9lyonenNRQCz4gR21d1AZMZapQTni/QVu+tbAUTCd9wrb2BGGZx
	PUQndMWCsVvoHrRER6R4JGTFcBfWCEXMqNIfsyKbpmgAA3EeeMCXgvXwmWEt73Z0
	nT6BvCX1XKjWR3gnR1t7MQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=B2CeXgW
	beWAKBBRE8vrqNf21nSh2X7vYMlI+F7Op07I=; b=Ew5TLz2qh3ycspVIw8DpKzR
	KDpl9CG28PCyb22TbTlbWih0hiXbx5xSAFUMIC9g08miNiZb6kcIF4FReps/3BqC
	JNCyKp837XQPD6G0RcS7csh4RpB9dIRzTwOCl42uZaHLOyqMJsi5DyDl88TJ1QED
	fU/0UB6cBLArVNmfydoBvWz1N0h+FD9anZylv6kmeLpNFsH4fXLWB5VXa/gwbYDv
	8lEko05hP0Q9nO7GD4QDQ9iIv7CcvFd57f5AuvxRjSMwnusjRyY5BrHGd+6QwFUk
	M3kn3DAGVuzh10IMxBd61fJkCi5+kazJ04G3T54DQBJC28BrnI6zAcYz8ORhqsg=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: ugJHwhMUDXy1iugJIwoMpX
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v6 1/2] xen/common: add keyhandler to show Xen command line
Date: Thu, 13 Aug 2026 18:02:05 -0700
Message-ID: <20260814010206.1321724-2-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260814010206.1321724-1-dmukhin@ford.com>
References: <20260814010206.1321724-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140006
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E5F:EE_|PH0PR16MB4117:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f1abb889-f102-41c9-77c3-08def99faea9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|23010399003|36860700016|6133799003|18002099003|22082099003|11063799006|56012099006|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	CKLFUa2NOKf+7J7UMRce74kQVhdMFbLMKRPS9G7jZD6aHjd6bVUDiR9Y2DKJfMxV+8vrtfn0lo0yZ4WCHMu7Xha6hMPx83s/vqa5tJgHSitt1axp+zjv1I/8TretlzMf1LWiXnJldh4WwfjlY7qzIl/4ydQNHntnzjOCdNSnwv72GDDTINImv9WyyS8rR61WG19QYs57TWKzpi5XPVWxs7zaUyEA0/kN9mJkNrMkIa8T7Owi72bU/CkuGg5gHIBWKEID5Yo51THBNaxNzjkEIHA2OKHuTAlnwydi31wx3k12crMAtveGttccwwNqy3CTzBqV5vD+65HKQPG8a9U/kfY65/1itTxekm0/lQGSYcrvuBRr+tJDQgxEpeqrh3cnn0Q6imnzhtfjejrNZa9BsAKWMRkReFHNk5Dzl6uazzX0FkpPe2vTvoMoPN4GZJA2ZJGlejiT0VXl2IQIINVrwNjB3V8FcseRzxAncbq0DHCvyDpHa/C/p/egsWMVq6lJdUcNmZDY05ex1YwzthDsKoO+HCuyQc73zj4nJK4X5XOB8M0vd1Ml8OPUlYUDJDoWLqw0MVdVKQN4rhezq7/ea0rrtCu49xs/8kgjBj18e9PljtIp9Wa6th6D+8AI7dHs+YqK9bipjZ8T2m63T9KtNzxQ3k6zC2b7gUw86gwp07HM33415gf/GROtg8EXCimqAfKeXPkkl7KRBdSPfFyPHQ==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(23010399003)(36860700016)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PfsFnMPVNgR1AZBB3Z5MfH1dpxuG9j09nXgLqQpLFjQIoYtd3/jjbEvvRU9mNhDmcJjvgWCd2Z5Q4Q8UKbHJ0Ob35kyx0ehheDF87gSUxjE+iHMyD1nBPAMez+aJy9k9WW3WpSlebjZbCxyMDnbIFYFTBilWAT7rqtdr0Yk21yicdUAoCC6yTM9cKe6w+3/hyaPtrh//omNF8tJ5joEOHDqwcZluPYF5s9RSrYt7ffbeNN8ga751oTyyMSr6TxeimpCjQjauTrhaXDE5/ic6+CX5pD42TO2qPEajmM2X1yaG9Ie0ZfgzQVO1AlajeAbJvlZmnwr1u2OpNzPBONXhJvd3z5dXy0GEjPboEEKQJ/PappLM0773Th6ectTFJow5cKPirGLwIqtjzaKtlPlHJ4w4hzK+m96taZNwPq8lltZSLELHOJKUy1qqUa4Owplv
X-Exchange-RoutingPolicyChecked:
	mHLUYisf9ngTFQEKbBCl/p5HNPB4lEYEDY0xMtXOF6e4dyg5rRYwngBuPw4cuxq7MSs/agrQJ84fxw8BBDKb9unPYDKZbAMAqwXFZyxLby1EvF28lWgwG43w/D1pdV4gtHxvsXwP3K3DR16DAGOF6tavzY/mSSWwd1O4FbOsjFUwxsRDx3d18+sD6CYDfcdCvA42+qNwGk/Id9e5o+giQOZBbzy5F9tL6bwloOHHq67mlpHMOhSC5l9BYeIhyL+duMBqangSISSkHPUO7iV5YCxuZcK3EMZCyPUVm1yDWcT3eSskjTpEWKFgfZH/sQaFxb/Po5UfwBAFTEX2AiPtqw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rDXuicLg6vHADDLLwmbxI+NZi1JYeyu8By1uIxqRSZr6icY3nXpA6aj9IjsSZJR1n7VID3lT70wLdKiOBcjta9Jv6ALZwIiU9KVUUhEWli7Sp6na6faXBcuEn44QdPrSwBIzh2j4I/OWm2xqK35Lbq1YgsJlAnHoQFKaK/qkD3tBfynFBtWqgyhIiqCMHQrK12ylGpCDHNZKxzHhWKS85cyb/PxEQfz9cwy0Vnq9eXnOriC7EK1F8Et93cHKnd1KaTrEVOjQyvWgUTiCLfSXkrIkRPC3ma95Y0PIcGmUm+GSeHMzvzSZpbtx4upFz1tSxQsJuCiyvJIpSakp5R0Ja5CL3oedSoI3AMYM+8Hi2NdVVBdZV1x95hLMjK4HTtUcy+LTBRpHtQvpk83NRhkLm5EUWlVuQm2Z7tUhis0qo7/zTINMq791sIsI8JLw7AcSxXsZusgsPCi6drm8xXIaBzLVxwvpIBfBiQ6mm30omwYqnHlpfBvUTrqiPyTi9fuA1TdIAiaUeLFpLj+LZsbtKvKJ0uQrEWexc06ayKutzKjXTOT442xoxCLXS0ZeVUo8VdD/QL593LpO8i0sCPIQG4NHSmEgarP0ewWvddZLCD1Y+MF1IgLPrIL6mFRfSkUCnc3DWQOyCnUDI57oiCJz0w==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 01:02:15.6385
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1abb889-f102-41c9-77c3-08def99faea9
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E5F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR16MB4117
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDAwNiBTYWx0ZWRfX5cxP4x+t/eQQ
 /c6iA/ZdsTh5nL2Q4Tv8RyhLUW0DZ//Z6IRoyBn+pb4nsQbkyhBrrjnzIxFNbe9g4OkkgNUuNI0
 yl/b+hpWnXq6MVpg3UAeqd4j+W1xfo+hG/kWhfJ0Jc99Dr+rZifdKnf8O5pRDexd2nmptifFnT+
 VlowNQTFq9icsRwrwTkh2yG4qSCKcdfzGcEVH4ml1P2P6dG79xvZpeme5mJ6AgrT4+j9+n8a4lF
 dgm+udOB4yA62HGzTxGVkUD+YKNmuyieWhckFQxrpTwQBBUMkdkzSdiLVnYmL0g4glxIzlQknGy
 +cCWFruykqMZUsfWbmSnTWc7ejS8BOKPW4fXdu2d2nrnCtMMrnsvniFPJARGwgSsW3If3WIy2EG
 Rz0VIg6v5nRYTJMIiIbDCNLUlOd+OjTEjtFmt1NjYpvS5wgclXzUl3/YUImzAMRPC2qHe3h15kA
 JAluSRAq6ZbYf5KpMQA==
X-Proofpoint-ORIG-GUID: NrCIyg0YD84yJRC5z6KAEplVibVQJcaD
X-Proofpoint-GUID: NrCIyg0YD84yJRC5z6KAEplVibVQJcaD
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDAwNiBTYWx0ZWRfX5lhif/sDbtiJ
 ECzONgiz5OiO+w8mwWq6c2ZkK6lPHQHtqx5HaN4XvM+K2v8rcrVCBQHu1erWO6hUt1EgNIGbzHH
 X8j4i2ngBfIphKtKzb8dEpWSfh3R9cXq6hIGLOb/d0feAWDJbvNv
X-Authority-Analysis: v=2.4 cv=KZHidwYD c=1 sm=1 tr=0 ts=6a7e691f cx=c_pps
 a=tlTDY7m+LisZJGavll/kMg==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=0GA0A_IKJoUHBEAzNTkD:22 a=cbNQJ9GKAAAA:8
 a=j_BhcJ1dFLyuv6WhtioA:9 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 clxscore=1015 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140006
X-purgate-ID: tlsNG-720697/1786669345-F0CA22AC-2EEE7370/0/0
X-purgate-type: clean
X-purgate-size: 4217

From: Denis Mukhin <dmukhin@ford.com> 

Currently there's no way to print Xen command line on the emergency
console for debugging purposes when 'xl' is unavailable.

Add new print_cmdline() function to print both built-in and run-time
command lines on the console.

To allow built-in command printout, drop __initconst in
'opt_builtin_cmdline' declaration.

Add new keyhander '?' to show command line printout.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v5:
- drop version printout from 'h'
- add new handler for system information

Changes since v4:
- promote opt_builtin_cmdline to __ro_after_init and use it for
  built-in command line reporting
- account for empty saved_cmdline
- adjust register_keyhandler() call - use '?'

Changes since v3:
- print built-in command line too
- change handler to print command line only

Changes since v2:
- account for CONFIG_CMDLINE_OVERRIDE case
---
 xen/common/kernel.c     | 20 +++++++++++++++++++-
 xen/common/keyhandler.c | 10 +++++++++-
 xen/include/xen/lib.h   |  1 +
 3 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index d1bef9ac2b2b..f4bbd8818fa8 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -35,7 +35,7 @@ boolean_param("dit", opt_dit);
 #endif
 
 static xen_commandline_t __ro_after_init saved_cmdline;
-static const char __initconst opt_builtin_cmdline[] = CONFIG_CMDLINE;
+static const char opt_builtin_cmdline[] = CONFIG_CMDLINE;
 char __ro_after_init xen_cap_info[128];
 
 static int assign_integer_param(const struct kernel_param *param, uint64_t val)
@@ -758,6 +758,24 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     return -ENOSYS;
 }
 
+void print_cmdline(void)
+{
+    const char *cmdline;
+
+    if ( opt_builtin_cmdline[0] )
+        printk("Built-in command line: %s\n", opt_builtin_cmdline);
+
+    if ( IS_ENABLED(CONFIG_CMDLINE_OVERRIDE) )
+        cmdline = "<ignored> (CONFIG_CMDLINE_OVERRIDE=y)";
+    else if ( saved_cmdline[0] )
+        cmdline = saved_cmdline;
+    else
+        cmdline = NULL;
+
+    if ( cmdline )
+        printk("Command line: %s\n", cmdline);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
index cb6df2823b00..92b0573d8b3a 100644
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -28,7 +28,7 @@ static unsigned char keypress_key;
 static bool alt_key_handling;
 
 static keyhandler_fn_t cf_check show_handlers, cf_check dump_hwdom_registers,
-    cf_check dump_domains, cf_check read_clocks;
+    cf_check dump_domains, cf_check read_clocks, cf_check show_system_info;
 static irq_keyhandler_fn_t cf_check do_toggle_alt_key, cf_check dump_registers,
     cf_check reboot_machine, cf_check run_all_keyhandlers;
 
@@ -58,6 +58,7 @@ static struct keyhandler {
         KEYHANDLER('t', read_clocks, "display multi-cpu clock info", 1),
         KEYHANDLER('0', dump_hwdom_registers, "dump Dom0 registers", 1),
     IRQ_KEYHANDLER('*', run_all_keyhandlers, "print all diagnostics", 0),
+        KEYHANDLER('?', show_system_info, "show system information", false),
 
 #ifdef CONFIG_PERF_COUNTERS
     KEYHANDLER('p', perfc_printall, "print performance counters", 1),
@@ -138,6 +139,13 @@ static void cf_check show_handlers(unsigned char key)
                    isprint(i) ? i : ' ', i, key_table[i].desc);
 }
 
+static void cf_check show_system_info(unsigned char key)
+{
+    printk("'%c' pressed -> showing system information\n", key);
+
+    print_cmdline();
+}
+
 static cpumask_t dump_execstate_mask;
 
 void cf_check dump_execstate(const struct cpu_user_regs *regs)
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index 3c545ff33c61..618e37b920e3 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -48,6 +48,7 @@ int parse_signed_integer(const char *name, const char *s, const char *e,
 int cmdline_strcmp(const char *frag, const char *name);
 
 void print_version(void);
+void print_cmdline(void);
 
 #ifdef CONFIG_DEBUG_TRACE
 extern void debugtrace_dump(void);
-- 
2.54.0


