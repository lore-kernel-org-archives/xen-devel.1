Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3A2606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=hY5VYEAo;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=dUQwiPVO;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=VeMXFcF2;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=FZcQgDTV
Received: from list by lists.xenproject.org with outflank-mailman.1473429.1681117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmQL-0005D3-7b; Thu, 05 Nov 2026 01:37:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473429.1681117; Thu, 05 Nov 2026 01:37:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmQL-0005C3-0G; Thu, 05 Nov 2026 01:37:53 +0000
Received: by outflank-mailman (input) for mailman id 1473429;
 Thu, 05 Nov 2026 01:37:51 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmQJ-0004xv-73
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:37:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmQI-000xdn-K3
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:37:50 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdde2-bab6-0a2a0a5309dd-0a2a4504c1d0-14
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:37:50 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdded-b57f-0a2a45040019-94a38ff12084-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:37:50 +0100
Received: from pps.filterd (m0482515.ppops.net [127.0.0.1])
 by m0482515.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6A50n1Xq1195592
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 17:37:49 -0800
Received: from sa9pr02cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11013058.outbound.protection.outlook.com
 [40.93.196.58])
 by m0482515.ppops.net (PPS) with ESMTPS id 4hra4eua8m-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 17:37:48 -0800 (PST)
Received: from PH7PR02CA0001.namprd02.prod.outlook.com (2603:10b6:510:33d::18)
 by PH0PR16MB5231.namprd16.prod.outlook.com (2603:10b6:510:299::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:37:40 +0000
Received: from CY8PEPF0000005C.namprd21.prod.outlook.com
 (2603:10b6:510:33d:cafe::1e) by PH7PR02CA0001.outlook.office365.com
 (2603:10b6:510:33d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:37:40 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 CY8PEPF0000005C.mail.protection.outlook.com (10.167.247.26) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.2
 via Frontend Transport; Thu, 5 Nov 2026 01:37:39 +0000
Received: from pps.filterd (m0426315.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mP113108414
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:37:39 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4hp33swb2u-3
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:37:38 -0500 (EST)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id OmQ5xwnEoDnFpOmQ5x5ofK; Thu, 05 Nov 2026 01:37:38 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=9Wv
	vWrvz9JXzkSSTkfi4w4G945Ei7sBYZKGt66bpnvM=; b=hY5VYEAoS2mb1nYQfT/
	yKA5In5wFQX6qFOTI/jJ1ENqeG+emtQNa0yeLReryyVwMA3zrxCu89YTGy142bNO
	vRnNBCyzFl1KuXuUmnsiUNjaG207dhLZFehybsxcFimKTfT7hvmUw6D9WZmMec5I
	9gEHO+DSluSvlmDFgjNcWWWaEy9ecEFdatm5ceXO34+ekQNP3JZ0N0Gq4EQUaNom
	f7iv/wAZw4GxFvvdYA3xeBbW0lE5tUG3y3Z1RT3gGO27drsOWHadq/mmlto8/D3T
	KR0VLSg2S9Dm9m6C+O08/6vAuL7wmnmAislJ+Flayw4MHGbeoUTOXXPbWY1/Naux
	VQw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n2WK0er4cbmojYspYbisprjX1SkmD2EwlK30llUcPBE78Xkvet+2/3GoSMHFNAuUZlwC6SRa7uhsfDJAAd6sEVTkjyU4nh98v5tZSGnzMN6LXnbPiO8ApXTQIDvChAcrMxfXSpWZDl6GnJ/EOyMSI3r8KxXFeQh/or34ZYgwYTJq8PERcq5B6IbQIpxmGUup6mc67xbL1non+P4QXYokRqNCe64zpl9zl5DlashavxPNYktAzmdSzrQBwtynGfRiHldWa02FlD0GsDba6ydPSKqW1B0hP1zU2LIHqqO6Rjx8M8scQZ345qeEBPS2ZvFKjfQflpPd9RQkYUvYgh4MSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9WvvWrvz9JXzkSSTkfi4w4G945Ei7sBYZKGt66bpnvM=;
 b=rh4qvWpVun5dvlzxZoAyQkNP22uGGQ4959NnnQbOrmAhjOA2fmd48n8eWs8BjVX53+keVHyJlFrE5FcqaYE3UaFNj9Ak4OMH7pfPDy0ynsQGH+ln6ktdqIqsFiu5BwtZ0EhCtoNBts+Wp1lnn2SurwrakgsSS8FRntvsBKsNAs0y1p95o7PAxi0eC3MReUhQggVGlldxYtA8JhrHbWItK2UJ8mprMov/G0jNZK5EtRg6vbveGqUtHKetEhMPUPolGNyBLLHRsTsnpxOMvEUtyKrh50N2LkySqcuG+6r7C40rYBl5s8OHDJSQlD7qzUC/XgAcsluDC+wl7GeMHTyWGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9WvvWrvz9JXzkSSTkfi4w4G945Ei7sBYZKGt66bpnvM=;
 b=dUQwiPVO/fSmt3d/mTJaRW3rTfJP4kqIa3qcD76S8SHsAHZfbVx9Gm+857C0zZXDil8XwPpV6/yWJAuwmto7fNhZmmyMqXV/1tEVMJtC88vkw57TzUNwqsBcENP4zAaVcE1UonzjDdBmyaB0DjUWnhhpl7AT/BUdpRKsY4V1kvw=
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
	ppserprodsaar; bh=9WvvWrvz9JXzkSSTkfi4w4G945Ei7sBYZKGt66bpnvM=; b=
	VeMXFcF2StZm5nhQpiujNIgG5CWX0RtwuEOti5xvMC8OU2KNRv6ht3VS6wFiOKg7
	YB1yTolj8151tis7FB/utiT3PHrLuYWYaDA4V9OpQ3rbCiBVHWTPimtDpGHEuML9
	ZOa77tpjyWJCsBCPqTnkVOHdg9FRPtoGXbq60yf5/O3uYu47mIQ+715Ve38kBwBY
	o5G6tKCUbr48+juCLlqCLmC23Xx1GkSY7yYNFv5WLkRWSaBQF6SAgxlths5u5eab
	q9ysJy1RIcli12zDoBNKJzObffUFZVAdX7SgsFP+TKwIXlV8wotSSJHgCeLhV59e
	OS30o0SY3st5P8XIssV1JQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=9WvvWrv
	z9JXzkSSTkfi4w4G945Ei7sBYZKGt66bpnvM=; b=FZcQgDTVDaVrJx7iUoD+HNU
	+7VO6uKJS4kjgNuzQFWoRTg+tUPl02oKszMGU7HqEZDJze2wxvsFP+fqkxpx0Wdz
	miEqJPds6lcYX+tREnw2nDW6+gu+zqM93kXo0DfpBT+VHQG9tIedcyhFTvIPSH2g
	8lb+gOSPzfgIdyHuQIcv+6O2OOnCjJS7rFRKwhnp4FEhnxSMjBwQm94C1sDhU1fk
	cjZ7GITO6+ymZJxOs5/Zb7L7tNZWMCM3D9KUdj0cNW0SREMTi4TF9SUQC7Wll+7D
	aMtr0bGepxTjdoJdc1lEoMf1AdMEzG4W3+NR6+Zn4CgSh0g1nGUdPrWI26Nj5Zg=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmQ5xwnEoDnFpOmQ5x5ofK
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 13/13] CI: do not merge: re-wire XTF repos to custom branches
Date: Wed,  4 Nov 2026 17:37:01 -0800
Message-ID: <20261105013701.719658-14-dmukhin@ford.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105013701.719658-1-dmukhin@ford.com>
References: <20261105013701.719658-1-dmukhin@ford.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050005
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PEPF0000005C:EE_|PH0PR16MB5231:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a5b9ea93-d5d0-402b-56d0-08df3add6109
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|13003099007|18002099003|22082099003|261009223027099003|261021121427099003|261021123027099003|261028144727099003|261022105027099003|10067099003|261026140227099003|56012099006|11063799006|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	X968+PJbEemVOrc+ZnzAlXUCKjUJOleEl+egLFSJLENk2pG4oulzqQEQhuDCZuNDIrKZKIRJI7WpbuYFMfvBdcvf0Epv2wsDV7EHE8KwuOgNR6qxLEsGSXwzDd3sVAjw+2RRXwsHIX6eygSLaJ9CFrN5sX4Ur5Yz7zrMAtlll6scFykkhOqQTibjaXsTRzME37GTKShfnxW4JxPqv7jxnrBeoYlEzxBZ2FKxzodwxqfu8tFnlTye/rZNX8WBzpxLtel3PcZ8/Y3aaMb0iw+Ptmq/HULr+W/ABi+3yUEo9wT4iX+OMIaqdIiNvVWQ+tAHEb1tlCv+pZ9fzOs1HKdoGRSV7gF1xOqmsoEI9qtpV13zCQLNb0chGpUNSmdei6tnE2mKewxDkV/6vqvGtzitIu6B0wzcdM2W4ZvUdj+y+/AMsKa8rjpFpGVp3QqJOiN9zn7ElYOVbw1f9EMB3GXKyQ7IHmhu6WZRnBr4ZXMo7vSVDWt1pmCzm8BAvPUrOTZOR2GsdWcZUtxvFH9FgNJ5ODYWrOvaMSTHGBYba+at0GKGw4T4/wtZgf/RvigQ9YwzrmFYwNnEhbA0xdFzuswoZyP+nOGcvJNvNF7ygINUe63KjF92rEETm0yn9srQkX4/m49t1SaXsA4Ebg07i3R+DD/gx89VUHc6woWRT5dxRfc=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(13003099007)(18002099003)(22082099003)(261009223027099003)(261021121427099003)(261021123027099003)(261028144727099003)(261022105027099003)(10067099003)(261026140227099003)(56012099006)(11063799006)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	C+bIV1iF0j3XPmQA1yj270UEKLrTCR91o5xcHkGSy194XipQ9wJ/pmpKomfUG7g/orv80r9qznjmZBaqMFOzEYTvaP2dzfU0kB5rsS7UJN0eDxeXEHAxvB72Un83U1YrhyWckUnjHXvxG1JmfWxtj7YcgSVZSOSEZkPifxfHYhJOj7/od72X+ibzy8kttJDstObQbZUDRWpJXqh+8JPUeasiScokSRFyhRKPa0dA9QJhq3LI5rbmlhrOPFZvX0/I2gZLIISGwpPHjPkD3TSiwbEVFqvkPsEfUyQAJi9Mojy0y3692OKeQ4F6jBP6xeCQuEHb1zaJ2x7ml4TzkxlB+I9RNwCgHoOVbCrmeDfZEc9QrwTSkCm2THp05ws2ndZLJrJMGUQR9KnwWm1lKw2vEzOnwgbXk7hcbbIdPd0KWu9xqUShVgmJZlySycnjxVyz
X-Exchange-RoutingPolicyChecked:
	EK+qPH3Df2gxzKmsPtAbXlmlocq6SCFWERPVOaXOlrvIKBndkriHIaAE0GBnWX5hZl8UuqAerccIAU7pH6i+6FKoqf/Hj8CW/nC7gZZgX6g75XCcBquRCbEjqeaEvsxtyN/+0mTahYQgXhUiAm8BM6vQxSU0+o46vqdCh3k4AXyTDa29p0T3+TqymMeSYyon5IL2m3fjmyEol901AkJgFJ2m2DfEpNUe2BZ7ApxiN+zmPF3/y4SoHFuFjMJxJLkeG20UngwMLigTvkRKgfQWnpebB9xWUkPHUuE/60dPY0+RduNVQ2mXRuLw214mopssPEpDIjjazVhj/2i6rg+SIw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PZBZZ3Ogw5muhPSg096vW3uGbwsARQdmQ7nT4Ic5a0PFH9aJiCZ2+xBaWXPXtD757XaYCq7KQBxl5yJRta7vzCHDf/yyztsb9z40Nv+zNqhh+j7oG5Kz/x/lDvKVfozGKTcF7tTeX8jWPqm3OIO1gJj6yjrSW+8/EeSfsyiVCP7W5YqavwyXu22fIM9Yh1PcD0XdciB8FUbMBnIRPsyEduGSViIBGjdk4zCSYqgHywFONbkYhNfRIvA3aH1r6cBw6x3YtbJSpCSfvwtn+VQIhGzZU8vOsvd3kI24Sy2r6C/8edlcft8qZcYSYSYfjgM5bHoDa0UXZo0u5uuVGJbh70pRSao966DGOhDO1GfoiYXJ8IJ0QhdFUgBtSgIdz4Yq6kiCtnzkFFSmGVyGp6K0ZUNeMyuLRk/Y720vnDx3sxN3BqqIfA3lZLCm4paob2KfSNqRAx4s3cDCZvK+T5mFiZSgohfeUE8ytmk3Sny9KA7yo/H5r3eFVH186mSYZJarmo4Udp+lJ0/+5t01TCd/hl6O91aOHDT0fHKJKC0sPSn05wf5zqqmPfL7aIIWP5uA7kkR9pLMbBstplZNoIwlbi4MQQgzaeDOc1B4VhsklfWYEhxFoVYpdCFIcB7YYDpQ/Htg6gNvV6a8qSHLUMX4QA==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:37:39.8148
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5b9ea93-d5d0-402b-56d0-08df3add6109
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY8PEPF0000005C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR16MB5231
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX88qpPlU/k+fK
 sSl2aCNoIcB1Er2EyljNcUjDwTQxSpYo3UsMUwGZL+rKvb+TX5RxNbNmDjJ7kds8pos3G5fzIFW
 jzTZ3b2xvefxLbR0WI6deQHHMVO1gwDsAZ5llH0bPDGtHJB2JxOTEvLJq8VGwGJLxbFvckT8EQK
 gLLkcniGmj8Nn0CKKzOiktK6gbMJVzdIBen/5tnzW9I0j/gGaHXmXwgB27j8jGBw9HMVpriT/qN
 YPzHOYSZmUKHWaBp3O+2lwdJ+du/QtlP73B0VVw+zTzNgbqrn2RyMnei1mhfLU73oaiyIfP063n
 BccFb2zB9jFgG4iGkWK7ljSvEJ0/qIqcF1WGQo6kq/RH59/IISjQaLFSpYYUTEyRbqGu7hpJYs2
 MlFjWHXzMEib1w6ObMq4+9dFh7cZqLWaiRKKN7uA0+KD30jrp3RLlcvR5jnnCCHENYc34AqI3pg
 2UhPNP++5JbKzz6i0KA==
X-Authority-Analysis: v=2.4 cv=UfzE26SN c=1 sm=1 tr=0 ts=6aebddec cx=c_pps
 a=5YU8ENXygJz5UkgxsLF+dA==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=0GA0A_IKJoUHBEAzNTkD:22 a=p0WdMEafAAAA:8
 a=mLnsDVdbAAAA:8 a=cbNQJ9GKAAAA:8 a=5kmKzhDK46sTO3VOasUA:9
 a=G69WFyCBNqGPyalROSdv:22 a=WmVTiCyuxqgg3mnwYu6p:22 a=xnp1pY6zelCj5OLna2To:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX++JS9z7kbmQ1
 nL9+Fs7TV+WhzDVtMgy1cuZ0uMkllSBopt8yHe+Al8pdRjNOV9VRzWlkgZQt9l2/kIUnOy7jf+g
 8plg0sjtxsWhrBYx21Cz5VvYCOdBWYyHhKQ6RHMblJxGdGOPDmaQ
X-Proofpoint-GUID: qaSBHx66ZET7YcuZJ0wH_1ckoheKagNw
X-Proofpoint-ORIG-GUID: qaSBHx66ZET7YcuZJ0wH_1ckoheKagNw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050006
X-purgate-ID: tlsNG-ebf023/1793842670-C12DCB50-D937E314/0/0
X-purgate-type: clean
X-purgate-size: 1462
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Only for testing.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 automation/gitlab-ci/build.yaml | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 1f6228ba74ff..a9f85fd9915f 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -867,8 +867,8 @@ xtf-arm64-gcc-debug:
   variables:
     CONTAINER: alpine:3.24-arm64v8
     ARCH: arm64
-    XTF_URI: https://gitlab.com/xen-project/fusa/xtf.git
-    XTF_BRANCH: xtf-arm
+    XTF_URI: https://gitlab.com/xen-project/people/dmukhin/xtf.git
+    XTF_BRANCH: xtf-arm64
     XTF_CONFIG: |
       CONFIG_GICV2=y
       CONFIG_SBSA_UART=y
@@ -881,8 +881,8 @@ xtf-x86_64-gcc-debug:
   variables:
     CONTAINER: alpine:3.24-x86_64
     ARCH: x86_64
-    XTF_URI: https://xenbits.xen.org/git-http/xtf.git
-    XTF_BRANCH: master
+    XTF_URI: https://gitlab.com/xen-project/people/dmukhin/xtf.git
+    XTF_BRANCH: x86_64-ipi-latency
     XTF_CONFIG:
 
 xtf-x86_64-clang-debug:
@@ -893,6 +893,6 @@ xtf-x86_64-clang-debug:
   variables:
     CONTAINER: debian:13-x86_64
     ARCH: x86_64
-    XTF_URI: https://xenbits.xen.org/git-http/xtf.git
-    XTF_BRANCH: master
+    XTF_URI: https://gitlab.com/xen-project/people/dmukhin/xtf.git
+    XTF_BRANCH: x86_64-ipi-latency
     XTF_CONFIG:
-- 
2.55.0


