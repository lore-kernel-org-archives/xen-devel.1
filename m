Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FBB606A32A
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 21:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=JYWwo+sE
Received: from list by lists.xenproject.org with outflank-mailman.1493213.1693320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTQIi-0006Bx-BG; Tue, 17 Nov 2026 21:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493213.1693320; Tue, 17 Nov 2026 21:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTQIi-0006Bq-7i; Tue, 17 Nov 2026 21:01:12 +0000
Received: by outflank-mailman (input) for mailman id 1493213;
 Tue, 17 Nov 2026 21:01:10 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xTQIg-0006Bk-DY
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 21:01:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTQIf-001CFv-Mu
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 22:01:09 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6afcc07d-e002-0a2a0a5209dd-0a2a4508ac98-38
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 22:01:09 +0100
Received: from [40.93.198.63]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6afcc094-f659-0a2a45080019-285dc63fad72-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 22:01:09 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by EAYPR03MB868030.namprd03.prod.outlook.com (2603:10b6:303:2fb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 21:01:06 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 21:01:06 +0000
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
 b=kejzvQDo9Av0Wmn9T10OVnli7nbirf/91Imz4RIA31TPg5etR0vrzGo/SWmEVZptBDHbdbQvzFoVqBd6zt7mdNOmU5bn3mVPqgnzrbPpv7HVXJCcwMGijGKFM6H4X3+VVL8qamgBVoGan7CymRzRfF/L5CO6SzSTQsMHmdCWUIxkfZ+R4dcmEzzQJdzhoh+f3CmEYTW9JzmMWz31pLibJTVsOZ6NV7DG/k2l/wSn0amFsqK/8JMUeDTFYPN1bYllAyhhv257+Wz8KNZXLCVaQNNcUMjrt/3KPqpDwPepfIKcmiYFECnixg1O/4zqY4j2U7nj+9fkoV9NKS/3DsCKFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QddssIm0iKlIgGSsiezqcHKpctbQRzggBvoBPYSwX+Q=;
 b=mml2uP4k6ydSVhnDGPx6HSSdJ2qhmxhsN67zQ8AIkAFefHJwPbwHtkRbE46ScRMJm8WEIPbUTY2/6GUTfBZOFLv01MXI95OgtFEr/eTcr6XnslXDcxIW/YKPyYzkd106IXzxCuJ7BhVxJxfunrInPnXlKkZ11maRxsXm40yt5wk08y6ko1c5SAwJ8BHOmggkFvHK7bsYigjzf3N4nVQqdjVA/2WKSUeySqJfyDsmcbaWWOVhVE756PLf28cHyHL/8sbOk7yStNAbvDzwtGnIXJAznfdU0n589hJoBiSIXUhAKnD5hMQ5BJ9F8sWkJx6gFPvM2NzCF/nKdS8HslTE5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QddssIm0iKlIgGSsiezqcHKpctbQRzggBvoBPYSwX+Q=;
 b=JYWwo+sEKTJXiGY05epZ0w4OUBUoyOx2H3qvRSCkWFL0j11wXADOJWPB5E0DKBuXLK4YdVOEjxMPWohFNS2M4pvvg3YhsdRqROqA7oIcm2Qj/Nnb+KcS/B0kwVU82LmUf9U0ozFrAVPqAHz0kabO2Fe8OXSkoTwt9ZaUT/61Qqg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a2224fcb-e529-4b24-9ee2-2050511cb801@citrix.com>
Date: Tue, 17 Nov 2026 21:01:01 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH 4/4] automation/eclair: deviate MISRA C Rule 11.8 for
 xfree() and vfree()
