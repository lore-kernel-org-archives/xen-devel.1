Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 295F8C5DF7D
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 21:48:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394460.1633234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwRen-0005Sv-U5; Tue, 18 Aug 2026 21:47:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394460.1633234; Tue, 18 Aug 2026 21:47:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwRen-0005Sn-R3; Tue, 18 Aug 2026 21:47:41 +0000
Received: by outflank-mailman (input) for mailman id 1394460;
 Tue, 18 Aug 2026 21:47:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <arthurborsboom@gmail.com>) id 1wwRem-0005RY-5y
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 21:47:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwRel-003bl7-FG
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 23:47:39 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <arthurborsboom@gmail.com>)
 id 6a84d28d-e002-0a2a0a5209dd-0a2a450290c4-46
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 23:47:39 +0200
Received: from [209.85.167.178] (helo=mail-oi1-f178.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <arthurborsboom@gmail.com>)
 id 6a84d2fa-6ca4-0a2a45020019-d155a7b2a8db-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 23:47:39 +0200
Received: by mail-oi1-f178.google.com with SMTP id
 5614622812f47-49ff971e903so896924b6e.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 14:47:38 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Type:To:Subject:Message-ID:Date:From:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1787089657; cv=none;
        d=google.com; s=arc-20260327;
        b=MsZkQcklDtmheRjZ6sozKBp4vJmP9VTsfmaUr2yn2Y15ryb4lPlgr8ozOzYBK7PI/u
         S2o+xEmm4b/jSUfHJliTMwRUyEyQXFpOlw3k/pWWA6dvJO72pQ02jTI6NZyd+Cmy2Dyp
         lA6EQM09bzG7adGRkXn46w1zIjxX73EUR9RwY49bJcYWlysJMT4s2Svb28xcAsLCWj/K
         +WCnCsc5qhnM85FzXHBwPDH/aA1p15suZDdYFzAe+f7cFxKXwnneOQmbfBT0278aBhGp
         4T4IRiU9KZssDwhsCTbwuh3jQg1rLUc2gpG7NRS0H7/87q9ogTiWnOxE4NQ0tSEtVGCW
         rtng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=0X4eDJAyojIwKxxqMFxjK9Kx58HBryRY5coJ4HF4cvU=;
        fh=quJY5mN2l4ZorNvEoO9ngNXalhEvTdq/+W8CvHWhECs=;
        b=id4YwvFJQ2QMxtBnOwiAI9dPeo1/kL4rZfq9ITvQf+g+UsBKv3Ku304yaYEykUxyBc
         BB/t3kaAD5z+VatqpVcjqhZLytl8ut/xNk+Pz1qwgGduGg8RgTCkcfUqN4iB5qNjr08n
         MOcy+IwOSQKBX9IjWvdos+3AnxwfjSZKCTykZy94hx04hW3T+r4or94U8Mtn9qyXoHrq
         kis1NcWFgu29ZOEJLNzlYBGb+6bVOopxPidDTnEznanH5c6kkh6eujAQioXI4KjlZ96h
         wGv+Fay8AuqzJBnyROhyq3Q/dJnJxQqC7ehOCDkZznwmizwF2t2jz8hKTS4lTS6Kr+hj
         UO4g==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787089657; x=1787694457; darn=lists.xenproject.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0X4eDJAyojIwKxxqMFxjK9Kx58HBryRY5coJ4HF4cvU=;
        b=Tj+T/xa9RHd5DBgebsSQY5S1SzahHrdWpQS31uLdnIP+LSoDTpjvPgorUswcVmDeMH
         ml9crzIt+kJcv/TQNG/b7z6MMhwzVBzTEIXquKcMbpYaQ9gXefaH1JtE6CLbHM3LNddP
         Ndy+d5g2apxb1OTjl9jEICibcng77VQ/CYR6PIOcf45FFzfBjnA0LzmujR8KXSQ33uT+
         2j/MKi2smtZxEzKfrviozJbs3aaD5pcqyC+xCHSt8Gvsmg7jrZQywkaqqRBsrIqlVc0l
         Odt3BIqERCUJy9DQwK8c2mPwXOfVqXL5JZI2NXf+zesLSmsY2Gc8ttKmtTn9/HTf2RU1
         9mew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787089657; x=1787694457;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0X4eDJAyojIwKxxqMFxjK9Kx58HBryRY5coJ4HF4cvU=;
        b=jmh06196zm0V0RpWURwlt5AO9+7VvXrmGv9pmq8TdrksTFKuxeHSW/vWYsMuygRXzu
         LKPoeeL35+Tm7hiqtreeJcqOkIFW7GwKg7ks89LHDq8/VBJ2j8v5Zeoa+VZCcxKnm1lD
         1ImUSduOagmVcJ68s8BEgpzavBKVl7fGkMqwSYrZlUgckO9AIDVpcmfJPWBF5sVFYP7d
         gyc48r36R8suwnEKBXHpoQYE9fKYNnNWgxW7g6MTbeYsbx+BNLljJ1HvrpO+u6xND9Dh
         ceLwGjh35zG5tmr1incxrP4ZXx2we+eaNTvnNoKnIB+tTenOQI4BvYTmRxslsPstrNmi
         o2Ww==
