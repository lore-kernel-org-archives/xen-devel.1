Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E43C98321
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2026 14:05:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1433995.1654207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA6YL-0008Sy-9z; Fri, 25 Sep 2026 14:05:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1433995.1654207; Fri, 25 Sep 2026 14:05:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA6YL-0008Sr-7B; Fri, 25 Sep 2026 14:05:29 +0000
Received: by outflank-mailman (input) for mailman id 1433995;
 Fri, 25 Sep 2026 14:05:27 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xA6YJ-0008Sl-OC
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 14:05:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xA6YJ-00Ejoh-4z
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 16:05:27 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ab67f98-2eae-0a2a0a5409dd-0a2a4501b570-34
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 16:05:27 +0200
Received: from [40.107.201.19]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ab67fa3-5984-0a2a45010019-286bc913fe59-3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 16:05:26 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA6PR03MB7566.namprd03.prod.outlook.com (2603:10b6:806:445::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 14:05:20 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 14:05:20 +0000
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
 b=slQyalvPXy074FvSOBcQqPcEp3gKd1ToUdiNgApIAdkJs/768McgFOvMEofDXzV54DB7/lJpIRy6II5CGbK2s79jeo3AbTvS0XvjEJ9A8YorO/tRu6FsrxhBrtdr+XcpIyhnQKTLp6kKv3xMLVnmRPvZea0+uQLtjXWV+P7znj3AhAWVIZko66yrJiPSKNTm/KkGm+m5nELY8OlxYrAJtoqHgP2oIMgSH1CFfx0lNvCCXVDv6iLvOjxQNpo0X+YJ1+R7+zMM01sgWZtFzJlR+n7a67FCcM+ST6Mj/5Xzjm+VNwFujDztfSkAYeU/KGR3n+Jw6V9L0ZuFjoEib6IpSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9cjY50GlJqRI6N1ZG5GlFtNoIlY8tNmqZe0hQJyUCs=;
 b=X2SHgKrZIDXRWhyaAu3oZncvK1omq/UWuSp31H0uAHYz9TCuqVkWYMizm3y+VbzgYRGrwACwCoerJilrj1m4pUkqzNfDqyyW1hd7dyqiAwnKdAkqMyC017S2ZamdkKwHwZvwmGgpNhFgdAwKMQ0979YXbBaT/RlXrZLYylIdScHyhGzCu9BSBraAYmMdZkXRq06xzFCCqJzx4TJsWFoVUUeYGjWszsbS3Wj55f+vgV/En6gf9vXQdj1TW6Doc6R7Ijwc1kDgu5V6LSiKmrxdJSbOYysTnHHeFSMjcJlKPm7NiyN/An/u52x5V2oFFJei/Box2gvPcnqs9bgUQp488A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9cjY50GlJqRI6N1ZG5GlFtNoIlY8tNmqZe0hQJyUCs=;
 b=i6Uh5NamZr8LpB0Ko8zs5qZe954IzQz1bHJRPyHhXm+QsAB9yQ/cPON1JA/1VqV/Dksn+VOxglqYLy07K8bgZA/xoTzGU4bGwEg1ZHQfXUv4xkXah5l1J5r3jj25VubPjfD36zUuLF31A+h7IaRlvcJVoAYDMywzJ87xlqqPW9o=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a58d3f73-b2e7-4ec2-95fb-a71b682a87f6@citrix.com>
Date: Fri, 25 Sep 2026 15:05:17 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Barr Detwix <timotheecisnard@gmail.com>
Subject: Re: [PATCH] x86/mkelf32: correct VA/PA of PT_NOTE / .note
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5654aeb7-7742-41c6-a382-e1afac9d3bb8@suse.com>
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
In-Reply-To: <5654aeb7-7742-41c6-a382-e1afac9d3bb8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0028.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA6PR03MB7566:EE_
X-MS-Office365-Filtering-Correlation-Id: b8561c19-2455-4e8d-c5b5-08df1b0e08f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|11063799006|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DagVsBgaKesdVai3/MJf9xHWPq7rfKo6j2BPRDtmxWp7mdW8kIv2wK5wHc7bbP2UwoYWwM8eSU5/XqXzo2xQY4GISlgbpeZBmSS0CmVkH9ziMOfWEycmGBegLSiWB8rjR7xcnFu13BpF4+JD1/3m6ZpMRXHeeAqqoQTuBbUVFgR4BcS0u7Q3K2+4HlOeZwE8140g60kVzGSECI5ZmsCFfYfHR5QEzfEwQeD0xBqn4HSneNnvDywWbfDQZXvOC0yc+NhuF0EApfW2r99kGcQKW3/OzBg+PespgAwQBzR45OQJ0cJl9WMPu7u2qUgoTfTdLW1lg1ryj8j1bmMhCUvWg7mx0h83QTuXTgAv0T/5r76rA0D457RHNIicQSCO8KaNILcKjgDqNXowdOhIhKoh55HRLcQGuHC/xgM9m/nV8b0Nn+L32R+EmqQ6dTOf4sfX3sJgw7sUUxQCQzB4h/9vQnn6l6hD1I4yhs3hUgHemlsAkBHzDyIu5L9DpXBZ3/haPrwtRv75mJK9ea0z3XEegyYBQ6/oIhLVIrOHuvf0ceevs0N1QcEztN2aQ2xMM3RuSlhGHuXisCo8bbVeRy/zTPOQxHpwzpUn2Yda97ufbhpzU7LutSOr2jgXX7mNBj8vhkBcLbjqhp3Tr9tZBvf20+18cb6kvq9vA2rx6TERhGM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(11063799006)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDhyaURmM2V1MzY3TmhIVDRCS1p5M3VZZzhMRzhWQWpqTlFCckgzeEhoTlJJ?=
 =?utf-8?B?YlB1RlltYlUxUTV3aUkyd2thcWpkdHI0eXdhYmdHVkdWcGJZVjU0RFZraERs?=
 =?utf-8?B?VU9Vd2Q5dUNNTHZacTNBWE9OUXBtVVJqMW5XZkF6SmVoN3lkdkQ3djN6SU0w?=
 =?utf-8?B?dC9wbHloaCs1L0EwM000c1Z1OGhiS0VBWDY0dklZUDJ5eXl4RXpkWXJrVmJP?=
 =?utf-8?B?aisxVmdTaHM4RTJwdm81eFVhNllSbmgxNjNGOW9CbkxqbGFMcGxmdWs1b3Rp?=
 =?utf-8?B?eDVmcGhVQlBZck83em56OW4wVFFZWmZVczQyTTJLL0xteHIvLzgyejlOaGpR?=
 =?utf-8?B?VGhlbll0bWdsbWhGUm84TzVXZEp1L0VPK0JNNlhtV2thNlBqc2YyQVNvYkIw?=
 =?utf-8?B?VmhDc0FWVHZiZFltbG5kNWFrNkJ6SThBWnMrVXdYWEd1UElSZGk2V21Tdjcy?=
 =?utf-8?B?TGN1TUxWSzNtQ0hwaWRWQzMxUWxsOFdnbkJ6WjZFaFgwQ1FUNXFjbTluRDVC?=
 =?utf-8?B?Qm9pOWNBVDZ1Rzd0SXRERk1zc0RxV3VnWjY5UFNZdVF3QWdoRnhQanlEc1F2?=
 =?utf-8?B?eW5EOE5jYnBaTktmUXUyNGxRNWJrQnZKRndhRkFnSWdyUkNOUkZLMjdFVTVZ?=
 =?utf-8?B?QXhRWEJKSkVlQ2ZxRXFBcWp6VzZPaUd4L0QyeWpiWXRZQmN4Qzh1KzJtTi9O?=
 =?utf-8?B?VVhHTTYrYVE2SXY3ZDNpNnRZZ3ZmU0hpY0JDcVJydVl0M3VTb1RTWjFTWDFB?=
 =?utf-8?B?VXB5M3d4UVA5M2Z0eDJGUnJlUzlYTENRTUEwQWVObkQzb29KV3hHc0Myb3NR?=
 =?utf-8?B?MmJ4WWZMZEx4VGV0TkpUUmxKZ1F5TVM3eVllUjNRYm1xV2VTaFNPa3l1Qjlt?=
 =?utf-8?B?Q0VEZUVvOXhLUmRaMjhBTjkxRndJTVFPZlE3cEFnVDM0bzNXQ3hHaUNaTDJs?=
 =?utf-8?B?Z0VkeVpLV1VmQ3c1Q3FlNEZkRjVmVW40NnRWYXgzbWx0b3NIdUdYVFF1cEcv?=
 =?utf-8?B?Y2p5SkJiSk9qaW80VnpUSDYrSzVkSUpKVnNDSkRnYVFuaEZnMzd4VTdQU3dY?=
 =?utf-8?B?dkZob296aS9FZ0xDVmt0TVJUemZldUY5dFZnYkNlTEh6cUZZaXYwUGg5OWlO?=
 =?utf-8?B?M1pCUGduWTViK0YwQUdidkhzTFlOdzBLaDhUQ01wejhBelc3MmQvMmRoSmJK?=
 =?utf-8?B?TlVqVTBTTE1ZVW5jalBuSWJFZFR1aVBzM3hYWUVLRG4xWUZQcmROYlBTOU5O?=
 =?utf-8?B?QWdpK2hXU0U1aFBPdGgwbXZNWlRndjljbHUvMlJhVkwzM3Rvb2lCRFR0NFc5?=
 =?utf-8?B?V2hVTThWV3pKVzZxZ0ZWKzA0RzR1d3kxZWZJV0tpa2VwU2tWeEs1YldoM3hR?=
 =?utf-8?B?d09Ib1lpNnF1UzNDYzhMQnFNaUR2clBxb2kzdVhGTE0wQmdZSG5vTkxlTGta?=
 =?utf-8?B?cXNQaTJsa2FKT0NtK1RmejJ4M0FsQnVGTTJOOFhOeXlQSDdtWGE5VnNDL2RJ?=
 =?utf-8?B?ZXhOQXgvM0o4Q2k1UjNqZDFrQzZqbStuQi92aUxZdzc3RU13M2Nxb1FYd0oz?=
 =?utf-8?B?NGRmVHBPYTN6UzZMMnVyTWVTWm1JSjgzbG8yRG1tYVZIdTBvL2JINllQZXdp?=
 =?utf-8?B?ZFFoRVJKNDVTQmx1VlpkUTE0MHhhN0RpMEZKbVY1dHhJeExjNFNZNmNoUE12?=
 =?utf-8?B?M1dOT0xKU2NlZHZzV3hmVm14cVk1YkluS0lUOFBOTE9lbXZpb1N2MGJEQ1Nl?=
 =?utf-8?B?TnZHZUtIL0ovcHlMY1M2dFlONm9jT3NTc1ZNb0liYUhERSsvMUI1bEcyYXpR?=
 =?utf-8?B?Tmt3VXZVMWIwSzRQdnErWVNXZUJUV01jT1I4bFU5elJ1V3d2T2cvdUZOeXV1?=
 =?utf-8?B?RjFTbWpVMlNaU1R6blZNMnA4aDNySndRekp4OFVMNStWYmU0N3ZKQUtNeDBz?=
 =?utf-8?B?eDdKL0dtRTNMK09DSDlrSmN4elZESnFydDdiNE8xb0ZxNlhWbzJFQVd0Qkxv?=
 =?utf-8?B?dmszSXRFUFFqNk0xOG9YK1o3TnIzcklGaXlCSnlXUjE3Mk54R0VLOW56bXlN?=
 =?utf-8?B?ZDl0VUdvNjg5eXF2YUN3OW1CTUd6eVFHSm13Si9ud1ltbWxMTDl6S3JHeWdJ?=
 =?utf-8?B?TFdQU1pkek9KMi9IMTF2Y1lBM2NzR0dqOHJkRlNnMXdGZ21uWE5FS0xwVWdF?=
 =?utf-8?B?a3BGWmJ1QXlZU1ROWU9nVWNNVjIySStFTlA4MmovT0YvMmtEQkdFcXhyait4?=
 =?utf-8?B?VWVFZXB1QTdnUnkrM0ZNV2JjQ3ZmYXA2Qi9Td1NSVHdwU25Ic2h2cWN6OURO?=
 =?utf-8?B?dG92cXRpOVVsYms0eXFSSXFNYTI0MTI1WUpSbXlNbGUxbVJNbDJ5QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8561c19-2455-4e8d-c5b5-08df1b0e08f8
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 14:05:20.4696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oC5vksmSe4d22aF64vp4hF+gW4PidSRKPWFIa+4DZOEYFEq+Soblm5jKXhHFuQjUISK15TL4aL7lbxOnes4YOxUlwT0xDOmPpDvEtB1j9GI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7566
X-purgate-ID: tlsNG-d62444/1790345127-C4558757-FD6004EC/0/0
X-purgate-type: clean
X-purgate-size: 629

On 21/09/2026 11:18 am, Jan Beulich wrote:
> For the .p_paddr, .p_vaddr, and .sh_addr fields the image load base
> (passed in by command line argument) also needs taking into account. It is
> _not_ merely the delta between incoming PT_NOTE and PT_LOAD segments. (The
> fields aren't really used anywhere, so this is largely a cosmetic issue;
> static analysis tools may be affected, though.)
>
> Fixes: a353cab905af ("build_id: Provide ld-embedded build-ids")
> Reported-by: Barr Detwix <timotheecisnard@gmail.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

