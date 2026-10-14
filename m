Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAEF8CC6B24
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 15:39:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449253.1665148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH144-0002dK-3J; Wed, 14 Oct 2026 15:38:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449253.1665148; Wed, 14 Oct 2026 15:38:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xH144-0002dD-0O; Wed, 14 Oct 2026 15:38:48 +0000
Received: by outflank-mailman (input) for mailman id 1449253;
 Wed, 14 Oct 2026 15:38:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1xH142-0002d7-Iv
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 15:38:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xH141-00Ci13-SY
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 17:38:45 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6acfa1ef-2eae-0a2a0a5409dd-0a2a4508b214-38
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 17:38:45 +0200
Received: from [40.93.196.27]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6acfa203-f659-0a2a45080019-285dc41b39f2-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 17:38:44 +0200
Received: from BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13)
 by DS0PR12MB8786.namprd12.prod.outlook.com (2603:10b6:8:149::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 14 Oct
 2026 15:38:37 +0000
Received: from BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740]) by BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740%3]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 15:38:37 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v/RN8EGAA7McmV7Dyz9Y+AMnhY3EHqRHFP4Ev1jbBHHvTptI61mJtStVEeci+cm06sEH4tPX9as24feY0gzwbGKBnWabB2C0ruPBUhy6AESxMtgXTEThTDxIarxGrum1wJV34LLVaEMQXts5AXYjXWxxMBwykW7LVITCvq89xtxEI5/Sse7hoyG7Q44c/dxzKEdvp4tVlEWizVkQyCnfMMq9vNJjZUAl3wmvZg/7OAUCM/Lj0Rfx3wLi5EPLbplbknhS9lB1XMhoGnz4G1rYvocT4pr+LGbCYCSeZU5BR1pdWCE1+rBGCW7nC1WyNMhmN/qRdiFQ8NIIZHNkbG9vVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3LSwPFSlpzghr8qm+OHlNG5Ddb+PXeY5PcnfiGoE8vw=;
 b=C0fur5BdICPxZiCjeSfDWldaub7Mi4ro2z61XnJoFsKK2oUcdhfDAUb4zURudMuolAAaHHDdCTfQaByv/rtDEng5TzBa6H3jR2noHefCVPY8Y08e8nf0rc8sEcsXakbI+4uJVxvcHqxTl4HQ89EElJeXAw19xFpzfRVR1v0Pse6lfIiLt4SOvnv/SoikDzk1LXpb9o9mXGgbT2Um8iLXC9ekhSk3ysjqmmMDrZOZ4KraZvuK6BGtiR3m47g0MFqnNgBgcFPafc2o9gp8IpIp2z2TZvwd3fqs/4r1Gx8FrxfL78n/W/H2hRFjjDnI+RSOAqJgH1rdnrDTySMBNRelUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3LSwPFSlpzghr8qm+OHlNG5Ddb+PXeY5PcnfiGoE8vw=;
 b=xQs319DR0amrPGwlKnL0iuPPDZgrf/9afNdTdGtCtvRdIRagfSl+wD3trsI3nayGvfUMs1yliaDFreP0aIgsJUeXHEOKK79+sax81tkll6iy4WSEFbNVKKt+avnYeE6YknjpAOAFmTNGCdo5LvKE7/hv07RVolAKO865RoibhYo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Oct 2026 17:38:33 +0200
Message-Id: <DM4O9C5SOTWE.2DFLIY2LI9TQQ@amd.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, "Teddy Astie"
 <teddy.astie@vates.tech>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/atomic: Fix UB on various atomic helpers
From: "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.17.0
References: <20261014133551.622462-1-alejandro.garciavallejo@amd.com>
 <bfc959d3-fa71-4296-a984-4af85edaf770@suse.com>
