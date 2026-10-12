Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17FA4CA9ED0
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 18:39:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446553.1662680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGKvk-0001T0-7c; Mon, 12 Oct 2026 18:39:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446553.1662680; Mon, 12 Oct 2026 18:39:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGKvk-0001St-3b; Mon, 12 Oct 2026 18:39:24 +0000
Received: by outflank-mailman (input) for mailman id 1446553;
 Mon, 12 Oct 2026 18:39:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGKvi-0001Sn-QT
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 18:39:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGKvh-00Coqz-Fp
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 20:39:21 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6acd2959-e002-0a2a0a5209dd-0a2a450ac574-0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 20:39:21 +0200
Received: from [52.101.201.3]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6acd2957-f2d2-0a2a450a0019-3465c9036910-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 20:39:20 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH5PR03MB7910.namprd03.prod.outlook.com (2603:10b6:610:212::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 18:39:17 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0496.021; Mon, 12 Oct 2026
 18:39:16 +0000
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
 b=gKYdF4ApyrMbWDNMWHt+oQ2RnCw+DSnhMswZMUjYCKosHSbDe9MsH9xxA8Nz004JwC6Zd6SPgzAU3fsLyDYceizMSaL7DvNFL2NvjArKJKc04ZJ4g/zz70I+sFK3e/lQS8DGkxECYCJAQuyqIP9h/V5ugC6m4XCKTssaNAOFsO+rPVVMNqvRTVP1f3c0/XJZOXCigYcYxPoFRzMqGJj680tIG3dntC7rGKLgErAgWNBmNg3OMc515AqB9t9BMU86++W9mEHMPyPvZHX68fU2OpUNDf9LM9R6nixrwii/BnRd/NUdbzAbJh+WvHz6BAOd5qnH9et5dU3T9OU60vCVvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mKf/QlUM5hgxXVWA2vDoy6x7bPq6pBlP7IQZ9SYUQEA=;
 b=fBvDbQNaQEXVNeK+QxZ6sak0TE0VwCeWT9eghulMxe78MMgYKeyyzcXiVvM57KFCWMIHGh3au6kvx2JgVRu3SkYQkVYY9Lm7P7RPQmJTc8Ik9+G+LuJexIquI2gFg4hypNmPN07+V3YyiYTC++mbHfHoJEWohjkynV/3a569gSUz9bZkRrBavynX1vnh6YAlyWab3DnXLv7Ox56rSNZVfGI4LeLoThkahmieeyXO1RcrfwPJYBrTMUMtRXN7JsWlHLRIDCh7Zn+jJV0YqNOGE5p0p89QSTwA5ytJHRI/TkseltxH2HMW9GG6ju/UqY+8JlvEOHwj+dMzUEJO5SA7Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mKf/QlUM5hgxXVWA2vDoy6x7bPq6pBlP7IQZ9SYUQEA=;
 b=VJPjpqkHU+8iX70LswLdnbyr9VdAFCFroyFWWrFhCjOw7P+TAuKTj/x4nP8xCZvPj5Yr6BiRqx2fux5wSIYiLZ8QiGpAGx6UDtlseMf0+e1E2hoEO8XKMmysGQctjvJ0JqghS/Lb7taPxUF2uLQggks7snuKoJKJZpzFh97oKck=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7ebfd1f1-5f46-4aff-a695-5e103d93e41c@citrix.com>
Date: Mon, 12 Oct 2026 19:39:13 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, andriy.sultanov@vates.tech,
 guillaume.thouvenin@vates.tech, anthony.perard@vates.tech
Subject: Re: [PATCH] tools/oxenstored: preserve socket fds across exec
 live-update, document SIGTERM limit
To: Andrew Mbugua <andrewprecious388@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20261012162258.811103-1-andrewprecious388@gmail.com>
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
In-Reply-To: <20261012162258.811103-1-andrewprecious388@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0451.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH5PR03MB7910:EE_
X-MS-Office365-Filtering-Correlation-Id: cebe1fe3-829e-4fd3-cd27-08df28901ed8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|10067099003|18002099003|22082099003|3023799007|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	G4dnLXLEVOZn4jTLqV7dxN4nbwJnAz6c0Q5esygrAV8pnGRelrii4+11oIyeE4A6jOfnRb+K5yaVteX1BfLSoOUnM7LsqaAx1G/mxmMgmBOGge29zoQ096n/zTatOr5Nx9o/VmwRxgmBerpdWjN+eCh8GOxOxABjLosGAfSw0EJhFnfQl9AukgKYM+8qdBrJKZwzVf73Vyg8Jk1yFu3b5gOX/Dqyy2oy0mjOwqk2ZKorsXNrrfneW0WPnugoYixYzz55spyU2o+f4aa55J+T5T3yuF72ZFK4r7QFqXO9s/ihUp7+GharOmRBR39rGBX7ai5wZj9iX1oGYhqWxb5+oetfaRjSJGGpxj2Kid5k21fEKrxR5hfppUw4YXOKPfeDzETZojmVYyjfjc8pU8B0gwnCjVizZSnkvwvz3y2yuaDV83iqL73ZhpkA2f1c2qv61bxN9KvLGVU0ZvkZUgEJDDa9QL2AKc6q7IfZEnBEaiiEz54UVMIK5gIiloGkwEuzmziNCtVQtUdP1rTaTOFQxlvolTqbyLao0eZlE7rB02M5kcLwb6ssv44QSvabXZjLa6TJlRFtdfCXn3tUxbxJoRmLdsycAo7tGq8Xb+5kIqjRb59geuPH0ry8tK7Kq/Ib2uUjtf0+d/pOUxYR3wRLV78DJmU5YtmoXR1tVdNu3UI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(10067099003)(18002099003)(22082099003)(3023799007)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bC9xRVpoNVJUbGpNZTNFdXdIbW9IVVAwSXF4eFllTTZDR21yaGpIM1FOclpU?=
 =?utf-8?B?SkgyTHBOZUorZE9tY29qSUR3U2ZiNm5heDdYQ1RvS3VWWVdtb0ZkNzNVb0k0?=
 =?utf-8?B?blhMT0l5T2k0MXpQWmhPU1BPUzNkUjYvMVF1RC9wbFQycTZSYkdYK3VBcWRt?=
 =?utf-8?B?N0swc0J6ZUltb0xoYnRHV3B4ODVWMERxek8xZG1rWnVpck8wTVlzQTFmWWNh?=
 =?utf-8?B?WFc5WWZxbkh3OTM4bERVSFVkVmNOSUdobTBsLzVVYmlRZnhKbS9CSGYyclI2?=
 =?utf-8?B?R3BsWHZQVTFGSjFFMXEwRFp6M09taUZmcXpzbCtQSXVnSDVKaXNjUHNhVjg3?=
 =?utf-8?B?RGxlM3hpcGE5d0l1aVJFdGFUTDlmOVlyeW5LTUhMeDAwbHA4RUNmZDdLM25h?=
 =?utf-8?B?d0J0RVNaRldjTFFCcFhxWXNDWTQ4ZFJIQ1RhTUpkSHh5VmZpUkNWb0VYa2Zr?=
 =?utf-8?B?bjhvUzUxMmhWSU9Dakt4dXJ4NXAzd29iRHRUbXFoMGRkeDljVDdpWk45akdp?=
 =?utf-8?B?Q1VlSGtTSEJVZFBJMUZ3WnJVbTdONjB6NzRVRjI2VmpwNCtzSnRTWk5nS1Fk?=
 =?utf-8?B?R2swWHZpdnE2bW9zYVNQaWwyV2FrWHRRMDlrbGtXWHd4Tzh4cDFMQ3JlV2ZE?=
 =?utf-8?B?SVZ6R09OYXJwNDh5SDZ0b1I3SmpEbmw5czZpM2plbklCdFNhUHRVRXhQK1oy?=
 =?utf-8?B?T0ZhOURHWXpnS3drSVBKWktyWXQ3a3BWc2lxT0oyR3hhYlptVE1ab1RXOWtS?=
 =?utf-8?B?Q2NXanJFUzNvV0JCdk42WlNON1V4ZVB3MDNWQ2h3Wko4UXU1bE85MGRaQXJP?=
 =?utf-8?B?VnQxVGJxVnY0Y1FuV1MyUDM4UEVTS3o2czEyalhuS3lIZ25qR2NMbnNKWXBB?=
 =?utf-8?B?Q3Fmcml5Njk5VCtwZExFRHhwREorVmwwVW80TVcrdUp2QzVhZnlGUmlVNkkr?=
 =?utf-8?B?bUJGRWtyOEJRL2Z3VHNwUlc5TXllTE5STVNtRzU4UE0vTUhxdCsyb2J5S1V0?=
 =?utf-8?B?VHdMbkJTdGZUbWxXRERKNzlLVHBaZDBlK0hwSUpobkd6dXNEWFBHY3BWNFhM?=
 =?utf-8?B?d0VjN2tXeXZCa3lhM1N2QzZtMzY3aEU4cThSL1pBQ1FjL0RMVXNneWpjSHZq?=
 =?utf-8?B?V3FYT0MvTjk4aDJKRW44dWEwMmJoQ21HTXk0S3RldHB4dldlNFJ2c2Erc3U2?=
 =?utf-8?B?aDhwUlM5L1J3MXF5cVZFVXVCUmJ2WGZ3UmVRLzFvN3hXM0J0Nkt4VytnMlNV?=
 =?utf-8?B?bS9LdW1mcFFNVXdRRDJaWkFTQ1hNZDZ2Zk13T2lqNW5Pc3dNQ3Q3Z3d0eFlM?=
 =?utf-8?B?RTVLTytzVnJvcSs2NTAvMUlTM3RnUXlLMDBqMTdRb0dxbUd4TmYreGlOU3RZ?=
 =?utf-8?B?UDZIZDM5RXNjUUN3S0tMU05HVzRqb0hrL2JhTk9GVE1LeThMN014U0poSUZP?=
 =?utf-8?B?L2VXOVhNcE9xMEJRUVhBaVFIRE02OWkydVNBTEhzNENSY2laRG1yUXdUTjdZ?=
 =?utf-8?B?TExUWkxLWGMwY1hPQkwvTDEwWUxYa05UenFna2FFZ3dRKzFrUVJXRVdrWE0w?=
 =?utf-8?B?V3BFR0p3dUE2VXdzQnp4MGN4VkNMUzMrMmd1SHlaa2cxbkZibkJQTjg2d3ov?=
 =?utf-8?B?QXBENTVOT0hqK2lQM1g0TDRoOHdxTzhRaCtYbm0yREtQNGxjSmNxZEFwZUcx?=
 =?utf-8?B?by9qei9YTnRaRE94ME1CazYyZmhUY2hyQkF4TlRWV2JzaWU5T0RrSVVCSXZ1?=
 =?utf-8?B?ZnB0M2U0WGx6SUp0UU0wZjYxVmIwSXVDSExYSk1saWEvTDFpZ1V2cE1hY0tl?=
 =?utf-8?B?KzlZTHI1azNaWFpRQ2ZudTJpVTdTQjB6bWx1VjQ0UGFUd2ozb0NjdVZCSDZn?=
 =?utf-8?B?TTRJVWhoNWxMbFFIZXNMTzJRTDdWd2JlalVBYldjdzFuUFVDaW5ZTlZ5ajNO?=
 =?utf-8?B?UE9GaFNZQWtpZEdkdGNVMXVPSHJvMTJIY1M0K0o2NFBmbFlUR2duYTVieUlY?=
 =?utf-8?B?bWFlRnBTVVlTNUxESExvVXdrZHVSMkhRcmdrQ3VvRS80akNyL0o3NmxkVE93?=
 =?utf-8?B?SXhTNjhDMnVTbzdxSDdhYUpsNVlzM3hsY1JjazFWTjZNY0t2YTJZMmFQdXMy?=
 =?utf-8?B?Q3lwcVU4UlpKYVVORlFwSWlhYjZxTXp1TDV3Wlh4Ti82Z1RTTG95MUZnWkpU?=
 =?utf-8?B?cHU3VzgvRXRXZEZ6VkFnVkMyQnNGMFFrMk40eGRPajdSajZMbXQ5S0JCeTlL?=
 =?utf-8?B?SWVNZUFiMnBjQjBPcDFhcWIzc2ZOTTVCSWtJZHJPMU9nQWd2K2s5cXYwYjdL?=
 =?utf-8?B?VFc2cUVNWmZIR0duSFE2bTZpb3Uwa1BpVTF0RTYrcUtKVElBa3NXUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cebe1fe3-829e-4fd3-cd27-08df28901ed8
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 18:39:16.8713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dhm+APXaEyNtvYBOyQfPi03eDXPXJ2W272VT8XB3eH+lKWQVmzfCkOPVVMFgzES/2M4TbdYDweZfo0bvyk2c5iNwy86wzaaB3ab/1zMGCdw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR03MB7910
X-purgate-ID: tlsNG-4011c0/1791830361-530D9CFC-B087B0A8/10/77776452383
X-purgate-type: spam
X-purgate-size: 5008

On 12/10/2026 5:22 pm, Andrew Mbugua wrote:
> Resending this patch a new after fixing mailing list spam rejection

For future reference, you should have [PATCH RESEND] in the subject, and
this note below the --- after your Signed-off-by tag explaining why.

That way, it doesn't get inserted into the commit message when your
patch gets taken off the list.

>
> The TODO comment at connection.ml: has_extra_connection_data dates back to
> commit 42f0581a91 ("tools/oxenstored: Implement live update for socket
> connections"), which started dumping anonymous (dom0 toolstack) socket
> connections as "socket,fd" plus watches, but left the SIGTERM /
> file-based restart case unsolved:
>
>   (* TODO: what about SIGTERM, should use systemd to store FDS
>       || has_socket (* dom0 sockets not * dumped yet *) *)
>
> An fd number is only meaningful for an exec-based live-update where the
> fd is inherited. It cannot survive a SIGTERM/file-based restart
> where fd numbers from the old process are meaningless. That would
> require stashing the fds in systemd.

It doesn't require FDS.  It requires some external store of file
descriptors, e.g. systemd FDS.

xenstored has to work in non-Linux environments, and IMO will never gain
a dependency like this.  We already have a self-exec mechanism; a
TERM/restart mechanism is just extra complexity for no benefit, as it
would need distro-specific logic to help keep it's FDs around.

>
> Additionally, Connection.dump never cleared CLOEXEC on the socket fd
> (unlike DB.to_channel which does so for the listening socket), so even
> an exec live-update including a forced one with `live-update -F`
> which bypasses prevents_quit, loses the connection and restore hits
> "Ignoring invalid socket FD".
>
> Resolving the TODO without regressing commit 42f0581a91:
> - keep allowing idle sockets for exec live-update; pending partial
>   I/O still blocks via has_in/has_out and SIGTERM clients
>   simply reconnect.
> - clear CLOEXEC in Connection.dump so the dumped fd actually survives
>   exec.
> - replace the TODO with a comment explaining the remaining systemd fd
>   store future work for SIGTERM.
>
> Ive verified that make builds oxenstored cleanly

"I've" and full stop at the end.

If all you've done is build test it, how did you identify hitting
"Ignoring invalid socket FD"?

For a change like this, a build test necessary but not sufficient.  If
you're unable to run it, you can ask for help, but FD issues can be very
subtle and this can't reasonably go in as a speculative change.

>
> Signed-off-by: Andrew Mbugua <andrewprecious388@gmail.com>
> ---
>  tools/ocaml/xenstored/connection.ml | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/tools/ocaml/xenstored/connection.ml b/tools/ocaml/xenstored/connection.ml
> index 37eb2444b9..e535e7cea6 100644
> --- a/tools/ocaml/xenstored/connection.ml
> +++ b/tools/ocaml/xenstored/connection.ml
> @@ -435,9 +435,15 @@ let has_extra_connection_data con =
>    let has_in = has_partial_input con in
>    let has_out = has_output con in
>    let has_nondefault_perms = make_perm con.dom <> con.perm in
> +  (* Socket (dom0 toolstack) connections are dumped as "socket,fd" plus
> +     watches by Connection.dump below. The fd number only survives an
> +     exec-based live-update when the fd is preserved across exec (see
> +     dump); it cannot survive a SIGTERM / file-based restart, where fd
> +     numbers are meaningless. That case would require stashing the fds
> +     in systemd (fd store / socket activation). Pending input/output
> +     already blocks above, so idle sockets are safe for exec live-update
> +     and SIGTERM clients simply reconnect. *)

I'm going to go out on a limb and guess this is AI generated, because
it's total slop.

It's a full paragraph explaining why we don't something which itself is
not relevant to how the logic works in the first place.  It's a
backwards step.

>    has_in || has_out
> -  (* TODO: what about SIGTERM, should use systemd to store FDS
> -     	|| has_socket (* dom0 sockets not * dumped yet *) *)
>    || has_nondefault_perms (* set_target not dumped yet *)
>  
>  let has_transaction_data con =
> @@ -464,9 +470,13 @@ let dump con chan =
>        Domain.dump dom chan;
>        domid
>      | None ->
> -      let fd = con |> get_fd |> Utils.FD.to_int in
> -      Printf.fprintf chan "socket,%d\n" fd;
> -      -fd
> +      let fd = con |> get_fd in
> +      (* Keep the fd across exec so an (exec-based, possibly forced)
> +         live-update can restore it via "socket,%d". File-based
> +         SIGTERM/restart cannot restore fds; that needs systemd fd store. *)
> +      Unix.clear_close_on_exec fd;
> +      Printf.fprintf chan "socket,%d\n" (Utils.FD.to_int fd);
> +      -(Utils.FD.to_int fd)

Where do these sockets come from?  What flags where they opened with?

~Andrew

