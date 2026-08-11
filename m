Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2140BC5AC67
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2026 21:12:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388600.1629605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wttld-0006rT-Nl; Tue, 11 Aug 2026 21:12:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388600.1629605; Tue, 11 Aug 2026 21:12:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wttld-0006rM-Ju; Tue, 11 Aug 2026 21:12:13 +0000
Received: by outflank-mailman (input) for mailman id 1388600;
 Tue, 11 Aug 2026 21:12:11 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wttlb-0006rG-FP
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 21:12:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wttlZ-00FYLW-K1
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 23:12:10 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a7b9027-2eae-0a2a0a5409dd-0a2a4507802e-8
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 23:12:09 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a7b9027-b4ea-0a2a45070019-94a38ff14a50-3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 23:12:08 +0200
Received: from pps.filterd (m0482515.ppops.net [127.0.0.1])
 by m0482515.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67BJJpMs1749946
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 14:12:06 -0700
Received: from sn4pr2101cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11012061.outbound.protection.outlook.com
 [40.93.195.61])
 by m0482515.ppops.net (PPS) with ESMTPS id 4g08tysxgj-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 14:12:06 -0700 (PDT)
Received: from CYZPR10CA0022.namprd10.prod.outlook.com (2603:10b6:930:8a::26)
 by PH0PR16MB4261.namprd16.prod.outlook.com (2603:10b6:510:4d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 21:12:03 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:930:8a:cafe::55) by CYZPR10CA0022.outlook.office365.com
 (2603:10b6:930:8a::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.11 via Frontend Transport; Tue,
 11 Aug 2026 21:12:02 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Tue, 11 Aug 2026 21:12:02 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67BJLfHQ3908633
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 17:12:02 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4fxjw5bh9m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 17:12:01 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id ttlPwg8Phl3RSttlPwBqxz; Tue, 11 Aug 2026 21:12:01 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:Message-ID:MIME-Version:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=ppford; bh=E/B4OGTUik0qpSe4TEgfrHllO
	vR0TgzZpKxl3Uotu7Q=; b=Z7Mjxiy80ympdAtELdUAmpQwzBF0LrLogn08fp/Rm
	nmJ9nTcqXezcGw4vIIbD2tpIt2bxIPWHFQ4vja4y6i164gF5friTB6Nv4M4kavTc
	QM5ezmjIyULsUkaZLtf1fTCWgBCIgCRumMZski8JyO6J1EjoZJlpMsb3dF0VjWBw
	VZm7rvega0WhbH4Z3eYT2+VpgJqD4DIGL5pEz8EeI+sTTKFKaPsVactGK7KLBrFV
	J2GsDlAUSsNOMSFwsz1WODLSe/TOzkfEESr/hmPano/ZwCQJD4e1vLIW7TKaGG/T
	7DxbmuLPkJs7po+6U82i1xQy/LDVwnaCKqAQYY456iqrw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cPPNLwU25epAzkQlrV1gaNgLnpQ3G6R2xgC1KKWAluI/86av5Otw34UDpfdRpbGaLk4vqzwNYOJsqefRj/dDerOMrgjbGAk01sirHIbuVNOtriUjKwILPOcTBp34mCcXrRa+DhmX7KT4qxI4MniB3BacATbm3LUn4pUi4TDTFCeW0kjB0yvGLsn+xBoXd50ZctCcLhAhu+jBFChGoXWPxuFSp37QNUFtUaVEcJJXG4CkVHRqPMlAMhKHpDcvjTAF0u4Ux4VSkCemDc3HPihzlok/8w0i9VSUa7EsUsZPxdHCUIvlfWL0zUoAcPuRuD2At9FwkTdMrI2SoeHe70nH2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/B4OGTUik0qpSe4TEgfrHllOvR0TgzZpKxl3Uotu7Q=;
 b=VxmeU3vtNiFQICwmBEzc+55i9grq6nwezNswWlkfwUywfBKLl/skHzCNmmaitbGmXl7MNylx/GJsOGguaE3szLIgUx/3UlyvY1bb+E+HQFusdueDVq6SoLA7jRK6RXX13KG0JIBclhzpP/UY3ZEA9Y7Ae6D1sFBPOuKvl17nEEe0Nb3KzcPHwKeWRNP9NXBH8VVi+RJKyFBrIwqYhJN1OIteS+buZwP/FaEfOR764vF9m8d0jCvj65zczKKfd4F1kfYYSf16Nw3mafLww2Gr8+LALpPw2GW/Dw5P3MG3LvvJaLuJCDktNZ39K8CHfxdg0m80hAHTu0I+niZIUEFHYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/B4OGTUik0qpSe4TEgfrHllOvR0TgzZpKxl3Uotu7Q=;
 b=RKXapbPqO5HpaM7Ds7r5AXrTmT7yEJzPI1/4nSY75VqL3jWOnrGQOlUh3ocKDmgFU+dkrlfBQFwomnmluxZ8vXgDxKsdnnINMgB0qdgyNOm0zCZ9B3qVLrglVxByO+cv8HxFecEY0D9xb02DHZSXQT5WCcDICerCO0GXHwmM3Yw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to; s=ppserprodsaar; bh=E/B4OGT
	Uik0qpSe4TEgfrHllOvR0TgzZpKxl3Uotu7Q=; b=oiaaopXWFSqrQIxLdQ9kZrU
	m2WCbEBxShB82fo8DondNbvUfEnb6+POXBjK2zitos+NIGEnrv9DKz7gCiZR7ZAd
	BksqrG9l8i/0UUic1dwrXHr3+aW3sb/f3J7AVm/AKGa7q6KsRWVu02ph7BgSsE/8
	n/8PDVGbRREhmT7k31vwZ688nX5ViwDlJ5bdv4OfuvHuLJrtwgnfZHH5LV40RVWM
	Adzgzw597Ti/Q96Z7RRIlxYtLbA4fkB6j7+pcojKwi2fxF+rvSHWbilc7yD5ryKs
	AQ4PqMGo0ogyw0w0uX2UvUWkwYnr0f9zBHRq1ZuD1LQEcjO7D4hh6SGKrS0BcqQ=
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=ppfserpocford; bh=E/B4OGTUik0qpSe4TEgfrHllOvR0Tgz
	ZpKxl3Uotu7Q=; b=i7Zx1Ud9EewzzUW0KR/51TO1gNvV9xBHWg0+hkH55MlKE6f
	oly2KQn0uoEuDeyhouRpBS3MjOQe7yQn15xWgOCaZbi0yZwI+8q/nYXDsmytl9Hk
	UUVvMElBPxNV0KI1ogQPzpwP854v1AN7Mp4KaX2Z8AG9jnJwbKQg+3VGjqF/MGoQ
	g3EgFqoHT5nBBSzx92XVycR6i0NO42bD7/rDT9rsRJrCrfJGHGLrwDfvdNf+x9gf
	YErLCyhZWvidj46RyNtifeXGY6RwHZ1Xqz9g69yx7/64LILCaZGjE5sv7RFX/LMD
	dEwzesSOF3MA4n3YAbPq+uYjm+fREGhzIu9JjXw==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: ttlPwg8Phl3RSttlPwBqxz
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v4] xen/common: add keyhandler to show Xen command line
Date: Tue, 11 Aug 2026 14:09:57 -0700
Message-ID: <20260811210956.3806559-2-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_05,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110178
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|PH0PR16MB4261:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e2853b1c-9538-4571-03ec-08def7ed30a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|56012099006|11063799006|10067099003|3023799007|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	XnyxGH9V+37T88cz9tZi6piA45r3oCR1om1mYQPIFlyvl6LLuI7atQcUKbutZNn9nq8BAOLdtO8eQjovBlyv6/mQNAnkLwVZAo0HpoIYVZ2zOeyLg4QjTODbHmYBSYmWl3baR6+dRnXLWIXPMxtQMO5sdL8zTPuLBvm5I5CU9/+e5impkyUlq436sTl7hFmxxO8dGYDb6/rvsP0evpnoEHr9I69rG8nO79vjfNXQ2oEDI3fWNzVBsvHOYx6aaDSCD7opPvO8+d4eFaXlko9LbZbUp2ZMS/DsUC0VZ0TLtvoqwAFBLC01XKF/69dScLGhZjtFSZAHVveoRtl7pQZuOOETiLC7ZzGs/9HcSq6yWZXOuOMnBDy0mVfQ06T+XVz8UoenwzzQQueToIFmpA62eMFAXfcW3VleJkMwasJB9C/wvYo0j4cUeAVkpsw2fHz4Mj/V+JOohaV+fAKaI/0P4I9B3AFR5XThNc1DSMTe0l/Qq48V7YgzESlvu6mkk6xEcGl8NxVP8WgnjPUGUJAcFqIOYx438CnmcEapQ5GtoJMfIAxMFps2Wrmgmt44asSubUJyTj2ibCvIbqKnzN79bUMOTqmNrBB4t8w1C10GtEDqBM6cUAuNrE9FOKcMRdp40FYnM7gwuV12UvrpQEqrXdQnjhO4DooakKtNe0TIg8+47Q1E1mCL8xR5+WCPKtZF2UKf3Ny/eVekpUz1jitsLw==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(56012099006)(11063799006)(10067099003)(3023799007)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aHQUKJlMOyGTwsqNERfRyJMzdcEhSul8DjLnb2hPIDJWg1ncGVnykZYoBZfkVVmsSy0xPThJ9fTQBOARzNrwglZwyONKtv/Wr7Xhso/HdDuNsoXGSVfktL3TLmsxHQJ0OsiBgW0U1hrH/RyTyrUK1kMsyuqeFbon6NInbsKieKAn4zg3Laej6LGePpI2IL+jaM6BoHQ9AopvkFTyVjbY+uToG8j/Pp4aJTfDTjrdFcWeKQn6TXjIaoG6comoMtM/WZNjRw1OzDcyMdNIVhAKuTp1JVy5C0IOjZlpsXcXHrWSC4masmg3nzAhiepfjr/u5uK6fAw/LLIR1qR2UI7lUrl6ZIgAI+RWgEdoMTGjxEdhPu9uApzVFwaJL8g/vxlDA8/FTvIiijpyv7cBI3ZTQe5N5wRyepHZ/nkWJh+UqODqmFUyC11KIVEoH5no0Jya
X-Exchange-RoutingPolicyChecked:
	e7fKk1dTjGUi6pzE5nVHye/+jWMNBpEtUJAYblFAodu5W7AtYXrLMsi7DMJR6vG2psoBxmBsWXlMvdvrGxALrW45XsfmR0/UTC0F2rx0mC8Ead3Ml3DitSJHxLo2PjsvzI/aKUAntL/kPUFnqtGwg99aHMNiBZoYsfCJsvEbRDzEJfi0Qh1BQaUMqUGac1+Tp/FjUcMrgWkykeOoJnDAUrj5+98vYoHMiq+rqRkknksHCpo9ZieMF/bTfEz+PZ9yM9jIFQ8aYzKl9lcc+WGxywWo0zFq7BdHLtec3bEilbBSAfshW0DF/kQuB6tRvzS+9BuwGU3M35mH/CyKIYfe+A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pAME+JoQ3SZIjdtBQpLmQMJOlNql0iH09gv5BtJCNwQfAvlSMlAIz9lSGK8PO7jl8X1D8UJ87qli7P4vfspH1Xctg6DPo4vzokrHcQHV3vlXyo9vOzEVzmCYISRgMQ6lf+QLGsJlfGve/tyf6hq+cWEeOSe8WQwV4RIAvTF5Ud3zUxra6zIuk5F7GMwp/Ig5Qh4PBJztb4rbZTz7Y0TmS1UMpxixyqFbgW5ER66y0uMz9QTHRXrA7nATGOto6Ao91aos29jOX4XHw+/eYhazIJDB8C/og/JpCkNy4dUw6H04nDznkELByF/ZU2ZmvMlUtKJuEt78V2vD/3lJggJfTMYTrLfpOZUUAiT/LeVAamFCGtbCK4h1r46RXzKKaPxbH4rH6jCDI/dCUsQ4gw4u26vnSU6FT+QdPbyYG390pURbWWY/T1+2znDdIzYkGTNxY0Lq6+/Q61KZ4J4FZ3kMJid6zHnDRV5BNjFO4H7wbpJDKeiDBsMNJxuWUn1AnAqoQgPAdCGEh12qu0sJXUcps8gEmv8HpOJIJQMHpF9gf5QkFuYEW917rJF1lOUaC53wPCnqIU5eWOJZB3tcy6qKgca5IlawaSXPVsKhPV89UWi2O3MUCn+t3OZ5Pse4PEvRZyi+JM/cJtMdGjZQOEpShA==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 21:12:02.7276
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2853b1c-9538-4571-03ec-08def7ed30a7
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR16MB4261
X-Proofpoint-GUID: OYJVD7ZUROFawxw-ZzSUDwsTH0ChL51R
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE3OCBTYWx0ZWRfX2bR0dVe0KFZx
 tRoCzPd5CTusFMFMhlcARzWfAwszE3NNchyZOBdnj8M3MlTA+F4m0mqz8isn8whoRrVw+J3OpR+
 eMAjE/cQdTeYCuMFfiiSjvy58NRlPikjGmj3GkhD4tByvzH/UBdT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE3OCBTYWx0ZWRfX9os3kZHwzzry
 Cq50Z4YHzFfE8H3OWYqMyJaT4b2mPcb4A4/IkkV+zYQI+8NSdfnpZm0NxlJIVmE3VVMWjMQ876B
 hS7p00ub2KUql2uEhikoKWgHtmzMSqUFqvGKhJ07McImDulHfp0/tXdkGXH1Ex6jcLcno9vwxu7
 8rhUmHSW9+S2cp0jChQAq1esbUvQ+TCY+DpEc+QVanosvLFAOLJP3qSIrhessTMqbZdDj/VbFbW
 wRw9ohiiVFCN+JptBVdVON1n8+B7Xry6imfrQBMDXlLjxQWOfaQ3NRpijXLn1vxbIM0i49iWNO7
 QBkklg1DfZ/qBYd2+KCLV0lt+WPzvrA9fs6O5OqY8lEmEAxikSEpu0Oblb0duP7ZQMEFzhAT8my
 ROaC1mvnCyC4fTYvAumftLNzJ2oDvh0zPzUpVZyJ/59GIuLUnyDE31889dHN2S1oFXn9qmnHOF5
 gX7PXBJawIkLVe5D7ug==
