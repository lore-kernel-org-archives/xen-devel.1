Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C408C54FD2
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 02:38:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1376989.1623330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpGeL-0003sr-8z; Thu, 30 Jul 2026 02:37:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1376989.1623330; Thu, 30 Jul 2026 02:37:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpGeL-0003sk-61; Thu, 30 Jul 2026 02:37:33 +0000
Received: by outflank-mailman (input) for mailman id 1376989;
 Thu, 30 Jul 2026 02:37:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stephen.cheng@citrix.com>) id 1wpGeJ-0003r1-F8
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 02:37:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpGeG-001XeN-Pm
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 04:37:28 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6a6ab8cc-5cb7-0a2a0a5109dd-0a2a4501a2b4-24
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 04:37:28 +0200
Received: from [40.93.196.4]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6a6ab8e7-5984-0a2a45010019-285dc404f6dd-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 04:37:28 +0200
Received: from CO1PR03MB7889.namprd03.prod.outlook.com (2603:10b6:303:275::14)
 by DSVPR03MB886569.namprd03.prod.outlook.com (2603:10b6:8:37b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 02:37:25 +0000
Received: from CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767]) by CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767%5]) with mapi id 15.21.0270.009; Thu, 30 Jul 2026
 02:37:25 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uZMFrnR9JFzVzIgWNVBjtRs8fyUxwZqSENsDvCvjT489vBrGQllXJ+v7cMPEEi74xVfWaEoaexB6Ior2N9iPhBtCxHmIxh1CCxJq9gBcZVOmJiQoZydR1cKUpS0BB/09HJrIKDmab/goXZiNA7bgbDt58JmuMSsTOJx1GQKgUaRTUNnKH9FaLi+gcDMsNBxq5HvrsuymMw93IsZXB7lGg73B+xZ4xHTtaMPd8iWjzD4ci7NOs1KB1CXn6ZoF1urdBdNQNuVZJucgreenHLLB3Y6Ul2w7J4UYeDI2ZPT2EO8zlsjDdeB6nG5D5gMQc/sHlAueMLAb9yXUAxtTqpRVSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJgCWAtxLESc93+q4IZg34kflkg07FIREavXKChpPb8=;
 b=TKkXMlE/YKomgs6AhgeTuSNYYCC/dVvwARlJ91qujSgqHahmPQU+NE1/sNnl2HbGJrcF+yA8+vbnQwut2ZXI04zNPbP1Dcl9OIHxorHxPwzzMcw/OjZeet2DTHu4X5tXoNM+DDFxQl6CADHPNSvp5xwZoMt60rj47DSm+Zc6PJ0U/VvMVNeVkHGWJdmVwYhK4HDEOhnV9V5WC7RNTCG9vIyIcoFvMnW6jnAPSE5vL1fpY/ch1kLxpZIZSiOUxoKOh5f/eVp1ZZqUIqLsQyjmhcP37yYsl1E07L6RJnXDIcuLe+lAC2DxCWdlvzEM4bA05MHC2ykvSWE1bYpp4Yiq8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJgCWAtxLESc93+q4IZg34kflkg07FIREavXKChpPb8=;
 b=xuUrKah4nY+LpRDM5IQwr9DPiFg4AZNIUb51kaH2jE4yF+FuZQ8zHAbeqWVLhyiiEgSgYYL+b3PZcnkKjILOErc48JFRPhSEuql3PytKuh+4yQoV7YlQf/TdyBi61Sx4s+q5DOvvhtQ+w4jqPwrqB1f2RpoVLPQxho6CYCHBXdY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Stephen Cheng <stephen.cheng@citrix.com>
To: jbeulich@suse.com
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jason.andryuk@amd.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger@xenproject.org,
	ross.lagerwall@citrix.com,
	sstabellini@kernel.org,
	stephen.cheng@citrix.com,
	teddy.astie@vates.tech,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/svm: require VMSAVEvirt for nested virt
