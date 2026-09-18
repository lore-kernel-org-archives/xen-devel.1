Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6C1C982D7
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 20:12:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1425856.1649563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7evg-0004r3-42; Fri, 18 Sep 2026 20:11:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1425856.1649563; Fri, 18 Sep 2026 20:11:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7evg-0004qu-1H; Fri, 18 Sep 2026 20:11:28 +0000
Received: by outflank-mailman (input) for mailman id 1425856;
 Fri, 18 Sep 2026 20:11:26 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1x7eve-0004qo-Pf
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 20:11:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7eve-000F4A-6g
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 22:11:26 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6aad9ad6-e002-0a2a0a5209dd-0a2a450c8966-20
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 22:11:26 +0200
Received: from [209.85.208.181] (helo=mail-lj1-f181.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6aad9aed-f479-0a2a450c0019-d155d0b5a819-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 22:11:26 +0200
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-3a49a40209dso13095811fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 13:11:26 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1789762285; cv=none;
        d=google.com; s=arc-20260327;
        b=UlTreZ9Rz2TZlelQx3rlI3wBpj/j0XvQQKxZRc7yUP1ACyvhmBVdN/K6gcjD8+5KKp
         w+bA5R7lGG+Fs+AtlUiXRR73I5f5DSNxuea4BmNNS+QNMxLcVLp6+xS4/ZjNr2YsoUx/
         gMpVoe8JDldUDTJLIOTbJaBjzOI10NSFEaR2wc/ubTw+jZRC4D/1FTjQPvnK+HZ2oWvb
         Y1aYLhN4nj4BH2GAKML23EYwHiIrKbN/Zk3SrCFy1+Z20orqFfOpxFHJGJH/kGl2FxIq
         L/yBkKMVIs7pA5sOPlY9QtHQ2CTjmWFFqv2w04Z7eOJqVaRyXPr730RWdcnmxcCiuc6P
         wn1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RjXqA35r57hnuOa5Guy5jxZ/xx19lYaIb7I9ZDD1OL4=;
        fh=8qrorWp5mU6HGMgfX45u2S7N0Hai0jOoVMQ5u+MxS64=;
        b=iQGxcw3cjg1wKK8Bv2BlEO+GtzT18g3KGI9qRI+fPsndcb/PJTbiiDa+GVBg4C0hJI
         IOeIxBMABRA/hEsxwLP+LYx2jBsiO8qQn3LoM0CKeH1B6AxNzO7BhkQTcrcYuHkGBa8f
         9LTUYUL8DC9Unt1WOerqeV0opqPVt3KF2k+Mj3b92pLZgCY9ref/9gZzVNKO2C8A7p+X
         +TVvGAUe0MFIY6EV/No2qVZW5nCc1iqervvSEZDkFMzfs8+z8p0etFo26ciy3rB2pUIa
         tNSLh0IWGjmovWmIi2EOTRQG2d4Ipw0ZNefaWNpfcRnMh1Fm3u90GiGLc4YQT9Grl9cv
         3q5g==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789762285; x=1790367085; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RjXqA35r57hnuOa5Guy5jxZ/xx19lYaIb7I9ZDD1OL4=;
        b=TnFHH8iTEYNBa+vb179BavuFFsG2UxxXO9VLu8ofzkqyQIycWDv+fg5hrxZIaNScnF
         T1+o/dLYDr4Ps0a8PtrIJ5tuyCCXq9NLuM8maIOnOTq8fZ/sx2cIlEjYISd1BOCGy5hE
         fcLk16C4/+9o2RwFUROmcre7bCtDkHWSeQY9+hyeov/y+EULNmjgVPsgZmOIIX1c1b07
         15qWtFo0NT8dL34iEQ2WIRR2A187l/RP8aAnl4X3L//Qm7jlMNK9chmUkiCFPDVgUe95
         mFxO3J07NIFNRulE9wdj7k1rVTn9kuzO62627c4dtMj20FYpDY8gwO5lXciQ0G0rK7lj
         cZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789762285; x=1790367085;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RjXqA35r57hnuOa5Guy5jxZ/xx19lYaIb7I9ZDD1OL4=;
        b=ZEvMVhv6g4uE8LIRwmys+47p5BAlb62BhWnje8gIiV/WnxfpqZHRBE31+OQdV+sK4F
         UrjAw+THff0CrgEVLllZpAkwKijPUzj75ba8sBqukahFB7daDyWY/aasNKq/5jQbcJhA
         UgsDwqyyyGumxr7xvYrNCSvty5z7F4d+spHtWa3vZRHknIt4FjL+SuYlwK8WwDXeC6SP
         saQ9PFday1Y/tHxlBXpiKktdgSMcinqfFUagAVPyvd2pk8u12eO3CQmZDvixOAK/w520
         k95vEBc15+f1SYyNzQP34dswm0dyVMpEfH8hxS6r+D3U2K//YrFIWIYfjTOxxYRMGEgj
         yDGw==
X-Forwarded-Encrypted: i=1; AKwUvBwSYlAGfEmOiUPlZDf2Bj/LRAx9TWxgftpNZJ4+NuVcbM3MHSonqcJiSHL3qLbLZZL5ypNGU1OBDzQ=@lists.xenproject.org
X-Gm-Message-State: AFuF++mMWrqxhyTD93AeojwfcpHO8nu9B7xiV6Udp0sHnbJB4fhAFtCY
	WrqHUw5c5GkT59xzkKCZDIp2pCeU4EJ3LUZi/9NsBQXiOIFG3NqgeFPOlVtWmH5+J9YURAAI7m7
	O6KuwvDuTX7Vmp71i894sV0NE2vz5ia0=
X-Gm-Gg: AYBFou3+gPGbgignZJIPFnzZLrDPyX+xp+rSYuD4wnWxsr2AgwKTH1/ybJtcxGtruBA
	KNz3lKJq7ihpC//tWuFkuAhM/LAq/9trT7GiHlmosWawPkDjIkJqqsZb8KwiCMeaGTW9U2LMnW+
	Pg2uRhGRn/Xi+3czRB9nYVjtwcEO4KLhDUEKYNTSq1RB0+iYEE8HBEcivgMmd4c464qGQ+TU6Bs
	K8jWaSvzYdoOSoT4A2SPKU2I7hFQZqGx59IVsPWltm4dJvGoDESiWAQGTd5OFh9CPT94Qt2ywUF
	Ge4zI2bnTIv2F8Lq53SIWc1L3oFcvWirpmESRdaecWBq1hUDOr/EYZEM
X-Received: by 2002:a05:651c:a332:b0:3a4:8e54:562 with SMTP id
 38308e7fff4ca-3a5e72887c0mr23728131fa.7.1789762285055; Fri, 18 Sep 2026
 13:11:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1770046465.git.mykyta_poturai@epam.com> <AC263D87-9EE3-4F32-BC5D-1A290781C48B@arm.com>
 <CAGeoDV_a-tUGrQai8+VzQwwGHSGwbJ04Y6uWg-pr5mVi52dsaw@mail.gmail.com>
In-Reply-To: <CAGeoDV_a-tUGrQai8+VzQwwGHSGwbJ04Y6uWg-pr5mVi52dsaw@mail.gmail.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 18 Sep 2026 23:11:14 +0300
X-Gm-Features: AcwNN1V_KbA5WvJDMDtxQRX4T9C_CIgIZ4qrzFv_OucX5rM4pnYoOhtBfvIduYM
Message-ID: <CAGeoDV_CFMC1w2o+5BdDW7u7f2iCP0S4s-7EMokgLf6r_7zKjQ@mail.gmail.com>
Subject: Re: [RFC PATCH 00/19] GICv4 Support for Xen
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Mykyta Poturai <Mykyta_Poturai@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d25034/1789762286-00ECAA5B-12A38958/0/0
X-purgate-type: clean
X-purgate-size: 9942

Hi,

Following up with another round of tests for this RFC. The posted
series covers GICv4.0; I tested an expanded version with additional
patches for GICv4.1 on AWS c7g.metal.

The extra patches add GICv4.1 ITS commands, vPE table and residency
handling, default doorbells and direct vSGI delivery, plus
interrupt-state fixes. The results below apply to this extended
series, not to the posted RFC alone.

Source branches:
  Network OFF/ON: [1]
  Network BASE:   [2]
  NVMe OFF/ON:    [3]

Additional patches after the rebased GICv4.0 part: [4]

Workloads run in Dom0 with Credit2 and iommu=3Dno. Within each test
series, OFF and ON use the same Xen binary with direct mode disabled
or enabled. Network tests also include a matched BASE build without
the series. All network builds have CONFIG_DEBUG disabled. The
network sender is c8gn.4xlarge.

ON versus OFF:

- NVMe: peak IOPS are unchanged. Scheduled Dom0 time per I/O falls by
  4.2-6.1%; handled Xen IPIs fall by 98.2-99.7% at total QD64.
- UDP4: received PPS is almost unchanged; scheduled Dom0 time/GiB
  falls by 7.6-10.0%.
- UDP8: received PPS rises by 1.7-12.9% at the same offered rates;
  scheduled Dom0 time/GiB falls by 16.8-24.0%. The PPS gain is
  subject to the CPU0 interrupt-routing limitation described below.

The UDP tests use 64-byte payloads at total offered rates of 800,
896 and 1000 Mbit/s. The PPS differences describe packet delivery
at these rates, not a measured increase in maximum sustainable PPS.

The UDP8 PPS gain needs a qualification. In BASE/OFF, all recorded
physical LPI-handler entries occur on pCPU0, even though guest IRQ
handling is spread across vCPUs. At a total input of 800 Mbit/s,
vCPU0 accumulates about 30 scheduled seconds in a 30-second trial,
and its flow receives only about 8.7 Mbit/s in OFF out of the
requested 100 Mbit/s. ON receives almost the full rate on that flow.

This is consistent with a CPU0 bottleneck in BASE/OFF. The PPS gain
may therefore reflect relief of that bottleneck, rather than only
a lower cost of injecting each vLPI. =D0=A8 have not tested OFF with
physical LPIs distributed across CPUs, so we cannot separate these
effects. The result applies to the tested configurations; it is
not an isolated measurement of the direct-vLPI speedup.

There are also limits and worse results:

- TCP throughput is almost unchanged. Actual generator TX queues
  differ from the requested placement in 15 of 18 trials, which
  limits CPU-cost comparisons. TCP1 ON has more IPIs.
- Storage tail latency changes in both directions. Some normal ON
  trials have more long completions. The four-volume sweep has a
  maximum completion time of 26.8 ms OFF versus 62.5 ms ON. A separate
  ON contention trial has a 1.050-second outlier. Their causes are
  not established.
- The shared-CPU contention test stays near 100 IOPS in both modes,
  with about 100 ON worker doorbells/s. Separate GICv3 FVP tests
  using virtio storage show sensitivity to CPU/IRQ placement. They
  are supporting controls, not a direct comparison with AWS.

The report covers 96 NVMe, 72 Xen network and 18 native UDP trials.
The network tests and each NVMe queue-depth sweep have one boot
per mode; the initial NVMe pairs also differ in CPU placement.
Repeated trials within a boot do not measure boot-to-boot variation.

The CPU figures measure scheduled Dom0 time, not total host CPU
use. NVMe CPU ratios cover the full sweep and include completed
I/Os from both measured trials and warmups. IPI counters measure
handled events, not the time spent handling them.

These results provide performance evidence in favour of the
extended series, mainly lower scheduled Dom0 time and fewer IPIs
in the NVMe and UDP tests. They do not show gains in every workload
or replace correctness and maintainability review.

The report [5] includes the detailed results and limitations.
The same repository contains raw logs, statistics and test scripts.

Best regards,
Mykola

[1] https://github.com/xakep-amatop/xen/tree/gicv4-bench-v3
[2] https://github.com/xakep-amatop/xen/tree/gicv4-bench-v3-base
[3] https://github.com/xakep-amatop/xen/tree/gicv4-bench-v3-nvme
[4] https://github.com/xakep-amatop/xen/compare/c368b2ece40787d3fa333b1b824=
e0dc89dd585c9...2b54d02e5bb6c038396c8aae5bd9dad00cc3697e
[5] https://github.com/xakep-amatop/giv4-benchmark/blob/v3-benchmarks/repor=
t.pdf

On Tue, Mar 17, 2026 at 11:11=E2=80=AFAM Mykola Kvach <xakep.amatop@gmail.c=
om> wrote:
>
> Hi Bertrand,
>
> On Tue, Feb 3, 2026 at 12:02=E2=80=AFPM Bertrand Marquis
> <Bertrand.Marquis@arm.com> wrote:
> >
> > Hi Mykyta,
> >
> > We have a number of series from you which have not been merged yet and
> > reviewing them all in parallel might be challenging.
> >
> > Would you mind giving us a status and maybe priorities on them.
> >
> > I could list the following series:
> > - GICv4
> > - CPU Hotplug on arm
> > - PCI enumeration on arm
> > - IPMMU for pci on arm
> > - dom0less for pci passthrough on arm
> > - SR-IOV for pvh
> > - SMMU for pci on arm
> > - MSI injection on arm
> > - suspend to ram on arm
> >
> > There might be others feel free to complete the list.
> >
> > On GICv4...
> >
> > > On 2 Feb 2026, at 17:14, Mykyta Poturai <Mykyta_Poturai@epam.com> wro=
te:
> > >
> > > This series introduces GICv4 direct LPI injection for Xen.
> > >
> > > Direct LPI injection relies on the GIC tracking the mapping between p=
hysical and
> > > virtual CPUs. Each VCPU requires a VPE that is created and registered=
 with the
> > > GIC via the `VMAPP` ITS command. The GIC is then informed of the curr=
ent
> > > VPE-to-PCPU placement by programming `VPENDBASER` and `VPROPBASER` in=
 the
> > > appropriate redistributor. LPIs are associated with VPEs through the =
`VMAPTI`
> > > ITS command, after which the GIC handles delivery without trapping in=
to the
> > > hypervisor for each interrupt.
> > >
> > > When a VPE is not scheduled but has pending interrupts, the GIC raise=
s a per-VPE
> > > doorbell LPI. Doorbells are owned by the hypervisor and prompt resche=
duling so
> > > the VPE can drain its pending LPIs.
> > >
> > > Because GICv4 lacks a native doorbell invalidation mechanism, this se=
ries
> > > includes a helper that invalidates doorbell LPIs via synthetic =E2=80=
=9Cproxy=E2=80=9D devices,
> > > following the approach used until GICv4.1.
> > >
> > > All of this work is mostly based on the work of Penny Zheng
> > > <penny.zheng@arm.com> and Luca Fancellu <luca.fancellu@arm.com>. And =
also from
> > > Linux patches by Mark Zyngier.
> > >
> > > Some patches are still a little rough and need some styling fixes and=
 more
> > > testing, as all of them needed to be carved line by line from a giant=
 ~4000 line
> > > patch. This RFC is directed mostly to get a general idea if the propo=
sed
> > > approach is suitable and OK with everyone. And there is still an open=
 question
> > > of how to handle Signed-off-by lines for Penny and Luca, since they h=
ave not
> > > indicated their preference yet.
> >
> > I would like to ask how much performance benefits you could
> > have with this.
> > Adding GICv4 support is adding a lot of code which will have to be main=
tained
> > and tested and there should be a good improvement to justify this.
> >
> > Did you do some benchmarks ? what are the results ?
> >
> > At the time where we started to work on that at Arm, we ended up in the=
 conclusion
> > that the complexity in Xen compared to the benefit was not justifying i=
t hence why
> > this work was stopped in favor of other features that we thought would =
be more
> > beneficial to Xen (like PCI passthrough or SMMUv3).
>
> I have been asked to run benchmarks for this series, so here is a short
> update from my side.
>
> Test setup:
>
> - AWS c7g bare metal
> - Linux bare-metal reference and Xen dom0 runs
> - fio random-read workloads on an NVMe-backed EBS volume (gp3, 160G, 80k =
iops)
> - Main workloads:
>
> - 4k, iodepth=3D1
> - 16k, iodepth=3D1
> - 4k, iodepth=3D4
> - 4k, iodepth=3D1, numjobs=3D4
> - 5 repetitions per configuration, looking mainly at median values
> - Main Xen comparison was done with the default scheduler (credit2),
> direct LPIs OFF vs ON
>
> Summary:
>
> - With credit2, enabling direct LPIs gave a small but repeatable IOPS
> improvement across all tested workloads, roughly in the 0.8-1.1% range.
> - Mean completion latency also improved consistently.
> - The clearest gain was in tail latency. In the 4k randread,
> iodepth=3D1, numjobs=3D4 case, p99.9 improved by about 41% and p99.99 by
> about 34% with direct LPIs enabled.
> - In this setup, switching from credit2 to null did not materially change
> median throughput, so the observed improvement appears to come primarily
> from the interrupt delivery path rather than from the scheduler choice.
>
> A few caveats:
>
> - This was a low-contention setup with only dom0 using 8 CPUs, so it did =
not
> exercise heavy VCPU migration or scheduler pressure.
> - I also tried an artificially constrained NVMe host queue depth
> configuration, but I am treating that only as a stress/control case and
> not as the main result.
>
> A full benchmark report is available here:
> https://github.com/xakep-amatop/giv4-benchmark/blob/main/report.pdf
>
> The same repository also contains the raw benchmark result archives used =
for
> the analysis.
>
> So, based on these measurements, there does appear to be a measurable
> benefit from direct LPI injection, with the strongest effect showing up i=
n
> tail latency rather than in median throughput.
>
> If you need any additional benchmark results or specific test cases, plea=
se
> let me know.
>
> Best regards,
> Mykola
>
> >
> > Cheers
> > Bertrand
> >

