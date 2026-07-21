Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E763C44533
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2026 13:53:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367814.1617485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmAu3-0002s3-TJ; Tue, 21 Jul 2026 13:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367814.1617485; Tue, 21 Jul 2026 13:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmAu3-0002rw-QF; Tue, 21 Jul 2026 13:52:59 +0000
Received: by outflank-mailman (input) for mailman id 1367814;
 Tue, 21 Jul 2026 13:52:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <matthew.l.weber3@boeing.com>) id 1wmAu2-0002rq-Al
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 13:52:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmAu0-00Cmg8-FZ
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 15:52:57 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <matthew.l.weber3@boeing.com>)
 id 6a5f79a9-5cb7-0a2a0a5109dd-0a2a450ace98-32
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 15:52:55 +0200
Received: from [130.76.20.194] (helo=ewa-mbsout-01.mbs.boeing.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <matthew.l.weber3@boeing.com>)
 id 6a5f79b4-f2d2-0a2a450a0019-824c14c2c509-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 15:52:54 +0200
Received: from localhost (localhost [127.0.0.1])
 by ewa-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 66LDqmVD058657; Tue, 21 Jul 2026 06:52:52 -0700
Received: from XCH16-07-06.nos.boeing.com (xch16-07-06.nos.boeing.com
 [137.137.111.39])
 by ewa-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 66LDqSeX058217
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 21 Jul 2026 06:52:28 -0700
Received: from XCH16-07-01.nos.boeing.com (137.137.111.34) by
 XCH16-07-06.nos.boeing.com (137.137.111.39) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.69; Tue, 21 Jul 2026 06:52:28 -0700
Received: from XCH19-EDGE-Q02.nos.boeing.com (130.76.23.14) by
 XCH16-07-01.nos.boeing.com (137.137.111.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.69 via Frontend Transport; Tue, 21 Jul 2026 06:52:27 -0700
Received: from USG02-CY1-obe.outbound.protection.office365.us (23.103.199.175)
 by boeing.com (130.76.23.14) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 21 Jul
 2026 06:52:13 -0700
Received: from SA1P110MB2076.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:198::16)
 by BNZP110MB2558.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:4aa::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.17; Tue, 21 Jul
 2026 13:52:12 +0000
