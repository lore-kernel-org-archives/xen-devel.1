Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8ECBC55165
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 13:21:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1377787.1623617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpQhk-0006gC-FU; Thu, 30 Jul 2026 13:21:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1377787.1623617; Thu, 30 Jul 2026 13:21:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpQhk-0006g5-9x; Thu, 30 Jul 2026 13:21:44 +0000
Received: by outflank-mailman (input) for mailman id 1377787;
 Thu, 30 Jul 2026 13:21:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wpQhj-0006fz-AQ
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 13:21:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpQhi-0006sN-LD
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 15:21:42 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a6b4fe2-2eae-0a2a0a5409dd-0a2a4503e9e2-20
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 15:21:42 +0200
Received: from [52.101.201.59]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a6b4fe4-fae8-0a2a45030019-3465c93b67b9-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 15:21:42 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BY1PR03MB7240.namprd03.prod.outlook.com (2603:10b6:a03:52b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 13:21:37 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0245.012; Thu, 30 Jul 2026
 13:21:36 +0000
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
 b=dhpfkDy0uIYIS7+zEQ1GpiizJnonZstl9yJ54M9EEw8zlj23BRq0Ykanxwf2cK4kY1+k2Fr2MX5I7COlCEdL5xAqf9rJg41Y3G6KUZMbIqxIlMFJ6bA8rNXpz1Znb7wy5e7bUlpBdSJBjaOn8arFTAMO2P4n/iwx2MyxldYIH8AkYKSU61vqQ4pJl/iLvjEYxLDi6kIuDUOXLCPyBXS3scHU69WmF4bmhXo7RwuEAO2WdCqTwRc4SlM1Zj8D867dNJMbf3BPpxuExBmO32QZ7pCR6qd4Od4XEl2f+7cZvfRR6w8Ktv2pYrv7waV8nXKJ/u3KIvt7G+7aWVM8QR3Bpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TB50vRFqM2Heat1S9uHZBFWomHqbaPebHHNTU6DSHG0=;
 b=RkVni0OO1uM5ZucrTNdiqFy7gslusYDATVNSosOCNXegMwr4aE7tZjfyIU8B3YCLEzzFw9Q9B0XKqsuIcflZpgB8w3m0PVSpslWGbSkWhVJtGY/PGQu8F4uY2p7bkojp5v8fwnqhVM7/dRV2L9H3HCTaiPx3FHB74g3tI/zFAGzo4AY+RIs2Lzq4HeEVE9JpUEsV0fSzMN3HzPjna30hXVMTWiOzROJZgHijxkvtkffgypRgcOux3S3Erxi7KOTr+ZMHoZrztHAMBFXwxTXay7IRyssEAj9UKkYCTXRjPxMM6MxvvU7fDrXieNzlTpKgBFbGzUN3WXIpIc+X1PkSEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TB50vRFqM2Heat1S9uHZBFWomHqbaPebHHNTU6DSHG0=;
 b=DPsxEKU6ei1yVZWF0xYo+287Shvy4LQH7EpxiJRSnmxFp3+iprCT6Az9DwpDml9rmT+NaHaHDGjIs/W0tPryjpsKU2DSMM+dIFi9120S0Y+reE/v5IjDNGZ9CCznkucZQUyR9zAZ5NRtRsC8nCsb9sZbPEUrNGVeVbuRMjJ8Fiw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ab6d9fe6-e239-49ac-9bcf-79779cf63420@citrix.com>
Date: Thu, 30 Jul 2026 14:21:33 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: New Defects reported by Coverity Scan for XenProject
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6a6b266559168_35fb2bc1be9079a4147ab@prd-scan-dashboard-0.mail>
 <d0ff411c-3bd9-4306-8782-ac63f7b202da@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d0ff411c-3bd9-4306-8782-ac63f7b202da@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0549.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BY1PR03MB7240:EE_
X-MS-Office365-Filtering-Correlation-Id: b5d4c06c-b535-4d23-c4e1-08deee3d7b8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|4143699003|11063799006|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	4NqMuUxFfuoD5tMJ7G7FL32iwrHb+KIKzYk78SrSRGsHvBtyjmookWqz02UYJYVzwHHOSxJxwGEYLk1NoiXIQcZt8TiPuybJBjfAR5MtzaJiVzk/1dAc2EQttYexHJjLusx+xMnQeEjoU6VBoOr/Vi0u3LVQAFYU9vs5AfgSy7qWIYrddwBZXmH3tapjpIfbtNv5olAsh0L9DpvgXpq08JViYS4KomTOKeZF6EgfUBfW3yUhRbB0np/Gmm3a4tbWuUbMP8ngX8W5xJWL2xzeEg5kh1kHq2AgnLjwH8UjzQbClul2KpIqh6AZEWGI9BGafyVvRL6H+RV7o/7P0KmU+kXFHkwkNQ9IrvnWWqs0i4Yeiy2TS3TcJVF1xuhOc/lkag8HC5aRscXgZ5HNVYNQ1v35iE63OH/RUUdgfTeU9Wb8g5UlB9biksMN93mdKhkTSa1t7TqlwQTykws3nt4Xj0K/OBpOiZXns/Zh4fqnZrElSPGN001SLPQvJeyUWuoTTXPrOoDkos0z3O30v7igC3fHNCo3W+pd6dEpcAWgMASAEPWq2zqfBesX7DYeOeJBmc6oiemG3ofd8Is9jLs9DPO7QDIfI6qHt2JHA44KB0NiIqplbRohHlkApsuyr9UHWF2uUHYRaAFuxqYG4WICHQjmXqC9VR7jlcQP6SYzges=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OC9BTmZvUitPdVJTcjhqcTl2NU5TUzAvZlV0enVqS0NJWit0Rk91SHVVbUVQ?=
 =?utf-8?B?UnVwaE9rUSt2aU4yb0Q1eUp1RlBOcGNXMUQwRlQyNmF3cXk2Tk5UeWE3Mm8y?=
 =?utf-8?B?TldTNmttNHZxZUpIYWNyL0JQYU9rTEJtTjFiN1JhSFo1MkJ3dFo1UG1vSWdr?=
 =?utf-8?B?MGkzRHNrT1FrVGo4N3hvcWVLeUhyVHJuUnB4Wlluam0xMkhxUENGWER3NFVE?=
 =?utf-8?B?bFlDRzFKQndzbitMM2U1QXBXMXlvSVNaVVhiWVJnQjA5ZEM2ZkNzUXZ2eGN1?=
 =?utf-8?B?MytXOHVGYnZRNGNPd204U0pUYzYzWCt3cTcwVDdzM0ltSld0VFhCYkFZM0hR?=
 =?utf-8?B?UFRBYnNVcndzTitnNnk3a0lxdnVCWHJkajhMUGhVb2JZZUYxRkFWK3UyYVFq?=
 =?utf-8?B?M0RCYTdLQTVTb1hjOFZscmJpMWptYnFHN095VkpydFRENlFSaXNyajUybmdv?=
 =?utf-8?B?Z0E3ZDBEemVGVTg2a3FIa0h1VkZiMkpIY1YwUGdsL1ZlRTMxSkNiekdXdGNn?=
 =?utf-8?B?ZEJ5U0Jud2psRHRQUER1RHlZbitMbUVBVDY2bi9YSXlrOHdTOFNWZkFlb0h2?=
 =?utf-8?B?UDhlM2N4d3FsY1JkK3VsN0dvcTMralZOd2hjMUI4ckZVZG9jbmV3MmpkKzY3?=
 =?utf-8?B?Zlp5d3hWU3VYZUpyVlppQVl4U0p3SnVsR0Zuc2JVbXU0QTkzV3VJSEdTWXdV?=
 =?utf-8?B?Z2FhblN2Mmo1L3VWNlRCRzJFNlZMQlMyUlhvQ2lqdkFHb2pjdFpaUDhISDVO?=
 =?utf-8?B?QjBzZm9VTHdaL0grTVN5SG5RUWJoblQyR2tuZkJtL3lFS0c3ejVQVGtRRG05?=
 =?utf-8?B?dkZLNlU2ZkZ2TTZjRjJEWmRkMWFrb2kvTXdlUWZ1MnFVN29EN1ZrWGlXbnpL?=
 =?utf-8?B?QUtwLysvQU5HWW9SL2tmWDU0d0dEc0hKTkl3NjJ5Wm4yUnhWZitUbWRIOEww?=
 =?utf-8?B?SUpscjl6T3FwOFZiSzhWQm5NWnBnNlNUaGVLQzljaDhuQm5qTXA4R2dYSmNl?=
 =?utf-8?B?VU1pV2VId2U1NUI1a05DME10M2FYZkJiYmJhOUMvTC9qZVpFZTVnR0pwbElS?=
 =?utf-8?B?VWE4M0Nmek9oellvbU1QRlZmeWxYdGtLaHhxMGlaRnZwWHpqOWV0QlM2eHBh?=
 =?utf-8?B?TWNpWmlRSjhET1NjSUJVR1A1dmNvdk1WcDZzcWV6aW8weFVWanRGUHIyNjcv?=
 =?utf-8?B?V3lvMVRrcUZEU1RuRVpUaFI0UWozMENRZzhSVkdXenBOb0xiY090anJITzBD?=
 =?utf-8?B?UTAwOTU2aGE2VXJoZ0tOamkwSWdhSTQ5RlBZU25CZ1ZjcFdaOGNlWkRkMkQ4?=
 =?utf-8?B?OHhoNCtJVldzU0l5enFYQm9LYmRVbG14Mmw3SjV0QTFiT2NkREhiektlaTZs?=
 =?utf-8?B?Yk5pamFCSGt1c0pwbTVYTVUxWG8zeTM2L2p2dG5MOEs3NDcyOVlhU3ZYMDYv?=
 =?utf-8?B?aVFleXRmdkd0YlY3U3dHSFBVUnJjQm5DeldsVDBsRUR1WWw1RlVDMW5LZHZo?=
 =?utf-8?B?RXRlRHhMVWhFU0svdUl5cG4vRWJNNEFNcDFJbVZkeEltZ050RmxTYzdIMStR?=
 =?utf-8?B?LzFiR3VtbTJ4MkdmaGZNYmx2WHVsdEUrRlVaWlUxVEdwWWs1eE1XNlpSOC9K?=
 =?utf-8?B?ajkzRVkydStYTUt3THphRTZTNzVOUjE2ei9QZldyZmdlbzMyZG9SVzRXcmFj?=
 =?utf-8?B?THRxdnIxOE9icGNINTAzZUZhZC91REtZU2hvcjVUelpCT2dPT2lkM2pMVFNN?=
 =?utf-8?B?UHlLTmJrMndTMHNSV1dVZ09SK0YyYm05cmx3RkJIeHEzbzBEWmtZN2FKV09W?=
 =?utf-8?B?eTJvdFVaczhYMVdXbUFKMDhCWmppWUk5bTdqL294QXFGUWhSbnVoWHI0R2sy?=
 =?utf-8?B?aldsTUszWHE1VXVUTXFQMktYNHAxSWhOTmUzem5uTFg3TnhIRktjWHZHS2FU?=
 =?utf-8?B?czRDWEJZTG92RUJUd0pLbDl6cTJobU9UeVhXcmhHUzlIR3pUN09Hb2FjMEha?=
 =?utf-8?B?UDdtbUgyUnd0ZU9iYkNMQXkreTNSTksyVVRNTW1pNTk1clQ2cGdhU01Ub013?=
 =?utf-8?B?WWIwOHpsMUc5eEpDK0hOazFXLzJzUHViVFpnYVpTejdVakxLaWZ3cTlrVXFT?=
 =?utf-8?B?VU5iTzFXMlpaaXVhWTNZVjhuSmNWdW5OY3NNTFJTVTd5LzRGVVRHT2xLT2g4?=
 =?utf-8?B?QU1tWm5nTTZBWkhUWW10N0thVHhQUHBTYWgxazlJTDNIakJxYmdOajhSMjF1?=
 =?utf-8?B?WVhjcnVVQUpyTHowT2VaMDNCWUp4MTdQWEdrZEdFQ0RMTWlQcDc0eVQ2QmZD?=
 =?utf-8?B?cDVWbFFhVWlWekNIZmw1VU5BL0JveUx6WGRkU2t0R0FRVFMzUTY2VDVGb2Rk?=
 =?utf-8?Q?fvoZANm72BhkPv/o=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5d4c06c-b535-4d23-c4e1-08deee3d7b8a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 13:21:36.7031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ORuBUcymxXbDULElPHG/DWmG8aXfS6fSNvz5gJ3CshKaGB5LTsOwXcNN/3gzuD2jnd5x5/ytAWxLYTe9rAjHC+f4XPOjcIWZMgmMkelYEuc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7240
X-purgate-ID: tlsNG-33051d/1785417702-772F54E9-D14F654A/0/0
X-purgate-type: clean
X-purgate-size: 5556

On 30/07/2026 2:14 pm, Jan Beulich wrote:
> On 30.07.2026 12:24, scan-admin@coverity.com wrote:
>> ** CID 1697485:       Control flow issues  (DEADCODE)
>> /xen/arch/x86/hvm/hvm.c: 2436           in hvm_set_cr3()
>>
>>
>> _____________________________________________________________________________________________
>> *** CID 1697485:         Control flow issues  (DEADCODE)
>> /xen/arch/x86/hvm/hvm.c: 2436             in hvm_set_cr3()
>> 2430                 curr->arch.vm_event->write_data.cr3_noflush = noflush;
>> 2431     
>> 2432                 return X86EMUL_OKAY;
>> 2433             }
>> 2434         }
>> 2435     
>>>>>     CID 1697485:         Control flow issues  (DEADCODE)
>>>>>     Execution cannot reach the expression "(value ^ curr->arch.hvm.guest_cr[3]) >> 12" inside this statement: "if (!!(curr->arch.hvm.guest...".
>> 2436         if ( hvm_paging_enabled(curr) && paging_mode_shadow(currd) &&
>> 2437              ((value ^ curr->arch.hvm.guest_cr[3]) >> PAGE_SHIFT) )
>> 2438         {
>> 2439             /* Shadow-mode CR3 change. Check PDBR and update refcounts. */
>> 2440             struct page_info *page;
>> 2441     
>>
>> ** CID 1697484:       Control flow issues  (DEADCODE)
>> /xen/arch/x86/hvm/svm/svm.c: 128           in svm_update_guest_cr()
>>
>>
>> _____________________________________________________________________________________________
>> *** CID 1697484:         Control flow issues  (DEADCODE)
>> /xen/arch/x86/hvm/svm/svm.c: 128             in svm_update_guest_cr()
>> 122                      monitor_ctrlreg_bitmask(VM_EVENT_X86_CR3) )
>> 123                    vmcb_set_cr_intercepts(vmcb, intercepts | CR_INTERCEPT_CR3_WRITE);
>> 124             }
>> 125     
>> 126             value = v->arch.hvm.guest_cr[0];
>> 127             if ( paging_mode_shadow(v->domain) )
>>>>>     CID 1697484:         Control flow issues  (DEADCODE)
>>>>>     Execution cannot reach this statement: "value |= 0x80010000UL;".
>> 128                 value |= X86_CR0_PG | X86_CR0_WP;
>> 129             vmcb_set_cr0(vmcb, value);
>> 130             break;
>> 131     
>> 132         case 2:
>> 133             vmcb_set_cr2(vmcb, v->arch.hvm.guest_cr[2]);
>>
>> ** CID 1697483:       Control flow issues  (DEADCODE)
>> /xen/arch/x86/hvm/svm/svm.c: 396           in svm_vmcb_restore()
>>
>>
>> _____________________________________________________________________________________________
>> *** CID 1697483:         Control flow issues  (DEADCODE)
>> /xen/arch/x86/hvm/svm/svm.c: 396             in svm_vmcb_restore()
>> 390                 return -EINVAL;
>> 391             }
>> 392         }
>> 393     
>> 394         if ( paging_mode_shadow(v->domain) )
>> 395         {
>>>>>     CID 1697483:         Control flow issues  (DEADCODE)
>>>>>     Execution cannot reach this statement: "if (c->cr0 & 0x80000000UL) ...".
>> 396             if ( c->cr0 & X86_CR0_PG )
>> 397             {
>> 398                 page = get_page_from_gfn(v->domain, c->cr3 >> PAGE_SHIFT,
>> 399                                          NULL, P2M_ALLOC);
>> 400                 if ( !page )
>> 401                 {
>>
>> ** CID 1697482:         (DEADCODE)
>> /xen/arch/x86/hvm/hvm.c: 2332           in hvm_set_cr0()
>> /xen/arch/x86/hvm/hvm.c: 2382           in hvm_set_cr0()
>>
>>
>> _____________________________________________________________________________________________
>> *** CID 1697482:           (DEADCODE)
>> /xen/arch/x86/hvm/hvm.c: 2332             in hvm_set_cr0()
>> 2326                 hvm_update_guest_efer(v);
>> 2327             }
>> 2328     
>> 2329             if ( paging_mode_shadow(d) )
>> 2330             {
>> 2331                 /* The guest CR3 must be pointing to the guest physical. */
>>>>>     CID 1697482:           (DEADCODE)
>>>>>     Execution cannot reach this statement: "gfn = v->arch.hvm.guest_cr[...".
>> 2332                 gfn = v->arch.hvm.guest_cr[3] >> PAGE_SHIFT;
>> 2333                 page = get_page_from_gfn(d, gfn, NULL, P2M_ALLOC);
>> 2334                 if ( !page )
>> 2335                 {
>> 2336                     gdprintk(XENLOG_ERR, "Invalid CR3 value = %lx\n",
>> 2337                              v->arch.hvm.guest_cr[3]);
>> /xen/arch/x86/hvm/hvm.c: 2382             in hvm_set_cr0()
>> 2376                 v->arch.hvm.guest_efer &= ~EFER_LMA;
>> 2377                 hvm_update_guest_efer(v);
>> 2378             }
>> 2379     
>> 2380             if ( paging_mode_shadow(d) )
>> 2381             {
>>>>>     CID 1697482:           (DEADCODE)
>>>>>     Execution cannot reach this statement: "put_page((struct page_info ...".
>> 2382                 put_page(pagetable_get_page(v->arch.guest_table));
>> 2383                 v->arch.guest_table = pagetable_null();
>> 2384             }
>> 2385         }
>> 2386     
>> 2387         if ( ((value ^ old_value) & X86_CR0_CD) &&
> For all of the above (and maybe more further down the original report): Do we have
> control over the .config Coverity uses? These (not really) issues all result from
> SHADOW_PAGING=n by default now, i.e. the unreachable statements are expected in
> that configuration (and they were there before, if the build had been done with
> SHADOW_PAGING=n).

Yes.  It is .github/workflows/coverity.yml which does the build and
submission to Coverity.

Right now it's a plain `make build-xen`, so will go from absolute
defaults, but we can change it if needs be.

~Andrew

