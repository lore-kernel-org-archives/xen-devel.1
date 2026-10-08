Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E3ACA6017
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 22:25:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443896.1661018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEwXY-0000v1-T7; Thu, 08 Oct 2026 22:24:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443896.1661018; Thu, 08 Oct 2026 22:24:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEwXY-0000uu-Q7; Thu, 08 Oct 2026 22:24:40 +0000
Received: by outflank-mailman (input) for mailman id 1443896;
 Thu, 08 Oct 2026 22:24:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xEwXY-0000uo-4X
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 22:24:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEwXX-002TsI-EK
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 00:24:39 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ac817fd-bab6-0a2a0a5309dd-0a2a450ab848-12
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 00:24:39 +0200
Received: from [52.101.43.35]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ac8181a-f2d2-0a2a450a0019-34652b23af54-3
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 00:24:28 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DSM1PFC01C1A90F.namprd03.prod.outlook.com (2603:10b6:f:fc02::557)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 22:24:24 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 22:24:23 +0000
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
 b=d0FhqAY/6UpxYIptU0FZbhlLuJfcEtDgWCdU9lTzFX+uPad3ngD7JF67I+6AAAsPvcifbBn6UwEjBJ0cAsn7iP/8LsHzBlB0RaMXD2C9sWPbAhNIb9C4ejxI940VxKrIIWPIZkFM/NhhRPikUJtvA8mGt3wux2Fz1GSGBLZkyJ6O0dLUaRa2SV9i5z6FUu9e/yjEzeHXm0hPo7l7Bn2rwWytKdBoRblBpiEPAGddxYhK3R8ndv8ccBdCs4WqODS+kD3BXAdQkKQCjU8L+94a+PMO7SUwOVYWvLvQ6cD2TxS7vLaixBF1Al/I2nfUg5LibzvjvnnOvAQ5UYa0n7ir8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pCxmB9xXZ17+QIHJjnwcnU9NS8Cm6QIPEn6kWj5V/k=;
 b=OsAatPyPlej6BFDWNehBvV5pqTVgYyTmbgdxHTTBwKu25HWmX5MIFl64xIqg8ArNN2FZ/qQDaTBwyfp8d9hs+tmuY1Orndd6XUgFrRWCL4cQy6dZRrtZvRpJ0jFTVtcXLunDJ8Dd9QIgGvip+hf5SHJltjbtYpz0C3e2XUghjh3njHr7nxzw5hc/9iZikpW7LXpf8QzC290Nd49U6V+HHviJUmpBGbL1v7/RE8+e2ZMJl5E9BcWtbZVoSCWTcppVLgbx/3+OmHbo3AJQb9AMC24ZjClXSgH/q2PIomrrvZk9k0osSK0Bka5ILaVF1QosoWCShqvOEpT0shQTX+jP+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6pCxmB9xXZ17+QIHJjnwcnU9NS8Cm6QIPEn6kWj5V/k=;
 b=Z+5eFd6xKxBZq8XkIbpnX+19RYrFa3ldTwnsC5dG1CS+apm2IDLuKn98Vz32ld/SVGjQk5wZl6p9CNtKOAl29xWK94E0l4uEy8Dd/5gmOsjTkmVHspkM4fwVP7nVVEetSEUWtqIPMBmp5Xq9UuJpMtjJ95Q9ngUqpX+PohhB6jc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1710db3c-049d-40d4-bb49-2dba34609c77@citrix.com>
Date: Thu, 8 Oct 2026 23:24:20 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v3 01/18] x86/PoD: map one page at a time in
 p2m_pod_zero_check()
