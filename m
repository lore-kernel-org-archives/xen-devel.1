Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13445606A32A
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2026 21:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=NAe7JZ9B
Received: from list by lists.xenproject.org with outflank-mailman.1500547.1696658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVbQl-0002Ef-Mk; Mon, 23 Nov 2026 21:18:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500547.1696658; Mon, 23 Nov 2026 21:18:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVbQl-0002EY-Jw; Mon, 23 Nov 2026 21:18:31 +0000
Received: by outflank-mailman (input) for mailman id 1500547;
 Mon, 23 Nov 2026 21:18:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xVbQk-0002ES-9T
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 21:18:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xVbQk-00000001zhl-0nuT
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 21:18:30 +0000
Received: from mail-lf1-f50.google.com ([209.85.167.50])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xVbQk-0000000BcMu-1ui6
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 21:18:30 +0000
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5c148d4dbfbso3620982e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 13:18:30 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:Cc
	:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
	bh=E8PRhVoPeXlWfamXF1uS2mH0r3Z1hUmjARM4lUy4AQ0=; b=NAe7JZ9Bg/ZmYyzAthhBNCbteU
	Sv8IKeCfbdWKyt+/HCDSKoYJbDiKGcNnw1l75qAwW3GOThc2RftoIOEMWEoILuf/nPVmyZXPTiXAu
	+bdDF6W55WuUIG5hBRoBeuBlRXZK1+m/DTaNlZolNoTlPW2iQV2nENhj19kEIzIrMDhA=;
X-Forwarded-Encrypted: i=1; AL+hErHNQ9Niq8Oa6CdCViXCJzWcfv6UPunhkRJqbMEoTdbgqiv7EFH8Kw4KGlKiTIC4RduFAliRvVMdXRs=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8qavgtnkv2wiwCV0ZRjQb6A1+RbGPHApfWAGIhB0EmpfYWIDpB
	nVN7VpBEvfpIrwZBU94R0qlVMsQMk2XxwmACqcK/ibGAhHx2FRo6AR0dv77XAJOjqDmFAIqvhbH
	cciTqCgcXKwSPWzrqma5CSx85wQoRZ5c=
X-Received: by 2002:a05:6512:3192:b0:5bf:a221:ef55 with SMTP id
 2adb3069b0e04-5c1bc815a36mr4219750e87.50.1795468709010; Mon, 23 Nov 2026
 13:18:29 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261119-asi-hvm-v7-0-6551b6d5c879@xenproject.org>
 <20261119-asi-hvm-v7-3-6551b6d5c879@xenproject.org> <2138ce98-dd16-461a-9f7a-608785c22c9a@suse.com>
