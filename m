Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAED606A9DD
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 16:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=CiPhKsV3
Received: from list by lists.xenproject.org with outflank-mailman.1482124.1686008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQpBB-0006hT-Eo; Tue, 10 Nov 2026 16:58:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1482124.1686008; Tue, 10 Nov 2026 16:58:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQpBB-0006hM-C8; Tue, 10 Nov 2026 16:58:41 +0000
Received: by outflank-mailman (input) for mailman id 1482124;
 Tue, 10 Nov 2026 16:58:40 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1xQpBA-0006h8-3m
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 16:58:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQpB9-00Bubn-ES
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 17:58:39 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6af34d3b-e002-0a2a0a5209dd-0a2a450bb8c8-10
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 17:58:39 +0100
Received: from [40.107.209.71]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6af34d3d-b7e8-0a2a450b0019-286bd1472fb3-4
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 17:58:38 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by DM6PR03MB5129.namprd03.prod.outlook.com (2603:10b6:5:1eb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 16:58:35 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 16:58:35 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bePqdPtEKrKdAHRqV28m97c/DVQfMDItZQLZs+obOFr5P4+TSzOk9t3vlqzebUrLD0xAHC2h4S2BQbDMKDeDjG0iqKimM34Zm4O4/d1dCkicYCJy6dbmyrixBvTz8shzwMF/TAh07hqWvb+h/tSmuNJrCQDnjZJr9wrNAH9Ku6c/X0SjMICv9pDLDYCc9pjxB8r/s5yYgJi86QpU8k4ntW7uq70Q+01VPZgvjHdHGrFM/Cfe5gHc92FwR55MWvoat8OqwRZANF+RnGJK7sGrkqRHz3lfgV+MrfFd8k4WCJY2u45K6hlTc1ahtEwwBJ88Ud4fxZ+WT+KqarSgp5AmuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HIeruXVZQXmL9ujp29neYNtHoGCHYlhDoZrhdR9BtWU=;
 b=X2fTNqFWlJk7GJ10Zfgb3eGSOpDMNwlUmvLhIosAq4Y9wl2f56ci6pjTcSKF2O7BxTEix032cKAg+lUxpJoMgiDBZVsjU3DrgWQs+Z6xmRkUDXUCYUWK8EryRPvUAOEGyrLKyBOxvIyhineRkhSJCPmEBNs6rjiRJVxBBIhVYsE6AUydx6nkWPSE0Km+Xnr4romFOHtWpuTBmv8VYfBlolPoYWj8ezuquAqpvHD74XPkwxrEBoVvN1AXAfFZy1xWiQSCSQur5V9s2/G31TpIYvEjcIzv7vi5Lro4zMeRukgOlcf/zITS9ECNsTChkbEqRDertsmNUoDbg51PCnlKIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIeruXVZQXmL9ujp29neYNtHoGCHYlhDoZrhdR9BtWU=;
 b=CiPhKsV314T4G033QTg+DOMsxmSDva7YgopaDkJ7POFIuSGltJE3XK27TpuXT+ENsGyXrC5aM453jJ7KWo1qW23hmVKT10VyLTMvwYTpLRQ8dypiHsZi73XNFnewSl9ITEJjXu1UbZuGVV2TLIOyNnUC4SwTjZZTRRWSMjQCzto=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d344497b-485d-4ba1-9f2c-6223888a7d0a@citrix.com>
Date: Tue, 10 Nov 2026 16:58:30 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] x86/hvm: don't let EFLAGS.IF block NMI/#MC due to
 nested state
To: chunjie.zhu@citrix.com
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
 roger@xenproject.org, teddy.astie@vates.tech, xen-devel@lists.xenproject.org
