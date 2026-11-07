Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E3A606A326
	for <xen-devel@archiver.kernel.org>; Sat,  7 Nov 2026 00:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=x9OQtvzj
Received: from list by lists.xenproject.org with outflank-mailman.1477614.1683002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPU1c-000327-BB; Sat, 07 Nov 2026 00:11:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1477614.1683002; Sat, 07 Nov 2026 00:11:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPU1c-000320-7o; Sat, 07 Nov 2026 00:11:16 +0000
Received: by outflank-mailman (input) for mailman id 1477614;
 Sat, 07 Nov 2026 00:11:15 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xPU1a-00031u-T7
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2026 00:11:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPU1a-008Vlw-A0
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2026 01:11:14 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6aee6c62-2eae-0a2a0a5409dd-0a2a4505e1c4-32
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 01:11:13 +0100
Received: from [52.101.56.7]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6aee6ca0-4cb1-0a2a45050019-346538072f5a-4
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 01:11:13 +0100
Received: from CH0PR03CA0416.namprd03.prod.outlook.com (2603:10b6:610:11b::7)
 by DS3PR12MB637004.namprd12.prod.outlook.com (2603:10b6:8:43f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 00:11:10 +0000
Received: from DM3PEPF000265C2.namprd03.prod.outlook.com
 (2603:10b6:610:11b:cafe::79) by CH0PR03CA0416.outlook.office365.com
 (2603:10b6:610:11b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 00:11:10 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 DM3PEPF000265C2.mail.protection.outlook.com (10.167.23.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 00:11:10 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 18:11:08 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 18:11:08 -0600
Received: from [192.168.19.2] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 6 Nov 2026 18:11:07 -0600
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FqEoyVql5/58l0CPzLzrUsAxwSElaU/GyWgZcn3CVU92HXvhgKnHE4LFvgWXOZMdAbHAtqvsklsfaDNCSQQLnZlYySBLSPJxaol8IjrITf2lVzbWEmJT2K/tos2Pa1kuV+deJXO/u7ekNPXtx342AI6VtmPF4SjBaI/1+tbfSGkHknpnEZZrtwxGMAGzfn0Rj+IPlmIwVCliowGWthsv/FiftCEJUBtLXdKAnJmAicBdXTnoWS+HWPJQSlJskB3msFcEPSNhZvwY2dIpvhxg81gqLjSQWB3io0jveCNtCJTwI3Kp4x8OJOP2rV7P72fhDAFBygCI52qACjvxJ0EXWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HgVRn+JthJCU/a3f/yAhpe/2QUL+mvwRtOMP6JzrdyQ=;
 b=HsKRrDVtYJ9Xcaiu93oS++/isWCDbw7OsaBdUP2mSg5smrl5RnKvk9c5FgRm8hUC6+zN1q720qg042/qLMf8NeFrl/COPD8b0g8WhteGNNv7kUddoLbOdNPPue8eG4YezV6tcGcLoXUxUCkUROWWAdwKicVqDl5sFRnJ3YwQIiJzyAw4cvsOkGyKlqJGBKUCoRf0d56rF5qMONsaHx5KWmTC5wNXlurUp53uZM9ITPn2jZQRbWo2ghSLaITvzXooRTXaFHe4PdhfWCR7sDtI208MImSuf+35dE/l/5H124/Dkpc65onseofdDpbBOC5d/xFblSXIloFlOOsXuWwglw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HgVRn+JthJCU/a3f/yAhpe/2QUL+mvwRtOMP6JzrdyQ=;
 b=x9OQtvzjS5MBlsaZvgNZhhlzumeiaOsZDrVFJxIBIMBPVirQ2L7fn/kxlMW8C/cGUhx1N0HdG3wWe5xtIFtoxS6f0hXrKswAJtCd/2g6ong2dF+1gm5TJDvQ+jWxkJW8Xrg9mHaIrjxtZ2j8Le7VuBynbClIvbHv3ed5d3inh98=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <936b4d91-cb3c-4be5-9945-4c150afbec3a@amd.com>
Date: Fri, 6 Nov 2026 19:11:01 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/ocaml: Fix cleaning bindings test
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Andrii Sultanov <andriy.sultanov@vates.tech>, Guillaume Thouvenin
	<guillaume.thouvenin@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>
References: <20261106231732.482518-1-jason.andryuk@amd.com>
 <0037995b-dea1-42d6-85ac-cfa7719762a3@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <0037995b-dea1-42d6-85ac-cfa7719762a3@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PEPF000265C2:EE_|DS3PR12MB637004:EE_
X-MS-Office365-Filtering-Correlation-Id: dde06e32-9b5a-4e61-dad7-08df3c63a096
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|261026140227099003|11063799006|4143699003|56012099006|261022075727099003|261021123027099003|261021121427099003|261022105027099003|261009223027099003|261102123227099003|261026121527099003|261028144727099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	GRYSYNoE/OUusWuiNy5Fyxlpl2mCiugWKK074w/rITuCnuVmxYFXtEiEUw5rua0gRUv9x+P+xO+5lHjtb052fQZZ+x+JEBz85vsavr3QXeUzguHmf9M282n0Z+huoXJXCbOnh0diNI8vMPQjAwfCMvJr9MiHPqywAk5HxPsL8HKHSrc//I5iX6KqVALZJOW4G7Id1f4xFgiHB6JKK+dQi8Oz+xlhQSBOebsmls0Bfd986lycqJU/RulLUDneTafo5TvMBNNgq7ZgS3GVR1J3y8TB2s5ZhHBz3KmrBw1+hlx7FOzMT+Oz2zhdbiUPwNDGMAe+ak++sLwzJeOhgSjHRj4Hlj9+NSLmZzOF1SJmK2cKlTySa+K1MwF8tVFooq4KTJvnn54nUjAqNd3fgscc3pnnn8cwcJCfHDP7mP5giEcN2boNv6BS7I2FTngMon7Fx0BkFm/UdJDNknoO+A96Q8/5g9AWnQYt0X25jBDn3MkEw6sGseoqlqvzAc+Lb6v2cfQQcjEH/bv6mKsXcPaTc8vrX4v0OCeQqT9tQDoE0dbmrZqhIKHQ2adE9N6uMyezAJDiiYsSqJCKJ7a2BNV1HeyYPUtcfCBb6FviYqQ+ESUMzwvVZHmUv/7UJavBX0lr1P5IR7mXJ52DBRdGnKfjUPDCVCN5T20CuuUwXIH0nV8QC7waO1haxnLpgmtORD9WgCy5NnTtffguzzZimaLmXQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(261026140227099003)(11063799006)(4143699003)(56012099006)(261022075727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(261102123227099003)(261026121527099003)(261028144727099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9QQOkut3++OFuTiKh1Ge4ozq6oAD/JD1Xs/5mntEg7nKFcEbwLn+5+WovrdXkk/TKe2kN8RwagRNu0W3NfJ602IM6dVc6HjbVLlZK8eLekfKrc2frxMjWMz018QsHLMq37SyHmvGur2JuHK+5YrcMQUzPoIBBM+FJbMDtKrEF46EYNkJwbIsnU18RQO933bNVnNRglu33v0qT9F9Yxso6MDWriQEsSyn+JXH9U+P9Y463JEe4gnL5IVye2tGl0OM6smqbidqFBO4G0YV5baV3ECb4B0k3Cd/jxJgnosCe0OJcMC/Qc3sL02WBjiupBBDt358fh6iGhYZjlXJcjWlVUUT+PanYNsdhww9O9h6nhW44JBRLE95yIDaimYo3ocYQogUvhHqf2WrPsBOEhIVVePNNnkh9Ez7VA0xcpDqXqrSD2M4IPJSwhONzU1OvzHA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 00:11:10.2825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dde06e32-9b5a-4e61-dad7-08df3c63a096
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3PEPF000265C2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR12MB637004
X-purgate-ID: tlsNG-c201ff/1794010273-72EB12A1-A89EDB8A/0/0
X-purgate-type: clean
X-purgate-size: 992
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-06 18:19, Andrew Cooper wrote:
> On 06/11/2026 11:17 pm, Jason Andryuk wrote:
>> make clean fails in the bindings tests:
>>
>> make[7]: Entering directory '/home/amd/xen/tools/ocaml/tests/bindings'
>> rm -f .*.d *.o *.so *.a *.cmo *.cmi *.cma *.cmx *.cmxa *.cmxs *.annot *.spot *.spit unix.cmxa -ccopt -L -ccopt ....
>> rm: invalid option -- 'c'
>> Try 'rm --help' for more information.
>>
>> Split the compiler flags out of the LIBS variable, since LIBS is passed
>> to rm.  The individual *.cxma files are deleted in their respective
>> directories.
>>
>> Fixes: d97847e858f1 ("tools/ocaml: Gitlab CI test for bindings")
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> Lovely...  Sorry for breaking this.
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.  I just double checked and unix.cmxa isn't in the directory on a 
successful build.  So the whole thing could be moved to LIBFLAGS or a 
suitable name.

Regards,
Jason

