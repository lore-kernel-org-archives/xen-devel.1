Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBB0606A324
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 13:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=FjIOVLnP
Received: from list by lists.xenproject.org with outflank-mailman.1468222.1677310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNsMW-0000vT-DY; Mon, 02 Nov 2026 13:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468222.1677310; Mon, 02 Nov 2026 13:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNsMW-0000vM-Ae; Mon, 02 Nov 2026 13:46:12 +0000
Received: by outflank-mailman (input) for mailman id 1468222;
 Mon, 02 Nov 2026 13:46:11 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xNsMV-0000vG-3q
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 13:46:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNsMU-009maE-2f
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 14:46:10 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ae8941c-8faa-0a2a0a5109dd-0a2a450b98a2-32
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 14:46:10 +0100
Received: from [40.93.196.28]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ae89420-b7e8-0a2a450b0019-285dc41cdfff-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 14:46:09 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MW4PR03MB7009.namprd03.prod.outlook.com (2603:10b6:303:1a4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Mon, 2 Nov
 2026 13:44:09 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 13:44:09 +0000
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
 b=huJUTcoEXshU0eFv2ZdgSCsNmNYac49UYdbkyLEDs5AkRRXeF3isOfGeXBwgygrrAGeLvekm7xsi+FQUpxb/nImGUmh4rGUNzrLlLZVGXt8jeF4+ljBQnVFAjDk0lmAp0xy1i5frWjDRkxs/nPlIulJFQDg2mFhq6cYPJ+2hPOvo6uITogPN7jwzK2PHnNigm5tzFypmRRRsVaIdUGbNso6fchhhF0uLieNoTFzNnst39JMZC0+PkIyywyHsPKfDbaT4BNUs2a4OCaRsXv0fXFhFnX3t6Tu9TzyTPry4vnNRWZwPXqBn37Z5lV1oSucSCLG6FJgxICB9ZReOCOqOGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fI9zMresrdUyIgi9xEyLCN6ExzRQ62FwYQM4OixeJk=;
 b=SRW5nu8M+Wyt4PsYmo/JMQ8hzFmkhH9TmGAhJC/9wjuBKgl5NAk+DlRYdS2O196oXayctcq1L1ORJ3pkEVDFl7Oglb2Nq3oVcy0I4tqZrgsPyoJBpSGp+oLyn2YDF15YVHI32GtU6dDKsXSQ8DbEI9BxcsMHi223oJdTZ/03WO78yHkdBunWTDUzmUUjrl0pJ5La3Y08IdwhR/XKy5ghpWY/oyApvBTipvfWKXlHwEpQVRwEyz16K4Ar12FxzzZrDLL+UAoin1ynFenTXH2zoBkM+2+lyvVN7vydAJkEhfn/PXZqP1/205ymSfnU8jSQ1Yx795vXYJJFMGxqRCcNCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fI9zMresrdUyIgi9xEyLCN6ExzRQ62FwYQM4OixeJk=;
 b=FjIOVLnP67ZkAcQSJvLU6mEjAQ2JBc/eertrJ4X+cNsrJ3Gy3GK9qd9+mhApC4pRmkC3WmrQUsh7EhxPSFzrWnsB88UxrB+BfK/gxw8VITM9L7YPbTTuEi9levRwJWC5hSw4nVX2ywMnqbQWRUj26l48dh3LX6+zGwMapLGF4rw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <bfa9e799-bdb3-46ec-8d2d-c085d131e6ca@citrix.com>
Date: Mon, 2 Nov 2026 13:44:06 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 2/2] x86/hvm: sync APs TSC with the BSP at creation only
To: Roger Pau Monne <roger@xenproject.org>, xen-devel@lists.xenproject.org
References: <20261030132419.84264-1-roger@xenproject.org>
 <20261030132419.84264-3-roger@xenproject.org>
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
In-Reply-To: <20261030132419.84264-3-roger@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0107.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MW4PR03MB7009:EE_
X-MS-Office365-Filtering-Correlation-Id: dcff0f3f-3a45-4b6b-7f52-08df38e75f21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|6133799003|18002099003|22082099003|56012099006|261021121427099003|11063799006|4143699003|261022105027099003|261021123027099003|261026121527099003|10067099003|261028144727099003|261026140227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	4jSPb6Seq9Gw/9sRxZ26IK/C/hE+q7opEMK9eWes28k6EiJJZS9+7mQsscrvqVDraX0uctbAgjb5a8BaCnP8d9xvNz9x5QPj9Ia4FUBnIaZvVGq74uxEUxgTNcHb/wXONivHusTrqJuvMac8xsqm/x76Sqkl2fczdbiGcLBYvuq/k9DcfoU01Am7hLa2TLEdbGv9bl8o5oxNKWm8qNmxwuSp6yaUqPjDD6u8WGv28w27NTL/YjN+r5zvk3py8xC+YH2o7VkoofEQjjJJdFIZmctimOgZUa4TRFH2kkAFr1yf80WDFsSx2xwDh1eEesR9JV+IWGb2Ix3PX4AZoOTgH7ioofQRPMz0FB02B/ZzDYdgidWDVVFp6HwXaVJAMpE/U8gUvH7pBeQeegT2vXuO46RL53VVBnqfYZJgIgqsrgv4UmjAnXqMlhH3H09JXPI9S18FlTWBBzbKyf2W/E1bdsjzPqsHIfDaRmDt+ZTbXKj12epkBkYVOg3B0arwoXuBLfWJoeCamaHN3et74P6djtPH3LmOcSe5B1e1VxYvM90NMOC7LOG9Bk+4PLuWPJpfvavpT1J5Kx7HAH08EPibINmRRrk1yPL10fQhjNVmlPbah2P+ntTZXXbSF7d3WHPlRWMKOO6o10VvbXj7DeJEzlTteYHIEgey291Aqvg4uk8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(18002099003)(22082099003)(56012099006)(261021121427099003)(11063799006)(4143699003)(261022105027099003)(261021123027099003)(261026121527099003)(10067099003)(261028144727099003)(261026140227099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUFJMWZHOWdLbVFsUWVnU1U2MFFFTWFGTTgvRURFUW8reUxMK3d6WXhRN0p6?=
 =?utf-8?B?a2xLSEl4UUhyVFF6bFR2TkwzaVRyeHhKZUlWUUVyR0dMdW5OZDZjeWtTOUpi?=
 =?utf-8?B?Ym9yTHlrYWsvZTZoMklMQlhCY2RockdwdnQyR1p2RHlmWXBSU2RVZERMNXl5?=
 =?utf-8?B?dEYzU09iY0NyL29BQWNpOUlMVHk2Nis0NzA0UzV3bFFNZ0hIYTVkZ2YrZE9D?=
 =?utf-8?B?Q3l2bXFoTFhPWkVPL3NoRE9XTmlkZ1hWK2NEVFRoN0pKbml2Q3NiY3dnblpl?=
 =?utf-8?B?WlllM1BVcmZHbTNrU1Fwd1pvOURTNGtIdThoUkp4REZXdVpTWktmQnA3b2FS?=
 =?utf-8?B?LzJSUHdkQ25oenYzM3JOSUhLTVdxM2QyVCtPQnQ5Nm1YTldwT3d6WjhmSDIx?=
 =?utf-8?B?SVVVSmZRQnpjaXVJcm92cnJ2MW0xZHE5VEU0OHVDd1I5bWNHWldGWmpNQlNK?=
 =?utf-8?B?Z29BcVkzWTB6dHNLcElaaFVGQitDTTZublVvb245ZndxWEZ0K2lldVc1VjQz?=
 =?utf-8?B?dzlkTm13WmFFRmxubStSNlJzNTg3aHdsT2NOdytpTTBqWE42MW40NTlYSHJI?=
 =?utf-8?B?ZGU4NUVJbytRTGg0ZUplamlIdlhGR3V2dXByLzluWGhBc3kvQWMwbXhuUjFy?=
 =?utf-8?B?Y0NhQnRLNGVvZDhGdk1ZUW9XZDJlQTFjYzIzNFphVzVrMjN6WFhVNzVnRFF5?=
 =?utf-8?B?eGFiZGhWL1pxUE41REJlSkROQzluK0Z6KzRqRWMrNndzaWlpQmMvQWpQU0U3?=
 =?utf-8?B?K2pHUHJDUEtYZmY1dFVzbDFXTUluYitaNjA5MDA0Ym1hZmFERTVsa3lOUmlz?=
 =?utf-8?B?aUJ3cXI2eU5hVW4wWTRpc0pwNmVHUVAzWFlyTUFWLzdaM1JIUWdNbEZRcmtM?=
 =?utf-8?B?NXl6dTg5dTZza1BlWkpBbGsrbERzNmhnZnVqVUp6Mm1PV3gxbDJPeVN2QW9V?=
 =?utf-8?B?dkJFR2lTZ0FSTUgyeE9rTkE2T29LbzFCN2ZHekh4Y2xEcVczbE9nYTMwQUlO?=
 =?utf-8?B?cTBXM1RpWE5PRTUveUN4TVhCTklpK2ZNWDVveVFJUkxGTytvckp0YW14c1Ew?=
 =?utf-8?B?NUR4NGdvT1VnS3MzZGE4VWFhUlNIMnlwTk5odzVIYzFFNzZBazFyeW5UQjVU?=
 =?utf-8?B?VG1GNUlzSFZjZkpmN3BiSmVoRWc0S01ud2JYU2VxeXRrTFpIRHdHMVNJWWV0?=
 =?utf-8?B?Ymk4WUh6QlJZN0VTZVNyb2FOSWMyTkwvUmcvT2NZa2M4Tms3V2VOb2VvU05D?=
 =?utf-8?B?ZS8vdHpaRDE5TStmdDFaTFRDWFltSGNOUG1ZeUlOYUNLTC9SRnFRNFlXTjJY?=
 =?utf-8?B?YXRTWWtIZnVtTlRQYkNVR2hwYnZ2TEkxKy9RbmUrbU52S21DSVprQTlBWFRy?=
 =?utf-8?B?VVE3a0NCWENSRU9qcGFYV01oS25Gd2h1SzE1ZFdIZG55VTNVNVBoRnJ1V096?=
 =?utf-8?B?aU9JMkZsd1UvMnIyOVc3Qkh6ck84dkgyMXVCU3ArOC93SDBDVGVNbkl0WEF5?=
 =?utf-8?B?b3JhNmJGRlAraDlWdkVTNytCRW1wR0FWRnZDM2g0SEovRUFqclU5anlvV1Fl?=
 =?utf-8?B?aGNidUxDVFNtdzZsZzVnbTNjQ3dLQzRLZVYzZWUxMGNuSGVVZXYxYXNyOTQz?=
 =?utf-8?B?UUMxb04wZ3RhVlR4aVBGYkcxeGZGQUZkdUlKWDlGZ05wT2NOcFhuTDY5S3Ev?=
 =?utf-8?B?SXJXcXpFWUxwcmdpaDZQckRDc2NEMTdMTzZ5eWs3bWNscW5Ib0N3R2pqamtk?=
 =?utf-8?B?bEdacTJiajY1OG5VNkhZM2xyQ2cyRGxaSzYwTXlZaEFsYzVSbUw4cmVxTXgr?=
 =?utf-8?B?T1U3UHNGTXZjVUdYUnFtc25ZMTZSL0F0cXFwb3B2VW40RkV2T1JkY2hZcDc4?=
 =?utf-8?B?UTN5cWszS0Zpb0VqL3VOY0JYSUFGTTdvSXJFQnRjd0IzWnRTaDFEN2xKblR3?=
 =?utf-8?B?UTNuejhqcUlUUW5LeWQ1WjJLWUY2WklWTXR4eHo5aGpubzlJQW1RNzNBdkJX?=
 =?utf-8?B?cGxONU9KTEJ5WFN6a0dzR0dsNEg3d0dNbmJlZDRHdjJJNCsxSkRQdGwzbTVo?=
 =?utf-8?B?V1pDeWJVNWpEa3NBNXQ2TWNYVFpDanc0MWdGdll2ZDUxcmdHYlZZRmVLRDRp?=
 =?utf-8?B?QUoxaDJVcHhSNVZYZlQ2V2J4VVZmSmVOSnJXeHVOV1ppMjhiQVVLWWltUVNx?=
 =?utf-8?B?SkI4UVh1ZXl3R0pSRmRPVWxqNlBIeExXWWN1YXRrbkZwOGhXTklrWVJXa216?=
 =?utf-8?B?U1ZwOWtVdnJTZ3RwS0hRYXNnOTNjcm5jbVFhU3UxcUJ1aUpHdDZMa2FsVFVJ?=
 =?utf-8?B?QkhHMW9VQVZCTGZqM2R1NDJ2Y3NGc1JRd3pnK25Hbmx4ZzdrbDNTUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcff0f3f-3a45-4b6b-7f52-08df38e75f21
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 13:44:09.5345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zDXfrGaJb18xiddCYgCY1pjwSwMY69wPFbUSWFaPPxg/yyW23L62QMS2qoHxJg09un/JH2kx+CXYc7O8lyOOIbBr6fFVOuRS/+68VZY5Aoc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB7009
X-purgate-ID: tlsNG-42698a/1793627170-AAAD89EA-11BC06F2/0/0
X-purgate-type: clean
X-purgate-size: 3167
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 30/10/2026 1:24 pm, Roger Pau Monne wrote:
> The current logic syncs the APs' TSC with the BSP both at reset and when
> setting the vCPU state.  This doesn't match hardware behavior, where APs
> are only in sync at platform start.
>
> Move the TSC sync so it's done in hvm_vcpu_initialise(), that's called a
> single time at vCPU creation.  This matches the hardware behavior.
> INIT-SIPI and VCPUOP_initialise no longer re-sync a vCPU's TSC to vCPU 0's.

Yeah, this is very buggy.   All TSC values are 0'd at #RESET and
unchanged for INIT.

>
> On migration the TSC offset for offline vCPUs is not transferred
> (hvm_save_cpu_ctxt() skips offline vCPUs).  To avoid an unexpected skew
> synchronize offline vCPUs with the first online vCPU, taking into account
> the TSC_ADJUST value.
>
> The clearing of TSC_ADJUST is also made consistent with hardware behavior:
> clear it on S3 resume, but not across an INIT-SIPI or VCPUOP_initialise.
> Additionally, on S3 resume start all vCPUs from a shared TSC reading, so
> they are in sync.
>
> Fixes: c31f8336e64e ("[HVM] Initialise AP TSC to same as BP TSC.")
> Fixes: 6e0336351ed9 ("x86: Implement TSC adjust feature for HVM guest")
> Signed-off-by: Roger Pau Monné <roger@xenproject.org>
> ---
>  xen/arch/x86/hvm/domain.c |  5 -----
>  xen/arch/x86/hvm/hvm.c    | 19 +++++++++++--------
>  xen/arch/x86/hvm/save.c   | 34 ++++++++++++++++++++++++++++++++--
>  xen/arch/x86/time.c       |  5 ++---
>  4 files changed, 45 insertions(+), 18 deletions(-)
>
> diff --git a/xen/arch/x86/hvm/domain.c b/xen/arch/x86/hvm/domain.c
> index 978d8b222256..71f49ec7ce9f 100644
> --- a/xen/arch/x86/hvm/domain.c
> +++ b/xen/arch/x86/hvm/domain.c
> @@ -312,11 +312,6 @@ int arch_set_info_hvm_guest(struct vcpu *v, const struct vcpu_hvm_context *ctx)
>      hvm_set_segment_register(v, x86_seg_es, &es);
>      hvm_set_segment_register(v, x86_seg_tss, &tr);
>  
> -    /* Sync AP's TSC with BSP's. */
> -    v->arch.hvm.cache_tsc_offset =
> -        d->vcpu[0]->arch.hvm.cache_tsc_offset;
> -    hvm_set_tsc_offset(v, v->arch.hvm.cache_tsc_offset);
> -
>      paging_update_paging_modes(v);
>  
>      hvmemul_cancel(v);
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index ef9c7cd05777..81e90cc8fc8e 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -1667,6 +1667,12 @@ int hvm_vcpu_initialise(struct vcpu *v)
>          /* Init guest TSC to start from zero. */
>          hvm_set_guest_tsc(v, 0);
>      }
> +    else
> +    {
> +        /* Start in step with vCPU 0, as all CPUs do at power-on. */
> +        v->arch.hvm.cache_tsc_offset = d->vcpu[0]->arch.hvm.cache_tsc_offset;
> +        hvm_set_tsc_offset(v, v->arch.hvm.cache_tsc_offset);
> +    }

I agree that the current behaviour is very broken, but this adjustment
isn't correct either.  For starters, it's not possible to have a
non-zero value here[1].

I'm quite concerned with this patch.  You're adjusting at least 3
separate things.

~Andrew

[1] Well, it is, but only by the toolstack racing hypercalls, which we
do not care about supporting.

