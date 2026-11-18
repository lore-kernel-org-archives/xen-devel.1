Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9946E606A33F
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 18:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=qVPeB4Ul
Received: from list by lists.xenproject.org with outflank-mailman.1495034.1694235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTkgm-0003LW-Dv; Wed, 18 Nov 2026 18:47:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1495034.1694235; Wed, 18 Nov 2026 18:47:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTkgm-0003LP-B3; Wed, 18 Nov 2026 18:47:24 +0000
Received: by outflank-mailman (input) for mailman id 1495034;
 Wed, 18 Nov 2026 18:47:23 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xTkgk-0003KA-SH
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 18:47:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTkgk-002Kab-7y
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 19:47:22 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6afdf29a-8faa-0a2a0a5109dd-0a2a4504ba80-36
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 19:47:22 +0100
Received: from [52.101.61.26]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6afdf2b8-b57f-0a2a45040019-34653d1a115a-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 19:47:21 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV4PPFA3BB769D6.namprd03.prod.outlook.com
 (2603:10b6:40f:fc02::216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 18:46:43 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 18:46:42 +0000
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
 b=uCuK6SNFor+Yl3BO15qJbwts8FHbE8ePe0W2vNoDxSZYdyhbjs5++/Kvkb66yxhK8FaOVsIEQO5R25aATk3SqrFoQFNw2IK/7RE/3N6ZFY+o2CnoaQHn+R1fPLr0YZ1Nd8UNmVFvfbreMHjtqSrxMclqimRXxWbvZ9N8DJsxe0HeISgZsyi1Qux9+ylGUqAs1hBAILeXiUG8YPHV1m0bItygeAgeleiDz8B7W7jvk9c2V5ukYPgVxhyg+oSJ53cDuUBhRCwmMGgzqTrXM3vVaLbnC6GHlqmJYcW7ELAn+i3iWp88QUDVsrUcwZXpLSBlJHseol8fXUsPyOEP+Q18Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXFFS35vsdB7E55U0YgeCudkymZ4t2S34JB2RhadpKI=;
 b=jhc9XFpJDAfdFJnbOjLK0FP/G3UvCP9jHVi22n580vL0wims+zDGt1HvfvXEghR9iYC7XsZ8I+ebjzqr0S31eLzvjTPVssp+BMAQe0ZnhL57Xu/56Y6wi5dOV64bTe9yJqyQEw3kf1LY1oNgicVrq5PIWawdj5kfVooKjY7RgezRyEPV5Xpv0tKR8HTgEV4O0GQqlFGWMJGdFiSqBq1BIXAtw0fv1hcM+ux2csKxh12uOYXhibTt877j6PcXmZopBVjcCGGo3CeLOVDL59XcIZ0qXN9fUAsGO9OI6msMKhavRaY2NEo8CHxAmTV9BVo0B1XRaBxztenZdtf1Jbo8+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXFFS35vsdB7E55U0YgeCudkymZ4t2S34JB2RhadpKI=;
 b=qVPeB4UlquWset3S/gxbwTPP+IAqFPpOKaayjtzeYDSdBzJTc/mMW5KqI3g3ZYyXWGj1DVSitAm/uvi9QWqjHHTOb2stVdyHVGp01Gb0SXnlSFjVtDepB3zcYgo7nJqk5j99Qmt1xoHmclRI8PsQ9k6jliosf6ry2XWi4Z2E+BQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <01fbbdff-ae80-4d83-b3ec-1cb290845939@citrix.com>
Date: Wed, 18 Nov 2026 18:46:39 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 2/5] x86/mtrr: Address MISRA C Rules 5.3, 8.3 and 8.4
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20261118171758.1125066-1-alejandro.garciavallejo@amd.com>
 <20261118171758.1125066-3-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20261118171758.1125066-3-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0039.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV4PPFA3BB769D6:EE_