X-Proofpoint-ORIG-GUID: OYJVD7ZUROFawxw-ZzSUDwsTH0ChL51R
X-Authority-Analysis: v=2.4 cv=aKfAb79m c=1 sm=1 tr=0 ts=6a7b9026 cx=c_pps
 a=N7UEZcGu6nKKiVkixTDHSg==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=0GA0A_IKJoUHBEAzNTkD:22 a=VwQbUJbxAAAA:8
 a=cbNQJ9GKAAAA:8 a=p0WdMEafAAAA:8 a=IgJ0wlFFhhnA7GDi3u4A:9
 a=DqJYxgmhk6moR-_7_KoZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_05,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110178
X-purgate-ID: tlsNG-ef75cf/1786482729-A58C1AE4-C9FFB066/0/0
X-purgate-type: clean
X-purgate-size: 2003

Currently there's no way to print Xen command line on the emergency
console for debugging purposes when 'xl' is not unavailable.

Add new keyhander 'X' to do command line printout.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v3:
- print built-in command line too
- change handler to print command line only

Changes since v2:
- account for CONFIG_CMDLINE_OVERRIDE case

v3: https://lore.kernel.org/xen-devel/20260810230359.671587-3-dmukhin@ford.com/
CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2751523722
---
 xen/common/kernel.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index d1bef9ac2b2b..8a43e4421002 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -5,6 +5,7 @@
  */
 
 #include <xen/init.h>