Received: from SA1P110MB2076.NAMP110.PROD.OUTLOOK.COM
 ([fe80::1093:e669:d5e:41ab]) by SA1P110MB2076.NAMP110.PROD.OUTLOOK.COM
 ([fe80::1093:e669:d5e:41ab%4]) with mapi id 15.21.0223.008; Tue, 21 Jul 2026
 13:52:12 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=boeing-s1912 header.d=boeing.com header.i="@boeing.com" header.h="From:To:Subject:Date:References:In-Reply-To"; dkim=pass header.s=selector1-boeing-onmicrosoft-com header.d=boeing.onmicrosoft.com header.i="@boeing.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1784641972;
	bh=JUCHa3bKJEkKrvY4lEpVxWWAUoRn/VJ6Ad9ivBaWPFw=;
	h=From:To:Subject:Date:References:In-Reply-To:From;
	b=KyIerFK+WYic/sB6KicI7P8qY8RTWfkcXsIB2EUXOfPnYWQcoHJv8vnZUeAlVpk7v
	 NzfMjkIhEvV+XsVcUP7JpGc1znLFZMVg3wgAN72upzFIJibRIUXMhvZdLXD3bgLPy/
	 9wT+Lm0pdgnHOnXruNuUkNgE7irYGzcLFHMnaVFiLssN7O7D1bkgQw3whnMQVC70ig
	 VYNO/mxZJQrbIXKqaZ+tEp6wNP7bWw1CnbkTtHfIUzP87p2lLIhoB8XPMlSHYTWyOY
	 R/JwYS410KKV+z182ZXooIKVTm4By2fpNCwEOvRvpHAA+dJhFZv/BZKs5hFqgGKx3C
	 4mzdgxhpCocAg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=QyWcSYg8d5fehExrsqEfo6WcsOgSnGSSGCiRSfZq0f5iZ11vD1plJSd20KMGKQCtWdrCzeMkK3B9E2SU8zzDrqxHl9b0gkxbBe607+9rK8owRToXrjwbBXY+SMWYxnn+/EyyZIHoZyczqv/djOhHymVTCW0Bauy4s8MCLdy2kDVONsi3q2ZsH9P74R2hp3bqj9TDpzmSlM1iILjJ6XHX4wVq/ihGHAuAHaFq1eUk01ORKQGKmyw+oy529JJp6fz7g9MGEs/3htcyVk++EA3Hvhs9VAGOKVKgFsWhOXITuU3odEaP9N+YZJn4ol60ewg+W0Dugwa2ib7fMRyQgz3NVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JUCHa3bKJEkKrvY4lEpVxWWAUoRn/VJ6Ad9ivBaWPFw=;
 b=V0BqJnXXkraSD+VZNk2wljWabbX94H6vPhyw5KVrwavi6mw1RN0bRtUrUVAUnczS5hRTMBZtNoFH0w/pUfO4sEvXzELzBNdZgNK8Pnl4PDmwn30ln+H1fSW06VEcdxTGiAKx39wgSJpbQaE4PfVQ8+Md89M/uvbHomtkUBQvKUhlySDDP4ki3vIwZTJtPODEaIzIFnmriTPZvvaAqlHHoV5mUFq3/Jf09QabwARjPAPyOV4DKUqIV0uLd1WdRIcXYzmZtV7sIVvL6Jjy0kHCYevlACs/5QsT0briTjFBl9dveYduah0WcV3alvRkLYf8T5VxkwQ9duBgupcYknpFVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=boeing.com; dmarc=pass action=none header.from=boeing.com;
 dkim=pass header.d=boeing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.onmicrosoft.com; s=selector1-boeing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUCHa3bKJEkKrvY4lEpVxWWAUoRn/VJ6Ad9ivBaWPFw=;
 b=Ie2Whzh08z112Tl8nfO24owD7GZ1hTXYkzpuJJRJ/uOxcDoWANxHgicqz6dLbx6mtIbflsXCoMS9wmehCJHca5MdG4Swm8tlcbkOBsKrMnWQ2EGd7sTLkyt/Z/SQEqv23reeCoXpI/fjQYET1tZxM1HeJPDC1M7e2o/hzZq42s4=
From: "Weber (US), Matthew L" <matthew.l.weber3@boeing.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [EXTERNAL] [XEN PATCH v1 2/2] docs/fusa: add generic timer arch
 spec with ASCII diagrams
Thread-Topic: [EXTERNAL] [XEN PATCH v1 2/2] docs/fusa: add generic timer arch
 spec with ASCII diagrams
Thread-Index: AQHdGQ87b/N5pVUPx0Wqd9VFa4WMhbZ3/T2g
Date: Tue, 21 Jul 2026 13:52:12 +0000
Message-ID: <SA1P110MB2076559C830AB1A9267A5577F3C2A@SA1P110MB2076.NAMP110.PROD.OUTLOOK.COM>
References: <20260721124729.868630-1-ayan.kumar.halder@amd.com>
 <20260721124729.868630-3-ayan.kumar.halder@amd.com>
