Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5569CC54FDF
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 09:58:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1377403.1623475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpNWF-0004Hs-Hz; Thu, 30 Jul 2026 09:57:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1377403.1623475; Thu, 30 Jul 2026 09:57:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpNWF-0004Hl-F3; Thu, 30 Jul 2026 09:57:39 +0000
Received: by outflank-mailman (input) for mailman id 1377403;
 Thu, 30 Jul 2026 09:57:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wpNWE-0004HP-CT
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 09:57:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpNWD-00H5P7-Pa
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 11:57:37 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fb2753d7d000e099@swg.vates.tech>)
 id 6a6b2008-bab6-0a2a0a5309dd-0a2a4506edf6-20
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 11:57:37 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fb2753d7d000e099@swg.vates.tech>)
 id 6a6b2011-195a-0a2a45060019-b9ff1c229add-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 11:57:37 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fb2753d7d000e099.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 30 Jul 2026 09:57:35 +0000
Received: from [192.168.0.38]
 (ipservice-092-208-102-202.092.208.pools.vodafone-ip.de [92.208.102.202])
 (Authenticated sender: julian.vetter)
 by mail2.vates.fr (Postfix) with ESMTPSA id E03EB80C5A;
 Thu, 30 Jul 2026 11:57:34 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=jSmaPJ9GcjKc6f6V+1Fcid+mSn7qr37sr4rr76JwcTM=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=FeHu/14EmyYgjX1pQ4st5WjmimkE+UbOVCAQu9dpSq6jfAxu7VBv0s3l4DJvXKxYP1eNq/p49
 0Dm9A4oF9V/toIjPJtn4BJ7kws5hqU+McGPdLxGbWH36DfbG/5q2kkE5fPGB4vCswP1XWfImyS7
 TxHqVyh8Rx8/pAXQXXtw0KtLanV/Fkg1JSGewj3+WBLwJSDt3FT5A0YCR96HhdLigZnRKHYA9GO
 MJmmBPTDU+58fIcv2XYtP5XYM02gsEnDPDXGgF4x+gDjq8Z23cjhjnmfHAqiSOlZXsI2Ko2j7Xq
 WINTMQYexvOawgwyf4uw9WJh4EufiWl1Q8kzBqD84F/Q==
X-Zone-Loop: 78397653c0ab4927f94d7fe70b3b794304ea02fa8c67
x-campaign-type: default
x-transaction-id: 5ac5cc55-0c35-411c-99ed-33991f7e2abf
x-swg-uid: 01-e099b33a-27fa-416f-b143-af5084ffde98
X-Mailer: Sweego
Message-ID:
 <1785405455.8631fc262581453bbf619ec5b2062170.19fb2753d7d000e099@vates.tech>
x-swg-bid: 1785405455.8631fc262581453bbf619ec5b2062170.19fb2753d7d000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Thu, 30 Jul 2026 11:57:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tools/ocaml: Fill arch_config for ARM in
 domain_getinfo{,list}()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrii Sultanov <andriy.sultanov@vates.tech>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20260728154830.67734-1-andrew.cooper3@citrix.com>
 <20260728154830.67734-3-andrew.cooper3@citrix.com>
 <1785400990.8631fc262581453bbf619ec5b2062170.19fb2311930000e099@vates.tech>
 <dadee869-5ab8-48c3-8eb7-3b760eb6e12a@citrix.com>
Content-Language: en-US
From: Julian Vetter <julian.vetter@vates.tech>
In-Reply-To: <dadee869-5ab8-48c3-8eb7-3b760eb6e12a@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.1739.ea49de7e1093a1ac.19fb2753b03.1ca6ff1d6c76837d=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1785405455108
X-purgate-ID: tlsNG-16d1c6/1785405457-F687577B-2BA319E6/10/73395122804
X-purgate-type: spam
X-purgate-size: 4828

