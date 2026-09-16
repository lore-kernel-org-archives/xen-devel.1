Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0462EC982C9
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 20:36:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1423485.1648566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6wMM-00072U-AZ; Wed, 16 Sep 2026 20:36:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1423485.1648566; Wed, 16 Sep 2026 20:36:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6wMM-00072N-74; Wed, 16 Sep 2026 20:36:02 +0000
Received: by outflank-mailman (input) for mailman id 1423485;
 Wed, 16 Sep 2026 20:36:01 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <akmarkov45@gmail.com>) id 1x6wML-00072H-Ei
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 20:36:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6wMK-0094aC-1C
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 22:36:00 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <akmarkov45@gmail.com>)
 id 6aaafd92-8faa-0a2a0a5109dd-0a2a45068692-40
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 22:36:00 +0200
Received: from [74.125.229.204] (helo=mail-lf2-f12.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <akmarkov45@gmail.com>)
 id 6aaafdaf-195a-0a2a45060019-4a7de5cced33-3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 22:35:59 +0200
Received: by mail-lf2-f12.google.com with SMTP id
 2adb3069b0e04-5b5e4f15d00so32350e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 13:35:59 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Type:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1789590959; cv=none;
        d=google.com; s=arc-20260327;
        b=jSpGaMOONZt1Cwa9eRnC2JXc3qSoXDOgdEehjmPY7cGnLoFeIIqJZQodNLL75B1Yp/
         jFbv3J7PhdvRsUmkD23pQVJO644jNJcWZDRlOX+Iea4OrlItvFF4XijgSoyJ+FLp2KwQ
         vfOMob/hi/h9fqTS758+dXDF7U2IoX+yaOyyeSWWTVVZJ1KGwVrQoUKUqI7QKiKRvRn3
         LUAw5IxGVnZkSRLBPbW+ExA38/I7hiBTddQ+RlzYTZOzwUJZyK2TF9p/ALKz1oNq+eNe
         MiL6vhPWXZGruV4U+Or4bjPH8eshhp9FQn0j4lJC3MKs4eNsYFp/69oW6iIYFhM+eo7x
         sLsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=wNCZPSbPYJyFVLNjgBg2eGFHgK4UGL4TNgHPrNNY8gE=;
        fh=quJY5mN2l4ZorNvEoO9ngNXalhEvTdq/+W8CvHWhECs=;
        b=qeOYO8yvyOAdEOXVCw7EeD0F6RJ3+zbC4AGaNmwIX47Kte0RensKELhAKm6wuV7pHd
         p3KxnUzLzReSP0npTT91/cwVwlzHr17kRKiC1WNmDB5hUo90GoaUlIYDU7+KjXKQt9oC
         LtB3xNx3NVl3xK9a35D2fNze2b6vvXFdzPAEaAwD9ILbkDxtX3P0PBzyzcfH9EYs4s5i
         VgMBX6glnUQKw0jFJVQYqvVv0GZ04mcGQOpVomdJFbP9vN4lu4DlRJFhfgOuhABfzoZ1
         JnPx7EHjY8n+steY2s0MfDtSw4mlnrHc4iNURMX+zQxopXGDpmLJoakRBGqGMlrQ8qR3
         e9RQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789590959; x=1790195759; darn=lists.xenproject.org;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wNCZPSbPYJyFVLNjgBg2eGFHgK4UGL4TNgHPrNNY8gE=;
        b=SyGGb17tFg5AdaAfxVfiy5d+QK3SSFVFSlq0Cx8qTdHWBs6ZL2WBJ8aLHkzE75xSUl
         +sSupMxBu0SipZwAWS8IzmyUXz9o9zTTjqONqQGy9hqyswbZY5bKWuY8KjO4cLo/vmnn
         P94OLr95x94iNW6PKFvjqod7yMRNg1GDk6LLx5tPnfpq++vK5dSz9haQtfYSTpn+OWmR
         yhqSIQbanD/iol0eqar1riC/QVfzjlrf5XTS45W1Fcwbgw4/KHW2kYIOGP0BHkIEOkzs
         7vEEoQsGKZ6vTfHv8RntBJYVMPDZATWyMmHtJPuVDJC6Yovcjnd9LIXG2qG4SaIQtUuZ
         he6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789590959; x=1790195759;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wNCZPSbPYJyFVLNjgBg2eGFHgK4UGL4TNgHPrNNY8gE=;
        b=DETeGthB0X+ZiulZQV62mfhzoSX74On7Ofk+fyXn/bkVDPmatowIbbFt3GpNvVTI5c
         6mKTJL8obgJu7hiwcbApD7dkHzpu0IYICURzSExChFitmBcsEejAFBbws39dfNU9/A6P
         7bL1ZbfyuEwmuzkmBOF2GzWj+yKT5KlvvnbJih+BAitNs+Li4SN3x11KqvIUYWPcLkve
         dFHjgFojePkOR/pPZjhX2+mYZqPV/QX1TxkDuDxYp/+BgFpgDtST4QOfBLX0/G3qBPko
         anN3KFP1+YFNZYJOYVfA+tsTMpLERk1GCtTpAjzZKtolftDVtfNsruJcPA+z4UVtfWtE
         CeSw==