References: <20261016100058.268266-1-chunjie.zhu@citrix.com>
 <20261110085721.419366-2-chunjie.zhu@citrix.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <20261110085721.419366-2-chunjie.zhu@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P302CA0015.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::11) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|DM6PR03MB5129:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ef83d84-8ecf-40fa-366e-08df3f4bdbb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|261009223027099003|10067099003|3023799007|261022105027099003|261026140227099003|261026121527099003|261021123027099003|261028144727099003|261021121427099003|261102123227099003|11063799006|5023799004|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tiA+SQ2fBoB6gavKVfQypyroy+yh76uk9aiiSL9JZjjeMeDYO3nUgMNt8Y1PQoJ9YYimnV6x1P7GQYBM7wv8Q40OfMDxtKmW7hkSu34N+CvDBBwoEhfa1Xfeoj9k8PZ5VBFqJRwpcX19ULN/mXLHwKZd6PWjXfktwIxn/3mgfVn3hGRbwHpwaZg2otGVT6h8fz5/6nyow7/BRIrP3F3n9fW09XWKixT/DyUkrgRLhr+fwr6d8XgPMohGx/balmxNty7A2elHFAItVRp/3YFp9O4iH+lalBmHzELOWrTqJFbIk29gxlGvvS7i6Fg+KvX2I8/v6zNYG7YvSxJ6JwcbOwz6qy4CyxpjIBMJPTSCP5cBvrq4rz8syNS/TNIvnuffdRbLUjFcQ2BUOyZaMvScnba5SR5EWBJpk6m8GN71vNT0HS3btYajj4TRfcGvrSiLdlcUDBmg85WHGm/WeBgeozKHNSPkbWZo8rT+dxUubROH/XMxAPoy2OvhBVZO9nOA60rOJIc+klj3g1OH6xh17JDTtzcDUmC6ZVDef3QLRovfdlm9ltvOP812hZJLPWS2igSh5APqeFr/nPZ6kt0TXDBYyT23cpeaM7PsUPyDBXxOXkWkhSddFJJ5vCyDZAd9E+h1TkGz7LLQhohHv/ov9Wh/uJ7XqK2lq6lFGwUWn0o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(261009223027099003)(10067099003)(3023799007)(261022105027099003)(261026140227099003)(261026121527099003)(261021123027099003)(261028144727099003)(261021121427099003)(261102123227099003)(11063799006)(5023799004)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzRDM09YZjJTZkRxeHN0bUlxZzdZNnlNMzFhQTdLV21TQ3VxaTZ4VklHZGtm?=
 =?utf-8?B?dktXM1BFUHVlRFhMVWJKY3J1Znh3Y3BJUzkrRVNSTDMyaVZCd09YdWcrYUpv?=
 =?utf-8?B?RVpYRVhWTG1LTnhzcXhLM2FkN1R2MGt4eGhqOURTRDdaN1BpYUxqc0dVekx3?=
 =?utf-8?B?V0xaemUveUVJdWNPNGpBcTlOY0MvMGMvVGlqbXIwREVxL0p0S3ArN1U3c0xX?=
 =?utf-8?B?T05jdW5pZGdldjNLZmJ4cFhJYkw2VDg3ZFQ2c21LVmo1ZjB4MEVXSG95L0dM?=
 =?utf-8?B?Wmdmc1BGcXdLUWhnQVJ4cWhoL1pGc2dBQU5TYUVtbE4rVmluRXgyMEFIb1R6?=
 =?utf-8?B?ZDNBOFRtNFBqZmF0VjU5Nm84c2pOWlNTTldtUVFEQUNHakxmWjJnT0JueGdw?=
 =?utf-8?B?bllWZlN1dTYzaWNkajZTUGlBSVlIUWRUVVFpbVVhNHdJQ0RlOWtVcnI5Z0ZQ?=
 =?utf-8?B?U2V6ekc0K1pscmdDK2FXTkhFTXNIUEVCeTg0R1E3YVRyRVhueE9xN211MzM1?=
 =?utf-8?B?N2N6c3FjTURVaFd1MHNxUjYvQ2hFeFU3WnBFVWgydFNKSExGbWJSZ0JWcVlP?=
 =?utf-8?B?dEpwZFM2S0ZQTGdnb1ZoSFNrVUovbE5zbWc3cHdxYVUvLzJxVHBBNGVLSFV2?=
 =?utf-8?B?T21XWCtRY2RNQ0pFZU5MQU9IMFU4SmFJa3dZQmloR0RWclJYL2JlQWw2a051?=
 =?utf-8?B?bFhmWS9CK090QkRrRlV2ejdJOVpJTmNWR1MzaXJKcXB4eWZ2UXpNdU81RThC?=
 =?utf-8?B?ZzJyaXZ6eHYyRGYxSEJVZ3Rja1NRdVhoSnJBWjk4VmtZK0VKWWhITGdGVFBZ?=
 =?utf-8?B?MENzbG5Ob2E4WlEycjFvYmc5OE80c0R4WVpmSjBnWHVuTjFXcGRUMFlHVkpP?=
 =?utf-8?B?RTVzRU9SaXBZbXpDTTdqdUE2aTMwWFc1Q2RJUWVpbXRHeU4xRWhucW1rRTkw?=
 =?utf-8?B?bTZjNml6R2pXNWpIOTJKbDhYNTlnUzNWcW8yaEJWVG1VbnJIaGN4bFhWUXBq?=
 =?utf-8?B?WFlaVG5ob3QzOS8zQzJYYUJSMDd6OXZpMjVmTEpMdW5SY01PZTl6eVluSHpv?=
 =?utf-8?B?a2NrVkdHQ0RrSWRJa0pKSk0vTnlHOCt4MEFuYTAwb00zV2ZVR2NEUW5ZbTZt?=
 =?utf-8?B?dTVtNDZzTXpIbFVYRkRkQXJZeFRPYVQvRng0Y1d0aVBlYlpLQ1A5eGpUODB4?=
 =?utf-8?B?OCtMVVdVRTdWd2FuZm1iNHFGMTlPQU9yWWtCbnd1Y1RXRkxad3lzcWx6YjZp?=
 =?utf-8?B?MTk4MmNUMVNSdWFnU1J5OCswaFRDRzlZVlJkUmczK1BEaW9NWHNieUNMU2Zw?=
 =?utf-8?B?TlRrWnlUWWRzcGNQVXU5U3IrY0VTcExrNDNIaGVDanBrS2pWQ0V1c094SU1G?=
 =?utf-8?B?TnNPTUQxUkljc3MzWFhKcUZLU0xTLysrTWNMRkwxNVYwbjJmMnJFK2J1MU9L?=
 =?utf-8?B?S292MHU5U3UzOVkvY2V5aWt3bzFSRTk2SjVZamYvQlZ6dml0dnFuMDIrSkV0?=
 =?utf-8?B?ZzZDMkFiWUdsdHVlN2Jpc2JqZ2dIMHloWnQ0ZUQwUzk3SjdGQzJ1V0FJWUVV?=
 =?utf-8?B?cWdqalk2WmZFaVNRTVlsVGZXY2s2WHREN1RvTjcrQ0NXRi9kb1FpOWF2U3Vt?=
 =?utf-8?B?UE5TWFhtbFp3cHc1Z3VkMlltZUcwWGhCOEMyUTNHcU9PQkpKdnhvY05CWTFq?=
 =?utf-8?B?c05laU1nRUszL3FPQ0NMbk5YbEhwRG1aRTlHUUpMU1BRa0dUTk9IY1lnVnBF?=
 =?utf-8?B?MGorTGRBWDlUdU5JeHNmNmVCVDdOS29ucURPenBrdkthOHJUVVlXNkM4TGdO?=
 =?utf-8?B?bk1kaXNHU1pZdWUzeHhZYjAyd2xEQ2lTc2lwazRIYUV3ZVdPOUdIWTk1TE9x?=
 =?utf-8?B?RWZPM3czVDNxRmZpeTNhWVN1bDd0SExtODhkb2xac3FpMVd0eW5hN241UFRS?=
 =?utf-8?B?a3A3UW5zL3lKaWFNTm5GSGQ3aEpjRkREdytTaXdaUmFuNFlBWVRnRWZWalJp?=
 =?utf-8?B?aTh0WkwyYUwrcHhyNXlOdzA5M1kwRHZXSGY1REVoVHMrUzlIRkFRY0VyaENL?=
 =?utf-8?B?TEp4SE1NVFNySXNnNklkUGJYV2c1emJPZXI2SG1hak5DRzUyZ0dmZ3BHOVY5?=
 =?utf-8?B?QTZOOHlYOVlQS1RaL1BMVHQ2UE4wRlZVSU1tb2NES0pEOTJ2N1RnY2pXTGJ3?=
 =?utf-8?B?NTd6REZUMW5wcTg3YVZBbzM1SjJlbjJaSGFET092dVEranNNWlJFSit3NXBL?=
 =?utf-8?B?alVCNHhUYnNIcGx4aWlON2JqU0E2Tk1mSVB0RHVTYXNHaExKM3dNTmFGblBI?=
 =?utf-8?B?ZjlLRmgxUm5HUEkwekNYbTk4RjJ0OWl0TTdQK2xrNVl3VTR6UE53YWE2V0pK?=
 =?utf-8?Q?/JWoDxlirtd949w0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ef83d84-8ecf-40fa-366e-08df3f4bdbb5
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 16:58:35.2170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BsiFVxQ45+E9UExpQfnf8dCCHbT1k/weJFs1yDbUBPEZw5U7cSEfxkggrxkwU4Lk81T3OsVQLA5Yivvws3/T00XRu+tz7srgwJEWDerI1DY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5129
X-purgate-ID: tlsNG-42698a/1794329919-AA6DA9EA-0470D51C/0/0
X-purgate-type: clean
X-purgate-size: 4706
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/10/26 8:57 AM, chunjie.zhu@citrix.com wrote:
> From: Chunjie Zhu <chunjie.zhu@citrix.com>
> 
> nhvm_interrupt_blocked() reports why an interrupt is blocked, but both
> callers, nestedsvm_vcpu_interrupt() and hvm_interrupt_blocked(), treat any
> reason as blocking every event source.  EFLAGS.IF (hvm_intblk_rflags_ie)
> doesn't mask NMI or #MC, so NMI/#MC get held pending needlessly, e.g. when
> L1 sets V_INTR_MASKING and L1's IF is clear.
> 
> Have nhvm_interrupt_blocked() take the intack and report no block for
> NMI/#MC when the reason is hvm_intblk_rflags_ie.
> 
> nvmx_intr_blocked() used hvm_intblk_rflags_ie for vmexit/vmentry in
> progress and a valid VM_ENTRY_INTR_INFO.  Those block every event source
> and have nothing to do with RFLAGS.IF, so report hvm_intblk_arch instead.
> This doesn't change behaviour as all callers only compare against
> hvm_intblk_none and hvm_intblk_tpr.
> 
> Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
> ---
> v2:
>   * New patch.  Handle the blocking reason in callers, as suggested by Ross.
>   * Report hvm_intblk_arch from nvmx_intr_blocked() so the NMI/#MC exemption
>     doesn't affect VMX.
> 
>   xen/arch/x86/hvm/hvm.c             |  2 +-
>   xen/arch/x86/hvm/svm/nestedsvm.c   |  2 +-
>   xen/arch/x86/hvm/vmx/intr.c        |  6 +++---
>   xen/arch/x86/include/asm/hvm/hvm.h | 12 ++++++++++--
>   4 files changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index ef9c7cd05777..8fd095a4f8e6 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -3897,7 +3897,7 @@ enum hvm_intblk hvm_interrupt_blocked(struct vcpu *v, struct hvm_intack intack)
>       if ( nestedhvm_enabled(v->domain) ) {
>           enum hvm_intblk intr;
>   
> -        intr = nhvm_interrupt_blocked(v);
> +        intr = nhvm_interrupt_blocked(v, intack);
>           if ( intr != hvm_intblk_none )
>               return intr;
>       }
> diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
> index 66b77c6efe7d..a93681e9bbcd 100644
> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
> @@ -1496,7 +1496,7 @@ nestedsvm_vcpu_interrupt(struct vcpu *v, const struct hvm_intack intack)
>       uint64_t exitinfo2 = 0;
>       ASSERT(nestedhvm_vcpu_in_guestmode(v));
>   
> -    intr = nhvm_interrupt_blocked(v);
> +    intr = nhvm_interrupt_blocked(v, intack);
>       if ( intr != hvm_intblk_none )
>           return NSVM_INTR_MASKED;
>   
> diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
> index 6c220c4c2e49..38be2387739d 100644
> --- a/xen/arch/x86/hvm/vmx/intr.c
> +++ b/xen/arch/x86/hvm/vmx/intr.c
> @@ -142,18 +142,18 @@ enum hvm_intblk cf_check nvmx_intr_blocked(struct vcpu *v)
>       {
>           if ( nvcpu->nv_vmexit_pending ||
>                nvcpu->nv_vmswitch_in_progress )
> -            r = hvm_intblk_rflags_ie;
> +            r = hvm_intblk_arch;
>           else
>           {
>               unsigned long intr_info;
>   
>               __vmread(VM_ENTRY_INTR_INFO, &intr_info);
>               if ( intr_info & INTR_INFO_VALID_MASK )
> -                r = hvm_intblk_rflags_ie;
> +                r = hvm_intblk_arch;
>           }
>       }
>       else if ( nvcpu->nv_vmentry_pending )
> -        r = hvm_intblk_rflags_ie;
> +        r = hvm_intblk_arch;
>   
>       return r;
>   }
> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
> index 02d9c44373ff..3e03a08a4818 100644
> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -682,9 +682,17 @@ static inline bool nhvm_vmcx_hap_enabled(struct vcpu *v)
>   }
>   
>   /* interrupt */
> -static inline enum hvm_intblk nhvm_interrupt_blocked(struct vcpu *v)
> +static inline enum hvm_intblk nhvm_interrupt_blocked(
> +    struct vcpu *v, const struct hvm_intack intack)
>   {
> -    return alternative_call(hvm_funcs.nhvm_intr_blocked, v);
> +    enum hvm_intblk intr = alternative_call(hvm_funcs.nhvm_intr_blocked, v);
> +
> +    /* EFLAGS.IF doesn't mask NMI or #MC. */
> +    if ( intr == hvm_intblk_rflags_ie &&
> +         (intack.source == hvm_intsrc_nmi || intack.source == hvm_intsrc_mce) )
> +        return hvm_intblk_none;
> +
> +    return intr;
>   }
>   
>   static inline int nhvm_hap_walk_L1_p2m(

nvmx_intr_intercept() circumvents this logic by calling
nvmx_intr_blocked() directly. Perhaps you need to replace it with a call
to nhvm_interrupt_blocked() (like the nested SVM code uses) so the logic
applies there too?

Ross

