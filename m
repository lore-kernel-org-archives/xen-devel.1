Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D89C53209
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2026 13:48:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371697.1619172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woLh7-0001Vq-Qz; Mon, 27 Jul 2026 13:48:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371697.1619172; Mon, 27 Jul 2026 13:48:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woLh7-0001Vj-Nh; Mon, 27 Jul 2026 13:48:37 +0000
Received: by outflank-mailman (input) for mailman id 1371697;
 Mon, 27 Jul 2026 13:48:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1woLh5-0001Vc-Q2
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 13:48:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woLh2-008HMu-MJ
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 15:48:32 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a6761ac-2eae-0a2a0a5409dd-0a2a4502a896-18
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 15:48:32 +0200
Received: from [52.101.53.44]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a6761ae-6ca4-0a2a45020019-3465352c0a6e-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 15:48:31 +0200
Received: from CH8PR03MB8276.namprd03.prod.outlook.com (2603:10b6:610:2c1::14)
 by PH7PR03MB7389.namprd03.prod.outlook.com (2603:10b6:510:2ee::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 13:48:27 +0000
Received: from CH8PR03MB8276.namprd03.prod.outlook.com
 ([fe80::8420:cc3e:23e9:7a0e]) by CH8PR03MB8276.namprd03.prod.outlook.com
 ([fe80::8420:cc3e:23e9:7a0e%3]) with mapi id 15.21.0245.009; Mon, 27 Jul 2026
 13:48:27 +0000
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
 b=J6HVdTgUO/1YXpc/N+s2zeHoXQrgtZv+LtycIS/JJX1q1LDy4pXbczCdBTkxGymzVp/LSdZsoVZVtEKk7030rIgiymbWF01F6RbXD00DXPft3NwSJMBxNUt0VQD9NvYNYfDysreg0Uyq8hXLi+/EFR96ZiHKMW1/mQDjoo9+jisGjxiBSs1wPiVFIKF6JpefGR0Y81OWt7QFnJiEAqX83s0mI28c29B13nCWDCcWZoC/l189Glgwlnwx2c2MFbnRbyW6IJMOVR1bXFcXidbnSJG5HUbe0HFNjIpn8DgCQnxBzPS8WB8bEW1QkqxLY5GJqJUk1dtKamjLJx9Xtts6rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EcdE+lkbnPQOPxUgkhbWAzmQBJJSk5/8YT4SlygUmUA=;
 b=qlw4jbHiZdQ0bFTAJsMFrBAK+RwglmdVkJZzt84+/C9A+yyEJz2sbpe/uqDacqaw6d334kZm+qynm6XwEBk8rNn64808nCc7gYFeIGHJpZJC0Y42+jnD/8Yx3oa+g1J0h5omfViOW4UiDYK3lzvCddJE4R65tcwgPyQWZXoqAIfL47ItFaksHQiWBs8nlcv2LPOvLCzaaGmV6egaJuf1jiOelf2jFyfSRSt+cMWAG5Jja0iciN70u9aMbWu3+Qz7q7+RW8bTKr7McKzkqbalN+62kfPnE981uazV7OrlGKQB38b4GIa3uZcGKmAEcYPvr/+UnMSwM6ELN+Z8KCFSwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EcdE+lkbnPQOPxUgkhbWAzmQBJJSk5/8YT4SlygUmUA=;
 b=lkRU32yJFWUElJn5dpQFevmHGIypZLE8V0X8Y/BaBV1dus4IucCQdeDF9ATJq+9J82BAcHu0S8DIscyOdfV6NH37IbSH8sc8FhRSOs8zgN+bafyW4C/fQStj8cexvKMa6juNZ0VCn17I8ztqAFPwLuxqEebehBsWLp0Rxmp0HxI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <00a5cf74-e5f9-4a91-b74b-8c0497dee505@citrix.com>
Date: Mon, 27 Jul 2026 14:48:23 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86emul: drop host_and_vcpu_must_have()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <fe377539-f32b-4202-8ef6-fd5b959a7f66@suse.com>
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
In-Reply-To: <fe377539-f32b-4202-8ef6-fd5b959a7f66@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0073.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::6) To CH8PR03MB8276.namprd03.prod.outlook.com
 (2603:10b6:610:2c1::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8276:EE_|PH7PR03MB7389:EE_
X-MS-Office365-Filtering-Correlation-Id: b5762bed-8056-4618-961d-08deebe5bc65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3lMFVd14KiDqTZMe0KguK6p1GqwiEoy27r9Zklwcay0o7sv5hC+GOk/kQBJdP9RuelQAvtPCOMJKakE8RBz6GtdswZh0jqVUDE77nzyJPCPuwRih6mNINfeQmWmvM2sZ1a1gfzFAR+MbeHHTZALN9NKwg0TWIMkHPtNipBuxKoPDZX+PtLwT8nMG4+UOxGjq6JrXZcuCwNy0t9XFnjjKBFcH4Tzwcn7WOMP+mvujG4yBcMEF6oyxqIaXcnGgcmyxPUpKPnQfrC4ElwkUE08B05iy7d3z8sODJo+oqCOjt0gog+k+fcHa1fWCUqFfChlq1LaGLHJCRxH9ZSdd/0LrC2NICBz6HESrmW66wTwYIWX7llfvE+VaHivwFwMymGgIERayntpc7QW5rRFSPXlefjVIaqZBfS7dLtd+F76ttrHwNV1MPVraLahBeb7824B+SrUmsCAGFBkYfDsDQVo7RrTrGDkpJ7ng9fn6oQvzesZ4jjIij5xx7G3x3k8W4WlZgAZpKAJPe1fT+GFDVVUOvk3iLvGAQQUq2Ttu0B9NU3PW4BC/5XnViPfxqbqWlpafCbnwcd1TeWJ7BW7UcCBw5LVJlnkVwkqtB1jE4/uGZEegTUS9ci9bZTMwIme1kJHaRHs/QSxcreZaf0TAuFmT5A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8276.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekRaSG9OZ1VGREt1dkJXMUtqSHpsNERzSTk3Z1pQczlEcjVCL1pyYVpSd3dX?=
 =?utf-8?B?UHoxQ00wT3c0blEwS3BXMG5SREtzVXUwaGFwYTdZVUlLemtKY2w4b1RkWDBT?=
 =?utf-8?B?Z2hWS2lER284UnR3MVh1dWNOMWJleWdPa3Bxd3czVnB4dUpDS0gyYURBQUFj?=
 =?utf-8?B?S0RmbWhyU0xrQ2p6bFRZUmhZMVcrNklRWnN1QzNmOXBKZm1WUXVjZ1NIblFO?=
 =?utf-8?B?dTZna1dCTjFzRFlnT0VWMk15ZmxJRFJVNGNuVUlFRXB3L3NpWGxtY3FpNDJU?=
 =?utf-8?B?TkJtVE9kR0ZKRlNBaEtZNXg0amJPclZMeDQzcVhmQXJFeUt5dngwU2J3MTVk?=
 =?utf-8?B?Sko4UWlhRndjODhCdVVWU2xvTWlhSVBRY1BYNmlhQUViSlQxM3ZRbklMMU9T?=
 =?utf-8?B?VWN1bEw1TVBkYnVJbUhGWWIwUzNsckNFRkk0YmFvQTc0bE04ZzAxaGpiRG1z?=
 =?utf-8?B?T2wxNC96OUNDQnFRaHFzK2d0NUVtUVVsWnRFNlVNNUVMb21oc1Qyb3Eybmhn?=
 =?utf-8?B?aUcwWWR1OVpybFp3UUdjLzhCa1VBTG5MV04yVkZHQjFtTStnNzFsTUIvaUtu?=
 =?utf-8?B?UkhzWG5jYWRwOEh6S1ZRdlZXVUYvN1ZpMHJMclkrcHJBOVZpRUJRSXVYS29M?=
 =?utf-8?B?aklvUVB5bTVpVEVXWUhMMDV3MjlYSE5KMjdFNG0rV2p0RnZlSmxROGxMRkxE?=
 =?utf-8?B?NXcyT1ZaR0x1S01oMy9ySlEzR0ZyakpqaVhTUmlHV2FmZyt2b2xhK01UR1Br?=
 =?utf-8?B?aFRkLzBtQmpic2YwbjJKTTZSR2dwWmZnU04zYUNpVUh5R0Zhc1lKSURsN1ZE?=
 =?utf-8?B?d3FBVEp3d1VPSFpLK29XRUZ2QzloY1JOTVFpWTFLcCs3RWFiZHhyN2o3YzVU?=
 =?utf-8?B?SnltMmZiU1ByRnZxMjNWaFl1VkQ1Q0hvOWdYdHYxbm5mUGlUelhRbGlSZExH?=
 =?utf-8?B?Zy8zWC9iNHQxNWQ2aGNxc0dpVmNJTXhPemJkdytmYll4ZnZPYzJxRWQ5akd2?=
 =?utf-8?B?Qjd6a3FwSHFDdGxwRjFYMWl5SlI2c2VibVh3OENQa3ZwTUJvNzM5cm41UFg5?=
 =?utf-8?B?cGJpVWtITW9lRHBld0JFem9ZRXhtb2VRR001MmRoaEJUWHF1bTVCNis4S0g1?=
 =?utf-8?B?WnRpNzhxRWU1OCt3S2l0K0VIemhwMmdGU0l1WEp2SzVyTkFlendvV0RUMnQ4?=
 =?utf-8?B?d25IZThNUmxZRExmaFVlMVgrL3I4N1VnU1Z0TG9pWVVyVytsWGZIR1RUS1B5?=
 =?utf-8?B?eGttTDZ0VGZ0Y2wwQjlnejhxYmZVWklKVUNoRlUzWVdqNktxdFNJb2VsK0RB?=
 =?utf-8?B?UElsYUtGWkRkTU5WRW5PK3NKRHNZWVFKMEtjZDVTT3NiVm4wcjJhb0x6Wkt2?=
 =?utf-8?B?aVpRMGpOWXN4dUJlTnpadGdOcjZlZ1I5T1F1VDRVTVM4OVJGQ05SQno1Y01E?=
 =?utf-8?B?L2RWNEl1S0RBQzRmWFZ1VzErRFMyaEVyZVFHZmxvWW5XUHlGSlNDNWNHNit2?=
 =?utf-8?B?SThyaFRFUUlPQXZsU3FEVjdKSlE4akJaRXFPYzNCRzRFd2NYZXNSVEhHNzYz?=
 =?utf-8?B?UTdHcUhvYjZhTmJjVTk4ZnM2MkE1Y0g4ZEczdTkra2lFSVNoa1c1aUVGb1lU?=
 =?utf-8?B?d0ZMaTVpZGVBbytiS3U4NEYxU0VTQW91NFJsdTRrSkpIc09Gc09Sa3FmLzlu?=
 =?utf-8?B?T1Y3ZEFwYVZBQXBaTDdWb2d6akR6ajRudmxleFBmNkt5UHRCNFJUUnZDWGVU?=
 =?utf-8?B?UEVqbGtRZFNJYUVoR2VGcFJrSmpKQ0dHSW5KWTdpZFR2OExURnlEcUUzdzly?=
 =?utf-8?B?bEJrV2pGRkk1YUNqZ0NyTUtMR3kvbHJ6R29aZmJlMDQxeTV3V2ZMK0MwWGJ5?=
 =?utf-8?B?MjRhN2JWbUMwRlZLMW0wbHoyZlk3T295bDdaajlxcWNwMHd6b0JEQUFETUx4?=
 =?utf-8?B?NHRKTS9pWUM3b1F5NWFoRFlOd0dJSU5YSGlMZURSTGxIazV5emhJalQzVStx?=
 =?utf-8?B?L0xZTHU0elRxcjZpMHhlNjJyY1hWZmYxZU9TYklUcEx6TXNkUmlDenlsTmp5?=
 =?utf-8?B?QW9FMG52bG5lMDlCU1NXcnM0KzVWaDIzTkVFazJBRVhHN1B0NFVWUXdYc1lm?=
 =?utf-8?B?UmNma1o0d2VIaEg1aGFGd09XUnBPbC9BcDhRaFY2SXVqRlVZSUdVQmJOZWFI?=
 =?utf-8?B?NVE1WGw5Smp1SEtsTHdFNy9ReFVpbmRCYUpLUXJFcG9LNFM0cXB6Ymw1clgz?=
 =?utf-8?B?SExvRkJsd1ovbDhTS0FqS2QzNmxFQjluZGRjNElFZ2pLZFRXR216UnBFMUd5?=
 =?utf-8?B?TE1mQmw4UWp4LzRoRGJuRlE2QTNWN2hUVllaOElybjg1VFpBQUQ3QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5762bed-8056-4618-961d-08deebe5bc65
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8276.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 13:48:27.6008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VO0wUqEI7Nszy+4EbtKtEW7mvHeM50AmVjTnDLptNa7mJFbhjVii5zVzLlr8Bl3P4j5h0I702CFj9oeIeEQW7M7gm/KwftUBUftV0VaohGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7389
X-purgate-ID: tlsNG-720697/1785160111-F16AF2AC-6FA4CBE3/0/0
X-purgate-type: clean
X-purgate-size: 522

On 09/07/2026 10:46 am, Jan Beulich wrote:
> With CPU policy dependency logic now properly in place and working, and
> with us never enabling ISA bits in guest policies which the underlying
> hardware doesn't support, the dual checks aren't needed anymore. In fact
> in Misra terms they are dead code.
>
> In turn, a number of cpu_has_* can then also go away, when their only user
> was the emulator code.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

