Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7EC606A321
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 12:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=TBo1mcuq
Received: from list by lists.xenproject.org with outflank-mailman.1481586.1685481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQkk4-0007A1-9Z; Tue, 10 Nov 2026 12:14:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481586.1685481; Tue, 10 Nov 2026 12:14:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQkk4-00079q-4l; Tue, 10 Nov 2026 12:14:24 +0000
Received: by outflank-mailman (input) for mailman id 1481586;
 Tue, 10 Nov 2026 12:14:22 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQkk1-00079h-RE
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 12:14:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQkk0-00Aadm-Kl
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 13:14:20 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af30a9a-2eae-0a2a0a5409dd-0a2a4505a914-14
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 13:14:20 +0100
Received: from [52.101.52.54]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af30a9b-4cb1-0a2a45050019-3465343671ea-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 13:14:20 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH9PR03MB362629.namprd03.prod.outlook.com (2603:10b6:510:3e3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 12:14:17 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 12:14:16 +0000
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
 b=jcMo2epuPQTmp9pq1l547qhyG0Me3jWUWIxMKOg6v1F8Dij16pD8kMkqdpnD9WOv8QRAe7tSYZc8ii0Dhs8V3f1D3V3fW1+PT3zvLsXfy8MSv+Fibh0lvb4SUkxqjgn03fFcIJnP2i+sFsGqqg638f3oDr0j30qLCd9H0+K+VnwVJC62Ik3jpieRWlgRlQKcg6x1+YDOe8IRSBlzqgv7xows3xcM9Whl044e8upX3Pc7GFdRHbvdoFHhcwLR8Y57bN9XkQS2VaBGeuzWuQJ88u/bIMtZZ9YvZqjer9TCcoPkPmBvye4Z0r6boOp8lMZ3JGJjyvZxS8hZc3elvD8I6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EdDdFsnkjmva17ZNMzZj3SowAxCyV16kWmsf33gsYQ0=;
 b=ONg/87fwKjRBLaZ9ERhu/AGrnmiciLqxysGTtyIs8Q2e5lNo8s7nLIZMHR41c7M3rHSoGN7SdLZhsKOp+qAp+YjDo3XLANhSwvRm1Jw3yFem962dy/RzeDWIciVslaKL5/dlHv+XeLbZJFGgx3slmfPfu0x4mqXFoBPHww5SlFsarmIDdLTHkP7WJ/8/lkmX0t6Ef2Ld9cO9iY+QGIve1P+HjqeFMsqNgzwrUv5BqSly7zh+x6w/mECLAC7W21Uyvci2umpiTUa6cohZiJbyCVJVzKFnRBcOs/XxlnXgOVFbUf81cwdRSrTxdqKXFh9I0Je/0ru7YjmgomLeSJ8QWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EdDdFsnkjmva17ZNMzZj3SowAxCyV16kWmsf33gsYQ0=;
 b=TBo1mcuqaOFhQeLopyCnEnMeWoU74rIyxsDH0mOPtetR2ZCi+PNxboPrZJvzlNNgSTg1Fqhx1r8ARsWTg3zJqRKS3R8tJp+U/wYsedWsGLLoiwp4YSIJiJsca3krFcc5n0DSb9ct8bKzqnmm0t6IEUX3C3FCX2pQxzgj6V49kMg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a4530648-097e-4867-848c-12c8d5ed4c43@citrix.com>
Date: Tue, 10 Nov 2026 12:14:13 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/bitops: Improve code generation for __scanbit()
To: Jan Beulich <jbeulich@suse.com>
References: <20261106171204.2783260-1-andrew.cooper3@citrix.com>
 <827e9a54-cfba-4d18-b6de-fbbb7ccd7d5c@suse.com>
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
In-Reply-To: <827e9a54-cfba-4d18-b6de-fbbb7ccd7d5c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0291.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH9PR03MB362629:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f8ec8cb-0ea0-4013-cab9-08df3f2423df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|4143699003|5023799004|11063799006|56012099006|22082099003|18002099003|6133799003|10067099003|261021121427099003|261022105027099003|261026140227099003|261026121527099003|261102123227099003|261028144727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	7+LMVoVuiAOYPse0gq7AIs/qg0kMvOj5PqrocnTYkC5QQSV8huQj8LYPuT172AS4UVttPomAAD9ygyBTnmkCOZf1s0Nfo8KlgN/t5pTyQK5dqBWBe4SmhBLnaA3dYtfWbXNym0/6aOMqQmAApKnBPA/D2K4Zk/+OTNO4r6lAH2FZyne2S9rEkuuv1UB+Z4LnJvkAFOtB2atOD8yAYQjPidSOGhrEYcvDvC38nV8rUJ4nmCS9jNsATmyGq6hNNrsFhyxI00/6OGk32qJc6Yr1MU3HIjVV8L64lhtFSx1YtKs0BBYfTNR/u37MkiWVYqFjufWHXEGUg90mc2ZrRcONsTgX0AV5pq8e/GdsxFKtZ7nKpJJapMSdGvaokhwqeZ/Q8G3OnlJpDN1vXuVSXLDnZlIaDElbEJm3qvLa6VCwBQmfSRj1SAlQu53N6d1yqG1IcAS0aQQq5q3RulHrqsCmRV4Lb79h3AXhhjEbKcrZSNWjOBXtQsQ/jaYNX1QZSTl3v1+Pvl3MFMA5/ZNxmNvyFGwuOhW2daoxzOAn589HcpeU0xc4QkC+l3LuE7VfXSUFzjKu5h1YY2rGK4J+Zpqt2+ncwcpQtUEW6bliSV5wJ7izvcKlE3upVnPHdlNz+ls9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(4143699003)(5023799004)(11063799006)(56012099006)(22082099003)(18002099003)(6133799003)(10067099003)(261021121427099003)(261022105027099003)(261026140227099003)(261026121527099003)(261102123227099003)(261028144727099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWlxOVh6YTJKSUhhTVM1SkdPRmVPZ2pSMEhlM1JEaUxna1pnVGJwQi9GK2dB?=
 =?utf-8?B?UFR4bGxNZkVCTGxjd3VZclJobHNITENOOGl0Y3A0ZFlOd0w4VDdYc2xuR0dz?=
 =?utf-8?B?alBvZTJHWmh2d1BpWDNJcjNXZ3d1RVBQbEkyOVFvWGwvQ3JYZEZUdW5TcWI3?=
 =?utf-8?B?dFNmWVRyd2ZBUllUbk9JN2owdWlob2g1UE5GMkdFMVZ0RzVrS2VGbmF1OUlq?=
 =?utf-8?B?RytDeXpCcnRYZnBCTUdvaU9iclNEVmdNMWtnVGM5NXZac29UYVNRQzlvZWp5?=
 =?utf-8?B?NHBtQzVud0sxZnVLWUJCZ0cvQ2xuTWVCTnhYSiswZHU1Si81SFpEZXVxSVI2?=
 =?utf-8?B?ZURBVlFCTWJ0eHpEa0d2MlVEOTg4eGZ2TnNBb1dYSUp4UzE2ZWN5dy9Yb1VW?=
 =?utf-8?B?K1dORjFmZk8rMDgwYStIUmdKblliWWtZNzNhSVRNWXlVVkdwbDArN1lid2N2?=
 =?utf-8?B?WDFxVnF1NSs0WDIwa0x5OHp1aUNrSDNxKytUTUN3SzdSVVlteHp3OUpDN05B?=
 =?utf-8?B?V2FXSVdXZzVOdTljakNyMklpb1VvMXVtUGZGb3ltd3FQYzlSRm5zWkxmWWFQ?=
 =?utf-8?B?eWxZdU43em9vQ0VSbml3Q0h2REtYSXdlNUpPMWtrbG5pN1hrRVNPL0tLTEJs?=
 =?utf-8?B?OGlwZUV1cEEvWndBVjV1dXgrSnBUN2xkazNMN25Da0ZwWG5hR1YwTlNlRmZT?=
 =?utf-8?B?dFRBb042ZDYxUHJYOVRVRDFXUUdadW9qZ0w5UXpVbnlDcU9NYmlUeGZGcU1l?=
 =?utf-8?B?YzJoTk8xaWJuOERvUDUwRytpaFJKNGxVcDJFaE5wTnZ3aVpKNEdPLzFsWmd3?=
 =?utf-8?B?a0tDVVhtRUt1Zm1vNy9waWZJeTNvUFZNU2gxVktJbjNuUmw0ak5ZVWM5Ukdj?=
 =?utf-8?B?STdqK01DQnRzakU3cGVKRkFHcXNVZTcvWWJERGg2Y0hZaUg5SGZnY1JJK29z?=
 =?utf-8?B?UDQ4MGxsVi81NG5URkUxdTBJWkJueFdPRnd0UEhFQTloQWVlL28vaE1TMTVr?=
 =?utf-8?B?eG5kZk1FZEhQOFN1Yyt0RTNWd3pXd3lvOFRjRnNQUDBNSnBvdmxIMFFWSlBm?=
 =?utf-8?B?NCsrSmM2YTB2NU1HNXArSC9pQkdvNFd0dUY0UFJxZi93bmVZckh4dHFWL0pv?=
 =?utf-8?B?bWozTVVNZ1dOS0hKbC92TkFRZ1NjVlluTHh3OUk1YzBXN2lQUUxnRkEzYXB6?=
 =?utf-8?B?M3Vkeno1V3U0R0x3UDlVSUNqclpSMys0cWVrNzBvQUZjTmh2ZTNOTG9yazAz?=
 =?utf-8?B?dVJ0QXFFazA5aWhmakp0NDRrRDFlRGd1SWN4UFFoODhORHlBNzVHWVNwVzBh?=
 =?utf-8?B?Zld1TlZJcG9BOEU4T2V5UkF5ejZIQlhEVmI3alZaWEVxL09QZUI3RWtSVllM?=
 =?utf-8?B?SWJvTllhTVBESHNQNzJwd1VYcWtwb1hvQy9HY3lpNGFQTThYQWVKMG5rTVBm?=
 =?utf-8?B?K1hTcHMyLzM0WWJzTWc1VnMwcW1rYzY0TkpRU3p0SklxNk4zWk15RGRmUHM1?=
 =?utf-8?B?eFRUTWZMNDloT0FnU1Q5TUpBbGdaQVR1dFdqR21zQTMzemlGUWttS3FWbVRZ?=
 =?utf-8?B?TWpZVmpXc0ZZclBXeFJhRGg2dWkrMExEdldnUWhGVmRhejF5czJPcVUrUlB6?=
 =?utf-8?B?b1RwSXZGZThCSERGbjh0MzFaaFRyakI0YmRIY0NybHNaVTQwMDFid2hpN2xo?=
 =?utf-8?B?bmttVklDVWI3S0JXUWU2VWErRFQyakVzUk5HN3FMM1dLdGtYVkUvcVMvcloz?=
 =?utf-8?B?cTJ4R3lDWlhNeUp0TEYrYXpiL1lPam1sU3hhZno4MXBIRmFXbHFmd0pqd0pD?=
 =?utf-8?B?N2FXTGV3Rlg3b2JHTVlkblpVK3BvNnFaZE9UWkRPSUpvSG1aeHJPZ05yR1Ja?=
 =?utf-8?B?ODY3VmR1VEdwVVQ5ZEpUR3BMZkkzTUtaeGt6akpkRzA3Wks4VEhnekFCKzlP?=
 =?utf-8?B?YUVycllvOHNkTzRnTkZuZXIzQW5IYjBLbGh1V1hWSmpGR01wakZPN3l1WG5j?=
 =?utf-8?B?VXZaNUd4V0dKeVdLenE1YUZGYVVTTmJkbTJraGhYN0tmOTlxeWFGZTBVdGZu?=
 =?utf-8?B?Zi93a0hrZVJWN0VwdHVaS0hqVHlMMkhPNzltVmxmczU0OXdCNlhsREZqbnRR?=
 =?utf-8?B?SXBMS2NqdzZPOVJ4aEl2dlY5TTIvWU92bVFERUQ1T1d0UVpEcjNUYWR2d0RL?=
 =?utf-8?B?eG9TL2R0Z0NLWG42MWl6WDEvTGxDcHJ6ckJFcmVDKzdYTlRmMEtSRkVwWGJO?=
 =?utf-8?B?MnQwRWNWdWZ1aHkrbjg0QjlsQkNiM0l4eFV3TENOZWxZWU16c0U4WE53YURW?=
 =?utf-8?B?bjBkL1NsbkVnazUrYUNUVTI2SUk1RXZpbkIraGNBcFA0b3ZJLzAzdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f8ec8cb-0ea0-4013-cab9-08df3f2423df
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 12:14:16.3937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CGiwbFylm1MjzTBYZamelDOpStbl5Jm9KLWi7cjwH487INmbghvPtl4zyf67X/74UzLOIdn9MV9w0r64z0iH2z1KcnkC3eUf1wrdiUo6D60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR03MB362629
X-purgate-ID: tlsNG-c201ff/1794312860-724B42A1-54438163/10/78276251493
X-purgate-type: spam
X-purgate-size: 3705
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 09/11/2026 8:46 am, Jan Beulich wrote:
> On 06.11.2026 18:12, Andrew Cooper wrote:
>> There's no need for an alternative.  Use the same technique as arch_ffs() by
>> pre-loading the destination register using the caller chosen "zero case"
>> instead of -1.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <jbeulich@suse.com>
>> CC: Roger Pau Monné <roger@xenproject.org>
>> CC: Teddy Astie <teddy.astie@vates.tech>
>>
>> Slightly RFC.  I don't particualrly like forward-declaring ffsl(), but I don't
>> see another option while maintaining a non-tangled common/arch header split.
> Forward-declaring isn't a problem by itself, just that imo that wants putting
> in xen/bitops.h, not ...
>
>> --- a/xen/arch/x86/include/asm/bitops.h
>> +++ b/xen/arch/x86/include/asm/bitops.h
>> @@ -320,18 +320,35 @@ extern unsigned int __find_first_zero_bit(
>>  extern unsigned int __find_next_zero_bit(
>>      const unsigned long *addr, unsigned int size, unsigned int offset);
>>  
>> +static attr_const unsigned int ffsl(unsigned long x);
> ... here. asm/bitops.h already isn't included at the very top of the file, so
> putting the decl there looks clean enough to me.
>
> (Another alternative would be to see about doing away with __scanbit().)

I'd like to do away with it.  There are only 4 users:

xen.git/xen$ git grep __scanbit
arch/x86/bitops.c:38:        set = __scanbit(*p >> bit, BITS_PER_LONG);
arch/x86/bitops.c:88:        set = __scanbit(~*p >> bit, BITS_PER_LONG);
arch/x86/include/asm/bitops.h:329:static always_inline unsigned int __scanbit(unsigned long val, unsigned int max)
arch/x86/include/asm/bitops.h:378:        r__ = o__ + __scanbit(*a__ >> o__, s__);                            \
arch/x86/include/asm/bitops.h:410:        r__ = o__ + __scanbit(~*a__ >> o__, s__);                           \


i.e. the find_next{_zero,}bit() infrastructure.

For the two real functions, we could convert along the following lines:

diff --git a/xen/arch/x86/bitops.c b/xen/arch/x86/bitops.c
index 22cfb6d8ec3a..009146df92b5 100644
--- a/xen/arch/x86/bitops.c
+++ b/xen/arch/x86/bitops.c
@@ -35,9 +35,11 @@ unsigned int __find_next_bit(
     if ( bit != 0 )
     {
         /* Look for a bit in the first word. */
-        set = __scanbit(*p >> bit, BITS_PER_LONG);
-        if ( set < BITS_PER_LONG )
-            return (offset + set);
+        set = ffsl(*p >> bit);
+
+        if ( set > 0 )
+            return (offset + set - 1);
+
         offset += BITS_PER_LONG - bit;
         p++;
     }



except it has the disadvantage of turning a TZCNT into a BSR when in
this path the "64 in the zero case" is fine.  That said, it's only older
AMD CPUs where TZCNT vs BSR matters perf-wise, and this is a horrible
path anyway because of the hand-rolled asm in __find_first_bit() so I'm
most likely worrying over nothing.

What I don't see is an easy way to make the same transformation in the
find_next{_zero,}_bit() macros.  This accounts for all the other
invocations when expanded, which are quite a lot including behind
bitmap_for_each().


Alternatively, we could have a dedicated tzcnt(), and lean on the fact
that "64 in the zero case" is probably fine in find_next{_zero,}_bit()
even for the s__ < BITS_PER_LONG case.  At least this is a more
targetted and specific helper than __scanbit().

> With the decl moved:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks, but lets consider the above before I commit the patch.

~Andrew

