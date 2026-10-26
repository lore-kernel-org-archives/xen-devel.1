Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E68560A261D
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 12:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=tPoheoHM
Received: from list by lists.xenproject.org with outflank-mailman.1461258.1672239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLK3y-0007pC-DW; Mon, 26 Oct 2026 12:44:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461258.1672239; Mon, 26 Oct 2026 12:44:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLK3y-0007p4-9g; Mon, 26 Oct 2026 12:44:30 +0000
Received: by outflank-mailman (input) for mailman id 1461258;
 Mon, 26 Oct 2026 12:44:29 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xLK3x-0007oy-HL
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 12:44:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLK3w-0073VM-N6
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 13:44:28 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6adf4b2c-e002-0a2a0a5209dd-0a2a4505dd78-0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 13:44:28 +0100
Received: from [52.101.52.52]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6adf4b2a-4cb1-0a2a45050019-346534347b7b-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 13:44:27 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA0PR03MB5612.namprd03.prod.outlook.com (2603:10b6:806:b8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 12:44:24 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 12:44:24 +0000
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
 b=hniKO16MqvuLtZq9tLexzSiQ3XB1tXNdSz2VHAnPMLJVTfWCE4TIChQB1u1/uZzb7OA9M+dQNreVZxFjsjOLQreP8JhYlTERcR6CkpZaJtXWnCXlkT96opM97+4ydCv0dsz91LbERdQ73nu1ZJkXJd4LWX0M7fXKil+t7EuCuotQOvAPxC0Ws8g2O5dAGWcWogHIUwjzn6k14gne7xZerTBOwRKoILtTd7I2CoXAMutQyCgt0PzgH/saGpn3V86PKlFHlBHwlkIKouliX5UK3zBg9z79IvRxCs+SeCMdFTcUiutl5nsWIdUsn0GAd37okB5g13nhXrmD8UJeLTZC5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2AF6Dgqzg7xsQOZ3aEJveKiggQcWSgysRWMaFgu5ZEA=;
 b=zDxbeAxTP3rCG+1XBU732jHnjLm+0uqZUqX2lFBFgMQ9B5uQxYjUeZrOgvd3zBFdW2VUK0rLNC/6KAYpQAne7te+WYPkvh1FF+FAI2rkG0RS3Mq9ALI7RHdhryDrE/p/D06Ni+XqVJ4K7N74i0d+XUi/yfH6NIt5dhgUVQ5naL0zfJMARAACbRgCd7XuANcteJhTFAWaIc/cU5pyqbLtH5Tcv+ZrayQOhAePMPujgI3aYVN6xHarOW5OMAA/TyuJIdxzH3vLZJpU/4T4vZ9M0Tq2dm/8tV19fagLESOBwWCqNjQVvdCQR9fIz+MYpP/v+3cFjPfI5Ifa0gl8n3HG7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2AF6Dgqzg7xsQOZ3aEJveKiggQcWSgysRWMaFgu5ZEA=;
 b=tPoheoHMPCkVPZPjeWDeMf6umVoQpgLkVPOvWr2NEE7bn5QP7KLrwUvhdnBnSSlITiIygXwcLPYpWljYma9SIFElN4rz/8dA00gHFtpr1dpY2CPqLDBq5WxFeEjBU4k82Q5Z2LY4BDsfa6YLSuj0pja3AO02Al1OweW/6FXum7s=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <bbcb140b-5aec-4dd3-9314-b31169360973@citrix.com>
Date: Mon, 26 Oct 2026 12:44:19 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Rahul Singh <rahul.singh@arm.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v1 1/3] vpci/msix: move helpers to common
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1793012250.git.mykyta_poturai@epam.com>
 <688f3bb393590fc5bfb54328112fde1359bf44c4.1793012250.git.mykyta_poturai@epam.com>
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
In-Reply-To: <688f3bb393590fc5bfb54328112fde1359bf44c4.1793012250.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0004.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA0PR03MB5612:EE_
X-MS-Office365-Filtering-Correlation-Id: d7c7a6fd-1817-4406-d4da-08df335edd46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|18002099003|22082099003|56012099006|11063799006|4143699003|10067099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	24hoe/nRDaSQWlLH/APoGtVoJ1U8NLXI4eV5VTfd41aWjN3HbEwl8uC8HClixme7kwRx27iw7i68Xw3hPL8zmOFTVnusviYIo2kmSH5M1rMnY2+Y6b8UtS8DsJw0niAZD77mviKjShKlmq3m09RerMXHO4INq65aN2VnFDBgd27I/H+vARTevr4uPTO7apmZ4UjoIB3hIGML5AwrzuMiRqpsqvouuFe8QZHiBmCD4AVqHtYP/6+X2Ad3jmm1CzjB6bnY5ccF5CokZ3dDQo8EhVhlpYw4hl/gZddIs3vZ+jzjk2xJxeMa+GWcJxTIlE7y3BpSuLjXy6eWlhXghtQxtxH79S39L3J3kR3oDGG8fJUNZ9DnL6BlkRImTxaNRp0FetkNu8cDLM4vK/cb+qgYbOa/wSp7S+GqGDNFx2037nMVLy91YoXmM1uv/MHSFHRskBZe11ajYzwHaJu+/BtdkbF5y/faM3AzUJGYpJ/d830pZ8hrh9Xo7THlPqNlZlbKYnnxpddllhWI1nlXvMl1gcQIz+CovQONhAPzONcC5Vvp2/h4FP8L1TIkMlp/xhHfeOgXjsy2ugce7msra8/3Rr1phPObeY+9Q4MQqvwh4gvQ2RwAQqcLePd4yPRr67KCv/ER84TtqF+t5xH6zfH1IHYiNpHHvSsXZRGhYDIj7tc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(10067099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnYzZENSWnR5U1crVnp1bW9BbDN0UEVDSzBpVzNVRzBkRHVqaWlkVDhLU3hB?=
 =?utf-8?B?K0RDRnNXTU8xdGJsWWJPZHZQMzN3ZUlZMmpHR1ZmSVhlNEMyOHhxdUpNODNI?=
 =?utf-8?B?WXpxWFNrSzVybVd5cnBidU1ML3lUV0lxNzVaZXpMWlorb015NzFieXNOYzhT?=
 =?utf-8?B?dGY0SU8yaEpVVlVzQWxkKytnSHZxeDVuVWE3UTZ6d1N5aUt2VzltYTlrUDg5?=
 =?utf-8?B?S1JpZDlzTDVob0hnN3F1ZzBxT3pVckoxZVBKdzJWM25EclRhb1lmTDcwejNn?=
 =?utf-8?B?bkZaYzZhdlVVSm5Kd21lbGhReGJJUFZlam5MbVN5Zm5PTlZXN2pMb2w0ZEVF?=
 =?utf-8?B?bmVIZnhUdEx1Rms3cG5IMnFzTDV4NHVTT241c3VKUmJUVW9vZ3FIdDdVWnlt?=
 =?utf-8?B?S3JsUzdiZWtKVTA2aWNjL3R3enRPUVVmeW8yKzBuL1l2R29pTDc1OGtoSFlV?=
 =?utf-8?B?TEI2SzVpZkRMQmhES085cUdsekdhaSt1R0xYc1hyYzVMOEtHYUdERVRGZzJk?=
 =?utf-8?B?NlEvT2o3ZzV1dGNFU1ZtQWdYdTZHL3dDNkZTdmMxOUZnNHZ1b09iRmxnbGdr?=
 =?utf-8?B?bzZHdXdIeXhpdWo2T0NvUnU1VE91Sk1HTituMEdmQks1WlVHMnFVRHZ6RW16?=
 =?utf-8?B?MlBjUWhtMWtWV1laem9vVnZwNnE0TzBhSFN4WUF3NHNUdGZCZC9OcXdROC96?=
 =?utf-8?B?eDZDQW53K01ZZ1pGNEQ5RVgwTWl5RENiMXo0ZUx4V1U4YTRxTGhiS1E2Z0dz?=
 =?utf-8?B?TGtMQitnSGFHS3JIaVB4MlRnQTQ2Y2ZaZ0RtVGozSzh6SDJVMnAwRTJRTVJo?=
 =?utf-8?B?bUVMRFd0bkpsQlBBN0dETC9qd1QvMzlMdmFwSFh3VHRXRVJ3ZVdIOTlsNTND?=
 =?utf-8?B?MmRESkhqZnE1WFhtSml5ZGlPSDRGWEh6UFdpaWFxQkUvRWtKNEpqUXhSOWFu?=
 =?utf-8?B?cXl2UG9yaVlaNjNLZVRyZTVEUGdYMHJJc2RNVGRBZUZ4aUg4NXNBbzRBZ0JE?=
 =?utf-8?B?aWsvNzRyZVdoMVJrNmVOWDJkWUc1V3FOcFVTVHpWd1FkQjZpV2U0WnRGY05O?=
 =?utf-8?B?TjZEWXQ3RGhTUDB0N2VhQWJNR1hDcUkxL1JmM2YzRlB1RkpOSENVdGRFaFEr?=
 =?utf-8?B?MUlKaVJrM2VrWElwdWNvZXNGMzJyT1JIWEZKUnowQ3ZDQ0dEdWFxSEhNTkg5?=
 =?utf-8?B?OFhnSTN5RjRPaWcydTZJNzhKSHlKMHRLaXVDcXg4ZjVqVmpZK1hTVEhNbGVP?=
 =?utf-8?B?TDFhL2JYU0ZyNDcyaXhwbXRsL3pkZ2I3U2dOL3NRd1VHWWoxNDVTWlE3dzhN?=
 =?utf-8?B?eXlJR3JtSFlCZVVGM2FkRWs2UDhKaTBTVFgyUXAvL3JydzllcGsrM3RyWndB?=
 =?utf-8?B?UDBaaUZtVXJUQzFNeFhReElFMGpxai9Xa1huQ0ptNnpvQU4vMGhjdFRoeFU3?=
 =?utf-8?B?SU00MGsrWjBwV251a1kzZ3Z2Skx2QWdwWGUwZGdFNHBZdU5OakNVNFk0TE00?=
 =?utf-8?B?SStlL3AxTHA1SHVsWm5QaWNUUnIvaWFLajdBZkMwaDFwQXBYY1BpZTRHdDlq?=
 =?utf-8?B?OVp6bHhWdWxCUTJtV2J2bU03VlNIWExwVUxtR0tFNThhbk5HMEJaeGdYSk5C?=
 =?utf-8?B?elh5R2hiaCtGQ1NNbTdRNGFhVTRnaHd6NXBMM1htRDJWQjdzMjRUZkovU29W?=
 =?utf-8?B?dm9VT0pISkdXTDcwMEVxcVBoNTRKZnJIa08xS0ppYTRzNnR1azhKdEZabEhr?=
 =?utf-8?B?bGRPdDNzMmZoZldWZE9uSFVLYm11TW5yQUVsMkliVTM3emhObEtPSG1DMlVC?=
 =?utf-8?B?T3VSSFJ5UnB1UzdpS1JERWk3VUVHLzVlaWxZcko2VE1YYllLeG9EajdaMEVn?=
 =?utf-8?B?djFOSmFRZUtGWG1uV2hWK3EyNTRuMHYwMUVvVGJEbHBVZ3RLcmpRaTZrd0ND?=
 =?utf-8?B?b2ZMdVV0VEdrUm5vWDJtOXdSWVBkTXc2RHBmQjI1OGxhcGNMSWdrV0JaTTZn?=
 =?utf-8?B?aTArTjEwb1pDY2w4eUFMUEZsSjN0SUJuUitHMkxSYnJldndUODVVaVZDU3VL?=
 =?utf-8?B?MnJkNzdqZFlRVHB3cDBzM1ZZbWkrdkFjc0tzNFJOL1ZId0Yvb2xFdnVHblVS?=
 =?utf-8?B?a0RwT3AwQzRGWmRBLzZ6SEx5NDY0OFVpQ2J0T2JoOVAwbkVIb01zT09mMits?=
 =?utf-8?B?SnRURHd5RXJoaFU1c3hPQkZ1b05yU3BubWNDc01PSzNPZHpkTVZscHdQalE1?=
 =?utf-8?B?a3ZHWjZSY1I4YVY5RXI5U1BIaEZWbzQzTUJiQmhVMWRLd3loNTVWbjQrYUFl?=
 =?utf-8?B?UHlXcGo1SWdCQjZDclZmbDdVK3Z3aE9ORmVEVDVEQWxJalBuZkE5UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c7a6fd-1817-4406-d4da-08df335edd46
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 12:44:24.2874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fiVJa+0RiLQG5YY8Og6NmmvK1R8xStzHUafHgjgX8eA+VEFr9i17V9IBNjLB86bgaK+7yd+559MD2HHgtjqqEEWfc9v8+4jhIrLgwwWJru0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5612
X-purgate-ID: tlsNG-c201ff/1793018667-738BE2A1-25543DD5/0/0
X-purgate-type: clean
X-purgate-size: 441
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26/10/2026 12:27 pm, Mykyta Poturai wrote:
> diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
> index 8831ce068c..5e4e89b3c0 100644
> --- a/xen/arch/x86/msi.c
> +++ b/xen/arch/x86/msi.c
> @@ -21,6 +21,7 @@
>  #include <xen/iocap.h>
>  #include <xen/keyhandler.h>
>  #include <xen/pfn.h>
> +#include <xen/msi.h>

Please keep the headers sorted.

Probably best fixed up on commit, by whomever takes this patch.

~Andrew