X-Gm-Message-State: AFuF++n13QmnW/EajXJPP/EbY2FT4f96IqUlSccxn4zI+dO4TwlvABGB
	UCIbZkxG0wEMRsPih+GYu3IG+QtfnvMyu8pQVFSwHLiw20hvN0tWMGW2KVJy0FQL7L2G5n2QULT
	dbq0oZFNWYsoi5H9hYgCKYR2fx74h4T84lQi0pP0IQg==
X-Gm-Gg: AYBFou2LWBwZNXDARvt6sYFZfElCkUP38cHo2WmyGOKUWZ/pjVjKmF6m/XQieOmVjPV
	EGojnyI3fwSgj4mxVnCeARNvyh1Q1p4jf9jipgMKkguTeSJ9WFtS8/c4NizBZp3IP3QCk6k2Mfs
	FcxLep7qL0s6DaqyPdHB78+Z4b3KeDQPGmhkv9QfHI9FVd3rDTQfKwsNJXwY2u0iMtBS8KuzAMH
	YjQkr7/l0d8UnphpvmlXnQ+Z3tglfI5jZy13hnnmG+/xw9AKRkWr5P1VHiZBsWxBOrnekw6Suxm
	g3lNIJzGt8z8/FjTtzU3TuF+PW6VwCJYhUAnt8HQ/tD1rFmdj24KLM7Y2LrZt/jmiuWbsvHsncN
	NryJE5w0PVnMqDJ+g4sy6auw7RZms5TLn3mDZEg==
X-Received: by 2002:a05:6512:3345:b0:5b0:1ace:3bec with SMTP id
 2adb3069b0e04-5b8b6605fa1mr1064310e87.10.1789590958898; Wed, 16 Sep 2026
 13:35:58 -0700 (PDT)
MIME-Version: 1.0
References: <CACQYvN_s4Bth67Z_UjMEZuL7Rafjb9x6gEYD77i8=q006OwrAQ@mail.gmail.com>
In-Reply-To: <CACQYvN_s4Bth67Z_UjMEZuL7Rafjb9x6gEYD77i8=q006OwrAQ@mail.gmail.com>
From: Anton Markov <akmarkov45@gmail.com>
Date: Wed, 16 Sep 2026 23:35:47 +0300
X-Gm-Features: AcwNN1XHUIOQnMc8cFGclGWK3Pp4BPSJqFjssZueWZRpIpoYyTgXf-k6gYCMEf0
Message-ID: <CACQYvN_wd+-Nd8epkW5HV+p1iqBn_O2L+wB7_vwU5xNEy+5GbQ@mail.gmail.com>
Subject: Re: [BUG] xen-swiotlb: 32-bit coherent DMA mask rejected on PV dom0
 since 6.6 (CONFIG_SWIOTLB_DYNAMIC), aacraid probe fails
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000660429065b9f9df7"
X-purgate-ID: tlsNG-16d1c6/1789590959-F7CCD77B-5CA3DFDE/0/0
X-purgate-type: clean
X-purgate-size: 21272

--000000000000660429065b9f9df7
Content-Type: text/plain; charset="UTF-8"

Follow-up with a second reproduction on different hardware, an exact
explanation of the failing check, and a tested patch.

