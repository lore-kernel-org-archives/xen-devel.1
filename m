Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B339606A324
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 19:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=Tkdt7mLE;
	dkim=pass (1024-bit key) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=UPaYApYV;
	dkim=pass (2048-bit key) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=iC1SIC2z;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=sEGtXYYO
Received: from list by lists.xenproject.org with outflank-mailman.1484715.1688027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREIx-0006iY-LP; Wed, 11 Nov 2026 19:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484715.1688027; Wed, 11 Nov 2026 19:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREIx-0006iQ-Hr; Wed, 11 Nov 2026 19:48:23 +0000
Received: by outflank-mailman (input) for mailman id 1484715;
 Wed, 11 Nov 2026 19:48:22 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xREIw-0006i7-1g
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 19:48:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xREIu-004lRd-09
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 20:48:20 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c67b-e002-0a2a0a5209dd-0a2a450ce220-18
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:48:19 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c682-f479-0a2a450c0019-94a38ff16b28-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:48:19 +0100
Received: from pps.filterd (m0367127.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIYSmg1667190
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:48:18 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com
 (mail-westusazon11012026.outbound.protection.outlook.com [52.101.43.26])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hvuej238j-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:48:18 +0000 (GMT)
Received: from BL1PR13CA0261.namprd13.prod.outlook.com (2603:10b6:208:2ba::26)
 by CO6PR16MB4097.namprd16.prod.outlook.com (2603:10b6:303:ac::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 19:48:12 +0000
Received: from MN7PEPF00000150.namprd04.prod.outlook.com
 (2603:10b6:208:2ba:cafe::a5) by BL1PR13CA0261.outlook.office365.com
 (2603:10b6:208:2ba::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.7 via Frontend Transport; Wed, 11
 Nov 2026 19:48:12 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 MN7PEPF00000150.mail.protection.outlook.com (10.167.254.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 19:48:12 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIZaJ8196717
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:11 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4htkxw561a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:11 -0500 (EST)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id REIixkdMcSDpjREIixIUbb; Wed, 11 Nov 2026 19:48:09 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=lUo
	my5f5YccVuBZxfGEiWjptgDkSNA0y/rCaFp30pvo=; b=Tkdt7mLE4QwF+1+/5/o
	pGiWrAvFzVa47u6WouZq6laAtrWJZ4eThOehCh99sVH2NWAmjBClZJfushOBrnRa
	FfpyRYTA95lC0vk6vAW4XpsdAOztoEg72IJB2828E6PEMILkg/Ja9POX2TjPPHcj
	cP86Fs9rDjBnUa6iUxV/vkwoCwP18WuiTamdSFe/COjxLyt0mj/K8bYt9GS0VyfJ
	xEGPyaMxJe7u2ryh9gYQLtGeSzg0OBFMrYSAttGBS+1rbUdaZbzh200GRg2f86Ad
	skV8zAabvsSBXg5rQNoQW5QexDfqJh+UGMQoOGRDoycBDrZ6JgXjI0ZI6OygLHM8
	9sw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yy3ZgTWcDCNoacNE7IcLdWuxqxluMaTqgaFhLqmRWvdxyfPQ2k1iTXWTJn48cENeePgpcFbDlgXqwmD2jPf1wRJ5WvmdUOHhsDYbujGlGQXXxJrCmZgdTzIUfi7xwVTfMUYMyJUcCP0ff6M18+nxMhSo5xX/M6PDLabndiQ47rxHzDkFlvWKKYLGExD65DHuECvC69KNSXODTUs8FmDRIg7gRfWb/sIAsieP/i5esyoqzxIdrKyBE9gP+9+YIlzzKr4hPC5pivvHFYNxL6250eLOsfOrkAa3K3/qnx0dVszKM4clVSBGnGXpPhkQisDEv8n4Ja6CDY+tWSj3X/AD/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lUomy5f5YccVuBZxfGEiWjptgDkSNA0y/rCaFp30pvo=;
 b=xJ+YPSj/PUlJI4LBu24iaWHzbDfAfwMIWy2kywLCPe53/wRQIwcC9FD5irBl72pEKAF+HEa+UbHkY3VHD0zO3sGe8jNZdVdekFyrmVOuH+raKD0kfK5KtUKLHhggvjRfiXrOoQoAFPn9ZItCONpnJKXnwyPiwgrgQTSJEW+YIuDDITVao+AqH1kBVN4+j612VXBqvNC84oZi2jx+2y4cFg4xBizXKXH8WLeyUm/RkQP/h2aWY5sxnFbCeJGbOzosBTAkA4LBVZE6ojgX2kL3BvL8Q0vD+KK+eNmlROC/AgqerAYGKW+JHwjHDi5Y+32jnOwEdVMLEZxCdACB1eVICQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lUomy5f5YccVuBZxfGEiWjptgDkSNA0y/rCaFp30pvo=;
 b=UPaYApYVZXDn5BoRF+ouUUQKkdGWRacJ/5r6+V/ibhu1yWuXyN5Qd8OqKP+/QthKrOydGVyMkLx8rmApb5z4nME1RaK7jW0S1XhD0IbL6WuxoaVtVAWTJptqFPh/hRWkiLrK62Nn49xZ+mq5dZoW3m5nqORqvRtK1AoKs2D0LgI=
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
	ppserprodsaar; bh=lUomy5f5YccVuBZxfGEiWjptgDkSNA0y/rCaFp30pvo=; b=
	iC1SIC2zmtgvOGHvml3ponKL0EpA1qYZB3RFqDLAuSR5zxa6fO/yAw7QmlHeFMXx
	wsrm3z0f1BkIKT3Rm2kFlVbDx6zNnIygUwqhg/Bv0i+LA8B8AujSEFN5M0IPWsvy
	pGz+kSqtRFKd7rAvP4DVW6ZQdCSa9Lh1jn3KLOLbb1CyB175QtrL5bxueWpB1DZS
	E4lOmHaOTjVm2u2lajfOtEHGc0pWR/GiKigrLGHVIAIdEcXG//nkzd4NZFjXPPUF
	tjNoS0ekSsMVzCGV7apH6Sgt5KzJPShJC2SKJ92qA+6lHccKAfiML3AaBNrtBmOE
	fDj2V9pmyGxKhYtAzLMmew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=lUomy5f
	5YccVuBZxfGEiWjptgDkSNA0y/rCaFp30pvo=; b=sEGtXYYOvEaIUW5woxht2EN
	UQMOtkVDAXoHZrtLXFo7Q/f0lcukBA9DUVAm5wDDnn/tSRQZkdG3Yf0ENGtEedEs
	hrldnODhRYn976ua7k0PcAM88v8zDEXFY8t9wxq+M61TQatf1GfeTj/pp1kjrmV7
	tpn9hZt1FGahG5MgmXn06XcbY4w869BjgW7iYZLjSpgrNRVCDj0/MODUURco8y2L
	eqO/1ZnO5U/WcNAjLPMmwODIahtQmA49GO7n+9M7pV48dOTe1d45s2rITe6FwCSL
	97f+Xf3yL7f7SdQh2yr1dxZPiSYDKmkLh+1QDEhX5bJQhEiBcuSf60b9yRfF+NQ=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: REIixkdMcSDpjREIixIUbb
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v8 01/26] emul/vuart: introduce framework for UART emulators
Date: Wed, 11 Nov 2026 11:47:35 -0800
Message-ID: <20261111194800.1070016-2-dmukhin@ford.com>
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
X-MS-TrafficTypeDiagnostic: MN7PEPF00000150:EE_|CO6PR16MB4097:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 190c8153-9f05-42ad-9f69-08df402cb849
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|18002099003|22082099003|6133799003|261009223027099003|5023799004|11063799006|56012099006|261028144727099003|261102123227099003|261026121527099003|261026130827099003|261021135927099003|261026140227099003|261021130227099003|261022113327099003|261022105027099003|261021133027099003|261022075727099003|261022115727099003|261021123027099003|261021121427099003|261026135527099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	TIs1YqublhvL3ems2Bd2PaAoWrNeZ6vk94FXyuRnrQ+AZoMMBQ5bnxOXffeScI0Xi3ChoTB0qz3E84mEQ7ZynNdUg9AxW4RBuT514eYwGjDQm5/8IgBwThFeoNm9LT7EPSFMgH+u+Vdmo16ierSs//buAo7rxnNfyhjjd2iNrP9Pdiy2OdsQEhwXBEe0pHQH3euUrIaMompT7sH+tSyOz/c6cYndumqZw7UqmbITFst2q3XjyuVSNyzHFhFf1IxLZJ+s4UXwOrPBp64tMt1a9lHEJM7rCwyb+nAeakJ/MAc+1acXr6iG63BaJZoRjZl72URgUxjxQ84Jq7H5GEHBq/Am6wUAIAtdDaR+PXeQqHlzegbEEO4OCArXLCUKdZ2pewd5KfWJW4IDxLN3tqBZX0+3MkzwCzEiRrY27d9Ifye4I1IxP2whe62tGi/JSAU6QuLxgVnv9ybb/cr5m2ui1HUNDbxTenLVH1plar5N3Zakxf+zyuoXMstO1Rxep/OZS0Pg/y/NTjZNbGaBggWGp4uhzQ181BhPegkNhMdAmoKalcoEzOeFJvn/IMIEhFY/BORAh7R9BsYKL4pMlxAaBoQ/PjIgQbjqR9fNsBO/VQ2wVGmAy16WSMH0cOjO6nacHvZvnftt49Blg4HftVrhTDzwp8v1QqoGRlNf0md1tC7Ki16t5+kkZIbfqcWBiqrZxxMyVpgm99+pHPR46tO9mQ==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(18002099003)(22082099003)(6133799003)(261009223027099003)(5023799004)(11063799006)(56012099006)(261028144727099003)(261102123227099003)(261026121527099003)(261026130827099003)(261021135927099003)(261026140227099003)(261021130227099003)(261022113327099003)(261022105027099003)(261021133027099003)(261022075727099003)(261022115727099003)(261021123027099003)(261021121427099003)(261026135527099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9DMYQipWnN3f8FKwAFM9Q+iL1hUBB3Qm2aXO3d5BON2BjADCeI7Z22GdAGj7MRFXhXbUamfFh1oQvBmXlIbxZmNQMPEvm38LYJZ02D2a5Wd768tBEvVKHJ1RctbpNAjJ4N3OYSp4VO7VHm3bQuvp//O5GgUynDxly0+1d5lvf95pd9dBQjENsL21kMyK9tNuSL34I3AcrizcONq1psPNz51FwBvWS/bRocLSkVcEPRR3XVh6DNYt6E2hx6bnVWMlevUzh+zXfTalOyFUokBlw2T/BrWN2MxPCaXQsGedRFIgGEtZlnZqlc4+o3BhQcOjeKCbwd7ceKNXR7wg86pDKiAzsvd2X6GISF61MnfeUn9EAWMc5CHzImO5+jQKLV8EDSFSHDjs5AsxpHyPOQs1E/Ye2MvLsCdTSAEfc7o9xQly/DeDZGbGYpIuacZykxSU
X-Exchange-RoutingPolicyChecked:
	FZtvHPONj6vWLRY0DMaOOCxaEewvqgOuWnK5Hz0wYNJGebRwVgzXYRG1//Z3TGJ/MjbVVUaNkqgiosC/mHzLsLlHcpiFXipmFjSCkrCyA4C8pStTmoQsNfEGxQSCVEDDo/OR1jlmAHd1FsXTda6JF9CocB51+JSoLNYA0pI4gloknXf5Vur2VgLWo04YiLWMozA48AADD6jMXLFjALq7RP5dT8nPK9+jFpap7/0tqdk4a/KPmSHn//soMJD+RZBtjsxgkFUeeJK0qmwD4nyIi4x8pGb3mC5v5aAOqQluJH8ZfMR/621gaD30O+jCjqYJi97PTkeKnfms0XptfgnZLQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hv9PuElzEx1WY6N1XP4Lh0iB8+/G/LMEgIi2FErK7EkwceUhmCfELowDBiTHbxWLV9UKmdHcxvxsZ4YiZtc7rM2xJm/LSWHQpZHfrkd2x4+oIsHwYsizMp1EsVO0heP3nJOP4z2pzAzO5iSL9Whmce99gvv36ZeoJmXudY8sVQ0GJxgbYQW1eRlzsZuNsQQ/ywJCjIx90E0l1WD4CxRseOqM8EGtfOpYvcZByB9ezO+qT0IBTzz8aSsXG6d1238lTGuLcHvgnshT51IW535m2BxsAkZ/AjkAZHqawuAoku8m9QrgkJVLOz5BgHAgAYDpSMArrqRn0nyX43h6ksM/MXrd1JxD/9jdqMODj6+1squMEb1njnnuPSMhmV7NAkXGtS3WiJioaGiq7xSg70rs0uAfrs7z5SkWXiZ/Q8Z7jsjVdil/Es0+7CvhoEd/+mqaecRE+j3fQERn5qFRK3i4yfvM4vqAw59hzQV97GQx4/jCJKMFrQiPWYaiO/eF4aIvHYubI+Sbr6bx4YNowMkFvfyCo5tMDvgYhM2YtZ4Gd1ROfrOYR2sZt01/QOuHqz7lphlal7jX7uCAILbUbR16/DNIxWDYEONzcpeeAv3iD+nG37rir45ZQgQOc2KKeWbqzZVg6e7roqH/hG068ahm0g==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:48:12.1494
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 190c8153-9f05-42ad-9f69-08df402cb849
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN7PEPF00000150.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR16MB4097
X-Proofpoint-GUID: S-KZEGkKwNhnIjoaQU5u8fwU3WEoFjuT
X-Proofpoint-ORIG-GUID: S-KZEGkKwNhnIjoaQU5u8fwU3WEoFjuT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX+WrGR2beRgPV
 2SHt6JpFy3K4sG3tex++ZP5fiXVVGrNPCVgszeZ8foXdXGMeO67rHl5zubXHhWTEPK9L+v++Kdq
 eodZbKT/Dcs5gMmCLq0aQ1Yy3F8gveceKvnhoI8+o8TQ/unpQd3ej4xucEiob3+AVBvB+aVG9LH
 Z7PZjIUlzs+J+BuVRML37y0/vlI+il0McLSaAwnidBu8vofAp6HNK5Jut8Cfv2X/aRban4uPOnJ
 Uq9HL810rN1SvSGfU4YGl4dQoeL9fSJswJXRiqF21H228+O6cl+GTGS5dXBxacyd/rdV9E1X3AS
 oTzQ2wXPukENZ5HKl16XZPnck2+6Y6CXjJ0a/UM5KpR3EM7/qwlLgM2yhYsLLXFFz1o/QKSPxk1
 dDIkr9uiDKx57jZZ89YqMKFW1ouT7RkR16TugWZtPotuBFINvMaTT/zlgl/y7+wtrP23yJNFDCJ
 VY/6ZF1djDN0cpmkSEg==
X-Authority-Analysis: v=2.4 cv=XspvqlF9 c=1 sm=1 tr=0 ts=6af4c682 cx=c_pps
 a=KbXMGX1SJVu0lhZGOc8PIA==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=dw5MciS7gY-znkhJuOLE:22 a=cbNQJ9GKAAAA:8
 a=W5_DUgqnoCTHQhHJrUsA:9 a=G69WFyCBNqGPyalROSdv:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX/avqWJxPdhIL
 G1w6Zn0Y5i7A5tb6RLGQ2X8tWnhlRR8woON+Ei5z+K0FCZ1+s+KLL/Xp7+FgYn16jVL/vDtPgYT
 uOD8bzTldgo4CRw7pY5d0iS9YFR6AS9CJdYMDAgWy4hd7lQS/p1T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110078
X-purgate-ID: tlsNG-d25034/1794426499-01CC3A5B-129F8452/0/0
X-purgate-type: clean
X-purgate-size: 16862
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Introduce a driver framework to abstract UART emulators in the hypervisor.

That allows for architecture-independent handling of virtual UARTs in
the console driver and simplifies enabling new UART emulators.

The framework is built under CONFIG_VUART_FRAMEWORK, which will be
automatically enabled once the user enables any UART emulator.

Current implementation supports maximum of one vUART of each kind per
domain.

Use new domain_has_vuart() in the console driver code to check whether
to forward console input to the domain using vUART.

Enable console forwarding over vUART for hardware domains with a vUART.
That enables console forwarding to dom0 on x86, since console can be
forwarded only to Xen, dom0 and pvshim on x86 as of now.

Note: existing vUARTs are deliberately *not* hooked to the new framework
to minimize the scope of the patch: vpl011 (i.e. SBSA) emulator and
"vuart" (i.e.  minimalistic MMIO-mapped dtuart for hwdoms on Arm) are
kept unmodified.

No functional changes for non-x86 architectures.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/arm/xen.lds.S           |   1 +
 xen/arch/ppc/xen.lds.S           |   1 +
 xen/arch/riscv/xen.lds.S         |   1 +
 xen/arch/x86/xen.lds.S           |   1 +
 xen/common/Kconfig               |   2 +
 xen/common/Makefile              |   1 +
 xen/common/emul/Kconfig          |   6 ++
 xen/common/emul/Makefile         |   1 +
 xen/common/emul/vuart/Kconfig    |   6 ++
 xen/common/emul/vuart/Makefile   |   1 +
 xen/common/emul/vuart/ns165x50.c |   0
 xen/common/emul/vuart/vuart.c    | 173 +++++++++++++++++++++++++++++++
 xen/common/keyhandler.c          |   3 +
 xen/drivers/char/console.c       |   6 +-
 xen/include/xen/sched.h          |   5 +
 xen/include/xen/serial.h         |   5 +
 xen/include/xen/vuart.h          | 115 ++++++++++++++++++++
 xen/include/xen/xen.lds.h        |  10 ++
 18 files changed, 337 insertions(+), 1 deletion(-)
 create mode 100644 xen/common/emul/Kconfig
 create mode 100644 xen/common/emul/Makefile
 create mode 100644 xen/common/emul/vuart/Kconfig
 create mode 100644 xen/common/emul/vuart/Makefile
 create mode 100644 xen/common/emul/vuart/ns165x50.c
 create mode 100644 xen/common/emul/vuart/vuart.c
 create mode 100644 xen/include/xen/vuart.h

diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 613511390ff4..423b8e717539 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -58,6 +58,7 @@ SECTIONS
        *(.rodata)
        *(.rodata.*)
        VPCI_ARRAY
+       VUART_ARRAY
        *(.data.rel.ro)
        *(.data.rel.ro.*)
 
diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
index 37256c8865a9..228dbe0055c1 100644
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -52,6 +52,7 @@ SECTIONS
         *(.rodata)
         *(.rodata.*)
         VPCI_ARRAY
+        VUART_ARRAY
         *(.data.rel.ro)
         *(.data.rel.ro.*)
 
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index d9375a961697..ca34974f5adf 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -49,6 +49,7 @@ SECTIONS
         *(.rodata)
         *(.rodata.*)
         VPCI_ARRAY
+        VUART_ARRAY
         *(.data.rel.ro)
         *(.data.rel.ro.*)
 
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 8f943e11ead4..e57ab6ff74f3 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -123,6 +123,7 @@ SECTIONS
        *(.rodata)
        *(.rodata.*)
        VPCI_ARRAY
+       VUART_ARRAY
        *(.data.rel.ro)
        *(.data.rel.ro.*)
 
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 5b289e444fa5..7f102a5ab3fc 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -675,4 +675,6 @@ config PM_STATS
 	  Enable collection of performance management statistics to aid in
 	  analyzing and tuning power/performance characteristics of the system
 
+source "common/emul/Kconfig"
+
 endmenu
diff --git a/xen/common/Makefile b/xen/common/Makefile
index f69d47d18934..60f2d9087589 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_DEVICE_TREE_PARSE) += device-tree/
 obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-y += domain.o
 obj-y += domid.o
+obj-y += emul/
 obj-$(CONFIG_HAS_SHARED_INFO) += event_2l.o
 obj-y += event_channel.o
 obj-$(CONFIG_EVTCHN_FIFO) += event_fifo.o
diff --git a/xen/common/emul/Kconfig b/xen/common/emul/Kconfig
new file mode 100644
index 000000000000..7c6764d1756b
--- /dev/null
+++ b/xen/common/emul/Kconfig
@@ -0,0 +1,6 @@
+menu "Domain Emulation Features"
+	visible if EXPERT
+
+source "common/emul/vuart/Kconfig"
+
+endmenu
diff --git a/xen/common/emul/Makefile b/xen/common/emul/Makefile
new file mode 100644
index 000000000000..ae0b575c3901
--- /dev/null
+++ b/xen/common/emul/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_VUART_FRAMEWORK) += vuart/
diff --git a/xen/common/emul/vuart/Kconfig b/xen/common/emul/vuart/Kconfig
new file mode 100644
index 000000000000..ce1b976b7da7
--- /dev/null
+++ b/xen/common/emul/vuart/Kconfig
@@ -0,0 +1,6 @@
+config VUART_FRAMEWORK
+	bool
+
+menu "UART Emulation"
+
+endmenu
diff --git a/xen/common/emul/vuart/Makefile b/xen/common/emul/vuart/Makefile
new file mode 100644
index 000000000000..97f792dc6641
--- /dev/null
+++ b/xen/common/emul/vuart/Makefile
@@ -0,0 +1 @@
+obj-y += vuart.o
diff --git a/xen/common/emul/vuart/ns165x50.c b/xen/common/emul/vuart/ns165x50.c
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/xen/common/emul/vuart/vuart.c b/xen/common/emul/vuart/vuart.c
new file mode 100644
index 000000000000..bd3b756fb4d6
--- /dev/null
+++ b/xen/common/emul/vuart/vuart.c
@@ -0,0 +1,173 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * UART emulator framework.
+ *
+ */
+
+#include <asm/types.h>
+
+#include <xen/err.h>
+#include <xen/resource.h>
+#include <xen/sched.h>
+#include <xen/vuart.h>
+#include <xen/xvmalloc.h>
+
+#define for_each_emulator(e) \
+    for ( e = vuart_array_start; e < vuart_array_end; e++ )
+
+extern const struct vuart_emulator vuart_array_start[];
+extern const struct vuart_emulator vuart_array_end[];
+
+static const struct vuart_emulator *
+vuart_match_by_compatible(const struct domain *d, const char *compat)
+{
+    const struct vuart_emulator *emulator;
+
+    for_each_emulator(emulator)
+        if ( emulator->compatible &&
+             !strncmp(compat, emulator->compatible,
+                      strlen(emulator->compatible)) )
+            return emulator;
+
+    return NULL;
+}
+
+const static struct vuart *
+vuart_find_by_flags(const struct domain *d, unsigned int flags)
+{
+    const struct vuart *vuart = d->console->vuart;
+
+    if ( vuart && (vuart->info->flags & flags) )
+        return vuart;
+
+    return NULL;
+}
+
+struct vuart *vuart_find_by_resource(const struct domain *d,
+                                     unsigned int type,
+                                     unsigned long addr,
+                                     unsigned long size)
+{
+    struct vuart *vuart = d->console->vuart;
+
+    if ( vuart &&
+         (type & vuart->info->base_type) &&
+         addr >= vuart->info->base_addr &&
+         addr + size <= vuart->info->base_addr + vuart->info->size )
+        return vuart;
+
+    return NULL;
+}
+
+int vuart_init(struct domain *d, const struct vuart_info *info)
+{
+    const struct vuart_emulator *emulator;
+    struct vuart *vuart;
+    int rc;
+
+    if ( !info )
+        return 0; /* Nothing to do */
+
+    if ( d->console->vuart )
+        return -EBUSY;
+
+    emulator = vuart_match_by_compatible(d, info->compatible);
+    if ( !emulator )
+        return -ENODEV;
+
+    vuart = xzalloc(typeof(*vuart));
+    if ( !vuart )
+        return -ENOMEM;
+
+    vuart->info = xvzalloc(typeof(*vuart->info));
+    if ( !vuart->info )
+    {
+        rc = -ENOMEM;
+        goto err_out1;
+    }
+    memcpy(vuart->info, info, sizeof(*info));
+
+    vuart->vdev = emulator->alloc(d, vuart->info);
+    if ( IS_ERR(vuart->vdev) )
+    {
+        rc = PTR_ERR(vuart->vdev);
+        goto err_out2;
+    }
+
+    vuart->emulator = emulator;
+    vuart->owner = d;
+
+    d->console->input_allowed = true;
+    d->console->vuart = vuart;
+
+    return 0;
+
+ err_out2:
+    xvfree(vuart->info);
+ err_out1:
+    xvfree(vuart);
+
+    return rc;
+}
+
+/*
+ * Release any resources taken by UART emulators.
+ *
+ * NB: no flags are cleared, since currently exit() is called only during
+ * domain destroy.
+ */
+void vuart_deinit(struct domain *d)
+{
+    struct vuart *vuart = d->console->vuart;
+
+    if ( vuart )
+    {
+        vuart->emulator->free(vuart->vdev);
+        xvfree(vuart->info);
+    }
+
+    XVFREE(d->console->vuart);
+}
+
+/*
+ * Print emulated UART state on the console.
+ *
+ * Must be called under rcu_lock_domain().
+ */
+void vuart_dump_state(const struct domain *d)
+{
+    struct vuart *vuart = d->console->vuart;
+
+    if ( vuart && vuart->emulator->dump_state )
+        vuart->emulator->dump_state(vuart->vdev);
+}
+
+/*
+ * Put character to the first emulated UART's FIFO with the physical console
+ * forwarding enabled.
+ *
+ * Must be called under rcu_lock_domain().
+ */
+int vuart_put_rx(const struct domain *d, char c)
+{
+    const struct vuart *vuart = vuart_find_by_flags(d, VUART_CONSOLE_INPUT);
+
+    if ( vuart && vuart->emulator->put_rx )
+        return vuart->emulator->put_rx(vuart->vdev, c);
+
+    return -ENODEV;
+}
+
+bool domain_has_vuart(const struct domain *d)
+{
+    return vuart_find_by_flags(d, VUART_CONSOLE_INPUT);
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
index 7103bf20a7c9..b5012c9cb26d 100644
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -22,6 +22,7 @@
 #include <xen/mm.h>
 #include <xen/watchdog.h>
 #include <xen/init.h>
+#include <xen/vuart.h>
 #include <asm/div64.h>
 
 static unsigned char keypress_key;
@@ -360,6 +361,8 @@ static void cf_check dump_domains(unsigned char key)
                            v->periodic_period / 1000000);
             }
         }
