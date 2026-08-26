Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BB1C61DBD
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2026 11:50:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399829.1635796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzC9A-0001U7-Do; Wed, 26 Aug 2026 11:50:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399829.1635796; Wed, 26 Aug 2026 11:50:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzC9A-0001U0-BC; Wed, 26 Aug 2026 11:50:24 +0000
Received: by outflank-mailman (input) for mailman id 1399829;
 Wed, 26 Aug 2026 11:50:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wzC99-0001Tu-PL
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 11:50:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzC99-008Fuj-2T
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 13:50:23 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a8ed2f9-8faa-0a2a0a5109dd-0a2a450191f4-18
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 13:50:22 +0200
Received: from [52.101.56.67]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a8ed2fd-5984-0a2a45010019-346538433dab-3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 13:50:22 +0200
Received: from BY1P220CA0015.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::10)
 by LV3PR12MB9168.namprd12.prod.outlook.com (2603:10b6:408:19a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 11:50:18 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::20) by BY1P220CA0015.outlook.office365.com
 (2603:10b6:a03:5c3::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Wed,
 26 Aug 2026 11:50:17 +0000
Received: from satlexmb07.amd.com (149.199.90.133) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 11:50:17 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 26 Aug
 2026 06:50:11 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Wed, 26 Aug 2026 06:50:07 -0500
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
 b=mNpeF+1UZ+MkdshT+Gl3+QQeY+rjpiGAKu7OF0uv0QoKTyOLTOizgLnVWKjOJgvpqnECPhbe+6ydDGwg19QIB9aAc7uaNAzi/G1lrxlyCoY+WaedFgYTDQ263ZoC5yWxmHJiOLI/ug3mwGzmYy0EKB00uKb/wYb93qke5FxRfgQHhG8skljB+htAnd7QtRl/lQ3RQz7zB82UlBp72SMv89bTvXpLw+xYgvO8J3baDV2yqmbqGvLNz/31DxqJI6NdRMZ5O8uJeOLfCh/Cq/zDYol53GLcis4qcseGC7L6aKmRsbdQWYygFQo97/EY8qoxzQeEOdrSCQhcyMXONQUt/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DeAf8T8FMc5gDq2Yy7gMjj4jkKJy6FbTP5bBEtXmlWY=;
 b=P44Y+rsydO5+01gc5Fy6ArCfa4cucDBWcIsQSTevSJJtVKTTLFZ6eQW5BBBBWDQW6EDxqYpg/7426i/moLQZgInXdrev25zQG5tDQeVYq2Pe7V9JGV+EVv3iluxUYnXw6BL+zP76VBb77LJVlWwh5iBNnmQZ7ProWrWBIrDe8EO2HT8ETEJ7vn6EmoNmiGgKhI1wopdUJvpaaMAf50qgE6nwRZAaHcb2zN0hjTiMv1Xz0T1+Bq5bSrSvKJmKFwQYipsoa6beYQ2hNSI2wYBCzTbxvrIsST+rhGB7vK6IV2pKpSEhD64rSPb+N5wEYGezZPOFJngAds6ktkJ72lzWmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.90.133) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DeAf8T8FMc5gDq2Yy7gMjj4jkKJy6FbTP5bBEtXmlWY=;
 b=chJC0EPnaXFcMGgAasCDVnqdSDtP9G9Jy5B53vIfc5HVB134EThKT0loSp8VooQBy9kbEiK1GuujOgDWVDgkWKinczQaW/t56/bjXlH5D4tSCHgPFJQkj3SPIwi0gZn/FCI2sTa9frJBvuSaoj571hqrnRSr+rLXRNaYsZjNHcw=
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.90.133) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.90.133 as permitted sender)
Message-ID: <850183ed-f297-4be2-9c68-ab8be0080030@amd.com>
Date: Wed, 26 Aug 2026 13:50:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] tools/arm: choose GIC version explicitly instead
 of relying on GIC_NATIVE
To: Julian Vetter <julian.vetter@vates.tech>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>,
	Andrii Sultanov <andriy.sultanov@vates.tech>, Guillaume Thouvenin
	<guillaume.thouvenin@vates.tech>, =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>, Teddy Astie <teddy.astie@vates.tech>
References: <20260820123805.2033085-1-julian.vetter@vates.tech>
 <20260820124016.2033421-1-julian.vetter@vates.tech>
 <1787229624.8631fc262581453bbf619ec5b2062170.1a01f2fd7e5000c4f3@vates.tech>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <1787229624.8631fc262581453bbf619ec5b2062170.1a01f2fd7e5000c4f3@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|LV3PR12MB9168:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b2fd55e-bcd5-4282-d36e-08df036832de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|7416014|376014|56012099006|10067099003|6133799003|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	tTCDZ+T6+Z86kHfwXGyGTAuuZvmKh1p86sFA8Zu4fwrKXK+U3vwzGHNj/5BGI7T0XrSkj6sOhD1jPfqDrszeVv+kCqiZggLV9ZrlfEmDTiDhhC8iGliGBSLV4xLHSuqZfrfsUZ/gdbH6vCPpAOwsJtraknBcUpvmroEHQ2TC2H2H0gZx8rAhMfkkiLYt+PWUMEkHmRR+yJy00z+pIPvpF2/ORe/k7meXpohaE8PE+whV8TXeY44fgU/dKpb3hfq7bavsbdohCDrmCetAaUx4//77D+7R+Y4kBNAKC8U25WjuHqwWiP0fAs86DJTjs4p7ZNijce5gNgIOwa5Qgk8cka43lyhNe1W7RH7psaND5xvuevrm6cDejTQwrybYPSfooXRR2S+VFLc4NkNyo5QRPioN81oR9XiwigRf9h6rBqKEbMVHz5ZEwvPcuvGrGl6I6lmFHC/deFScjxJBVwUzJQym5FsLWSQtejebj4tKdUCYRJIWzothrezeI0at3s8qkQUKIdsyL4JYzkwcKeSPwUWGCd+WXX/oav8UWmfvSk9tj44K4rM+j2WutswfaiQPLNlEfqp1j4uwxEjtn5C8QxBZee7Tt+1TtB8XcKwdGh7CaEylDeUXm7fgEeDWH2aNr97K/UNHwhYZ4m4OUNQWzjlCaT2v8lzxmF0gGU4AaupZCY8p8gu8Ev2fzRdOsDHDJatr6k6gffWq1/E/utbbgg==
