Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDAF606A326
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 10:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=uzfCYClr
Received: from list by lists.xenproject.org with outflank-mailman.1501988.1697978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWAUY-0004yK-2v; Wed, 25 Nov 2026 10:44:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501988.1697978; Wed, 25 Nov 2026 10:44:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWAUX-0004yD-WD; Wed, 25 Nov 2026 10:44:46 +0000
Received: by outflank-mailman (input) for mailman id 1501988;
 Wed, 25 Nov 2026 10:44:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWAUW-0004xq-Gu
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 10:44:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWAUV-00B9YE-N8
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 11:44:43 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6b06bc15-2eae-0a2a0a5409dd-0a2a4504da50-14
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 11:44:43 +0100
Received: from [52.101.43.13]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6b06bc19-b57f-0a2a45040019-34652b0d88d2-4
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 11:44:43 +0100
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6) by SN7PR03MB7207.namprd03.prod.outlook.com
 (2603:10b6:806:2e4::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.15; Wed, 25 Nov
 2026 10:44:35 +0000
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902]) by LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902%6]) with mapi id 15.21.0639.011; Wed, 25 Nov 2026
 10:44:35 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RELjgerSw65iaL3ueT6bF7TD4QnCGAk1NzGUnz0zu7ncKYftAJSrKfFl10F8TAa2izDhb7GcKH3a9Qzr2W43Xvnc6BOUsI4V1Lv2H8C0nbyLsoZwgm1HCm+nDn4f5gBm0MZv+O+BAffMoMJ3GK8U4/p2P6dkJvytkiR0hoZfdd73TONjA/St1DkPRsMnm01rNIlVBbbB16fUERrPFnEt0xSO0cHrxdIrmWZG6hUOtbSBji5G1pP+kgaCMMlBENDaDT5YrUs4JzMCkAF6JY3A7IxxwxijKMR90Z/w98Y+wOdWvbKd2fH3XQjo0yGSw/PTPXsVSqgHNuHCf/FflETCWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7EWQdNjzaGNAtA9/lTQrSjYKVYbpyz4DYyFxpln3lCY=;
 b=kZrq85CZWe7yaznWU7+3b/mrGjdhJy1qHHZSD5rH6oulRtPprd0d5vR2tS/fWPSg5I8DlXMmrKOuqL+m31Z34u5aoW03TJvtxzXgTfllNsieUwYXvFGo7MSMJms7w0MZ3ajoRIolyvBi1J0wK6/zp6yZc5kO9bdCCX0tW0go9/jaRt1kF+CazSP1kvjL82GH9rpxEALaZG5rzqN+G0Qe2GFUVwqNjWwEFI2sMe4XihnaD44zHLjbnNILh0Oug6mnNAyLbzW6uDk04GPGpUALhcOSEhiMId1QLFNwqadlt+T9utYeIxYMMYjpizoNlSdvpx3aKhqzZ+nHBkTrEPMaRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7EWQdNjzaGNAtA9/lTQrSjYKVYbpyz4DYyFxpln3lCY=;
 b=uzfCYClrN1c/lK9Ab9kx93XfEA7w382lcfZlNnWw9wicvMq+y05GOHn4RfMRhTMmVVRH66i9i5J8ys402so4FfxWBZ4vV8FAyLCSd3rYUT05/qcXhS93olsBbZvXzS3eRB/uf17tDiAN+fE/0fl5R9kWd7QwS+hstzAR8qjTI1A=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: chunjie.zhu@citrix.com
To: jbeulich@suse.com
Cc: andrew.cooper3@citrix.com,
	chunjie.zhu@citrix.com,
	jason.andryuk@amd.com,
	roger@xenproject.org,
	ross.lagerwall@citrix.com,
	teddy.astie@vates.tech,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 3/3] x86/hvm: don't let EFLAGS.IF block #MC in hvm_interrupt_blocked
