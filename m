Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45D860A2602
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 17:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=mz2e35kn;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=UMqUYLb2;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=H6BNlkfv;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=bySz1O/O
Received: from list by lists.xenproject.org with outflank-mailman.1498393.1696174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUSrm-0003Xm-AX; Fri, 20 Nov 2026 17:57:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1498393.1696174; Fri, 20 Nov 2026 17:57:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUSrm-0003XJ-5L; Fri, 20 Nov 2026 17:57:42 +0000
Received: by outflank-mailman (input) for mailman id 1498393;
 Fri, 20 Nov 2026 17:57:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xUSrk-0003Vk-Mf
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 17:57:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUSrj-00DfSS-K3
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 18:57:39 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6b008a08-2eae-0a2a0a5409dd-0a2a4508e694-14
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 18:57:39 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6b008a11-f659-0a2a45080019-94a38ff159a8-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 18:57:38 +0100
Received: from pps.filterd (m0384717.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AKGcWs03931628
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 17:57:37 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com
 (mail-southcentralusazon11011011.outbound.protection.outlook.com
 [40.93.194.11])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4j2swhs11c-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 17:57:36 +0000 (GMT)
Received: from BY3PR05CA0036.namprd05.prod.outlook.com (2603:10b6:a03:39b::11)
 by DS1PR16MB6738.namprd16.prod.outlook.com (2603:10b6:8:1ec::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 17:57:33 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::4d) by BY3PR05CA0036.outlook.office365.com
 (2603:10b6:a03:39b::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.3 via Frontend Transport; Fri, 20
 Nov 2026 17:57:33 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Fri, 20 Nov 2026 17:57:32 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AKHBagC3486636
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 12:57:31 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4hy7jgraaf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 12:57:31 -0500 (EST)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id USrYx2aSnlFtUUSrZx18mR; Fri, 20 Nov 2026 17:57:30 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=fail header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=zjD
	qVT1LgocpK45DMa9/V13coywi1XGEcBET4YlA+ZE=; b=mz2e35knv4i7+rWz/gs
	a0VfaPW95K8WzfWDsGItqJDJdDWYU66YR8pRj+BWAUwyOaNQwvG7PPxOLGq4I+7n
	pS9kGpi5x8cb9TAKehLRVyjoFkbOZpFBn8w1zs+lpL7jAr0lxFfzSx26DsKephbV
	3vxOpfeo0VxNqmDTd3Y+ukqpM+aVahKZ+T8qocw2NBnDpNvXSkJ5v+aiWz++if59
	h+0mMLZqnS0e3e2vv+uIw2UNXzHHZp6B2yhIb2jP++2tRpp6Jym2yC4wYSij4DE9
	24VWXQvIvzqZrp3fiC37QqEM0lKgT2+c5cAyIQzGtTeyL3wxPmh9Bv6vKCP//SP1
	lbg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e5hdmMewe32JNgaxaHDLnlDL5m2efb7Xg0W5GLeIhzkAAtzqsyKCujr3KkV1++Vcsko1VY/y8ypLmZDnS73YfqLDWuPCbiuSWHwYoSP5Vi3dodwlWXyQciRO2evyCnl3mpzUJ+iQmEEaGAuQytQLdvNwObbPfkEm2PM7IoubfjE7ouJmlYyfSJ/jkKdBh90x7sNnC3EMd7dxsaU6PMDs5F7B9q/gNRUziX3nfAPetbh2Jkl1k9aUtQQ0WJ6T9dLjtyoCdVuNmBkFLlf4ZJMo8/CO5k6ZlgRZ+Ea4q1g5rfYqSg6TkZB+6jiaN0Mlhsngfw4jNopms/FNLW/66/QNpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eOGMHtepyaAFGpeJr/ohGJkErq4VE39nOW4cyuYwbkk=;
 b=lKp0YEIzwuK+ADg2XhB2lPz0fQDprohVu10X+QHAJT8JINYaFH/KIIIj+1LNC4hmwWQWF6efVTNz5LClXWtgOlkWDehpOIzs2Xi3hFQMUqbaTO2qEtdpmJKlwRb7BQfeWRR+CMbS7jyzd4AEDH/ihOxsLJbnopTlNOFpyr/7J+gh50s6Q/dKqS5JkCwv4BucDE5+T1bku9WrO4ovfJ3tUDH/CH6ZEWTbnnoeaeOO0fPX4rqSg0KjL7qnOmDFviOy8d8UUZbNXPqPTzU+/qqGu7/jLeoDtaaLr0CgPaCOxQWiYT7lDhY9kT+VO584ah2WIgNNotmxITfsBxAlRtRNKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eOGMHtepyaAFGpeJr/ohGJkErq4VE39nOW4cyuYwbkk=;
 b=UMqUYLb2OY8kICVkBbQUprdV+vUYSP3ffZJI3Ie4OrVHFVyO1UkzXuDqsYe12b+emoEXLkB26bPboM4w6Cjgt4SXVaoYsv8Xsc2iAtZDyQ1u407cKDquE5GT4UR/KwEQiyuvP6twuIxuPHwezZOoj7K/XgwePx75D5YGYwKV1dM=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 148.163.138.245) smtp.mailfrom=ford.com; dkim=pass (signature was
 verified) header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to; s=ppserprodsaar; bh=zjDqVT1LgocpK45DMa9/V13coywi1XG
	EcBET4YlA+ZE=; b=H6BNlkfvxo9R3up3m5Us+5sqxfiK2z3ITjw+qYMrZ0qVc0P
	M5W/XOc/BNFwzzucdvhD2l3u5zp9jbBHHJb0kOydGdJiWmsMinYbrl52sy8DorTF
	tw7VO3onOGtPX+OZNRAg1jXVmWYn+Qv0KIzIKDF2MLs4gY5t5UfjR9bv1qL8b4Y7
	HSZ2KHYUZ10sN7ag4W2otrB0XBKqvzjvXzStITUWp1ptAE2ENPuEfdcUMfx5Grgf
	jR1diDgGdDGV5r6uoUUM5dtvawYxoso9yo4xH0qAyf0RuzqWB0kOmzxOvYETHST4
	UHMC43bU4p07M6LZEE2bSHK+wQmoIuVq3imjTEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppfserpocford;
	 bh=zjDqVT1LgocpK45DMa9/V13coywi1XGEcBET4YlA+ZE=; b=bySz1O/OJfm5
	71fF7Qw9EG8qDHtpCTjkbVkkCH1Fa36NaYDS94aesWpnXSRUKbgG18JHO68Sv2LI
	JEKlwFvWB2xylovVAqhjJKEkTVo10vLXVv1AKyE6yTqQ4y8kKvP+TKwIafLaJVCy
	YhE9hdSM5NDCYeUunc86cB8Ia0Knt7AQ98gZ+HQ9ecqmTa8oSBFbdbkBbbB3Xpq5
	O5rJnrWfSdRxskSd4c6v/UDdh97fxnJaQgZpvCSgj48gWeYVI6/gSPJYczxJq4jR
	Is+s3DSesAEoP9y8deHgXL7tAu3UzZh82Wsin0CqjYuMYnyBaGaGv7/1cx2OjDQw
	ZZinRhKeRg==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: USrYx2aSnlFtUUSrZx18mR
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Fri, 20 Nov 2026 09:57:27 -0800
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org, jason.andryuk@amd.com,
        jbeulich@suse.com, roger@xenproject.org, teddy.astie@vates.tech
Subject: Re: [PATCH v1 00/28] x86: initial SVM AVIC support
Message-ID: <awCKB7euqhzrAzd+@kraken>
References: <20261105013347.719392-1-dmukhin@ford.com>
 <e36dfc8f-62d9-413f-bf6c-3a806bbd0e71@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e36dfc8f-62d9-413f-bf6c-3a806bbd0e71@citrix.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200071
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|DS1PR16MB6738:EE_
X-MS-Office365-Filtering-Correlation-Id: 9908c897-6365-4974-f383-08df472fc0a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|22082099003|6133799003|18002099003|56012099006|5023799004|11063799006|10067099003|4143699003|261102123227099003|261102124527099003|261028144727099003|261026140227099003|261026121527099003|261022105027099003|261022075727099003|261021121427099003|261021135927099003;
X-Microsoft-Antispam-Message-Info:
	VLLaSBVOZWsSKwFheNe47PmbStU7/f0U0C/96yJrcWvRRQWnzTo1HVqfv+CVmke+LYisQe9CbNzpHHhrxDSo2sGQSbOFa3b9vXFAeRGU64ZJa8iueYhKZ5Cu57ABjkP/yMrLbgtyyHff+lRUgoGTEYX9F6GsSwlor+27vMc2cUNhkQWVTn4BncudfMBxR4xK/haYJjpbIwuXoD8TNggeUJ+94eHiQTqWyrOw1e5v/lDr4eHEnYzHZi6fOx6NtWkadAvuHgilW5onQVCtLZ1aM6xTxCG+/wpHZKydz2Md6/DItsc6k6qHoPK+olHjd4ebOSogCdFngAYTXp6R3+AJ0H9SBgDzMrcirSsKkft3RzduuvR4BRZuRDUXLcKa2DT8lNfxO5OLIBYgCTntnlJjuPl6bEQ1Liibp20CDN6V6/EVaf5RNRan9ZRlVsj2d52K5NN9atZ0j2RyDa5WszX4PBb8EsrQj+Dnv/PhvBUSj7jZIGQ3tpZitlA+bZlM8VpyYPARSLwxNrLszpMMIf3DYOSyTJ+faeZw6wK0mt3XdZWmQAx2Eh2M82xErEtBemxVa8XwdOg5NS3AhIxbIF7YIapgstjZ+5rN+pgZUB5vUzqByWvF3SU1DZYONntkq1OjH58V9WMMzrBZMp9pYgkbSxlcQzhaoWpSZZ11g/Q1ywReeLRadYLIEFJVRVlgQTPmezP5RwH8D4oCX+JkYilxeQ==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(22082099003)(6133799003)(18002099003)(56012099006)(5023799004)(11063799006)(10067099003)(4143699003)(261102123227099003)(261102124527099003)(261028144727099003)(261026140227099003)(261026121527099003)(261022105027099003)(261022075727099003)(261021121427099003)(261021135927099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iRVtH/+tvPwC2Vey9sQihZbdbNkl8c7Zsy7eEu/ZPeRpuHpksvcAcmoNrPWfixDFWLTVtXYswK2pP/o1MHz1kfcB/sShV/GFDJEy6NZ5QAmZmWDA6NfG3+aZsLZbY4ZhqKON7iPrDKN5MaasKruDLYYRhrPFE2wUyGAWO9U7JSrls89nRNncqu9SZANcxsZZUnIlFUHMYlmsYGVPLLcIWhdRsqmw23NK/nK0a8G4hiXBB6tI7ZdCklifvAvu+WaoKUJfz267Tj0rgyav6uUT6456R0s559UHikbefhicSohUv4kO8ThgTHxrsFkw70dTWmmSTxUHJsTdDfSBHPfSNdQzN9Gj4UiqqxR2GH4jeftZEv8tQekI4JnVLUNi3JdsmgnFl+uaTYRw5a/Ulx8+5mfFX4Eqdjdc/s2iE2RbLZBVUbSOIsjJ6XPzULX5nTxL
X-Exchange-RoutingPolicyChecked:
	jLUb5WW3XUnMWQpOyYIJ4TCKFDSSn8Hg2PMVYdZeLv8YrnD6hkRhqp0es4NMCdFtfysZR37/L8n+4AqkBD1vZ+OH962e/6UJ2U0jQnnSKrUwVSu0tGYoIGnAWpWt0ro34SDdZ6M3DXGlv2a4Z5D0aD5HFbC0XQiS5mXQ/HMadPlZsNXVA/Z/N+RAsjEDjpuevGmaFk3C3y27DrAMuQWzULbuobylPHpzLld9Ks5f0ZGdQ4iKF7MmLGTOFMOQELdND3cqRz2IdC82ubACKXs1G7VjRZhNPBdQgtEDfJPpOxHVFi+vruWU6VWCyGxKPoDvA4fW7Lpgd3ZWOmKUtek7vw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Qm0Ym6SE8Eq06uFV1FRyxnstO6Hzn46PF07VBdisGTiddwqxQPVVP/fISYJ/aqk3DlrZHDFaQ4BbrJqOHXLP33usuTgcj1yhh9tfCjeN2xfNnbCKfrVfUb6o9AaKGHTn011KnmmZYaT/nT1nPrYNkPxW4NvOebZZEDGyiG6rAjgJKX9Emkur2OAsF01NV6DtV/rtdI3zA+HvwJJnDPCU5VFFpbklPJckBBZWBPEYWvGDqlRlL0UQzn34q+REYGMejMmCUNrP72P/PaHX9sZVM1cHmtdAgxdf1hKoN+cw+3TV3g/8LbnAzsxoFi8aFn/058VuKJpibdhRxapRAwGHnqM/EMGqAc5WRqgFe+E0yuPmEnu3FTMulO9yGMBN+eug9FRggEEYc6t9m8+ALhw0HI6ORQNYmxtJb0tTWAva3YlnKbZzjvfwiwm1WhezmpI6ppqbld75YgR0R3sqMw0LZS8U/Lq5t+cgbIyLJfJs8NqWT3fXfdWSr06flX22HXpbie7L77p+N9VBK8rEnKuEDxXFKIAToYQ1tEZSMvydE7wCFhdvnD0XJKHDdxKqw4B2/PZLMKfOHDLA2d2cT3WZVYY3MUYcnefHfS4GkpS6JNa5QJY+aW+aCPO0p42XrU7r4goPKXQheL2hcDwSwyWaqA==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 17:57:32.8075
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9908c897-6365-4974-f383-08df472fc0a0
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR16MB6738
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA3MSBTYWx0ZWRfXxY7uxyfrpGd0
 EnQQnWDFEW2xEQHlUiF2MkGW3cP66sA6A74Xe08q5T6scNq5vhLwyfPBVV9T7aYPDDsZPm15YOf
 2F8Lo3XiX6IxNUDtJ+QKHEzMVyYH3Iv4JXllk3R5bDBNFfOAlhX+
X-Proofpoint-ORIG-GUID: wLRi9UJtfCtbQLBXYvIM6lpukfr2NLpi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA3MSBTYWx0ZWRfXylxbjIYcw01H
 6luJ8/NjGAVmzAgzszMg/YXOe3KaKF5PnPddoBgKLpoyY6rPdGbCGnlyukSur0m8LyDT8MgtRpZ
 46tBTSgfQW/4GzEm9T5q3g3OiPTZZjQG3YaPH/j86QZA1m2tnU7VhC7rEFAUz+pS+rGmmomnTJM
 7xcMQV5pQ//oABF1LNHkrPleGroADbHpzZfZfpjqznSS7lPjUxBp73vu0dTz8czmW2/c7kva75e
 cGYFLlCqGbl9X//MB/o14KmHd/gKChQcAEtjrO7WQYSUcYGTK2RZUD0VXX1K7TQiJQAXfLW1Q4q
 Y7wa9fvAJdnzWAf4Nb5fjAJxflYUmWEF0bxuZXcFejGivRBWX7qOL0mivmfVWWA9Ch2PfUMuE/j
 /6GLetjAZdv9APh7IlEsBNwwpq37+lVazirtE6FYsyv7eiiMy4biU/voEXJWgUvt0Y1NWONVdtA
 vTLfPN5EyE6j6cxXasA==
X-Proofpoint-GUID: wLRi9UJtfCtbQLBXYvIM6lpukfr2NLpi
X-Authority-Analysis: v=2.4 cv=IY4Symqa c=1 sm=1 tr=0 ts=6b008a10 cx=c_pps
 a=Rayal3q6byrlEF75E5QjMQ==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=AHe91QgOk3R4nFVtG5At:22
 a=cbNQJ9GKAAAA:8 a=s5CKiovfKOjPC9F-rm4A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=O8hF6Hzn-FEA:10 a=DqJYxgmhk6moR-_7_KoZ:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200071
X-purgate-ID: tlsNG-c1860d/1795197459-D534D87B-91B15F14/0/0
X-purgate-type: clean
X-purgate-size: 5707
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 03:47:15PM +0000, Andrew Cooper wrote:
> On 05/11/2026 1:33 am, dmukhin@ford.com wrote:
> > Patch Series
> > ============
> >
> > Basically the entire work is divided into three big series:
> >  (A) Current series: initial SVM AVIC [5]
> >  (B) XTF interrupt latency test [6]
> >  (C) XTF infra in public CI [5]
> >
> > For this AVIC series:
> >
> >  Patches 1, 5, 6, 9, 11-16 introduce various cleanups and fixups.
> >
> >  Patch 20 changes XEN_DOMCTL_debug_op implementation to allow
> >  more debug operations added (like enabling/disabling AVIC at
> >  run-time - used by the XTF test).
> >
> >  Patches 2, 3, 4, 7, 8, 10, 17, 18-25 represent AVIC implementation
> >  including performance counters and run-time controls via debug
> >  hypercall.
> >
> >  Patches 26-28 cover various documentation updates.
> 
> Sorry this reply has taken longer to get to than I had intended.  I have
> committed a couple of trivial patches, but I think the rest of the work
> is going to take a bit more complicated rearranging.
> 
> First of all, I think there are two areas where we want to take other
> pending work as prerequisite.
> 
> 1) Moving the SVM/SEV leaves into CPU Policy.  (Series of mine needing
> dusting off and re-posting.)
> 
> In patch 4, you introduce a new command line option.  I know Intel has
> one, but it is part of a bigger anti-pattern we're trying to remove. 
> Wit the SVM leaf in policy, `cpuid=no-avic` on the command line will
> work to hide the feature from Xen, and without much effort we can make
> `cpuid=avic` work as an opt-in until it's enabled by default.

I have parameterized MSR doorbell path vs vcpu_kick() via

  svm_avic=nodoorbell 

in the current series. It was pretty useful to run experiments.

So AVIC may still need its own command line switch.
What do you think?

> 
> Also my series removes the SVM_FEATURE_* constants (they'll be
> auto-generated now), which simplifies your earlier patches.
> 
> 2) Removing the vcpu_id <-> apic_id relation.  (Series of Alejandro's,
> or at least the first part of it, needing dusting off and re-posting.)
> 
> In patch 7, you encode the guest's APIC_ID as it's vCPU ID * 2.  Yes
> this is currently true, but we're desperately trying to break this bogus
> relation.  It prohibits providing a sane topology to guests, and is one
> of the hard limits on HVM_MAX_VCPUs being 128.
> 
> Alejandro did a series making topology selection work.  The first half
> of it at least gets into a position where the toolstack chooses the
> APIC_IDs and we've got a proper variable in Xen with which to derive
> everything else from.  Getting at least this sorted will give you a
> proper base to build the logical/physical table upon.
> 
> 3) (Bonus).  We need to take a decision on whether we're going to block
> writes to APIC_ID in xAPIC mode or not.  I sent an RFC patch.  If we do
> decide to block writes to APIC_ID in xAPIC mode, then it means the
> logical/physical table is static for the lifetime of the domain.
> 
> 
> Now for some feedback in no specific order
> 
> a) Please have one single patch adding all the architectural enumeration
> in one go (CPUID, VMCB, etc).  i.e. merge parts of patch 2, 3 and 7.  (I
> have your patch 7 rebased over the VMCB cleanup which was merged after
> posting).  I find this helpful when reviewing because it separates "what
> is needed for the hardware" from "what is just internal book-keeping".
> 
> b) In patch 4 you have a single static avic_apic_access_page[].  That
> was XSA-412 (3b5beaf49033cd).
> 
> It's actually worse on AMD.  On Intel, any writes targeting a
> non-register part of the backing page are discarded.  On AMD, they're
> deposited in the backing page.  So, this page *must* be allocated per
> domain, and not global.
> 
> c) AMD has extensions to the APIC spec.  AVIC even accelerates some of
> these, and you feed the accesses into the current vlapic
> infrastructure.   For current CPUs, at a minimum that means reverting
> changes to eLVTs, but I think more generally we should probably have a
> CPU generation check during init and refuse to turn on AVIC until a
> human has checked which new hardware features leak through.
> 
> d) One very fun bug with AVIC is that a misaligned xmm store can write
> to two different registers at once (ymm can hit 3, and zmm can hit 5). 
> The whole write gets deposited (contrary to Intel, which explicitly
> discards outside of the first register hit), but only one VMExit
> occurs.  This allows the guest to write reserved bits.  We need to
> confirm that nothing in Xen is going to malfunction (e.g. check for
> BUG_ON()'s/etc. which ought to be downgraded to domain_crash()/etc.)
> because of finding non-architectural state.
> 
> e) You've got a number of fixes for interrupt-related things.  I think
> we need to get those fixed first and with robust testing in place before
> trying to add AVIC in on top.  I'll see about dusting off an XTF test I
> have on the matter, but we really need to fix CR8 handling before
> building further.
> 
> f) I'm not overly convinced with making use of debugop like that.  For
> now, maybe defer it to the end of the series.  I have had several
> occasions to need extra hypercalls to make testing happen nicely, so I
> think there is room to make something, but I suspect it will want to be
> a little different in nature.
> 
> I'm sure there's stuff I've missed, but I think this a long enough email
> for now.
> 
> There's an outstanding question on patch 5.  If you can answer it, I can
> commit.
> 
> Thanks,
> 
> ~Andrew
> 

