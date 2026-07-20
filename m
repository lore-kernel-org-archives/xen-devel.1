Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38046C44515
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 20:07:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367376.1617158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wluGj-0006vw-Bu; Mon, 20 Jul 2026 20:07:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367376.1617158; Mon, 20 Jul 2026 20:07:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wluGj-0006vp-8t; Mon, 20 Jul 2026 20:07:17 +0000
Received: by outflank-mailman (input) for mailman id 1367376;
 Mon, 20 Jul 2026 20:07:16 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wluGi-0006vj-9J
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 20:07:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wluGh-00GmEm-5B
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 22:07:15 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a5e7fd9-e002-0a2a0a5209dd-0a2a45048c4a-30
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 22:07:14 +0200
Received: from [52.101.61.12]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a5e7ff1-b57f-0a2a45040019-34653d0cf81e-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 22:07:14 +0200
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by MN6PR03MB7718.namprd03.prod.outlook.com (2603:10b6:208:4f7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 20:07:11 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%3]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 20:07:11 +0000
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
 b=kQa8X1aIHIK8L1vBjv3sRMoktvUC/BhRnjhMIHKdtXfGxAlS7/e7DHQg81EEnJcuahaMvAkRaSUfAujcN9XaTjMuqFgUDXB2bmD7GsaSv81QZFcfJZ3JK/a1LCttQrTpLOJpbDjx2WGa7tOFZk1hmA9bh5x+5WCDR2TSkOx1mDHCfF9j6bpZNBw2TGTYTqmULavDspwlicYLLYm1VzndjkEGQb+Ct6RdnOk9nLeqQ8NlqHkohNI+zZbiCYvrbKCNxBvL1hZ5HMHjmvlUiKdo5KlYcwQImHI+zVn6PsTzBH4A9eATjHpT/0D3t02VR75qPiUSiO3tGbsBF3FAYjHqTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nycr5DSd6udKG3a5OHn6rARcQA9gCmYTXB5zsEivD88=;
 b=sPRqK8FLKlGV749WfW9pGcWrKD76CwTRMMrvXtZARn0ZL9UOxdLwt19eLTDJi1WnmwB5Y+zo9hsFuCBj5mLnU8Gw9oMT4Z4gXSaqdkV2DMw88nQaqCOiaR8RcafXfbVd6fJQK+lK1caXt6cPYum+T6uyCzBe9cXp2eNQJ3HoeetoJGnZ6lCEM/6toCJN11szxdbx/Nx/rEsHkmLZ4qxaJwIfGYUAjUgwwq/p5Z8FL8TxxKjy9iwO1Mf0TuKhDETdTXPR6UmgCAaRs8W3VfuuHIplV0qP6HV18QocQSwagf+THepEb5vZ3pA1dvYSNhickJAav/AQQBiYsPpNDmE5EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nycr5DSd6udKG3a5OHn6rARcQA9gCmYTXB5zsEivD88=;
 b=y5UAzajW3w96R2z1rvrCNuUPTt10n19JajHDsY2G5xTMYGutheXSRYVag86E1AvSD/tESJTx+iYTB/6UTsdD8llDYi8t9+u8gZ/+suT6dVVje3+MlvhzCHlYHWwz94swvVaJ6K1dJ6m/qdIjdiQOeWnpwHiCTVjoIUaRibwlsoo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d1a522ac-5b28-4e9b-bc45-d9cc61245662@citrix.com>
