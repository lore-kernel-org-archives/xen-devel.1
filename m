Return-Path: <SRS0=pWks=GA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F0AC433DB
	for <xen-devel@archiver.kernel.org>; Mon, 28 Dec 2020 18:49:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8714221F8
	for <xen-devel@archiver.kernel.org>; Mon, 28 Dec 2020 18:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8714221F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.59572.104577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ktxZv-0006fw-01; Mon, 28 Dec 2020 18:49:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59572.104577; Mon, 28 Dec 2020 18:49:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ktxZu-0006fp-T6; Mon, 28 Dec 2020 18:49:10 +0000
Received: by outflank-mailman (input) for mailman id 59572;
 Mon, 28 Dec 2020 18:49:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GUIM=GA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ktxZt-0006fh-DM
 for xen-devel@lists.xenproject.org; Mon, 28 Dec 2020 18:49:09 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 20d01331-dc4b-4e42-9b77-e4ca6f0a5bef;
 Mon, 28 Dec 2020 18:49:07 +0000 (UTC)
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
X-Inumbo-ID: 20d01331-dc4b-4e42-9b77-e4ca6f0a5bef
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609181347;
  h=subject:to:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding;
  bh=9G6AIxDAf2ARK1SZTcq77GtBN9D79SabgF89Tvyag2k=;
  b=Go67pWi7jVGCaxPp91+yQZ7tKVz5bA1b1FHsn046NV6ekz95LpZZfKkX
   QjDhERBIi7tlmYO6SnaMo9DQ2fE5pAheE4jEeiXUSNFLWbLp6/SwozgHR
   WfG0qKdto+qZO9cQS/sb3oNChbHEdZo2UKwySGwA2fKpWcsqXs4bi6Dub
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: OyifZlA7HP97Z7lMId07ePIBuLTiPoKc40saqnyKzG9YKsKvsbbwdw/MVGrpbJSKaPsRQXwx6q
 9tcm0xNO86FphL42CUvcWL3E27o10J/EhIIW+GTM74WFC5LZSYEcUpIPhj9uGzHG6DWXQXt706
 j30NjPJDo4DcN/9sYNSriocvIhZDQ7CYPZnJBJ6ZsZygvpYV/G0qCKsBtFtqY6U6yD0npO4A2E
 E10+udtLDW8XVTIu/GGbBhoR9FXOIDbLSenMFhGEl58IccSXSfZSYrbnIqkfV2pbGyVsoukCEQ
 TrE=
X-SBRS: 5.2
X-MesageID: 35299876
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,455,1599537600"; 
   d="scan'208";a="35299876"
Subject: Re: [BUG] Unable to boot Xen 4.11 (shipped with Ubuntu) on Intel 10i3
 CPU
