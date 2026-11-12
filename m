Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5C2606A327
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 13:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=mqj10F3Z
Received: from list by lists.xenproject.org with outflank-mailman.1485807.1688882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRUpS-0005tT-Pn; Thu, 12 Nov 2026 13:27:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485807.1688882; Thu, 12 Nov 2026 13:27:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRUpS-0005tM-MK; Thu, 12 Nov 2026 13:27:02 +0000
Received: by outflank-mailman (input) for mailman id 1485807;
 Thu, 12 Nov 2026 13:27:01 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xRUpR-0005tG-NN
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 13:27:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRUpR-006xVO-4K
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 14:27:01 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af5be83-2eae-0a2a0a5409dd-0a2a450ac58a-34
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 14:27:00 +0100
Received: from [52.101.48.45]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af5bea2-f2d2-0a2a450a0019-3465302d2a1b-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 14:27:00 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by FT1PR03MB244572.namprd03.prod.outlook.com (2603:10b6:170:3c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 13:26:55 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 13:26:54 +0000
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
 b=Yt+Q38Mv3NKg1V3rWWyv6WVidCcBcmUNBvMezuuKSivMd3YtEf0MGyK+Ht2YaBlZlwIdHpfY+XBoJ6AcVigqEo0j5Mjbo4QC2MpYdZvZ4+IJGtlzvjsg7gEwrhSeYQaUXdVCtX/qPz3Z4lgrtZJ2uKHgc+yqfVwi3w9tNaId5kKLhzhlC+ss74ZwDUOdUQvIcBvShH87dqY4tUM1Tg6aZHIg//K47mW36dv/5ldo0Cbu86drG3jhDRxZPTKf4H9rG9uXye/YDdo+670ejfAnLa1SsCcdicPWMzD5zjrlOvrrdHUy3awl/Fxy3DWvyRtXPzHpD8zCP29F3qm+21NarQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N9OadrmiUSqHdZBUVpYkAIPc3y5TuAcG8yzKnk2fRco=;
 b=V5eTbMn+iWeGQCwlIWWWDYTyLTz0UV72UlTYrWiLmX+HRPsn247ee2b8eiUrjLi2z00pA5Hjl4n0RNvKKd7L2hZPVer6Jfnf5GIs/8/3Px+0jorxfn/xJCUzbTC+wynK7hH2HeE2yw61SZylgnigpml5i3zv5+Is26zplMA6I/9srn5g0+nfIOQp/fk4BeNR1BwzZ5FcXN6574od7WWUsGJYf7Qlg51u2rPj/uGQWcqIMtDNK7eHUK4C64mUo3/o3gA+vsiBzxMhpKjMzuJAddZjmM+VphCf5gWxd5rOQAa2yzQLHLoKtrPWYDunWZf492Ztvsjag748gVwc5qKDjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9OadrmiUSqHdZBUVpYkAIPc3y5TuAcG8yzKnk2fRco=;
 b=mqj10F3Z3uZq/VuuoadZZdHp1URo83nw6TzvG5A6ncqAtY1BslaegqjiqIoquC9rfRZLK92iXHyqssQKRGDbiRYoPKiZpjYRlKQHESXpAgPSb4UWomBReARF1HKRYiNJcgzH/h7s0e+L/AX/WgydtofMHPxLpkW/B+PFcrecuNA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6903a6db-9b3f-48c0-ad79-36499eb353a7@citrix.com>
Date: Thu, 12 Nov 2026 13:26:51 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jbeulich@suse.com,
 roger@xenproject.org, teddy.astie@vates.tech
Subject: Re: [PATCH v5 1/6] x86: extend update_intpte() to support atomic
 get-and-update
To: Kevin Lampis <kevin.lampis@citrix.com>, xen-devel@lists.xenproject.org
References: <20261112100005.324440-1-kevin.lampis@citrix.com>
 <20261112100005.324440-2-kevin.lampis@citrix.com>
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
In-Reply-To: <20261112100005.324440-2-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0036.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::23) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|FT1PR03MB244572:EE_
X-MS-Office365-Filtering-Correlation-Id: 03278632-95b4-48c9-e3e2-08df40c09e94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|56012099006|10067099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	z/skWHg54i+Bbt0kawFK6KIO1G8CKuHNXuwM0DbPn9VaqqPt3s87XYVcFptFWJHll9HFppXefOVMVSR2YKhlOWRU+4BtS7R/rhoGCuUBbgyGaMhItIk6GVbJmbpcY9CuaV/ng/nD9Q0yQ+B8dqbRoWTVc3TqGoyZRNzNErTwsJIjf32mxDH9l0QnObB6+zzNMhCHZ32gW5Z5gcZHj8RI1tAFX7KSwMNZBHV6YqkDKojF3wyhkVqy9u4e9WcpzuBkMWxUOk4vS4xp4/ORTOQlAERmYlgifGQ+pj92n2RJRpwzvLiIAg5bIS9KatpKS+mn9J1A8taowSk69ZXs29F7JikYx1bBA9I/f8kpDr8v6oEzWeQczR1Z4ilTsa5+pTso3mKWUdMsA2R3iFkOeya/Ks4zj/nuR+hlQnlUzDDK6JXXy2jaOJmBWk7gB9ZY/HGbn7nBydQyYgJB3ZmGxeiM93WAn7PcjdD9NhAJTY0hc+f24TO0m+61dBZLbe0+3wdL91WT7UKEHlbry6i21E8UjYJInEW/21WORK0BjUUsUizaEie/v6XcCj+/yQCtru6XP7cze8L7GPEdxVXBPgI4Uf9TvvgmwPpd8RcSJx/eTKqqX2lgHZugBoDiSCy12EUPfVzsCS5QbYv2Qhe3eILyxhlmqAOTRXeNYikgldoHpDA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azhzRlRNb3lna0hvcENQUmZTSzN2bmtiTWxHNUE4dFhzV3pvSEUvRWprUFcy?=
 =?utf-8?B?SHo5Zy9xNHZQWGdRMmZRNTVPcDJKcVY4RVNFTUxmUFdSV1RzYkZZSlRWdmUr?=
 =?utf-8?B?RFJaNUlhcGw2TXFVaFF0cFhrT01Pa2N4NXFNQ2FFdnF1aUFDcHZlYVF4K1gr?=
 =?utf-8?B?bVk2alQybVMrWFNld3liR3ZCSVN6VVNleFZEekgrVjF5c3Y1aFBiR1ovNkZr?=
 =?utf-8?B?cS9DcVEwQkNjNXM2M2hxZURZZ1JlTlZGZ0ExM2UrbHRMZTkwS3lqZjREREdq?=
 =?utf-8?B?bGZFU0orTWFUQVJTWU5TakNwdWE2NzdmdlJUdExMeElQWVp2OUIrWFJjRTBx?=
 =?utf-8?B?MFpEWDJXbzJBS09DQWg1RENpMzZ6NXltLzh4NlY5T3kyRjFvMGtmc0h1KzRQ?=
 =?utf-8?B?T01jVHZEUjM3Y3JpMlNBQUViM2YzWGFaV1FreWFWd0Yram9mbTQ0S0JZV3pz?=
 =?utf-8?B?eDJDTFE4ZmpUUFZ3YXRSc05BQU9oK2dlc2lQd2NUcWlBMU00TTlOZWhTaUtw?=
 =?utf-8?B?TmJNUC9qNGQzMkFuc1BFTm44RjViWDhVdW1HUWc0cmRpVFFTT2szcFpKaEFj?=
 =?utf-8?B?R1VUQngxaHFlbWVJMmp5RmlhYSt2bmxUaS8rNnI1d0NscHkrTEJHSDdiQU5r?=
 =?utf-8?B?b0NwUWppcEVaUTF3N0lmamNGNTlsOWZpaUtGbjkreWRpNWhNb0ExblBFdUpZ?=
 =?utf-8?B?bGM0bTNaaE1iVVBDUEpSMkt1ekpMazlsTjRlaDdHSnNpc20vWTBkelIwWnBt?=
 =?utf-8?B?MjkwNWZ0TEYzZ3lCOW9mbWhzL0NscmhRVmdKdmdqU2JqeFRWWUdyZE90T2Fu?=
 =?utf-8?B?REp3TFpvd0F6NndXQ1lYQXVFbFFIYnV6N0plaUtwTFZnY2w5Y1RjcHRWU2hN?=
 =?utf-8?B?NzZJNzI3VGFTTDFvc203Zll6NXNsZy9YN1c3L3RXOHRid3RMZE5yWHd2dGxw?=
 =?utf-8?B?Q0RPM2RBRU9mMzcwL0h5eC9UOE95c0l5R0pzZXFKY1g3bHhRMU5KNkRBYXky?=
 =?utf-8?B?Rm9XdlFubVRyUzdGc3ZYdHVoRk9EdDMxUUtFSlY1ejJYVzNTN1M1emtyb29T?=
 =?utf-8?B?YWJWYkhrSndwTjFCaG9JVTNZVnlFaGx2VDlOZVhXWEUvUDR3a2NQVHN2OEl1?=
 =?utf-8?B?QS9WbjFRUS9sbWpBcXBkSTUxZVBHQ3JGTVhvRDFKa3FWOUpTNk40QWl1eXEx?=
 =?utf-8?B?Z2hKbGwvRDNQUmZEQmJ2VXdxNXorSFdSR2FuSjIyK2hMZjBvckc2WFVLeGgz?=
 =?utf-8?B?NVlxSFVTSGxTZDl2eEhZR1p6OVVZWS9wMGJuaHF3REV0eGUzSCt1ejVPSVpz?=
 =?utf-8?B?UGs3bnloNFdoeXRnS05peVRXOTdGSkRuTk9aNlpWYytuc1pCWk8rZ0N4WTBK?=
 =?utf-8?B?SnR2WnBDaDV5OGJPaXU3blN3Zk1Ld1Y3UlZkTndmdTJyZFFZQXpiMWt6NFh4?=
 =?utf-8?B?ZTJJSUhPL3BDd2w4R0dHUnZwVWszdHRIT1h0NkFiSzBxaFl6aVo1ZFRKU2pE?=
 =?utf-8?B?SHVaSDBFVjdQWTRuaWt3djNHUnhBTlp1OGkzVnZ1QnVzTTdFaGNJc1JHUFFX?=
 =?utf-8?B?MFVoS1RCU3pwVjNBL1dyaHhmcGJhU3BUa0ZneC9aTVlHQW9tY0pCbGJJdmV5?=
 =?utf-8?B?VzZramdqcnl1R1pDampXWTVwbEhyaUxEb2hVd1ZuNnZ0MWhtSHVxLzN2SWxH?=
 =?utf-8?B?SHpCNStEZkJlWWgzZW1vd2ZyWXd0WUYyTjEyS1hnYXRpN2FGZFJEdXlScnlY?=
 =?utf-8?B?SnZ3QXZ6T2o2Y1pONTZIeWk2aXFDTGFvb0pZcmJpNnZTVkJxZ2Y5VzduSVQ2?=
 =?utf-8?B?R3JVTVVyNGpBbGYwN2ZTNzVVa1o5UTNhdG8wRVR1OW82dW5zNUQ1bHVnYTlI?=
 =?utf-8?B?NjJYSDVJM1VBaElSQVRkcU1pdkRjTklNMU1sVVZqUWZaRUdZbzJyV2F2bHBa?=
 =?utf-8?B?bXRYRStWaWlxWU9IVzlMMTc2c24vNTB3eS92bTFJRTV5V0IyNHhDdGpEUTRt?=
 =?utf-8?B?NU1yRWQ4dGlDN2JZSzFpc3NneGhFczFEUW1MWkUzbSs0WkV3UW9GTFp3UEZU?=
 =?utf-8?B?TmswaEZOSm5NekRnVVAxTkN0eU8vNVQ3MGxtOTV3MVNnZVZneXZ1U29mWTNn?=
 =?utf-8?B?RnBEQ05KZjRvcFh1MzUxYkdPL2RhMEY0Q1dkb1V6VmpGTzVsaExPSWlnMUF5?=
 =?utf-8?B?TnBmZ0Y0U1UrOVZxaytGTDN6ay9SOWM5dFdaS1lUc2llaVYza2VYTzlkSTU0?=
 =?utf-8?B?d21vbERkVHZjRGlYODl4YTdIczRTNWptYmMxWno5dm9uWFRZTzhtMnc5VSt4?=
 =?utf-8?B?TEY2UFBQbk9yZkwya0dLZFlDRWtmMWVHYVloamNqdDBnQzhzeXFXMnZLUUJl?=
 =?utf-8?Q?2ETfAyEuqyRHl9rw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03278632-95b4-48c9-e3e2-08df40c09e94
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 13:26:54.9300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e+klogjjMwYMSOqF/VVWztPVD6nSInW2FrcRo/OZpn6GI6mw4UlhmO4VjTRcOMCv/f7xM9ck8fOdcwviZW4UhCzgS6triyF9EwJXU325GjY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FT1PR03MB244572
X-purgate-ID: tlsNG-4011c0/1794490020-53AD4CFC-60B7CE54/0/0
X-purgate-type: clean
X-purgate-size: 304
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12/11/2026 10:00 am, Kevin Lampis wrote:
> The update_intpte() now accepts a new swap flag and if set
> returns the old pte value.
>
> No functional change for existing callers.
>
> Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

