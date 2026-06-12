Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456C6CD8CA8
	for <xen-devel@archiver.kernel.org>; Fri, 12 Jun 2026 13:54:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1336704.1598492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY2Kc-0000Fs-9z; Fri, 12 Jun 2026 13:53:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336704.1598492; Fri, 12 Jun 2026 13:53:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY2Kc-0000Fj-7C; Fri, 12 Jun 2026 13:53:58 +0000
Received: by outflank-mailman (input) for mailman id 1336704;
 Fri, 12 Jun 2026 13:53:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebc1c488b000701b@swg.vates.tech>)
 id 1wY2KZ-0000FZ-Vr
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 13:53:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wY2KZ-005lo7-7C
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 15:53:55 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebc1c488b000701b@swg.vates.tech>)
 id 6a2c0f6b-bab6-0a2a0a5309dd-0a2a45048a08-16
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 15:53:54 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebc1c488b000701b@swg.vates.tech>)
 id 6a2c0f72-1dec-0a2a45040019-b9ff1c12aaa9-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 15:53:54 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ebc1c488b000701b.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 12 Jun 2026 13:53:50 +0000
Received: from l14 (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id EFF44862B9;
 Fri, 12 Jun 2026 15:53:49 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=JKAhfHm45xgN+zuaajomOoi8u+WopSFAKpFnKCugNVw=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=UTR88RPWhFVWP/9UUmhDDgUvU5KaZ0WN49q2+NqZ+okbxXDjIjD7AC9vr9TZWe66iSYu7URzz
 y8s8Xl4KDgn4qYExB0y26ujdF5U7hnV1Y8wz3Ynsia/kuF+Is8lSfvGeqg31TAGova61jGboX0d
 EHLDqolZKJPxNSZqGSLqPEYIxp18895MvQMKySImcNE5sgt5YO+qwdzXx7Fbq6VN9OZzU8eHc1U
 2R5H8zV5P35KWGEorlJkQIpAnqSD8CNgeL6PAEiyHBq2JTQ//G82QmuTj2ejKC9xmLvF69E3Tce
 vfqAeIOi7ewEL5MJnNTNbRvO27N2zb52oH6RKfydKS8g==
X-Zone-Loop: c04c46054b1c8ccc98d0239195b3f45d6192c06217bd
x-campaign-type: default
x-transaction-id: 770cb325-bec6-41e4-a8aa-cc17f1f6f1ac
x-swg-uid: 01-c865852e-4bb7-4142-a3a2-d360a972b00c
X-Mailer: Sweego
Message-ID:
 <1781272430.8631fc262581453bbf619ec5b2062170.19ebc1c488b000701b@vates.tech>
x-swg-bid: 1781272430.8631fc262581453bbf619ec5b2062170.19ebc1c488b000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 12 Jun 2026 15:53:49 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Subject: Assertion '!is_idle_vcpu(v)' failed after 'Remove fully_eager_fpu'
 commit on EFI
MIME-Version: 1.0
Content-Disposition: inline
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.11d.be8f80ee35e09593.19ebc1c4631.b71200c26bd7ce99=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781272430134
X-purgate-ID: tlsNG-ebf023/1781272434-435683FF-2F82C22B/0/0
X-purgate-type: clean
X-purgate-size: 1488

---=Part.11d.be8f80ee35e09593.19ebc1c4631.b71200c26bd7ce99=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Since commit dba44e051209 ("x86: Remove fully_eager_fpu"), I can't boot
a machine and get assertion '!is_idle_vcpu(v)' failed instead=2E It's
netbooted and EFI=2E

Xen call trace:
   [<ffff82d04033da2c>] R vcpu_save_fpu+0x65/0xdc
   [<ffff82d04029c5c4>] S efi_rs_enter+0x37/0x16a
   [<ffff82d04029c7e3>] F efi_get_time+0x19/0xb2
   [<ffff82d04047cbf0>] F init_xen_time+0x1e3/0x2b4
   [<ffff82d040477a49>] F __start_xen+0x1d71/0x24b8
   [<ffff82d0402043e7>] F __high_start+0xb7/0xc0

Assertion '!is_idle_vcpu(v)' failed at arch/x86/i387=2Ec:195

A few more lines from Xen:
    CPU Vendor: Intel, Family 6 (0x6), Model 86 (0x56), Stepping 3 (raw 00=
050663)
    Bootloader: GRUB 2=2E06
    [=2E=2E=2E]
    Enabling APIC mode=2E  Using 2 I/O APICs
    ENABLING IO-APIC IRQs
     -> Using old ACK method
     =2E=2ETIMER: vector=3D0xF0 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D-1
    TSC deadline timer enabled
    Assertion '!is_idle_vcpu(v)' failed at arch/x86/i387=2Ec:195

Commit this Xen is built from: 50936ea05660=2E

full logs at:
    https://paste=2Evates=2Etech/?bd8a9a0955798a97#A1DU2efwUt7bbHQUxdo9UXG=
csJ2XPNJNZHPz87LqLtcF

Thanks,


-- 
 | Vates 

XCP-ng & Xen Orchestra - Vates solutions

web: https://vate=
s=2Etech
---=Part.11d.be8f80ee35e09593.19ebc1c4631.b71200c26bd7ce99=---

