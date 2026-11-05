Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0F3606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=VMQixCAM;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=ljzackNO;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=ou7Lsws3;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=G7hbQzxs
Received: from list by lists.xenproject.org with outflank-mailman.1473497.1681211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmRM-0002h5-N6; Thu, 05 Nov 2026 01:38:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473497.1681211; Thu, 05 Nov 2026 01:38:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmRM-0002gP-Gh; Thu, 05 Nov 2026 01:38:56 +0000
Received: by outflank-mailman (input) for mailman id 1473497;
 Thu, 05 Nov 2026 01:38:55 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmRL-0002U3-3V
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:38:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmRK-001xXk-GN
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:38:54 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebde2e-8faa-0a2a0a5109dd-0a2a4501aed0-0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:38:54 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebde2c-5984-0a2a45010019-94a392174248-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:38:54 +0100
Received: from pps.filterd (m0367123.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50muPS2568912
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:38:52 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11013053.outbound.protection.outlook.com
 [40.93.196.53])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4hr8vmvbk6-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:38:52 +0000 (GMT)
Received: from BN1PR10CA0030.namprd10.prod.outlook.com (2603:10b6:408:e0::35)
 by PH0PR16MB4758.namprd16.prod.outlook.com (2603:10b6:510:144::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:38:49 +0000
Received: from MN1PEPF000793FF.namprd05.prod.outlook.com
 (2603:10b6:408:e0:cafe::a2) by BN1PR10CA0030.outlook.office365.com
 (2603:10b6:408:e0::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:38:48 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 MN1PEPF000793FF.mail.protection.outlook.com (10.167.249.201) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:38:48 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mUFQ059308
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:38:48 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4hnxy7wh89-22
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:38:48 -0500 (EST)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id OmRBx1HGfgTjoOmRCxgqan; Thu, 05 Nov 2026 01:38:47 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=l0B
	c7UvjVWNKwVqISqrH6KsHohhMtGct7Y+WRUIvu3M=; b=VMQixCAMjuHdeRxD/d9
	HqTIgpKsszARn2eBsw6kbIXfXQhMnb1lyGDXxcIhKN9ps+/oXRoamN4LcbGAouim
	lps+Hys/Ubttjirxw3IS5dlk6ry1hiVL4F49tryZlMkC/K/8rzgudyAjLDdNnxCN
	7ji3G/gkeYn67vvTkIiIzJ9fdSq69pANHPPAKgibHFAanjyt5GtJSG/dZilenvIh
	e/1WkIFPtf2/uYTfExIKwVCkga9WZHieO+KE+iePVpcdEaxlCQm3P7uUB2/0c+4q
	AQvr3wGVSGYit4potaRdm9CYq8sB2Zk3SHwjU6n+FUEl2dMWHptvzsKpfex2iDBp
	Rfg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X2E2ow72aBygUvwcl1KC3guiA9Pxa2zZnb7sdliiI3IphuSydOaXb3rr9dSlHpNcuE+pvXTuL/5H/wuJbcy/39Ov+tPtfmE3G7xqFjcgZ8EZ3aVo9yiQicvZO5hPI/ZQxnR+B34ogOnN/BaES31KunQTK3N6r0NXBsz6myTArxK4me68zqtbHMTtdJ0swRGvdg2piu0p4Q1jtw2j2ZS7SBRuLpzAXFO+xRyN8xGPqEPxqPvKwWVmSdbAWAtUb2eP4chElG5uWOgzQqGnV6qDXargLt7yE+cOaC0dTwDY34limD0w6NlSu5pSmsEJCiYcTmWkzxyPHwAy3wJJ6dGYkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l0Bc7UvjVWNKwVqISqrH6KsHohhMtGct7Y+WRUIvu3M=;
 b=Ia85GlgWjfC3HSTNSJzeOgben04QMbOt/K7J7Zhp0YU6KXOmISFCCf00QaoRVb3o7UjYj3Wp9R0bPExL2mwYwr33Kf8VkBwZ/qqS5y1GchnpG+XmesNac+vrNorFmW/R1+m0IouxAtifhkwIOfgAteVvKLkdMdH0qJeC7VPNfga8zw+ymic0Lt/3Xmkg0p4y9L6+GfLEd6aZV7+NwPY/upfrX+Yut98c1iMjOoVxjD9XKEXcFfrJkOtBzCSiPXXboXhQ4jg9VQLvEg+q+HhjiFq/ucvqNqjvU99n32qPjyJXQOC7pkM/VpX9Nnrm/mKIdWA6MQAvtU4fL/Mr4RhLXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l0Bc7UvjVWNKwVqISqrH6KsHohhMtGct7Y+WRUIvu3M=;
 b=ljzackNOXkIer6YOfJ33ZsTgDwf9rG7lzwuoGoxyFzyLKI7zPSoE/OAAyy7B3C3NKzk8d2+yDOyFIRXl30ZpfUStOY/rRDP2U8Ni+HPCBWERuL7ClbxD3xW8a31nV33toSctp6OBvyEHEOLuhmj20NBSGpE6GOFs5EF0IegM8WQ=
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
	ppserprodsaar; bh=l0Bc7UvjVWNKwVqISqrH6KsHohhMtGct7Y+WRUIvu3M=; b=
	ou7Lsws3du1q7H34TQEotLK7ucgMePoBP4/BbgONdFncK4W253xQL7bUtnMUFZxr
	YIEwmU2qDa6/ACUuNG0jsr8LWYEFqiUfKoW2l2UzzzePGRQ9lksqdyYNBDvV7dWl
	Sb/aC46lVR+8hTleLjWREwXK2XZR3AkVJHnN0xA+J+XspXBFCP2ObWGAyLf//iPF
	KP4LOWlWyJ1WsFrfH6V+ys2FxZA3qQ0T7qkX3QWkgKEIgKw3iLlqWp6+HhBFSvk9
	uAuWcAkMJbQnWcsi9hWrdnKabbalneStgTxlDtuyMAWOYs0RhhPPeJ+cp3wczMf3
	LA2bx4VswT8OeBfLnc461Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=l0Bc7Uv
	jVWNKwVqISqrH6KsHohhMtGct7Y+WRUIvu3M=; b=G7hbQzxsolh0g1Ymmv+s6T5
	rnhISmDpzZoT3UozXhd5d7TDWQWWwtaMiPDFMAHchKdDNk9QjMpc0e0A/tti/p0e
	NBjMLyuTnwwId6HpiVBNCvceDvMwMkn66k0ZTuGYiTWYrT0bXR+L8tKNmqdaoD1q
	QJ+ezafKsGLkwMSdnYIlMmByEzlDZ/IF3R7QW1zy1eoIioYQgZCC7R3jVLOmizdP
	DAuroiocDxGnLzz5LpPhS5FTMzD6rUYGJEfbOvxaPBVge5U/UzJ0pVcJm849nHfA
	Idv5wrEQCeX3ALxUKY4xhfmii0NID0KIkKgPfUP9kVjz+HCogGPLWanO3fk4EKA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmRBx1HGfgTjoOmRCxgqan
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [XTF PATCH v1 09/15] x86: introduce cpu_relax()
Date: Wed,  4 Nov 2026 17:38:11 -0800
Message-ID: <20261105013817.719823-10-dmukhin@ford.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105013817.719823-1-dmukhin@ford.com>
References: <20261105013817.719823-1-dmukhin@ford.com>
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
 definitions=main-2611050006
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF000793FF:EE_|PH0PR16MB4758:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1c5ae541-480d-473c-6644-08df3add8a0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|261021121427099003|11063799006|56012099006|261009223027099003|261028144727099003|261102123227099003|261022105027099003|261026140227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oNj5Z8mb5XHnUh66uWqvoDB2HwFQfHO+mVCfbg6jU4JI3TmnrLK1zPtn3MyQoHBi5IC3vjOW1kkKBIWgJqiCbj9KhkW8+r45nnuZw5IWoFpIYFYHw+0lKsiUaF9Q3gb23145l8vmO4KVrCHHuqdPBlklWIAEXu2YYLszMtPipU2JeMzX1yHmYMpD8K8LUs/TQXlvpShE3sUCU+AmSLWPE4AevLRmj9TL9jSt2N6MxTKmNJxTiO6TJjQjOY+kX4uHbsbZg4BRpUS44m/tXM4oR64PwrS+A3Cy1uHREE4aWYRygIrG2KCWq1nzf5y8MY8MVbfX0VIK4Xo+nceVvK92fmUtldaJQCYaV7G9dp4gznxrZvuVza7h9pymfERupqzTZO56AVGvp8BtDG77QavujERsKPUvLMacKpJXHYP7E8XMmaNalB4Eix7nqQ/A9BlP2xSM08BwGwd+o/gbChpiPDV1o9nn5E9rrvIaSmgqhkXjRdU2i994MIgAPaZ1riHOsf3/UoNTPJ/lIYrJvLoOmDOGVAipB66klf6shGSCAQ09lXCzdGmNNPLPG8SKlh+v6mqqTvrh9IsWhEsqlZ25mAStyA/R/VwBSkcJ3/lBQJYC9AHBDJk+KQYp+yDgcwYXzhxb77cZJzLLScWNTLZzAWDKtyj4n0I45mxliG6AG61f1vRYefZ9I4+vRF6+6DdWEyZrfhtqgRiiMro6DSXwlA==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(261021121427099003)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261102123227099003)(261022105027099003)(261026140227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SaFgSQaVCmUl4p/M7bxE2T0BMJaEm1xzlTZOuv1LU5Sbqd5A66FvWBFkmkt4T/Ulg9uo5pdgBUUvXSC8B9AWlh97XFGrfrbcbDdk8xvqk6CXx8oFnrIKcQtG4vagj9HYMG2EcUYJAlnsDdP6eCcWGvXZhdeUTv6YHjMVsJPPB2usnTdX8f3w7OGSW7GF1SERZ+wkX2m/LL3BG4KiT4NIFgDlNmr1s5lEKl7JBDKYTP1nsLuU0T2bfSH2gSQHy+MaJZcSctCk1OGpxp5aH55F1/dWdRfeIodM3ULyRk51OcT9vLmi/ro5E7Yd8rikrUA2uiTcTWuP05hrMWCbcI6pGBk9N/AKUd1qpWr5+TwoMmYEuHOOQVMG+fseThBnaJraMZ2w++vur4HH+JDeK3NeoNNsP8GBLKjHe3usrM+AjJ3+QhSReEgCQA9sPS8cSLGr
X-Exchange-RoutingPolicyChecked:
	DaKttg7+GE0wOWbVyNK5mM+UI/5K6EMI1xaU7CaTcbVgSAZUj5aVs6tU8KiAdUpbsRc66MOT5Us1msFibXk9nb5GGDgEBzyQjtuws9Tr914wXpzznoPBc6JFNXnr391KFt5vdSAODIAnSZst3i/VY3SciWLvUFLdgPU9Ne2F01XxeX7P1jDWnrXgJwdDxsGFe/mR5r2N29XYi/enm+TNkWD/++WU7mkiU6m2l6Mz+/IobdQ+y+79EpN5VYmRDSltl+ZdqJIzbe0EJj/nNJ99BzDPn8y2k3JUq3wCG1pU2wipQOKdHS5nO324xutKu07bTB8NUSpzd2Fvu9+Qxr3A0A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pq4rh1AMv9VFoXXwlJ0dn7L17erxKBD1v0Vc7TLTX1WAlt9ioFqa1wo5w8ZNhpTAN7jMBF4Alx4Kwn/ZFp4GnsVacq5qXrs6HetzrzoQBNKWpYLeC8bWI5SVuxnjP/mGMC3A+uQh+DnhEEyNmuxJX3X//O0VlkYB7PdBvfwXOzU+9wwNQq5eWKrzcAUbYwvTU2yZot5NhTJETcJwp9DfFCrWUntHkrz6jQjkyKZ4GyaUrb7KZeAm0jJS4457JZGJ21F+ii8wRCAX/uHkm40To3SkPNCwU40aF4GLvc97BKLntZjaui+wEB/rNxXEVwqmqAOWULcU4waCG/fOQj5lwPuZfGwKITM0TSc0zwxUdRUTedXbrOiECsb9XOmkM1tZ67XLpKmbac6E2tO2pRzxg/acqA6YyMmAbftdIMRpkprYKE+KTzGR7zqsy4MbpR6KW45MfQ+lJlsRKErB1uuYj84Lvd8Vu/0IcFTBWIemvHC2S3B571s9+reA+/Nh+l/OSj4B7xGOfnIB5ZNd5pCTWh2CZulVt3nbHJXCH8ISoGdCeUFbmUfuwYRM4FWVkuyDP4H+YO+Ozj3WuSsGntO9FRMQlRj34LDc/LLCGVhDHvcE4oPutIMrMhQlU2bfqdSP0t9dQ68m5PhFbqyXSiA0Mg==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:38:48.7123
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c5ae541-480d-473c-6644-08df3add8a0c
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF000793FF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR16MB4758
X-Proofpoint-GUID: XveLlC_Hy_YrXxUhTems1mGPXJ8p5OBx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfXyOVLQw/Qp9GT
 U7FDdC4Ct1bt/h0qSeURKntLsixRA31PlHhSXwYafe9ZbwRaX0rdyUFhfFxAe8zZxltR7MoDpfd
 0mqEgxGEj7ffsfA8YRp/6LxNzsm3L9M9V1TwJ8x6f3XOgRoeLHIImq/JSjn53/T6DePZ5HOIl0U
 DDKUMv/sZ4A128wbrdWqIJBSXNjNZU32Zf6zRHoNCG2kNZ/f1cIrOh/DFlK2cWZ+DJ4Cn0DxQ7j
 uhynNZSPpkA2e0w3oO3xCNspPHzqePSz5qu5P2R/LLjQJeq2uI4YrEqTui0FY63IMp1/JMzFii9
 YGYle2lipTTviWNziNHtppSU8q+pZ1m+VW/befH8x7zgwPtKXgp84cRA+semFeuj6b+taOynXKi
 yLaQnjI2Djm9U5Q3gaVrVNJu5u9/6KVI/BYZqQRaYvh8RZCNN0wdPihKtm4z81HxUpdmQs7id0H
 t0cwaS+PyzF6VsYyYKg==
X-Authority-Analysis: v=2.4 cv=T7AZ3PKQ c=1 sm=1 tr=0 ts=6aebde2c cx=c_pps
 a=5zjvB78PlnLPEzvzEo0MXg==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=N9_n2FxmZfwfyRXvS9-E:22 a=cbNQJ9GKAAAA:8
 a=oX6sQOh5f4QriJ02HC0A:9 a=P0bj-C3X3jJDpopQwM1U:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-ORIG-GUID: XveLlC_Hy_YrXxUhTems1mGPXJ8p5OBx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX278m+kod83sV
 SvpCdFdYhA3L9LKbElPPT5WWXF44PMAcE9oUkM/ervGRLxTcgM/ocG5gpaMbcGfRnUBbdsmS5t0
 8+GErXzVwrECr9H6zrnuLNVa/newbP7vZix8M7mqJXq3esfITczx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050006
X-purgate-ID: tlsNG-d62444/1793842734-BC75B757-465A91BE/0/0
X-purgate-type: clean
X-purgate-size: 636
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
 arch/x86/include/arch/processor.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/include/arch/processor.h b/arch/x86/include/arch/processor.h
index 9cf2fe08669f..9db352f18c7c 100644
--- a/arch/x86/include/arch/processor.h
+++ b/arch/x86/include/arch/processor.h
@@ -190,6 +190,9 @@
 #define X86_SEL_GDT       0
 #define X86_SEL_LDT       X86_SEL_TI
 
+/* Pause for busy-wait loops. */
+#define cpu_relax()       asm volatile ( "pause" ::: "memory" )
+
 #endif /* XTF_X86_PROCESSOR_H */
 
 /*
-- 
2.55.0