Date: Mon, 20 Jul 2026 21:07:09 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH RFC] x86/PV: avoid HVM-copying alternatives in PV-only
 code
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8e6f5ad5-21e4-4325-96de-e03ba65a1b8d@suse.com>
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
In-Reply-To: <8e6f5ad5-21e4-4325-96de-e03ba65a1b8d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0518.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::11) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|MN6PR03MB7718:EE_
X-MS-Office365-Filtering-Correlation-Id: e2c5ec45-7a2f-448f-7005-08dee69a7c1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|3023799007|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	/vqhqER94N31rWJ+6HTJ4RccudVCm8pAUTvmNh4D8+tPfy9litIT3Ca/qzCnwcsvjksQQdwMHVEkZz/a+G/kZwYsKY6s3SHg/HTvDlyZIL4NtodORyQlGJ/xzyWiOn8KRK4VjRlVgTaQj4TzWZex/v1KzvFzvQffwYyvD2IbPuPjd7re63tYZu8Gslml9mrOsodaQYGbTdI+Dekuxk+0UlUNB0312jWO+tGrkrtmcWh/XExtY7a4cwYC3hKEL71UujPpYcy3+TekiS/6sGWhop+oQhG3kdt9igFL8PQ+ZD1Ox3fMrj1kxZR0vij+ZWmzga/EgnVad0lKYoOn61pyuezTduXmXRV4+xCJOHKGThoiZWjxS7woCoEzyewSHvuWkb5r3/GPqARJF8FxICUbCUkHi6Jx7VJ5YoRPfO+w3VrV65a5O823FHFnh6SntZxitrjXhztBoLzaDLFF9qfcU0H/oFfIAn5npedcSFB0FTdXtfyZZtjdCxE7hoIJrS0zrsSqG6RQv4PsEZrf/GVk/m4tNqvBu9vOns7RvlnhKiNiG6nhqt/3IuFVGX5QVcMKPTjduzZReP8u7k2C+uvWS8t0TY/M+fU7owlnnud9LX5v2xs9q45uWERmMyxyJjSOxzR1/4j2Z2clURUgdqNfaqD1mdamtNSq9G3/xtXXLAU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(3023799007)(10067099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2IvZWxDUDFKbGkzK2xrd0Nvb2F5ZjBHZjJLT0gyWGcyMHluOTc1RjYyUzd1?=
 =?utf-8?B?MytuYklCdlpUSnI5Ui9CTkQwdnRkV2lLK09Rb2FjWENGL3JKSVlUc29RWXZ3?=
 =?utf-8?B?N0g0dkNBOVhYbUtIWGdPYzFGMFpFdi9DUytmc3hGU3B6VUhVTnpsR1hYOE0x?=
 =?utf-8?B?YXhST0lFTGJMSnRncWgrYk1lQTN6Tk1kU0x6eE83a0pZUExackx1K3FQUzNW?=
 =?utf-8?B?K1pscHRRYTJxeXZNZVJKeVM0N1hNSExxaFJSai91WjNxNXFIaDB1OE5jVlJ4?=
 =?utf-8?B?R08yRVNvSEZ3WDAzaHFSbVpaN09OWGNVdDlZUS81RkNsbFFMc3lZNEJlc2tM?=
 =?utf-8?B?MVdVTCt2NCsyaVJwblFMUUdaY3lBTllMYUwzREwxMDlNQjBrM0VnNy9CSkJj?=
 =?utf-8?B?OWJYcTNRMGFyTEUyeXZKTnh6NklHZHBVb2JJRVZsMk42RkRqa04vZU9rZTBS?=
 =?utf-8?B?ZWd3em14aEJFN012OWVKMTJYME1ENEhrbSsyWHVPdHNzdkpxc3AvQ014K1ZR?=
 =?utf-8?B?U0J3STZOc2czUlZ6Ri94N3BwOUxiWjVVZ01tV0x6cUdHb3U5b1R1clVwWmJK?=
 =?utf-8?B?Y3R3c3JROFVzckZJaUlVeVBCaEkveW85ODFCYitJNjVFVzNGM2RLOG9vMjNp?=
 =?utf-8?B?TzlLVE9DdzY3Nks0NGRNOXZvbTV5TXVwSVBPZTFPZXlONmZSZ2lSWDJHOWdy?=
 =?utf-8?B?OFI1UEhrMXVOTHhSU0JCcmhHdlN0K08vU2NWRk8wUGJFbXZmckNRTDlDbklO?=
 =?utf-8?B?Yktlcm5kUWlrK014OGV6QUpTQjg3Z3FpNnpmaTgyYnJ1cDNoZjQxQlY2bkMx?=
 =?utf-8?B?bnl5YW5qbmx3TUY1SVBuVmFsRmdkSTVnVXFId0JoRWJ2WGZTVExyQ2FYMUNz?=
 =?utf-8?B?RWk1N2NRTVdmOHdHZG1uL050VDdSR1FLZm53dFFyanNFTWwrZFdMbHdUbFMx?=
 =?utf-8?B?VmhMZlJVSW4xbzBYMU85WFBHdEU1WTdCcVdKSDNqNXBYVFVGYkV4RVJPbXJm?=
 =?utf-8?B?blV3N21BdFAzb0xITC9VOE05cUdhanFzY2lVTjErMzhEMFpLUjh6Y0U0UTgy?=
 =?utf-8?B?WEI5a1RyQVpMZzhWbWNNQVI5VTNxYlRLdlZvaE9FbXE2dEhFdG5XWVBab0J3?=
 =?utf-8?B?cUxLSHRlSERZOUtpM0Npc1BseUowdG9wbFBtL2prZmZEa0tseTNTempFKzZW?=
 =?utf-8?B?Z2FiWjQwMW8rUVR6M2Rmd1BNdkZNMjdYeko3YnBZcnJsbmwreHhLTWFWTzR5?=
 =?utf-8?B?YVIwZnRVYUhjQWsvL1NUY0hvcVlhb3prSjFDWFlLcGdVS1FzMk5sZ0RLRWZx?=
 =?utf-8?B?VVNCUmh6Smx6c2IwYW01UG16MkVVM0huZHV2aXRwQjVmZ2JSSnBreWtrS3lG?=
 =?utf-8?B?aFNlTDQyUjkzRXZWZzJZakxvRjY4OHBrdUZkcDZuVzgyc2hxbmh4SW1yYW9X?=
 =?utf-8?B?OFhwNzVoaFczUTV5TnlGVlVpVkVzaElEWlRBWkUydmYzbkpWQURLbmtHelFL?=
 =?utf-8?B?NWh3VHh2Ui93LzYwZlkrTWc2L21xQzJ5L3hpUnJLNXUzaVVtVmpTSWphUmNa?=
 =?utf-8?B?cWpSQjhGQUt6Vjc1cnZsTkM0VkRERUljYnRvMUhJc1V0ZC8wOGM2NTZ1NVRh?=
 =?utf-8?B?YzNERDh5YzFCTzY1STVBbkRGZWh6S0dXN2dNTHVFamdtZFhRcE10Z1NaQ1pU?=
 =?utf-8?B?Y2hkR3BmT0paR2x1bHRMTk1iem5Tdy9oSkd2eU5nenI5NXZTMDdwWUlVUmpj?=
 =?utf-8?B?OXo4UWJDYTBVbFJWWXpNWi9rSXNEaHRtMllVaE4rTVF4cHhFUlRlOE5YK3VW?=
 =?utf-8?B?d3U1K3lwQXVSU0JaYmlrNnFOdFJTVDhmaHNEU3M1R0VKdllHMkhSRDhXV3VE?=
 =?utf-8?B?V0psTXNaQ3NZM2Vsd1IvWEdxMU91YmJQcno0WkpuanZNa1RhdllNcm9wWTQw?=
 =?utf-8?B?b29LOEowdGxqa2pBVFp2UDRVYmdoV3lFVEEwRXhoK0dtUnJFcGgrMFZCT05j?=
 =?utf-8?B?bVpWb0JnTkhHcE5EMXJTeWs1OTVFeVM3V3VEV2hmbENIcytDbkdtTW9NMkZD?=
 =?utf-8?B?RTN1N3IxNXFhZ1RjS3dkRmQ2RjdmTDk4RWdZWjhxaHJGbExBZk1ONDlUbkE4?=
 =?utf-8?B?QzZCelJvM3ViajNqRWExZDJvM1lCNnh3YzJOSUYyandtc25NWUtWYitYSkpv?=
 =?utf-8?B?azNKcXlEUTMxWUpUcFVNclZlRG5DOWRwNGYzSVVzWnFtNlltMVgyS1F0dWpF?=
 =?utf-8?B?cHFYUUFacVpySWpLelFhZUdnQ0psMktDbFNuODBQVEk4MUN6bVN1bHJRSWIw?=
 =?utf-8?B?V21sVUJwRXJpTS82RWFzbzFTc3hxVlNLSk1HZHZrQWJtZ0dIS2ZKUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2c5ec45-7a2f-448f-7005-08dee69a7c1c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 20:07:11.5409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F0UoGCKHAfkdKqr7MOFge2Sx6clySu96j3rkoISz5zeat9/wQqPyg13UUcAjFqCUzCEbMVUWMWYggbjCZrzLHmAJXm7E7EARnfEV2BYjtxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR03MB7718
X-purgate-ID: tlsNG-ebf023/1784578034-C0AD8B50-85DFD729/0/0
X-purgate-type: clean
X-purgate-size: 6905

On 30/06/2026 2:38 pm, Jan Beulich wrote:
> --- a/xen/arch/x86/include/asm/guest_access.h
> +++ b/xen/arch/x86/include/asm/guest_access.h
> @@ -14,11 +14,15 @@
>  
>  /* Raw access functions: no type checking. */
>  #define raw_copy_to_guest(dst, src, len)        \
> -    (is_hvm_vcpu(current) ?                     \
> +    ((IS_ENABLED(HVM_ONLY_SOURCE) ||            \
> +      (!IS_ENABLED(PV_ONLY_SOURCE) &&           \
> +       is_hvm_vcpu(current))) ?                 \
>       copy_to_user_hvm((dst), (src), (len)) :    \
>       copy_to_guest_pv(dst, src, len))
>  #define raw_copy_from_guest(dst, src, len)      \
> -    (is_hvm_vcpu(current) ?                     \
> +    ((IS_ENABLED(HVM_ONLY_SOURCE) ||            \
> +      (!IS_ENABLED(PV_ONLY_SOURCE) &&           \
> +       is_hvm_vcpu(current))) ?                 \
>       copy_from_user_hvm((dst), (src), (len)) :  \
>       copy_from_guest_pv(dst, src, len))
>  #define raw_clear_guest(dst,  len)              \
> @@ -26,11 +30,15 @@
>       clear_user_hvm((dst), (len)) :             \
>       clear_guest_pv(dst, len))
>  #define __raw_copy_to_guest(dst, src, len)      \
> -    (is_hvm_vcpu(current) ?                     \
> +    ((IS_ENABLED(HVM_ONLY_SOURCE) ||            \
> +      (!IS_ENABLED(PV_ONLY_SOURCE) &&           \
> +       is_hvm_vcpu(current))) ?                 \
>       copy_to_user_hvm((dst), (src), (len)) :    \
>       __copy_to_guest_pv(dst, src, len))
>  #define __raw_copy_from_guest(dst, src, len)    \
> -    (is_hvm_vcpu(current) ?                     \
> +    ((IS_ENABLED(HVM_ONLY_SOURCE) ||            \
> +      (!IS_ENABLED(PV_ONLY_SOURCE) &&           \
> +       is_hvm_vcpu(current))) ?                 \
>       copy_from_user_hvm((dst), (src), (len)) :  \
>       __copy_from_guest_pv(dst, src, len))

Looking back at my own attempt to do this, which was from August 2024, I
started by cleaning up this code block as such:

diff --git a/xen/arch/x86/include/asm/guest_access.h b/xen/arch/x86/include/asm/guest_access.h
index 69716c8b41bb..49920e181832 100644
--- a/xen/arch/x86/include/asm/guest_access.h
+++ b/xen/arch/x86/include/asm/guest_access.h
@@ -12,27 +12,33 @@
 #include <asm/hvm/support.h>
 #include <asm/hvm/guest_access.h>
 
+#define GUEST_ACCESS_HVM is_hvm_vcpu(current)
+
 /* Raw access functions: no type checking. */
 #define raw_copy_to_guest(dst, src, len)        \
-    (is_hvm_vcpu(current) ?                     \
-     copy_to_user_hvm((dst), (src), (len)) :    \
-     copy_to_guest_pv(dst, src, len))
+    (GUEST_ACCESS_HVM                           \
+     ? copy_to_user_hvm(dst, src, len)          \
+     : copy_to_guest_pv(dst, src, len))
+
 #define raw_copy_from_guest(dst, src, len)      \
-    (is_hvm_vcpu(current) ?                     \
-     copy_from_user_hvm((dst), (src), (len)) :  \
-     copy_from_guest_pv(dst, src, len))
+    (GUEST_ACCESS_HVM                           \
+     ? copy_from_user_hvm(dst, src, len)        \
+     : copy_from_guest_pv(dst, src, len))
+
 #define raw_clear_guest(dst,  len)              \
-    (is_hvm_vcpu(current) ?                     \
-     clear_user_hvm((dst), (len)) :             \
-     clear_guest_pv(dst, len))
+    (GUEST_ACCESS_HVM                           \
+     ? clear_user_hvm(dst, len)                 \
+     : clear_guest_pv(dst, len))
+
 #define __raw_copy_to_guest(dst, src, len)      \
-    (is_hvm_vcpu(current) ?                     \
-     copy_to_user_hvm((dst), (src), (len)) :    \
-     __copy_to_guest_pv(dst, src, len))
+    (GUEST_ACCESS_HVM                           \
+     ?   copy_to_user_hvm(dst, src, len)        \
+     : __copy_to_guest_pv(dst, src, len))
+
 #define __raw_copy_from_guest(dst, src, len)    \
-    (is_hvm_vcpu(current) ?                     \
-     copy_from_user_hvm((dst), (src), (len)) :  \
-     __copy_from_guest_pv(dst, src, len))
+    (GUEST_ACCESS_HVM                           \
+     ?   copy_from_user_hvm(dst, src, len)      \
+     : __copy_from_guest_pv(dst, src, len))
 
 /*
  * Pre-validate a guest handle.



so they're all consistent and legible, then extended GUEST_ACCESS_HVM to:

diff --git a/xen/arch/x86/include/asm/guest_access.h b/xen/arch/x86/include/asm/guest_access.h
index 49920e181832..eba47e46de88 100644
--- a/xen/arch/x86/include/asm/guest_access.h
+++ b/xen/arch/x86/include/asm/guest_access.h
@@ -12,7 +12,12 @@
 #include <asm/hvm/support.h>
 #include <asm/hvm/guest_access.h>
 
-#define GUEST_ACCESS_HVM is_hvm_vcpu(current)
+#define GUEST_ACCESS_HVM                        \
+    (IS_ENABLED(GA_ALWAYS_PV)                   \
+     ? 0                                        \
+     : (IS_ENABLED(GA_ALWAYS_HVM)               \
+        ? 1                                     \
+        : is_hvm_vcpu(current)))                \
 
 /* Raw access functions: no type checking. */
 #define raw_copy_to_guest(dst, src, len)        \



to allow ways to force it one way or another.

For forcing it one way or another, while ...


>  
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -3407,6 +3407,9 @@ int new_guest_cr3(mfn_t mfn)
>  #endif
>  
>  #ifdef CONFIG_PV
> +
> +#define PV_ONLY_SOURCE 1
> +

... mm.c is certainly complicated, others like ...

> --- a/xen/arch/x86/pv/callback.c
> +++ b/xen/arch/x86/pv/callback.c
> @@ -5,6 +5,8 @@
>   * hypercall handles and helper functions for guest callback
>   */
>  
> +#define PV_ONLY_SOURCE 1
> +
>  #include <xen/event.h>
>  #include <xen/hypercall.h>
>  #include <xen/guest_access.h>
> --- a/xen/arch/x86/pv/descriptor-tables.c
> +++ b/xen/arch/x86/pv/descriptor-tables.c
> @@ -8,6 +8,8 @@
>   * Copyright (c) 2004 Christian Limpach
>   */
>  
> +#define PV_ONLY_SOURCE 1
> +
>  #include <xen/guest_access.h>
>  #include <xen/hypercall.h>
>  
> --- a/xen/arch/x86/pv/shim.c
> +++ b/xen/arch/x86/pv/shim.c
> @@ -6,6 +6,9 @@
>   *
>   * Copyright (c) 2017 Citrix Systems Ltd.
>   */
> +
> +#define PV_ONLY_SOURCE 1
> +
>  #include <xen/event.h>
>  #include <xen/guest_access.h>
>  #include <xen/hypercall.h>

all of these could have a general CFLAGS += in arch/x86/pv/Makefile
rather than having to state it in every file.

Naming wise, while PV_ONLY_SOURCE works in pv/, it's more dubious in
arch/x86/mm.c.  GUEST_ACCESS_* at least identifies the property that's
being decided upon.

~Andrew