X-Gm-Message-State: AOJu0YybUY0godc3E4pZZ1lwcoA0WurksbGSHACyDCXKiG/q+piKZEB1
	65G4mMDq6RXxdvg2mVW6LOigggTfg1crrmIQ02i/i90MdxAxF0eW3ZAJ/OFdwOFTXUO0CCI6xFA
	7RsDliHjVg2TMowV/K0eVjoj3oQf5AMDzcJpUbwkN+Q==
X-Gm-Gg: AR+sD10TZw5aEPCq2rLJRTnD/vVYgny64Vnc+y8JppvPitcOcGEbx8gfC7MxXT0lZG3
	BLQqhziUaAihIsdbxhlz7mil7rsWmTMG1cDIo9uQP9sKDRXnvQF+DRPNdqwSyQA32lh37L+/r6L
	bttg28Z2DNvZ9aEx8Bq/V/jcRvWyVN+216gqLgO3AOK4chnY0FRkAh6gkjCWSVFx+EAU7PaiRfj
	AaJaapVV05z2BqnRBunYBXiuFab6vHxkYyCs7QWtAhwV1Bp4dA1+TtJjRvilGUuC0P60uzJ17wf
	69hVmBWf22yb1t/EZ8F8qxc+sAuIzJeBTGU5GKrA6v+62gSOtPsVkZZE61kJllHLdqgzFmAt05B
	gxY+rPdthMlcVsr2RU6FJMLZJZW8X357RN2y9x7ZP2YUXypaS/XdY4FE59EfHpRrIh+spTn9IyJ
	u2cvrtof1cH6Q=
X-Received: by 2002:a05:6808:6a96:b0:495:f697:92d9 with SMTP id
 5614622812f47-4b2ba69b458mr353897b6e.7.1787089657187; Tue, 18 Aug 2026
 14:47:37 -0700 (PDT)
MIME-Version: 1.0
From: Arthur Borsboom <arthurborsboom@gmail.com>
Date: Tue, 18 Aug 2026 23:47:21 +0200
X-Gm-Features: AcwNN1W25mPAMXOatQ1ufel3zTPBjo3cD8NZLrVp_pez46BbBOcsp5vpNmi59m4
Message-ID: <CALUcmUkm7eL2RtqAn3fJxrMdY4aj8AYzkFZfs7LVwntSLa44Wg@mail.gmail.com>
Subject: [BUG] Linux kernel crash in amd_smn_init during PVH Dom0 boot on AMD EPYC
To: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-720697/1787089659-315CD2AC-E12F8AA1/0/0
X-purgate-type: clean
X-purgate-size: 24239

Hi,

I am encountering an early Linux kernel crash when booting a PVH
Dom0 on an AMD EPYC system (Family 19h Model 97). PV boot on the
same system works fine. The crash occurs during amd_smn_init due
to a divide-by-zero exception.

There is a potentially related bug report discussing a Linux patch
addressing AMD SMN initialization under Xen PVH:

https://patchew.org/linux/20260623211904.3674-1-jason.andryuk@amd.com/

It seems there was an ongoing discussion between Linux devs who
seem to have the need to align with Xen devs for a proper/future-proof fix.
I am submitting this report to share raw hardware trace data and
help move this forward.

--- System Details ---
CPU: AMD EPYC 4344P 8-Core Processor (Family 25 / 0x19, Model 97
/ 0x61, Stepping 2)
Motherboard: MSI MSIS366/S3661 (BIOS ES366AOC.10P 05/29/2025)
Xen Version: 4.20.0 (Command line: dom0_mem=8192M,max:8192M dom0=pvh
loglvl=all guest_loglvl=all sync_console noreboot console=com1,vga)
Linux Kernel: 7.1.5-arch1-2

