Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D589CCA5FA1
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 00:11:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436248.1654981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBLR3-00042d-NT; Tue, 29 Sep 2026 00:11:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436248.1654981; Tue, 29 Sep 2026 00:11:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBLR3-00042W-Kk; Tue, 29 Sep 2026 00:11:05 +0000
Received: by outflank-mailman (input) for mailman id 1436248;
 Tue, 29 Sep 2026 00:11:04 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xBLR2-00042Q-Dk
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 00:11:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBLR1-004KLW-5z
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 02:11:03 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6abb01dc-8faa-0a2a0a5109dd-0a2a4508d5c4-24
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 02:11:02 +0200
Received: from [40.93.196.37]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6abb0215-f659-0a2a45080019-285dc4257818-3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 02:11:02 +0200
Received: from BYAPR21CA0024.namprd21.prod.outlook.com (2603:10b6:a03:114::34)
 by CYYPR12MB8654.namprd12.prod.outlook.com (2603:10b6:930:c9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Tue, 29 Sep
 2026 00:10:55 +0000
Received: from MWH0EPF000C618F.namprd02.prod.outlook.com
 (2603:10b6:a03:114:cafe::a4) by BYAPR21CA0024.outlook.office365.com
 (2603:10b6:a03:114::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.9 via Frontend Transport; Tue, 29
 Sep 2026 00:10:54 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C618F.mail.protection.outlook.com (10.167.249.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 00:10:54 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 19:10:49 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 19:02:18 -0500
Received: from [192.168.19.2] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 28 Sep 2026 19:02:17 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lwdqa4e61cZLuqC/D+Q5A66hjQZOUhME66yA3Pr5TGPN9Iwxkoccm3szxe+p5BHh5OHCWmkRnQfYkNmfINtXAJqQ0yYqydSOMHeCCHDeeADjN8AbOmtooZTR3J/Ao4F52ARm/tJu9RiLNiMyVOpFuwFWFMvD5fNw3uZh2lDWPymgKxqDzlNvc9MbKfi7XYvb5lGQX/2cVafGyOffjMLOvQvJKpady9adbvZxS8XaeQvffGWU5nk6gBshfQd+RJxpJNCkczz9Bcy9LWliVqtKl29uSyJA50ndN2HStjbtXWGRFn+kUv30xRjevs8ZkH3a5vxxCvag9ktwlEaH9EMQtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lIY/yXBPiR7rMN1OTiT874+R5pzfAC5TBkqqY20S68o=;
 b=DH1R9wMMKFhcKWiDYQJE/nFzTJG0v4AYCEWl00sBFxlt7Vztt6o/+o57Iy32TfafwZ2PKRFIJFLc0hbc/XkMz08gtwrkUdkDMMdUqe/yaDDXK4J8X+JCnFys7TGN9IzEGR6nVVG+HQjoG3lPhXxAqIKiWmnycSNOpRBBznOXkezyYMaeWkwyqXpWUJyD3yGf/nZWDWxN6A3TZTcnDbix8YaHuM4CFLoVV+wcw6z/Vp2FL9J9rsRMIeLrYKPnZ2vJgokVKck2B4vrU10xYt8EB3U1lWYBsDrafBScpXrFxbk4hAyB8LDvuSEYiWGhAHcbVq0utdxoLTKAaL3LYrp8JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIY/yXBPiR7rMN1OTiT874+R5pzfAC5TBkqqY20S68o=;
 b=33zfRXdq3O83A/8j9gxJwB8T5/gRI7rAIQZltap+j0M8DRirQ2F9Bo0HcsTc7ZZIeUpmJzjc9CJl5xLx85uJ4DMz/DXTfJO2vSe9AuyUO/eSozML+mGvLmO1qokaam4L9p/H7vp5faK5R2UbsYWhnqQbaDbraapehbd28fNdqJc=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <83914455-4f49-4c81-bb33-08b47fe3c583@amd.com>
Date: Mon, 28 Sep 2026 20:02:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] x86/svm: Cleanup ns_hostflags type
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
References: <20260928140248.1543013-1-ross.lagerwall@citrix.com>
 <20260928140248.1543013-6-ross.lagerwall@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260928140248.1543013-6-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618F:EE_|CYYPR12MB8654:EE_
X-MS-Office365-Filtering-Correlation-Id: ff7fd0df-5598-4e06-84f7-08df1dbe2126
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|376014|36860700016|10067099003|11063799006|18002099003|22082099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	M+uF4P3IlyNp/DngPEuWVChRhXoRMYfkL5nF3YzxbIJk5hYMtU9z2yJRsASRNSWnUHM6H3mTjlWW7/+7bRSH1a0xJBvOtOqCwVNFLdG2ycVIa7Ws2FJuH9jz+BYWE9ZsAhGiNXm6R2s2aySPraLFSIqsxZp8kUiCtf/pc1IKeZqTIJ8cCFXnfHfcH//iV2oLtnvCXnkQECQnNhEw/acbvNL+om9W8LNWa7SupillyR/URfDrNI4vXvGvwHpDZflytLUrV3/jvg9wgtm+a71zk8MGX1vYeRRvYEnKms2XXbGPGbIX8KRHKzmjnh2VvcOX9e7rODLHDlrefi5hQT9luhY8hDMuNau7XFx/jzvgchnmjCQQ0bRzlsxuSPBEbLccbBzGNZCNfhoWUgJqOoRvhgNuG24C/WUF4sGLi8uZg7eDnd3c7zY8+96WeFQ/WNkQAeSzlHNW6G5JZJ/08oevOJjB9WTjz6OkyKTJyxymDgST+mOWWNNQQkpWeTspMb0xpkQJpM8A+LacUisXeivpcE3g9xxB5rD9losXMzuU/4vYKpk2dOUle3KA3L+544dBs/Nlf97D9PHT0yQWeeDAvlIi9JtZZbUt0pHVuUJl9lt1FkqMZZi+Eq/JK0IBMhmhnD5KtlM2Y27Gb5Q9I/Cq86cOlcUgOsZqL6kM8tMZupmcq9da6ihObtyodoGw5DFWZ9WqQ0o1qLDNQ0FecSjP4g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(376014)(36860700016)(10067099003)(11063799006)(18002099003)(22082099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KtUIwS64PZS+qEhlmwLqmrx+xEmg87LmI+SCESrhb6YlR5eKQYUesJgdgVV0Qhp+MVZPhKpLTIryy2LDnj+OdHSSg1SDjvXt4BN+dKWGgtOTSQchHeQFA4FV8PIqt9+RbaS4vFVGztK5IfF0gWTKy8jvQRRlJfv9uKJVAW1TkypcvAZozG0lFrnUYMg85fsH+YqxpIXuZR3BHo5bz1T0j8LmwCBejaUuIDUF8qvsasiwSkWFo+85RFhVU7FRl7P7phSfxQsCm2YiKQ930rRgp5/dC9crz70l6b6kId+mc9CHiuqwvtqMdFIQCqUOLVuphcyDnKI/NRTZkjLoS+GiRloeNfwT138rPLBR098gDEwy7Syu4vezZWrT0brOQhIa/jZ0ZEHiqtlCwDvY7I1nWmLy8a0XruDSUKnz3hh1hKv1BdCQPVJHYMDtPnDXwmnA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 00:10:54.5701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff7fd0df-5598-4e06-84f7-08df1dbe2126
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C618F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8654
X-purgate-ID: tlsNG-c1860d/1790640662-CD14E87B-D8B2304E/0/0
X-purgate-type: clean
X-purgate-size: 358

On 2026-09-28 10:02, Ross Lagerwall wrote:
> Rearrange the union to drop the .fields infix, rename bytes to the more
> common raw, and adjust types where appropriate. Adjust the users
> accordingly.
> 
> No functional change intended.
> 
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

