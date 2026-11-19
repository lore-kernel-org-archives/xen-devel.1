Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D8F606A602
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 17:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=BGDVRTJ3
Received: from list by lists.xenproject.org with outflank-mailman.1496725.1695129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU5eQ-0005VI-IT; Thu, 19 Nov 2026 17:10:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496725.1695129; Thu, 19 Nov 2026 17:10:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU5eQ-0005Uq-Ev; Thu, 19 Nov 2026 17:10:22 +0000
Received: by outflank-mailman (input) for mailman id 1496725;
 Thu, 19 Nov 2026 17:10:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ayan.kumar.halder@amd.com>) id 1xU5eO-0005Uh-Vt
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 17:10:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU5eO-00ABaP-2v
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 18:10:20 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6aff2d6c-8faa-0a2a0a5109dd-0a2a4503829a-24
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 18:10:19 +0100
Received: from [52.101.43.38]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6aff2d79-fae8-0a2a45030019-34652b26f7d3-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 18:10:19 +0100
Received: from BN0PR02CA0022.namprd02.prod.outlook.com (2603:10b6:408:e4::27)
 by SJ2PR12MB8807.namprd12.prod.outlook.com (2603:10b6:a03:4d0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 17:10:10 +0000
Received: from BN3PEPF00022BBF.namprd04.prod.outlook.com
 (2603:10b6:408:e4:cafe::85) by BN0PR02CA0022.outlook.office365.com
 (2603:10b6:408:e4::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Thu,
 19 Nov 2026 17:10:10 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF00022BBF.mail.protection.outlook.com (10.167.248.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 17:10:10 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 11:10:09 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 11:10:09 -0600
Received: from [192.168.1.21] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Thu, 19 Nov 2026 11:10:07 -0600
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
 b=etLS0Ue0wqtde34uog2/LzavW2xRcKW9gHDiZuSpNyC21CiDSMPurCe7yCRqLS700SXVN4qWj0g6TrEFaQOgCksVUuAoercXCmmIn6OSxq8HWx77n8YGgTeIt4ZeqVWNHhkXCc2umpaNLgtMWYqNsEd6lqpHM8ZDi9+aHU3P7cxHSMg8pcBxQ5zqOD67XwdqHDZbPBko1IvXylCrJ9drR4qo4ytcM8BDCpHFwuir+29ElXU7wN3kzG92jbOLy7j59PH+RHNLw/+NLo/6JVAL5LeQOv5o1QhvYI4dWKhonrCz0kNx9uMb4B4pWmup5bYOSro4mSC6s5Y8fBXGQ1wjBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h0EYTl9uJyozjZ9OaYjOgSPuKgpCCGDMjYfta+MaGZk=;
 b=Aeep7yCkRIF7zzyVT9HSzRKHN4mDioZ2gp6DC6dcbN/X/KOcdbMxPMWM/3Azx6dMLQrCLCQmBm4cqW/CPGn55nbapGfj7JSu0sUYpS6UJMLKFbB1IY40cpXVBqTsbl1TBiJv3f1qu2R+zwPVCl1K9Pn6WP4Xu2DOZNbBxzheaXA3n9RO4e4d3a6j0RgFFbTQl6dUguCo8kh8Jdf5QPO6tayS1zBhQFMD65v4gxGGnKpucVBDDMjgqJDNalwwcIut48vvQ2d+PltIrSdwAtRRugvkm209trxdrmbjAd94PpkMlCnH8NSsKST5C9FrmXgD8tQ5H0kGtfp3uujxYWTHJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ford.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h0EYTl9uJyozjZ9OaYjOgSPuKgpCCGDMjYfta+MaGZk=;
 b=BGDVRTJ3b0YUoO1JS2t9KG7LPwuikm3SfDB6VMZtLyvW9TGb1DsTgKN7N5S0fqnVhENhRczsNkV6d5P5s/c7PfzqyZEu0qk3QekzRsS5ECZ1Wl3KGc/JXvgcTtvgCAB82Oh37D4kjlVrHg6bifgQPnwCQj8WzOzagH+Y3NCad4c=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Content-Type: multipart/alternative;
	boundary="------------npfWuLLajC5P51BCGbJmzwAO"
Message-ID: <0445ed54-9f51-4486-9e40-bce77e30eb35@amd.com>
Date: Thu, 19 Nov 2026 17:10:01 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 23/26] docs/fusa: add NS16x50 UART requirements for x86
To: <dmukhin@ford.com>, <xen-devel@lists.xenproject.org>
CC: <andrew.cooper3@citrix.com>, <anthony.perard@vates.tech>,
	<jbeulich@suse.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<roger@xenproject.org>, <sstabellini@kernel.org>, <xakep.amatop@gmail.com>,
	<dmukhin@xen.org>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <20261111194800.1070016-1-dmukhin@ford.com>
 <20261111194800.1070016-24-dmukhin@ford.com>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <20261111194800.1070016-24-dmukhin@ford.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BBF:EE_|SJ2PR12MB8807:EE_
X-MS-Office365-Filtering-Correlation-Id: 54561033-5bb1-4e3b-e913-08df465ff7b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|376014|1800799024|7416014|6133799003|18002099003|22082099003|8126099003|261009223027099003|3023799007|8096899003|261022075727099003|261022115727099003|5023799004|56012099006|11063799006|261028144727099003|261026121527099003|4143699003|10067099003|261026140227099003|261021135927099003|261021121427099003|261022105027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	vo2sOejSxWXpQ+nxMrDJ5lY61UwUr9025EwJ3A9phAdNyYjQnRn2OhJVti1G8gphx5RfYNeyPBCcTOPLtjl13WdmnuGotFsJK4Yw/sjUFOmW7V4/+Y/vA2ie6EaUO5x08tcfVvT7X1E0D7yh/HNPqAjPd/8rIEM07EMRqK6jbPtsDCQMBuXvyYOeaDP6P2Bc3ocGHSViCBE+wS6weVK0IhItc9dMMAjhEL9h10I5nCsQsrbXmgX5eBqcYEBPPd6TiiakVFWOslIuK2gOrMIjcWCvtiOGoKqiO4PQnjP6GYQTSdIwe3qeVfvyHDQHIMcOjNd8moSA6yy8M0neKsd5NaKBmFDR7DhLx7qf3EIKAs4qWXqeu4fP/zdum8x4c5T2hd+u6ioBHOLBo82ntBfswOC8RnjTQ3aJsHHRMirAs+7WFNZZzTg/h+zYwvVTj6ZTPWAHFoXqBpoHQTJqtADc6hnWT67s5TZ62Sqno1pDm/s7cRL9CEY8f18HI+Lcz62WtbrKhHMmvyxUgPx5+3Mp8Sm5nksnYMd+Ndcdc7rsnJinMWH14LdYLOWK+74WKN/y3xdyElOVWuaDDetKb3alK6bRCcX0mj1SnImgiTh54Uzy2wY0WDFVUG03igmJzsC7Wvi2dZg+qcQ0Kapcq9mzYCahtosUhqpUwRvHfhniECupHW4bckofSXhPslkUDlIVNLmahoFO9dYX+HfzcIuOJQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(376014)(1800799024)(7416014)(6133799003)(18002099003)(22082099003)(8126099003)(261009223027099003)(3023799007)(8096899003)(261022075727099003)(261022115727099003)(5023799004)(56012099006)(11063799006)(261028144727099003)(261026121527099003)(4143699003)(10067099003)(261026140227099003)(261021135927099003)(261021121427099003)(261022105027099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QdsCFw9oDrRcwt4zMp2aIXF3brl5NhePd7cYFIMPDiqDQChDni/kGBTGSZ68QF2aTpZfV3HxXgGIaInnXmcHkA0CeV1wTXeMZL4j92OU4Ing/tj2Wwa6PMY9AVUYryDKD25T9Z3HZXLsHXSoTp0TXO2KxpHoVMNo+fli0osy/I/L7b8e0H6zupoQYdPIBnHopc+c2C/H1HicnVb9wiH4BOo0QPRTSNx6heflxoK5ORNP5IaWaqU7PEdx0hoz69EYiHCh8Tm5WUxcSbMpRA7m679+6NjEafU8+9okpo+fLiOw3wwS8CM4xMJFF9GhkHN3svjAi6FpdbRNA8bXrIHC4vxM7ou/b6JRtHJHpMurV91ddCnEiu4PJOyZXSH6YWlmx/bfCvJErSNV8+5gO/pvh7tkCyvSBoAZDn2Pa3X89d7qj8VDfRhnU7CIKIy/BVJ6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 17:10:10.1408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54561033-5bb1-4e3b-e913-08df465ff7b9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8807
X-purgate-ID: tlsNG-33051d/1795108219-758824E9-FF81BE85/0/0
X-purgate-type: clean
X-purgate-size: 34550
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------npfWuLLajC5P51BCGbJmzwAO
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Denis,

The requirements look good. And it is great that you have written the 
tests as well.

So from a FuSa perspective, these requirements are 'covered'.

I want to confirm the tests for each of the requirements.

Refer "[XTF PATCH v1 6/6] x86: add NS16550-compatible emulator test"

On 11/11/2026 19:47, dmukhin@ford.com wrote:
> From: Ayan Kumar Halder<ayan.kumar.halder@amd.com>
>
> Add the market-to-design traceability chain for the emulated
> NS16550-compatible UART exposed to x86 domains.
>
> The design requirements are written one per row of the test_suite[]
> array in the XTF test tests/emul-ns16x50/main.c, so that each
> requirement is covered by a test case.
>
> Additionally, document the assumptions Xen makes on the domain in order
> to provide the functionality.
>
> Introduce XenProd~x86_emulated_uart~1 as the product requirement the
> design requirements cover, and add the two new documents to the toctree.
>
> Finally, fill in the maintainer of the FUSA (x86) entry and extend it to
> cover the x86 product requirements.
>
> Signed-off-by: Ayan Kumar Halder<ayan.kumar.halder@amd.com>
> Signed-off-by: Denis Mukhin<dmukhin@ford.com>
> ---
>   MAINTAINERS                                |   7 +
>   docs/fusa/reqs/design-reqs/x86/ns16x50.rst | 386 +++++++++++++++++++++
>   docs/fusa/reqs/index.rst                   |   2 +
>   docs/fusa/reqs/product-reqs/x86/reqs.rst   |  24 ++
>   4 files changed, 419 insertions(+)
>   create mode 100644 docs/fusa/reqs/design-reqs/x86/ns16x50.rst
>   create mode 100644 docs/fusa/reqs/product-reqs/x86/reqs.rst
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 327adf4641a1..2c0eaaea2d24 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -335,6 +335,13 @@ F:	xen/arch/x86/include/asm/x86_*/efi*.h
>   F:	xen/common/efi/
>   F:	xen/include/efi/
>   
> +FUSA (x86)
> +M:	Denis Mukhin<dmukhin@ford.com>
> +R:	Ayan Kumar Halder<ayan.kumar.halder@amd.com>
> +S:	Supported
> +F:	docs/fusa/reqs/design-reqs/x86
> +F:	docs/fusa/reqs/product-reqs/x86
> +
>   FUSA
>   M:	Stefano Stabellini<sstabellini@kernel.org>
>   M:	Bertrand Marquis<bertrand.marquis@arm.com>
> diff --git a/docs/fusa/reqs/design-reqs/x86/ns16x50.rst b/docs/fusa/reqs/design-reqs/x86/ns16x50.rst
> new file mode 100644
> index 000000000000..e3995dc9defc
> --- /dev/null
> +++ b/docs/fusa/reqs/design-reqs/x86/ns16x50.rst
> @@ -0,0 +1,386 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +NS16550-compatible UART Emulation
> +=================================
> +
> +The following are the requirements related to NS16550-compatible UART emulated
> +and exposed by Xen x86 domains.
> +
> +Access UART scratch register
> +----------------------------
> +
> +`XenSwdgn~emul_ns16x50_scr~1`
> +
> +Description:
> +Xen shall emulate a scratch register for read/write.
Is this tested by test_scr() ? And ..
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emul_ns16x50~1`
> +
> +Access Transmit Holding Register
> +--------------------------------
> +
> +`XenSwdgn~emul_ns16x50_thr~1`
> +
> +Description:
> +Xen shall emulate a transmit holding register.
test_thr()
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emul_ns16x50~1`
> +
> +Access Line Control Register
> +----------------------------
> +
> +`XenSwdgn~emul_ns16x50_lcr~1`
> +
> +Description:
> +Xen shall emulate a line control register for read/write.
test_lcr()
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emul_ns16x50~1`
> +
> +Access Interrupt Enable Register
> +--------------------------------
> +
> +`XenSwdgn~emul_ns16x50_ier~1`
> +
> +Description:
> +Xen shall emulate an interrupt enable register for read/write.
test_ier()
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emul_ns16x50~1`
> +
> +Access divisor latch registers to support various baud rates
> +------------------------------------------------------------
> +
> +`XenSwdgn~emul_ns16x50_divisor_latch~1`
> +
> +Description:
> +Xen shall emulate the divisor latch low and divisor latch high registers to
> +support baud rates - 50, 75, 110, 134.5, 150, 300, 600, 1200, 1800, 2000,
> +2400, 3600, 4800, 7200, 9600, 14400, 19200, 28800, 38400, 57600 and 115200.
test_divisor_latch()
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emul_ns16x50~1`
> +
> +Access Modem Control Register
> +-----------------------------
> +
> +`XenSwdgn~emul_ns16x50_mcr~1`
> +
> +Description:
> +Xen shall emulate a modem control register for read/write.
test_mcr()
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emul_ns16x50~1`
> +
> +Enable and disable the FIFOs
> +----------------------------
> +
> +`XenSwdgn~emul_ns16x50_fcr_enable~1`
> +
> +Description:
> +Xen shall report the FIFO state in the interrupt identification register
> +according to the FIFO enable bit of the FIFO control register.
test_fcr_toggle()
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emul_ns16x50~1`
> +
> +Select the receiver FIFO trigger level
> +--------------------------------------
> +
> +`XenSwdgn~emul_ns16x50_fcr_trigger_level~1`
> +
> +Description:
> +Xen shall accept a write of any receiver FIFO trigger level to the FIFO
> +control register.
test_fcr_trigger()
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emul_ns16x50~1`
> +
> +Clear the FIFOs
> +---------------
> +
> +`XenSwdgn~emul_ns16x50_fcr_clear~1`
> +
> +Description:
> +Xen shall discard the buffered data of the receiver and the transmitter FIFOs
> +when the corresponding clear bit of the FIFO control register is written.
test_fcr_clear()
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emul_ns16x50~1`
> +
> +Transfer data in loopback mode
> +------------------------------
> +
> +`XenSwdgn~emul_ns16x50_loopback_data~1`
> +
> +Description:
> +Xen shall route a byte written to the transmit holding register back to the
> +receiver buffer register when the loopback bit of the modem control register
> +is set.
test_loopback_data_path()
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emul_ns16x50~1`
> +
> +Report modem status in loopback mode
> +------------------------------------
> +
> +`XenSwdgn~emul_ns16x50_loopback_modem~1`
> +
> +Description:
> +Xen shall reflect the modem control register outputs into the modem status
> +register inputs when the loopback bit of the modem control register is set.
test_loopback_modem_path()
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emul_ns16x50~1`
> +
> +Report no pending interrupt
> +---------------------------
> +
> +`XenSwdgn~emul_ns16x50_iir_no_interrupt~1`
> +
> +Description:
> +Xen shall report no pending interrupt in the interrupt identification register
> +when no interrupt reason is enabled in the interrupt enable register.
test_iir_noint()
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emul_ns16x50~1`
> +
> +Report the transmit holding register empty interrupt reason
> +-----------------------------------------------------------
> +
> +`XenSwdgn~emul_ns16x50_iir_thr~1`
> +
> +Description:
> +Xen shall report the transmit holding register empty interrupt reason in the
> +interrupt identification register while that reason is enabled and the
> +transmit holding register is empty.
test_iir_thr_source()
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emul_ns16x50~1`
> +
> +Report the received data available interrupt reason
> +---------------------------------------------------
> +
> +`XenSwdgn~emul_ns16x50_iir_rda~1`
> +
> +Description:
> +Xen shall report the received data available interrupt reason in the interrupt
> +identification register while that reason is enabled and unread data is
> +pending in the receiver.
test_iir_rda_source()
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emul_ns16x50~1`
> +
> +Report the highest priority interrupt reason
> +--------------------------------------------
> +
> +`XenSwdgn~emul_ns16x50_iir_priority~1`
> +
> +Description:
> +Xen shall report the highest priority pending interrupt reason in the
> +interrupt identification register when more than one enabled reason is
> +pending.
test_iir_priority()
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emul_ns16x50~1`
> +
> +Assumption of Use on the Domain
> +===============================
> +
> +Configure the UART for 8 data bits, no parity and 1 stop bit
> +------------------------------------------------------------
> +
> +`XenSwdgn~emul_ns16x50_dom_configure_8n1~1`
> +
> +Description:
> +The domain shall configure the UART for a character format of 8 data bits, no
> +parity and 1 stop bit.
> +
> +Rationale:
> +Xen stores the word length, parity and stop bit fields of the line control
> +register but does not act on them. A domain which configures any other
> +character format observes the 8n1 behaviour regardless.
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emul_ns16x50~1`
> +
> +Program a non-zero baud rate divisor
> +------------------------------------
> +
> +`XenSwdgn~emul_ns16x50_dom_program_nonzero_divisor~1`
> +
> +Description:
> +The domain shall program a non-zero value into the divisor latch registers
> +before transferring data.
> +
> +Rationale:
> +Xen treats a divisor of zero as the serial communication being disabled, and
> +discards accesses to the transmit holding register and the receiver buffer
> +register while the divisor is zero.
> +
> +Comments:
> +Xen resets the divisor latch registers to a divisor corresponding to 115200
> +baud, so a domain which does not program them at all is able to transfer data.
> +
> +Covers:
> + - `XenProd~emul_ns16x50~1`
> +
> +Clear the divisor latch access bit before transferring data
> +-----------------------------------------------------------
> +
> +`XenSwdgn~emul_ns16x50_dom_clear_dlab~1`
> +
> +Description:
> +The domain shall clear the divisor latch access bit of the line control
> +register before accessing the receiver buffer register, the transmit holding
> +register or the interrupt enable register.
> +
> +Rationale:
> +The divisor latch registers share their I/O port offsets with the receiver
> +buffer register, the transmit holding register and the interrupt enable
> +register. Xen discards received characters while the divisor latch access bit
> +is set.
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emul_ns16x50~1`
> +
> +Set the out2 bit of the modem control register to receive interrupts
> +--------------------------------------------------------------------
> +
> +`XenSwdgn~emul_ns16x50_dom_set_out2~1`
> +
> +Description:
> +The domain shall set the out2 bit of the modem control register in order to
> +receive UART interrupts.
> +
> +Rationale:
> +On a PC compatible UART the out2 output gates the interrupt line, and Xen
> +emulates that gating. A domain which leaves out2 clear does not receive UART
> +interrupts irrespective of the contents of the interrupt enable register.
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emul_ns16x50~1`
> +
> +Access the UART registers with the supported access widths
> +-----------------------------------------------------------
> +
> +`XenSwdgn~emul_ns16x50_dom_access_width~1`
> +
> +Description:
> +The domain shall access the UART registers with an 8-bit access, other than
> +the divisor latch registers which may also be accessed with a naturally
> +aligned 16-bit access.
> +
> +Rationale:
> +Xen discards an access which is not naturally aligned, which is wider than
> +16 bits, or which is a 16-bit access to a register other than the divisor
> +latch registers.
> +
> +Comments:
> +A discarded access does not raise an exception in the domain. A read returns
> +an all ones value.
> +
> +Covers:
> + - `XenProd~emul_ns16x50~1`
> +
> +Do not rely on the reserved bits of the UART registers
> +-------------------------------------------------------
> +
> +`XenSwdgn~emul_ns16x50_dom_reserved_bits~1`
> +
> +Description:
> +The domain shall not rely on the value of the reserved bits of the interrupt
> +enable register, the modem control register and the FIFO control register.
> +
> +Rationale:
> +Xen discards the reserved bits on a write, so they read as zero.
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emul_ns16x50~1`
> +
> +Do not rely on the UART state being preserved across save and restore
> +----------------------------------------------------------------------
> +
> +`XenSwdgn~emul_ns16x50_dom_no_save_restore~1`
> +
> +Description:
> +The domain shall not rely on the state of the UART being preserved across a
> +save and restore of the domain.
> +
> +Rationale:
> +Xen does not include the emulated UART state in the domain save image.
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emul_ns16x50~1`
> diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
> index de19b0cda252..6c1249c9f18c 100644
> --- a/docs/fusa/reqs/index.rst
> +++ b/docs/fusa/reqs/index.rst
> @@ -10,10 +10,12 @@ Requirements documentation
>      market-reqs/reqs
>      product-reqs/reqs
>      product-reqs/arm64/reqs
> +   product-reqs/x86/reqs
>      product-reqs/version_hypercall
>      product-reqs/hypercall
>      design-reqs/arm64/generic-timer
>      design-reqs/arm64/sbsa-uart
>      design-reqs/arm64/hypercall
>      design-reqs/arm64/version_hypercall
> +   design-reqs/x86/ns16x50
>      design-reqs/version_hypercall
> diff --git a/docs/fusa/reqs/product-reqs/x86/reqs.rst b/docs/fusa/reqs/product-reqs/x86/reqs.rst
> new file mode 100644
> index 000000000000..ab517c02471f
> --- /dev/null
> +++ b/docs/fusa/reqs/product-reqs/x86/reqs.rst
> @@ -0,0 +1,24 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Domain Creation And Runtime
> +===========================
> +
> +Emulated UART
> +-------------
> +
> +`XenProd~emul_ns16x50~1`
> +
> +Description:
> +Xen shall provide an NS16550-compatible UART device to the domains.
> +
> +Rationale:
> +
> +Comments:
> +The device is exposed to a domain as a set of I/O ports at one of the legacy
> +PC COM port base addresses.
> +
> +Covers:
> + - `XenMkt~provide_console_domains~1`
> +
> +Needs:
> + - XenSwdgn

LGTM

Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

- Ayan

--------------npfWuLLajC5P51BCGbJmzwAO
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Denis,</p>
    <p>The requirements look good. And it is great that you have written
      the tests as well. </p>
    <p>So from a FuSa perspective, these requirements are 'covered'.</p>
    <p>I want to confirm the tests for each of the requirements.</p>
    <p>Refer "[XTF PATCH v1 6/6] x86: add NS16550-compatible emulator
      test"</p>
    <div class="moz-cite-prefix">On 11/11/2026 19:47, <a class="moz-txt-link-abbreviated" href="mailto:dmukhin@ford.com">dmukhin@ford.com</a>
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20261111194800.1070016-24-dmukhin@ford.com">
      <pre wrap="" class="moz-quote-pre">From: Ayan Kumar Halder <a class="moz-txt-link-rfc2396E" href="mailto:ayan.kumar.halder@amd.com">&lt;ayan.kumar.halder@amd.com&gt;</a>

Add the market-to-design traceability chain for the emulated
NS16550-compatible UART exposed to x86 domains.

The design requirements are written one per row of the test_suite[]
array in the XTF test tests/emul-ns16x50/main.c, so that each
requirement is covered by a test case.

Additionally, document the assumptions Xen makes on the domain in order
to provide the functionality.

Introduce XenProd~x86_emulated_uart~1 as the product requirement the
design requirements cover, and add the two new documents to the toctree.

Finally, fill in the maintainer of the FUSA (x86) entry and extend it to
cover the x86 product requirements.

Signed-off-by: Ayan Kumar Halder <a class="moz-txt-link-rfc2396E" href="mailto:ayan.kumar.halder@amd.com">&lt;ayan.kumar.halder@amd.com&gt;</a>
Signed-off-by: Denis Mukhin <a class="moz-txt-link-rfc2396E" href="mailto:dmukhin@ford.com">&lt;dmukhin@ford.com&gt;</a>
---
 MAINTAINERS                                |   7 +
 docs/fusa/reqs/design-reqs/x86/ns16x50.rst | 386 +++++++++++++++++++++
 docs/fusa/reqs/index.rst                   |   2 +
 docs/fusa/reqs/product-reqs/x86/reqs.rst   |  24 ++
 4 files changed, 419 insertions(+)
 create mode 100644 docs/fusa/reqs/design-reqs/x86/ns16x50.rst
 create mode 100644 docs/fusa/reqs/product-reqs/x86/reqs.rst

diff --git a/MAINTAINERS b/MAINTAINERS
index 327adf4641a1..2c0eaaea2d24 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -335,6 +335,13 @@ F:	xen/arch/x86/include/asm/x86_*/efi*.h
 F:	xen/common/efi/
 F:	xen/include/efi/
 
+FUSA (x86)
+M:	Denis Mukhin <a class="moz-txt-link-rfc2396E" href="mailto:dmukhin@ford.com">&lt;dmukhin@ford.com&gt;</a>
+R:	Ayan Kumar Halder <a class="moz-txt-link-rfc2396E" href="mailto:ayan.kumar.halder@amd.com">&lt;ayan.kumar.halder@amd.com&gt;</a>
+S:	Supported
+F:	docs/fusa/reqs/design-reqs/x86
+F:	docs/fusa/reqs/product-reqs/x86
+
 FUSA
 M:	Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:sstabellini@kernel.org">&lt;sstabellini@kernel.org&gt;</a>
 M:	Bertrand Marquis <a class="moz-txt-link-rfc2396E" href="mailto:bertrand.marquis@arm.com">&lt;bertrand.marquis@arm.com&gt;</a>
diff --git a/docs/fusa/reqs/design-reqs/x86/ns16x50.rst b/docs/fusa/reqs/design-reqs/x86/ns16x50.rst
new file mode 100644
index 000000000000..e3995dc9defc
--- /dev/null
+++ b/docs/fusa/reqs/design-reqs/x86/ns16x50.rst
@@ -0,0 +1,386 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+NS16550-compatible UART Emulation
+=================================
+
+The following are the requirements related to NS16550-compatible UART emulated
+and exposed by Xen x86 domains.
+
+Access UART scratch register
+----------------------------
+
+`XenSwdgn~emul_ns16x50_scr~1`
+
+Description:
+Xen shall emulate a scratch register for read/write.</pre>
    </blockquote>
    Is this tested by <span
    style="padding: 0px; tab-size: 8; white-space: pre-wrap;"
    class="hljs diff colorediffs language-diff"><span
    class="hljs-addition">test_scr() ? And ..</span></span>
    <blockquote type="cite"
      cite="mid:20261111194800.1070016-24-dmukhin@ford.com">
      <pre wrap="" class="moz-quote-pre">
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Access Transmit Holding Register
+--------------------------------
+
+`XenSwdgn~emul_ns16x50_thr~1`
+
+Description:
+Xen shall emulate a transmit holding register.</pre>
    </blockquote>
    <span style="padding: 0px; tab-size: 8; white-space: pre-wrap;"
    class="hljs diff colorediffs language-diff"><span
    class="hljs-addition">test_thr()</span></span>
    <blockquote type="cite"
      cite="mid:20261111194800.1070016-24-dmukhin@ford.com">
      <pre wrap="" class="moz-quote-pre">
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Access Line Control Register
+----------------------------
+
+`XenSwdgn~emul_ns16x50_lcr~1`
+
+Description:
+Xen shall emulate a line control register for read/write.</pre>
    </blockquote>
    test_lcr()
    <blockquote type="cite"
      cite="mid:20261111194800.1070016-24-dmukhin@ford.com">
      <pre wrap="" class="moz-quote-pre">
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Access Interrupt Enable Register
+--------------------------------
+
+`XenSwdgn~emul_ns16x50_ier~1`
+
+Description:
+Xen shall emulate an interrupt enable register for read/write.</pre>
    </blockquote>
    test_ier()
    <blockquote type="cite"
      cite="mid:20261111194800.1070016-24-dmukhin@ford.com">
      <pre wrap="" class="moz-quote-pre">
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Access divisor latch registers to support various baud rates
+------------------------------------------------------------
+
+`XenSwdgn~emul_ns16x50_divisor_latch~1`
+
+Description:
+Xen shall emulate the divisor latch low and divisor latch high registers to
+support baud rates - 50, 75, 110, 134.5, 150, 300, 600, 1200, 1800, 2000,
+2400, 3600, 4800, 7200, 9600, 14400, 19200, 28800, 38400, 57600 and 115200.</pre>
    </blockquote>
    <span style="padding: 0px; tab-size: 8; white-space: pre-wrap;"
    class="hljs diff colorediffs language-diff"><span
    class="hljs-addition">test_divisor_latch()</span></span>
    <blockquote type="cite"
      cite="mid:20261111194800.1070016-24-dmukhin@ford.com">
      <pre wrap="" class="moz-quote-pre">
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Access Modem Control Register
+-----------------------------
+
+`XenSwdgn~emul_ns16x50_mcr~1`
+
+Description:
+Xen shall emulate a modem control register for read/write.</pre>
    </blockquote>
    <span style="padding: 0px; tab-size: 8; white-space: pre-wrap;"
    class="hljs diff colorediffs language-diff"><span
    class="hljs-addition">test_mcr()</span></span>
    <blockquote type="cite"
      cite="mid:20261111194800.1070016-24-dmukhin@ford.com">
      <pre wrap="" class="moz-quote-pre">
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Enable and disable the FIFOs
+----------------------------
+
+`XenSwdgn~emul_ns16x50_fcr_enable~1`
+
+Description:
+Xen shall report the FIFO state in the interrupt identification register
+according to the FIFO enable bit of the FIFO control register.</pre>
    </blockquote>
    <span style="padding: 0px; tab-size: 8; white-space: pre-wrap;"
    class="hljs diff colorediffs language-diff"><span
    class="hljs-addition">test_fcr_toggle()</span></span>
    <blockquote type="cite"
      cite="mid:20261111194800.1070016-24-dmukhin@ford.com">
      <pre wrap="" class="moz-quote-pre">
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Select the receiver FIFO trigger level
+--------------------------------------
+
+`XenSwdgn~emul_ns16x50_fcr_trigger_level~1`
+
+Description:
+Xen shall accept a write of any receiver FIFO trigger level to the FIFO
+control register.</pre>
    </blockquote>
    <span style="padding: 0px; tab-size: 8; white-space: pre-wrap;"
    class="hljs diff colorediffs language-diff"><span
    class="hljs-addition">test_fcr_trigger()</span></span>
    <blockquote type="cite"
      cite="mid:20261111194800.1070016-24-dmukhin@ford.com">
      <pre wrap="" class="moz-quote-pre">
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Clear the FIFOs
+---------------
+
+`XenSwdgn~emul_ns16x50_fcr_clear~1`
+
+Description:
+Xen shall discard the buffered data of the receiver and the transmitter FIFOs
+when the corresponding clear bit of the FIFO control register is written.</pre>
    </blockquote>
    <span style="padding: 0px; tab-size: 8; white-space: pre-wrap;"
    class="hljs diff colorediffs language-diff"><span
    class="hljs-addition">test_fcr_clear()</span></span>
    <blockquote type="cite"
      cite="mid:20261111194800.1070016-24-dmukhin@ford.com">
      <pre wrap="" class="moz-quote-pre">
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Transfer data in loopback mode
+------------------------------
+
+`XenSwdgn~emul_ns16x50_loopback_data~1`
+
+Description:
+Xen shall route a byte written to the transmit holding register back to the
+receiver buffer register when the loopback bit of the modem control register
+is set.</pre>
    </blockquote>
    <span style="padding: 0px; tab-size: 8; white-space: pre-wrap;"
    class="hljs diff colorediffs language-diff"><span
    class="hljs-addition">test_loopback_data_path()</span></span>
    <blockquote type="cite"
      cite="mid:20261111194800.1070016-24-dmukhin@ford.com">
      <pre wrap="" class="moz-quote-pre">
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Report modem status in loopback mode
+------------------------------------
+
+`XenSwdgn~emul_ns16x50_loopback_modem~1`
+
+Description:
+Xen shall reflect the modem control register outputs into the modem status
+register inputs when the loopback bit of the modem control register is set.</pre>
    </blockquote>
    <span style="padding: 0px; tab-size: 8; white-space: pre-wrap;"
    class="hljs diff colorediffs language-diff"><span
    class="hljs-addition">test_loopback_modem_path()</span></span>
    <blockquote type="cite"
      cite="mid:20261111194800.1070016-24-dmukhin@ford.com">
      <pre wrap="" class="moz-quote-pre">
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Report no pending interrupt
+---------------------------
+
+`XenSwdgn~emul_ns16x50_iir_no_interrupt~1`
+
+Description:
+Xen shall report no pending interrupt in the interrupt identification register
+when no interrupt reason is enabled in the interrupt enable register.</pre>
    </blockquote>
    <span style="padding: 0px; tab-size: 8; white-space: pre-wrap;"
    class="hljs diff colorediffs language-diff"><span
    class="hljs-addition">test_iir_noint()</span></span>
    <blockquote type="cite"
      cite="mid:20261111194800.1070016-24-dmukhin@ford.com">
      <pre wrap="" class="moz-quote-pre">
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Report the transmit holding register empty interrupt reason
+-----------------------------------------------------------
+
+`XenSwdgn~emul_ns16x50_iir_thr~1`
+
+Description:
+Xen shall report the transmit holding register empty interrupt reason in the
+interrupt identification register while that reason is enabled and the
+transmit holding register is empty.</pre>
    </blockquote>
    <span style="padding: 0px; tab-size: 8; white-space: pre-wrap;"
    class="hljs diff colorediffs language-diff"><span
    class="hljs-addition">test_iir_thr_source()</span></span>
    <blockquote type="cite"
      cite="mid:20261111194800.1070016-24-dmukhin@ford.com">
      <pre wrap="" class="moz-quote-pre">
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Report the received data available interrupt reason
+---------------------------------------------------
+
+`XenSwdgn~emul_ns16x50_iir_rda~1`
+
+Description:
+Xen shall report the received data available interrupt reason in the interrupt
+identification register while that reason is enabled and unread data is
+pending in the receiver.</pre>
    </blockquote>
    <span style="padding: 0px; tab-size: 8; white-space: pre-wrap;"
    class="hljs diff colorediffs language-diff"><span
    class="hljs-addition">test_iir_rda_source()</span></span>
    <blockquote type="cite"
      cite="mid:20261111194800.1070016-24-dmukhin@ford.com">
      <pre wrap="" class="moz-quote-pre">
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Report the highest priority interrupt reason
+--------------------------------------------
+
+`XenSwdgn~emul_ns16x50_iir_priority~1`
+
+Description:
+Xen shall report the highest priority pending interrupt reason in the
+interrupt identification register when more than one enabled reason is
+pending.</pre>
    </blockquote>
    <span style="padding: 0px; tab-size: 8; white-space: pre-wrap;"
    class="hljs diff colorediffs language-diff"><span
    class="hljs-addition">test_iir_priority()</span></span>
    <blockquote type="cite"
      cite="mid:20261111194800.1070016-24-dmukhin@ford.com">
      <pre wrap="" class="moz-quote-pre">
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Assumption of Use on the Domain
+===============================
+
+Configure the UART for 8 data bits, no parity and 1 stop bit
+------------------------------------------------------------
+
+`XenSwdgn~emul_ns16x50_dom_configure_8n1~1`
+
+Description:
+The domain shall configure the UART for a character format of 8 data bits, no
+parity and 1 stop bit.
+
+Rationale:
+Xen stores the word length, parity and stop bit fields of the line control
+register but does not act on them. A domain which configures any other
+character format observes the 8n1 behaviour regardless.
+
+Comments:
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Program a non-zero baud rate divisor
+------------------------------------
+
+`XenSwdgn~emul_ns16x50_dom_program_nonzero_divisor~1`
+
+Description:
+The domain shall program a non-zero value into the divisor latch registers
+before transferring data.
+
+Rationale:
+Xen treats a divisor of zero as the serial communication being disabled, and
+discards accesses to the transmit holding register and the receiver buffer
+register while the divisor is zero.
+
+Comments:
+Xen resets the divisor latch registers to a divisor corresponding to 115200
+baud, so a domain which does not program them at all is able to transfer data.
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Clear the divisor latch access bit before transferring data
+-----------------------------------------------------------
+
+`XenSwdgn~emul_ns16x50_dom_clear_dlab~1`
+
+Description:
+The domain shall clear the divisor latch access bit of the line control
+register before accessing the receiver buffer register, the transmit holding
+register or the interrupt enable register.
+
+Rationale:
+The divisor latch registers share their I/O port offsets with the receiver
+buffer register, the transmit holding register and the interrupt enable
+register. Xen discards received characters while the divisor latch access bit
+is set.
+
+Comments:
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Set the out2 bit of the modem control register to receive interrupts
+--------------------------------------------------------------------
+
+`XenSwdgn~emul_ns16x50_dom_set_out2~1`
+
+Description:
+The domain shall set the out2 bit of the modem control register in order to
+receive UART interrupts.
+
+Rationale:
+On a PC compatible UART the out2 output gates the interrupt line, and Xen
+emulates that gating. A domain which leaves out2 clear does not receive UART
+interrupts irrespective of the contents of the interrupt enable register.
+
+Comments:
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Access the UART registers with the supported access widths
+-----------------------------------------------------------
+
+`XenSwdgn~emul_ns16x50_dom_access_width~1`
+
+Description:
+The domain shall access the UART registers with an 8-bit access, other than
+the divisor latch registers which may also be accessed with a naturally
+aligned 16-bit access.
+
+Rationale:
+Xen discards an access which is not naturally aligned, which is wider than
+16 bits, or which is a 16-bit access to a register other than the divisor
+latch registers.
+
+Comments:
+A discarded access does not raise an exception in the domain. A read returns
+an all ones value.
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Do not rely on the reserved bits of the UART registers
+-------------------------------------------------------
+
+`XenSwdgn~emul_ns16x50_dom_reserved_bits~1`
+
+Description:
+The domain shall not rely on the value of the reserved bits of the interrupt
+enable register, the modem control register and the FIFO control register.
+
+Rationale:
+Xen discards the reserved bits on a write, so they read as zero.
+
+Comments:
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
+
+Do not rely on the UART state being preserved across save and restore
+----------------------------------------------------------------------
+
+`XenSwdgn~emul_ns16x50_dom_no_save_restore~1`
+
+Description:
+The domain shall not rely on the state of the UART being preserved across a
+save and restore of the domain.
+
+Rationale:
+Xen does not include the emulated UART state in the domain save image.
+
+Comments:
+
+Covers:
+ - `XenProd~emul_ns16x50~1`
diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
index de19b0cda252..6c1249c9f18c 100644
--- a/docs/fusa/reqs/index.rst
+++ b/docs/fusa/reqs/index.rst
@@ -10,10 +10,12 @@ Requirements documentation
    market-reqs/reqs
    product-reqs/reqs
    product-reqs/arm64/reqs
+   product-reqs/x86/reqs
    product-reqs/version_hypercall
    product-reqs/hypercall
    design-reqs/arm64/generic-timer
    design-reqs/arm64/sbsa-uart
    design-reqs/arm64/hypercall
    design-reqs/arm64/version_hypercall
+   design-reqs/x86/ns16x50
    design-reqs/version_hypercall
diff --git a/docs/fusa/reqs/product-reqs/x86/reqs.rst b/docs/fusa/reqs/product-reqs/x86/reqs.rst
new file mode 100644
index 000000000000..ab517c02471f
--- /dev/null
+++ b/docs/fusa/reqs/product-reqs/x86/reqs.rst
@@ -0,0 +1,24 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Domain Creation And Runtime
+===========================
+
+Emulated UART
+-------------
+
+`XenProd~emul_ns16x50~1`
+
+Description:
+Xen shall provide an NS16550-compatible UART device to the domains.
+
+Rationale:
+
+Comments:
+The device is exposed to a domain as a set of I/O ports at one of the legacy
+PC COM port base addresses.
+
+Covers:
+ - `XenMkt~provide_console_domains~1`
+
+Needs:
+ - XenSwdgn</pre>
    </blockquote>
    <p>LGTM</p>
    <p>Reviewed-by: Ayan Kumar Halder <a class="moz-txt-link-rfc2396E" href="mailto:ayan.kumar.halder@amd.com">&lt;ayan.kumar.halder@amd.com&gt;</a></p>
    <p>- Ayan</p>
    <blockquote type="cite"
      cite="mid:20261111194800.1070016-24-dmukhin@ford.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------npfWuLLajC5P51BCGbJmzwAO--

