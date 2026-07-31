Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02CA1C5516F
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2026 23:33:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1379685.1624103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpwiz-00019n-Fh; Fri, 31 Jul 2026 23:33:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1379685.1624103; Fri, 31 Jul 2026 23:33:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpwiz-00019g-CF; Fri, 31 Jul 2026 23:33:09 +0000
Received: by outflank-mailman (input) for mailman id 1379685;
 Fri, 31 Jul 2026 23:33:07 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3qjBtagYKCRsJ51EA37FF7C5.3FDO5E-45M5CC9JKJ.O5EGIFA53K.FI7@flex--seanjc.bounces.google.com>)
 id 1wpwix-00019F-FL
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 23:33:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpwiw-007ubw-Od
 for xen-devel@lists.xenproject.org; Sat, 01 Aug 2026 01:33:06 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3qjBtagYKCRsJ51EA37FF7C5.3FDO5E-45M5CC9JKJ.O5EGIFA53K.FI7@flex--seanjc.bounces.google.com>)
 id 6a6d3058-2eae-0a2a0a5409dd-0a2a4506b3d6-42
 for <xen-devel@lists.xenproject.org>; Sat, 01 Aug 2026 01:33:01 +0200
Received: from [209.85.215.197] (helo=mail-pg1-f197.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3qjBtagYKCRsJ51EA37FF7C5.3FDO5E-45M5CC9JKJ.O5EGIFA53K.FI7@flex--seanjc.bounces.google.com>)
 id 6a6d30ab-195a-0a2a45060019-d155d7c5b954-3
 for <xen-devel@lists.xenproject.org>; Sat, 01 Aug 2026 01:33:01 +0200
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-cb5cc1e13f8so1826377a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 16:33:00 -0700 (PDT)
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
        d=google.com; s=20251104; t=1785540779; x=1786145579; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8/b1huLAEdiKYHbWYUwfN/XZnmcBk/ZLpbBd8pgF/SE=;
        b=a+lCbOj0uOr6R+1Ed2f6q2El1ZqJlli7MaIWnlun41g77jqcAzatvQtPAQ/WvpBlzl
         PHcHiqMrwNstBUQPxS+x9ycNDhumxb32XANm3K0VaAx0mVP2LwNivqObt5VGqMrMVC5u
         xij5u+9P+UDszI3AZkc+2hPgZ47tGNgY5rQ5yhk4TWnhVkqJZ9Od+1aYFr83DnsTiSNh
         cMUYsLMcN+wvFkkMXQ2o7yaNs2nqyYbjj5pO9ylc08xO9GV+rgU4wiTV7P06EhWlv7/8
         foi7+fehERPGY08Rithc5YpSp/keMoD9MSENTedoY5LKOh8y9uWyXBvgLJ+OZSqu3ZKZ
         mutw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785540779; x=1786145579;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8/b1huLAEdiKYHbWYUwfN/XZnmcBk/ZLpbBd8pgF/SE=;
        b=NpD8+iDOGi1MK7VtA0GH5mBNiK1mExb8G4ayypGGGPB2PJ68EfnxhUvNTEnwroerqo
         VvIlOzxszOWmnmY/Xg/7/1mhHz9WH22iGvSxEVoXc2QvtsH2smcWi8zMTKwk5M+aan0y
         ocC9LLRQi+E/5G3qgCtImQicG/pdeq5/uvsmxlonz/mdKYNDIz+EBsxax9mJlC9dgdDs
         /a+RzmA66H1ETxYt27ApLDaRvKWuNxJzUaPtFrFlq919PwpWxrkEwCU3tQFnVRN7/kw8
         xObmeWxMkQwgckU968FbyXN+ViuqgUFs3eK6Y0G4wzhRR00T+vSEr95GXqTyzOjbM2/w
         Yfdw==
