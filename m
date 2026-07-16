Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2877FC4450A
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 10:45:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1363768.1615296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkJaY-00015Q-CO; Thu, 16 Jul 2026 10:45:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363768.1615296; Thu, 16 Jul 2026 10:45:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkJaY-00015J-9J; Thu, 16 Jul 2026 10:45:10 +0000
Received: by outflank-mailman (input) for mailman id 1363768;
 Thu, 16 Jul 2026 10:45:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wkJaW-00012v-62
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 10:45:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkJaV-00DoNB-Il
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 12:45:07 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a58b62f-e002-0a2a0a5209dd-0a2a45058d52-18
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 12:45:07 +0200
Received: from [40.93.194.30]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a58b631-4cb1-0a2a45050019-285dc21e3090-4
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 12:45:06 +0200
Received: from DS7PR03MB8265.namprd03.prod.outlook.com (2603:10b6:8:266::20)
 by DM6PR03MB4986.namprd03.prod.outlook.com (2603:10b6:5:1e4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 10:45:03 +0000
Received: from DS7PR03MB8265.namprd03.prod.outlook.com
 ([fe80::419e:bddf:320e:a1d2]) by DS7PR03MB8265.namprd03.prod.outlook.com
 ([fe80::419e:bddf:320e:a1d2%4]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 10:45:03 +0000
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
 b=B8waNPSQF3n1vSjFH65VvZHiX4JG8+Bh6CVIFX2O3Nwnk/XphgPq7o1MRwomWL6AK8Bwz6PIEJ4Oem8IHUvnh/xJ1ChLl3qGwWrzj0ggJXmQORC2b3jkTVoRM0Qn9VRy48HhvUFjKC6GiMIivlpNJc/TiHCbg3XLTuDXvhYNpU0rQLPR4NGLdwTaJ5U5OefL/en4C8S3Er50v5H6OCnevmCqoQTiYlYkE8bVaxqsBfIP4jT5mPrZ/4+4r9JcGckMCRQsCJ6cHeG4Bof9VH+vZxUEnuRwuBmZoiCoLTe6qLJZszkCHwKE1RoQikDXTxeVXWZZHKb+IDAYqyqsEs1VPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CTpAym2lhf+DC44a+eMyiTdjDTs7iIvf7olgGSYG440=;
 b=tHg44pRKXk2/S3Nm417/wgtUxmleypy69vsxbRVRUDTTOQZhwE2h8Ywd0qzlVxmDwnc3qDyv4rHw6rh28VWkC1kDHfQrStjAflEl6dP90IODD5uTwTAf+X8x62QifJU43wxFkO1ieFizy96gZZq4h890AHc11lzWgT4uQloBWxeXbt6rHQu95jjRYkv+utX44y2VqTzMOeZQLTkeZ7aqUJjsVBvVz2eS9IiMEjQwgKpf7kVV0Vyw0/HUeVPpSIPECk0MRIaRFzb3Cu9koYzbyBVLod0rbML1pQTMz5tDB52lp+bPHt1Yjd1XtFOCX0oCE9AsiaOGF2TCqLkaeiYXdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CTpAym2lhf+DC44a+eMyiTdjDTs7iIvf7olgGSYG440=;
 b=wSruXiXpKUkLZt22NpVzCKySEHobod6Z1xKF5yhhEC6x7h+pL1+3ZSOimoefLRiIzvcDdGrrbWgcZX7v+u2saqyXWzP2U5X1dT0bjcSVg5OgRNZ5Huts7JSj/QmGFgeB751VzeeR+yiQwz4qlVpeD6ueoWDNK9rM7l+0TtVfavc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1f8c6f13-f774-4d99-97f2-79767392785b@citrix.com>
Date: Thu, 16 Jul 2026 11:44:59 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86emul: V{,P}{COMPRESS,EXPAND}* can (wrongly) trigger
 assertion
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <43b0c3d2-49cb-4759-a111-8fe083c723b6@suse.com>
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
In-Reply-To: <43b0c3d2-49cb-4759-a111-8fe083c723b6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0025.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::12) To DS7PR03MB8265.namprd03.prod.outlook.com
 (2603:10b6:8:266::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR03MB8265:EE_|DM6PR03MB4986:EE_
X-MS-Office365-Filtering-Correlation-Id: 685276d0-d028-4749-5f7d-08dee3274abc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|6133799003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7vX4T+d7S/gMyHnACv8LWcrsJB5aSmDFqyuX8UDYdGmm5sWMZD2vd9WgL/6xxzy2AgW+d10A5dJUj9Mw5vQ39X00K9k0/G5P3xn5dGdHV3GMwmRv0WTfPMs6elwe4cGOU+auCXcEEfjYBIPEn+6GOcBsvg+BW7HMrhEAdejjHO2vW3/6u+WbkdQ8JGdMwzbW1edoe+J1ClBmDVotsQf44QysrWPbNs2QVuONB0WsTYfv75ks/LH1OfbFbwNADWblspuhHml9DK+R4cExYzB/g/KVJwAeQwJKNBQOfnbVZrHPrxgpG9vIUOBspCjuPXXw00mV2x2MsY5j4cIijZ09s3n8sgorORToPRyFzxz7xIm9J2C4AoE18s7GDmb1OCyjT2Nyn3LmW1GFsoFKuiUpJB0IlorM1bUl68W6xOPznGjir66Yq/UXGBj4lzOCJTqe8MZ42yai5ki4L3V3USmHSofLt4gx+WQRJReB6V+r1tbwN8RBAYulX1wLZDty8AIAFu4KLKstpHmOedzl0JiUFjKJ4MSnEsjUJmKICzwVgEdkQDvoeaJUL3CjWrHNGjH4qKmf3aypLYYk5LbEsPJg+zRJgvWjxZTFIYTYpJW1Qovbf2uUNFGsmABC9IiKvfi+LjlXLRalJfYyhtVU/BMEz6gtyr/BLSdPd8O4pcd0yUo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB8265.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXFIdjlOYWdDOEhZUUhUR1NkMzVJQmNOaEJBZjV5QW5BVzRCMmxDVEorS1pX?=
 =?utf-8?B?eDdXTG8rdE42dGlEVUZoSU5Eem9yQ2FkczEvU1F6ZnJqSEMzMUgwY3ZaZG5R?=
 =?utf-8?B?NnVjVGlPY2I0dWpRMWJHSUQ4RmxkWU1Gdk84S200WlZqWHQzbWg5bmNmZldE?=
 =?utf-8?B?aERyb00rdkplSGtEWGRvd1FRN1N4aVIvWjVKd0NtbFFhZkpYKzdJR256TVR2?=
 =?utf-8?B?d3JUaTlyeXkvOFp0cThERFlQdHd3b0RSaU1IVEhhK2lvL1RNUVY1OFpWOURY?=
 =?utf-8?B?aUtmNlJMNURRQXdvTlFvbXFGajBtOWxzRjVjWjVRbWpoQlRuTGJydmNWVlhB?=
 =?utf-8?B?bW9XWVR0UTUvNUpYVmhDNzBFZitKREdhVFFGQStnbkN0TVZvTXVWR3N4TzJy?=
 =?utf-8?B?RlZCaTh3VzJIYklpNGNLRnFvSUZyTENMS0F3dk5pMW1LQkFTakU1SllWdzlP?=
 =?utf-8?B?QUpCSTV5OVJVdVlLR0F2YUtqc1hpYXFvY3VTWDRJdE5OR0xUT3pVQVJjTlI3?=
 =?utf-8?B?VDhMbEpMSTAwVHliNDZrdXl1L2dmK1hXS1BDdERkdFpyOEM3RnIxRW0zeWRO?=
 =?utf-8?B?bTA4SkpTdEIxbXFWbEVSUGl5d2hhRllUVVdXMVpRSTFLSnVjSDJseHJCeFlT?=
 =?utf-8?B?YmxVU2h1dExSYjZZWm1JbWloaXVSZEE2aGRUQ1RiZGVUOHZLdW1DQm9CSGNQ?=
 =?utf-8?B?cDQrM09ScTl1QU1RRyt2YWJLWlhqdFN6SVhRVVJaSHJNY3pyMVVSQVFEYmFH?=
 =?utf-8?B?cm83aVRzZlBaWGtTcFFSa3NUY0VGK2Z6alM4UHErWTRTamY4RUh0OElvV0FQ?=
 =?utf-8?B?Ty92R3NNdk5IYS9KR2lpaXNCbkZTbEpEb2IyYTJtVVJkSC9qcHpiSkdnZ0hP?=
 =?utf-8?B?NTBvMHgrMDNrdzJVeTBsdVEzNSt1ZXJyQitCTkJsMmpXZitEWTliYXBpZ1cw?=
 =?utf-8?B?ZWlyM3hxeURHVGsvQW5RbllHMG5TWVBjeGtDNzNla0dPbUhxZTNtTmpGTGdk?=
 =?utf-8?B?eTUxU3g2aENKeU5ja2VBZnltNmNseHc5Tkg4MmVDNzJkNzRVMGtDQlVDMzB0?=
 =?utf-8?B?WUJPRlRvK2hqRlYzejZaSTV5cldyaGU0a2pSbnJYUVVNNTM2b2NhRjNGYjhJ?=
 =?utf-8?B?endoOUtWRkxZY0ExUDU5MFYwdXFTR0x1b1dTZzRDV3hRaDE0Q3VOa010T1Zt?=
 =?utf-8?B?NFFrV2FzZU5YV3dJVytUVjBVaDU0M0wxUzI5VFkxeCtmVThWKy8veENrRjEr?=
 =?utf-8?B?WlQwWVgwV0VUM0paTGE1dUNMSjl0dDcrcTJLWGpNV25tdHRsai9ycmJyRzA1?=
 =?utf-8?B?cVFPZGo5ZzJ6dVpvNkxkRVFINHQxM21wejZOMFk3VVl6U3NxdGRvaFdGVmRs?=
 =?utf-8?B?eEpVeDJrMjMzRnRQRC9VNlVPNyt0cUFnL2drTmpwS1hlMGJaS2w3RGVuWmdp?=
 =?utf-8?B?QVZTdm5VWnprMzcvVzJ3VTFEY3BDSTlVVkYrNm8raWVmaVNpdlBtbEVsbjNp?=
 =?utf-8?B?b005N1R5VjJveE5jN2RYTURCU01wK0N4N2NtazVJV3N4Q25vWU9Xd2NFd0JG?=
 =?utf-8?B?eTJVdHF1VDA5Wm80bU1pdE1ldXMzV1ZSL2lZaUhwYmR4blhiem95N0I3ZDA0?=
 =?utf-8?B?ZXJ4NXJ6QW0yVnZwd3QyTEwxTmpXSjNHZXliT21yWXBsWmw4ZWJ1SDAvdWU5?=
 =?utf-8?B?YlgyZ1Y3ZjdQRGxLYnRNQkNBdmIyTjZNQUVnWk1yUVlmUU85M29rREw1VjA5?=
 =?utf-8?B?UG5YMGRYOFNJSTdQOGdHem12TmREdDkrRXYxa1ZGSHpaV3Q0ZFVhOFovMDI3?=
 =?utf-8?B?SUZGRnQ0QVJkOFFhWEkxbEh3VGlreUp0cXprK1VyRWFHYTFaVmNSSTBBZmFo?=
 =?utf-8?B?MGE4MXU4cS8velJvSjlNbWtVZGVOYkkrcXdDdktQMEN4ODMxRTgwYzRuSUVq?=
 =?utf-8?B?MWhxK0cvNGZoRUpZSjdIQ2l1NDM0RE5sYjVQOEx4bUZrYkVzWS9lZUhFb2Q4?=
 =?utf-8?B?K3prU0REQ1diVHBKNTIwd3BkVm85bURadzhrSjkzbk01K3FodlNXcWgrNGI4?=
 =?utf-8?B?dWk5a3JWUHVVelVWQjhoeEtFL3VpbXFlQTVQK2pRb0FlOGZ5U2p1WVFmV1ds?=
 =?utf-8?B?RGdITkREaUs3S0dkcEJSc2ljbUd2eTBieHNwVkFnenVmcCsvUHRJRUVPdXlI?=
 =?utf-8?B?L2lDdUM2dXZsOTkyQU5tdzJZSEdGdXBOOURGaFJYTWVxT3BMYmhkUmNhRW9w?=
 =?utf-8?B?cUl1R1h6YzB1VEIvWCt0L2hSemRTM2RjekdERGNTNnh1Lzd0c1F3SU1lZ0pl?=
 =?utf-8?B?OWthZUxpR1h0M0JpUjBGZG9kekpMU2RMUERvVGhlQzlHakVrZnpyOUU5QzQ0?=
 =?utf-8?Q?jM4yhR5NxexfV89U=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 685276d0-d028-4749-5f7d-08dee3274abc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB8265.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 10:45:03.0800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XswPhaR0U7U6UIGjg90PFx2WhmltpnorX82dfI83rZELd+LN9EuCft/jt6OlfW592IVO5fNXJK8KdcjcC2gGVf2xkT1L+wlemcWn1S0Puu8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4986
X-purgate-ID: tlsNG-c201ff/1784198707-73ABF2A1-0CD330BA/0/0
X-purgate-type: clean
X-purgate-size: 763

On 16/07/2026 11:43 am, Jan Beulich wrote:
> AFL has pointed out that the op_bytes-is-not-0 assertion in common SIMD
> handling can trigger for these insns. Indeed when the (relevant part of)
> the controlling mask register is 0, no memory is accessed at all. Leave
> op_bytes unaltered in this case, to engage the short-circuiting in common
> SIMD handling when fault_suppression is true and op_bytes is 0.
>
> While there also correct a related typo in the test harness.
>
> Fixes: 65f82d4ce1ea ("x86emul: support AVX512{F,_VBMI2} compress/expand insns")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Is this local AFL testing?  I'm slightly surprised that OSS-Fuzz hasn't
found this.


