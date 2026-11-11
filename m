Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39923606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 19:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=sZPXWXU7;
	dkim=pass (1024-bit key) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=NmHNjc9h;
	dkim=pass (2048-bit key) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=MlM5TWC7;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=Pqv4/YXl
Received: from list by lists.xenproject.org with outflank-mailman.1484828.1688214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREJv-0005tC-JX; Wed, 11 Nov 2026 19:49:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484828.1688214; Wed, 11 Nov 2026 19:49:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREJv-0005sz-CS; Wed, 11 Nov 2026 19:49:23 +0000
Received: by outflank-mailman (input) for mailman id 1484828;
 Wed, 11 Nov 2026 19:49:22 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xREJu-0005YU-7z
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 19:49:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xREJt-00H82K-Ht
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 20:49:21 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c6b3-2eae-0a2a0a5409dd-0a2a45058cee-28
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:49:21 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c6bf-4cb1-0a2a45050019-94a392178610-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:49:21 +0100
Received: from pps.filterd (m0367126.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIYVSX878259
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:49:19 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com
 (mail-eastusazon11012056.outbound.protection.outlook.com [52.101.53.56])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4hvsu3u5n4-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:49:19 +0000 (GMT)
Received: from DS7PR06CA0006.namprd06.prod.outlook.com (2603:10b6:8:2a::7) by
 CH1PPFCCA16CDAC.namprd16.prod.outlook.com (2603:10b6:61f:fc00::a27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Wed, 11 Nov
 2026 19:49:14 +0000
Received: from DM3PEPF000265BB.namprd04.prod.outlook.com
 (2603:10b6:8:2a:cafe::79) by DS7PR06CA0006.outlook.office365.com
 (2603:10b6:8:2a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 19:49:14 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 DM3PEPF000265BB.mail.protection.outlook.com (10.167.23.248) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 19:49:14 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIZFbG196201
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:49:13 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4htkxw562w-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:49:13 -0500 (EST)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id REJjxlrmgam0hREJjxXedf; Wed, 11 Nov 2026 19:49:12 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=hQ7
	EBgg6wtjD1icd7YqdacPYruIsXsIyVZJKhIviadA=; b=sZPXWXU7hQK5an827Jg
	Z8b8CcYP9DWxgXKEVrxjYKpVmXtlz6LXBRDWWdXB88dojJxF1k/As17fs8Vjufaa
	MHO2mLEQ/9Al38AzHEO4WikHCLikUXWLxGAy4yJA6wDb1P7B+z83cOsAxAkC17fA
	XVZ43JzS/JsP1FL5ncl9YEJN+mnJiNhNyHype2h3vAwZ7jfLjF079cHzYnTJUreQ
	8T2hkHhhhZt9Asc5nahqnKwJQP1dDnDfkk/hJuxBP9fUbF/RRk9BI3mkpakhYG8S
	Tq6gJluosS0C6WdjaAmx2iAQ+fQ3DBDnnsmfv4YGN0ty9DAq7Wna56r4NVwnj2KS
	Hsw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oD+qVdEQv5PHqj1mQH6yR1LywxLGsq7aQBT52EJSUgaPc7jG1aiNj6UtSP9cy1X4kuabjMfAQMlSIxRMQbgp+E06S2sU8b3CzxRQoV53l0T9ZnIN2/oRLMJto8E3i3iuBooQy2RKdf5OAfcRaWI5RRnZUdyAZszgNLn0laTycCuxM1RCJX/2JVkIvMyWg4f3tXp+H5JU7fxzuDImAd8H8c0XSozuFUkx8Q2XOD7DOJE6NS+KppQTqQquQcNO1kOZnUAEBeshz5X8UrwiK035p1kNBMJB/zPg+assfw8GfrjwaPVG3nefBcztahkBL3g0epJTu6exsyhvx+xvCmQiRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hQ7EBgg6wtjD1icd7YqdacPYruIsXsIyVZJKhIviadA=;
 b=Gz4gNhemJAoZUgKIVsb7Vh2kavR6QQLBcy3WuuLMDb9V02KEz56cSsKW3Dth5/1cq0Ti+0r6F6/PuBdpvOejEaYCxYnrWq/G2XVh7g+3yYw0t2ieqCyx9BU8R5lvfAofulbnNeWk1h22yW68MAG1lOiJaVQR2lx4d9cLoq32ieSW8pAWRPaJsbQE4qTv4oqQagSBOaoOJtQnQLdKzdbaXu3I936S+s0wwCdiG6joADImIHDPTJ6GWqMow1kqz8vh6R31zhJkNHEuA0UFh+m0yriG1UanZYJZL4r2YvlS1ALlm30K9xtcvzvEcP8t3em+BcdBiJ9Ag8nF2/gLou9/Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hQ7EBgg6wtjD1icd7YqdacPYruIsXsIyVZJKhIviadA=;
 b=NmHNjc9hPzs/kKZwrEtl7UcFW0hp3jb5s7ERY6Yj3kv3K14euo8UIbsQfenHePTW9Vw3T+ZLGC/WvO+apiS5pR0eDRwBZOTt2RzZ+4g5ArJqW8FsJwumtU5I28CHm8QPH6YoxbVcTdBcxiLVBR4/TlS19FC2zR59NrgLe0nYGtg=
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
	ppserprodsaar; bh=hQ7EBgg6wtjD1icd7YqdacPYruIsXsIyVZJKhIviadA=; b=
	MlM5TWC7qgrZDiOGPmZjQJKaWRszN4cUOvm/XiLkrO1JualKvnXxCtGhGYMXc56i
	GSsE86owOsyQusdKAs5XnzR7o75NyslbgvCxcoT9ZA8w0LA2IJiaednljGlFprbC
	fj8BpY1liWmE056f0fOPxWE/zpLo/vHExsOwksuXAWGChWI/xsi8NNtFrrll8u9C
	qw3BI7GGHFeejQhf6uszOz4qiD05zE5beNYmuLBLyBcZF3YzjRNyXHuKjoZYdEGP
	fv7QyB910Ka4GO8l9DYzZW63I4fsH6MkjLMa20Ra1szVd4WWlQbDUzVWCbdx0X9e
	s+4Wkxnx6HeMB5Kndu9SIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=hQ7EBgg
	6wtjD1icd7YqdacPYruIsXsIyVZJKhIviadA=; b=Pqv4/YXl01jQPox8c+dWAwi
	mkbMC0Ia+3AxGjqqGXat2flU67Ve3wE1vSpFUL4timbUx9c18bi+/Tk5A2mvUgUM
	Y7a6O0ZH6i2pU7Lt4V4A3Wo+ZyjMiraQBeqUeQCZurytQlHOs0TCXBJsuOdFD5DU
	4kRiqExZPDTYbtYPNfVAfxQ37krGse/l6QCGsvJ5CZUD8dfVtqTjo0d+D372XWo7
	QgMCFY4MCZcsZ5ccfihJ5zkHI3LaX6J/c6fzRuvOD9GkmqkbCz5a0CA1rFwDJ+qR
	OjHjQ9n+t44q3gqHukpEBFW+YQ517XpuOlo5UJf3VjtO9Jdy0EfiwAI4tKgdVrA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: REJjxlrmgam0hREJjxXedf
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v8 24/26] ci: add initial NS16550-compatible XTF test
Date: Wed, 11 Nov 2026 11:47:58 -0800
Message-ID: <20261111194800.1070016-25-dmukhin@ford.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110078
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PEPF000265BB:EE_|CH1PPFCCA16CDAC:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9d0ea1b3-f3d8-4112-a457-08df402cdd76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|56012099006|11063799006|261026121527099003|261102123227099003|261009223027099003|261021121427099003|22082099003|18002099003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Oc4nQdORvEX7rnEVPO3qWDxmMp+ntv8sfnRdrdmzvwtQ87iC+vWbXuIzGT9+3NQHcIOjZo6/CtdK6m61V3jlI/3JxZ9rGLHax7yFCHvYDVCGdvrPwaxmecAsq+LJBKhirOf87luhTzR8XIdUo8cb0X8swXouQtJCysOpQfV2d1AMQcH2AlhW036ykagjnp3dt9LrRapKRFNqI/egXakuWv8ZmgjUSBnWOzkunwfRlrn0gLG6F7M5rtNonCUUKrq9TkNf6N/NuPLMSfDzy/qDnctM4SGlu3PxAkQiSN9Cog34qk7bDLu51xPLIEGTVNDTkRt8iAUJJIZTx2lHyMoyMtHnPM7DT/WmT26uL5Ts3fe3VCgxQXBP+Mjqxfad+nPHJDJpCgHWEDtBs+NSkHeSb9akLLX5Ti5DzwuGJpzK3kFWJJSdTCB+YS8Tw9ZyOOX77hu+OD+rCmyPVuxUqaGzmUAV0ANL102ZeaPW4kRBHerCNW+Zfve4nP83haWVOjZm4VZNgY9nW1koTrsB7DCrpdgxDYjeE+Nz4dVyzWBDp0EAcWVmmmnk/sKCGbV5Z08bT2HuLOnW+SbWZLfQu+pLM0o6mYLayBS/E/j1RTxsbSi7AhGEnuAYOiDDUYJes5ls0LAEcoBJfTKjSo3pGugcqiSI1THLKNe5SVlAIWeu/AdfKTEGmFrk9l0zqxj4ImvBYyM58AeZSYB1gBVj1afYIw==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(56012099006)(11063799006)(261026121527099003)(261102123227099003)(261009223027099003)(261021121427099003)(22082099003)(18002099003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	P/NouVK35VDjnWQimONodqJR6CgScKmuleyzGyORGPAIIgEXbSJXKlt8GJ3YcX+qoJ5NZepjph+l51L3y+1DfSG5VpeYRiWr+9RFSsPLZmZ764xv41b262g9fi9ed6meV4L80xb2TZhOZWgvAcFZG6jrWFVUeHSn9UfqEvtDlj54hqOefRifeUJbpwAuCjAu1az4mQDo91X9FhR/BtJiC3RWMTXqHHYbzcz2OXZY18msgEVSfjFq/gsKr7b222a/hO3x+pkrlH4ceE/s01e1pUQBydEd+rESPh+bBw2fO+xQ3PHQOmOg8cIJgY2y5HlzH3+w0QGnr6uOUbf+Wbw64w7OprfgZI2p9rGwJs1701JcsLteAFJkKKEwOM2PiEHSDlJzf6i/6UMRNZ05siwdKriwuzTs3BkvSxzy+EAvr6qTYS5DQ8M4ISnOg36dBmBY
X-Exchange-RoutingPolicyChecked:
	4XeAV8dHdEptcsIzXEpPxb8pl3mR9c/32t1ybA3FPmRoyuhgJVNK+0ojpU6B+JTy0ps/zceEXostT3HLKUAp6PFhSQvGd6NcOq8crGiVCkhGNQZVCWBL6OoAVApfcWkj2FnQAevsoW3Q0pr+Il1Io6isttU7GocW/rrikol/il59ezfV8ZcEX1zIyvR1NI1bH90WebLjqx/jiN2kJxlu62meXs6AMM6G2mIUrWK/vUoKqyhbNRWVSABHCPHmvHe3uC1QbT8qxc6Oi5CKt9j+HaZNB93kUaJjwuJvPO5S0H6Z5Q1lBcFILyI9iujoqmy4bfCTm3Z9iw1A9ip4sCuHiw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	V0K9PZbC7tRhrVICm5g+/qo3WB8afGuj9CJSi+RPL3wr5cF2mjrmOGHK0D49Gzgzk5rOSL1mqY5PwxTL7gwiY786s0P6jMMXXQu1at3UNc954fD77y/MzHVcGkDKGxWKN84r0afrwK2bFmeN77EGxI8kgrzemyNfsc+TNt6ARZeY4AOAD+QB+exxBcsXpaiD2gH8vuaIMifGblYNCEDhATh7tNUgKCydBfTP+ziLsyt7W2ab7vtaggGSylxPxZZ4nqF7cGlxavvhnG9P9Ihr06yRTvjwfW/AX2e52ZGabTKZnOaO7zGfwbpbWc9kPa/+yZwV5K2FfvvreFE5cU8Nv9e4NXU0kcGabVn4sunghUwMQI9fPODpvlsBvPwFkYiups5Znewq3j3UP8ziDPF4AEA0AHoExY8YQt+3ymzum/m4shkZ1m8DUgPVtiS5x0EOddVvYjnJXIBVt7wBUD5ha1aag+xivy/YAjVtXl0CifCajG0CrBVlxBbwJQb8MYq3CjLXnr11j9HqbslPF5w6Tgpf+zG9LYr7FrpbkYeGceeFfiI6VER0Cq6kh8ZPrc0etKgYltif6DCYZbpM8++pi/Rxq6aDgMyQ1B7wujryrI8F2Rpq4y7f4FUs/eJxh7yrRyKRbuE1Wm0udS/PbtDaAw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:49:14.5305
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d0ea1b3-f3d8-4112-a457-08df402cdd76
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3PEPF000265BB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFCCA16CDAC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX/Btx7SCCwT8N
 yMmVkXvXft9KpLUiPM1PPW/So2qGASDu+PyGjmzGNnFCCzoc9iXnrFtRKXP0ZvcMMPILQWZffOI
 dJVjO/bOUuelZaghANt2c2Ig9JBhk4alu5vOOEZvN1FclhZzt630
X-Proofpoint-ORIG-GUID: 3sdedtTyae2EGA2xv7yVRNm-fwj4N--w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX23jovfXdmLyI
 H+XLxDL6EF9sZgtz7InOBvEKFJ3vT4qi6jabdCs1P9qOSD6f763MIjVaXI5bADV008H9bEbNXX4
 jPezLlYmArihVuHuPeQ24HHwlFqgCtuEjKqrk5pTvI8jROhUrJPdErgcsqEbZEu1wMLYoQu3ka3
 oYlBkR2jMps5bD/KwrY1r0OUuPOhXsE8p4SDqjhU7aOpMDzUrwxu/K4r1CjK+Lx8TPVo1PNUJgY
 hBybnpzltbP+BUA/KrEaUYrJAGIpuvVopw4Vpt7UF0hVl+1/ILAtzLkUJrPVcoukExA7lAqm6m1
 NJ7qSFq9cbHBW19CIVeyirM7PHTWG2zvZz7KsWJVYONmHiG5tUVyEitaTrYd/+C8FToVlaY88GR
 Zu3FC3nhjRZ4s0HXZAcjuu53d097YYs4iC5Qnvnq7tpOiFTxV6hCqiVaQyWCatPdnyK2VOFdggK
 dzKdp+1SUONVZlhQUiw==
X-Proofpoint-GUID: 3sdedtTyae2EGA2xv7yVRNm-fwj4N--w
X-Authority-Analysis: v=2.4 cv=I5Pw19gg c=1 sm=1 tr=0 ts=6af4c6bf cx=c_pps
 a=68eZn42HhoOzQwLNwT8gAw==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=-OawqTZBqJjt90xPb8wn:22 a=cbNQJ9GKAAAA:8
 a=GxEeC_bPm4hUhC0v_DIA:9 a=G69WFyCBNqGPyalROSdv:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110078
X-purgate-ID: tlsNG-c201ff/1794426561-2491C2A1-416BBD09/0/0
X-purgate-type: clean
X-purgate-size: 2187
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Enable simple functional test for NS16550-compatible emulator by adding
  CONFIG_VUART_NS16X50=y
  CONFIG_SHADOW_PAGING=y
for alpine-3.24-x86_64-gcc-debug Xen build.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 automation/gitlab-ci/build.yaml       |  2 ++
 automation/gitlab-ci/test.yaml        | 10 ++++++++++
 automation/scripts/include/xtf-runner |  2 ++
 3 files changed, 14 insertions(+)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 3d37e0b572d0..f2072f6a9829 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -290,6 +290,8 @@ alpine-3.24-x86_64-gcc-debug:
       CONFIG_UBSAN_FATAL=y
       CONFIG_MICROCODE_SCAN_DEFAULT=y
       CONFIG_XHCI=y
+      CONFIG_VUART_NS16X50=y
+      CONFIG_SHADOW_PAGING=y
 
 debian-13-x86_64-gcc-debug:
   extends: .gcc-x86_64-build-debug
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 96127995d7be..4f4ce8aab9e9 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -785,6 +785,16 @@ qemu-xtf-argo-x86_64-gcc-debug:
   needs:
     - alpine-3.24-x86_64-gcc-debug
 
+qemu-xtf-emul-ns16x50-x86_64-gcc-debug:
+  extends: .qemu-smoke-x86_64
+  variables:
+    TEST_TIMEOUT_OVERRIDE: 60
+    BOOT_MSG: "NS16550-compatible emulator tests"
+  script:
+    - ./automation/scripts/qemu-xtf.sh x86_64 hvm64 emul-ns16x50 2>&1 | tee ${LOGFILE}
+  needs:
+    - alpine-3.24-x86_64-gcc-debug
+
 qemu-smoke-riscv64-gcc:
   extends: .qemu-riscv64
   script:
diff --git a/automation/scripts/include/xtf-runner b/automation/scripts/include/xtf-runner
index d1ef888465c3..41deb49d1c5d 100644
--- a/automation/scripts/include/xtf-runner
+++ b/automation/scripts/include/xtf-runner
@@ -70,6 +70,8 @@ function xtf_build_cmdline()
     declare -a cmdline=()
     declare -A per_test_args=(
         [argo]="argo=1,mac-permissive=1"
+        # QEMU emulates COM1 (0x3f8) by default, use COM2 for test
+        [emul-ns16x50]="vuart=0:ns16550,com2 -- console=com2"
     )
 
     cmdline+=("${XEN_CMDLINE}")
-- 
2.56.0


