Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7256C5516F
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2026 23:38:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1379692.1624111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpwoM-00020B-1P; Fri, 31 Jul 2026 23:38:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1379692.1624111; Fri, 31 Jul 2026 23:38:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpwoL-000204-U5; Fri, 31 Jul 2026 23:38:41 +0000
Received: by outflank-mailman (input) for mailman id 1379692;
 Fri, 31 Jul 2026 23:38:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3_DFtagYKCW8fRNaWPTbbTYR.PbZkRa-QRiRYYVfgf.kRacebWRPg.beT@flex--seanjc.bounces.google.com>)
 id 1wpwoK-0001zy-93
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 23:38:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpwoJ-004a2B-0v
 for xen-devel@lists.xenproject.org; Sat, 01 Aug 2026 01:38:39 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3_DFtagYKCW8fRNaWPTbbTYR.PbZkRa-QRiRYYVfgf.kRacebWRPg.beT@flex--seanjc.bounces.google.com>)
 id 6a6d3163-e002-0a2a0a5209dd-0a2a450bb140-40
 for <xen-devel@lists.xenproject.org>; Sat, 01 Aug 2026 01:38:38 +0200
Received: from [209.85.210.197] (helo=mail-pf1-f197.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3_DFtagYKCW8fRNaWPTbbTYR.PbZkRa-QRiRYYVfgf.kRacebWRPg.beT@flex--seanjc.bounces.google.com>)
 id 6a6d31fd-b7e8-0a2a450b0019-d155d2c5b503-3
 for <xen-devel@lists.xenproject.org>; Sat, 01 Aug 2026 01:38:38 +0200
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-8486ffba174so2723306b3a.1
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 16:38:38 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785541117; x=1786145917; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dmKsJOviftvACUGPABBN88S+tJ91thYPhBWQcoJdx18=;
        b=dJBoj3ZPE0CiYfljguCdQFb41rB3w22JoPZkln61893e34siy8Rq65O2Gm2W+nCJ6I
         sh6Wh5mDTbvjaOczBpMe66X/uB0t3NmH0ylwXQmXS/jjwCGuxHjYbg1CL+bhEmxhcX+z
         +2gCB6e+wG9ctIQNe/8ZrHr8hB5qjSEBovr3k76tnXUGUNU4ZoP4uYS9h6+6++6xDJIa
         UnSRlBVHT9lRaoEBJmbz7gpxXRWurd/nhCTH2DW+fR17c1sIvkcGSK7Ds8kHgT2Aqghs
         Uyg+fpoP4t5MYSM8wlVmTq5HMxnE8KtvRy+E2ubP4QAb7Y0qR6Zy9f5xM6CP2k0WRy6q
         cdGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785541117; x=1786145917;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dmKsJOviftvACUGPABBN88S+tJ91thYPhBWQcoJdx18=;
        b=CgQ6KhMaZq7dgQGWGyz1Pc9jzZetPaLEk8DbGeQXKHtIhmdAF9GiTzn56N4tV4L+r1
         gHR8BUVsD0uUMqT207hUi2+Ji/B4ZKuckq2Qlq7++VdnfPBm8T100nDpFsG9LRBXmhMD
         ANBejbI9y8P4nko2B3EqaISp+ApkzDMSypzTEULCm+qwWdxK6Q7O/tuopQqppC2z/1cJ
         1O7rYl7p/8Mzh/3aR7uLU+8mxQyB94+tZoBPEvvt/o/ga85fQi7eVASyiIkF9oTUHRgZ
         My38kzDAWVEUl4WCjh8AAmFPMisUZjmb7Szho+glpP64/LjhGbLtOzPwI7g6a5Hz7wjh
         Ic7g==
X-Forwarded-Encrypted: i=1; AHgh+RqAtDlbo1OqcqViZ7lTDtj2Q+HfWvVxkoLB1Q9EoyZE8q5Qs+TedyycTFRamF7qDu2iKER/Npo4+MM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyFWBv6sgeFbIXncdx8nxckin5IsA5vvX4tqqkh0eOmwC3XDEAn
	cnqaoU/CPI4vyBEHE+qa6OuEfrx/JlIV/Tus4pwjRYIfdIeV2W6fAT4dxbFqzImtQbLEfSsJB6Y
	DMOPE9g==
