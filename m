Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76A8C5B572
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2026 13:39:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388233.1629443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtmgh-0001OM-Jz; Tue, 11 Aug 2026 13:38:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388233.1629443; Tue, 11 Aug 2026 13:38:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtmgh-0001OF-Gu; Tue, 11 Aug 2026 13:38:39 +0000
Received: by outflank-mailman (input) for mailman id 1388233;
 Tue, 11 Aug 2026 13:38:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wtmgg-0001O8-MH
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 13:38:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtmgg-000GUU-2t
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 15:38:38 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a7b25bf-e002-0a2a0a5209dd-0a2a450aa71a-34
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 15:38:37 +0200
Received: from [40.93.194.20]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a7b25d7-f2d2-0a2a450a0019-285dc214c408-3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 15:38:33 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DM4PR03MB6858.namprd03.prod.outlook.com (2603:10b6:8:41::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 13:38:27 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 13:38:26 +0000
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
 b=e0CLk4J2stuWAhXOBoCfQwI/rrEwlLRX/PqHpH1CpXWVoaBs9JODVb4qKOR3ZRa2TR9RAepIWoT3vKcxhRWHvkAqXCLfmZj0QTBN9CcR/Ay+5gTtBdfKGFbYAXGEJLP433QhTQvz+igVnHOnRLCOynt20YkjQ0TuKCeMBwI2q1QeIM1h7ebgmS2iCXMd8i0afs8sB04IW+hH3d1KGmCMw/cYkunDJdExm9NsXSK0InaJuwEbge3f1QgjDVKBbYFEOxarRY28KaON8r+K/sz/bPkfANQw4iurwUITlxP74yLRzHYeaGwPYvyxDRYjWgDLA1UxmHlQdt2eAb9shm3m0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7QTRLCpkWoX+hi2L0lT2Qf+AYscjDWFwY6R/CRrBUIw=;
 b=Ey1xeMfWbv/jodqZhb9/BYWqE5w8laQPVFxbCTde6D0kjEesNn9zKKPTaCfZpfsofKKddO0BTYP9wHtO7SdszPkOVgwBaE7twaYOQykmp9GZmZKGi8ume9rRtyxDnrpsHPwa8slUIl3YhONnrj3tHRD3SOxjyE1e2cpvg+vEqshSY9jxLnUfeyAi558ERYgTNLwQhdrybHtYM97JfmCYSJRGPsOHKi03cqhUzPp9aBL4DkOVsHGdZZYNZm/U/1O+c0u/BU2M8xikbOTgI5KQjddF10iPrqUyhrXkaOZ9wZSbGTaR7YqobTQZxtjc4GgxIA+XoPhLDTRLLXJ7V8IIuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7QTRLCpkWoX+hi2L0lT2Qf+AYscjDWFwY6R/CRrBUIw=;
 b=rfiouETIAU7hlB7dsqM2EWo5eTM5xxCw0byw/st6RJ2Mvmc2j4ZMWToKMUqAcG/FfxPlQFUeAhVb6h/KUuoyxEmAIJ1v0usKNtkmcqe4q/R4Krd8MPbnNqmE+0u7/p3R4Y3XIS2zB2N5gc814A56s3hAA7ASWvwhyUJJi1eXTIU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5c920195-efc6-460d-b2b2-743911d7916d@citrix.com>
Date: Tue, 11 Aug 2026 14:38:18 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>, Andrii Sultanov
 <andriy.sultanov@vates.tech>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v3 2/6] ARM/sysctl: Expose the supported guest GIC modes
 in physinfo