X-Forefront-Antispam-Report:
	CIP:149.199.90.133;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:unknown-90-133.xilinx.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(7416014)(376014)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wgQkW+lGr+aSZ2KlX0w5viZFYwm4QNtjzriltWSV+JGLnrb2JP1j49uuDO2FOdddIj5soXt0bJjQnuV69dHLhtypIzlJeOVBOZHEsZwuDsVP6PqVBljGAq0jtBmIEM0Q74dYJW86Zq8fSMjjFPKBjMZXRn79y4xAxETC8IPrqYDD49tGOmhhiAI+nBptycw5XOc+nKjXW6MkX4Ckz0XMv+uksT4ezRzVM/Rs3dJpXnwDSPzj0QC1W6DcLNDlN9FpiWwg9+Yegi3eutUpD35A+TBXqChGwOFGTV2sBkdhPtKXEGN1zsuhEEX90iBOvXMGIpO6EDxut/jdtxFtwZXbzg4waAlGmvdpXBKyH6WKiaR61vup72O5gCDphw1SHNq2uVcCBNOqom7McO/Jxmme2lvbfU1fSsK3OeZuMZd1AME3pTrSLERjhtJroZJyApVr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 11:50:17.3538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b2fd55e-bcd5-4282-d36e-08df036832de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[149.199.90.133];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9168
X-purgate-ID: tlsNG-d62444/1787745022-1F46D757-1A8A4247/0/0
X-purgate-type: clean
X-purgate-size: 2755



On 20-Aug-26 14:40, Julian Vetter wrote:
> XEN_DOMCTL_CONFIG_GIC_NATIVE lets the toolstack ask Xen to silently
> resolve the domain's GIC version to whatever the host hardware has. Xen
> then writes the resolved value back into the same in/out
> xen_arch_domainconfig the toolstack used as input, which is the kind of
> API abuse we're trying to get rid of. The struct passed to createdomain
> should only be an input parameter.
> 
> Move the "pick the best available GIC version" decision to the
> toolstack, using the XEN_SYSCTL_PHYSCAP_ARM_GIC_V2/V3 capability bits
> already exposed via XEN_SYSCTL_physinfo:
> 
>  * libxl__arch_domain_build_info_setdefault() resolves
>    LIBXL_GIC_VERSION_DEFAULT to v3 if available, else v2, else fails,
`LIBXL_GIC_VERSION_DEFAULT` should be renamed to `LIBXL_GIC_VERSION_NONE` to
denote that the user did not set any particular version. With your change there
is no default and `libxl__arch_domain_build_info_setdefault()` resolves it
before anything else can see it.

>    before the config is built.
>  * The Python xc.domain_create() binding does the same via a call to
>    xc_physinfo().
>  * libxl__arch_domain_prepare_config() therefore only ever sees a
>    concrete v2/v3 request and just validates it. The GIC_NATIVE case is
>    dropped since setdefault() always resolves it first.
> 
> This guarantees no toolstack path can still produce
> XEN_DOMCTL_CONFIG_GIC_NATIVE, in preparation for removing it from the
> Xen side and from the ABI entirely.
> 
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
> ---
> Changes in v4:
> - Fix a missing closing bracket in arch_capabilities_arm_has()
> ---
>  .../include/xen-tools/arm-arch-capabilities.h | 17 ++++++++++++++++
>  tools/libs/light/libxl_arm.c                  | 17 +++++++++++++---
>  tools/python/xen/lowlevel/xc/xc.c             | 20 ++++++++++++++++++-
You need to update the documentation (i.e. xl.cfg) too.

>  3 files changed, 50 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/include/xen-tools/arm-arch-capabilities.h b/tools/include/xen-tools/arm-arch-capabilities.h
> index 4aa4c6c34a..ce1b3bdd71 100644
> --- a/tools/include/xen-tools/arm-arch-capabilities.h
> +++ b/tools/include/xen-tools/arm-arch-capabilities.h
> @@ -6,6 +6,7 @@
>  #ifndef ARM_ARCH_CAPABILITIES_H
>  #define ARM_ARCH_CAPABILITIES_H
>  
> +#include <stdbool.h>
>  #include <stdint.h>
>  #include <xen/sysctl.h>
>  
> @@ -25,4 +26,20 @@ unsigned int arch_capabilities_arm_sve(unsigned int arch_capabilities)
>  #endif
>  }
>  
> +/*
> + * Generic test for any single-bit XEN_SYSCTL_PHYSCAP_ARM_* capability, e.g.
What makes the implementation single-bit?

Otherwise, LGTM.

~Michal


