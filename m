Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF47C44507
	for <xen-devel@archiver.kernel.org>; Wed, 15 Jul 2026 20:19:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1363308.1615035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wk64o-0006F4-JT; Wed, 15 Jul 2026 20:19:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363308.1615035; Wed, 15 Jul 2026 20:19:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wk64o-0006Ex-Go; Wed, 15 Jul 2026 20:19:30 +0000
Received: by outflank-mailman (input) for mailman id 1363308;
 Wed, 15 Jul 2026 20:19:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wk64m-00066t-UG
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 20:19:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wk64m-00Ey8o-46
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 22:19:28 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a57eb16-e002-0a2a0a5209dd-0a2a4507b652-30
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 22:19:28 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a57eb4e-b4ea-0a2a45070019-94a38ff10e0c-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 22:19:27 +0200
Received: from pps.filterd (m0367129.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66FKJNr03579733
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 20:19:26 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11013020.outbound.protection.outlook.com
 [40.93.196.20])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4feg97ghs3-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 20:19:26 +0000 (GMT)
Received: from BY3PR10CA0023.namprd10.prod.outlook.com (2603:10b6:a03:255::28)
 by DS1PR16MB6593.namprd16.prod.outlook.com (2603:10b6:8:1e2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Wed, 15 Jul
 2026 20:19:13 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:a03:255:cafe::23) by BY3PR10CA0023.outlook.office365.com
 (2603:10b6:a03:255::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.11 via Frontend Transport; Wed,
 15 Jul 2026 20:19:13 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9
 via Frontend Transport; Wed, 15 Jul 2026 20:19:12 +0000
Received: from pps.filterd (m0373460.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66FJnS5C1118757
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 16:19:12 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4fc6pxw17c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 16:19:12 -0400 (EDT)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id k64TwextzlwZ5k64UwoZK9; Wed, 15 Jul 2026 20:19:11 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=onY
	0NEET/6Wl7dnhlWXcP/zQqpmDHSq8qV7HDKDUDEc=; b=JqyhY6ob18wsZF2j3I5
	LaePXUrIMfnVTFgpiwiH68dBHjFzqeOpGp3Mq0aHEDSgxuatI+Nb6LCeu/DW4k/F
	7S4UPboRORRDWwjxOO3i4ywBf9sl1rfbAuSCMjhZAKQODE/VW+0JNe+Uxi5xFKHJ
	ns6vodJjlTMrWTr6pyzTz5109XlA9F9KTfEWdMDf2bJnk78SGH+IuPUOqVwGyWdz
	HKeH4nUcSohRQey8gE04lv79OIL9cBqWqgRGA3DKmSHvKSO+wm9wrmWGx5w50akN
	/x9LtIJl6kANgb3XVFH8RKDJJgGU+pnHg04fEGWgF1AEchOqowgPCsdjMRNuOtza
	EmQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dpxZWd07YLEsi0dsXRVSwoyezwkIrNIWS+mEYvQCfIBx0yqS6V8HAnrpVc9+1SSpWsBze/y3YSUgAQ9SwmBFVYirLPYHInLfw4eHVJNUTlytUujf5dxDCDdQYggOIDEiwK+KXxJ3qQ3aRY0veCXET2O+3gNbWageDSTTao4i6cECnrcz1TZiEazytmNchumEuujTu8iK137hCm/aYcxJxkdWkBcyBi2/0iyi/HA+05teputp0NmMW9oYEPQlZmqTSGO0wdnDxJ/j8I9CE3pODM+/x37cjG4oDtLLghXD03uDm+J/pYZh1cqTxCtDQtmgzp/x8L97OtsoJbLulmP/Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=onY0NEET/6Wl7dnhlWXcP/zQqpmDHSq8qV7HDKDUDEc=;
 b=ni+cmPJ3jXhX43m8VhljifhrXZctVfZRECcQqeQvh0RDoIzssXBRl418WUXkOUH8GyJh+4GyJFIZ7yRo2bOzhf0JLJLwFdzdPJxg9PGSJpN1/beVi9IkfrtvDZWnfNTNcdWLIVKMbebDJCwTU0hcrsOSc+ke+iY2eRSlUjv3Z81+afptPIo9wCzejZDu7s8sPvk7pJOYS0494MNnfx0/vS9AdOeP0BTDCjhLxH9fK8WTHCGr/0UnhVuW6hi4j292tvKnusARqBgOqe//V1plHslGh6DTWxKKSj7SkQIEhH8+H0b/P5r4ozsb6Hyx/ykJkH8GIcNimdl20OwRyVafXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=onY0NEET/6Wl7dnhlWXcP/zQqpmDHSq8qV7HDKDUDEc=;
 b=coKoZVNo1h6knh/sEhLrnNzJNqNbJ4LG6EBXXxM8bpdN6SUzgoHV2XVnw7EkvCOpr2fGcvbaQIOlnhQEdCffAttK5Ne7pLfPkvn+kqiNECvxGoThXJKHBLbHdNP3KFKzW7Y78IUIh/2G2SWGdsndehSKWPG5K7cUA/a83PlAWJs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	ppserprodsaar; bh=onY0NEET/6Wl7dnhlWXcP/zQqpmDHSq8qV7HDKDUDEc=; b=
	hwgwp2tXRy7Eiz2woznwDH4Nx/Mc9WHS7duG10W3HqKtpIKBkCNDV7ACIz8nqaFt
	Hew4e4cONrJyYpCyDiGIBKwi+ZjqUmmcUk7LAsNSzbiEBkzRY4bLfOGkXi/WHdGD
	amsmOCJG9NoRXlR8XgXuQjMehhNdlKoZuOdEcfIAKYPjL9aI8OYarN8+mYMjZdSY
	f9yn+dDuJk5wrgxlXd70B5IVi5ZRrAbLcfOvx10VNZ3H5aL+MaJKZUJXbLGhIr0Y
	maIm2IYD1ly4HDOUgiGgJOHPq5w7wniwM/tkHk5EEZDUgyEV8bltXwUVuH1B6qJg
	polJXPPFPbTZnj5rEXkrqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=onY0NEE
	T/6Wl7dnhlWXcP/zQqpmDHSq8qV7HDKDUDEc=; b=LpiQuyaJL8H3KMo7f5sYK82
	E0oVENFanZVPpjEYqasPX5o7foDkpmroNvogpQ7wqVb7MarVItBtGUlR7+hYYrEX
	ESvLDWwwHeg5TmmntDfdhAkNaP9UBc3jnDtQCF+5IyE18Kfw/hREsMM8qSCC/ozn
	d8ym1Ue2BejViRrf4xSIop9WEYH/B8QmukW9PkwrTQjtPtD8Fsf8jRwO4i+TD/KK
	ZTihNLG69hlxsLIrXwChz1FQLSHyMG7t8ZJ/YdsQBPkrs8NsNDI6sjjQDfuGnPcf
	iO/ekGqfv5srKnf24QySfy5qB8bszMOCjyZe+o7772+o5exIcIrRC8LvQUY3dcw=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: k64TwextzlwZ5k64UwoZK9
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v3 1/4] xen/console: use bool as return value from printk_ratelimit()
Date: Wed, 15 Jul 2026 13:18:59 -0700
Message-ID: <20260715201902.2984407-2-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715201902.2984407-1-dmukhin@ford.com>
References: <20260715201902.2984407-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150203
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C5:EE_|DS1PR16MB6593:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7eeaa629-fee0-469f-c38b-08dee2ae560d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|36860700016|376014|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	tmpspZWf1IXMNWemCWZn6xRSB/C3MdaOSmU0LTZcdBaHmLlzAt3MvjXKKaFWOeoPT4swZddtETx9WQzN5jK+xcd81i0/mznne+cS0/arHZtFAZV1NSC/o/3rp19sVVPAqLQNY2yRdMF6yDFiLgMgOxA1omn/CAba8vY3WvizirI6NAzkAyqx0qsOOsTjxl0Th9TXaGXoG7uhZr2gg8GLnLS0oymTV+BnSZ7bV/k41+N//KDTjxg7blA+jW5M1GZkJa7i7HvXeQ25BpG7YXH4ZaIggDTa5t9J+IHxQ+nHXSeen/TeAvKT4zaa9N/+eYYcqK+rwJ6YOSyjw0Fa2p5//9oOeazyYkkfKcSEAlZNNnK/t0i9jqP1AvB3pUeQvVTbrESwiEStVwqHnaOBDh2Zb19FTIGvw27thlvttWeeyrKSD/+llOQ6V/D+VmzHT8uaNbsZpRVQlyQQy2gDh1QoMQf8cZdFif4DWYS/rrZxrCmkVK8FGRuR/0dYOa8lDebBZ0CCAYhnrTnQFhh1YelwSM/aDmrEQbZb+AHnmN7dd5NoGJnSXO1/THiFEW7R9OHH4dmtHxMmialz2v2q19UCiLlXJVaRWQMLXq7vcJ9yYwWrvJA/r8mZX/hFsYc934e3NvciF4dqvA3vKvqjQ89tEuarpzvEa15SEQRxtnAcm0jQRMW9yMVZSZbQ1uqB0SSOrwfIroDDI1NT4rQmEp6Ztg==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(36860700016)(376014)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	37VvwiB+oNr2pSYhqLJpxWHrkFczpmOBK9/aubSldmkwVa6zo8LARpee5eEUPpz0P6kV5QPRLoMYePDQgVA4Dy8cBdgerNEXzTlgQCnyVxtp2IavC3qbPggvUhAXBfTTmYvPLbdXZHYc9PKmzM78e1qJQEzQyrFtkcZTLzPzNmcYxu6+rbEKXjbe2fpfZ5tZud2l6b8wDCq2EnJbGQl72TD5WaLrwvAwbMfDHfaMyJRiCA0KIxonSp6SjZL26Fo2Hi+1TpQIvY1g069zeidpjDtaBl+o5De0DmNvz4MG6aOK5wvRP4xR9pnUaVKAQDe2Gdrqhx+l33aXYYWBJD/8pqCzbEHIs5FFDA5JpjX/mDVKt9INlvjFLZURDL4jBfex5nO55FfdM25KnbHOR2/yZm/vqjv32XaWuRp6OdN9FoWdQt0fHe+KkNxe3rA8RCWV
X-Exchange-RoutingPolicyChecked:
	V6KrjFZUalRFqJ8KQwHBt5qJL6quP2gqFrmFbEjC9uWS0LZKiRC7v/pM1f7NCz4AyfTAmVulGON34GV0Jp6tTTqnp1TJwPlOyqy8P0yMNX6Czo+KCRE+WmKmKr+Qn5Cqs/So1JfE5oy9Bs4E5oUB4xqwuNJbDALmt9HXKGEhDQBfhsW9BJ0tsL80XUBHKltfRQEJaXVI6Z+v9eLTj4V2YO0Vwxmps/cWqxiDRW6i5QACXM5OB4T1bl0tP4sETkTnWcqQu3L/TFYt3/pU+uqFa5sjkbiwK+ZXDUJUdLpzzuNT1cn/Yg9EdA/fvZ7JqHb9VyPzqQbMKnH68r+O/5JSow==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	T9jU/xKp/4qTJVQcpR2m6WZ3kIn5LiGE0pow88byzzZnQOnLlZHY+CIp+M80LEsbtGTmT/15v7pawNrAmJr4vFS6RWvWsVC01foSuxbjI77uz240an7lhIcU2Tvlik1c5jr+28zAt+urAa1yeqgMZU1i3aqFBXPd1h4E/blmz1XduL8w6Q4ISZrGgc3vuBXo2f15CFuhrH2/gddOav2HSCgGZeE9SnemahgR2A4eTYjVV9QShAmwPM+2oZlaJfNiQRrRUkwtOJNBq7mroAFCzuCLFdf7ucraqJA232EMC6oPk+58oAeq2/jRbpyBGV/I4q/sys4XrH/1OGm1TwLOmMlUY3KkgqTDJH7TVkwGyO055/f9fk4Kaup+1NtbCQqdme0dKnpMtIhFs8Wv8MNpclRX20TX+tKOaekJAZDsOug+fK3kfkUEM00nU5A80dMYWKu3uHIK05x0qXGLGZ2WnSPo7BsC7ruup96MsbkOYdo0e2yAe2HD+eCc3EfA+/GkjtUAA5M8tqvs7FCoa1w/PvKYLZQhZ0rLTZ/eIuHvNgHbU/j9D9NkRFq1VHmsiVfltET9/VL/4osxaOB8q7AGz+t99RregH4bDpcCm7nfZZGTGb1Gs8KC2EpqGLhyVMBYpVKGmmKI0C5Ynci/4AF0Gw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 20:19:12.8625
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eeaa629-fee0-469f-c38b-08dee2ae560d
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR16MB6593
X-Proofpoint-GUID: ZZ39HVijYtVoahimvWNUUfY-XkUKfqSb
X-Proofpoint-ORIG-GUID: ZZ39HVijYtVoahimvWNUUfY-XkUKfqSb
X-Authority-Analysis: v=2.4 cv=LPdWhpW9 c=1 sm=1 tr=0 ts=6a57eb4e cx=c_pps
 a=PurIBXv9FE+FLdDnXy66Mg==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=X3KReqg2EL6A36SYCKpz:22 a=cbNQJ9GKAAAA:8
 a=iox4zFpeAAAA:8 a=O5SXfJm8xCv1owjWUKgA:9 a=P0bj-C3X3jJDpopQwM1U:22
 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDIwMyBTYWx0ZWRfX8leqj3401WmO
 KXT4P/9q76DZnfJlYvN3qCM/87nH8WAFlUC25QMja9BA4hp/NROE1A+pzZLlyU37hid8ndhqpLL
 egLKZpR2otFlUFlnPAnqKlEJn5n+xiZa/bZMjNmL2KbpMytYoZT4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDIwMyBTYWx0ZWRfX9qsTZB6JppWx
 p270Tn5FJmVdtUuefCC+XpM3ldF6R0adGvOX+4x/jSj6zlnQreMFhF/E3YQH5Jy2oWji69fV4AZ
 +615XHFxMBLdLzUBUVDDyIElH96w5tAp8kU2ovJrRfba/PnbB25gRETotHylyl/7gX7r1yV4L9p
 onys6o+qhHKKukPgfDeHa2IszVH2mxqGhKMHagtACx311hDupxC/IX7Vhk3qm5JmfF/aPUPt66Q
 CbaHlCOyFWeWMVSxf6yM6d+TfdALzjfU93OwpYGrVkM5/APKGrpZpdfMFnLJrhl3RGoobU3mnem
 MMnM9ZVuDDtWgbZ/dwpU9M4rYDVsFYH/1kF6nT5U4PZZcsdcUCPEElpbsr2PPf7GwLX/kx4WTkm
 ar+KTkvuR6zzXiNCNQl0CIP2X9UTLwO8dFJA/tg0Pjel9bAuU7Rn7aQf0hIPSQziWNCyT5WjO8k
 YuMHnzn9kg9GcX4m7Bg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150203
X-purgate-ID: tlsNG-ef75cf/1784146768-A6EDEAE4-DF198B40/0/0
X-purgate-type: clean
X-purgate-size: 2656

From: Denis Mukhin <dmukhin@ford.com> 

{__,}printk_ratelimit() are predicates. Make that pronounced by updating the
return value to boolean.

Not a functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v2:
- rebased
---
 xen/drivers/char/console.c | 9 +++++----
 xen/include/xen/lib.h      | 6 +++---
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index dbda7f259668..5d395f882e08 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -1270,7 +1270,8 @@ void console_end_sync(void)
  * This enforces a rate limit: not more than one kernel message
  * every printk_ratelimit_ms (millisecs).
  */
-int __printk_ratelimit(unsigned int ratelimit_ms, unsigned int ratelimit_burst)
+bool __printk_ratelimit(unsigned int ratelimit_ms,
+                        unsigned int ratelimit_burst)
 {
     static DEFINE_SPINLOCK(ratelimit_lock);
     static unsigned long toks = 10 * 5 * 1000;
@@ -1309,11 +1310,11 @@ int __printk_ratelimit(unsigned int ratelimit_ms, unsigned int ratelimit_burst)
             rspin_unlock(&console_lock);
         }
         local_irq_restore(flags);
-        return 1;
+        return true;
     }
     missed++;
     spin_unlock_irqrestore(&ratelimit_lock, flags);
