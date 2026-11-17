Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85523606A329
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 14:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=nnSq7SGV
Received: from list by lists.xenproject.org with outflank-mailman.1492619.1693034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTK9N-0006YH-RF; Tue, 17 Nov 2026 14:27:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1492619.1693034; Tue, 17 Nov 2026 14:27:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTK9N-0006YA-Ny; Tue, 17 Nov 2026 14:27:09 +0000
Received: by outflank-mailman (input) for mailman id 1492619;
 Tue, 17 Nov 2026 14:27:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xTK9M-0006Y4-B0
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 14:27:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTK9L-00GcyS-Ng
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 15:27:07 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6afc6433-2eae-0a2a0a5409dd-0a2a450aaa94-14
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 15:27:07 +0100
Received: from [40.93.196.31]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6afc6434-f2d2-0a2a450a0019-285dc41f5eba-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 15:27:01 +0100
Received: from BL1PR13CA0247.namprd13.prod.outlook.com (2603:10b6:208:2ba::12)
 by PH7PR12MB7210.namprd12.prod.outlook.com (2603:10b6:510:205::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Tue, 17 Nov
 2026 14:26:56 +0000
Received: from BN7PEPF000000A0.namprd04.prod.outlook.com
 (2603:10b6:208:2ba:cafe::26) by BL1PR13CA0247.outlook.office365.com
 (2603:10b6:208:2ba::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 17
 Nov 2026 14:26:55 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN7PEPF000000A0.mail.protection.outlook.com (10.167.248.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 14:26:55 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 08:26:49 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 08:26:49 -0600
Received: from [192.168.19.2] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 17 Nov 2026 08:26:48 -0600
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
 b=RF765hUOv62NgKC8ZGNxRPlpbZAmGfEaNR6YgEaEH60NIFNId6h44PPKSCTqZ44163CD7HglxmpK7u5r8dMuFKkjiZe8HteaEH/3dBq7I+MHTR7Wt2U/V4YmwCzKflJDdVxk/hfdR4BzHZ5O4AXfvGMhfxlGyAEWFZoYN/X+qEOT60kR5xvmatEhAkpJS2yS8imbWEp/e7yP3JONUM6lPpAk99nzrlGmEQBnk5v5MiaVqbnnq+Lz0y0nP1pS2x+WCjWYO4W5zjbzLopQ/fKt6x5kLWk+KzLGb0bVUonlBifsZqJQXLvRsgHBYWtGUILuknUA9uObKyWvLThoIPldhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qBeZO9jutPDoxJSJBfsdPmeW2dgW3480L0tWp4LCETs=;
 b=cPCSCSIdhO9GHHE5n9Kg7UnN+KgH1g03HEnpCUnsX/UVj1K79PrK9qIjRFEEAq1h0Xlb18ZKzeUe+uqro+VIKvhAk9NckG9bJXlKiGs6GXD4GpPTRxW7tSrb9DliMtb4gnJX9EQfWkkPHgHu565MkvfzE2iCrfpf+vMB6UHfFWcX10HTWBUNIek/qCp+xbUCYENfTboWTtsYa268uo/JhDshCKSgnDgk0PF31KYVBMvkRyoHsDOdMuW8Javfwg0cU/ap5BvCXI2L0QH4HSy6Su3QZS1kAWP2Z80OyQV0EgmnNryptkqY8XGn4L7SjCNQPZIn7QHLNtsiLyshAWbIHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBeZO9jutPDoxJSJBfsdPmeW2dgW3480L0tWp4LCETs=;
 b=nnSq7SGVFfIQcSNCQKfWl77Tw2uOYa5GXlzzRwEVUEU5e9mbkp7MKt1s425I8+Aj2qPnwibFuEsCMgjzA+ehppQ0KMz24r28EaIhak4kPIzqxOdWMxol0US4d03YMGQT1Iby7NNQ9NFQU3Ei6DH3T3TWHgRn+01CPClyupGsnvY=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <7c2836d0-0241-4ca5-a524-4d1dd2634898@amd.com>
Date: Tue, 17 Nov 2026 09:11:26 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/efi: Handle efi_memmap with Xen relocating itself
To: Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
CC: <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, Teddy Astie
	<teddy.astie@vates.tech>
References: <20261106231818.482564-1-jason.andryuk@amd.com>
 <avHikdwM2wR-GpON@mail-itl> <fbab32d4-fb1d-40da-a83f-05539489b876@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <fbab32d4-fb1d-40da-a83f-05539489b876@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A0:EE_|PH7PR12MB7210:EE_
X-MS-Office365-Filtering-Correlation-Id: f7829eae-0da8-4955-16f6-08df44b6d4ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|7416014|376014|18002099003|22082099003|6133799003|261009223027099003|11063799006|4143699003|56012099006|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261021121427099003|261022075727099003|261022105027099003|261022115727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	bYZPas0xWIZPQmF40rG6DP5fU4+RXbH/NI3yJ7tN3eOCMLePvsQSHLgn8U5jE/ADfz7j075DV1QtjkLqRpGzSj5t/X6cYbs1ngqzdHDE5LMgNutYjv3Ds0MnzUMvAngLZ66+2qCiiSvqzRqAuMKhgES4nFwlovUiMpn2o9P4+2lnIoTsAInUq93VSXj36L7glMr28KpTe8jr39vNMOBR6qDk+K7IYrSUK6cWr0+lWrTVhn74mYw7/wiEMcdCHgdfJzGH34LlrPKQIORGRsZVnXs0JXumjX6DHC9ST5mMkl6sRLAJBkJSZSHcoLz05WU9Qp21NXrQ8VK43ncbTQbx9dFrGrH4yfBIbcOvRNwnVPcoGQRqDx+8QTzL+x/jo4xbXFEVESV6zxKn4C7XT/+Y0KXrzS503/jMmCDqEa7xo+7IbDFhmiWCCa5Gh1ND9FMP/446sew2OxkMcqwnhqNxtFvOHQENde3fzK0qg+0rR1fCT6zUmbLumOiF1xo98nZLpL40qBdhmxkx1hRi1Tx3Uf+h4MMdi+BWYzf5pfTtPi6Hy9YTsAAABs9KmW48eriNwy3mufBpzRObPSdA3ZtyxFjQbq+bKhOSRjPUW2g5fDUNDExpo5tc8EeU6vlbmc0hTMEb3SKG8rETiNV+DG/+9qPmMzu8wdzMM1/R/V28O4qraaSMf1ua3EhlZNTJ4S12Ex8Olt32rvdezCxw25Zu/g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(7416014)(376014)(18002099003)(22082099003)(6133799003)(261009223027099003)(11063799006)(4143699003)(56012099006)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022075727099003)(261022105027099003)(261022115727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cdMXmNsf5/y60mM0V5O6uRleaPwrQRGpYM8TZ4NlOwd5lFC0wPex0dL9OHBsyBHr6rlzGokb6oFxYyiS7gG2874KjIseVAkBHPU1c3WTfH2C/XpV5ShucoYxPshAsBZvAmaGuZDW3RJ4v9tp08SwpKivLDAw1tlwHTaeaNqG1Eak7RHTJR3iolgnme2buMrsfaeyrH0NIUI3uERIOn25P7E+WENOieNOgCb7ALwNOW+xaTPspfrr3RqgVZzp3UgaqxLQdNJ84zeXvUdwLEMadcwItSokDjnGHtLawsKSwJwlmQ/cd/lQUIkqnw4nDyUELx/XOgLlqO6qS5Zgj5kra/5uUHw9EU/U2vCIzPXGNhAcK6mFGc16qESImhHJLwxEXU+R0hcgQVu2ylky+ZHDQ1zS23VRX1rJ5TEjtP4BZ+5XdhUvbvIfeGYT+ZHJ8dTE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 14:26:55.2178
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7829eae-0da8-4955-16f6-08df44b6d4ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7210
X-purgate-ID: tlsNG-4011c0/1794925626-526DECFC-F5F30936/0/0
X-purgate-type: clean
X-purgate-size: 2293
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-17 03:40, Jan Beulich wrote:
> On 09.11.2026 16:11, Marek Marczykowski-Górecki wrote:
>> On Fri, Nov 06, 2026 at 06:18:18PM -0500, Jason Andryuk wrote:
>>> With Xen booting via Multiboot2/GRUB on an EFI platform, and modified to
>>> use MULTIBOOT2_LOAD_PREFERENCE_LOW, Xen relocates itself with
>>> move_xen().
>>>
>>> However a PVH dom0 shows:
>>> kernel: Failed to lookup header 0x77ffd000 in Xen memory map: error -3
>>> kernel: ACPI=0x77ffd000
>>>
>>> ... for all the Xen efi memory map lookups.  Dumping the memory map at
>>> runtime showed it was scrubbed.  Because Xen relocated itself, the
>>> original physical address referenced through a directmap address goes
>>> stale.
>>>
>>> Add efi_arch_mmap_buffer_virt() to convert from the initial value to an
>>> appropriate runtime value.  ARM uses Boot Services AllocatePool(), so it
>>> must continue to use DIRECTMAP_VIRT_START.
>>>
>>> For x86, we use an offset into the loaded Xen binary at the time of the
>>> call and add the to XEN_VIRT_START.  ebmalloc() allocates from the Xen
>>> image memory, so it moves during relocation.  xen_phys_start is set for
>>> xen.efi in efi_exit_boot(), but not for xen.gz, so it cannot be used
>>> Use `lea __image_base__(%rip)` to get the current load address, and use
>>> that to calculate the offset into the Xen image.  That offset is also
>>> valid from XEN_VIRT_START.
>>>
>>> Fixes: c5b9805bc1f7 ("efi: create new early memory allocator")
>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>
>> I did not tested this, but looks correct:
>> Reviewed-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> Subsequent to you supplying this R-b I commented on naming aspects, which
> (after Jason's response) turned into a possible slight functional change
> as well. You're the maintainer, so if you say "commit as-is" I'll do so
> (with just the style issue taken care of), but as this isn't the only
> possible outcome, I'd like to ask for the decision either way to be made
> explicit.

I am okay with Jan's suggestions from the other email.  FWIW, I was 
leaning toward efi_arch_xen_image_to_virt() as the helper name, but was 
looking for feedback on the preferred name before re-posting.

Regards,
Jason

