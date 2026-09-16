Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60AB0C88E77
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 12:21:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1423061.1648343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6odp-0007lZ-8t; Wed, 16 Sep 2026 12:21:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1423061.1648343; Wed, 16 Sep 2026 12:21:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6odp-0007lS-63; Wed, 16 Sep 2026 12:21:33 +0000
Received: by outflank-mailman (input) for mailman id 1423061;
 Wed, 16 Sep 2026 12:21:32 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <akmarkov45@gmail.com>) id 1x6odn-0007lM-UV
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 12:21:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6odn-007tnW-AO
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 14:21:31 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <akmarkov45@gmail.com>)
 id 6aaa89bd-e002-0a2a0a5209dd-0a2a45019a56-44
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 14:21:31 +0200
Received: from [74.125.229.205] (helo=mail-lf2-f13.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <akmarkov45@gmail.com>)
 id 6aaa89ca-5984-0a2a45010019-4a7de5cdca34-3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 14:21:30 +0200
Received: by mail-lf2-f13.google.com with SMTP id
 2adb3069b0e04-5b5e4f13d76so928787e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 05:21:30 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1789561290; cv=none;
        d=google.com; s=arc-20260327;
        b=sbV7ADaxucQb4sRmPcMlBnKif/QCtRruu25YEJGazIFkAXlGDcjKJlSG9ovNfVyYRz
         jopCB36+xEyBZkSGhyB2dMCj2ZQ1ZUcS4cNb0YR1Zes0BnEb7IuA19NndOJN4tWkrvU7
         AGjiKNGLJUh1LHEsX21lewcJvZR2eo7kicO62qCFJOmLE59Evg7Zdp36njdhJ1nYDY9J
         +M523mgwxASzPk36is55WET0M/ITDKaQ1j3tpkBWqXN1dAM+djdB1ZGRqqf29AcfimOr
         Z4mX85j1UJ5m6JWYtESjg6HTpPZbFII6cmZjs2ncd6h4UrEcuapSFOh15zb9/O/dsLWF
         /GBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=YqO0WlKHE0+GoRcBS3yjBKiqahNfqfB6FZoicxS9Bcc=;
        fh=quJY5mN2l4ZorNvEoO9ngNXalhEvTdq/+W8CvHWhECs=;
        b=KVBX49kgvaxlxdfeydCiW2QN5+ps+0cmBgehP44CKnotl7PQuQVAyU2nn9RUIv6jeX
         1Bi2hJAjAPVBruRbn8agIb6OAgNPntl/ns1Vk3otCq9PSAj53qun6oZi93Nppeyd+nGa
         h4tl+/frnFzxflWOpZ49u2Ft2QRe+pfbDRBzSbswZoNYoBqjzOprOFzAD8ayps0CEYoF
         HAyP5mWNKBUeFxIO68KKWoErf9b58G0pqWxwk0ASOFznjF5TEsvGgoadzBiaXeA/rjFw
         4c9PrSJiCrBqlzzHCutAG+/1b3mPoNjya400IRxL4kHFylUUU+UaCqxWYrg9AoS75KnD
         6L6w==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789561290; x=1790166090; darn=lists.xenproject.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YqO0WlKHE0+GoRcBS3yjBKiqahNfqfB6FZoicxS9Bcc=;
        b=dvd228xea04qJeyvz8ql/wh+BB9XM+d9hXdRHgsZWG1WiBWQQ/XDMogsbbXg489221
         VGAW/r0LI8kgmlPr6+dqwycNMj/PSLErUr5bImgVXjiiFOGCH4gMmi5gYFyiEDjXeP6q
         aoJ2bcXyy4CD9CGnrzx0D40eLLfF2Hm+2vr5TBPQEjxzrykuwbuLGO4NAE6tI1kB8YVy
         ilvFanDLdfqu7fN5Spz4vnRQaFXlzxs+qg+fpgB0ANopCl/LOalN1xaVRlu3lL4sHqw4
         FXis4DkD8T4D3w1JGQtjC4JMhuXCsjcxcW+6PIu3o8Qm0NVKxYxijDq9Tz3Z3LYq0sDF
         QDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789561290; x=1790166090;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YqO0WlKHE0+GoRcBS3yjBKiqahNfqfB6FZoicxS9Bcc=;
        b=w/cQRqkpC+Q53ulfaoLK5Ix+1e4kjSnyMh9RuaRg5lce0Y2WFrk0RD7B46eK6Yk/iE
         3DXiauRaBMRxqgaSd0C2eoePocLsZxUI30vhi/EuaqTyGCpHtRMxdUs55+ZfwlET0bOV
         vx5kmA4U4GJ5HKTFYw5xHbeYh5RPvDDpu1MAoeUThslUNPUnYzCjKjNReumip7LI8nNh
         eMRpdlbDoZlSDZyPw44OqvBfX8nobzf2P9vLBYhn0zUcPD6+HveqHl07uHrjJFQTbX9r
         a+4vbL+AjIQZ7JYiU6kN2t2QgyftJtKV0G4Sjxu9Yz0AOwfm1sxc8Xjkrrv1+g8Igmbu
         UMFA==
