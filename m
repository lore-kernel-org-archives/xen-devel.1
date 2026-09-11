Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9CAC88E4C
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 10:07:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416232.1645377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4y9c-0006aC-02; Fri, 11 Sep 2026 10:06:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416232.1645377; Fri, 11 Sep 2026 10:06:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4y9b-0006a5-Ta; Fri, 11 Sep 2026 10:06:43 +0000
Received: by outflank-mailman (input) for mailman id 1416232;
 Fri, 11 Sep 2026 10:06:43 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x4y9b-0006Zz-0U
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 10:06:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4y9a-00DdhD-Da
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 12:06:42 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aa3d2b1-2eae-0a2a0a5409dd-0a2a4508d69a-2
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 12:06:42 +0200
Received: from [40.93.195.56]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aa3d2b0-f659-0a2a45080019-285dc338542b-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 12:06:42 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB7024.namprd03.prod.outlook.com (2603:10b6:a03:433::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Fri, 11 Sep
 2026 10:06:38 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 10:06:37 +0000
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
 b=XqNxvpG7GDIMZGEO9aatG/IgUv80FhD332Qbzcy/4eQvVPCJ5Na9E9XwDljHeRJtLIzLtkP+CsKm6BTgda8f1OsjC2fLS57oYdcrrgGPIxQ+ftdlBVK9jTUYNh7Yz7Mu8SN+SbZVsK9BDHp7s2lbt2jXOvynsMDQkb4OT/KADNwCwCDPkZHnQvjH1NshAQ4Pn21S/Q0rvvqQCIBlzmyjLdMqKga/bFCNWcKSKbBtRCObHsDObTrDkXQC2+b34+tCJPhk/Y3pitKzJdai7bvfZbDMqx6lgFE/uSs9psrxcQ+0Vctn3qmWv/ZUUq5Xeyi3DXKCiVNnbHArpmcsyclUyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWBa+/18y8zYEKUg1Y7KJgFwdLU6qI/Ra4pbMntCXQA=;
 b=T0wS94rMqyK9bCnJvJyFJ+rUQf3STmz5iNLl9wiVFAYeuVZbs4pbtV+r+SoVVuc9sRfaJ0VmbrZRlq7VnllEejILrSeHxR2GTfBchfzTf23nSXcP2UUILRpS46xXEmxWlmpXlfXMB/rwhk8/MN8CkR0uTtxO/fn+ydCgk0Lk4b3npakZg5Mr/38M49QahoStThA4bpy6ha6VatXOdV5cQ4To7M6nFkoZJwTjkqdcwCVJDVR/rIqnKfgXaJO/Fb454gUydg0kBopOLx1xKAwSCMQVgm5b8Wcd2xfMmRi1cFBiPZqoprPCLTWXzkHQVQWKs2UTJiKKE2Rw4cFbmZoP8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWBa+/18y8zYEKUg1Y7KJgFwdLU6qI/Ra4pbMntCXQA=;
 b=RDWyMJH6BQ29w5gM9l2gcWy0fpKlUtjhI0OaQg3CVApMr1m9HvHv5UNNK7oP8z6epIBNk4bSnEEbI/nP+1oPoROglcctM0MNFWlx/jRrN1QaxkC3hYmR/hSi8gdon2T7WPtnjbwoSh3X9uiMui7yodAsasifGLp7ftWTmHwOgfA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <df8b4a30-4598-45b9-997c-fabdd42b8105@citrix.com>
Date: Fri, 11 Sep 2026 11:06:33 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v1] nestedsvm: Fix multi-byte IO port intercept check
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20260910163955.1005097-1-ross.lagerwall@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260910163955.1005097-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0014.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB7024:EE_
X-MS-Office365-Filtering-Correlation-Id: 89fd55c8-9ea1-4cf7-7625-08df0fec5dc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|10067099003|56012099006|11063799006|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	PFTJgVkp8VJK2CwJWyRd/cd6qrzEe9dwPSdoqq45RROtWkq0WlwzdptsIoubCfAPNv9qP/Pom81pQsCAmRlCUPrWmeIw/ainCROqutZ7o2HGX19PZvRzUevIWwen5AP4+zlhj7I1QB31PHfipjaloPMfjKg28MUT3vOOEkBhUMU6eHOws/jVFssHwmkq6YSpBG2hvPwMO12ayDjDd9CMLtlpmAipiQVn4a2L8fuJmPCG2iEHcZvvkgjT/64MkCwCo0AVv/RuBND9ccl+2aCjWKlAWqjXe67jyAjA3f8UuxnhLr8OPMCK0f7QowrzI5sJnTvA/1yr+Kl2/xCcw2kzeYgxTORrEnhwk0A3yrMLYTcUYUGesZMxT0cKQiCDTTUIBSd3mt1kRCRcsoN5JWyRDm9fq317gveOS4BdYecSLxaCG4QI1h/iKlU+669CJ+UBNsNwiTfhsfR22REwl3BlimQG7/g5Lbl11YqX1BFVzIQKf6wli79ZYZZDlyi8A1forB1CRfawMYK8BrxLDnELxl1fKPy049h2icrbDW29ihYwFUYUAhruKCcAmwYortmLqfA3bJkn6kij+77Pb4sMQJW3YjH1iOOaW2uxVupf4nN4VO3o/2JK5MZn5Kds+k7ef5B8N4KeOaTqYWaMUA3yzhwik2cpA/9KpCe+cJl/rGc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWZ4Ni9oNkVkNjdGb3NQZjRxNStwZXpIRlI3eC9YWkhwbnVGUm5jTDloejNZ?=
 =?utf-8?B?YTY0UytWQ29ZbVF5N1ZxV0U4M3k4RHF1Q1ZOc2ZPYUZBUmc5dnhwSHNHeXNi?=
 =?utf-8?B?bnlIVzlHQkUzWURJSXg0a0xWQVJwUmZEcUE5M1ZoemtjaytjTDN4NVZSaFZt?=
 =?utf-8?B?WDE2dWhkd3laM3dPV3A5cnhFcSs4dDhwZVpEOGFISUtMRXpXZVQ3dGxxZVUx?=
 =?utf-8?B?LzVLeVFubytrcTduZ0hMcGdkOEVLbXI5a0pYUzFCUHNjTThYTkdoVWh3MytF?=
 =?utf-8?B?TzBIdFVFWWM4V05UdlBNemRZMzcxRWx3OUp6V3Bicjd5bzRULzRZMG1ZMG1n?=
 =?utf-8?B?bmNIK2xXRUg5TE40Z25KVzMwMHNqUXZVOGxlNXlCNE9QTnlHcTJYdGRXSFdG?=
 =?utf-8?B?Tld5Wko0M2pVQ1NNMVdWd3IrVnp1Yi9hc01LOHU2TEZLaDB6czhacGIwSjh3?=
 =?utf-8?B?UXoxdEJzT0JFViszbFdleDZEQW02WjRYenFWV0RXOUhTL0t2TDM4cVc2enhj?=
 =?utf-8?B?MVBnL2x0T05sVnhwdUZTa0xiM1N3aXlOOHdUaVRDN3RrRWtHWG5jRy9XaFNK?=
 =?utf-8?B?ZjlRd3VYQTl6SThMWFZZWndReG9EQVZ2RG5YR3hoS1Jza00xaUY4VmhTZzNB?=
 =?utf-8?B?OVI4S29BMzBLMEVqSGJyM2xtaWsxemttRW1jYS8rdFZ2MVFrbnhzdE0rL0xs?=
 =?utf-8?B?Z1NQZzhrWHlublRLd1ZQZnlXZnBZVk1wRFhPQjZFUjA3TmRQUTVsZC9yMHRT?=
 =?utf-8?B?d0dYMDFUSlNsOERzcFpoVDE0VGlIdENDSWFzc3Y3OURoTUdZdm9NcmJzalNX?=
 =?utf-8?B?a1NwbWE5SkIxZGZHa3dzWXpuYjhEKzhFV25iZHlBbWs0T1JqVllnK29tSFZJ?=
 =?utf-8?B?bkFZalZRZGpIbU5nbEJXTDIzQmRMNEh3QTBBb0FVWGlIVHlhNVJYVkVyTEda?=
 =?utf-8?B?cFFaTUdnc2ZNM2hnNVlveUd4UnIyN0EyUFpFL3huQVJ2MUhlZkttWVJaYUgx?=
 =?utf-8?B?M2Jyc3kxQnliRWlHT05kZEFJd3Y5T0FTQjBTbC9RUmh3dnR5eStRMG1GMkRn?=
 =?utf-8?B?YjFQYVBVQlNvOFI2WmdMeFpQM3NzenE5RG9sVUtabDgvV2MxbXI4cTBVbGYw?=
 =?utf-8?B?WUt6VFVZWWNUY3V3OFRVSkM2N2kwZ1FXMEJHbFpvR2xEckl2Q1pVaEJhbFVJ?=
 =?utf-8?B?YTJsTnBaRGZ2aFZPRmdFSDI1c2ZkaDk3dnZMdGRoZ0dTeENrWXNhaUNuV0dq?=
 =?utf-8?B?eW92RU5sVFRPZmlyREFXMzNoYjBmWUdHT2pFTmNtMHFNVWFmTXJJVkNjWGM5?=
 =?utf-8?B?ZXRCMkpBTjMzbHIyZFRwdHpDcVl6ZFJxMWN5aGpKMEZnOEJDMXAySk10YVMw?=
 =?utf-8?B?QXdrNFB3UEY3a3I2OHRjRGxRQ2JvQmo2VTE2SFRtczVLUEJjRTc0S2laZGxB?=
 =?utf-8?B?L3ZNMkNGdjFTNXpMVFdoWVYvWGpQU1dUd2N5YjhyaDluVGRrd2NFY0d6ai92?=
 =?utf-8?B?SlZWK251RzhXOXBJcC8yZy9lS1NmdEhMTGc3VUUyei9aRno0anZqN21wV0tB?=
 =?utf-8?B?cERtVER1d0dSRWRNU1RBaHZHWW5qRUJvZXhxV0JYRjI1YitlMGZjN1JGOU9i?=
 =?utf-8?B?UzN5Ny80UUJPMDVwbGozaHJad29iZDJENzZxajQ3T2RaZkVETFMwRjBmNXlL?=
 =?utf-8?B?QThmMDZpakVnYzhSZlRZM3VPenRGQktVQVZZb2NEeW5MbEZna0FiVVdSem5V?=
 =?utf-8?B?OG9YN2xVbHJtcXp0TjYwemFlQXh5OWQveW5ZZ05KZWZuYmw4QlBYSUlkRTBv?=
 =?utf-8?B?ajU1bFFVK21uSmZDSERaRDU3RE9JbmhpakVWTnNsK3JsVFVheVZ2dnYwcjhK?=
 =?utf-8?B?ejBCNDdKVTBQVUV3VWpOOGF2MjdjampRK3ZTRGZyZG1zbHFkYVUrcE5RT3BU?=
 =?utf-8?B?aTZQVmIweFg3M1JnZDR2SWtIeHRoUVlPaGxLZFM3OFFyVS9TZklSc1NsdUF1?=
 =?utf-8?B?RW9rQ0NjRVorVkpiNGpxeld2dWNFcVJ0MnBBQm9pNXlMcjJZRzRIV3J0aDlk?=
 =?utf-8?B?bE41dGV4RUR5UVdqT21hVkZOQ3BERDFBOXFVSDNsNTE3WCtWbmxWSU5PeUFG?=
 =?utf-8?B?eXB0TTRiS1NaWndLemFXbzc3enIwTnhtNk1oL3JLSzl2TXZLVU5ZTWc4MUJB?=
 =?utf-8?B?aFk1T1dsMEYxMUdIZno4bWZBUXl4Q1JmeEZRaGR3U1dyY2ExQXNxZTF2Z3lj?=
 =?utf-8?B?dm5ZUEVWRGFkR2JUQm44bmJLNWdpVzU0VmkvN05SYzE2NGRaRjVVbUhPdUpK?=
 =?utf-8?B?M091a3Y1LzJmMkR0b3pCS0Y0U2hscWwySmplRHlJME1nNTlvVDZxUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89fd55c8-9ea1-4cf7-7625-08df0fec5dc3
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 10:06:37.0818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mlwfCXaIECN6b64i7Qq8TjRIfX3AmgWjWcx0MlNFn9zpS7M0DPdlRJlm1neewc892A8Xh9jNuanplk38K6R+u8Gk5s/QRDzUMoOMYxk/1KI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7024
X-purgate-ID: tlsNG-c1860d/1789121202-CC57487B-CCF0759D/0/0
X-purgate-type: clean
X-purgate-size: 2436

