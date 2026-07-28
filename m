Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185B2C54F4C
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 13:28:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374197.1621173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohql-0007YL-PJ; Tue, 28 Jul 2026 13:28:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374197.1621173; Tue, 28 Jul 2026 13:28:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohql-0007YE-L6; Tue, 28 Jul 2026 13:28:03 +0000
Received: by outflank-mailman (input) for mailman id 1374197;
 Tue, 28 Jul 2026 13:28:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fa8e926d1000e099@swg.vates.tech>)
 id 1wohqj-0007Xx-Va
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 13:28:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wohqj-00EU00-8h
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:28:01 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fa8e926d1000e099@swg.vates.tech>)
 id 6a68ae5f-e002-0a2a0a5209dd-0a2a450890c8-6
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:28:01 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fa8e926d1000e099@swg.vates.tech>)
 id 6a68ae60-f659-0a2a45080019-b9ff1c129e61-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:28:00 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fa8e926d1000e099.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 28 Jul 2026 13:27:59 +0000
Received: from [192.168.0.38]
 (ipservice-092-208-106-227.092.208.pools.vodafone-ip.de [92.208.106.227])
 (Authenticated sender: julian.vetter)
 by mail2.vates.fr (Postfix) with ESMTPSA id 3C30981BB0;
 Tue, 28 Jul 2026 15:27:59 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=VZY0KcTsQEFDip0CqBqYkSAz21UVp4d34oXZAfOeDGo=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=ld4KG1rZslOi4+XIOOzM8eCzbWmZkbQIvikLiO8jV7VVUtu/bzKlwpr7UOF3WfNU0wxq5nRPp
 KC6QpB8DUomhNnnN22MHgIQPl2uSz6vBCTsycunPiu8DN4JxLXHo2+rasT2r1bUd06oxvS0wxEj
 UDcgwfqQz1Ul1kynzG8wfZgE2uaxos61m2LpNgYOII04Uvz760TjajvTPFq6IaUigeea0BOxspm
 b+jyICGGvZnZ9i0ZCaQ9aDgnUJHD3J6r5OjYLaxjR/o4VWk+HosohiIUNYqR5ZNjO0+McY3tkPK
 TC9ocBh3y9R3QRavd7qjoLgk33stQnvUsYZsG9HprN8A==
X-Zone-Loop: 2cb68def24a67cac2ef46d85f104f3f0a2a91b13fd63
x-campaign-type: default
x-transaction-id: 34833e55-42b9-492d-af47-2de698eccdf3
x-swg-uid: 01-6e3564b4-5607-4542-a748-f4b93a4f089d
X-Mailer: Sweego
Message-ID:
 <1785245280.8631fc262581453bbf619ec5b2062170.19fa8e926d1000e099@vates.tech>
x-swg-bid: 1785245280.8631fc262581453bbf619ec5b2062170.19fa8e926d1000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Tue, 28 Jul 2026 15:27:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/ocaml: fill arch_config for ARM in
 domain_getinfolist
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrii Sultanov <andriy.sultanov@vates.tech>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>
References: <1785143496.8631fc262581453bbf619ec5b2062170.19fa2d80d54000e099@vates.tech>
 <49b43341-5075-4989-a066-745373b0dc7e@citrix.com>
Content-Language: en-US
From: Julian Vetter <julian.vetter@vates.tech>
In-Reply-To: <49b43341-5075-4989-a066-745373b0dc7e@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.1564.774935ac0693ae05.19fa8e924c1.cef8f57cb56fe034=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1785245279425
X-purgate-ID: tlsNG-c1860d/1785245281-CF35D87B-146EAB8A/0/0
X-purgate-type: clean
X-purgate-size: 3562

