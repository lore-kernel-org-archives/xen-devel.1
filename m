Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AC4606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 19:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=NXsNcCAy;
	dkim=pass (1024-bit key) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=ekRDs7fK;
	dkim=pass (2048-bit key) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=KBGqhwRX;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=ugRuVdjy
Received: from list by lists.xenproject.org with outflank-mailman.1484832.1688226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREJz-0006WR-9r; Wed, 11 Nov 2026 19:49:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484832.1688226; Wed, 11 Nov 2026 19:49:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREJy-0006Vl-Vr; Wed, 11 Nov 2026 19:49:26 +0000
Received: by outflank-mailman (input) for mailman id 1484832;
 Wed, 11 Nov 2026 19:49:24 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xREJw-00068J-Ic
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 19:49:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xREJv-004SZD-Tj
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 20:49:23 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c699-8faa-0a2a0a5109dd-0a2a4502b0a6-34
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:49:23 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c6c2-6ca4-0a2a45020019-94a38ff10bb2-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:49:23 +0100
Received: from pps.filterd (m0367129.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIYUAp2293409
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:49:22 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com
 (mail-northcentralusazon11010046.outbound.protection.outlook.com
 [52.101.193.46])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hvuayj3uu-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:49:22 +0000 (GMT)
Received: from CH0PR03CA0366.namprd03.prod.outlook.com (2603:10b6:610:119::12)
 by CH4PR16MB524731.namprd16.prod.outlook.com (2603:10b6:610:510::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 19:49:18 +0000
Received: from CH2PEPF000166BB.namprd04.prod.outlook.com
 (2603:10b6:610:119:cafe::34) by CH0PR03CA0366.outlook.office365.com
 (2603:10b6:610:119::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 19:49:18 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 CH2PEPF000166BB.mail.protection.outlook.com (10.167.252.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 19:49:18 +0000
Received: from pps.filterd (m0373460.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIZXER3211155
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:49:17 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4htnr3538d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:49:16 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id REJlxf5DhF9Y3REJmxz7j3; Wed, 11 Nov 2026 19:49:16 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=+c1
	MSCxJS0/AOVa6KVniucG9MfDgHlNN0tvBtE1o1Ng=; b=NXsNcCAyTo5RaV5uCr/
	3879ssIeL2bXHX4SxdsubtrgQqayou9v1x7A/eBJVsTCC4PFwbFI+fV55Ximh8kj
	zzXEcwtD5YBB0y/Zwc5ir+Ygq88/gfcjYpcr3sPTsbhm/W8AqwNYwN/KY5JqYkMj
	4m3HjtSYJpBjWGQSXOyzzn9bDAocTgOg2Syq8aTkp3NCt2nxjinUcnuY1TEA3DPD
	dnK5jXP5P58zrs5tE0NGxtNG8kJj9S0vBICsB0KWWZyrsPMHkokITZHJXjjF3TOe
	XBMk+Y+ZTWiQju/MBvEIDQnpuHLvjzZQdOAJxygbxelB/2wT9Ag8XHSWWmxxVavi
	1pA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=arjtKn3XcoxFGtBDOt02J6WhFgjjATC/kuB2vFPM2tM3TpyO3JSLDw3gjozePAhskSe30Z31JxTw4GMJDlKikkoMXDvcslP2zlJIrKT1yxm0gkA7B9JhTkyfqr0lxbhr1ZJxsMiA66wdgcQPTWaI3rDpFwL3/pbMEm0lqXimgKJqSJrT96xMm3PuOYeK/CPUl7dTxJe4TrTa84M4yKjiFYOMDF8uaEBFVJp9xkp6j+XXWuTtpf8D5MlKZbsAD8SRzGIPsuGCr9E+vZ+itE0RevCrFUNCOVnYWe/fcWg8r9Y5KQfdj28Rmq985TNmlBFIvD791cX1grS+WZxTjgFirQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+c1MSCxJS0/AOVa6KVniucG9MfDgHlNN0tvBtE1o1Ng=;
 b=bxH4W9pYmbXWdzy8jWAHm3QFU8QyG0+fc+cYMgsvbxdZNVnyT/IVpT4QrbOrkMHy8J0uRNiipByz2YND74f+GMGNQEVLkHrEHVt+JZaRQ5yDBmkN7Sy38HQgW++968VzsVAOxuRnyLew2ACKjO8Hyv33WoDj6YnQ4QYHcM29lCQ5fP44VzmqbbnRBn3w9zjSmK2vdx/d9Zyib5yHBDIIkoDdoLLPvgm9r3lpNI0dPus0xmFo3wZ7wcWgTcTFIp5kM/XMsh0AX41RXBwkqqc+gIzp03Ja3YlaC5P/idYbF/MC0mDCSDO8JF9IYBhdyKlNzwQk0e5tSsJiIH4BVeQCEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+c1MSCxJS0/AOVa6KVniucG9MfDgHlNN0tvBtE1o1Ng=;
 b=ekRDs7fKwdSmWj4GtRLJxfuV62V+9KQRXSirmveVut3dFSmxBrkgAhwPS+4ZHzDo3XLSIg7I91guFkTHrNlg7cnORKIkCKAS0nsKM3oEAsKB7zyb664VHgtuiS3gKwonVKWmiQOVnQK69IPNgFheMPuh/E2d3Mt4aEkJVvtMSYg=
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
	ppserprodsaar; bh=+c1MSCxJS0/AOVa6KVniucG9MfDgHlNN0tvBtE1o1Ng=; b=
	KBGqhwRXcVyjUE9aKR0csXl7joDsD2zfY4OdoKqcnWibML5HdIU5MRAtMCv//CKE
	1cHnJJ8QoUoIRS21/0OY7xjmawlUlgRAl8rF8qXuSzjRM0VjrXOB4GtXgSjuvHVj
	fPUTPF2ZEYH1j6dxhs/8B9P1YkRzm1htq8nFDbMCCqXNngMuy4kQmVAdlttw9Qrk
	l7zxp+EknWIC5uvhPZ4TzRmKkuG8eUhr5bT6YXNIUMEa54XrKMVnngANPuIsLmrh
	iv+w7s/gH8SgAVOtGjNfMit/tGMclRDp4bRi9Q+6vrXbNLUswDnEIL15ce7AUJ8w
	33eojQYdm0VSOmtq5JKTaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=+c1MSCx
	JS0/AOVa6KVniucG9MfDgHlNN0tvBtE1o1Ng=; b=ugRuVdjyHVelftPRJzsdWt0
	loeb8WugRCeFEufUO4S/p6MF5rs/ZGOVP/v4jBLw9kfEiwJFjgK90FMhfjuKj5J7
	0v3+SUhJ8DOAYRwANYCDoeV84fqGB9x65XElLnbPvPB9aZ66Cxsi1A0IR+Llt6ru
	TPKroA8WMFprItl+pB+4YxKgWDUeSTvmcVxVNPf9EkGPtS+QRaLa6R9n1egirdPI
	jjt7RBJoO3WLdYzaUkIuMWKTuL+Qp0HLz+8C9Nt5tT6g5qwlSvZ4oVhztMDkh1/S
	xcTdgYxEFCrdrqJNJVkOKmjn6cKrAos9tq8B8iptkvq/fqkA7enUQAjLZLlC47Q=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: REJlxf5DhF9Y3REJmxz7j3
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v8 25/26] ci: add smoke NS16550-compatible PVH Linux test
Date: Wed, 11 Nov 2026 11:47:59 -0800
Message-ID: <20261111194800.1070016-26-dmukhin@ford.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110078
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000166BB:EE_|CH4PR16MB524731:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 65a9ac5e-d930-490d-98d4-08df402cdf80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|23010399003|82310400026|18002099003|22082099003|6133799003|261009223027099003|3023799007|56012099006|261028144727099003|261022115727099003|261102123227099003|261102130727099003|261026140227099003|261026121527099003|261021121427099003|261022105027099003|261022075727099003|261021123027099003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	PhfNK1yHSsHJWUaC/Rr6LBzoviruCPmbF3HlIjuVUEmyvQ7K9NXzfIO6VToa1lUzSXR3+nCTVQweX4GH+RXasMGkIJHByplv9Afz0apowiH2Y6/rg2lKdHpO/yxRmQZ1tYtOK32Sj/2JerwMuaSMsTX+0+zP6QmR9siK/+MfNhOfioMz5ghQj5yiP7oq7DsEy9LTVns9aJoRbgafxv7H9HfA2p2NcwJqlDVu9UvlECONWGrwHs/e6j4HE9NqU9kfrI7moJ+DJ7kn4mJmosKHc7u3hjwBOVX9SNTCp7gl18n8xjfaFf0xqfQr5jhbv0pW8ug3+tkxrAJqh+WBietbj+o9eft2wbJHlo2jusBIgno3JseE0Wh+RNz4FQ58j2rVpg8gvrn2ZXZiH/TgYu7Pv0/y06mv1aLEKxbN7MYJO3g02lJNkkW1Cal6QQDue5FBM6IzylEKLGOZJdVRJ6IKe3ApoAIl7ZR/OtQa3EqlfyBiFb8lhnh7M4uqZ6wCBRGYhGAzmN/wNrWScrhXzwEK1zQsvAx3P5XdmW4epI7nki1hXtq8HsZL+UDu6lWo/93y/rwTSGame9ilhbwquOf2W/XM8e5dJ8qUCMkXu8r4Xd8SUZd7c2kfWhaLIrgzdbGF4JcX4Vzv+tBbzaIoqWgRzSVlpBSEYWYzwnw6UBceasK5pMbDIu1ARCdFp7Y8wV4tW3vF99JvpMfLDSa5lvpzjg==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(23010399003)(82310400026)(18002099003)(22082099003)(6133799003)(261009223027099003)(3023799007)(56012099006)(261028144727099003)(261022115727099003)(261102123227099003)(261102130727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022105027099003)(261022075727099003)(261021123027099003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CzKTlQ/MqA/onX/TUcK3ho4lGcqme90ohiVy0FisFgurF++Vn8R058aOWvik1M0esHf24NsG/xrobNmEN9AMWK6O2+zFbPFm7pl+4Wrj3D5zTQFbY4an+RlsnMFntYLvtV+X99DsFglx2c612eAUo7ss2SHWOwg3CpX0V4wJN06f2KWXNyvo1+istzhc6yNj6dEE5YqZeYN7QJ0SffO7NNktH19Cli9gsJUKsPd9OZ/fr7p9oYfX6jDia0+RUAfpbHpw5xij3VDf954spT8V3iwhcH6sR+byDyQHUYD3lqMQKQmfgCIj0TScDpWCLqgh1uqlFGCHi2W8Hx86xaXB0gpvRGJ1x3c8PL+MGYaqrf5dQoqqR7JyrKcabyj17lA97TiWUQgGEIliUIiSq4rhoEjItT5Km2B+5HtWXfT8uxbEPVlEhVaWUjyPsDjVLJPL
X-Exchange-RoutingPolicyChecked:
	y819d8G7RVxaiE6jDcZBRktLwWED8ku29j3fyoCp3upMtAjl0/kFBdZVC0HTPUH6tfUh9c2JqD/q5Db+DoLLzwsaDW01M31I4ERxqKH6yl8dOpXYcySp2dS1OQIamq83YC8PMWt15q6mmaKFhqTOwsjMqou9kmFsGgPSsGKK44YgoM3sC9F7AS1bEMcggbLE5BuiyFeL3rauWv3/KzRHXuVaBYRDRfcRLJD8M7pPSkDLRwW166wknGwTzBpvH1pF3IznT0mUC58q1gtXm/0nGHCzOLQjBnDq6O6yqiEqURCGY8GqIqEvNws3uN5E8YClCwFVjkEFJ824N/ZddxKpbQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	G3V9e+8HEVXU6C8ELilnnjmVvtzaW0L1oXSKT6qXHafGjTWaUDit6w0LQ9TXVaT4Q031QzZG5AYHmLNqMuSjDgmNqXjSpzep25ATnhvUH92zmk6Ww7xuFz7NDlqLmJyAnxiwA3R9G6nBfvytvmIV62xUQH5yfx9tD/FOSLwBcc5zmFMkZiyjhP9WN30q2W2xUO670SgSL9InU1F0p9H1SbahBjBh1uumhoZM0AUwcJWX9RvdZUWcempVF4vMvb9Q3jlGajaM56kho8Hpcid2kMgout2nSV1Qzn9q3I3kekhqmVmikm+TOjFRiaL3O7kViRPwm4UIssbWWjd0NhZtw5vibabRbDMSKS12HfDkypHG1Cl7xGI5xXmtO0Zq47GnamkT4ENQ6tRvJL8BRz/etEusKQ8cLAIPSx2/J6DORisxgNo5b4a4xCi7K8OeWToRzC4QEa2uSmnABLwr8MzI/8LzborCm+InC7CFJ3ha5840Tf85N00oiUR4UOBQ2KaMQDr4S4j7MHpHEAhccFjVw/OS5+oULQzRjhi1xc7nka/ZmYoH1ypYsxwsnSTZE1+fJOgV3osjvxiUdlbDUdAOb45IsVfYu9qIr1HLG1eId0BzLLQDxQkfSHPyguVpC29cY4SA6AC8ZWuaLr7N4czWXw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:49:18.0074
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65a9ac5e-d930-490d-98d4-08df402cdf80
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000166BB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR16MB524731
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX7bDJwmAu0peB
 03dbJIoqX/zWyt6yhxJpVGiEIS9B4DKWh234zuDZdcdIYksJRHiKGZHUALBVLffgw7WwXooN7DP
 6ulwMGa8XCox86A2MydwLylk9xI8tFhA3bH+32MxKXNCCyM4X4PU
X-Authority-Analysis: v=2.4 cv=DPEacCNb c=1 sm=1 tr=0 ts=6af4c6c2 cx=c_pps
 a=imb72M7KABO0D7Cp285+Zw==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=X3KReqg2EL6A36SYCKpz:22 a=cbNQJ9GKAAAA:8
 a=-f_TovXTUOLegHrM0jwA:9 a=P0bj-C3X3jJDpopQwM1U:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-ORIG-GUID: ifWA3bw2zEF820ptfBI-eaJTuNX3TFbm
X-Proofpoint-GUID: ifWA3bw2zEF820ptfBI-eaJTuNX3TFbm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX+cRJhBb+5beK
 MKIaDcnFxNr3DG8+Zmh+U65dDKbomalUhjzhkGZSuFIHoIvWhfGTpoCukH9H7uMiRKd0j+G2Cr4
 Yz/vfV0FUF+ooE0yoAISHbVbcPDOPr9TrlgvqtFyZc8mR5z9u2saqWkF5lty8DgYxJHfG+2rmoP
 D1fpfpDh5yl0reVI3LF4/TheDIDP6LWIAxUOsqzym4/aA/OHI1kPp57gdijDRaCZu4cgJmAwqxL
 yJ2UsSGUB3ENfJsvjYMoo9IT1LRycOGo2n9eJuxB0lR5fdVBLfmnw3W0fNY3uj/CqMLpmtsZdny
 4uNfcR//zAeTTEzLB2pPiBgLR3ka5nNcaRqFepGI8wYQVUxW6aqPnNoujd1rTcv1NeEAar2nz6i
 ebjVH/mbccqMpHi1UAS/YIsz1M2iAA3GJvoindekA0bJ+5U20RAHMFrsKWmUetxscIt02c0Vq1W
 v75sGBWL88yi3ZmUXKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110078
X-purgate-ID: tlsNG-720697/1794426563-F10A02AC-37D16F49/0/0
X-purgate-type: clean
X-purgate-size: 10556
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Add smoke test for NS16550-compatible UART emulated for PVH dom0/domU.

The change also overhauls existing qemu-alpine-x86_64.sh by moving
stuff around so it would be possible to extend the functionality
easier in the future.

Note, that new jobs will be likely skipped in the public CI since
/dev/kvm is not exposed for a reason into docker environment. But this
is great for local testing.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 automation/gitlab-ci/test.yaml           |  27 +-
 automation/scripts/qemu-alpine-x86_64.sh | 325 ++++++++++++++++++-----
 2 files changed, 280 insertions(+), 72 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 4f4ce8aab9e9..c4140e850b5f 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -736,7 +736,32 @@ qemu-smoke-dom0less-arm32-gcc-debug-earlyprintk:
 qemu-alpine-x86_64-gcc:
   extends: .qemu-x86_64
   script:
-    - ./automation/scripts/qemu-alpine-x86_64.sh 2>&1 | tee ${LOGFILE}
+    - ./automation/scripts/qemu-alpine-x86_64.sh --dom0-type=pv 2>&1 | tee ${LOGFILE}
+  variables:
+    TEST_TIMEOUT_OVERRIDE: 300
+  needs:
+    - *x86_64-test-needs
+    - alpine-3.24-x86_64-gcc
+
+qemu-alpine-x86_64-gcc-vuart-hwdom:
+  extends: .qemu-x86_64
+  script:
+    - if [[ "$(stat -c '%a' /dev/kvm)" != "666" ]]; then echo "/dev/kvm is missing. Skipping test."; exit 0; fi
+    - ./automation/scripts/qemu-alpine-x86_64.sh --dom0-type=pvh --dom0-console=ttyS1 2>&1 | tee ${LOGFILE}
+  variables:
+    TEST_TIMEOUT_OVERRIDE: 300
+  needs:
+    - *x86_64-test-needs
+    - alpine-3.24-x86_64-gcc
+
+qemu-alpine-x86_64-gcc-vuart-pvh:
+  extends: .qemu-x86_64
+  script:
+    - if [[ "$(stat -c '%a' /dev/kvm)" != "666" ]]; then echo "/dev/kvm is missing. Skipping test."; exit 0; fi
+    - ./automation/scripts/qemu-alpine-x86_64.sh --dom0-type=pvh --domU-type=pvh --domU-console=ttyS1 2>&1 | tee ${LOGFILE}
+  variables:
+    PASSED: "BusyBox"
+    TEST_TIMEOUT_OVERRIDE: 300
   needs:
     - *x86_64-test-needs
     - alpine-3.24-x86_64-gcc
diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
index 242ffca693fe..5521a2e53e36 100755
--- a/automation/scripts/qemu-alpine-x86_64.sh
+++ b/automation/scripts/qemu-alpine-x86_64.sh
@@ -2,86 +2,269 @@
 
 set -ex -o pipefail
 
-# DomU Busybox
-cd binaries
-mkdir -p initrd
-mkdir -p initrd/bin
-mkdir -p initrd/sbin
-mkdir -p initrd/etc
-mkdir -p initrd/dev
-mkdir -p initrd/proc
-mkdir -p initrd/sys
-mkdir -p initrd/lib
-mkdir -p initrd/var
-mkdir -p initrd/mnt
-cp /bin/busybox initrd/bin/busybox
-initrd/bin/busybox --install initrd/bin
-echo "#!/bin/sh
+xen_extra_args=""
+dom0_extra_args=""
+domU_extra_args=""
+domU_type=""
 
-mount -t proc proc /proc
-mount -t sysfs sysfs /sys
-mount -t devtmpfs devtmpfs /dev
-/bin/sh" > initrd/init
-chmod +x initrd/init
-# DomU rootfs
-cd initrd
-find . | cpio -R 0:0 -H newc -o | gzip > ../domU-rootfs.cpio.gz
-cd ..
+while [[ $# -gt 0 ]]; do
+    case "$1" in
+    --xen-extra-args=*)
+        xen_extra_args="${xen_extra_args} ${1#*=}"
+        shift
+        ;;
+    --dom0-extra-args=*)
+        dom0_extra_args="${1#*=}"
+        shift
+        ;;
+    --dom0-console=*)
+        dom0_console="${1#*=}"
+        shift
+        ;;
+    --dom0-type=*)
+        dom0_type="${1#*=}"
+        shift
+        ;;
+    --domU-extra-args=*)
+        domU_extra_args="${1#*=}"
+        shift
+        ;;
+    --domU-console=*)
+        domU_console="${1#*=}"
+        shift
+        ;;
+    --domU-type=*)
+        domU_type="${1#*=}"
+        shift
+        ;;
+    *)
+        echo "Unknown argument: $1"
+        exit 1
+        ;;
+    esac
+done
 
