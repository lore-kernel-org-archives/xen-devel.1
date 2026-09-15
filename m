Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F156C88E53
	for <xen-devel@archiver.kernel.org>; Tue, 15 Sep 2026 09:39:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1421566.1647347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6Pcc-0000zJ-P9; Tue, 15 Sep 2026 09:38:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1421566.1647347; Tue, 15 Sep 2026 09:38:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6Pcc-0000zC-Lr; Tue, 15 Sep 2026 09:38:38 +0000
Received: by outflank-mailman (input) for mailman id 1421566;
 Tue, 15 Sep 2026 09:38:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x6Pcb-0000z6-G8
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 09:38:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6Pca-001xBC-Cm
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 11:38:36 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aa9121b-2eae-0a2a0a5409dd-0a2a4503af86-4
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 11:38:36 +0200
Received: from [40.93.195.13]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aa9121a-fae8-0a2a45030019-285dc30de614-3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 11:38:35 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN2PR03MB4989.namprd03.prod.outlook.com (2603:10b6:208:1a5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 09:38:32 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 09:38:31 +0000
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
 b=cOGkhIeUGNt6T4TzMF3zosPT9Ss1LmMfK0+BuGoHSW8cKR0BTnkQyT2vcO1Zx6jiR4dLzz8GJkcHQk1nnkflFflIYB8lZCWzaLTeUM2x7Y0/4Abj7HY19J2gKZkZY9KM+lknVH1p7o+sZC3SkuCzn+SkfHhLUXLEJZ4x93wRNzW/kFDvsxzMakBTkpWSfyEFkFx10dzIHarTOvtfy4y1r2wShRVh/ZJNRvJA3GJmRcLnJ9rgQcXSfNkzpox6jvoVzreZl0gEIFafK6hVzPwAOzb9JnwBYDsdfAvhzkJTAAHRh3e7Iyp/ktJolHCxUVQATmxFewB3gGTB1RX6tvmlJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oifu2j0T/ryYwRsVAwvUc9UCZV78mWd5/uiBJmInh1U=;
 b=AuL7XMZ6Pobw0LXOzujT1bikBulk0XtgNYMNGHERsI57oA7s30/vkAxYziYel+H9KKwRvRBqesyPsG9/1z8mJZ6ufGEVx2KoL4NXVUZY/5m3JRa3tJCQClWWqq0Xjpq2fYVPtsJzwStG/kh55FiII/6jIQ4VxwzzqGr7F6d7hxyLyzXc0iJXigOOJgwXv/ek+6AtBW4EpIelDwDv6gKR+C5tm/AGlf8w3lO65JyBekUVjYxNA6Ku1+zes9YN71Ru2s1gYVzPkM7L337t7UWTVrGF6raO1kfHq5+twEYc1Lg870K6I2Km4dJXxxBdS/VY9+mCKapRsWyQ8uh0ENgvsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oifu2j0T/ryYwRsVAwvUc9UCZV78mWd5/uiBJmInh1U=;
 b=q2FoBlG6ecrTTU4z48+66OU+rMH/adg5S3yEtdGFek4PBAmrjq9wGEfpBHluNNBJbQOd6TPi6WhESdm72QEQkROmAIT58Hra+mf29+P/T3Vsp3xG3UvL88VkXW6yeHGAQD8cx9LsrUfOmw55sxx1KLcI7sEW9V58Z8voeSlEa9g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ee58a22a-5509-479a-9379-543730dc0cb6@citrix.com>
Date: Tue, 15 Sep 2026 11:38:26 +0200
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] Add basic b4 config file
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
References: <1789463207.8631fc262581453bbf619ec5b2062170.1a0a4519d3d000c4f3@vates.tech>
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
In-Reply-To: <1789463207.8631fc262581453bbf619ec5b2062170.1a0a4519d3d000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN2PR03MB4989:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a1fb316-7d7d-4f83-5ee8-08df130d1ae6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|56012099006|5023799004|11063799006|22082099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	nmD8aEyvHqI0um8nOUKTbPoxy1GK2CMeMsR9NErjlq9d32vID0SK1LlyHFAmdQ0TR1Jo2sK5ek3nti1Szqp5yvQyW2zzlReX5KOAiSzR455rWiaYDNSAyD26F+3J9nFbBsawHaJa/Suy55cMSmN1xwcUGPZY95X1On8u9p4QzM7aOvBrKtcdZu/2TVwHFWmjzGZzWTpG14w7aSbOXXda4yeMquviQeMBggevbHPdoX+FxPOVDma6mbhDkf39Sxsn0SLgY7q7LXt7rrRUzoMGhihGWyfML6ISm63qlGDHnQZ7eoRRgvCCrJ8RaRA3W4rKb8ismJ16YKM/Z0Krvln+yydwoQ5ELmlTIHF2jxdSN7EaGrXNulqP3Ru4hOtFH6xIV2rvg2r1ywIPKMQdnlg/1US11+FdsUNDZh68amZ7G9QNkT0NdXbRoQPdx+CCccYBTUNHjADwCKS7vii7uLuZewK/EWfVbbI0dg3si2yvTZKEOD2P3s5Iv4EN/5xpm5n10wPFdsXXyq99G2iIV/DQEcczMFhMkpPKegG0xGpDiHalpGSF0uTsNulRtZEX/ZTs1NF1Nxmf2r2OrLP0AZBNgl6Tl2Y6CFAYxgSI+aqIOJ8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(56012099006)(5023799004)(11063799006)(22082099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVZvMGxJNFNDbkdyaDRlQTBXLy9tS1hoMGIvS3VTWlNocjNlZ0pzWmpIT3J6?=
 =?utf-8?B?NzZpc0Nyc3dueE1ZSi9WWE5pTjFVRVVyN0dseWNhSEFzK0Q0SGg0RW0wTjFp?=
 =?utf-8?B?ODJORklLMXRDL052OUNnN05QTmRoM0ErMGdlZm0rMHZzL0JEbEJ2NVRndG4r?=
 =?utf-8?B?ald6Uk0zNEdtd0JFVEdMZzgzeXpvQmFlTERyNHd5ejh3aC9ENHFhUlRYYkp2?=
 =?utf-8?B?Y01NUUlPa1Nzc3JweGhMM0tDQS8wQjNITk4wUkVQOUJHR2VQM3BaeVhvV0do?=
 =?utf-8?B?cWRCaENORTBxNGJEUGRkOElqaW1UaGRidDRzY0ZVM2FaaEtDTFFLK1lFOUhH?=
 =?utf-8?B?dTZZMDZXVnpNY09YL1NpVUxzM2ZnRndGQzh3cWVldnRkVEpQU2JNY3UwZlJ6?=
 =?utf-8?B?ek4wV1Y1WHNnaWRyRDdoeENpUVJDdzMyQnZHRXJCZHJ5ZVg1NXhuejNxbGox?=
 =?utf-8?B?RmtBb2gwenJ4dkQ2UzJpaVhzUmVqS3RyRnVXUzA0OFUrZDdyb0RVaUF3RzVw?=
 =?utf-8?B?aThYSDJwY1hYYnBkazdLelB6dzdhNVRTeFllUlh3d3BrcDM5SVZIQ3d4R09h?=
 =?utf-8?B?VWl5MERKSE5HRzZLaWZ1RWYvdmQyc2xEM1lBOGh3a0U2NFM1QjZXbHU0QlRB?=
 =?utf-8?B?TVBiZktVaExibjM5TW9QT1JMMThmWWJQNkNaaHpwZU5ITzcwQ1RnQlVCMWQz?=
 =?utf-8?B?S21qQXllVjc5RkVidnE3elJ4OE9zb1hzUGIzUTgxVGRhbjBrbHRmdFhKUGR4?=
 =?utf-8?B?RW5vQmFUZkxud0ZhcnUwOHFBR3FuRmZSNXdzRmtjUllJTTFRVlRRTkhHVG8v?=
 =?utf-8?B?LzhmSmhuam5kTFV4bmE2Mnk0R2NZMXg1MVJFU2crSkRpNklrRElTSk02QUFy?=
 =?utf-8?B?blBkMDVYSWNiTVJuYzZaN1pKTmhyb0pqYWVuRmRYcUJpYmpBQ2lWbjdKM0JH?=
 =?utf-8?B?c01wblFwR0NXNXYyZVJjdzVHT2pYNlpCVzVhajIvTTg0eEc1d2hKZFM3WFRK?=
 =?utf-8?B?Zmo1TnVaVXhYMmVMZ25uVS9oVzFZbmFNeDZoM3VvZ1BlQ2lPblZzZi9IbTlw?=
 =?utf-8?B?cGQxV1VIRVFPYmZMTm9YZDNhQTVTdzRKRytxeEtoc3NhZnFJQ2ZmellzOERr?=
 =?utf-8?B?eGR6YkdQTHpvR0hBcVM4Z3hKRnJ2Qzdva0oxQ0Z3NTJDY3dPTHdiNHd1MUtJ?=
 =?utf-8?B?UHRTblJUUnYvTXRtdVZRcDdvaWdWN3BzNzMvR3J2Z3RheU5CQjZEOTRZQmJ4?=
 =?utf-8?B?cXVuZzh5dHhWQ3FTS1lUN0swVnRJdkkrbExPRHpoMWFnVGo4OGVhdk4wUE1n?=
 =?utf-8?B?TkxVV3h5NHZIV09sV3RtOEcxSVYvaTYrc1ZpajZ5UFA1WXlnSmc3MjVaWndm?=
 =?utf-8?B?b3d0U25mdFFpYkF6T1ZwRUJ3aW9UWVlxaG9tSCsxMVpFWmdHcDVJKzhRT0lh?=
 =?utf-8?B?eEZVUG9yeG04cEJlLzdZOVBTUUYwS3kwM3ZhMjNnYjYwRjlLODcxNHFUZ21m?=
 =?utf-8?B?L21aVnQzamRLQmFVanBTYzRORkdnSWJGVmVPU2crQTZsNUtmeDRyQjhzN2hk?=
 =?utf-8?B?S3FPRW93UHVEaGIyRzdFVmlBUFhBa0I4bG90dUVCRExoQUhTOVZNR1pvSmgv?=
 =?utf-8?B?SkpoR1RCaUxvK1BKRHByYlJKYVV6eHZGUnhHeFRYRGZTOS80Y0RKbUtDY25K?=
 =?utf-8?B?Rkpyc0NqK2FWZnlURTZFT2NDcFlGQ2pjNWZyRU42c1NEV0JpRmJLaDE0TUlX?=
 =?utf-8?B?VkNFTUdhRDF3YWhaTkUzVTY0T29ENnhnNlFxZkNic3VtS3NpRUxPQk0vYnhD?=
 =?utf-8?B?ZTlTc0JZUm51dWdvY2dOZm9mWVZ6bmVTV2FaU3ZKY3pDWWxvOUNUelR6N3Iw?=
 =?utf-8?B?cUhQMkE3N3JmcUl5UnFGN3BDLzl4azNHNytwMXVuMVZTbWN0MGZ6L1doSFU5?=
 =?utf-8?B?U1BWZGNqNUNjNmxPSUdhYnFyQzBnazh2N1BIOHBIaUpSbUNWVlh6d1F0Zy81?=
 =?utf-8?B?Y2FZc2xLQVZES3dTNW13STZkUTluSGcvT1dOaHRQYWFOdFd6UkZWbERNR3J0?=
 =?utf-8?B?dWFDamhaN3Jxc3JRUlQ4amlRZTBmYW50TzZXaTN4ditJVHhWMmFZRTlLakh6?=
 =?utf-8?B?RTVNVlpnVllad0VqRWhCbjZJZXAySHF2aDl2ZnY4QzVmMGU1Y21RQVBKSkVN?=
 =?utf-8?B?Y015UkgwSTUwVy82OG9MRUVrcDA4VmRYSDViUlNaWjZHUWtrbGhubEhhTGF0?=
 =?utf-8?B?VTFQNFgvSTV5aVA5UUpETXRDaU9RREc5R0xYQjhvM1Z2WHJyMEZtMVVKdndr?=
 =?utf-8?B?b3BlT1lobEYwNlJlRzUrYUw2dS9odExHSmFJNTdCMXdxT3FvVk8rdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a1fb316-7d7d-4f83-5ee8-08df130d1ae6
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 09:38:31.8410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VLzzQ2Qsx8HxxwardX95HnHfWqVnl0HG/sihhjG5MVaH034jdwusPn6VeG9Fb2zkxhyrjy8DcytHJKs6IrNNYDka7S9NRjtIhGR5EbjgPAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4989
X-purgate-ID: tlsNG-33051d/1789465116-77AC44E9-F13AC87C/0/0
X-purgate-type: clean
X-purgate-size: 790

On 15/09/2026 10:06 am, Baptiste Le Duc wrote:
> b4[1] is a convenient tool for mail-based contribution. A config file[2]
> tracked in the tree lets the project ship a few defaults that match the Xen
> patch submission rules.
>
> This aims to help new contributors who have never used a mailing list avoid
> mistakes when sending their patch series.
>
> The tree has no scripts/checkpatch.pl or equivalent, so there is nothing
> for b4 to run per patch. Disable the needs-checking pre-flight check so a
> series can be sent without first running b4 prep --check.
>
> [1] https://pypi.org/project/b4/
> [2] https://b4.docs.kernel.org/en/latest/config.html
>
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