On 10/09/2026 5:39 pm, Ross Lagerwall wrote:
> For multi-byte IO port accesses, the APM says that SVM should intercept
> if any of the corresponding permission bits are set. However, the code
> has this backwards and only intercepts if all the permission bits are
> set.

By any chance is this for the root partition, with 0xcf9 permitted but
0xcf8,a,b intercepted?

>
> This affects Hyper-V since it does not generally set all the permission
> bits of the multi-byte ports it allows its root partition to access.
> This results in an L2 root partition that cannot do PCI config space
> accesses and therefore cannot access its NVMe disk to continue booting.
>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---
>  xen/arch/x86/hvm/svm/nestedsvm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
> index 5adb1bd72c4d..249fde43b5be 100644
> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
> @@ -852,7 +852,7 @@ nsvm_vmcb_guest_intercepts_ioio(paddr_t iopm_pa, uint64_t exitinfo1)
>      for ( io_bitmap = hvm_map_guest_frame_ro(gfn, 0); ; )
>      {
>          enabled = io_bitmap && test_bit(port, io_bitmap);
> -        if ( !enabled || !--size )
> +        if ( enabled || !--size )
>              break;
>          if ( unlikely(++port == 8 * PAGE_SIZE) )
>          {

While this does fix a bug, I think the behaviour is still unsafe.

For starters, 'enabled' is a terrible name and is probably a major
factor in getting this wrong.  It should be 'intercepted'.

hvm_map_guest_frame_ro() can return NULL for several reasons[1],
including ballooned out frames/etc.  It is not by accident that a set
bit means intercept; it's for the same reason that the byte sequence FF
FF is #UD (with the PUSH that should have been in that position moving
elsewhere in the opcode table), and that's because ~0 is the return
value for "nothing here on the memory bus".

Either way, if io_bitmap is NULL, the port should be intercepted rather
than access being permitted, so the other prior line needs to be of the
form:

    intercepted = !io_bitmap || test_bit(port, io_bitmap);

~Andrew

[1] One of the few things which can't go wrong is gfn being in the
address space but gfn+3 being outside of it.  This is stated to cause a
VMEntry failure.