My first analysis was incomplete: the problem is not that the top of
RAM lies above 4 GiB. On a PV dom0 the pseudo-physical address that
default_swiotlb_limit() returns usually has no machine frame behind it
at all, so *every* mask below 64 bits is rejected. That also explains
the July 2024 megaraid_sas report where a 63-bit mask failed:
https://lkml.iu.edu/hypermail/linux/kernel/2407.3/08254.html

Second reproduction
-------------------

  Xen:      4.21.2-pre, xen.efi via systemd-boot, PV dom0
  Hardware: ASUS N550JX, Core i7-4720HQ (Haswell), 16 GiB RAM
  dom0:     Arch Linux kernel 7.2.6-arch2-1 rebuilt with
            CONFIG_SWIOTLB_DYNAMIC=y and nothing else changed
            (the stock Arch config has it disabled and is fine)
  Memory:   host e820 top 0x42f1fffff, dom0 nr_pages 0x3c8783
            (no dom0_mem= on the Xen command line)

With the SWIOTLB_DYNAMIC kernel every driver that asks for less than a
64-bit mask fails to probe:

  i915 0000:00:02.0: [drm] *ERROR* Can't set DMA mask/consistent mask (-5)
  i915 0000:00:02.0: probe with driver i915 failed with error -5
  iwlwifi 0000:04:00.0: No suitable DMA available
  iwlwifi 0000:04:00.0: probe with driver iwlwifi failed with error -5

i915 requests a 40-bit mask on this platform, iwlwifi 36 bits with a
32-bit fallback. ahci, xhci_hcd and mei_me request 64 bits and work.
The same kernel booted natively is fine, and the stock kernel without
SWIOTLB_DYNAMIC is fine as dom0.

What the check evaluates to
---------------------------

I wrote a small out-of-tree module that calls dma_set_mask() /
dma_set_coherent_mask() on an unbound PCI device for a range of widths
and also prints what xen_swiotlb_dma_supported() is comparing against
(pfn of high_memory - 1, its p2m entry, the resulting DMA address).
Output on the SWIOTLB_DYNAMIC dom0 kernel:

  dmamask_test: xen-pv: high_memory-1 paddr=0x000000042f1fffff pfn=0x42f1ff
mfn=0xffffffffffffffff (INVALID_P2M_ENTRY: unpopulated) nr_pages=0x3c8783
  dmamask_test: xen-pv: highest populated pfn below it=0x41a8b6
mfn=0x37491a; SWIOTLB_DYNAMIC limit dma addr=0xffffffffffffffff -> smallest
passing mask=64 bits
  dmamask_test: 32-bit  dma_set_mask=FAIL(-5)
 dma_set_coherent_mask=FAIL(-5)
  dmamask_test: 33-bit  dma_set_mask=FAIL(-5)
 dma_set_coherent_mask=FAIL(-5)
  dmamask_test: 34-bit  dma_set_mask=FAIL(-5)
 dma_set_coherent_mask=FAIL(-5)
  dmamask_test: 35-bit  dma_set_mask=FAIL(-5)
 dma_set_coherent_mask=FAIL(-5)
  dmamask_test: 36-bit  dma_set_mask=FAIL(-5)
 dma_set_coherent_mask=FAIL(-5)
  dmamask_test: 40-bit  dma_set_mask=FAIL(-5)
 dma_set_coherent_mask=FAIL(-5)
  dmamask_test: 48-bit  dma_set_mask=FAIL(-5)
 dma_set_coherent_mask=FAIL(-5)
  dmamask_test: 64-bit  dma_set_mask=ok(0)  dma_set_coherent_mask=ok(0)

Identical result for three different devices (00:02.0, 01:00.0,
04:00.0), so it is not device specific. On the stock kernel without
SWIOTLB_DYNAMIC all widths pass.

The chain is:

  swiotlb_init_remap(..., SWIOTLB_ANY, xen_swiotlb_fixup)
    -> io_tlb_default_mem.phys_limit = virt_to_phys(high_memory - 1)
  default_swiotlb_limit()           -> phys_limit (with SWIOTLB_DYNAMIC)
  xen_swiotlb_dma_supported()       -> xen_phys_to_dma(dev, limit) <= mask
  xen_phys_to_bus()                 -> pfn_to_bfn(0x42f1ff)
  pfn_to_mfn()                      -> INVALID_P2M_ENTRY (~0UL)
  bfn << PAGE_SHIFT | offset        -> 0xffffffffffffffff