+
+        vuart_dump_state(d);
     }
 
     for_each_domain ( d )
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index e4df0bbc2eec..62ca32e5392a 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -33,6 +33,7 @@
 #include <xen/dom0less-build.h>
 #include <xen/sections.h>
 #include <xen/consoled.h>
+#include <xen/vuart.h>
 
 #ifdef CONFIG_X86
 #include <asm/guest.h>
@@ -639,11 +640,12 @@ static void __serial_rx(char c)
     if ( !d )
         return;
 
-    if ( is_hardware_domain(d) )
+    if ( is_hardware_domain(d) && !domain_has_vuart(d) )
     {
         /*
          * Deliver input to the hardware domain buffer, unless it is
          * already full.
+         * NB: must be the first check: hardware domain may have emulated UART.
          */
         if ( (serial_rx_prod - serial_rx_cons) != SERIAL_RX_SIZE )
             serial_rx_ring[SERIAL_RX_MASK(serial_rx_prod++)] = c;
@@ -654,6 +656,8 @@ static void __serial_rx(char c)
          */
         send_global_virq(VIRQ_CONSOLE);
     }
+    else if ( domain_has_vuart(d) )
+        rc = vuart_put_rx(d, c);
 #ifdef CONFIG_SBSA_VUART_CONSOLE
     else
         /* Deliver input to the emulated UART. */
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index ce1fa636db36..4fa7f62490ca 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -24,6 +24,7 @@
 #include <asm/atomic.h>
 #include <asm/current.h>
 #include <xen/vpci.h>
