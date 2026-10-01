Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA96CA5FB3
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2026 09:49:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438110.1656997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCDPi-0001pI-Vb; Thu, 01 Oct 2026 09:49:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438110.1656997; Thu, 01 Oct 2026 09:49:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCDPi-0001pB-RE; Thu, 01 Oct 2026 09:49:18 +0000
Received: by outflank-mailman (input) for mailman id 1438110;
 Thu, 01 Oct 2026 09:49:17 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xCDPh-0001p5-7t
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 09:49:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCDPg-002Jhf-1C
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 11:49:16 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6abe2c93-e002-0a2a0a5209dd-0a2a450ce6ee-24
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 11:49:15 +0200
Received: from [40.93.195.34]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6abe2c9a-f479-0a2a450c0019-285dc3226cd9-3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 11:49:15 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by IA5PR03MB989652.namprd03.prod.outlook.com (2603:10b6:208:607::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Thu, 1 Oct
 2026 09:49:12 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0451.026; Thu, 1 Oct 2026
 09:49:12 +0000
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
 b=EtVA8vkESfONQh9rO/pAtCYpxz2r0WLDYT97vdUNgvcJ7V6v03eH4JqO9lhuRt3AxU957x+HvT7Y71pJy2HFyhfkcUsrKikZkinOMDYLHwAkQ2iad2k4WH5CHVhE5u3aUJ/U7DAyRXnYDxe7qTSXviD1HY1LplQAOn56z079r2ds6JWPeInXipKYcMvUWZl8iH8rsUvim/4B0bo38dz1jysbaTmC5Vou8xsXrT4PVoVLpbovE8iUaVK27yNxn1XT47s0w/VDNaqBfQL9c6G0+C7ZErwv6prQbawkSah32Ps+z+5jooKB71Hlmpf/wwVJedCG/heG3fAI89+/CmDEqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=alW3KgWMIZx8AhQamkVaM+EsAL+i7cUwno5EnsQVWjs=;
 b=MUK4V33bC26l7o7XTfciVg9/SR5Zy3hxtAJoRN2znFLIvITYvhKHOdRFLwkUCrxMIqkccQAIruOuU/+91+1Lm0A/CrFmibv4/msZhHPHC/yf20OWsQ5lEbDcFf814Pri2WmdcHjHjzGot0QAyigLBwHxrIoJTICExnxImLM2lOgQpznmS6EIDjFRMppQQsPNY/X1cDcS3Ad4gwkvcLGY1wMqPpo2/C8BigZoxbHL1fGsoCKDg1dk/Z8pfaFVcVM7vBlmQHDUyTBIopZWelNGgPhartt7YJn14AeuA2P5QCS3QwKLW27ZT3CuXyx12MUDiq9bId/Ml3bdGaunRn4QqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=alW3KgWMIZx8AhQamkVaM+EsAL+i7cUwno5EnsQVWjs=;
 b=eTkFpL5KiCeqNxmyx5SsU431rakbeDg5NJcuvTEtqiwGC/RlMTRez5PXZEoXGRkymOCNleVGTzpc7j+5eUqPmh+6b+Gu22PSTQ02oPv1L5nF9TcfbP+oLzRgf7TLVsqNr7LDon1C3ycMO5rQ/cvm+xtuWaKFzeZqS7VoBmIdHaM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6fa85b18-acba-47d1-9493-ead2f09ef127@citrix.com>
Date: Thu, 1 Oct 2026 10:49:08 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] xen/x86: restrict XENFEAT_pae_pgdir_above_4gb setting
 to PV guests