Date: Wed, 25 Nov 2026 18:44:18 +0800
Message-Id: <20261125104418.1065225-1-chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <4d445414-07bf-4743-a358-cca5fd6ac913@suse.com>
References: <4d445414-07bf-4743-a358-cca5fd6ac913@suse.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JN3P275CA0135.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:d0::13)
 To LVXPR03MB989161.namprd03.prod.outlook.com (2603:10b6:408:37e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LVXPR03MB989161:EE_|SN7PR03MB7207:EE_
X-MS-Office365-Filtering-Correlation-Id: f738915c-4c29-4adb-eece-08df4ae118a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	BoVZnZ5/qOz1ZTDYJ7+wTgEwS/BDTZV2JsW8mKnwPhHy5Z202Rsmf9Wcp6zvMLXjlXoplHuMcxczWW58e5GSBmON5TmsK+1W7cjazfT0cm56ofcw0BB92QaDCa8ae7XwVqYVxy5VjUHwpRWbpyXdJdFHmxTfyGLDiScy5jMC+iXvAfusfLDjBk3hQBXI1J9bt07GIJvVsYXsYXrX0fxy2b3ZXYtWIF1PcywpohA0jiELp88yY4cxzq1nr9Np1blCCvnwpu8Kb1iNqVK2O7oHHXnuKN0HVvVVEtW0HXeqoneLo3jjNGTLHz3ovSgCNcYaCL4TC+kYJvol/929neeW66PkPaRPi3l6rK6sePEReDD2gfzqau48EMBQqOZQmusAHnEc+omJCiBRCh/41umXroKZWIjMW1uvwc5uAla8a5uwUF7skAr4VJaDFUelEb2t3PRK5dEPSve2gjZ//2rb+U4pkmTG+Iujhjx4cPvbZlt3I+si05439oTNiVXWPFkiHm1xcBy5OuAnyO15OnlX5D2TsZpPbW5xNuSPpSvCK4LueLn0IREWo2jvXP1kDYoqjkZVfOCQRGqzYUW0BMtSDNlDkv3lLs/MOylSUik1p7DiVjDOR1+erzUz7HgDmlPdG3ZtPF1Tp1gFqfpHxUIuaeOAuLyDcS3/tE//gwzljrM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVXPR03MB989161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yau0ExdarEq4zcezayvJUZQ+XxxhyY3H1yOrlv8sgteQj/JOQBulgmpPjO16?=
 =?us-ascii?Q?8xc7vetf66ktKZzNuNO0OfzvrJG+hkFyZA+dpRdhi3vRf3o+5JYkcwytKeXD?=
 =?us-ascii?Q?Ky6KUig/PArkdcQllKpaejNmzL10rYpzChylmCGmzkNFi0eFmqhI9zd0AV5m?=
 =?us-ascii?Q?1jyPphc7XyIUpDNn2Cb/hNcvyVvUeL/n/o3Z/BbBHK39gScPhk+VsoW/7q/v?=
 =?us-ascii?Q?Eb5CFhxUPR2revPzkV9OgHk9KCqvVTreACd22fcwbZCuITQ/qCwUc51mreYL?=
 =?us-ascii?Q?nZCFBII5Ex6tPrgiw/QmQpLR4J/2k13HZxK87Pixom7R5UGDcTXg8y7SXSm5?=
 =?us-ascii?Q?2hPwn8t++Ft7xE5/GpxEuxSdc4UE5EVlXVCZnFhwFPdrCcIsn9KOBzb733PX?=
 =?us-ascii?Q?gWIDf0JKVH3zxd5BaOe6hcOP9sFzLrCRjQWopgtw2n7K9ZgCArmGGpIZc4Ee?=
 =?us-ascii?Q?iy9c4ZUcQyZPN0mL+kh7ZCQANcs9bOM87Fh62sCFdU55h1Q+e7tq/JiXtmWH?=
 =?us-ascii?Q?tBGSyAfsMEg6hLZ15gQXU8+YrirPSRF99x/LZodErFXZTE+617RJ89aHwGw/?=
 =?us-ascii?Q?eNrP56I4wmYnysi4X8C/Gh3qE0HoCMFi3M7tyKwIRNwykGEQPEcoy3AgbH+A?=
 =?us-ascii?Q?JjjUczF27k3nd0cyyhk3mzD2AilYR6XLeb1l2pHpfgqzQbM8zUoc19oB/ymK?=
 =?us-ascii?Q?TrgU9+XnVgWYQSlgOrTiwPvBMI01WWe5zItZMhCh9FP50Cr81eI2zqVU79Eu?=
 =?us-ascii?Q?wwcjrauiXpN+kBePAroMBUyMheUieAivg14QDSy9n+55ZFTFKiGYvKBj95DM?=
 =?us-ascii?Q?sykxU104x9BqhcEQ1cFG9uifCJySqUMBXFkTitABxposxjU7oZM6NOS0NXS2?=
 =?us-ascii?Q?3NOFB+f9s+CAfPrZmVJ/OHvRkK5jKlXpO+CGtzjSTQguIq8dfMJj0wM3eRDD?=
 =?us-ascii?Q?6lAEoj1zL5JgvPBVA0pg6iIPFluDT9aL9LayylvcKIv8qQJ0Ix83EUwi6Ym5?=
 =?us-ascii?Q?Dvopg+Cvc7xBL3SZwm3ZrRiCpdiuszWiKWk9d/oXeLqZLDrvumbKCZo4NriQ?=
 =?us-ascii?Q?ptg+3ikqZfJyMZXqNNSXc+/D8RYQBqY/8EOUjHmxoEiTS+q3hhNVSSuAaz14?=
 =?us-ascii?Q?kQe281HwaeFTyOGlYO/1JwOR0SwU5b5Gf0hkvK1lEw/43NxfFtkoUr7eryVT?=
 =?us-ascii?Q?GBXxGI4hbScPQ1wNrDtPwk53u/dUHECRysDx+fHHcAOQjXhixOL6N2+KcYAs?=
 =?us-ascii?Q?f1xSP1qqyhgcR9a8eRANmMIDpsdc4PeO0D3n6/KpOZgULwYZOnnzAymA5IF3?=
 =?us-ascii?Q?9QE7Yv2driX5erEFo0ip1KyUJRXu6jceiUPNqjwXHJ4e8un9DskNd/BHM3l+?=
 =?us-ascii?Q?Xaz3tJEBmbaNsDb5dc27WUCFqc+w79HgGk8dyghg7Uxu3k3Z6/efFII6zrae?=
 =?us-ascii?Q?jT5qUhtKPGhCvAPUhcmxT+6j4YDVYi2rn8jpWuleMBNVtHX6edjmf2wBIjsB?=
 =?us-ascii?Q?cQPRb0wMbBc+wCi2sUSXDzE2dK6j240bUngZQSwjZcLfkIn9WyN/hVfgsbId?=
 =?us-ascii?Q?cCcskGGGiAdNHZoJQExq3A6Rcq6k+GTcNBxLX4TdYLvebJroBbtNCOC/uvIz?=
 =?us-ascii?Q?nP1Cy6qQyVmCvIZwfs4xrGwUbMNwI2bR/v9N8Hzn9Krll4vCKzYeOEL3cZEK?=
 =?us-ascii?Q?2OYDNf0bnYYBv4kMDIwNh/Q8JEPY0hAqgsWMxKmqcOjh6dVR9b5Qq/b5/YQB?=
 =?us-ascii?Q?WMHNYGLpTw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f738915c-4c29-4adb-eece-08df4ae118a9
X-MS-Exchange-CrossTenant-AuthSource: LVXPR03MB989161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 10:44:35.5358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kM4mjKxeYhwxMmECZrQ1DgwelFbPDMfWCp5rTqHq9l4bnAE0xYVc45BUiDhkqVw7yQLE95YqSJRB9uCmSpyqHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7207
X-purgate-ID: tlsNG-ebf023/1795603483-C0EDEB50-D4CF66EF/10/78276251493
X-purgate-type: spam
X-purgate-size: 298
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12.11.2026 15:15, Jan Beulich wrote:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks for the review and for committing this, Jan.

Sorry for the slow reply. I've been working on fixing a number of
Hyper-V-on-Xen (nested virt) bugs, and there will be a larger series
coming later.

