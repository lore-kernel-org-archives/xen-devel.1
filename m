Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973F0606D807
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 10:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=NuP6nZ67
Received: from list by lists.xenproject.org with outflank-mailman.1474358.1681483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOuaO-0005DV-IG; Thu, 05 Nov 2026 10:20:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474358.1681483; Thu, 05 Nov 2026 10:20:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOuaO-0005DO-Eq; Thu, 05 Nov 2026 10:20:48 +0000
Received: by outflank-mailman (input) for mailman id 1474358;
 Thu, 05 Nov 2026 10:20:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xOuaN-0005DH-BU
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 10:20:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOuaM-00HMk8-6M
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 11:20:46 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aec587b-2eae-0a2a0a5409dd-0a2a4504abfe-22
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 11:20:46 +0100
Received: from [52.101.46.51]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aec587b-b57f-0a2a45040019-34652e3348f9-4
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 11:20:45 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA6PR03MB7951.namprd03.prod.outlook.com (2603:10b6:806:42d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 10:20:42 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 10:20:42 +0000
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
 b=eCj5EWw9qwBV4biUOzcY3y36a0ONuvmKTGQ9Ixca8YtxclJQA/mkyTAP3bUgUJ5JX3w/rwXypyqR1rYhTkjH4Yvz0ZWbT81XgOZnvVnVeuEzeQohq9wKoBGeCXmzfq8mCitcO6mYsIEX3r8pwR082dgvseRXsygjp79+DjTy5xcZi154zYnvQWz6p/74cUgjZqo8YKmcB9C7eIroIIiXkjuFfGsCfeMVOy8tkbzFx1xSivscUJDzJ9LHF7Ai1Fx2d9wBfNbSwclCrZkxlgMprAvy9ZWhKeFINPyjgFhH62bkcSF1nQAL4Otymo946pDfBLSPEa6ijaSl2FdugwgBnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MHaUZTP72vG/mpo35ZYMLrnM9TQzI5dfyshwrtnVRKc=;
 b=p1vx1L/qAqvHB/O2tkNJstWc3Fi6bApmirQttPqyF9sNbrouynWOiF1iHYfkMDf3ucJsn6dyq2x/n1NeSve0TvuCCEwCxJS0zYh8VODhZzi5KxnoVTeHABI+BLwuAYyfhK2nlWfx57PirXTtjrJlaOhHfZr+i5byMncMQyoio6hXv+g8dpazE1Impj7PDRDqMfsW0QaJbrtsCU7evndoXdlIleC4/bhslwVD/Fd1E67oHdJwwH7yT870Gm2X1i/VBiBbaoVTUtg1Vj97DpBV0S1a1aVYy4MY9W9JCMWCfXIYr76tUcG8fhL+5QuGbr9YS3LijvWe2nTv9kuoZ8TdEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHaUZTP72vG/mpo35ZYMLrnM9TQzI5dfyshwrtnVRKc=;
 b=NuP6nZ67vksQp3Fp9mV63282aG0ZOtd+uamFrU86CLC2z4j4Ghs+t2y0M+5nJ/UJm96Hc8c6WC0QahtsYpJzrn/h34Sc+0gHtposGelqCzf0CPD0knEI6q+qWEhQPfHSDnLhzy3dMXVU+tF2nE/aniZ8JwUEjigQLqpkP6s4QpY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <63f7b986-b5d4-4d64-9d16-8326cb8534da@citrix.com>
Date: Thu, 5 Nov 2026 10:20:38 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jason.andryuk@amd.com,
 jbeulich@suse.com, roger@xenproject.org, teddy.astie@vates.tech,
 dmukhin@xen.org
Subject: Re: [PATCH v1 12/28] x86: apic: use APIC_EIO_ACK instead of
 open-coded 0
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-13-dmukhin@ford.com>
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
In-Reply-To: <20261105013347.719392-13-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR1P264CA0154.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:346::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA6PR03MB7951:EE_
X-MS-Office365-Filtering-Correlation-Id: f24ccd03-f5bf-4e9b-3191-08df3b26724c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|261026121527099003|11063799006|4143699003|56012099006|261022105027099003|261021123027099003|261009223027099003|261102123227099003|261021121427099003|261026140227099003|261028144727099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	pD7fbTfLRp/579Y+u07+/Za7I/pPuziyRhozDp50xlw+Kz+OdIfMe8mnNtluljF5sQpBH4AxooymB8L25M7bhIR/+bgYfMTL9AXuhLJBcXPeBALcba2BHFN2cVB1NAib3gfe//ojvLjyj8W8jjBc7oWGffSc7qvu1eKaNwml24IRuOk1oV2go0H7H6kTbGMt3P2dhIj2n3MiJNfnI19PFFhEY+vUzwWAnl7Q+ChbrMAfxlboewpZOwKLA8u+Oy4MG1TDE0p4zr0yNYnGtzG4nWiN+OUMqgQ9WqIRGHG3qh7bZQEt7JBrt6fHTU34XFaVLKyfgbgrZwn8MxKx4axE5qMMzssh6Ca7+3aGPFAKcOCs0sM5neAhqYTerAFqv9NCZaH2Vg5GRCtYswkpZi8vUYVkXOCUIAg0we0y8rMYh2UnaDLy0aVTXfMhACwPAAgdUtc6SQtFOihqUY7cIyU3lxlx435369jno1QmmYmiN7ll1Uvf0p4CVs1z0BJV2lmUi4vq2p8rE3BqQHeAvQGgBcZ/LnpddOrwdhSC4aRu7wJOG8DY5qA282ABhB7tAWI8gYVgtRKQ7urRLyRaJBa1lkEfePWSkNeJD+ZepkKuipSUWFkdh6VzQK6F+rSk1aCoHG9mBEnC3LTP1A7jwKyuetHn4UUtqzvvwUogRIcLcbo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(261026121527099003)(11063799006)(4143699003)(56012099006)(261022105027099003)(261021123027099003)(261009223027099003)(261102123227099003)(261021121427099003)(261026140227099003)(261028144727099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEsvQURxNStlSm5qRnFnOEdvb0xvK1kzelZaYWNSU0x0eTNERlN3YUc0TlJ4?=
 =?utf-8?B?L1ZiNGI4c3VYRmF0RXNnbkF5ZHpWNXA4Nm5EUTBsSTFhYjZCak9zc0VpSG9a?=
 =?utf-8?B?V2NESkI4eU01WEFxejlXQXBvZzU2dEkySnE0b3pOeVVxUHZQZ0lZQkVpZnlQ?=
 =?utf-8?B?ZUF4enB5M29BSzV6Rm52YkVKSm1KTm9GMUdVL0xUaXFtYkJVTUpxOFhIY0Vj?=
 =?utf-8?B?Z1dtcWsrL1V1ZEltbGxGbTA5aml5RmgwaUp2RHBZMEtNblg1aDh4THYwNHA2?=
 =?utf-8?B?SlRRUFBKMzRwK2REdkRGK1VLTGo4UStFckRlMTZDSDRYS2Z5N08ySk9qaThL?=
 =?utf-8?B?Q1FjTnZBLzdWZXZVTEdkYWhHTW9CYUcrT09Dc3IrQkR6WWFnaTFXNk9oeEwz?=
 =?utf-8?B?Y0FxUTZDTk13WkxUNndJY0xGaEhpS1NFZ09jNlB0OS9XUHY0V1k0eXlJZG5S?=
 =?utf-8?B?RXg0Z2p0aTRsQ283VEtua1RYKzY5d2Y4MXFKL3VWUWlkYlRJWXZlVHcvNm9K?=
 =?utf-8?B?QmdjaHIraG4rQkFySURUMkx2dVJFZlNyL2NreXk4aHRvSGFETEw5eEYyeTNR?=
 =?utf-8?B?d0FBMktIYmh5eDk4YVNydFRTMlcxRUpIWEpzQ2xLUGVtVzFWRlpseXVpUE0r?=
 =?utf-8?B?SENHNkhjYmFzUlE3NXhLTm5vckRVbndneWJEWVU2akkxdFpKT3JCVy9MM1lL?=
 =?utf-8?B?NGNBOHRlNG5XWHpBYXNXbk1ncUMwdjNsY1BnZDZaVjZDdjE1YTcvMUxEVXZx?=
 =?utf-8?B?TXRnRDJWaHZrdDRmZUFMZjRrWk4zaTZBWWhzSGg4RVFiU0I4aXJSTzMyclR0?=
 =?utf-8?B?eWdleThUYVVnZlY2eUpkN3FudnplVXRMMStGRUxzREM0SUd1T1R1dUF3QUVQ?=
 =?utf-8?B?Ujd1aXBkNXh0TXptSHJiQUxuNktsUlFtUm9GQ2lTMUNqMlgySVc1MEx4Tmpt?=
 =?utf-8?B?TTJuRTZRZXAwMnNKS0ZJQ0loZjFUdVR4WDN0V3dsVDZqeVhxRjVlRXQ2L1VW?=
 =?utf-8?B?TmdKTyttOXVQQ292YnlQa1g0YXpCS1NMN3B0cStOREp0WlFwenpPNDVSUWV4?=
 =?utf-8?B?cmxOcVQ2dUI3L3RDamt4a1h2b3RCdzF0S2FaWnRCVXRrTUhYS0cxem1xcDFq?=
 =?utf-8?B?V1RIYXNXalpHbWQ0ZXlOdktJZGoyQU56dlB3UTNDNDVoZGZHeGk5UFl1K3h4?=
 =?utf-8?B?RWVZOVFwa2ZmWW9Md0lqNDRQOVQ1Q1pRaEVIWkxYNHJTQllsR1BvajlTWEpu?=
 =?utf-8?B?Sy9pM0xMNWNlRUp4aFQ3ZGoxVzlaSUoyU295TEF2OG1hN2xRMVFIcFVwSDM2?=
 =?utf-8?B?WHJjc2pLd01kTFRkc1hLUmVrdm9ZK0pSK1pKZ3lRQmZjbFY1Ukd4cHBCeDRP?=
 =?utf-8?B?cHdKakJrSjN3czVNNUs1Y2IyQ2pSVnQ1TnNmWGQweU9uN0psTkIxUHVTQm4w?=
 =?utf-8?B?dUduaWJjVUpDVkVvTExrUWxlWUJVL2ZHUWZoL2NpVDFQTnQxTE1SSC9ZRXJK?=
 =?utf-8?B?WFlzUm91aGFiOGJKbzJZMnRtbUR1cFRDYk5wUnVMcCtPK2tySlFqcGJ5S1Yr?=
 =?utf-8?B?YzgvV1Vtd3Bub3h0RWtBcEZFZHRaSFI3bjV5dlNOVXlkUWZaMnZ5OEdmbDI4?=
 =?utf-8?B?SHZ6bzdIZjBSeDVzM09zRkh1OFVRNEY3Nkx3d2kzMFRFSG1MMkxYQnROL0NW?=
 =?utf-8?B?ZXpvNTJaTUpJNHRhRmkrMVdnRlRaZUt1ZlFRaktKWitlVElMVzBMMHhPMEpY?=
 =?utf-8?B?Wnc1RUNZbWxTb1ZTdkU5Y2hQRnNNTXZYT095R09oRER5Z2RzeS9DQTUwS1VJ?=
 =?utf-8?B?OXVUcmVNZzNQd0IrMWd1OE1FMzU4djkydUV1dHVjVk1CUkxnN1JUWjl0WG1F?=
 =?utf-8?B?bXRLQXgzS0xCZ0g1SmFCYzExTVRRUUZqVEYvS1FleTRpWVBwN3kzeitFeURV?=
 =?utf-8?B?UWcwM2JDeWdtZ1VCamF0WDREU0owZU5rNmJzeTlCNU5KTmNRY0pQNnhYVW9y?=
 =?utf-8?B?VTRKSCt1VWp1OTJuMnNXZlpBb0dXZVU3elpGM3VYSXpDMld5Q2h1TGFXa3Nr?=
 =?utf-8?B?WWp1eGhBWktMbkJvcS94b2I2L3YzdzBSY2lHZ3hrbUtLaVdBM2RPRXRPRjUy?=
 =?utf-8?B?MEJSQUxTMGJ4b3BLUFQ5QWY1dnRCOEZ3L0QvV0twQlhVYStCdU50YW1yd2pq?=
 =?utf-8?B?NEw4bytMVDJROXBPc3puMkNFaENxVzNOdDByQVFXdXU0MUFHMjE1NlFNSzB1?=
 =?utf-8?B?RXpUdmZpK1lURjBmOUVwVlJRQkI4c3lveTk2Tzdwalo3bXk2NDVucWI1Uzgv?=
 =?utf-8?B?N2RKVjZ3L2d5M2xlU1I5UElFYm1HaUsrQmZyelVUaUUwYUdta2k5REQvTW5n?=
 =?utf-8?Q?bvQPT7l2s37oxXvk=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f24ccd03-f5bf-4e9b-3191-08df3b26724c
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 10:20:42.3065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GKDJ3HlnDhax/1DoTHaha00ID0+aiHivvCMbhnoTKjMtfznNTjzXJUNfO4DqpKX5Vao5UWQrZVEMKezuT/kDIZlPryJ9XFKRpJt8lV9n99w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7951
X-purgate-ID: tlsNG-ebf023/1793874046-534C3B50-CBA009D4/0/0
X-purgate-type: clean
X-purgate-size: 1782
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 05/11/2026 1:33 am, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com>
>
> Use the symbolic value in ack_APIC_irq() instead of open-coded 0.
>
> Also, correct the EIO -> EOI typo in the constant name.
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  xen/arch/x86/include/asm/apic.h    | 3 +--
>  xen/arch/x86/include/asm/apicdef.h | 2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/xen/arch/x86/include/asm/apic.h b/xen/arch/x86/include/asm/apic.h
> index f30d57ad22c5..a4f6d2c26ce1 100644
> --- a/xen/arch/x86/include/asm/apic.h
> +++ b/xen/arch/x86/include/asm/apic.h
> @@ -155,8 +155,7 @@ void apic_wait_icr_idle(void);
>  
>  static inline void ack_APIC_irq(void)
>  {
> -	/* Docs say use 0 for future compatibility */
> -	apic_write(APIC_EOI, 0);
> +	apic_write(APIC_EOI, APIC_EOI_ACK);
>  }
>  
>  extern int get_maxlvt(void);
> diff --git a/xen/arch/x86/include/asm/apicdef.h b/xen/arch/x86/include/asm/apicdef.h
> index 112c1dc613a1..d3dc7b1d7643 100644
> --- a/xen/arch/x86/include/asm/apicdef.h
> +++ b/xen/arch/x86/include/asm/apicdef.h
> @@ -25,7 +25,7 @@
>  #define			APIC_ARBPRI_MASK	0xFF
>  #define		APIC_PROCPRI	0xA0
>  #define		APIC_EOI	0xB0
> -#define			APIC_EIO_ACK		0x0		/* Write this to the EOI register */
> +#define			APIC_EOI_ACK		0x0		/* Docs say use 0 for future compatibility */
>  #define		APIC_RRR	0xC0
>  #define		APIC_LDR	0xD0
>  #define			APIC_LDR_MASK		(0xFFu<<24)

Honestly, I'd prefer to delete this constant rather than to make use of
it.  The typo in the name shows it's not being used at all.

AMD have a feature called Selective EOI where you can write a vector in
and have it EOI something which isn't the currently in-service one.

~Andrew

