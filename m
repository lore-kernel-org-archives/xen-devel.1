Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7597E606A338
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=nTjDpRcs;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=lq4Xed6L;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=glYqaB/k;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=RINZk+Xq
Received: from list by lists.xenproject.org with outflank-mailman.1473267.1680972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmNw-0003XN-9v; Thu, 05 Nov 2026 01:35:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473267.1680972; Thu, 05 Nov 2026 01:35:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmNv-0003W5-Vk; Thu, 05 Nov 2026 01:35:23 +0000
Received: by outflank-mailman (input) for mailman id 1473267;
 Thu, 05 Nov 2026 01:35:21 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmNt-0002r1-Cy
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:35:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmNs-00G6d6-Ox
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:35:20 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd50-8faa-0a2a0a5109dd-0a2a450ba0fe-6
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:35:20 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd57-b7e8-0a2a450b0019-94a38ff18596-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:35:20 +0100
Received: from pps.filterd (m0367129.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50n3kW891327
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:35:19 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com
 (mail-centralusazon11010003.outbound.protection.outlook.com [52.101.61.3])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hr99fkx66-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:35:18 +0000 (GMT)
Received: from MW4PR03CA0349.namprd03.prod.outlook.com (2603:10b6:303:dc::24)
 by IA2PR16MB6450.namprd16.prod.outlook.com (2603:10b6:208:4b5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:35:16 +0000
Received: from MWH0EPF000D8952.namprd05.prod.outlook.com
 (2603:10b6:303:dc:cafe::95) by MW4PR03CA0349.outlook.office365.com
 (2603:10b6:303:dc::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:35:15 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 MWH0EPF000D8952.mail.protection.outlook.com (10.167.249.218) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:35:15 +0000
Received: from pps.filterd (m0426315.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mM3K3108343
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:35:14 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4hp33swb03-4
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:35:14 -0500 (EST)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id OmNjxjTfWf5COOmNkxlP9d; Thu, 05 Nov 2026 01:35:13 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=qOs
	JRjyoDQvTbvcH6l7zxEClwnEuff0f3kYC5ZzqB5o=; b=nTjDpRcsvmErmw/Fkky
	peUsxVgO8YUJBflteWCSL+R9kQArZdMcqgPnNve1qHSz7rehxY23oKiKRUqHiXX1
	0q2jp9ugJYfHuLSU7IJAaWhHpTf+bWgHgweRULdVdN/m1/vv+75QjQvriBBJg6dP
	o8J9xunZ+VbBvWP/MqHOyOobSW4cGp8qzUjzaN6tGCLw3dPiMVRbc0dlepcwCSZu
	kx1yHQmoKfDnX8ZDy/kenryRCGv1J9vKvAPcsRjZQV3+1dtuchzhRD0jTjMdrrpX
	5mF1OqZ4B9/uZn3ewJdQ9C4zMh7SFKsApEM83kBZEXLx3oBMaR9sT0wHsiqqtYVx
	CoA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BLk86YELZ8917nLMLUuG3LbDdyoB8iXkimCYHPqkVQ+R6aI0kGMpxWhiJSi8/STbWyog6wpLEvpo9P4pBBnru8Gc+2CAg+nvZJe0NXN7cpyunyJQv/yaazmjgHfojAqSlBxh621X4DKkD5pu2+uDQa1xD5czQ4pR2tVhFgDbZepI7C5HJnSdBUklBWyWsSmVe1Xxg5+2/1ZMDNgoq4O9ysjtkHqAV8yfLBrDc8JXOi8isPV9SZAcFsdlOC635y7p8cqmZxg4wPbXCXihxKM21aG0Es8Dm9NwFwir8D4SmLVkMccERMlB7TKvlHTW1bMlbTgx1YJxc451FbZzesHkPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qOsJRjyoDQvTbvcH6l7zxEClwnEuff0f3kYC5ZzqB5o=;
 b=inahtb92IkcpRKSzGkgy80djss6vPAyuIZ6B11StVcXVyYwBkElyy8mI97EuTsxCfdHo5NNlxRR/8IDDdBaGe+ZWXmkPjDFFoTauEE9knyGwMEpRqJ4sR48/Sa8Ky6/UgJgVO59tDKwjs6xxZg0NtvcpfZZdf/65+FssSNXYEDxlBL69DtI6hevOti+DJaT+P48nK3VGO4Oxsr/WOxGkAhc643wutgE+gN058BMDXSxu2l34cfSPO/mwc5RECMF4O22QafX7rdksaafdxneVxul54C64t1bOtMfIfPUl/dsuOqP7gtnSX3Ph+aYXZwe0OSsPx/yGEZDdSFJufWNRSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qOsJRjyoDQvTbvcH6l7zxEClwnEuff0f3kYC5ZzqB5o=;
 b=lq4Xed6LegmkAeEemHuc6B+FS0hYiOSlm8SSYpG7dBsxubwdqdJ3WhrxkN2cgf0bUwaw5vsx6YguZ1wAdofPAG4kkXFQFvlSytQ51QNPXI5vsSnrIedt0JGzeoMqrtuwXOh7gsHn8tmSgTulUiDmTOucdZsJyfwTZWuxGNYbifc=
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
	ppserprodsaar; bh=qOsJRjyoDQvTbvcH6l7zxEClwnEuff0f3kYC5ZzqB5o=; b=
	glYqaB/k02mM8btyH77b8quWiXXSX9bSyGy9U/v8NumopMGOn37wSE0EboWJixpU
	VcLGlJycaRbTdGCU6AWaQnqwNEQI/srJ4kmqDh+apMsEF2x/soJgw/uYstz1HERM
	aVPZjojgsPmUK9HHUgKOG48bt3nJBlw3f9du9qSVD3mP2iZ6u1U3Xow2Y93Maiid
	VdS30+UU9vNP3DH+YoA053+9qo1qvTNtwspbCRbcC7j/Wc8O16NFmpkSexDY6oTf
	rCQPL5Mzakommu9ntcpjdv9xw7DOdk4do+10Daawoyv2MIDL7lGvXc5FhcTyxp20
	wpEuV6YUQ2ecaF9ONAZk7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=qOsJRjy
	oDQvTbvcH6l7zxEClwnEuff0f3kYC5ZzqB5o=; b=RINZk+XqgyF0kROSQskOj6I
	LLRo8pmro7z9aJ71UKiw6SSyzM/llY2P7xgktGa2nFcbf6n5hyQRJNHQVIF3y4i9
	AyVIXPrzv/VlwS86zVQLwZ68y2Xa/x2FaE2ogDBwGtZx3mSu7ad5Jlz+b9eiOfVs
	szGrCU31z7v18VRVKiW91jhEWt/yH8TkVplzsanGwQkxnUvHxJqS5F97V1Y1KY5E
	K71dlcSmh9lRcSy90xn57yIl7UaqoTU2b8OqahETA93qyKXLxa2pL9QQ8CuuvpOi
	ZH0wMbqFHZpusZ5EcVIzjqUJlQrV/xb0n1SZxBqb4XIw0eetSM7rJyvLNsthNEQ=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmNjxjTfWf5COOmNkxlP9d
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
        roger@xenproject.org, teddy.astie@vates.tech, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 27/28] CHANGELOG.md: add note on initial SVM AVIC support
Date: Wed,  4 Nov 2026 17:33:44 -0800
Message-ID: <20261105013347.719392-28-dmukhin@ford.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050005
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000D8952:EE_|IA2PR16MB6450:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a13d5a9b-10cc-4791-769a-08df3add0ae4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|11063799006|56012099006|261021121427099003|261022105027099003|261009223027099003|261102123227099003|261026121527099003|261026140227099003|261028144727099003|10067099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	gbDXFJL6Q0SKSXpQdEnWwrg/HufYP0SHYvfugKZWgBRCp4BtpfpGtwZG/X0oTla1FQnwhJ8Fqa0pJxdqxqraWa8NbVBj+le2CK+cs49ZxjN2VkX3zTPSu/AlLjtyXLf+vz8Wzgi/HIMwQotlRSmnQv8LdPSEGg938fn9WGJnyOEJULQ3gpw4W9J7vmLSmliIB2VEnAGe2LUbazL/cw1xLBUnL1JnEWcGthdgvm5DkLgsVEyu+tkeCfR/Y+uAczIGXLbOn0Ht8bWkg/lTonFJoOpCjG8xY0bvKt1iMvPv8oMulNYII7GRY5A51lU/nUQJCLSr9AENlqjInfZ9K23EIT9N6p8vhMvYzg6Ft45ebWdVY9jABA5fkTgbvsQQ+D/4qlRMi9rRYCHlLNSehyLx72mISk9pfcgTch8KkkjdaO0QCjS1ZEcSWZZMlPCSJTwMU5asZFepJG7rxly87gjFew4qxklZPT8QDYDjRGX+Ow3qW5/HC8uC+OsNu6ETSiRGEv6yYEBQecxoEfXv7I1Iu6ERKoZg9u3bzFkii8JVsh1Duwmkywm4PzRKmv91u2fobqPyga04nfoXqMXvkH1VCxGqpLjELf2mPoHCRf2k+fmAFpzQN+hch2KfmqLOe1wcQdswZzQqXx1mhlXL1T3ouQWc07Btb4UChqOhmv3k6N4=
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(11063799006)(56012099006)(261021121427099003)(261022105027099003)(261009223027099003)(261102123227099003)(261026121527099003)(261026140227099003)(261028144727099003)(10067099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VfKBbbVrlWkMs+t+WSlYvdYk1JZt98T8bKBBw3X+1ul3suPOEXyM4R+d7LXeUGCYXBJPwJTdzHX0WC1n6oAn8RZoMD6OkcVezjA4907JXAPhBeiEdg+7syobE0e7ICrhVvbTqKuMn79xBmJp9mxbfnnjA4zrvKEYR+s23M2MVDyYAPgwTILNImddxe4UptNb5sciUC91Hl6MBigd993dFZk8i33oQpthpueqGCzJpgq4AKx/nFizsOtVyBOwVjBLL7hX68rlRHoyfLwhhenDtISkr2oRSNZkdYq/Z4aH7KUTVui0HHbyZ341xCRvBMsiisyx3qNgexAoEOvUMVnwHa5jQOkfx3CNVSViSXtah7Be+t/5d7pe+8NZlxMmqbNZa2LaTBVkb7C2BXLS9Nf3S6yBkCq+upzeMGHanZS0JiYn35Bp48IOy1ftHyYyTuB0
X-Exchange-RoutingPolicyChecked:
	FHZcIaJWG66pKtNSxLjT+YVIGXurYhX3nuDVyZ9D3ewrBwkJeMJ7v4ENXjkH4zv0DA5OVGTDqtlldoYmLRiVLKVh9SqiTqTXMqK/3u0W6KsFO7SmlmNIPpHFlK4dZmdDlnN9ngdq6/2z6BPz/Xn5HV86x8cKrToDlsQ/jZlpIB+hhH6RL2uZUEa7zXz6xe3EBPxivW8Xzf1cCl0kl4qTTDSxGDYseR47QWDzIh1TTXT/Rq9BGfW9VsMkCOA+RPK7b+esxdqwY47dQkrzUKCTSS3L41EXZcNI9oGgGp9ALuhXx/xFIsoDcJkAuQ+nF0rjXnbYurOcmOfhRTsWFNL8Lg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wYRJoBs01WEaea/qjTtoklUAyexLqpdnx/tpJhAoRqSptZ1NuVJ/Z/85uSl6O47xPfka8NkqZKEoaE5lqp+G3C+2/mRmHQXB3SVHqPC+XgJ8wDGYrvwKD/jRJJxDBCzVmMOC9WJ2hcUUbkplOkYmm6VTKTENU4dX3gO/NdNRaVu+B3NBf8UOfWhwjxqkk28ZqWTv+2gRG9qqSQU6aA0umBG3DaavWEXx8Q4SwrXCVa2XYrHUJeU/v++z9QMGxzxd4Qy92HPac81HSxRVzlVBGGnnHPWwSYFjqECDqG7ZM9TvMrSugzYoApvU/6jy3ucUaBPUM2j4aYzVdH9wFFz1rpkgDrDBLvzBI/pZ390Yrwl14SpGB8bGHuMHUClyNHXOSCkbCSo/fW5gt8yyZAz81tozrYofaDvPjZXW6DtemAiALyuYsoIGAyoTuM6iD5CaQS3aDdh06IE2VtBMWtt+t8qro4PZRxgNxVyIPEkzRachoR0ycK0+QpnLxZBJ0mYHVEAvRlHR1nrQl83yFEzUyJO+1LgSmx8yllkDeFrHak7jTDDc8r0kVRlll3+hal7myQ7q1DNgmEX20t8pk/3IDPvbrU1tPP8vgGHcxoxyk1kUJmsOPqDytbKcOvF5CUVYcsZPhXIWVDXitqZS0dDuEg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:35:15.1974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a13d5a9b-10cc-4791-769a-08df3add0ae4
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000D8952.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA2PR16MB6450
X-Proofpoint-GUID: rAWjpCUdPTUsD9DfHqSEKpXrJD-mxYZV
X-Proofpoint-ORIG-GUID: rAWjpCUdPTUsD9DfHqSEKpXrJD-mxYZV
X-Authority-Analysis: v=2.4 cv=LcKpeTfi c=1 sm=1 tr=0 ts=6aebdd56 cx=c_pps
 a=z4Cvy7J80qD6KqIazgzwmw==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=X3KReqg2EL6A36SYCKpz:22 a=IUhvlq-UAAAA:8
 a=cbNQJ9GKAAAA:8 a=Mp1fN1wBtM18aOJufkkA:9 a=DqJYxgmhk6moR-_7_KoZ:22
 a=WmVTiCyuxqgg3mnwYu6p:22 a=HAt3PS7web1Nm6r8Pb4Y:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfX2jKxd7r9M0Ho
 XuDPB4fIT3LVdf2LM2HraM8Qx6NUfBI+r171U2uijiUrfKv6o5sZchleske3ubicpUmnxDZ6lAe
 vUfXAIHFRNte6oa2YUMDjMywWdjM7i9364JFvdeq2J4/BZ5FUkfaPTkUSXNm+/crRsJlfpGMOec
 XcvXn0euDZf1o7niiicagO+pGNM3940ZTLS5JFOHapbV28CBt/uxlUFp+/XNz6AUDMV77Q8fLvC
 wN/Hhvcv0TaWfznrY0cHYM5lxxgjmN9b6T2YGDMHyWmetfKMDKtfV4QA6cW6mmNIaretM/A20Qr
 fYG4N29uzc10R2ZCxNggJBVSw4Pfutbsuz8SrIxJAKWvILvXE1EF6dlAzluF6jN7OLkWzGDaoLc
 3dbN/inuI2R0WzxLIoml7PrqQIZlAAC1xRxGkvnJI/vrlS4t/ZVWI7f0pGjApDtMqqv5pBpa0sd
 GRL0hABOOhc/0KTfuqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfX59k8+1zhyvt0
 3jpfIGh2aP5SVAF+Det+mALli37Kh+PXm5w1D19krs6OhMYCulIAIfIv2tEr/qTGf7kw5FK898i
 JvkVNdvmhHcVkVOWn1Y9/WAb4jv+VvAuaAOF5/Wu6925xM4b1zCg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050005
X-purgate-ID: tlsNG-42698a/1793842520-AA2C49EA-9287A31D/0/0
X-purgate-type: clean
X-purgate-size: 721
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
 CHANGELOG.md | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 225397f12876..f657efba6389 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -14,6 +14,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
      permissions for the port range in question.
      XEN_DOMCTL_ioport_permission now needs invoking up front /
      afterwards.
+   - Initial SVM AVIC support to accelerate IPIs and posted interrupts on AMD
+     systems. AVIC with vLAPIC in x2APIC mode is not supported, GALog is not
+     supported.
 
 ### Added
 
-- 
2.55.0


