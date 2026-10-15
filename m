Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5619ACC6B39
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 16:22:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450889.1666244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHODm-00010w-55; Thu, 15 Oct 2026 16:22:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450889.1666244; Thu, 15 Oct 2026 16:22:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHODm-00010p-1r; Thu, 15 Oct 2026 16:22:22 +0000
Received: by outflank-mailman (input) for mailman id 1450889;
 Thu, 15 Oct 2026 16:22:20 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1xHODk-00010j-AV
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 16:22:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHODe-008cAN-ND
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 18:22:19 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ad0fda4-e002-0a2a0a5209dd-0a2a4508d1d6-16
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 18:22:14 +0200
Received: from [209.85.128.172] (helo=mail-yw1-f172.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ad0fdb5-f659-0a2a45080019-d15580acc8c7-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 18:22:14 +0200
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-8b0a28a720aso39767907b3.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 09:22:14 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=linaro.org header.i="@linaro.org" header.h="Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1792081333; cv=none;
        d=google.com; s=arc-20260327;
        b=F1SgXT0EV7HM4ZukGqn8rOJ5qAzCcA11b1NeZMcQqw6qdmBeHHzYTcdEDQY7IahplP
         SwsFhpfXc3FpUDDvogGqXJegNRUx+P6AxKGyRqSxed7TnuADrg1zY1rp1Q0oVv1vCuMf
         N8DDIcnWFG+etHmYjlv02uiOYOJXm4MR0sARjv5Zms5Oz66Jc9GvLqTzPoA/n6FVqn8/
         2RbL7SQssmCHD9PuMixLcMbAm2xklDHLCcOf0gjnsnqfdcrLna0xQhZuQlJfyK0R4t/U
         BBbgZazVO4XuD3+gYP/1u8qUCTwNiLMcrWKsKsb81VtyG3lRZu3eUL6dEG/RfP+1Hjxt
         Y4xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RQCElvh08J2BIDGN/zLgW6mGnyFT83qmeWNSYL2QSEU=;
        fh=GzccUDtmqNWNivxHxZY4MK4APLJJkH1THRT6PTh85Is=;
        b=KaIFWVVhYSRU8LJ7MgvnRT3Tz7A1ESmyZ5gRPi87S8W97dOkEv11sakkcQwB8GVUBB
         5SeIAQ/hUsww5tQHX+5Fk7F3nUQDWbHreycTpfYiiyGfBZOHKY7YnU49qLgSWkm8oexP
         Ep4eKHz1Az6lx3WTfrV2kyxk3XPkiFDnsl268/e1lF2U5d2Rq4FUrL+S1Gf5uwy6NwOl
         GvTY5TXv+bjoWvkhKM93+0xKUQ8POmipS0z+JyPEaus5QsPLCo4WnVZ0i0UXmKZeXrsO
         nL5InK2bO8uqnwzBO39Ov/2qxv1O4IYLFjMSgb780u1e2XDKQOAyNCPJDsNosBuMvX8j
         ks3A==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792081333; x=1792686133; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RQCElvh08J2BIDGN/zLgW6mGnyFT83qmeWNSYL2QSEU=;
        b=UtuzWqn0QMOEWzSsRA6t9rSuKOzBwXlw5jkX7tajFinz9iwMdcsIdmHFk4+ochjYr3
         pY8Xk1f8rkWB+gUtzpMxQ0iUnLa2zgEJE6Fr24APHcbz/EmWO3p1Bw+knaO3Thk1i4W6
         Lz2jUTcHeWco8w31jljiCq3ZprRJle2Pb0VQx73MlicTY0ZaSvjJPT9tZUhbyHC3ch01
         Gx4KPMtn1opVIYdOJqDRtyOnm505HdSjDy3w3Pafot7bF6f21ckvFxnlrfvPFdgfVdXY
         rXDNqNgURZRaZJKer1KoOsQcSMYEUEacIoq6b1AkPrR1lSsxkI7Vbe5xAOdcAfpIzqyc
         BHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792081333; x=1792686133;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RQCElvh08J2BIDGN/zLgW6mGnyFT83qmeWNSYL2QSEU=;
        b=dDcZC8rCaIvREqRxO5kC2HTi1vCm3EbjQcxugmrwcjqAFh+tNxhsyi3yKYgeGY5PWw
         qLoVrWtzya9lFuwhLDYOhzs3/Z3zcoimQc4DpPXp2/Q4crnCzc1o8K0mCmzIO41zXzJ7
         OefkUFwy6IYREX9P8HZ8u7Dffk/YiD+7znihm0O3SoEdVgoCOJg1FlyKydaFFdevBSoD
         MvnZITqpyywOJUdSrmbrbCoAM4tczUWD8ytA4lfUhGN09Vo7RvWplq7KJUQ2DxUtvwIu
         DOYDmwhbjBw/jJ4VrBpUY7M58CO1SEuaGd4z9OOZU7DHyPz8lR+45Vy9O9iHsEBeBYf4
         v9KA==
X-Forwarded-Encrypted: i=1; AKwUvBzC+7cNayxIrfdUFpMISLwIxdJ3j/wqIXUV6xNTwa6bJfp5/QPfF8L6orYPfcqAl57l7FCfEPWtjSA=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKxbaPsjsVXhVEjiENvhq39bO7NXj6UkoywO8aHXblUOb2q0O/G
	/8jaRs9G0vn/RjeezWGIU4EgUJvKMZN5HitlB/3AZYgOxDQiSxBN4wSMr5p+QiVSy5GYrjaC+ml
	L/1H9Df380KfDYyQVYaPjHivWM3RvwtSJNfQyCeS2Nw==
X-Gm-Gg: AYBFou3WZXAnlGA+z8qFJSyZRokrBbQlrwiThdFKcEzK5276obDReCQxYzsbGLnKBjm
	6iPHaYs2HmWgxih3IrI8BSZaXou8Zvu0jbVlyU6TIievFbkwGbXQ4FvO2MseTfrviyOkUdlSAx/
	mxqLr7q2QpJ97Z3uF1fxjxuPdvEf4Zbc8DYYo0X4WIIfltWLeIHnExkpqmKn7NM/pO/agWBsTUW
	7bLmZS4iRYPmE0lDapm4oRkAlL3AOzx2oE8CqZnIaZAjAQXJ8eV/SgM8z8gIcXCVjqR0BqaCHS+
	KAGERZZww76OMR+jO+9autbQkcrwMztJTf8CrNTMrBKGy7OZCEba6iUQxluZLmR7eO+C09dKezH
	yI8ssp1NuUsy8Ws/Bfz2UqId+WWU9/EHsO+Qz4OA=
X-Received: by 2002:a05:690c:387:b0:8b0:6866:c55f with SMTP id
 00721157ae682-8b07ee4d12emr67505727b3.46.1792081332932; Thu, 15 Oct 2026
 09:22:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260916104435.600211-1-mark.caveayland@nutanix.com>
 <20260916104435.600211-6-mark.caveayland@nutanix.com> <CAFEAcA9eucRyzG=PR2tpx8ObHkdK6xUmOjQ+-nNbJ2dVHaptOA@mail.gmail.com>
In-Reply-To: <CAFEAcA9eucRyzG=PR2tpx8ObHkdK6xUmOjQ+-nNbJ2dVHaptOA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Oct 2026 17:22:00 +0100
X-Gm-Features: AclHuK_JzHSeeixZQwFB55O2lE4YIMCEsFBYUzo_EwttzyD7LQh3FodmT7dI1cQ
Message-ID: <CAFEAcA-voNwJRTb2WQuxnvzk5LwBcXahz8HHrW=Yi3WUKeKgBg@mail.gmail.com>
Subject: Re: [PATCH 05/22] i8259.c: move parent_realize from PICClass to I8259CommonClass
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com, 
	sstabellini@kernel.org, anthony@xenproject.org, edgar.iglesias@gmail.com, 
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-c1860d/1792081334-D7B5987B-ED14495F/0/0
X-purgate-type: clean
X-purgate-size: 7695

On Tue, 13 Oct 2026 at 16:54, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 16 Sept 2026 at 11:49, Mark Cave-Ayland
> <mark.caveayland@nutanix.com> wrote:
> >
> > Both the emulated and KVM i8259 implementations store a reference to the
> > parent_realize function in their respective classes. Start by moving
> > parent_realize from PICClass to I8259CommonClass and removing PICClass since
> > it is no longer required.
> >
> > Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
>
> This is one of those things where I think we're not 100% consistent
> about whether we think the parent_realize field should go in the
> child class struct or the parent class struct. The name "parent_realize"
> implies it ought to be in the child struct, though, and I think we
> do that more often than we put it in the parent class.

We do, although it's a bit closer than I thought: about 50 callsites
put the parent_realize pointer in the child class struct; about 25
put it in the parent class struct. So I think for new code we should
prefer to follow the child-class-struct version.

in child's class:

hw/arm/smmu-common.c:    device_class_set_parent_realize(dc, smmu_base_realize,
hw/arm/smmuv3.c:    device_class_set_parent_realize(dc, smmu_realize,
hw/display/macfb.c:    device_class_set_parent_realize(dc, macfb_nubus_realize,
hw/i386/kvm/i8254.c:    device_class_set_parent_realize(dc, kvm_pit_realizefn,
hw/i386/kvm/i8259.c:    device_class_set_parent_realize(dc,
kvm_pic_realize, &kpc->parent_realize);
hw/input/adb-kbd.c:    device_class_set_parent_realize(dc, adb_kbd_realizefn,
hw/input/adb-mouse.c:    device_class_set_parent_realize(dc,
adb_mouse_realizefn,
hw/intc/arm_gic.c:    device_class_set_parent_realize(dc,
arm_gic_realize, &agc->parent_realize);
hw/intc/arm_gic_kvm.c:    device_class_set_parent_realize(dc,
kvm_arm_gic_realize,
hw/intc/arm_gicv3.c:    device_class_set_parent_realize(dc,
arm_gic_realize, &agc->parent_realize);
hw/intc/arm_gicv3_hvf.c:    device_class_set_parent_realize(dc,
hvf_gicv3_realize,
hw/intc/arm_gicv3_kvm.c:    device_class_set_parent_realize(dc,
kvm_arm_gicv3_realize,
hw/intc/arm_gicv3_whpx.c:    device_class_set_parent_realize(dc,
whpx_gicv3_realize,
hw/intc/arm_gicv5.c:    device_class_set_parent_realize(dc,
gicv5_realize, &gc->parent_realize);
hw/intc/i8259.c:    device_class_set_parent_realize(dc, pic_realize,
&k->parent_realize);
hw/intc/loongarch_dintc.c:    device_class_set_parent_realize(dc,
loongarch_dintc_realize,
hw/intc/loongarch_extioi.c:    device_class_set_parent_realize(dc,
loongarch_extioi_realize,
hw/intc/loongarch_extioi_common.c:
device_class_set_parent_realize(dc, loongarch_extioi_common_realize,
hw/intc/loongarch_ipi.c:    device_class_set_parent_realize(dc,
loongarch_ipi_realize,
hw/intc/loongarch_pch_pic.c:    device_class_set_parent_realize(dc,
loongarch_pic_realize,
hw/intc/loongarch_pic_common.c:    device_class_set_parent_realize(dc,
loongarch_pic_common_realize,
hw/intc/loongson_ipi.c:    device_class_set_parent_realize(dc,
loongson_ipi_realize,
hw/intc/loongson_ipi_common.c:    device_class_set_parent_realize(dc,
loongson_ipi_common_realize,
hw/intc/pnv_xive.c:    device_class_set_parent_realize(dc,
pnv_xive_realize, &pxc->parent_realize);
hw/intc/pnv_xive2.c:    device_class_set_parent_realize(dc, pnv_xive2_realize,
hw/intc/spapr_xive.c:    device_class_set_parent_realize(dc, spapr_xive_realize,
hw/intc/xics_pnv.c:    device_class_set_parent_realize(dc, pnv_icp_realize,
hw/intc/s390_flic_kvm.c:    device_class_set_parent_realize(dc,
kvm_s390_flic_realize,
hw/nubus/nubus-virtio-mmio.c:    device_class_set_parent_realize(dc,
nubus_virtio_mmio_realize,
hw/timer/i8254.c:    device_class_set_parent_realize(dc,
pit_realizefn, &pc->parent_realize);
hw/virtio/virtio-pci.c:    device_class_set_parent_realize(dc,
virtio_pci_dc_realize,
target/alpha/cpu.c:    device_class_set_parent_realize(dc, alpha_cpu_realizefn,
target/arm/cpu.c:    device_class_set_parent_realize(dc, arm_cpu_realizefn,
target/avr/cpu.c:    device_class_set_parent_realize(dc,
avr_cpu_realizefn, &mcc->parent_realize);
target/hexagon/cpu.c:    device_class_set_parent_realize(dc,
hexagon_cpu_realize,
target/hppa/cpu.c:    device_class_set_parent_realize(dc, hppa_cpu_realizefn,
target/i386/cpu.c:    device_class_set_parent_realize(dc, x86_cpu_realizefn,
target/loongarch/cpu.c:    device_class_set_parent_realize(dc,
loongarch_cpu_realizefn,
target/m68k/cpu.c:    device_class_set_parent_realize(dc, m68k_cpu_realizefn,
target/microblaze/cpu.c:    device_class_set_parent_realize(dc,
mb_cpu_realizefn,
target/mips/cpu.c:    device_class_set_parent_realize(dc, mips_cpu_realizefn,
target/or1k/cpu.c:    device_class_set_parent_realize(dc,
openrisc_cpu_realizefn,
target/ppc/cpu_init.c:    device_class_set_parent_realize(dc, ppc_cpu_realize,
target/riscv/cpu.c:    device_class_set_parent_realize(dc, riscv_cpu_realize,
target/rx/cpu.c:    device_class_set_parent_realize(dc, rx_cpu_realize,
target/s390x/cpu.c:    device_class_set_parent_realize(dc, s390_cpu_realizefn,
target/sh4/cpu.c:    device_class_set_parent_realize(dc, superh_cpu_realizefn,
target/sparc/cpu.c:    device_class_set_parent_realize(dc, sparc_cpu_realizefn,
target/tricore/cpu.c:    device_class_set_parent_realize(dc,
tricore_cpu_realizefn,
target/xtensa/cpu.c:    device_class_set_parent_realize(dc,
xtensa_cpu_realizefn,

in parent's class:

hw/input/lasips2.c:    device_class_set_parent_realize(dc,
lasips2_kbd_port_realize,
hw/input/lasips2.c:    device_class_set_parent_realize(dc,
lasips2_mouse_port_realize,
hw/input/pl050.c:    device_class_set_parent_realize(dc, pl050_kbd_realize,
hw/input/pl050.c:    device_class_set_parent_realize(dc, pl050_mouse_realize,
hw/intc/xics_spapr.c:    device_class_set_parent_realize(dc, ics_spapr_realize,
hw/isa/pc87312.c:    device_class_set_parent_realize(dc, pc87312_realize,
hw/isa/vt82c686.c:    device_class_set_parent_realize(dc, via_superio_realize,
hw/pci-bridge/cxl_root_port.c:    device_class_set_parent_realize(dc,
cxl_rp_realize, &rpc->parent_realize);
hw/pci-bridge/gen_pcie_root_port.c:
device_class_set_parent_realize(dc, gen_rp_realize,
&rpc->parent_realize);
hw/pci-host/pnv_phb.c:    device_class_set_parent_realize(dc,
pnv_phb_root_port_realize,
hw/pci-host/pnv_phb3_msi.c:    device_class_set_parent_realize(dc,
phb3_msi_realize,
hw/ppc/pnv.c:    device_class_set_parent_realize(dc, pnv_chip_power8_realize,
hw/ppc/pnv.c:    device_class_set_parent_realize(dc, pnv_chip_power9_realize,
hw/ppc/pnv.c:    device_class_set_parent_realize(dc, pnv_chip_power10_realize,
hw/ppc/pnv.c:    device_class_set_parent_realize(dc, pnv_chip_power11_realize,
hw/ppc/pnv_lpc.c:    device_class_set_parent_realize(dc, pnv_lpc_power8_realize,
hw/ppc/pnv_lpc.c:    device_class_set_parent_realize(dc, pnv_lpc_power9_realize,
hw/s390x/tod-kvm.c:
device_class_set_parent_realize(DEVICE_CLASS(oc),
kvm_s390_tod_realize,
hw/virtio/vhost-user-gpio.c:    device_class_set_parent_realize(dc,
vgpio_realize,
hw/virtio/vhost-user-i2c.c:    device_class_set_parent_realize(dc, vi2c_realize,
hw/virtio/vhost-user-input.c:    device_class_set_parent_realize(dc,
vinput_realize,
hw/virtio/vhost-user-rng.c:    device_class_set_parent_realize(dc,
vu_rng_base_realize,
hw/virtio/vhost-user-rtc.c:    device_class_set_parent_realize(dc,
vu_rtc_base_realize,
hw/virtio/vhost-user-snd.c:    device_class_set_parent_realize(dc,
vu_snd_base_realize,
hw/virtio/vhost-user-spi.c:    device_class_set_parent_realize(dc, vspi_realize,

thanks
-- PMM