In-Reply-To: <20260721124729.868630-3-ayan.kumar.halder@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=boeing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1P110MB2076:EE_|BNZP110MB2558:EE_
x-ms-office365-filtering-correlation-id: 532d0305-c00f-4245-4d5b-08dee72f441e
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|38070700021|18002099003|22082099003|4143699003|10067099003|56012099006;
x-microsoft-antispam-message-info: 9M+YKcw99h2gJrWfIiWz1mohsexdo22A/5zk4MOoFPhXzlF4GQ6ZJaq5hlm2Xrfq9afJOFilVtYtCxXW89MXBWL09hmBuLPyNIlAaUCo2PezMDXW4auMiDFoxfjM6t5iYx6T+o0IwMT28hA9JAdj9v8Pjab1uyPmf33+ycxCo+Nn2S1WP0xF8+SsmtzOQu508u0TeLSi7WqcZChnqPiqxN3OW7EHTqFPNh5gqmbX8nAJAifak2N9kCQWlkxR/Q3GA+v6/KR0oxZMx0u7j7+/kzOsTs9GhzrueRjVrLHJ2Q6O4IEGmQBAbHQ1bB0KUlR5QefCp4iVGH3dwhRCCDvK2Qb3iPLrIIiKLfmCbl5Y2Hiy5UtzYjrEXAPdlJ/7DQQyIGQdNDR8lQx6LOMjYoin4SR6yd2V8nqXWfJ2lZW+nua9lVCnNwA3p4lAN8PelbOpHgcnmmRUoruRhWNbepcCRstftE/W9pJRlPoqS80vzjWplnvHHUFdL8SSWa5kc0+UzKIZMMvHVZGvVj4zTqoNCQnOOEp6iXdKrYlzrFoXUBL4jmyp1fS81sUVQd2IAOuKPHa9hSpkJL4AeaLaxt4IurY3tWIE7eQszi4qowy5y4eirSr/Zb6xSda0u0tmic4M2I5uC+CPHMgFkZnQacaTlfjpeBcDVQ6CuqC1mQuOtDI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1P110MB2076.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(38070700021)(18002099003)(22082099003)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yppoVDMU3l1yEGfwv/5pQ4zn1029tJLci2hJhvZ0p8W1XhDVgS3qtnHGv2l5?=
 =?us-ascii?Q?xeOIlyQHe6wDFSyBjpr/XxkzGII2ZLbEe68oMFiPmFU3DXqQ1vz9dQb2nqE6?=
 =?us-ascii?Q?t5JMCkRvjgaFBolekKUnP2gOj5O8kmA/MGVGxlRv9seodzt+4OFQjw/7yaT2?=
 =?us-ascii?Q?2OlTHtz5Ukwf2+En7AHo4tmJa+wmLR88GGcyEeyGiIkLCTq8Sb3ifDorE4JG?=
 =?us-ascii?Q?7zLjubg8cwctgXdoVHNvnx4ErUnfysZeTtLj3rICjxmmsQcGbfdvVWcOrWED?=
 =?us-ascii?Q?gMl2ltUtQEO3XW0KLLowrmB49QEw7WtxvQ/LmLP0AGQgnSIUEXnnfAyUepN6?=
 =?us-ascii?Q?OoacSHxfm4q1r5F/uhBL6YEbYFCTUgHRQMCSi9IADhTfyRJ5EOHevGLZnnK/?=
 =?us-ascii?Q?VEGCm/WnMShsM+APITAgQ/s2kH/fxckZTSWKlVwMp17caeju6LQ4fvFV5W2x?=
 =?us-ascii?Q?ivKQ83pcLCz+XGUaUJm4H7DNO8CjEcLF0kIfCmsg0TewERnOZ+jPjQTuqEk7?=
 =?us-ascii?Q?XWFmmmCyIYmJacOIfUzFJCRt00Ku+M9zFKc6EMd2gUELLHJ0ssQ1tbLixM4H?=
 =?us-ascii?Q?MjkucwU7iTG02EIOdlC6tBnZOVbwFcd8Ggy5Dn+nFRNL5G3Sq3MRDAitYaWl?=
 =?us-ascii?Q?PUrhQTpvfZwer2zCe9mmlbM4tcqOC7ZjyuIU7WKYQTIwv7KFqpdhUUCYpKtn?=
 =?us-ascii?Q?yV2PdOAlMSTuI1Jbv4+kc49Lm9qAn8XyRoeAUNXApJS/OELE+MV2a/H+STwt?=
 =?us-ascii?Q?hxwYfwTZ90MD+NEzWpvn2g8ENJ6a9z4q7Q3ipBdENcMrOzVJd+gprCpXGxaH?=
 =?us-ascii?Q?wjZ+v2prg/qakVowd7xRmWsyMAgrLXk6gyvAWVlShjK4YhhO6WMkWTqqQA7B?=
 =?us-ascii?Q?zE5A2q1xXuf4Q0yz2ZWI5Myhy06HaL6JCFT+BTT6OlZ7CLkHh5MJuZI/MZdZ?=
 =?us-ascii?Q?aK5gAUaud1hj7bFhbPw5jsA1egwyOukjOYVfH7jEUR/iTSTQ2ousp//TUhCp?=
 =?us-ascii?Q?1EH9siVDSIZONIDymIfMKnqZcldKYUerB7Uxjcn0ABy5t6pYJVmIz+s2FdUv?=
 =?us-ascii?Q?XTwrNfMHimBlNRlNBVoK5F42uiW2yQFFAoYHugAwn9/rh5lppYH8Bn/VX+yB?=
 =?us-ascii?Q?xUS4ZnG6vmCk8t01WL2gi2mMH9b4uInHncU+2bUxJ6UoKfwLEHlu0Jvt5SBl?=
 =?us-ascii?Q?eUYEOdQo0wlWcUrI3s7WaQt6E9Wh0RPwNCmYXEZkJIm8L+jRXdCFFUDzRcZc?=
 =?us-ascii?Q?teYPTydbspX+BsI80HaHsvpkuSXuvuepsAVj4csMvVfql6SuxJGrE4vDpyGJ?=
 =?us-ascii?Q?LZuroZ9U5Zbm3HCzuJ59ZAZxubtWjgs0ZeeZRUbMp0CR13TWiG8tAJ2onbGY?=
 =?us-ascii?Q?jBtdtXIeWsWNqs9cZBHxeLLCG8nbXTEfXDoFOIBq2wzNzvxhQ7L0e3dwGO6J?=
 =?us-ascii?Q?jLpuJO23dL91IFxk+a5rbwtStmvFUx9Yps7F/vMam9Ho06XkDH9+s8EXXjLj?=
 =?us-ascii?Q?tBJJecnDAvaG2UQBAD0HR38aniQkIiCUFHxBJb64qYrWnGAnzWwDzguRn97E?=
 =?us-ascii?Q?TY5dAIZASmbvu/b16pwHE1U7BullAjREqkOYXt5K04X0bzeNO3wsNZzS5hVe?=
 =?us-ascii?Q?Agincj5Z2duON9a0oZHv/Ak8eTKw36nbV6mqgI4HS0LjQ/egbtuL1K0PDRBn?=
 =?us-ascii?Q?Um42Sg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1P110MB2076.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 532d0305-c00f-4245-4d5b-08dee72f441e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2026 13:52:12.5319
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcf48bba-4d6f-4dee-a0d2-7df59cc36629
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BNZP110MB2558
X-OriginatorOrg: boeing.com
X-TM-AS-GCONF: 00
X-purgate-ID: tlsNG-4011c0/1784641975-538D5CFC-AB28468F/0/0
X-purgate-type: clean
X-purgate-size: 1503