X-Forwarded-Encrypted: i=1; AHgh+Rq/lkA9GhEhhL/Qzw4lsnIQa7sHiDFyCRShCSKM6TgCATvWexIdU0HTXzlARNmWwIE6pMt9jiXQ+B8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOL0CYIbGThzgJJ6c29zhqMh4EQNEdODFCMPbPiwTRPd09+y6x
	IEW8SeRzzx29kE4VAEZ5eLvIrPXldBueu+qDcnWJ5gMRMj5MAOfTw2j2bDV9PHGHJMIAtBK6EE+
	V6TIlug==
X-Received: from pgbs63.prod.google.com ([2002:a63:5e42:0:b0:cbb:5dd3:9904])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9e0e:b0:3c0:9c18:d5a7
 with SMTP id adf61e73a8af0-3c92a8d8717mr1547928637.68.1785540778920; Fri, 31
 Jul 2026 16:32:58 -0700 (PDT)
Date: Fri, 31 Jul 2026 16:32:58 -0700
In-Reply-To: <20260728144954.355376-34-dwmw2@infradead.org>
Mime-Version: 1.0
References: <20260728144954.355376-1-dwmw2@infradead.org> <20260728144954.355376-34-dwmw2@infradead.org>
Message-ID: <am0wquLHtd28syfx@google.com>
Subject: Re: [PATCH v7 33/36] KVM: selftests: Add KVM/PV clock selftest to
 prove timer correction
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
X-purgate-ID: tlsNG-16d1c6/1785540781-1EAC277B-A91F97E5/0/0
X-purgate-type: clean
X-purgate-size: 7161

> +int main(int argc, char *argv[])
> +{
> +	static const struct option long_opts[] =3D {
> +		{ "sleep", required_argument, NULL, 's' },
> +		{ "help",  no_argument,       NULL, 'h' },
> +		{ NULL,    0,                  NULL,  0  },
> +	};
> +	unsigned int sleep_sec =3D 2;
> +	struct kvm_vcpu *vcpu;
> +	struct kvm_vm *vm;
> +	uint64_t host_khz;
> +	uint64_t freq;
> +	int opt;
> +
> +	while ((opt =3D getopt_long(argc, argv, "s:h", long_opts, NULL)) !=3D -=
1) {
> +		switch (opt) {
> +		case 's':
> +			sleep_sec =3D atoi(optarg);
> +			break;
> +		case 'h':
> +		default:
> +			usage(argv[0]);
> +			return opt =3D=3D 'h' ? 0 : 1;
> +		}
> +	}
> +
> +	TEST_REQUIRE(sys_clocksource_is_based_on_tsc());
> +	TEST_REQUIRE(kvm_has_cap(KVM_CAP_TSC_CONTROL));
> +
> +	vm =3D vm_create_with_one_vcpu(&vcpu, guest_code);
> +	configure_pvclock(vm);
> +
> +	/* Check KVM_GET_CLOCK_GUEST is supported */
> +	{
> +		struct pvclock_vcpu_time_info tmp;
> +		int ret =3D __vcpu_ioctl(vcpu, KVM_GET_CLOCK_GUEST, &tmp);
> +		TEST_REQUIRE(ret =3D=3D 0);

It will likely be a moot point since we should have a CAP, but don't do TES=
T_REQUIRE()
on a local variable like this, it completely defeates the purpose of the ma=
cro
shenanigans.  Becuase this:

  1..0 # SKIP - Requirement not met: ret =3D=3D 0

is useless information, whereas this:

  1..0 # SKIP - Requirement not met: !__vcpu_ioctl(vcpu, KVM_GET_CLOCK_GUES=
T, &tmp)

gives the user a starting point without having to go search through the tes=
t code.

> +	}

...