X-Gm-Message-State: AFuF++lHenEwm3SLO+F9ArvPeRYiZjDwB8ywMjvio6VT6BADEeie51hg
	DtI0+bXxJK7SW4nmS92lGDYkCtRo0ME3Swtn7zpV8YWdhj8Dxoh9VPEAMzhQIhY2BWPCwSMTVGk
	YkaotUZs3UAqwncM4MB1hLNkul76hj1ZDWC8gfLSyxw==
X-Gm-Gg: AYBFou3XGgI21NSzoBwH5qN4+lwYAKVz1kt6P06rrPiC9ivA50eG6dGGwfIunqW2bF/
	PZO4lT+leOvawrXHqYJeBLSpKzfPH7IWoSbRLprZ92KWgbG3KmDbCu29BLkmXlxwfPXu7/U0zx8
	PcyFI4+B+1kXZVNfZb09eehwYeTgBLnwxYY0YNHeV+c1c48akPZM4Uk8Uy0uj7QBnolXAz9hJjw
	RR6xr/AFlL5GzDapVtkNNKUG3cyhx348XMqIX4OrAZAEUdPqqjLV1CW7TTf7XAjQL86TpeiBcCJ
	waEHuHlqlZ8kmGRdKQ3gvlgv8nxL5/gAgDjna6weF7I8cu35QamsRuC+lxjlywV+llgOEKjTvq3
	y1HOVjZCg7nOYJw73iJlJbGh4kbnefCLruTMbJg==
X-Received: by 2002:a05:6512:3996:b0:5b6:1a7c:2a with SMTP id
 2adb3069b0e04-5b8b665689bmr648894e87.45.1789561289837; Wed, 16 Sep 2026
 05:21:29 -0700 (PDT)
MIME-Version: 1.0
From: Anton Markov <akmarkov45@gmail.com>
Date: Wed, 16 Sep 2026 15:21:18 +0300
X-Gm-Features: AcwNN1VULV0aY1I9iNDEeGvRj12DW5z2jAcH21Ms4o8BilSgyydGcYQVHJsK9c4
Message-ID: <CACQYvN_s4Bth67Z_UjMEZuL7Rafjb9x6gEYD77i8=q006OwrAQ@mail.gmail.com>
Subject: [BUG] xen-swiotlb: 32-bit coherent DMA mask rejected on PV dom0 since
 6.6 (CONFIG_SWIOTLB_DYNAMIC), aacraid probe fails
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000fc0ec5065b98b4aa"
X-purgate-ID: tlsNG-d62444/1789561290-1FE68757-8EF9624C/0/0
X-purgate-type: clean
X-purgate-size: 9504

--000000000000fc0ec5065b98b4aa
Content-Type: text/plain; charset="UTF-8"

Hello,