X-MS-Office365-Filtering-Correlation-Id: aa38b38a-4223-494b-59b2-08df45a449f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|261026140227099003|4143699003|11063799006|56012099006|261026121527099003|261022105027099003|261028144727099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xmKlMxBV2Y97gcq01dilWw9YjziaYD9N+UKOBR/mM0vX12HTQKbJPvPZClPN7HzaRUUrbDITN0QEtBpmvUcyAfku00Ir+dgxYhe+onfjp4hPfCSL5GCo3wubwCS2KOA+7WhLSClrClcPwztRgxcY9VRAPPMGKm9aUM6Azz6iutP9LKDR8h8YEeUq8BRK0xcQQt4lp35dNPdwysazwgiXXUxvMurm/KPK4xOkRykXD6pP1vx2opiINj071Azp4h05hTpbVEf4hq59co/nNFJNFGtJmDKeAO0mrSlfzxnHR5l/1QJbn3cpbdZRcsCbEiX50jvbXywVJU1iOjrytQYAxPQ31CPItQavbomJiTz2RTVkCtRdGCf40pSKOEjDuFS9cF7HQO3L4XI7cOnQeslGJuaQy7NQVD4ZvasrQcjakpZzOu/pZg1bl79YyK19+7YK0XmZdVA1F0l1EJNZfbs/4U2Y+wwMkUhOq+bi4RDNF77LyC24oDESyT2LouJdjfHGL319JFNHqZUFuxQoBQzTfld3503z41+1+Bq86j6zk+EiytNK6im5CnLRwakWRvZfC+yL44l6gqkb48J61anUB0kWhsrd/Z8jTsLFra/xcM0ZE/m2c/EFg6ALx0xnr1Eixez3iSS2x5wZeJkpouo5n+53W5g2c6l5it0TYtsMaCg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(261026140227099003)(4143699003)(11063799006)(56012099006)(261026121527099003)(261022105027099003)(261028144727099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHdCWGVSYUpkUkJZaUJycytMb1lkYmg0WGVhcWcrZHNQeW0rRFE3dm9nODFk?=
 =?utf-8?B?RFliQmI5SlR0NWpnYXNodDNOZ2JKRThqL1p3K3NiQ2lCUWZQbmFjZnRkanFW?=
 =?utf-8?B?TlNDWkZzMUZLM1VYL2t6OTkyK3ZMTWpEVjkxWVh3TXpZcDRkTE5ZMmQrM1lJ?=
 =?utf-8?B?UmlzYnRGeUUrc1RoRG54U0kyMHA1bnYyK0xlWStYRVFpVGhpaW1keXdNdjVX?=
 =?utf-8?B?a3FKc2ZKdkd0OXlET3JYUFBQeUhoWEhBcURJU0VjbjJ6SGp0NjY1VFhYcXZJ?=
 =?utf-8?B?UWU2aWROd1Y2YUIzRU4wcWtDZmZpU1JsQVNrUGoxdXRPVk9aS1Rpcm9nZGVM?=
 =?utf-8?B?T0k4b0g0dW94SXRqU2srTHFqMStiQ1pVYXI3TFRHQlhCR0lUcDVBMzBFVXZw?=
 =?utf-8?B?WGN5ejNGaWRNbllpalQ5cEZNcFdkVU1lY3Z2RmJreHU3ZzRIV2JPYjZpVXRP?=
 =?utf-8?B?aXZMQW5UNjV1OUVKTk1NeDU3UGYxRnZ5UzB0TlRpZ2JSelVoUVo1YURMY0Rp?=
 =?utf-8?B?OHhkU2hmdzZiU1ZtdFFONm0wVncvWHNNL1o3OEl0RWErZ3RnWU5TaTM5M0kv?=
 =?utf-8?B?ZTZJb082MTBMbmVDTmR0dDJGV3A2TElYMW1kNDNrUmtDcXpIdWFsWjVmdUE4?=
 =?utf-8?B?NTRXU25tQXY5ZDA0eGhDa1JvK1NiZ3pJTmp4NHBuMFQ0ZlkwVjdxM2xJek9q?=
 =?utf-8?B?cHZCTnBLNXVrUmtRSUNKZlpYcEZ5T0JjTjQwTU9IQXNIWllhRWt4WHI0d2Uz?=
 =?utf-8?B?YitPYlJTM0Z5UEpDVlh3blBwbko2YmZ3Nk9YcDR3ZzhNZ0J2Y1VHMDM0Skds?=
 =?utf-8?B?bFo4aEE0akhaT0pZYnRTL0lZTlQwMU1oSWtVa0ZCS0p6UmRTc3FpcEd4dFlE?=
 =?utf-8?B?WTI5SlF2QU93eERqNGlvUDU5VXpWQ0xFVm11TmhTTjdPVnoyaGV1dS9KQTAr?=
 =?utf-8?B?bXR0bnZyVHlvWFE3OGl6d05wcnRMV2VURzg2Qmprd0NiQlNrUHJxRmdpQmc5?=
 =?utf-8?B?d0hKNnJXSzFFNlVnTTJSc1Y0bnZVUFFMQmFuSEtVdDlKUWs2NGIzb1J1RkRX?=
 =?utf-8?B?K1Zxblo0QTEyUTVQSU9MOG51ZXNrS1NKazQxd3ZocXlPNkhXVjd5dHBDYVJj?=
 =?utf-8?B?UWZLbDBKZEdXcTV3ckRXVnhMSHkxVVh0RTlhaVIwZGU4R0QyZ2Y4Y1dLaE5W?=
 =?utf-8?B?cVN5VDJObVJFdEJJQmdpQzlyMHRQODNKdW82TzFUWUdKM0lXTHZqOGlnay9i?=
 =?utf-8?B?SzlpMkxaaXNFQXpwQlorY2NrVlplZXJXaUNUT0RQN2tvRU1KbFdlelJSeDND?=
 =?utf-8?B?MlFLU0pWYzhjM2NGbnZ4RFA0dEFBM1NSUWtEMmJMa05wMy9OODdFZk51UkVC?=
 =?utf-8?B?dU5wTWh1dUFQWW82c0FRY05YQTNZQTgwdFlKenhsU3lJUTZTRXNmeENZUzdO?=
 =?utf-8?B?dU5kT0N1YlJpOVg3djhkZm52MzQySVluaHJ3QkJldW1wNlJYSHdXSzhSTVEr?=
 =?utf-8?B?VEQ0MTc1YXhldWJpNC9QeUNUdzhvbnBLam5wdXBDNFZFMTdEYWMvNW1EK25R?=
 =?utf-8?B?OXNwUnduT2Q1MEZpaGVCZWUwdUZYV0M3MWsxcGRsZ2tnQU01SmtzUXRrYlA3?=
 =?utf-8?B?RHFJdFFVaERITUxxTUhqOTdVSXprWEZnTkh0b2hVN0V3TXUwM3lOMXlWb0Zx?=
 =?utf-8?B?OUdzOCtvMmhzSTNqTS9CeTR6ekpiQUpoRjhlN2k5Tnh4WW1SYTh0ZGRhK1J4?=
 =?utf-8?B?cmpucm9WV0xob0RVOHpOWVdHeTZaaG9mWmtEc1RueHEzbVVqaUNBMlpVRHcv?=
 =?utf-8?B?VFdLQTRrUTl5U1hqTUhZRGdkU08ydmVvQjdpZFZJdEs0OW5yU1djSUFBL1B2?=
 =?utf-8?B?eWxPOG1WNUJXbHgrZ3J0ZXFpNkRGR2FSR3hZQ2MyR3NRRm1tdUhLbEM3NGNO?=
 =?utf-8?B?bThyMjBQVzBUKzd1VFBFU3lzRUNZYWRkVGJjbWtGb0ExTDFIUW4vR0V3ekRa?=
 =?utf-8?B?N0RTaGk5RTF3d1F2SFF6L1FJVnhMM2N5Lzc0UVdIazlKc1J5bGxlYm5OMEVa?=
 =?utf-8?B?clJYclBDWTg2cEQ2TnJpOEtSOHBZQi9IMTUycktTSDdTbGplbDVSaTcrYkxB?=
 =?utf-8?B?WGdVTi9pQkVrY25JTms0NkcrczAvMWN6anlVZVJnYjZWaGJxdG1hMjNvK1Yr?=
 =?utf-8?B?ZVdldk5wT0dUYXVUT2xnOFFWRFpmVjZaaDJ1cjl4VGZwK2k2SVdqZytQQ09V?=
 =?utf-8?B?RG51NlBrZld0dnRQaGlJSndLK2hmaDFhSTZvK1VvNUhRWGFxWm9UcUFjdXMr?=
 =?utf-8?B?Unk2bmJ2UW1Db1BtekRHQWh6VVJsamhnOVBuMXVLUTh0djQ5U2dnTTUza3ZF?=
 =?utf-8?Q?LSk2Uz8KOHmSCmW0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa38b38a-4223-494b-59b2-08df45a449f2
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 18:46:42.9237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w64/5UzwQHyCF8LLPNXZjxUPaORrwH4czUrvf1+LgoL7keA0X8iVLtaPJ0Eko7Dd7YYbTyEQH7xCdSFhN6wV1q8gT4iIxEjcT+9jc7/Jiy4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PPFA3BB769D6
X-purgate-ID: tlsNG-ebf023/1795027642-538C1B50-D9387D91/0/0
X-purgate-type: clean
X-purgate-size: 581
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 18/11/2026 5:17 pm, Alejandro Vallejo wrote:
> diff --git a/xen/arch/x86/cpu/mtrr/main.c b/xen/arch/x86/cpu/mtrr/main.c
> index eff0500f0d..e49ac1b508 100644
> --- a/xen/arch/x86/cpu/mtrr/main.c
> +++ b/xen/arch/x86/cpu/mtrr/main.c
> @@ -50,9 +50,9 @@
>  #define	get_cpu()	smp_processor_id()
>  #define put_cpu()	do {} while(0)
>  
> -u32 __read_mostly num_var_ranges = 0;
> +unsigned int __read_mostly num_var_ranges = 0;

As you're editing the line anyway, the = 0 can be dropped.  Can be fixed
on commit.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

