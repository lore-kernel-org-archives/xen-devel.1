Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03CECC6B1A
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 11:38:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448837.1664860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGxJ1-0002qI-0u; Wed, 14 Oct 2026 11:37:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448837.1664860; Wed, 14 Oct 2026 11:37:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGxJ0-0002qB-UX; Wed, 14 Oct 2026 11:37:58 +0000
Received: by outflank-mailman (input) for mailman id 1448837;
 Wed, 14 Oct 2026 11:37:57 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13a3453cd0008425@swg.vates.tech>)
 id 1xGxIy-0002oF-UV
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 11:37:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGxIy-00GY0D-50
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 13:37:56 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13a3453cd0008425@swg.vates.tech>)
 id 6acf6985-8faa-0a2a0a5109dd-0a2a4506db84-36
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 13:37:56 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13a3453cd0008425@swg.vates.tech>)
 id 6acf6993-195a-0a2a45060019-b9ff1c1296e1-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 13:37:55 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a13a3453cd0008425.00a for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 14 Oct 2026 11:37:50 +0000
Received: from [192.168.27.69] (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter)
 by mail2.vates.fr (Postfix) with ESMTPSA id 7A4DF81C40;
 Wed, 14 Oct 2026 13:37:48 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=bcazpVnqkdFyGQ5XMhN/ZYe7RqYqiecYYMqSrWxxu9I=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=ARECPwwdJBLsv+oVD17Ar7oTedenPvDFdwGYKVJuVy5ysadzOvZVtNLUWj+ZLUcxQHG+vV1BN
 V7p6IGeCndXpM5ocG3mimr3w0DAi0xYkWZfyqm9qdg8BFWCj8jmzT0mRxkzXXCv/Fyx+YDuOJu/
 uoRygQfiNV44l7MUM0lXpFS63QYDVg1TSaaCtQ8aBqpvXTUUUu8e/MU/5f1HxR+n2lVZNmXV/G7
 mhSxciV+kWjic+TCGmoTIXQrn8JyOBN6laP64n6VD05uO3PuXQH/P4K+xBToi7pz0ymLne4331R
 h6B0KnUYBXliNplVAxN0k5PRr534WaJ14zJfiTVKC7Dg==
X-Zone-Loop: 5ccbbaf0ed233bbc27aa51e3f4f169cb6a024cadae9a
x-campaign-type: default
x-transaction-id: cbe75cd9-4821-419b-9cfb-d6ff75fd1e31
x-swg-uid: 01-fee874a4-b743-474c-bde6-0621a24b9a92
X-Mailer: Sweego
Message-ID:
 <1791977870.8631fc262581453bbf619ec5b2062170.1a13a3453cd0008425@vates.tech>
x-swg-bid: 1791977870.8631fc262581453bbf619ec5b2062170.1a13a3453cd0008425
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 14 Oct 2026 13:37:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/5] Fix ARM domcreate
To: "Orzel, Michal" <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>, Andrii Sultanov
 <andriy.sultanov@vates.tech>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Teddy Astie <teddy.astie@vates.tech>
References: <1791812199.8631fc262581453bbf619ec5b2062170.1a13054627300080d7@vates.tech>
 <2482f3cc-e9b6-48d9-b8d5-a463feb82dfa@amd.com>
Content-Language: en-US
From: Julian Vetter <julian.vetter@vates.tech>
In-Reply-To: <2482f3cc-e9b6-48d9-b8d5-a463feb82dfa@amd.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.1c0.67e1c98e15f75819.1a13a34510e.93d265343ff7e2f1=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791977869587
X-purgate-ID: tlsNG-16d1c6/1791977876-F7ACA77B-5727601E/0/0
X-purgate-type: clean
X-purgate-size: 3324

---=Part.1c0.67e1c98e15f75819.1a13a34510e.93d265343ff7e2f1=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 10/13/26 2:28 PM, Orzel, Michal wrote:
>=20
> On 12-Oct-26 15:36, Julian Vetter wrote:
>> Hello Michal and Anthony,
>> thank you for the reviews and acks! Michal, I have addressed your
>> remaining remarks on the "xen/arm: report clock_frequency via sysctl
>> physinfo, not createdomain" patch=2E The golang bindings are regenerate=
d
>> for the new arm_clock_frequency_hz physinfo field, and
>> alloc_domaininfo() no longer references the removed clock_frequency
>> field=2E Apart from that I have collected the Acked-by/Reviewed-by tags=
=2E
>>
>> Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
> I was about to commit the series but I found out that some tests like
> test-mem-claim and possibly others still pass gic_version=3D0 which will=
 cause the
> domain creation to fail=2E You need to update the tests=2E

Yes, thank you=2E I didn't see this=2E I have fixed the tests, and ran the=
m=20
on a QEMU setup=2E 2 of them now pass the domain creation at least just=20
like on master (1 doesn't work on QEMU because there is no IOMMU=20
emulation?!):

```
@@@ RUN test-mem-claim
Memory claims tests
Free pages: 254208, Oustanding claims: 0
   Created d1
   Failed to populate physmap domain: 16 - Resource busy
@@@ RESULT test-mem-claim rc=3D1
@@@ RUN test-paging-mempool
Paging mempool tests
(XEN) [   28=2E386587] common/domain=2Ec:845: IOMMU requested but not avai=
lable
   Skip: 22 - Invalid argument
@@@ RESULT test-paging-mempool rc=3D0
@@@ RUN test-resource
XENMEM_acquire_resource tests
Test ARM
   Created d3
   Failed to populate physmap domain: 16 - Resource busy
@@@ RESULT test-resource rc=3D1
@@@ ALL DONE
```

But, unfortunately, these tests seem broken on ARM even on master,=20
because on ARM domains start with an empty P2M pool, and since these=20
tests call xc_domain_create() without setting the pool size first, they=20
fail on the populate physmap call=2E I'm not sure how to proceed on this=
=2E=20
Should I fix these tests in their entirety or leave this for another=20
patch set? Thank you for your advice=2E

>=20
>>
>> Andrew Cooper (1):
>>    ARM/sysctl: Expose the supported guest GIC modes in physinfo
>>
>> Julian Vetter (4):
>>    tools/arm: choose GIC version explicitly instead of relying on
>>      GIC_NATIVE
>>    xen/arm: remove XEN_DOMCTL_CONFIG_GIC_NATIVE from the ABI
>>    xen/arm: report clock_frequency via sysctl physinfo, not createdomai=
n
>>    xen: make config argument const
> Here you are still missing tags from e=2Eg=2E RISCV I think=2E
>=20
> ~Michal
>=20

Thank you again for pointing this out! Unfortunately neither PPC nor=20
RISC-V have a formal maintainer defined in the MAINTAINERS file, so it's=
=20
actually "THE REST" responsible(s), which is also you ;-) For RISC-V I=20
have asked internally to do a review, but this will only add a=20
'Reviewed-By' not a full 'Ack'=2E So, not sure what to do about it=2E


-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.1c0.67e1c98e15f75819.1a13a34510e.93d265343ff7e2f1=---

