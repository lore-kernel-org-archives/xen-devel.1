Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F699C5AC7A
	for <xen-devel@archiver.kernel.org>; Fri,  7 Aug 2026 18:11:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1386265.1628285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wsP2K-0001Lh-7P; Fri, 07 Aug 2026 18:11:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1386265.1628285; Fri, 07 Aug 2026 18:11:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wsP2K-0001La-43; Fri, 07 Aug 2026 18:11:16 +0000
Received: by outflank-mailman (input) for mailman id 1386265;
 Fri, 07 Aug 2026 18:11:15 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wsP2H-0001LU-Mn
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 18:11:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wsP2G-004Xa2-K4
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 20:11:12 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a761fb9-e002-0a2a0a5209dd-0a2a4509cb34-2
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 20:11:07 +0200
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a761fb5-be1a-0a2a45090019-94a38ff133ca-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 20:11:02 +0200
Received: from pps.filterd (m0367130.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 677GPY6I687294
 for <xen-devel@lists.xenproject.org>; Fri, 7 Aug 2026 18:11:01 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11013000.outbound.protection.outlook.com
 [40.93.196.0])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4fwh9ytarq-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 18:11:01 +0000 (GMT)
Received: from BY1P220CA0026.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::17)
 by DS4PR16MB935079.namprd16.prod.outlook.com (2603:10b6:8:34b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Fri, 7 Aug
 2026 18:10:57 +0000
Received: from SJ1PEPF000026C7.namprd04.prod.outlook.com
 (2603:10b6:a03:5c3::4) by BY1P220CA0026.outlook.office365.com
 (2603:10b6:a03:5c3::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.24 via Frontend Transport; Fri, 7
 Aug 2026 18:10:56 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 SJ1PEPF000026C7.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Fri, 7 Aug 2026 18:10:56 +0000
Received: from pps.filterd (m0426316.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 677GPpos735195
 for <xen-devel@lists.xenproject.org>; Fri, 7 Aug 2026 14:10:55 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4fwht505re-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 14:10:55 -0400 (EDT)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id sP1xwLQNMQLYTsP1yw4Ucm; Fri, 07 Aug 2026 18:10:55 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppford; bh=TlrCq8h8VLV4J0xBkPzKOMs+OF2
	Q33B6BaooHIRCSes=; b=dSNxbnYlbOfMQ/i3QdM16QIbLUGyMPY8QiCqTa/9mYc
	4xGg637+10oRqg5Ez0Gkv0TGYcDoP4Ag4bLNSP74DBcR5/vxXzf5lgQ7A4ikziLt
	WgXv+dlOLnExp40t0EXCxsPINAkvMGbcwf8ZK1hIOGKLfdYq/ONDDrtCw0HkMeT2
	Oi9TEyfDF0P3n6tXMa6FaeS88lNmgr2I1IMBghv2duijnRLEuM/CSQ7lxgA0BKv0
	12l21jn72RMVfFtZm4f3rUY6tcYw0g5mvVOuRzh8YgXSYWP98hMLuixj4lAZReHr
	/tk5y9Ghl2U1AbfLk2RKUiiHAYh3ub5D1qGmUk02Fxg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lPolVldk7IM3D2km7fe4T51PyP8/3j+YwrXq6DwlVLkd4YkU7jcnJzffjtO+0nkxi7yEscx1hp/1RQ4FESR8QpfY53YqO2Iu2Uq0eDTp/PFQQ0WYUeP5nyFqVcT8+/IPLL5HUcBHtVbBBo2EARGBBrOwxANH7YygheAAP/gQ8W0wxDl8Vde+b0jVySZg+V3pRWLLvcbhi+y77mMks9hoVXJB1h5YFeJ1lCViDFzl/jV+ivDFG2efYEx86lWRc0se2PU9W/3khIBBVlpiu6GrUjG/n6iwy1xZl1Zqzcc5k7T02Xh5K2hImnUrXGDCpKnTQoxKzV+Wkm04mCEHhjbpng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TlrCq8h8VLV4J0xBkPzKOMs+OF2Q33B6BaooHIRCSes=;
 b=mLeTJLPq5e0gIwTVdBevH2yrvoEA3al+wZXy+ocxKneQ2AaxU2nqD0sCsnRKUJfC7jPKWdwjcRn6l7oOozz+RdP+HyUZbskg/pa5ky3OB2fqpuA1h6MFL2ALrsgMQjEJqNsdJ/XmhuAD+MdSBaIYQ5OE6YqMTWi6doyRxlQSCmBEAOj7LKYWQQwH4CZCHKBaNnk89c2CF+o3eoFX1Den43NXDcdfIXuqnI/UE8PtPTyNiI4MEt0ENBXjlCXMr05F29DldMEe81gC9nDxpvstSi1S6WmP7Deq0GFV11XERJdluWm6+leQKooVrVnlgxGyJbpT+AB2fjdqiCmg6iNcjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TlrCq8h8VLV4J0xBkPzKOMs+OF2Q33B6BaooHIRCSes=;
 b=FCkKc98XClcLVRupCG2uF9z6+6WNW8eSe+9CR39Y0gxlPlifEnsKf1KSwbie93/IG9k8osUhd5TuTNa8gidgI1Qj+XEy9S4rWLLHcnkrfSQP+8Zf1Ym2uEwaUj5tNxmIHAmLoS0f8eFHRf/LXgDwol16fQR0GjBOAATu0MXIWWo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 148.163.138.245)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppserprodsaar;
	 bh=TlrCq8h8VLV4J0xBkPzKOMs+OF2Q33B6BaooHIRCSes=; b=V/5aAixlQ+It
	bX2EfjGhBOHGGl6ok9T6b5weqvYrCAJH9nY17x7rEQ5ZQBwT7yjA80CSEVAo5j0S
	bte6KoHvDodtSM5z9L+bXRqHQhMgxakp/pf9dcmiG25eD8+mDkocN6nl+Znxke6l
	TEjSKwY0CpBEjicfeCn7332jrWm5VnCC1VWDvsJpPszDkaK9iy6+cdxbp6v13mrl
	ni/7+54HfPFsuWDxhAYh+cHF3KOpYCvSjXLenHGE6LN1nxFDKVBBzUj9NZncSzM3
	2ZjK2Dt/2UueuiTe+inw5Sg6djTVcmQagnKPuj/k9+jzfSXTHLWiSUU8ao4MSDCf
	OtQCnUSCRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=TlrCq8h8VLV4J0xBkPzK
	OMs+OF2Q33B6BaooHIRCSes=; b=JtgH0VxNYzBf8r8lcqxqrhP0YiLtSa2Y1IhG
	I9V/HwEjRsWXMIaxIuBhTOeR6oYHhXZ9uIPGPj6VbaYlntAVpG4F/FDLLmlIMkY1
	e2feQqS+zqfLZDR+KJmhVDE/5n2lvr8iOCu9GU/Vm5gtjFBlI7dn9FSVDcW5d2N7
	o/pZV6BFwEVM3zKnH8i5R1/Ybl4duEX+Y5/EpM0UIJ42/C0ty9Tltp48BIBBGlGc
	M5sXSFKHIjyIi0rQ2XlSIoiR5Lt4o0sR4tme9Ykk/a/1vU8oe+L0ljXBQI3wJoVS
	blTzUA4+Pjl9M2bu3LYBW34I0sRJkni3QzSr2Dhmxy78JtLQ8A==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: sP1xwLQNMQLYTsP1yw4Ucm
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Fri, 7 Aug 2026 11:10:52 -0700
To: Jan Beulich <jbeulich@suse.com>
Cc: dmukhin@ford.com, andrew.cooper3@citrix.com, anthony.perard@vates.tech,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] acpi: reboot: log reset parameters
Message-ID: <anYfrNnXTsWJJ5kH@kraken>
References: <20260801031737.344756-3-dmukhin@ford.com>
 <0491d3fa-ea8f-4cd7-822a-9c5a9be8d8fd@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0491d3fa-ea8f-4cd7-822a-9c5a9be8d8fd@suse.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070142
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C7:EE_|DS4PR16MB935079:EE_
X-MS-Office365-Filtering-Correlation-Id: 41fbe0de-83e6-48d5-1601-08def4af3a60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|18002099003|22082099003|4143699003|11063799006|56012099006|13003099007|10067099003;
X-Microsoft-Antispam-Message-Info:
	uYxjCVJfNd6gFypYbtjtQ94sZU49xJmIcqaSdTwPBEum31K0peJZUCwiMwQgJqFS2lLf4Qk0siBOXm0EyrIYgadLD9oIo+T2JDvmEdn6uR6w5o1QTaIhbyRv6fuoiFlfgSWx+bfRVpf65pNfgaQnMdKEzGlPlzG4jdTfOWCjyv/WQQLEHvxR7KVJLiXP41hKfhY1/NS9stiLdQLQRtLiAP8x7vZ2Gkz3hrRc9limypHMtCbnSzp4WwEE3QtPedHKix1cHsVhsRQRmaB9BHkPw2e2IRnHG8uSXpxyQkLB7msqo0kTwY5ZIf/7Xo25mGA2AyJ1zz6+tiWZseYQNharQj8m4dbsAjCTXWgYsIyEoXKN+p4I18O9pm2RMRuSKM7Hlj5VyhW3uNPFVvbe1d6VskaN4JsKVHZ5liIurNSLfvcutFg+aJtXrhAuvuTi6Ow4Cq0XzUuEziI3hd46wr24BuoZY7flAhZs2GnZ4s75fzoxk5Cu85HiglmvL+YeE8wplCSxzGNgz494e8dT6l2/FYUg5G9RaSB5KtKrW6ee0tDKZspcal68J79O5TWGWoS9wPw1XZr4AOFeQvPVG8L33aRtWSqWodI6tCdzJitvVTi6fHz1E1jRsgzEOMcGI0Mqxzo8WkM40qjS4NLWX0dtZIhBaTgFHU7DZRdjHeHrUt39oQEr/n4kICiv3ubajY9kYkzqdh9K3DBMfOESr8NHhg==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(13003099007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ni41hoY3aOp2ceXs5ViB1HR4xkl5pe/eRfpWIzelALq5HTrfMjdz8YDBNT9678ecaHlkC/ALVZ6Rsg9w2WPwoySHgVuqzlFRPiklXNuwVEkvlMG437FUVf2uihOccEvWeceR9bhS/4CZoX4jy4kwPx9Npf9wO8BwC/H1vtp0h2hU8+i034YZx2bdIPc130Ixx3bn5Z9mD0yZa0g7duUFj0BWSxaddQ9J/7nbfrW9sgrxQ6MnJHmlopj3CAHFb+xBEnzllF290F/x0eW9QIrm05mxzDQSyqIf0IVojEBnq1vAPeUoNJw0WnMKMpEKEI3BJoCNN+cMbekigz0WNH0dcnZ+6mpgn29efqnB90djEZKVSFzIFoTL7EsQNHpym/pPt2yhBucZCyr2ZNyh31LhJIY26fCRT+jKsTUVdgq+0B9ptKonurwP+YxLuYJDalh+
X-Exchange-RoutingPolicyChecked:
	jQ1cU4rIQFld1UAwkXLl84P3hWPTaGBsC6hSZ1KvzTdd+ajIcBk2HTvd+BocnL/Y9rxwqke0cakkhJQTJfrlMUqoLzQFBYZ9mugmJr3ddUSNWsE63EfxUvIiggX8oNkukn7ljsOqIAGN7LwC/+8IMRIN3LdPde4CTb7oKO06Aou/QAGyNc373wI75ixu/hvW1NsqbSavC9CFNnIswv3s+MY3KYD6OWA/+viUXO8UrZyfeBlAtt7Sh+1IWF7K4UUobthnwxmQj9nlklWOAu4J0M/cpXdItOqWFQHlRzhHrdXTVRKZFhT06isjuePHjjIqMRIAAasM/1la61I5JYod1A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	B5iaohBeSYtfk4oZY9P60S6bpcF6f+c7BWOOYm5VBoLRMGW8xRL0I0kWmhEMU6xx9Qdkp1Qfefq2sL6M+RkEpCwuFQEAhcHnDqDj7Tidk81HNQ+yOm0xy8VWObx16g6K1nRt/1dzOtYs3G3fLWxSi3+iyBxU6S6NQ7npUesEBgi3Al8yJCTCi9wu94xPjHb3r4L7dcqd9XSuUH2Szn6Ze5ejTpzK0Zd/xWOkK6f77CUtLttzOx07e+tswFo3YjIf62NGcNuXAcDnbUuVmws7at4DFRKmZpD5ulOgtYFlO+z14/2P/bVTtq1F15NR2d8BuWJSywSriheFlaw0MB4nH6IosBguOyuZN8hXTQOi05SwiGRVee/ZSm9seJ8Jv9do4XlvxMWJ7xv4hTxH5/oS6OW5BrETmHaa8uyDfwN0kTrDmK72sRr0KdybRwlVtmzlL7GmEu3bccgIlvvBG1xpr30ag2AJRw4jCBiOOoY/w8LtESFiO147PyiKrrmuvnsdg4HOXQI70Fdo5neklXwQUsv0VfOC7t1tXi55CXS9Lf9sQjigAftYx+s9pczPVzVrSp9LBv0xX1niaYaJXKTn1seNIkQEeZz2iwqDXNaap6QpX/rbMW6q9wtrmWJECtl2
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 18:10:56.6268
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41fbe0de-83e6-48d5-1601-08def4af3a60
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR16MB935079
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDE0MiBTYWx0ZWRfX1kvezEFzi9K5
 Pv39NhfYMOnGofOqXjldIxYSWKZNzr7CkAWtCq3IydKcvw8Nl1t9trFbTWvJbx/Qm4mx/UwJiGA
 WC7p4ZZmx5PEXzijuqGqOuZxeIQHmndhmEerJ5zmKxReLCpybwTwQQzQEAwNbqgGe4AasRPAx30
 ddC5zZX6dWrnxJDUL5XCu3ojrQvb3Vyb4fSGwU7owRbT736vNO6j3m+eqv0jQkmGSk2MQATNd/w
 9hz6VLzd1sGagID5lihzlzONOimCTTYXqR893bb1Yp7/XnQJSPCiDoQaJwac0rewYP+IB2eJGUk
 m5MhSwLgiZNfIGPNBPwXGQsvS4CEuW+qb6idyLuISRKgQKdj5h+JE2HbRPiJCAOS4begnUfIBMI
 z+BMfzYjjxVmLlvUeHvM3VBJb6kHY7YYvXcHZH/PMATbQDohg53vrwV6H3vpR5cLRDlilkrJRNK
 RPMHdhJscq1qGFN2UWg==
X-Authority-Analysis: v=2.4 cv=S/7pBosP c=1 sm=1 tr=0 ts=6a761fb5 cx=c_pps
 a=9AjoWhdl+q7f6/Aw5qa/DQ==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=vnUQfov-gS4s1L7hHvr-:22
 a=VwQbUJbxAAAA:8 a=cbNQJ9GKAAAA:8 a=p0WdMEafAAAA:8 a=iox4zFpeAAAA:8
 a=gQpY9S37BheUtGlbrbAA:9 a=CjuIK1q_8ugA:10 a=G69WFyCBNqGPyalROSdv:22
 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-ORIG-GUID: t_oamdVL4yaJ6Gqd0i7c3CS87yG68LkV
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDE0MiBTYWx0ZWRfX1/xQPnQ1Rlfy
 Yisj+ESKJTIKL+6zXAjbvfwISOmurLUBUuYy3IZEz9MLuFTNdSUOILsR85DGpO48ql9VFg8RC9K
 Mfmg2kFIhkR2SvihXiFfcL2VUV+Y8JnHGJFXLlgonyYEqASLHgHw
X-Proofpoint-GUID: t_oamdVL4yaJ6Gqd0i7c3CS87yG68LkV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070142
X-purgate-ID: tlsNG-bad1c0/1786126267-3B6D2034-DAB91B74/0/0
X-purgate-type: clean
X-purgate-size: 1900

On Wed, Aug 05, 2026 at 12:18:33PM +0200, Jan Beulich wrote:
> On 01.08.2026 05:17, dmukhin@ford.com wrote:
> > From: Denis Mukhin <dmukhin@ford.com> 
> > 
> > Xen does not provide much details for system reset debugging in case
> > system reset happens via ACPI subsystem.
> > 
> > Log reset I/O address and reset value.
> > 
> > While here, add the missing default case, add breaks between case
> > statements and drop full stops in the loglines.
> > 
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> > ---
> > - v1: https://lore.kernel.org/xen-devel/20260730001854.905354-2-dmukhin@ford.com/ 
> > - CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2723268852
> > 
> > Changes since v1:
> > - removed wrong ASSERT_UNREACHABLE()
> 
> And you replaced it with a printk(), which I don't view as helpful. If we
> want to diagnose the address violating the spec, that should be done
> elsewhere.

Ack.

> 
> > @@ -21,17 +22,30 @@ void acpi_reboot(void)
> >  	 * on a device on bus 0. */
> >  	switch (rr->space_id) {
> >  	case ACPI_ADR_SPACE_PCI_CONFIG:
> > -		printk("Resetting with ACPI PCI RESET_REG.\n");
> > +		sbdf = PCI_SBDF(0, 0, rr->address >> 32, rr->address >> 16);
> > +		printk("Resetting with ACPI PCI %pp RESET_REG at %#lx (%#x)\n",
> > +		       &sbdf, rr->address & 0xff, reset_value);
> 
> rr->address is u64, and the code here isn't arch-specific. Yes, the file is
> built for x86 only right now, so 'l' as format modifier is kind of okay for
> the time being. But really PRIx64 would want using. (I'm sorry for not
> noticing this on v1 already.)

I had doubts on that one, but decided to go with 'l' in v2.

> 
> Preferably with that adjustment and with the excess log message dropped
> again (I can certainly do so while committing):
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thank you!

> 
> Jan
> 

