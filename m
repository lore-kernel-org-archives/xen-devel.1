Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40BBC55184
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 18:48:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382557.1625909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrKBe-0006Qi-61; Tue, 04 Aug 2026 18:48:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382557.1625909; Tue, 04 Aug 2026 18:48:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrKBe-0006Qb-2n; Tue, 04 Aug 2026 18:48:26 +0000
Received: by outflank-mailman (input) for mailman id 1382557;
 Tue, 04 Aug 2026 18:48:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wrKBd-0006QU-6k
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 18:48:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrKBc-00282X-JZ
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 20:48:24 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a7233db-2eae-0a2a0a5409dd-0a2a4503b71e-30
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 20:48:24 +0200
Received: from [209.85.128.179] (helo=mail-yw1-f179.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a7233f7-fae8-0a2a45030019-d15580b3d0e9-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 20:48:24 +0200
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-81f36179d72so2831187b3.2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 11:48:24 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1785869303; cv=none;
        d=google.com; s=arc-20260327;
        b=hrB4v5JwrlR1c80ACP0mDU4F2i+vYhy9zmseELS6dFRLXGu5e9NERT6alZDeMut/bq
         4/Pm2mVwADRaAwFfhoSFFiGkz1GbZQot0CtJWmiv168ZC4cHicvJRk8irO9tRfOdlhn4
         X65T8Xd04VNkOkkF/OOAa/MUM/uIivaLkdnSvZr7gmmuOU3IG2pgWQH6lJnf8ABBdlYj
         wRoyMX3VWccLySAVn5oInhYimQ/mP80ibWg11PO1yavWOpr0LluBvfiCUStX9poZLLo7
         UYYQiI8NiVWTrDy7inh4ObKhMQtx5lkt/VhWD7eKC00gjohEbyYnLeiOav71cmhLBUIj
         4Bgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7hHb7A/iv/3NbWaHGGYKFA8iWxf7Etm7iPDj2vr104Y=;
        fh=RLhUWlRjq6yfpKY+h1JZzBpOTuG/g/EB3etsFhEdDDk=;
        b=IEF0C5x9/Zz10gdP3AGbNue2dEXxOvNVI0CWxFy95hwG0xhgfyCku3fN0lwg0GxN9v
         QHgPcy827tpvkPC9mSTZnV7iYCFO1tjm07FSfZJlPzivdg9oHbuTqInMzTRzr7V/JbGG
         DqCboeKso0bYnxh9z7RRzu2kkye4eCA1iekK+kxuTDjofgcM+hAh5obewWCVtPmD4Rnb
         4u8cBMQdIsDA5pFH0GRjYtYBQzgMqFvkof4grsXqWlkPaq7wLUlq9ODShUiRxuhuSjeg
         23SF/epheUqTV7qqsOXbOAndN5HtN3pD0V/Kh1LgN1pztD/dAJ42cCJZoqKdUiSTPItT
         0uGg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785869303; x=1786474103; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7hHb7A/iv/3NbWaHGGYKFA8iWxf7Etm7iPDj2vr104Y=;
        b=kunGUCAKyZS+QhtUN9mIrCYPDBvTVS6nmHFOPrp/pYqWJ6+EXys5Sn5JIiTmFA1+wo
         DVJfk0sFswyd+XSneXSrm+HFNgYo1r7RJnVN8hw34VTRqO4XDP1iBdY5snI9ZxGHMKy6
         6PV5QDTAdIr61JRZYem/Ym0dCYEfHxeRaoIlCD1gZ6OGegxBVRSqC7GQw0i0IvR2qfKn
         uE0ZLhaMm5a4QdXBKU5xHH/XtvyfJC0EG678iZBqLoCALhXXvIko533wfif8T+vrRJNa
         /KvQHYAtdPvR+zGDDhF2N4S/iLtjmQ2FZPZnaHmfkkVuaZHYAfg95u+yee/TwcbUZxRo
         wHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785869303; x=1786474103;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7hHb7A/iv/3NbWaHGGYKFA8iWxf7Etm7iPDj2vr104Y=;
        b=gaStgkDCYseoJJk9i7Ofh+ASriWFVI+b2xzFSnmP7Zab+NNCYwSRucrbS3fpXTUZCo
         eX4AxRBCqsi/P602o8eBPmwtuBOZbpcr8sG8GQLbG03MH+EbNyjDzDM+VKu9xv4/7dVe
         f0hkLirsDyADC4RYvHSwDNVjkaZykmA3+/Zo0bwenIcQsRByP+ShyE1Rdj70D+bH3OTZ
         ltY8gx/+JbJseC7CcASeuv0OZomqGO7YUhHuPHPzInYxo2WLs6xJUXEEYLWGVcNXtS8z
         AoJBMBYJsMkPxLauHSTRCeeblQxE0n+itxykp2zHYfkdlyFCpj8kBrA138/P27LqT8EY
         n4TA==
X-Gm-Message-State: AOJu0Yx6J6xmWy4FwyYn3PTOMj+JRk55/T3NGgdYCRJDCmyIn4SaWPtv
	j/XyYqtJltACQgGqldPGfXxlDM8rP2YtZUyLf2C2PC3uQKmX8lEpzvfN0b6ShO16IgAc/lwA1+m
	/MuujbwvfjNd5+idwSqzkfBqRtZa/EOo=
X-Gm-Gg: AR+sD10JhUZH2/CJRz1MgZHrxxaY3NIEwYxONXx168cbW7wNkcD92YYgUF56Ts+iztI
	upMgl/Dt3QalhYHoCacaZdbtQG2GAjyMs78WkFEPgrw19etC3ncyu3ow91gl0xq08PoCZXv8mGk
	cC1eW/3T2l/IZEL/mjFkniNpKWUMvaedAC9Oko6R6dEavyKQ5QhpIrmxSXK6OsHNhdwpoUze1f0
	ChWZz/SnC+H1yxdfmekmrPqm/Hg23/pNXy/aDdt8mZea0sV6aocY7HHaCozwaxX+7X9jaqNVG4e
	PiQpO8ssxpHApFt6MI+xQJ7qeOt7TzxHqy59aMnUbJYQ+w37TOsBpY5xia9ZeGqQ673QBJ+q+C7
	V
X-Received: by 2002:a05:690c:c4e9:b0:81e:9b09:7263 with SMTP id
 00721157ae682-820222bbbf6mr4493457b3.10.1785869302838; Tue, 04 Aug 2026
 11:48:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260804174219.835096-1-frediano.ziglio@citrix.com>
 <20260804174219.835096-3-frediano.ziglio@citrix.com> <anIn7VAt2oQJ90Js@mail-itl>
In-Reply-To: <anIn7VAt2oQJ90Js@mail-itl>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Tue, 4 Aug 2026 19:48:10 +0100
X-Gm-Features: AUfX_mxZCKZPTK0G0XIsRbFiVIkMddiIg6XauhFcmZwsjjLI9vmE9jxSgwKs0lI
Message-ID: <CAHt6W4eCdqp2NDzjHyQ9vdezJkjVyxTwJH7HuReVxVSihox0Rw@mail.gmail.com>
Subject: Re: [PATCH 2/2] CI: Check save/restore of PV domain as part of qemu-alpine-x86_64
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, 
	Frediano Ziglio <frediano.ziglio@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-33051d/1785869304-6FCC34E9-9D2B3B38/0/0
X-purgate-type: clean
X-purgate-size: 4071

On Tue, 4 Aug 2026 at 18:57, Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Tue, Aug 04, 2026 at 06:42:18PM +0100, Frediano Ziglio wrote:
> > Make sure that save/restore continue to work.
> > The check save and restore twice to check for corrupted status.
> > Also a command is launched in the guest to make sure that the
> > machine is not crashed but working.
> >
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> > ---
> >  automation/scripts/console.exp           |  8 +++++
> >  automation/scripts/qemu-alpine-x86_64.sh | 40 ++++++++++++++++++++++--
> >  2 files changed, 46 insertions(+), 2 deletions(-)
> >
> > diff --git a/automation/scripts/console.exp b/automation/scripts/consol=
e.exp
> > index e27886bbef..ff58ed29b8 100755
> > --- a/automation/scripts/console.exp
> > +++ b/automation/scripts/console.exp
> > @@ -58,6 +58,14 @@ if {[info exists env(WAKEUP_CMD)]} {
> >      system "$env(WAKEUP_CMD)"
> >  }
> >
> > +if {[info exists env(EXPECT_TEXTS)]} {
> > +    set lines [split "$env(EXPECT_TEXTS)" "\n"]
> > +    foreach {exp snd} $lines {
> > +        expect -re "$exp"
> > +        send "$snd\n"
> > +    }
> > +}
> > +
> >  if {[info exists env(LOG_MSG)]} {
> >      expect {
> >          -notransfer -re "$env(PASSED)" {
> > diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scri=
pts/qemu-alpine-x86_64.sh
> > index 60f5cc49fc..409a601c34 100755
> > --- a/automation/scripts/qemu-alpine-x86_64.sh
> > +++ b/automation/scripts/qemu-alpine-x86_64.sh
> > @@ -48,6 +48,28 @@ xl -vvv create -c /root/domU.cfg
> >
> >  " > etc/local.d/xen.start
> >  chmod +x etc/local.d/xen.start
> > +
> > +# Script to test save and restore.
> > +# It saves and restores domU domain twice to check if the domain was c=
orrupted
> > +# during the first sequence.
> > +# At the end open the console to check if the domain is working.
> > +cat > root/save_restore_test << "EOF"
> > +#!/bin/sh
> > +set -ex
> > +xl list | grep -q domU
> > +rm -f save.dat
> > +xl save "$(xl list | awk '$1=3D=3D"domU" { print $2 }')" save.dat /roo=
t/domU.cfg
> > +xl restore /root/domU.cfg save.dat
> > +xl list | grep -q domU
> > +rm -f save.dat
> > +xl save "$(xl list | awk '$1=3D=3D"domU" { print $2 }')" save.dat /roo=
t/domU.cfg
> > +xl restore /root/domU.cfg save.dat
> > +xl list | grep -q domU
> > +rm -f save.dat
> > +xl console "$(xl list | awk '$1=3D=3D"domU" { print $2 }')"
> > +EOF
> > +chmod +x root/save_restore_test
> > +
> >  find . | cpio -R 0:0 -H newc -o | gzip >> ../dom0-rootfs.cpio.gz
> >  cd ../..
> >
> > @@ -70,9 +92,23 @@ export TEST_CMD=3D"qemu-system-x86_64 \
> >      -device virtio-net-pci,netdev=3Dn0 \
> >      -netdev user,id=3Dn0,tftp=3Dbinaries,bootfile=3D/pxelinux.0"
> >
> > +# Sequence of expect/send strings:
> > +# 1. wait domain start and close console;
> > +# 2. wait login prompt and login as root
> > +# 3. wait login and launch save/restore test;
> > +# 4. wait restore from domain console and send a command.
>
> Why doing this interactively over serial, instead of adding to
> etc/local.d/xen.start and then printing test result at the end?
>

I'm using expect to interact with the console. expect is not available
inside the alpine root filesystem.
Some failure I had during migration is that the VM crashed. In the
script I interact with the console to check that the VM is still able
to run commands.

> > +gs=3D$'\x1d'
> > +export EXPECT_TEXTS=3D"BusyBox
> > +$gs $gs
> > +login:
> > +root
> > +login on
> > +/root/save_restore_test
> > +Restarting tasks
> > +dmesg | grep suspending | tr o 0"
> > +
> >  export TEST_LOG=3D"smoke.serial"
> >  export BOOT_MSG=3D"Latest ChangeSet: "
> > -export LOG_MSG=3D"Domain-0"
> > -export PASSED=3D"BusyBox"
> > +export PASSED=3D"suspending xenst0re"
> >
> >  ./automation/scripts/console.exp |& sed 's/\r\+$//'
> > --
> > 2.43.0
> >
>
> --
> Best Regards,
> Marek Marczykowski-G=C3=B3recki
> Invisible Things Lab

