Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B186C56208
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 11:00:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384596.1627467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrvpX-0006V1-U5; Thu, 06 Aug 2026 11:00:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384596.1627467; Thu, 06 Aug 2026 11:00:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrvpX-0006Uu-QR; Thu, 06 Aug 2026 11:00:07 +0000
Received: by outflank-mailman (input) for mailman id 1384596;
 Thu, 06 Aug 2026 11:00:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wrvpW-0006Ou-GT
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 11:00:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrvpV-003tIU-TI
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 13:00:05 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a74692f-2eae-0a2a0a5409dd-0a2a4506aafe-12
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 13:00:05 +0200
Received: from [52.101.193.22]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a74692f-195a-0a2a45060019-3465c1164473-4
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 13:00:00 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BN8PR03MB5009.namprd03.prod.outlook.com (2603:10b6:408:d7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Thu, 6 Aug
 2026 10:59:57 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 10:59:57 +0000
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
 b=pm7bPBJMXXONYi0I88alJYlXPKHEETQns2Lq6MM6ufsf5Zujl8aLgqn2olczTwjJx8JmJ9DG2LFzpDuExmSvSad6l5w145/vejTxtUcAoLFs/IUJ1QF+UHMH502w8OTEUIbG7HvmKyt7C+IT/6fC1CuzzHBr9t6wTYo0qwQQvqHbhjSW3biYRZ7iezwRbKqXTlBkvK1s5FiAw1fzbO44/OkNOfgk3dem8iCtkOmiwYDfxzjE5oM9iJUmaAIUTOItV6EMmBLdOeXrBAs3oNXmd6MQJU+SWQzj9udMT3vza3hfQjnn+rwX9//xNzWY8Rie3V6vnO1zegsm/nrA2Y0+1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4+YmngKR9FGyhYhU7floGTmr7QgSYAhmIaPMsg8CLI=;
 b=A9SZ8niV58ojXzUZEeKcS1Pe+41DqNE206ry1slePt3vLbi8KFlrxIaJew7zv8N5NdfbfQ25XATzpKSMOnqNyYWs+8+zhJk8RcR5GJjBUIBsnX1kqs7acWlpt0fyPbWnsJs2GJ+PlWOMm7t58lzf/ZhJU6Am2OrmAZK2yviJhCEQCVynk60HaiOg8/+ylv4UhDpadEAQNA6cNQogsjEjFXaJ/S1q4EWZjAgaE6Kd8/YMPVPEZppjx2MkJXPLZYmYITMUPQZ7o1KjERBpp8nJ6TU6h33dsg496kqPrvWAB7p6PZI1s8rSMl2ysD+oJTjphvmAfvh+rkeWBhb6dyVpGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4+YmngKR9FGyhYhU7floGTmr7QgSYAhmIaPMsg8CLI=;
 b=zS7Az9w2rM6lKS/CnPueFkKbl+w+5u/3hJHSDdQNTTa3YBBLdeAZuBCPsiB4TT7C0Dumlv0cDsLOH2okPykWnpyWc1MYxRdp6szaNhSYJUkySztnATeIUdAhxA3b0eilRFazOpTjnhgTCH/MK8I8rJIUSRJoweO1qP7jL9hAoiI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <0835710d-f67d-4678-ba39-4597b9c9c7f7@citrix.com>
Date: Thu, 6 Aug 2026 11:59:53 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/svm: mandatory update VMCB nextrip for soft
 interrupts
To: Chunjie Zhu <chunjie.zhu@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20260806031732.10242-1-chunjie.zhu@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 xsFNBFLhNn8BEADVhE+Hb8i0GV6mihnnr/uiQQdPF8kUoFzCOPXkf7jQ5sLYeJa0cQi6Penp
 VtiFYznTairnVsN5J+ujSTIb+OlMSJUWV4opS7WVNnxHbFTPYZVQ3erv7NKc2iVizCRZ2Kxn
 srM1oPXWRic8BIAdYOKOloF2300SL/bIpeD+x7h3w9B/qez7nOin5NzkxgFoaUeIal12pXSR
 Q354FKFoy6Vh96gc4VRqte3jw8mPuJQpfws+Pb+swvSf/i1q1+1I4jsRQQh2m6OTADHIqg2E
 ofTYAEh7R5HfPx0EXoEDMdRjOeKn8+vvkAwhviWXTHlG3R1QkbE5M/oywnZ83udJmi+lxjJ5
 YhQ5IzomvJ16H0Bq+TLyVLO/VRksp1VR9HxCzItLNCS8PdpYYz5TC204ViycobYU65WMpzWe
 LFAGn8jSS25XIpqv0Y9k87dLbctKKA14Ifw2kq5OIVu2FuX+3i446JOa2vpCI9GcjCzi3oHV
 e00bzYiHMIl0FICrNJU0Kjho8pdo0m2uxkn6SYEpogAy9pnatUlO+erL4LqFUO7GXSdBRbw5
 gNt25XTLdSFuZtMxkY3tq8MFss5QnjhehCVPEpE6y9ZjI4XB8ad1G4oBHVGK5LMsvg22PfMJ
 ISWFSHoF/B5+lHkCKWkFxZ0gZn33ju5n6/FOdEx4B8cMJt+cWwARAQABzSlBbmRyZXcgQ29v
 cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPsLBegQTAQgAJAIbAwULCQgHAwUVCgkI
 CwUWAgMBAAIeAQIXgAUCWKD95wIZAQAKCRBlw/kGpdefoHbdD/9AIoR3k6fKl+RFiFpyAhvO
 59ttDFI7nIAnlYngev2XUR3acFElJATHSDO0ju+hqWqAb8kVijXLops0gOfqt3VPZq9cuHlh
 IMDquatGLzAadfFx2eQYIYT+FYuMoPZy/aTUazmJIDVxP7L383grjIkn+7tAv+qeDfE+txL4
 SAm1UHNvmdfgL2/lcmL3xRh7sub3nJilM93RWX1Pe5LBSDXO45uzCGEdst6uSlzYR/MEr+5Z
 JQQ32JV64zwvf/aKaagSQSQMYNX9JFgfZ3TKWC1KJQbX5ssoX/5hNLqxMcZV3TN7kU8I3kjK
 mPec9+1nECOjjJSO/h4P0sBZyIUGfguwzhEeGf4sMCuSEM4xjCnwiBwftR17sr0spYcOpqET
 ZGcAmyYcNjy6CYadNCnfR40vhhWuCfNCBzWnUW0lFoo12wb0YnzoOLjvfD6OL3JjIUJNOmJy
 RCsJ5IA/Iz33RhSVRmROu+TztwuThClw63g7+hoyewv7BemKyuU6FTVhjjW+XUWmS/FzknSi
 dAG+insr0746cTPpSkGl3KAXeWDGJzve7/SBBfyznWCMGaf8E2P1oOdIZRxHgWj0zNr1+ooF
 /PzgLPiCI4OMUttTlEKChgbUTQ+5o0P080JojqfXwbPAyumbaYcQNiH1/xYbJdOFSiBv9rpt
 TQTBLzDKXok86M7BTQRS4TZ/ARAAkgqudHsp+hd82UVkvgnlqZjzz2vyrYfz7bkPtXaGb9H4
 Rfo7mQsEQavEBdWWjbga6eMnDqtu+FC+qeTGYebToxEyp2lKDSoAsvt8w82tIlP/EbmRbDVn
 7bhjBlfRcFjVYw8uVDPptT0TV47vpoCVkTwcyb6OltJrvg/QzV9f07DJswuda1JH3/qvYu0p
 vjPnYvCq4NsqY2XSdAJ02HrdYPFtNyPEntu1n1KK+gJrstjtw7KsZ4ygXYrsm/oCBiVW/OgU
 g/XIlGErkrxe4vQvJyVwg6YH653YTX5hLLUEL1NS4TCo47RP+wi6y+TnuAL36UtK/uFyEuPy
 wwrDVcC4cIFhYSfsO0BumEI65yu7a8aHbGfq2lW251UcoU48Z27ZUUZd2Dr6O/n8poQHbaTd
 6bJJSjzGGHZVbRP9UQ3lkmkmc0+XCHmj5WhwNNYjgbbmML7y0fsJT5RgvefAIFfHBg7fTY/i
 kBEimoUsTEQz+N4hbKwo1hULfVxDJStE4sbPhjbsPCrlXf6W9CxSyQ0qmZ2bXsLQYRj2xqd1
 bpA+1o1j2N4/au1R/uSiUFjewJdT/LX1EklKDcQwpk06Af/N7VZtSfEJeRV04unbsKVXWZAk
 uAJyDDKN99ziC0Wz5kcPyVD1HNf8bgaqGDzrv3TfYjwqayRFcMf7xJaL9xXedMcAEQEAAcLB
 XwQYAQgACQUCUuE2fwIbDAAKCRBlw/kGpdefoG4XEACD1Qf/er8EA7g23HMxYWd3FXHThrVQ
 HgiGdk5Yh632vjOm9L4sd/GCEACVQKjsu98e8o3ysitFlznEns5EAAXEbITrgKWXDDUWGYxd
 pnjj2u+GkVdsOAGk0kxczX6s+VRBhpbBI2PWnOsRJgU2n10PZ3mZD4Xu9kU2IXYmuW+e5KCA
 vTArRUdCrAtIa1k01sPipPPw6dfxx2e5asy21YOytzxuWFfJTGnVxZZSCyLUO83sh6OZhJkk
 b9rxL9wPmpN/t2IPaEKoAc0FTQZS36wAMOXkBh24PQ9gaLJvfPKpNzGD8XWR5HHF0NLIJhgg
 4ZlEXQ2fVp3XrtocHqhu4UZR4koCijgB8sB7Tb0GCpwK+C4UePdFLfhKyRdSXuvY3AHJd4CP
 4JzW0Bzq/WXY3XMOzUTYApGQpnUpdOmuQSfpV9MQO+/jo7r6yPbxT7CwRS5dcQPzUiuHLK9i
 nvjREdh84qycnx0/6dDroYhp0DFv4udxuAvt1h4wGwTPRQZerSm4xaYegEFusyhbZrI0U9tJ
 B8WrhBLXDiYlyJT6zOV2yZFuW47VrLsjYnHwn27hmxTC/7tvG3euCklmkn9Sl9IAKFu29RSo
 d5bD8kMSCYsTqtTfT6W4A3qHGvIDta3ptLYpIAOD2sY3GYq2nf3Bbzx81wZK14JdDDHUX2Rs
 6+ahAA==
In-Reply-To: <20260806031732.10242-1-chunjie.zhu@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0022.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BN8PR03MB5009:EE_
X-MS-Office365-Filtering-Correlation-Id: ee720e00-172b-483a-e881-08def3a9da3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|3023799007|56012099006|5023799004|11063799006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	BX95SAXDWNVICk1QG2ta7bzegnXgdzlBWLxE9qH2++UPqC6GDzxeeoFBiO2iLA+l+T86AMjBsB7Uwy+BCT2bVMzty62XrA17JBBvfN8KaEN+W3PIOCf4MtiNXOYVRO7kGHTenqVPqYW5JMBMmu6Qz8Hx2W8n4a5aNcfbwpE4PW2hJ2xS2oUrburjh8T3gAYAY7NbSqdD/634e0SaMLG1xkvbkeaAccgxLTKp+tJaJWrwiprYbIKVwYNmJg9kz5nIqlvJ7BRcGaJACNdYSqBiXWLxcgdW6orMjnzBuOrt2PfvYxVbQ8QO/b2GkWrqA8F0HZ6GVlG4uj7Mz3JdJJqV35qx7lkUJUONPdaKmIMdEfJcvFPNb6KaYD9+DOsXsgL6WFiQm1nIdRoO1CvRdh2ul/YkYxXHH5pPr0Rvyd+dFxCGf6fp9zD8jEewUTopwfsTcD3ddEevq9d0uBLfSPMk0xpQe/krRDcOm7edkqOFhtaxDYNFn77anDMuaBFE66alXjC5tP66CIbQWFag1uLS4XfFi20mMHtqTD6bF0tcvqcYgBF9uO+mo1QGMAbu45481iZGl/q2NsNSzb2O642QovLj1ibVaR5jIxLeFg7Z962olwP3dchqr/c1UmBD0+ehJ6eIAp95BPn6bebWbqLyEsJ95WEwFwsV8uKgKr+T0WM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(3023799007)(56012099006)(5023799004)(11063799006)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHR0bzNlQmxwZmcvdFM0OWF5N3dERnNDcVhMVmpVQWQ4M1A4NU5jWjdadjNt?=
 =?utf-8?B?VUwwdHFuSUYycnViVklzV2ZpVy9yVVE2NzhHdjJSYVNUb0JBTTNnWkxXODFr?=
 =?utf-8?B?VjJqcXRzWUFIL0hYRmZCUWpPZTBWUHZJTGxoV1JvN3k1bzBlMUhpdmFVRXNi?=
 =?utf-8?B?N2ZqRDUvcyt3bWh5anZ2VWJNaGdLTkZvSmV5UmFweVZvVmxUcnc1NDhjVVBi?=
 =?utf-8?B?RVUyWHRYT1VhS2JJZ1I3S1EzbDk0d1RUNitLTFErUDV6TUhJN0JYRzc1OUxH?=
 =?utf-8?B?bkV0RFVqdW5OSzV5Yyt5MzgxdndxeTIzSFZMMUdPUzlqaUpTdVVHTThXZE1I?=
 =?utf-8?B?eXRlNGY5V2ppWHJ4MXhZYWZmWklaU0xhUUJFNEhRVnhtVnp6WWlTV2MwWFYx?=
 =?utf-8?B?dnd0c2NnSWlyTEtNNURObzdsTkVGdWlJSWNCeml1OGlTUkNNdUl3L0hHZXJN?=
 =?utf-8?B?b3FPSXlNUDRIMHh5N2dlQ2M5WU9YTWRGNW5kbG1kL3BDdVFDajhWN1JBSEYx?=
 =?utf-8?B?ZzJrNW81c055RmxhVDVjenNNR1hXbW5PYk01SmdCemx4RG1rZnZPc2xEQjhS?=
 =?utf-8?B?VG9HQnR2MlNXWFVzM1oxeDg5V0crc2tPM25RUEFhTHZXaDBzL1hpMVBLek1n?=
 =?utf-8?B?c210Ykl4cGRSUm1sNXhyN3FlS0pNaUh3MDhHWmc5ck8vS3Bhd1NwOWRoSXhW?=
 =?utf-8?B?UEllZW5ZY3hjZWpWQUVPVmlrR2I1aW9PVk45Rk95bTBjRmdXVnlIeW9rS1JP?=
 =?utf-8?B?Tjl2UGZ5VGFkelNvVlJYbzhLbHh0TlBwbml0RkVzYmx4MndlRHRtQmE5cnV2?=
 =?utf-8?B?bXBEc2dxTFJtREFEL2VkU3BQeGZ4OGRQaFp0SDdzdVliOTA5ME0xUjlWYlI3?=
 =?utf-8?B?Tm8xU3NkUUI5empGWVdZbGJwTkxvazc5bDdMQ1VpYzVvMkNMQWRrL2NZOHJZ?=
 =?utf-8?B?TDIzZEZ0QTNzQ1FHUkorTnd6bEdld21USUJYZVpZclRHZitrYUszak5Id3Np?=
 =?utf-8?B?cC9SaUh3bGZEWnJ2WTVsY2J5RXVtWVVhRnd0WTgrQUNYRXllM2RBdGFNUVNR?=
 =?utf-8?B?U0xxOFNuVWlpWVJhVUMwUTc0L3MrZk80clBRYTl4SkhhWWhpdXh0cy9FYS8w?=
 =?utf-8?B?SXNUTzBocTFLQjY2SDM0dk1paTQyVG9DRkRlR0VxSmYxZ1F3eVpVSVRRcU41?=
 =?utf-8?B?UzExWFZna3ZqdEVsQklBV20zZnRvTTNxdzdwSTlabkg2dnA2Y29yemdDUFo3?=
 =?utf-8?B?d0Y5ZUZjUmt4SGdtMysybGdEWUZmMHRyc1lIa2s3TWp6MFd1Ry82WmE1VmVP?=
 =?utf-8?B?US9tV25Dd3U1STZpUlZGSkYvY1Qxc2ZGRWJuTCtpREkxaEM3VHJhemcxTVdk?=
 =?utf-8?B?blNlZXFrZTViK0VFZW9mV2lJUFpQUXRoSXNwb3dqQ1Ezd2kwRGJWc0hHb2xa?=
 =?utf-8?B?djdEK25pZUlRUHA4OFNlZWNva1FUOEFrUWZXN3NvWm9Wam5qVzh5M2Y3emJn?=
 =?utf-8?B?L09QT3dGSkpxV2tmTmNCQ2ZBajRCTUwvQjEvbXhsU1V3dzJuV3ArcEZOcUlO?=
 =?utf-8?B?WTQ4d0RvWUJhNFE2Tjg4dzBySmU1dGprMlAyTm5Wb08yRGhIdnZWVi9GVGR6?=
 =?utf-8?B?cEFMWCtjTlh1bVk2SzUwRDFUZllTajhnTVhDeEFKWUtveVptdTFaVHErSnpM?=
 =?utf-8?B?eFJhMkhLWjR0MGc0WHNOTGNLR0FFcDZ3ZXQxNllnMERPbS9jd2FxS2gyS1k5?=
 =?utf-8?B?cVVyZCticWs0Y0NlWmhxYlJNdFNMZUtkV1VtV2dKdStOeE8xYWhWRk5OcVVu?=
 =?utf-8?B?WVZrRlFrbURveFR4NFpaSmRtcGJmQTR2QXlHU2xUK2h0UFpmZEFPYlpwU3VC?=
 =?utf-8?B?aUQvM2lOZkRWOTdTWGxPSko1SldiVDFCblVmb01TMFpuZEN4QzZaSXZDNVkv?=
 =?utf-8?B?cTlsVkNUZ1JZM3VlRExKZkp2OURMZWIwOGtJb3RJR2c4S3JqVWkyTFdyblh2?=
 =?utf-8?B?eHg1NlFVNWluNDkzOW04aVpER3Fmb29rR2ZiUDFkZDhON08vakJSS05jUFV4?=
 =?utf-8?B?TDVKL2JIeTlUY1hDZnVFSjZRdDZvOXF3NzhlK3poRGJXdHRjcEZXamRvOWVH?=
 =?utf-8?B?SmZtbm82VllrMGJnSVNFMFEwL0tkUm1mTDN5OWJpaWFRc3F5Zmpkbnp3NGtv?=
 =?utf-8?B?TUs3UitvWVVxVmVRK1d2Y0VQa0JaTG0rS1EycWg1Rk9NTmgxMDJ0bWZxTjNa?=
 =?utf-8?B?ZGl6N05EbHhYZFIyUUxHeVE3YXo4NWJhUUsvWXNrdTgzVitqR1g4SmlVcXBF?=
 =?utf-8?B?TXBaVnJxWFhua3cyTExUbmtzU1phbXhBNTFld3N0OE5oeFl1VThMUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee720e00-172b-483a-e881-08def3a9da3f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 10:59:57.0560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T60YekYCeS5qEIpYwVwc5V5fumLbO9EI2tMvM9GH1P5qS34enDdRpROebXhU4cLA3CeMeNkMzu8WywBZ61dnTiJ7mY5SiKvH8WZ6HR0T2zQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5009
X-purgate-ID: tlsNG-16d1c6/1786014000-F72C677B-10A13D00/0/0
X-purgate-type: clean
X-purgate-size: 3058

On 06/08/2026 4:17 am, Chunjie Zhu wrote:
> Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
> ---
>  xen/arch/x86/hvm/svm/nestedsvm.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
> index b06124c2c9ed..815713b8b506 100644
> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
> @@ -449,7 +449,14 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
>      n2vmcb->virt_ext.bytes =
>          n1vmcb->virt_ext.bytes | ns_vmcb->virt_ext.bytes;
>  
> -    /* NextRIP - only evaluated on #VMEXIT. */
> +    /* next_rip is consumed on VMRUN as the return address pushed on the
> +     * stack·for·injected·soft·exceptions/interrupts. This assignment
> +     * statement must be enforced, otherwise, it might cause vcpu wedge.
> +     *
> +     * APM Vol.2 Event Injection does not specifies what happens if NEXTRIP
> +     * holds an invalid/garbage value.
> +     */
> +    n2vmcb->nextrip = ns_vmcb->nextrip;

The old comment is indeed wrong.  However, this comment is distinctly
out-of-character for the function too.

As for the text, your subject probably wants to be "x86/svm: Sync
nextrip during virtual VMRUN".

The commit message needs to say that the NextRIP field is consumed
during event injection, with the L1 hypervisor being required to
configure it appropriately.  For a garbage value, the APM does say; it
states that nextrip is always what's used for traps.  Nothing checks
that ->rip and ->nextrip are within 15 bytes, and you can it to
arbitrary values and hardware will put the value on the stack.


Finally, there is a fun problem when running an L1 hypervisor which
can't see NRIPS on hardware which does have NRIPS.  In that case, the
correct sync is actually:

    n2vmcb->nextrip = cp->extd.nrips ? ns_vmcb->nextrip : ns_vmcb->rip;

because for event injection the L1 hypervisor will have had to move
->rip forwards for anything with trap semantics, but the real VMRUN will
still read ->nextrip even if the L1 hypervisor didn't know about it.

Note, we don't actually have the cp->extd.nrips field yet.  I need to
dust off another series to get that fixed.


NRIPs has been around almost forever in SVM terms.  It was also a
breaking change when AMD added it to hardware; while you can ignore the
field for the purposes of instruction length calculations, event
injection still requires it to be set correctly.

We only offer nested virt on NRIPS-capable hardware, but we don't have
any interlock concerning the guest visibility of NRIPS.  Given it's age,
I suggest we don't try and care about guests which can't see NRIPS, so
our safety reasoning becomes:

* Nested Virt is only available on hardware with NRIPS
* NRIPS is required to be advertised [*]
* Therefore the L1 hypervisor is required to set ->nrips correctly
* Therefore we can just do a simple sync with no conditionals

~Andrew

