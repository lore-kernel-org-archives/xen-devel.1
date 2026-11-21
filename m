Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A491B606A320
	for <xen-devel@archiver.kernel.org>; Sat, 21 Nov 2026 18:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C+9pIBrB
Received: from list by lists.xenproject.org with outflank-mailman.1499145.1696278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUpst-0002u1-As; Sat, 21 Nov 2026 18:32:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1499145.1696278; Sat, 21 Nov 2026 18:32:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUpst-0002tt-5e; Sat, 21 Nov 2026 18:32:23 +0000
Received: by outflank-mailman (input) for mailman id 1499145;
 Sat, 21 Nov 2026 17:28:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <fengaojigui88@gmail.com>) id 1xUotU-00027Y-FF
 for xen-devel@lists.xenproject.org; Sat, 21 Nov 2026 17:28:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUotT-008m6A-CK
 for xen-devel@lists.xenproject.org; Sat, 21 Nov 2026 18:28:55 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <fengaojigui88@gmail.com>)
 id 6b01d4ce-e002-0a2a0a5209dd-0a2a450cdadc-2
 for <xen-devel@lists.xenproject.org>; Sat, 21 Nov 2026 18:28:55 +0100
Received: from [74.125.230.73] (helo=mail-lr2-f9.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <fengaojigui88@gmail.com>)
 id 6b01d4d6-f479-0a2a450c0019-4a7de649ec97-3
 for <xen-devel@lists.xenproject.org>; Sat, 21 Nov 2026 18:28:55 +0100
Received: by mail-lr2-f9.google.com with SMTP id
 38308e7fff4ca-3ad106d6cbfso9426081fa.1
 for <xen-devel@lists.xenproject.org>; Sat, 21 Nov 2026 09:28:55 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1795282134; cv=none;
        d=google.com; s=arc-20260327;
        b=Wc3DWOOcPD+FTBVW+SEMVmOP2yHjPuUrozvJK3gbkuSvqu0IvI9QhI4W97oN1eKXBY
         UR7E1EBenPXFRgJJJBMNrmwto4Id4NxSmxbwDuXkbQxwAnH5L1A9DVVT8rJPCZjIB08+
         tt1n6T8niG//ts/pyCwwTjtiy3xMg9evJUolaChMvH4sjw2/t4h7tXSw0Gub/WHc8Eed
         3+WG6/7JuzNapT7iFbj2sKH/2EiTw2IupR6hQ5xVXnTvDvtgWA8X1m1AZqQ1RzL+Ku2j
         e4e7CVSJoprLFvPV9Kbo5ql8IuYHDeL3ImMyIjhWaSYD1r0HoJ6iDJdGqzLyajOLgv4T
         HN3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=DCLA3o2NGcsUsCeKdpfpu0O9OUOc9q0N8lXAsyG+wTU=;
        fh=NtqU41rBBkZENgVqV2HtIBTK+Xy9L603M0ZkEykZDvQ=;
        b=pkQIjK+LJJPpzavPLmIzMG2boBWUNDrf9OV7gB2sk5nm5aaCLvLId7HBrhXRkNRkVk
         GOIuu9gEMaJRpwpzFGLK2Ibgl4tmim99qPAmzVYL79DFiaMbkLRVLVj/e2lWwlNwqexx
         Ya+DzROXm3N6rePBEXhyDXpT5iR7WfPi4jY+E9+yp9nNJtY6CkR0yZDlhPcfxtyhb4qS
         qcdf/DqC8MrI+/WMsxN7NZvUc4au3Rfnn6FfNX4DgCpQ1UlxAG2nJpIaDKdI1IljpjDO
         9v0nQdt4/KdlFvDzFdsuIrUQE66aMYtecP2Kz4UQULzz0KKnYRzoMPQ3+hNSDI0BPXiq
         tPiA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795282134; x=1795886934; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DCLA3o2NGcsUsCeKdpfpu0O9OUOc9q0N8lXAsyG+wTU=;
        b=C+9pIBrBJouQHpdZtDCVtGi4wp9EDVqCRImmin9gh+lwt00Bu15VobxVceh9+eKxR8
         vpMDGsx1zChdioYApxcIG2B0cJRwKNVe+bTr3mf7Bvdv+yhGH1oKGvVn7h0u5zwN54JD
         SQjE9++KCGI0uvIJiPiqONTrlzdieikTtdeKtEjWasRVJHzYT8PPYTmXMe9XgSCizrHS
         j/hef62Lxru1kqnBymxg6wVGRHgjfiwGzec4G+iL730qU69oOCTTmXUInh457HAc9xAI
         b7gXf2dJnH1g2mfzyiE/LQegvnm2iF+R9X1kdUaFLgCA1rD/I80Jhr/RvNfzzKhBMiUj
         ipPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795282134; x=1795886934;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DCLA3o2NGcsUsCeKdpfpu0O9OUOc9q0N8lXAsyG+wTU=;
        b=H4994XZnFJoc1tAlMUk7CQA1/qGhzAV9ehmwOp6jyQ2MztKZJLrREMqFRuo5RAC7wP
         PsJX3p6QJQTD/WWRHOvqnaspvPyXnhW3B2nbSjjsd5FZkpfd2G2tMXMBl30/ISs3I1qm
         Jrw+rCMLIhYjceq11mbVVRE7l0KbpldHIwypgPOlpayscUKMIBsxcu8iqbVGQgzLuBLi
         u8tcSPQR0a5yTQJDhd/wZ8st3bsEGA4r+mE7UR7FlQFf6x0icA+6OqUWRPjsNgQKKnpQ
         BWH2T2uWWlc0zfG2CzsDS3r2vm2KVEc+RVHQahx2eXswja0QkaVxZ6n9oBrfKAxDtnMp
         d0+w==
