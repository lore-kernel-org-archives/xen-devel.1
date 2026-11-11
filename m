Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB9C606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 19:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=edbdIBZ3;
	dkim=pass (1024-bit key) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=EOS/xYrA;
	dkim=pass (2048-bit key) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=b3F2jbXg;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=LQanE7Rc
Received: from list by lists.xenproject.org with outflank-mailman.1484929.1688280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRELy-00046A-Fm; Wed, 11 Nov 2026 19:51:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484929.1688280; Wed, 11 Nov 2026 19:51:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRELy-000462-Cn; Wed, 11 Nov 2026 19:51:30 +0000
Received: by outflank-mailman (input) for mailman id 1484929;
 Wed, 11 Nov 2026 19:51:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xRELx-00045P-2I
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 19:51:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRELw-00AWH1-FD
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 20:51:28 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c71f-8faa-0a2a0a5109dd-0a2a4504a816-32
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:51:28 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c73e-b57f-0a2a45040019-94a39217d33a-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:51:28 +0100
Received: from pps.filterd (m0384718.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIYXWo2313307
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:51:26 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com
 (mail-westus3azon11010023.outbound.protection.outlook.com [52.101.201.23])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4hvuucsrqq-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:51:26 +0000 (GMT)
Received: from CH2PR11CA0003.namprd11.prod.outlook.com (2603:10b6:610:54::13)
 by SA6PR16MB6768.namprd16.prod.outlook.com (2603:10b6:806:41b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 19:51:19 +0000
Received: from CH2PEPF00000148.namprd02.prod.outlook.com
 (2603:10b6:610:54:cafe::15) by CH2PR11CA0003.outlook.office365.com
 (2603:10b6:610:54::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 19:51:19 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 CH2PEPF00000148.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 19:51:19 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIXgTE1790917
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:51:18 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4htkgbn3vr-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:51:18 -0500 (EST)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id RELjxLSqsjpGfRELkxkJ4h; Wed, 11 Nov 2026 19:51:18 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=sD+
	eBf2x8v77BhJ672+GOnkUSxa96RozVe+nC72I5tU=; b=edbdIBZ3I3aRUgEzXed
	fVHGWreM4W7GNXmZjRyhNzpUmiRz8AKm00lz00XbK7hSPQ9VtzzRKwaBPZUoNnFY
	1pKZSmVEZ/liT/dnTw54Ub7ijALaWj05PtWOvcT2wvXqdtO37I6ZdmkNl3BrxvA0
	LchFoM5lpAeUZHiVIikdxFeOd1z/P4I33e0U001cmdqw9fU3uKbT13KOzV3IaYLd
	yq6APOZhElefYM1OdvcLud/OfwcqH4Xvqmn0sc3GByg1hF8qnEs9yjgI58Iro4Z3
	eHxYGax/vifBYM9Pjr+3Frp2R8nrtAM9ofCxHVZ8dIZlhapsggou7Zb3Z/3tHgCz
	L8g==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=saxqHsvEXtjC0P99hRbtbRLMwKpRQUGBm9j2Eg8pOYfG1aXUPSaM4xjlAtBOtl+0aEc3y1Svbd6j3uKB0xrNtM6Rryo9wDc6atdXvoGMi1I1IfBKMAyskh2Bdk59XpMrjz8Pn+cdb0vPDMfG2d1noeT/WVVa7Pl37lc67vZHYqqnoh8trcnfO+MmIv9p4k5guYK/uO0q7ApbH4fsDMgK2h3K3zGLBGBmUzTcRV8E5tMhQuVLECV7OH1/uJazXLgQGaUgKech+wAxZnjdxtaOEX0XgqGSg0UXL5L9FUTUYti9Md1/Vfweg9k2+rcoaWuSS9pWPRhpoUFwl5kpmpg7Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sD+eBf2x8v77BhJ672+GOnkUSxa96RozVe+nC72I5tU=;
 b=WqiaR+l6PFgpJzDJyfrWZBV+kJCo+HOFDcvxA9eRBuccIHIyrLlXlwqfkNSYBx9SEvxZXCHqKG4IyuWhHkwT8aC4prwkUAcYnGFZXQqpJEC45VtI6XvtXebznIdeMO317xfirFyqyU/ZTt9/wQAk0vd0LMws7WPYpSXdqo43GnvqU8OFVUEaD59EQVlbp3SIXyGK/K4+c+UXxibJfEwYoFUNcijeIALQMtP3XiSD+snVfuxqsKOYXWlPx4ZhWxM7bEUbmQNbdvcHudv3vu0GmHmXN01wWAQcaNmwx4hToO/LokG/V7o8dn687Ir5WRjDv6FWHWwL/EyRLK5FjbVnSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sD+eBf2x8v77BhJ672+GOnkUSxa96RozVe+nC72I5tU=;
 b=EOS/xYrAUpZunH0g8hU5igSu6OeY3QLwBzkJWHnxlGrp77MC5Ibcn3pPVsBXdb3djwmb+DIwffUIYbbRfylddXflVpEGhfXUevgTJl2Rrf84EEf/rNi+MwwD94QBJb0viQH3kNY65EnmCPqURPIntxxMeuGT0uwNmwYpsxHCO/4=
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
	ppserprodsaar; bh=sD+eBf2x8v77BhJ672+GOnkUSxa96RozVe+nC72I5tU=; b=
	b3F2jbXg9tQaLDJZ7LXYlNi+EFLVu75pgClGckiqyYERLgmVKZfw0A27KZuxGcTV
	nHpfl+QHSbYkRA0kIsV2wJ14WCCGL0NxPgywojonzDD+h7AQX1Jmpabyr/EIXhrg
	I6eBX3YSqrC+B0rOj+UbTPynHm1CvKRke234A9JI7OdoPztfieRURqvnAG/VXYpu
	cEgBJtttaVRC+JkI93RbiMvyoKUgERPrL+PZWu26cbJTNvl3R8i7lq75HpM/kj1n
	MgMh7pw6HRLl7UWweOonE20fwe0uq547xNWdr67lYdsbkrVuXSSIrbiTk7f6xIH5
	ONLzO/XvgUqbJK3zwnsFPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=sD+eBf2
	x8v77BhJ672+GOnkUSxa96RozVe+nC72I5tU=; b=LQanE7RcUYvKm4BkoT/1Kce
	cq5j+IRaZro1i70jVouwwbhIXt269wD4ZE6WjkLvWPdLS/kTJEe7axzGpUvQmv+y
	mWfadkn7/qA4v+1b79w5wlcc2SjTcP6pDJ5sffI3tgjkQh0Vw9ZT/a2ZbTEF+2pc
	hIwmc+OSKY3BDBxIsZBwg66EDg57sW3gSrPL6Em5XInSX1RagGdnD/ADcjFtuHuw
	7R5iz9cBtRK8YHBjFgoscZjjigIDTawi5zWvGIfRLND0OltsPNNObhRWqgBmcDPP
	ks05EqBqvreDA3aWy3RcTcoD0+xa8cIFDJZD3IjcwRb+OhYN5kIeQMlTLEG3Rmw=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: RELjxLSqsjpGfRELkxkJ4h
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [XTF PATCH v1 1/6] .gitignore: exclude tags
Date: Wed, 11 Nov 2026 11:51:04 -0800
Message-ID: <20261111195109.1070169-2-dmukhin@ford.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111195109.1070169-1-dmukhin@ford.com>
References: <20261111195109.1070169-1-dmukhin@ford.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110078
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000148:EE_|SA6PR16MB6768:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e6109b8f-5f4c-4542-faed-08df402d27c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|56012099006|22082099003|18002099003|11063799006|10067099003|261021121427099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	xPiPfzpHBZykExsW+GtZmUEjycLz06X2Z/6DM8WzkIiCBSdC0sB+JrhGr4p+O2/Xszdl9DLTL3jbCCQrIqAR99dEJw+LDOqVV/rkaqx4jEyhUB5iey/wcS8yLavGT8YOm1LB6N1piQ0MIpD8y6YSkEVkBQathkYjQfl5l5LDq5SLg3Syuhbf8Xxi8oSsfXw0oU4NP55mc2YsTjfKcxUx3xspH0Ek6LrTfSbS6UCXV+bPX+iX2jkTNNq21kS01o3p5d5CuyELPu/7Yr+hxP1OzcGdUBl0o+Nh9N3u2t+iOhxdEnvc5HYndd0eaL4O3k388ZMbO1Ya2dq3VpejTSvCsvyhThiUGDNPcyRzY34fiQK/hatQWOsIY6REcJ95spoq837EowBWUvCYorQUYj6roudEzKXWBqzqTjAi8262MQv2QyaMX11ba/7MglKoIByMp90hVBq/CwURlz84fe3oJhs1D71jHcgNHIKolMGsRstCvCp0fMsCOy2eorebSRQ+DUZGaNw4SimUu7X+IZ5PIa3QuzbJpakDde8zLITO4sMEzXO3MqdbCNPOlvw7HjEb/3UmOK3TIPSNNUpSh6wh2taeHtJjK46jdC7EIn1W23RDUOSAgedXVgnsEsEU4mEL2FG9CMXQ7J6P1qZgvrKYMlHfJxHZfkySqRICyZ601KytIkJGMGs0XEXZUZbHctWe5lNytPv5w6F9Ja5d9EmY7A==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(56012099006)(22082099003)(18002099003)(11063799006)(10067099003)(261021121427099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2JVjdAme77H8e840RjAVLNGGBqS6UEraEsn8dbApe1nFRBW93FMjvgBdIUgXb+LLkfaQwqqjyCmSlP/ioV5rVGHhyEMfxvf90uVcurv+HcD04JoQw/7YMd8AcDCo/E94w2LiohMQmOEB5pn8IiTRDo2yDdOm427l7nM9v1s5Ml4s1mW7xlao8r1YxwRyv+i7+PQCEiY5QbbG3tSMR2OnnItLh2/yTFXxkxUZFRgPAu+N3EHz7wwEXv8nNhy6tuPS9g1W4X9/14xTjB7/nJ1x9u5gKoRBD/E++FKmKJqWc0qNUWqA9eJTC2LjeuZOrscu8ur9um3umPSNV8GsCZrqpc09ZlQuNpCptkXUHIyLm8TrvQJhP1EGYUY4UBuGUdA/NdH3ORQeHaO0PVksLNmhisScS9LZiN9xv4BfrFWBCH/m2RHHTxsMnKAJq2jXqhdv
X-Exchange-RoutingPolicyChecked:
	z0v+xO9p2csL5f5J5rZ1Z1aPscKI3YB/eyd0igjX3f0JX2xBEqac2gwPxOZnayAS7jZS7JTY9UtN/sraN7xsszTGe7Ol4WB3BquPCTNDngSYzbdSQ3ERIA0d7NaOZEfVBgsxMuCrvj9jk5OZN+ySy+tNM+QxqEIDNHxsmeffP3UClh3rzBJqg9J5xc3I7t3rMyASEvRHQ//vOqMUtm9hALURSVVdpcN5Ze2ckMFk9RIxyK46YJdytfvW0wM4EO5cziMb2NfCyPWAawRwmukFe94TA4OudE/+Scy43672eNqUxFO14cI1O0XyOfEf0Rpt0d4s10RJkAXkBEDgLB+TEw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zTgxZ1dbF6SGcU3ocm9XFAQyZ4vg809/VEfNhpT/GMRM1GIMXneOYka91fbgfEyzPptLXEnTzzJWPwREBuGZ/ei8lpj2Mjtw3zyk+mW5++adv4nc06NfZt4LQQTRsr07C6ZOnSWxQ0KUhqt/IrD8c/eZo7KdXohzHDZL9/+DHcDWvVJuz1rY14AZHUAiYsPXNASdsODlEWGq6GzQabjOsxRUPIoJwUfNE1m2DreiAzYZ5HJfSo8DufQcDcnKVtpPD+eyP5oKFO5QFdESWs5YiZZm6/s+Y48hbSWVjCGEtYURCTP003y4xJPrMDyFo+V+1Q00saTfIGDWaSUmcPdz/NA6nWyxiJDyeKq8qTaxzIa6EpGcTEJI3Jgk887+U3vTve7fm+bxtdLc8hpBc3UF7UzsnKlgMuEYIeMZBpmoma2Bb8xK/BvEtwDDL7S/o2DYGIEjntvrxSBq43fwgf8DusUanOqxIFXeWG/JGTiOLybYoAFrGulndCmELRm30llmpalSDJVq93lrSweIih7I5PHMWNJYmjiXf0xUCz3DxWXYU0o+64xF7lWa3qLP+a+3/C/P2Zl1yDVyYCKDtdgso86hgEkZaCPtxhyDd+c97oFrBcQsUKW/feGCYspnz/bfxY41PlFE61KTIYanC98c7Q==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:51:19.3170
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6109b8f-5f4c-4542-faed-08df402d27c1
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR16MB6768
X-Authority-Analysis: v=2.4 cv=YO0KWhGx c=1 sm=1 tr=0 ts=6af4c73e cx=c_pps
 a=xBU3AFOX62plvdJ7VrUh9g==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=ARvDHhclS48edyKYUbLB:22 a=cbNQJ9GKAAAA:8
 a=oX6sQOh5f4QriJ02HC0A:9 a=P0bj-C3X3jJDpopQwM1U:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX9QksE/v/2fTo
 7Gt+m3ku3CxHH8e1tMStWkmpJEY16VXdH/cyk5JhQGSitYOB9jQRAYZt8BY9De3ROpmPzVifUiH
 XpdiskbrxL8lSa9CshWVB44rfwrLGR5JNNfsrS7RTp/BB+lDeSYv
X-Proofpoint-GUID: c9j26PDLY6NQ_LPWq9Q_Pv4sbHd9Vuu0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfXwzXJlAEvBCPu
 qUTSN0RjbYcK12DAF4O410ORs8FblodO7TDEA3FIOyjYCYvzpWVGmzDsqEz1xJlr4K1Xrm6aDfn
 F4U8Bl1Q61S97bUJRWCWVq0MkrdUb/P6stsdqo5R7NH6aNAcIJ/nkzRqyGiLYdrblT1s5nxoCzK
 gvv7J/9JpBxsX7Dt+G8DDPwBCnkVJtGWtCw23IAdpk8VcAhQ+QMx6WqfF0gsmgqs0qbGfN65J3J
 4PPtrpUFiea/p9b/IUSU1ZwIoAN4WMN8dN02q6OidLMxSFK6BFAbZrXE9D8ObfY7aDeAWQC04zz
 Zqnn7/H+SE5cvmwo4MHciwuOWmDkHqsergybe6Ejxbm6Tb88nJcKmKDjAh2qvL04uUwP8lZt3By
 MkxCFGcLB/S4Rqo6O276BdrSWx3l6ies5WaqptcN4GKz1N9Gz+tinChGcMZg+vshl97ryhqA7dL
 m8rS8gxQ/IIyRG9Swcw==
X-Proofpoint-ORIG-GUID: c9j26PDLY6NQ_LPWq9Q_Pv4sbHd9Vuu0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110078
X-purgate-ID: tlsNG-ebf023/1794426688-532CCB50-7FE3C9B1/0/0
X-purgate-type: clean
X-purgate-size: 349
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index dcacdf3b2d6c..b16635db3409 100644
--- a/.gitignore
+++ b/.gitignore
@@ -15,4 +15,5 @@
 /GRTAGS
 /GTAGS
 Makefile.local
+tags
 .vimrc
-- 
2.56.0