To: Ondrej Balaz <blami@blami.net>, <xen-devel@lists.xenproject.org>
References: <CACmg6stNxXu3-SFdK_WtREbL2i7N522-DRRVr1ZXVOTqZ9j02Q@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f3346d45-e8d5-5b37-a9df-f410af54469f@citrix.com>
Date: Mon, 28 Dec 2020 18:49:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACmg6stNxXu3-SFdK_WtREbL2i7N522-DRRVr1ZXVOTqZ9j02Q@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 28/12/2020 18:08, Ondrej Balaz wrote:
> Hi,
> I recently updated my home server running Ubuntu 20.04 (Focal) with
> Xen hypervisor 4.11 (installed using Ubuntu packages). Before the
> upgrade all was running fine and both dom0 and all domUs were booting
> fine. Upgrade was literally taking harddrive from 6th gen Intel CPU
> system to 10th gen Intel CPU one and redoing EFI entries from Ubuntu
> live USB.
>
> After doing so standalone Ubuntu (without Xen multiboot) boots just
> fine but Ubuntu as dom0 with Xen fails pretty early on with following
> error (hand-copied from phone snaps I took with loglvl=all as this is
> barebone system without serial port and I don't know how to dump full
> logs in case of panic):
>
> (XEN) ACPI: IOAPIC (id[0x02] address[0xfec00000] gsi_base[01])
> (XEN) IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-119
> (XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
> (XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
> (XEN) ACPI: IRQ0 used by override.
> (XEN) ACPI: IRQ2 used by override 
> (XEN) ACPI: IRQ9 used by override
> (XEN) Enabling APIC mode: Flat.  Using 1 I/O APICs
> (XEN) ACPI: HPET id: 0x8086a201 base: 0xfed00000
> (XEN) ERST table was not found
> (XEN) ACPI: BGRT: invalidating v1 image at 0x7d7c1018
> (XEN) Using ACPI (MADT) for SMP configuration information
> ...
> (XEN) Switched to APIC driver x2apic_cluster
> ...  
> (XEN) Initing memory sharing.
> (XEN) alt table ffff82d08042b840 -> ffff82d08042d7ce
> ...
> (XEN) Intel VT-d iommu 0 supported page sizes: 4kB, 2MB, 1GB.
> (XEN) Intel VT-d iommu 1 supported page sizes: 4kB, 2MB, 1GB.
> (XEN) Intel VT-d Snoop Control not enabled 
> (XEN) Intel VT-d Dom0 DMA Passthrough not enabled 
> (XEN) Intel VT-d Queued Invalidation enabled 
> (XEN) Intel VT-d Interrupt Remapping enabled
> (XEN) Intel VT-d Posted Interrupt not enabled  
> (XEN) Intel VT-d Shared EPT tables enabled
> (XEN) I/O virtualisation enabled
> (XEN)  - Dom0 mode: Relaxed
> (XEN) Interrupt remapping enabled
> (XEN) nr_sockets: 1
> (XEN) Enabled directed EOI with ioapic_ack_old on!
> (XEN) ENABLING IO-APIC IRQs
> (XEN)  -> Using old ACK method
> (XEN) ..TIMER: vector=0xF0 apic1=0 pin1=2 apic2=-1 pin2=-1
> (XEN) ..MP-BIOS bug: 8254 timer not connected to IO-APIC
> (XEN) ...trying to set up timer (IRQ0) through the 8259A ... failed.
> (XEN) ...trying to set up timer as Virtual Wire IRQ... failed.
> (XEN) ...trying to set up timer as ExtINT IRQ...spurious 8259A
> interrupt IRQ7.
> (XEN) CPU0: No irq handler for vector e7 (IRQ -8)
> (XEN) IRQ7 a=0001[0001,0000] v=60[ffffffff] t=IO-APIC-edge s=00000002
> (XEN)  failed :(.
> (XEN)
> (XEN) *******************************
> (XEN) Panic on CPU 0:
> (XEN) IO-APIC + timer doesn't work!  Boot with apic_verbosity=debug
> and send report.  Then try booting with the `noapic` option
> (XEN) *******************************
>
> I suspected that migration of drive could cause problem so I took an
> empty SSD and installed fresh Ubuntu and added Xen hypervisor, after
> reboot I ended up with same panic. I tried booting with noapic (gave
> general page fault) and iommu=0 (said it needs iommu=required/force).
> Trying to boot this exact fresh install on older (6th gen) Intel CPU
> succeeded. I happen to have access to one more system with 10th gen
> Intel CPUs (Lenovo laptop) and no luck booting Xen there too and same
> panic in the end.
>
> Back to my barebone I tried to match BIOS settings between working and
> non-working but it didn't help. Virtualization is enabled, both
> systems are from the same maker (Intel NUC barebones), both systems
> are EFI enabled/secure boot disabled (the later one doesn't seem to
> have an option to disable EFI boot and boot using MBR).
>
> Is this something known? Are there any boot options that can
> potentially fix this?
>
> Any help (including how to dump full Xen boot logs without serial)
> appreciated.

Yes we're aware of it.  It is because modern Intel systems no longer
have a legacy PIT configured by default, and Xen depends on this.  (The
error message is misleading.  It's not checking for a timer, so much as
checking that interrupts works, and depends on the legacy PIT "working"
as the source of interrupts.)

I'm working on a fix.

~Andrew