+#include <xen/vuart.h>
 #include <xen/wait.h>
 #include <public/xen.h>
 #include <public/domctl.h>
@@ -382,6 +383,10 @@ struct domain_console {
     unsigned int idx;
     spinlock_t lock;
     char buf[256];
+
+#ifdef CONFIG_VUART_FRAMEWORK
+    struct vuart *vuart;
+#endif
 };
 
 enum __packed domain_shutdown_state {
diff --git a/xen/include/xen/serial.h b/xen/include/xen/serial.h
index 3a71da767dd7..ec481893fede 100644
--- a/xen/include/xen/serial.h
+++ b/xen/include/xen/serial.h
@@ -32,10 +32,15 @@ enum serial_port_state {
 
 struct vuart_info {
     paddr_t base_addr;          /* Base address of the UART */
+    unsigned int base_type;     /* Base I/O resource type */
     unsigned long size;         /* Size of the memory region */
     unsigned long data_off;     /* Data register offset */
     unsigned long status_off;   /* Status register offset */
     unsigned long status;       /* Ready status value */
+    unsigned long flags;        /* Emulation flags */
+    unsigned int irq;           /* Emulated IRQ # */
+    char compatible[16];        /* Compatible string */
+    char name[16];              /* User-friendly name */
 };
 
 struct serial_port {
diff --git a/xen/include/xen/vuart.h b/xen/include/xen/vuart.h
new file mode 100644
index 000000000000..b5785b3c6b8f
--- /dev/null
+++ b/xen/include/xen/vuart.h
@@ -0,0 +1,115 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * UART emulator framework.
+ *
+ */
+
+#ifndef XEN_VUART_H
+#define XEN_VUART_H
+
+#include <xen/serial.h>
+#include <public/xen.h>
+
+struct vuart_emulator;
+
+enum {
+    VUART_CONSOLE_INPUT = BIT(0, U), /* Physical console input forwarding. */
+};
+
+/*
+ * FIXME: #ifdef is temporary to avoid clash with
+ *   arch/arm/include/asm/domain.h
+ */
+#ifdef CONFIG_VUART_FRAMEWORK
+struct vuart {
+    const struct vuart_emulator *emulator;
+    struct vuart_info *info;
+    struct domain *owner;
+    void *vdev;
+};
+#endif
+
+struct vuart_emulator {
+    /* UART compatible string. Cannot be NULL or empty. */
+    const char *compatible;
+
+    /*
+     * Allocate emulated UART state (RX/TX FIFOs, locks, initialize registers,
+     * hook I/O handlers, etc.)
+     * Cannot be NULL.
+     */
+    void *(*alloc)(struct domain *d, const struct vuart_info *info);
+
+    /*
+     * Release resources used to emulate UART state (flush RX/TX FIFOs, unhook
+     * I/O handlers, etc.).
+     * Cannot be NULL.
+     */
+    void (*free)(void *arg);
+
+    /*
+     * Print emulated UART state (e.g. emulated registers) on the diagnostic
+     * console.
+     * Can be NULL.
+     */
+    void (*dump_state)(void *arg);
+
+    /*
+     * Place character to the emulated RX FIFO.
+     * Used to forward physical console input to the guest OS.
+     * Can be NULL.
+     */
+    int (*put_rx)(void *arg, char c);
+};
+
+#define VUART_REGISTER(name, x) \
+    static const struct vuart_emulator name##_entry \
+        __used_section(".data.rel.ro.vuart") = x
+
+struct vuart *vuart_find_by_resource(const struct domain *d,
+                                     unsigned int type,
+                                     unsigned long addr,
+                                     unsigned long size);
+
+int vuart_put_rx(const struct domain *d, char c);
+
+#ifdef CONFIG_VUART_FRAMEWORK
+
+int vuart_init(struct domain *d, const struct vuart_info *info);
+void vuart_deinit(struct domain *d);
+void vuart_dump_state(const struct domain *d);
+bool domain_has_vuart(const struct domain *d);
+
+#else
+
+static inline int vuart_init(struct domain *d, const struct vuart_info *info)
+{
+    return 0;
+}
+
+static inline void vuart_deinit(struct domain *d)
+{
+}
+
+static inline void vuart_dump_state(const struct domain *d)
+{
+}
+
+static inline bool domain_has_vuart(const struct domain *d)
+{
+    return false;
+}
+
+#endif /* CONFIG_VUART_FRAMEWORK */
+
+#endif /* XEN_VUART_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
+
diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index 958f8256b0fa..5e630d371471 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -231,6 +231,16 @@
 #define VPCI_ARRAY
 #endif
 
+#ifdef CONFIG_VUART_FRAMEWORK
+#define VUART_ARRAY              \
+       . = ALIGN(POINTER_ALIGN); \
+       vuart_array_start = .;    \
+       *(.data.rel.ro.vuart)     \
+       vuart_array_end = .;
+#else
+#define VUART_ARRAY
+#endif
+
 #define EX_TABLE                  \
         . = ALIGN(4);             \
         __start___ex_table = .;   \
-- 
2.56.0


