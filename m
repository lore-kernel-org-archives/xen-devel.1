Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54093CD8CA8
	for <xen-devel@archiver.kernel.org>; Fri, 12 Jun 2026 10:01:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1336474.1598277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyhU-0002Nn-58; Fri, 12 Jun 2026 10:01:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336474.1598277; Fri, 12 Jun 2026 10:01:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyhU-0002Ne-1o; Fri, 12 Jun 2026 10:01:20 +0000
Received: by outflank-mailman (input) for mailman id 1336474;
 Fri, 12 Jun 2026 10:01:19 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb4751cb000701b@swg.vates.tech>)
 id 1wXyhS-0002Kd-UU
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 10:01:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXyhS-009PXB-Ak
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 12:01:18 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb4751cb000701b@swg.vates.tech>)
 id 6a2bd8ec-e002-0a2a0a5209dd-0a2a4506c066-4
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:01:18 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb4751cb000701b@swg.vates.tech>)
 id 6a2bd8ec-7371-0a2a45060019-b9ff1c128cb5-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 12:01:16 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ebb4751cb000701b.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 12 Jun 2026 10:01:13 +0000
Received: from [192.168.1.200] (lfbn-mon-1-1130-120.w90-48.abo.wanadoo.fr
 [90.48.233.120]) (Authenticated sender: thierry.escande)
 by mail2.vates.fr (Postfix) with ESMTPSA id 6599E8649B;
 Fri, 12 Jun 2026 12:01:13 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=iD7zbj9ToOPp5xR4/S+Jgs4RENtDXgKpWed0gmKc5u8=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=c0bEoIQZ2t2aRHOIYzIJmFeop1XeXcNBhmTddGAf3SVbim4chIu/WwRYYy2rokckp5ptLsN4c
 BESbWCiM7vZd7WBFDlX489shvuAcZqMwNnh2T4OYynWsoF9d+w8xEiNWL78abjV1b0R/Oaz7k97
 VIPvJOgO8g6tMkcZythIQk8XFN5mXQAQhnDYAh3ofJ3gveVnTTpoWpEppRi6R7sWyUtzppKVH/j
 siS2zWO0+waAzuKuL/ZVYLszuBHQbnH/Ajgu7BY3z6U8zYeZVeVhdKgV0Rn0RAVvBO9CnaqIVPg
 XksH1tXjFhHYliX/Blw7xq7i+OLtApZkBAID8H/qsyVg==
X-Zone-Loop: 7aa6dbaa65d373c9b3ce875faa3a049846ec6e485e1f
x-campaign-type: default
x-transaction-id: 26f8b09c-4600-4b46-8a53-cfb1e775b33d
x-swg-uid: 01-7637ffeb-2a73-441c-8c10-7013bf05e1c9
X-Mailer: Sweego
Message-ID:
 <1781258474.8631fc262581453bbf619ec5b2062170.19ebb4751cb000701b@vates.tech>
x-swg-bid: 1781258474.8631fc262581453bbf619ec5b2062170.19ebb4751cb000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 12 Jun 2026 12:01:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thierry Escande <thierry.escande@vates.tech>
Subject: Re: [PATCH 03/17] hvmloader: add function to set the emulated machine
 type (i440/Q35)
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Alexey Gerasimenko <x1917x@gmail.com>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-4-thierry.escande@vates.tech>
 <afCOS0Ufbk790t8J@macbook.local>
 <40c2ea90-e3ab-4d4d-b8a9-8d8efb2869ff@suse.com>
Content-Language: en-US
In-Reply-To: <40c2ea90-e3ab-4d4d-b8a9-8d8efb2869ff@suse.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.9b.c25fc20caa5b6c3e.19ebb475048.5308ca7602eef5a7=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781258473544
X-purgate-ID: tlsNG-16d1c6/1781258476-87F7BD75-C30EB9E2/0/0
X-purgate-type: clean
X-purgate-size: 2073

---=Part.9b.c25fc20caa5b6c3e.19ebb475048.5308ca7602eef5a7=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 5/4/26 12:58, Jan Beulich wrote:
> On 28=2E04=2E2026 12:39, Roger Pau Monn=C3=A9 wrote:
>> On Fri, Mar 13, 2026 at 04:35:01PM +0000, Thierry Escande wrote:
>>> --- a/tools/firmware/hvmloader/pci_regs=2Eh
>>> +++ b/tools/firmware/hvmloader/pci_regs=2Eh
>>> @@ -107,6 +107,10 @@
>>> =20
>>>  #define PCI_INTEL_OPREGION 0xfc /* 4 bits */
>>> =20
>>> +#define PCI_VENDOR_ID_INTEL              0x8086
>>> +#define PCI_DEVICE_ID_INTEL_82441        0x1237
>>> +#define PCI_DEVICE_ID_INTEL_Q35_MCH      0x29c0
>>
>> In Xen we have a separate file for vendor and device IDs, called
>> pci_ids=2Eh=2E  Maybe it would be better to use a similar approach in
>> hvmloader, and keep pci_regs=2Eh only containing PCI register offsets=
=2E
>=20
> Can't hvmloader simply re-use Xen's header(s)?

If it's ok to add a symlink to pci_ids=2Eh in tools/include/xen then yes=
=2E

>>> +error:
>>> +    printf("Unknown emulated chipset encountered, VID=3D%04Xh, DID=3D=
%04Xh\n",
>>
>> We don't usually use the h suffix in hex numbers in hvmloader, it's
>> more common to prefix them with 0x, so I would recommend to use the %#0=
6x
>> formatter instead=2E
>=20
> I'd generally advise against use of # with a width specifier, as that en=
ds
> up awkward for 0=2E That is, %#x is fine and generally to be preferred, =
but
> for a specific with it might better be 0x%0<n>x (with n=3D4 here)=2E Arg=
uably
> here we don't really expect either of the values to be 0, so the suggest=
ed
> use may indeed be okay in this case (while still introducing an example
> which later may be copied elsewhere without much thought)=2E
>=20

Indeed printf("%#08x\n", 0x1234) outputs 0x001234=2E so 0x%04x then=2E

Regards,


-- 
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vat=
es solutions

web: https://vates=2Etech
---=Part.9b.c25fc20caa5b6c3e.19ebb475048.5308ca7602eef5a7=---

