Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FE0CA5FFC
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 13:47:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442365.1659917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xERyw-00054O-Ax; Wed, 07 Oct 2026 13:46:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442365.1659917; Wed, 07 Oct 2026 13:46:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xERyw-00054H-8F; Wed, 07 Oct 2026 13:46:54 +0000
Received: by outflank-mailman (input) for mailman id 1442365;
 Wed, 07 Oct 2026 13:46:52 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xERyu-00054B-HP
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 13:46:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xERyt-002VHa-UR
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 15:46:51 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6ac64d4b-2eae-0a2a0a5409dd-0a2a45018c54-0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 15:46:51 +0200
Received: from [52.101.201.55]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6ac64d4a-5984-0a2a45010019-3465c9376929-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 15:46:51 +0200
Received: from PH7P220CA0099.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32d::23)
 by PH9PR12MB145095.namprd12.prod.outlook.com (2603:10b6:510:415::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Wed, 7 Oct
 2026 13:46:46 +0000
Received: from BY1PEPF000264B2.namprd02.prod.outlook.com
 (2603:10b6:510:32d:cafe::7c) by PH7P220CA0099.outlook.office365.com
 (2603:10b6:510:32d::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed, 7
 Oct 2026 13:46:45 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF000264B2.mail.protection.outlook.com (10.167.242.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 13:46:44 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 7 Oct
 2026 08:46:42 -0500
Received: from [192.168.19.2] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Wed, 7 Oct 2026 08:46:41 -0500
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
 b=xF2W/JvG6Bi1ailYuCrzG71Z2O9+UdPKtPbX5e78fGTN5VLQwZq2ccyvsX7wEmvM8+lW8bqmJJlcUv4EPpZeKDqpEmiVRbOWiHztHQXzP1DiYUbguye+YgyT79Dx/SDUjdy78+mgnO0KnZq93/Su70KbNuZ/Izl3c9hEHwYseEhRQPs+ZAqFc1Syv+h7eq5SJv4EXIIFznaSK+mHtiuvT1V2Gshtdfi1ZNK1BopIMxwbmo6Qk3tfQ20E1IoqhqlPR5qBiZ9jsFgNxcAhhtnEQPiUCMvJm6tFLWNEio+NNbCN9vyP86lyvL42LjFReiZy8Qc5StyP2ftV4Uu6OGpHCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ehoWudiVxKxtcEhrI+8Z6MQx3xOk3h86OlBn7DITZ60=;
 b=UgIcdC0Vp7m8fFn+J7umIgAgTJF/gcqdtFsk/sYuWDjmQZ0IZ4Mh/qV5uvvQgnIQqMFMBApf1Cp58Ak1AfcijD5RjSLjCoP71qPBkSJw+QnA9s6ft+ELMH2xhxOejZeh41Ts0XrVrfuy3dLVhVuVs/LuLqrDATmXXY385Le1t0FDrrAbslhfpTkL6zyv0onUppPIM1v/0pEez5oTN9RkQLGvxBV26num47iGVVMiQEAwkPTyH4uaqP7BXZ0hdZNyfr+VINn+ka1UKV3pzJtIqBcvhSEs4/+UlEyHPUl/ZwJkM9A8qxaGajNpdxT7MSIn6jXvuCk60sScy/4O2tePJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=solinno.co.uk smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehoWudiVxKxtcEhrI+8Z6MQx3xOk3h86OlBn7DITZ60=;
 b=fH5PQFPrrvxtBkQMmcSRwAuZ8xe9ed5M52BWAySNwWE0rlxBEVUgwQE3TtUFRN6oHn5tnwGFX1NIdzD7iHLdCEFzm4Qh2z+/z/LHyl9VF9JE2o0Dcy7TLGUMHnn5RiVnJrkH1abbtfRRVo9KlP7m7b+Sws3PTtkzXhDjxAdER4w=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <299f80e8-63c4-48d6-8b79-e492ab85b81e@amd.com>
Date: Wed, 7 Oct 2026 07:43:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Finalise bridge VLAN support
From: Jason Andryuk <jason.andryuk@amd.com>
To: Leigh Brown <leigh@solinno.co.uk>, <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk
	<jandryuk@gmail.com>
References: <20240517140506.8460-1-leigh@solinno.co.uk>
 <2d2765c0-be80-4f51-9a6e-a4f6d7507ea3@amd.com>
Content-Language: en-US
In-Reply-To: <2d2765c0-be80-4f51-9a6e-a4f6d7507ea3@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B2:EE_|PH9PR12MB145095:EE_
X-MS-Office365-Filtering-Correlation-Id: 06a90732-0918-42e7-218f-08df24796cf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|36860700016|376014|18002099003|22082099003|10067099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	tXq/Yeug04IgM6fpMj8WPvFs3CTkHgBQeLpOEmDJogDHr9p2vokooPOI6xzq9ZRnrzXaRypO0E7EgMebRDbG1UpvFAc/W+1e4plDHIl2dytZ84C3iGrOas1du45B4MuZX4uX6ADyZ8Ma7R8IcKCqp6ErV0K/gIUyMxhlacTUGlanzhn91LB4lSIf92LBFeqnptF0aJzf+UACV1AMfmSphz26domnv93fJy2BgAW9kwQxLVvD/8Mt2vBzbxkdYieMfv1Sgwj49dGFKioVZnarhKhD+XU27tuLf99fsdBEGkQpojiVMk0BONu0EUOxs/MCxr57cfACm964acnA8DJqk3PDVZfvm3doVungWeQgkPBcnOymGuX9LE0Y3XnxRY/dYi6Jwf7bbIi5Cs5F9BFuHV1FEfzNuM8li/qTaFaoaHMt287ZgBhaoWfwKV8VB205hhF4ljuWmuaV6nDfF58KIXet7bI88Ewcdb5G7xAsgubvZFh204MmkJ+uRONeBC+GPJ29+D5Lat41GE2fFK2HXtzFUX2UrF84qcvO1AGAmKummC9ZHUUrZct9uQOHawsz4c2fDg4PKzlg5cB2vhUdOTIfpolCDkEvSQI3novesw68XdeD1mlNZs0u99Hnq9/G8FSeuqeMh3+Wo/QkiOSla87pein46tld9pXkR+ZvEFYAdN78cibnvV4c7/Jz2UjZBRicr6Vt+/6YFd3DzsR6PA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(36860700016)(376014)(18002099003)(22082099003)(10067099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	o/v+Gdb36BjVpCOqPlXPcDWhbGadOvmsqG4zKaXcfsZybtgQ9Rx/akfjmbfTUATST8/Z/rY7/jt8lnUH3a+y8slvPoOCjPA7ii2py/5Thb984+R788wLJqh4orDE8zSqsJ52R2VhkCP43VKu9sjRir26qHsP0Ns47KggvyXnSTs7c96ki5p7neH255CxumUqP6/HNGPOnkXhYr727uKV/9GX6Z+mbUXzSGOD+21B7PKfbv/bGQqqoc7RaZCjg1P/2T/IUm5mamP2PsM4ZGunkzGw9bKZ7v7DSbZ+sIqP7IZ4V6xuBxF8xTihiYv/UQK6BnKX2iIgXzICOyvTda8+HGnVudy3L8/kp1AQTh372NQgu09mWhspOzQgdloaXY2Zh6HDSxLEk9a2/H6neeSWvZU01a0G43ipqt3zA1bPxT+xcyPHsIVSYhojlk5FF9Vg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 13:46:44.6275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06a90732-0918-42e7-218f-08df24796cf5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264B2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR12MB145095
X-purgate-ID: tlsNG-d62444/1791380811-1D87F757-416A0C55/0/0
X-purgate-type: clean
X-purgate-size: 547

On 2026-10-07 07:41, Jason Andryuk wrote:
> On 2024-05-17 10:05, Leigh Brown wrote:
>> Hello,
>>
>> The first two patches have been merged so this version has the remaining
>> two. Only the first of these two patches has changed since v3.
> I was asked about vlan support recently - apparently it's not working. 
> As Leigh states, the xl changes were merged, but these two hotplug 
> script changes were not.
> 
> I reviewed them, but they need Anthony's Maintainer Ack/R-b.
Once again with Anthony's current email address.

-Jason