All,

> On 21.07.2026 14:47, Ayan Kumar Halder wrote:
> +Generic timer usage during VM creeation
> +---------------------------------------

Typo: "creeation" -> "creation"

> +- CNTVCT_EL0 - virtual count value
> +- CNTV_CTL_EL0 - control register
> +- CNTV_CVAL_EL0 - compare value register
> +- CNTV_TVAL_EL0 - compare value register

CNTV_TVAL_EL0 should be "timer value register", not "compare value
register". CVAL is the comparator, TVAL is the countdown/timer-value
alias. (Same naming as CNTP_TVAL_EL0 earlier in the same section.)

> +The interrupt behave in a level-sensitive manner, meaning the timer will

Grammar: "The interrupt behaves" (singular).

> +   * - physical non secure timer
> +     - 30

Nit: ARM uses "Non-secure" (hyphenated, capitalized). Suggest
"physical Non-secure timer" for consistency with the spec terminology.

> +| [1] Arm Architecture Reference Manual for A-profile architecture, Chap=
ter 11
> +| [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=
/tree/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml

These would render better as proper RST footnotes:

  .. [1] Arm Architecture Reference Manual for A-profile architecture, Chap=
ter 11
  .. [2] https://git.kernel.org/...

That way Sphinx cross-references and numbered citations work correctly
in the built HTML.

Overall the spec is well structured, thanks Ayan!

Reviewed-by: Weber (US), Matthew L <matthew.l.weber3@boeing.com>