---=Part.1739.ea49de7e1093a1ac.19fb2753b03.1ca6ff1d6c76837d=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 7/30/26 11:38, Andrew Cooper wrote:
> On 30/07/2026 9:43 am, Julian Vetter wrote:
>>
>> On 7/28/26 17:48, Andrew Cooper wrote:
>>> From: Julian Vetter <julian=2Evetter@vates=2Etech>
>>>
>>> Add the missing ARM logic, populating xen_arm_arch_domainconfig
>>> from the raw xc_domaininfo_t the same way the x86 branch does for
>>> xen_x86_arch_domainconfig=2E
>>>
>>> Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
>>> Signed-off-by: Andrew Cooper <andrew=2Ecooper3@citrix=2Ecom>
>>> ---
>>> CC: Andrew Cooper <andrew=2Ecooper3@citrix=2Ecom>
>>> CC: Andrii Sultanov <andriy=2Esultanov@vates=2Etech>
>>> CC: Guillaume Thouvenin <guillaume=2Ethouvenin@vates=2Etech>
>>> CC: Julian Vetter <julian=2Evetter@vates=2Etech>
>>> CC: Oleksii Kurochko <oleksii=2Ekurochko@gmail=2Ecom>
>>> ---
>>>    tools/ocaml/libs/xc/xenctrl_stubs=2Ec | 16 ++++++++++++++--
>>>    1 file changed, 14 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/tools/ocaml/libs/xc/xenctrl_stubs=2Ec b/tools/ocaml/libs/=
xc/xenctrl_stubs=2Ec
>>> index 441e1d83cfec=2E=2Efb983709066f 100644
>>> --- a/tools/ocaml/libs/xc/xenctrl_stubs=2Ec
>>> +++ b/tools/ocaml/libs/xc/xenctrl_stubs=2Ec
>>> @@ -444,9 +444,21 @@ static value alloc_domaininfo(xc_domaininfo_t * i=
nfo)
>>>   =20
>>>    	Store_field(result, 15, tmp);
>>>   =20
>>> -#if defined(__i386__) || defined(__x86_64__)
>>> +#if defined(__arm__) || defined(__aarch64__)
>>>   =20
>>> -	tag =3D 1; /* tag x86 */
>>> +	tag =3D 0; /* tag ARM */
>>> +
>>> +        /* xen_arm_arch_domainconfig */
>>> +        arch_config =3D caml_alloc_tuple(3);
>>> +        Field(arch_config, 0) =3D Val_int(info->arch_config=2Egic_ver=
sion);
>>> +        Field(arch_config, 1) =3D Val_int(info->arch_config=2Enr_spis=
);
>>> +
>>> +	tmp =3D caml_copy_int32(info->arch_config=2Eclock_frequency);
>>> +        Field(arch_config, 2) =3D tmp;
>> Shouldn't the Field() be a `Store_field(arch_config, 2, tmp);`, because
>> the `caml_copy_int32` makes an allocation on the minor heap to allow
>> OCAML's GC to keep track of this pointer if ever the arch_config is
>> promoted?
>=20
> No (ish)=2E=C2=A0 The Ocaml/C manual is subtly wrong in it's advice abou=
t this=2E
>=20
> Using Store_field() would be safe, but it has an obscene overhead for a
> scalar store, and caml_modify() does a whole bunch of barriers/atomics
> which are not necessary on anything which isn't allocated from
> caml_alloc_shr() (which we don't use at all)=2E
>=20
> The buggy construct is:
>=20
>  =C2=A0 =C2=A0 Field(foo, bar) =3D caml_{copy,alloc,etc}(baz);
>=20
> because C does not provide an ordering between evaluation of the Rvalue
> vs the Lvalue=2E=C2=A0 Specifically, if the Lvalue were evaluated prior =
to the
> function call, then indeed we could store into a stale pointer=2E
>=20
> But, using tmp in the way we do:
>=20
>  =C2=A0 =C2=A0 tmp =3D caml_copy_*(baz);
>  =C2=A0 =C2=A0 Field(foo, bar) =3D tmp;
>=20
> puts a sequence point after calling caml_copy_*(), and prior to
> evaluating Field(), so guarantees to do them in the correct order=2E
>=20

Aha, thank you for the clarification=2E Indeed the Ocaml/C manual=20
suggested that this might be triggered by any caml_copy_* and not just a=
=20
caml_alloc_shr()=2E

I've tested this series (both patches applied together) on real Ampere=20
ARM64 hardware (XCP-ng 9=2E0'ish, based on Xen 4=2E21=2E1)=2E The crash in=
=20
Xenctrl=2Edomain_getinfo{,list} on ARM is gone, and VMs create and boot=20
correctly=2E So,

Patch 1 ("tools/ocaml: Fix crash in Xenctrl=2Edomain_getinfo{,list} on ARM=
"):
Reviewed-by: Julian Vetter <julian=2Evetter@vates=2Etech>
Tested-by: Julian Vetter <julian=2Evetter@vates=2Etech>

Patch 2 ("tools/ocaml: Fill arch_config for ARM in=20
domain_getinfo{,list}()"):
Tested-by: Julian Vetter <julian=2Evetter@vates=2Etech>


> In the Store_field() macro, this occurs by taking (val) into a local
> variable, and not because of how it calls caml_modify()=2E
>=20
>=20
> In a perfect world we'd have a Store_field() that arranged for the
> intermediate safety without calling caml_modify()=2E
>=20
> It is also telling that the Ocaml runtime has a total of 15 uses of
> Store_field, and we've got more than that in this function alone, let
> alone the rest of our bindings=2E
>=20
> I do have a cleanup patch for those as well, once we got this bug sorted=
=2E
>=20
> ~Andrew
>=20



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.1739.ea49de7e1093a1ac.19fb2753b03.1ca6ff1d6c76837d=---