To: Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
References: <1784210820.8631fc262581453bbf619ec5b2062170.19f6b408bba000edb5@vates.tech>
 <20260716141138.88265-1-julian.vetter@vates.tech>
 <1784211104.8631fc262581453bbf619ec5b2062170.19f6b44e427000edb5@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1784211104.8631fc262581453bbf619ec5b2062170.19f6b44e427000edb5@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0211.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DM4PR03MB6858:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ab3a881-a964-4995-43b7-08def7add15c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|6133799003|56012099006|5023799004|4143699003|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	bzLXZtb0FC81lOASNTN3VYXmyM1hYbJwns37ooog+sCugtnl6+bGAQFnclBIw0B4zorVUB9nS1Sim0bhNr8N4qg/Rffygfd0uV5OM5FSKuogOtx0j61AVEsrn2CNTms8TwRq/bNIkuhebjkQW9fINmQevYXHUp4Mf51mnSTP+boCK17CYZssEOWFwGm9l2uO1iHwk6wrT0kZiZI+hDnfLA07UJ1uyKYNktQ3zQD1McIhtWE+xq/vGqpY09zncIKnmIk2kjmkYg4yF+laqbRUZzH77BizeR46AHn60rTQP3RtJE7dsdPizxS06aSYyvpCtdd3cfb0SkbsxkV4zjxfH/YWPoLVxMRCsxTyE5Gn2vacdjftYPC+GnL62rwqadh8WuGi5jMgwObJhu694jTTWA1gQu2xjZZckIUUTqki6KJRsy2EQkeaqXUHl8WFKBCBfxAQ3+XWYlxXZE0pcoFdc5XrMtgF0YPhi8n6f9OX7T3d7wYNU8lDyMm2oWeihLPs5BpjC0Yntnq/bCxBchrMJznj0mJhnQk84tEHrhiR35nSNPkT9FDumkwvOQUSA1+5O/MrDpRzNO16kvow4luetam5HKvLGUKAWiSVMRpdO0kywc6IHJpx72hAzL7aSQf8QQySWZYq0X5xVRxLca1Gt8QUIDlrKbVIhm7kj5UkfRQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(6133799003)(56012099006)(5023799004)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3EwYmJWQmdxenlMSFVzYjF6N3ZUVjl6U0t0UGtBRGJ4N0FDNnlIS3ZBa243?=
 =?utf-8?B?M3l5SVFhdUdabGh0QW96eU1jTWNRaGxTdlJMRzlMOFAyWHo2RUFST3BPOWlv?=
 =?utf-8?B?djIraEdXRTNxYW9XWnpmMEdsYzl5ZEtPcHI0eTBFazRpbzg4Sk1ZQTg2dlhT?=
 =?utf-8?B?cTFBYW9ocmNiTVk0enZObTBtYytLYTFKWGpoZE5rUmdqWkp2THorVlRmNHNE?=
 =?utf-8?B?RkZ4OHYyUXA3a0MvZkFSQkwyMVJLcjgzcHRpbzdzQ3laNkNVWHFmUlpoRFVC?=
 =?utf-8?B?dHVzWmdocERzTGZOZEFTaE0yNkNXanFUbzd0TUhneUZrZXMyaFBxdUdtYysw?=
 =?utf-8?B?blllM3JDbHg2M1VPVzNrNHBQZDMxUnduYWpQSzkweW9wOXRhYlo2SytoTUl0?=
 =?utf-8?B?dkNiemdOMGFhMm9LbnVDS2phV0FPTEpCTVZ2ajB3U1ZNc2RBa0FoTG5VM1E5?=
 =?utf-8?B?cGFaQzQrcjRPRzdKUzZaUXNIdDF2VXQvdE9wY05BQzF5UDhzQ1Q3emNtTnhI?=
 =?utf-8?B?YisrLzEwNVNxZmtVb2w1U1pIOFJ0aWdkakZOb1R2V2s3TlRiYllGNk1xTkJ2?=
 =?utf-8?B?dE1SMnNqblFzbGlreGx5RlQ1R1ZQRktjeTZKejgrMHBTelpwa05FaExHUUZj?=
 =?utf-8?B?V3d0bU1EcWsxQUZsSEtUNFRDS3BsdlVRVUZVKzdaOEZocXhHU0E4QWdaNEhR?=
 =?utf-8?B?RG1ubGQxT1huRVVqc1J4N2RWWjRKZ3NQNkJGeGFJbmJJMGhLTXl4cGZqRnpF?=
 =?utf-8?B?WGl6TlltNkNUbm9OQlRsajVha3lHclRyL09YWUFjWEJMS21tWitRdXdMUjFU?=
 =?utf-8?B?U0U3OEl2Z3dZbHYxNXlpNk1TdHlzWXA1RXNRT1NIRVNVTU1DVGpzN1U4Tm9B?=
 =?utf-8?B?R3pyNWJPRDJacm5OdHJZeGdvUUNNbk9mcmtzVWFOSkt6dTgzakZkbEVLZFhT?=
 =?utf-8?B?UzNHZkVNTU1qNUlOYVJaWm1jeDdLcGdSKzJTM3dTbHA1TnpOWmxwSFk2d1Ns?=
 =?utf-8?B?bGUxdE91T1JBb2dhWUJ3NGFPYzlYTUNYbDNWYjlpUVM5T0dBcG5TYUl0SlBq?=
 =?utf-8?B?UUg0OFdwek1oME56QmJQSGpsbnJCTm9uWmdKcm5YOFZpUXpuZXhLSkNrYkpP?=
 =?utf-8?B?OUx2YWk2ZzhKVjJIVHZuT25mWFdTTUJmYnFJQjBCQkZrRmxtZjMzQlJMZnNp?=
 =?utf-8?B?VWt6SnRubDhoUzZJRVhuMERRdmFZQWJ3RkZWaEZrS3NFVHJVaGVkbjdEckFV?=
 =?utf-8?B?WDBNaDIrTHA1c1hPcUJQWEpoMWJnSitIYm5VZXA3eWdjaHBqbzBqbnlSd0Iy?=
 =?utf-8?B?WkVuSHZXV25XTEZBYWZYZGVjUGdOeDBBYTAxcnRLVmh0ZG9sRGNaenZMbk53?=
 =?utf-8?B?KzFCRllsZ3VkNklxUTlDMWpsQU5XQ1BxdXpOUE5mdWQ0VDFSS2grSk9ISld4?=
 =?utf-8?B?Q29EQlYxQTUvVWVuVUNBWG5wUFJQSEF1bTdjV1VEVUEveTlhMHkzOWJGaEkr?=
 =?utf-8?B?bmVESzhPQkJBM3phMlZreUxiQ3NtVnpXZUlnVGFyMmJXWldyU1gxdjhnNzQr?=
 =?utf-8?B?U2lKSnNMS0NUblRJZmFLd1p2SmhSVCtCeVY3TU0zeGhXdkFTR21yWUVwVlFa?=
 =?utf-8?B?OTNvUWFLUVpydmZFdEtLRmljdUNEUDRBdkw4ckhrVnlMTHo0U0srZzZ2T1Nm?=
 =?utf-8?B?VlFhSnNZNTFFUHRVS2picjBYR2lQR1ZsclU5R254NVppalJ4VVVaUHhPa3lz?=
 =?utf-8?B?cjc3anVYdXR5ZGxwKys5RjhvMXZ4aDErRUxEQjRrbUdXZGR0WkZXZnA4SzVn?=
 =?utf-8?B?QlBvWGRoNTlrYW83NElvU3Z6ZUFLNnJ5eENnWE92N083UkxhQmVNQnIrdjk5?=
 =?utf-8?B?aXptbEhQdEdLeXhJNVFJMU05Z1ppVU4zRmN6Ti94VEZCc2VCVW1sb283Z1Zq?=
 =?utf-8?B?eUZFOGFPVWh3U1VuOGE4V0phc1hpVDZYT1ByQ1dtSFFqdGtwU2tKMHlrckZ0?=
 =?utf-8?B?WUxOWDdBR2plbDBENWZjT3k5UzZkdWVyZDU0UXZ4bDBubXRaTGM0NW5IUUhx?=
 =?utf-8?B?UGd5dlNpOHd1SHZTV2o0bTlmZHl0RzdKS1dWWGMvTVRSNldTMXhIUkxxWVY5?=
 =?utf-8?B?R1pQeUU3RmRiMUJnWU5SbHZHNTdKK2FuN0hHckxoYU8zTk9DWXhCdktTbTdR?=
 =?utf-8?B?bWY4OXBNWUtBM0FkNC8zRy9hNnVLK0lRTXowQklBYlBDa284aWpneHlpUGdW?=
 =?utf-8?B?bmFnZzM3WFhXaXA0elhGdWxZMDNNQnV2NkNxMkl4bXQ1UnRsdnNZY015MVRt?=
 =?utf-8?B?c0JjZlNmSStaWDFVMk1hL3dsOStVU01RQ0FXRmJrQUhRK25LWW5Hdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ab3a881-a964-4995-43b7-08def7add15c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 13:38:26.2007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wOMQ7JLq+cB9ctRnJVpPMCzdXp2tYSHn3ly+DfNY2iTUDQB51AWqwJ8bjU3FjFiD/OZoWf0w3j1uWMuQT5Y2ekc0k3tGo6HFBsBu59Mzpg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6858
