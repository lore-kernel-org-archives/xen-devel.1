Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B80CA5FA5
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2026 09:09:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438076.1656968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCCnO-0002Uu-IJ; Thu, 01 Oct 2026 09:09:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438076.1656968; Thu, 01 Oct 2026 09:09:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCCnO-0002Un-FX; Thu, 01 Oct 2026 09:09:42 +0000
Received: by outflank-mailman (input) for mailman id 1438076;
 Thu, 01 Oct 2026 09:09:40 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xCCnM-0002Uh-JM
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 09:09:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCCnM-002Cur-02
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 11:09:40 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6abe234b-e002-0a2a0a5209dd-0a2a4502a95a-26
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 11:09:39 +0200
Received: from [52.101.193.24]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6abe2352-6ca4-0a2a45020019-3465c118c298-3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 11:09:39 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by PH0PR03MB5829.namprd03.prod.outlook.com (2603:10b6:510:35::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 09:09:36 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0451.026; Thu, 1 Oct 2026
 09:09:36 +0000
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
 b=oViETWztlD4suz7dFROb77/Pm34+2GZ7F6axld7UNiJoRucTxLfVB7y8SNmQc4y8XzkGMeXBjyhGydTqky4a1uEU5yP+dw7qVbAEIA+p4opoLjnFL2eULJFjIeRxxFKRAf/4Cyf0R7hQfb5+PCVtjuUxp6fiv4ZWSriDGaANHwYYSpk0YBOqXEwHwD3B4CE0PWEMMkuNYuO/60rPWE356ufcCwvdiHjZRWZowznrPJaKDwyuzXtjDpeODpQVSgd9asiS97aurxiCnTWku7QvfWPr5jY0U13SHXZKtOw959QVzXCHVcd4OI4oiErl4az1bSZDR5fRTgntq8doIwQtXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQMjaMOgafB7AEJcxnhpWBxHpfRZ5edNXFagzd889gw=;
 b=Ot4Y9j0WCZB4TbthV4Z1zTDqaRTGn2p6GhBRfZ4WqqOPVcgk9HGp+Bkw8KzAWozYQVo0hPJIrYixX+YcEuoB902hoCTBI7oTxwErpD/II3OBNZNtm8BWw1CuP1sUeBxlJ7UVyH9Cg6qhmwx6RNRDjmNAx7Q1+K5J9EKVrOPVkxMAlDci66nj51Pe7kEkN5uvhue0mADAOH/oTiBJV1DNEqhTnZXtmUpzKBGxeoflh60c/IGehFzTvB66xn9YyayQHPQ7Td3iMZLRZhnXjUq7+c+rgFM5m9aNShvDKDBKpctjvKhBG+QDjFyCbqR9E70q1SfUQKd+9ZdjAyjwc2AYnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQMjaMOgafB7AEJcxnhpWBxHpfRZ5edNXFagzd889gw=;
 b=MqVdZ+q9cGaSd5HuLqp/9Fs3DyGhHVn/oVNMxYvriSt78p1diNLICq/RMhTTsWvKJ7cmWtOH7++WQIMrePf2R0Q1PZWdhQ/WYO9FUM8VIY1KULWLF9C3MTgN+3AJapxVAjonCypWWtvqShUcJYpHS7n37oD4FHQn3lDU34Ds/+c=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <08292fa6-de51-4456-b64a-9949e009d6ee@citrix.com>
Date: Thu, 1 Oct 2026 10:09:32 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/x86: restrict XENFEAT_pae_pgdir_above_4gb setting to
 PV guests
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>
References: <20260930191104.78141-1-roger@xenproject.org>
 <a9d59bc1-6e21-4a8b-84e5-6daac02997c3@suse.com> <ar4Z4EQo7FulrZXF@Mac.lan>
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
In-Reply-To: <ar4Z4EQo7FulrZXF@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0460.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::15) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|PH0PR03MB5829:EE_
X-MS-Office365-Filtering-Correlation-Id: cf13aa3f-83d2-4bc5-e2d2-08df1f9bb706
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|22082099003|18002099003|4143699003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	KnjCaRe9UHq64YaURDz7u1SxnQJ8AxD0Rl6BivjsqiVJoQqxI/TzkHIvq4xXYQWoBJlF46YVTrlFs5j0IWTm4/UuXr43i3w6I5CKzRAF5rgu8bLb5DMP4oRryFxh99AKJJo/rnjDfmkXbzvT/sGH0P5Q4kjbWYKBI7EZ5WPv3QbDfrNnFxNsg2C/jMNaWfKb2SaBQk1yNUt9OSFXLF0Jh/dXUNycm4GSGgeb0YlJhnlu8KjyBx6VpZwcUtHLV0iTgdCrByh7s3xzmgcniwCByr2hMgJoJSI/u/Q/ht5Ai06yo55NCWfGOhh8ydbo9ZWXjR0iKZ1m9x8amWol0p/6hvhtkF7xcFCpLmYLtiMgyH6SV596yPB8JeZdlpen7HwzrZPiMGDWZK71b/nL8gz+V0vUBIotzfPYwiDr3tREQS5A4Toe5lkxj5fqHJkQo9aYKdlwW1ciptU7th5D3WVBf/ta4QG+inwwnylQ/aVCFQ7azdTU7YM1tMAARg86JDTPJ2OkHZbvUcDpkj2j2IZDayIT8EzMxtJlv8BzOdY6+6Cajt3ylJDgeVhOJNnxkxCZoeKhb5lq3Weq7/S4A6hWz7Fy6d47q/jVe3lBtmmsRZYJszsLYak97JEo1SXEPfwvJ1UggmqrC4qni1/N2EVTcdWggPYFp0Qukf2Jx3A6vn0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(4143699003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0dtNk1MVkxKWDlCQjBkVHRsVTQ3Mk9iZk8wNHFQYVpFQStTNmR1TG5pOCth?=
 =?utf-8?B?dGp6bmtmMUEvc3k0c1dSVkM3SktOSkdJZmN0SFc2YmpiZmtSNnR3dkVGeE1Y?=
 =?utf-8?B?TW1Yd3gwcEFNeS83RWNQbHVVcGMzd1BoVEtJZExuRjBJeTJUWmo1UVpWMEdK?=
 =?utf-8?B?TktVYVFHdGQ2Q21TalFpMEloVHlPNFIyeEJuYTBIclRqWi9KaTU5dXFGUnZK?=
 =?utf-8?B?WVhoS2RFV1RUNHgrZGRtNlk1MmR2dGxaelUrN05xNkpUYVBlY3oxaGMrNm0y?=
 =?utf-8?B?cUpFVXdUVk43RnJ3OVU5dEdIa0Q1dmR4N2pRcitqa3ozaGJmUUZkVDdyY3dN?=
 =?utf-8?B?OFZ6bmIzUUJYSFJvRU13Z2VabXVzaEs1bTJ6S1VwRFUySjVRdXVHQ0JnZlph?=
 =?utf-8?B?SlNSZHkwTWJVdWo3UllHbXZHNmxXZEJuR1p6RzZwdm8zMjMwenppQXc2SG9n?=
 =?utf-8?B?NTREd1FPUXcyOFpkOVAvN1RlRzZGYXQ2WHd3TWZQYVpENHZxcDk3N3BaVmNB?=
 =?utf-8?B?cWZ0cUpOSU1qUk5taGd6anA0L2xObFZIa1ZrWDRrc2ZFdCtCZEtyNHBvZml2?=
 =?utf-8?B?YytmRXM3ZHZPbVZOWkRoVXAxMUlnSW5FSW5XYno4cForbDF6QTZic3AyR1Vk?=
 =?utf-8?B?WWhERnFSNnZWYzZYZXN6cE5rUitMN095eEJPaW5CTTdrNWdvWi8yNXYvZjZv?=
 =?utf-8?B?aTJJdXg5enpFbmJSL2xDbm9laW9CUlVMOS9lek1hWWlqb0gwQjk0SmhqM3JC?=
 =?utf-8?B?ejlUSWZZT0dCTyt1amVmTUFnNStQb0lZMm0yYXE3VVY4SXhJcTRIblpZd2N6?=
 =?utf-8?B?WHR6N2hKbzBPT0pUc2haaFMySGJQVUYyODRwaVJ0OE02bmY5UHVLQnNKSkNR?=
 =?utf-8?B?UVFqblpHYlpmVERtRk1IYlpsa1dMRDZZNVVWeDJHaG1qYWhBeFdydU8wUTM5?=
 =?utf-8?B?VUMycEFJb1VRTWdoRGpxNUtKTW1mK0tJaGJ1a0xtSFlJTytBK3Vqd2xqV2JR?=
 =?utf-8?B?cTdvMjR6S0JoaUV1RmhCNUdXQkdiOWJRSWVjdTVvSGNJYnNsNW1sQ3dkM3E1?=
 =?utf-8?B?M3lPbDBzQkI3WmRrRGNvUGswTVloWFZlUitpS0J2UVJVY3dvTHZVbEI3Y0lB?=
 =?utf-8?B?SlAxVUJNYmxrNFRHWVNpNkgrUXZVVE9uMjNlQytDTGF1d2dNS2JwTUVNd3Rv?=
 =?utf-8?B?TVlOOXlHSUpDNG1ZcWVQUCtycUhvRi93NWpURkg3cEMrUlNtVTV4WjAxcWNC?=
 =?utf-8?B?a0pZVTdKRXR2a3ZjVGVBTzltem5KeE5OcjNxNGs0eXNneU5ZQmlsV0kvbTE1?=
 =?utf-8?B?OXVyTUJuWi84SW5ldm1NRmRyUmVaVXRGM0REZFRHbmwwQk4zSEpLckN3NTJC?=
 =?utf-8?B?cnFrT1VQalRZSkpYSkNCV2g2cUhMbGdpOUJxS0dzRUQxUU5vNDNBWk9Jc2Rq?=
 =?utf-8?B?QWc1c3J0cFN2UDJGR3FqK0Z2Y2dCZFY3K3NtcFAxOW4wV0pMMFo3K2dzRWQz?=
 =?utf-8?B?WCtDaVZOSUNNTmlBNXBQNVB6NC92djFkRVBIb2JQc1AyMXZSK3h1SWpSZ2p1?=
 =?utf-8?B?L3NISUEya2ErQjlsd2ZUemxyZi9wUWVlY0JvMEY3aVJpV08vMmFQdVNLRUxT?=
 =?utf-8?B?Smx6YlN6TVNiSVdOUFJmUmlWUzBFTG02RmJOM2hsaXVoNnFrcHRCLzJLSno3?=
 =?utf-8?B?TEFlcG1tVVorOTRTWXAzb1RiNGVUTUVnYzBXSWhwbmdYOWVqbTRTNlIzU0ZL?=
 =?utf-8?B?ZTRUZUpPN3lXTVNZMUxvdVJIcWZBbE1lRzRUOVRJdFplQlR3TXRvTkEzUndo?=
 =?utf-8?B?RHVSOFdPZ093U2FNZnVJa0MxWEIxYU1WbWV1aFFTbFZKUnp3VWFDdmdmTmFY?=
 =?utf-8?B?S2xvdlRRV2VROFFVUEJBY2psVVBPalI4TFVDZllSK2Z3czJMRzgrRGFMZlRa?=
 =?utf-8?B?NnFTc0pKK1dZUHZpa2VkV1Z6TytRVm54MzVzcGorVy9WdDFDS2xEM0prNEx6?=
 =?utf-8?B?d1FvNk52UmxKWWRSdFN2MDlPSkI4ZWJYYk5HYi9OamNoZGp1aWhEeWxTTGxJ?=
 =?utf-8?B?cWNHeTVRT0ppalRCYWFPSUp4QW8vTGpGaERWZUlDTUU1UTJEZzczVWs3cjVv?=
 =?utf-8?B?N1phUHF5a2xVb2JVYTVLa0tFK0szVFRiK0xUR2M0bmpIckdsSWxzZi9VYTV1?=
 =?utf-8?B?a0JXTTlESzVGZktHN0Y3WDRPeWxFbEVyd0orM0RsWmlwZTQ2dzFGWEIrd3Ez?=
 =?utf-8?B?aFlyMjQyNDFFR2NsSUdod21oMUN6d0Q1RmtmYjdIdk9OWitodkl1VU9aeS9Z?=
 =?utf-8?B?ZTl4Zys3MmlJdEd5ZEJCSkoxQWlTcmp3TFV1dE1qZXdYRVQ4UzFmUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf13aa3f-83d2-4bc5-e2d2-08df1f9bb706
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 09:09:36.1784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QJqEKgegvHoE1hueCJ5cjGp6ZuWbUX8Ll4GN7boN7frdb+MNs/1aCEWoWs5DxffA+VS17pfE+RfpXhxW0FQSKeot8RliBtpg+8SNOaI3/H0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5829
X-purgate-ID: tlsNG-720697/1790845779-F1EAB2AC-8C07FBD9/0/0
X-purgate-type: clean
X-purgate-size: 3569

On 01/10/2026 9:29 am, Roger Pau Monné wrote:
> On Thu, Oct 01, 2026 at 09:34:34AM +0200, Jan Beulich wrote:
>> On 30.09.2026 21:11, Roger Pau Monne wrote:
>>> @@ -692,7 +690,9 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>              if ( is_pv_domain(d) )
>>>                  fi.submap |= (1U << XENFEAT_mmu_pt_update_preserve_ad) |
>>>                               (1U << XENFEAT_highmem_assist) |
>>> -                             (1U << XENFEAT_gnttab_map_avail_bits);
>>> +                             (1U << XENFEAT_gnttab_map_avail_bits) |
>>> +                             (VM_ASSIST(d, pae_extended_cr3) ?
>>> +                              (1U << XENFEAT_pae_pgdir_above_4gb) : 0);
>> Nit: Unlike binary operators, which we want to have placed at the end of
>> wrapped lines, we generally prefer the ternary operator to be wrapped
>> differently. E.g.
>>
>>                              (VM_ASSIST(d, pae_extended_cr3)
>>                               ? (1U << XENFEAT_pae_pgdir_above_4gb) : 0);
>>
>> or 
>>
>>                              (VM_ASSIST(d, pae_extended_cr3)
>>                               ? (1U << XENFEAT_pae_pgdir_above_4gb)
>>                               : 0);
>>
>> This isn't written down anywhere, so I'm not going to insist.
> I had it written as your first proposal, but then moved the ternary
> operator at the end of the line as I've assumed it would be prefer to
> match the position of the binary ones.
>
>> Furthermore, wouldn't it be plausible to also add IS_ENABLED(CONFIG_PV32)
>> (or, imo less desirably, opt_pv32)?
> I could do:
>
> if ( IS_ENABLED(CONFIG_PV32) && VM_ASSIST(d, pae_extended_cr3) )
>     fi.submap |= 1U << XENFEAT_pae_pgdir_above_4gb
>
> As I think adding the IS_ENABLED(CONFIG_PV32) check to the previous
> expression is too much.
>
> Let me know your preference.

diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index f4bbd8818fa8..6811599f95fd 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -677,8 +677,6 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
                         (1U << XENFEAT_vcpu_time_phys_area) |
 #endif
                         (1U << XENFEAT_runstate_phys_area);
-            if ( VM_ASSIST(d, pae_extended_cr3) )
-                fi.submap |= (1U << XENFEAT_pae_pgdir_above_4gb);
             if ( paging_mode_translate(d) )
                 fi.submap |=
                     (1U << XENFEAT_writable_page_tables) |
@@ -690,9 +688,13 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 #endif
 #ifdef CONFIG_X86
             if ( is_pv_domain(d) )
+            {
                 fi.submap |= (1U << XENFEAT_mmu_pt_update_preserve_ad) |
                              (1U << XENFEAT_highmem_assist) |
                              (1U << XENFEAT_gnttab_map_avail_bits);
+                if ( VM_ASSIST(d, pae_extended_cr3) )
+                    fi.submap |= (1U << XENFEAT_pae_pgdir_above_4gb);
+            }
             else
                 fi.submap |= (1U << XENFEAT_hvm_safe_pvclock) |
                              (1U << XENFEAT_hvm_callback_vector) |



Please don't try to be clever trying to fold this logic.   All that does
is require someone to revert it later when it inevitably gets too
complicated follow sensibly.

~Andrew