Date: Thu, 30 Jul 2026 10:37:15 +0800
Message-ID: <20260730023715.68531-1-stephen.cheng@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <874be4f5-b7fc-4114-959e-1b31ed4e7608@suse.com>
References: <874be4f5-b7fc-4114-959e-1b31ed4e7608@suse.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KL1PR01CA0156.apcprd01.prod.exchangelabs.com
 (2603:1096:820:149::13) To CO1PR03MB7889.namprd03.prod.outlook.com
 (2603:10b6:303:275::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB7889:EE_|DSVPR03MB886569:EE_
X-MS-Office365-Filtering-Correlation-Id: 53ccaefc-c47e-4fd9-08b7-08deede37d84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|6133799003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	maM2h07suG8F01D84V0OKNhWfaBwos4xmYOLbcio1zyiZCvSQUI6LiIRfnaOsACsreQvJs2Nem6nY6MDX6k80sJv5B+LVpEdiL/STBd66DjJjB1hxH+/KQLceRbUS7hjf7/f0DRQu+kVfzijGcMNEh8R2Qz90amM8o6yxTUlEWUECbmmyyCyLINYCyWJrA6BBIwHgaNuW6DGCQU94gI0NbKFsPrGm9uHBSnH2sol0Wi+jn/NVPrl6svdRxjie20QQgxHRewAh2eTg/O7FCOpyFHKBkyWrrcuquCOvKPJKJSie3ju3INY00muPdFTcdDrO83OYyZ0OQelIY1Yrbw9Qiy4/5XqIa0aKs5w85px+47uQbOcLRuBATaQkhj+Ljqs3ahElrpw2+IH9wHhHEb4RSZFcrEFKT9m7txt3iODcomZLQ8gS2/X73GZ0g7EFLK3OEtVoVBdicdLKrzendQA7RbdqN5xQ5yqZfye2CvKGYNHJKfTL3jwEkxeTtcJAZ+f/o5iv0jGc8BPpgRTKKkwpFlohBQHtZ0H44ZowD+zDn97APQ2uOBAi93TcmcQbmOpTQf4uxkg+rVnvuRfeyEa2Lj+5foYzsqbXNN+Hsp7ysljsXskB+pD7YQzMlrpSUVmLZSEZQFw6XU83ScVfreWdzP1Bq48O4zeFZFe/aHzElw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB7889.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VBpu+JAHFXcGJs0gBqs1aG4755Iwd/2a/DgysQS9/iCFhPulJnGxYtrLOa+q?=
 =?us-ascii?Q?ZAitqkYbIVyNvFOPiafXD/CAp/HXEaTPREPyVj0EM5slWgwE8T6ENX+8mBmR?=
 =?us-ascii?Q?NSwDfT/3lJP53941bySzBvHHWFiS+pB9k+pXR1DT6VbQN3EZfFw/qjuA9Zl8?=
 =?us-ascii?Q?dmkPLXlQd7uj4znBQK9kW+BO/f4x5t55fMT700mT/JTlLu1YGr9/TGjcZEvo?=
 =?us-ascii?Q?LvATA3t7zkBDP8Kx0cpMGoQfkGarMgyNCem+D93HHTImoNFccwE5o3fiKwXP?=
 =?us-ascii?Q?PilUsyhIxqUxhlGwvFhw1COA8BWzJgjeKGrY6WXG4B4rUtxLjNUCx0ker/iH?=
 =?us-ascii?Q?DBkwOH93qvNF7MD+Tk/JPyMbvYHGmiwZiijBOczmrQqurBSVdo92O1uqmXb7?=
 =?us-ascii?Q?bnK3TLZmkFQJzaAGwxvTqimKM/iqw1TXxKYqIqHM2/VrBL+eKM1RJwJWnHQR?=
 =?us-ascii?Q?fdyP7FQ3x7I14DhNfiufaYfebOcaB51fQOsHSBVvmEZLcSjuPNn4cSDiowPR?=
 =?us-ascii?Q?HsQG+XFAoz5zm032saTp4LMlodkYtY1+0TCr093DcZTVpWxjQGTaFd6lcVAv?=
 =?us-ascii?Q?3Ar6RmLVurEEqFSrRyoEmL3e0SxHhNFI1fZrKYT5Qr4S7+jF1/beCLyOfd4N?=
 =?us-ascii?Q?3Gr12AE/zoLliPfEYhxq9k+k+YmUwajDoTflHUd2Ew8qKH9DUOpw5KhC9DWM?=
 =?us-ascii?Q?IuXMLQ/hA3qGwuFq3WBq9+1mN7wDO/2Z81oqMA/SINyiHq1/wX0pOmpK1st+?=
 =?us-ascii?Q?2GczB0UXylMBjBSgMZaI+fG7GbYbQaZhWFZ2WeL0qkfTGypF0Z1iq6LOOgYZ?=
 =?us-ascii?Q?tz5l+PLSzLBingQlNEQKW9ahkW9O0dKsqA5pNMHl8zdES4LBjknOs8yHbC8F?=
 =?us-ascii?Q?Vy0Vj7mWs0/Twn2hBwngfuIhiR7lkJYMZPtR/o5SJDiuU1pheytCsY1m0qdv?=
 =?us-ascii?Q?HHPr3tQqEhujUrpeN2d0Ukci2cwdpqA8T7DxVMlTKEC83sIJkGBpTw5G57lE?=
 =?us-ascii?Q?GbO3B4jmFonbpvu4NuvpUoyfMfXCu8h0uU3+tBG3lEEpyi5D0DRlihGyuTTJ?=
 =?us-ascii?Q?u1M+/5OLMpY96s6seZ+d1q7K2gE4zUlLtEa5ar6I411JNexNlqN0Imbj2mkL?=
 =?us-ascii?Q?qc8uLLCdFkuprE30k/3H7Sx3IJJIUuAgt56FlVWTWPuEaNlrf3SnIAFBbxob?=
 =?us-ascii?Q?TeBHG0OuhaTZL7RmGZDmWUyBAAdFNP99fV6W0o7P7JQdz7KJdlFDqmyS+uNW?=
 =?us-ascii?Q?a8Dn3AVD5jUlgblyc2f/OPd/wCXs7zDWDOtLygP2o4yBRbpdK2AYEVOUFDWV?=
 =?us-ascii?Q?fJjjjuZYOV0FiqpFGc5nS3baVKmkznGp8bmzGYyk6zOwtofuSw+1fsKG06ax?=
 =?us-ascii?Q?jKGbnIJI9XXYErn4WWkXpH3caxVNnCmdic6eROarvlhJkx7gOobwVIOstIVQ?=
 =?us-ascii?Q?wTugNBp7pc4vopR15x5nnJZgbjqnqLO9998e3SK4c4lXVa6X4y5WuLyzpfA4?=
 =?us-ascii?Q?JyijLY0ECyPuHmZN48e+L+F+O3ZOXk2wytrM3rSQ7Vr3h5hH70xH4iGZH+xp?=
 =?us-ascii?Q?q9iubj61x6g6dyobQbP66XdoAuXU9VWXmAiNpqfUC3Kawk3uifpPcLp3HH2s?=
 =?us-ascii?Q?cIs2fUeYd2EFiW0rWAqy6s25rfEpFnTREaXXZnYo1IrnIRNP8d3ILTra9kZ8?=
 =?us-ascii?Q?qraIuDnkV4IunD9Wa+7j9TYykZnUn74+Dz3eKw9+PZALBQDIVrNZXb9gFayz?=
 =?us-ascii?Q?RvRy9HexSw=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53ccaefc-c47e-4fd9-08b7-08deede37d84
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB7889.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 02:37:25.4101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B9d+VgRBbQ7jOUyDfdM9wRF/T165CcYbrKTawr0p9iti/sxh/JdUWU2QWVHFcUHsEvl0Pr0uh+fUn1Bq8BSGumZqJsbZ4iGjjnPW3ht0a9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR03MB886569
X-purgate-ID: tlsNG-d62444/1785379048-1F46D757-5198BE5A/0/0
X-purgate-type: clean
X-purgate-size: 1052

On 28/07/2026 10:03, Jan Beulich wrote:
> But the functions you drop aren't needed just for older parts. They're also
> going to be needed when the insn emulator hits these insns. This still is
> in need of properly wiring up, but imo we better wouldn't delete code which
> is going to be needed later on.

Fair enough.  I've talked this over with Andrew and he makes the same
point -- the emulator needs VMLOAD/VMSAVE wired up for reasons that go
beyond older parts.  I'll drop the removal.

Worth noting for the record that the handlers become unreachable in
practice, since svm_nested_features_on_efer_update() clears the
VMLOAD/VMSAVE intercepts whenever the guest sets EFER.SVME.  They sit
dormant until the emulator work picks them up.  Keeping them or
removing them makes no behavioural difference.

Ross -- this reverses your suggestion to fold VMEXIT_VMLOAD and
VMEXIT_VMSAVE into the VMEXIT_RDPRU #UD group, as that only works if
the handlers go away.

I'll submit a v2 patch soon.
Thanks all for the review.

Stephen