high_memory on a PV dom0 covers the whole host e820 map, while dom0
only owns nr_pages frames of it. The top of the pseudo-physical space
is normally unpopulated (here everything above pfn 0x41a8b6 is a hole;
Xen itself and the reserved regions live above dom0's last frame). The
p2m lookup for such a pfn yields INVALID_P2M_ENTRY, which
xen_phys_to_bus() shifts into an all-ones bus address, and only a
64-bit mask can cover that.

Whether the last pfn happens to be populated depends on the host
memory map and on dom0_mem, which is why the symptom varies between
"32-bit masks fail" (my Supermicro report) and "everything below 64
bits fails" (this laptop, the 2024 megaraid_sas report).

Before v6.6 the comparison used io_tlb_default_mem.end - 1, i.e. the
end of the default pool. That pool has been made machine-contiguous
and placed below 4 GiB by xen_swiotlb_fixup(), so its machine address
is meaningful and small. On this box the pool is mapped at
pseudo-physical 0x405600000-0x409600000 (64 MiB) and its machine
frames are below 4 GiB.

Why the old value is still the right one
----------------------------------------

phys_limit only describes where *additional* pools may be allocated
when the default pool is allowed to grow. Xen always passes a remap
callback to swiotlb_init_remap(), and that clears can_grow, so under
Xen every bounce buffer comes from the default pool forever.
Translating high_memory - 1 through the p2m therefore answers a
question that never matters for Xen, and answers it with a value that
has no relation to any address a device could be handed.

The minimal change I suggested in the first mail
(io_tlb_default_mem.defpool.end - 1 in xen_swiotlb_dma_supported())
no longer compiles as is: io_tlb_default_mem has been static in
kernel/dma/swiotlb.c since the same series. The equivalent fix at the
place where the information lives is to have default_swiotlb_limit()
return the default pool end whenever the pool cannot grow. That is a
no-op for every non-Xen SWIOTLB_DYNAMIC user (they never pass remap,
so can_grow stays true) and restores the pre-6.6 behaviour for Xen.

Test result with the patch below
--------------------------------

Same laptop, same config plus the patch, booted as PV dom0:

  dmamask_test: xen-pv: high_memory-1 paddr=0x000000042f1fffff pfn=0x42f1ff
mfn=0xffffffffffffffff (INVALID_P2M_ENTRY: unpopulated) nr_pages=0x3c8783
  dmamask_test: 32-bit  dma_set_mask=ok(0)  dma_set_coherent_mask=ok(0)
  dmamask_test: 33-bit  dma_set_mask=ok(0)  dma_set_coherent_mask=ok(0)
  dmamask_test: 34-bit  dma_set_mask=ok(0)  dma_set_coherent_mask=ok(0)
  dmamask_test: 35-bit  dma_set_mask=ok(0)  dma_set_coherent_mask=ok(0)
  dmamask_test: 36-bit  dma_set_mask=ok(0)  dma_set_coherent_mask=ok(0)
  dmamask_test: 40-bit  dma_set_mask=ok(0)  dma_set_coherent_mask=ok(0)
  dmamask_test: 48-bit  dma_set_mask=ok(0)  dma_set_coherent_mask=ok(0)
  dmamask_test: 64-bit  dma_set_mask=ok(0)  dma_set_coherent_mask=ok(0)

The p2m situation is unchanged (top pfn still unpopulated), but the
check now uses the default pool end. i915 and iwlwifi probe normally,
display and WiFi work, no DMA related messages in dmesg:

  software IO TLB: mapped [mem 0x0000000405600000-0x0000000409600000] (64MB)
  iwlwifi 0000:04:00.0: Detected Intel(R) Dual Band Wireless AC 7260
  iwlwifi 0000:04:00.0: loaded firmware version 17.bfb58538.0 7260-17.ucode
op_mode iwlmvm

I have not yet re-tested the aacraid machine from the first mail, but
it is the same check with the same input, so I expect the same result.
Happy to confirm on that box if useful.

Patch
-----

From: Anton Markov <akmarkov45@gmail.com>
Subject: [PATCH] swiotlb: report the default pool end as limit when the
pool cannot grow

Since the CONFIG_SWIOTLB_DYNAMIC work, default_swiotlb_limit() returns
io_tlb_default_mem.phys_limit, which swiotlb_init_remap() sets to
virt_to_phys(high_memory - 1) when SWIOTLB_ANY is passed.  The only
caller, xen_swiotlb_dma_supported(), compares the machine address of
that value against the mask a driver asks for.

On a Xen PV dom0 high_memory covers the whole host e820 map while dom0
owns only nr_pages of it, so the last pseudo-physical frame is normally
not populated.  pfn_to_mfn() returns INVALID_P2M_ENTRY for it and
xen_phys_to_dma() turns that into 0xffffffffffffffff.  The result is
that only a full 64-bit mask is accepted: i915 (40 bits), iwlwifi
(36 bits), aacraid and megaraid_sas (32/63 bits) all fail to probe.
Before v6.6 the end of the default pool was used and these worked.

Xen always passes a remap callback, which clears can_grow, so the
default pool is the only place bounce buffers can ever come from.
phys_limit only matters for allocating further pools.  Return the end
of the default pool whenever the pool cannot grow.

Signed-off-by: Anton Markov <akmarkov45@gmail.com>
---
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -1680,10 +1680,18 @@
 phys_addr_t default_swiotlb_limit(void)
 {
 #ifdef CONFIG_SWIOTLB_DYNAMIC
- return io_tlb_default_mem.phys_limit;
-#else
- return io_tlb_default_mem.defpool.end - 1;
+ /*
+ * phys_limit bounds where additional pools may be allocated.  If the
+ * default pool can never grow (a remap callback was given at init,
+ * e.g. by Xen), all bounce buffers live in the default pool and its
+ * end is the real limit.  phys_limit would be high_memory - 1 in
+ * that case, which on a Xen PV domain is a pseudo-physical address
+ * that typically has no machine frame behind it at all.
+ */
+ if (io_tlb_default_mem.can_grow)
+ return io_tlb_default_mem.phys_limit;
 #endif
+ return io_tlb_default_mem.defpool.end - 1;
 }

 #ifdef CONFIG_DEBUG_FS

The test module (GPL, ~120 lines) is available on request; it takes a
bdf= parameter, probes the mask widths listed above and restores the
original masks afterwards.

Thanks,
Anton

--000000000000660429065b9f9df7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Follow-up with a second reproduction on d=
ifferent hardware, an exact<br>explanation of the failing check, and a test=
ed patch.<br><br>My first analysis was incomplete: the problem is not that =
the top of<br>RAM lies above 4 GiB. On a PV dom0 the pseudo-physical addres=
s that<br>default_swiotlb_limit() returns usually has no machine frame behi=
nd it<br>at all, so *every* mask below 64 bits is rejected. That also expla=
ins<br>the July 2024 megaraid_sas report where a 63-bit mask failed:<br><a =
href=3D"https://lkml.iu.edu/hypermail/linux/kernel/2407.3/08254.html">https=
://lkml.iu.edu/hypermail/linux/kernel/2407.3/08254.html</a><br><br>Second r=
eproduction<br>-------------------<br><br>=C2=A0 Xen: =C2=A0 =C2=A0 =C2=A04=
.21.2-pre, xen.efi via systemd-boot, PV dom0<br>=C2=A0 Hardware: ASUS N550J=
X, Core i7-4720HQ (Haswell), 16 GiB RAM<br>=C2=A0 dom0: =C2=A0 =C2=A0 Arch =
Linux kernel 7.2.6-arch2-1 rebuilt with<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 CONFIG_SWIOTLB_DYNAMIC=3Dy and nothing else changed<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (the stock Arch config has it disabled a=
nd is fine)<br>=C2=A0 Memory: =C2=A0 host e820 top 0x42f1fffff, dom0 nr_pag=
es 0x3c8783<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (no dom0_mem=3D on=
 the Xen command line)<br><br>With the SWIOTLB_DYNAMIC kernel every driver =
that asks for less than a<br>64-bit mask fails to probe:<br><br>=C2=A0 i915=
 0000:00:02.0: [drm] *ERROR* Can&#39;t set DMA mask/consistent mask (-5)<br=
>=C2=A0 i915 0000:00:02.0: probe with driver i915 failed with error -5<br>=
=C2=A0 iwlwifi 0000:04:00.0: No suitable DMA available<br>=C2=A0 iwlwifi 00=
00:04:00.0: probe with driver iwlwifi failed with error -5<br><br>i915 requ=
ests a 40-bit mask on this platform, iwlwifi 36 bits with a<br>32-bit fallb=
ack. ahci, xhci_hcd and mei_me request 64 bits and work.<br>The same kernel=
 booted natively is fine, and the stock kernel without<br>SWIOTLB_DYNAMIC i=
s fine as dom0.<br><br>What the check evaluates to<br>---------------------=
------<br><br>I wrote a small out-of-tree module that calls dma_set_mask() =
/<br>dma_set_coherent_mask() on an unbound PCI device for a range of widths=
<br>and also prints what xen_swiotlb_dma_supported() is comparing against<b=
r>(pfn of high_memory - 1, its p2m entry, the resulting DMA address).<br>Ou=
tput on the SWIOTLB_DYNAMIC dom0 kernel:<br><br>=C2=A0 dmamask_test: xen-pv=
: high_memory-1 paddr=3D0x000000042f1fffff pfn=3D0x42f1ff mfn=3D0xfffffffff=
fffffff (INVALID_P2M_ENTRY: unpopulated) nr_pages=3D0x3c8783<br>=C2=A0 dmam=
ask_test: xen-pv: highest populated pfn below it=3D0x41a8b6 mfn=3D0x37491a;=
 SWIOTLB_DYNAMIC limit dma addr=3D0xffffffffffffffff -&gt; smallest passing=
 mask=3D64 bits<br>=C2=A0 dmamask_test: 32-bit =C2=A0dma_set_mask=3DFAIL(-5=
) =C2=A0dma_set_coherent_mask=3DFAIL(-5)<br>=C2=A0 dmamask_test: 33-bit =C2=
=A0dma_set_mask=3DFAIL(-5) =C2=A0dma_set_coherent_mask=3DFAIL(-5)<br>=C2=A0=
 dmamask_test: 34-bit =C2=A0dma_set_mask=3DFAIL(-5) =C2=A0dma_set_coherent_=
mask=3DFAIL(-5)<br>=C2=A0 dmamask_test: 35-bit =C2=A0dma_set_mask=3DFAIL(-5=
) =C2=A0dma_set_coherent_mask=3DFAIL(-5)<br>=C2=A0 dmamask_test: 36-bit =C2=
=A0dma_set_mask=3DFAIL(-5) =C2=A0dma_set_coherent_mask=3DFAIL(-5)<br>=C2=A0=
 dmamask_test: 40-bit =C2=A0dma_set_mask=3DFAIL(-5) =C2=A0dma_set_coherent_=
mask=3DFAIL(-5)<br>=C2=A0 dmamask_test: 48-bit =C2=A0dma_set_mask=3DFAIL(-5=
) =C2=A0dma_set_coherent_mask=3DFAIL(-5)<br>=C2=A0 dmamask_test: 64-bit =C2=
=A0dma_set_mask=3Dok(0) =C2=A0dma_set_coherent_mask=3Dok(0)<br><br>Identica=
l result for three different devices (00:02.0, 01:00.0,<br>04:00.0), so it =
is not device specific. On the stock kernel without<br>SWIOTLB_DYNAMIC all =
widths pass.<br><br>The chain is:<br><br>=C2=A0 swiotlb_init_remap(..., SWI=
OTLB_ANY, xen_swiotlb_fixup)<br>=C2=A0 =C2=A0 -&gt; io_tlb_default_mem.phys=
_limit =3D virt_to_phys(high_memory - 1)<br>=C2=A0 default_swiotlb_limit() =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -&gt; phys_limit (with SWIOTLB_DYNAMIC)<=
br>=C2=A0 xen_swiotlb_dma_supported() =C2=A0 =C2=A0 =C2=A0 -&gt; xen_phys_t=
o_dma(dev, limit) &lt;=3D mask<br>=C2=A0 xen_phys_to_bus() =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -&gt; pfn_to_bfn(0x42f1ff)<br>=C2=
=A0 pfn_to_mfn() =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0-&gt; INVALID_P2M_ENTRY (~0UL)<br>=C2=A0 bfn &lt;&lt; P=
AGE_SHIFT | offset =C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; 0xffffffffffffffff<br><=
br>high_memory on a PV dom0 covers the whole host e820 map, while dom0<br>o=
nly owns nr_pages frames of it. The top of the pseudo-physical space<br>is =
normally unpopulated (here everything above pfn 0x41a8b6 is a hole;<br>Xen =
itself and the reserved regions live above dom0&#39;s last frame). The<br>p=
2m lookup for such a pfn yields INVALID_P2M_ENTRY, which<br>xen_phys_to_bus=
() shifts into an all-ones bus address, and only a<br>64-bit mask can cover=
 that.<br><br>Whether the last pfn happens to be populated depends on the h=
ost<br>memory map and on dom0_mem, which is why the symptom varies between<=
br>&quot;32-bit masks fail&quot; (my Supermicro report) and &quot;everythin=
g below 64<br>bits fails&quot; (this laptop, the 2024 megaraid_sas report).=
<br><br>Before v6.6 the comparison used io_tlb_default_mem.end - 1, i.e. th=
e<br>end of the default pool. That pool has been made machine-contiguous<br=
>and placed below 4 GiB by xen_swiotlb_fixup(), so its machine address<br>i=
s meaningful and small. On this box the pool is mapped at<br>pseudo-physica=
l 0x405600000-0x409600000 (64 MiB) and its machine<br>frames are below 4 Gi=
B.<br><br>Why the old value is still the right one<br>---------------------=
-------------------<br><br>phys_limit only describes where *additional* poo=
ls may be allocated<br>when the default pool is allowed to grow. Xen always=
 passes a remap<br>callback to swiotlb_init_remap(), and that clears can_gr=
ow, so under<br>Xen every bounce buffer comes from the default pool forever=
.<br>Translating high_memory - 1 through the p2m therefore answers a<br>que=
stion that never matters for Xen, and answers it with a value that<br>has n=
o relation to any address a device could be handed.<br><br>The minimal chan=
ge I suggested in the first mail<br>(io_tlb_default_mem.defpool.end - 1 in =
xen_swiotlb_dma_supported())<br>no longer compiles as is: io_tlb_default_me=
m has been static in<br>kernel/dma/swiotlb.c since the same series. The equ=
ivalent fix at the<br>place where the information lives is to have default_=
swiotlb_limit()<br>return the default pool end whenever the pool cannot gro=
w. That is a<br>no-op for every non-Xen SWIOTLB_DYNAMIC user (they never pa=
ss remap,<br>so can_grow stays true) and restores the pre-6.6 behaviour for=
 Xen.<br><br>Test result with the patch below<br>--------------------------=
------<br><br>Same laptop, same config plus the patch, booted as PV dom0:<b=
r><br>=C2=A0 dmamask_test: xen-pv: high_memory-1 paddr=3D0x000000042f1fffff=
 pfn=3D0x42f1ff mfn=3D0xffffffffffffffff (INVALID_P2M_ENTRY: unpopulated) n=
r_pages=3D0x3c8783<br>=C2=A0 dmamask_test: 32-bit =C2=A0dma_set_mask=3Dok(0=
) =C2=A0dma_set_coherent_mask=3Dok(0)<br>=C2=A0 dmamask_test: 33-bit =C2=A0=
dma_set_mask=3Dok(0) =C2=A0dma_set_coherent_mask=3Dok(0)<br>=C2=A0 dmamask_=
test: 34-bit =C2=A0dma_set_mask=3Dok(0) =C2=A0dma_set_coherent_mask=3Dok(0)=
<br>=C2=A0 dmamask_test: 35-bit =C2=A0dma_set_mask=3Dok(0) =C2=A0dma_set_co=
herent_mask=3Dok(0)<br>=C2=A0 dmamask_test: 36-bit =C2=A0dma_set_mask=3Dok(=
0) =C2=A0dma_set_coherent_mask=3Dok(0)<br>=C2=A0 dmamask_test: 40-bit =C2=
=A0dma_set_mask=3Dok(0) =C2=A0dma_set_coherent_mask=3Dok(0)<br>=C2=A0 dmama=
sk_test: 48-bit =C2=A0dma_set_mask=3Dok(0) =C2=A0dma_set_coherent_mask=3Dok=
(0)<br>=C2=A0 dmamask_test: 64-bit =C2=A0dma_set_mask=3Dok(0) =C2=A0dma_set=
_coherent_mask=3Dok(0)<br><br>The p2m situation is unchanged (top pfn still=
 unpopulated), but the<br>check now uses the default pool end. i915 and iwl=
wifi probe normally,<br>display and WiFi work, no DMA related messages in d=
mesg:<br><br>=C2=A0 software IO TLB: mapped [mem 0x0000000405600000-0x00000=
00409600000] (64MB)<br>=C2=A0 iwlwifi 0000:04:00.0: Detected Intel(R) Dual =
Band Wireless AC 7260<br>=C2=A0 iwlwifi 0000:04:00.0: loaded firmware versi=
on 17.bfb58538.0 7260-17.ucode op_mode iwlmvm<br><br>I have not yet re-test=
ed the aacraid machine from the first mail, but<br>it is the same check wit=
h the same input, so I expect the same result.<br>Happy to confirm on that =
box if useful.<br><br>Patch<br>-----<br><br>From: Anton Markov &lt;<a href=
=3D"mailto:akmarkov45@gmail.com">akmarkov45@gmail.com</a>&gt;<br>Subject: [=
PATCH] swiotlb: report the default pool end as limit when the pool cannot g=
row<br><br>Since the CONFIG_SWIOTLB_DYNAMIC work, default_swiotlb_limit() r=
eturns<br>io_tlb_default_mem.phys_limit, which swiotlb_init_remap() sets to=
<br>virt_to_phys(high_memory - 1) when SWIOTLB_ANY is passed.=C2=A0 The onl=
y<br>caller, xen_swiotlb_dma_supported(), compares the machine address of<b=
r>that value against the mask a driver asks for.<br><br>On a Xen PV dom0 hi=
gh_memory covers the whole host e820 map while dom0<br>owns only nr_pages o=
f it, so the last pseudo-physical frame is normally<br>not populated. =C2=
=A0pfn_to_mfn() returns INVALID_P2M_ENTRY for it and<br>xen_phys_to_dma() t=
urns that into 0xffffffffffffffff.=C2=A0 The result is<br>that only a full =
64-bit mask is accepted: i915 (40 bits), iwlwifi<br>(36 bits), aacraid and =
megaraid_sas (32/63 bits) all fail to probe.<br>Before v6.6 the end of the =
default pool was used and these worked.<br><br>Xen always passes a remap ca=
llback, which clears can_grow, so the<br>default pool is the only place bou=
nce buffers can ever come from.<br>phys_limit only matters for allocating f=
urther pools.=C2=A0 Return the end<br>of the default pool whenever the pool=
 cannot grow.<br><br>Signed-off-by: Anton Markov &lt;<a href=3D"mailto:akma=
rkov45@gmail.com">akmarkov45@gmail.com</a>&gt;<br>---<br>--- a/kernel/dma/s=
wiotlb.c<br>+++ b/kernel/dma/swiotlb.c<br>@@ -1680,10 +1680,18 @@<br>=C2=A0=
phys_addr_t default_swiotlb_limit(void)<br>=C2=A0{<br>=C2=A0#ifdef CONFIG_S=
WIOTLB_DYNAMIC<br>-	return io_tlb_default_mem.phys_limit;<br>-#else<br>-	re=
turn io_tlb_default_mem.defpool.end - 1;<br>+	/*<br>+	 * phys_limit bounds =
where additional pools may be allocated.=C2=A0 If the<br>+	 * default pool =
can never grow (a remap callback was given at init,<br>+	 * e.g. by Xen), a=
ll bounce buffers live in the default pool and its<br>+	 * end is the real =
limit. =C2=A0phys_limit would be high_memory - 1 in<br>+	 * that case, whic=
h on a Xen PV domain is a pseudo-physical address<br>+	 * that typically ha=
s no machine frame behind it at all.<br>+	 */<br>+	if (io_tlb_default_mem.c=
an_grow)<br>+		return io_tlb_default_mem.phys_limit;<br>=C2=A0#endif<br>+	r=
eturn io_tlb_default_mem.defpool.end - 1;<br>=C2=A0}<br><br>=C2=A0#ifdef CO=
NFIG_DEBUG_FS<br><br>The test module (GPL, ~120 lines) is available on requ=
est; it takes a<br>bdf=3D parameter, probes the mask widths listed above an=
d restores the<br>original masks afterwards.<br><br>Thanks,<br>Anton</div><=
/div>

--000000000000660429065b9f9df7--

