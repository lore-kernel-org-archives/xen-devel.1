Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E313C55184
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 18:57:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382578.1625927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrKJw-0000DG-A3; Tue, 04 Aug 2026 18:57:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382578.1625927; Tue, 04 Aug 2026 18:57:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrKJw-0000D9-74; Tue, 04 Aug 2026 18:57:00 +0000
Received: by outflank-mailman (input) for mailman id 1382578;
 Tue, 04 Aug 2026 18:56:58 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wrKJu-0000D1-Fy
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 18:56:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrKJt-007Hpb-TJ
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 20:56:57 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a7235f7-bab6-0a2a0a5309dd-0a2a4503c0de-2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 20:56:57 +0200
Received: from [52.101.201.32]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a7235f8-fae8-0a2a45030019-3465c920e498-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 20:56:57 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB5744.namprd03.prod.outlook.com (2603:10b6:a03:2df::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 18:56:54 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 18:56:54 +0000
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
 b=dZ4zYWrsN8oWBYgoAXI/nKbyFSxWnRUWjohv4CK7Azh4161lnCyI/GgQzhAnH6ImBbcDQyYBjAXPOAYW0Zkgkt8VH0odFDedL2+nMIZylShVf8h+eZsWsIDRSnmjtr9EGSxGiJfCBcNVKZC0dc8KzoUz4fNturTK/koK7/68DRlcUFQATJYqy1gICJmpuIcEG7r0emojqxkaGTViLu+s72Pa+Rq2VKeJ4fEX6d1ow7US/ih1Qpzm1tqV3o3HkDL9iPMR+SSJDXtUlubxvQThJ0g+lVI5NhNMIoJm0wLqHMuP8/1FsSWavJgPHcgJguA3+Y7DGhjvh4YWa9uN+MZwbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1w149KaIoZYVexb5ZFISq+2+xbDLHCF6EYoXbL5OQfo=;
 b=hgNFCYDgDm87wr2soKnPoiGb7mje4DZhBbnWqUhFL1+utAyGU8Lt0aUys2x9/gJZbIJfbr87aQvKp5MIo3LQ/ZPA9XZwlj07M5l3EbV4OKtUsUejt9XH47bYuZPFuBqOPkzgC1hzBTjoTdPNPV3Z39h19mDMsuuRxrSmwVWGAQjGJhGDTl9R8oCJGrozNZ2zp3DRXzIpJmcUMzVK83HJiC1HD9N5sxZan+TF/3Gn0rc6+/nyJZHFXzEfpoN9sdwCOiXwNcAYnGOafW2vRe2GgeDgr5zoceJlLFMYreEI5FBc51drjTPtISjGEMCnDwKWU95vUquvSF1xVUPTxrGkdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1w149KaIoZYVexb5ZFISq+2+xbDLHCF6EYoXbL5OQfo=;
 b=WPFyTRVB2q89x6G/gG2rRdUMnuizp4PFgw8sZs/VU+8h5iq4PsXK7OB6YTIqprZ1ypAtjBbzBXQUrzd2w9rSKgWsExjZRZMNpD7DGd5dr/tlUJK57O/KYOzK5BN32Gv9ttAqh8Ztvi2SlTXEowMv4gtx4YbgoxH8d0l8KYL3sPE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1e1a1c4d-5ffc-44b1-b26c-244c9af1f250@citrix.com>
Date: Tue, 4 Aug 2026 19:56:50 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/5] x86/emul: Introduce x86_decode_lite()
To: Jan Beulich <jbeulich@suse.com>
References: <20260803072006.9678-1-andrew.cooper3@citrix.com>
 <20260803072006.9678-2-andrew.cooper3@citrix.com>
 <01b27228-fdc0-4546-aa23-2bcdafb22727@suse.com>
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
In-Reply-To: <01b27228-fdc0-4546-aa23-2bcdafb22727@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0076.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB5744:EE_
X-MS-Office365-Filtering-Correlation-Id: f3188295-7335-4f44-c169-08def25a267a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|11063799006|10067099003|4143699003|56012099006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0Wx8Yrry1XeYdH6+UBKnATy523sKY/cOcQOSWSSiuAI+YZKqGmtZUZiKAWGGOxusV6+YFD8k5orfl1ZCeR5LycwXOu8KszZgFyvuSd3+T6XzqetVAIcRn9M+vROELfAdBidhFxqf0GnApojKmvVsuDhL4eElLooH7wr+uDwiwgmkCNkXefEgKhcuVS3nI6a2VqoEM3MbxFPR39/C1n5UsmZMTKo+BPzTZSTAjxj4HviPwK4D/GYGMllxb9FyPVqhcUbXCqsfbXwZrxRBqZ/TBAdGRoTf4JUB+aBSWQd18lsHjJx27Lb6CqqbT8Pd/4gknNVLfaBVXekR/vcjffresJ3aY7P+SxK/eMkL4dW/AZwBfi0BnuQn1VQBOgoEiH7AnCG/8/B70hpJAsIrSxmZefuOtAwsqciIi0JsTZjKyOcpiALnTZTsGtbQt+PXwJUVehRei6KCtukJ7LOyJbJjD1KODGiqm5FYGJR9Vs7mtC4sMaABhYD5t0gI9sUkzilkWUMI2isJBEaoSehb6utloTxCyFbv/p75T3Lq4ZPzucMoNt2qXCzDmfqxleH8auEHs5tkTFs7t0H1Y58UqPRjiOfat/dic+UEQp5J7mBeVL0Swb/25PSJHx6McCKeJa8FRFRB9ikjVpNUDEouoEz+o4PAKOiEGskfMoFN6C9PwDs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(11063799006)(10067099003)(4143699003)(56012099006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3o1REk1OU9wS1ZUZ2FmeVgvU3lnZGExT1NVR2oybnArR1RlcVIwd2lkdzhL?=
 =?utf-8?B?OFRVWUNwSGh4MnBKL2U0UjB0UkZ6djEyM0NYZmlXTEVqTUEySjNhRWNKUEdi?=
 =?utf-8?B?YmVFN2hJd0pmT0lkMW5aUE9MbkN5eTl0Zk5JcHdTM2JGQnVXaXYzK2ZRcm83?=
 =?utf-8?B?cHY2N29jdU1SbE1tNDhwV0tiUU1NNHFlaDZtS3BnQ2xWRm1mT2lVTnFRbTJj?=
 =?utf-8?B?ODFCL2lCZWhBTmZQaFp0TjdMWkRaMjczWlVJOUordzMwa3JwYzN0R0s0dnZZ?=
 =?utf-8?B?YXBQOU52ZGVXRTRwaGFIVjhQSk9PTkc5aHdXaGJGR2NTSGFTY2tFT1hsTFkw?=
 =?utf-8?B?SEtvcGFRWFhKcmF5ai80RmtzaW9VenpBbGRiYXZWTnQ0U0xYK092anNvWmh0?=
 =?utf-8?B?bUNFeUYxMXBaQ3ZWS2VlUmNMRHpIbDUvaUdiMVVYeE9WWS9QYld6ZjQrMTU2?=
 =?utf-8?B?dCtJQnI2ZUFxVWloN2tlSitNMGU4SWFlYzhva0lzZTZuRy91MC9RK0RiZjlj?=
 =?utf-8?B?ZzBHbUM0UEgzNURHQ21MaWNkWVdXaHlqSkJ6KzRJQVBTdUFtNGkyZTBRK01L?=
 =?utf-8?B?NmtPTEhxdzYwYXJGTUxmV2QxblR6cG9Wa0xLbmNDWGxJM1RLeFFMcyswNm5W?=
 =?utf-8?B?MzUxLy9GVkVKMk40eDJQc1hNRTlENVBuOFFnb2ltSW9EWVpLbmxaUzFXWElw?=
 =?utf-8?B?TDdmR0hGM0Y4V0d6RHY5WCt1eXlFMzJZRzVqck5WSzlzM3p1Vm8xYVlnSm1y?=
 =?utf-8?B?bXZwZzFRbmE3cUxQeEVuaWNxYTF4VWcwVVVaY3JVcExuQkYwT212NVNjcGJH?=
 =?utf-8?B?cmFGS3Zwc0NDNzUrUzlESWVudWxXTnhYam1QT083ODVZeVJTaEsxNHhIQUVy?=
 =?utf-8?B?aElUT0NvSk9FYVorMVNVeGR3dFF6L2xpbHdydmdCL1krQml6NHV3d0JtTGpn?=
 =?utf-8?B?aE1uaUxlTVJ6TGs3bFRrelZIYmhqaDZPS3Bsd2ZjVWdaOGl5Q2xFQ3FZWE9B?=
 =?utf-8?B?Q0FPY0h0ZWEraFhtck9YanRJVkpWN21pQjF1S1NpZHpwbnNOTG4rLzcxeW9u?=
 =?utf-8?B?dUhMQUNvdG1oenBBM2o2NElPQmRBa2FtdFlBcXJhSE9yWGFJdzloNS9yRGZ1?=
 =?utf-8?B?b1VCdnNtMko1SzZodkJzYTJEUjZocC9RNDRpRzBWUDJVMStkRCtVSDNKd0tO?=
 =?utf-8?B?Ly9QYjBLTU4xaXFEeWN3dWhTR1gva21YUlVBNzkrb3l4THU2aUJnUTVkOTNk?=
 =?utf-8?B?ZWN3VVhYQ2E0TXc5NlN5em9ubXBXWWh2OEJDWGd0L0VQcmF2cGF1dVlTZW0x?=
 =?utf-8?B?WTRaQVhKd3ZUMTZna2QweUJOekdETmdYL0lDTDBYQXRXeXBjZTd2NWY0WGFR?=
 =?utf-8?B?WGxra2Y2eDQ1VE5WT3lFbmlSK0pZWnRSaW5FTEN0TEtQTnJlSG9aV1dmMW5o?=
 =?utf-8?B?a05BaU1LNUFncnNUbjdSRGplYXpyK2dWVWJDbFY0N0Zxb2MvOC9lcDhYYmo5?=
 =?utf-8?B?eElyVkFpK0gvRENndFhEQXVxZGt5VDRZOXZKUFFFQjh4eFRMamNsdHo5VVpG?=
 =?utf-8?B?V0I5MEIraW52ZjlZVzdjM1FxR2VyZEFHTlBMeHRUVlZaZi94Vk9KR2xxeTVX?=
 =?utf-8?B?eGpjY1pRTVpxcHN3YVE0YlNLVzFXaTMxY2xqUjRFUWhGaW5SWWIwOWhwL3RP?=
 =?utf-8?B?OUZYT0hzUjlQLzZQNGdxSjhUblB0eTkvNWNuL1VXeTVPYzJhTitzSDFJUGRm?=
 =?utf-8?B?MmR3SlFLZGs0RUs5YTY2R09nbjNQRFNsTkhKSGlaNyt5ZzVEaG9Nd2dhbkdq?=
 =?utf-8?B?djBlbnVGcXY4bElvd25lcEliTi93YWUvMlFpTmxNUFVXTHZTcUtUYkJmaWhW?=
 =?utf-8?B?Sjh3amRqa3FMaGVIRE84MlNsUWNFYWszNnMxbFQwYStKN1U1aGpnazhQTzFh?=
 =?utf-8?B?NzgyblRHeUtFWWpCMEVDU0pFYmVWRmJ0cDdwSEJ1RXMzamNRbnJKUE5uQnRj?=
 =?utf-8?B?VzZkN3FPaTRvZmNaWEptQVNXVEFTWlFrc0FuN3Y0UUlEK2lCL2tQQkJaODlq?=
 =?utf-8?B?OXlQUi9DRTVFK2xGNGI4TFpRZ2NXTHorSnJKcDRCWHBPWm82V1NzYVB0RXlR?=
 =?utf-8?B?V3J6TGRKVngyOXBrNFhaS29PYTR0TkZrNHFVdHJsN0xsVjI4NThtVFJhSEFp?=
 =?utf-8?B?MDlwYkE4QXcvVkQ0dmlCY28wME1Ydms4RXkwSkxETjhPb1IrSVRXbTRHY1Mw?=
 =?utf-8?B?b1p5Wk9JZ0gyY3FiUnJZOTUwTGJJZTN6RE81TlZNeGtxMzZ5cEpNK1JCb1lT?=
 =?utf-8?B?QjZxK0tjR0JjRFRDemRlTEl5VDhUNVdpNWsxQUdkc044dnd0NjdkQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3188295-7335-4f44-c169-08def25a267a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 18:56:54.0555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IDqeZjSFeyZG2BCB9U2yZPtuzTcUpGJhwmi+dDRwmWxJtaXJ9iMLGCKm0kfvhYm9MNsAWMZyMx/jEykgN0Z0oGlj9J7uGnCUQUaBty5aJgg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5744
X-purgate-ID: tlsNG-33051d/1785869817-756834E9-7651E4B4/0/0
X-purgate-type: clean
X-purgate-size: 14557

On 03/08/2026 4:26 pm, Jan Beulich wrote:
>> --- /dev/null
>> +++ b/xen/arch/x86/x86_emulate/decode-lite.c
>> @@ -0,0 +1,330 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#ifdef __XEN__
>> +# include <xen/init.h>
>> +# include <xen/livepatch.h>
>> +#endif
>> +
>> +#include "private.h"
>> +
>> +#undef ModRM
>> +
>> +/*
>> + * Bare minimum x86 instruction decoder to parse the alternative replacement
>> + * instructions and locate the IP-relative references that may need updating.
>> + *
>> + * These are:
>> + *  - disp8/32 from near direct branches
>> + *  - RIP-relative memory references
>> + *
>> + * The following simplifications are used:
>> + *  - All code is 64bit, the instruction stream is well formed and safe to
>> + *    read.
>> + *  - Instruction groups and prefixes not used by Xen's current alternatives
>> + *    are not implemented in order to reduce the decode complexity.
>> + *  - Certain instructions are intentionally not recognised, when it is more
>> + *    likely for their presence to be an error than intentional.
>> + *
>> + * Inputs:
>> + *  @ip  The position to start decoding from.
>> + *  @end End of the replacement block.  Exceeding this is considered an error.
> Why do you mention replacement blocks here? Are we entirely set on this
> code not possibly gaining any purpose beyond the scanning of those?

It's just the end of the instruction stream wanting decoding.  I'll
adjust the comment.

>> +{
>> +#define Imm8   (1 << 0)
>> +#define Imm    (1 << 1)
>> +#define Moffs  (1 << 2)
>> +#define Branch (1 << 5) /* Near direct branches, which have a displacement */
>> +#define ModRM  (1 << 6)
>> +#define Known  (1 << 7)
>> +
>> +    static const uint8_t init_or_livepatch_const onebyte[256] = {
>> +
>> +#define ALU_OPS(x)                              \
>> +        [(x) + 0] = (Known|ModRM),              \
>> +        [(x) + 1] = (Known|ModRM),              \
>> +        [(x) + 2] = (Known|ModRM),              \
>> +        [(x) + 3] = (Known|ModRM),              \
>> +        [(x) + 4] = (Known|Imm8),               \
>> +        [(x) + 5] = (Known|Imm)
>> +
>> +        ALU_OPS(0x00) /* ADD */, ALU_OPS(0x08) /* OR  */,
>> +        ALU_OPS(0x10) /* ADC */, ALU_OPS(0x18) /* SBB */,
>> +        ALU_OPS(0x20) /* AND */, ALU_OPS(0x28) /* SUB */,
>> +        ALU_OPS(0x30) /* XOR */, ALU_OPS(0x38) /* CMP */,
>> +
>> +#undef ALU_OPS
>> +
>> +        [0x50 ... 0x5f] = (Known),             /* PUSH/POP %reg */
>> +
>> +        [0x62]          = 0,                   /* BOUND, but also EVEX prefix, not implemented. */
>> +        [0x63]          = (Known|ModRM),       /* MOVSxd */
>> +
>> +        [0x68]          = (Known|Imm),         /* PUSH $imm */
>> +        [0x69]          = (Known|ModRM|Imm),   /* IMUL $imm */
>> +        [0x6a]          = (Known|Imm8),        /* PUSH $imm8 */
>> +        [0x6b]          = (Known|ModRM|Imm8),  /* PUSH $imm8 */
>> +        [0x6c ... 0x6f] = (Known),             /* INS/OUTS */
>> +        [0x70 ... 0x7f] = (Known|Branch|Imm8), /* Jcc disp8 */
>> +        [0x80]          = (Known|ModRM|Imm8),  /* Grp1 */
>> +        [0x81]          = (Known|ModRM|Imm),   /* Grp1 */
>> +
>> +        [0x83]          = (Known|ModRM|Imm8),  /* Grp1 */
>> +        [0x84 ... 0x8e] = (Known|ModRM),       /* TEST/XCHG/MOV/MOV-SREG/LEA */
>> +        [0x8f]          = 0,                   /* Grp1A - POP but also XOP prefix, not implemented. */
> POP doesn't look all that unlikely to be used in inline assembly, and
> hence in alternatives. That said, of course using it with a memory
> operand requires quite a bit of care.

We have no alternatives playing with the stack (beyond CALL
instructions), and no alternatives which have any net %rsp delta.

PUSH/POP MEM are rare in general and Xen doesn't have any at all.

> I don't see you excluding the
> PUSH counterpart, though - being consistent for any such pairs would
> seem somewhat desirable.

It would be nice to be handled symmetrically, but this *is* an
odd-instruction-out in the x86 encoding space.

It ought to live in Grp5 where the encoding would be 0xff /7 (and beside
it's matching PUSH), except that's that's a rather important binary
pattern and wants to not be considered a valid instruction.

The fact that the group is split like this shows that the mistake was a
late discovery in the development of the 8086, where it was easier to
move the one opcode than the whole group.  (It's likely to have been a
metal-layer fix for the decode PAL, rather than adjusting the
transistors, which is typically an order of magnitude cheaper fix.)


>
>> +        [0x90 ... 0x99] = (Known),             /* NOP/XCHG %rAX/CLTQ/CQTO */
>> +
>> +        [0x9b ... 0x9f] = (Known),             /* FWAIT/PUSHF/POPF/SAHF/LAHF */
>> +        [0xa0 ... 0xa3] = (Known|Moffs),       /* MOVABS */
>> +        [0xa4 ... 0xa7] = (Known),             /* MOVS/CMPS */
>> +        [0xa8]          = (Known|Imm8),        /* TEST %al */
>> +        [0xa9]          = (Known|Imm),         /* TEST %rAX */
>> +        [0xaa ... 0xaf] = (Known),             /* STOS/LODS/SCAS */
>> +        [0xb0 ... 0xb7] = (Known|Imm8),        /* MOV $imm8, %reg */
>> +        [0xb8 ... 0xbf] = (Known|Imm),         /* MOV $imm{16,32,64}, %reg */
>> +        [0xc0 ... 0xc1] = (Known|ModRM|Imm8),  /* Grp2 (ROL..SAR $imm8, %reg) */
>> +
>> +        [0xc3]          = (Known),             /* RET */
>> +        [0xc4 ... 0xc5] = 0,                   /* LES/LDS but also VEX prefixes, not implemented. */
> This may bite us sooner or later, due to the VEX-encoded integer insns
> that there are. Of course as long as we don't use this function on
> compiled code, and as long as my "x86: allow Kconfig control over psABI
> level" doesn't come close to going in, that's merely a theoretical
> concern.
>
> Same goes for not supporting the 3-byte opcodes, which also encode
> certain integer insns.

I have no doubt that we're going to need to add support eventually.

But,
a) I don't have time right now
b) We have real bugs/limitations right now needing this functionality to
address (patch 5, and the xsave fixes, and bus lock trap enablement)
c) GitlabCI will reliably notice any new alternative instructions that
this can't decode (patch 3)
d) This function is a fastpath during the alternatives patching critical
region (patch 4)