To: George Dunlap <gwd@xenproject.org>
References: <20261007104051.48841-1-gwd@xenproject.org>
 <20261007104051.48841-2-gwd@xenproject.org>
 <cb2a5856-e3de-4ea6-8a3a-00f2999eef92@citrix.com>
 <CAFLBxZa9CH6AT=cVLPrcqe2X1WkWFkUXP+acLvRMMKkX+Ry-TQ@mail.gmail.com>
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
In-Reply-To: <CAFLBxZa9CH6AT=cVLPrcqe2X1WkWFkUXP+acLvRMMKkX+Ry-TQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0510.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DSM1PFC01C1A90F:EE_
X-MS-Office365-Filtering-Correlation-Id: 854a6ff4-653c-4003-efd6-08df258ae7ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	iS7aNpO8wa9qzeJYgwqbb178z9cYPSr8JvIBBXoXguRSkUbrWgayRgqSm680UlUx/1O14n633kNym7tZrSDrdBQJVKTSIK1lBsO5gypWUUmPQThtMhpWM5GKt2i8XshHMsKSifFUPn4Dikh20vGkOq5Iu9EJKnhEXTvQQ5JBXGo3u3UwsuM3stX/uHt7mYu0nx5tOqwb2GR256p2FbNPlC+WyajxlqTwBbrTx5iMnaBtYv/E7rATnJ5/bV6IQMoOYY7Xm0l6+962PGMLme2f6gZGlasvzfuc6ndf8K2942Cc99oEkc8Y+t0VJt2EAtSI/+gv51WwU/HIdMksGRGlomicArZwTksDcKppA1xIxLTgrcf/Lcp1T+MEN9POcJZUyGp1Ioc/ROwDo9w4RZXJrlj2gncGartYe4X/9RJF2tR7C6EUJR0HrX2NO19qFjquGqu3X89ixmOszf3akH6kcrc/nUh7962NF1ds+cKt3PiCdEyr5Am6fVonQvLrdLpyUCBZrSfrk7dkf3B8X0BTOz039wMIdww77ARB0npK5zxBCPgUoFY3iAh1iTGu5C6M6v+ocK/r/eOT7Osg7fBiJ3LJOcPwEiC+I52sDHUlJ8NvROCQLiPmB5BLoZi8JmyO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0J1YUVNU21YNm5aZktWM3pnYldQbWF5cDRVeklmNlhjakhEQWdHSDlxemFw?=
 =?utf-8?B?NndPMC8wOE5XbTI3Z1BpSXZob1FGOWJWT2RxTUVTYUprYWdyYkQ3UmVvZkFH?=
 =?utf-8?B?SHVaRUhVcS8veVJzcy9GeXBTbmQrdW5HVVRZVWxpSWlNOEUwbHdxTVFpZTd2?=
 =?utf-8?B?dnl0bXNIZWFVMVd1eVFsYkZvSDViRjRZMUxvVmhZSXpQSmpFcjUrUTJ4anly?=
 =?utf-8?B?THA1SEFVcGErdVp2THJaWkNIN1BWWXpySkdvdlo1RGwxa1FZa21lcmJqQ0Nh?=
 =?utf-8?B?YzJjajhNcE1KbGZBTlZsV0QzTkNhZHhIbkJHaTlFSXh2RHU1Njg2QXVtSjJq?=
 =?utf-8?B?NTV4RTVQa21aQTR6V3liWlQzV1JHVkV0N2wxc3B5R1NLZzVHVkd5cGt0am1M?=
 =?utf-8?B?aU1ERVoxcUdZalhId0JsZ3ZJK2ZGTk13VUp3Ym5BNFhJVEQ5U1R0U0tZdWJk?=
 =?utf-8?B?anFtQ2x3TTc1RUcrMHR0UEY0QmlsU005cWNvUG1sRWlya3d1VTAxUUZ2dUl3?=
 =?utf-8?B?c0Q2NksrZWdyOEtlRWVCK0k4S251NVpKOWk1NVRQSDR2bXMyM3N5STNJeEF0?=
 =?utf-8?B?QW9KZ0dQWlVoRGpya21iZktHM1B5QjlhWW5sS1NsRVh0VVpEQ0hsaS9odXpF?=
 =?utf-8?B?bWxSUHFrL0ZDMWJWNXQvMzAzRDdxNG4zczR1Q1d6d05aN2VvNU5CbnZvM3lR?=
 =?utf-8?B?WHg2WDk2QWwzSTJsV0lBVnBOalNJMUJTWExMQUZBZGFIYlFrY21nYmJHeEov?=
 =?utf-8?B?WWM3WjhCTnI3MmVwQkVWdjN0VStoY3Q4QkxEbmYyd2VFZmZKamlJS1M1eG5K?=
 =?utf-8?B?MERwMzAvaWN5WWluYXRaVkUzZEc0MlEwaHAxTUtqdk9CdlJPWUM2bUxIMXBC?=
 =?utf-8?B?SGFHK1FMUjhVWERSTGRYSm1sckdVTVdmUEJneFhnOHQ4elRRUXBWbVdNZFhv?=
 =?utf-8?B?dmZMUzE5NnBWWUZZMzJLQTlwQVc1V2NxS0dkeUVNUkpDTzlVV1BxRFk5MWty?=
 =?utf-8?B?RmZ6NHV3SVBwS3llT1hLSDZvWXR3d1ArMlRBMk5hblpKT1BVZ3FuNzVlNm9U?=
 =?utf-8?B?MmJBSWZHa3hlUzB4L1lCM2xpekF1ZHpyemlBY2tsa1J5VUlFWGpjTjlsSUdV?=
 =?utf-8?B?bUVCeGZUVGZaRFdRcHBUNys2b3dickNyVWxGaFBTenRQaGlIQWh0Q2tRQjE4?=
 =?utf-8?B?ZHhhRS9lUmVoQ3hHMmk1VlA2Y2xrQlZMUy8vcGYxSWFmZlBiT0ZtZlA3Rjkv?=
 =?utf-8?B?SWFTYTBJckJtRlQrdnpPZUhDTWtqaDFEdVoxQ2dleEhiMG84SGhIenpPMEda?=
 =?utf-8?B?SFIwY0Y5Zko0aVhJbkpEZ0FSNlpTaFRrNzk1OXV3WStrWExGSm5qNXIxQk1n?=
 =?utf-8?B?ZXVIdFVwdTVZM0NtZlM2elE2UUhuZkl4ejlFVS9YOGNrWm5tQkhIYkUzbG8r?=
 =?utf-8?B?a2x5cTFqdzFZYWZ0U3RhenB4Skl4U2pST0doVjdRZlhUbGlKMGpWSW1ZLzdJ?=
 =?utf-8?B?cjNrYzlJVVFuWWlybWdad01iR1hnbFpaMG5SL3ZGYmp1d2tZV041MW1nZjhN?=
 =?utf-8?B?RnkrNHdsNlZtaDExbjFvcHd5ZXlienNnbmVEa0RidUFUdFJHeTN2YmZyMXND?=
 =?utf-8?B?YitHbmszQ1k2RGN6akJDNHJwbGpUZ0pjdnNtSmE5VTNSbUpObmJmTDJ1ZUZC?=
 =?utf-8?B?a1MwNGZhZzlzcklaL0lHNFFTUVJiQldnRUlJNzVlSldSU2F3QSs3VEFhUmQz?=
 =?utf-8?B?R25vcjdnMFBhQVQ4R25MNlNvOFM0VWxMeGNuZ1huR0VycG1zbW1MZCt4OFdm?=
 =?utf-8?B?c0dLSEdMaVdSSUQ0ZkdQRW5PL3BLWERTeHZTblRxUXFWRkRHVWQ3aTBHNlZv?=
 =?utf-8?B?VjZjNjRZUGdiNmd3a3BoY3JQMUZTQzVsZ2pYN3ZwT1ZCUVpsZHBialAySUwx?=
 =?utf-8?B?Z2xnRXBDWi9rUGkvV1lab0grT01JTUJZam9HM1RPa2ZvQVBzUUJRRmZUZGxP?=
 =?utf-8?B?ZkxGQ1JTYVc0UWY4ZElTZEk1MHRSd0dnOFNSeGZtR2VxOG40eHUvYXZVUk1Z?=
 =?utf-8?B?d1ErY2dDaEVnNk5sVHlpTU4zcXZpckh3a2lGN21FOFVKbWR2ZnNha3E0dUFh?=
 =?utf-8?B?eHNiY052RjBsTVRnTmtpVEl0OEFNRFdNSUt2MVRoV2I3NXMxTlBWTHlsc3ZU?=
 =?utf-8?B?VjlOclBNTm5RclplRm8zUEhoR1REVDk0azkyNTFLdHFVMmg0ZjdML0ltR1Rw?=
 =?utf-8?B?Ry9NWDduL2dGNXgxZmtYd1Y2Q0x6a3hCUlk5UEkxZ203SW1vTDRHWFRTWkxp?=
 =?utf-8?B?WE5DaVlHaDBZOFdHQllpclMzbU45RldCWWFlNUJFVWtkVDIxUXhaQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 854a6ff4-653c-4003-efd6-08df258ae7ef
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 22:24:23.7707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ox9hG1h3xsJFTBUAN+IRf5CuI/7lvXaVn3c2fl2Say0uatp+q5m/twjcd2fbgX2vjafKbdUaGeuHgC1ehm+LdsX2Vc4LTyqSwe/SOy7FPdI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSM1PFC01C1A90F
X-purgate-ID: tlsNG-4011c0/1791498268-589C9CFC-400DA203/0/0
X-purgate-type: clean
X-purgate-size: 1856