---=Part.1564.774935ac0693ae05.19fa8e924c1.cef8f57cb56fe034=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 7/28/26 14:59, Andrew Cooper wrote:
> On 27/07/2026 10:11 am, Julian Vetter wrote:
>> In the function alloc_domaininfo() the arch_config field in domaininfo
>> is only filled inside #if defined(__i386__) || defined(__x86_64__)=2E O=
n
>> ARM the field is left unpopulated=2E caml_alloc_tuple() does not zero n=
ew
>> blocks,
>=20
> Hmm=2E=C2=A0 Yes it does=2E=C2=A0 caml_alloc_tuple() calls caml_alloc() =
which
> initialises with Val_unit everywhere=2E
>=20
> It is only caml_alloc_small() which doesn't allocate, and potentially
> ends up with garbage=2E
>=20
> Do you have details of the crash?=C2=A0 I think it ought to be a plain
> NULL(ish) deference from trying to interpret Val_unit as a pointer=2E
>=20

Sorry, you're right=2E My phrasing is actually wrong=2E Because as you sai=
d,=20
it's not garbage=2E Because it is zero'ed=2E It's just a "almost" NULL=20
pointer dereference and it terminates with a SIGSEGV=2E

I created a backtrace yesterday=2E Unfortunately I replaced the binaries=
=20
already and modified a lot of stuff in between for debugging=2E But here=
=20
are the details from my notes:

$ coredumpctl debug -1
=2E=2E=2E
Core was generated by `/usr/sbin/xenopsd-xc --config /etc/xenopsd=2Econf=
=20
--config-dir /etc/xenopsd=2Econf=2E'=2E
Program terminated with signal SIGSEGV, Segmentation fault=2E
#0  0x0000aaaadd311728 in camlXenops_server_xen__fun_14373 ()
[Current thread is 1 (LWP 21348)]

(gdb) bt
#0  camlXenops_server_xen__fun_14373 ()
      at ocaml/xenopsd/xc/xenops_server_xen=2Eml:3368
#1  0x0000aaaadd390d34 in camlXenops_server__fun_17304 ()
     at ocaml/xenopsd/lib/xenops_server=2Eml:3229
#2  0x0000aaaadd372c64 in camlXenops_task__with_tracing_1305 ()
     at ocaml/xenopsd/lib/xenops_task=2Eml:103
#3  0x0000aaaadd394100 in camlXenops_server__one_7593 ()
     at ocaml/xenopsd/lib/xenops_server=2Eml:3401
#4  0x0000aaaadd3943e8 in camlXenops_server__fun_19063 ()
     at ocaml/xenopsd/lib/xenops_server=2Eml:3432
#5  0x0000aaaadd3be558 in camlTask_server__run_1022 ()
     at ocaml/xapi-idl/lib/task_server=2Eml:192
#6  0x0000aaaadd45ab2c in camlDebug__fun_2365 () at=20
ocaml/libs/log/debug=2Eml:258
#7  0x0000aaaadd556dec in camlBacktrace__with_backtraces_1095 ()
#8  0x0000aaaadd45aa0c in camlDebug__with_thread_associated_inner_2357 ()
     at ocaml/libs/log/debug=2Eml:257
#9  0x0000aaaadd38359c in camlXenops_server__fun_13600 ()
     at ocaml/xenopsd/lib/xenops_server=2Eml:1174
#10 0x0000aaaadd5b4b84 in camlThread__fun_850 ()
#11 0x0000aaaadd6700c8 in caml_start_program ()
#12 0x0000aaaadd664a2c in caml_callback_exn ()
#13 0x0000aaaadd63ee88 in caml_thread_start ()
#14 0x0000ffffb0ecba88 in start_thread () from /lib64/libc=2Eso=2E6
#15 0x0000ffffb0f36e8c in thread_start () from /lib64/libc=2Eso=2E6


Line 3368 is match di=2EXenctrl=2Earch_config with ARM _ -> true | X86 _ -=
>=20
false

ldr x0, [sp, #192]      ; x0 =3D di # -> the domaininfo tuple pointer
ldr x23, [x0, #128]     ; x23 =3D Field(di, 16) # -> word 16 =3D arch_conf=
ig

and then it faults on the very next instruction when it tries to=20
determine whether it's ARM or x86=2E

> ~Andrew
>=20



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.1564.774935ac0693ae05.19fa8e924c1.cef8f57cb56fe034=---