Option d alone is a good reason not to decode VEX prefixes yet.


>
>> +        [0xc6]          = (Known|ModRM|Imm8),  /* Grp11, Further ModRM decode */
>> +        [0xc7]          = (Known|ModRM|Imm),   /* Grp11, Further ModRM decode */
>> +
>> +        [0xcb ... 0xcc] = (Known),             /* LRET/INT3 */
>> +        [0xcd]          = (Known|Imm8),        /* INT $imm8 */
>> +
>> +        [0xd0 ... 0xd3] = (Known|ModRM),       /* Grp2 (ROL..SAR {$1,%cl}, %reg) */
>> +
>> +        [0xd6]          = (Known),             /* UDB */
> I guess you consider XLAT, LOOP*, and J*CXZ as too odd to use in alternatives?
> Decoding-wise they're rather easy to implement.

They are easy, but they also shouldn't appear anywhere in Xen.

I know we've got one J*CXZ in the emulator.  I tried quite hard to find
an alternative before deciding it was an acceptable solution given the
constraints, but it's in plain code.

>
>> +        [0xe4 ... 0xe7] = (Known|Imm8),        /* IN/OUT $imm8 */
>> +        [0xe8 ... 0xe9] = (Known|Branch|Imm),  /* CALL/JMP disp32 */
>> +
>> +        [0xeb]          = (Known|Branch|Imm8), /* JMP disp8 */
>> +        [0xec ... 0xef] = (Known),             /* IN/OUT %dx */
>> +
>> +        [0xf1]          = (Known),             /* ICEBP */
>> +
>> +        [0xf4]          = (Known),             /* HLT */
>> +        [0xf5]          = (Known),             /* CMC */
>> +        [0xf6 ... 0xf7] = (Known|ModRM),       /* Grp3, Further ModRM decode */
>> +        [0xf8 ... 0xfd] = (Known),             /* CLC ... STD */
>> +        [0xfe ... 0xff] = (Known|ModRM),       /* Grp4 */
>> +    };
>> +    static const uint8_t init_or_livepatch_const twobyte[256] = {
>> +        [0x00 ... 0x03] = (Known|ModRM),       /* Grp6/Grp7/LAR/LSL */
> Leaving out INVD is surely find, but WBINVD?

Given now expensive WBINVD is, what possible reason can you think for
having it in an alternative ?

>
>> +        [0x0b]          = (Known),             /* UD2 */
>> +
>> +        [0x18 ... 0x1f] = (Known|ModRM),       /* Grp16 (Hint Nop) */
>> +        [0x20 ... 0x23] = (Known|ModRM),       /* MOV %cr/%dr */
>> +
>> +        [0x30 ... 0x33] = (Known),             /* WRMSR/RDTSC/RDMSR/RDPMC */
>> +
>> +        [0x40 ... 0x4f] = (Known|ModRM),       /* CMOVcc */
>> +
>> +        [0x80 ... 0x8f] = (Known|Branch|Imm),  /* Jcc disp32 */
>> +        [0x90 ... 0x9f] = (Known|ModRM),       /* SETcc */
>> +
>> +        [0xa0 ... 0xa2] = (Known),             /* PUSH/POP %fs/CPUID */
>> +        [0xa3]          = (Known|ModRM),       /* BT */
>> +        [0xa4]          = (Known|ModRM|Imm8),  /* SHLD $imm8 */
>> +        [0xa5]          = (Known|ModRM),       /* SHLD %cl */
>> +
>> +        [0xa8 ... 0xa9] = (Known),             /* PUSH/POP %gs */
>> +
>> +        [0xab]          = (Known|ModRM),       /* BTS */
>> +        [0xac]          = (Known|ModRM|Imm8),  /* SHRD $imm8 */
>> +        [0xad ... 0xaf] = (Known|ModRM),       /* SHRD %cl/Grp15/IMUL */
>> +
>> +        [0xb0 ... 0xb9] = (Known|ModRM),       /* CMPXCHG/LSS/BTR/LFS/LGS/MOVZxx/POPCNT/UD1 */
>> +        [0xba]          = (Known|ModRM|Imm8),  /* Grp8 */
>> +        [0xbb ... 0xbf] = (Known|ModRM),       /* BTC/BSF/BSR/MOVSX */
>> +        [0xc0 ... 0xc1] = (Known|ModRM),       /* XADD */
> What about MOVNTI?

I judged that to be on the unlikely side to be needed.

>
>> +        [0xc7]          = (Known|ModRM),       /* Grp9 */
>> +        [0xc8 ... 0xcf] = (Known),             /* BSWAP */
>> +    };
> What about UD0?

