Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA472C982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 21:18:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429495.1652333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x97ss-00047P-0I; Tue, 22 Sep 2026 21:18:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429495.1652333; Tue, 22 Sep 2026 21:18:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x97sr-00047I-S8; Tue, 22 Sep 2026 21:18:37 +0000
Received: by outflank-mailman (input) for mailman id 1429495;
 Tue, 22 Sep 2026 21:18:36 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1x97sq-00047B-7o
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 21:18:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x97sp-0002IN-Kx
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 23:18:35 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ab2f07f-2eae-0a2a0a5409dd-0a2a450cd066-18
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 23:18:35 +0200
Received: from [52.101.65.133]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 6ab2f0ab-f479-0a2a450c0019-34654185268f-4
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 23:18:35 +0200
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com (2603:10a6:803:113::29)
 by AS4PR03MB8363.eurprd03.prod.outlook.com (2603:10a6:20b:512::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 21:18:32 +0000
Received: from VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48]) by VE1PR03MB6078.eurprd03.prod.outlook.com
 ([fe80::4722:b91:9b24:ee48%3]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 21:18:32 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h/NGHD1RMZYhDVs3/TftudDlvnxmAG5Qz2vqOJ8wWJnDNTzogxcI3CXa3RdjZln6gN/CHC8UWkAXSRtr/5dGiiXyD7xcrf2iHE4DwJlH1v1tI/WRP2PGc79YJvWMTqUkTHn31QzOCr5Ahf9Z72V36ky7kFH51O1HP49CNA5td1mRuD+5g68p3TJuTDxFwrD5G8mNRYlNqWGgpuWjBwpSo6tBOlpfiD94PECr9X5A3PsvSId3T/pig1U5B9/6jtWCCgyvhRBOaUhfiQNbEp0czTAKmOJ6lFet4IzsyeYZimg6zYrSbl9PBrjGyTZlOMZJCj3gZ1gTq9iCb+n4K2s8kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4KMALGWBREel2hCxC00aazS8xleixzBvLDh+8W/RgE=;
 b=K97b5qW54Cp+nHodS47Lmh/VcRvzkvfA6yIqbkd6a9s4VyGPIXtBi0Z3JdhE/NFQMk0qIN4/Z9EE6znLJIgg7Mk5Ma36Qwmfo9UzQpGyNxiOw9mZcpfhrP5f6R4cnd6B1xCLWLn5b+czBs6BCtvfv5+ue8Hee+Z2U6L2Hj6pR9LjQ8Ily6N5+xm7VE3LvbID2GzoDm3cAkn7L7tknSHU7OcvytlKl29dyBuWHDcOuf2lwsq1m3DhuWqbYGLNdgoW9PZzxsqWOWJtKixccjJakANlKIRxA9+IqTKF2TPgqpiiIualz9SJnk8No9Mdco67UTfrkH43P0eaysLZB3h/2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4KMALGWBREel2hCxC00aazS8xleixzBvLDh+8W/RgE=;
 b=QJe3Y5iWNO2kqLERlApjLotM19n8yMXkua2ORz5k4iwdCUSVy/3rqiYjbTxSeQs7H/2qG+IY4sOcWGopmqyqqXn5huY4SiKjcs6KRRWTM1aQ/rviWbWjPQfxCvviuchNZX3mlW7FIMWlQVUwtoHcsad3qBaYLs+I7AB+Qv3EKxYCqixOhB4sHQMFC6Fv8TzBa1gqbkzWeNsatQsbh6CiIZwVRTWplk7btC9QdjTPNFdRdYn+FLQATNTDUpEiY0xb3BI1kTI0DAxiAwbAAiS2hoDk2jZXMMVWGPIzqVYRs2eHe73l64fpakxudQmuCSLo7IsbuYeCuN3qVYGl++Yh9Q==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Nicola
 Vetrini <nicola.vetrini@bugseng.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger@xenproject.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: Re: [PATCH 09/14] ACPI: address a Misra rule 11.8 violation in Arm
 code
Thread-Topic: [PATCH 09/14] ACPI: address a Misra rule 11.8 violation in Arm
 code
Thread-Index: AQHdOqUePUfY0zBPU0K0F/hx5odMHA==
Date: Tue, 22 Sep 2026 21:18:31 +0000
Message-ID: <87h5jh56ji.fsf@epam.com>
References: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
	<f6362f01-0057-476e-ba7b-b0bd8154c86e@suse.com>	<87qzim6p5i.fsf@epam.com>
	<8fd025af-f429-488e-9977-aec3fea2e78b@suse.com>	<87y0ct5zan.fsf@epam.com>
	<c3585a8f-df34-425c-b504-7702f638cf37@suse.com>
In-Reply-To: <c3585a8f-df34-425c-b504-7702f638cf37@suse.com> (Jan Beulich's
	message of "Tue, 22 Sep 2026 13:16:22 +0200")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: mu4e 1.14.3; emacs 30.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR03MB6078:EE_|AS4PR03MB8363:EE_
x-ms-office365-filtering-correlation-id: e5647331-931d-4bb0-6fb1-08df18ef0e03
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|23010399003|42112799006|1800799024|366016|38070700021|4143699003|10067099003|56012099006|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 y3kG04QrG4mVyuSjD4vIqxQJEpdSzseQyn+yzbG55s+7OYVTADQiyW1zVEKyMZiRX5522EGd8kZs1nh5OPe6d/1M1dDEZz/c9KDCaryH4drT+uHu5Wk0UPy9/U8uh/qPUCZzjxrspsCYaIelhlz4NQkl1HXApOKoAjUH2lxRB3iYPMCcAg8xFESxrK6qF11Zhl+LvxNLQn2UPb2ms/3XmI/FmOGyuAEN8PaF3AhsYNk+RmjN/tmRNXg9rkci+bZt6OMfQXJXjbQdK2qXUoy/u9vZlc0+QY8HrRaLy0gWViT09NV0pp+XO5XwKI2n+SNjZK5BT0jzGd4rmjlXUTTbFv5pYRPOwxtuEebps4oT8AX8Ryi69D2UqKkwzqEUxGcuN9d/CtFwaFcBJgrS5OHfhX8EtcmlOfdHgDApgRTrteA9wSAvXNSUSMj636CXDjkx/Ccql43UoLBC9u5h9+XnhBSmkStu/Qs8ZjBlbQP75HCERBXzA3xWPWv60aFIDiZWoXugPOPQhQ+dJ3r68Qn119v/uMSgPmHdWPc/KyfRGKJzlxBTxomJOzaW7QMgrxY5U+zj+UR2JAg8utjGL7A4NVjlvPap6HQdoae4IvYC6erO0chCBQ5tYW2wEXacmeqBJKL4ys5kSRljDjJ1cw4U5lKuoPlXGxUfBDZBlbzZEK1mnA63ZDUu8GOKaBBtKWQ0TkJMKbnLegMtbQjw+5MEpdr0mk1IoTw0cHuIVZUbLYg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR03MB6078.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(42112799006)(1800799024)(366016)(38070700021)(4143699003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?CMIuXJa08QSbpvAtT+F0DeXL5dMsYcaj1DuLJ7OB3Kl49UePX7zpnWtF8w?=
 =?iso-8859-1?Q?ii0KIdDsWkyXEKVXlTJs79IRNi+NsioNdENPAFQ0Yj1RzqEssfqW0dGPA3?=
 =?iso-8859-1?Q?zKEVb1S9klKpR3Vbbukj4PBYrTBTXFV5KA1+WQilYHf7ahJdEnsagud/HN?=
 =?iso-8859-1?Q?3tWagmQZh8xpKZoo/VOKR0I+hrpXFwHmeaoro5eH7nXRcm3PTGk8Fb3VwC?=
 =?iso-8859-1?Q?m1Cm1pWd/OqVNdEm7NP6vfjlmG1jjORyx1mfp9h/aUm0SMLwXTTtFFoXH/?=
 =?iso-8859-1?Q?hnNlhpSE08i3oK38MSvhZLjgEbugm/ww4V01WfGbITaX5RE5ZEnCjowifj?=
 =?iso-8859-1?Q?OKGAe3zNOD7bAbvSjB2KXPFXhJX5nVZi3XHeb7EXrOB6OmxEn+HMOalENh?=
 =?iso-8859-1?Q?2oe3wTKzACKHKFoZnYHwk4frv9j7+xhHoDyri1Q+do1DaKTY+iC4lv/lEQ?=
 =?iso-8859-1?Q?Dky3FB7jX+r9Y09aZHtoZ8xYu4gTUBRhlZbezEN5LDtUNeP8k2iXl3rOwA?=
 =?iso-8859-1?Q?axmJ7QE4pi5vUtBXXDQa++qvZl0Mjlj4alIBgq7fO1eGqccQm0TP7kOe+u?=
 =?iso-8859-1?Q?wWoqV8FXuFQgEWpOT5lhYjlNgl4xo5/nwZ+azNN+SCGW3nT7omM9aMRz2g?=
 =?iso-8859-1?Q?ow6Xp7sku0VzXHrny8mGx/A8DyPaJ/rprdfW1xy2zXuiT0beIDAYv5D8l4?=
 =?iso-8859-1?Q?cTiYVqMp+PiPwlA92FV1OYmedozqKVVsJLM/StWSvn3lXF6b9hDTSjgUms?=
 =?iso-8859-1?Q?px3oo4Kh703ZQesYZFfLJJB3RL1/TBSHQ/rYDRYnHb2gtEVfDcB762pVQT?=
 =?iso-8859-1?Q?U6YQzZDh5ljT2MOPoe14WMDk5oBEMuOyBSPQ4Qw3r6bW+mlsHDV8CErguf?=
 =?iso-8859-1?Q?GdTJbeZedfwCERKcknzoy2RRcobvta9jsVQDNbYN4P0yNjout9uBdDc0dG?=
 =?iso-8859-1?Q?G9M8jvICn58yoQ+6RKnqcVT77Rm6jY5mwEx8bkik7WvHeBAGb7eAtDN2KD?=
 =?iso-8859-1?Q?FgUBTpuF+082/2WdLKwNURE0SJ/F81routMc8nObg5FaVyUP9SW+eZCvhZ?=
 =?iso-8859-1?Q?ZhmramTLQCk9Ph0kGhbxQxg0SCCa+IVYgZ1zMWm7fEu/qug2xzWTrl+HTi?=
 =?iso-8859-1?Q?8JW6iAgeyNjEVYWGxvrL8HiAtV2bCcPelEEi1Bp/TbK/8Jxf91L1CU3lcO?=
 =?iso-8859-1?Q?2QW8eckzpyWhTM84r96gRNadJft8NkEXsjhO5CF9EEUhnxzcca+n4Ukrk6?=
 =?iso-8859-1?Q?zGKgLlrEVNgAZCEeDLvUq/KKSUb3ThBnq8Qq+fMI6y9S7cE8PZwQpDvVkG?=
 =?iso-8859-1?Q?reblrgP6PGCNH0IHhzyGS1dZA4nBB//uam8+D+JthHl+J5HElhWptaVExn?=
 =?iso-8859-1?Q?ZtOYrKo5IlZ3lMqNpk3FHX+zUP9SwV4gM1SjJqwY6i4YpOhAuNnrkU2Ghh?=
 =?iso-8859-1?Q?ihZXicjcRh/j951ieXvZh4TtJvXylpn+lQ1s2XAz1JxFlObbFH55aSJQtT?=
 =?iso-8859-1?Q?MizWobxK67+PJf2P7jJWUatXV6rtIPFsR4y58FQW2Sz4mqts3laeiWeR/z?=
 =?iso-8859-1?Q?1/BVhbxo5JzuVGQ1x9eOtcf72C2A17lvThV5XO6EP+qWI00PRqOYT9Sdx5?=
 =?iso-8859-1?Q?nc8T9UtleQAsD9foosrtFScCKhst3YiRTfMTAZikSNgknJQysafTtiUVlD?=
 =?iso-8859-1?Q?gSLTCqahmkqTqARZpBllCJmZMZdGtVP74/gnDs8pFKxypHIEOteTz2DhPm?=
 =?iso-8859-1?Q?32ogiLmJALrWqwK8mESqrR9+2YSaiyl6OI6+MtYxHCvl97veZYjjGkkZa3?=
 =?iso-8859-1?Q?DuNJlTqeM3x7WOwp14VM/CI3uS5nG2s=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6078.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5647331-931d-4bb0-6fb1-08df18ef0e03
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 21:18:32.0842
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LkZ/69uhd0zePJQAuDmrNDbmRy9xLrmw7F50GfvUCBbFRIwvLma8YyByqZI8FgteDcPfxU7OUuFW+1J1KLNnnHT6RoqhM5aWdfQDpltmQnw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8363
X-purgate-ID: tlsNG-d25034/1790111915-01CC3A5B-D968EDDD/0/0
X-purgate-type: clean
X-purgate-size: 2490

Hi Jan,

Sorry for the late reply

Jan Beulich <jbeulich@suse.com> writes:

> On 22.09.2026 12:57, Volodymyr Babchuk wrote:
>> Jan Beulich <jbeulich@suse.com> writes:
>>> On 22.09.2026 03:38, Volodymyr Babchuk wrote:
>>>> Jan Beulich <jbeulich@suse.com> writes:
>>>>> Outside of drivers/acpi/tables/ (which is excluded from Eclair report=
ing
>>>>> for dubious reasons), arch/arm/acpi/domain_build.c is the only user o=
f
>>>>> ACPI_COMPARE_NAME(). Make the macro const correct, at the expense of
>>>>> introducing a "const" variant of ACPI_CAST_PTR(), and at the expense =
of
>>>>
>>>> I think you can avoid adding ACPI_CAST_PTR() by providing a const
>>>> type. Like this:
>>>>
>>>> +#define ACPI_COMPARE_NAME(a, b)         (*ACPI_CAST_PTR (const u32, a=
) =3D=3D \
>>>> +                                         *ACPI_CAST_PTR (const u32, b=
))
>>>
>>> I don't think so. You did notice ...
>>>
>>>>> --- a/xen/include/acpi/acmacros.h
>>>>> +++ b/xen/include/acpi/acmacros.h
>>>>> @@ -103,6 +103,7 @@
>>>>>   * Pointer manipulation
>>>>>   */
>>>>>  #define ACPI_CAST_PTR(t, p)             ((t *) (acpi_uintptr_t) (p))
>>>>> +#define ACPI_CAST_CPTR(t, p)            ((const t *) (const acpi_uin=
tptr_t) (p))
>>>
>>> ... this, I assume. On the surface it looks odd, because one would expe=
ct
>>> acpi_uintptr_t to be a scalar type, like uintptr_t is. But it isn't:
>>>
>>> #ifndef acpi_uintptr_t
>>> #define acpi_uintptr_t                  void *
>>> #endif
>>=20
>> Well, that was unexpected. Talk about principle of least surprise...
>>=20
>>> The only alternative I see (somewhat more risky overall) would be to
>>> introduce
>>>
>>> #define acpi_uintptr_t                  uintptr_t
>>=20
>> What are the risks? I'd really prefer to have fewer gotchas in the code.
>
> It hides casting away of const-ness. Right here we would like that, yet i=
n
> the general case I think we don't. Otoh Linux switched to the above in th=
e
> 5.18 dev cycle.

... but for different reason. clang complained about pointer
subtraction with a null pointer. This does not fired in Xen because we
are not using ACPI_PTR_DIFF() yet. But, if we are going to use it, we'll
face the same problem.

So, if we are already touching this parts, maybe it is better port that
Linux patch ([1]) and use const types as I suggested?


[1] https://lore.kernel.org/linux-acpi/20210927121338.938994-1-arnd@kernel.=
org,=20

--=20
WBR, Volodymyr=