-    return 0;
+    return false;
 }
 
 /* Minimum time in ms between messages */
@@ -1322,7 +1323,7 @@ static const unsigned int printk_ratelimit_ms = 5 * 1000;
 /* Number of messages we send before ratelimiting */
 static const unsigned int printk_ratelimit_burst = 10;
 
-int printk_ratelimit(void)
+bool printk_ratelimit(void)
 {
     return __printk_ratelimit(printk_ratelimit_ms, printk_ratelimit_burst);
 }
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index bb0fd446b484..3c545ff33c61 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -82,9 +82,9 @@ extern void guest_printk(const struct domain *d, const char *fmt, ...)
     __attribute__ ((format (printf, 2, 3)));
 extern void noreturn panic(const char *fmt, ...)
     __attribute__ ((format (printf, 1, 2)));
-extern int __printk_ratelimit(unsigned int ratelimit_ms,
-                              unsigned int ratelimit_burst);
-extern int printk_ratelimit(void);
+extern bool __printk_ratelimit(unsigned int ratelimit_ms,
+                               unsigned int ratelimit_burst);
+extern bool printk_ratelimit(void);
 
 #define gprintk(lvl, fmt, args...) \
     printk(XENLOG_GUEST lvl "%pv " fmt, current, ## args)
-- 
2.54.0


