Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A5C606A321
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 19:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=SRX6vftS;
	dkim=pass (1024-bit key) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=R5JUo0mv;
	dkim=pass (2048-bit key) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=Ff8wwryZ;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=WQd3J5BV
Received: from list by lists.xenproject.org with outflank-mailman.1484718.1688054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREJ2-0007LO-Dw; Wed, 11 Nov 2026 19:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484718.1688054; Wed, 11 Nov 2026 19:48:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREJ2-0007LF-Aj; Wed, 11 Nov 2026 19:48:28 +0000
Received: by outflank-mailman (input) for mailman id 1484718;
 Wed, 11 Nov 2026 19:48:26 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xREJ0-0007Jj-9f
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 19:48:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xREIz-00F4YV-Mv
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 20:48:25 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c675-bab6-0a2a0a5309dd-0a2a450bafd4-48
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:48:25 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c688-b7e8-0a2a450b0019-94a38ff1a58a-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:48:25 +0100
Received: from pps.filterd (m0482515.ppops.net [127.0.0.1])
 by m0482515.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6ABIYnMd2560927
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 11:48:24 -0800
Received: from sj2pr03cu001.outbound.protection.outlook.com
 (mail-westusazon11012053.outbound.protection.outlook.com [52.101.43.53])
 by m0482515.ppops.net (PPS) with ESMTPS id 4hvsk0ub4c-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 11:48:23 -0800 (PST)
