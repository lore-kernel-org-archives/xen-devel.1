Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B311EC624A4
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 11:53:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406995.1640164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x260D-00086a-B5; Thu, 03 Sep 2026 11:53:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406995.1640164; Thu, 03 Sep 2026 11:53:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x260D-00086T-8S; Thu, 03 Sep 2026 11:53:09 +0000
Received: by outflank-mailman (input) for mailman id 1406995;
 Thu, 03 Sep 2026 11:53:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1x260B-00086H-Om
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 11:53:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x260B-00AJMm-5U
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 13:53:07 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a995f9f-8faa-0a2a0a5109dd-0a2a4503a208-14
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:53:06 +0200
Received: from [52.101.70.47]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 6a995fa2-fae8-0a2a45030019-3465462ffc9b-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:53:06 +0200
Received: from OS6P279CA0139.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:3a::9) by
 DU5PR08MB10438.eurprd08.prod.outlook.com (2603:10a6:10:521::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 11:53:04 +0000
Received: from CPH1EPF0000051B.eurprd04.prod.outlook.com
 (2603:10a6:e10:3a:cafe::1f) by OS6P279CA0139.outlook.office365.com
 (2603:10a6:e10:3a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Thu, 3
 Sep 2026 11:53:04 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 CPH1EPF0000051B.mail.protection.outlook.com (10.167.241.230) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Thu, 3 Sep 2026 11:53:03 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by PAVPR08MB9818.eurprd08.prod.outlook.com (2603:10a6:102:31e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 11:52:25 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%6]) with mapi id 15.21.0382.007; Thu, 3 Sep 2026
 11:52:25 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=HjZxQVk5tRBv75h+wmygC93YsCdAgD27So1KGkkhSspPyen7iGt8K2vfRKE/ZHQ0SfzSmrW3gpUh3z/3MfDAuA4tp3XCCHNWE24qEGNfDs1K8oPrMzI+uRq7Mmew/NLlz4LOO825pc6TnhcX3TzezdQDCLpqdtuRoS9ofHIk+kXN2nad8B5hoXB0H9henuZMhocIPCramJe9uEqPp8k7+DxSHX+9KfWXXu+JWIGQUdt3EPqERLYNL2KI2BgD15izN7Fp5SWmA3+4QmRMwxmkkIPiyqotbzT7cMp89zSF9ajsha7xQWzUPlNqk61qrkKQ+pPeT4y1iaX/tBNTGkR5Hw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZlHvx6LzBPucMI3DdfND5m53grain8pP6uaUnLyPbs4=;
 b=rUoyu5hywcAFeUBhtTXglIN6LT/QzJhjgbDUcuLJI2KOMUFjdVoY71csWk8lXggF6h2zxKwWS6zHdRzhEqNbPghwkQ0gW1YOt8lpAb0gYq+iQ9vgOIZIKnEVJfOpZ2GSDFNBmxZZLr56Uoiggtr6uw/fdW0S9A/HAfUlBvPx6bZX7tqAhY6+8viYbDyQl9U+HuUu5oTcOHgpWgraJCV/HUjjY8+mAZ46DqFklvzIeY/dlvn8/OQflvGLUoxwq9c434518T2gH9MC/h4LH8gk9HAaYMr6c6h/AB/ZXGjEwborKi4qT3J197o0bDEn8n1JAT2Jp6cFC8v6oIpDwGGCVQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=citrix.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZlHvx6LzBPucMI3DdfND5m53grain8pP6uaUnLyPbs4=;
 b=NZYGgdxR1zg/y3MyaFxSrR/HeH0QpVHvWQ5/NJXYDHK4GHy58aSbVqoPMNLRRphxygqhsqS++Ok8l1waNRXbEWJDha1D3v9jBFA50Xzrt2LZ0IR7FDg6IsICfLsytrSobr/phruK7CjkC1KSGsoy2ToYycFUk3/2UXB0yfMzOCM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fbOqakLNJ8UHNPE77Wj2nI2bYc0J8bcA+k8VculRNaPCOwh4nTpFEAXJU6Kt/3leRXsDZpX0GGLlXHX/aLSUt+DoQX45evTy6zYorJQ2tvxtoKyZO9VOh9Ntsv7V3e5TfwDb1Bw/H7DPE392/fUoNK2ELkax7NsywmbwAxvgJ3xcC8wZ9O+E1jrVnfbU83zfkoorLeknt5IYnzSnSHqA6Sm3lGRcaUAAcZowwoLx+VciLBc8GoLElz9LWxvkdxbZdILVwEKf2L6My3efSjf29jnBMeC8xY32or0PBPpQkDa0hapMT++G8yzpE+CrsHtMhM13DfXTsZVhMccBaSpcIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZlHvx6LzBPucMI3DdfND5m53grain8pP6uaUnLyPbs4=;
 b=aQFs0e6Z9Ta6LXRyRx9keTlBoEiccKtd0dcUcBvIasCgxKAERJTDnrBiYCUdkrsJ+LwPbvh+rnXY4xScQGH0Q+aMG7lKTVqsawyR6yuCUnUPuLMEO1g4Y2RfvEcrkHWrhBXErDIwB6xq0WE+o99/VB5JQXoKD3Hb7xc7voCb6TLnVL3cfZHG1h1JfetuTdiBatRsoYNM5eLcO4dr6pkDKfuCTKpwrukiaVk798y7LCTEPidOwr4G1C7xdwMt13TV8vavcSfnr66bCOUeexH5J3ve39wMB7MQfcez7tAZN/cWQMT2DZD5ZDIqjHJhy3h5rDdfdIIKEnNxjs7HrJcW8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZlHvx6LzBPucMI3DdfND5m53grain8pP6uaUnLyPbs4=;
 b=NZYGgdxR1zg/y3MyaFxSrR/HeH0QpVHvWQ5/NJXYDHK4GHy58aSbVqoPMNLRRphxygqhsqS++Ok8l1waNRXbEWJDha1D3v9jBFA50Xzrt2LZ0IR7FDg6IsICfLsytrSobr/phruK7CjkC1KSGsoy2ToYycFUk3/2UXB0yfMzOCM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Michal Orzel <michal.orzel@amd.com>, Jan
 Setje-Eilers <Jan.SetjeEilers@oracle.com>
Subject: Re: [PATCH 3/6] xen/arm: Clean up 32bit arm_smccc_1_1_smc()
Thread-Topic: [PATCH 3/6] xen/arm: Clean up 32bit arm_smccc_1_1_smc()
Thread-Index: AQHdOUMPTd/l4DNdekW/1tH97277xLa8ws2A
Date: Thu, 3 Sep 2026 11:52:25 +0000
Message-ID: <3F12E6F4-8F79-4E6C-8835-178BB6BB29BA@arm.com>
References: <20260831121944.2908139-1-andrew.cooper3@citrix.com>
 <20260831121944.2908139-4-andrew.cooper3@citrix.com>
In-Reply-To: <20260831121944.2908139-4-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|PAVPR08MB9818:EE_|CPH1EPF0000051B:EE_|DU5PR08MB10438:EE_
X-MS-Office365-Filtering-Correlation-Id: 3075aa32-777a-4eb6-e7db-08df09b1e943
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|56012099006|10067099003|22082099003|4143699003|11063799006|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 oeXoD0CCin7P/hY+im0rcAI8Ex1zrotbBgCsPeuebFdZGSmZVuN4EW9GoCv73lPT6LoU74gOwOYwVRENC+s5rom1EU2mz5whJApMRHXxbuk3Eg7ZgopKSRNo9mqzuFG5llTiL8U+HQ1DBpkb+OqB/X86I01xJuR2QXJIzyrks0WytzQG7itfCsASTX7SS6I4h1zZLggL6RNP9BeBIEYId8iyZwPO9Fkls6SFfhjE3A5Ewue76odOgeaqSIKvRnS5A3H+AnXkx9zNUInl1CxkZrSWarN0R3fIiWeOwMkqxh6ionlRSFCFp7kvI8NcWqLrKAsFs4yYi1IHBACOXNOMzaDw1pwi27YiV+nXMtVD9cGuO54Jpsrgmtgc7MUc5B17BRr1QR6V+iObQCU/RtEOqqm/GQ4Z5Vp1YSerNDKjPw20Imx5YMC16SNSDH+0jXNqYFevxCfe7dPh6Qc07Jh+rHHu2um4bWIKhvWg15tmR2mGLbEaJ8LyaU/6cFbqbmoMTP9Ks+Vk+04pbA7IbwRZxVziMSyLB8kisY4xSA7Bn+ayy+nLt69Tx+f/So55LV/0HuEUJ2sokZ19A+tu6D9+nMvG+xPESvVaSnjp0taSGWXjAxO1du9moJMI7LmSDhFHrjCFP9a//SEOw7XtM3tTWtESkvxUCIrXWjXAmYDaReOwrrb+aX8uZA9gRp1YNmQ/8dK0nGvGXSCE/OW1Dk6zcmzsZoDb1X4bPbHpoLukcvY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(56012099006)(10067099003)(22082099003)(4143699003)(11063799006)(3023799007)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E83DAD67CF48174CB94EE143535F43D9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 L2gwejTEr1qYQmMsv03I2ju57J2Wr0MsRYhHo+kGilZMNjOQyAPKSVLRlWhd7SAEhgEejCmxp0vyVcESrNWG1objQLXQWBoZy2Wl7jUOY7Pyl8z5Gp/lB+afV2NYyP9MzdP2YOvd2qBtKt0jCZ3Id5y6pTE+KAPJTB5h0MFwkg7eSCHcFJ7sVTdXtoyUpCr/5jbM/hfnUZN3Ew8c7+7VPfK80D0F/9Lr3SADYgBOgY7qaxlFUP8xzbpHnotZsLb5bvmxzALETI6+MgklAV5+GwCi0xSb0QHg7PkuXLBxo2BPIaRBBxDU6bdhnKps3BXtGAzrnTsTSyPo8hoUUJ4pMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9818
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 CPH1EPF0000051B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	866f1804-026b-4e21-7858-08df09b1d2ad
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|35042699022|23010399003|82310400026|14060799003|36860700016|1800799024|10067099003|11063799006|4143699003|3023799007|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	o5WC/aG6TJS15aoxUsuMVFFBsuhQpzdmZxsis5mO6SBIs7sAgVDcQ60RobgW24APBgMS5KxZbG2QIdtCcYDUEA6PaSkkMsgFWKklYIZWm9Rh8NJn+WpC7ZQF1iDEohE+k7Bh+0UnZtPk1/AbhYca3pCT6fiq2oJUGjKKzPzi6zQE+5SOci7r80NdA0Klyf/IdqtukxE9Uw8HkY05Dm21tI2lfuDZfkY4KMFKZNzuSAF3h3uG/GwizcCVhRehUD8dAOCabOT5h/ZW/YcZtTC3aDc68OcoVdBRqWLdUt8ivVV/bhTkPjklG33lJW316J8iNESPWMqgHvC3kMvG2WaEfFg4HODlwXdSXAXaIWNv/F0k1sWsAwBpIZh4JkcsAJKe85Tvbj7iVrzafNdgi8M8hXlqOIWJmSPoJw9aEix5kXIkugSPpvWWJaemwQMRRshxHgDqF0UM5PvLCP4GB1ii4cRHvOH2wilXwalRpflDEqWtySeJl3aLoOBD1YcK7LoPMxM7nudNjdhoDNqpYQhPfGCxzE3S6vzYE0qfVS3DPkQqfgZI0TgFdccVmu9IgcXR+sWkQs+fjjv0mbgJ6Yu/6DYvQGQmN6p8VBbzN+mOBTzFwGcxSbFE/pvomQEhbf/l3Hq8WotU5OUfcRPJVVJfsA6eaABeArNglqwpMK4jnEg=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(23010399003)(82310400026)(14060799003)(36860700016)(1800799024)(10067099003)(11063799006)(4143699003)(3023799007)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mDeQKzbkCTCtJVlAoKxdY67QMa8GMVzUy4UGTADZa9W4IReupKeK7uq9wUv10q6AsDlg1H+gVF8hRflS7kr/2IiiXq3sHTkZWj+faYm9nrLO62s/191Acfa3Kf7TAUmnM69mXlpqir0U/fv34LYZ2ZJw2zdbWL+TuCrSU0d/o6ACw4rMCOgBliOQVmu80G1z0nZn0oIX6UYn9qkqyDMxASNPBHQtN1l92YU5xLfui5Pk7Wto8lcEP1nX3VGG4jGaXoPBKi3C0qcSB27r4prjRDu9unDDtnqjz7y8aartpgWcX74jDmd5n5+4m58hg2Mh7Rs7KeZqXGwvFttdBU8VR+0z05hPE3XLFuCoK5EADw7MCq36hfKTx4X3caG7lbagxA36Nr9A/RM3jDMZD1uDPx1r9eMNbih6SkDCBzuoSy2cT7a8Gdmm9qrXGCmKc7s0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 11:53:03.5704
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3075aa32-777a-4eb6-e7db-08df09b1e943
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CPH1EPF0000051B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10438
X-purgate-ID: tlsNG-33051d/1788436386-768FA4E9-1E2AE786/0/0
X-purgate-type: clean
X-purgate-size: 6002

Hi Andrew,

> On 31 Aug 2026, at 14:19, Andrew Cooper <andrew.cooper3@citrix.com> wrote=
:
>=20
> ... before making a related copy of it.
>=20
> * Drop __constraints() so the output parameters are visible in the same b=
lock
>   as they're defined.  Use PASTE() rather than opencoding it.
> * Adust the indentation of trailing \'s for consistency.
> * Drop the newline at the end of the instruction.
> * Indent the if condition correctly.  ___res is always of type
>   arm_smccc_res (declared in __declare_arg_0()), so drop the typeof().
> * Drop arm_smccc_1_0_smc() as it has no users.
>=20
> No functional change.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>


Looks good and i was not aware of this PASTE, result looks nit.

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>
> ---
> xen/arch/arm/include/asm/smccc.h | 45 ++++++++++++++++----------------
> 1 file changed, 22 insertions(+), 23 deletions(-)
>=20
> diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/=
smccc.h
> index 832157f43734..5fe54013ac83 100644
> --- a/xen/arch/arm/include/asm/smccc.h
> +++ b/xen/arch/arm/include/asm/smccc.h
> @@ -56,6 +56,8 @@
>=20
> #ifndef __ASSEMBLER__
>=20
> +#include <xen/macros.h>
> +
> extern uint32_t smccc_ver;
>=20
> /* Check if this is fast call. */
> @@ -115,24 +117,24 @@ struct arm_smccc_res {
>  * This is manual register scheduling for the asm() statement, and any ot=
her
>  * logic to evaluate may clobber the already-scheduled registers.
>  */
> -#define __declare_arg_0(a0, res)                            \
> -    auto __a0 =3D (uint32_t)(a0);                             \
> -    struct arm_smccc_res    *___res =3D (res);                \
> +#define __declare_arg_0(a0, res)                        \
> +    auto __a0 =3D (uint32_t)(a0);                         \
> +    struct arm_smccc_res    *___res =3D (res);            \
>     register unsigned long  arg0 ASM_REG(0) =3D __a0
>=20
> -#define __declare_arg_1(a0, a1, res)                        \
> -    auto __a1 =3D (a1);                                       \
> -    __declare_arg_0(a0, res);                               \
> +#define __declare_arg_1(a0, a1, res)                    \
> +    auto __a1 =3D (a1);                                   \
> +    __declare_arg_0(a0, res);                           \
>     register auto           arg1 ASM_REG(1) =3D __a1
>=20
> -#define __declare_arg_2(a0, a1, a2, res)                    \
> -    auto __a2 =3D (a2);                                       \
> -    __declare_arg_1(a0, a1, res);                           \
> +#define __declare_arg_2(a0, a1, a2, res)                \
> +    auto __a2 =3D (a2);                                   \
> +    __declare_arg_1(a0, a1, res);                       \
>     register auto           arg2 ASM_REG(2) =3D __a2
>=20
> -#define __declare_arg_3(a0, a1, a2, a3, res)                \
> -    auto __a3 =3D (a3);                                       \
> -    __declare_arg_2(a0, a1, a2, res);                       \
> +#define __declare_arg_3(a0, a1, a2, a3, res)            \
> +    auto __a3 =3D (a3);                                   \
> +    __declare_arg_2(a0, a1, a2, res);                   \
>     register auto           arg3 ASM_REG(3) =3D __a3
>=20
> #define __declare_arg_4(a0, a1, a2, a3, a4, res)        \
> @@ -158,12 +160,6 @@ struct arm_smccc_res {
> #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
> #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
>=20
> -#define ___constraints(count)                       \
> -    : "=3Dr" (r0), "=3Dr" (r1), "=3Dr" (r2), "=3Dr" (r3)     \
> -    : __constraint_read_ ## count                   \
> -    : "memory"
> -#define __constraints(count)    ___constraints(count)
> -
> /*
>  * arm_smccc_1_1_smc() - make an SMCCC v1.1 compliant SMC call
>  *
> @@ -189,10 +185,14 @@ struct arm_smccc_res {
>         register unsigned long r2 ASM_REG(2);                   \
>         register unsigned long r3 ASM_REG(3);                   \
>         __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
> -        asm volatile("smc #0\n"                                 \
> -                     __constraints(__count_args(__VA_ARGS__))); \
> +        asm volatile (                                          \
> +            "smc #0"                                            \
> +            : "=3Dr" (r0), "=3Dr" (r1), "=3Dr" (r2), "=3Dr" (r3)        =
\
> +            : PASTE(__constraint_read_,                         \
> +                    __count_args(__VA_ARGS__))                  \
> +            : "memory" );                                       \
>         if ( ___res )                                           \
> -        *___res =3D (typeof(*___res)){r0, r1, r2, r3};            \
> +            *___res =3D (struct arm_smccc_res){ r0, r1, r2, r3 }; \
>     } while ( 0 )
>=20
> /*
> @@ -200,7 +200,6 @@ struct arm_smccc_res {
>  * v1.1.
>  */
> #ifdef CONFIG_ARM_32
> -#define arm_smccc_1_0_smc(...) arm_smccc_1_1_smc(__VA_ARGS__)
> #define arm_smccc_smc(...) arm_smccc_1_1_smc(__VA_ARGS__)
>=20
> /* Make an SMCCC v1.1 compliant SMC call with guest register state. */
> @@ -217,7 +216,7 @@ static inline void arm_smccc_guest_smc(struct cpu_use=
r_regs *regs)
>     regs->r3 =3D res.a3;
> }
>=20
> -#else
> +#else /* CONFIG_ARM_64 */
>=20
> void __arm_smccc_1_0_smc(register_t a0, register_t a1, register_t a2,
>                          register_t a3, register_t a4, register_t a5,
> --=20
> 2.39.5
>=20


