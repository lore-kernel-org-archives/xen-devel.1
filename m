Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553BFC54F54
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 06:51:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1372097.1619496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wobf0-0002Ex-26; Tue, 28 Jul 2026 06:51:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1372097.1619496; Tue, 28 Jul 2026 06:51:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wobez-0002Eq-VT; Tue, 28 Jul 2026 06:51:29 +0000
Received: by outflank-mailman (input) for mailman id 1372097;
 Tue, 28 Jul 2026 06:51:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wobew-00021n-D1
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 06:51:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wobeu-00DF4H-GQ
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 08:51:24 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a685165-e002-0a2a0a5209dd-0a2a4505de1c-28
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 08:51:24 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a68516a-4cb1-0a2a45050019-94a39217654c-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 08:51:24 +0200
Received: from pps.filterd (m0367124.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66S6G6EX728431
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:51:22 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11013071.outbound.protection.outlook.com
 [40.93.201.71])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4fpq0nr6xx-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:51:22 +0000 (GMT)
Received: from MN2PR05CA0052.namprd05.prod.outlook.com (2603:10b6:208:236::21)
 by CH3PR16MB6161.namprd16.prod.outlook.com (2603:10b6:610:1aa::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 06:51:19 +0000
Received: from BL6PEPF00022570.namprd02.prod.outlook.com
 (2603:10b6:208:236:cafe::10) by MN2PR05CA0052.outlook.office365.com
 (2603:10b6:208:236::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Tue,
 28 Jul 2026 06:51:18 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 BL6PEPF00022570.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Tue, 28 Jul 2026 06:51:18 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66S6Zo70280187
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 02:51:17 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4fnc6atkhg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 02:51:17 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id obelwmVpu1FglobemwtA2E; Tue, 28 Jul 2026 06:51:17 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=MQ0
	1HjWbPMsbeTBIKfqVGVTXCbgBi39/10coPL09xRc=; b=nnhnhpERWr+xYeWJLnB
	c8TudxRwNIeqColq1tg/TzIu5lV8BsXd/icKsP9kvYXpVHqzWHA+qdN2hVg3cIxG
	eaelBw/AQbR7Gail2HwB4cbUxG1UN7NPo5lT3onPCuV4oeu7fEpq0x1Fde74WkQn
	ELB8U1HMZweqJ7E5IeIg3Fn++JpwUwl3nl9W20Ul5cka/rVAoMnNA2J0//IpAQuU
	YoOsrJLEuzVBzcV4v3uK8ZUwoX3ruTbnHk8WkK8HFG0Crz45ZwLLm8tZz3bifi8X
	94yakxX4hxb7kyWpI/D32i3EAqByFwWl6IIvYiRx1hm064e751YrsDYG/IB5jtlO
	SSQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KvWrULcS7/fzSqM3uG8GvI2vazAyFE5GhqTexsnBQ4N4FO67/DlpmJl+z3IP101te7kjxUnqJv07qnPQLGTK1GZDD1ZpoAGCwir8Iv2a1Bsjs3GJic+rZkY4tZlbHXdk+r2H14BqpUEWS1Xf6RbcRs5JCf2P41zHDF+Z6ONDBzaJkXi+z+AkYfG3koqZISURGNfhh0QYoE9BVmNXlbWy6IMl84R7aNi7hBC0IYuY0HbgadnD/t0HZKrTROtDPWQWO4QKW6bAB1SaETij7r8KmujixEOesX6h8EkF5rC85oKwy2gGjDN/LLX020cgFukhwfEKjOwEvjaBaem6a2BvVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQ01HjWbPMsbeTBIKfqVGVTXCbgBi39/10coPL09xRc=;
 b=eds8fDUUgEH5frOdWx0wzsPRb9uF96HpA9/RvYiM2bHrSRm/N0XFhE3kG8Oj091ho4Emd3AIjnYzKSTTqsrS2ainluZHdOgTMvfMPiavxO+ml/oG4vwxTEQIY9c7CD5rrB2ZFi5JClGzGcN/jtaiXlBBUTATreLIwrQt7rmJSfmfdTo9DvbV8m9aq/0MZKflvOG9Mf9hunjcpeO32aruvcvaaLZ2vsT9+Qx4gTsBxOxZ4POrcCw+XPbVImlgaGJGF3L1o94TvcnB2MHP3sj0b/ER3BallG2/sC8WKMoboCcPTWAShh5DrGEStFaSkSaAA/tr3ldyHNL9enaZ51uS3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQ01HjWbPMsbeTBIKfqVGVTXCbgBi39/10coPL09xRc=;
 b=O94nctrDzp+jEf/dySSX6e9ae+ffASyDCaYv78+x92ggiHjZbjNXxFgOUERLV8bf92QkMqV90Q+94IAHtEPtXw/T9M8TcPinZdEpr4AgIgJEy8s2qyDRglSSyQzfMfUbieXjJ53iasersEFdbuqq45gcWFRwQwR+mWGgu/JHCvo=
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
	ppserprodsaar; bh=MQ01HjWbPMsbeTBIKfqVGVTXCbgBi39/10coPL09xRc=; b=
	kF1vb+sweUhwcUuYV0JxsQotnIQotv8CApFWEWjEdj+vWd+z6HC+OhHkwuFa5Ttd
	i2zP8WeauWB9i88/ItQF9rhJmpjRswb2NjOVIRGyulHwrh1rqHE5cHtPwzJC9a7W
	NokywVWvOdzdAD6qXflNcMerOB3V3O22Ujo5DUnAdLWIX85lQ7l8WBQ1UvUvS+RY
	4fJJstO6uWteVoGrxKpZCPYvr5MwsqX8C7XKinQ4TQJEWp61psU/F06WeuRKPyLc
	kK98fVWt0RLH/ut5EZtofAoEYlpWkkICrwRGFJC6UZ5iYkulIMD99g4vtR05ryFT
	T/DtHlddgsWLPzCchDeUOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=MQ01HjW
	bPMsbeTBIKfqVGVTXCbgBi39/10coPL09xRc=; b=kgtahYPgJ5Ztn1dGkY+9YOV
	PNv5AMuzt2/Sfky0rwyTS4LN7fL6k6SD6NiwFtPfoShg6RXBCoBsO5mPahhjHvxS
	mvyjS+iH3umJbZQPlHWdUIssdC9+hVNBcbUdCNOmxlUtpogxwYXumi87wQmy6H+b
	zl134HTzxW9OotWfsAUZVMDlbn8R0oD40G6iIjKCN3E+Zqo8wYzcOUmGWyJn8gTM
	HhGiu0lJVy8wV1ziZssyDUroIuNYYf7wGmnBT9f5c++TOu+xfVDme+6wg/Tq6l++
	lWclgr7Evujw0Dak/hz/6GDDTI3WcpWzfrXych1LWSa9l+jo90HROGSweq8RdIA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: obelwmVpu1FglobemwtA2E
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v8 1/7] xen/console: do not use XENCONS_RING_IDX in console_init_ring()
Date: Mon, 27 Jul 2026 23:50:43 -0700
Message-ID: <20260728065049.1318143-2-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260728065049.1318143-1-dmukhin@ford.com>
References: <20260728065049.1318143-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280060
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022570:EE_|CH3PR16MB6161:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bbe27f28-1265-4160-3a71-08deec74a053
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|10067099003|6133799003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	FJa6Z4NAtmMvQv3yoziVpYDJs9PNHS8yo5LbiY4u3Y8TlMyI6U9t7Hmzvfv0V09YG6h2GST9v8K4JtiOMLSJc7Kq/5G7QuDeNvymJ3uQLccbzffZu6RZNK7FwoNOG9PD3C5XdN8OZAOiTUIXTY6Y+lMYZ9VuVbIHoLXFzHw7qx4ghrTsPuv/chQS82YfG6S96eOK5Tz8Yyh3AhgfcS4pEjzTamM4iXdqIJegF/zkbb7QycwCQr4Lc+AJWFeUK4isW46ZlWsMWLJID+2kuc91Qi83sqvy6AUM2ZS+CouCr+Gll7Jg6dCICUbS3tiyAyAdknOJTEZfumx8NMKlB5VLkJI2ef9syZF01VXf2hH1Br0gQdjfIdRx/BPEKMzULSKpz/mvCpE4RsFQvaX89xoQDF5b2UcFVGTJ4mAo9gnfo0iElZQqOZtZDvIds9LZmk/WW8LlIMWVfQ6EeGAqk4prfawc3/63YAkM6AidV+qaWMluXO/B6DK/YYtpvZouoDgWWIkj9NCtG27tvZ9Z5dttLnr7YqdYAalT0rUHhQIGc4DaZYUeRaZY8tzG7QokKPegFr80HTrtSqUTW+64yrzoxUdLvUPSHpmxMRdS3ARghoDh+sVBle7U+8ADHK7bsGxxMVyUFWbZ+HFKCRCAVn5xQyzxjs7UU9ZMTNqjjoRgoaCDcoJgRNiUJxUjpUnM+NmzuSOtiI+7XEJj67559XT94Q==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(10067099003)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gwtX1aEAFb7/CLU+S8K8s4aDVgEyZ6xFL6cUaE4ngYag68xB+A0wyiyhCncUqNujooYGHCcUMeVzToqdSMfEtgGJOV48IxC2HycSJppKLmEpi5Eg8SCOvusgSQFZiOJzKIQ88LjtJep6XwhXvnT/NkCi0TrTAojf4TdkdeDaDu4ChYtHpn3i2ErgLS5ZSdcqD3Stm0w7CFxG410hC2X3ntd9wtawKWrkN1jRVdtn0S8ZARM1EdV0Yyb/L6K22Qq8VBqMHZeozSGgJtHTsbzE1MpcL973lcpnVXi8zP5jWgYwp6ZZAAUi52PLdOICZQmH9YuboLmqs6wb8bMY0ulywXKtawcerr3qni3U4IeW3crfhV2dnEQb7rEufctmnTTUN2Ya2b6yOEFacntTybBTgbJXo3cX4u0svM6tHaRKNz575bTnP4uoN1dxq3P37Wbi
X-Exchange-RoutingPolicyChecked:
	bC42gGbLt7cGa0TlxxriQjYTQ2mnRv+OAVvQ4e5TmBD5eHieQTmF+xcpqRXlMe17vunniljtVJ4y2yLENdRWFdsoJLp5px5eSVC82fn5iFQqohNuMpKG7gLe5I6C0FaTfnmOj4zs49OzcBEnbthVr3+dU4acFvMiIfHwVDKYJFsbIU523J74lp78SQsmTkP7htwCFBgjRujnmaETsA0ewyoznEyF5eR22p+6uPcLykb8uBts/RyRe27bdLZoqDTQE21iRgs4+h2AIlypJyT3hcG+Rc1sHewBUvElBnGbwZtJNM8xuGz5WZIxWnxEhIMcPEqdFlGYMgTaoWACd1MXlQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Lzwfn/FyReq4xqHXN7zjPP7LJypA+WI4oTHf1uRY6ae02QYryyJgOA2ljKF8SghJ691K+91uK/FBqUCOq828Aw/nc7tzhpB617RBqV4xEy3CmvkpQry4q09yvR2lqeVXZsEWEJBH/y1+rfDR1KERQCDVr9BE2PQ81odQcoecxzB6fd2nEZ11Yan2WaD9CHUOO0HcHHlzAavxviEwtNaloxf14p130WaTU0YSCvmxEYv+zuJ8UzAYhcgkbce1fJfgBl7nC3jXK7+mYOo8Bew4fNA0McdUsi1zwNzEnE97qi1fUNUFn13DY5ckDcvtiL3IccZqgWSWpEkKGRxe8MD+Hd1rxX3U18ShBqbrybyQm81sW25imF4e2py+PhCdZOHo6nyBKTjERyUpjmnLvqAn9dYLQdExseNAne7WoL5SNRkEewNLS9Mac3G5b8RDbJZcD1ZoX7PVzAv10+nwIiO+Xr6fNHy1BKbAULoEo1Vg1YE6nkLDpzKWDgtaxvrNWdOQ/396QOsFoQpHh6fPkawNdunivzAtdznrj9QV1l+rfiDYRymwN7E4NJen+fuc25Az7R2iynXQUp39zpnzwk02JFX4dkVDDQgvaOKvzXbnwu0rilZfUJycakoEKLilqmSaq9elw7x79566RmVfxx9bqw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 06:51:18.2341
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbe27f28-1265-4160-3a71-08deec74a053
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022570.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR16MB6161
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2MCBTYWx0ZWRfX7akA7kqxdwyp
 zTFyK5f3990RlVKYWsm9pkAiKhOUYGaTyc6YB6KRApdUzZqT5fqauC0SCMlfGFHWs4fHA2GeaA2
 jbqcG8JhTrO3HbxXuUl6lrbjKyJTrNEtlvD2CVqucDNfqj6xtjCG
X-Authority-Analysis: v=2.4 cv=bfhbluPB c=1 sm=1 tr=0 ts=6a68516a cx=c_pps
 a=J0RhwYao4za//xiv/28V8w==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=YJXg7OVxOWrJwj3yZo-i:22 a=cbNQJ9GKAAAA:8
 a=tHz9FfFoAAAA:8 a=aUZ9qqs2IOYyk4sMzWoA:9 a=3whSkbs7g9Me0DR5EJEX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2MCBTYWx0ZWRfX/15f1QChb7Ln
 DtGFg+aowf4EKBYGPvwAAGdailUtTTyYMxrgeMSMbG4rT2po0A8xQA90RaesfZulJRHpK4TGmVx
 6hHXDKy8h0UJFKzBI3r2s5e1esuV2I+72oTWdeYIkw/SigEqL+1PSitrn1libihggyZxPf2G7fJ
 3B5Wj4S074IiPWiGuArQBIL4KESE9mN0DJSIN9rR1vEjgNatQUdD5kCTRpIgai4izl6umAQMnDa
 45AvQK9vqeoqXj7aynqWu5X+L4TvH0cfK8Vw4PjtxTCycNuP6GxTMH/uZV3z3q6xI35WGUNLkce
 tPlSInytFeZrcbwMS+pXNByjO5s1F+xCs6EsE2eCzFbYPpT9J7OiWgvHch0It4nJJPQYagxQKWo
 PL8r9dwPRCE/iN99rzHT82gFsU2ZcFZScle5oeyVaNj8VbG3KJjgA5MLb17USHUc5pgvNBqOrhU
 f3a1b5kEsbrcwDLop3w==
X-Proofpoint-GUID: vztqyefdiC7SYkeoX5ro7zfsprzOsC3s
X-Proofpoint-ORIG-GUID: vztqyefdiC7SYkeoX5ro7zfsprzOsC3s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280060
X-purgate-ID: tlsNG-c201ff/1785221484-730B22A1-02B9ED11/0/0
X-purgate-type: clean
X-purgate-size: 1431

From: Denis Mukhin <dmukhin@ford.com> 

Replace XENCONS_RING_IDX with unsigned int for the console ring indices,
as the console ring is not a Xen console (XENCONS) ring.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v7:
- new patch
---
 xen/drivers/char/console.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index ea4e3ff34178..37fdda93a4c1 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -463,7 +463,7 @@ static void cf_check conring_dump_keyhandler(unsigned char key)
 void __init console_init_ring(void)
 {
     char *ring;
-    XENCONS_RING_IDX done, size, n;
+    unsigned int done, size, n;
     unsigned int order, memflags;
     unsigned long flags;
 
@@ -484,8 +484,8 @@ void __init console_init_ring(void)
     size = conringp - conringc;
     for ( done = 0; done < size; done += n )
     {
-        XENCONS_RING_IDX src = (conringc + done) & (conring_size - 1);
-        XENCONS_RING_IDX dst = (conringc + done) & (opt_conring_size - 1);
+        unsigned int src = (conringc + done) & (conring_size - 1);
+        unsigned int dst = (conringc + done) & (opt_conring_size - 1);
 
         n = min(opt_conring_size - dst, conring_size - src);
         n = min(size - done, n);
-- 
2.54.0


