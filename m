Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013B4606A33C
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 17:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=daEJySlp
Received: from list by lists.xenproject.org with outflank-mailman.1472310.1680235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOepW-0002Ay-TU; Wed, 04 Nov 2026 17:31:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472310.1680235; Wed, 04 Nov 2026 17:31:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOepW-0002Ar-Qq; Wed, 04 Nov 2026 17:31:22 +0000
Received: by outflank-mailman (input) for mailman id 1472310;
 Wed, 04 Nov 2026 17:31:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOepV-0002Al-Gc
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 17:31:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOepU-00FBkM-Q1
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 18:31:20 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aeb6bdd-bab6-0a2a0a5309dd-0a2a450a8d7a-6
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 18:31:20 +0100
Received: from [40.107.200.68]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aeb6be7-f2d2-0a2a450a0019-286bc844fd18-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 18:31:20 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA6PR03MB7661.namprd03.prod.outlook.com (2603:10b6:806:445::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 17:30:17 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 17:30:15 +0000
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
 b=x2Jwl0v277wS9A36pHV+5+Htnif0AfCAsN0shUj0VYJ0LT3yMXkgLuAdgfwFSAkZG03xGx4nHBHKKk9U7nyFCw/QVQ1/yQgmZsgWnKXdAmN4tH40QEkBhiNlUkF4BrX+G59QwVkHj3Y0t2ZfT3CwkLs6FTUjIMS5kC0fUmIRvcTytBIcqvWUaNxjdyoVPJNhBJJru4BwEpvW8tNp0zZthJfz+yJDO9DgfHG+Zs9M/C51ag5xB5W1ZWV/GvWsAmA/zbnzOinKOXsOi+xApQNt3x4iYguM4tHEYSkSwm1WQwSgFKlzSXeR/fqpCnwXMqweXbkphvVswaep2uGmLc4JPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yDfXFmcmMDRA6NAMGkrjr8e7Lu5heBgaItstTbiCc+U=;
 b=jeEPNcLrIByS0D3djCR1NxdzUKTGLUO0zbi9glNl9DEdXRVxdzjFlYI+L5iMwGQpqa+zHQaH2MYHRC+zk4ICY5gPIoQkLxFiVpjBAqWQ/m+2BLKOi8EGDQCWHNFMe2pJdFroUWOnW35ycmB0+1W/4JaIm3d8rvKeBb7OYpBu6VJVadCYN2tFhfQl91V/8WrGDMur9o4/13UsacMxs7H9xw8QhNFJKoi2snB63PShxJmsTMcOiDBwrMTza+WkEdke9/fHCyNLNqBJOJsX9clE1cxdWxem/D2CZ+eB4+qdb9fV/C7z1haGcKDQvEfEeiBVGRPgYO2boyc+LPKJ21LSxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDfXFmcmMDRA6NAMGkrjr8e7Lu5heBgaItstTbiCc+U=;
 b=daEJySlplqOMb87CnBRAq0CxrEBMFOehncn0Xg1Ribl06eUWE8PWwENMqcvsjyNjum19r48FYq0Iw/YUBfqfXB0D2TcelkloNSrEp3ojfAJLAJ80mC8o7S3s2N4NYOESNxHhcUgM+KUXWEdaMZKa0eXmY18S3TO0LYFSjBsVcqQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1d5fca53-602b-44d5-9ab0-37707e45c845@citrix.com>
Date: Wed, 4 Nov 2026 17:30:12 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/pv: Improve code generation in
 async_exception_cleanup()
To: Jan Beulich <jbeulich@suse.com>
References: <20261102174234.1764070-1-andrew.cooper3@citrix.com>
 <b3e50554-a045-42b7-908a-7e7c34c0dd90@citrix.com>
 <3b08e987-30b3-411d-a9db-27a18196c5bb@suse.com>
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
In-Reply-To: <3b08e987-30b3-411d-a9db-27a18196c5bb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0076.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA6PR03MB7661:EE_
X-MS-Office365-Filtering-Correlation-Id: 16e486b1-7db1-4ffe-51c6-08df3a994989
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|6133799003|10067099003|22082099003|18002099003|56012099006|11063799006|4143699003|261022105027099003|261102123227099003|261026121527099003|261028144727099003|261026140227099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	Cmh48ZyUPAWjeKXZZuCG7dEgV6fYVFhu8qlURCsah+uz9MUYpIA6UmzvSFNYqrquri+p9F406AOT5ZBtSeiSqX/xi0Gcyu2dTT1LFWkU6yi95EgcD8AW8FLAhfD9vGLE9Y0sAqBWmP6Xt7jHUsqFXSUwZQVLJkmUxsvToEuxUmFzADEag7Ok/4bVif5WpJUd/q9NnToFs9Zbp2ntTZcSUF9+dCe8REdGlgMIlnvzoajp8W0kCxS4gwWGlKk1DDA9V3zsq3Z5vV+5x9eTmnjddlFEyIfkJ4YKLqlAx1j+DaN692sGCjO3fi9RGezWoVB9vg7GG+q9b466Yx0MSxoHhqMTuvC1PAzj8V4+yYnp55DPp9YPEOVyyh76t1DEzP8yqnG77MxNuNjOALx+sq6ixgFkIyCSV0itmhgIjXXEuC1BBjMRqy7P9Ad3FEj729sOdWQxgJ0EB9mxWi23abQqGa7YwzhM6nSnFGbFXshoOsEW1nekO2CHG88JFZABeDcI5XULH9UA1rjOZT6fUyUxKk6/AS5CCbLHBPphb64gmCOWoejihNLsYc7/MMskuuFVcGItNTj6bSDtw65R9RSaqazzcEKoXVHAIKlcuYQDntnOTT8Yuv+2fVBvOdSZAnWeezIiOWlVCK8fF+7fTOZE1w40PZyzqEr/BWscI7lpFsw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(261022105027099003)(261102123227099003)(261026121527099003)(261028144727099003)(261026140227099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGFmWVYxdlUvTkFndFl0TXU4OGlRVithUExjU3JrNlNZZU1pTllKWlpKaHZq?=
 =?utf-8?B?YVpKaHZhNXVzTVVPbkd3UnM3TG5HYjVkTGVhczhLSEhPUzVOR05uSU5HUTgz?=
 =?utf-8?B?V0Rqc29WeWpKU1Y3RTFYVU9RNDltb2VDUWlDRm9uVDdYZUtDYXQ1QlRPNE9i?=
 =?utf-8?B?bmxYa1VkeXowckMxdWUxZ0VOMlpIVVEvdFhmWEI0MUtqQkVHZW1PY0xXTktz?=
 =?utf-8?B?R3lKWFZjcURoemQ1R09YT1ZBNGliQVVXTUY5ZHQwYVNCYWttQm12dXVJa1Mv?=
 =?utf-8?B?anZVNk5YaEV2QjVqckp5U0FYYzdwMnBlb0o3b25RWVROQ3hiVW1OYVY0M0N4?=
 =?utf-8?B?NUNrMkpjVSs5SHdNbUVjVFc0citlWFBkYjhOTnVaM0ZoYXYydnRuZVBlRFV4?=
 =?utf-8?B?d1RUWXgxdEpuUmUwRWhld01hZTlUaUd3UHlXbU9YM05WOHlkT3N0ditiSExt?=
 =?utf-8?B?SEM2bjl4TU1RS2s0MDE5UlNUbnYzYnhvdllBU1d3alYrN2xLRXlnQm1oNGdh?=
 =?utf-8?B?cms3Y25GamUyZnZLZ2o5QWh6QVJJakd2QjU2dG8yY0pTOFZ4UzU1QlYreFBp?=
 =?utf-8?B?WXpJaUw4VkVlYTYzeUlKN2J5YWVmVzBLTVpqYlFiakJuNnBRSlBPTGNkbTNW?=
 =?utf-8?B?QkxmK2NwTnFaZkNVM212TmVtVWlMSmxUOURWa0xoTHJIcS9HR1VpRTFQWmx3?=
 =?utf-8?B?Y1B3MkQ3SXVQbGZjWGJWeTVPUmFpTlE4SkVxb0FjSVF6RVh2bm9VTXFIOUlL?=
 =?utf-8?B?bHhSaENWNmRJNElrWEZFVlFOSXFobFhURGJaUWZZazhITkVlTDRJaUJxMVBN?=
 =?utf-8?B?aFBUYytCVHFlQVhrQk9Qd1N1TmRpb2VUM2I0QkJrS2hWendTSllsYWNnSEY2?=
 =?utf-8?B?TDVBVm1JQ2srcmUzVDRQeGdOZDNsbytDWjUrdExBMmE3QUdiNkRLRGdYT3I5?=
 =?utf-8?B?WU1tVTdzTG0vRjdjWFo5UGxoMDZtMjY0TnhTclhUOFJZOTB5SGNrSVdaOVZL?=
 =?utf-8?B?QkZKYVZWRmZUa2o4TEY1d25mSjJYelNJaitnMmNad3FZUlNuODg2VldCTTV0?=
 =?utf-8?B?VUJzRm10czBJRHdMKy9tQk1VYUIwUk9uUk1NYmVrcUJGRGtabjVWQTFha0Jn?=
 =?utf-8?B?UTZ3cjA3WkRDbzNhODJQRWdsRmJLdHd5NVJqYUdsMVJtSnZEcTVFajF4K2Y0?=
 =?utf-8?B?SHQ3TTRrK1ZVNStTWVpIZVpNR2FXUlhIT3d5ZzZBUGozTld2NkdZVWJUcURi?=
 =?utf-8?B?K2VaU05WUDc3V0pvV1hsMG1uSk01Wk0wdm5TZTRuaUVjUEN0dFRRNWlZZjRi?=
 =?utf-8?B?VWV3SVVmUjlRTHFyUXhrVS9Oc05NTjRSSEJrWWNjaVRuUVpjMGVWem5Oblhz?=
 =?utf-8?B?bS90ckIzVzFYNm5OU1J3N0lHZjI4ZXhaeG5NakpUTmQ1MjBUT0FvRFJuL2Np?=
 =?utf-8?B?TFFnQkFwd205cUJvSHEvM1JBaWtmSlpoNm15NW9nZGozOW5uczNSN3lLM1hC?=
 =?utf-8?B?Y0dIVThKWlVrOXpsa3NQaUl3OVZ5czNEcFk5a0p5VHF5dVd0bjV2RVJYcElP?=
 =?utf-8?B?UngyWENQQkl3c3dXbUxvcGFpMHdReTUzMXRzY3lSTjJmWlNuQUlXT25aSVlQ?=
 =?utf-8?B?cG95ZkdKMUxhNStPYVBkVFJ0OXhsS25PRGlXa0d6aStZTVkzOWZzcmxCTkh0?=
 =?utf-8?B?T1c5ZThJNk8yeWtGZHBUNnVTSW51R1RnU29DSzhCSS9TdjYrNkdtWXJ0M0tI?=
 =?utf-8?B?Y0p0YU9CNDg2VytUalNCM0tIZXJqYWFHY1RHRlcrYllKZmlMa0hzK1Eyb1Nh?=
 =?utf-8?B?anl4cUFiaVJza0dQYnhjaFRLVFdFd3Nwa3M3clZ3UHg2M1oyaTh1dUtBdFg3?=
 =?utf-8?B?L1Q1ZVQ5T0ZpVHZEUjRibGNFVUg0ZHpQR21acmloUGowR2w1T3A1Zlp5aldD?=
 =?utf-8?B?U2VtelhocEdJR3hWeVNqcnEwajlFY1J2Z1N5dDdoL0kvVWU5TWllbkFDTGdN?=
 =?utf-8?B?a0llTkxmWUNMaExnWUZGSzZvc25ZcE9adDcwSHNOWldSdWVWWlhadkMyczZW?=
 =?utf-8?B?cUU1K05BR2VvSkQ2Rk9hSDIyVmJEUVRRWERDR2tqR0dMSFlrRnFIOWVVN0k3?=
 =?utf-8?B?eWZBQUpFWi9UN09WZ1EreXByOXI1YVpuVzlidDlsSDRma3JITU5wYmsyaThp?=
 =?utf-8?B?QS9wbDdZcWw4VlVXSkZjQUVKNG1qaFhKTER0WWl0S3JjRUNBZEdYNUI0cmhy?=
 =?utf-8?B?ZzlqbndPNkZ6bHM3UStGSG80ZENKSU5JSStleHZkRnI5WmFKOURiZjNwWEpl?=
 =?utf-8?B?KzVkM2ZwQmtBT1VFMjBpZlo1cEIwVnFFSm9nSzdmdk9EQktjd01HZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16e486b1-7db1-4ffe-51c6-08df3a994989
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 17:30:14.9718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZjzvHEWEjv65Mf2XWHQACCzwwNY4dHlU4bSgoBwXUk7e0gJfvJYwX5vp/S+dFdNw+Wcfde8Syz9AjhbDIFOTm7bekqXlUPihXRdTenKhKeQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7661
X-purgate-ID: tlsNG-4011c0/1793813480-512C8CFC-CFF449E7/10/78276251493
X-purgate-type: spam
X-purgate-size: 2110
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 03/11/2026 11:36 am, Jan Beulich wrote:
> On 03.11.2026 12:00, Andrew Cooper wrote:
>> On 02/11/2026 5:42 pm, Andrew Cooper wrote:
>>> Use new helper functions to simplfiy the logic.  This removes an alternative
>>> behind the scenes.
> Does it? __scanbit() engages an alternative only when its 2nd argument is
> BITS_PER_LONG.

Oh, yes.  I'll drop that sentence.

>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <jbeulich@suse.com>
>>> CC: Roger Pau Monné <roger@xenproject.org>
>>> CC: Teddy Astie <teddy.astie@vates.tech>
>>>
>>> async_exception_cleanup() is complete nonsense.  It's not remotely close to
>>> how interupt blocking works in x86.
> Are you perhaps expecting something that (for PV) was never intended?

I've long since given up being surprised at PV doing bizarre things.

This async_exception_state[].pending is used for HVM guests; this aspect
does need to change.

async_exception_state[].old_mask is specific to PV and, AFAICT,
interlocks both NMI and #MC together so they nest, with HYPERCALL_iret
"refcounts" the unwinding.

Architecturally, NMIs are blocked until the next sequential IRET, while
#MC has no blocking capabilities at all.

PV guests behaving the way they do violates the principle of least surprise.

>>> --- a/xen/arch/x86/pv/iret.c
>>> +++ b/xen/arch/x86/pv/iret.c
>>> @@ -31,8 +31,8 @@ static void async_exception_cleanup(struct vcpu *curr)
>>>      if ( !curr->arch.async_exception_mask )
>>>          return;
>>>  
>>> -    if ( !(curr->arch.async_exception_mask & (curr->arch.async_exception_mask - 1)) )
>>> -        trap = __scanbit(curr->arch.async_exception_mask, VCPU_TRAP_NONE);
>>> +    if ( !multiple_bits_set(curr->arch.async_exception_mask) )
>>> +        trap = ffs(curr->arch.async_exception_mask) + 1;
>> This should of course be a -1 rather than +1.  Fixed locally.
> Acked-by: Jan Beulich <jbeulich@suse.com>
> (with the description corrected or you pointing out which other alternative
> you mean)

Thanks.

~Andrew

