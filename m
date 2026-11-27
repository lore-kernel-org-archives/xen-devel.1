Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB110606A31E
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2026 00:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=c4YniUZ5
Received: from list by lists.xenproject.org with outflank-mailman.1504320.1699743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWk3J-0005Fk-IS; Fri, 27 Nov 2026 00:43:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1504320.1699743; Fri, 27 Nov 2026 00:43:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWk3J-0005Fc-Do; Fri, 27 Nov 2026 00:43:01 +0000
Received: by outflank-mailman (input) for mailman id 1504320;
 Fri, 27 Nov 2026 00:43:00 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xWk3H-0005FW-Sx
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 00:43:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWk3H-000ibO-9K
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 01:42:59 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b08d213-e002-0a2a0a5209dd-0a2a4501a598-0
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 01:42:59 +0100
Received: from [52.101.52.14]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b08d211-5bcc-0a2a45010019-3465340ea66f-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 01:42:58 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS0PR03MB8173.namprd03.prod.outlook.com (2603:10b6:8:28c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Fri, 27 Nov
 2026 00:42:56 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 00:42:55 +0000
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
 b=H6SsyT4s2TdMGGbakNmEXe1J8tGL9zerp+RvgRlvxkooBKN/P5t1V9FJ1c377m316kB+/41f2mjE3Y+PyOetq2GMuP6bxOnHb6CK49milScs4PbENcn+9vemKa/NjEwGtaXWDJWnZpE7eKUVtnMaKH71PvxLPBo6fxHZpCX1xURDMDbPJnTB1xVQnvDezJMpAtUOlUuyx/q0IjSIyiOJS30G4/IBwI8oCXt6KPYpJDEkclR1IuEyXjWG5XeEa6ZRwvlKvNyNjo5rHhZmw346vA9COQqz6MYc5zCeTjiEYuGD/qWJEK3+GDMScE0pXFWaKkX7oWZ9kW9I4ic1ONO/Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XmZlLQ3HyUICj+JUbVpotvZk48Dmk8eRE7e8hXPUP10=;
 b=WLgB+kGwv46GV/Ur1YteNWXK9VHSwrt/OIPi3ZhLRus2teQPs1Udx/sa43VsoCuB8Srk9o1tx+kG0e3b5uD7aM6CHe/7BWk12S8Jk1KP09KggjnHr3yXzTEm9ow6yvTlhT6P73oyyN5ebOGYOKtyLSLqYW7mTwtXrE8y8DQtwZPHre086UzBkqX7oa+siM000i4U5dHQ1FggHXVOQDGhjrXlyhcSkCpyMHsglZdzZchtKwmuRSAH6XKBVUkrgGyEN76eQyOPW7EPdimJz/4WIrdSHg+MQ9vxJB/6U7HQcRuOjWqQwtUmgvTMVq6j0aOnu8vBpSpWnidAviitB73VGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XmZlLQ3HyUICj+JUbVpotvZk48Dmk8eRE7e8hXPUP10=;
 b=c4YniUZ5ErezFnl2E6WexK5Apjagn8E8vHtHe0NP6sFC8pfRrLviJSuf+oqAV5vuxvtlgJxB1EDnkzlBB/KT84wmfg5Ko3LFsiMjKkHlPUReJnscf+FCLcllrFYHVD8hF1oRzmj4YitPWMyZs0dG+mwusbxy+A+lfXxCOx1RNyA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7d22052f-f36e-45bc-9cff-00b874b15ce8@citrix.com>
Date: Fri, 27 Nov 2026 00:42:51 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Marek Marczykowski
 <marmarek@invisiblethingslab.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v5 3/3] x86/EFI: replace ebmalloc()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ce77413b-ec50-42e3-a1fb-cfec6e6efcba@suse.com>
 <e9e13623-b695-4095-a283-b9840e704e55@suse.com>
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
In-Reply-To: <e9e13623-b695-4095-a283-b9840e704e55@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0628.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS0PR03MB8173:EE_
X-MS-Office365-Filtering-Correlation-Id: b1a93101-1631-4fc6-fc4e-08df4c1f6082
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|261022075727099003|261021121427099003|10067099003|56012099006|5023799004|11063799006|261022115727099003|261026140227099003|261026121527099003|261022105027099003|261028144727099003|261102123227099003|261009223027099003|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	agtsNq7jg1HhMimvRRakG1G+uCYd8ygT9wI58N7fXCXA0ZJ+DI99055vXBbjWENAwb2g5xijmdlp2j9/5vd0R/AqA7Xwes3mqthVV6Haxauu5AvsS1yhDeCMRQZR8iCbl6ULaWBBru2CbcNIVO2Arr07s1AS1mflgf9niPEG54Aely0ZwlDBE9r7b++uoXsXa5s52QFcZY7eQhgBURvOaLm5OXLl7Wh5MgYksXoIVcrYpMSR9cvfs7QZRaau/MPh6hN4YtxnXpWiDwEEoMTwiD7tt0gYN6AQlSPgVKcTnqqZEg/D4L65y6GPTz6HKMDTRpTX8IGd9u3cPFTsQnignmSSQEO7vbLXJITcnkuqI/vXcByvOTE/uaGiBAejbxj2MQ15e5p3yBgX77KZ/BLzRMZD4MzkVJ+nDUt/vVZ1AKk45sA/M1k/QZ26On/IuHkwiBQr0lnZkO8t2AkgFAsJ4bJ6HQhdoNkUzA04tzP1fvww21h3h9Vv5yMZYnapeb88J3JtvPtS6WM71xALgS8ou5KmTkBfM/ow2wEZ/2IQNNQZNbJYwfjNf0MkwKSQEJSN+pqLQfv5e1bw6HPxPYA/Az7TAxt7Kn60qpO+BiFlE0xSkOswG4hAoDiE/fiUM224ZX6gjkGd6BGX3ufo62FeT5Izl/Lu42Hk0uL3ruulEeA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(261022075727099003)(261021121427099003)(10067099003)(56012099006)(5023799004)(11063799006)(261022115727099003)(261026140227099003)(261026121527099003)(261022105027099003)(261028144727099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmFFU1VaaVZTYUJrWFBLVVVrSXo5WjVYc2U3WTYwUGJ2LzRBVFFOMTBGcHNG?=
 =?utf-8?B?WDVIM0RZejFkQ281NnMvT1ljdS9PYkhieThZOFlra2Z3NXhPK21IQndENitS?=
 =?utf-8?B?b3NpR3RicUNiSzlBT2JFekYrTWVXakpnZVlJNEJIbXhQcG00R09pQjgyYm1o?=
 =?utf-8?B?UjlaMU5KQzZlb1BvM3F0bTZZV2VqeVhaWm1yWk9qZjZXQmJ3Wm5zd2FFZWF2?=
 =?utf-8?B?WUYxalBYZURiMnBjYTJidDlraER4akwyRGJRbG9rMCs5YWlBbUM1K3M0bnh6?=
 =?utf-8?B?QzZjMWRJKzQzNFhiRU15c0I1dmZTeDNrS3FHbWUvUWtyRkVBOGdRZ1AzWkZn?=
 =?utf-8?B?TjVKTDU3dDVPaXVJczFtSlkrY3k4TWo2a2lyYllpVTgxZmszaG1waCtpNkNv?=
 =?utf-8?B?QnFkWi9LRXFiVGR4ZUpFWXFGTzZSR0Y2U2E2Yjgyb0ZScTRINkJGZHNEK1BI?=
 =?utf-8?B?b0NsaXMyTHViZ1FiZnZtUkpBL2tYaHVjSUVhZVluUlNrSTVjNzNMZjNySlJG?=
 =?utf-8?B?aHp3OTc1K1NmSnhEMXVwZlJtMHlJQ2Rzcmo1ejh5UGpzU0dta3BmM2ZwQ1JF?=
 =?utf-8?B?N3JGaXVwdHhCTDdtNXQ4R09Ma0hJWG1HMXVhc0JvL2huUjc0VzRJaFJkME9z?=
 =?utf-8?B?d1RlcVhsTnJCeThpc0dwcmhaYjdtZE1zdW9yNkE4Ynh1SGx2VlZaYmt6VEVr?=
 =?utf-8?B?RmVUZjd5bDByRFZvenpDNEZHdzJwckl6WWRiZFBxQ3k3dnlibUE1ZnFSTmk1?=
 =?utf-8?B?dmcrelpJRVplZFNNbEt4Mk5haFhtMWlJZTRuZi93Y0Z6Q0xXQ3hobE9jdE82?=
 =?utf-8?B?UmtUbk5JcTMwcVVOR0ZJNWF3Z3pSV2w2S0tveGxLdEZabFd1VVY4ZFMxYWJB?=
 =?utf-8?B?WGNoeDI0am54V3g4Ym55dWxFTUpCQ0NCVU11eWZiZE5Xd0FGZUp6bEZCWWsr?=
 =?utf-8?B?MCtCek1UV0g4cFV0N3RteWhWTmlBNE1QNDd5V1lVVlllOUJ2NGE0TFFLbXhT?=
 =?utf-8?B?c3MrdXZiRS9YK3NIZnlIYVFmNDRpbVdURnVqa0pJNWpsUjNyRjh2VlpmbTJ1?=
 =?utf-8?B?MWd6d0owNHA4VzdoMURjMWxtNHJLWEE5WnI1T2EwN2M5WnFuT3FlUC90bFBI?=
 =?utf-8?B?b3gwYlAvMmM1bGdLeTk2QUZHb0h6WFZaUldSRUdyUHNSazh5Vmo5ME0vM1Jp?=
 =?utf-8?B?TmhNM1B1cVNMbmx4WjFtNzJSemx5RHFBT0dGMWZobUwrZU5qYzRsR1AxOHFy?=
 =?utf-8?B?bDlOZXN5dk9tcFdiTDFMclFqQzA0eHdOV3EvbVlIRCs1a0NOY2JWNWkzak50?=
 =?utf-8?B?d3BtN1BpTVR5ZDRGZ2ZYZWlUY3dNalQxcHJWRzBMbjhIbktYRUE4WVNnaFND?=
 =?utf-8?B?UG1HN1ZaZW1MUnp0Q0lxeWxxTG0vTlNqT3NnWEJIellCVHBrRGdwaklQYkpF?=
 =?utf-8?B?QmVWRWpYemloRDVpaGlpSjdLK3BGd3o2eHhib2dkMkZFZ2ovN2lweWI4aVVF?=
 =?utf-8?B?Yk1YcjJjVit6ZGd2eitOeFJyY2lkZDhvNVoxbHMrSzEzTUU2L2ZKOEFocGFw?=
 =?utf-8?B?RGxYbTluMzJJTUs2dE1Eb2EwRU5BWUw1Ymt1ZCtvTGMyZ2tBZ2RoRDV5b25X?=
 =?utf-8?B?UXpjVit3UjdIQXFDZkFydFpwZHNucDFLWVc3Q2VpREpyckpLa2ozNUQ5QzJr?=
 =?utf-8?B?UTJjTmJVNWlTaWdxd2xBWWczVW9ydUNiRTMwTVFseFJmeUo1UUhRN1pwNHQx?=
 =?utf-8?B?blY2QzNjV3ZGUVZMSFc4MlJuUEYvMWxoN1FtUkVLWjZEemN2SmhWSGhrNWpl?=
 =?utf-8?B?UmM2R2FGYk16QXJqVVdIUk0zeVhremlVYWN2WFhCZ3lQQ2dqUXMzZ2NMOFpU?=
 =?utf-8?B?cFA2RDNVSVhzZHlsTHM1aERUU1BPeExERVRoSjlpcmcrTmRaZEs5ZFlqOWw0?=
 =?utf-8?B?Tk5XK1BMNXRsTlN3RW1ONVY3bVdaNWNweXJZNitIM0UzUmxFajFuTUQ0ZXpz?=
 =?utf-8?B?dFI1MVEvQlU5K0ZpemJVelhuL1ZXRWhYL3VYbFVxRkJHTEtoRmtuVUV3QzJQ?=
 =?utf-8?B?MFZQalhwZlo5U25aQ3Q2SFdqSG1zRDhXTlJuSWZmbDUvdHF0cm9SZlpkWThw?=
 =?utf-8?B?RmF2OTlKNFdOWmFYTGZDaEZ6blg4VFdBdGdhTG1qMk4veDFDUGlRbk1weGJa?=
 =?utf-8?B?aVRDTFZLOVBSakVBYzJNUnhnYno1Qm1LTDFRMHB3aFVqWkYyczBxSExxSzk1?=
 =?utf-8?B?akZsR3YxUTBvZDN6cFpWS0tHMzM3NjZ3NDE0dWJkeTlzbzYzZjNNR05vczNH?=
 =?utf-8?B?MXA3SXZKSzVETTIwa3VDbUE0N21ibkMxenFmdDdtb0pNc2pwM3VMK3gyRmFn?=
 =?utf-8?Q?0IY3SdCKGJQGW0Gw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1a93101-1631-4fc6-fc4e-08df4c1f6082
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 00:42:55.8441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eWYIRYnISwgwJYPv1Dq6xCwOtJlehlvqTEwWVOJN2VDqV0A3HLexuYjgjn+gZsVqEn87ZS9+esoHy0AK9xy2Rb1glpdAlu1agzCprvWrd28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB8173
X-purgate-ID: tlsNG-d62444/1795740179-4DD595FD-3B9C8FB1/0/0
X-purgate-type: clean
X-purgate-size: 2148
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 25/11/2026 2:36 pm, Jan Beulich wrote:
> Use the new brk_alloc() instead, with ebmalloc() merely being a thin
> wrapper.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

From AI review, two issues:

  1. brk_end loses its 2M rounding (18b2e1fc6e "x86/EFI: replace
ebmalloc()", together with 82cab821d0 "common: introduce brk_end")

  The order of events in __start_xen():
  1. setup.c:1671 calls brk_cease(), then rounds up with brk_end =
PAGE_ALIGN_2M(brk_end) when 2M mappings are in use, which is always the
case for xen.efi. The E820 reservation uses that rounded value.
  2. Later, arch_init_memory() (line 2102) calls brk_free_unused(). That
calls brk_cease() again, which unconditionally sets brk_end =
__brk_start + allocated, discarding the rounding.
  3. Everything after that sees the unrounded value:
     - remove_xen_ranges(), which runs during create_dom0() at line 2211;
     - is_xen_fixed_mfn();
     - the S3 integrity-measurement (MAC) region size in tboot_shutdown().

  The range [brk_end, PAGE_ALIGN_2M(brk_end)) is then reserved in E820
and still mapped by Xen's 2M mapping, but it isn't treated as Xen memory:
  - With dom0-iommu=map-inclusive or map-reserved, the IOMMU set-up in
iommu.c:486 relies on remove_xen_ranges() to cut Xen out of dom0's
mappings. These pages would stay mapped for dom0's devices.
  - Page offlining wouldn't refuse them as Xen pages.

  The pages are unused brk space and padding, so the impact is small,
but it breaks the "permanent bound of the Xen image" promise in brk.h. A
possible fix is to make brk_cease() do nothing once brk_end is set, or
to apply the
  2M rounding inside brk_cease() via brk_adjust_start() so there's a
single place that computes the value.

  2. Stale MISRA entry (18b2e1fc6e):
docs/misra/function-macro-properties.json:499 still lists
^.*efi_boot_mem_unused.*$, but that function was removed. Nothing in
automation/eclair_analysis or the other docs/misra files
  mentions ebmalloc or efi_boot_mem_unused.


~Andrew

