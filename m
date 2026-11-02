Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7CA606A324
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 20:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=Msw0bhmc
Received: from list by lists.xenproject.org with outflank-mailman.1468834.1677880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNyjr-0005lt-Be; Mon, 02 Nov 2026 20:34:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468834.1677880; Mon, 02 Nov 2026 20:34:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNyjr-0005lm-86; Mon, 02 Nov 2026 20:34:43 +0000
Received: by outflank-mailman (input) for mailman id 1468834;
 Mon, 02 Nov 2026 20:34:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xNyjp-0005lg-6R
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 20:34:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNyjo-008V3f-58
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 21:34:40 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ae8f3b7-8faa-0a2a0a5109dd-0a2a450297b4-28
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 21:34:40 +0100
Received: from [52.101.61.14]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ae8f3de-6ca4-0a2a45020019-34653d0ef6b1-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 21:34:39 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB7819.namprd03.prod.outlook.com (2603:10b6:303:276::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 20:34:11 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 20:34:11 +0000
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
 b=ozR0zRSF2dMyTnsEii39pECfyiREhaPKOS70CO8+whGsOFwyMxCRMvWrFu0OWsRqH2zBILfgkG4/HIzQw5X/VVcvCsS54UN0o7k/MVHuaEBBMCZXpHcC/c8N9Ru6L/baNE0TywA8f6RukK41bZeIMoe2/DwZwkFqLz3A10wQkOa9FW9oe9qOVy2AQKRdZCbMDvagWAlPzIZVobQ1D8coub00AJuCeig7vdm/lGXd6BdINiJPViHkYLiU6h0ymD0/jIvhNjNId5NSCF+KLZJP9Lq9+byHc7pO0b/LdzSkGqQ5ko+B86ZdORom/vBYq7USUsDV0oBZggnJ3dsVdjuPhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AOh2F4HBlOh17uZPy/+N5rIfIqTcLvr2vaT14vKYoA8=;
 b=mXEhoAhZYII5SCeAqrqOiLteN91K76gGcVe8MxKaPTfwhtZp/zJ2r+cpM20gwpk/4sxj9WpxdKVzIqWSRRf6kEwuCZlxKUcXq4WZTVvEst4nYe+QgNOQwhI/SBnRhGYDcOuBN7m2V0RKFdf7CEWXbRf4koojH12OvDopfNj3I0KLLfGY4IhpV3LtZdEPMslmutaV9cIX0zM0fXmdp/0bQqRve1twA/ctHoQX6uUMp99TxTuRxnz/An8dDn1GIFlWat757lJLEmnLi0HiDj2iamKkUKiOThHwVWJLh9wsgqhxb9TVTZntlnXS6UUX09hCfXW/AVG1ZA4D7gQVRP+HHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AOh2F4HBlOh17uZPy/+N5rIfIqTcLvr2vaT14vKYoA8=;
 b=Msw0bhmcsF3ubYzhzchP46jbwaO5nkULkXLQv/M2qxfgSb6E93X+xOzkIlH5pgsUq148WLuFBvlLrLwWLM6wdbE67jYHgjmtJLeptS+xuo0hqyI8mEbONgPO+Zkk2MPXQSyFz4Ga4YP2UPuKG81vByCBdbK3RjE0jlboRLBHgtQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e499efd0-453c-4885-9e7a-388f21e45da1@citrix.com>
Date: Mon, 2 Nov 2026 20:34:07 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>,
 Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH] x86/svm: Adjust vNMI handling to update the cleanbit
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261102134621.1693316-1-andrew.cooper3@citrix.com>
 <0c81f171-7ffc-4a59-8f9e-69ad27371b96@citrix.com>
 <CH8PR03MB82743DC59D48A031251F71AAF06A2@CH8PR03MB8274.namprd03.prod.outlook.com>
 <7021681a-277a-4b40-9963-74e55dde35af@citrix.com>
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
In-Reply-To: <7021681a-277a-4b40-9963-74e55dde35af@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0127.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB7819:EE_
X-MS-Office365-Filtering-Correlation-Id: 311af24d-d15a-418c-c53a-08df3920a6bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|261021121427099003|261022105027099003|261022075727099003|261009223027099003|261026140227099003|261026121527099003|261028144727099003|11063799006|5023799004|4143699003|56012099006|18002099003|22082099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	3NcdyVq7qTv+MaOt71amTYvKaOftnmKpxpnMukqOrEuRbF2PD/3AqpY2PDfmrP4P6E7/v4aJhrTApUxnQw6UJuAMR8MZENo0OZmnBP8fuBMlOb+u5xBDVaNC1KVRFD6kmelKwAFzxRvaZc2/zWy3v+SsiggROzrQrgxIrT7SJZzu6vzM7rAq5w7N9O3Tl+Fnmg3PCgunS1nBWh8s+Nj61YgiQBhRBNljyR2yyJlwx2cebzQJZb6Y6gnznuAoL80nd3mV4SYmeH2mtDfrdlP9Lmg0nLBH64AVt4JluzJD6G4cK70xHTySOGB9dY7C8Sb13x7CfQG7KgEaC0c+kWGRNyCQ5v1Y4zx4N3HaL4gWqM+OY8v90hh3zDW967ue4R66g3dZ/wLOSe2O6WeDgkZPqY2UI3+93/tMQmYrvmprQFtYRcOoyzClzz1sZ+XmorMQj8TKd0KwHrlklzpE7giasnUXEjP449/ZcUTOFb59Z28e4cAxOpgymYy3w3sdEOLaP7uMtBcWW7UqLuyCvW+3BHPwbYSVbTjQuJDNf8NQUJ2fbdGMw4J/lwDd2+UQbGzg9EJZnByIja2kZ8ztjn675t/BRMIWWSIMbxEqpEd8wNiBoqkMnQGrw2+PzHgTukoueGYHVPUAKGwMR5Ml/aw8WWYnQcgD1VVdC50dxp5QXac=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(11063799006)(5023799004)(4143699003)(56012099006)(18002099003)(22082099003)(261102123227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFgvckVTckZ6cGtiWnB3TXZxazFrSmNnc2pLQ1I4K0RPaFpFcmVBdzZ6MUdx?=
 =?utf-8?B?d0tBK0lmcGJSdzZpbVV6aVkxajU0YkhmRXNiZlU4bzc1Y25ETVZhSUxaL1Qy?=
 =?utf-8?B?cFlWSTFWRUZrd2FPL3lnUHdSSjVpL1Q4Uyt1NUVaQ1FqaXVFV0E3QW1Dc2M3?=
 =?utf-8?B?ZHNCZkUrMytXWGNMWG9sUzNZdlpleVJPTTY5YUNQUVk1TG9uL0lDRzd5dzY2?=
 =?utf-8?B?QXdJRDlXRWRXL2U5NEtXSVJaSURybFBRV2hIblJwYXVjRUdSZmk1Tm83YjJq?=
 =?utf-8?B?SWxUNjhwNGs5Skp5NjhvVC9FSVp5UHd4U0RiK3ZLVjhWR294RWJYZnpuZlNs?=
 =?utf-8?B?SVNHeTczazl5SW9QVS9tdjZRWjg2OTI4TlRHekF3SmpOTWU5aEQrMC9VTVJ5?=
 =?utf-8?B?S0V2MEtLVUhSMTVPRWQrZ1ROd3pqUmRwRzE0Y253dlZ3bklZcnZESGl1MzhQ?=
 =?utf-8?B?NnYrS0k5SFhyelJWTUhDLzh4R1hXUXBrVVpQamtZOTZld3hidUw4ZXg1Tmgw?=
 =?utf-8?B?RXp1SVRJSXVSVzZXUTBtR2luTFdudEZaSmNtNW90VHpxMDFLN2lYbVZpczRF?=
 =?utf-8?B?aHVleUV4ZkQ0YkIvSFNITE1ReXhjSEpnNjdLUEl1OXJkN29kZTVaQTJOOEVu?=
 =?utf-8?B?UGRscWlGSE5VVlRhODhmTUVUS2djc3VZbVdKU0tLR1Vvd015VVBHR3k4VExz?=
 =?utf-8?B?Z210V2ZKVjhVd3pxak5TRDF2TjBDNmxoWlJhKzA2SFJjdE5ZM1B0clNKYnRv?=
 =?utf-8?B?VVl2dmJ1YVFLcTNXTFJEUFdRYVVma1dmZUY0M3lsS1ZpaVRnMUlyY3owK3kw?=
 =?utf-8?B?TFpaUGNudmhzR1FKYVVWVlI3UUZLeHFjcXNjS1kxcWxvZWcyMEpzUVBKaHE3?=
 =?utf-8?B?NnJnbDIvRmNBOVI0bHJuSVpUdnIzK3hQZEJMMFlhTlAva1JIM2g1R1NsdW5y?=
 =?utf-8?B?M085bjNONldjSVVyRHpac3NEb3hGbG8rODJITnlIVVl1WVNpUlBhc3dUQnBG?=
 =?utf-8?B?bzZoaFlncGhUN1VVblNUTlhVVjZWMDlTdVJHaDFmc2Npa2o3LzhVUGkraU5X?=
 =?utf-8?B?OG9pNDdYTHo0SWdKL0dqZnhsZ3U0OVpqUFJlVlZieFV6dTdrVmErSW5PSnVu?=
 =?utf-8?B?Y0F6aElBR01pWFVqNDliSEp1RitXYW4ycUtPOXlhUW9ZSytDbFRaYWwxeXZy?=
 =?utf-8?B?NEo2RXYzU2tVNEt1SEVGODJxbFZ3VXV5RVFWQitOSVJNLzIrVFJ2RkthRXoz?=
 =?utf-8?B?T3NyOXgyOUlTb0VZNVRBdWdUekJTMHNucHFwQ01rWVlHVW1vRzF0c2I0Nzho?=
 =?utf-8?B?bjdDS3VlNVBrVzZvWWZjVU1EV3dBYzNCV1ZZOUpHMUp6UThYNjZrNitrR0ZN?=
 =?utf-8?B?T0NNVTRJODNPNDdoV0wydm5PQVAwK0V1NVdieEtXbkdxOVpsS0RYVjRqaFRX?=
 =?utf-8?B?MTE5SVBVb08wZlpUMXZ1UHNFTnB2RTFvdkNxU3VzTktBMVdSRGlLdWhIQUpu?=
 =?utf-8?B?cXpzcXowUE5Nclo4ald4VHlrMDRBMXRzS0tvNHNpU3NlRW02K1pxeWFqUit6?=
 =?utf-8?B?QmcxS29TeVJ1bWhlWGR1K3JxZGpGTFlRb0pIaTIwaXBSTlQ0L2NhMmZBVDli?=
 =?utf-8?B?UHdaV0lKTVRzWXNRelpjZDRIam1Hb2p5WkUzLzlXbHJMd0Y5L1Q2UkQvRkw0?=
 =?utf-8?B?YnJLenMydG9Dckx0NzRrR0Nob2s0d3hnd1NGamRyNDJPL3k3blhHMjZlTDNu?=
 =?utf-8?B?WXdYemlIMk9TNmhublpQMXppdVQ0cmsvcUx2dFJYSlJIRjY3bVkzVVdiTmlZ?=
 =?utf-8?B?b1BBcG05VXV4cDNOYjhoekNtOUV3V0E3ajYvUThxeWtNdnNqbVlWZEJGRG9k?=
 =?utf-8?B?WXNkRDlvM3lEdEhsQlNGTmVaSnNiMEloeGVqb3ZtZ2RkaTlYbGRVUENpZDJ2?=
 =?utf-8?B?MnlER05TOVBqN245Wk5JVFNNa0l2VCtjVkRhOTFrT1ZVS1A3dXpHTHM0Wm9v?=
 =?utf-8?B?aFVCb1UwdENER1lrNzlWaGJXbEMvczhDYStJQlVuQzdHelVhNnQ4K2IrWDNn?=
 =?utf-8?B?dEtXR3JybEtkTzAxcllPLzZqTER0N2VQeWcwTlhTcVlSOWJWTWlVY0tFNmZS?=
 =?utf-8?B?NTYrVkRWOXV2MDJTR3BRVFgwdTg4eFNNSDJKWUdWamtLMldhZDduYUo2ZWhC?=
 =?utf-8?B?V1UzQVljS3VuWkFPcGNUTmQ1RU9XS2ZEc1NFTmlHMmpWNSszYVJGbFUzNXM4?=
 =?utf-8?B?aGRnRjN1SUFENEN3Q09vMEFvUHM1TFNubFhITzFieXIvdlVsamNOcCsrd2pZ?=
 =?utf-8?B?RC9TcEFibnVZdGwzdzV5cTJINzNxWEh0bHMzRGZPaVVQb3lnWHFMdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 311af24d-d15a-418c-c53a-08df3920a6bc
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 20:34:11.0984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fhbe3Mx7YuZdHvUnq0JBZwSaEh0k7pTRhCQf+DddO7O22eHsHk1WxyLoI+5PZz98J3HZi2EnKuAJwAbZWuHpjj2Q0+XJ9XPr9nqXu0zGROA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7819
X-purgate-ID: tlsNG-720697/1793651680-666B72AC-30CDE6AA/10/78276251493
X-purgate-type: spam
X-purgate-size: 3878
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 02/11/2026 6:16 pm, Andrew Cooper wrote:
> On 02/11/2026 4:12 pm, Ross Lagerwall wrote:
>>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> on behalf of Andrew Cooper <andrew.cooper3@citrix.com>
>>> Sent: Monday, November 02, 2026 13:54
>>> To: Xen-devel <xen-devel@lists.xenproject.org>
>>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Jan Beulich <jbeulich@suse.com>; Roger Pau Monné <roger@xenproject.org>; Teddy Astie <teddy.astie@vates.tech>; Jason Andryuk <jason.andryuk@amd.com>
>>> Subject: Re: [PATCH] x86/svm: Adjust vNMI handling to update the cleanbit
>>>
>>>
>>> On 02/11/2026 1:46 pm, Andrew Cooper wrote:
>>>> Despite prior information to the contrary, APM Vol2 revision 3.46 October 2026
>>>> has been adjusted to state that the vNMI fields in vINTR are covered by the
>>>> TPR cleanbit.
>>>>
>>>> Adjust svm_inject_nmi() and svm_set_interrupt_shadow() to use vmcb_set_vintr()
>>>> rather than writing into the VMCB directly.
>>>>
>>>> In svm_inject_nmi(), fix an inefficiency from the introduction of vNMI.  Move
>>>> the reading of vmcb_get_general1_intercepts() to the point at which it is
>>>> used; tt does not need reading on the case that vNMIs are enabled.
>>>>
>>>> Fixes: 86a203ab8d38 ("x86/svm: Support vNMI on capable hardware")
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> ---
>>>> CC: Jan Beulich <jbeulich@suse.com>
>>>> CC: Roger Pau Monné <roger@xenproject.org>
>>>> CC: Teddy Astie <teddy.astie@vates.tech>
>>>> CC: Jason Andryuk <jason.andryuk@amd.com>
>>> I forgot the extra comment.  This bug is hidden by:
>>>
>>>     /* The exit may have updated the TPR: reflect this in the hardware
>>> vtpr */
>>>     intr = vmcb_get_vintr(vmcb);
>>>     intr.fields.tpr =
>>>         (vlapic_get_reg(vlapic, APIC_TASKPRI) & 0xFF) >> 4;
>>>     vmcb_set_vintr(vmcb, intr);
>>> }
>>>
>>> at the very end of the vmexit handler which unconditionally writes vINTR
>>> and hits the cleanbit.
>>>
>>> This is an absurd codepath.  SVM has virtualised CR8 since the very
>>> beginning, and put in CR8_LEGACY for Windows to use even in 32bit mode,
>>> so the only path modifying TPR is a non-accelerated write to APIC_TPR. 
>>>  That path can be updated to modify vINTR, and this logic dropped.
>>>
>>> ~Andrew
>> The APM says "(Offset 60h–67h)" for this bit in the current and previous
>> versions. Perhaps that means that more or everything in that range may be
>> covered by this bit in future? In which case more extensive changes would be
>> needed to avoid future breakage.
> The vINTR field is complicated, because some bits are unconditional,
> while some are covered by a cleanbit.
>
> Byte 63h (V_INTR_MASKING, vGIF_EN, vNMI_EN, {,x2}AVIC_EN) all control
> virtualisation behaviour.  These are unconditional, and I bet the 3
> reserved bits in there will continue to behave in the same way when they
> are given meaning.
>
> All other bytes are state of the vCPU, and are (now documented to be)
> subject to the cleanbit.
>
>> On a related note, I see the APM says this:
>>> If any VMCB fields (excluding explicitly uncached fields) have been modified,
>>> all clean bits that are undefined (within the scope of the hypervisor) must be
>>> cleared to zero.
>> AFAICT Xen doesn't do this. Might that cause breakage in future?
> Fun...  That's incompatible with the previous sentence.
>
> Xen follows the previous advice, and sets:
>
>     vmcb->cleanbits.raw = ~0u;
>
> early(ish) in the VMExit handler.

It would appear that AMD reserve the right to retroactively introduce
cleanbits.

I maintain that it's absurd to suggest both "write ~0" and "clear all
cleanbits you don't know if you write anything".

The advice should be "write the cleanbits you know" in order to signify
the VMCB as clean.

~Andrew