X-Forwarded-Encrypted: i=1; AL+hErGz0/ll6waVV5VCnNDYyh423EM9Nk8iqQ6NJmtnWYRe0AnRjsCkDT4/nGnxJH3a+f74F3vmIfHfhgE=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9iy+k1dDACkzuB+HeFZwFgqErMtCGLgBEZ8KFUUL16T80kCvwr
	ZnS83e/60ojzgjOGP7+7eGeQC6ZG2TrrALz5LjO9UiGdxGuuuIEt1/JFV8cjLXfCNg3mltN9tmz
	MtBxAEd6Zl3V4QNNynK9L7tuOZMtemlc=
X-Gm-Gg: AZFdTZdM/QKIzkDH0pcNF7z0T8+vMxDFmEdndtMibgU4Z/vIg3uW1lQB3/QFygbUen0
	/7aXeoIIOANTZqxbEHWI6Xs5IwSfW/RF2EMRn4O7G80XK9/irkd7AvT4n7Vi53tykQ63fxRJHiR
	XAY/g7M/XTOxd30iKa0e4TG8ca1wF/rgPG7o610Y+JEDkzArNT2C8et0TwI0Bm/x9nGXcweMH5f
	4b/e1mRU90vdznIRg2EUXdK0Kc9A6u/9J2vRFg19zJtU8qEf1wvx530VbG2LRyG+cS8THXdX/7k
	5llJk9L5D3WjQw4HeR8LGSB6XMB2l4BJRiBDKMeYdVufj7vsq5n/P6iTNubVns++hQg7qIEAn/o
	iuekdRY50uVwdbXCZbn/6A0ZpY5Gg4/Av5y3KyhH/qLIRemaPTrCrRpNkiAA9IRsuPIE=
X-Received: by 2002:a05:651c:419b:b0:3a3:7682:49a1 with SMTP id
 38308e7fff4ca-3ae7fa3ac6fmr17559001fa.22.1795282134270; Sat, 21 Nov 2026
 09:28:54 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Zheng Zheng <fengaojigui88@gmail.com>
Date: Sun, 22 Nov 2026 01:28:39 +0800
X-Gm-Features: Aa3M54plDJziP3_T6TamE_LALOBZqkSmXnp5uvjP_CU0mpq17_H4ujLNSncIBDs
Message-ID: <CAO-4RZ3VRVmg-8wrej_cs5fopaEjKLtusEAyah9G4y+XLcWj4Q@mail.gmail.com>
Subject: [BUG] WARNING in __kvm_gpc_refresh (virt/kvm/pfncache.c:267, v7.4-rc3)
To: pbonzini@redhat.com
Cc: seanjc@google.com, dwmw@amazon.co.uk, kvm@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d25034/1795282135-77ED2A5B-952BA921/0/0
X-purgate-type: clean
X-purgate-size: 5511
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Paolo, Sean, David,

We found a reproducible warning on v7.4-rc3 with syzkaller: the KVM guest
page cache invariant "either gpa or uhva must be valid, but not both" is
violated while KVM emulates a Xen event-channel send.  The supplied
recipe reproduced on independent fresh VMs; no state snapshot is
required.

Repository and reproducer:

  https://github.com/Zheng-zheng-codes/kvm-gpc-refresh-warning
  commit f9bb1f09b4070e6b19fdc49a10297b2afe7e5fb8

Report
------

  kvm_is_error_gpa(gpa) =3D=3D kvm_is_error_hva(uhva)
  WARNING: arch/x86/kvm/../../../virt/kvm/pfncache.c:267 at
__kvm_gpc_refresh+0x1692/0x1e40
  RIP: 0010:__kvm_gpc_refresh+0x1692/0x1e40 virt/kvm/pfncache.c:267
  Call Trace:
   kvm_gpc_refresh+0xed/0x160 virt/kvm/pfncache.c:382
   kvm_xen_set_evtchn.part.0+0x1b3/0x280 arch/x86/kvm/xen.c:2014
   kvm_xen_set_evtchn arch/x86/kvm/xen.c:2115 [inline]
   kvm_xen_hvm_evtchn_send+0x22f/0x290 arch/x86/kvm/xen.c:2105