-# Dom0 rootfs
-cp rootfs.cpio.gz dom0-rootfs.cpio.gz
-cat xen-tools.cpio.gz >> dom0-rootfs.cpio.gz
+dom0_console="${dom0_console:-hvc0}"
+domU_console="${domU_console:-hvc0}"
 
-# test-local configuration
-mkdir -p rootfs
-cd rootfs
-mkdir -p root etc/local.d
-mv ../domU-rootfs.cpio.gz ./root
-cp ../bzImage ./root
-echo "name=\"domU\"
-memory=512
-vcpus=1
-kernel=\"/root/bzImage\"
-ramdisk=\"/root/domU-rootfs.cpio.gz\"
-extra=\"console=hvc0 root=/dev/ram0 rdinit=/bin/sh\"
-" > root/domU.cfg
-echo "#!/bin/bash
+dom0_type="${dom0_type:-pv}"
 
-set -x
-
-bash /etc/init.d/xencommons start
-
-xl list
-
-xl -vvv create -c /root/domU.cfg
-
-" > etc/local.d/xen.start
-chmod +x etc/local.d/xen.start
-find . | cpio -R 0:0 -H newc -o | gzip >> ../dom0-rootfs.cpio.gz
-cd ../..
-
-cat >> binaries/pxelinux.0 << EOF
+# iPXE boot configuration: xen + dom0
+function make_ipxe_config()
+{
+    cat > binaries/pxelinux.0 <<EOF
 #!ipxe
-
-kernel xen console=com1 console_timestamps=boot
-module bzImage console=hvc0
+kernel xen console=com1 console_timestamps=boot dom0_mem=1500M dom0=${dom0_type} $xen_extra_args
+module bzImage $dom0_extra_args
 module dom0-rootfs.cpio.gz
 boot
 EOF
+}
 
