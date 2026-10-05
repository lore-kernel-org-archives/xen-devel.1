Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A84CA5FF0
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 13:39:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440877.1658395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDiuV-0005vn-EU; Mon, 05 Oct 2026 13:39:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440877.1658395; Mon, 05 Oct 2026 13:39:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDiuV-0005vg-BA; Mon, 05 Oct 2026 13:39:19 +0000
Received: by outflank-mailman (input) for mailman id 1440877;
 Mon, 05 Oct 2026 13:39:19 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xDiuU-0005vY-UA
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 13:39:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDiuU-006HIJ-B1
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 15:39:18 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ac3a877-bab6-0a2a0a5309dd-0a2a4509cb50-48
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 15:39:18 +0200
Received: from [52.101.43.17]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ac3a884-be1a-0a2a45090019-34652b117a46-4
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 15:39:18 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB7962.namprd03.prod.outlook.com (2603:10b6:303:273::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 13:39:14 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 13:39:14 +0000
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
 b=Nn/WAThzRYdZwJx5GBw5tKTCiw8KsyCxoiX3WBGJSQ1cimgxipMhHdlQUdVg/+F3iHN7yM19HWQzM31G6IzWuOiRXMEzjWQYlUR1Foh0h9L2/NJnPYmy+P1XaRkSEoxcAHc8AYZ6jpEVKE436Pa49FDbWFT1k4mx4tD5kwy/EOEi8urPINmv3thSX6PDtebpxBwk1n0RYoC3eXc9eb7EYNy3NNwrN/wqnVqup8kQaeJUsWKizaJihMksk8t7DoVEwTVULJ3QlLrgJLXzNBY8bRdt28g7cAOTM8+ZZ5gNy3PGkRASFaK91S3iLV6JsCl5Ccc331cgX+bPsqwV+9SQSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dmNsEdOjgKwjzyt+d3HSQI7dYPcctUGco0Q1rEmrgZw=;
 b=hrV41l/XVo/WEuN2yyUChfKaUA/XIT40eoym6sfdJ62zt0KiJzrpUBUX/oLrWVjT5YszPhfDUjT5rT8wHZZPzGMpWcCtFbio+i+QtzeMzyOprhOvQrpBFzDS6CFwpD4fPPn9C31bWecXt9fAEeDC7T87FWm2QN6lY0fPEGcrsikprRGHK2o9cvoHsahXk+GPrRAWIxx5nJ5YjeXWOVeXmUTnvi+V21TaMxvCeHcSabuAlZdi2aH0T7Bjawe9LoJ0m3JTGzL2jX1AAwpTZJw2G9XRLGK8glZ7sZHuVgKzBETq0Lgw+AysVRPGwhz106pw67RDQPiqfm8yTbRxso82Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dmNsEdOjgKwjzyt+d3HSQI7dYPcctUGco0Q1rEmrgZw=;
 b=ZiK+MeNVVJGwUjuJ7rD/UD4axE2RJX/fKs+ut7WgxTOlwKO7YcaZYiY04GhLkqbmr6Umuwz6YlSkQWFcsk5AuH50H00HoYzEmpJs8/XwUQmYRzrRI9LzUJtutYQ52CKc6iEP42788UGsJGfw/sRzy5lqV5hpnrH8rgxKYUAG6IY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <277f7edf-bc9c-45c4-9769-6aafcbc5547d@citrix.com>
Date: Mon, 5 Oct 2026 14:39:11 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH 05/12] x86/crash: address Misra 2.1 rule violation
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
 <96de425a-29f7-4759-8466-b72bbe40b90b@suse.com>
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
In-Reply-To: <96de425a-29f7-4759-8466-b72bbe40b90b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0001.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB7962:EE_
X-MS-Office365-Filtering-Correlation-Id: dc60b715-5b5e-4b5d-3b5a-08df22e60b9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|11063799006|56012099006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	bfVJSsAZCAVfhkjjuwFkegffIzSVvzvUTSpHZgfV3q5lRe9zJv85buqgEvqkgg82oMxmHRNMsrYhr43UBqAxbngIk5Jkcx/ZUaHT0wPkpNkodTcnJdgmf5lj27yOaCplSI1ul6LvlSyV615p/g+dCk5wUmvcZ3Ma9/BnfY2QzzxcGXDGytoGBy9KCDctZksBxY4AkBsBllDpOb7GToMFbn3VQvvypmy2KEl+PolKy+ULCXAyjqcQCG9vDZiutMc0fijYU/g43EWSsdoNTp0RqXk69gX7jGYk7XwC2cafQaZJ1UzRg3QcmMX9RnGh/2YHAozU2vkM7x8DXUVtwCh4WomRD2sNbhMfc5/leOw5zLyebb3ex5ju7pIzMy8ScLRYzVg+iADd4EHnYkYI/Tg3yd3Z0vG7+G7OBjhFgUQa2cCPJaSC3lf/Q90IznZZ5qLkXhj+1/PfL9QkUjOfclb+kgWD87CLbKlMijmeaFt8joXO9QwO21mliB1h6GvGG+kLJAb/EZ9BCPwdLyFvXIoUxn+ytViBnuPQmdB0S7qoknNZ1YbocbmrBdZTwVC2+nn/Zog2n6+KSldV7/GWnTvyd0SFNzAWy6peRxlTeFBfxnmRWObDQPb0aZZqdIRQ5Rld2C15T8J1uOLDLTyW4xynhg1RXzJem9N0FzTu21sTKM8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SW03OEFpNis3M1dlYU40Ny9uMUdvNjZ0UWpheDIzSjJLL3YxYlNjWUFIaE9T?=
 =?utf-8?B?NVRUSCtlNEdYdG1LUlk1eXlweEFNYmpjaXpaRzBsZ1FpeDNJcUVNU1JIcnBy?=
 =?utf-8?B?cmxWWlRjd1AvR0laVmZDNDdXRmJ5K3gzVUVRNFY0c3hoZjhmTitVc3diTUhD?=
 =?utf-8?B?d0NnM0xYRUxrVkJBTUtGc254bS9nQTRUUGNhN1oyZ28vT1oyTGxFaEhjNjZR?=
 =?utf-8?B?Z1h6bkFveThta25CdDVNSUFOS2FzRnF1RG1wUzNKTlJDZ0pBbnQxRlloRkp1?=
 =?utf-8?B?WnhzUkhZbkNqa1JJSVpGakVsYThuajZ2MzdZd0pSWUJtZGYyRjkzRUpKRU93?=
 =?utf-8?B?ZDkzQjBOcTEzR25Qa3dlcDczMEY5RlAwSkFNbzlmU2xKWjRXSlpVVmhEazBx?=
 =?utf-8?B?SHozL3hrTFBLUkxiZXd6L1ArREUrZkVxanRnTnRXSkIzNWVqVlg5aWwxOU9j?=
 =?utf-8?B?Y0ZxeWExQXgzbFQ3ZlJtZ2E1N3owUnA2MzE4NnliU2pSak05VVJyQUJOUEZF?=
 =?utf-8?B?MnhlOXpjeFdLZGxzTXl3QmNkbU9mNlVDN3UydHcvRDhtYW5lbGVUb2liQmpj?=
 =?utf-8?B?OXhuKy9pN1h1bUVNUjEyYXE3V2RHTEFXMXdScERDQ3FuUHhyaDc4QnBJRHlm?=
 =?utf-8?B?VjlaUjBtQkZndjEvcEhmdXBYSzRhNTB0ampOdjU3b09DdHNOeDhwUEFGVGd5?=
 =?utf-8?B?MG9BNFg1RWFhNUZuVXJaVExuSEFyT3VLajR1NTZ3azRQbkF0TTBENGhDUk0x?=
 =?utf-8?B?VjRYQ1VmNHhSM3VGMEJkSGxlY2NNODNabE8vcWxab1VlcG9nOHlrVnpsYU9l?=
 =?utf-8?B?dE1PbEZuNzM0Q3hLMmhvWmJSZi9XREgzTldDVUFsWmZ1djlWMWM0TEpWeWNv?=
 =?utf-8?B?bXVPcVIvL3lYV3FzSkZaZHB0UGd3N1V0bUpkSHZJc2FTb3lKbFp2bUpMdmlK?=
 =?utf-8?B?cWlqZTUyUHNqdjJqbjFCeVF6aGFKT2J3c3FpajZkVUlKRFh2WTAxR2RzT2Ex?=
 =?utf-8?B?TXFPbEdpTjZBNm9IRUk5Z2ZJU2xIMU1raHFpeWhqdXBDdU1rdVRuczFVUk83?=
 =?utf-8?B?UGF0WU5FMU9SQjZoMCtnYmpXY3FiQ3pWdXBuVnFUSFpWVDVVZnh4bVhvNkpF?=
 =?utf-8?B?dXo5dUMyVERURGNQRjg0eElPemJmNUd2NmZMbU5DYUxXMGcxd25wb0FEdWhu?=
 =?utf-8?B?OTZUYUxIeXZOdlJRcElZbFFiakpvNEhhV084bEk4NTZDYWRTdW5JSEZ6bjBT?=
 =?utf-8?B?YUszVHFJWURtUWVkMGorQUx0b0sva1Z0UmZ6cFQ0QnVZOTh2bGlYaFNCR1cy?=
 =?utf-8?B?NDRCRkV2Qmd5a2I3QmJNcFgxTnVDQjRFWU5kejFFclF3d2lmVUhPcVhVdzRw?=
 =?utf-8?B?NUF6Qmk4czNaNU0rNnlRMldjTDRENC9yZXFqdk1BK01paHBWUEY1bExHOXdC?=
 =?utf-8?B?LzgrcnY0bDM1NldVMzVjbEdCdllmWjMzOHhUclltdzVqKzU5QnBVTUQwL2Ju?=
 =?utf-8?B?QWhuS3Qxdi8yQmdscHN5SXBySEtFOEtnZ0NiSUdCSGxnMjFDMFV5K1Y0ekhU?=
 =?utf-8?B?dVZQS0lMV3pIRVh3YWQvaDdkK3RPU1M1UFIxVkNYZDIvTnovUzVoTFNyZzFo?=
 =?utf-8?B?a2ZKY1E3UGg1ODlHV1FpelNCNzZCU1lISDgyNWJaaEFRMit2UnJFcU1mNVlQ?=
 =?utf-8?B?NXg0eE5QSkxPSzVRbGJBckJVTE5pQnNEeHd3aUhRSzVXZCsrUldHa3k5aDhR?=
 =?utf-8?B?NEg4U3lRam9wZ2JUbUh6TFBmTi95THBCUEFxQWtzWTNLREs3R2VMNDFSUWtK?=
 =?utf-8?B?WXZhOWJ5alQ2UEhOSHVGRkNTN2JTTGI3cWd4MXEzQTBKbGcwbHlHbENTM1BE?=
 =?utf-8?B?TElZWGh1VzJoRDFoanlFeFRHbUwvcVZ4RW93ZkIrWitjNFAweU5SeFhaeDZj?=
 =?utf-8?B?c1l5M1ZsWU9vUUQ4b2FjdG9KZTZVUG1CdlNPaFgwUXFJT0pMZTA4UHRpSGdo?=
 =?utf-8?B?Y09EcUJ4ZGcyODV4UThTMW1tRXI5L1p3SHpKUUpyeFYyaisrdVRPMzFuNFdz?=
 =?utf-8?B?dkhvb1NvMGRxVmRicThpaEgwT1JLWkl3RlpDTTYrelhldXJTQmR4TnEydURr?=
 =?utf-8?B?Nm02UUpkMkJzeHVLVzRqdWFtZmVXempBQ3FRaGduNTIxcGVvZk1zWFVrOWl0?=
 =?utf-8?B?eFduV1NRcGdzTVQ3alM0TFNPYndSb0FFdWI1Y3BLS093bUxPTVFWS0NzZTBX?=
 =?utf-8?B?RjZoUkMyaFpZRGhqc3dvdG1lYXlnaC94WXJuSm1UR0l6T0YvaVA3Y29CVXZN?=
 =?utf-8?B?c1NzNnBjNThyVytoZi83aGtZRU5YQ1lDY1g2MlUzNVUyMmdJOVh2dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc60b715-5b5e-4b5d-3b5a-08df22e60b9a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 13:39:14.4013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XkVeuDk835zUrZIpQe0TbJyWzTLIp17OR5UmWZn/LcdpyOiacdwckypDjZXP6zldoVcSPj7ochLZylccBUHo9ijLI4B1OOKoe4ifdHcKeJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7962
X-purgate-ID: tlsNG-bad1c0/1791207558-3A2C4034-F5C3DD95/10/78276251493
X-purgate-type: spam
X-purgate-size: 322

On 28/08/2026 8:02 am, Jan Beulich wrote:
> The use of unreachable(), when unreachability is visible to Eclair (and
> compilers), is deemed a violation. Drop the redundant statement.
>
> No functional change.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

