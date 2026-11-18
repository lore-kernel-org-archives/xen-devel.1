Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBB4606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 10:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=ue/DQOCX
Received: from list by lists.xenproject.org with outflank-mailman.1494251.1693873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTdG3-00034O-Gv; Wed, 18 Nov 2026 10:51:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494251.1693873; Wed, 18 Nov 2026 10:51:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTdG3-00034H-E3; Wed, 18 Nov 2026 10:51:19 +0000
Received: by outflank-mailman (input) for mailman id 1494251;
 Wed, 18 Nov 2026 10:51:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTdG2-00034B-KR
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 10:51:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTdG2-00ECOQ-0k
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 11:51:18 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6afd8325-2eae-0a2a0a5409dd-0a2a4508acb6-0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 11:51:17 +0100
Received: from [40.93.196.65]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6afd8324-f659-0a2a45080019-285dc441c220-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 11:51:17 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA3PR03MB658065.namprd03.prod.outlook.com (2603:10b6:806:591::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 10:51:14 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 10:51:14 +0000
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
 b=KaSxLY1qsYbLkc/gamm8GsjFCluzjQbUunXuNeDOWs4Q3nxZ0p7rA/lNmSJKiD+sRW5dP4VHGdrYMmlGXHRX/w68+migqq8S4zGdOXCFTssa3N9sUtRp0yq+EOkvkJ7Naax0nY87+VP+HeP0huhzFHRQz09JXdHHuC1ZRe1Ynvpg5e+VIH2ccM7BJNX9YSprYbA6wmpjRWzAYd7gFKxp3eopg439zEP+PIj70a1/gijV+aAK445Cki5PKNlP1Ga2BORLbkNaWe1AeI4cyYD/bL+cFiVAFkGa1AIN7DiOcfoK84RUsJrkmEyRa2cDwIDfeA+FtWydxG+M4ZgC9N0vMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5sWSvrxuaFUMfq4tEDtSPIQxYUC9U4aFp1gPBkSvlQs=;
 b=w5gbIrPo5nMVI/2iQqrwjEuJdBUF39sXPmCu0X2qZ/A++4UHnTG5ht/e2azsOwG5ioqKEpPGO1ZqQS1uoPCKber4+30EnoFhy8A7gBHiQ3XmaM5bfqIjGCiWMTroePgWK9y2fGRpIJu9EMSdjCPK27lyzmtH+VQA676IkMp+EdzdL6sr6TeeOjmJtXfobT+lLalKqrDsd/pMO9rlyTSPbSVqlJn3k+Pe2J99w8v0gDr8mJna7Y4Ym8DwsVvVftIE2vO/hO6weMfE1H8CHwVHyOtmECfCzPJtD0TxZGM3PwFi5VUWHs0sIOiDupNrD8gGZM5aTkp3eCWJikOZRQSJ1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5sWSvrxuaFUMfq4tEDtSPIQxYUC9U4aFp1gPBkSvlQs=;
 b=ue/DQOCXgd5tLz0aEA83juQJ4G8lpLJGO4ufA7an9SwnFpBpCAGjjZN3/JTJpQsatIgNpcgls172/m/xbtTqZzBXBHIUAV4mJ3mroCWCxg2TN7FbMUwAj6B194S4t13vXI1L2GXz8KzTl8dKF4ot7zi4bOvWcQWUn63aalktBxk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7db862cd-7082-4a3c-a839-1679d956ba9c@citrix.com>
Date: Wed, 18 Nov 2026 10:51:10 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/2] xen/build-id: Introduce is_gnu_build_id()
To: Jan Beulich <jbeulich@suse.com>
References: <20261117202244.4054656-1-andrew.cooper3@citrix.com>
 <20261117202244.4054656-2-andrew.cooper3@citrix.com>
 <488b0f8f-c62e-4de7-bf1c-ae5fdaa75a5a@suse.com>
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
In-Reply-To: <488b0f8f-c62e-4de7-bf1c-ae5fdaa75a5a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0451.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA3PR03MB658065:EE_
X-MS-Office365-Filtering-Correlation-Id: e90484fc-c78e-4f28-f41b-08df4561ddb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|11063799006|56012099006|4143699003|10067099003|261028144727099003|261026140227099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	wO13NvwUZael9Q8kik56mbemGUaDVRfQS1R/6MK4HxWoH6HpvJVOiqEjheFOHUv9lRUbRx4mzx+B+cncaootjrqNIwdqo+i+dp0WUAC60XAaJP3yj5nitI9SOuRPuzF7E/5M5sxr2Z/o2hdZFpGBQ3lmVbp6m1cxrUGURfAZgwse2cg+L3PnMSCs+t7ENSXajnJh2Lmk1Az3w1LyYaxDwynB/AVA+IJbLH5PoOCW8vpIQik5LanMrbPivSfF8IQaAMq1UjBfg7TNGCUuSVEMl/su1DHa63X3U0m/jSKHRlBFzAUUwpn3DIHWOk05i7nz34C3LhiNaPa9ZPcqRMorkvRO2DjutCoySmtqOdx4E04acUgkO/TbCNeWYs7GIudlMNXRFWHyQlO2YpbqpyRoTHftAfcJiPWvh44t+IAsGErJgpGlPCtoKln82A1iHuu9yRnalwEQ0ut78p0bHkohirqmmSa+gVzBKViGa+b7YKIC+qCnyQ+6wBZOS2QGG+XN7VbnCjyak5h53VknREMV+TVGUPsGeC8HykLaH819Q11zYMyVg+yNan2Z0HLqmJP9eWSe0SUqvvldqtEelZmm95YKWOGBVeRzP5ID1WFarC1gntD55WbfgemAhS4PwQK3QXEW23avBCs00yBO0txd/2Hvb4GR+nRQtaB8WJB8P5U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003)(10067099003)(261028144727099003)(261026140227099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q012YlhLUWRLU01yZk5DZGNQNkx3MVFEN0tSWjV0RWZHUHgrckxHNUZQSTU2?=
 =?utf-8?B?TlNTQzB4aXN1eENTdzNpYXBqZ0V2dlhLejdid0RNU0l4aVErTjJtbVFTZEIw?=
 =?utf-8?B?Y0tlQ21hY1JYMjdKbDhNZHo2aG1lM2xVSjdiNTYzZkVPcHFGU3B0eW1HN3Ry?=
 =?utf-8?B?YVZiUGtQQm5vdS9HWFNDTlFvNWRxQ3dXRXhicWZRcVVUR0RKY25wZ2NGTHUr?=
 =?utf-8?B?bVFQYVVmUUhDL2huNlJBTm1VSHBwVlRIVlh3NzhFamVycDlIcW9vNnJzdDN4?=
 =?utf-8?B?b0wzVEpxc3EzYm1TejBJb1NFNi9NYXM3OHBTMFJBUWwzaUR6Y3JGTllRL00z?=
 =?utf-8?B?Z2hxbS9RbE43cWhMbXhLVDBYWXJ2RTVmVldsZ2JYdmRLOFhDeDVHUWp6eFRY?=
 =?utf-8?B?NW9OK1JtbWUrUEwrdVZiZHVyUVF4V2Rublpjd1Q2TUlzc1VDRkhqTEhKQ1V3?=
 =?utf-8?B?OVhlYmN3UVBiMnkxbWxIQlhBRFA2RUI0UzQ0cnZaR21GSUI3R3VLMytUdUg5?=
 =?utf-8?B?c0VPM3pQcU5xVmIzUEh6TmtPMXJ5MWlCdmxlT1QyOFBDUGlkWEwzanFobXIy?=
 =?utf-8?B?ZC9aZUpFVTRXUWcyQjlhK1hIQ3VCU2p2MDVubFIyNW9oL0lOTm5rVG9kM1du?=
 =?utf-8?B?THJ4OHNFZUZKdXduM1R4bFBnM2ZydG1nQUNiMUwrQmxubWxMQWM5WkdsT2F3?=
 =?utf-8?B?UTB3aVJDVDM2RW1wck1LdXN3Y2pwMzZ2T3Y5NlgwdVBxbk8vWWY4Rkgybkwx?=
 =?utf-8?B?WkJFYk8xNTdPeWl0UmhvUzN6SmdVKzIwVUlDb0E3dXNFa2p4MG1nQitKa3BI?=
 =?utf-8?B?aDRjM05BNTB6TWc4RlMxeHJENlk4Y0tPdGxybDk1QUtZYjl1OGFVZHpsSXJ6?=
 =?utf-8?B?MWRSTy9jVlNKVmFMdm5wbDN0bFBSNE9yWGFPVmQ5WjFYZ2hweC93OFFQUDdT?=
 =?utf-8?B?OVNtWUhvSU10SXk5eGltc1Erb2pOWHdjMjJHKzB5WHdBVDVObGpuaTJPeStJ?=
 =?utf-8?B?TVdSLy9Vc3BFNDNFRE9pcEZHMFI2ajdZb3JXaS9pakdCMXdxSjV0SHNUOWtu?=
 =?utf-8?B?czVqaVMxV1hLVGRycGMxdDBRUEZhd0V3aHByVUlXd1kzc1NvSTdkR2dIWmlB?=
 =?utf-8?B?blNxcDRlbVJNK3BMeFZiRnRtQkV1Yjg0b3pEb3VFK2IxeVU5SHV4UldrZUdo?=
 =?utf-8?B?b25YWGhyVjZ4bXBXYlN3Vkt1aHNJRUlTbmlNZ1BlU2YyZUgvNXlIWGlhdWo5?=
 =?utf-8?B?bGhkWW5adEd2djB5UUZaKzlnVjJvMjNzYmY5RTFkU1BWamhud3NzOWFPM29a?=
 =?utf-8?B?RkxyQWs1WFFMYWlYUE0yZTNRTW5vR0JjVDZrUzdHK2M3WWd0ay94cDNtcG1h?=
 =?utf-8?B?RDdKY0tIdlVXK3p0Yi9leXZXQWRkWEpSKzdER0VYT0Evck5sc1RFclhmT3k1?=
 =?utf-8?B?WUFZbis2V0lzRGp5UWw3YlkvNDJSZWgyVjZoVHIwRnFaQXFqZm9tQ3BoU1Iv?=
 =?utf-8?B?ck5TeUlTNVQraURqbkZEb0pXcjA5RWFLR0JjM2xWV1ErQVNuVy9TNUNwb1hC?=
 =?utf-8?B?MmwvdEl6TkI5dUt2NVc2ZnBWcnFtc3pHK1d2Mmo4aGl2akZabkpQVDFsV1pQ?=
 =?utf-8?B?Z1FVVHdybVJqNFd3T3FsdlExNGFjWU1FazV2cnNldnFLVGtuUi96RmpMd0pW?=
 =?utf-8?B?cjM2bXhxbUNtSnlQSGY4TEo5dFFEUG1USTQybDNtb0l2SnRWUHlMWlVpQUVP?=
 =?utf-8?B?M01xWmpGdjJEMFdSa2hjME1mQWZjSHg4bzBjTFB2Mlk5S3B1OHpmLzVrNGtH?=
 =?utf-8?B?OGVicmFZbnJRaC9iQzd4RXhGRHc3dmk0dnJySG8zd2hYMlFZYW5UZTRNcXhu?=
 =?utf-8?B?QWtOYVdTd1QxNmRkdGdJdG9MT0MvbzdSQmpva1RWTnFRcXRBMHR4RTNXSk52?=
 =?utf-8?B?ZWJsMFJGT2c2S25CZ252K1pnNWptd291NWJQWEpzZ2U1NzNHSktSKzJPZGtB?=
 =?utf-8?B?dWlFaTBiQmlXbTV1Z0tVa0JpNlZkL2c0QmQ2L3JYY2NOemtyMENyN3VUa2FX?=
 =?utf-8?B?ckJpNERSUmorQlVON3MyMlNXQi9kVWN1LysraFNSU200R2d6SDBvWDFQSUg4?=
 =?utf-8?B?bzloSW5ia0pvdTJFRzRCSVBoOW9nSzZOMUFFM05XOHQ3TGlJQWhLOHhOVm5w?=
 =?utf-8?B?VG1sVnMxTDBGMWdXekZURzFPSUhLM0k2VHlxcUY1K0lMVThZaWdTUlJUYVlu?=
 =?utf-8?B?ZkFOSGNGMzJobmZPSnRWdDdkcncxc2tlVGFWMnZXUUFDWHZjV3JuUS9Pdndl?=
 =?utf-8?B?SGV1WkpFa0Rpb25FVU9UWVR2SmVxdlMxSEhUalk2ZXI3amZUVW5jUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e90484fc-c78e-4f28-f41b-08df4561ddb3
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 10:51:14.4369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JiussxTEzAec8uLz/sioPvt1gbEURQAzSFvDZKJ99UVqev5abfWH9VI4YmKy951dgshUXD1enAyxC4mDLwbdL1m0XbmsIKqgEXqA3yfB8Aw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB658065
X-purgate-ID: tlsNG-c1860d/1794999077-DFCD387B-B5F0B3C6/10/78276251493
X-purgate-type: spam
X-purgate-size: 700
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 18/11/2026 8:51 am, Jan Beulich wrote:
> On 17.11.2026 21:22, Andrew Cooper wrote:
>> Broken out of the subsequent change for legibility reasons.  It will be used
>> to replace xen_build_id_check().
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>

Thanks, but it's just occurred to me that I need to make the logic:

    if ( n->descsz == 0 ||
         n->descsz > (len - NT_GNU_BUILD_ID) )
        return false;

to retain the property of rejecting a zero-size note, now that descsz is
not strictly checked against a length that was confirmed to be 17 or more.

I'll fold this in on commit.

~Andrew

