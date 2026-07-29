Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB0AC53200
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 12:28:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375720.1622791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp3OJ-0006aa-Qa; Wed, 29 Jul 2026 12:28:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375720.1622791; Wed, 29 Jul 2026 12:28:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp3OJ-0006aT-N9; Wed, 29 Jul 2026 12:28:07 +0000
Received: by outflank-mailman (input) for mailman id 1375720;
 Wed, 29 Jul 2026 12:28:06 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wp3OI-0006YA-8U
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 12:28:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp3OH-00AGiF-LK
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 14:28:05 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a69f1cc-2eae-0a2a0a5409dd-0a2a450c8908-32
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 14:28:05 +0200
Received: from [52.101.56.12]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a69f1d4-f479-0a2a450c0019-3465380c7f5b-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 14:28:05 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA0PR03MB5449.namprd03.prod.outlook.com (2603:10b6:806:bd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 12:28:02 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0245.012; Wed, 29 Jul 2026
 12:28:02 +0000
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
 b=KTYNRDqbxRZJ+8mm6KyDkEqSmp9RA5UwpsCvXNVSjxOTabFSrSwzvJ27f+pOOohaDZApmEXCnq4puoIHeSM4Rd1eERE0pHRGqNXnEA8F8ijdsuNwuT5u2FezvEPAmz8vhrZFLpUztRNb3KlQlqXwPX0Bd4Wgf4/nhpseZ6c9JZFIml8Nc8xDdSmSg+0FWqENFeCr5hRvT6VnNQqy7F/MMDVqXIRW6g3olhsuZsti43hAvJtz6XtoZHVT38ioIPwSZAN3vByRG2BcdGpxPh2l+gT51/En09kCXuJxGU1oQwZd6LoogJuMbW1ANwYuUMaaEmokbJ6iMrU3gtzv69YL8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8Jg1zddjvyEdmIR2Mq9USX3RI00sW51UvdfTZXljSc=;
 b=u7Aqi3CT3rGeAuWl//mpu6p9OIAc+j7WAUs2yExA0FS+tkAVpl63J8mY9wbqjYFtv2MP+mU13+z8KDYiMm8k3gcpmRcWtlNGdciKRZkCHSzwwkQViSo7EJI0JkRsCB2iJAkFO/rwC2XqJa7JFdpO/B+newduqLWmHawmdEtoW/IJfBBkQRKzcATzeBhE6xZ2GhKkgnO77W0XnEzVs3igrzdp5e7h0xHjxNwdzwbwa6da6YegABRUfPR6usNjFrUmSVF2aTu5jtLfGQwoVBHzEukElr9gnJEOJMyXJJyZcNS11dHl25DOXkMBmFRb0Z16IIljDhn3/Ds2uk65XG5Rzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8Jg1zddjvyEdmIR2Mq9USX3RI00sW51UvdfTZXljSc=;
 b=WWY4gFRI1ZVzzNJCflw0dFmcQCbgDQJD+/nQkJnEBdMoGtWAGGMbKrNaO+FCxcfFmvfEzvKSIjk/hAPxG4bZCOBlWiuRUKackRARyjH9hidKKl8Cwyt8dNiCRlNcpMryYgceZ/zCCZWsimNlWwxpRa+Wvt+WaAbv42nr8G1E3Y8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e30a9ef3-bedb-42d8-b6d8-f716112ba7c1@citrix.com>
Date: Wed, 29 Jul 2026 13:27:59 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Dietmar Hahn <dietmar.hahn@fujitsu.com>
Subject: Re: [PATCH 1/2] xen/credit: fix race with schedule_cpu_rm() in
 csched_timer()
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20260729120643.327387-1-jgross@suse.com>
 <20260729120643.327387-2-jgross@suse.com>
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
In-Reply-To: <20260729120643.327387-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0312.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::20) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA0PR03MB5449:EE_
X-MS-Office365-Filtering-Correlation-Id: dba6490b-7ea2-4b68-6ece-08deed6cd554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|4143699003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gV06BtiBAvgW37hLoHongrKzWNl1lZExK4oq4WRYBeRFj8qv70eeSkiBrizx9xaCNWT6nV/PQjOm0tPzj4ZcF0u7oqsBe+qWIkyeNo4oyXauHh4/J7QBbVwV32i+LXPrgsgfPNDIo8loMzw1YGWa3wPUh4KZlqq0bcKxiNYplgW6H4/g2R0JLJr9FxljU4GlwAvOEUcwATUjcocdscePZoAM/Wnvs7OOVawHb6dTZEqD4PKdUA8W3qjWIkF4FgxjV7bwauTKzCjxTuNhDLJ3xPQeif7hV50WaN+Fa3FuPOwd/DtDkPtpPE6xeyQcRiummrLN6+GM4vB+bxPriDj55XvRb+g4WUYPgBgx2ZuPb9f13s00vxDWKsxvRnJf6XNi18tectzTxYsIJW9g93LNXpe5K/2zAHueS+yLVacuGLPFw0cl/YOKfwR1Q9d9ODkdXkw9taQbdNnsWLoifJqdM/bbn3EP/EdJaFlKkjp7eyTRBzeS+HqZaZ+5fIwMzeWMSLctvJ+HiDz+PQZLtETFO79iTniePRVxeG/7WKtLj1WHhlUZiOCK3CiFN2x/YkcCnEvNNaNiLNr/+PDwJNxJ9ethhezpV9F09diDD5BnBRvEvPTuGvMiQBjAeQTzJy88YiC9KSgt8q11t+mYTMBU0mvTeUMrhsSjAlh18eCpXGk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(4143699003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3pMNDFZbU5scFQzYXRuSzlzREI3STRSbzljRVBwMDVJN2pJQi9RdzJaVTRp?=
 =?utf-8?B?SjMvUHlYRXg4dEVZL0d5aXZ2N3RXVk10NlFWL1poUm8zWWJtZ1ZlRlN3TTUx?=
 =?utf-8?B?TzNXZEVhdE9rQThxREJsWHJ3R1N5Ty9CdU55dFlvcThMNGcxSUoxdUwyTWFm?=
 =?utf-8?B?Um1DTE8zdnduaVVZUXlsUVRRdTNEcFFCaUZRY215akpYVll0ZTZ6Ui9JSEtv?=
 =?utf-8?B?M0M5d1owQU9kUU4zKy9TN254M0VYVklNQlZ5NHhyUVdRYkxuekd4azFrRVNN?=
 =?utf-8?B?MWJxaUpJUHVnNnV4Z2JXaXpiWGN4OFA4bG9ZVWZ1RlMrUklXSWVuUFY4MWFO?=
 =?utf-8?B?cVlJNWhUQ3RJQjJxNGttRTNXSHZiUDl2VEY4YWlEa3FiN1ZvdnhhcVpqZjhZ?=
 =?utf-8?B?b2sxcHg4S25FbWxzK0ZNa1IrSEFlWEVkb1VKaTJPdFlMTVpKWndhUitxRmsx?=
 =?utf-8?B?VXFYcG80UXEzbDJxemU3S0JkNW1XNGRBUzRLWHpTYndHelJUV0ROQ1dSUWJW?=
 =?utf-8?B?Ymx4RFJ5UFBjTmpOcFU5UkdNdGtEZHQzSHBDZFQ4NXhFdW5OOWt1eTNrRCtY?=
 =?utf-8?B?dzJtQk9SeUgzSWtBeTB3ckcwZG1pSUVQdStqTmU4aFV3Mm9WWGtDeVcyNDkx?=
 =?utf-8?B?TUQ4MUFzcUpjS2cxYjRaNnJ2dGFmbzFQdkZyZTZyeXZPSlJ3OTVwenZBanNY?=
 =?utf-8?B?RmFRYWFxWElmNkJ3WXFPTVNiYUFPK2hjNnNCcGVLRENJaEFac2pKRE1acHpD?=
 =?utf-8?B?OWt2cVlMbllwU0NoZExpWmZhYzhJUGdkV1JqbDZYVGtLQlJ5dGhvRlZtVk5V?=
 =?utf-8?B?c016b3BGVGFOendKMThYUW8rT1FnZG1kOWREY0ExMVRabXhUVmxyQUo0NTJj?=
 =?utf-8?B?RUo2emg1SFRBWlVaVlo3RlZXcGFVN25vUDZibm55T01vT1A2T3R2TUpWNmU4?=
 =?utf-8?B?NFdoeTRrWGtIdlUxZWZpeXc5S3pnMCsrWWpGTUdWRWxTUVZsT1FPbVZQQ05M?=
 =?utf-8?B?SW5CWUlJaVBFOExJSHRLOHg3dTBtak9pbFpya1ExWDY4Q2hYdnlxUTZlaFJh?=
 =?utf-8?B?WVBLVDFLT29qcit2N3NlVXVSUDVSRnA2cy9LTWhwSnUrYUdyc0hkalVQR3My?=
 =?utf-8?B?RVV5UWFmTnFQVCtqNWxsSUNUNXFtdFM1T0xLVjFIazhkT0NqWlhCZk9RS1o4?=
 =?utf-8?B?YXFVTGhyUlRFbFRlYjNXRnpZc3g4S1ZUZ3UwKzd5RkowQjVpQ0tMOUg3b2Rk?=
 =?utf-8?B?ZnpXeVNFaDdmT1I1MTNxaEpBZDMrOGFJdkZGU1lreG5oTDVPV0FXc1Z5NTd0?=
 =?utf-8?B?QUpMb3cxMEp4LzJCdjdXekcyMzNjTnhVRnFXQXJFdGtjYjg4L1JkekZkOUtD?=
 =?utf-8?B?NVc2S0xuczIyQ3N3MmwxNWNJd3hyS1BjKzc4amwxMyt2eWZBMGd1SVRDUUdy?=
 =?utf-8?B?akJQYzNqbWhYNDdaaEdjYis2ajhPajMwaXlrRm1YV0ZLQjhHc0h1TUxuKzcr?=
 =?utf-8?B?aFdNbm9TSk5ZemsyMnhyaEErQXh6aC9HMU4ybW10eFdDRWxtTW9tNmUzVTVr?=
 =?utf-8?B?V21vRzl6M2FtYjIrRC8yRWNRSUxyM25TWHNTZ1BqZHc4enBwMFR4ZWlkSEpV?=
 =?utf-8?B?UlNUL3RjaVNXRWVweXNFWGFwQWUyVEJobk9RbHFMbmo4Q2Q4dWtxdVFyUXR3?=
 =?utf-8?B?MGRlbkgvZkZjdWNPVW8yWTRKM3JpbUNKd0N6dWJYd1VJS2FsVTFmRkMyT3dI?=
 =?utf-8?B?Y1FzVHVZMmxyRlo1TzRka2hBZGJsaGExc0QxUW1ZUFBuYkU3MzVWak01NVNV?=
 =?utf-8?B?YW9XaE04b250R0lyaWpTbFhJcVhxQkJRZTZWaFdsemVtUUpKQ2Vod2loVldr?=
 =?utf-8?B?d1JHbENhZFVnTndQQWlrOGY4ZnRJdVVKMWNFVldsSCtoZzJzRFRvanpqT2ZV?=
 =?utf-8?B?aDRHMlRtSkUvbk5xNVhtdVdia3pzZVdJMTFnUTE2NkovcXRjMXlZVEx6Rnc0?=
 =?utf-8?B?Wm45eENmL2U3a2xSaUx2WjZ5ZklsbXZxN3VyRytPMllSTWFIZCtWYmZOVlFI?=
 =?utf-8?B?YktGRmxhbE5jMmhqbkhhemZta2dFcGh6Rjc3UkVlSWQ4czhhYWk0N2NLSE9T?=
 =?utf-8?B?K1NPb002aXhmU3FWTXNrM0RNNVU2Qk5MdUNnL0xTRURrbVhpRW9TRE5EblpN?=
 =?utf-8?B?SXFsWjdFaDBtNUlVbVJlSUdmWkRCOFRjZit3My91dUUvMUtqWUhSamZtMEZk?=
 =?utf-8?B?czdReDcwbFpmOXJYYmxSdE9oWlZUUWhhM3Q5ZmljQmVmaklLVDJ4TUlNd3Jq?=
 =?utf-8?B?TjZ3Rno4RHA4Z2paS0FuWHlDRWhHYTJYSDhFQlVCc1lyY2E2YzkyZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dba6490b-7ea2-4b68-6ece-08deed6cd554
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 12:28:02.5141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m4EOggxaLWRNHd9YEY6zb893OgIiiJwUqRkr/sRvC0N2a2nBAl9jkqAYLg5TgUnmdXEuHeKaYLNYStFMLx5seww7zFtqRaDnnjEtB2jb/+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5449
X-purgate-ID: tlsNG-d25034/1785328085-51936A5B-8F71FA30/0/0
X-purgate-type: clean
X-purgate-size: 871

On 29/07/2026 1:06 pm, Juergen Gross wrote:
> When removing a CPU from a cpupool running the credit scheduler, a
> race might happen between schedule_cpu_rm() and csched_timer(),
> resulting in a NULL dereference.
>
> The timer associated with csched_timer() is killed only in
> csched_deinit_pdata(), which is called by schedule_cpu_rm() after
> setting the scheduler's per-cpu data to NULL AND after enabling
> interrupts again. This can result in the timer to fire before it is
> being killed,

"... the timer firing before being killed,"

>  so csched_timer() needs to test the per-cpu data to be
> set before accessing it.
>
> Fixes: 78be3dbbfefa ("cpupools [1/6]: hypervisor changes")
> Reported-by: Dietmar Hahn <dietmar.hahn@fujitsu.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>