The warning site:

  /* Either gpa or uhva must be valid, but not both */
  if (WARN_ON_ONCE(kvm_is_error_gpa(gpa) =3D=3D kvm_is_error_hva(uhva)))
          return -EINVAL;

kvm_xen_set_evtchn() retries kvm_xen_set_evtchn_fast(), and on
-EWOULDBLOCK calls kvm_gpc_refresh(&kvm->arch.xen.shinfo_cache,
PAGE_SIZE), which re-refreshes the gpc with whatever gpa/uhva state the
cache currently holds.  In the failing run both representations were in
the same error state, so the refresh warned and returned -EINVAL and the
event-channel write failed.  The setup was a nested-KVM guest fuzzing the
KVM ioctls, including Xen HVM shared-info/event-channel configuration.

No memory corruption was observed; the effect is the WARN plus the failed
evtchn delivery.

Reproduction
------------

  git clone https://github.com/Zheng-zheng-codes/kvm-gpc-refresh-warning
  cd kvm-gpc-refresh-warning

  # boot v7.4-rc3 with the supplied kernel config
  # using a Debian trixie x86_64 guest

  # in the guest, as root:
  syz-execprog -procs=3D1 -threaded -repeat=3D1 \
      -executor ./syz-executor \
      reproducer/repro.kernsight.prog

The recipe is a state-reconstruction sequence (74 replay programs
followed by the crashing testcase).  The warning depends on the kernel
state built by the recipe; the testcase alone is not sufficient.  The
recipe must run with -procs=3D1; using -procs=3D8 did not reproduce the
warning under our tests.

Expected result: within about two minutes of starting the reproducer the
guest console shows

  kvm_is_error_gpa(gpa) =3D=3D kvm_is_error_hva(uhva)
  WARNING: arch/x86/kvm/../../../virt/kvm/pfncache.c:267 at
__kvm_gpc_refresh+0x1692/0x1e40

and the event-channel write that triggered it fails.  All five of our
fresh-VM verification runs hit this at 120-121 seconds.

Verification:

- pipeline auto-repro: attempt 1 triggered (160 replay programs) but was
  not verified within the 20-minute budget; attempt 2 verified
  (confirmed=3Dtrue, status=3Dverified, fresh-VM recipe replay, 74 replay
  programs, 2026-11-21T14:59:08Z)
- stability on fresh VMs: five independent runs, 5/5 reproductions,
  120-121 s to the warning in every run (2026-11-21, external-verify/)
- C reproducer: not generated; the syzkaller recipe is the primary
  reproducer

Repository contents
-------------------

  README.md               overview, analysis and verification table
  environment.txt         kernel/guest hashes and exact QEMU command line
  kernel.config           kernel configuration used for the reproduction
  description             original crash title
  SHA256SUMS              SHA-256 checksums covering every file in the
repository
                        (including the five verification runs and
their HIT markers)
  logs/                   original crash evidence
    log0 =E2=80=94 fuzzer log of the verified attempt
    machineInfo0 =E2=80=94 VM/environment record
    report0 =E2=80=94 crash report of the verified attempt
    title-stat =E2=80=94 occurrence statistics
  reproducer/             the reproducer and its provenance
    repro.kernsight.prog =E2=80=94 the reproducer: 74 replay programs follo=
wed
by the crashing testcase (log format)
    repro.prog =E2=80=94 the crashing testcase alone (not sufficient)
    repro.priming.prog =E2=80=94 the replay/priming prefix
    repro.priming.json =E2=80=94 priming trace (candidate picks, distances)
    repro.context.json =E2=80=94 reproduction context (fresh_vm_recipe_repl=
ay)
    repro.state.json =E2=80=94 measured 539-D pre-crash state vector
    repro.report =E2=80=94 raw crash report of the reproduction
    repro.stats =E2=80=94 phase/timing log of the reproduction
    repro.README.txt =E2=80=94 original bundle description
  external-verify/        five independent fresh-VM verification runs
    README.md             methodology and per-run results
    run-1 ... run-5/
      serial.log =E2=80=94 full guest console of the run
      run.log =E2=80=94 harness log with hashes and timings
      HIT =E2=80=94 marker written when the target appeared

Kernel/guest details:

  kernel: v7.4-rc3, bzImage sha256
    0c16409f8aec508ac44a63e631c2bd352536401f3fd0856df1d839fb953a1882
  guest: Debian trixie x86_64, 6 GiB RAM, 4 vCPU, QEMU/KVM, nested KVM
  boot: oops=3Dpanic panic_on_warn=3D1 hung_task_panic=3D0 kvm-intel.nested=
=3D1
  config: CONFIG_KASAN=3Dy, CONFIG_PROVE_LOCKING=3Dy, CONFIG_KVM=3Dy,
    CONFIG_KVM_XEN=3Dy

Thanks,
Zheng

