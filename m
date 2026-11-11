Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F22A606A324
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 19:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=NYJBgAjq;
	dkim=pass (1024-bit key) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=lzdtM3W2;
	dkim=pass (2048-bit key) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=cAORyclK;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=dgc8G7V0
Received: from list by lists.xenproject.org with outflank-mailman.1484716.1688032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREIx-0006kn-Se; Wed, 11 Nov 2026 19:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484716.1688032; Wed, 11 Nov 2026 19:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xREIx-0006kd-Od; Wed, 11 Nov 2026 19:48:23 +0000
Received: by outflank-mailman (input) for mailman id 1484716;
 Wed, 11 Nov 2026 19:48:22 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xREIw-0006iA-R0
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 19:48:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xREIw-004lRd-7t
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 20:48:22 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c676-e002-0a2a0a5209dd-0a2a4501e28a-40
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:48:22 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af4c684-5984-0a2a45010019-94a38ff182c2-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 20:48:21 +0100
Received: from pps.filterd (m0367130.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIYeXA3458688
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:48:20 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com
 (mail-westus2azon11012037.outbound.protection.outlook.com [52.101.48.37])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hvwgj8py2-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 19:48:20 +0000 (GMT)
Received: from PH7PR03CA0018.namprd03.prod.outlook.com (2603:10b6:510:339::15)
 by LV8PR16MB6282.namprd16.prod.outlook.com (2603:10b6:408:1c0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 19:48:17 +0000
Received: from PH2PEPF00048914.namprd05.prod.outlook.com
 (2603:10b6:510:339:cafe::50) by PH7PR03CA0018.outlook.office365.com
 (2603:10b6:510:339::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 19:48:17 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 PH2PEPF00048914.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Wed, 11 Nov 2026 19:48:16 +0000
Received: from pps.filterd (m0373460.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABIZfUW3211812
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:16 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4htnr3536s-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 14:48:16 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id REInxf40iF9Y3REIoxz667; Wed, 11 Nov 2026 19:48:15 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=uZc
	zAprEI0ad0o/ih7cM9iZ6KqnzmEjib4G6zGd+I00=; b=NYJBgAjqRNRIfLs4+N1
	lX1F49Lk8SnOcUdd+NZ55DPHPbC7CwiEtJZ8AT01P0oQoUWLGgYfT7AKum/Kx4e7
	kz6haETBk9z5HC6CQeG5FpTVoXI3/7GO7kIYOVaE7UooQU9q1z6cQ7bYzcxOAZJz
	kucGE13eBswAyrHm9FilRcytZ4fHhMELFCoyRUNGM8WB5AN5SpfuYImkPd01ATlw
	tBFOEfVGs4YDKbsUFOgLBIIZsm9zglaOvJdMYHlJR7A1SF9ew35jz06ZcTd6yBQX
	uVmQ07+OzkRQ0gHsiUP8AwFsd+Oxq3HloNuK/qeaEvtOjjY9p9Ew2S+fqpYsNPzJ
	eFw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sEahOd4kYyKM9M7aAJIA46Stn/bzinDeyU8I4hTNacua604uNZ2f2Et0SxU4oi4CJUHW5OvYkC1RlMJv6KtIGKaEXkON1Fe0b8Y1xnVUmKKCVQBbe/T6phai7IdnyA/bGvcF8PW31+Y0fk63MVxzJIIwoRYfv0B7aaB/7LZV0aR0xFlGenPaF5vS/bIFttQtVF3+38Qb1keU3pB6Es5YCR1nqYamk8qsx1tervm9m8b2zZHDVN2ExeLpwX8kkRzYh0lahOCR2DKsYfGcKDA4HiNtUieWJhNpFVAE14X/sNvX+4OmwKiVziqPF/67EhRwuPHHCon9ODqW/srjK9U3Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZczAprEI0ad0o/ih7cM9iZ6KqnzmEjib4G6zGd+I00=;
 b=VtSQ+yEi9Vb7SyVI4wtQiSGn+Lk+YZuV5ARWXUwu062wzrQ4koE6OFXYDVd3Sown4DJvJINUfRlub9+0WARcC/BsYIn57PmBdIaBgPJ17c5ccKRI24muOBTHI5LA7xG4psLmvqRzoYndhDgaaLY1XSxNsCsm6vFquElHDFLtpYiOXmQvDGmF3MMCxDbzapN7DPnO9a9DECQBLjqTpu8QvM/LgbFdm0TzrSHCiiLxlgLmhFzZwVsprkSu1TNwFnpuqbKX/ufUbMBiTtnB6lpDIq2k8sOad0rOvBbKntknN3YqBk725MCCvdsk5g9toL5ArXDUK3wW5/Ihq3V5wSkhiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZczAprEI0ad0o/ih7cM9iZ6KqnzmEjib4G6zGd+I00=;
 b=lzdtM3W2iD0AkwO43c6g9REbQyyOYTFC2LEy+knED+LdFPg/9sgcVny5ebA/r63zmgyaHrKFN193QNHCBNVzql1wYi8U97hu1YLBrFb6zld9SZimFNc2gM3SoDfSJ3aIgWRAlKlethh+zmtCjpe6zFfk5nDOpwJdVFL8EJMezEM=
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
	ppserprodsaar; bh=uZczAprEI0ad0o/ih7cM9iZ6KqnzmEjib4G6zGd+I00=; b=
	cAORyclKM3dRt/nzypYeJg6xvp5V5ZKI6UoF2ScwEZcy+1Hm5Jeq1JbF5bhh3CzB
	ppQcOammzb3mDPWORJrQOkTcR1JCYKMYnHcvVJduDAUe4IeNSdsKiA7l6oz0mDOP
	abqEEMjGbpCHSqfCrEtKnDgA1WckwHsvahTIIojni4MJ1juC1NORmoRsR0SlAMqr
	PtgcLVV8huv0BWsfsLy3ldOOYBhDnZTnbqWkeGIWSXx/e8Mh15sAA8qeUEM3sgMR
	uDeOWVN9OQmhIDl3O76KydntHWruoetO2I5iN9RbpiVgmLh6hG95kj375/iIt6cX
	Y3cQsfFQgBSOHoSbJ4nPNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=uZczApr
	EI0ad0o/ih7cM9iZ6KqnzmEjib4G6zGd+I00=; b=dgc8G7V0N/R71IiK39jaYy+
	AyiltznphvvgBYv02wEjHYSEueVi5oOWyDwB8tshfbi+Ejz1+frhrQT3bTHsg7gq
	Oza8Oe/9a8xO5trtURw/iCRs/MjlKhk+5VOvQ7WNhC/UZBNmxJuf2g0Zv9dW5ps8
	Rw4DnJpVwRqqTIwh9InjQxyUL9Ih02Vdqs5dQqKcLI4j7uUJeIBNgwVxL3Ea9Nm/
	Nj/2i9u6S66S+E+8HXYt9W8BSFT3iEm44PAtLRlAmC40n0H9a0tzJP8k50It2PxF
	d7/l2yqvON9fj0pLqnHLHVc44masjGK0udvd/4FF9478cJ6iOZu2I7Z/5oC/S0Q=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: REInxf40iF9Y3REIoxz667
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v8 03/26] x86: fixup dependencies for asm/x86_emulate.h
Date: Wed, 11 Nov 2026 11:47:37 -0800
Message-ID: <20261111194800.1070016-4-dmukhin@ford.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110078
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH2PEPF00048914:EE_|LV8PR16MB6282:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bb512867-3dac-43d6-75c1-08df402cbb07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|23010399003|36860700016|22082099003|18002099003|56012099006|11063799006|261021121427099003|261009223027099003|261102123227099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	4e2mDXnLXiu+NT5HpvCz0P3Odid92E2RCxR9a9LVapv6KPOTxogoA1dBjMSr80X1VQ5MfGl9jGFjvTJM0SRQDXsCjzzhzl6XaAQDE5byfe3AE4vE+yxaCAlVoLxj9zE/eubydSdffCypCvLYM4uYIWAJ3rxk60MIsSzzQ/LaFEpQ7ryKb+gmR6SOYwgMOA3YDEyoWx12bbHz9BKBPyP/HgKZeD2894mfWiH3Egqki8t6SKLus0N0qGWuFUl/ebtF5DMaABOQ5/SbDQF2vUVa34XRsTMy43VKrgP6P607wQ8jOxFYCuA3J40zCAV6oEXDi3MMg/Plu3qC6Md83PdKCJBKzurco9jHSailM0OL3ZmZjACRb3Fd3eS/5Og1JvgfPytZI9mXywXkSNYkKYdysucXW93IRJ5nz2LDpstMrgqcum9E1TL2a9qUzns2DBqIltNu2Z2QPxCpQy9UchrCwfHzXh4LItY6UwFBWV7+OSA6Tn8MFEqKD2rYi4va+/hdzr9ttqsvpyjj4YO5vFUsJxwL5Fs2X+6uL4S3pnmlgszceMIH7Y85TEm1Pwux1skIncQYlQKw/H5WIGx7KW1uMgue8Ugq2Sos7GEGktyU74sx+BwbIdZVo6j41T/muXpRThQtSeBYke0/SXz6IF2OEuaTxiU3MUXsEVZ62Ad9CQc0aqmxukJ2BiosWAb16G4PqT2ssdvgMWNDG9fbxkL+pg==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(23010399003)(36860700016)(22082099003)(18002099003)(56012099006)(11063799006)(261021121427099003)(261009223027099003)(261102123227099003)(261022075727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zhjckdOoUd415f+QvXtjwEkSv1xK/B1Esrrb4bL/m3Hkj3HzFpNQgMQNroLd4mkcwkI2pEXojJLH3TtsH7NjBL2ZPGmRdoM06OhBiF4H2RKJe5IqRkvxmN6ynVDKGauv9taVnCzRje3j/jOv3wdpjBn258xBwoRIdrkcqhkBUOpUcD1HgfEw1kSZrxvlyH4ccURt0BpjuWPHD2Mw8UKtCN6/jvrL7N7x/wAUvwdHMwDkXNm1xA9kl5US3lBW27xNTNNuU1oWWEuxvRLXaYzyeG+ZVvxuFnWFgeMUauuY5OPhS/dHwlyhyq4HhpbxFdIohRRuZ0n+QWhFcSKXgrytAHsdVejBWPmadCe7Swqt/U6jQWtQSn5gzl9A8rsLbG7OauYuqzSOSiFpRXt+lpGvIPOEXt7FyKUPdJe+f9OBUGOfECdVdg08+hr1AJ/J21hz
X-Exchange-RoutingPolicyChecked:
	oMwab4EsIMUfvdr4ne8muHY4N/boeORLM3i/bz7VcI4SNYO3zie2hu6Ivd9ReTnQp0bl5ihk8h4EynAPQkS7/GwzJtbdl9eZdtBX+Z+1WXmFQCXRY+Fdyu3Hy8YlyRDMjKBueLaSXoRavDh4SIAE+86GNYbq3X05ObKDKlQqVYNMl1Nj4yaDu7qaYVViniuq/d63+cELWokl5vchBq7N94D0J66RiNWTCX0f5TNvy+GPbavVlpy2DYpk973C+7hCHkGzV1sn7q+Pchq8+Xrb7YSgrSOmbI1S/CksbnIm9qMErPTrk2kWL6fcpi4aQDMjJR2dFebTJ8BtNg8V4iUBiQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	n0oAzdLouxevjPdZwyV3zSAopOKdgWCTLFx1ChPJUnzuYWg9gq3pPxf9qAIJ648iyGe/1tIk5ve75waKVf+HgvprpiTINMW6Vcn7np1WNfgcdTtJbxgjZg9DA1pmma6HwTD8I7O8CFrJnpW8EjdwCEaHhWRlj2No8kFOOHGOllskfqNUoJ2SSESapSutxT+iiGLirHdBPODOLyshYStaC1rvAt22yZPWFWyk6pXCNTxe/inPkoslhFJrwhKluf7A2IBrqNYtcAA9FpvHMopI0yLfkucQRWc0ITj00nbpilY6WWf8RDDLg+3JTQEZHmFzsjj6XK4oscxMJc/lqqRpRZFS8KlMctfAd3/13VZMECRgn4bXKqAFDjUXsvOEo6Uolrulcou0vqG4cwesnqFplIcIeAmjoT/sd+lDjDv405Y1nqTxctTthSdFpve+ZOrF3CMtPKON9hSKpZWp/4ibHavRSOwAqI682mTfe5fSLFwXQMM9WS8WTIt3MokknRxQ4FN13998VuIuKNcZ1t2OdsakuPbm9Rb6onIqTJIrcojwT5Xi94wqwY22tB0ne0AWDqpaBNrycXleaG7iyV411EEZPiMkUApI1IeDbkA8d2evgG7afGd5dCgFwxsJzxIfQ2Musd/6eUIcSmD4wYfy5w==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 19:48:16.9344
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb512867-3dac-43d6-75c1-08df402cbb07
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH2PEPF00048914.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR16MB6282
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX0UkCtbvgKNpj
 wVWIH841KqhJzP8Egjf5vvQYekzI1xJkQxQ7+dYt56zeo7gPVANNlwbanMGesU2+J5zeDIoTGa8
 BiXFhzbTryw6c8AQg47GxwK9TKChCFaNU+ciXrQTLi5NzJSHpi5Fnc1GnGAYr4qRf1iUuBffYjC
 7qlLuNwMhAR78wNLsssO1WV2GIdjVDAEy54I4g0s8BecC/VMu4UgfMXc5Sh/RRS35026zoAUj5V
 QBqyVeMj/U4omBaPzO6qmtekbV8M5bX7iZELtG/6yp9zpU/IOTdI5hCMgte//8Lpn2YaDYaYWXP
 F1X+mOmOH3Egk0S3aqY0EAIniIHa0XUIszbXhbPaHWB2XPt5gyyrdyt9xSRoxeWTu21HhVMPcfT
 0oGyZJdWKkuuWu4AYtKCQUxVtVC7evdZ8BlTg9AegULsm8oc0Y5R5+BWgqtyHI8Yphq3a2lV2T8
 2tWxkQ9BHzcf1tPPEHQ==
X-Authority-Analysis: v=2.4 cv=ZrZ4uN7G c=1 sm=1 tr=0 ts=6af4c684 cx=c_pps
 a=uCbPN9sl+YgD9yJogSPUSw==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=vnUQfov-gS4s1L7hHvr-:22 a=cbNQJ9GKAAAA:8
 a=29hTrUBo9fWn_SXLH-IA:9 a=P0bj-C3X3jJDpopQwM1U:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3OCBTYWx0ZWRfX1KgKy2lZHCw5
 A9eiIYkCvcUkfO2d5wbjuMNRPd4RW2FEZshyl+lafLg56p3OxhskboSzG7vRfuvg1LjPS61s5HI
 YXJ3QPy+WQA9jlviuNqO2y2k6KyBTc92+0W0D+9tan9fXSB9Iopu
X-Proofpoint-ORIG-GUID: 5qEdzBqQSG1oOr0FB_akyZyJ31Cykkp7
X-Proofpoint-GUID: 5qEdzBqQSG1oOr0FB_akyZyJ31Cykkp7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110078
X-purgate-ID: tlsNG-d62444/1794426502-BE664757-B7E89005/0/0
X-purgate-type: clean
X-purgate-size: 796
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Add xen/bug.h so that asm/x86_emulate.h can be cleanly used if listed as
the first include in translation unit.

Amends: 0a249bcb0279 ("x86: reduce dependencies on x86_emulate/x86_emulate.h")
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/include/asm/x86_emulate.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/include/asm/x86_emulate.h b/xen/arch/x86/include/asm/x86_emulate.h
index 2b75f7f8e215..209d1e54e03f 100644
--- a/xen/arch/x86/include/asm/x86_emulate.h
+++ b/xen/arch/x86/include/asm/x86_emulate.h
@@ -13,6 +13,7 @@
 #define __ASM_X86_X86_EMULATE_H__
 
 #include <xen/types.h>
+#include <xen/bug.h>
 #include <xen/lib.h>
 #include <asm/regs.h>
 #include <asm/x86-defns.h>
-- 
2.56.0


