Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C15CD98CE
	for <xen-devel@archiver.kernel.org>; Fri, 12 Jun 2026 15:25:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1336817.1598600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY3lD-0008P1-PZ; Fri, 12 Jun 2026 15:25:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336817.1598600; Fri, 12 Jun 2026 15:25:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY3lD-0008Ou-Mp; Fri, 12 Jun 2026 15:25:31 +0000
Received: by outflank-mailman (input) for mailman id 1336817;
 Fri, 12 Jun 2026 15:25:30 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebc701bf9000701b@swg.vates.tech>)
 id 1wY3lC-0008C7-ES
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 15:25:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wY3lB-002bt7-RV
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 17:25:29 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebc701bf9000701b@swg.vates.tech>)
 id 6a2c24da-bab6-0a2a0a5309dd-0a2a450ad11e-20
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 17:25:29 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebc701bf9000701b@swg.vates.tech>)
 id 6a2c24e8-56b3-0a2a450a0019-b9ff1c128719-4
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 17:25:29 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ebc701bf9000701b.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 12 Jun 2026 15:25:24 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id E762886462;
 Fri, 12 Jun 2026 17:10:41 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=Tbr8I1iMpgkaLnf5k8Q5WSTqhhyF0+HBjO1e05ShTkM=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=LtNh/TtB9WqGO8j7DXWaRD3N5RsoDf4y855AHsLcaILCAhiuH6e9pTmaV8csj156nh83xXi4U
 i2Ick97mLyxuK4n0dDu/PArdu+xHcpLywNc0H0xOtzscMvctmjAzvEtXtrbwgBOIvTDo5I5ujv5
 szK/Y++anMN28JMvg4aB96oqbrMnFtBpBa8g4eNUgSlx4/TX5cySsRUfkXvJGZyJIXMqWfU3eud
 jCoPK1gwUvtabEx43Xkrj99vhR0qCF0CWOaRBxEF64gF/aPfKAhWRRD5Ddn1viKcXFkMjyboyrX
 sKIr8Iii5+Aa36LvqQFgHt+KjUxqHBJ1q9VFZqufY0+w==
X-Zone-Loop: c5768d63b932d4bc3f7e50284a7e203331568778d64a
x-campaign-type: default
x-transaction-id: 97beae1d-918d-46c6-a3ad-0555d056533b
x-swg-uid: 01-b2240e31-8749-4828-9362-b8ee94fea7a3
X-Mailer: Sweego
Message-ID:
 <1781277924.8631fc262581453bbf619ec5b2062170.19ebc701bf9000701b@vates.tech>
x-swg-bid: 1781277924.8631fc262581453bbf619ec5b2062170.19ebc701bf9000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 12 Jun 2026 17:10:41 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	xen-devel@lists.xenproject.org,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: Assertion '!is_idle_vcpu(v)' failed after 'Remove
 fully_eager_fpu' commit on EFI
References: <1781272430.8631fc262581453bbf619ec5b2062170.19ebc1c488b000701b@vates.tech>
 <aiwTkDUP6rDPbV6R@mail-itl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aiwTkDUP6rDPbV6R@mail-itl>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.13e.ef8b376a96e155b6.19ebc62a5ad.4a6b569f23778037=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781277042094
X-purgate-ID: tlsNG-4011c0/1781277929-6FD588B7-0E4EC248/0/0
X-purgate-type: clean
X-purgate-size: 2250

---=Part.13e.ef8b376a96e155b6.19ebc62a5ad.4a6b569f23778037=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 04:11:28PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Fri, Jun 12, 2026 at 03:53:49PM +0200, Anthony PERARD wrote:
> > Hi,
> >=20
> > Since commit dba44e051209 ("x86: Remove fully_eager_fpu"), I can't boo=
t
> > a machine and get assertion '!is_idle_vcpu(v)' failed instead=2E It's
> > netbooted and EFI=2E
> >=20
> > Xen call trace:
> >    [<ffff82d04033da2c>] R vcpu_save_fpu+0x65/0xdc
> >    [<ffff82d04029c5c4>] S efi_rs_enter+0x37/0x16a
> >    [<ffff82d04029c7e3>] F efi_get_time+0x19/0xb2
> >    [<ffff82d04047cbf0>] F init_xen_time+0x1e3/0x2b4
> >    [<ffff82d040477a49>] F __start_xen+0x1d71/0x24b8
> >    [<ffff82d0402043e7>] F __high_start+0xb7/0xc0
> >=20
> > Assertion '!is_idle_vcpu(v)' failed at arch/x86/i387=2Ec:195
> >=20
> > A few more lines from Xen:
> >     CPU Vendor: Intel, Family 6 (0x6), Model 86 (0x56), Stepping 3 (ra=
w 00050663)
> >     Bootloader: GRUB 2=2E06
> >     [=2E=2E=2E]
> >     Enabling APIC mode=2E  Using 2 I/O APICs
> >     ENABLING IO-APIC IRQs
> >      -> Using old ACK method
> >      =2E=2ETIMER: vector=3D0xF0 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D-=
1
> >     TSC deadline timer enabled
> >     Assertion '!is_idle_vcpu(v)' failed at arch/x86/i387=2Ec:195
> >=20
> > Commit this Xen is built from: 50936ea05660=2E
>=20
> Interesting, the efi_get_time() way is nowadays a fallback if cmos one
> isn't advertised=2E Can you try adding `cmos-rtc-probe`?

Yep, that works=2E I could boot the machine=2E There's not much changes in
the logs, beside different memory mapping, and otherwise this:

    TSC deadline timer enabled
    Wallclock source: CMOS RTC
    Allocated console ring of 128 KiB=2E
    mwait-idle: MWAIT substates: 0x2120
    mwait-idle: lapic_timer_reliable_states 0x2
    HPET: 8 timers usable for broadcast (8 total)
    [=2E=2E=2E the rest of the boot]

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.13e.ef8b376a96e155b6.19ebc62a5ad.4a6b569f23778037=---

