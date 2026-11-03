Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEE3606A830
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 10:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=jK89UmgJ
Received: from list by lists.xenproject.org with outflank-mailman.1469405.1678230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOBUh-0006ba-6s; Tue, 03 Nov 2026 10:11:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469405.1678230; Tue, 03 Nov 2026 10:11:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOBUh-0006bT-4K; Tue, 03 Nov 2026 10:11:55 +0000
Received: by outflank-mailman (input) for mailman id 1469405;
 Tue, 03 Nov 2026 10:11:54 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xOBUf-0006b4-Ql
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 10:11:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOBUf-006Fqj-2F
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 11:11:53 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ae9b360-8faa-0a2a0a5109dd-0a2a4502d1c6-34
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 11:11:52 +0100
Received: from [52.101.46.39]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ae9b366-6ca4-0a2a45020019-34652e27ab5a-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 11:11:52 +0100
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6) by IA1PR03MB8192.namprd03.prod.outlook.com
 (2603:10b6:208:59c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 10:11:48 +0000
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902]) by LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902%5]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 10:11:48 +0000
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
 b=AkaCa4aQRHNDdr3r1Dyw+vsd/MVAbUV9ZPUM/Vt2tnQ2DwM5QNO7EhDSqsGne2RjwxnkBpzmJ+ctq03QH85AdiVOpP1HBOHujQW+wgNIQJD5evlzn+UZkRWOfiSnuLGDijMkDxxgIuVnNJbt6Ob9U2c5x3+o1MSxWmNS/L+tPEoxYDmX/nzl1lbyGVLFOIWwZfOUYQ0IMsKcs7jPOdTR4AZJKOZuLrJgh2ILdAy1/x92R4ITDyUBogwf+SGbGrqGflLvslBxGq4OysVw03AAKReDp32tONDZzhCZtRf7gI5L2Qod5KwhyzfFzQUeF1szQEfw8FxQ57z4faENTLudjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=szakcAnkcLXK90/qg+4gQjsVE0kJ0fKqUUTwi6XSYbA=;
 b=OJdzFDk/56sCCBRcmYH5pSKHqGPhnJayI/sFex89DXLmTHz7d4f+LTj0K/5hqn0pW8swM2SVuPTc712vcsZYBT5inOG+yG4L/UUGV5ilqYfl6dysKgiStk0FwHuRQA2fPPMehFbzzvYDVm6AO0zwMCEz3uhJyehj7qM3vACRRMjJHFAuVEPQyhL0AkBTQK+IXHVjSx/BtPrRLn+PJ/ZYTSGxckLoMFogHnrvXzcnHO7vjYivYVDQwwUzeuZGaT1g5Si0/ts4C1dwAxiaHLtDWeN0OWTyDPlu0Xc8n4r55536G9ZWmWTCt3GrYe3jxvt5qVfCyLsjJ55Qk1uzcLavyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=szakcAnkcLXK90/qg+4gQjsVE0kJ0fKqUUTwi6XSYbA=;
 b=jK89UmgJc/g9U1jpNYjUAx50qWCoA/ZT7f7+3PLZAWGQNP0wZlkqhHYbkhUWQ2Q1S4LESMAH276OoBZB8D7/K9Nz0p/B/EX5BtUIxoayHAM1JUegtiVbtLexw99aUd7yyU+fdzSCpha6VdZaKTyYHT+VCvWfZCFK34SgICgAloM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: chunjie.zhu@citrix.com
To: ross.lagerwall@citrix.com
Cc: andrew.cooper3@citrix.com,
	chunjie.zhu@citrix.com,
	jason.andryuk@amd.com,
	jbeulich@suse.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1] x86/nestedsvm: honour L2's EFLAGS.IF when L1 clears V_INTR_MASKING