Received: from PH1PEPF00013301.namprd07.prod.outlook.com (2603:10b6:518:1::f)
 by SA1PR16MB5529.namprd16.prod.outlook.com (2603:10b6:806:38a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 19:48:14 +0000
Received: from CY8PEPF00000057.namprd21.prod.outlook.com
 (2a01:111:f403:c802::1) by PH1PEPF00013301.outlook.office365.com
 (2603:1036:903:47::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 19:48:14 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 CY8PEPF00000057.mail.protection.outlook.com (10.167.247.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.0
 via Frontend Transport; Wed, 11 Nov 2026 19:48:13 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIXNGL075533
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:13 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4htkwgn2eu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:12 -0500 (EST)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id REIkx9ZLuRja9REIlxrBuX; Wed, 11 Nov 2026 19:48:12 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=GCd
	cpRKfng5NqWi47RY2qXlB10LewFmSe+7wUDTvaFc=; b=SRX6vftSsZyBdW6w8Fs
	vevj9r23pb7kISFjfjIlEBgi9TH9uco9aWTdoFnNcN8ye/l/A86YeivAj9fFMmQ5
	kIptkfiXfvn2/4M1sCusOX76TmJPkDcIdISE3T3QDOK2rcUsdpdO6x/qUOp4bpgQ
	B/yHiICU4MALM+u6bXrvzMSflGAXHQJ8DB4chwR4Qb2sfyCJAJUjezf/U30XedR+
	Xd6/09LQo0GE7ypNc7UR2DR87lQPq+hn2DL7N6b7G3E1WtI2BlWiJUOFbl8iCdhb
	tQvnU6AmjxZUbQsvC9SB9O7bBjMeSN7AIYvDJyUwP/UTcyO29SqFoK+42xzxUsjq
	4Ow==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q0bqQWLWgPucs64eOGcI5UvxbzY9rWQeVJKtcSD8vwTU1wq5/YXBxFE0k9ieRz/w0gJnAiLSLZ0CREC+dvtPGz/sAxsecmQqdD5PBQdqBNhqWbpF38XiXVKREWIYfVHRoLArB3QIiETRsv6V0UwrDKprYzQkwlV2P4gz9jOd5eU6+MczZOn4zj4OXXuETezvix1YbriUlrv3WIAXcptWNOhdqY9fhIOThlVZzf2W9RJMVmgCj1jYP44Z7qAZTRoQK+y4ieutqE/iW8idFnE1zfbjJD3slCnqd3gOLB+sK3P+d1YmrRgyzXRWIBFyzBlfr4ERsVFEhCKApLHtId6uyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GCdcpRKfng5NqWi47RY2qXlB10LewFmSe+7wUDTvaFc=;
 b=vh2qUKw5A9NOMvE7X6g0OSJkPoj3P3cawyhycpm5P5nREHOZBXQRal8P6wH6XxjttdoH1EDD9LICiIW4i84qpdr8nKrRTkQyxsqO8vnRUDRIVSjKh7/pl9Qom+VPKNJAOdGF2EteGI9cKdoJsxtUxCHNd0+ke2aya6MqPb5OiVxRHphV0dsVJcH+tg3Onis68dk1do9wtkc+Q4CrKnHiEoaomg5j4678phW5P/OL3FTiNVGlMLiNauEmqMdkBqDSzIF+vKXSCalE/GVGOv0P7jUxSoAZYRlZ9qkCwupoYp9dkoSauqevCE19TNpMgBTAweQZMh2KhUno4freemYv0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GCdcpRKfng5NqWi47RY2qXlB10LewFmSe+7wUDTvaFc=;
 b=R5JUo0mvynR+v6Zyq0gzarqLC78mezINTLTHRM9bFnzGaqoheKuo4OD4SUts7EzDwDZyT3Pc2YWT3PYbDwlx3rNikM+926N9F/xNlkNzMgNg/oJHMC800SPpi4OsEgOPl2hfViSaDJBMMv8J6ZK+lqZs8KZ8KyG1jmo9QnmzSuE=
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
	ppserprodsaar; bh=GCdcpRKfng5NqWi47RY2qXlB10LewFmSe+7wUDTvaFc=; b=
	Ff8wwryZw64w6FD7DlM7D4noPq9gVgB3W608Ko/ohr/wgEu6pNobicOOkgJvPLfH
	I7jEZe9n1HGOZ2IJeuWN8UJMWfk5oOaw6QqkhqDbqfAAibiXuz7fzKzSFjdESs4k
	zF8/GPzXJ7g0ySgiYxUwvv7NHmnDyv4TXp0KoDYyq5edEsVXFZZCnDI4GkAjDeN0
	faLc9w9nWQRCMbe5f0lRgjxqNszlPwnCW2p0FqPcxH1MgehcfKYjU2GKJFstbPUd
	6LQ8mEKZbBXFQMWVtacxdajs/8haPMWRx1LU95y+HMpqSzfQe4+DHILA6iLlGu4T
	TxSFWL5Si5rCgzuo5ndnwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=GCdcpRK
	fng5NqWi47RY2qXlB10LewFmSe+7wUDTvaFc=; b=WQd3J5BVh5Dxne5O0G6fat4
	DSmgy/dkbrJqCGJCI0QIdbTPd/uKv6Jp/7V1Q1IiV2i2e2NjAcLMiGV0lGMj6tZ/
	qxzO7gcz5Hc4D9e5jMwMrLw1vmAkYToTfVQ8OSeInqEluaOQhsKBumhGCo/U8xcW
	ji86neVuCI8Xe66cgGImP7PgJJfjHCEHmuLpf4IvTT3WnBlVUR6gg2CundqPf7Z9
	4ckYQF/IiQZApSm0ACidMZE4haXzIlkf5wVDuFjuOGQNpgxgVPI5IO3TUPF393EJ
	w8Yt3mJ8Y8rTz7S85RV96IdB2Vm4DrJrN3VxTMVUhZAWWYx9SR+m9lUJcfOVtTw=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: REIkx9ZLuRja9REIlxrBuX
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v8 02/26] xen/8250-uart: update definitions
Date: Wed, 11 Nov 2026 11:47:36 -0800
Message-ID: <20261111194800.1070016-3-dmukhin@ford.com>
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
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2611040001 definitions=main-2611110078
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PEPF00000057:EE_|SA1PR16MB5529:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1fa8caa5-1d38-4cc8-534e-08df402cb92a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|11063799006|10086099003|56012099006|18002099003|22082099003|6133799003|13003099007|10067099003|261009223027099003|261021123027099003|261028144727099003|261102123227099003|261022075727099003|261026140227099003|261022105027099003|3023799007|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	Q6pAbzTyecPrWr7cN3tyanCGU6r9Zmn+SJ9d3nuVUC1ZVOBm0iYQFKeRs2ZKkfZBnBA35Pi+SB6xZpKqL2Kl3OMNuxXmyOcJ11MCxOodO87N+KnvyaFEEO0YAibg31DOZLMjAaneo0DmR5vrZWwRf+f85DJ6YufJZQPb6wrp2km9bK1sDcih+1OY+Jy5TO66B3As8mSTfiXw9kj3m7WGd23fwBv5EvDkxrkc5SbVy8+BVxB5Iq5ONCi7TeBjNK+deSjtuHkoot6T8Y/p3b7AP0fcbPyXpHcazAKLrK64SR7rmt0ZlHnyfhiXCRq4gw2dPvm+DrGIBjJP6JZy6Okjotm7pePqgS4M2F90anH8El0clk5KXOCdO3zoibKQ8jQ0jKxhEHtk3lfkVFTupOHLMrZZiz58PZvFagnrAADsAuWqHn6tR8Af1uIXukD1EGVhR7WzoDQpDXMTWJCZvrE3/GUO3yDGDkmHVUKxOSY+vJaRt7tOcOiPzsvQ6HCqtYec/SBdLj3hKAXbuQDLEXliZBWYOpYQ/HieB5DP5ZhXT4hFXdhYiu+W5FlwypXCXC+GplIzgBb0YEEhfBGQg8FIMfxDbOkH3PcmESboEAYVLlV4P/fammjy0hwWzYStzDZx+T7Top1v3rSlFHyfo5osv5AH+SAdINVsJzGEnnKxNhA=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(11063799006)(10086099003)(56012099006)(18002099003)(22082099003)(6133799003)(13003099007)(10067099003)(261009223027099003)(261021123027099003)(261028144727099003)(261102123227099003)(261022075727099003)(261026140227099003)(261022105027099003)(3023799007)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	q6PoZjDr44d/ZH7aYLWpasPjRCZafK+IUMq0Ez0fSBaIYAQ+bFCbEnfbtlPnUE/SRFb6bGpl5ykrEth3r1yi2z8CotbFQBs+J0cW+rnrt7bXDV1RfSKE4xM+orrcRyrjdgM6Msx4cComwq7FK4Sv17NO1vqZ+eGSsjaeZih3OBCUDNELcSLOhBy519x9THN0wLlCwatYbrpEFGytpnYkFayLYSn8YAmVshfX/Ik+x3TbRO705SHBNjrYE9ph95HilQdpgwdgO33RJmmLPJz+MVf4mQsvrFEUeg/RN1vzy71RWnQbsp3lJOkwUwrmieUnUc7q6CvqJSloTJMiAhjND0V2ADIBWJA09q32GGD4hMOaHfyQsRS0OgJ7M8r3TDz0gv5h3fo/HiWaHXPBD61dukJ4+x4d9KLQJtP922/LtpNiq+WkeJvEuuC2PAIeWZY9
X-Exchange-RoutingPolicyChecked:
	fmXlhTA9E7MeWLzn0yL4iZMFPFB3EYsJo6LEWdUYqhcvMJv0DL4Z4969qlws8KG4CvRFegUJP7ts6p4Zqb9CKDWjI77hU6gLSWc215rRjkatUZ9Odvmu1khPuvWdHD/Lydq0LGa1MsthJlDi85yWhDYBtFZZEQAOVBobALj/tk4h4rqY2N3xrXajO78wi6bZS4JRXHfofJsI5LYqVBVSjl8CNGyD5aj7yZK+4eO4Qq/v5ins8296WC0YoDtxgyPyZqeubLh3sLrj8aOcTLMFV4GoqIz5i44MpP+IC0ai5/4XFq4gYuAlbkFquM1eWFtlok2Q3QlBWkJvqK+emZsaQA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VkyJt7OOg7YW+/ac342VUTVzaxJqIcdgBQaM0tthAk2PdkGSmxfcyToa5A2gjCeAVz+zzKOJNlhsz0zYkcWYximrizTfQqeGm+6dgaspOw2gYbGuPOXro9eH70cHMBGmf1lNvrDE+zjuH5ZSOF12d34Y12QEm1XZ44lDZjWFeEj48WOZTKxiYpiRqLdRwRidgckaCISfBjHkwi+vowa6zNa5o/WtFq4XcKjr66jYUw8FTNf/05ZLn+mhpIgpZN5dSkHIFZ9WiRUFI10NIoG8oqaUJEdtdYmvr1QuZ3X4XjQIQ7+6IhKrvPjOnfOSwE10z13UxnCuGVW1uvXen/qoJqO71tAoEB54b0Qg3gF4rZbzVubT/gbX0MepztX3n+J0hErsZ84+ENNzshZdzPWpIcwBxEDRviYsG/Lp7qREo6BDZRM7NhqQfSKwm+Ck9nXZrvxlgGsiMIlCPk8kAanb1PfbX3DsAYjXJhjsf3YtQQ2Iql2ixAUI0oxGTk+IBOUSHLla/OfzVGDbgqMOmwxvpzc33inLa/o/K2bo6ezoOSoa6CRk7WbzL3e/32c6XgHsQ/HKEn3z+M1Wby1QDN9UNdNA8mCvik4ixoQKC/QhesKYF0G0XvtaMyZu5nee1f2LRauAwerafivDt5FgaNhgRg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:48:13.7259
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa8caa5-1d38-4cc8-534e-08df402cb92a
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY8PEPF00000057.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR16MB5529
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfXziE5276fkfup
 j74ZfNPLDb0ccSXJkHvLGvAQeyuZkv+cZLnknT60siFXvw/D2LMZjg+1p0RBxcv4P1QhsIpZkkt
 ZgImZZ026CIvK2tnHwkpTFM7cIR8vRpdclugCA97OJ+bvRHDHuRE
X-Proofpoint-ORIG-GUID: VLKoOsq6UR9WFc6YTw1ZclfuH9Ahp5xt
X-Authority-Analysis: v=2.4 cv=erVKXYpX c=1 sm=1 tr=0 ts=6af4c687 cx=c_pps
 a=m4QPU8/Yf0DQKtM+qTkXOQ==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=0GA0A_IKJoUHBEAzNTkD:22 a=sozttTNsAAAA:8
 a=cbNQJ9GKAAAA:8 a=J7P7scPm9_EnI4F3st4A:9 a=3whSkbs7g9Me0DR5EJEX:22
 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX+2RzQX5J+tbj
 eJo6LBlnPmkLlPp2wpZ4e1Km5L4oUBfJdUMCBrINIrNs8Ib/5yRO409bbqfeFqBO1QX/ijTbRzL
 NHU/V7GflntalHjtK4dg0htS6XhPvOHhWxLSpxOOw4XStU563OJd9KTueOvrAa+XbWsq1WMYzwf
 OR+/Em3cjbuj/PmjRI19lsurl7jtzdQfjYLbyIUaKCnnDE8gcwa1Teqw5SfdRHqVyraBTba9snF
 wGynN3Y3GYHIxDE457BWnrcUIZupxlj+H/AkHDHW+QFkt/GqiRvVtHKjEB3z3dUNvrgTQx0w/Gs
 APNYuNFvD6NLtUKwIdnRnRI5WvKz+0EnlE/COIvKlgricAJ76cQ3v296c4j66RdqFdaC5407bGG
 PCZXJa+Z4oQtv5mfdiN/l3D2p61f8rVMA1LhPOae91ROOLJAJLs0lRvbYXN/YAItlLef78010sI
 GSP5YvV/yBlXtJ0zt4g==
X-Proofpoint-GUID: VLKoOsq6UR9WFc6YTw1ZclfuH9Ahp5xt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110078
X-purgate-ID: tlsNG-42698a/1794426505-A9CC79EA-6E451A6E/0/0
X-purgate-type: clean
X-purgate-size: 5836
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Added missing definitions needed for NS16550 UART emulator.

Newly introduced MSR definitions re-used in the existing ns16550 driver.

Also, corrected FCR DMA definition bit#3 (0x08) as per:
  https://www.ti.com/lit/ds/symlink/tl16c550c.pdf
See "7.7.2 FIFO Control Register (FCR)".

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/drivers/char/ns16550.c  | 16 ++++++++--------
 xen/include/xen/8250-uart.h | 30 ++++++++++++++++++++++++++++--
 2 files changed, 36 insertions(+), 10 deletions(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index be388c8e6582..4313071e6cfc 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -422,7 +422,7 @@ static void __init cf_check ns16550_init_preirq(struct serial_port *port)
 
     /* Check this really is a 16550+. Otherwise we have no FIFOs. */
     if ( uart->fifo_size <= 1 &&
-         ((ns_read_reg(uart, UART_IIR) & 0xc0) == 0xc0) &&
+         ((ns_read_reg(uart, UART_IIR) & UART_IIR_FE) == UART_IIR_FE) &&
          ((ns_read_reg(uart, UART_FCR) & UART_FCR_TRG14) == UART_FCR_TRG14) )
         uart->fifo_size = 16;
 }
@@ -755,20 +755,20 @@ static int __init check_existence(struct ns16550 *uart)
      * Mask out IER[7:4] bits for test as some UARTs (e.g. TL
      * 16C754B) allow only to modify them if an EFR bit is set.
      */
-    scratch2 = ns_read_reg(uart, UART_IER) & 0x0f;
-    ns_write_reg(uart,UART_IER, 0x0F);
-    scratch3 = ns_read_reg(uart, UART_IER) & 0x0f;
+    scratch2 = ns_read_reg(uart, UART_IER) & UART_IER_ALL_INTR;
+    ns_write_reg(uart, UART_IER, UART_IER_ALL_INTR);
+    scratch3 = ns_read_reg(uart, UART_IER) & UART_IER_ALL_INTR;
     ns_write_reg(uart, UART_IER, scratch);
-    if ( (scratch2 != 0) || (scratch3 != 0x0F) )
+    if ( (scratch2 != 0) || (scratch3 != UART_IER_ALL_INTR) )
         return 0;
 
     /*
      * Check to see if a UART is really there.
      * Use loopback test mode.
      */
-    ns_write_reg(uart, UART_MCR, UART_MCR_LOOP | 0x0A);
-    status = ns_read_reg(uart, UART_MSR) & 0xF0;
-    return (status == 0x90);
+    ns_write_reg(uart, UART_MCR, UART_MCR_LOOP | UART_MCR_RTS | UART_MCR_OUT2);
+    status = ns_read_reg(uart, UART_MSR) & UART_MSR_STATUS;
+    return (status == (UART_MSR_CTS | UART_MSR_DCD));
 }
 
 #ifdef CONFIG_HAS_PCI
diff --git a/xen/include/xen/8250-uart.h b/xen/include/xen/8250-uart.h
index d13352940c13..15cc4be5ff81 100644
--- a/xen/include/xen/8250-uart.h
+++ b/xen/include/xen/8250-uart.h
@@ -32,6 +32,7 @@
 #define UART_MCR          0x04    /* Modem control        */
 #define UART_LSR          0x05    /* line status          */
 #define UART_MSR          0x06    /* Modem status         */
+#define UART_SCR          0x07    /* Scratch pad          */
 #define UART_USR          0x1f    /* Status register (DW) */
 #define UART_DLL          0x00    /* divisor latch (ls) (DLAB=1) */
 #define UART_DLM          0x01    /* divisor latch (ms) (DLAB=1) */
@@ -42,6 +43,8 @@
 #define UART_IER_ETHREI   0x02    /* tx reg. empty        */
 #define UART_IER_ELSI     0x04    /* rx line status       */
 #define UART_IER_EMSI     0x08    /* MODEM status         */
+#define UART_IER_ALL_INTR \
+    (UART_IER_ERDAI | UART_IER_ETHREI | UART_IER_ELSI | UART_IER_EMSI)
 
 /* Interrupt Identification Register */
 #define UART_IIR_NOINT    0x01    /* no interrupt pending */
@@ -51,12 +54,18 @@
 #define UART_IIR_THR      0x02    /*  - tx reg. empty     */
 #define UART_IIR_MSI      0x00    /*  - MODEM status      */
 #define UART_IIR_BSY      0x07    /*  - busy detect (DW) */
+#define UART_IIR_FE       0xc0    /* FIFO enabled (2 bits) */
 
 /* FIFO Control Register */
 #define UART_FCR_ENABLE   0x01    /* enable FIFO          */
 #define UART_FCR_CLRX     0x02    /* clear Rx FIFO        */
 #define UART_FCR_CLTX     0x04    /* clear Tx FIFO        */
-#define UART_FCR_DMA      0x10    /* enter DMA mode       */
+#define UART_FCR_DMA      0x08    /* enter DMA mode       */
+#define UART_FCR_RSRVD0   0x10    /* reserved; always 0   */
+#define UART_FCR_RSRVD1   0x20    /* reserved; always 0   */
+#define UART_FCR_RTB0     0x40    /* receiver trigger bit #0 */
+#define UART_FCR_RTB1     0x80    /* receiver trigger bit #1 */
+
 #define UART_FCR_TRG1     0x00    /* Rx FIFO trig lev 1   */
 #define UART_FCR_TRG4     0x40    /* Rx FIFO trig lev 4   */
 #define UART_FCR_TRG8     0x80    /* Rx FIFO trig lev 8   */
@@ -98,9 +107,26 @@
 /* Modem Control Register */
 #define UART_MCR_DTR      0x01    /* Data Terminal Ready  */
 #define UART_MCR_RTS      0x02    /* Request to Send      */
-#define UART_MCR_OUT2     0x08    /* OUT2: interrupt mask */
+#define UART_MCR_OUT1     0x04    /* Output #1 */
+#define UART_MCR_OUT2     0x08    /* Output #2 */
 #define UART_MCR_LOOP     0x10    /* Enable loopback test mode */
+#define UART_MCR_RSRVD0   0x20    /* Reserved #0 */
 #define UART_MCR_TCRTLR   0x40    /* Access TCR/TLR (TI16C752, EFR[4]=1) */
+#define UART_MCR_RSRVD1   0x80    /* Reserved #1 */
+
+/* Modem Status Register */
+#define UART_MSR_DCTS     0x01    /* Change in CTS */
+#define UART_MSR_DDSR     0x02    /* Change in DSR */
+#define UART_MSR_TERI     0x04    /* Change in RI */
+#define UART_MSR_DDCD     0x08    /* Change in DCD */
+#define UART_MSR_CTS      0x10
+#define UART_MSR_DSR      0x20
+#define UART_MSR_RI       0x40
+#define UART_MSR_DCD      0x80
+#define UART_MSR_CHANGE \
+    (UART_MSR_DCTS | UART_MSR_DDSR | UART_MSR_TERI | UART_MSR_DDCD)
+#define UART_MSR_STATUS \
+    (UART_MSR_CTS | UART_MSR_DSR | UART_MSR_RI | UART_MSR_DCD)
 
 /* Line Status Register */
 #define UART_LSR_DR       0x01    /* Data ready           */
-- 
2.56.0