X-Received: from pful5.prod.google.com ([2002:a05:6a00:1405:b0:847:a85b:6c23])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:6c8f:b0:847:8b0f:2508
 with SMTP id d2e1a72fcca58-84ee47789c4mr1324782b3a.13.1785541116639; Fri, 31
 Jul 2026 16:38:36 -0700 (PDT)
Date: Fri, 31 Jul 2026 16:38:36 -0700
In-Reply-To: <20260728144954.355376-35-dwmw2@infradead.org>
Mime-Version: 1.0
References: <20260728144954.355376-1-dwmw2@infradead.org> <20260728144954.355376-35-dwmw2@infradead.org>
Message-ID: <am0x_ORC0olomizu@google.com>
Subject: Re: [PATCH v7 34/36] KVM: selftests: Add master clock offset test
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Paul Durrant <paul@xen.org>, 
	Jonathan Cameron <jic23@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, Jack Allister <jalliste@amazon.com>, 
	Dongli Zhang <dongli.zhang@oracle.com>, joe.jin@oracle.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-42698a/1785541118-2C39B9EA-345BD532/0/0
X-purgate-type: clean
X-purgate-size: 5038

On Tue, Jul 28, 2026, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
>=20
> Verify that KVM master clock mode remains active when vCPUs have
> different TSC offsets but the same frequency. Creates three vCPUs,
> sets one to a different TSC value, and confirms:
>=20
>  - KVM_CLOCK_HOST_TSC is set (master clock active)
>  - KVM_CLOCK_TSC_STABLE IS set (master clock =E2=87=92 stable flag)
>  - PVCLOCK_TSC_STABLE_BIT is NOT set (offsets differ)
>=20
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Assisted-by: Kiro (claude-opus-4.6-1m)
> ---
>  tools/testing/selftests/kvm/Makefile.kvm      |   1 +
>  .../kvm/x86/masterclock_offset_test.c         | 180 ++++++++++++++++++
>  2 files changed, 181 insertions(+)
>  create mode 100644 tools/testing/selftests/kvm/x86/masterclock_offset_te=
st.c
>=20
> diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/sel=
ftests/kvm/Makefile.kvm
> index 95539deea266..f6027a35f790 100644
> --- a/tools/testing/selftests/kvm/Makefile.kvm
> +++ b/tools/testing/selftests/kvm/Makefile.kvm
> @@ -108,6 +108,7 @@ TEST_GEN_PROGS_x86 +=3D x86/pmu_event_filter_test
>  TEST_GEN_PROGS_x86 +=3D x86/private_mem_conversions_test
>  TEST_GEN_PROGS_x86 +=3D x86/private_mem_kvm_exits_test
>  TEST_GEN_PROGS_x86 +=3D x86/pvclock_test
> +TEST_GEN_PROGS_x86 +=3D x86/masterclock_offset_test

Keep these sorted alphabetically.

