Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC44BC55162
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 15:26:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1378020.1623679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpSdm-0003jl-F5; Thu, 30 Jul 2026 15:25:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1378020.1623679; Thu, 30 Jul 2026 15:25:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpSdm-0003je-Bf; Thu, 30 Jul 2026 15:25:46 +0000
Received: by outflank-mailman (input) for mailman id 1378020;
 Thu, 30 Jul 2026 15:25:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wpSdk-0003jX-PF
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 15:25:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpSdk-000R1g-5p
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 17:25:44 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a6b6cea-2eae-0a2a0a5409dd-0a2a4503bbbe-22
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 17:25:44 +0200
Received: from [52.101.52.49]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a6b6cf6-fae8-0a2a45030019-34653431cd2b-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 17:25:43 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MW5PR03MB6907.namprd03.prod.outlook.com (2603:10b6:303:1c2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 15:25:39 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0245.012; Thu, 30 Jul 2026
 15:25:38 +0000
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
 b=rI3QYooJmyt1CLYWTdcAqRg9f8qVev8DjfzaD/f1aOsAMU7bp+TZLnSV0/rbjLRmcySGLtMXARze2eGv5V2zbTf3M11gE/2hFr0pItVejt1/GSy+amgze18Hqzb/+v+bsACgmz1OzDo9IYBTO2mSe1sh+Cd9rfobSWhHcmhPPFRQGkgILOEyKplbG1+HfMliZhYP7uw5Zz5prPge/d/CT7VTI7WDRWkD8tlcuV0ugVeZc0+0r+h0eDCoiqPSHlScY0feSQosQ5c4L8J0ftMh+BhZn5YIupD3i1bY/r3G2LVHShmrTRQPkqaFuJFeJmobPCA8HTiwoNlK0lHJT6N07Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hEbBBu7f0vlQuw/Tllw754+GezU9wzCG0Gh0oIjsTiM=;
 b=fzkA63QwEP+zv4QbwFBy02H8au9AE+gyEWiCkCKCDqBLq660UGt6UXzjC4g0Zjk1M95kb9Z+fVJNrWQ2S/Cebf4+sXiuGQwrxxLWR0r6VVlfugVf+sZyDeFWB7dPWzmrPdTWSTn0aUZ9AbDPMNMDrGISp1zUimF4+j7zhETXLVBTyQvivTpextnbrcq9Ns7XHoGFICZiCV69EfNJDm9bDKK+xUzPx6ojUHBzicQ8fukATfAZWwejMb601yPoqdsLp42Jh2nN24WTBeUlBG8ZZ+U4OYokWVD7kWtBwQRiCVyit6n4BzBWyny0Azo3qWjrHvHS6woTU+ieaFNqErKAnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hEbBBu7f0vlQuw/Tllw754+GezU9wzCG0Gh0oIjsTiM=;
 b=V+1Zb7qahhTPCAXtZy8pPd9vWO2lNpx0CB0AY2jF5bPKfaG0ZJB7E1P/4JhplZKjiJDo6l3QcpyxRaYjbcSJsHfpvAm9yCnTQym04FaJYMU9kOBM1kW76qYAojoRjLZwTpedLmfbLwzG07vHeQx2giPcXCUt489Q7ozUz1JmqRU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d360b101-0368-4f59-854b-2cb881e5d552@citrix.com>
Date: Thu, 30 Jul 2026 16:25:34 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH] Xen/gnttab: adjust two uses of sizeof()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0ddff6c4-7ec7-41a9-9417-687ca16aaafd@suse.com>
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
In-Reply-To: <0ddff6c4-7ec7-41a9-9417-687ca16aaafd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0396.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::23) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MW5PR03MB6907:EE_
X-MS-Office365-Filtering-Correlation-Id: a5737431-8046-4f5b-f682-08deee4ecf09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	C9uP1AjI+n5c2p5cnZciRsz6oxiloHpamZYqKr9sFw/rSYal7E3Ogi+07azywkbveb93xhIbZTzzlWRlR2n0DytmKa7r+ZNiM2kI+Vs7vkznt6ECyf/OBosrc23sT4horuchyDD6ywYGT8viCv5xYJ1PfAT4skfj7invWQWG9/EkXXM/56FgTVtavH+YeqiyGLevT0B21rEQ1/ZBRedt8jfkg08lRDFDxJTLczXf2ulIeIvkp/zoogtIh/R9jz3aUUtqHv4zwc0H88THWpBvSYz1KdVOUKhZLVYMi55AUnn8v4dK6om6h4lvJfI94GUlybt5K91UohpK1cIcMlfqACfHDboSBcEOPcHHVEXskv7lqWGMnWmm5MFj5AqJLGOWVaaP6eJrj9i7YxNUg63RotLhyuNP0OvUsIoLgCIwYSMX4lkVbJCgVvNkHBrFVywysb+lzYsrYK/g1XZZ/6iiqnU3HVDOjZnHUmxys6o1ce5vfW8/3eZtLLwtTkrDxj4oz1H6/UwPrl5J/yPX/WsU+buR6YmU8crN56axTpmRa8MLGbYGqGjI3X/qVnVuZcyDxqlFpl0dwLNhEYMcDDHXkt/dEBYR9mMX+ohvCPZNCbUKuk7WskWE1e31Kaa1g6X8Rv39c944qmdc6/RsLDseV8N7797seaHExsQQqR2ZDB0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVRkN3h6WWlWbDdoNndPQWxNRXNwMmVOMS9TOXFKSTNPTWc1cURtN3JJQUl5?=
 =?utf-8?B?ZzJDa095Y1RCZDEvbGtVRjM0dTdUV1BQVTZFRndCb0R5YnBqZ1J4a1gyOWhL?=
 =?utf-8?B?NGpoT1VpN3ZWVzlWWEU3ODNEMlkwSVpJMEhKdnJUTURLWjBVc2NGLzBaQ1dS?=
 =?utf-8?B?OWhya21GWFhpQTF6VGdTOG5pRGZUT1FpYTMzTXdqRDBpdDNVNVBQaXJoWlpX?=
 =?utf-8?B?Qy80c2xpT1JneVR6VWVJekUrMzJTYXVRRXg4aFprUXg0Wm43c3k2SS82Q0sv?=
 =?utf-8?B?SVE5eldIM2Y4YktZRFpWWHdGTS92UmZMblhZQnJXNHVKQWlnazY2UVZ0ajIy?=
 =?utf-8?B?NFErRnRNZC9RbnY2SkdHQ0dzWVpGSGpHb0tDK1hPZlF0Y2FqdEFGTllRTDRJ?=
 =?utf-8?B?VUE2MHh0cndJYkZYWDNuVFN1VzBUbTQwQUVrdUprZ21oNEFCU0oxZjdXbitB?=
 =?utf-8?B?SjlqZHB3aHBreFNyWHhVWnZ5UkhuZldIODFndWJMaUVCOHdSVGFQWkFIM1Bq?=
 =?utf-8?B?bE1ETGlLQ244blZENis5STV3Q0hwTXlKTEhxSDl6dFpSNHQyTGhtczBzMUtl?=
 =?utf-8?B?enVPb1FadUNmaFdycmlFaHR0UnJVVG45L2FaRy9HN3JSekxUVTgwdTRGTHNY?=
 =?utf-8?B?WFdTQXJKMSthdTdJUHB6eEhwV201ZS9SWVBVQmhmdjl0T1BUMVNHaHJ5QzlM?=
 =?utf-8?B?MUVnNXZGM1dVU09sa1U2SGR4TXNVUHlnTUNoUlF3RG5aR25PVkphN3BxOEJp?=
 =?utf-8?B?LzBqeVRkNEg4VnBXTVo3UXM2QzFpbWNJMEo5NlpmMFVxcWMxZXRFQzNGM1FS?=
 =?utf-8?B?Rkt3TEVBb2tsMnJqdU82am5GU3ArUnROZUFWNUxQeVJzS1lCUENQL0tMYXlP?=
 =?utf-8?B?b3RpQk0relM0T0dxNndRdGVFTDUxQVRmZ256ODVTNTUzNlk5L1hoVXhXSllu?=
 =?utf-8?B?alpTOUVNUTBUeEhGV0ZWM0NwY1RKOGhBbkE4WjNkOWZnc1B2WVNjRjl0VmNt?=
 =?utf-8?B?a0N4dCswVS8yM281d2JoS0JsTklLSG9lUDNBdUJWQXh5VHN2VFVyZCtDQ2JJ?=
 =?utf-8?B?bk1FOVhVYWlGK01lS3BwaUJIclp0bnQrektmczNxNnNDY1Q5UXZrbFdqWDJj?=
 =?utf-8?B?eW9FZThiN29JN2RYL3BYenZnaVRUck9Jd2FQQlp2TVhGLytOMHJ0VWJSUk1D?=
 =?utf-8?B?S0U5UzRXSWZISnRhbEV1OERNMmN4T21oTTVzdmQzNVRFV0V4SE9zNDZjS21s?=
 =?utf-8?B?bGtDUG1qeUsyMFo5Ulkyejg1V2MrT0Y5Q2ljQTl2Z0JPdHEraTVxM3hxL2xW?=
 =?utf-8?B?cEVuVjdUREZxSVNRemRvSE1iVTZONW0wWVdJcStHV0NxNkJNWFdUYnZJSEZt?=
 =?utf-8?B?WHM0STlLMllkTERWWjRwenl1NE5ua3U4amJ2OG5TUCs1MkZUWEZEQ3A3TWkz?=
 =?utf-8?B?YitUME8vQmpPSEZjdU5nT2Y5RHdHMVhhVWpOQisrN2k0b2RaYkhUeUtpdkpS?=
 =?utf-8?B?VktMUUg0dXp1OUJ3L2NhakxBaUFQTXRtQ29odU02OC9DS2xhRWFVRkJlU1Bn?=
 =?utf-8?B?aS9jVHRRTHJOa243aXArUko1cGk1dDJaM2dYY1dSYjU3Z3lncDRmMVV0TS9P?=
 =?utf-8?B?dkVtRWtZcHREWmgvOGV3Z1J6Tlp2U2E1YXY4WkgybWVVUmpWQ0o3ZzduMEE5?=
 =?utf-8?B?alF2SnRIL2R2WUNoZHdVK2Z4RmVHMzE2SldTczd2YUQ2ckoraTRiQ05CcGpk?=
 =?utf-8?B?b1R0Tmxxc0VjTDRJOGhrQzNQVEZzUWk4bkZQZjkxYmpXNmJUWUxwK0RUSnFj?=
 =?utf-8?B?dHVvRzQvcFo0Y01aZnM1bW5KMzdSRWp2dGMwajFnRS9ZNU5vamZUNFFjZHZn?=
 =?utf-8?B?LzNJUUdReUs0NFhWMWNSbEtxVG56SWFBNC9WNS9RbUJCaGpVUlFSWFhHQS9Z?=
 =?utf-8?B?Qi9ZZVVMd2hMSS9ZWVBlaXlPSmlRSEVYNHdGS1JTRU41VHhPWGtLdmRBV3pS?=
 =?utf-8?B?NytJZFFPNGlNSTN2T0VkUjZsbHFTMEVFZHZtYXVESVJQcWswWWREek5VT3hM?=
 =?utf-8?B?a0I5akxUaXh1Ymdsc1RwZWQ3L2Zxd1oybmdBa1lnYzluZlZWZEs1NTZUWDRu?=
 =?utf-8?B?R21RQjZ2aFBBTVl3NHo4OVRXdXdIY09QeFNHaU9jcVhJT1AyNXBVMlFyWWFW?=
 =?utf-8?B?QytXb2ZhcWdwRGh5djZvZnJ5eTQvdlFyalgxUDNLcWtjRnFDNjdxNHp3eEFZ?=
 =?utf-8?B?dlEyaEo1cUZMTWNqSzNUTjVoTlNTTzlzUHZZN2M0bm83ZnJOYVZJV3JaM1lw?=
 =?utf-8?B?V0QrNkFsU1Bzem5LSzc4UUc3TzRBMEZ1bGdVU29sVWRCNjZ4Tzc2S25xNTFX?=
 =?utf-8?Q?kMdZzQYHV+fiTBoo=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5737431-8046-4f5b-f682-08deee4ecf09
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 15:25:38.3270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0X6qB2DlpwvYQDJgO3AFlLozZ26Rq15xXfMU8bkstYjhPmBZBgPWMoM/MPlBeojw7hNl/cY3RXO5Yu4UwuzckdFmy0w7+Pe9Dp9ofZpT48s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6907
X-purgate-ID: tlsNG-33051d/1785425144-6EACC4E9-FB84DC43/0/0
X-purgate-type: clean
X-purgate-size: 462

On 30/07/2026 3:57 pm, Jan Beulich wrote:
> The use in gnttab_map() is latently buggy, as "frames" there is
> xen_pfn_t *, not unsigned long *.

ARM32 has 64bit xen_pfn_t's.  At least it's wrong in the safe direction.

>  Adjust the correct use in
> gnttab_map_frames_v2() as well, just to avoid the problematic pattern of
> sizeof(<type>).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

