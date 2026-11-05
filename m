Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22ABA606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=f7gy3wqM;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=NEI+tAQ2;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=MpNY+cm3;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=Lw6jYSIG
Received: from list by lists.xenproject.org with outflank-mailman.1473394.1681084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmQ6-0002ll-KS; Thu, 05 Nov 2026 01:37:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473394.1681084; Thu, 05 Nov 2026 01:37:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmQ6-0002ko-BK; Thu, 05 Nov 2026 01:37:38 +0000
Received: by outflank-mailman (input) for mailman id 1473394;
 Thu, 05 Nov 2026 01:37:37 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmQ4-0002MU-Sz
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:37:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmQ4-001xJk-9G
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:37:36 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd93-8faa-0a2a0a5109dd-0a2a450a8d3c-28
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:37:36 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdddc-f2d2-0a2a450a0019-94a38ff17c7e-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:37:33 +0100
Received: from pps.filterd (m0367127.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mj4M226500
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:37:32 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11013070.outbound.protection.outlook.com
 [40.93.201.70])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hrfaurccv-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:37:32 +0000 (GMT)
Received: from BN9PR03CA0297.namprd03.prod.outlook.com (2603:10b6:408:f5::32)
 by SJ0PR16MB4045.namprd16.prod.outlook.com (2603:10b6:a03:31a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 01:37:29 +0000
Received: from BN2PEPF0000A7FE.namprd02.prod.outlook.com
 (2603:10b6:408:f5:cafe::33) by BN9PR03CA0297.outlook.office365.com
 (2603:10b6:408:f5::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:37:29 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 BN2PEPF0000A7FE.mail.protection.outlook.com (10.167.245.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:37:28 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50nXJq060892
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:37:28 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4hnxy7wh7q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:37:28 -0500 (EST)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id OmPuxmeB5UazzOmPvx0zBS; Thu, 05 Nov 2026 01:37:28 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=SCX
	gU3x8B/FZNE7qSXywTJSGB2nRpb27JgPjklZSPWg=; b=f7gy3wqM5auisiK8LdG
	1MS7wTkdMeoc/OrlrOGYfpeD81nF238lfmL49dIvG+qgjQWfcKryzOjaEaGCpJvn
	mtd9KX3dsMjnR3mISRlBy5QO+WANSFiAX9S3Do4jJitrgrb2/3dJM99qWfKzTsxG
	KtQkXNrH/FqdaQBfCtZLnmiORplm61xpBWlNi2Jpt6TA9aL+ynlwy67xq1J67+nd
	pHhhNsxdl4uh7kcFYDVDuBzcRs81uZvAdTXMRYhJq4nJEU/pe0Wxhf//+NB2wKnI
	xNPXZ/TEI+3kMj6mGDY+bHcq5cChhKAqVn97P04DJ2FnVz0uGyP8R54fHsj9Xsn3
	ZGQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Med27qo5LemjrLj3PNqzIyfQBfZFslavwyTNGEt3K7KGiU1ATx7UbIbBjCDBkbhxVPCY8s75KkkzvMSVt0n/aRZId7c4LwOmurOa201Dn53ku4BjrXpZlBm4A2aRmPsMqH8MOnjGpgdzs/MwPI4F1OG8iwEABJRV2UqRJ3XIGvfq9DJqUZM6+boRL/qxP6VVa0CWWQt95oDRSOgqPn52OteCzQewOeZbh6LLR9T6QQXsvEeiuAupPZveOxqhcgHOfNmbZ0MItnfSWvAuzKAPwxLouL8IXO7WtqFuNgxtWq0ysFxOFTPp8V0JHX+YuvKCjcKq1rZIM5kUD3bQkMkEeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SCXgU3x8B/FZNE7qSXywTJSGB2nRpb27JgPjklZSPWg=;
 b=FTPbndhcpYOak0Qotjfqwwt3104rbMoX5evgangQenPQ4Dvz7MWuPD6fteBsU+mSqza2zAQ4fRjEmw7CvzRs7DjWoALxMTMaTSvdc9wIhOB4rikdtiuuo7ABTcFjm6AZ1mkHMrQgtlroVvfNlk+euOnEhATrHFKLgtxCSmng45TrvYYNPVeCMGWEPh3mEPyRDG4Z+Br5vPnZABzeGWE/TyTvfutyPiIqCsqEaOHIHe6rl7zoirivF/cBEIbEWAwE4kZeeuN1Oxx9Olq8cPBR+lJOUONUsuAWbdE/jiSCuO/ehvP4fxaUKymHafeMDxTS5W7nDviPWjtSk6IjxPubvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SCXgU3x8B/FZNE7qSXywTJSGB2nRpb27JgPjklZSPWg=;
 b=NEI+tAQ246Jk5JGJ6+ay6UjFM+9zLzfOEfvfpqComkTpNOxq221R3TWvn6aud0HHoySZ+OIRqesyjCgxwbJvRulGAvuP0MFRL7p+IcErfE5zJIWoQ0+uzG3oyiM8HVedLEGpZCt/ympre4VFZE36JFpZeWX+fd8Fnarys5S3eS0=
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
	ppserprodsaar; bh=SCXgU3x8B/FZNE7qSXywTJSGB2nRpb27JgPjklZSPWg=; b=
	MpNY+cm3ZZ9pcbRM99mIOjp/dydDjs/2C0qXqSxgaO5s5uLiehnhOYbgU4wDKyUq
	hg8nrJ81o4prmzHkmm7TDhKM0wlX9D0vll0p93XkRoNBgHKjQ2X5RGhiLNBHBkzC
	ev7DnDSG8UCxvZ1m0k1Ck3MXL250K6JhY2wsdFLn/kCKC+sVHief55K9HSWpJz5j
	qxt8yC5unDpV2GgKUwxeDgW8SVW3jXF0HcXH2BLAxcSG03+fGy8Tq/Apt74Vqj5E
	+H6z+H8FWYnFmEUEvJBIozzT2rAbM0aQB9BOiAGxszfq3961rYCiQ1I/edamJ3um
	8SmYkIYfzhzFUDm68wWVkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=SCXgU3x
	8B/FZNE7qSXywTJSGB2nRpb27JgPjklZSPWg=; b=Lw6jYSIG8t8wPjhaWJOAO38
	ZWAbofia4i1w0AW/UWyZNm/sUCuLgzR83G7cf1L6odl3mboNBdpoLmubHz79XEcw
	Q5lx8kbfMvJsOe3K+78JLFEEvNZTYl76mASYS9fyDsrNXDXydczHpB+2zzy/zyGd
	67Flb6FW++T5zJqJ/9vvfSgVF/Nk+WhEnLjIWcYtJMD1J3sdETAdFPLTRmSuluLE
	CmqKL0vygP0QWLCmIwUvorBEsEFz7KGdbNoya7gAH5mQMKlRR3Q3XxO3xrKRcOun
	tGBuGov1LSxZF+KWsrPu2daiirJcz0zxjHMGb/QzQslFtrVKsQHGf7boFt0D3mA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmPuxmeB5UazzOmPvx0zBS
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 09/13] CI: enable on-demand IPI latency test on AMD Zen2/Zen3 runners
Date: Wed,  4 Nov 2026 17:36:57 -0800
Message-ID: <20261105013701.719658-10-dmukhin@ford.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050005
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A7FE:EE_|SJ0PR16MB4045:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5a021010-3b9c-42cf-5755-08df3add5a85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|11063799006|261102123227099003|56012099006|261021121427099003|261026121527099003|261009223027099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	ZesyBvytBIzeJQe3J2C8ibdCOCOLRHwJy57TS2tHlwSER/7Gldu9vAXPSJrG/ZOv4Ag91YEFIBGi4S5Ie5gK7IXnjxHEvSfEbqgW7N/L2WPmdTmIyyN8bcKXd/5zOLrGuFuv2dv3xGXjN9rLJ1A7WozfAApZOa3jZftHESSqircQl/gUcxBQ1XHC9ur/SFPaeJsFLZLOy+zwpCiK4QqusbHcr2REzF0j7W7cehOIwSRziFZCoumsAeKwwizHk8Pg0KVhuIOOBUlk8I8DFLcazuInRB8JauWEUCIGZ6arzGM5k0xQptd7chbTLVqlSYdn8+TgfqC5zSDKGAvkzqvND8/dEsSSedhh8rtZIGYi6Lq1d3oSfGjqZP6qYEaHC1iDuOWEg0izXiquWsKe7Bl49NCFiw77HglBg5EM6C3eChhL//qHkVLoFJByy8D1W5ZdFLn7R309il/rsj3G6bTzEbJIH/pPth2eCzzAdeuKgE5s8zn+Fz/LyjrpNZwQsHFsOyT77+QWhU88oJ6jXBwhzEhj2qh5GiNhXDh46RtZA9ydlnweXLNmbdsgBZ0TRuYynWQONdfJeK72BiyPccJIN6QNO6LG8CFhHsYZZilM8xr7cDzdIlbTvuIvvY0FMd2Nkx0MKLP6zjxtd6quqxsAXEwbZfez5xUqSI/BCcMX9zGCkBbB2+ddDQmD/dGYY/RC5iVIWPIy8yV82OBG+Drhlw==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(11063799006)(261102123227099003)(56012099006)(261021121427099003)(261026121527099003)(261009223027099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LukKsN9cwqYGWqvNIThlV4lcn3A/csB2tKPpdtKR1DNv0QM8hGFjJsl58FYjpfRwVqVoZczZxt9VumHkgGXzhZDGChNyVHyIu0r5ldrRjMEzq5jo+tJBXOuqpmO4Z1426VCEqiTavWo7uIEayqR2sxk8rA+Zd1doYprTWmMiHKtCAUrC8rEn1OKgEGWE2s7APQ1KC8LtpscwfuhGSKoC30uPbIXS6ZseqvHocLsG7Ij7+2tjygIfDb7HERgha/CySRUhc7rqXj8Hn4B7EGk2ElDYkpTW6a2ODiw1JuXjKhqWDSr/b2dpcSAWyd3kIXVWvOPjSK5mjyGVj04juc2z+G7nTs/Q/TEEre9Bh4DmXnZsZR2VsWiAZHucs58b5k0u/MJGCvHEGt2ySFKBWGCWk5dJqr7B32+mCzx6EgyQnOjSu5J/paa9TM8W7ZC4w143
X-Exchange-RoutingPolicyChecked:
	bXYYTDekdmdTTOqor88jcAu/KuiODryWoUQxI5HfqwyVXc7r5ByXj+JNkc5itD8bs0hUBJ9y596vUPuhklf/On7xdSm7Bj3vc4nEfAIc0oMFud42t3Q0EkQqiMmphKMDsapJv1HPBxfvx/eghBsDCiqWAtycTZoVOju2rjGSDevDjekHYXQfbBV0K7KR2tor835UnLzH+MXJIzm4oTnp2W5woiFaP2cAvXmkQqylA07c86sP+uOwvcAzrPh9Gcj7D9njg0XfqseFTA16WUX9bksqc6qJPFoQpGcrd2e9c1o/ZKGUuD7rJF7GYj4tc6/iZcW0K/3Q3fg7EWeMtsBslQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sdVbMmZw0aWCWtMLcgOaWnc4zU5YFE+60BHrTG1yyUlQzh3F3W/p3L8VVoJJK2og9edx9sYVs16EfoCytSFlOQKTUp41t0vdzeyQHDVcMvUX70tWzGoG2Zehk0DT60njo63UP/+BjNLhN7olpSgu02zapLyIOLre/vjebgo1epJG8KUZplrFB4QZns1wxLdnOMrwIMIdMYZJdwXbTSA6pKYlPKeZj8N+2lhsu1vqzQ7wHeC1EAhPZK33uLbie8fuQY8t1JvYQfpLEcNmJdFcQONxu6G/KuIOkFs2h8MpcRVjtK1TJ7yWMn/aNQJ5HU19OO3SzJ+GWIk34qXxvj0ZT8rWEpS0+tSlLnYKpd/4TX8TfmuRfcOigXsTubGWdPCt4a3lD77YwcAsQBZGq7CjLoAW9DjzHbFbMitLHohvTG32s4qmkwlGeInd/GybBXCMXBt6MiNDo5BOIaLhpcb/vYDmdvV2OFkcrDz429UF8J5TkZMHCXNdNyhUIHGG0R7VubEfVyIkIuMYwhLjWFsX4zE6faSr9vvStgSIMyXPmQasRRXtn62wWcKkOaTjxQCopMS2MW9UfnJ0e7ekm/P3UZvJXAJigccRMZLDwFeDL5dV7rUkm5DnQinK7waqikbXr/SGDRBobHGb5qawfUHSpw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:37:28.9768
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a021010-3b9c-42cf-5755-08df3add5a85
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A7FE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR16MB4045
X-Proofpoint-GUID: LdYcvV7dt2uZfVJy1tLfz1hjn3itwTX7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX4XqErT6y8/gF
 CGXOYK8IYsKNSM5iI5ohCdmQB4cxwUUtFOkSmeogR1wJytVVXd8924m3Qhtea3VyzzmUR8auGwS
 gvyD//vFP/sfyN0IAxSE6BBND7Hp81dAEQ7oNFUhXaRcINOYq5VS
X-Proofpoint-ORIG-GUID: LdYcvV7dt2uZfVJy1tLfz1hjn3itwTX7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX/lUtAhkwjExi
 MPfCA7inGCIKlUK2IksX7pFhAPe+w/Op4wQCqcePBEqCPKvJ14YLAaZQd04viDYxz7cJwSfn7GV
 KbnqLDowZtLglaiiodRi4kgJd3rTW9mgw3W8Ytr0eEbv8P+/56psjyuo7co6mgb3AVKAZMwhwCv
 jxRMH4nt2gU7ulDbWiTlv/EIOVQOsDvcOaghL4gcJ0u+BkeJHQ5wEjU/zH06+8rtemt5INrSTVa
 yBMR4YlvzMps9A5Pk7ZyOPbSB/GU5GjiLEIhQf2GrUlso+pwtsSxHWquCK4pAN68DT5D5QVu9Zf
 GYNuFBUSXZ0e5DOZ8WPHJfgd1U2mvkgZ9zS45z/9B3oM6WvZGsxgJHi+UuXYgAW0Zl+Kee2Bopy
 btzbuUBYAIiBHs/wb7wvYjwPIvOODItbuLb/SZj7Q+mzE3zFJn90UVeZBmsbFw/qfQND024qJVv
 wAwIVD7lM+8ObwQDygA==
X-Authority-Analysis: v=2.4 cv=ScVi5fRu c=1 sm=1 tr=0 ts=6aebdddc cx=c_pps
 a=IOfmNx34m1n4z7i1CuCPOA==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=dw5MciS7gY-znkhJuOLE:22 a=cbNQJ9GKAAAA:8
 a=iNDwEz7dJgEmMV4xwJQA:9 a=3whSkbs7g9Me0DR5EJEX:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050006
X-purgate-ID: tlsNG-4011c0/1793842653-526DECFC-C17D61BA/0/0
X-purgate-type: clean
X-purgate-size: 1238
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Enable IPI latency test on hardware Zen2/Zen3 runners.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 automation/gitlab-ci/test.yaml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 4d7d5e3d9a11..98edf7eb9ff5 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -565,6 +565,14 @@ zen2-xtf-x86_64-gcc-debug:
     - .xtf-x86_64-gcc-debug
     - .test-jobs-hardware-xtf
 
+zen2-hvm64-interrupt-latency:
+  extends:
+    - zen2-xtf-x86_64-gcc-debug
+    - .test-jobs-perf
+  variables:
+    SELECTED_XTF_ONLY: test-hvm64-interrupt-latency
+    TEST_TIMEOUT_OVERRIDE: 600
+
 zen3p-smoke-x86_64-gcc-debug:
   extends: .zen3p-x86_64
   script:
@@ -633,6 +641,14 @@ zen3p-xtf-x86_64-gcc-debug:
     - .xtf-x86_64-gcc-debug
     - .test-jobs-hardware-xtf
 
+zen3p-hvm64-interrupt-latency:
+  extends:
+    - zen3p-xtf-x86_64-gcc-debug
+    - .test-jobs-perf
+  variables:
+    SELECTED_XTF_ONLY: test-hvm64-interrupt-latency
+    TEST_TIMEOUT_OVERRIDE: 600
+
 qemu-smoke-dom0-arm64-gcc:
   extends: .qemu-arm64
   script:
-- 
2.55.0