> +static volatile uint32_t vcpu_counter;
> +static void guest_code_stable_bit(void)
> +{
> +	uint32_t idx =3D __atomic_fetch_add(&vcpu_counter, 1, __ATOMIC_SEQ_CST)=
;
> +	uint64_t gpa =3D KVMCLOCK_GPA + idx * sizeof(struct pvclock_vcpu_time_i=
nfo);

This series needs to be updated to catch up to upstream.  Selftests now use
u32, u64, etc.  And at least one patch missed an obvious opportunity for gu=
ard().=20

> +	wrmsr(MSR_KVM_SYSTEM_TIME_NEW, gpa | KVM_MSR_ENABLED);
> +	GUEST_SYNC(0);
> +	GUEST_SYNC(0);
> +	GUEST_SYNC(0);
> +}
> +
> +static void set_tsc_offset(struct kvm_vcpu *vcpu, uint64_t offset)
> +{
> +	struct kvm_device_attr attr =3D {
> +		.group =3D KVM_VCPU_TSC_CTRL,
> +		.attr =3D KVM_VCPU_TSC_OFFSET,
> +		.addr =3D (__u64)(uintptr_t)&offset,
> +	};
> +
> +	TEST_REQUIRE(__vcpu_has_device_attr(vcpu, KVM_VCPU_TSC_CTRL,
> +					    KVM_VCPU_TSC_OFFSET) =3D=3D 0);
> +	vcpu_ioctl(vcpu, KVM_SET_DEVICE_ATTR, &attr);

This quite clearly belongs in library code.

> +}
> +
> +static void run_vcpu_once(struct kvm_vcpu *vcpu)
> +{
> +	struct ucall uc;
> +
> +	vcpu_run(vcpu);
> +	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_IO);
> +	switch (get_ucall(vcpu, &uc)) {
> +	case UCALL_ABORT:
> +		REPORT_GUEST_ASSERT(uc);

Gah, we really need to have vcpu_run() handle guest asserts.

> +		break;
> +	case UCALL_SYNC:
> +		break;
> +	default:
> +		TEST_FAIL("Unexpected ucall");
> +	}
> +}
> +
> +static void test_tsc_stable_bit(void)
> +{
> +	struct pvclock_vcpu_time_info pvti;
> +	struct kvm_vcpu *vcpus[2];
> +	struct kvm_vm *vm;
> +	int ret;
> +
> +	pr_info("Testing PVCLOCK_TSC_STABLE_BIT with matched/unmatched TSCs\n")=
;
> +
> +	vm =3D vm_create_with_vcpus(2, guest_code_stable_bit, vcpus);
> +	configure_pvclock(vm);
> +
> +	/*
> +	 * Case 1: All TSCs matched (same frequency and offset).
> +	 * Master clock should be active, PVCLOCK_TSC_STABLE_BIT set.
> +	 */
> +	run_vcpu_once(vcpus[0]);
> +
> +	ret =3D __vcpu_ioctl(vcpus[0], KVM_GET_CLOCK_GUEST, &pvti);
> +	TEST_ASSERT(!ret, "GET_CLOCK_GUEST should succeed with matched TSCs");
> +	TEST_ASSERT(pvti.flags & PVCLOCK_TSC_STABLE_BIT,
> +		    "PVCLOCK_TSC_STABLE_BIT should be set with matched TSCs");
> +
> +	/*
> +	 * Case 2: Different TSC offset, same frequency.
> +	 * Master clock should still be active (frequency matches), but
> +	 * PVCLOCK_TSC_STABLE_BIT should be cleared (offsets differ).
> +	 */
> +	set_tsc_offset(vcpus[1], 12345678);
> +	run_vcpu_once(vcpus[1]);
> +	run_vcpu_once(vcpus[0]);
> +
> +	ret =3D __vcpu_ioctl(vcpus[0], KVM_GET_CLOCK_GUEST, &pvti);
> +	if (ret) {
> +		/* Master clock disabled by offset mismatch =E2=80=94 old kernel */
> +		pr_info("  Skipping offset tests (master clock requires matched offset=
s)\n");
> +		goto out_stable;
> +	}
> +	TEST_ASSERT(!(pvti.flags & PVCLOCK_TSC_STABLE_BIT),
> +		    "PVCLOCK_TSC_STABLE_BIT should be clear with offset-mismatched TSC=
s");
> +
> +	/*
> +	 * Case 3: Different TSC frequency.
> +	 * Master clock should be disabled entirely.
> +	 */
> +	vcpu_ioctl(vcpus[1], KVM_SET_TSC_KHZ,
> +		   (void *)(unsigned long)(__vcpu_ioctl(vcpus[1], KVM_GET_TSC_KHZ, NUL=
L) / 2));
> +	/* Write TSC to trigger kvm_synchronize_tsc / kvm_track_tsc_matching */
> +	vcpu_set_msr(vcpus[1], MSR_IA32_TSC, 0);
> +	run_vcpu_once(vcpus[1]);
> +
> +	ret =3D __vcpu_ioctl(vcpus[0], KVM_GET_CLOCK_GUEST, &pvti);
> +	TEST_ASSERT(ret && errno =3D=3D EINVAL,
> +		    "GET_CLOCK_GUEST should fail with frequency-mismatched TSCs, got %=
d (errno %d)",
> +		    ret, errno);
> +
> +out_stable:
> +	kvm_vm_free(vm);
> +}
> +
> +static void test_clock_guest_with_offsets(void)
> +{
> +	struct pvclock_vcpu_time_info pvti0, pvti1, pvti1_after;
> +	struct kvm_vcpu *vcpus[2];
> +	struct kvm_vm *vm;
> +	int64_t delta;
> +	int ret;
> +
> +	pr_info("Testing KVM_[GS]ET_CLOCK_GUEST with different TSC offsets\n");
> +
> +	vm =3D vm_create_with_vcpus(2, guest_code_stable_bit, vcpus);
> +	configure_pvclock(vm);
> +
> +	/* Set different TSC offsets on the two vCPUs */
> +	set_tsc_offset(vcpus[0], 0);
> +	set_tsc_offset(vcpus[1], 1000000000ull);
> +
> +	/* Run both to establish kvmclock */
> +	run_vcpu_once(vcpus[0]);
> +	run_vcpu_once(vcpus[1]);
> +
> +	/* GET_CLOCK_GUEST on both =E2=80=94 should succeed (master clock activ=
e) */
> +	ret =3D __vcpu_ioctl(vcpus[0], KVM_GET_CLOCK_GUEST, &pvti0);
> +	if (ret) {
> +		pr_info("  Skipping (master clock requires matched offsets on this ker=
nel)\n");
> +		kvm_vm_free(vm);
> +		return;
> +	}
> +	ret =3D __vcpu_ioctl(vcpus[1], KVM_GET_CLOCK_GUEST, &pvti1);
> +	TEST_ASSERT(!ret, "GET_CLOCK_GUEST on vcpu1 failed");
> +
> +	/* The tsc_timestamps should differ (different offsets) */
> +	TEST_ASSERT(pvti0.tsc_timestamp !=3D pvti1.tsc_timestamp,
> +		    "tsc_timestamps should differ with different offsets");
> +
> +	/* Sleep to let time elapse, then restore vcpu0's clock */
> +	sleep(1);
> +	vcpu_ioctl(vcpus[0], KVM_SET_CLOCK_GUEST, &pvti0);
> +
> +	/* Run vcpu0 to process the clock update */
> +	run_vcpu_once(vcpus[0]);
> +
> +	/* GET_CLOCK_GUEST on vcpu1 =E2=80=94 should reflect the correction */
> +	ret =3D __vcpu_ioctl(vcpus[1], KVM_GET_CLOCK_GUEST, &pvti1_after);
> +	TEST_ASSERT(!ret, "GET_CLOCK_GUEST on vcpu1 after SET failed");

Please add proper APIs instead of copy+pasting the same code everywhere.  E=
.g.
this should really be something like

	vcpu_get_clock_guest(vcpus[1], ...);

where vcpu_ioctl() asserts success.