+#include <xen/keyhandler.h>
 #include <xen/lib.h>
 #include <xen/errno.h>
 #include <xen/param.h>
@@ -505,6 +506,37 @@ static int __init cf_check param_init(void)
 __initcall(param_init);
 #endif
 
+static void cf_check show_cmdline(unsigned char key)
+{
+    const char *builtin_cmdline = CONFIG_CMDLINE;
+    const char *cmdline;
+
+    printk("'%c' pressed -> showing hypervisor command line\n", key);
+
+    if ( builtin_cmdline[0] )
+        cmdline = builtin_cmdline;
+    else
+        cmdline = "<NULL>";
+
+    printk("Built-in command line: %s\n", cmdline);
+
+    if ( IS_ENABLED(CONFIG_CMDLINE_OVERRIDE) )
+        cmdline = "<NULL> (CONFIG_CMDLINE_OVERRIDE=y)";
+    else
+        cmdline = saved_cmdline;
+
+    printk("Command line: %s\n", cmdline);
+}
+
+static int __init cf_check misc_init(void)
+{
+    register_keyhandler('X', show_cmdline,
+                        "show hypervisor command line", 0);
+
+    return 0;
+}
+__initcall(misc_init);
+
 static long xenver_varbuf_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     struct xen_varbuf user_str;
-- 
2.54.0