Date: Tue,  3 Nov 2026 18:11:34 +0800
Message-Id: <20261103101134.236608-1-chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CH8PR03MB8274BC92D24DC22A0E41AA63F06E2@CH8PR03MB8274.namprd03.prod.outlook.com>
References: <CH8PR03MB8274BC92D24DC22A0E41AA63F06E2@CH8PR03MB8274.namprd03.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JN3P275CA0039.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:ca::12)
 To LVXPR03MB989161.namprd03.prod.outlook.com (2603:10b6:408:37e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LVXPR03MB989161:EE_|IA1PR03MB8192:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bddc791-c6f7-4405-999b-08df3992dede
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|11063799006|56012099006|261009223027099003|261022105027099003|261028144727099003|261026121527099003|261026140227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dTZDi8gHS+abiLTbViNiyHJH+lEyYLJz3Wgo7c6Xs06cG7g76rgQtuf0vvTTqPX5v5NOiO1kt6SVvh0YP+8TLfCxd9Xqm70bnO6O+JdMv0izPPOujHMb7nJ7l2H4KF8g+TrIjqD0lcq7HM/8YUKEkls0uteRNOfBDGN16Md0AneRM03h//Wh/0/Qt76o4BAQtPGB+X85pX1qPov/059tZjWk764GMwpK8ayn26XHUCpcoNDyDBwDkLsAFvaS3blfVmYtZLuBBUHCPMmRioOFI0nRTpUU5vuLSaXp4hD2RVw+rE8R0lOuNAxdusV5UZOQHAp5wvR9lFCDmCPLFes60iXhUHgAiZVhGiTlCvb24AGJYN+btxeQrxHBg+JubeorZ3972qj7/C7lsKhVlZXfADMAZH/ptV8NFNdTnF+xzdgLfG1SfUnHzGWUOUORaQrwnqGt0Mx/G9v1QmlUNosXQZZzJwfRrFWq0Wb3QmGfkkeRbMG05vB38FazDtZ1P1Qf/Igz1LzKvxO320VdoR5F8Zyvz5JqAQZ8TsEjHBHYkCDmLOXPC0ccZmGgoU9milg/NSQid7NXOVgR6WwODOxgLobIWOmiKWgZvO23Q9cw7mid0+pmTDM1cyVoOESG1XYt+HnQ5KOFRXizXYDJgXwGIbujLj39+1JOXTyQw43VxgM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVXPR03MB989161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(261028144727099003)(261026121527099003)(261026140227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iR21toiwOa/aTWiYX7dFdzV+si4bzfEULlVVeUUiif7geAkwApw7YwXBmsks?=
 =?us-ascii?Q?6UzKrtym7zQtpgmAMWOWGKuGDCFHhyuF7ocnnmnM8NWJQCYeoVhqFBpm+XKo?=
 =?us-ascii?Q?zA3Z31R0H4fKzovX/Sel/OFa+vsLEcyW2ECNqkv2Tz5g/ssLxJJCI7iuFbzf?=
 =?us-ascii?Q?0KhsJMPJiKxv1iYy2/zWDxRiacaXuImOy4Rymo/PD62ZmbjjAid+1Nmi74Pg?=
 =?us-ascii?Q?2/SLkhykN50WwDXHx2SzexU7EHwgEgikvK9tMKrq+tUI+eiC1xiGjURsvkTS?=
 =?us-ascii?Q?X6pM8zbpZMOkbuTciXv/MR++vBrsudSIr6Oq6dgK1fiMoaKlKxuyKk+x3/SY?=
 =?us-ascii?Q?190BAVU6mH6wpcb5zRlrRdbeQcg7eLoN/lBwJ6Tz5Cs8jCa+yQqs3PRqc6Fu?=
 =?us-ascii?Q?3l/WT3B/2Hy4lK637FJqReKeglR8I1wfT0thefmM3gJxrxaHzQ07JIkKgBuK?=
 =?us-ascii?Q?b1RA6s6WQzuI0CNP6N8NX4TDE8LU5hJF2mKWZ//8OnByptrI0vtCtuVZ0hos?=
 =?us-ascii?Q?fPgmXZlDXVZRgD3Fs0950j+2Vxnpk7yYo9htseKWu90H3SN3pa35JhPD9agy?=
 =?us-ascii?Q?WXNsSEsVSWvk6SuQdol+n44eXAxsAYEYN7yv4F8lyJdGN2RpmCSqE7g7YX2w?=
 =?us-ascii?Q?llUkKrcO6F7pIuoK6SuJDROrf14PUud4SlnlIEeXKejSAfTYDPVAx/gjfnl8?=
 =?us-ascii?Q?MwIyhOK8iCcp4k8z1HaUdJUeJQ3bZslNwPklUxZCg8XF2moLyXMEZjU9nrsl?=
 =?us-ascii?Q?aLLyHPOq00NpcV+Rhf3zo3f0A8VaOpOrR3xlac160KAGht6yEehhIZWZtlgG?=
 =?us-ascii?Q?q/MR0ZT0R2Vq0J5IpKZgtnKoBXmSGkPsOF5IJ6uyJWvWFrc8E2gZsTaOFRHx?=
 =?us-ascii?Q?WhrgcocO5+XQ9vmcYk/silaSjUrMHRmbkz627ESA4LvJwFqtVlWA2A5Ox+bC?=
 =?us-ascii?Q?H3Y1vBkR6GOwV6gbBET2aUdtvz0TaOmmuDRNx5RIifIX1a0ZzXFATryWka4b?=
 =?us-ascii?Q?3U4zxmHLWa4TkdT1VlV+OO3CrzQNPf2K0wlt+oPHx/KMfMgX0ktTxI2HXk0Y?=
 =?us-ascii?Q?q5FhcMm6X8PZVidC9KZ5zJ4rU1DVCv330bJSLRKsfzW1TRfSRMNsadfEQ9SX?=
 =?us-ascii?Q?o+zUyn2VatzJ+aIgtFdu7qXXu18jX55HmBfjXyQE+dTdoADMjuuT80d+cEVL?=
 =?us-ascii?Q?vz1Q/vfS6XiOCD8wvSu1agdarPRAotyhaTxjNZFF1uu+EYljRFj3VkzWHkCd?=
 =?us-ascii?Q?8QlUG2UoXaa2Zt4DgwX66VNfPXesEpshP50jyqae2DzaRRiB7xcFK1zATUtW?=
 =?us-ascii?Q?e5uMggHu5o+WDqFeCd5qRPUm5nlQLdCf1E+zbTu2lvFkHJ5CMbwq6LZVsHzo?=
 =?us-ascii?Q?tTpsRoVWbqXVGuSZs/WR7uaBmJkdPip/CD7gcHHsbuOX8gNVUbQB2+g3bUYT?=
 =?us-ascii?Q?R7zCse4o8xAJSltoll0P9DEpEjiqU/oG85B83DPzZ7GGr/3qLC9KnIYd4k35?=
 =?us-ascii?Q?RZ4fTEZ9DIek80BK0wWlEcicVOji6WQFMyJzke1/PgGs7J5j10l2/2sDF2aN?=
 =?us-ascii?Q?tsiWJJ7Y0b8oum7TuYq/dBctqLIjwjca+yDkebtgict/7E6LpCcIIsU+IgiE?=
 =?us-ascii?Q?TbaGjFhIjh0gZ+Is3cPAau5sDlQEMXPpj88bb0ZVi6EgwXA41ehOl6/gyanV?=
 =?us-ascii?Q?OW9Tr+45eJETC9X1gck+MQOQeq21FkJGjKU/WAgfSWoPFkBJI420TZe1p3/e?=
 =?us-ascii?Q?CvfKyKI3DQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bddc791-c6f7-4405-999b-08df3992dede
X-MS-Exchange-CrossTenant-AuthSource: LVXPR03MB989161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 10:11:48.2176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fO029Kp0utb25bFehcmZDy+tLkRQdjYagZ9KSy5WuEduQXAeCDzFO9GvBWKm+zbgxyU6wCjYATE7BG1i0Ra1OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR03MB8192
X-purgate-ID: tlsNG-720697/1793700712-66CB22AC-4F459119/0/0
X-purgate-type: clean
X-purgate-size: 1243
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 17:20, Ross Lagerwall wrote:
> Would it not make sense to check this in nsvm_intr_blocked() instead?
> There is already a similar (inverse) check there so extending that seems
> more logical to me.

Thanks for the suggestion, but I think there would be a regression.

nsvm_intr_blocked() has no access to the intack. Per the APM (vol.2,
section 15.21), V_INTR_MASKING controls whether the masking of interrupts
(EFLAGS.IF and TPR) is to be virtualized.  That masking only applies to
maskable external interrupts (PIC/LAPIC/vector).  NMI is not masked by
IF/TPR, and #MC is an exception, so neither is affected.

With the check moved into nsvm_intr_blocked(), an NMI/#MC aimed at L1
would be held pending whenever V_INTR_MASKING=0 and L2's IF is clear,
which would be a regression for L1 hypervisors that intercept NMI/#MC.

So I would prefer to keep the check in the hvm_intsrc_pic/lapic/vector
case of nestedsvm_vcpu_interrupt(), where the source is known.  If you
would rather have it in nsvm_intr_blocked(), I can instead pass the
intack down (changing nhvm_interrupt_blocked()) so that the IF check
is applied to non-NMI/MCE sources only.

Let me know which you prefer.

Regards,
Chunjie