To: Roger Pau Monne <roger@xenproject.org>, xen-devel@lists.xenproject.org
References: <20261001091921.94138-1-roger@xenproject.org>
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
In-Reply-To: <20261001091921.94138-1-roger@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0611.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|IA5PR03MB989652:EE_
X-MS-Office365-Filtering-Correlation-Id: 22c0660d-3655-4469-057c-08df1fa13f1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	kdfkzXnrywQHY64c9jrCVezuVqCDpB2OVxQ9sR09n+9YWb6kRnA6U8TDdC613zz8SW+1WZK1acLIoap6gM8or7dWB4bPuwkpJfexgEpNKmc4N5TSoxqClrhIZTypEB/L3121utJSyy9gZpwjxBN+05/blu70AmkS/8yKnWFKfaBAEx74ltiLrSpgnXgZzEodWJxc+8ttt1dOzqXkOPKCeMF5rCgRmGCtLKqIW0NRVFszU8rqD6i6R8+IpDmXdwgnhHfY8hkPmiUYgTWspAjBaT9ejWuEUwxCSXinutXDsYuKK2q5DWio2snX4t3/TQmyDA2e3tZxu0x/5+jVJvvIXXatQEqSzs8SmvOYIZp333UfCX9bTXxsstCEHpJV2KgQgwqMJs8LEcBezBGVJUNFWFemK247iVMp75shc3Kw6icyxZkSOb3AzWVdOr1uMrgJKkXCBmlq1VITyV4sBM30rZwtqkdPTo/JzNedgx/6i4MLlGB43wLF78LeGlla/FNhLc/ENQIXHVmSFFedfYNEjDyiyxmkGTx/mxCOlH97e01hM2Lu5GJZe3s69u53yTDVvVfVUNKMFkKuAQxrwZg12MWktP6I9kMJeYPCLR98k43+mNw+ko7k+d4T3hkIG907+N9dIhLLdfi5Plm6cbVoNxXNWU/FGWlxsx10I3pi5Wg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWtLdHhMWWZscXkvRHZNR2Rlc3JRSkUxN0FhbDg4RXBtNWJIMCt6a3hzNkxs?=
 =?utf-8?B?MVRhM0l4c3g2dkpVTnRMV09aNTJoUEtaM24vVm94UHR3RFl4UUFySUgyekhN?=
 =?utf-8?B?ckloU2Z5R1dGR3gxeGFwMnpvakNaUHo3MHJsNktiSzBVQ3MvWnVKWFowNkZ4?=
 =?utf-8?B?dmYvNzZsNmNoeGljRE9ITGIyNUdCQzNTbEFjdWhQN0JNTzkwNUVZazkzK3N2?=
 =?utf-8?B?dVRmUGdicXMzZUtvaHZ5RG5TSWc3dGJOdU0ycVlDRzJWOXpOb1kwbDl6WEhx?=
 =?utf-8?B?RnBqZTV4ekNXZnFkWmxxUXF2RjNqWHg3VlVRNVdDempIRWVLMUljRFpxRjN3?=
 =?utf-8?B?T0gyLzhnTmNmQVE3dmJQRHVQUWV3cFRFUjZ6a1FqekNBeWFKZ1QyMDZRMXVK?=
 =?utf-8?B?SGl6WXJuU0JuTmJZRnN4dmNmdE1OQ2YxRHBiQmpxK1hvY3I2czkwbVdHdXlE?=
 =?utf-8?B?NFh1MUpRb3ByckQveTJCSXR4QnN0V1l3MEdudzRtWEY2NFF6Ums5SXJFSnRn?=
 =?utf-8?B?Mi9td0hjVTZlYW96bHlXVEZUOGpEWUlDQkZVK1luUlNBMUNQKytubUt3YlZ0?=
 =?utf-8?B?d2dPL2lKV1lDSnNKQjRNcWQ1MEkxZGwzQXY1bjlNN3BtdnV2T3VVdTAzMytl?=
 =?utf-8?B?cnBTSzc2a3gxMnlBZUZaakNrTVk5aGl0Q2JjTlZmVkRKQWVSZDNiYnlZWDFp?=
 =?utf-8?B?WXJjeTZZVWZ2L2svcmNIZFN5NDM3WC9UQ1dQSk5JczRVZ2VDOFo0a1hBdG0v?=
 =?utf-8?B?UjA3cjQxWHE1cStESndGcnR4aDU5U2FveUNPeHl0VWhPdFVSQ3lvbFgvOWt4?=
 =?utf-8?B?R1BBT1BvckU2dFZxL3l5REdQTFdZbkxJZGwycWtycHZ0OXo1NGFoQnpKYUZC?=
 =?utf-8?B?d0cxK1lWVkdndDA3YjN6VHY1WndGeG9yaXF0YUxWWGZYWTFHNVMwMCtzSFJp?=
 =?utf-8?B?YVYwNFV0eFNkWm4rNTM3NE84WnpkOHZ6NTdEU0NCRjRxZFFESkN4RFZUUnhl?=
 =?utf-8?B?d0xZNVlraDBnV3NxUWEwMjk4aEJFSFQvKzIrTmdJUjQ3MmI4bWZEZy82OFk0?=
 =?utf-8?B?OUU2R200QjNWUmNRUFJnVlEwT3h2aEpJa2M5dE1JaWtOWWJOZ2M4Z1h3ay9t?=
 =?utf-8?B?a2pqTXlNek1XMnhJUCtkeXByYUZuT0FKNkt0b1ZsdjdVQTF4c1VUMmpIZ2cy?=
 =?utf-8?B?eFJJUkVaMWc5VzlRSUxWaU1IcWpDTnV3YW5TYk50S1h2aEhzYWU1c0RiSlJV?=
 =?utf-8?B?M0pPSWRuY1NLK0M3MzQrelczNHoyWTlzRXNxc1NqOHdIWmR5Y3pZb1pJYzlZ?=
 =?utf-8?B?ek9EaWwvVTBndDhNVkFzRHlQZGVUdkNTcWlRems4RExzM1RXcFc1c0doSDQ2?=
 =?utf-8?B?eC9ycis2Wk0rWG1jQXErWldSQVBaNmhkQ2R4MzJ1SkprYmNEV0xRdUtJOGh6?=
 =?utf-8?B?R29adXRpeUR4cHdGM1ljNXMwSDlVSnZrNXIzckUyNDl5SHI3WU5VWXk3NzVK?=
 =?utf-8?B?QXdrR3VxM0ZyQ2F6eDBVM1ZucURmSUtJcVFmdk9HUkw1WUxVUXVoZU9xbzcw?=
 =?utf-8?B?dFMrY2x0NGg0V0N4amhKek8zUHBmSkVsRHZQUEVNVmJ5TjRaUzV1VThwVzdx?=
 =?utf-8?B?MXE4S3JvZ1I3ZjFFSUt2REZsOUdSZWJZeTJZNmRvaHVQQmEvY3ArMnhGRlpl?=
 =?utf-8?B?aDBMRGJPY3IwS3E5VUdJekFLTGVHbHF3eTFCM3pRK2x3UVpCd2xpTk5yT0FZ?=
 =?utf-8?B?QkVNTzFiVDFoZFZUQVFXWGJsYzJLK0ZEcE9VMzlXSjlackxyQjVNTmtQZ2R0?=
 =?utf-8?B?UHpFTGUwU2VxSGQ1MmE2RUJrZEpyVmprdTFrUzVENjR1WlFMMlIvVU5kcStR?=
 =?utf-8?B?UzlLZGpIZnQvRWZHMEhNTWhRajNKSFkrY1pscFh3R1hVSGd1czlSMDJtbnhE?=
 =?utf-8?B?ZjRhQXdaMEdjU2N5aDJNRlBlaHAyaUFHUTdJTUx0THJHb253bXpKa3NHb2s4?=
 =?utf-8?B?dU93dEVibGl5UStvWVNWOHRGYTFlNTMvQ3ZadUw1ZUZVRnVRTFVDZWtLQkg4?=
 =?utf-8?B?UCtFZThJS1JyQ0Iydkp1OUUyTk4yQmZ6V012RkFZY0dWS01mWFFFVjQrczMr?=
 =?utf-8?B?dUxvSmk0U0lHNzhvY0lZQ2lzRThTS2JERkcxdnZiS3lQWWN1a2tOSysrdyt6?=
 =?utf-8?B?SzJxdktUSGlaQjhJczE5a2RiNUdxUk9UUy9EdW5GNHVMRERxaGtyWXhOcVd6?=
 =?utf-8?B?aGlkaEZZb2xQZU84ZmtDWXk0U21zTWZiUUw1cnM4RnRRUkcxc3VPK3htcjlG?=
 =?utf-8?B?YTlORnVhS2hzNjJkVzFwREhaZHBjWEwza0pJVVBuNjVHWTVSdEcvZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22c0660d-3655-4469-057c-08df1fa13f1e
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 09:49:11.9794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ByGW/aNr0YvU4++dI7NHvZWQZvpcioln0kS087oPeWmny5LNns1/S7eIh2KSCitNHLzAtYkcCmoxdm1METtsMYKBYIYlVh0H/40lzRzvTw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA5PR03MB989652
X-purgate-ID: tlsNG-d25034/1790848155-03AD4A5B-2451742D/0/0
X-purgate-type: clean
X-purgate-size: 400

On 01/10/2026 10:19 am, Roger Pau Monne wrote:
> XENFEAT_pae_pgdir_above_4gb is only used by 32bit PV guests, hence limit
> its setting in XENVER_get_features to the is_pv_domain() guarded section,
> with the rest of the PV specific features.
>
> No functional change intended.
>
> Signed-off-by: Roger Pau Monné <roger@xenproject.org>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

