Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511EAC61DE2
	for <xen-devel@archiver.kernel.org>; Mon, 31 Aug 2026 09:46:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1403883.1637834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0yau-0007lX-2r; Mon, 31 Aug 2026 09:46:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1403883.1637834; Mon, 31 Aug 2026 09:46:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0yat-0007lQ-Vh; Mon, 31 Aug 2026 09:46:23 +0000
Received: by outflank-mailman (input) for mailman id 1403883;
 Mon, 31 Aug 2026 09:46:21 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x0yar-0007lK-Ni
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 09:46:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x0yaq-007oX6-0z
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 11:46:20 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a954d5b-2eae-0a2a0a5409dd-0a2a4505ae24-32
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 11:46:20 +0200
Received: from [52.101.46.11]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a954d6a-4cb1-0a2a45050019-34652e0be16b-3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 11:46:19 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB5842.namprd03.prod.outlook.com (2603:10b6:303:91::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 09:46:16 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 09:46:00 +0000
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
 b=ut1Ga3Ljy7g4HimLluYOjnLG2XXXUrwKCrnFvuxBU6UGlBt+GgmrcvX3ZpgR/hPXN8YGT+RRTfRHB9DTyIGvOzCxFJh21QORexzr3bBYosF3GpCEi8sbedpgSLKK8qIKvULlhzPOSVORWA3kb+UP0iB29hULm9LkZPmfMCycVTaPpU2YO7NtoM4H2yrimZaaO7eUkfCYFXVBKdj/WbzQbbgiZ1mCerC4RnGaDIneSHFxoN9TR72v8cKbUDkfL36+dPbPAJGVWzh0RT+JcluAFncdo/8H+hRtXmgJx/DritbmiSNoRPELRNarkTX7rpqdgNUNCpjjkwWinXKseoZYkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXh059E/wOuwuhAEW/KDaqB2oroQ8+rBHNykMN/ovBw=;
 b=g2no6gy8NdAoPUUMkPXP/huJQidf1rGb2QQMcRo6OylbOIVSzX5AJKVW2hwTQjwoN8cc/VNX6oSSbbsJWNFB+fCkFQUtjkPEEFSfEMO6cNHi0iMsHZCNZFjvQhAjH0s5ATDCQwgMjwTy59wf1JF++8IvAFdJLKbH4quR3VGnkCoP4/ZhHZN7Kr3s5azWWvqtgHUSj5AR2W8lPoV7F7BbzzZJBBWEjJgb3g2q13hsildF/JsDN8XLLUjGGsfDTreWZG1fFGgRfg9HPC3yuf0o66FbiEjrhnNFXehixbLY6CcWLfI8jWpH2lgmsJ2RCMcxawyDkkqegIWHgIM3xSB31g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXh059E/wOuwuhAEW/KDaqB2oroQ8+rBHNykMN/ovBw=;
 b=fIB9l2Mb/dtPFrwWMHUVdAfmA+l3OcdLWQj9/zwKD1cxhF1n5MNie3pJMhchtc/ZGOXC5jU06CcyF5x/mRWq7dLNhKk1CFSx3A3pc6xIpK7uIslRkBxEzPFqyNDpDVYKyb/sFtotl4KR7ESFGArI90ORqPfGWLIMjVzvo5hDI3g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <cb7418ef-4d3e-4a86-9c86-f7b0f296c013@citrix.com>
Date: Mon, 31 Aug 2026 10:45:56 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jgross@suse.com,
 jbeulich@suse.com, dfaggioli@suse.com, gwd@xenproject.org,
 roger@xenproject.org, anthony.perard@vates.tech, julien@xen.org,
 bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com,
 teddy.astie@vates.tech
Subject: Re: [PATCH v3 1/2] xen/common: add vcpus_create() and keep max_vcpus
 in sync
To: Furkan Caliskan <frn1furkan10@gmail.com>, xen-devel@lists.xenproject.org
References: <20260831051637.5029-1-frn1furkan10@gmail.com>
 <20260831051637.5029-2-frn1furkan10@gmail.com>
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
In-Reply-To: <20260831051637.5029-2-frn1furkan10@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0525.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB5842:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bad9f60-d6fe-4999-3e5a-08df0744aa54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|7416014|4143699003|10067099003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	CgFORFYpPu7281w5Sp/idNNCjOJkmI6TpwVXvfiYUP5/v6J2gjex3A3EYgxVj7swBkQ5IuwtSaiwUPH863UqkqXw7qCSZcnCYogsfWj0mMhP1P0Viyc0BQh4pnpfGnVdm+yPzPFPDILL+OqHIHBfX7MHYrYz8h0xdQu0pvcbrVPpnda7YDkEPRpUeBhJM0XZpg1Ti/NEMKnP6QXadVC7x/2KptXDcfcvWnn2bbYnc+SwmZUHcbybqv7PppsC/Ik66jWAiEoXUzQxBq0ySqrcD4jUvCsa0Jn5bXxBBjI/iG/o/C6+jr709k23oFVx+XSMrabDGV+rbLngAYq4UPlrnNkmR5EcqRSanYdmnXRpDN7Y36qIXMAr4JaY05m/Y80fMS2n/PFvin/gqxH+dTFE4RAUQkbMDVVZ3+o1nAM9+gC+uGeq6xd0mcCXBXHBZefvpX8T30ZujZPoggxsYaHVA62Ys/VU96yinM+O4wXCe65m0ZozU7KfDChSNBmaMpXRMh86ZJOpHRjI1ckNmCV3MYA7EPpMFq4Dv1ehqD3bHdGRAnhhi2DPg32g/TrJbag5cEKdHa6OMdrJok2TbO3c/MEdIXPbIv0Tb/4ueWhrgu+U4Fwqt/5pr/ud3RtBR3I3dyUQfFciXg01Fj//Wy0l4QUzPbASenUufFVJsMC0voA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(7416014)(4143699003)(10067099003)(11063799006)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVA1d0hqcUE5WHJ6QWhFeW5uSzdNQVRPZ2NDWlg4WnY0OENDM1FwM0t2cFdK?=
 =?utf-8?B?T3FBZ1FFWkRsaGc2VDJKaHdUNjhwaVVGdVBtNG5ISW5LaUlHamExWVMyMi9H?=
 =?utf-8?B?bmdjVVZTMnk4WkVmQmxVQ3hNcWZTV0hYVjl4UDIxdVVDeVFadHlBSHUzNnpO?=
 =?utf-8?B?QXArTDh1K3FIVElLK1NESy83SVZmVDBnYmEycjRGSGFwaXBzbXVuenZsSjFV?=
 =?utf-8?B?Z2RsMlovRFBZT005MGZ0ZEtxZVRtbGpFLzU1VmpGYmVoS3ljVE4vTCtranJO?=
 =?utf-8?B?d3Z0VndrdDRYNUlnRWQxd1NYbmRyZEt6VHJINDRVZXBseDVBKzFGc2dUMy9v?=
 =?utf-8?B?ajVDWTJNRnZlNExQakNDNmpvSHVTOTh0QnpTeE9INFRON0Z1L0hoTnFmaDJv?=
 =?utf-8?B?TW1rU1JCbmdMYU43WFZiOTBNOUxEcU5CRW5LRG1lbzdhek95VDhFQUo2V3Vi?=
 =?utf-8?B?czduU0FldG9lYTJXQll4MEh0VDMwVU1iRFVoSTRGSkRUam1SN2owd1NRaEhw?=
 =?utf-8?B?NHlCNmMvNU0xWDNCd1BheFVreUJ3ZFptMHpyc08zNWsxc041WlAzelc3TFJ6?=
 =?utf-8?B?UFBmeVM2aXkzM0tMS2Vqb0Q0ajhScjVWZHA2MkZUbWRDYVljNEtjaDJWSWwv?=
 =?utf-8?B?eFpSUUhNcXUrZ1BpbWs2ZWhUdUZvYXREZldFSm5oS2JYWWJCZFMxTE55YUtC?=
 =?utf-8?B?WVZibDczM1REbmZNZmxrNVg5cm43VW1raHBkU0t1aVkvNXVKdWg2QlN2R1p3?=
 =?utf-8?B?NTNlOVU5ZklNcXZFV3B1YW1RMFVQNFdlQnpIME8wM2RHbEp6VVRUaVljeDRX?=
 =?utf-8?B?S1dTK1JQbjdxR2o4aVJhWmN6NCtTdTBHWENNK3Z4ZXJLVW5WUWRzbFluMXpG?=
 =?utf-8?B?eFhjMFpUbFU0dkdQU09Vb0l2OEhuUHBuS3pFWEkxcjZyQmZ3WjJxd205TDcr?=
 =?utf-8?B?RlIzZ0p5RGw5cEtLanhGWTNYcnpPTWZvZEZFaXBHWDZTNFMzS3NIMGQwWmhV?=
 =?utf-8?B?eWExU0tOa21wTmZjeVBqTzZLRHorWDluNHB3bE9lenRZL3lUQzgwZUlvRURn?=
 =?utf-8?B?MGt5cWxvemxXVXg0VXgwSkEzK1hTdHZzYXljelpnRTlWaE81N1dEM3VCTVVQ?=
 =?utf-8?B?RjFqRGNDV3ZOQ2pqU0RZRzkrVXoyZHRKWDZ2NkdvaWkwSkxKNEw5d09nR3hS?=
 =?utf-8?B?dlo1cWVSV2VOWGlsbU1PWWFHRGpNVlZkb3dZWXJEeFRiMFlLNm03RmRGUXlt?=
 =?utf-8?B?TkJ6UUpTTzh3WUw4N2lSYW1tRk5qMys5M1FHZEh3RTFMVytkckRuc0dxYUI0?=
 =?utf-8?B?QU5GU3hEbFozR3RQUlhqcnJzd3ovRmdkM0pzbzNUNHhSc3YvblA4U0dIT0U2?=
 =?utf-8?B?eUFxd0dHRmd2ZC80NkVvSFBBMEYxbUl5NVhsQVJFdTJKSktIbEQ4SEJvbWc1?=
 =?utf-8?B?RDczaTVNTmZDWFBHN09zRkxZajdJaG5LR1V4dVA0S0dxTUJqQmxUcC84ZWJ5?=
 =?utf-8?B?cy9EZzYxUy9VRFFHdG11Q1V2ZUMzMVpFNThscmVQRVhZR0hJdGJuTGNkMDFI?=
 =?utf-8?B?a3dROElMTlNEb1N6WVFjZGlRRzEyT1dYM2Uva2dPanBQWkphR1hoUzFRekNM?=
 =?utf-8?B?M0k1TUtmRm1hSC9ObkwzM2dQVVRzUHFQMjN0VERFU004Q1pjV0dCS1VVc1Js?=
 =?utf-8?B?NTlqVTgxdU9za0I1dnY0dHRsNE5VcWFMWkRpMDVTamtDbEN3Q2c1bmp3dGNC?=
 =?utf-8?B?WHdUNFRmL1RLMDBlTVJYayszb3ZlcVNWcWZVeTYzSW1JVXlvVWZoSGZueUZ6?=
 =?utf-8?B?L2NJdjVxeC8rMVl2enAwdzR5ZGVqNlNsU0JWRnZnbGVzeUdacmJzS3FvTTF6?=
 =?utf-8?B?c2ZTWG8vcWZJQVUxQzZ6ZWhFV2l2L0VjMllrd0hURGFmMVlkYVpSYWNFUGhr?=
 =?utf-8?B?ZVlYR0djby9LUVJwNWZQQTU5VUpzdm9tckNDV0JQZ0EwNldhNFhldmJsRHg1?=
 =?utf-8?B?WjErdGhaSVBOdzJxdjJabVljWTBGUXQwcnVRUGQrT3EvWkhxZ1JaWXVtZEdq?=
 =?utf-8?B?Q0dDZUErWnhDZ1lQNkNlU0ErVFJIRzE0NzlHTU5hSVdZaU5HakJhUmhjakhv?=
 =?utf-8?B?alhIeEpwckxiVFVTTUJVVG1tS0VvclRBV0JFMi95eTQvZzhhdjVQdGJuOGZx?=
 =?utf-8?B?UlJqMDhhbm5xSDVvWG5uVEtjMFZMUlFrdElacE5NaFJLS251dmV0YkdOYUV4?=
 =?utf-8?B?VDJ4VUp3V3RQc01BWnVJaEFkcTUwTlJIQlVLQzVkcFVoUDAyY2kzRWp0MHVz?=
 =?utf-8?B?YjhLRnJWbUdLblZvZGhVNmhpbjdiQVQ2dks4ZW1NWTNEejkwUGtDZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bad9f60-d6fe-4999-3e5a-08df0744aa54
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 09:46:00.7575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YRszXbmMFqJU1Nuxh7Vjw5ZZ2JIUgnHn0rujQCBU/fOBztqLxAQQa+sjCUrxiPvQpZmnN2ve7E2V1duLDpQrZcGHTyy0Jp03XfnrqruX1vI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5842
X-purgate-ID: tlsNG-c201ff/1788169579-73EB92A1-38D5513B/0/0
X-purgate-type: clean
X-purgate-size: 2114

On 31/08/2026 6:16 am, Furkan Caliskan wrote:
> Every vcpu_create() call site that builds more than one vcpu loops
> over ids up to d->max_vcpus and stops on the first failure, but none
> of them roll max_vcpus back to match. This leaves d->vcpu[i] == NULL
> for ids below max_vcpus

As I told you before, you must cope with this property in non-error
scenarios.

> , which anything walking d->vcpu[] can then
> dereference. This is what caused the crash: sched_move_domain()
> walks every vcpu slot up to max_vcpus without checking for empty
> ones, so when a domain built in a non-default cpupool had vcpu
> creation fail partway through, domain_kill() later moving it back
> to the default cpupool handed one of its empty slots straight to
> the new cpupool's scheduler, causing a NULL-pointer dereference
> inside sched_alloc_udata().
>
> Add vcpus_create(d): creates every vcpu of d up to max_vcpus and
> rolls max_vcpus back to the failed id on error. This keeps
> d->vcpu[i] is non-NULL for all i < d->max_vcpus

No, it really doesn't.

> , instead of guarding
> every reader of d->vcpu[] agains holes individually.
>
> Convert every site that builds vcpus in a loop to call this function
> instead.
>
> Fixes: 61649709421a ("xen/domain: Allocate d->vcpu[] in domain_create()")
> Suggested-by: Juergen Gross <jgross@suse.com>
> Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>

For the avoidance of a long drawn-out argument, nack.  Under no
circumstances are you editing d->max_cpus after it's put into the domain
list.

You've chosen to do so at a point where the domain object is live,
visible in the system and able to be the target of other hypercalls.

Furthermore you have not fixed what your commit message claims. 
d->vcpu[...] is still NULL for an arbitrary period of time, including
being able to be the target of hypercalls, before vCPUs are created.

All code MUST be able to cope with d->vcpu[...] being NULL.  It's how
the object lifecycles must work, because creating vCPUs is not atomic
with respect to creating domains.

~Andrew

