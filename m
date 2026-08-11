Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FC5C5AC67
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2026 23:39:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388674.1629659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtw3Y-0003kP-Po; Tue, 11 Aug 2026 23:38:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388674.1629659; Tue, 11 Aug 2026 23:38:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtw3Y-0003kH-N6; Tue, 11 Aug 2026 23:38:52 +0000
Received: by outflank-mailman (input) for mailman id 1388674;
 Tue, 11 Aug 2026 23:38:51 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wtw3X-0003kB-2o
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 23:38:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtw3V-00Ac6q-U6
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 01:38:49 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a7bb209-2eae-0a2a0a5409dd-0a2a450c9bf4-32
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 01:38:49 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a7bb288-f479-0a2a450c0019-94a38ff1935c-3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 01:38:49 +0200
Received: from pps.filterd (m0384717.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67BNFklQ2299678
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 23:38:48 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11012005.outbound.protection.outlook.com
 [40.93.195.5])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4g09vfsyv7-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 23:38:48 +0000 (GMT)
Received: from SA9PR13CA0029.namprd13.prod.outlook.com (2603:10b6:806:21::34)
 by SJ0PR16MB4287.namprd16.prod.outlook.com (2603:10b6:a03:32a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 11 Aug
 2026 23:38:44 +0000
Received: from SA2PEPF0000150A.namprd04.prod.outlook.com
 (2603:10b6:806:21:cafe::3) by SA9PR13CA0029.outlook.office365.com
 (2603:10b6:806:21::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.11 via Frontend Transport; Tue,
 11 Aug 2026 23:38:43 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 SA2PEPF0000150A.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Tue, 11 Aug 2026 23:38:43 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67BNF98K145521
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 19:38:42 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4fxkgcbhbc-4
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 19:38:42 -0400 (EDT)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id tw3LwyVzXXy1itw3Mwq5Vk; Tue, 11 Aug 2026 23:38:41 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=aDv
	34aLxTw8bi99AIhF3WJYALFaiu1fRpZYpEJyJrC0=; b=fx6qaIf6H0TEMXOOZkZ
	dYY8ai07IMg9N140fha2w1E/UK40eCc67Q5BkRqk1KqHncLRbyiXlmbXBzM4nKcW
	F5bbSTvf/i76A8AQpnYDzoJH8dbDom6todHCQ+MFc6bgHSgurVsA2pujtskZ0Tfd
	XCtD5TkT7T5GiTmfyNbwcx6LgN9IReuYWbrsXKzHPZ2KrkE9iXObJWiQHr5hXPo0
	12lgPR0t9gNrQ/VYieGIJriiVPd71BjcMbR8fdDReHfeO1pCWHEI4SV4UTU11Onh
	uWIfMYoS0Ue16xPODPmefHFDkRffTc8H7MCVGHk6jmaLAFa6oBXNKy4m5z/En2rN
	Yaw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=slugA1Um1c9GqPRvWyu9mQmYagXeXp3SPz86IpDtCTT3NZh6EMTnXY4HiSzI5hrTFhgbDZByDmwEqtBUxHKLr2j04VQ6HIzf7Gf0gkPAd53baV3yzh28ag9bhZ0ey+VE230UBO5hcnrEStd67jff9Vv3nXwRiIy6LGmo8x4g5Mh3OgK7XMQHQSt4HYh7EntbHJWYjScVf/iVkWBh8AlsynAxIYj/YY39j0iNm2aL0TpHM7R/UGiHVFGCjPEY4DbD3hH9nqFR6snXfxaF9mnrBiEkn+Cc1feRLNdcB8rCUzsV/oKS21Cs+UmI4mSoE/ZOFKdJadAowE30BRWXokvgkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDv34aLxTw8bi99AIhF3WJYALFaiu1fRpZYpEJyJrC0=;
 b=T7SK/sMVQdXU/Fc4SDfnHAUcIzBS5RbhFbZWlfgpTHkyzMA3Ue81Vi6TpilTKmoKv3JVX7tGAMIZ0QROntMe2zau4a+3WKVWnvo8whj7rKBLYxWUU7P88rAwzx1MzqLlr5B/SjhtXBkrsXJY/Rnj05LHfuWxX6U5Ma/nRtLKOJyR6d0UvRZFLe60wZMJcu3uchxfc3JKKXEcZXaBLw1WiESJyvfv8iScgLYAHYr4nnba/iWxUaM6VxIkh+aFWYr8xstK1mgyWiP1EE5w99GpGyR9OigCqp8VvLwo2MDIAIKePBGs10SAQKqqOvF+HEof0Ydll8+lSRUBnzqAXgFC5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDv34aLxTw8bi99AIhF3WJYALFaiu1fRpZYpEJyJrC0=;
 b=IzFddZgpMswWa3vIfR9IVD5vuoMJjke07EG2qfdWRPH3J24AIAYPLJ22f9Rsf1Nybnl77ilOf95JgAjE3/P46+M9oOT20zDSsHsChXX2FYM+2HwAQDiS10ZTBtQ+fuz9k8JCjRw5fE8ExEJ4hp+5vKgsrEeKWuLHi2WunSMHnsw=
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
	ppserprodsaar; bh=aDv34aLxTw8bi99AIhF3WJYALFaiu1fRpZYpEJyJrC0=; b=
	jrATgFYJIWNLb6aSwhy78pxaOEzEmH7Jbsn9BYtAgriPC350J0zowiwzQCY3nT4A
	8C97aDnEUow7kWeGhcV/9s9d0R5MIc1hgntHN4DLdOMiaqRvDQw6asAVjh6UK04X
	S6uIrYDBg96cgVlZSDKD6jG3SWGCx9KuvJaCKjhPXaeLC+FOzFTJT+/DNSlyucqk
	fbppUaIrrrQ67eC0Y3NnQNxRFizjDhGXfvS/kTQSbn/QvNw3FfFFVUPMJSV+i0kB
	O5mkWdf0wL/QEwyglRwzAa4iqJ8b4AYsDJBp/6j6p3Ddhmhb4R5OcYl244YVZ8rb
	VYlrrN4ZaQa62SYJD/Lp2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=aDv34aL
	xTw8bi99AIhF3WJYALFaiu1fRpZYpEJyJrC0=; b=oQkosJnG0JjxKnuM3bErcpB
	O3xpKFV7x43c6K4jfTDJiTZdvBWHUPmBNCgr4gbYeq8u4KnTityzEjMjMEqIWQY8
	jRx3bZonyPL0EKF0dRz25aY+uCrF9SpKi8s28DeDkGM2JKKImOqyvirve+mMxx4u
	yUDy3sms3gaqhWypf2ckuM4YH4+XHFsGXW97iSuBMc9pvwl996jm+DszoRAW09Of
	y94qRJ1iHviZg2wLIwiJjuTa+Hh4eOXQSjhDk8c+Kz1b1b3GImH8XrCSatVKeGe0
	EkqFuCc+aedIuxBWEMn1FTGX3t0NrNoQzA/vOeNkpFIbo+6wl+yLzGNA8b9QUSA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: tw3LwyVzXXy1itw3Mwq5Vk
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v5 1/2] xen/console: re-calibrate rate-limiter based on user input
Date: Tue, 11 Aug 2026 16:38:23 -0700
Message-ID: <20260811233824.1874525-2-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260811233824.1874525-1-dmukhin@ford.com>
References: <20260811233824.1874525-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110197
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150A:EE_|SJ0PR16MB4287:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5eb0cc2b-4d9d-4eb8-6eee-08def801ae2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|82310400026|1800799024|56012099006|10067099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	K310w6ooyelA6HZwbTiKZekKy5Owy/bU2yjgSnPTOKG1dDmGbOzpnakeYqboogjqUTLPiUz+GoWh24UAG4oZEiVyWahjrTo0vnQOFR5kDu/rHTZYKDviBGqrTHmvki2T6wi/G4YHyyEeZ8t4TcSsRd5SsFO4+FJIqsidv9E9uYDqK74Li0IcV0L2+fazcI1x05/xx4JohvFNBAbaDAQgTYqYVXbiAImujcYXyYQzwC6wnL8EoBaUr1yK2mvJRGxAGR8fZ/AberKKItyZ/Tq7sGb8Md3bWlOdjT8l3q2sdE2sx/+1bn8Q/bTYMemN4AKhuiONv8nLfvV7S7sNRsz7Xr1UczSkA6hGdAuKilpQ+CuMn+PHPHrJRiNhB08GQaSILkSKzefNWH49Be+50M8m0p0+iCTT16A0wt/t0QkhK361P4aYyNmd6jwj0v1VwKexknA7CIAGLlCBvCcgFaWvB17X3aIl+4JteP+oHzlPrIlRQknnf1Yt6rQTeGJQ3/D9g++6U2boHLLN/VR+ry47UiJsuALW/mqqERAe40Bqh8kRkytishQ6zB02EPx827HfPC0Fb5L3xTbIyUKrcf7ofpahbOMajJEgWmmAoeRG2hEi9MFCAFqn60KEZUypOyskbs5SR5PxNq2uQZln0UuFCc/pnBPkQuoMUTBlvdRVTNyUbLw030Ylu6GyRNzyfajDkofjXq7AxGngL1jmWMWmNA==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(82310400026)(1800799024)(56012099006)(10067099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ao9bHbQnZezSwR03DF2mTrH4O0bG8sEthRJX20QC4gwMaluKJvvWsncsHxe1bmTFGv9J7qc3FTuSAYtfam3+zZiOSwRzvxHYPvwuDl/KBKEXtMOwS0AZ0b+A36ph9R7ISxHUc7VupiWU6j09EW7X21XlU1hYyQx3QpTWHOYYVMZPVs+W4x6u/wQK/S+nhGgGhwoDgNMnKsUy4+3fauYorDKVtjJGSRFHlMrHu0nvvZLCwf4yhj2UJCLD5N4085mgrird5A6goTaw+EtrB5x5PfdiAFmAdvOLMJsw3hOUC9kYoA/eqljyLf1PUfVX56NU3mwvR+OL/S61RsW8HZrahZuLAiYK+5i0a96kbr+Vy8/d9bYtjzEFh0JWw/Q18e1bJLj+CUhchha0Cu6TWkhLzvicJwPNRfXyqbIxfdxkKKQ+UVCHwRJWFHQXZVYE2OiA
X-Exchange-RoutingPolicyChecked:
	qOgLFG6+uLGpqaKHIon8n0pfj2lGs7AjVbcYQh5FHGpxDXaFL198LYyarCvxfNiQanjH/8izaTWHKLs1y3n85ZboG7BDRJskPXvCjaCIsCOd0pzkLcWH6tjx0chhMiijOODE92Twv0u8mA5j9XTH7qhr2Vg5T/7lsFznDy5ZOF7e9pqacg95ZeZoMSlL0+kZK/6NEoQdx0Ihhyjfbu4wxVlmP2EIhDBP2Rznq/YFIYpgE8UHeNv1etpe9de7/+OptAzDm9OmCo5cVUUYJyNaGKmTDzY5ctYe/r+Nyh9Xta46fK/pOT5TG0a0NvZg45P5uCzVqDaQijb66PLtXEGGHQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UjRX8Gejm9jQ3H71qtwdx08X/5KKf9OUK+NezG6kike+CE2Q68rOR9KujI8EpmtGO+NIcTWIPu9Ra7iBVuwQf8bW5VoZ9/L90L/YgyQu/kYZIB4lopz8WWKQt5i20VP6yjPVysZF8x+YtY7RJNSVPUHHw2NAbmkT+w2NwqEdz1B2oqbj5g56zsukGZOL8lV9eYbAoZ5oWWL9oWJi/0qsB7pZbYO4LOj3DMbBVi1UvRePTetwYR+BFB1TiTo2sk9gmotIJkQkrgBj/3NmLeu0S93mWRYbEGqeJf07Znk+rMdvI9bUEfFkUllYihpJagkmwmfI0vqbM135ch+1H5FaGM59cHoQsn2qc0croSiuGYQpacw4c39ns+wPRlQ9aK30EAiyXhdlUJmNQ9ND+6LkbrJOuMXew6phQQPBud8FtfHEYn4xFQci5MKtViqxcqXZ8TBxI7J/foDef289fj4BVomDnAXHQBq99Bk4oBidTCrJZrjyedfTYIwHNWk9C5Z4Ian9MFOkTHDvn1cJBbUMhfQyIEKa3y7RhSio3u7al49Wfom/4Wu/RyWgXrFEnnh45v8/yy6JCuohZs9UMieje9giFtt51xSK902A3c3Y9g+UZVdvWPBcyJtrKGOXbjQop6slr3uU/87VkOA+1XTTiw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 23:38:43.2292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eb0cc2b-4d9d-4eb8-6eee-08def801ae2a
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF0000150A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR16MB4287
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE5NyBTYWx0ZWRfX8HZRh1u/ENzc
 CgtXjAy2dmMlyxFcrZX/RNpjOdZpKRMGPDJDboy5mZshZp2OThn4dGq8J7EhwnwSMIUzokWn0UC
 2WF46PMIVuG7pSv1fnrzdm1RMquJR2CuS1MM9cDpuPr2LYWZ9/qbcoIdLHgectw8JtIw08vLWjX
 jPRv1ln53Hi2O4VaD07cKtEIQ85VLnZq2R5Zt0LoL0k/lu+sSKriHwON5UdJLE0VrozTJcMt6ld
 ccD2f6ZE1N1skugla1izpDQCdVlmg1UaedGnNSnwA+Kn133Ea4h3dBGFCYMvVujK51lnraKpYIX
 AAavAin64mISVOJdttd0eGiSH6VVYz9cyBqHT00raR6Crm54YKH0MvSm61NkOfyjDLp+Ry2lW/z
 9PBKrVmVMlpuj8Hlj59fBF6Ys5TIIh+ahklUuHxUsnqsPYY0J4MxolhIRdyV2Cw8U5/gT+dyO1j
 XeucRmat/s/s4ivBp5w==
X-Proofpoint-ORIG-GUID: -e5g2b2OAmw3FpNFdoQgMFGtqYokgjgk
X-Authority-Analysis: v=2.4 cv=d5jFDxjE c=1 sm=1 tr=0 ts=6a7bb288 cx=c_pps
 a=Wms0yhV2hyGqr6ZNmSx9tw==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=AHe91QgOk3R4nFVtG5At:22 a=cbNQJ9GKAAAA:8
 a=tqzJaSFn5nTAlFOWASwA:9 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE5NyBTYWx0ZWRfX5McEQdGOhmwX
 CsFuJ90Pu6isPWVJ9Vsn3t04DqAkGkDi3R2wWua0J7983S3mmPibuVHFxBkxsQUSo2DBl5SuUai
 S99iy37POfrD45HxCySRsADzvPR2d/lcjoNUtI5Iv9O5NDfTbUXL
X-Proofpoint-GUID: -e5g2b2OAmw3FpNFdoQgMFGtqYokgjgk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110197
X-purgate-ID: tlsNG-d25034/1786491529-038D5A5B-B057826B/0/0
X-purgate-type: clean
X-purgate-size: 2263

From: Denis Mukhin <dmukhin@ford.com> 

Current __printk_ratelimit() relies on hardcoded values 5000 and 10
respectively to program leaky-bucket message limiting.

Use 'ratelimit_ms' and 'ratelimit_burst' variables to re-calibrate
limiter.

Ensure rate limiter is disabled if either 'ratelimit_ms' or
'ratelimit_burst' is 0.

Fixes: 26cf03554a75 ("[XEN] Implement rate-limited logging.")
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v4:
- dropped 'initialized' flag
- updated commit message, including Fixes tag
---
 xen/drivers/char/console.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index ea4e3ff34178..56bf111ef181 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -33,6 +33,7 @@
 #include <asm/setup.h>
 #include <xen/sections.h>
 #include <xen/consoled.h>
+#include <xen/xvmalloc.h>
 
 #ifdef CONFIG_X86
 #include <asm/guest.h>
@@ -1286,21 +1287,34 @@ bool __printk_ratelimit(unsigned int ratelimit_ms,
                         unsigned int ratelimit_burst)
 {
     static DEFINE_SPINLOCK(ratelimit_lock);
-    static unsigned long toks = 10 * 5 * 1000;
+    static unsigned long toks = ~0;
     static unsigned long last_msg;
     static unsigned int missed;
+    unsigned long limit;
+    unsigned long elapsed;
     unsigned long flags;
-    unsigned long long now = NOW(); /* ns */
     unsigned long ms;
+    s_time_t now;
 
-    do_div(now, 1000000);
-    ms = (unsigned long)now;
+    if ( !ratelimit_ms || !ratelimit_burst )
+        return true;
+
+    limit = DIM_MUL2(ratelimit_burst, ratelimit_ms);
+
+    now = NOW(); /* ns */
+    do_div(now, MILLISECS(1));
+    ms = now;
 
     spin_lock_irqsave(&ratelimit_lock, flags);
-    toks += ms - last_msg;
+
+    elapsed = ms - last_msg;
+    if ( toks >= limit || elapsed >= limit - toks )
+        toks = limit;
+    else
+        toks += elapsed;
+
     last_msg = ms;
-    if ( toks > (ratelimit_burst * ratelimit_ms))
-        toks = ratelimit_burst * ratelimit_ms;
+
     if ( toks >= ratelimit_ms )
     {
         unsigned int lost = missed;
-- 
2.54.0


