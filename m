Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A7D606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 21:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=lusJkPrS
Received: from list by lists.xenproject.org with outflank-mailman.1486576.1689142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRcp8-000294-3w; Thu, 12 Nov 2026 21:59:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486576.1689142; Thu, 12 Nov 2026 21:59:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRcp8-00028x-1L; Thu, 12 Nov 2026 21:59:14 +0000
Received: by outflank-mailman (input) for mailman id 1486576;
 Thu, 12 Nov 2026 21:59:13 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRcp7-00028r-4E
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 21:59:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRcp6-008Qcp-5f
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 22:59:12 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af63652-bab6-0a2a0a5309dd-0a2a45058f58-46
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 22:59:12 +0100
Received: from [52.101.56.31]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af636ae-4cb1-0a2a45050019-3465381f5c60-4
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 22:59:11 +0100
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by DS7PR03MB5382.namprd03.prod.outlook.com (2603:10b6:5:2c7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 21:52:35 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%5]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 21:52:28 +0000
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
 b=F+8kjZbTlfKfZHYBGEAM9Ek5lW0Sfhnf/GY6fQPXTRF4dBEZ+urXDb8yA+TqWm2M0tz4FJDVx0ZCs1n7ns0jqgkkNlceEkCGjjDNc5D6ketIbfhenyAXNS3QG+wdgOnlYA+gLCgrfzT9wqiLvAoCfdpao2pW9rbhmLXQiAc7MjcnI2sOzbvFJV7m2mMju4b1WNOEsMmLtJNXgPrZ9soAt28sOBjBhen3NgmxS2B8LUW/cdwWV9HwRSjt+OIbIjdGn5r1eiFvLo1IStcBoV0Nsf+z9JGb4NvJxL0FyBaG7lnRHS30d+DU+4ndESB8OuZEBUNW+Kbn4FSha2uY3wsfZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ILhSJSMvCmK+KqxWuEDLIYjRY5nXXZLqZi6NO8BUHIg=;
 b=XfmjydHkPszPh71sxaoJzAyBGdIhNtbBVVgUwyz0kCF2+3VvbJDc+nXgcHgGAWf4uxsgHy0vlEV9rvlpr9ZYFoVUyYOEzLuoUBas3/8MLDNe6qcb1wcnNuNU5qmBbzdRQWSNLFlwAC6SXdtI1tF/yvqL6NXg6Lnj82jK9ZnlEMberEc2JxVFZA13CaMiacl2KwxapEZsSxQbvuxC6E75qpMUcmRD2aemzw/ipyDGCTdIWkcBtLtVmERl1ZFtOYxhhWMbaYa1pMrKaBOpac0kYD58JzbQgGIkh4ypUJ1B2ZUgFVWVThCK+QmGyi6JCL8yj3EW7XnOMtxxmetEA63R6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ILhSJSMvCmK+KqxWuEDLIYjRY5nXXZLqZi6NO8BUHIg=;
 b=lusJkPrSYIrrU9KUHzHhTTjKvzIUhVgxtuKbXe+H8RyCiwa/fYPVhceu+4e/e67i6vFHuG8f9XughnQ32N/rqI7oC3uwTRZCVK4sTSRHQm67vhFOBXueBCOgwuj8uZUZ5AVV41f6utljLu2+19VUKrl7BHZUV3YFI246CSeMCoM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ab964e0c-a972-4a71-84dc-a6337883a835@citrix.com>