UD0 differs between vendors and product lines from Intel.

>
>> +    void *start = ip, *rel = NULL;
>> +    unsigned int opc, rel_sz = 0;
>> +    uint8_t b, d, rex = 0, osize = 4;
>> +
>> +#define OPC_TWOBYTE (1 << 8)
>> +
>> +    /* Mutates IP, uses END. */
>> +#define FETCH(ty)                                       \
>> +    ({                                                  \
>> +        ty _val;                                        \
>> +                                                        \
>> +        if ( (ip + sizeof(ty)) > end )                  \
>> +            goto overrun;                               \
>> +        _val = *(ty *)ip;                               \
>> +        ip += sizeof(ty);                               \
>> +        _val;                                           \
>> +    })
>> +
>> +    for ( ;; ) /* Prefixes */
>> +    {
>> +        switch ( b = FETCH(uint8_t) )
>> +        {
>> +        case 0x26: /* ES override */
>> +        case 0x2e: /* CS override */
>> +        case 0x36: /* DS override */
>> +        case 0x3e: /* SS override */
>> +        case 0x64: /* FS override */
>> +        case 0x65: /* GS override */
>> +        case 0xf0: /* LOCK */
>> +        case 0xf2: /* REPNE */
>> +        case 0xf3: /* REP */
>> +            break;
>> +
>> +        case 0x66: /* Operand size override */
>> +            osize = 2;
>> +            break;
>> +
>> +        /* case 0x67: Address size override, not implemented */
>> +
>> +        case 0x40 ... 0x4f: /* REX */
>> +            rex = b;
>> +            continue;
>> +
>> +        default:
>> +            goto prefixes_done;
>> +        }
>> +        rex = 0; /* REX cancelled by subsequent legacy prefix. */
>> +    }
>> + prefixes_done:
>> +
>> +    if ( rex & REX_W )
>> +        osize = 8;
>> +
>> +    /* Fetch the main opcode byte(s) */
>> +    if ( b == 0x0f )
>> +    {
>> +        b = FETCH(uint8_t);
>> +        opc = OPC_TWOBYTE | b;
>> +
>> +        d = twobyte[b];
>> +    }
>> +    else
>> +    {
>> +        opc = b;
>> +        d = onebyte[b];
>> +    }
>> +
>> +    if ( unlikely(!(d & Known)) )
>> +        goto unknown;
>> +
>> +    if ( d & ModRM )
>> +    {
>> +        uint8_t modrm = FETCH(uint8_t);
>> +        uint8_t mod = modrm >> 6;
>> +        uint8_t reg = (modrm >> 3) & 7;
>> +        uint8_t rm = modrm & 7;
>> +
>> +        /* ModRM/SIB decode */
>> +        if ( mod == 0 && rm == 5 ) /* RIP relative */
>> +        {
>> +            rel = ip;
>> +            rel_sz = 4;
>> +            FETCH(int32_t);
> FETCH() here but ...
>
>> +        }
>> +        else if ( mod != 3 && rm == 4 ) /* SIB */
>> +        {
>> +            uint8_t sib = FETCH(uint8_t);
>> +            uint8_t base = sib & 7;
>> +
>> +            if ( mod == 0 && base == 5 )
>> +                goto disp32;
> ... goto here?

Hmm.  That's an artefact of how it developed.  Swapping this goto for
FETCH() does drop 20 bytes, but the function is rearranged so much that
it's hard to tell if this is because real logic is getting dropped.


>
>> +        }
>> +
>> +        if ( mod == 1 ) /* disp8 */
>> +            FETCH(int8_t);
>> +        else if ( mod == 2 ) /* disp32 */
>> +        {
>> +        disp32:
>> +            FETCH(int32_t);
>> +        }
> In several cases the FETCH()ed value isn't used. Compilers as well as Eclair
> (and alike) are happy with that?

Yes.  The cover letter has a fully passing pipeline.

> And compilers also manage to eliminate the memory accesses then?

Yes.

>
>> --- a/xen/arch/x86/x86_emulate/x86_emulate.h
>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.h
>> @@ -835,4 +835,18 @@ static inline void x86_emul_reset_event(struct x86_emulate_ctxt *ctxt)
>>      ctxt->event = (struct x86_event){};
>>  }
>>  
>> +/*
>> + * x86_decode_lite().  Very minimal decoder for managing alternatives.
>> + *
>> + * @len is 0 on error, or nonzero on success.  If the instruction has a
>> + * relative field, @rel_sz is nonzero, and @rel points at the field.
>> + */
>> +typedef struct {
>> +    uint8_t len;
>> +    uint8_t rel_sz; /* bytes: 0, 1 or 4 */
> Perhaps use bitfields in favor of fixed-width integers, seeing what
> ./CODING_STYLE says?

No.  That destroys the code generation improvements gained by returning
a pair like this in the first place.

~Andrew