To: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1793699713.git.dmytro_prokopchuk1@epam.com>
 <4accfe649e163bb4d0372c432256ed394b4ee50d.1793699713.git.dmytro_prokopchuk1@epam.com>
 <de39dd8c-1db0-45a9-a9c9-ad2f2e0a90cb@citrix.com>
 <e4396ce2-ca0f-4c18-85e8-bf0a2afa97e9@epam.com>
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
In-Reply-To: <e4396ce2-ca0f-4c18-85e8-bf0a2afa97e9@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0053.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|EAYPR03MB868030:EE_
X-MS-Office365-Filtering-Correlation-Id: e6c7e04e-c1db-46dd-2c9e-08df44ede575
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|6133799003|22082099003|18002099003|56012099006|11063799006|10067099003|4143699003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261021121427099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	rrG/L0gUglUIo6ZlfSSA78C9kuiYRw3I65GjA4vPDR682MQ7Siki/gUKh766WarGdDKMFkHhKGC2wXfC3cYwICLv+/0BBylAQMYGGqscSUkU+EDYD5aw9eOmzDdRfAmV+NqYzR0TB2rIa5FX7a550RTQ+K2UBk24yUCQRcYm7Nja1uq2YtwBcMfFaUr/vw2g3aDYfTKXa0jqfjDaTR+i69rbSQ508rbHGwPFmCq6mCSF31ucj5SctM40CKqj7gmp+HR+D1r34mdS7jDIqfJpSeRID0cSpVHnemmEKyLCDVeolNbDtBiAfP0uiZIs7HZsq7wEExpFgoS/RLoHOgNmiJ7thUOrKhXKkyiq9gfqC+vHWbv+v0mPHxwWO1vBitZ2lzNvV8ZpHSNHe9yoZ/1i0SLXxtF6qasraJEJ8uKRg1PQ49YvK53gL/pVaU3cfbs4McevOZMoWEt5Nn1ZrNzTIE2RNe/ZlxpvOr6S7WNd+nOvyZucXCbyyPE+qnEDcBevdRv265yPtyZp41aHQbPzpw7sF5GfV+TDCtDOO8kMWiXpCFhGy9bFwLoY/hKkIiIrQdace/N57wd4ENL/r+k2ApWuW1nSvqtXrfjEg2G0fa9xJooyLz6VIeg4Ee+ZSGtOVKwMfk5+3VOrgfTZcW53TD3JJOnMWiGaRD25PMfY/hs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(4143699003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFQ2cExjUkRjY2grcVF6cFJCMDErYzliOXZieWRLVHpIZWRYaGR0WmN4b1Nq?=
 =?utf-8?B?SWJ1d2hkcjNBTDNhOGJYTTMxZFNCb1hySTh6NG43YU1YQy9meE1xS3hwTlhp?=
 =?utf-8?B?WUVvbWh1VGxYV2taekdpSTJ4UURKQnhxRDk3VFpmeXowQ3FtR2pCMDdnR00y?=
 =?utf-8?B?MlNleDBkcmphUWlyc0xzaXRvWEhKeFZQdUF1cnpUU2JDTmlkd1B1bU13WVUz?=
 =?utf-8?B?NFJyTi8rVUkvYm1tQWJlUWJjS0JlQkZhSEpsMmkxYXNsVmdaaEt5TlB4TlFz?=
 =?utf-8?B?TWFid0cyenBHY2xudnNBb1h4UjAyMzVYWUNTSzdoMDYzaS9XbkVzQ2lxYWhK?=
 =?utf-8?B?ZWVBZzZzWE1yL3JGcGk4MVJ5QVFTTnc4VG81L2pxZWlla29MZ3lmWG5ZdzJJ?=
 =?utf-8?B?OXJnMGZobzBOTjRFNTNoTURBTEsyRy81OThmeXBaMXFJTjVSaldvb3pUTUYz?=
 =?utf-8?B?L3M5OStNWXZXYVh6QmNBa2FqUzg1MjdrdGlWK0RYYm1qQjkzVnZ5MkpGR0FY?=
 =?utf-8?B?WGVwMndHandwbEJnanVLTjg2TjU0TFJSVW4zT21lUUpkTDFtRDdQM0xrSmtE?=
 =?utf-8?B?Z0psZnNlVjcxMmZLSldoSDQ1YXNBVDJsTGFBOEVPQ0QvUERWRzcyRFBaNndU?=
 =?utf-8?B?VkFiUUR5ei9MMDJubDdZTHBCUUZFK1lVSnlTS3VNV0xrSFdQa1QwcHVVZ3cz?=
 =?utf-8?B?bUljRnJ6THhmMUNGYktSdDRxRmlyVENJTGV1Z3VjZE1telZZK3A5bGZkZzhM?=
 =?utf-8?B?Zy9mNjNsMXd5bGptbWZrT25Nd1U5djVUQ21jVGo1VmhlRmhqaE50Qm16N1J4?=
 =?utf-8?B?UFBDNUcvYUtLNWwwdmdsaFBEa2hHTXhGV25kaVRhVWs0K1N6U3hGM04vWWpU?=
 =?utf-8?B?c29kTDNBRVVWb2RQQlJ1b2NSUUpEM1dLeVdrN05iUDhaKzZhLzd4UFJveHp6?=
 =?utf-8?B?dUVKSFg1cTNPcVlqeGZCanNlTFAySkxGNDdlOFhWZXpibVhuaWxhYTg4UGNL?=
 =?utf-8?B?dFZYc01Td0VXTGFidmNKOGI0MHlyRmd6djFpbXJhR2JvcUJJQ2tNbXpjTUp3?=
 =?utf-8?B?TnQzeDFZNmZJZFFJeTB3ZUd4dGducWFBaXU5eUpzR2xyZnlGanVZTGRRT2hV?=
 =?utf-8?B?eFpKdms2ZGkrRnBTaTZzbjhPWnNtQ0l3TnJPY1ZnTERaUmRyakRKNk1LNUs0?=
 =?utf-8?B?TndBRUh3YmJLZG0rU3Q1QldVZ3lybUJzVjUvcHZPOUI3cXFqRC9UZVdjR2hk?=
 =?utf-8?B?UTh0VWZCdGVUQUgzMEZVU1p1S0EwZHAwQkh2NWtBdkJmL0pLRi9MTXYzeUVm?=
 =?utf-8?B?M1dPZWRRNG9xaVB5VzJlNE84WmJ5K2M3K0VHb1pIM2JkWTk0d0p0TWxqeVRB?=
 =?utf-8?B?OVo5Z0xxaW5zOWJSdXFRTHAwbmczald5NzR2WlE3MnE4TGRvRFU3ditlaDNq?=
 =?utf-8?B?NnNoZ2RqbnVubG9VT0Q1YlhrOEVHVjJOczgwOXdHdEtUUEZFd21zTGw2MWVt?=
 =?utf-8?B?U2NhMUtFSkhpemxkcERLSG9xTmNTdlFXRDBPNWFCeE54RTFqSDhXbWFwL0hk?=
 =?utf-8?B?Skg1ZkdaUVhkK25UUmZFZUxmZktWLzZvaGJjQks4eEgvTTVnVk5PKzdwNHRl?=
 =?utf-8?B?d253K3RTRU1SV01WWGdCbUxiREFFVXQ0ZFFxckxkWHVXWGgwRkplYVM2Wit6?=
 =?utf-8?B?TG5lYUNvUy9saUF2dEhtTzYzTnZqaHFlNFBtUDM5U2FrOGtTSEpqSnVZYy8w?=
 =?utf-8?B?dnRpUXZKYkVMbEFmSFNMSHZyY2pqclFBZnhPckV5UkdseWRiU0xoeHdyZ0tI?=
 =?utf-8?B?eE93MTZ5TkJ5cGUyNjFQMzM0eTN2VDJsR2JPVjdHNDJISURHWG55blJ5b2xp?=
 =?utf-8?B?andjSGlwdkNsQ1lIRDlNcVh6VTRva0MrclRXdkRnU0UzTkticjUvS1d1Z1ZU?=
 =?utf-8?B?UUVIRk41R3VySzY3ZVlPbkp2ZFpxTUZFb1BycjA4c1lwWTR2Si9RQ294VUZG?=
 =?utf-8?B?OGlWVnJzaVZ6NUV2dWRjVFl0ZEttc0hJTGNYZzBYMk1KdzVmTllNMVhDb3pX?=
 =?utf-8?B?ZmpVaURNRFVyU0tLSVcwaEg2ZUpudzNnb3VxeENLb3NlbmlFVzcrUjVaemRn?=
 =?utf-8?B?bTJYdmttSEpnM2RMSkRNbGpXODlremJIMzRTcktWaGRtTXo4RFB1ZlhpSFlD?=
 =?utf-8?B?a3d3MkpDb0NmVjRtSlpXdnlzTzlqTjVZOXNIWGExMjBzVGlCdTRKUzlvSHRj?=
 =?utf-8?B?ODhsMG1HZ281UGlFMStCYmFWekJXcWVrVkc0dlA2TDZWdVludlBsYVVHUnlK?=
 =?utf-8?B?T3VWYVZ6S2JiTjRWMEIvcUtMTnltNnd4c21TMTN1Z1lLLzFkU2QxSmZpNW85?=
 =?utf-8?Q?30M2eQdPO1/sgmsM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6c7e04e-c1db-46dd-2c9e-08df44ede575
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 21:01:05.9236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4fRYoFoIGq6f/QyZYj7nISuJThPPPVORtMV4vMTQ5hYY4i0WMQSJjOIK44Nt9nVvrUY+DrSRrolqLMpl9LPPHE+AnGeTijhPl71BBeo6cHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR03MB868030
X-purgate-ID: tlsNG-c1860d/1794949269-D795A87B-8443BE01/0/0
X-purgate-type: clean
X-purgate-size: 1965
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 17/11/2026 8:01 pm, Dmytro Prokopchuk wrote:
>
>
> On 11/4/26 13:24, Andrew Cooper wrote:
>> On 03/11/2026 10:29 am, Dmytro Prokopchuk1 wrote:
>>> Livepatch passes const-qualified pointers from struct payload to
>>> xfree()
>>> and vfree(), which take a 'void *' argument. The cast that removes the
>>> const qualifier is a violation of MISRA C Rule 11.8.
>>>
>>> Such casts are safe.  The deallocation functions neither read nor write
>>> the content of the object being freed, and the object is not accessed
>>> after it has been freed.
>>
>> I have a very firm objection to this.
>>
>> It is impossible for any allocation from malloc()/calloc()/etc to point
>> to read-only memory, which is why free() takes a mutable pointer, not a
>> const pointer.  The same is true of any other heap implementation.
>>
>> It is impossible to make an object in read-only memory undefined.
>> Objects in read-only memory by definition have a global lifetime, and it
>> is absurd to argue that a specific heap implementation ought to permit
>> making such objects undefined.
>>
>>
>> The bug here is livepatch storing a heap allocation in a const pointer.
>>
>> This comes from deeper problem where some contributors/reviewers want
>> the const keyword to mean something it doesn't.
>>
>> ~Andrew
>
> Jan, Andrew,
>
> thanks for the review.  Given the disagreement, I will drop this
> deviation for now.
>
> If the preferred fix is to stop storing heap allocations in
> const-qualified members of 'struct payload' (so the casts go away), I
> can prepare a follow-up patch.  Please confirm that is the direction
> you want for livepatch.

Please remove the const qualification in struct payload.  The logic
should not have been accepted in that state to begin with.

This is the only course of action here which does not create a class of
undefined behaviour, or permit said undefined behaviour to go unnoticed.

~Andrew