I'm hitting a regression on a PV dom0 where a driver that requests a 32-bit
coherent DMA mask fails to probe. Bare metal with the same kernel is fine.


Environment:

Xen: 4.21.2-pre

dom0: Ubuntu 24.04, linux-image-6.8.0-139-generic (Ubuntu stock,
CONFIG_SWIOTLB_DYNAMIC=y)

dom0 mode: PV

Hardware: Supermicro X10DRW-i (BIOS 2.0, 12/17/2015), 2x Xeon E5-2670 v3,
128 GB RAM

Controller: 81:00.0 RAID bus controller [0104]: Adaptec Series 8 12G
SAS/PCIe 3 [9005:028d] (rev 01)


Xen command line (no dom0_mem, so dom0 gets all host memory):

placeholder ucode=scan dom0_max_vcpus=4-48 dom0_vcpus_pin=0 force-ept=1
ept=no-ad,no-pml hap_1gb=0 hap_2mb=0 altp2m=1 hpet=legacy-replacement smt=1
spec-ctrl=no gnttab_max_frames=512 cpufreq=xen:performance max_cstate=1
sched=credit sched-gran=cpu apicv=0 sched_credit2_max_cpus_runqueue=48
credit2_runqueue=cpu credit2_load_window_shift=33
credit2_load_precision_shift=18 sched_credit_tslice_ms=5
sched_ratelimit_us=500 hvm-freeze-on-pause=adaptive no-real-mode edd=off


Symptom (dmesg):


aacraid 0000:81:00.0: PCI 32 B consistent dma mask set failed

aacraid: probe of 0000:81:00.0 failed with error -5


The controller is present in lspci, the driver loads, but
dma_set_coherent_mask(DMA_BIT_MASK(32)) is refused, so the disks never
appear. Booting the same kernel without Xen works.


What probably goes wrong:


Since v6.6, xen_swiotlb_dma_supported() checks


xen_phys_to_dma(hwdev, default_swiotlb_limit()) <= mask


With CONFIG_SWIOTLB_DYNAMIC=y, default_swiotlb_limit() returns
io_tlb_default_mem.phys_limit, which swiotlb_init_remap() sets to
virt_to_phys(high_memory - 1) because Xen passes SWIOTLB_ANY (ad96ce3252db,
used by swiotlb-xen since 05ee774122bd). On a PV dom0 that pseudo-physical
address translates to a machine frame that, on any host with RAM above 4
GB, is above the 32-bit mask, so every 32-bit coherent mask request is
rejected.


Before v6.6 the check used the end of the actual default pool, which
xen_swiotlb_fixup() places below 4 GB, so 32-bit masks always passed. The
coherent allocation itself would still succeed via
xen_swiotlb_alloc_coherent() / xen_create_contiguous_region(); only the
capability check is wrong.


This looks like the same root cause as the unanswered report from July 2024
(megaraid_sas, 63-bit mask, "Failed to set DMA mask"):

https://lkml.iu.edu/hypermail/linux/kernel/2407.3/08254.html

That report already confirmed CONFIG_SWIOTLB_DYNAMIC=n makes the problem go
away. The 32-bit-mask case here is deterministic on any >4 GB host, so it
should be easy to reproduce.


A minimal change that restores the previous behaviour, e.g.


return xen_phys_to_dma(hwdev, io_tlb_default_mem.defpool.end - 1) <= mask;


probably isn't the right fix for dynamic pools in general, but I wanted to
flag where the check went wrong. Happy to test patches on this hardware.


Thanks.

--000000000000fc0ec5065b98b4aa
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">


	
	<span></span>
	
	

