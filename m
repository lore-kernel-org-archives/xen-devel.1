Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0461606A31C
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 18:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=EARdTGMu
Received: from list by lists.xenproject.org with outflank-mailman.1491413.1692204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT1DA-0002Bs-2t; Mon, 16 Nov 2026 18:13:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491413.1692204; Mon, 16 Nov 2026 18:13:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT1D9-0002Bl-VL; Mon, 16 Nov 2026 18:13:47 +0000
Received: by outflank-mailman (input) for mailman id 1491413;
 Mon, 16 Nov 2026 18:13:46 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xT1D8-0002Bf-7Z
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 18:13:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xT1D7-00EGn6-Jm
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 19:13:45 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6afb47c2-bab6-0a2a0a5309dd-0a2a45088a82-36
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 19:13:45 +0100
Received: from [52.101.56.64]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6afb47d8-f659-0a2a45080019-34653840589e-4
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 19:13:45 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BN8PR03MB5108.namprd03.prod.outlook.com (2603:10b6:408:db::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 18:13:36 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 18:13:34 +0000
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
 b=cN7XmsKAFPmy12zYDVsx+s+M8rE1YfSsLCLHRoBhvYmJs0pBgytnV/ODYXS5zIwOCwDiw/oi1vt61cSRMwxucyj72HdYW79luGEeGQmJnGxExKyGhITK3BR0/xu6OAT6r7zj2ARo/pMCVHxz3CzhipSrC/Qb12ZrmMrIj0KEzy+hdPRP3FIVa0s0YIlZtv+NT6t7584+srGBEeEP6IyGD52oPyYxKfDj5wLodSyVlnm3GVjynVxKSYS27zXn2LujsM2wHNkvZJr8TlZaYMmV8sCCU75lUX0j42lTfZewVGS8xm8xcWHLfJF/JwR4P0nfvwQqjNKD0HQUQAPYyZztuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQII/LRhxE7US7mjD03X5ejFXWdDkDUkgy73tAzfOIs=;
 b=hN9etYe9qbCo8K/4OktkXk/PHhiZbr5X3ZRG73dYthtuwzwFdREXBMlgBG0G7zsbRJflXj0MyaFffJfpTqSwUGr8dETSHZwmu5dTk0Fd1ZhiDhMiI88EyUgm6Wds/e6RYHQ0Eqv4lHhFQ94TtTniyH0AdOF0mLFldDzjEOjVwAETCI5vHLDD5peNi9QEPiOmLBwpu+T1Kzu6/OtAQvO/C8gatj277yGBY73yb0Fd0j6ng2cxP7LBG4o3/uBpPvSUBrZBwZpMMecT7V+71GXDhsmh4WIrmlwQDy880FRn8HaKruDP0s3uQvqcI7q3dniZKdmVoOck4hy9gHJiovBcmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQII/LRhxE7US7mjD03X5ejFXWdDkDUkgy73tAzfOIs=;
 b=EARdTGMupKV3J9AKKXzv0g1JNMKXVfRl/K5p2Whh+dVnlIXziZOfCbdozTMdomyVEsTPEh5b1LksFvadApkss/MKLIvS5OVgZzIHS8ojvsVPcB+EykoNwBILSYTWqXGkI5jI8NO+kj4dzDFDkq+X+s3Fpsi7V1Z2GpGRs/Y1ftE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c31e3a82-ea24-4985-8410-9cda5a9c9681@citrix.com>
Date: Mon, 16 Nov 2026 18:13:30 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v4 2/3] x86/EFI: replace ebmalloc()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <640c0ea5-fbbf-436d-b150-4537cbe98fdf@suse.com>
 <2d45d102-e26f-4e93-a213-b02fb685b6ef@suse.com>
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
In-Reply-To: <2d45d102-e26f-4e93-a213-b02fb685b6ef@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0180.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BN8PR03MB5108:EE_
X-MS-Office365-Filtering-Correlation-Id: fc571143-8517-409d-22aa-08df440d5412
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|261009223027099003|18002099003|22082099003|261026140227099003|261026121527099003|261021121427099003|261021135927099003|261102123227099003|261022105027099003|261028144727099003|56012099006|4143699003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	eETA0TNBMm/qosXdAP1uG+mXgSsrAzJ3HAIUuJqemYotS1EuD5noTq5wv0mwfs905kIRC9JMONUTcv10sA6kqdSCF+sx1gwlLVeCN1Acco6nIm3rMZKIxQaCCSLleA1b2gQ51p8gAkwRzLvv7XqvRZqDviR6NNpL35IG+ZN2l1nTG8r997mXjacd4rgGT82Yn+TCiBjm/ARYu6AIyy/Nm9h5OBmSIKg8feaPUlE2yBXjIem/lSVnLimJu/ArLNnKZnVnzCXC7+rgn49/Ia1dum+H9K60ucs1YD3wnh8Yz+LSl5yRiDnoXrnVilxhbgNldW+1yqALNQeXJN+P8Q+B9/BWahtwhSch+jhfS1R1xItqUhMfyU4lyaXoUZAWJicslK5Cj1/KKlg5tUck/OSaMj09s9OOudIAe3QnO9lTw59RmVrZJZV6xDuBTC15QvwLW9Ntr6qgH6vHDpSi1xzbo7glJdCq91porOsmjcad3+rdRn9xZN+HALFl8ghVqsQYej0f2oI7Odw6cXNZfZk+WDXGYF296RRVHtCFv2Q8PMLA5bBQswT/y+4SWSX4gtW3199OlYBdv6B8ErROJ/jz2oEy9fKhgOfhTWwiDh3uLCQ9bWTDRDnd82LUs2X2mDHJmuBvKVIP9P0eHPdH/+lq5bWzSXefAAxPjIOlOiK/lhY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(261009223027099003)(18002099003)(22082099003)(261026140227099003)(261026121527099003)(261021121427099003)(261021135927099003)(261102123227099003)(261022105027099003)(261028144727099003)(56012099006)(4143699003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dS9CUS9pMzRCQzVvNHRvbzUyNTFYZUVKdkMwTE1ZTEpjUnBkclVzVExnbndL?=
 =?utf-8?B?dEl0OUI0elRkbW1WOTJ6YnVaVGQvWHJDNW9peGFOTjVtR2ZyU0RCM1Y1Nmwr?=
 =?utf-8?B?TDVYZ3pzMG1xalBzVHYyZDUydzd6STEvY1IrNng4RXIzNjhRNFhNb3E0ZWJl?=
 =?utf-8?B?eFpEZ1ZpUDhiK2NHSkpBbEx3TCtSOGw4TmRNSlJXV2M4b3JxZW03MGI3aGQy?=
 =?utf-8?B?YWMwWmcvZDVDc1IybnJkL0d4VXdad1hHUjNhZWp3QXVwMVlYd0JBZCtLaytF?=
 =?utf-8?B?NGkrQkVBRFBCbWdYM3pCa24xVkJ1UGhreWdSYXBRMGo2a0pBNlR3ZEo1U3BY?=
 =?utf-8?B?NUpGZU5CelowWGNxVGtuekkrTExLSWhhR2tFbkFNdHcrbTJJV1JNUmZCalY3?=
 =?utf-8?B?M2hDNUowZXBjSmNxTWN6K1lRUGpVL3dkU2lkbVgvRkZBb1k1Z0hWMlZ1QWcw?=
 =?utf-8?B?aXRTTUdzMHJUZUVGcVd0bU90aGZ5cVJaOXV0NUpPSmNzKzhoYytqQjVBNUlX?=
 =?utf-8?B?a2o0SDRqNTMxeFZPRVVHWWtoemNZMHUzQml3Nlh1dUdBYnpEcEwrS1dNc3Rk?=
 =?utf-8?B?b28wQ0J5allWTU5OTVBROEJrQ3J3NDMxR29VbE5sZW1Oamx6Mlh5U2NyUENp?=
 =?utf-8?B?SUpKY3hBUndsSlRMeExLcUJaNFhwRFRpMklYNSsrMlBxUUJwMGRaS3QrSTJ0?=
 =?utf-8?B?cTh6Ykw5RXNNa2M2UUNNSEIrdE15aEFOTUF2QnNFTlFlY1VDUFFscVlpNnJE?=
 =?utf-8?B?ai9MbVhlOTBBTFc3WW95d2JpVEx3VkpkZTI2VWtjaVR5U2FPUkNKSXZCa2ZY?=
 =?utf-8?B?NFRCdG1RN2NEQ0pScmIvbUQ5ckpvbkQ3WFkxN3pZTW05TDlQWWtPOWpLNWlm?=
 =?utf-8?B?NkgwY2R5SE9rZmcrR24xQVU5UzNBQmYydEJBZlFrRzQzelM3RFJpNjY2czM3?=
 =?utf-8?B?bkhFemlXSEdTS1E4L2FGYlNqZk54cHlHZE9BbUh5UWpiVEc3alhLb2d4TWll?=
 =?utf-8?B?enB6cXFlVmlWa0kvb2szeFBKYjd0N01Sa3NjMGF6QWk0S2pvSC9OS0l5ZldH?=
 =?utf-8?B?NlF3RTMrSUsrSkpvY3pQS05la2Q3NWZ2T2NDZVJOV3JrWmZzN0F2azdhN09m?=
 =?utf-8?B?dGVzZVl1NnBKQjZYb0JtSHMvU0lMSm9HbjhENkhMNGh5NU9BeHpPMlBaY1dC?=
 =?utf-8?B?MWJZMmNONS9BVW5ZUk85TGdnR1Fob1Y0TDhML2VDeWR0WlVBL2xKRDJVTVdO?=
 =?utf-8?B?ZHNKWnFFWUF4d0RZWWNuYi9CV0hCNEN2aVg5UjRLR1l6MWN2TnFHSTdyeDdi?=
 =?utf-8?B?Ny9TOUVLakhuQlQ1dlQ2ZTZ1bmhjMlRiZG80MUVPcU9Nbjl6ZTMwRUFMTWRz?=
 =?utf-8?B?R3FYRVJKVnlYWEhIN1poMk43V3g3NG9HQnJNdGRDRW82cUZKUDVJVXBJdVNY?=
 =?utf-8?B?b3JqK0t0RGhHb3JFcDZCb1I2dmxxNXNDY1R2aXU3ZEhKaEMxY3F3WTVWU2Ew?=
 =?utf-8?B?VjNubmJPbFlyOGJMUnFuUm5PRENua3IyVHBZWVN5UFdUVDhDTTgyYllkY3B3?=
 =?utf-8?B?TFJHeWwybmdpK2ljQUEvOGdFekVwbFhiemUzalNkMDcrZXJpUkFDS2ovWTh4?=
 =?utf-8?B?MW9IUlM5OWVZTEJrN2o1dzRpWDVzVE1iREZEVGh4T0RrOENCc1NNdTBYVGFB?=
 =?utf-8?B?ZzZ3VXpVUEV6MDlhTURwWE1sTVNyNCs2WFMvdnBHTm5tSWduZDZaM0RlL0ZF?=
 =?utf-8?B?UHQrUHB5alhKTW9paHZVK0RvZWppY0RwSlB6YUZrckh5QlNab3ErQkd2bFRu?=
 =?utf-8?B?dmJDZGllUERLbWxHcU1nNEJaK2FJWGx2NncxSktQUk1JL1NRaXJRQ1A2cERJ?=
 =?utf-8?B?cnJjTXB0eTRjaWtqZkRCS0pyK0JPd01UMHUvZXdaL0Y3MFBVV3Q1TzRqNlpI?=
 =?utf-8?B?MS9hM0I5Y2VvTitrU285WnJQVU5leDU0Q2pTeG1nQVFscmZUODNQS0hYaDNm?=
 =?utf-8?B?VnpUNjk2WC9QWk8raEhuVmhiSHVhRzFFNzl4MjRJNFkremZQNkJhMXplYXRh?=
 =?utf-8?B?ZEoyZzEwclQ1WW0wMHo1b1JxYzBIZDNrZWY2UUI3V3ZMZmNBTHRxcnVUeS9K?=
 =?utf-8?B?MlBKazh4TzREcXV6V0lpTGp1MmVpMGpZMXoxeTh3cllMREJld2l2VHQrazJu?=
 =?utf-8?B?aHBNYjZGNlEwS1h4RU5PZkhjQ3QrcFR1NEx3bGU4RGJIcHN3SlpwN0lqYk5B?=
 =?utf-8?B?Y0d1NlJieHFuRExaTU5qMFNnVVU0cFVuOXRISGxrTkQrRXFVaVloS0Z2MTdP?=
 =?utf-8?B?cnhxOVgzU3hGN3ByNGFCamVySm00ZzdQVjNMQnAyNlpHMEhJb0YyZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc571143-8517-409d-22aa-08df440d5412
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 18:13:34.6474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Bet1TSYNl3tDbug8x6iG6oq/dydiggsXLn3Vx1vyZFUAR0bEdkTurB0FW8I16w1t58Ib+DSt4YAVyEswOKi3AgiluPwnh7PFR9v2Pm6ELQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5108
X-purgate-ID: tlsNG-c1860d/1794852825-CF35D87B-58424A4C/0/0
X-purgate-type: clean
X-purgate-size: 4912
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 03/11/2026 12:50 pm, Jan Beulich wrote:
> --- a/xen/arch/x86/include/asm/setup.h
> +++ b/xen/arch/x86/include/asm/setup.h
> @@ -9,6 +9,8 @@ extern const char __2M_rodata_start[], _
>  extern char __2M_init_start[], __2M_init_end[];
>  extern char __2M_rwdata_start[], __2M_rwdata_end[];
>  
> +extern unsigned long brk_end;
> +
>  extern unsigned long xenheap_initial_phys_start;
>  extern uint64_t boot_tsc_stamp;
>  
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1,6 +1,7 @@
>  #include <xen/acpi.h>
>  #include <xen/alternative-call.h>
>  #include <xen/bitops.h>
> +#include <xen/brk.h>
>  #include <xen/console.h>
>  #include <xen/cpu.h>
>  #include <xen/cpuidle.h>
> @@ -164,6 +165,8 @@ cpumask_t __read_mostly cpu_present_map;
>  
>  unsigned long __read_mostly xen_phys_start;
>  
> +unsigned long __ro_after_init brk_end;
> +

I know it's only x86 which uses brk_end right now, but given uses such
as ...


>  /* Only used in asm code and within this source file */
>  char asmlinkage __section(".init.bss.stack_aligned") __aligned(STACK_SIZE)
>      cpu0_stack[STACK_SIZE];
> @@ -1157,7 +1160,6 @@ void asmlinkage __init noreturn __start_
>      struct boot_info *bi;
>      unsigned long raw_max_page;
>      int i, j, bytes = 0;
> -    unsigned long eb_start, eb_end;
>      bool acpi_boot_table_init_done = false, relocated = false;
>      bool vm_init_done = false;
>      int ret;
> @@ -1523,7 +1525,7 @@ void asmlinkage __init noreturn __start_
>          /*
>           * This needs to remain in sync with remove_xen_ranges() and the
>           * respective reserve_e820_ram() invocation below. No need to
> -         * query efi_boot_mem_unused() here, though.
> +         * query brk_cease() here, though.
>           */
>          xen->start = virt_to_maddr(_stext);
>          xen->size  = __2M_rwdata_end - _stext;
> @@ -1667,20 +1669,12 @@ void asmlinkage __init noreturn __start_
>      if ( !xen_phys_start )
>          panic("Not enough memory to relocate Xen\n");
>  
> -    /* FIXME: Putting a hole in .bss would shatter the large page mapping. */
> -    if ( using_2M_mapping() )
> -        efi_boot_mem_unused(NULL, NULL);
> -
>      /* This needs to remain in sync with remove_xen_ranges(). */
> -    if ( efi_boot_mem_unused(&eb_start, &eb_end) )
> -    {
> -        if ( !reserve_e820_ram(&boot_e820, __pa(_stext), __pa(eb_start)) ||
> -             !reserve_e820_ram(&boot_e820, __pa(eb_end), __pa(__2M_rwdata_end)) )
> -            panic("Failed to reserve Xen in E820\n");
> -    }
> -    else
> -        if ( !reserve_e820_ram(&boot_e820, __pa(_stext), __pa(__2M_rwdata_end)) )
> -            panic("Failed to reserve Xen in E820\n");
> +    brk_end = brk_cease();
> +    if ( using_2M_mapping() )
> +        brk_end = PAGE_ALIGN_2M(brk_end);
> +    if ( !reserve_e820_ram(&boot_e820, __pa(_stext), __pa(brk_end)) )
> +        panic("Failed to reserve Xen in E820\n");
>  
>      /* Late kexec reservation (dynamic start address). */
>      kexec_reserve_area();
> @@ -2274,7 +2268,6 @@ __initcall(init_xen_cap_info);
>  
>  int __hwdom_init remove_xen_ranges(struct rangeset *r)
>  {
> -    paddr_t start, end;
>      int rc;
>  
>      /* S3 resume code (and other real mode trampoline code) */
> @@ -2296,26 +2289,10 @@ int __hwdom_init remove_xen_ranges(struc
>          return rc;
>  
>      /* hypervisor .data + .bss */
> -    if ( efi_boot_mem_unused(&start, &end) )
> -    {
> -        ASSERT(__pa(start) >= __pa(&__2M_rwdata_start));
> -        rc = rangeset_remove_range(r, PFN_DOWN(__pa(&__2M_rwdata_start)),
> -                                   PFN_DOWN(__pa(start) - 1));
> -        if ( rc )
> -            return rc;
> -        ASSERT(__pa(end) <= __pa(&__2M_rwdata_end));
> -        rc = rangeset_remove_range(r, PFN_DOWN(__pa(end)),
> -                                   PFN_DOWN(__pa(&__2M_rwdata_end) - 1));
> -        if ( rc )
> -            return rc;
> -    }
> -    else
> -    {
> -        rc = rangeset_remove_range(r, PFN_DOWN(__pa(&__2M_rwdata_start)),
> -                                   PFN_DOWN(__pa(&__2M_rwdata_end) - 1));
> -        if ( rc )
> -            return rc;
> -    }
> +    rc = rangeset_remove_range(r, PFN_DOWN(__pa(&__2M_rwdata_start)),
> +                               PFN_DOWN(__pa(brk_end) - 1));
> +    if ( rc )
> +        return rc;

... this, it clearly needs to be common in order for other architectures
to start using the allocator.

So, I think the variable ought to be in xen/brk.h and common/brk.c, and
with that, brk_cease() can lose the return value.

I know that's yet another change to both patches 1 and 2.  If you're
happy with this suggestion then consider both Reviewed-by: Andrew Cooper
<andrew.cooper3@citrix.com> in light of those changes.

~Andrew

