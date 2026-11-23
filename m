Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146BB606A332
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2026 08:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=oJI9IHb/
Received: from list by lists.xenproject.org with outflank-mailman.1500289.1696515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVPTW-0005he-Os; Mon, 23 Nov 2026 08:32:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500289.1696515; Mon, 23 Nov 2026 08:32:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVPTW-0005hX-M5; Mon, 23 Nov 2026 08:32:34 +0000
Received: by outflank-mailman (input) for mailman id 1500289;
 Mon, 23 Nov 2026 08:32:34 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xVPTV-0005hR-To
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 08:32:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVPTT-00HN24-Ua
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 09:32:31 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6b03fa1f-e002-0a2a0a5209dd-0a2a450aad0a-0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 09:32:31 +0100
Received: from [40.107.200.9]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6b03fa1e-f2d2-0a2a450a0019-286bc809d2e2-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 09:32:31 +0100
Received: from CH0PR04CA0099.namprd04.prod.outlook.com (2603:10b6:610:75::14)
 by PH7PR12MB9127.namprd12.prod.outlook.com (2603:10b6:510:2f6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 08:32:26 +0000
Received: from CH2PEPF00016D48.namprd02.prod.outlook.com
 (2603:10b6:610:75:cafe::44) by CH0PR04CA0099.outlook.office365.com
 (2603:10b6:610:75::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Mon,
 23 Nov 2026 08:32:25 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00016D48.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 08:32:25 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 02:32:24 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 02:32:24 -0600
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 23 Nov 2026 02:32:23 -0600
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o5VIjc7mGNiMkjtjVMkVb0QW3ekyFYVcFK2ZpcXZGkypipE3s5HvMAIyqb5/FyB4DXIYO1z3YJFBp84ofgluVhvK83XeSOEBkFWnoEQcd1WJK7kQRGGt2Nc2P/664TPrdAazyV0Lc5AdlqRmj/3MM68XwkZjRzEYfoQ9MBkAOOvzNDhDT5v3j/3zO/jMEpE92KFj3SLAXDe6IK0putp64gnTODSJuTwrTK+t/HtXxLwEHL+PCkq/Bpyc2OK+xZgyGJ9kA9U7Hn86IJ5FCXg5wdl0fYBrxOpWSRDAKJAIwsBgmzgfQdi9eruJB2JIRh0rkOY7UuVyWuS+rR7HFAQMxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QvamFQ5eV+yr43xoo5z3AO95niQk382iyecJEZRbPE8=;
 b=lCGnTfPsqKYWFqgr6nyjNxKsDY4VMS9I4ygbDFwDFJ6FlCay8KVgd0wis4qjGSzx+giciMh/NNFEJSt4xBtqy0GNHe4fsPEDXsUPja5q5u7ICY6ozXTPaog8UPaFvBZbj3+YSLlil1AcNFJXSCVWYVQ4kpAjIwrPdCy0pvEMo6jphHm5gjOij6Yp6m2zdKqpr1e+bljUZfyGKhqYh9E05oQLfw/xBNkNjxcTu8eqSVDHXxzimGJ/zdY9sfRxxunt0y/ktMJ/ko0yRBY3AqIfjY/4gxITPpV7/UumEYzsFixDEqSANWqVBAdMJHDvIVK29uwxXNdTUod1VANopmsIjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QvamFQ5eV+yr43xoo5z3AO95niQk382iyecJEZRbPE8=;
 b=oJI9IHb/P5d1v+FLEQcyzY28q75a4pVViF5mHECbd0xfpVzEcfJD3UAeTnqcsWjI639QzpbB1MyPiYYEK57E3xRrBd6tdk33rpHRAPJBqawv27bc8wDtTrbzgEv5uTMKW//r7c4b9C/ieAfllPR2xvKoFrRenwtljTdU2mm201M=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <222bf600-e950-45e6-baba-999751da36d2@amd.com>
Date: Mon, 23 Nov 2026 09:32:22 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: vpl011: reserve the virq before setting up the
 backend
To: Stefano Stabellini <stefano.stabellini@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20261119213722.4174845-1-stefano.stabellini@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20261119213722.4174845-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00016D48:EE_|PH7PR12MB9127:EE_
X-MS-Office365-Filtering-Correlation-Id: 5262a955-e30f-4e25-1e94-08df493c4d49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|261026140227099003|261026121527099003|261022105027099003|261028144727099003|11063799006|10067099003|56012099006|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	41u2B/Pg39tX0ctlQS+bujx9Z4GRksV0ssuMOf6CjHOft8p3+jVobHbp44CXujWg/5t0islcfwkKW1wZLqIjymRjaBMYZgnO346fHQmBwIj/w/kEVhZa2PT2TC88wiFhy5nE67an2kbxYHiQp76W6ljEgW5KaRioq2uqywu4smljOJJ1/CG7wSR1s2qZwJza75BvK+fWJHhwiK+XWzpkdiu89lBli31FemAsGbw4ipdqytgF2r8cSSzzmCcWp+z6APf8jqMoCETw3Mr/Uzn6iU62FlmIpnk75i8bJ6oUgZdfiFxXvgjfWUvc4nvcty6siCd5sURZDpuznOLwXMcHuQdD6Zzf5qI0OiF/y7vC0lQyQfTIhTKNK+Ieg/SExDnoJTQQdQsB8WNwFDvCHk2plkFeiXAwgCV396dBK3o5uezJS64HWT/gnYLa2OdvlJ1qL9h33pOctkkbLeZYUL/pfLGLVpHAxoas7UTXaQwui3xDy+WZnXbAwhCV0yqbFH29PHbS6wBRRUlwuEQQ5mrAz/vFxVSNP0KjWWByfrCB5eqqje+3LDCWnuRvW73qvaOWDbDsCfb6yt7bhOl7JBWINnTaFF7dEp/nmcy1ugyjnWJFvw7gYcaQrBlwkN6ZGNWWBaWYJsHqdR8xmn9J6aTOCa5ISUDH8TjXqljxWxzJrmJdEqt1hFckGMjuv3gTp+8lnMmZzxywCQgC05L6JZrCHA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(261026140227099003)(261026121527099003)(261022105027099003)(261028144727099003)(11063799006)(10067099003)(56012099006)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+1rZ90tlkp3nel6rx6HSsPRREbje0ETbSxEyRgiYDzcGi+6XFr3jYms3tQb6gqFXBw3Pb1+0i4ZtoBti4CvCD9hSlqcMAMBvAGO+MuuOijwTN0IZUfKj7BEiBiJS11r7vvDvFzHcEV8O8DOTI6IA0VGYByUwBUeewoyAo/Zvodos7KkjxG50y/tOfvsZd6E3duydMqEsOPE4naSesGm/6Vol6/45lCLpu4a+JuD3vJTdCdr+8Oso0mm91TCaLxJ6pEHz4gnUdFVoSWH7JN3looUj+oSW51MJ7k7tOiuCXXFByOXsZs9D9seNTrS+2IY/kAzNNEUoUw2/zEsKlet0TdT60A7Faw1S66caF1lyo1wrjkRo1oyOTQAjt/CszT8UxTIPHYuIEQepDu65MYHpmYQy1rbxSLPlf6FMaAR01rSkBS53NglS45klp7FzMXiD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 08:32:25.2835
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5262a955-e30f-4e25-1e94-08df493c4d49
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00016D48.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9127
X-purgate-ID: tlsNG-4011c0/1795422751-51EC2CFC-316875C9/0/0
X-purgate-type: clean
X-purgate-size: 1569
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 19-Nov-26 22:37, Stefano Stabellini wrote:
> domain_vpl011_init() allocates the backend event channel before it
> reserves the virq and records it in vpl011->virq. A notification sent
> on that port in between runs vpl011_update_interrupt_status() with
> vpl011->virq still 0. With CONFIG_NEW_VGIC this calls
> vgic_inject_irq(d, NULL, 0, ...), and vgic_get_irq() dereferences the
> NULL vcpu to look up the private interrupt 0. The same notification
> also takes vpl011->lock and updates vpl011->uartfr before either is
> initialised, and both are then reset under it.
I struggle to understand how this could work in practice (in theory, yes). The
evtchn port is returned by the hypercall which at this point has not yet
returned to the caller. So the caller (console domain) would need to predicate
the port that Xen is going to return and send something on that port via a
different pCPU. xenconsoled never does that which is worth saying in the commit msg.

> 
> Reserve and record the virq, set the initial flags and initialise the
> lock first, before any backend is set up, so that they are valid by the
> time the event channel exists. All the failures after the reservation
> now go through domain_vpl011_deinit(), which releases the virq.
> 
> Fixes: ca0637a147af ("xen/arm: vpl011: Add SBSA UART emulation in Xen")
> Fixes: 85da01b71312 ("xen/arm: vpl011: record the virq only once it is reserved")
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


