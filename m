Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9032A606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=GcKbeH+V;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=UgCjhk3P;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=lnm1xY69;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=EJ4WWZCy
Received: from list by lists.xenproject.org with outflank-mailman.1473363.1680990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmOy-0007N1-6V; Thu, 05 Nov 2026 01:36:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473363.1680990; Thu, 05 Nov 2026 01:36:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmOy-0007Mu-3o; Thu, 05 Nov 2026 01:36:28 +0000
Received: by outflank-mailman (input) for mailman id 1473363;
 Thu, 05 Nov 2026 01:36:26 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmOw-0007LM-HK
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:36:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmOv-00G6iA-UK
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:36:25 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd50-8faa-0a2a0a5109dd-0a2a450ba0fe-26
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:36:25 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd98-b7e8-0a2a450b0019-94a38ff1f396-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:36:25 +0100
Received: from pps.filterd (m0367127.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mst1226770
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:36:24 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com
 (mail-eastus2azon11010034.outbound.protection.outlook.com [52.101.56.34])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hrfaurc6p-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:36:24 +0000 (GMT)
Received: from SJ0PR03CA0243.namprd03.prod.outlook.com (2603:10b6:a03:3a0::8)
 by DSVPR16MB680370.namprd16.prod.outlook.com (2603:10b6:8:379::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:34:50 +0000
Received: from EA8PEPF0000000A.namprd05.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::61) by SJ0PR03CA0243.outlook.office365.com
 (2603:10b6:a03:3a0::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:34:49 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 EA8PEPF0000000A.mail.protection.outlook.com (10.167.249.233) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:34:49 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mcdn2969017
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:34:49 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hnxs4nrkt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:34:48 -0500 (EST)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id OmNKxwii4DnFpOmNLx5hXl; Thu, 05 Nov 2026 01:34:47 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=XKf
	hXQ94ZWYPTs798CJgynYPHUJjbi7rDBAXa8MZb4g=; b=GcKbeH+V8JRXHcERpPY
	E6VcFtSBFkAHEcn6nr0aqb56vjrJlaOqYjd8Omjeto7tQneiUuB7zFOVo9hTp5Sw
	Y9fpk5S/wxP52ltg2v0tXA33tumrHmAEy7nFbK+mHTqyq2GYFTTiHqjOtbcNeDGP
	ZHSGPpz2QqXp6vhGYRahdEalL3DDHDSWS7Ku9gl8sBzZ8ySqFQDgXfR8uHKlAN7S
	uOYwjcnXsugO+GlHyYu4KYYjtrQRgtce/G9FNUB0C5ligIS8zB0hfXhNcOtxSygK
	u1am+iAgeRc9Ezq5r49kGT2gGrjqR4B9nQudOBVALFctxiuvkw7StQoIJk1wkoTX
	zYQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iq43u5c8VXCBRzmiy4MOH4Dh0qSn1fN9efsGm5RnyhJZa0ajUJj8R1Z3AVr8/SfS4sRM9NxbHugS90kR0bjrx7D9LCeWQFiNJT+Sch8m5nuz3FqKvEuDg5bG3hMNXJRBcFa5SdiA+nG0AqdOe0jT3+1693WvtCa/PiJds+GOA3SRG55gK5K26cArMWpxPSJHIpYZ2+6wLyjOYAOG71VjRmT+ZX23jmy1RO/v5dJb1J5LbHp8eNiN+MRUnFom62sm1h+GsVUu9VoP20FDWaWR6oxwAPhdRW3n2PiaGuUU48/03qilLB/4kwJT6S5Vk2r/QT1kloX28wfno/UrPyuwTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XKfhXQ94ZWYPTs798CJgynYPHUJjbi7rDBAXa8MZb4g=;
 b=zEWeiWOF+I1vGFpsmd8LO2/yyZyJ4Dq2y8T0vW7OliqqPG5D+jHk8SgWEEZeTu1ulsF5J9rYSy/jedzy5EeQ8+t/8Wy5JUUMpHxFeltY+6glkvWpEoVdAe3ZxxJp2pxJPJ5TMzkEnhm2e5VXEH6rtWFE4VqgGMbk2ocIfTF/zr8EuA9MdybJCJ3ScqC2cG2Il/5uGUiwntjoE2QOSV61fWU4GxWiQ85IKegasOaVpjoHNOC1Nh6IhTLYf8+5k9yuyD8CnmhW3G4RzBy+5h8mAxaWuT/16XahhbhreKkdQRQ5CZwRKfuiDKrBlH9ffVKFBnvAfRJkmJcvruvZ+615xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XKfhXQ94ZWYPTs798CJgynYPHUJjbi7rDBAXa8MZb4g=;
 b=UgCjhk3P/Jyv1F9KvM4cGs6x4cVmfEzJOY25ZKJzLDFkRiaQQdViIEsgWF+gF2mhk70C3waPCNojpstTtZG6SWElMlealCzXE7DcJ160Uinvbl3C0cL9EEvRlMC8nCcr4P0UWcYL+W+9PdwgQiNoAoOKjy0T9cjTY1J68LFJ/nY=
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
	ppserprodsaar; bh=XKfhXQ94ZWYPTs798CJgynYPHUJjbi7rDBAXa8MZb4g=; b=
	lnm1xY69iXrgRul1zN7l4T9VxDXhLmXhEmEjokyx6pm+70pTNPp3KDyGInRlPCYm
	DQXcF4/xDkPNDOWYF73i+95mTiqy0aUzTTNGkvtkvdrZe1jvZtKFk9Cw4NIC4ifD
	PjgMPuqd+A3DGO5F+wX/GjLRrKHTHXzIhOZeSKy5ojWaj+7jo1eideeueQDVU4mP
	j3QiBu9J9ViQ8ira0LQLAHFYTBB41i0PHQXeNEXyPHd0UbLQaVhcqVl+RFZQg/wQ
	QSFzI+gJmZLlqwRnLloI2fI941L5VqxYR9HDExAEjz08Hrr+AyIeFvxZ1LCtGw+M
	YdCLZW7JnzAQHA+6K+IWpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=XKfhXQ9
	4ZWYPTs798CJgynYPHUJjbi7rDBAXa8MZb4g=; b=EJ4WWZCyXG6gg0Z99ENQ7Ie
	Nrt7gNgMcWUiEVEGBm22XykLNsXpQB66LKMAZV8PgkKkb8vupNr2etK3u/ogAxH8
	h/tbH3reySeiRyfFlgRaalVTyD+xE0YxLx7rbtExdrGhyoFbv+iY7aPTNY8CWAa7
	/uQ0pdVdo1f8By3M2qyyqUOzO3QecGcrqhijG/V8RZPrZUSUgiJDehhzFqTK6mP8
	NT3Gb+4NdWq5F7vKzihvkS55kXsKghIz8nXXjAonkXRfBdK6x/4N3xFRZHhfLrAO
	63aYsG5LGvnTQLClZ1Ucco/UD6x3bbzbU0hb45aHGldDKQQx2bHtRcZE1MlolRg=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmNKxwii4DnFpOmNLx5hXl
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
        roger@xenproject.org, teddy.astie@vates.tech, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 16/28] x86/hvm: move VINTR disable to svm_clear_intr_window()
Date: Wed,  4 Nov 2026 17:33:33 -0800
Message-ID: <20261105013347.719392-17-dmukhin@ford.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105013347.719392-1-dmukhin@ford.com>
References: <20261105013347.719392-1-dmukhin@ford.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050005
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: EA8PEPF0000000A:EE_|DSVPR16MB680370:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b448ca5c-7b62-4378-fcc6-08df3adcfb90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|10067099003|18002099003|22082099003|11063799006|261022075727099003|261102123227099003|261021121427099003|261026121527099003|261021123027099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Uw60AXoffS867QTw2gXkA0JLDd3Jj3vH/dOazAypFHKD4u/veoNfV3NvaxCBg8npYauMNtcqQMX7bLFGyFSSdl4ppXiLX7OPoNbuUVcsQ9qNyx0zHknVBxrZGdwogkI13cXfiP4vttCv28S1k1WZywvgklsUQAEVZ6ax9SfqA4Pq0VQ+6CVhPQkpc5Df8bSIgjQdYIH9Wk4YOq0UWA8fP8IgfqkQO/7USQKw32KV7cLoyNxASz6WCWUn1w1rvqAUexcL4R7dQkIr2HZGccMRN6tWPoWHnb+249znbjQnsCJdvVlitF2teC0R51KOAVWn+EDGseiNsVxE+aSdrerA4QO9e9HJhs4G8eULXLWxluc7OuZku05TkfMGRJGNrLu7zEGc50NMXt8xXij0Ab8VcjabgQg1Eph7Ez3bXAOvqLtxQt7rPCsUe+erQ4Fm9LNIqs0/2gubha72OPAgXPCYedqXY5hQI1M7bdeRXx18pZQG03HQXjVVx7iI6LPbhnNuB49aH6bHebu2Mil+rfQ8OajBpqyKtlwBHJjYTR56FHOwrG3U+/Ieue2NIlZXtOcYWAGs7oJVTW9ILlZorGY5sGxoAB/lf/A+AlETzMnLQ2qIhFhHEQlVQ+0RbQ9pddKIGBbOerKmCR3cNLOAiN3llODwQKioV7XWU6AplskbSxFFi7M4Y/D7BPd5twu30vuJtMBkK9K3Kp6FPqy+h+riFA==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(10067099003)(18002099003)(22082099003)(11063799006)(261022075727099003)(261102123227099003)(261021121427099003)(261026121527099003)(261021123027099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TAPulE8rXZDOz4jA1G9pHeIHczxyX4P69UCCSxgPabSu19nZ5W0KG+q+BBatK6kgfhneqHWlc2TK+C1YV1ZNbIdzu0eIL414oGqITtRGbr+hF10ZBNq0/qJrgar3ldoebPK2vmD8CUNKteVcd7/7VASjh4U20Z67EJ+jAfsB5RMEi9vhZYTctMzCn996IH9Tud3AoNlqF2Hu/RBX3ahv8q93RfstgeLjkgt6EVq0ADsjDpH6r8jRPrO2x0zZ41QIawQcQmH+oUU4zcqeiDO0T/DczFOkB4UYX9vNezeqE9MG2M7VpIbn9dsdNdZwycZ2qDOrSdfMAki3ZnocbJGVIaQZHudlKs9+0DqCmmloO4ibtiQgUS/e9xp88d8pxscK7aGa1GdbK9oU7oLSGxoreKndHFAy+jnXkZT2J8c51jNnZHe4fK952ZTAoqqv2+r0
X-Exchange-RoutingPolicyChecked:
	gLAi5Q/1by0K5/zD2QRIt98ydGbEJQAHmuANtGr+fbeBRAwoWlSxgyt6tSYfIh05GtX7Es32RpHlt8u2jQZAf7D6jXZ2UuPE9pZmiLklEPjmBcxH/pF2OG6Z1vcicN0TkipPE7PPR7ppXrdo05WBmeE5m7EE/l63JTGw4dVWV77pWGAL6YHCHDzkdvCm7WY6R6d2uhzZ1ybHyoHmCL+Ffj6+WTN6Hd2NF5ah5618XlB6NfqyZahpP6OGajfZi3S0LVeykdMOFlj3Et49s8LD0d35Sik45FKWg2F6xFp/JcBre0y5fe0sQwrdhuwmqfNwWoZvdeCE3g1OD0NjsOjcEA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+MZNtWN9ts4vFtw13UORMcCF3jibMhiCdQPkv2L8P0PxjOe2Vk1mvnL/ZjwF06mzqyNBvbwWNCmwUsZAgwBtx/xbSF0oxz6tVVSWH1xxaTnjyLqO8kv8aSOO2OyUnNUnDee+rdyiNR24Rs5QjZ/tIIc7mwVV52s1pSZ1uSpzFxoLwpeFa0DAfLx63kEmk+MsHqf+c6KjUBdUiIiXUVDvSGIjTCYUmC0exrTAlPg9BryFPS6NfntCH24s7x07O+Tag6La3fgM49blkT6YtkhxSlbG/Ioio1EC/z/HXuldvdNZuFbx6nMKW8w0wGgv3vybtu2xUOMRhhUr6iPLvnob/sdlcwxvCGgXdbNCfseolAZ7GdfUDQ0Yb/wTYUUIkQekPmYD/GaXWPYQJCq3Yo5P/7PKpJVezpHhqSGAewwcMj0zrhgyHaklaPKcyB86J3jgcjpL+AQ8s7kdkM6xssrTvxJSKRGjpR9fAZG7xzLibfbDO6S812T3FKFnhDm9UJn0rNQVZFyOspDYQVtqSCC04fJYfXiWopdkhIsgKeQR2ki8f//IfBSEP2xs70SVpWsBg3dZQeNpksOti0QPdG48BqXBE88Wk6kRBqi3lErf9r0V55I2JJCSg9Bucd8b8b0tGru0cJQzm8yOsIfXw7E/vg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:34:49.6392
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b448ca5c-7b62-4378-fcc6-08df3adcfb90
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	EA8PEPF0000000A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR16MB680370
X-Proofpoint-GUID: 0-2xOImOvIPKZchs2U8nFSFeWZIjo6gu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfX7snwec6XfiQw
 8587LOoseSYBt1NgoRqI5fZkq2jFtMlCIH06Ptgo/3XbCjgO3KiQlQkU+eFTCULgtK/2iMtFETp
 ddhpHpccM9JiZdUFHlO7FswiFTQttqIxVLXP1JhY8I8TlCssMI7x
X-Proofpoint-ORIG-GUID: 0-2xOImOvIPKZchs2U8nFSFeWZIjo6gu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfXwYxDr9hld9Pk
 Wl74FjawC5CfmpeJpVpSXjEBdj9DAhLWXazfbk5KwqFcHNSsasCvj4d76/pxNZo9V9L7bSZhF5S
 ZN9AvZsxoXUkrt0w54Qg7XgtMPc9v5XbsfdTpV4bLbjnonqDUFOiwsKsJunF1Qwr8Ee11YDDpFz
 bNDpz2SCL3ee6uZNmRIYdwTfKf7wjWiFJH34uY7Yfhn+ptYjvxMjcBaJu6nq+zml8VFTDy5VwG6
 Sz9ikdtOGBlQM9jdQ8PZ+kQPyBUwh8e0I+pgSlym0NxpzL8Nivd9mdOIr8NkXrY7sTVtx+t+Le9
 JYkJAzRcuxbOEXyBZEH4L8CEJROsQdAChq89vO7bakdpD/KoGIKaZmqT3Hg49zBPOZ0sWvp/ZuG
 64Q6MngTlmmKUBBFAnVVWAbMSbpEBQkcCV2KVkYUVvE5IFHv3C1Ma7fnPuWFnTUmSAPsJbD15YI
 w92WAKiBmEdTzi9hFiw==
X-Authority-Analysis: v=2.4 cv=ScVi5fRu c=1 sm=1 tr=0 ts=6aebdd98 cx=c_pps
 a=KX2Ufr5/9I0VBrHrQzOW6Q==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=dw5MciS7gY-znkhJuOLE:22 a=cbNQJ9GKAAAA:8
 a=07a2wwpM4XN4qWhE_GkA:9 a=G69WFyCBNqGPyalROSdv:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050005
X-purgate-ID: tlsNG-42698a/1793842585-AA6DA9EA-EE74A898/0/0
X-purgate-type: clean
X-purgate-size: 3556
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Wrap duplicate code for disabling VINTR into svm_clear_intr_window().

Not a functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/hvm/svm/intr.c      | 13 +++++++++++++
 xen/arch/x86/hvm/svm/nestedsvm.c |  9 +--------
 xen/arch/x86/hvm/svm/svm.c       | 11 +----------
 xen/arch/x86/hvm/svm/svm.h       |  2 ++
 4 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index 2224f1834741..1d39f25e5209 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -238,6 +238,19 @@ void asmlinkage svm_intr_assist(void)
         svm_enable_intr_window(v, intack);
 }
 
+void svm_clear_intr_window(struct vcpu *v)
+{
+    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    uint32_t general1_intercepts = vmcb_get_general1_intercepts(vmcb);
+    vintr_t intr = vmcb_get_vintr(vmcb);
+
+    intr.fields.irq = 0;
+    general1_intercepts &= ~GENERAL1_INTERCEPT_VINTR;
+
+    vmcb_set_vintr(vmcb, intr);
+    vmcb_set_general1_intercepts(vmcb, general1_intercepts);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index d970869cfd96..c7fde48d5281 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -1491,10 +1491,7 @@ void svm_vmexit_do_stgi(struct cpu_user_regs *regs, struct vcpu *v)
 
 void svm_vmexit_do_clgi(struct cpu_user_regs *regs, struct vcpu *v)
 {
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     unsigned int inst_len;
-    uint32_t general1_intercepts = vmcb_get_general1_intercepts(vmcb);
-    vintr_t intr;
 
     if ( !nsvm_efer_svm_enabled(v) )
     {
@@ -1508,11 +1505,7 @@ void svm_vmexit_do_clgi(struct cpu_user_regs *regs, struct vcpu *v)
     vcpu_nestedsvm(v).ns_gif = 0;
 
     /* After a CLGI no interrupts should come */
-    intr = vmcb_get_vintr(vmcb);
-    intr.fields.irq = 0;
-    general1_intercepts &= ~GENERAL1_INTERCEPT_VINTR;
-    vmcb_set_vintr(vmcb, intr);
-    vmcb_set_general1_intercepts(vmcb, general1_intercepts);
+    svm_clear_intr_window(v);
 
     __update_guest_eip(regs, inst_len);
 }
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 14a86ca4ff8f..d1a95e441f03 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2813,17 +2813,8 @@ void asmlinkage svm_vmexit_handler(void)
         break;
 
     case VMEXIT_VINTR:
-    {
-        u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
-        intr = vmcb_get_vintr(vmcb);
-
-        intr.fields.irq = 0;
-        general1_intercepts &= ~GENERAL1_INTERCEPT_VINTR;
-
-        vmcb_set_vintr(vmcb, intr);
-        vmcb_set_general1_intercepts(vmcb, general1_intercepts);
+        svm_clear_intr_window(v);
         break;
-    }
 
     case VMEXIT_INVD:
     case VMEXIT_WBINVD:
diff --git a/xen/arch/x86/hvm/svm/svm.h b/xen/arch/x86/hvm/svm/svm.h
index cfa411ad5ae1..0dd5ee78fce3 100644
--- a/xen/arch/x86/hvm/svm/svm.h
+++ b/xen/arch/x86/hvm/svm/svm.h
@@ -21,6 +21,8 @@ void svm_asid_handle_vmrun(void);
 unsigned long *svm_msrbit(unsigned long *msr_bitmap, uint32_t msr);
 void __update_guest_eip(struct cpu_user_regs *regs, unsigned int inst_len);
 
+void svm_clear_intr_window(struct vcpu *v);
+
 static inline void svm_vmload_pa(paddr_t vmcb)
 {
     asm volatile ( "vmload" :: "a" (vmcb) : "memory" );
-- 
2.55.0


