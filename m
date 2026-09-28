Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE14CA5FA2
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 14:43:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436106.1654880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBCZ1-0003Vh-At; Mon, 28 Sep 2026 14:42:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436106.1654880; Mon, 28 Sep 2026 14:42:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBCZ1-0003Va-7E; Mon, 28 Sep 2026 14:42:43 +0000
Received: by outflank-mailman (input) for mailman id 1436106;
 Mon, 28 Sep 2026 14:42:42 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xBCZ0-0003VU-5v
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 14:42:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBCYz-00Gpa3-9w
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 16:42:41 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aba7cd7-8faa-0a2a0a5109dd-0a2a4508a6b0-32
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 16:42:41 +0200
Received: from [52.101.61.23]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aba7cdf-f659-0a2a45080019-34653d176c8a-3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 16:42:41 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ2PR03MB7377.namprd03.prod.outlook.com (2603:10b6:a03:55c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 14:42:06 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 14:42:05 +0000
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
 b=aqeNEGq8WkxApvTmMuWHPJxNQU/OVIs4rX7y71+i54IttSYSVsqlP8uZGaBd7DwSmV1fJEsc2VasZyZe9M+Dd8mOXqT+expM7a/OqzGS1OBBLi/D5lopHC/tr7g8eAGZjwjQifJOwsz5VveVcUQ5f7VJg8udyxROnrxNq4ShE5uvGeh4PahwNJC1IOERdlMvYd+/oJWwbdoo4c0UiAb1ai+oJyoadQnX2JhDmt7P43CCauqg9PCk7ZNfXh77eFnIsKvhP0tai8AI7PxqDD3lVLug3px6KsE6E58oQS9PBchywjofvSFblLwUt7M3k2GSWqmHzY3ijqO4ZMIj0k40aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AlXOIdTiMeboMgOOjLkWI1xHAQpePQiNTlohUdjw1w4=;
 b=tEOLIXF+QeESwhTqxTvc1/SubidRttZ/KKV6ZtmGnie87cM0Km1Lny/WWFe/2QckDF6pA6B/g6SzBTOHIso59KJYS206nxa6e6hwlARCVAAjGPywFpgH2DCcVnx2CJjJbAo9xYJivikN7aVKfZYo5ZGjwmADd6GRtPAqp9UGzr8siXoaNI36cpPsiVZoB0hH65cBuNjfESluTLYT9HtaZyGJLXOjDd1gzbvTherOTGyD1lKnX4akAy5+mra4Xz+xW8YkabmGGrj2KIjZDhYdwsa8Qtok9GkhGuFvWCsZ7zCGA36FlabKDjDVn/lwvebVh0h7DKt7eJeFQHP0ekDdtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AlXOIdTiMeboMgOOjLkWI1xHAQpePQiNTlohUdjw1w4=;
 b=ah3H4XXziV7/7p7RJAGyfHL6a+mBkXKglVjhXMwfRIjKaiEvGlEue6kHfPo+25YTWd8RTG4Im27vtG1zVjGp8/E3gN6WCDSo4qnkma6oftFTU9QzwxiJV11qCVfY5wOSMRhlHU44gB7+ZS8SJoumnVrrDb7bCsLOaXA15+TP/7M=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <96e3f9ab-3838-47d1-b936-88bd85a68ca4@citrix.com>
Date: Mon, 28 Sep 2026 15:42:01 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, Teddy Astie <teddy.astie@vates.tech>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Ross Philipson
 <ross.philipson@gmail.com>, trenchboot-devel@googlegroups.com
Subject: Re: [PATCH v4 21/23] x86/slaunch: support EFI boot
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>, xen-devel@lists.xenproject.org
References: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
 <e29edd81eeb55927fef2c56b7493a8db65edfc90.1785668458.git.sergii.dmytruk@3mdeb.com>
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
In-Reply-To: <e29edd81eeb55927fef2c56b7493a8db65edfc90.1785668458.git.sergii.dmytruk@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0290.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ2PR03MB7377:EE_
X-MS-Office365-Filtering-Correlation-Id: 66f8577d-219e-4372-d170-08df1d6eaa40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|4143699003|11063799006|10067099003|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	t6y3lnJbCw6nPr+1WiSB+nSZ1mXIx5DkWpfSuXppJuS3pju3NzOsmHTEjJEpEKp+IxelNSLiG/Pzz1dDybTpl9M4Y3mm/AmC7ygm9RFhGX6hGhaJ8DpwNo/soHj6a+eWFGOMmudsp22ArWnJgRSu4S8/3qZCjQaAtdiKJuBGlVLbPyHCRXWWh2jPOY/S4JAWQP8Bbt9uCSD0S0a3IJLGArhaZ745J1umaqOXaaiIAto16bqZBZutTdA+/Ova1qMAbDG3jFtzQTe98KA+687+PCTJx4doUJt6q24hWLUoLZQ54HqN5rJ8o9vV1A6annHLZR80880YnPQmMD9orSeKbaTGHHgGbnmCPyMjh3ZQTuVVcg3dASXZdwAhIMoh5acVZmM7AqRh3w6bws+hV+vr0B+idBGgWcU5wbGSUbyWXxcVtYHT+EO/NxoL+4Ctv2EqwEvtXK6jeRjui8KLUgyJns7wWAPkIfCa4rDgyainiSFaa2YqzGHuz9iM8+woI/yvcT8dK7ez/0cWxAndcvh7aH4BJWo0iq6/4exH2gRsnxUrDYgjKjqtJUVszznEFjrwvgz+kuJQeXSAyPVfz8/z3eoV5mJpU+KZowJRlHnY4ucPGROjZokqttMtZBIA6dSRLstfZFE6oxQQ0UaIiW+2mDdJIqqtwPD2qK1cUXjkBpc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(4143699003)(11063799006)(10067099003)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGFsUkF3NWE0V1QzSHZsbTA5VTR4Y1ZzRWJ1a25VaG8ycEd0SWdFa2orTnhs?=
 =?utf-8?B?UWdVY244UFMzbmM0ZnEwenNYMnNmdGd6NUxIbUphdGhZeFJ6UkVrZWhnTEJH?=
 =?utf-8?B?VmxqdDhndDJweGJCbFVRWVZkWnZVUk1ldVBqN1RkTHpJcFhsTmZ0STN4SWda?=
 =?utf-8?B?alFLTVQ0TVV4RDNhcFVhWmNLMnYrVzJYNkNNcHZsSlpUV01wUzFiaW12T0V3?=
 =?utf-8?B?OVcxR0hFR0VPZkEvdHBqK2REdFV4VWJPS2lySE40c1grU0lKbWdxUU9NL1Vp?=
 =?utf-8?B?OGNBcmNMUVVFcnF6UEtFVjB3R3ppb2xBTExXOTc0c05HOUhvck9YeHZhQUNX?=
 =?utf-8?B?QnpCWWg0OVF6QTN6TXBuZU9YTTVlL3E1UE10aGZPWWxLUkcxdmxaZEpJMXN6?=
 =?utf-8?B?anVUTklyUXlEbHp2OG9UdmVmQi9kMHAxMThVN2wrOUxXbk41U2pUUXdwSmpO?=
 =?utf-8?B?QXpwR2xvNTlDTktxQUI3eUhTdUM3NG5KVlZtdW5RRU55SWhrRkkwQmhNRnNJ?=
 =?utf-8?B?bW9VaE90djZTT2lreEJ0dmRNSDBFYm5rcitlYmxMbmw5NHViV21oUnVZWHdO?=
 =?utf-8?B?VTBoMTlyeitFbmNNSzNPNDk4bWNyekFEeENOSnBUYjlxSVRnYmFXeU9uSDJ6?=
 =?utf-8?B?Rm1WWnFlOFNaKzVyaDB0YVRoZmVsV24rTVFQRkdPWUM3NVpYbXBxVG0xZmZ3?=
 =?utf-8?B?N2lEczFDZUJ2WUwrdkpNTlJqaTJPRWJFQVZYamxRRk1pc0tVNGprMFBoQ01l?=
 =?utf-8?B?T3lwYnVoUFVTZ0VvaWJraG0vRmhpYXczRXhHU1c3NllhVkYxYStXOVVFU0JT?=
 =?utf-8?B?UTYyd3VLZWo3bVB5QTFJb0hBVFpTUW8vWlJCYzNCS3Q4Vld6am03WmkxejVn?=
 =?utf-8?B?OE5IdEFlY1c4RktoL1V1blowcTRHRVJxMjRjYm1MYTJUSE5PNDJlZjRwTFhi?=
 =?utf-8?B?ZzJ2Q3FBQ3JieGFEVU4wWTRRSStYQUZwRVdRTmNmRlZaQWNuV1VqazBtMHdT?=
 =?utf-8?B?bUgxMG0vY21ablgwUXpwM253TDBJQTQzU0xEK2RDQzRYc3B2Wng0QUFwNXRw?=
 =?utf-8?B?TmFSMVN2bWU0dEpjUFdHakFSTHhSRFRFQ3UxTld4TlpEVUZVaExOeEZKK3BF?=
 =?utf-8?B?bzd6VFREUWNXUDg1bUE5L0tLR1k4ZzJGM2hKaEZUQzRBZVZCd0FCRnBaeGdx?=
 =?utf-8?B?dERZczBTNWhEOFdOcFQyODhsRGRZTFFiSkVPY3FiMTJ3ZFpLMVFCL2hqTnRD?=
 =?utf-8?B?cGsvRnFpbWNRdXhiSFhJR0dDRFpTeWwvL2JXL3h6VFJ2WkJZY2pDWVN1YzhY?=
 =?utf-8?B?Y3E2Y3lNWURNVjIrSjA0Q1R3ajdsZU9HYU1aTytHZmVEejRGUTNvU29tSTNp?=
 =?utf-8?B?bnZ4TzQ3YTNlVmh5OWZkRDN0T2Q4NTlOeHpYMDExemFxOUEvcGlMcjVwRk5z?=
 =?utf-8?B?L2djTlpBUE12L3BBdGpsZnBaVjhnNVE5czBXdGEySzgycHZVa3NPOTllUHBa?=
 =?utf-8?B?SnpkVXpIaGVCbVcrVUx1RUlxRk50VHJ1T251QkFWSXNIbGI3bHJCQW9zOFVX?=
 =?utf-8?B?UVZCRzIxNXRsSGsrR05TdEdNR2ZlTDM4bUNFRDdJN2FCTlNEMXZFTFFHQ0Z5?=
 =?utf-8?B?V1RuTkdlMDVQcmhDNTh3ejVJVjFSc1kyTnpkTXJFcklHeE1Lc2NtSlNwV0ha?=
 =?utf-8?B?WDU2REFRenM5NGEyUzdlMEZyVWFWcFB5M1p2NTlOWkVKcmFwTnNFS3MvRm56?=
 =?utf-8?B?MzhvZ3Y2c2lyMjMwNzh1Z3FJeTA1TnkyV0UzZ0dPYTZMNWx4aHNwamkxV0t1?=
 =?utf-8?B?aVlHT0piZHdETVVxVEFxdHdLZjg4a05uUU5IdHcyS0RNREdnTjFjWDJzd01P?=
 =?utf-8?B?QUpqQ2NZa2twZjhZTlBsaHlRY2ZiRFRmRkE4b0ZjVkFhSUUycjZUSWdhV1N1?=
 =?utf-8?B?cnhQWGFEdkdEaC8rZ3JPRmR0MUlydmRRR0tjOWVSUjVxa0NXdVV5ZG40TFpW?=
 =?utf-8?B?b0oyWXFzNFk5L0sxckJvUXBaa3BLOE5zclVFZjVaRGJQdDF3blAwUVl1cnRn?=
 =?utf-8?B?WTNLbWJRUnZveC9GOTJueGFhQ3pweWVQNUFZcXhjNTFVbFRvbzRpSlB4MG1s?=
 =?utf-8?B?ckRUZ3JDNWFWbTZkMWRzL2xyeStDQ3pXazZjT2U5VFZTU0xyN0RRQVRlYldT?=
 =?utf-8?B?cFozajByNldMazd5MlFOTkRPMnFSVmdFSmFrbXR1SkVpZmlPTUYvVW95aXYw?=
 =?utf-8?B?RXBPT1B1aTNQbTVTKzIvR2pOUTV3KzdlRllub1dHZkNFU3hxR256YUVEaWVC?=
 =?utf-8?B?WkoyS042TURvd2xKSEtudHFPNEIzTTE1K3B5dStlOGpXQURPMlAwQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f8577d-219e-4372-d170-08df1d6eaa40
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 14:42:05.0623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dof1/tFiFgkr19Rfh67jqhb+VYyX2lCV5CdO6NqaD2fF5R22mwQ+yh7qxbAJ8rES6z9w1OPHa/hRjruc4rlm8eEv3YpI6Gnd300zg62SKCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7377
X-purgate-ID: tlsNG-c1860d/1790606561-D6B4187B-0278AED5/0/0
X-purgate-type: clean
X-purgate-size: 4205

On 02/08/2026 2:09 pm, Sergii Dmytruk wrote:
> When running on an EFI-enabled system, Xen needs to have access to Boot
> Services in order to initialize itself properly and reach a state in
> which a dom0 kernel can operate without issues.
>
> This means that DRTM must be started in the middle of Xen's
> initialization process.  This effect is achieved via a callback into
> a TrenchBoot-enabled bootloader (GRUB) which is responsible for
> initiating DRTM and continuing Xen's initialization process.  The latter
> is done by branching in Slaunch entry point on a flag to switch back
> into long mode before calling the same function which Xen would execute
> as the next step without DRTM.
>
> Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
> Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
> ---
>
> Notes:
>     v4: -DXEN_BUILD_EFI => -DXEN_BUILD_EFI=1
>     v4: use CONFIG_SLAUNCH
>     v4: use pointers to `const` SLRT and TXT heap data
>     v4: use container_of()
>     v4: take updates to `struct boot_module` into account
>     v4: now UEFI_SLR_TABLE_GUID is defined here in efi/boot.c
>
>  .gitignore                                    |   1 +
>  .../eclair_analysis/ECLAIR/out_of_scope.ecl   |   1 +
>  docs/hypervisor-guide/x86/how-xen-boots.rst   |  14 +-
>  xen/arch/x86/Makefile                         |  12 +-
>  xen/arch/x86/boot/head.S                      | 124 +++++++++++++++++
>  xen/arch/x86/boot/x86_64.S                    |  14 +-
>  xen/arch/x86/efi/efi-boot.h                   |  94 ++++++++++++-
>  xen/arch/x86/efi/fixmlehdr.c                  | 127 ++++++++++++++++++
>  xen/arch/x86/slaunch.c                        |  75 ++++++++++-
>  xen/common/efi/boot.c                         |   6 +
>  xen/common/efi/runtime.c                      |   1 +
>  xen/include/xen/efi.h                         |   1 +
>  12 files changed, 455 insertions(+), 15 deletions(-)
>  create mode 100644 xen/arch/x86/efi/fixmlehdr.c
>
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index 8dbb76a3a0..4f7db9420e 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -89,6 +89,7 @@ extra-y += xen.lds
>  
>  hostprogs-y += boot/mkelf32
>  hostprogs-y += efi/mkreloc
> +hostprogs-y += efi/fixmlehdr
>  
>  $(obj)/efi/mkreloc: HOSTCFLAGS += -I$(srctree)/include
>  
> @@ -123,6 +124,11 @@ $(TARGET): $(TARGET)-syms $(efi-y) $(obj)/boot/mkelf32
>  
>  CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
>  
> +# Expose this build flag as a macro when compiling assembly files.
> +ifeq ($(XEN_BUILD_EFI),y)
> +XEN_AFLAGS += -DXEN_BUILD_EFI=1
> +endif
> +
>  $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
>  	$(objtree)/tools/symbols $(all_symbols) --empty > $(dot-target).0.S
>  	$(MAKE) $(build)=$(@D) $(dot-target).0.o
> @@ -196,7 +202,7 @@ note_file_option ?= $(note_file)
>  extra-$(XEN_BUILD_PE) += efi.lds
>  ifeq ($(XEN_BUILD_PE),y)
>  $(TARGET).efi: $(obj)/efi/relocs-dummy.o $(obj)/efi/relocs-empty.o $(obj)/efi/mkreloc
> -$(TARGET).efi: $(objtree)/prelink.o $(note_file) $(obj)/efi.lds
> +$(TARGET).efi: $(objtree)/prelink.o $(note_file) $(obj)/efi.lds $(obj)/efi/fixmlehdr
>  ifeq ($(CONFIG_DEBUG_INFO),y)
>  	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),echo,:) "Will strip debug info from $(@F)"
>  endif
> @@ -230,6 +236,10 @@ endif
>  	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $< $(obj)/efi/relocs-empty.o \
>  	      $(dot-target).2r.o $(dot-target).2s.o $(orphan-handling-y) \
>  	      $(note_file_option) -o $@
> +ifeq ($(CONFIG_SLAUNCH),y)
> +	# update entry point's address by taking image offset into account
> +	$(obj)/efi/fixmlehdr $@ $(XEN_IMG_OFFSET)
> +endif
>  	$(NM) -pa --format=sysv $@ \
>  		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
>  		> $@.map

This has collided completely with changes to how we link Xen.

Also, as a general rule we don't like post-processing the binary like
this.  What's the real problem trying to be solved?  Is it really just
the address in one field of the MLE header?  If so, why can't this be
fixed by adding the offset at build time?

~Andrew


