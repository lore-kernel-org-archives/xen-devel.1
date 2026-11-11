Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8647A606A337
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 19:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=fVk+PHbw;
	dkim=pass (1024-bit key) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=jrl6OAFt;
	dkim=pass (2048-bit key) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=l6xod22c;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=WaGWBmAh
Received: from list by lists.xenproject.org with outflank-mailman.1484817.1688188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREJr-00056A-9U; Wed, 11 Nov 2026 19:49:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484817.1688188; Wed, 11 Nov 2026 19:49:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREJr-00055V-4p; Wed, 11 Nov 2026 19:49:19 +0000
Received: by outflank-mailman (input) for mailman id 1484817;
 Wed, 11 Nov 2026 19:49:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xREJq-0004od-3q
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 19:49:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xREJp-00BkX7-Fz
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 20:49:17 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c6bb-e002-0a2a0a5209dd-0a2a4508807e-4
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:49:17 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c6bc-f659-0a2a45080019-94a38ff1c7b2-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:49:17 +0100
Received: from pps.filterd (m0384717.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIYi3u2703317
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:49:15 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11013049.outbound.protection.outlook.com
 [40.93.196.49])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hvt952ts4-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:49:15 +0000 (GMT)
Received: from DS1P222CA0005.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:454::18) by
 SJ0PR16MB5126.namprd16.prod.outlook.com (2603:10b6:a03:4d6::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.8; Wed, 11 Nov 2026 19:49:01 +0000
Received: from DS2PEPF0000710B.namprd05.prod.outlook.com
 (2603:10b6:8:454:cafe::41) by DS1P222CA0005.outlook.office365.com
 (2603:10b6:8:454::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 19:49:00 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 DS2PEPF0000710B.mail.protection.outlook.com (10.167.23.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 19:49:00 +0000
Received: from pps.filterd (m0426315.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIXTWx080692
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:49:00 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4htprw4x1h-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:59 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id REJVx4CeOQU3xREJWxSgwM; Wed, 11 Nov 2026 19:48:59 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=5gM
	ubmPUkhM5bXxS8XxlTd4weQJq/AWwr4RJxqeuclY=; b=fVk+PHbwOzm9FRvPSNT
	kr/pHOrfODWEKyDwt3vNaM9CzAcJPTHVMnDrWuw4Xgt2N3UqXc0BGBzX80GpIg4k
	sgFBHjBOPu4/O9bWpoeDhCJFNbJqu5r5WTKIM3LvH7jR2mdiW2dULqCpZZj47cdc
	kx8bUvlgm4OgFBFdAB1tAMoffQfhYjZzgwxhqG+2nKSCy0xCtHADkzXuwuq921bd
	2Dl5gcp5Qyq4DN1gk3aCXQDtsf/Xbmhg4YdquxkCdKfD1uWaDFNgqRdXCIuBpdU0
	bVQRD0oDZyZ1LjRc37x/iinJOFjDFa4TcnGK7Q1xM4X3cN2GPyEP3Bro8OAUUQiS
	qWA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RHvJp0mCaREp48cntipGfcKMM0xkFwnw+txH/bJRs9Kfz9Ne/b/8lpyMpqeCN3QmPWbjQ6G5fgpgnZcWId50LQwrfVVggWUdfm3EbRULoJ1SR3U/wYSfKPTy2K7ofZOEbq/Dzhcqzda1IFqaXXortNXIKISi7dsBxhcmUAO/eA1Fu23lNDnJP6heBKvJgsa3ekV30FTbJUJ8rzOOxL8JlbBn1VsyXfkBnAu0rLozTL+SBrF6qeFw+E26PXiNmvqT5/xICNzB/k4OXPIoIdfjJII5VLj1S/6MQXWd95T0dn/25m8I99rplKdllStmwlbVlpJ/t1DDGsR16V3XVy6U+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gMubmPUkhM5bXxS8XxlTd4weQJq/AWwr4RJxqeuclY=;
 b=bzoKoQftlFpk+QivH+nMpg3ZDNjKkc1ItrPd7HHm7Uq98Gj7Xg4BD+eov9/qL5JRYa+xyNx4EJcmEs0uk2mCY2lBQQEYYkm2/z+9EdU760T8WCcX715r9S1sYa2n2bT2HAsRzdZhjU7HBTKJ5OqTJRVP2R7vj1+OwshSHEC85JcFniJplx317sFSJba12jXFFi01oGPh4QGZn7GUO7/vTwOjtLEWteB8WPT5D62q5ih4VZ7RBrnEEiQti3TXGXiLdxXSh23WAYGpKn7M8b+OxZEi8vIsrhjhKB0bPIqMjxdfISxkN26GiBM9vVqpMo2rFfcfKn7jePH6RiK5EicOTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5gMubmPUkhM5bXxS8XxlTd4weQJq/AWwr4RJxqeuclY=;
 b=jrl6OAFt2aEUxzafFyPPp40envcmp+TVKODc+vHcgjy+LGMwBJLQskJoA8YBvYiBbl4rjXMBUrA6u3y7SSj0/UHAt9HAORCZeM0YzPiFF7kItaB4Z0DU2YXbVhPkAfDscfpBYmReJ4xXPBi+DZOFS084aADAK9lHVbP1oW6UeHs=
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
	ppserprodsaar; bh=5gMubmPUkhM5bXxS8XxlTd4weQJq/AWwr4RJxqeuclY=; b=
	l6xod22cqUkZmxBdMZEgNeuATffP5SiEmbSAK+5dlbOdBbbxfkfNP2k1D8RDN5bl
	Kzzcsi0vrJYJ1+I3XrdqLC3wxMsg7HJDA22RLvvx3m+vp98CI8Np+12dH4pwmATO
	3xa2PNhPLQsDFmnsmF68BYhhYDqARLr8x+Zy4xgk6DL/Jsbj/IifKJGS1oTv9mU1
	Huf3Dn8TJwW5ZVfHXTMJFAIpLmN6k1O9W+LXvH3ZNcaPRLOp1+B7AKqJbnRcBrEd
	0LmgkgngB+Dr71+49as8+eBygNvRj0/By/3ZOeT3XFM5AShKZc6H28vBK/4DmDw2
	EpYkRJkWn49SbDf8ZYTOCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=5gMubmP
	UkhM5bXxS8XxlTd4weQJq/AWwr4RJxqeuclY=; b=WaGWBmAhrDGs7qaZfierdFC
	ZJ8GTSFHqqwuENiLLnSilkBX9s5FXyUd6lkgVLeCtZh4WQ28wRbg8DlwLnSBQv34
	9BozqomP62zItcAfEiRgX//CPMx4CnKpRAMvqYojVZ8yLahLBGdjA0P0cBQz95hb
	pKw4q1gcaS6xKMeMtSm64SGedzO7zpgYFmWARxDgcgldK9W6o9mgQ5iSO+ovEkZ2
	hOEmacYCXokT1uEIGoV2zjj3VwaPcRqf8OsGSZxjcc9hAeos+wa63232k234V3VP
	kJmCApBujLYKZE57BXgHqSYGFU6JTaExiMV31LJEiuzFGxqzYCSu5BFnzILhXKg=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: REJVx4CeOQU3xREJWxSgwM
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v8 19/26] xen/domain: allocate d->irq_caps before arch-specific initialization
Date: Wed, 11 Nov 2026 11:47:53 -0800
Message-ID: <20261111194800.1070016-20-dmukhin@ford.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000710B:EE_|SJ0PR16MB5126:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f8f6508b-084b-44da-620f-08df402cd52a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|11063799006|56012099006|18002099003|22082099003|10067099003|261009223027099003|261102123227099003|261021123027099003|261022075727099003|261022105027099003|261026121527099003|261026140227099003|261028144727099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	7gL5sP8dLJcwoYEvicKeMbWJhCI+8HFYcvZLL6qDUcEzJQ+RqBtBo07UMCQPNF/cacz8vKLXHmiKVw5hN5IWULDjgiZhw1VFbvmVZwt+mD7trHyGydHmlL/KYoICQBsnOjVlJfIA9Veay5xW772pcQ0NxTcHWgT4GsrtOXJ4eWsdIy97VDD7ryCxSwIpdYT9HqSMQDzwaeTXV1wNxJXIA4ZZpCkb27b+CUz3zrNBbv86WEVOd+jE5sIjCh/nLCHxiKCTcBr8ExYpZHiZLVXa8gRSjOJUYUXApJU2BvhfxiFlgvoTwMU07fmkJkD+Bqt8zoQ2wBc4cnmaS040R0XHIH/SeFa75WzA/LAsJKclGKHq25IatYzlO1NLjW6nKH0U27WRrGJXNYb9M+dYWOQMpLANxyieUh0/5yFFccP4+G0VTdC3wrc58w1jUcWpaPFkZxyspEmdJp0QtbEY3u0ryDgiE1W6GQjglRTNNP69xz8WrLqsllIl88f5cn5tgKNrOwbc4n6plYoQrr5MJ4iGri1QDa5mHKj35aJgUPtil1pJIvoTwcIAGztg4S68tnVyX+56mofoERs7ER2AToUiCzVmLFSQ0IbPRGv856/je9Ig6cZUtbe2zuw7D8KSVelItZqlZvGvVkY06D1PFpeUXtDD7VPGmbnWTnJ4MFyEmIB58RRSxOXXv8Uepa39ZSv2KokRlvdsYVvXqbgXxf5jxQ==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003)(261009223027099003)(261102123227099003)(261021123027099003)(261022075727099003)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nnplcYDHRsB2kYUb/ndEG8pMtrbpiRY+AZgRpHMKrDtIez2D4Jori60IwSuh4VP8aaSPwErVl5dDFhbaxEXRAELlMWC6DIlgbsgcz2Pd9F4dB3Qa1mST+TS95SI5ipyWcUbRctwqti8HtsIl/NLDPV6ok6SOmg0wtFCsiHllGwPcfPe3H+/Qn0vv9nugZK5jel6ERVM6lsAzzyfoVtEYF4EO32rFvUEsoY/lQ7CmsYJraWbq2bQR35xsJ/GTE7BjHCcUUqf3Kqw+yZSbj/TdT4AboFFkTwstBPc49+4bv05j4nWc1YZROL64PLZelZeQHoDesV+1DCbrTsrpHTwYUUTvDU/As+GrfEH44F1Uuu9tTU9J/CuCYWsJl+WZHyUH9Ckj8AtgoZ2cImFuNStk2YjA0WjumpKZGO8o6+eL0rCKNVPu3MRo9oeS5OT2RWM0
X-Exchange-RoutingPolicyChecked:
	GDF+o1H36bRbAVYGaLo61bj+ISPK3vXE7U49ZieEgTInkqK2xgBNTVJmSK/l29jJl0rGG5Z5NxfSiJsy1tuYLAdPHIsDSC25m984WYFZn53CVE7egGULDJfsnCqLtnf3sGj+N6uTz97dQ49VtHTQvcXI4tAlp5SNGdRZ9Zq66nc/KB8pv+/YocdVwPoO7Gc4EVdSIZk39CNLzUKk1/GSVYejsE+thYiNttwNXiiR9YjTO02kM8XWXqhp6+MSw6cmnIPNNidsR7WK2bPw+AD/T9uj6Eenrm9emCTXtsIBmqhoed/mX1eavdtybL2dhjJ5QeduC+FR+P6iXZn6Mv+mpQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	l/o7o2PRyQOi2tN3wEwToUmYDDzGOu8oW4JeZK3un1jxhXcyuLX0kiOLkGyKGwpP2flCI2uj5Sz77NVK5to44BSN4nQgaMXgzXSTeGjry96zj+QNYVTQEtsPiq+bqK2aMHK1mP6hVdaI5HHfByrBThsqnxbQevd1ZUNyZeaSQGYqDJtizHOzX84B8rOtBQCU/SoXX2irlnhxQeylEgtsoMBmzFX/wyoPG9EDd+cWf9Rj6YjUpqf5vJV+cm1IJL47RORAoXwEzhBv2ye95GWNcuHGKZrr/wrWsyyTPj5fvV/UjML2TMqOvmOTPkfLTlT8rkyVSL7tH+3tRfz8uZTPkNnbPfafEAqrf9J7Q6/ekCshLj1f9QPDgMUBsaPreUG0UtdZM6bp5n+7YjETeE8YAMpaXJh+hp4YXUG84BFyPQyaY2W9iJh7StMWSfeVE30NvIcLcsRDCUgTm7PoX3QGQX9KzSkEHDDq8b2xnxBesYRhS5tnXxBjvCbaR6A/rbTPAWmN2j3ugNm9Y2y5TBLI8K3hpYJ9ooc8XN8lBTzuWJc7WCaU/c1L9LBOf/lx8MRBt+LsIASL4kHTL8jCxqhjrCpBKjjLMUKKmMN+DGaoyI0PaYIZX5Q2oDPOi+V1jxGCIhGrMN/N4sWJigoTvkFVGA==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:49:00.7152
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8f6508b-084b-44da-620f-08df402cd52a
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000710B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR16MB5126
X-Proofpoint-ORIG-GUID: _5hJ6o0c812T6be1k95ly84f9MJUJdXJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX6AtLoaljc9SS
 tTnDX9HTQW5aZQedi5PRucldX7Y55KRrDLvDXUnDlv1ZMe8tTdvUvBbEfwR9xM9371BoQJ0SuCw
 ldb/fmlwG4rHsTq8BdxEhPrpTm249+zv4CEcRiQWeL4sSjEakSmy
X-Proofpoint-GUID: _5hJ6o0c812T6be1k95ly84f9MJUJdXJ
X-Authority-Analysis: v=2.4 cv=cdVHPXDM c=1 sm=1 tr=0 ts=6af4c6bb cx=c_pps
 a=pBF/iFUSQWMAsEqgfgMJMQ==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=AHe91QgOk3R4nFVtG5At:22 a=cbNQJ9GKAAAA:8
 a=uYQtedFKeOq09_OKtzgA:9 a=G69WFyCBNqGPyalROSdv:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX+3eVb9EyebL2
 3hLDUkO2b+/1VxtTNVsDtNrrdof+uay2OIzmy76thU4K18id5INgFuzU5jyPAAAnXkwsitQ62gs
 +gXXXI+0qRufpa6S5LDwK/PFhhpkqoO7f/FjAVnZn5IPyWA3RZ8/ne2ehB4KkAJgrT/FkfbnOKw
 sRGXtb2ln7oSURBg4aCe6QJc05l0erBG7dvywfGapS2XLBi16MvJFU0E1msGD8wAGvmlqpZu65q
 rFMFO8BFlmH7zT27FY3ijPGIrURRKO+GN2TtbA79sp5gD/KTlsVLb/dAI9dlPXsBTbJ+0HJoyFF
 7oPAH9Zpxv6S0bhMGNOk6utMdKMd4VF6HBjikqcm/YMENAXO2O2mSWQ2HfFnJXMzh9LB4MXRrR6
 Wjd3p8Dgkx2u4YwFKhpXcaOIVgFf3VE6Gk3XQuKGWSBiU1Om/UcPomMmdx7upr/gRvJ8XldtRpK
 cSJs5gMP5c7jmi4KAWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110078
X-purgate-ID: tlsNG-c1860d/1794426557-D6D4087B-0CE665C3/0/0
X-purgate-type: clean
X-purgate-size: 4025
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

To do that, move per-domain interrupt rangeset allocation before
arch-specific code. Add irqs_setup_access() to setup the initial
rangeset.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/dom0_build.c      | 1 -
 xen/arch/x86/hvm/dom0_build.c  | 7 +++++++
 xen/arch/x86/include/asm/irq.h | 2 ++
 xen/arch/x86/irq.c             | 8 ++++++++
 xen/arch/x86/pv/dom0_build.c   | 3 +++
 xen/common/domain.c            | 8 ++++++--
 6 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index e8f783d533af..035d2db72788 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -454,7 +454,6 @@ int __init dom0_setup_permissions(struct domain *d)
 
     rc |= iomem_permit_access(d, 0UL,
                               PFN_DOWN(1UL << domain_max_paddr_bits(d)) - 1);
-    rc |= irqs_permit_access(d, 1, nr_irqs_gsi - 1);
 
     /* Local APIC. */
     if ( mp_lapic_addr != 0 )
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index f536f5dcc444..5708caf752cb 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -1352,6 +1352,13 @@ int __init dom0_construct_pvh(const struct boot_domain *bd)
          */
         pvh_setup_mmcfg(d);
 
+        rc = irqs_setup_access(d);
+        if ( rc )
+        {
+            printk("%pd unable to setup IRQ rangeset: %d\n", d, rc);
+            return rc;
+        }
+
         /*
          * Setup permissions early so that calls to add MMIO regions to the
          * p2m as part of vPCI setup don't fail due to permission checks.
diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.h
index 7315150b66b4..d26cb5c1daba 100644
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -232,4 +232,6 @@ int allocate_and_map_gsi_pirq(struct domain *d, int index, int *pirq_p);
 int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
                               int type, struct msi_info *msi);
 
+int irqs_setup_access(struct domain *d);
+
 #endif /* _ASM_HW_IRQ_H */
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 32a75f77a46d..3fcff671c27f 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -3082,3 +3082,11 @@ int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
 
     return ret;
 }
+
+int irqs_setup_access(struct domain *d)
+{
+    if ( is_hardware_domain(d) )
+        return irqs_permit_access(d, 1, nr_irqs_gsi - 1);
+
+    return 0;
+}
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 385802c65abc..50c311f0a490 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -1029,6 +1029,9 @@ static int __init dom0_construct(const struct boot_domain *bd)
     rc = ioports_setup_access(d);
     BUG_ON(rc != 0);
 
+    rc = irqs_setup_access(d);
+    BUG_ON(rc != 0);
+
     rc = dom0_setup_permissions(d);
     BUG_ON(rc != 0);
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index f3a2634d5f98..18c5674f6439 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1031,6 +1031,11 @@ struct domain *domain_create(domid_t domid,
     radix_tree_init(&d->pirq_tree);
 #endif
 
+    err = -ENOMEM;
+    d->irq_caps = rangeset_new(d, "Interrupts", 0);
+    if ( !d->irq_caps )
+        goto fail;
+
     if ( (err = arch_domain_create(d, config, flags)) != 0 )
         goto fail;
     init_status |= INIT_arch;
@@ -1040,8 +1045,7 @@ struct domain *domain_create(domid_t domid,
 
     err = -ENOMEM;
     d->iomem_caps = rangeset_new(d, "I/O Memory", RANGESETF_prettyprint_hex);
-    d->irq_caps   = rangeset_new(d, "Interrupts", 0);
-    if ( !d->iomem_caps || !d->irq_caps )
+    if ( !d->iomem_caps )
         goto fail;
 
     if ( (err = xsm_domain_create(XSM_HOOK, d, config->ssidref)) != 0 )
-- 
2.56.0