<p style="line-height:100%;margin-bottom:0cm;background:transparent">
Hello,</p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent">I&#39;m hitting a
regression on a PV dom0 where a driver that requests a 32-bit
coherent DMA mask fails to probe. Bare metal with the same kernel is
fine.</p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent">Environment:</p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent">  Xen:       
4.21.2-pre</p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent">  dom0:       Ubuntu
24.04, linux-image-6.8.0-139-generic (Ubuntu stock,
CONFIG_SWIOTLB_DYNAMIC=y)</p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent">  dom0 mode:  PV</p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent">  Hardware:  
Supermicro X10DRW-i (BIOS 2.0, 12/17/2015), 2x Xeon E5-2670 v3, 128
GB RAM</p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent">  Controller:
81:00.0 RAID bus controller [0104]: Adaptec Series 8 12G SAS/PCIe 3
[9005:028d] (rev 01)</p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent">Xen command line (no
dom0_mem, so dom0 gets all host memory):</p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent">  placeholder
ucode=scan dom0_max_vcpus=4-48 dom0_vcpus_pin=0 force-ept=1
ept=no-ad,no-pml hap_1gb=0 hap_2mb=0 altp2m=1 hpet=legacy-replacement
smt=1 spec-ctrl=no gnttab_max_frames=512 cpufreq=xen:performance
max_cstate=1 sched=credit sched-gran=cpu apicv=0
sched_credit2_max_cpus_runqueue=48 credit2_runqueue=cpu
credit2_load_window_shift=33 credit2_load_precision_shift=18
sched_credit_tslice_ms=5 sched_ratelimit_us=500
hvm-freeze-on-pause=adaptive no-real-mode edd=off</p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent">Symptom (dmesg):</p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent">  aacraid
0000:81:00.0: PCI 32 B consistent dma mask set failed</p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent">  aacraid: probe of
0000:81:00.0 failed with error -5</p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent">The controller is
present in lspci, the driver loads, but
dma_set_coherent_mask(DMA_BIT_MASK(32)) is refused, so the disks
never appear. Booting the same kernel without Xen works.</p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent">What probably goes
wrong:</p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent">Since v6.6,
xen_swiotlb_dma_supported() checks</p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent"> 
xen_phys_to_dma(hwdev, default_swiotlb_limit()) &lt;= mask</p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent">With
CONFIG_SWIOTLB_DYNAMIC=y, default_swiotlb_limit() returns
io_tlb_default_mem.phys_limit, which swiotlb_init_remap() sets to
virt_to_phys(high_memory - 1) because Xen passes SWIOTLB_ANY
(ad96ce3252db, used by swiotlb-xen since 05ee774122bd). On a PV dom0
that pseudo-physical address translates to a machine frame that, on
any host with RAM above 4 GB, is above the 32-bit mask, so every
32-bit coherent mask request is rejected.</p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent">Before v6.6 the
check used the end of the actual default pool, which
xen_swiotlb_fixup() places below 4 GB, so 32-bit masks always passed.
The coherent allocation itself would still succeed via
xen_swiotlb_alloc_coherent() / xen_create_contiguous_region(); only
the capability check is wrong.</p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent">This looks like the
same root cause as the unanswered report from July 2024
(megaraid_sas, 63-bit mask, &quot;Failed to set DMA mask&quot;):</p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent"><a href="https://lkml.iu.edu/hypermail/linux/kernel/2407.3/08254.html">https://lkml.iu.edu/hypermail/linux/kernel/2407.3/08254.html</a></p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent">That report already
confirmed CONFIG_SWIOTLB_DYNAMIC=n makes the problem go away. The
32-bit-mask case here is deterministic on any &gt;4 GB host, so it
should be easy to reproduce.</p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent">A minimal change
that restores the previous behaviour, e.g.</p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent">  return
xen_phys_to_dma(hwdev, io_tlb_default_mem.defpool.end - 1) &lt;=
mask;</p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent">probably isn&#39;t the
right fix for dynamic pools in general, but I wanted to flag where
the check went wrong. Happy to test patches on this hardware.</p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent"><br>

</p>
<p style="line-height:100%;margin-bottom:0cm;background:transparent">Thanks.</p>

</div>

--000000000000fc0ec5065b98b4aa--