-# Run the test
-rm -f smoke.serial
-export TEST_CMD="qemu-system-x86_64 \
-    -cpu qemu64,+svm \
-    -m 2G -smp 2 \
-    -monitor none -serial stdio \
-    -nographic \
-    -device virtio-net-pci,netdev=n0 \
-    -netdev user,id=n0,tftp=binaries,bootfile=/pxelinux.0"
+# Detect the type IOMMU device to emulate.
+# PVH dom0 needs IOMMU.
+function host_iommu_device()
+{
+    if grep -q 'AuthenticAMD' /proc/cpuinfo; then
+        name="amd-iommu"
+    elif grep -q 'GenuineIntel' /proc/cpuinfo; then
+        name="intel-iommu"
+    else
+        name="unknown-iommu"
+    fi
+    printf "%s" "$name"
+}
 
-export TEST_LOG="smoke.serial"
-export BOOT_MSG="Latest ChangeSet: "
-export LOG_MSG="Domain-0"
-export PASSED="BusyBox"
+function make_qemu_config()
+{
+    local qemu_cmd=""
+
+    case "$dom0_type" in
+    pv)
+        export TEST_CMD="qemu-system-x86_64 \
+            -cpu qemu64,+svm \
+            -m 2G -smp 2 \
+            -monitor none -serial stdio \
+            -nographic \
+            -device virtio-net-pci,netdev=n0 \
+            -netdev user,id=n0,tftp=binaries,bootfile=/pxelinux.0"
+            ;;
+
+    pvh)
+        local iommu_device="$(host_iommu_device)"
+        export TEST_CMD="qemu-system-x86_64 \
+            -cpu host \
+            -accel kvm \
+            -machine q35,kernel-irqchip=split,sata=off,usb=off,graphics=off,smbus=off,vmport=off \
+            -device ${iommu_device},intremap=on,caching-mode=on \
+            -vga none \
+            -m 4G -smp 2 \
+            -monitor none \
+            -serial stdio \
+            -nographic \
+            -device virtio-net-pci,netdev=n0 \
+            -netdev user,id=n0,tftp=binaries,bootfile=/pxelinux.0"
+            ;;
+
+    *)
+        echo "Unsupported dom0 type '$dom0_type'"
+        exit 1
+        ;;
+    esac
+
+    export TEST_LOG="smoke.serial"
+    export BOOT_MSG="Latest ChangeSet: "
+    export PASSED="${PASSED:-Welcome to Alpine Linux}"
+}
+
+function add_udev_settle()
+{
+    mkdir -p etc/init.d
+
+    cat > etc/init.d/udev-settle <<EOF
+#!/sbin/openrc-run
+start()
+{
+    return 0
+}
+EOF
+
+    chmod +x etc/init.d/udev-settle
+}
+
+function add_console()
+{
+    local domid="$1"
+    local tty="$2"
+    local ioport=""
+    local ioname=""
+    local guest_cmdline=""
+
+    mkdir -p etc
+
+    gzip -dc ../rootfs.cpio.gz | cpio -i --to-stdout 'etc/inittab' > etc/inittab
+    # Ensure no getty on default consoles.
+    sed -i -E '/^(ttyS0|hvc0)::respawn:/d' etc/inittab
+    # Parametrize guest console.
+    echo "$tty::respawn:/sbin/getty -L $tty 115200 vt100" >> etc/inittab
+    echo $tty >> etc/securetty
+
+    case "$tty" in
+    ttyS0)
+        ioport="0x3f8"
+        ioname="com1"
+        ;;
+    ttyS1)
+        ioport="0x2f8"
+        ioname="com2"
+        ;;
+    ttyS2)
+        ioport="0x3e8"
+        ioname="com3"
+        ;;
+    ttyS3)
+        ioport="0x2e8"
+        ioname="com4"
+        ;;
+    *)
+        ;;
+    esac
+
+    if [ -z "$ioport" ]; then
+        guest_cmdline="console=${tty}"
+    else
+        # NB: ensure guest is not using Xen console
+        guest_cmdline="xen_console_io=off console=uart,io,${ioport},115200n8"
+        xen_extra_args="${xen_extra_args} vuart=$domid:ns16550,$ioname"
+    fi
+
+    if (( $domid > 0 )); then
+        domU_extra_args="${domU_extra_args} ${guest_cmdline}"
+    else
+        dom0_extra_args="${dom0_extra_args} ${guest_cmdline}"
+    fi
+}
+
+function make_domU_rootfs()
+{
+    mkdir -p initrd/{bin,sbin,etc,dev,proc,sys,lib,var,mnt}
+
+    cp /bin/busybox initrd/bin/busybox
+
+    initrd/bin/busybox --install initrd/bin
+    initrd/bin/busybox --install initrd/sbin
+
+    cat > initrd/init <<EOF
+#!/bin/sh
+mount -t proc proc /proc
+mount -t sysfs sysfs /sys
+mount -t devtmpfs devtmpfs /dev
+/bin/sh
+EOF
+    chmod +x initrd/init
+
+    pushd initrd
+        add_console 1 $domU_console
+        find . | cpio -R 0:0 -H newc -o | gzip > ../domU-rootfs.cpio.gz
+    popd
+
+    mkdir -p rootfs/root
+    mv domU-rootfs.cpio.gz rootfs/root
+    cp bzImage rootfs/root
+
+    cat > rootfs/root/domU.cfg <<EOF
+name="domU"
+type="$domU_type"
+memory=512
+vcpus=1
+kernel="/root/bzImage"
+ramdisk="/root/domU-rootfs.cpio.gz"
+extra="root=/dev/ram0 $domU_extra_args"
+EOF
+
+    mkdir -p rootfs/etc/local.d
+    cat > rootfs/etc/local.d/xen.start <<EOF
+#!/bin/bash
+set -x
+bash /etc/init.d/xencommons start
+xl list
+xl -vvv create -c /root/domU.cfg
+EOF
+
+    chmod +x rootfs/etc/local.d/xen.start
+}
+
+pushd binaries
+    rm -rf \
+        etc \
+        dom0-rootfs.cpio.gz \
+        domU-rootfs.cpio.gz \
+        initrd \
+        pxelinux.0 \
+        rootfs \
+        smoke.serial
+
+    cp rootfs.cpio.gz dom0-rootfs.cpio.gz
+    cat xen-tools.cpio.gz >> dom0-rootfs.cpio.gz
+
+    mkdir -p rootfs
+
+    pushd rootfs
+        add_console 0 $dom0_console
+        add_udev_settle
+    popd
+
+    if [ ! -z "${domU_type}" ]; then
+        make_domU_rootfs
+    fi
+
+    pushd rootfs
+        find . | cpio -R 0:0 -H newc -o | gzip >> ../dom0-rootfs.cpio.gz
+    popd
+popd
+
+make_ipxe_config
+
+make_qemu_config
 
 ./automation/scripts/console.exp |& sed 's/\r\+$//'
-- 
2.56.0


