Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95EDC98317
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 11:20:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1432093.1653639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9hVG-0005ki-Kv; Thu, 24 Sep 2026 11:20:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1432093.1653639; Thu, 24 Sep 2026 11:20:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9hVG-0005kb-Gv; Thu, 24 Sep 2026 11:20:38 +0000
Received: by outflank-mailman (input) for mailman id 1432093;
 Thu, 24 Sep 2026 11:20:36 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x9hVE-0005kV-M4
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 11:20:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9hVE-0059a1-2S
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 13:20:36 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ab50779-2eae-0a2a0a5409dd-0a2a4502d790-28
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 13:20:35 +0200
Received: from [52.101.46.69]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ab50780-6ca4-0a2a45020019-34652e45d27a-3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 13:20:35 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB989329.namprd03.prod.outlook.com (2603:10b6:510:3bc::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Thu, 24 Sep
 2026 11:20:30 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0428.015; Thu, 24 Sep 2026
 11:20:30 +0000
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
 b=a8EhlMAxNe+M3ryWBeCR27g29Fs8ZPKWXbCD7txTsJm0ovdXgukG4ngx9RTKt6P4sZVcfwRkq1sY5K/xFalbTMVKNKX0ApvygSeWCljkbAUF+3QvBOkFferR4IAwHxLKU0zeY+ztROY8vAu2DDHyTvYltkd0kdH9NJMXTgQO2KI3/8Mwp7tgttxU1IJ3icbka4TtqOFJQss8NmEZlXxWU02Qs1lPLLmByeblpAiPkopb9PNEL7HM0lZ/Eltv8t2Rf9mVTvRqWi8q65IxPGYqPVz5VXU6qVUDKnANg2AM8bGGlT2GtZq9WJMiRgBQyf0A2q3dckGKuy2dhsF9lrTGSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bkMPe0iTwG6ARSFHo6bi3VNGOcjGzc4CiGEWspknZsw=;
 b=bzxO2HO1sR5QqRc46xPEA726+YsASIjfCisFaR2BG2ArS9JhYPSnTAf8co7KpT6ET6vHban5A1PFoDeKkZTFF2KsexREa6bRn099uv5Qvv+uu0qwTbIRojbozmsNvR9QPey4bAUccAYxZXxJBBl3sLhFoGbSz/pso43MI2RgTTbJ3NXZOQIFPDc5WsIjjFMoXQtSjKuJsG/kOMZNPXaHSHeSN3fb6Yt3qNClze8iFGjtoTjtt7SatBtgR7xolw3u3frJFDAwHk99Tq88+PvykA24JCMeNDw7DUwBwO5pxKeNJoYBbuluOQlU2tN+J1OTlnB8+UwVfSlCRMrVUHAb8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkMPe0iTwG6ARSFHo6bi3VNGOcjGzc4CiGEWspknZsw=;
 b=oOEW2UMyO43n9dJ0BW9XKQaj/GIRRiSJZOLAAq5QAjIDIds2ULlPTYVFI/k5rhlMuuFb2CxNJIIFQGnSeoTrQ9JRYCFp22vmcLm52CY0wBiZ0aJs8QDyLQt8RNS3ls/AdRvM1V7W/5gyiDFf5ElQz0ixvbKhDqkqh1x5ymV3QQo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b444508c-1684-4999-b560-c95b9be0efb4@citrix.com>
Date: Thu, 24 Sep 2026 12:20:27 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/hvm: Clamp Viridian features to known set
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20260924110342.1045230-1-ross.lagerwall@citrix.com>
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
In-Reply-To: <20260924110342.1045230-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0036.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::23) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB989329:EE_
X-MS-Office365-Filtering-Correlation-Id: 309931d2-30df-452b-5b8f-08df1a2dd7bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|6133799003|10067099003|11063799006|5023799004|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hMqXiQktY/uNn33aws754epiiMXp7zafqSM3BgNQ2jD9aWduaXlRekOZAUrtS1Ss9wkcyPQESMmJdLZHb93Zm69FEU3Ss4uDV2nu1EU+KJ1BnSAG82+0DL9uOCswdI4yb9pTWJYSvBIoCKSqiCqJRZ3jtnhBe6LRcERg4wZjvjAiPlNXfJkAPJkSqCl4vT04XxtzAQvmdM3lWqTIy9IabGnAq6AyqfWMh0Fl0+TbdRIRmcanCFSJpv3T6dczt50MyZviGRIC5Q91h2Wa5o3TGlrYCwaFXUy1CEwO6sou04iP0QKjBKJOIp0HpZ2CpO04GhXghAmLnXKMS+eOtLbVmmzm8k22N9/LU4gaFt/P/yHAgzK2ZB7zDDcuq1Xmb+R3vuSgAE8Bbj0dn8js+mix2odoJOwQwjnrr8bFQsbAiggu93QDLt75K+UNBzle71TJHIfqN6ZsbIfMPAgstvCDdj4GOTJFBVmkXwRp4UobxEa846sNfPbzr1vBTdjcZ3g8CKHmOaIaTXOc+xJIUrMZ1SERlizAiU+7Ox8np4SEQP/muPudTxOMCupf5nYMdqPs5QDhYhBFQJitxKS3CENrKmfE5CMxGnwwy6kFcuDPpnLBK6uS89OhBEaZjeA9jY8PRDs3Rg8eaaRKoidT37FtbNibBlbfWSjE9YI33ATxxoA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(10067099003)(11063799006)(5023799004)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akJQQStOZTVDRWxNSDdJbUN2UnZ0M2RaZlowTllodE83SnhhaDJRS0hQRGhL?=
 =?utf-8?B?RXpLMVhZdWdHZjdqWjdwdWdCbEdJVytiZmRoOTVyMHhlbU9FdDBoK1ZWYnNL?=
 =?utf-8?B?WitzczljWTJWWitpVzVvQXRPckQwUlN0VWNGdnR3ZnpCR2djNXRtNkpaVGVJ?=
 =?utf-8?B?WkF2cnRYcGZQanJaTHdtYWFkWTRRTXNZemdiMjhldzdFSEpDTGUyWEd1b2Nh?=
 =?utf-8?B?MC84QUNIT0JmZXpKVGlzK2MrV3U2NDIvSFIzSjRnMHp0eUxXeXlQMFAzc3Q5?=
 =?utf-8?B?d2l3aEJtYlVXbGw1bEM2ZmFwZ21ZQkNBcFN0TlZMZWNBbzVLQTdhaXVKeGxW?=
 =?utf-8?B?bGpRL3Ivc3B6Um8yTHd3RWduREVuZjVITFNrVk1Vd3RBRGhkSGN6dXZ6SHJH?=
 =?utf-8?B?Z0NWMXRteU9tb0c3K2tOQlRTK2dNQ243cFJndHBLOU56cE5oNmNxVE1ZSlhm?=
 =?utf-8?B?OHFCdDJ0VlFic0ZudlJtbkYwN1pIR01PekZFYWJFV1lsNEF4d1Rnb2VNRmJX?=
 =?utf-8?B?VTFiNUtaMllYUVNPTURpZWJnUVlqTkMzRi9VNlhOakYzSFRoRC9xMS9WcEVq?=
 =?utf-8?B?Y245bEc5WUxsM21qa21HL0pKYmJLdHptU3lnd1oybEZqNEkxUUNJdmhNK3JC?=
 =?utf-8?B?QzlINlUyWk5JQm5SczJyUTNuZlhycVRpa0k1OFNMbnlpY0ZWUStLV2lCUEhF?=
 =?utf-8?B?REs4MjAvTHVqY3pqYk9Hc0dXbGtYU1gxMk1NZzdWa2RWa24rb0VFWVdYK1I4?=
 =?utf-8?B?WFI3aTRlSFBrVS9LWkxMZ0FVQ0Zad1grQ2VlY0taak11S2V1ZmRiVkFVM24v?=
 =?utf-8?B?ZFh0dHVacVE2bTViZlFiYVRSc0U2OGhsSHhJWlljWkxvSE1IZ2lIWGI0UDRW?=
 =?utf-8?B?Vy82N1UzeEg4ditveVo3UEk2WnlkS0NJOVljL3lhZ25UanZLa2FtemhURk16?=
 =?utf-8?B?eDhGaW1SeGFqcXE5U0E1WWJISmJReFhCYTh5NXVCOEwzMDNtWWo0Rm42V0Rl?=
 =?utf-8?B?aHF4d3gwZmgyMU5DRlgrVWdYUGg1MS95YzdXdk51aW1vZVdUSGZVL1pmTnhJ?=
 =?utf-8?B?TVJaN0hicDgyVzBXYWZIOEUvZThuOUovWTkzRFVmeGdpL0FLRDNqVEVuV05O?=
 =?utf-8?B?TVZUT2JlR2cvUjcxdGNESDJvU2xETzRKcnBYT244R3RXdmR2bXBpZFRqeUhC?=
 =?utf-8?B?MmFDRHFuOFFnU1hxcCs4bDdvVDdkMjBhTE9kWEJqWVAvSmZYWFlraEdxTHN5?=
 =?utf-8?B?YitGOHpQQjRRUWVkR3ExRHE3QzNVSWt0dXhYcVlzV2hoQXZSWDFjUTBOS25j?=
 =?utf-8?B?NnlOSlViN0hSVnlVeE9RRWZBYTR0UVFtaWVwVFh2dWJzSW4xdGl6TS9rQ1BO?=
 =?utf-8?B?b0FFOTB1YndKelptQ3RVZk91UXd6dlhKdHZUVmloNjBvZXBUM0w0M21XeWNo?=
 =?utf-8?B?Q2FvOExOVDNMdjAyZC9DUG5ZOHNsbGd3NjlFS08yTmpPSlJEU1pVaWV6a3pJ?=
 =?utf-8?B?Q01PaFVySWFVM2lmSHVpYytOcWwrOXNvVXJEcU01WjQ3RDJ2S2RCVEV3WUJz?=
 =?utf-8?B?bUxsbUVSVjZiQmFhRmgyR2VtSXB3NVlISy81TzNCN0ZzcVNtWVpqZmo2S3JP?=
 =?utf-8?B?bGhJYllna0ZzdHVDWlU2SHZqTm13UjQ2V21JQTk5L2JMbkk0OUIrbTB2MTlH?=
 =?utf-8?B?ZEo5S05YQjFBYTBEVG1RT0NJUjFGWDZ6RVdzcmdOODdGbHNFOGRpb3dZQm1I?=
 =?utf-8?B?NXhxSXYzWEVFWTdjT0puS2Y3d0R2S1NSSWZJMTRLOWpCaEFmVlhsQUwxaGpw?=
 =?utf-8?B?YmdmbnVYdWlYNDg0a2J6TVQ0QXVvaE1laEVFaDROS0YydWNDT2NDM00rNElN?=
 =?utf-8?B?OU9FWStMZGlXRUlQelJkWmQ2Rm1WZG1kTjlaQ3psSkJIYmxUMVNkYWtRZGdZ?=
 =?utf-8?B?MlVpMXlNNjVYekxMTkJkU0ZEek9Cb1dUMHRJS3A2Nm10endxZWgwVzBmYVBJ?=
 =?utf-8?B?QjFld1hneU9yZkJIN1BuaTY0L1c3TU9INE1waDVQbHhTVFZTaUI2bkp0cUR2?=
 =?utf-8?B?Yjkxbkt1MHdqNTJ3enlTOVZQTUhCUktkanhBRGx5TnhYVWU0ajJmQ3IzNVdE?=
 =?utf-8?B?OVhWQXd0cHJVZzBtUXFnMjBJTmc0alZCQ0hORnNsT2hJS1J0aW1ZWlhxYit1?=
 =?utf-8?B?V1dtQUsvL1Q3WFZGOGdnc3JGeUNLVFhNaGRaVUdLb0VJTERMS0YvTlJNU1ZQ?=
 =?utf-8?B?YjhPWm8vc2txTHNaTWtEbWdkUVN5MUVlV2psemdndCszSU1vTytHTVk4ZXZZ?=
 =?utf-8?B?SUhJd2U4Qy9RQTlDSFlXN2ZJTXpIWVhSNVVqMzNCZklpSEdNTGdRQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 309931d2-30df-452b-5b8f-08df1a2dd7bb
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 11:20:30.6935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y5aRsCNLLsGfrfa4YmvDmKhLN8uiXNtjxv0CyZkYxCItKW+AAS+wFXIO/ASpZbZWxTHCT6XAP7UrPQmDM1zvBxZ0f2UbIv2nCq4U1bzHQuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB989329
X-purgate-ID: tlsNG-720697/1790248835-F14AE2AC-416D8F7D/0/0
X-purgate-type: clean
X-purgate-size: 630

On 24/09/2026 12:03 pm, Ross Lagerwall wrote:
> Instead of returning EINVAL on an unknown feature bit, clamp to the
> known feature set.

Sorry, but no.

This is equivalent to saying "I've got a VM using AVX512" and Xen saying
"ok, I'll ignore that safety check and let you run on non-AVX512 capable
hardware".

Requesting a feature that Xen doesn't know about is a hard error. 
Truncating features out like this will cause a guest using those
features to malfunction.

It is a bug that this was expressed as an HVM Param in the first place. 
It should be part of CPU Policy, and it's on a TODO list.

~Andrew