In-Reply-To: <2138ce98-dd16-461a-9f7a-608785c22c9a@suse.com>
From: George Dunlap <gwd@xenproject.org>
Date: Mon, 23 Nov 2026 21:18:16 +0000
X-Gmail-Original-Message-ID: <CAFLBxZb07iK4T_bKgBtkkqfBjU6=xOUpL-4vWfNdHoHD=Rrk6Q@mail.gmail.com>
X-Gm-Features: Aa3M54pr-DyEwEqrL49ETvS1q3yQXe_i1ZtfInrykNLn3ciYGjw6Q6guboy4fB0
Message-ID: <CAFLBxZb07iK4T_bKgBtkkqfBjU6=xOUpL-4vWfNdHoHD=Rrk6Q@mail.gmail.com>
Subject: Re: [PATCH v7 03/50] x86/svm: introduce SVM_MAP_VMCB() and SVM_UNMAP_VMCB()
To: Jan Beulich <jbeulich@suse.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 1:59=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 19.11.2026 22:06, George Dunlap wrote:
> > @@ -531,10 +547,13 @@ static void cf_check svm_set_interrupt_shadow(
> >
> >          vmcb_set_general1_intercepts(vmcb, gen1);
> >      }
> > +
> > +    SVM_UNMAP_VMCB(v, vmcb);
> >  }
> >
> >  static int cf_check svm_guest_x86_mode(struct vcpu *v)
> >  {
> > +    /* Current only (see guest_cpu_user_regs() below): no mapping need=
ed. */
> >      struct vmcb *vmcb =3D v->arch.hvm.svm.vmcb;
> >
> >      if ( unlikely(!(v->arch.hvm.guest_cr[0] & X86_CR0_PE)) )
>
> The pre-existing guest_cpu_user_regs() makes clear that one may better ha=
ve
> been here already before, but might this new comment perhaps warrant addi=
ng
> a corresponding assertion here now?
>
> > @@ -602,13 +621,18 @@ void svm_sync_vmcb(struct vcpu *v, enum vmcb_sync=
_state new_state)
> >
> >  static unsigned int cf_check svm_get_cpl(struct vcpu *v)
> >  {
> > -    return vmcb_get_cpl(v->arch.hvm.svm.vmcb);
> > +    const struct vmcb *vmcb =3D SVM_MAP_VMCB(v);
>
> Much like you have it here (or below, e.g. in svm_get_guest_pat()), ...
>
> > +    unsigned int cpl =3D vmcb_get_cpl(vmcb);
> > +
> > +    SVM_UNMAP_VMCB(v, vmcb);
> > +
> > +    return cpl;
> >  }
> >
> >  static void cf_check svm_get_segment_register(
> >      struct vcpu *v, enum x86_segment seg, struct segment_register *reg=
)
> >  {
> > -    struct vmcb *vmcb =3D v->arch.hvm.svm.vmcb;
> > +    struct vmcb *vmcb =3D SVM_MAP_VMCB(v);
>
> ... it looks as if this could also be pointer-to-const.
>
> > @@ -754,25 +789,36 @@ static void cf_check svm_set_tsc_offset(struct vc=
pu *v, uint64_t offset)
> >      if ( !nestedhvm_enabled(d) )
> >      {
> >          vmcb_set_tsc_offset(vmcb, offset);
> > +        SVM_UNMAP_VMCB(v, vmcb);
> >          return;
> >      }
> >
> > -    n1vmcb =3D vcpu_nestedhvm(v).nv_n1vmcx;
> > -    n2vmcb =3D vcpu_nestedhvm(v).nv_n2vmcx;
>
> While moving these assignments, it might be a good idea to also move the
> declarations ...
>
> > +    /*
> > +     * A vCPU stays in nested guest mode across a deschedule or a paus=
e, so
> > +     * this can run remotely with the L2 VMCB active: map both explici=
tly.
> > +     */
> >      if ( nestedhvm_vcpu_in_guestmode(v) )
> >      {
> > +        const struct nestedvcpu *nv =3D &vcpu_nestedhvm(v);
>
> ... into this scope, making ...
>
> > +        n1vmcb =3D SVM_MAP_VMCB_ONE(v, nv->nv_n1vmcx, nv->nv_n1vmcx_pa=
);
> > +        n2vmcb =3D SVM_MAP_VMCB_ONE(v, nv->nv_n2vmcx, nv->nv_n2vmcx_pa=
);
>
> ... these their initializers.
>
> >          n2_tsc_offset =3D vmcb_get_tsc_offset(n2vmcb) -
> >                          vmcb_get_tsc_offset(n1vmcb);
> >          vmcb_set_tsc_offset(n1vmcb, offset);
> > +
> > +        SVM_UNMAP_VMCB(v, n2vmcb);
> > +        SVM_UNMAP_VMCB(v, n1vmcb);
> >      }
> >
> >      vmcb_set_tsc_offset(vmcb, offset + n2_tsc_offset);
> > +    SVM_UNMAP_VMCB(v, vmcb);
> >  }
>
> It might also help a little to fold both exit paths. n2_tsc_offset is set=
 to
> 0 already initially, so inverting the first conditional looks to easily a=
llow
> that, saving the need to keep both paths in sync cleanup-wise.
>
> In fact both if() can be combined, i.e. there also shouldn't be any need =
to
> re-indent the 2nd one's body.
>
> > @@ -407,6 +425,7 @@ static void cf_check vmcb_dump(unsigned char ch)
> >  {
> >      struct domain *d;
> >      struct vcpu *v;
> > +    struct vmcb *vmcb;
>
> Can this please move ...
>
> > @@ -425,7 +444,9 @@ static void cf_check vmcb_dump(unsigned char ch)
> >                  continue;
> >              }
> >              printk("\tVCPU %d\n", v->vcpu_id);
> > -            svm_vmcb_dump("key_handler", v->arch.hvm.svm.vmcb);
> > +            vmcb =3D SVM_MAP_VMCB(v);
> > +            svm_vmcb_dump("key_handler", vmcb);
> > +            SVM_UNMAP_VMCB(v, vmcb);
> >
> >              process_pending_softirqs();
> >          }
>
> ... into the innermost scope it's needed in? Also again pointer-to-const?

All of that sounds good; thanks for the review.

 -George