In-Reply-To: <bfc959d3-fa71-4296-a984-4af85edaf770@suse.com>
X-ClientProxiedBy: MR1P264CA0012.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::17) To BY5PR12MB4999.namprd12.prod.outlook.com
 (2603:10b6:a03:1da::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4999:EE_|DS0PR12MB8786:EE_
X-MS-Office365-Filtering-Correlation-Id: e09288ab-b65e-43d0-f0c2-08df2a0936aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|4143699003|56012099006|11063799006|22082099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	m4RnrH5UFS2U9eemUcBu1jB2940O8bBvkxTfM06TrU1ip89cYtaAdtkH/aw1YdMlGHObyEFY26sM7VM6UQZQc2oTbThPLYg8H1L7duvfWH/SRRredV/swWICrzU6JJgdK78BbpooNZBxBM1kYwR12OxQPPHdv+gRK88bg+GmyJDCpChjZ2yovV+XAWBJfVHjYj//We7mmnkcU78ipLCbe5BNvGZTTyfGHDXsiEAMLDb/6qoJKf2NQw30F6Hob3WIFpanIR9AcAq59V1hZ44w9QlzEq9G5n3pC80f42OsGjSIM3UAba6e1c72hHjpwdH5GQdHErL/bi5fB65g14uQ29C8fn9v5HPlrtZRdkaRRaZ9vTUVNLnhfRU+vfujfqnZjoFgr9fpyNUzSHom48vS59lBe+Cr7Bn/hNT2cjC9UuT+H022IiqBxyMM0KrQnpqHq7XVq2JeN/I8POoUZ7wl3jL3TkCtDeMiUN/Dw/p4jpua8tcbhIO30e2yw551Nfr8HDrvEGKfaE+reMe5Ybq46029HjcT/Mxr1aBeCYeikKa9rCRd+Ar8ssv/f02C1PlY5LHT8nz9IGN1wUJH1TX7W7g6pcX28aFT++G/4NNJKo5bcGwGZJhVJuVKTnE5dEuQRh3PuT7sFGSeXGuPuNtThnTQzZgEp0C7rjocERmYOGc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4999.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFc0b0Q4ZERuOG5pcWZsYjVaODZicFhjcmxzbmlsRVlsZU14Z0ZsMExDOFAv?=
 =?utf-8?B?TFFJVCtIQUVrTzFpekI0bnBTRCsxM0hQcFRBKzNMQnd1UGttSFRTelozNXBl?=
 =?utf-8?B?YTZ3VGpnRDBDTW5YNThzSTZTNHk3MTVTUWswc1B2NG1QbTNHbVRqTVBFcGgv?=
 =?utf-8?B?OHhVMThnTTc4eHZaWGgxeXN1ZCtjL2l2RWYraW5pT0NDRXBDczlua09vNUZG?=
 =?utf-8?B?T3gybTRGUVUzNmtaYmhvQ0RWV3Fad3FZZlJ1S3Rra0Jnbm9HU1E3ZG0xU3Vx?=
 =?utf-8?B?VFh2OWZnZzBTNU9vbHFYU21zTm5JNVBDb3NKa2xoNmltUXlRdHE0cnduTHd5?=
 =?utf-8?B?K3BUcktudGlrRERmSkQ4MGtOV2JGc0k1NEVwM1p3OUF2MEhFZ0RjYks4N0ph?=
 =?utf-8?B?cmdSdURWSFBFb1NkWDBsQnNCcmUwUzNveTFEWDJOanlSVThleWxDazVteXc4?=
 =?utf-8?B?alh2M3k0bmZlczBiMHRTR3d4elo2bFFabldUbGNicDd5ZkNpaFkwb0hZcEU5?=
 =?utf-8?B?RERaWnkyTTdQMk1sdm4yYWZaSjBJYy9CUUp6R3RDaDlNZTJYTUt6ODdXekw0?=
 =?utf-8?B?RnlZeStxSml0WGY5MVdDWHMxQ0xPZW03U05SZ0ZBMytpbmJ2VTdwZGtIbTQy?=
 =?utf-8?B?NkpDSE02VjVqNDRBUWxNaUJqa2k1VVNzWk1TMEhJN2Q3bE9KbUxDbWM3aTN5?=
 =?utf-8?B?ci9EaXNvamRNWnZTazVzcXVzOTJJUWZKck1KOFJ2eGQ5M0NwZ2ZOWmNqOVQ3?=
 =?utf-8?B?djJyY2RBYnJpMGtPaGVRa240c2RsRkdza3NRU09UWFVaVnpTS0wvN0dBWVJV?=
 =?utf-8?B?RzBRenM3ZjAzUWtOWlNBWW5ZeHhGYTU0TWE4YlNnV0U4TlZjV1pwWVRUWmt1?=
 =?utf-8?B?bHpBVExValZCeVptOGh4aFR5VFAzVlVaMG9RdHlRQVZBekRWM0VOSE55U2JY?=
 =?utf-8?B?V3UvVGcwS3ZPa1pTOEorakVqSXRjdUR1QUpUL0ZqZngxZnhuRis5RlFla2ND?=
 =?utf-8?B?UWJTT2tzeDV3TzZUNUlTbzhOVDZ5cEF2NGUzdFh2bTZRZWdZaUFiL1NGNG1B?=
 =?utf-8?B?VDVmSFFjRDFyVXFlaXNjWi94VWRuem0zc1ZnVXFzOXRhS0FmVllMSmJnN3Ey?=
 =?utf-8?B?dytYdHVlK1NEb1pPYjJENm4zSVhmQ01aRW83K3ZOeDd4dDhOanhRSC9qbERi?=
 =?utf-8?B?dzM2NGpyR3piRFlsTUcxbUxFSkE5dlpkWFBOcTJkLzlNZmRpU2hCWW1zcXhJ?=
 =?utf-8?B?RS9Vcm8yQlZFWHRmdmNEWHphZTRSZ1ljWmUrWFNsajRyRTRkSkFlay9VM3NO?=
 =?utf-8?B?L09kUllCR21tc3RTVFUxTjRwNTArSk5OaWJnbU5IZStJb1BIb1A4ZkJOMTZa?=
 =?utf-8?B?ZGFXUisxVGJhVmJWU3MxMmo2QlltcytsWXQwdEtDTXNOM2RnL0hhdXA4UHVy?=
 =?utf-8?B?cjl0cTFTb3FBYklDa1hwQ1daL0M5NmI4RFEyL2xMZjc5OWpCQTRKNnZ4UndD?=
 =?utf-8?B?dmx1R2RzYk5hRzZCeEltc0VlUGs3S1pWa1dKWCszUGU3NDV4d3k1ZUxjUTZY?=
 =?utf-8?B?Tks0TlZpbmRyZWRtVTJHaVYxbk03bHJIdDBnQ3VoSmdiYzE2b09la09RZVVk?=
 =?utf-8?B?R3lzSytHQzdIU3FjUnpURC90NCtmd1lLcmQxZkNqd1kvQXlxSFNleFRQU1F1?=
 =?utf-8?B?Q0NMbWRwSG5IaHU2N1dpaFNGNEZRQ25ZRXpGMXkybFpSV2RhWEpLRGQ3TDBv?=
 =?utf-8?B?dHRUQ29WTm92NFovZUxDTjZJK3A2RVZvNVdKN0JQY2lGeHJ4Uy9VbzFKY25v?=
 =?utf-8?B?NlM3eWJ4aUZxUVZzbXJaaEs4ZUhsRVJrRnoxVjRHTHp6VEJhSWNHb3VLWTAx?=
 =?utf-8?B?RkF3S0Y2LzdrWkRsSnUvckN1bC9uR3JlVVlLMTB5djFsNnd5T2dLMEZBU1lp?=
 =?utf-8?B?SXQvSTVNT1VPeUhLQmZtMEM4aEZwZWlmakV4TXhGSUJtT21OR1hpYzlzYUto?=
 =?utf-8?B?TXkrVWRVR3FsN1RjM3dVODg0NC80ZXk3alh1ejMrOUszald4a09sTGJ6Skl5?=
 =?utf-8?B?aUFSeW1OV3pIS0JLRE9EV1U5c3J5cnFlM2VLU3pVWU9Ucll6YmllTGtraEVP?=
 =?utf-8?B?ZXlWUDVITTJiS21FOXhSVDR0c2tqaCtsMHNiQzNwVTFHcEw0SmVDcVM4NGYz?=
 =?utf-8?B?MFRtb0ozSU1hcjlLZDJFa0ZpMzF0NVk0UVQxUDlSeEMydFluZUx6ZEl2M3oz?=
 =?utf-8?B?K3pyWjgzL1dTRSswVDdhRUVwWE84WUMrdmwyWWNKM1B5dnJ0ZVNnTjFCdVlw?=
 =?utf-8?B?bnZrcm55U2tvWHJNQVFKRWRYVjVPWGJzOUd4RlFvd2NnSXJOSjYxQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e09288ab-b65e-43d0-f0c2-08df2a0936aa
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4999.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 15:38:37.2208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7td1J2ode6xiLUVIhY+owp/SuKrLLJ+kBwj9Acyu0OQ7HoD6XbtdLRM+KIjdwJZakQ+9x6VoWymxZuf3xUKcpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8786
X-purgate-ID: tlsNG-c1860d/1791992325-D674387B-CF82CA23/0/0
X-purgate-type: clean
X-purgate-size: 1483

On Wed Oct 14, 2026 at 4:33 PM CEST, Jan Beulich wrote:
> On 14.10.2026 15:35, Alejandro Vallejo wrote:
> > --- a/xen/arch/x86/include/asm/atomic.h
> > +++ b/xen/arch/x86/include/asm/atomic.h
> > @@ -122,7 +122,7 @@ static inline void atomic_add(int i, atomic_t *v)
> > =20
> >  static inline int atomic_add_return(int i, atomic_t *v)
> >  {
> > -    return i + arch_fetch_and_add(&v->counter, i);
> > +    return (unsigned int)i + arch_fetch_and_add(&v->counter, i);
> >  }
>
> I'm concerned seeing this kind of change: It's merely papering over an
> issue in the caller. There's not going to be UB if the caller passes
> suitable values. And the atomic types hardly are meant to be used in
> contexts where overflow could occur.
>
> Furthermore different parts of the C spec say different things here [1],
> [2]. Hence whether overflow in signed calculations is undefined or
> implementation-defined doesn't become entirely clear, according to my
> reading.

I won't dwell on interpreting the standard, because I only care how
GCC and Clang developers interpreted it; and that's a hard trap on
signed overflow with sanitisers enabled.

I can live without this patch (it's just paranoia), but thinking about
it some more, perhaps we ought to pass -fno-strict-overflow, like Linux
does, to the compiler. This brings forward post-C23 overflow semantics
and removes this whole class of UB wholesale. Here and elsewhere.

Thoughts?

Cheers,
Alejandro