>  TEST_GEN_PROGS_x86 +=3D x86/pvclock_migration_test
>  TEST_GEN_PROGS_x86 +=3D x86/set_boot_cpu_id
>  TEST_GEN_PROGS_x86 +=3D x86/set_sregs_test
> diff --git a/tools/testing/selftests/kvm/x86/masterclock_offset_test.c b/=
tools/testing/selftests/kvm/x86/masterclock_offset_test.c
> new file mode 100644
> index 000000000000..88e2bd2edab5
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/x86/masterclock_offset_test.c
> @@ -0,0 +1,180 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Test that KVM master clock mode works with different TSC offsets
> + * as long as all vCPUs have the same TSC frequency.
> + */
> +#include <stdint.h>
> +#include <string.h>
> +
> +#include "test_util.h"
> +#include "kvm_util.h"
> +#include "processor.h"
> +
> +#include <asm/pvclock-abi.h>
> +
> +#define KVMCLOCK_GPA	0xc0000000ull
> +#define TSC_OFFSET	(1000000000ULL)
> +
> +static uint64_t pvclock_calc(struct pvclock_vcpu_time_info *pvti, uint64=
_t guest_tsc)
> +{
> +	uint64_t delta =3D guest_tsc - pvti->tsc_timestamp;
> +
> +	if (pvti->tsc_shift >=3D 0)
> +		delta <<=3D pvti->tsc_shift;
> +	else
> +		delta >>=3D -(int)pvti->tsc_shift;
> +
> +	return pvti->system_time + ((__uint128_t)delta * pvti->tsc_to_system_mu=
l >> 32);
> +}
> +
> +static void guest_code(void)
> +{
> +	wrmsr(MSR_KVM_SYSTEM_TIME_NEW, KVMCLOCK_GPA | KVM_MSR_ENABLED);
> +	for (;;)
> +		GUEST_SYNC(0);
> +}
> +
> +int main(void)
> +{
> +	struct kvm_vcpu *vcpus[3];
> +	struct kvm_clock_data clock;
> +	struct pvclock_vcpu_time_info pvti[3];
> +	struct kvm_vm *vm;
> +	uint64_t offset0, host_tsc, clk0, clk2;
> +	int i;
> +
> +	TEST_REQUIRE(sys_clocksource_is_based_on_tsc());
> +
> +	vm =3D vm_create_with_vcpus(3, guest_code, vcpus);
> +
> +	TEST_REQUIRE(!__vcpu_has_device_attr(vcpus[0], KVM_VCPU_TSC_CTRL,
> +					     KVM_VCPU_TSC_OFFSET));
> +
> +	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
> +				    KVMCLOCK_GPA, 1,
> +				    vm_calc_num_guest_pages(VM_MODE_DEFAULT,
> +							   getpagesize()), 0);
> +	virt_map(vm, KVMCLOCK_GPA, KVMCLOCK_GPA,
> +		 vm_calc_num_guest_pages(VM_MODE_DEFAULT, getpagesize()));
> +
> +	/* Get vCPU 0's default offset and set vCPU 2's offset higher */
> +	vcpu_device_attr_get(vcpus[0], KVM_VCPU_TSC_CTRL,
> +			     KVM_VCPU_TSC_OFFSET, &offset0);
> +	uint64_t offset2 =3D offset0 + TSC_OFFSET;
> +	vcpu_device_attr_set(vcpus[2], KVM_VCPU_TSC_CTRL,
> +			     KVM_VCPU_TSC_OFFSET, &offset2);
> +
> +	/* Run each vCPU to enable kvmclock (with offset already set) */
> +	for (i =3D 0; i < 3; i++) {

ARRAY_SIZE(vcpus)

> +		vcpu_run(vcpus[i]);
> +		TEST_ASSERT_KVM_EXIT_REASON(vcpus[i], KVM_EXIT_IO);
> +	}
> +
> +	/* Check master clock is active */
> +	memset(&clock, 0, sizeof(clock));
> +	vm_ioctl(vm, KVM_GET_CLOCK, &clock);

Provide an API.

> +	pr_info("KVM_GET_CLOCK flags: 0x%x\n", clock.flags);
> +	TEST_ASSERT(clock.flags & KVM_CLOCK_HOST_TSC,
> +		    "Master clock should be active, flags=3D0x%x", clock.flags);
> +	TEST_ASSERT(clock.flags & KVM_CLOCK_TSC_STABLE,
> +		    "KVM_CLOCK_TSC_STABLE should be set, flags=3D0x%x", clock.flags);
> +
> +	/* Get per-vCPU pvclock in order 0, 2, 1 */
> +	int order[] =3D {0, 2, 1};

Please don't declare variables in the middle code.  Yes, it's now technical=
ly
possible thanks to all the guard() magic, but it's still against preferred =
kernel
style.

Though this itself is probably a really, really good indication that this n=
eeds
to be split into multiple testcases.  Maybe using TEST_F() and a custom fix=
ture?