Date: Thu, 12 Nov 2026 21:52:22 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Denis Mukhin <dmukhin@ford.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/svm: Drop 'struct' from the vmcb_struct type
To: Jan Beulich <jbeulich@suse.com>
References: <20261109175506.2965263-1-andrew.cooper3@citrix.com>
 <a4fbc882-316b-44bb-9575-91ea9b8531ba@suse.com>
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
In-Reply-To: <a4fbc882-316b-44bb-9575-91ea9b8531ba@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: GV3PEPF0003BF0A.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::15a) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|DS7PR03MB5382:EE_
X-MS-Office365-Filtering-Correlation-Id: bffe93a0-1caf-4b84-a06a-08df41073efc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|11063799006|4143699003|56012099006|261026121527099003|261026140227099003|261022105027099003|261028144727099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VYVfU4TwqFAfIYN+b5kExWqkTnTFCBjJFCqQwdQZb6kxl19n+kdGt8X9DmD/wy7QGY+cUzc7xr2NBaCjhj6STkeB5ea5ZlNOaYxQZLY5tVOFOvWcB3TH6cLtRwekkGLENFUfiU3xD+YoiY5BhffSpghIlmXfwUldOu+QxegQPCXrBcveNUe8m4cKmWm30SY2XBke75Do4kY18X5a3zK+gnSh52Yo3RxMvopa5ZH/sVmIarOa59BiRQ3sYatlws6DNownwUHM8jYY9rhlPWqGk9RyzsCYXvuewY5hMuI8XyUTrsoDzbx1z61WmO6NAIPMopWf2I/z+yaDGBI3hQRS5GdFlmFv6Naybxo9A6AKHFkwdEiQ/1kpZjuV1lySFmKZeBW/CFqpxnef9bgXL1dcKBpCuyv0YNtCYoEeSzyNFr95GH6JonM1YGKZC2fyiLFzITAd7SMwC5hJCsnIDEBls72B0rANPMr7hIxVKXdjA88U/CYW8fB3CbHvsEKrvuw+3cUYUY/roiXav3pxYiQo+I6cUgU7T7qLfOzJdqqSbMG6gTwzWV6Cd1Bz8DC8Y0FwRMK+VNaqG3UZ7XyEzq14GVYky/+nOnZbuqIPLDn2OFPFpVLhygqdmdwLzLbz4D+reZwZVI/HewvFewIbxTqIlnX64DmJ5jKLkSkYricaTyI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(11063799006)(4143699003)(56012099006)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3FrME1JU1krdnJwajF1Ykh0RkQwdW9lUXgwUXA1V1lQUnVKRmU5aXA5VlAr?=
 =?utf-8?B?WGZJaXFaZHFaMFFPcUo3T1JoNWlMNlNPTjdMNEdRK0x0L2ZLL1BFU2x2Zlk5?=
 =?utf-8?B?aUtQaXliekZjOVFiQkQ2djIxMlNlaUR5MnlCd2VTcXZHQzhXZ0ZWRHpuNTI4?=
 =?utf-8?B?VlBBSkgwakZXT3VhbEdLZEVQRkRVa3VaMUl6YjRiTUxtdU1GSGpiakJRd0Vo?=
 =?utf-8?B?cVFHdEtPT1FOblJXRkdXS2I4YnJsV0dSSzg5NlJmRCtEeW55cnZqVEZCSXhW?=
 =?utf-8?B?emE0andYTElGZzVyZGhZRUhRYmtnblpFWlhiNHJlajIzc0pIdlIvYndWUzh5?=
 =?utf-8?B?OEU0cDhFNWp5cXhmY3k3Uzc1NVZGVlhWcmFWY3N0dFNRL0VrS2lIKzlzSE44?=
 =?utf-8?B?MkdhaW5XSVZOMjA1U2VNVFhzZ1RqZmduN2JZVGlzR0xjeVR6MytZK0NlZzVI?=
 =?utf-8?B?UU5HNGhMNUhpQjVpRXR6ZDE2VERIbTlzbll4UFNCaVhVREJEMGFZOXI4WVpC?=
 =?utf-8?B?VmZobUhOeHZSWGE4MTlzNXB4bUtZdmtqVDhxYWZCSmF4ZDZjdXRpNFEwTkZG?=
 =?utf-8?B?MkFUV1E4MUppajgzTnpZaEp0Y1pkYkdWa0xycUljdzkzZFdpdC9rTG1PZkI0?=
 =?utf-8?B?WXhQS2h3Q0pYR25oaDJhcW10MnNkWmthLzl2eFNFR21CQlVMNzQvQXlUNGtx?=
 =?utf-8?B?THhqUmNTU2NNRFpSZmpsTUZtUXFSdGxxOC9xWnNCYTRiQ1krWmwxNmhyL2xv?=
 =?utf-8?B?ck9nNXlEcXhCdEFUc2ZPU1ZVQzNtelJ1dXd0UmJKUGtyQzNHa0ZFUHNhQjU3?=
 =?utf-8?B?dUJRU2ZYSENVRmxwUmR3QWl5OGJROUw3Vm1jUFNxNUd6RG5ka0Z3b3RTYmd3?=
 =?utf-8?B?SzZSWkFJMll4RVkrcVRrdUVTSkd0NThMclY1ZGdFeXdrcTZHSE1iY0VTdGpG?=
 =?utf-8?B?OFFXR0dsRVk5U1dBV3ByUGlid0JXNzV0YTk1WlgrK1JHUHFFTTBENlJjaFdK?=
 =?utf-8?B?RTJ2V3dpOWw4RDU5RFl3MXlRVWpBQm5vMzNxc2c1dGdJaFg0Q2doMWVZY1p0?=
 =?utf-8?B?NExWUzI0NUZxdnMzanNIek1SMkZ3cHluOFcydHEvcG9VUkhTL2J2SHJlUG41?=
 =?utf-8?B?ekZPdHpnSzlGTFMxUHpBOUJ0b3BYVnZ0YUxwS0dqNDdNdFlGVjNDeWFXNm41?=
 =?utf-8?B?OGVWdFQ2NjgvM1N3WDNBdG5CN2w2U3BIVDRVektLTEs4c0FnUmx4cXFnaHd1?=
 =?utf-8?B?TE1CUHJkY0s5SzJnaG9EeTduNlcwUDhPUmxRNm9lNG9ta0paRFptV2RMWXVL?=
 =?utf-8?B?eE1VSHBuL1JIR0o3U1RyRzdiSVBQTktzdDBsOTREb3NxOVRZSXJaR042aU5L?=
 =?utf-8?B?S1BTYis1T1lvLzdFQTJFWVhNbVkxWTlIVnhTeFV2dzMwTXhOblVxNEdzL01F?=
 =?utf-8?B?ZXBOTzVvb3lhRjY3N04rRTFzOVJaOUdibE5LbEhLMjE0RU5HZUhYRDIzN3I2?=
 =?utf-8?B?QlBMNXNhcXV4cTJLYVI1VEpTekswcGorTDh3MTdUTkxsZkhlYWJMUzMwUVcw?=
 =?utf-8?B?bTdJaTVqcEtWajZVN0xNT2V4UjFhWG9yT1NiNjB4VHVkbkV2UkV4aWVIK25r?=
 =?utf-8?B?eCtLL1FQSC80RDZDUUR5NkxIVmFFZWhuSHQrVXJJR1RaaTJ1SHVZc25SYlNK?=
 =?utf-8?B?ejVTOVdSQ01HRUp5YkFLK3VHT3VKcXdkN3pJRUhxWDA3WitmcDlkSUF1RjFa?=
 =?utf-8?B?TjA3MlFjcEFmZGU2NWR3UnNCS3FFYWx2MVZENGFhcWI5RGRXdUxqNzZMRFZB?=
 =?utf-8?B?T0lOQ2VLVHBib0dwT29tYUJ3Y2NxbWwyblpiNnQ0RzdSTU1NcWpNcnNPU2Fh?=
 =?utf-8?B?cGJhenB1TzFick1qek1ZbWh2S3dtaEdEekwvcUQ3cXlodVdrRmZVR2VmLzhC?=
 =?utf-8?B?czB5czhwcjhZVURnZVNDeVN4UUwwcXhBVUt0UDcwSEhMNXlJaTZFZm5BMEM1?=
 =?utf-8?B?OGFKSjIxOGFjc2R0T0t2UzRlSHA5bDlrKzREQXJUeng5Umk1dkNuSzlmd3Jq?=
 =?utf-8?B?VWNhMkdubW03Skt3TkNMWkJ4WTBSVDFCNnlYSUhlTGo2eTg2OE9FRVhUeTJ0?=
 =?utf-8?B?d3BWaU5xa01xYVVVRm9FVEpMbThNSU82am9GMnhiZHdDdzlBS24yWUpXYTFP?=
 =?utf-8?B?WHRxNmEwVUFVbFU3dDh5Rit0ZkVGUXRPU1h4R1RoUndRR3h4UzV4dDVuMjhR?=
 =?utf-8?B?dnNyaSsxMXNNM1dHZDYvWlh1MENqb3NMOG1lZkRwSXdQRWZwMm1iVkViVjBQ?=
 =?utf-8?B?RlpYZktFejEyRDZQR3RxZlc0dHFWU3NnWjBsMmJ6eGY4eGh1djBnQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bffe93a0-1caf-4b84-a06a-08df41073efc
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 21:52:28.8222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Avlw4R3pRetLWCKsgNH+vR8P7AWea7zXjJ6/rwu2zZfm7f52hTNZQ9OWLWA0VefEfjMls/Ckq7Ur7FoTanBbI58fhklxO6b7z1Jow6f47Go=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5382
X-purgate-ID: tlsNG-c201ff/1794520752-F5CA82A1-81EBD245/10/78276251493
X-purgate-type: spam
X-purgate-size: 713
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/11/2026 7:56 am, Jan Beulich wrote:
> On 09.11.2026 18:55, Andrew Cooper wrote:
>> This is just a waste of space seeing as it is acompanied by a struct keyword.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
> We have a few more of these: struct vmcs_struct, struct vpmu_struct,
> struct xsave_struct, and perhaps also struct domain_security_struct in
> Flask.

Yes.  vmcs_struct will be going away with the equivalent cleanup before
we start Intel nested virt in earnest.

There's pending work for xsave too although I can't remember if I've
made this rename anywhere yet.

~Andrew