On 08/10/2026 12:09 pm, George Dunlap wrote:
> On Wed, Oct 7, 2026 at 1:38 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> On 07/10/2026 11:40 am, George Dunlap wrote:
>>> diff --git a/xen/arch/x86/mm/p2m-pod.c b/xen/arch/x86/mm/p2m-pod.c
>>> index 4602c32cff..0b0beca15a 100644
>>> --- a/xen/arch/x86/mm/p2m-pod.c
>>> +++ b/xen/arch/x86/mm/p2m-pod.c
>>> @@ -911,7 +912,12 @@ p2m_pod_zero_check(struct p2m_domain *p2m, const gfn_t *gfns, unsigned int count
>>>      if ( paging_mode_shadow(d) )
>>>          max_ref++;
>>>
>>> -    /* First, get the gfn list, translate to mfns, and map the pages. */
>>> +    /*
>>> +     * First, get the gfn list, translate to mfns, and pick the pages to
>>> +     * check.  They are mapped one at a time below, as in
>>> +     * p2m_pod_zero_check_superpage(): a vCPU can hold only a few transient
>>> +     * mappings at once, and the p2m lookups and updates here need some too.
>>> +     */
>> Actually, I think this wants almost entirely dropping.   Yes, "and maps
>> the pages." needs editing, and should probably say "and check for being
>> a plausible candidate" or so, which was missing previously.
>>
>> The rest is a justification of why we do mapping in the same way we do
>> it generally, and not useful to have in the source code.
> Yes, sorry about the verbose comment, I forgot to go back and give
> this a more detailed review.  I'll trim back the comment.

Thanks.

>
> Re the bool array: I assumed the compiler would turn that into a
> bitmask.  That not being the case, I'll switch to bitops.

I'm not aware of any optimisation pass which could make that transform.

https://godbolt.org/z/d76qW4Tzz

GCC will convert the (1 << x) expressions into BT{,S,R} when it can see
they're all in range, but it can't turn the bool array into a bitmap.

~Andrew

