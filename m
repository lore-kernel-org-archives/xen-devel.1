Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A74606A324
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 19:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=sLVOQTDW;
	dkim=pass (1024-bit key) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=Up9rFRrQ;
	dkim=pass (2048-bit key) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=R93sqbt6;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=X+Otfx4o
Received: from list by lists.xenproject.org with outflank-mailman.1484717.1688038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREIy-0006op-4i; Wed, 11 Nov 2026 19:48:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484717.1688038; Wed, 11 Nov 2026 19:48:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREIx-0006mB-VB; Wed, 11 Nov 2026 19:48:23 +0000
Received: by outflank-mailman (input) for mailman id 1484717;
 Wed, 11 Nov 2026 19:48:23 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xREIw-0006i9-P1
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 19:48:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xREIv-00F4Vi-EW
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 20:48:21 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c67a-bab6-0a2a0a5309dd-0a2a4505a2b4-32
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:48:21 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c683-4cb1-0a2a45050019-94a39217fa8c-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:48:21 +0100
Received: from pps.filterd (m0367123.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIYRbV3902362
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:48:19 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11013041.outbound.protection.outlook.com
 [40.93.196.41])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4hvtpxthqm-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:48:18 +0000 (GMT)
Received: from SJ2PR07CA0010.namprd07.prod.outlook.com (2603:10b6:a03:505::27)
 by CH3PR16MB6137.namprd16.prod.outlook.com (2603:10b6:610:1aa::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 19:48:10 +0000
Received: from SJ1PEPF000037A6.namprd04.prod.outlook.com
 (2603:10b6:a03:505:cafe::19) by SJ2PR07CA0010.outlook.office365.com
 (2603:10b6:a03:505::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 19:48:09 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 SJ1PEPF000037A6.mail.protection.outlook.com (10.167.244.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 19:48:09 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIZHm5196207
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:09 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4htkxw5618-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:08 -0500 (EST)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id REIgxNN83vYgUREIgxeEiX; Wed, 11 Nov 2026 19:48:07 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:Message-ID:MIME-Version:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=ppford; bh=jLshr6TnW6sNisjB5Hg/ZGQji
	LQ6ia8apUu2stCouG0=; b=sLVOQTDWgxtfdKmAuFCAhiC8oPopN5M68fFQyms5f
	l7rxEfDBH/Gf82DR42tzsouUMcXXkiQPkGJSTzMX5l60Sz7JHxJy+CtKN2DuYo31
	hMP/tbKPQsiukiAu932G7IdDZjMTkKw3K+/iUYaDW/wDlWbIBvpTEmfbUoh/ROGt
	6gl7Wzgf1dBR2fD/Rp0u0OKvtFsV6q/G3Q1W4Mp0owPz8hfUP49mV91nnO1EPOd9
	32yMzCngY/cFUvDxo8/GfN8sucYJx8IbomxMvw4zcH10O/rn+6RdI15lplnWZOqI
	fpyemXIH2bclNNdEcEnqZyMvxlAFwWGryS4mDAie7ulzw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vRbv29RHKt2qhLLy03aulp09n4Vgru93ry77iClGUWWQCxG3bSsipkgHAEjWGZCwUhAAP5sXHcGe4FqKhyMLjr54VXGwcmXOya2/LQKFZEjSDca9nT1Y1GEcMTvmCCxcgHe0AvK7bBbo74j6EZ9Ljp8UFRdC2lz3VNUF2T+Eyov//53KZ3gQ/Cwlg+CxxUS+mSHoDKKnvJsjnYk2wvAa6uOQcU4+IpNGD07xaLastiGBgR9Xuv8b13QQBlqLTfyFr93pdIwj/E22T7p7yeIiLY16w/JFch6cqoHfJOOdrLUPhpuB+sdf3wEaLpiuTcqhBT8BxPe7pFGERCI6mhERGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLshr6TnW6sNisjB5Hg/ZGQjiLQ6ia8apUu2stCouG0=;
 b=OeDoTuYppSncqPzS7j0DcfCl9bQ+A0HNv8/lwa4rIjYFQ527oY+vR7gxSx3vozJIgF3H00TQHBFQ0GuEDbqN6xH5cyaDAgne8lHI8z2zMkme1dgD3WVp8n2UweAa3XSMYRh9p1ptK82+FR9YHWZazPpAXNIGqISioIOtOb6p82eD2lxznKUj3vWYndL4q1NETrbbLUgcin+9bTU+jQPJim8DHY+XgOMryBXwb9MqamqxBM3ZlnrLBOYEpZmOfdMTBk/Zu509hgRRJjNJlKtRcr7oZy7rOfoSoCMKFIQGZne+2Yy4o/WYEpaxdoXe4Q0GktbPyp87A7FEzM8zpg81hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jLshr6TnW6sNisjB5Hg/ZGQjiLQ6ia8apUu2stCouG0=;
 b=Up9rFRrQ2LfSeIYOuOLQe8YUvl6yHWlTSsjW8sXzouEPKga+spA8kCYA8VMv6gqKJTeAg6+iuakqo1RBNR1r7hxx0zKLgG69xAXnlQCx7BIQ4fyngc4+dsnMN6ab5vQ28gjqDwjexvm4jc4qjXeE+MBNg9hi8IUZKTmTAZmFpjw=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 205.220.161.53) smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to; s=ppserprodsaar; bh=jLshr6T
	nW6sNisjB5Hg/ZGQjiLQ6ia8apUu2stCouG0=; b=R93sqbt68M89wMN5PU9rTIY
	lDl45mAA9kBzr9CwtFYcvjkEAVB4DtSNSmFV9AQ0n6dPKKpeWdsp3LnPJGxgrzRZ
	7DGOgviCxICWB2Vs4BLF0vTuFnHwdSXd9Cni0z2HonV3MNHONNP0mnGhV6GkVlFu
	+hqxcUSzA8CWITpZr/lVkT68r6OcxMXT3GcUq1KuZs+LCGRGFmuGTaZg3+OIqE/B
	G4yAwxq4MIHVTnBIHIljbBh4xQxCNyHS3EmGBxJQyBp2y9GIy8M6cQ2ES9IyHeWm
	qXL686az+cZ43dge+WuQrDYKEjom9Pq5R7EvHzpvRgGjzsnJWkWW7EdqF+xOl5Q=
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=ppfserpocford; bh=jLshr6TnW6sNisjB5Hg/ZGQjiLQ6ia8
	apUu2stCouG0=; b=X+Otfx4o2NILVYB5yQ+v9mHzhOLpb9bhtbT3qTpKwVWXcXm
	4CyG22PfcNAqtACEKpQXEqTzIVxNWIR2pxMy0DqSa64CWs8unBmf3e0tPW4jVNim
	dm81VVpsYmpSccs1VFctK3/+oZWcT2uMTOs9UCPkqmuHXz4iIP0kSR0z1iSLzh4K
	Q9Zzw678VkHtcxu15rD5WzN1Hv1AeKRFmVhOP5lIPHNcB4dDUcN5WST1WDnqwse/
	aSXvf+4zda0L9lvIiPlFbl1YL4MRbBLMTpvn0vp5i/A15Biw67Pl7/6a1v8hWtSm
	ijFyGcQ3grHXS3D4BykstJ5hFMb7DSd268EbQhQ==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: REIgxNN83vYgUREIgxeEiX
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v8 00/26] x86: introduce NS16550-compatible UART emulator
Date: Wed, 11 Nov 2026 11:47:34 -0800
Message-ID: <20261111194800.1070016-1-dmukhin@ford.com>
X-Mailer: git-send-email 2.56.0
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A6:EE_|CH3PR16MB6137:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1010a728-a502-4cdb-fe3b-08df402cb698
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|11063799006|56012099006|260925021311599003|260925022911599003|260925021911599003|18002099003|6133799003|3023799007|13003099007|261022105027099003|10067099003|261022113327099003|261102123227099003|261026140227099003|261028144727099003|261026121527099003|261022075727099003|261021123027099003|261021135927099003|261021121427099003|261009221227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	Ojh4eSW+n4hO+Hteg1jqInSzf0h0o45zCeElB9erF1eE7Pa91n5UevEtbiciEwN96a3Cu6+iURIhGVuM4qQ2ssU7DP+NqleQRJjisWZEYjP+nz9Gvs5lW4yLRsQ75gJePktpEMAIU8/lXcdxKLQZ2qcvrhjSAT7h/zCwC2/Y5DhUGFd4rSydEi5p2PHV1+c81kvuy0YM+hvhTWA5AnjnOVW8/CkMk22KKuxLdCLJ7P+u0zhRW4cYASzJlwD3KNQe3LGyYeyI60UZjw11AgNf9ZxmmXZPDAFcrUgonkHz9Tt9dlAGhmr//076XxA/sZ9wQUJu8OYhVRPwXQEWA5D8qXkGsJOU5vj6pr5wzvNHusV7Xvju8Ikou992d8iCM7PPD50s6/RFt3q8vr8HS2sjU0N9qzbgcqpZ0VHeDuh4littoKV+fGv6gQ1ITby5MGOs9MxDVSoDe3/iltjP9aGobFHmGiDWFcrt3YF0dYhEfqguZWPEZlXNFzICvrrt89yE4V+hosL2g5cIQToPr4FMXwE6e5nQO+AL6t//SJt4HNy1XeVjfp6168NEsTbUEzsu978HcWYvjbdM2K2s08ruzg0RCtqIyD7JBdOoM5/sXLoPZZAf0Ud6DDOb7xnX1TihhuMWEHip+wu91mTebmpmUQ==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(11063799006)(56012099006)(260925021311599003)(260925022911599003)(260925021911599003)(18002099003)(6133799003)(3023799007)(13003099007)(261022105027099003)(10067099003)(261022113327099003)(261102123227099003)(261026140227099003)(261028144727099003)(261026121527099003)(261022075727099003)(261021123027099003)(261021135927099003)(261021121427099003)(261009221227099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+zHzElotnmoPTvoHLCiJIXDsa6q6NeLvi7xq5KxIHiAuW3yiaTJ7uvpx1ToQRuY05/qL6m3towVnZv7aXZsFy4K77KMOPpXqKsfUScAJgNzqz6XpkRwbOcSJhjY0iEwnkjGC+8rQuak2A3y+1mTbjpuIy1jlDwRr0I5vF7/i7QrIHdESLrZlxf7Azf8ID5KkVfisfrowPOwm/Y3q/efG270hQ997wkvbor3oskWMcxFq3S/3A46yO/61388x2t4iNS+h8VY+Vzy6Tv9MBlFPwgvdyJdUrak+z4XKh6jcp4vpN9IcOq2m0vg+F0sxt/nugoPecsRAsMgbhhCJz/O9CUp8UofqDLIUF4YyMCzFGesnjVaA5tJAcn78Ok7JBw76A51Nw9FjmeGGRrmhKCjtxXPKv6FCLBc2vjX0/flGMsxkK6jRYJhzx1ez/Cfl7XrY
X-Exchange-RoutingPolicyChecked:
	BFgzSUDifoerZM2KACSubwL/M2SYZz4CuCFItn4okrgla0xNO6FYXHmXMkP0KlYWImdLxfk5jAcOEkz/TEj+9aOj4oUVDpt2Utmp024RiGERJcEEjORwzKUgQgh6A/Ley5ejztPEwJ865bL5A2XjW4F/Ko8Vn+qATJqr0fo49PU6g+qdgukpvgKdIPZy+7ci4EZ/ejhXBugpLzRr0RWuzROt0L4+wvHZk65D695aJqxsgWvGXgg8dCnORAN6XyVRtKDwl8sTo9NecCFuPiilBlfG7Bpk+SLlbQ7xwpKixqEDH+8NPnDtwCm4Zovsxi1EFzSz2vlMonFtvhNIuPehTw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dmIDoOxl7dVzinifVa3qwicq3OWRM9WGON6qKVgSirDE+Yy/LHdPm9RA6um1XYgPdZVn1G77YsvEPuQw019vfQOeeGiTjjRWI6h7UEP/542Zu7CWa74Mq7F9NQj5KBAmlM9ftvkKAiStECUXTSumERoSvCYWPZt5EkC0qFVUqwv60FBCKG1/WV+x1/UwWjYbppxVO9igUBbbuF9aBMpnfolHbRyNvod0QBipPja8E40+ZOrlsa2606WROhlliKSl6h716b5czYtmRf/6eTDW6OwuiVO2CU3BbGRqYgcbDOuZqXcjHd2775upZrtbTzHquAvdRruodQIbVX84O7Y+v9AxD+qHe8nGGi47vhsUFiQD2DQ7QKGB8dxN3tArFq/flu9T6KN7NL3AH68vpMnqmw990ivu4AFARYVAGJo7oCPeDIu73XE8M7rqj41EcwrXt0E3O6VWbL7cejAseVizZpxK9bpyOELVTYlX4duNaMiH0XB5qo7qLuE/15rLLYyKftgkYT+PRrDFHxBq0BBzmwx/Zd18Pr6UMR3U+EEHvLNhF60L6vsEJJnBodq0vCG/qx4YCcZw34YB4kz956MWUaDeKGtIEJ56HgCd8MTd8DbIhP1JgB5PLYTfbHpXNPo3tj408c00eIiRPpidJepU/w==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:48:09.5600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1010a728-a502-4cdb-fe3b-08df402cb698
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR16MB6137
X-Authority-Analysis: v=2.4 cv=V6XoQuni c=1 sm=1 tr=0 ts=6af4c683 cx=c_pps
 a=7U6MwrGrMRcsJNK5547h+w==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=N9_n2FxmZfwfyRXvS9-E:22 a=p0WdMEafAAAA:8
 a=VwQbUJbxAAAA:8 a=cbNQJ9GKAAAA:8 a=iyj75vv0KYrhdw943ygA:9
 a=3whSkbs7g9Me0DR5EJEX:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfXxzCrOTkCtypz
 LVyMiSPLxUOwnU3e19t8kmDdomB5MM+Vh5dIsKMRvQMnCD75bUKaIfk7iD/GhP73u9sizS2UR7P
 ozMEDF41jLMVOzQQF+hz0P2X7A8Bw8I9R8fjnOOabqEXGeBwoUkm
X-Proofpoint-GUID: unbDp7eZDjkQdLOgU_jRiIo4BnQkNuPF
X-Proofpoint-ORIG-GUID: unbDp7eZDjkQdLOgU_jRiIo4BnQkNuPF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX9esMOmgXeqhV
 j9dJilS/mh8JEef4xzy4PeQURm/h+KCqww07yZGH8pglrQaUIVExPLiSnIoYTFj8D6hvajEd4pr
 H/S/sgAY9hrpqzm3lF59bIq1zm4ZBNn0VBciusyrEMtRtQEOJFmcrMvJSTaDc4p2VboIXbHdgOr
 d8DpYXuN0M+XmgIqC7Zj83nJF0vy/W1pia4o1rHpEDvNGwJ9b/HIQIUHkDZkcZo/ECY8S0cCL8+
 gOwXOlzqtwrTMy0JvABtBYRbhbz+OcvBBNpRNpWKfFu+cRJBaCaAc2suK9uo+520noorltyE1ie
 Ji6nhSK5B/wjcfiGESOWRIW7dXDqEJx3bV9Fh+UW1vS7Hs7k7sHuh/EtY0lE4mpmlXUkoykHdLk
 yokNNvznzDVdCCrmBplxo9FMf/2OnId0CAGXsnMVJyIwZSxNT8tLYKnoSEDNYF+YyATP9d2JwqI
 u73HBwfzCk+Dh9+0BtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110078
X-purgate-ID: tlsNG-c201ff/1794426501-F54AC2A1-36BD3CF0/0/0
X-purgate-type: clean
X-purgate-size: 11113
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

x86 port of Xen lacks vUART facility similar to Arm's vpl011 to support x86
guest OS bring up in the embedded setups.

This patch series introduces initial in-hypervisor emulator for
NS8250/NS16x50-compatible UARTs under CONFIG_VUART_NS16X50.

In parallel domain creation scenario (hyperlaunch), NS16550 emulator helps
early guest firmware and OS bringup debugging, because it eliminates
dependency on the external emulator (qemu) being operational by the time
domains are created.

The emulator also allows to forward the physical console input to the x86
domain which is useful when a system has only one physical UART for early
debugging and this UART is owned by Xen.

By default, CONFIG_VUART_NS16X50 enables emulation of NS16550 at I/O port
0x3f8, IRQ#4 in guest OS (legacy COM1). Legacy COM resources can be selected
at run-time via temporary and undocumented switch 'vuart='.

CONFIG_VUART_NS16X50_DEBUG enables some extra debugging facilities useful
for NS16550 emulator development/debugging (disabled by default).

The NS16550 emulator is disabled in default x86 configuration and goes under
CONFIG_EXPERT in Kconfig.

Note, there's a follow on work for RISC-V which is based on that series:
  https://gitlab.com/xen-project/people/olkur/xen/-/tree/riscv-vuart-support-wip?ref_type=heads

Limitations
===========
- Only x86;
- Only legacy COM resources, custom I/O ports/IRQs are not supported;
- Only Xen console as a backend, no inter-domain communication (similar to
  vpl011 on Arm);
- Only 8n1 emulation (8-bit data, no parity, 1 stop bit);
- No toolstack integration;
- No baud rate emulation (reports 115200 baud to the guest OS);
- No FIFO-less mode emulation;
- No RX FIFO interrupt moderation (FCR) emulation;
- No integration w/ VM snapshotting (HVM_REGISTER_SAVE_RESTORE() and
  friends);
- No MMIO-based UART emulation.

Series
======

  Patch 1 introduces the new vUART framework, that is the code originally
  posted here:
    https://lore.kernel.org/xen-devel/20250624035443.344099-16-dmukhin@ford.com/
  Required for emulator.

  Patch 2 adds missing NS16550 definitions, required for emulator.

  Patches 3-4 introduces the basic emulator skeleton - state machine
  initialization stubs, I/O port handler stub, logging, etc.

  Patches 5-12 incrementally populate the minimal NS16550 register emulation.

  Patch 13 hooks vUART state debugging (disabled by default).

  Patch 14-16 adds Kconfig for enabling minimal NS16550 UART (disabled by default).

  Patches 17-21 introduce necessary changes to enable NS16550 on dom0 (and PVH).

  Patches 22-23 documentation updates. Note, that vuart= setting is not
  documented since it will likely change with hyperlanch landing on mainline.

  Patches 24-26 tests updates.

Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/3055921295
Link to XTF branch: https://gitlab.com/xen-project/people/dmukhin/xtf/-/commits/emul-16x50
Link to Xen branch: https://gitlab.com/xen-project/people/dmukhin/xen/-/tree/vuart-ns8250-v8?ref_type=heads

Testing
=======

  ```shell
  echo CONFIG_EXPERT=y >> .config
  echo CONFIG_VUART_NS16X50=y >> .config
  make olddefconfig
  ```

  To test w/ virtual COM2, the guest kernel parameters should contain
  something like the following:
    earlycon=uart,io,0x2f8,115200n8 console=uart,io,0x2f8,115200n8

  Xen command line should have:
    vuart=<DOMID>:ns16550,com2

  HVM
  ---
  Tested only boot of HVM linux guest with OVMF as the virtual firmware.
  SeaBIOS as a virtual firmware is not tested.

  Also, HVM is tested via new XTF test:
    https://gitlab.com/xen-project/people/dmukhin/xtf/-/commits/emul-16x50

  PVH dom0 or domU
  ----------------
  Xen is able to forward physical console input to the domain with virtual
  NS16550. To switch the console focus press Ctrl+aaa.
  Console switch is limited on x86 to dom0 and Xen.

  It is possible to run QEMU-based dom0 + domU test:

  - dom0 with emulator:
    ./automation/scripts/qemu-alpine-x86_64.sh --dom0-type=pvh --dom0-console=ttyS1

  - domU with emulator:
   ./automation/scripts/qemu-alpine-x86_64.sh --dom0-type=pvh --domU-type=pvh --domU-console=ttyS1

Changes since v7:
- Addressed feedback from v7
- Added QEMU tests for PVH guests
- Added XTF tests
- Added initial set of vUART requirements
- Link to v7: https://lore.kernel.org/xen-devel/20250908211149.279143-1-dmukhin@ford.com/

Changes since v6:
- Addressed feedback from v6, mainly DLL, THRE interrupt reason handling and
  fixups in vuart.c and ns16x50.c. Also plumbed new temporary swicth 'vuart='
  for ease of testing (CI unit test jobs are pending).
- Link to v6: https://lore.kernel.org/xen-devel/20250905232715.440758-1-dmukhin@ford.com/

Changes since v5:
- Split THR/RBR into two separate patches.
- Addressed feedback from v5.
- Link to v5: https://lore.kernel.org/xen-devel/20250828235409.2835815-1-dmukhin@ford.com/

Changes since v4:
- Split the series to make it simpler to review.
- Addressed feedback from v4.
- Dropped xl changes, which I will submit separately.
- Link to v4: https://lore.kernel.org/xen-devel/20250731192130.3948419-1-dmukhin@ford.com/

Changes since v3:
- Reduced the blast radius of the series, thanks to reviews, individual
  aspects (like console focus) touched in v3 moved to separate threads.
- Kept the UART emulator framework since I need to redo some of emulator code
  and there's more-or-less agreement on it (where to place, naming, scope).
- Applied the feedback from
    https://lore.kernel.org/xen-devel/20250624035443.344099-1-dmukhin@ford.com/
- Link to v3: https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com/

Changes since v2:
- renamed emulator s/NS8250/NS16550/g
- reduced the patch series after addressing v2 feedback
- introduced driver framework for UART emulators
- unified guest OS printouts across all available UART emulators
- Link to v2: https://lore.kernel.org/xen-devel/20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com/

Changes since v1:
- dropped kmalloc/kfree aliases
- fixed ECLAIR jobs (thanks Andrew Cooper)
- addressed console forwarding on arm32 and arm64 (thanks to Luca Fancellu)
- moved NS8250 debugging stubs into its own patch
- added fix for https://gitlab.com/xen-project/xen/-/issues/184
- Link to v1: https://lore.kernel.org/r/20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com

Ayan Kumar Halder (1):
  docs/fusa: add NS16x50 UART requirements for x86

Denis Mukhin (25):
  emul/vuart: introduce framework for UART emulators
  xen/8250-uart: update definitions
  x86: fixup dependencies for asm/x86_emulate.h
  emul/ns16x50: implement emulator stub
  emul/ns16x50: implement DLL/DLM registers
  emul/ns16x50: implement SCR register
  emul/ns16x50: implement IER/IIR registers
  emul/ns16x50: implement LCR/LSR registers
  emul/ns16x50: implement MCR/MSR registers
  emul/ns16x50: implement RBR register
  emul/ns16x50: implement THR register
  emul/ns16x50: implement FCR register (write-only)
  emul/ns16550: implement dump_state() hook
  emul/vuart: add global UART emulator configuration knob
  emul/ns16x50: enable emulator
  emul/ns16x50: add Kconfig options
  x86/domain: enable per-domain I/O port bitmaps
  emul/ns16x50: resolve physical I/O port sharing
  xen/domain: allocate d->irq_caps before arch-specific initialization
  emul/ns16x50: resolve physical IRQ sharing
  emul/ns16x50: implement IRQ emulation via vIOAPIC
  MAINTAINERS: add myself as vUART framework maintainer
  ci: add initial NS16550-compatible XTF test
  ci: add smoke NS16550-compatible PVH Linux test
  ci: do not merge: test

 MAINTAINERS                                |   15 +
 automation/gitlab-ci/build.yaml            |    2 +
 automation/gitlab-ci/test.yaml             |   37 +-
 automation/scripts/include/xtf-runner      |    2 +
 automation/scripts/include/xtf-x86_64      |    4 +-
 automation/scripts/qemu-alpine-x86_64.sh   |  325 ++++--
 docs/fusa/reqs/design-reqs/x86/ns16x50.rst |  386 +++++++
 docs/fusa/reqs/index.rst                   |    2 +
 docs/fusa/reqs/product-reqs/x86/reqs.rst   |   24 +
 xen/arch/arm/xen.lds.S                     |    1 +
 xen/arch/ppc/xen.lds.S                     |    1 +
 xen/arch/riscv/xen.lds.S                   |    1 +
 xen/arch/x86/Makefile                      |    1 +
 xen/arch/x86/dom0_build.c                  |  112 +-
 xen/arch/x86/hvm/dom0_build.c              |    7 +
 xen/arch/x86/hvm/hvm.c                     |   49 +-
 xen/arch/x86/hvm/nestedhvm.c               |    8 +-
 xen/arch/x86/hvm/quirks.c                  |    3 -
 xen/arch/x86/hvm/svm/nestedsvm.c           |    2 +-
 xen/arch/x86/hvm/vioapic.c                 |   10 +
 xen/arch/x86/hvm/vmx/vvmx.c                |    4 +-
 xen/arch/x86/include/asm/hvm/nestedhvm.h   |    3 +-
 xen/arch/x86/include/asm/hvm/support.h     |    2 -
 xen/arch/x86/include/asm/iocap.h           |    3 +
 xen/arch/x86/include/asm/irq.h             |    8 +
 xen/arch/x86/include/asm/x86_emulate.h     |    1 +
 xen/arch/x86/ioport.c                      |  168 +++
 xen/arch/x86/irq.c                         |   10 +-
 xen/arch/x86/pv/dom0_build.c               |    7 +
 xen/arch/x86/xen.lds.S                     |    1 +
 xen/common/Kconfig                         |    2 +
 xen/common/Makefile                        |    1 +
 xen/common/domain.c                        |    8 +-
 xen/common/emul/Kconfig                    |    6 +
 xen/common/emul/Makefile                   |    1 +
 xen/common/emul/vuart/Kconfig              |   26 +
 xen/common/emul/vuart/Makefile             |    2 +
 xen/common/emul/vuart/ns165x50.c           |    0
 xen/common/emul/vuart/ns16x50.c            | 1135 ++++++++++++++++++++
 xen/common/emul/vuart/vuart.c              |  266 +++++
 xen/common/keyhandler.c                    |    3 +
 xen/drivers/char/console.c                 |    6 +-
 xen/drivers/char/ns16550.c                 |   16 +-
 xen/drivers/passthrough/x86/hvm.c          |   11 +-
 xen/include/xen/8250-uart.h                |   30 +-
 xen/include/xen/sched.h                    |    5 +
 xen/include/xen/serial.h                   |    5 +
 xen/include/xen/vuart.h                    |  121 +++
 xen/include/xen/xen.lds.h                  |   10 +
 49 files changed, 2612 insertions(+), 241 deletions(-)
 create mode 100644 docs/fusa/reqs/design-reqs/x86/ns16x50.rst
 create mode 100644 docs/fusa/reqs/product-reqs/x86/reqs.rst
 create mode 100644 xen/arch/x86/ioport.c
 create mode 100644 xen/common/emul/Kconfig
 create mode 100644 xen/common/emul/Makefile
 create mode 100644 xen/common/emul/vuart/Kconfig
 create mode 100644 xen/common/emul/vuart/Makefile
 create mode 100644 xen/common/emul/vuart/ns165x50.c
 create mode 100644 xen/common/emul/vuart/ns16x50.c
 create mode 100644 xen/common/emul/vuart/vuart.c
 create mode 100644 xen/include/xen/vuart.h

-- 
2.56.0