X-purgate-ID: tlsNG-4011c0/1786455513-5A9D9CFC-375AD3C8/0/0
X-purgate-type: clean
X-purgate-size: 2109

On 16/07/2026 3:11 pm, Julian Vetter wrote:
> From: Andrew Cooper <andrew.cooper3@citrix.com>

I supposed I should finish the commit message.

"In preparation to simplify the domain creation logic surrounding GIC
version."


> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> Changes in v3:
> - No changes
> ---
>  xen/arch/arm/sysctl.c       | 26 ++++++++++++++++++++++++++
>  xen/include/public/sysctl.h |  2 ++
>  2 files changed, 28 insertions(+)
>
> diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
> index 32cab4feff..3b0edf4cec 100644
> --- a/xen/arch/arm/sysctl.c
> +++ b/xen/arch/arm/sysctl.c
> @@ -12,7 +12,10 @@
>  #include <xen/dt-overlay.h>
>  #include <xen/errno.h>
>  #include <xen/hypercall.h>
> +
>  #include <asm/arm64/sve.h>
> +#include <asm/gic.h>
> +
>  #include <public/sysctl.h>
>  
>  void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
> @@ -21,6 +24,29 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>  
>      pi->arch_capabilities |= MASK_INSR(sve_encode_vl(get_sys_vl_len()),
>                                         XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
> +
> +    /*
> +     * The GIC version(s) we're happy creating guests with.  Right now for
> +     * simplicity it is tied to the active hardware version, but this will
> +     * cease to be the case if/when the compatbility modes are enabled.
> +     */
> +    switch ( gic_hw_version() )
> +    {
> +    case GIC_V2:
> +        pi->arch_capabilities |= XEN_SYSCTL_PHYSCAP_ARM_GIC_V2;
> +        break;
> +
> +    case GIC_V3:
> +        pi->arch_capabilities |= XEN_SYSCTL_PHYSCAP_ARM_GIC_V3;
> +        break;
> +
> +    case GIC_INVALID:
> +        /*
> +         * Running a control domain without having the GIC sorted yet?
> +         * Something's broken, but there's nothing we can do about it here.
> +         */

printk_once(XENLOG_ERR "Unrecognised GIC version %d\n", gic_ver);

We might not be able to do anything useful for the caller, but we can at
least make sure the problem doesn't go unnoticed.

~Andrew