--- Kernel Crash Log ---

 __  __            _  _    ____   ___   ___                    _
 \ \/ /___ _ __   | || |  |___ \ / _ \ / _ \     __ _ _ __ ___| |__
  \  // _ \ '_ \  | || |_   __) | | | | | | |__ / _` | '__/ __| '_ \
  /  \  __/ | | | |__   _| / __/| |_| | |_| |__| (_| | | | (__| | | |
 /_/\_\___|_| |_|    |_|(_)_____|\___(_)___/    \__,_|_|  \___|_| |_|

(XEN) Xen version 4.20.0-arch (arthur@aramgroup.com) (gcc (GCC) 16.1.1
20260725) debug=n Sun Jul 26 22:43:05 UTC 2026
(XEN) Latest ChangeSet: Tue Mar 4 16:17:52 2025 +0000 git:3ad5d648cd-dirty
(XEN) build-id: 4dcf7c0d0f3d960d48942e07d1681a98
(XEN) Console output is synchronous.
(XEN) CPU Vendor: AMD, Family 25 (0x19), Model 97 (0x61), Stepping 2
(raw 00a60f12)
(XEN) BSP microcode revision: 0x0a60120c
(XEN) Bootloader: EFI
(XEN) Command line: dom0_mem=8192M,max:8192M dom0=pvh loglvl=all
guest_loglvl=all sync_console noreboot console=com1,vga
(XEN) Xen image load base address: 0x7e000000
(XEN) Video information:
(XEN)  VGA is graphics mode 1024x768, 32 bpp
(XEN) Disc information:
(XEN)  Found 0 MBR signatures
(XEN)  Found 2 EDD information structures
(XEN) Enabling Supervisor Shadow Stacks
(XEN) EFI RAM map:
(XEN)  [0000000000000000, 000000000009ffff] (usable)
(XEN)  [00000000000a0000, 00000000000fffff] (reserved)
(XEN)  [0000000000100000, 0000000009afefff] (usable)
(XEN)  [0000000009aff000, 0000000009ffffff] (reserved)
(XEN)  [000000000a000000, 000000000a1fffff] (usable)
(XEN)  [000000000a200000, 000000000a211fff] (ACPI NVS)
(XEN)  [000000000a212000, 000000000affffff] (usable)
(XEN)  [000000000b000000, 000000000b020fff] (reserved)
(XEN)  [000000000b021000, 000000008857efff] (usable)
(XEN)  [000000008857f000, 000000008e57efff] (reserved)
(XEN)  [000000008e57f000, 000000008e67efff] (ACPI data)
(XEN)  [000000008e67f000, 000000009067efff] (ACPI NVS)
(XEN)  [000000009067f000, 00000000987fefff] (reserved)
(XEN)  [00000000987ff000, 0000000099ff7fff] (usable)
(XEN)  [0000000099ff8000, 0000000099ffafff] (reserved)
(XEN)  [0000000099ffb000, 0000000099ffcfff] (usable)
(XEN)  [0000000099ffd000, 0000000099ffdfff] (reserved)
(XEN)  [0000000099ffe000, 0000000099ffffff] (usable)
(XEN)  [000000009a000000, 000000009bffffff] (reserved)
(XEN)  [000000009d7f3000, 000000009fffffff] (reserved)
(XEN)  [00000000e0000000, 00000000efffffff] (reserved)
(XEN)  [00000000f7000000, 00000000ffffffff] (reserved)
(XEN)  [0000000100000000, 000000105defffff] (usable)
(XEN)  [000000105ef40000, 00000010801fffff] (reserved)
(XEN)  [000000fd00000000, 000000ffffffffff] (reserved)
(XEN) ACPI: RSDP 90665014, 0024 (r2 ALASKA)
(XEN) ACPI: XSDT 90664728, 00EC (r1 ALASKA   A M I   1072009 AMI   1000013)
(XEN) ACPI: FACP 8E672000, 0114 (r6 ALASKA   A M I   1072009 AMI     10013)
(XEN) ACPI: DSDT 8E5F5000, 733C1 (r171 ALASKA   A M I   1072009 INTL 20230628)
(XEN) ACPI: FACS 90662000, 0040
(XEN) ACPI: SSDT 8E676000, 816C (r2    AMD Splinter        2 MSFT  5000000)
(XEN) ACPI: SPMI 8E675000, 0041 (r5 ALASKA   A M I         0 AMI.        0)
(XEN) ACPI: SPMI 8E674000, 0041 (r5 ALASKA   A M I         0 AMI.        0)
(XEN) ACPI: SSDT 8E673000, 0221 (r2 ALASKA  CPUSSDT  1072009 AMI   1072009)
(XEN) ACPI: FIDT 8E66C000, 009C (r1 ALASKA    A M I  1072009 AMI     10013)
(XEN) ACPI: MCFG 8E66B000, 003C (r1 ALASKA    A M I  1072009 MSFT    10013)
(XEN) ACPI: HPET 8E66A000, 0038 (r1 ALASKA    A M I  1072009 AMI         5)
(XEN) ACPI: UEFI 9001F000, 0048 (r1 ALASKA   A M I   1072009 AMI   1000013)
(XEN) ACPI: FPDT 8E669000, 0044 (r1 ALASKA   A M I   1072009 AMI   1000013)
(XEN) ACPI: SSDT 8E66D000, 4DEE (r2    AMD  AMD CPU        1 AMD         1)
(XEN) ACPI: TPM2 8E5F4000, 004C (r4 ALASKA   A M I         1 AMI         0)
(XEN) ACPI: SSDT 8E5F3000, 06D4 (r2    AMD  CPMWLRC        1 INTL 20230628)
(XEN) ACPI: SSDT 8E5F2000, 0788 (r2    AMD CPMDFIG5        1 INTL 20230628)
(XEN) ACPI: SSDT 8E5E8000, 9A9E (r2    AMD   CPMCMN        1 INTL 20230628)
(XEN) ACPI: SSDT 8E5E5000, 27C6 (r2    AMD AOD             1 INTL 20230628)
(XEN) ACPI: WSMT 8E5E4000, 0028 (r1 ALASKA   A M I   1072009 AMI     10013)
(XEN) ACPI: APIC 8E5E3000, 015E (r6 ALASKA   A M I   1072009 AMI     10013)
(XEN) ACPI: IVRS 8E5E2000, 00C8 (r2  AMD   AmdTable        1 AMD         1)
(XEN) ACPI: SSDT 8E5E1000, 0500 (r2    AMD MEMTOOL0        2 INTL 20230628)
(XEN) ACPI: SSDT 8E5E0000, 09D0 (r2    AMD CPMMSOSC        1 INTL 20230628)
(XEN) ACPI: SSDT 8E5DF000, 047C (r2    AMD   AMDWOV        1 INTL 20230628)
(XEN) ACPI: SSDT 8E5DE000, 008D (r2    AMD CPMMSLPI        1 INTL 20230628)
(XEN) ACPI: SSDT 8E5DC000, 1046 (r2    AMD CPMACPV4        1 INTL 20230628)
(XEN) ACPI: SSDT 8E5DB000, 044D (r2    AMD AmdTable        1 INTL 20230628)
(XEN) System RAM: 65142MB (66706336kB)
(XEN) No NUMA configuration found
(XEN) Faking a node at 0000000000000000-000000105df00000
(XEN) Domain heap initialised
(XEN) vesafb: framebuffer at 0x00000000f5000000, mapped to
0xffff82c000203000, using 3072k, total 3072k
(XEN) vesafb: mode is 1024x768x32, linelength=4096, font 8x14
(XEN) vesafb: Truecolor: size=8:8:8:8, shift=24:16:8:0
(XEN) SMBIOS 3.7 present.
(XEN) Using APIC driver default
(XEN) ACPI: PM-Timer IO Port: 0x808 (32 bits)
(XEN) ACPI: v5 SLEEP INFO: control[0:0], status[0:0]
(XEN) ACPI: SLEEP INFO: pm1x_cnt[1:804,1:0], pm1x_evt[1:800,1:0]
(XEN) ACPI: 32/64X FACS address mismatch in FADT -
90662000/0000000000000000, using 32
(XEN) ACPI:             wakeup_vec[9066200c], vec_size[20]
(XEN) ACPI: Local APIC address 0xfee00000
(XEN) Overriding APIC driver with bigsmp
(XEN) ACPI: IOAPIC (id[0x20] address[0xfec00000] gsi_base[0])
(XEN) IOAPIC[0]: apic_id 32, version 33, address 0xfec00000, GSI 0-23
(XEN) ACPI: IOAPIC (id[0x21] address[0xfec01000] gsi_base[24])
(XEN) IOAPIC[1]: apic_id 33, version 33, address 0xfec01000, GSI 24-55
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
(XEN) ACPI: IRQ0 used by override.
(XEN) ACPI: IRQ2 used by override.
(XEN) ACPI: IRQ9 used by override.
(XEN) ACPI: HPET id: 0x10228201 base: 0xfed00000
(XEN) PCI: MCFG configuration 0: base e0000000 segment 0000 buses 00 - ff
(XEN) PCI: MCFG area at e0000000 reserved in E820
(XEN) PCI: Using MCFG for segment 0000 bus 00-ff
(XEN) Using ACPI (MADT) for SMP configuration information
(XEN) SMP: Allowing 16 CPUs (0 hotplug CPUs)
(XEN) IRQ limits: 56 GSI, 3272 MSI/MSI-X
(XEN) CPU0: 3000 ... 3800 MHz
(XEN) xstate: size: 0x988 and states: 0x2e7
(XEN) CPU0: AMD Fam19h machine check reporting enabled
(XEN) Speculative mitigation facilities:
(XEN)   Hardware hints: STIBP_ALWAYS IBRS_FAST IBRS_SAME_MODE BTC_NO IBPB_RET
(XEN)   Hardware features: IBPB IBRS STIBP SSBD PSFD L1D_FLUSH
(XEN)   Compiled-in support: INDIRECT_THUNK SHADOW_PAGING HARDEN_ARRAY
HARDEN_BRANCH HARDEN_GUEST_ACCESS HARDEN_LOCK
(XEN)   Xen settings: BTI-Thunk: JMP, SPEC_CTRL: IBRS+ STIBP+ SSBD-
PSFD-, Other: BRANCH_HARDEN
(XEN)   Support for HVM VMs: MSR_SPEC_CTRL MSR_VIRT_SPEC_CTRL RSB IBPB-entry
(XEN)   Support for PV VMs: IBPB-entry
(XEN)   XPTI (64-bit PV only): Dom0 disabled, DomU disabled (without PCID)
(XEN)   PV L1TF shadowing: Dom0 disabled, DomU disabled
(XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) Initializing Credit2 scheduler
(XEN)  load_precision_shift: 18
(XEN)  load_window_shift: 30
(XEN)  underload_balance_tolerance: 0
(XEN)  overload_balance_tolerance: -3
(XEN)  runqueues arrangement: socket
(XEN)  cap enforcement granularity: 10ms
(XEN) load tracking window length 1073741824 ns
(XEN) Platform timer is 14.318MHz HPET
(XEN) Detected 3792.858 MHz processor.
(XEN) EFI memory map:
(XEN)  0000000000000-000000009cfff type=7 attr=000000000000000f
(XEN)  000000009d000-000000009efff type=2 attr=000000000000000f
(XEN)  000000009f000-000000009ffff type=4 attr=000000000000000f
(XEN)  0000000100000-0000009afefff type=7 attr=000000000000000f
(XEN)  0000009aff000-0000009ffffff type=0 attr=000000000000000f
(XEN)  000000a000000-000000a1fffff type=7 attr=000000000000000f
(XEN)  000000a200000-000000a211fff type=10 attr=000000000000000f
(XEN)  000000a212000-000000a291fff type=4 attr=000000000000000f
(XEN)  000000a292000-000000affffff type=7 attr=000000000000000f
(XEN)  000000b000000-000000b020fff type=0 attr=000000000000000f
(XEN)  000000b021000-000007d184fff type=7 attr=000000000000000f
(XEN)  000007d185000-000007dffffff type=2 attr=000000000000000f
(XEN)  000007e000000-000007fdfffff type=1 attr=000000000000000f
(XEN)  000007fe00000-0000080662fff type=7 attr=000000000000000f
(XEN)  0000080663000-00000816affff type=2 attr=000000000000000f
(XEN)  00000816b0000-00000816b0fff type=4 attr=000000000000000f
(XEN)  00000816b1000-00000816befff type=7 attr=000000000000000f
(XEN)  00000816bf000-00000816bffff type=4 attr=000000000000000f
(XEN)  00000816c0000-00000816e8fff type=7 attr=000000000000000f
(XEN)  00000816e9000-00000816ecfff type=4 attr=000000000000000f
(XEN)  00000816ed000-00000816f5fff type=7 attr=000000000000000f
(XEN)  00000816f6000-00000816f6fff type=4 attr=000000000000000f
(XEN)  00000816f7000-00000816f8fff type=7 attr=000000000000000f
(XEN)  00000816f9000-00000816fafff type=4 attr=000000000000000f
(XEN)  00000816fb000-0000081700fff type=7 attr=000000000000000f
(XEN)  0000081701000-0000081701fff type=4 attr=000000000000000f
(XEN)  0000081702000-0000081703fff type=7 attr=000000000000000f
(XEN)  0000081704000-0000081705fff type=4 attr=000000000000000f
(XEN)  0000081706000-0000081723fff type=7 attr=000000000000000f
(XEN)  0000081724000-0000081724fff type=4 attr=000000000000000f
(XEN)  0000081725000-0000081739fff type=7 attr=000000000000000f
(XEN)  000008173a000-000008173afff type=4 attr=000000000000000f
(XEN)  000008173b000-0000081829fff type=7 attr=000000000000000f
(XEN)  000008182a000-0000081874fff type=2 attr=000000000000000f
(XEN)  0000081875000-0000081875fff type=4 attr=000000000000000f
(XEN)  0000081876000-00000818b6fff type=7 attr=000000000000000f
(XEN)  00000818b7000-00000818cafff type=4 attr=000000000000000f
(XEN)  00000818cb000-00000818f3fff type=7 attr=000000000000000f
(XEN)  00000818f4000-00000818fafff type=4 attr=000000000000000f
(XEN)  00000818fb000-00000818fbfff type=7 attr=000000000000000f
(XEN)  00000818fc000-00000818fcfff type=4 attr=000000000000000f
(XEN)  00000818fd000-0000081901fff type=7 attr=000000000000000f
(XEN)  0000081902000-0000081903fff type=4 attr=000000000000000f
(XEN)  0000081904000-0000081905fff type=7 attr=000000000000000f
(XEN)  0000081906000-0000081907fff type=4 attr=000000000000000f
(XEN)  0000081908000-0000081908fff type=7 attr=000000000000000f
(XEN)  0000081909000-0000081917fff type=4 attr=000000000000000f
(XEN)  0000081918000-0000081918fff type=7 attr=000000000000000f
(XEN)  0000081919000-000008191efff type=4 attr=000000000000000f
(XEN)  000008191f000-000008191ffff type=7 attr=000000000000000f
(XEN)  0000081920000-0000081921fff type=4 attr=000000000000000f
(XEN)  0000081922000-0000081922fff type=7 attr=000000000000000f
(XEN)  0000081923000-0000081b8dfff type=4 attr=000000000000000f
(XEN)  0000081b8e000-0000081b8efff type=2 attr=000000000000000f
(XEN)  0000081b8f000-0000082e0dfff type=4 attr=000000000000000f
(XEN)  0000082e0e000-0000082e0efff type=7 attr=000000000000000f
(XEN)  0000082e0f000-000008657efff type=4 attr=000000000000000f
(XEN)  000008657f000-0000087751fff type=7 attr=000000000000000f
(XEN)  0000087752000-000008857efff type=3 attr=000000000000000f
(XEN)  000008857f000-000008e57efff type=0 attr=000000000000000f
(XEN)  000008e57f000-000008e67efff type=9 attr=000000000000000f
(XEN)  000008e67f000-000009067efff type=10 attr=000000000000000f
(XEN)  000009067f000-000009867efff type=6 attr=800000000000000f
(XEN)  000009867f000-00000987fefff type=5 attr=800000000000000f
(XEN)  00000987ff000-0000098dfffff type=4 attr=000000000000000f
(XEN)  0000098e00000-0000098ee5fff type=7 attr=000000000000000f
(XEN)  0000098ee6000-0000098fe5fff type=4 attr=000000000000000f
(XEN)  0000098fe6000-000009900dfff type=3 attr=000000000000000f
(XEN)  000009900e000-0000099043fff type=4 attr=000000000000000f
(XEN)  0000099044000-0000099078fff type=3 attr=000000000000000f
(XEN)  0000099079000-0000099091fff type=4 attr=000000000000000f
(XEN)  0000099092000-00000990aafff type=3 attr=000000000000000f
(XEN)  00000990ab000-0000099e7afff type=4 attr=000000000000000f
(XEN)  0000099e7b000-0000099e7efff type=3 attr=000000000000000f
(XEN)  0000099e7f000-0000099e92fff type=4 attr=000000000000000f
(XEN)  0000099e93000-0000099e94fff type=3 attr=000000000000000f
(XEN)  0000099e95000-0000099ea5fff type=4 attr=000000000000000f
(XEN)  0000099ea6000-0000099ec6fff type=3 attr=000000000000000f
(XEN)  0000099ec7000-0000099ec8fff type=4 attr=000000000000000f
(XEN)  0000099ec9000-0000099ec9fff type=7 attr=000000000000000f
(XEN)  0000099eca000-0000099edbfff type=4 attr=000000000000000f
(XEN)  0000099edc000-0000099edcfff type=7 attr=000000000000000f
(XEN)  0000099edd000-0000099eddfff type=3 attr=000000000000000f
(XEN)  0000099ede000-0000099feffff type=4 attr=000000000000000f
(XEN)  0000099ff0000-0000099ff7fff type=3 attr=000000000000000f
(XEN)  0000099ff8000-0000099ffafff type=6 attr=800000000000000f
(XEN)  0000099ffb000-0000099ffcfff type=4 attr=000000000000000f
(XEN)  0000099ffd000-0000099ffdfff type=6 attr=800000000000000f
(XEN)  0000099ffe000-0000099ffffff type=4 attr=000000000000000f
(XEN)  0000100000000-00001012fffff type=7 attr=000000000000000f
(XEN)  0000101300000-0000101324fff type=1 attr=000000000000000f
(XEN)  0000101325000-000105defffff type=7 attr=000000000000000f
(XEN)  00000000a0000-00000000fffff type=0 attr=000000000000000f
(XEN)  000009a000000-000009bffffff type=0 attr=000000000000000f
(XEN)  000009d7f3000-000009fffffff type=0 attr=000000000000000f
(XEN)  00000e0000000-00000efffffff type=11 attr=800000000000100d
(XEN)  00000f7000000-00000fedfffff type=11 attr=800000000000100d
(XEN)  00000fee00000-00000fee00fff type=11 attr=8000000000000001
(XEN)  00000fee01000-00000ffffffff type=11 attr=800000000000100d
(XEN)  000105ef40000-000105fffffff type=0 attr=000000000000000f
(XEN)  0001060000000-00010801fffff type=11 attr=800000000000100d
(XEN)  000fd00000000-000ffffffffff type=0 attr=0000000000000001
(XEN) alt table ffff82d040693398 -> ffff82d0406a455c
(XEN) AMD-Vi: IOMMU Extended Features:
(XEN) - Peripheral Page Service Request
(XEN) - NX bit
(XEN) - Guest APIC Physical Processor Interrupt
(XEN) - Invalidate All Command
(XEN) - Guest APIC
(XEN) - Performance Counters
(XEN) - Host Address Translation Size: 0x2
(XEN) - Guest Address Translation Size: 0
(XEN) - Guest CR3 Root Table Level: 0x1
(XEN) - Maximum PASID: 0xf
(XEN) - SMI Filter Register: 0x1
(XEN) - SMI Filter Register Count: 0x1
(XEN) - Guest Virtual APIC Modes: 0x1
(XEN) - Dual PPR Log: 0x2
(XEN) - Dual Event Log: 0x2
(XEN) - Secure ATS
(XEN) - User / Supervisor Page Protection
(XEN) - Device Table Segmentation: 0x3
(XEN) - PPR Log Overflow Early Warning
(XEN) - PPR Automatic Response
(XEN) - Memory Access Routing and Control: 0x1
(XEN) - Block StopMark Message
(XEN) - Performance Optimization
(XEN) - MSI Capability MMIO Access
(XEN) - Guest I/O Protection
(XEN) - Enhanced PPR Handling
(XEN) - Invalidate IOTLB Type
(XEN) - VM Table Size: 0x2
(XEN) - Guest Access Bit Update Disable
(XEN) AMD-Vi: Disabled HAP memory map sharing with IOMMU
(XEN) AMD-Vi: IOMMU 0 Enabled.
(XEN) I/O virtualisation enabled
(XEN)  - Dom0 mode: Relaxed
(XEN) Interrupt remapping enabled
(XEN) nr_sockets: 1
(XEN) Enabled directed EOI with ioapic_ack_old on!
(XEN) Enabling APIC mode.  Using 2 I/O APICs
(XEN) ENABLING IO-APIC IRQs
(XEN)  -> Using old ACK method
(XEN) ..TIMER: vector=0xF0 apic1=0 pin1=2 apic2=-1 pin2=-1
(XEN) Wallclock source: CMOS RTC
(XEN) Allocated console ring of 128 KiB.
(XEN) mwait-idle: does not run on family 25 model 97
(XEN) HVM: ASIDs enabled.
(XEN) SVM: Supported advanced features:
(XEN)  - Nested Page Tables (NPT)
(XEN)  - Last Branch Record (LBR) Virtualisation
(XEN)  - Next-RIP Saved on #VMEXIT
(XEN)  - VMCB Clean Bits
(XEN)  - TLB flush by ASID
(XEN)  - DecodeAssists
(XEN)  - Virtual VMLOAD/VMSAVE
(XEN)  - Virtual GIF
(XEN)  - Pause-Intercept Filter
(XEN)  - Pause-Intercept Filter Threshold
(XEN)  - TSC Rate MSR
(XEN)  - NPT Supervisor Shadow Stack
(XEN)  - MSR_SPEC_CTRL virtualisation
(XEN) HVM: SVM enabled
(XEN) HVM: Hardware Assisted Paging (HAP) detected
(XEN) HVM: HAP page sizes: 4kB, 2MB, 1GB
(XEN) alt table ffff82d040693398 -> ffff82d0406a455c
(XEN) Brought up 16 CPUs
(XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
(XEN) Initializing Credit2 scheduler
(XEN)  load_precision_shift: 18
(XEN)  load_window_shift: 30
(XEN)  underload_balance_tolerance: 0
(XEN)  overload_balance_tolerance: -3
(XEN)  runqueues arrangement: socket
(XEN)  cap enforcement granularity: 10ms
(XEN) load tracking window length 1073741824 ns
(XEN) Adding cpu 0 to runqueue 0
(XEN)  First cpu on runqueue, activating
(XEN) Adding cpu 1 to runqueue 0
(XEN) Adding cpu 2 to runqueue 0
(XEN) Adding cpu 3 to runqueue 0
(XEN) Adding cpu 4 to runqueue 0
(XEN) Adding cpu 5 to runqueue 0
(XEN) Adding cpu 6 to runqueue 0
(XEN) Adding cpu 7 to runqueue 0
(XEN) Adding cpu 8 to runqueue 0
(XEN) Adding cpu 9 to runqueue 0
(XEN) Adding cpu 10 to runqueue 0
(XEN) Adding cpu 11 to runqueue 0
(XEN) Adding cpu 12 to runqueue 0
(XEN) Adding cpu 13 to runqueue 0
(XEN) Adding cpu 14 to runqueue 0
(XEN) Adding cpu 15 to runqueue 0
(XEN) mcheck_poll: Machine check polling timer started.
(XEN) NX (Execute Disable) protection active
(XEN) d0 has maximum 3328 PIRQs
(XEN) *** Building a PVH Dom0 ***
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Scrubbing Free RAM in background
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: All
(XEN) ***************************************************
(XEN) WARNING: CONSOLE OUTPUT IS SYNCHRONOUS
(XEN) This option is intended to aid debugging of Xen by ensuring
(XEN) that all output is synchronously delivered on the serial line.
(XEN) However it can introduce SIGNIFICANT latencies and affect
(XEN) timekeeping. It is NOT recommended for production use!
(XEN) ***************************************************
(XEN) 3... 2... 1...
(XEN) Xen is relinquishing VGA console.
(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) Freed 2048kB init memory
(XEN) d0v0: upcall vector f3
(XEN) PCI add device 0000:00:00.0
(XEN) PCI add device 0000:00:00.2
(XEN) PCI add device 0000:00:01.0
(XEN) PCI add device 0000:00:01.1
(XEN) PCI add device 0000:00:01.3
(XEN) PCI add device 0000:00:02.0
(XEN) PCI add device 0000:00:02.1
(XEN) PCI add device 0000:00:03.0
(XEN) PCI add device 0000:00:04.0
(XEN) PCI add device 0000:00:08.0
(XEN) PCI add device 0000:00:08.1
(XEN) PCI add device 0000:00:08.3
(XEN) PCI add device 0000:00:14.0
(XEN) PCI add device 0000:00:14.3
(XEN) PCI add device 0000:00:18.0
(XEN) PCI add device 0000:00:18.1
(XEN) PCI add device 0000:00:18.2
(XEN) PCI add device 0000:00:18.3
(XEN) PCI add device 0000:00:18.4
(XEN) PCI add device 0000:00:18.5
(XEN) PCI add device 0000:00:18.6
(XEN) PCI add device 0000:00:18.7
(XEN) PCI add device 0000:01:00.0
(XEN) PCI add device 0000:02:00.0
(XEN) PCI add device 0000:03:00.0
(XEN) PCI add device 0000:04:02.0
(XEN) PCI add device 0000:04:03.0
(XEN) PCI add device 0000:04:08.0
(XEN) PCI add device 0000:04:0c.0
(XEN) PCI add device 0000:04:0d.0
(XEN) PCI add device 0000:05:00.0
(XEN) PCI add device 0000:06:00.0
(XEN) PCI add device 0000:07:00.0
(XEN) PCI add device 0000:08:00.0
(XEN) PCI add device 0000:08:00.1
(XEN) PCI add device 0000:0a:00.0
(XEN) PCI add device 0000:0b:00.0
(XEN) PCI add device 0000:0c:00.0
(XEN) PCI add device 0000:0c:00.2
(XEN) PCI add device 0000:0c:00.3
(XEN) PCI add device 0000:0c:00.4
(XEN) PCI add device 0000:0d:00.0
[    0.817348] Oops: divide error: 0000 [#1] SMP NOPTI
[    0.817348] fbcon: Taking over console
[    0.823766] CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Not tainted
7.1.5-arch1-2 #1 PREEMPT(full)
33708094282b4038de0f4f0d201b68f6a0b5d9bf
[    0.839766] Hardware name: MSI MSIS366/S3661, BIOS ES366AOC.10P 05/29/2025
[    0.847766] RIP: 0010:amd_smn_init+0x1ed/0x280
[    0.852766] Code: d2 45 31 f6 45 31 ed 66 41 f7 f4 89 c5 48 89 df
e8 c8 c7 1b fd 48 89 c3 48 85 c0 0f 84 48 ff ff ff 44 89 e8 31 d2 45
8d 7d 01 <66> f7 f5 66 85 d2 75 42 66 90 eb 2c 41 0f b7 ce 48 8d b3 d0
00 00
[    0.870766] RSP: 0018:ffffc9000004bdc8 EFLAGS: 00010246
[    0.878766] RAX: 0000000000000000 RBX: ffff888102661000 RCX: 0000000000000007
[    0.887766] RDX: 0000000000000000 RSI: ffff888102661000 RDI: 0000000000000000
[    0.895766] RBP: 0000000000000000 R08: 0000000000000282 R09: ffff888100f57680
[    0.903766] R10: ffffea0004044580 R11: ffff888100042700 R12: 0000000000000002
[    0.911766] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000001
[    0.919766] FS:  0000000000000000(0000) GS:ffff8882b2010000(0000)
knlGS:0000000000000000
[    0.927766] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.935766] CR2: 0000000000000000 CR3: 0000000003822000 CR4: 0000000000750ef0
[    0.943766] PKRU: 55555554
[    0.943766] Call Trace:
[    0.948766]  <TASK>
[    0.951766]  ? __pfx_amd_smn_init+0x10/0x10
[    0.956766]  do_one_initcall+0x8e/0x3f0
[    0.959766]  kernel_init_freeable+0x24a/0x2d0
[    0.965766]  ? __pfx_kernel_init+0x10/0x10
[    0.967766]  kernel_init+0x1a/0x140
[    0.973766]  ret_from_fork+0x2a7/0x330
[    0.974766]  ? __pfx_kernel_init+0x10/0x10
[    0.982766]  ret_from_fork_asm+0x1a/0x30
[    0.988766]  </TASK>
[    0.989766] Modules linked in:
[    0.994772] ---[ end trace 0000000000000000 ]---
[    0.999769] RIP: 0010:amd_smn_init+0x1ed/0x280
[    1.004770] Code: d2 45 31 f6 45 31 ed 66 41 f7 f4 89 c5 48 89 df
e8 c8 c7 1b fd 48 89 c3 48 85 c0 0f 84 48 ff ff ff 44 89 e8 31 d2 45
8d 7d 01 <66> f7 f5 66 85 d2 75 42 66 90 eb 2c 41 0f b7 ce 48 8d b3 d0
00 00
[    1.004771] RSP: 0018:ffffc9000004bdc8 EFLAGS: 00010246
[    1.004773] RAX: 0000000000000000 RBX: ffff888102661000 RCX: 0000000000000007
[    1.004774] RDX: 0000000000000000 RSI: ffff888102661000 RDI: 0000000000000000
[    1.004775] RBP: 0000000000000000 R08: 0000000000000282 R09: ffff888100f57680
[    1.004776] R10: ffffea0004044580 R11: ffff888100042700 R12: 0000000000000002
[    1.004777] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000001
[    1.004778] FS:  0000000000000000(0000) GS:ffff8882b2090000(0000)
knlGS:0000000000000000
[    1.004779] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    1.004780] CR2: 0000000000000000 CR3: 0000000003822000 CR4: 0000000000750ef0
[    1.004782] PKRU: 55555554
[    1.004784] Kernel panic - not syncing: Attempted to kill init!
exitcode=0x0000000b
(XEN) Hardware Dom0 crashed: 'noreboot' set - not rebooting.

Please let me know if any additional info would be helpful.

Thanks,
Arthur Borsboom

