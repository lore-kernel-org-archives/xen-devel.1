From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 8/8] xen: Swich parameter in
 get_page_from_gfn to use typesafe gfn
Date: Mon, 12 Nov 2018 18:49:34 +0200
Message-ID: <CAC1WxdgJTv6KuJFahYScDDWqHNz7iu21BV7ep5thtcwXxUCVEw@mail.gmail.com>
References: <20181106191454.22143-1-julien.grall@arm.com>
 <20181106191454.22143-9-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5895847932531094769=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4hls=nx=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gMFPJ-000116-Qt
 for xen-devel@lists.xenproject.org; Mon, 12 Nov 2018 16:49:50 +0000
Received: by mail-oi1-x244.google.com with SMTP id c206so2156153oib.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Nov 2018 08:49:46 -0800 (PST)
In-Reply-To: <20181106191454.22143-9-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: kevin.tian@intel.com, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, jun.nakajima@intel.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, "Tim (Xen.org)" <tim@xen.org>, julie.grall@arm.com, Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul.durrant@citrix.com>, suravee.suthikulpanit@amd.com, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, brian.woods@amd.com
List-Id: xen-devel@lists.xenproject.org

--===============5895847932531094769==
Content-Type: multipart/alternative; boundary="00000000000003261c057a7a7dd7"

--00000000000003261c057a7a7dd7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Julien,

I'm just wondering if this patch really belongs to xentrace series.
It rather looks like a separate cleanup patch.

Sincerely,
Andrii Anisov.


=D0=B2=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2018 =D0=BE 21:16 Julien Grall <j=
ulien.grall@arm.com> =D0=BF=D0=B8=D1=88=D0=B5:

> No functional change intended.
>
> Only reasonable clean-ups are done in this patch. The rest will use _gfn
> for the time being.
>
> Signed-off-by: Julien Grall <julie.grall@arm.com>
> ---
>  xen/arch/arm/guestcopy.c             |  2 +-
>  xen/arch/arm/mm.c                    |  2 +-
>  xen/arch/x86/cpu/vpmu.c              |  2 +-
>  xen/arch/x86/domain.c                | 12 ++++++------
>  xen/arch/x86/domctl.c                |  6 +++---
>  xen/arch/x86/hvm/dm.c                |  2 +-
>  xen/arch/x86/hvm/domain.c            |  2 +-
>  xen/arch/x86/hvm/hvm.c               |  9 +++++----
>  xen/arch/x86/hvm/svm/svm.c           |  8 ++++----
>  xen/arch/x86/hvm/viridian/viridian.c | 24 ++++++++++++------------
>  xen/arch/x86/hvm/vmx/vmx.c           |  4 ++--
>  xen/arch/x86/hvm/vmx/vvmx.c          | 12 ++++++------
>  xen/arch/x86/mm.c                    | 24 ++++++++++++++----------
>  xen/arch/x86/mm/p2m.c                |  2 +-
>  xen/arch/x86/mm/shadow/hvm.c         |  6 +++---
>  xen/arch/x86/physdev.c               |  3 ++-
>  xen/arch/x86/pv/descriptor-tables.c  |  5 ++---
>  xen/arch/x86/pv/emul-priv-op.c       |  6 +++---
>  xen/arch/x86/pv/mm.c                 |  2 +-
>  xen/arch/x86/traps.c                 | 11 ++++++-----
>  xen/common/domain.c                  |  2 +-
>  xen/common/event_fifo.c              | 12 ++++++------
>  xen/common/memory.c                  |  4 ++--
>  xen/common/tmem_xen.c                |  2 +-
>  xen/include/asm-arm/p2m.h            |  6 +++---
>  xen/include/asm-x86/p2m.h            | 11 +++++++----
>  26 files changed, 95 insertions(+), 86 deletions(-)
>
> diff --git a/xen/arch/arm/guestcopy.c b/xen/arch/arm/guestcopy.c
> index 7a0f3e9d5f..55892062bb 100644
> --- a/xen/arch/arm/guestcopy.c
> +++ b/xen/arch/arm/guestcopy.c
> @@ -37,7 +37,7 @@ static struct page_info *translate_get_page(copy_info_t
> info, uint64_t addr,
>          return get_page_from_gva(info.gva.v, addr,
>                                   write ? GV2M_WRITE : GV2M_READ);
>
> -    page =3D get_page_from_gfn(info.gpa.d, paddr_to_pfn(addr), &p2mt,
> P2M_ALLOC);
> +    page =3D get_page_from_gfn(info.gpa.d, gaddr_to_gfn(addr), &p2mt,
> P2M_ALLOC);
>
>      if ( !page )
>          return NULL;
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 72d0285768..88711096ef 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -1268,7 +1268,7 @@ int xenmem_add_to_physmap_one(
>
>          /* Take reference to the foreign domain page.
>           * Reference will be released in XENMEM_remove_from_physmap */
> -        page =3D get_page_from_gfn(od, idx, &p2mt, P2M_ALLOC);
> +        page =3D get_page_from_gfn(od, _gfn(idx), &p2mt, P2M_ALLOC);
>          if ( !page )
>          {
>              put_pg_owner(od);
> diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
> index 8a4f753eae..4d8f153031 100644
> --- a/xen/arch/x86/cpu/vpmu.c
> +++ b/xen/arch/x86/cpu/vpmu.c
> @@ -607,7 +607,7 @@ static int pvpmu_init(struct domain *d,
> xen_pmu_params_t *params)
>      struct vcpu *v;
>      struct vpmu_struct *vpmu;
>      struct page_info *page;
> -    uint64_t gfn =3D params->val;
> +    gfn_t gfn =3D _gfn(params->val);
>
>      if ( (params->vcpu >=3D d->max_vcpus) || (d->vcpu[params->vcpu] =3D=
=3D
> NULL) )
>          return -EINVAL;
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index f6fe954313..c5cce4b38d 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -797,7 +797,7 @@ int arch_set_info_guest(
>      unsigned long flags;
>      bool compat;
>  #ifdef CONFIG_PV
> -    unsigned long cr3_gfn;
> +    gfn_t cr3_gfn;
>      struct page_info *cr3_page;
>      unsigned long cr4;
>      int rc =3D 0;
> @@ -1061,9 +1061,9 @@ int arch_set_info_guest(
>      set_bit(_VPF_in_reset, &v->pause_flags);
>
>      if ( !compat )
> -        cr3_gfn =3D xen_cr3_to_pfn(c.nat->ctrlreg[3]);
> +        cr3_gfn =3D _gfn(xen_cr3_to_pfn(c.nat->ctrlreg[3]));
>      else
> -        cr3_gfn =3D compat_cr3_to_pfn(c.cmp->ctrlreg[3]);
> +        cr3_gfn =3D _gfn(compat_cr3_to_pfn(c.cmp->ctrlreg[3]));
>      cr3_page =3D get_page_from_gfn(d, cr3_gfn, NULL, P2M_ALLOC);
>
>      if ( !cr3_page )
> @@ -1092,7 +1092,7 @@ int arch_set_info_guest(
>          case 0:
>              if ( !compat && !VM_ASSIST(d, m2p_strict) &&
>                   !paging_mode_refcounts(d) )
> -                fill_ro_mpt(_mfn(cr3_gfn));
> +                fill_ro_mpt(_mfn(gfn_x(cr3_gfn)));
>              break;
>          default:
>              if ( cr3_page =3D=3D current->arch.old_guest_table )
> @@ -1107,7 +1107,7 @@ int arch_set_info_guest(
>          v->arch.guest_table =3D pagetable_from_page(cr3_page);
>          if ( c.nat->ctrlreg[1] )
>          {
> -            cr3_gfn =3D xen_cr3_to_pfn(c.nat->ctrlreg[1]);
> +            cr3_gfn =3D _gfn(xen_cr3_to_pfn(c.nat->ctrlreg[1]));
>              cr3_page =3D get_page_from_gfn(d, cr3_gfn, NULL, P2M_ALLOC);
>
>              if ( !cr3_page )
> @@ -1132,7 +1132,7 @@ int arch_set_info_guest(
>                      break;
>                  case 0:
>                      if ( VM_ASSIST(d, m2p_strict) )
> -                        zap_ro_mpt(_mfn(cr3_gfn));
> +                        zap_ro_mpt(_mfn(gfn_x(cr3_gfn)));
>                      break;
>                  }
>              }
> diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
> index 33f9a869c0..6b0d8075cd 100644
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -448,7 +448,7 @@ long arch_do_domctl(
>                  break;
>              }
>
> -            page =3D get_page_from_gfn(d, gfn, &t, P2M_ALLOC);
> +            page =3D get_page_from_gfn(d, _gfn(gfn), &t, P2M_ALLOC);
>
>              if ( unlikely(!page) ||
>                   unlikely(is_xen_heap_page(page)) )
> @@ -498,11 +498,11 @@ long arch_do_domctl(
>
>      case XEN_DOMCTL_hypercall_init:
>      {
> -        unsigned long gmfn =3D domctl->u.hypercall_init.gmfn;
> +        gfn_t gfn =3D _gfn(domctl->u.hypercall_init.gmfn);
>          struct page_info *page;
>          void *hypercall_page;
>
> -        page =3D get_page_from_gfn(d, gmfn, NULL, P2M_ALLOC);
> +        page =3D get_page_from_gfn(d, gfn, NULL, P2M_ALLOC);
>
>          if ( !page || !get_page_type(page, PGT_writable_page) )
>          {
> diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
> index d6d0e8be89..3b3ad27938 100644
> --- a/xen/arch/x86/hvm/dm.c
> +++ b/xen/arch/x86/hvm/dm.c
> @@ -186,7 +186,7 @@ static int modified_memory(struct domain *d,
>          {
>              struct page_info *page;
>
> -            page =3D get_page_from_gfn(d, pfn, NULL, P2M_UNSHARE);
> +            page =3D get_page_from_gfn(d, _gfn(pfn), NULL, P2M_UNSHARE);
>              if ( page )
>              {
>                  paging_mark_pfn_dirty(d, _pfn(pfn));
> diff --git a/xen/arch/x86/hvm/domain.c b/xen/arch/x86/hvm/domain.c
> index 5d5a746a25..73d2da8441 100644
> --- a/xen/arch/x86/hvm/domain.c
> +++ b/xen/arch/x86/hvm/domain.c
> @@ -297,7 +297,7 @@ int arch_set_info_hvm_guest(struct vcpu *v, const
> vcpu_hvm_context_t *ctx)
>      {
>          /* Shadow-mode CR3 change. Check PDBR and update refcounts. */
>          struct page_info *page =3D get_page_from_gfn(v->domain,
> -                                 v->arch.hvm.guest_cr[3] >> PAGE_SHIFT,
> +                                 gaddr_to_gfn(v->arch.hvm.guest_cr[3]),
>                                   NULL, P2M_ALLOC);
>          if ( !page )
>          {
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 7be9cf4454..be262e5a1d 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -2146,7 +2146,7 @@ int hvm_set_cr0(unsigned long value, bool may_defer=
)
>  {
>      struct vcpu *v =3D current;
>      struct domain *d =3D v->domain;
> -    unsigned long gfn, old_value =3D v->arch.hvm.guest_cr[0];
> +    unsigned long old_value =3D v->arch.hvm.guest_cr[0];
>      struct page_info *page;
>
>      HVM_DBG_LOG(DBG_LEVEL_VMMU, "Update CR0 value =3D %lx", value);
> @@ -2201,7 +2201,8 @@ int hvm_set_cr0(unsigned long value, bool may_defer=
)
>          if ( !paging_mode_hap(d) )
>          {
>              /* The guest CR3 must be pointing to the guest physical. */
> -            gfn =3D v->arch.hvm.guest_cr[3] >> PAGE_SHIFT;
> +            gfn_t gfn =3D gaddr_to_gfn(v->arch.hvm.guest_cr[3]);
> +
>              page =3D get_page_from_gfn(d, gfn, NULL, P2M_ALLOC);
>              if ( !page )
>              {
> @@ -2293,7 +2294,7 @@ int hvm_set_cr3(unsigned long value, bool may_defer=
)
>      {
>          /* Shadow-mode CR3 change. Check PDBR and update refcounts. */
>          HVM_DBG_LOG(DBG_LEVEL_VMMU, "CR3 value =3D %lx", value);
> -        page =3D get_page_from_gfn(v->domain, value >> PAGE_SHIFT,
> +        page =3D get_page_from_gfn(v->domain, gaddr_to_gfn(value),
>                                   NULL, P2M_ALLOC);
>          if ( !page )
>              goto bad_cr3;
> @@ -3120,7 +3121,7 @@ enum hvm_translation_result hvm_translate_get_page(
>           && hvm_mmio_internal(gfn_to_gaddr(gfn)) )
>          return HVMTRANS_bad_gfn_to_mfn;
>
> -    page =3D get_page_from_gfn(v->domain, gfn_x(gfn), &p2mt, P2M_UNSHARE=
);
> +    page =3D get_page_from_gfn(v->domain, gfn, &p2mt, P2M_UNSHARE);
>
>      if ( !page )
>          return HVMTRANS_bad_gfn_to_mfn;
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index 5d00256aaa..a7419bd444 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -317,7 +317,7 @@ static int svm_vmcb_restore(struct vcpu *v, struct
> hvm_hw_cpu *c)
>      {
>          if ( c->cr0 & X86_CR0_PG )
>          {
> -            page =3D get_page_from_gfn(v->domain, c->cr3 >> PAGE_SHIFT,
> +            page =3D get_page_from_gfn(v->domain, gaddr_to_gfn(c->cr3),
>                                       NULL, P2M_ALLOC);
>              if ( !page )
>              {
> @@ -2412,9 +2412,9 @@ nsvm_get_nvmcb_page(struct vcpu *v, uint64_t
> vmcbaddr)
>          return NULL;
>
>      /* Need to translate L1-GPA to MPA */
> -    page =3D get_page_from_gfn(v->domain,
> -                            nv->nv_vvmcxaddr >> PAGE_SHIFT,
> -                            &p2mt, P2M_ALLOC | P2M_UNSHARE);
> +    page =3D get_page_from_gfn(v->domain,
> +                             gaddr_to_gfn(nv->nv_vvmcxaddr >> PAGE_SHIFT=
),
> +                             &p2mt, P2M_ALLOC | P2M_UNSHARE);
>      if ( !page )
>          return NULL;
>
> diff --git a/xen/arch/x86/hvm/viridian/viridian.c
> b/xen/arch/x86/hvm/viridian/viridian.c
> index 2dc86dd0f3..1d3be156db 100644
> --- a/xen/arch/x86/hvm/viridian/viridian.c
> +++ b/xen/arch/x86/hvm/viridian/viridian.c
> @@ -332,16 +332,16 @@ static void dump_reference_tsc(const struct domain
> *d)
>
>  static void enable_hypercall_page(struct domain *d)
>  {
> -    unsigned long gmfn =3D d->arch.hvm.viridian.hypercall_gpa.fields.pfn=
;
> -    struct page_info *page =3D get_page_from_gfn(d, gmfn, NULL, P2M_ALLO=
C);
> +    gfn_t gfn =3D _gfn(d->arch.hvm.viridian.hypercall_gpa.fields.pfn);
> +    struct page_info *page =3D get_page_from_gfn(d, gfn, NULL, P2M_ALLOC=
);
>      uint8_t *p;
>
>      if ( !page || !get_page_type(page, PGT_writable_page) )
>      {
>          if ( page )
>              put_page(page);
> -        gdprintk(XENLOG_WARNING, "Bad GMFN %#"PRI_gfn" (MFN
> %#"PRI_mfn")\n",
> -                 gmfn, mfn_x(page ? page_to_mfn(page) : INVALID_MFN));
> +        gdprintk(XENLOG_WARNING, "Bad GFN %#"PRI_gfn" (MFN
> %#"PRI_mfn")\n",
> +                 gfn_x(gfn), mfn_x(page ? page_to_mfn(page) :
> INVALID_MFN));
>          return;
>      }
>
> @@ -367,8 +367,8 @@ static void enable_hypercall_page(struct domain *d)
>  static void initialize_vp_assist(struct vcpu *v)
>  {
>      struct domain *d =3D v->domain;
> -    unsigned long gmfn =3D v->arch.hvm.viridian.vp_assist.msr.fields.pfn=
;
> -    struct page_info *page =3D get_page_from_gfn(d, gmfn, NULL, P2M_ALLO=
C);
> +    gfn_t gfn =3D _gfn(v->arch.hvm.viridian.vp_assist.msr.fields.pfn);
> +    struct page_info *page =3D get_page_from_gfn(d, gfn, NULL, P2M_ALLOC=
);
>      void *va;
>
>      ASSERT(!v->arch.hvm.viridian.vp_assist.va);
> @@ -395,8 +395,8 @@ static void initialize_vp_assist(struct vcpu *v)
>      return;
>
>   fail:
> -    gdprintk(XENLOG_WARNING, "Bad GMFN %#"PRI_gfn" (MFN %#"PRI_mfn")\n",
> -             gmfn, mfn_x(page ? page_to_mfn(page) : INVALID_MFN));
> +    gdprintk(XENLOG_WARNING, "Bad GFN %#"PRI_gfn" (MFN %#"PRI_mfn")\n",
> +             gfn_x(gfn), mfn_x(page ? page_to_mfn(page) : INVALID_MFN));
>  }
>
>  static void teardown_vp_assist(struct vcpu *v)
> @@ -465,16 +465,16 @@ void viridian_apic_assist_clear(struct vcpu *v)
>
>  static void update_reference_tsc(struct domain *d, bool_t initialize)
>  {
> -    unsigned long gmfn =3D d->arch.hvm.viridian.reference_tsc.fields.pfn=
;
> -    struct page_info *page =3D get_page_from_gfn(d, gmfn, NULL, P2M_ALLO=
C);
> +    gfn_t gfn =3D _gfn(d->arch.hvm.viridian.reference_tsc.fields.pfn);
> +    struct page_info *page =3D get_page_from_gfn(d, gfn, NULL, P2M_ALLOC=
);
>      HV_REFERENCE_TSC_PAGE *p;
>
>      if ( !page || !get_page_type(page, PGT_writable_page) )
>      {
>          if ( page )
>              put_page(page);
> -        gdprintk(XENLOG_WARNING, "Bad GMFN %#"PRI_gfn" (MFN
> %#"PRI_mfn")\n",
> -                 gmfn, mfn_x(page ? page_to_mfn(page) : INVALID_MFN));
> +        gdprintk(XENLOG_WARNING, "Bad GFN %#"PRI_gfn" (MFN
> %#"PRI_mfn")\n",
> +                 gfn_x(gfn), mfn_x(page ? page_to_mfn(page) :
> INVALID_MFN));
>          return;
>      }
>
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index e065f8bbdb..2070e78358 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -674,7 +674,7 @@ static int vmx_restore_cr0_cr3(
>      {
>          if ( cr0 & X86_CR0_PG )
>          {
> -            page =3D get_page_from_gfn(v->domain, cr3 >> PAGE_SHIFT,
> +            page =3D get_page_from_gfn(v->domain, gaddr_to_gfn(cr3),
>                                       NULL, P2M_ALLOC);
>              if ( !page )
>              {
> @@ -1373,7 +1373,7 @@ static void vmx_load_pdptrs(struct vcpu *v)
>      if ( (cr3 & 0x1fUL) && !hvm_pcid_enabled(v) )
>          goto crash;
>
> -    page =3D get_page_from_gfn(v->domain, cr3 >> PAGE_SHIFT, &p2mt,
> P2M_UNSHARE);
> +    page =3D get_page_from_gfn(v->domain, gaddr_to_gfn(cr3), &p2mt,
> P2M_UNSHARE);
>      if ( !page )
>      {
>          /* Ideally you don't want to crash but rather go into a wait
> diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
> index dfd08e2d0a..2953d05a17 100644
> --- a/xen/arch/x86/hvm/vmx/vvmx.c
> +++ b/xen/arch/x86/hvm/vmx/vvmx.c
> @@ -649,11 +649,11 @@ static void nvmx_update_apic_access_address(struct
> vcpu *v)
>      if ( ctrl & SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES )
>      {
>          p2m_type_t p2mt;
> -        unsigned long apic_gpfn;
> +        gfn_t apic_gfn;
>          struct page_info *apic_pg;
>
> -        apic_gpfn =3D get_vvmcs(v, APIC_ACCESS_ADDR) >> PAGE_SHIFT;
> -        apic_pg =3D get_page_from_gfn(v->domain, apic_gpfn, &p2mt,
> P2M_ALLOC);
> +        apic_gfn =3D gaddr_to_gfn(get_vvmcs(v, APIC_ACCESS_ADDR));
> +        apic_pg =3D get_page_from_gfn(v->domain, apic_gfn, &p2mt,
> P2M_ALLOC);
>          ASSERT(apic_pg && !p2m_is_paging(p2mt));
>          __vmwrite(APIC_ACCESS_ADDR, page_to_maddr(apic_pg));
>          put_page(apic_pg);
> @@ -670,11 +670,11 @@ static void nvmx_update_virtual_apic_address(struct
> vcpu *v)
>      if ( ctrl & CPU_BASED_TPR_SHADOW )
>      {
>          p2m_type_t p2mt;
> -        unsigned long vapic_gpfn;
> +        gfn_t vapic_gfn;
>          struct page_info *vapic_pg;
>
> -        vapic_gpfn =3D get_vvmcs(v, VIRTUAL_APIC_PAGE_ADDR) >> PAGE_SHIF=
T;
> -        vapic_pg =3D get_page_from_gfn(v->domain, vapic_gpfn, &p2mt,
> P2M_ALLOC);
> +        vapic_gfn =3D gaddr_to_gfn(get_vvmcs(v, VIRTUAL_APIC_PAGE_ADDR))=
;
> +        vapic_pg =3D get_page_from_gfn(v->domain, vapic_gfn, &p2mt,
> P2M_ALLOC);
>          ASSERT(vapic_pg && !p2m_is_paging(p2mt));
>          __vmwrite(VIRTUAL_APIC_PAGE_ADDR, page_to_maddr(vapic_pg));
>          put_page(vapic_pg);
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index 9363e9bd96..e3462f8a77 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -2052,7 +2052,7 @@ static int mod_l1_entry(l1_pgentry_t *pl1e,
> l1_pgentry_t nl1e,
>              p2m_query_t q =3D l1e_get_flags(nl1e) & _PAGE_RW ?
>                              P2M_ALLOC | P2M_UNSHARE : P2M_ALLOC;
>
> -            page =3D get_page_from_gfn(pg_dom, l1e_get_pfn(nl1e), &p2mt,=
 q);
> +            page =3D get_page_from_gfn(pg_dom, _gfn(l1e_get_pfn(nl1e)),
> &p2mt, q);
>
>              if ( p2m_is_paged(p2mt) )
>              {
> @@ -3223,7 +3223,8 @@ long do_mmuext_op(
>              if ( paging_mode_refcounts(pg_owner) )
>                  break;
>
> -            page =3D get_page_from_gfn(pg_owner, op.arg1.mfn, NULL,
> P2M_ALLOC);
> +            page =3D get_page_from_gfn(pg_owner, _gfn(op.arg1.mfn), NULL=
,
> +                                     P2M_ALLOC);
>              if ( unlikely(!page) )
>              {
>                  rc =3D -EINVAL;
> @@ -3288,7 +3289,8 @@ long do_mmuext_op(
>              if ( paging_mode_refcounts(pg_owner) )
>                  break;
>
> -            page =3D get_page_from_gfn(pg_owner, op.arg1.mfn, NULL,
> P2M_ALLOC);
> +            page =3D get_page_from_gfn(pg_owner, _gfn(op.arg1.mfn), NULL=
,
> +                                     P2M_ALLOC);
>              if ( unlikely(!page) )
>              {
>                  gdprintk(XENLOG_WARNING,
> @@ -3504,7 +3506,8 @@ long do_mmuext_op(
>          }
>
>          case MMUEXT_CLEAR_PAGE:
> -            page =3D get_page_from_gfn(pg_owner, op.arg1.mfn, &p2mt,
> P2M_ALLOC);
> +            page =3D get_page_from_gfn(pg_owner, _gfn(op.arg1.mfn), &p2m=
t,
> +                                     P2M_ALLOC);
>              if ( unlikely(p2mt !=3D p2m_ram_rw) && page )
>              {
>                  put_page(page);
> @@ -3532,7 +3535,7 @@ long do_mmuext_op(
>          {
>              struct page_info *src_page, *dst_page;
>
> -            src_page =3D get_page_from_gfn(pg_owner, op.arg2.src_mfn, &p=
2mt,
> +            src_page =3D get_page_from_gfn(pg_owner, _gfn(op.arg2.src_mf=
n),
> &p2mt,
>                                           P2M_ALLOC);
>              if ( unlikely(p2mt !=3D p2m_ram_rw) && src_page )
>              {
> @@ -3548,7 +3551,7 @@ long do_mmuext_op(
>                  break;
>              }
>
> -            dst_page =3D get_page_from_gfn(pg_owner, op.arg1.mfn, &p2mt,
> +            dst_page =3D get_page_from_gfn(pg_owner, _gfn(op.arg1.mfn),
> &p2mt,
>                                           P2M_ALLOC);
>              if ( unlikely(p2mt !=3D p2m_ram_rw) && dst_page )
>              {
> @@ -3636,7 +3639,8 @@ long do_mmu_update(
>  {
>      struct mmu_update req;
>      void *va =3D NULL;
> -    unsigned long gpfn, gmfn, mfn;
> +    unsigned long gpfn, mfn;
> +    gfn_t gfn;
>      struct page_info *page;
>      unsigned int cmd, i =3D 0, done =3D 0, pt_dom;
>      struct vcpu *curr =3D current, *v =3D curr;
> @@ -3749,8 +3753,8 @@ long do_mmu_update(
>              rc =3D -EINVAL;
>
>              req.ptr -=3D cmd;
> -            gmfn =3D req.ptr >> PAGE_SHIFT;
> -            page =3D get_page_from_gfn(pt_owner, gmfn, &p2mt, P2M_ALLOC)=
;
> +            gfn =3D gaddr_to_gfn(req.ptr);
> +            page =3D get_page_from_gfn(pt_owner, gfn, &p2mt, P2M_ALLOC);
>
>              if ( unlikely(!page) || p2mt !=3D p2m_ram_rw )
>              {
> @@ -3758,7 +3762,7 @@ long do_mmu_update(
>                      put_page(page);
>                  if ( p2m_is_paged(p2mt) )
>                  {
> -                    p2m_mem_paging_populate(pt_owner, gmfn);
> +                    p2m_mem_paging_populate(pt_owner, gfn_x(gfn));
>                      rc =3D -ENOENT;
>                  }
>                  else
> diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
> index a00a3c1bff..3b2aac8804 100644
> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -2718,7 +2718,7 @@ int p2m_add_foreign(struct domain *tdom, unsigned
> long fgfn,
>       * Take a refcnt on the mfn. NB: following supported for foreign
> mapping:
>       *     ram_rw | ram_logdirty | ram_ro | paging_out.
>       */
> -    page =3D get_page_from_gfn(fdom, fgfn, &p2mt, P2M_ALLOC);
> +    page =3D get_page_from_gfn(fdom, _gfn(fgfn), &p2mt, P2M_ALLOC);
>      if ( !page ||
>           !p2m_is_ram(p2mt) || p2m_is_shared(p2mt) || p2m_is_hole(p2mt) )
>      {
> diff --git a/xen/arch/x86/mm/shadow/hvm.c b/xen/arch/x86/mm/shadow/hvm.c
> index 4cc75916b8..9275ba476c 100644
> --- a/xen/arch/x86/mm/shadow/hvm.c
> +++ b/xen/arch/x86/mm/shadow/hvm.c
> @@ -313,15 +313,15 @@ const struct x86_emulate_ops hvm_shadow_emulator_op=
s
> =3D {
>  static mfn_t emulate_gva_to_mfn(struct vcpu *v, unsigned long vaddr,
>                                  struct sh_emulate_ctxt *sh_ctxt)
>  {
> -    unsigned long gfn;
> +    gfn_t gfn;
>      struct page_info *page;
>      mfn_t mfn;
>      p2m_type_t p2mt;
>      uint32_t pfec =3D PFEC_page_present | PFEC_write_access;
>
>      /* Translate the VA to a GFN. */
> -    gfn =3D paging_get_hostmode(v)->gva_to_gfn(v, NULL, vaddr, &pfec);
> -    if ( gfn =3D=3D gfn_x(INVALID_GFN) )
> +    gfn =3D _gfn(paging_get_hostmode(v)->gva_to_gfn(v, NULL, vaddr, &pfe=
c));
> +    if ( gfn_eq(gfn, INVALID_GFN) )
>      {
>          x86_emul_pagefault(pfec, vaddr, &sh_ctxt->ctxt);
>
> diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
> index 3a3c15890b..4f3f438614 100644
> --- a/xen/arch/x86/physdev.c
> +++ b/xen/arch/x86/physdev.c
> @@ -229,7 +229,8 @@ ret_t do_physdev_op(int cmd,
> XEN_GUEST_HANDLE_PARAM(void) arg)
>              break;
>
>          ret =3D -EINVAL;
> -        page =3D get_page_from_gfn(current->domain, info.gmfn, NULL,
> P2M_ALLOC);
> +        page =3D get_page_from_gfn(current->domain, _gfn(info.gmfn),
> +                                 NULL, P2M_ALLOC);
>          if ( !page )
>              break;
>          if ( !get_page_type(page, PGT_writable_page) )
> diff --git a/xen/arch/x86/pv/descriptor-tables.c
> b/xen/arch/x86/pv/descriptor-tables.c
> index 8b2d55fc2e..7e8f41d3fd 100644
> --- a/xen/arch/x86/pv/descriptor-tables.c
> +++ b/xen/arch/x86/pv/descriptor-tables.c
> @@ -112,7 +112,7 @@ long pv_set_gdt(struct vcpu *v, unsigned long *frames=
,
> unsigned int entries)
>      {
>          struct page_info *page;
>
> -        page =3D get_page_from_gfn(d, frames[i], NULL, P2M_ALLOC);
> +        page =3D get_page_from_gfn(d, _gfn(frames[i]), NULL, P2M_ALLOC);
>          if ( !page )
>              goto fail;
>          if ( !get_page_type(page, PGT_seg_desc_page) )
> @@ -209,7 +209,6 @@ int compat_set_gdt(XEN_GUEST_HANDLE_PARAM(uint)
> frame_list,
>  long do_update_descriptor(uint64_t pa, uint64_t desc)
>  {
>      struct domain *currd =3D current->domain;
> -    unsigned long gmfn =3D pa >> PAGE_SHIFT;
>      unsigned long mfn;
>      unsigned int  offset;
>      struct desc_struct *gdt_pent, d;
> @@ -220,7 +219,7 @@ long do_update_descriptor(uint64_t pa, uint64_t desc)
>
>      *(uint64_t *)&d =3D desc;
>
> -    page =3D get_page_from_gfn(currd, gmfn, NULL, P2M_ALLOC);
> +    page =3D get_page_from_gfn(currd, gaddr_to_gfn(pa), NULL, P2M_ALLOC)=
;
>      if ( (((unsigned int)pa % sizeof(struct desc_struct)) !=3D 0) ||
>           !page ||
>           !check_descriptor(currd, &d) )
> diff --git a/xen/arch/x86/pv/emul-priv-op.c
> b/xen/arch/x86/pv/emul-priv-op.c
> index f73ea4a163..a529ebcc3f 100644
> --- a/xen/arch/x86/pv/emul-priv-op.c
> +++ b/xen/arch/x86/pv/emul-priv-op.c
> @@ -760,12 +760,12 @@ static int write_cr(unsigned int reg, unsigned long
> val,
>      case 3: /* Write CR3 */
>      {
>          struct domain *currd =3D curr->domain;
> -        unsigned long gfn;
> +        gfn_t gfn;
>          struct page_info *page;
>          int rc;
>
> -        gfn =3D !is_pv_32bit_domain(currd)
> -              ? xen_cr3_to_pfn(val) : compat_cr3_to_pfn(val);
> +        gfn =3D _gfn(!is_pv_32bit_domain(currd)
> +              ? xen_cr3_to_pfn(val) : compat_cr3_to_pfn(val));
>          page =3D get_page_from_gfn(currd, gfn, NULL, P2M_ALLOC);
>          if ( !page )
>              break;
> diff --git a/xen/arch/x86/pv/mm.c b/xen/arch/x86/pv/mm.c
> index f5ea00ca4e..c9ad1152b4 100644
> --- a/xen/arch/x86/pv/mm.c
> +++ b/xen/arch/x86/pv/mm.c
> @@ -106,7 +106,7 @@ bool pv_map_ldt_shadow_page(unsigned int offset)
>      if ( unlikely(!(l1e_get_flags(gl1e) & _PAGE_PRESENT)) )
>          return false;
>
> -    page =3D get_page_from_gfn(currd, l1e_get_pfn(gl1e), NULL, P2M_ALLOC=
);
> +    page =3D get_page_from_gfn(currd, _gfn(l1e_get_pfn(gl1e)), NULL,
> P2M_ALLOC);
>      if ( unlikely(!page) )
>          return false;
>
> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> index 9471d89022..d967e49432 100644
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -795,7 +795,7 @@ int guest_wrmsr_xen(struct vcpu *v, uint32_t idx,
> uint64_t val)
>      case 0: /* Write hypercall page */
>      {
>          void *hypercall_page;
> -        unsigned long gmfn =3D val >> PAGE_SHIFT;
> +        gfn_t gfn =3D gaddr_to_gfn(val);
>          unsigned int page_index =3D val & (PAGE_SIZE - 1);
>          struct page_info *page;
>          p2m_type_t t;
> @@ -808,7 +808,7 @@ int guest_wrmsr_xen(struct vcpu *v, uint32_t idx,
> uint64_t val)
>              return X86EMUL_EXCEPTION;
>          }
>
> -        page =3D get_page_from_gfn(d, gmfn, &t, P2M_ALLOC);
> +        page =3D get_page_from_gfn(d, gfn, &t, P2M_ALLOC);
>
>          if ( !page || !get_page_type(page, PGT_writable_page) )
>          {
> @@ -817,13 +817,14 @@ int guest_wrmsr_xen(struct vcpu *v, uint32_t idx,
> uint64_t val)
>
>              if ( p2m_is_paging(t) )
>              {
> -                p2m_mem_paging_populate(d, gmfn);
> +                p2m_mem_paging_populate(d, gfn_x(gfn));
>                  return X86EMUL_RETRY;
>              }
>
>              gdprintk(XENLOG_WARNING,
> -                     "Bad GMFN %lx (MFN %#"PRI_mfn") to MSR %08x\n",
> -                     gmfn, mfn_x(page ? page_to_mfn(page) : INVALID_MFN)=
,
> base);
> +                     "Bad GMFN %#"PRI_gfn" (MFN %#"PRI_mfn") to MSR
> %08x\n",
> +                     gfn_x(gfn), mfn_x(page ? page_to_mfn(page) :
> INVALID_MFN),
> +                     base);
>              return X86EMUL_EXCEPTION;
>          }
>
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index d6650f0656..5e3c05b96c 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1250,7 +1250,7 @@ int map_vcpu_info(struct vcpu *v, unsigned long gfn=
,
> unsigned offset)
>      if ( (v !=3D current) && !(v->pause_flags & VPF_down) )
>          return -EINVAL;
>
> -    page =3D get_page_from_gfn(d, gfn, NULL, P2M_ALLOC);
> +    page =3D get_page_from_gfn(d, _gfn(gfn), NULL, P2M_ALLOC);
>      if ( !page )
>          return -EINVAL;
>
> diff --git a/xen/common/event_fifo.c b/xen/common/event_fifo.c
> index c49f446754..71a6f673b2 100644
> --- a/xen/common/event_fifo.c
> +++ b/xen/common/event_fifo.c
> @@ -358,7 +358,7 @@ static const struct evtchn_port_ops
> evtchn_port_ops_fifo =3D
>      .print_state   =3D evtchn_fifo_print_state,
>  };
>
> -static int map_guest_page(struct domain *d, uint64_t gfn, void **virt)
> +static int map_guest_page(struct domain *d, gfn_t gfn, void **virt)
>  {
>      struct page_info *p;
>
> @@ -419,7 +419,7 @@ static int setup_control_block(struct vcpu *v)
>      return 0;
>  }
>
> -static int map_control_block(struct vcpu *v, uint64_t gfn, uint32_t
> offset)
> +static int map_control_block(struct vcpu *v, gfn_t gfn, uint32_t offset)
>  {
>      void *virt;
>      unsigned int i;
> @@ -505,7 +505,7 @@ int evtchn_fifo_init_control(struct
> evtchn_init_control *init_control)
>  {
>      struct domain *d =3D current->domain;
>      uint32_t vcpu_id;
> -    uint64_t gfn;
> +    gfn_t gfn;
>      uint32_t offset;
>      struct vcpu *v;
>      int rc;
> @@ -513,7 +513,7 @@ int evtchn_fifo_init_control(struct
> evtchn_init_control *init_control)
>      init_control->link_bits =3D EVTCHN_FIFO_LINK_BITS;
>
>      vcpu_id =3D init_control->vcpu;
> -    gfn     =3D init_control->control_gfn;
> +    gfn     =3D _gfn(init_control->control_gfn);
>      offset  =3D init_control->offset;
>
>      if ( vcpu_id >=3D d->max_vcpus || !d->vcpu[vcpu_id] )
> @@ -569,7 +569,7 @@ int evtchn_fifo_init_control(struct
> evtchn_init_control *init_control)
>      return rc;
>  }
>
> -static int add_page_to_event_array(struct domain *d, unsigned long gfn)
> +static int add_page_to_event_array(struct domain *d, gfn_t gfn)
>  {
>      void *virt;
>      unsigned int slot;
> @@ -619,7 +619,7 @@ int evtchn_fifo_expand_array(const struct
> evtchn_expand_array *expand_array)
>          return -EOPNOTSUPP;
>
>      spin_lock(&d->event_lock);
> -    rc =3D add_page_to_event_array(d, expand_array->array_gfn);
> +    rc =3D add_page_to_event_array(d, _gfn(expand_array->array_gfn));
>      spin_unlock(&d->event_lock);
>
>      return rc;
> diff --git a/xen/common/memory.c b/xen/common/memory.c
> index 987395fbb3..e02733dba0 100644
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1365,7 +1365,7 @@ long do_memory_op(unsigned long cmd,
> XEN_GUEST_HANDLE_PARAM(void) arg)
>              return rc;
>          }
>
> -        page =3D get_page_from_gfn(d, xrfp.gpfn, NULL, P2M_ALLOC);
> +        page =3D get_page_from_gfn(d, _gfn(xrfp.gpfn), NULL, P2M_ALLOC);
>          if ( page )
>          {
>              rc =3D guest_physmap_remove_page(d, _gfn(xrfp.gpfn),
> @@ -1636,7 +1636,7 @@ int check_get_page_from_gfn(struct domain *d, gfn_t
> gfn, bool readonly,
>      p2m_type_t p2mt;
>      struct page_info *page;
>
> -    page =3D get_page_from_gfn(d, gfn_x(gfn), &p2mt, q);
> +    page =3D get_page_from_gfn(d, gfn, &p2mt, q);
>
>  #ifdef CONFIG_HAS_MEM_PAGING
>      if ( p2m_is_paging(p2mt) )
> diff --git a/xen/common/tmem_xen.c b/xen/common/tmem_xen.c
> index bf7b14f79a..72cba7f10c 100644
> --- a/xen/common/tmem_xen.c
> +++ b/xen/common/tmem_xen.c
> @@ -52,7 +52,7 @@ static inline void *cli_get_page(xen_pfn_t cmfn, mfn_t
> *pcli_mfn,
>      p2m_type_t t;
>      struct page_info *page;
>
> -    page =3D get_page_from_gfn(current->domain, cmfn, &t, P2M_ALLOC);
> +    page =3D get_page_from_gfn(current->domain, _gfn(cmfn), &t, P2M_ALLO=
C);
>      if ( !page || t !=3D p2m_ram_rw )
>      {
>          if ( page )
> diff --git a/xen/include/asm-arm/p2m.h b/xen/include/asm-arm/p2m.h
> index 7c67806056..5e598a0b37 100644
> --- a/xen/include/asm-arm/p2m.h
> +++ b/xen/include/asm-arm/p2m.h
> @@ -278,7 +278,7 @@ struct page_info *p2m_get_page_from_gfn(struct domain
> *d, gfn_t gfn,
>                                          p2m_type_t *t);
>
>  static inline struct page_info *get_page_from_gfn(
> -    struct domain *d, unsigned long gfn, p2m_type_t *t, p2m_query_t q)
> +    struct domain *d, gfn_t gfn, p2m_type_t *t, p2m_query_t q)
>  {
>      mfn_t mfn;
>      p2m_type_t _t;
> @@ -289,7 +289,7 @@ static inline struct page_info *get_page_from_gfn(
>       * not auto-translated.
>       */
>      if ( unlikely(d !=3D dom_xen) )
> -        return p2m_get_page_from_gfn(d, _gfn(gfn), t);
> +        return p2m_get_page_from_gfn(d, gfn, t);
>
>      if ( !t )
>          t =3D &_t;
> @@ -300,7 +300,7 @@ static inline struct page_info *get_page_from_gfn(
>       * DOMID_XEN see 1-1 RAM. The p2m_type is based on the type of the
>       * page.
>       */
> -    mfn =3D _mfn(gfn);
> +    mfn =3D _mfn(gfn_x(gfn));
>      page =3D mfn_to_page(mfn);
>
>      if ( !mfn_valid(mfn) || !get_page(page, d) )
> diff --git a/xen/include/asm-x86/p2m.h b/xen/include/asm-x86/p2m.h
> index d08c595887..db1ec37610 100644
> --- a/xen/include/asm-x86/p2m.h
> +++ b/xen/include/asm-x86/p2m.h
> @@ -489,18 +489,21 @@ struct page_info *p2m_get_page_from_gfn(struct
> p2m_domain *p2m, gfn_t gfn,
>                                          p2m_query_t q);
>
>  static inline struct page_info *get_page_from_gfn(
> -    struct domain *d, unsigned long gfn, p2m_type_t *t, p2m_query_t q)
> +    struct domain *d, gfn_t gfn, p2m_type_t *t, p2m_query_t q)
>  {
>      struct page_info *page;
> +    mfn_t mfn;
>
>      if ( paging_mode_translate(d) )
> -        return p2m_get_page_from_gfn(p2m_get_hostp2m(d), _gfn(gfn), t,
> NULL, q);
> +        return p2m_get_page_from_gfn(p2m_get_hostp2m(d), gfn, t, NULL, q=
);
>
>      /* Non-translated guests see 1-1 RAM / MMIO mappings everywhere */
>      if ( t )
>          *t =3D likely(d !=3D dom_io) ? p2m_ram_rw : p2m_mmio_direct;
> -    page =3D mfn_to_page(_mfn(gfn));
> -    return mfn_valid(_mfn(gfn)) && get_page(page, d) ? page : NULL;
> +
> +    mfn =3D _mfn(gfn_x(gfn));
> +    page =3D mfn_to_page(mfn);
> +    return mfn_valid(mfn) && get_page(page, d) ? page : NULL;
>  }
>
>  /* General conversion function from mfn to gfn */
> --
> 2.11.0
>
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--00000000000003261c057a7a7dd7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Julien,<div><br></div><div>I&#39;m just wondering if=
 this patch really belongs to xentrace=C2=A0series.</div><div>It rather loo=
ks like a separate cleanup patch.</div><div><br clear=3D"all"><div><div dir=
=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature">Since=
rely,<div>Andrii Anisov.</div></div></div><br></div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr">=D0=B2=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 20=
18 =D0=BE 21:16 Julien Grall &lt;<a href=3D"mailto:julien.grall@arm.com">ju=
lien.grall@arm.com</a>&gt; =D0=BF=D0=B8=D1=88=D0=B5:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">No functional change intended.<br>
<br>
Only reasonable clean-ups are done in this patch. The rest will use _gfn<br=
>
for the time being.<br>
<br>
Signed-off-by: Julien Grall &lt;<a href=3D"mailto:julie.grall@arm.com" targ=
et=3D"_blank">julie.grall@arm.com</a>&gt;<br>
---<br>
=C2=A0xen/arch/arm/guestcopy.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 2 +-<br>
=C2=A0xen/arch/arm/mm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0xen/arch/x86/cpu/vpmu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 2 +-<br>
=C2=A0xen/arch/x86/domain.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 12 ++++++------<br>
=C2=A0xen/arch/x86/domctl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 6 +++---<br>
=C2=A0xen/arch/x86/hvm/dm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0xen/arch/x86/hvm/domain.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 +-<br>
=C2=A0xen/arch/x86/hvm/hvm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 9 +++++----<br>
=C2=A0xen/arch/x86/hvm/svm/svm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 8 ++++----<br>
=C2=A0xen/arch/x86/hvm/viridian/viridian.c | 24 ++++++++++++------------<br=
>
=C2=A0xen/arch/x86/hvm/vmx/vmx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 4 ++--<br>
=C2=A0xen/arch/x86/hvm/vmx/vvmx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12 ++=
++++------<br>
=C2=A0xen/arch/x86/mm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 24 ++++++++++++++----------<br>
=C2=A0xen/arch/x86/mm/p2m.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0xen/arch/x86/mm/shadow/hvm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=
 6 +++---<br>
=C2=A0xen/arch/x86/physdev.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 3 ++-<br>
=C2=A0xen/arch/x86/pv/descriptor-tables.c=C2=A0 |=C2=A0 5 ++---<br>
=C2=A0xen/arch/x86/pv/emul-priv-op.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++=
+---<br>
=C2=A0xen/arch/x86/pv/mm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0xen/arch/x86/traps.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 11 ++++++-----<br>
=C2=A0xen/common/domain.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0xen/common/event_fifo.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 12 ++++++------<br>
=C2=A0xen/common/memory.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
=C2=A0xen/common/tmem_xen.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0xen/include/asm-arm/p2m.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 6 +++---<br>
=C2=A0xen/include/asm-x86/p2m.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
11 +++++++----<br>
=C2=A026 files changed, 95 insertions(+), 86 deletions(-)<br>
<br>
diff --git a/xen/arch/arm/guestcopy.c b/xen/arch/arm/guestcopy.c<br>
index 7a0f3e9d5f..55892062bb 100644<br>
--- a/xen/arch/arm/guestcopy.c<br>
+++ b/xen/arch/arm/guestcopy.c<br>
@@ -37,7 +37,7 @@ static struct page_info *translate_get_page(copy_info_t i=
nfo, uint64_t addr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return get_page_from_gva(info.gva.v, addr=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write ? GV2M_WRITE : GV2M_REA=
D);<br>
<br>
-=C2=A0 =C2=A0 page =3D get_page_from_gfn(info.gpa.d, paddr_to_pfn(addr), &=
amp;p2mt, P2M_ALLOC);<br>
+=C2=A0 =C2=A0 page =3D get_page_from_gfn(info.gpa.d, gaddr_to_gfn(addr), &=
amp;p2mt, P2M_ALLOC);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if ( !page )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c<br>
index 72d0285768..88711096ef 100644<br>
--- a/xen/arch/arm/mm.c<br>
+++ b/xen/arch/arm/mm.c<br>
@@ -1268,7 +1268,7 @@ int xenmem_add_to_physmap_one(<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Take reference to the foreign domain p=
age.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Reference will be released in XENMEM_r=
emove_from_physmap */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 page =3D get_page_from_gfn(od, idx, &amp;p2mt,=
 P2M_ALLOC);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 page =3D get_page_from_gfn(od, _gfn(idx), &amp=
;p2mt, P2M_ALLOC);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( !page )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0put_pg_owner(od);<br>
diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c<br>
index 8a4f753eae..4d8f153031 100644<br>
--- a/xen/arch/x86/cpu/vpmu.c<br>
+++ b/xen/arch/x86/cpu/vpmu.c<br>
@@ -607,7 +607,7 @@ static int pvpmu_init(struct domain *d, xen_pmu_params_=
t *params)<br>
=C2=A0 =C2=A0 =C2=A0struct vcpu *v;<br>
=C2=A0 =C2=A0 =C2=A0struct vpmu_struct *vpmu;<br>
=C2=A0 =C2=A0 =C2=A0struct page_info *page;<br>
-=C2=A0 =C2=A0 uint64_t gfn =3D params-&gt;val;<br>
+=C2=A0 =C2=A0 gfn_t gfn =3D _gfn(params-&gt;val);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if ( (params-&gt;vcpu &gt;=3D d-&gt;max_vcpus) || (d-&g=
t;vcpu[params-&gt;vcpu] =3D=3D NULL) )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c<br>
index f6fe954313..c5cce4b38d 100644<br>
--- a/xen/arch/x86/domain.c<br>
+++ b/xen/arch/x86/domain.c<br>
@@ -797,7 +797,7 @@ int arch_set_info_guest(<br>
=C2=A0 =C2=A0 =C2=A0unsigned long flags;<br>
=C2=A0 =C2=A0 =C2=A0bool compat;<br>
=C2=A0#ifdef CONFIG_PV<br>
-=C2=A0 =C2=A0 unsigned long cr3_gfn;<br>
+=C2=A0 =C2=A0 gfn_t cr3_gfn;<br>
=C2=A0 =C2=A0 =C2=A0struct page_info *cr3_page;<br>
=C2=A0 =C2=A0 =C2=A0unsigned long cr4;<br>
=C2=A0 =C2=A0 =C2=A0int rc =3D 0;<br>
@@ -1061,9 +1061,9 @@ int arch_set_info_guest(<br>
=C2=A0 =C2=A0 =C2=A0set_bit(_VPF_in_reset, &amp;v-&gt;pause_flags);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if ( !compat )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cr3_gfn =3D xen_cr3_to_pfn(c.nat-&gt;ctrlreg[3=
]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cr3_gfn =3D _gfn(xen_cr3_to_pfn(c.nat-&gt;ctrl=
reg[3]));<br>
=C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cr3_gfn =3D compat_cr3_to_pfn(c.cmp-&gt;ctrlre=
g[3]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cr3_gfn =3D _gfn(compat_cr3_to_pfn(c.cmp-&gt;c=
trlreg[3]));<br>
=C2=A0 =C2=A0 =C2=A0cr3_page =3D get_page_from_gfn(d, cr3_gfn, NULL, P2M_AL=
LOC);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if ( !cr3_page )<br>
@@ -1092,7 +1092,7 @@ int arch_set_info_guest(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 0:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( !compat &amp;&amp; !VM=
_ASSIST(d, m2p_strict) &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !paging_mode=
_refcounts(d) )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fill_ro_mpt(_mfn(c=
r3_gfn));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fill_ro_mpt(_mfn(g=
fn_x(cr3_gfn)));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( cr3_page =3D=3D curren=
t-&gt;arch.old_guest_table )<br>
@@ -1107,7 +1107,7 @@ int arch_set_info_guest(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v-&gt;arch.guest_table =3D pagetable_from=
_page(cr3_page);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( c.nat-&gt;ctrlreg[1] )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cr3_gfn =3D xen_cr3_to_pfn(c.nat=
-&gt;ctrlreg[1]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cr3_gfn =3D _gfn(xen_cr3_to_pfn(=
c.nat-&gt;ctrlreg[1]));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cr3_page =3D get_page_from_=
gfn(d, cr3_gfn, NULL, P2M_ALLOC);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( !cr3_page )<br>
@@ -1132,7 +1132,7 @@ int arch_set_info_guest(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 0:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if ( VM_ASSIST(d, m2p_strict) )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 zap_ro_mpt(_mfn(cr3_gfn));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 zap_ro_mpt(_mfn(gfn_x(cr3_gfn)));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c<br>
index 33f9a869c0..6b0d8075cd 100644<br>
--- a/xen/arch/x86/domctl.c<br>
+++ b/xen/arch/x86/domctl.c<br>
@@ -448,7 +448,7 @@ long arch_do_domctl(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 page =3D get_page_from_gfn(d, gf=
n, &amp;t, P2M_ALLOC);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 page =3D get_page_from_gfn(d, _g=
fn(gfn), &amp;t, P2M_ALLOC);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( unlikely(!page) ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unlikely(is_=
xen_heap_page(page)) )<br>
@@ -498,11 +498,11 @@ long arch_do_domctl(<br>
<br>
=C2=A0 =C2=A0 =C2=A0case XEN_DOMCTL_hypercall_init:<br>
=C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long gmfn =3D domctl-&gt;u.hypercall_=
init.gmfn;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gfn_t gfn =3D _gfn(domctl-&gt;u.hypercall_init=
.gmfn);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct page_info *page;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *hypercall_page;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 page =3D get_page_from_gfn(d, gmfn, NULL, P2M_=
ALLOC);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 page =3D get_page_from_gfn(d, gfn, NULL, P2M_A=
LLOC);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( !page || !get_page_type(page, PGT_wr=
itable_page) )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c<br>
index d6d0e8be89..3b3ad27938 100644<br>
--- a/xen/arch/x86/hvm/dm.c<br>
+++ b/xen/arch/x86/hvm/dm.c<br>
@@ -186,7 +186,7 @@ static int modified_memory(struct domain *d,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct page_info *page;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 page =3D get_page_from_gfn(d, pf=
n, NULL, P2M_UNSHARE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 page =3D get_page_from_gfn(d, _g=
fn(pfn), NULL, P2M_UNSHARE);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( page )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0paging_mark_p=
fn_dirty(d, _pfn(pfn));<br>
diff --git a/xen/arch/x86/hvm/domain.c b/xen/arch/x86/hvm/domain.c<br>
index 5d5a746a25..73d2da8441 100644<br>
--- a/xen/arch/x86/hvm/domain.c<br>
+++ b/xen/arch/x86/hvm/domain.c<br>
@@ -297,7 +297,7 @@ int arch_set_info_hvm_guest(struct vcpu *v, const vcpu_=
hvm_context_t *ctx)<br>
=C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Shadow-mode CR3 change. Check PDBR and=
 update refcounts. */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct page_info *page =3D get_page_from_=
gfn(v-&gt;domain,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v-&gt;arch.hvm.guest_cr[3] &gt=
;&gt; PAGE_SHIFT,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gaddr_to_gfn(v-&gt;arch.hvm.gu=
est_cr[3]),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, P2M_ALLOC);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( !page )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c<br>
index 7be9cf4454..be262e5a1d 100644<br>
--- a/xen/arch/x86/hvm/hvm.c<br>
+++ b/xen/arch/x86/hvm/hvm.c<br>
@@ -2146,7 +2146,7 @@ int hvm_set_cr0(unsigned long value, bool may_defer)<=
br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0struct vcpu *v =3D current;<br>
=C2=A0 =C2=A0 =C2=A0struct domain *d =3D v-&gt;domain;<br>
-=C2=A0 =C2=A0 unsigned long gfn, old_value =3D v-&gt;arch.hvm.guest_cr[0];=
<br>
+=C2=A0 =C2=A0 unsigned long old_value =3D v-&gt;arch.hvm.guest_cr[0];<br>
=C2=A0 =C2=A0 =C2=A0struct page_info *page;<br>
<br>
=C2=A0 =C2=A0 =C2=A0HVM_DBG_LOG(DBG_LEVEL_VMMU, &quot;Update CR0 value =3D =
%lx&quot;, value);<br>
@@ -2201,7 +2201,8 @@ int hvm_set_cr0(unsigned long value, bool may_defer)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( !paging_mode_hap(d) )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* The guest CR3 must be po=
inting to the guest physical. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gfn =3D v-&gt;arch.hvm.guest_cr[=
3] &gt;&gt; PAGE_SHIFT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gfn_t gfn =3D gaddr_to_gfn(v-&gt=
;arch.hvm.guest_cr[3]);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0page =3D get_page_from_gfn(=
d, gfn, NULL, P2M_ALLOC);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( !page )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
@@ -2293,7 +2294,7 @@ int hvm_set_cr3(unsigned long value, bool may_defer)<=
br>
=C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Shadow-mode CR3 change. Check PDBR and=
 update refcounts. */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HVM_DBG_LOG(DBG_LEVEL_VMMU, &quot;CR3 val=
ue =3D %lx&quot;, value);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 page =3D get_page_from_gfn(v-&gt;domain, value=
 &gt;&gt; PAGE_SHIFT,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 page =3D get_page_from_gfn(v-&gt;domain, gaddr=
_to_gfn(value),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, P2M_ALLOC);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( !page )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto bad_cr3;<br>
@@ -3120,7 +3121,7 @@ enum hvm_translation_result hvm_translate_get_page(<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; hvm_mmio_internal(gfn_to_gadd=
r(gfn)) )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return HVMTRANS_bad_gfn_to_mfn;<br>
<br>
-=C2=A0 =C2=A0 page =3D get_page_from_gfn(v-&gt;domain, gfn_x(gfn), &amp;p2=
mt, P2M_UNSHARE);<br>
+=C2=A0 =C2=A0 page =3D get_page_from_gfn(v-&gt;domain, gfn, &amp;p2mt, P2M=
_UNSHARE);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if ( !page )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return HVMTRANS_bad_gfn_to_mfn;<br>
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c<br>
index 5d00256aaa..a7419bd444 100644<br>
--- a/xen/arch/x86/hvm/svm/svm.c<br>
+++ b/xen/arch/x86/hvm/svm/svm.c<br>
@@ -317,7 +317,7 @@ static int svm_vmcb_restore(struct vcpu *v, struct hvm_=
hw_cpu *c)<br>
=C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( c-&gt;cr0 &amp; X86_CR0_PG )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 page =3D get_page_from_gfn(v-&gt=
;domain, c-&gt;cr3 &gt;&gt; PAGE_SHIFT,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 page =3D get_page_from_gfn(v-&gt=
;domain, gaddr_to_gfn(c-&gt;cr3),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, P2M_ALLOC=
);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( !page )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
@@ -2412,9 +2412,9 @@ nsvm_get_nvmcb_page(struct vcpu *v, uint64_t vmcbaddr=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Need to translate L1-GPA to MPA */<br>
-=C2=A0 =C2=A0 page =3D get_page_from_gfn(v-&gt;domain, <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 nv-&gt;nv_vvmcxaddr &gt;&gt; PAGE_SHIFT, <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &amp;p2mt, P2M_ALLOC | P2M_UNSHARE);<br>
+=C2=A0 =C2=A0 page =3D get_page_from_gfn(v-&gt;domain,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gaddr_to_gfn(nv-&gt;nv_vvmcxaddr &gt;&gt; PA=
GE_SHIFT),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;p2mt, P2M_ALLOC | P2M_UNSHARE);<br>
=C2=A0 =C2=A0 =C2=A0if ( !page )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
<br>
diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridi=
an/viridian.c<br>
index 2dc86dd0f3..1d3be156db 100644<br>
--- a/xen/arch/x86/hvm/viridian/viridian.c<br>
+++ b/xen/arch/x86/hvm/viridian/viridian.c<br>
@@ -332,16 +332,16 @@ static void dump_reference_tsc(const struct domain *d=
)<br>
<br>
=C2=A0static void enable_hypercall_page(struct domain *d)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 unsigned long gmfn =3D d-&gt;arch.hvm.viridian.hypercall_gpa=
.fields.pfn;<br>
-=C2=A0 =C2=A0 struct page_info *page =3D get_page_from_gfn(d, gmfn, NULL, =
P2M_ALLOC);<br>
+=C2=A0 =C2=A0 gfn_t gfn =3D _gfn(d-&gt;arch.hvm.viridian.hypercall_gpa.fie=
lds.pfn);<br>
+=C2=A0 =C2=A0 struct page_info *page =3D get_page_from_gfn(d, gfn, NULL, P=
2M_ALLOC);<br>
=C2=A0 =C2=A0 =C2=A0uint8_t *p;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if ( !page || !get_page_type(page, PGT_writable_page) )=
<br>
=C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( page )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0put_page(page);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gdprintk(XENLOG_WARNING, &quot;Bad GMFN %#&quo=
t;PRI_gfn&quot; (MFN %#&quot;PRI_mfn&quot;)\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gmfn, mfn_x(=
page ? page_to_mfn(page) : INVALID_MFN));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gdprintk(XENLOG_WARNING, &quot;Bad GFN %#&quot=
;PRI_gfn&quot; (MFN %#&quot;PRI_mfn&quot;)\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gfn_x(gfn), =
mfn_x(page ? page_to_mfn(page) : INVALID_MFN));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -367,8 +367,8 @@ static void enable_hypercall_page(struct domain *d)<br>
=C2=A0static void initialize_vp_assist(struct vcpu *v)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0struct domain *d =3D v-&gt;domain;<br>
-=C2=A0 =C2=A0 unsigned long gmfn =3D v-&gt;arch.hvm.viridian.vp_assist.msr=
.fields.pfn;<br>
-=C2=A0 =C2=A0 struct page_info *page =3D get_page_from_gfn(d, gmfn, NULL, =
P2M_ALLOC);<br>
+=C2=A0 =C2=A0 gfn_t gfn =3D _gfn(v-&gt;arch.hvm.viridian.vp_assist.msr.fie=
lds.pfn);<br>
+=C2=A0 =C2=A0 struct page_info *page =3D get_page_from_gfn(d, gfn, NULL, P=
2M_ALLOC);<br>
=C2=A0 =C2=A0 =C2=A0void *va;<br>
<br>
=C2=A0 =C2=A0 =C2=A0ASSERT(!v-&gt;<a href=3D"http://arch.hvm.viridian.vp_as=
sist.va" rel=3D"noreferrer" target=3D"_blank">arch.hvm.viridian.vp_assist.v=
a</a>);<br>
@@ -395,8 +395,8 @@ static void initialize_vp_assist(struct vcpu *v)<br>
=C2=A0 =C2=A0 =C2=A0return;<br>
<br>
=C2=A0 fail:<br>
-=C2=A0 =C2=A0 gdprintk(XENLOG_WARNING, &quot;Bad GMFN %#&quot;PRI_gfn&quot=
; (MFN %#&quot;PRI_mfn&quot;)\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gmfn, mfn_x(page ? page_to=
_mfn(page) : INVALID_MFN));<br>
+=C2=A0 =C2=A0 gdprintk(XENLOG_WARNING, &quot;Bad GFN %#&quot;PRI_gfn&quot;=
 (MFN %#&quot;PRI_mfn&quot;)\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gfn_x(gfn), mfn_x(page ? p=
age_to_mfn(page) : INVALID_MFN));<br>
=C2=A0}<br>
<br>
=C2=A0static void teardown_vp_assist(struct vcpu *v)<br>
@@ -465,16 +465,16 @@ void viridian_apic_assist_clear(struct vcpu *v)<br>
<br>
=C2=A0static void update_reference_tsc(struct domain *d, bool_t initialize)=
<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 unsigned long gmfn =3D d-&gt;arch.hvm.viridian.reference_tsc=
.fields.pfn;<br>
-=C2=A0 =C2=A0 struct page_info *page =3D get_page_from_gfn(d, gmfn, NULL, =
P2M_ALLOC);<br>
+=C2=A0 =C2=A0 gfn_t gfn =3D _gfn(d-&gt;arch.hvm.viridian.reference_tsc.fie=
lds.pfn);<br>
+=C2=A0 =C2=A0 struct page_info *page =3D get_page_from_gfn(d, gfn, NULL, P=
2M_ALLOC);<br>
=C2=A0 =C2=A0 =C2=A0HV_REFERENCE_TSC_PAGE *p;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if ( !page || !get_page_type(page, PGT_writable_page) )=
<br>
=C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( page )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0put_page(page);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gdprintk(XENLOG_WARNING, &quot;Bad GMFN %#&quo=
t;PRI_gfn&quot; (MFN %#&quot;PRI_mfn&quot;)\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gmfn, mfn_x(=
page ? page_to_mfn(page) : INVALID_MFN));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gdprintk(XENLOG_WARNING, &quot;Bad GFN %#&quot=
;PRI_gfn&quot; (MFN %#&quot;PRI_mfn&quot;)\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gfn_x(gfn), =
mfn_x(page ? page_to_mfn(page) : INVALID_MFN));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c<br>
index e065f8bbdb..2070e78358 100644<br>
--- a/xen/arch/x86/hvm/vmx/vmx.c<br>
+++ b/xen/arch/x86/hvm/vmx/vmx.c<br>
@@ -674,7 +674,7 @@ static int vmx_restore_cr0_cr3(<br>
=C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( cr0 &amp; X86_CR0_PG )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 page =3D get_page_from_gfn(v-&gt=
;domain, cr3 &gt;&gt; PAGE_SHIFT,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 page =3D get_page_from_gfn(v-&gt=
;domain, gaddr_to_gfn(cr3),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, P2M_ALLOC=
);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( !page )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
@@ -1373,7 +1373,7 @@ static void vmx_load_pdptrs(struct vcpu *v)<br>
=C2=A0 =C2=A0 =C2=A0if ( (cr3 &amp; 0x1fUL) &amp;&amp; !hvm_pcid_enabled(v)=
 )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto crash;<br>
<br>
-=C2=A0 =C2=A0 page =3D get_page_from_gfn(v-&gt;domain, cr3 &gt;&gt; PAGE_S=
HIFT, &amp;p2mt, P2M_UNSHARE);<br>
+=C2=A0 =C2=A0 page =3D get_page_from_gfn(v-&gt;domain, gaddr_to_gfn(cr3), =
&amp;p2mt, P2M_UNSHARE);<br>
=C2=A0 =C2=A0 =C2=A0if ( !page )<br>
=C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Ideally you don&#39;t want to crash bu=
t rather go into a wait <br>
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c<br>
index dfd08e2d0a..2953d05a17 100644<br>
--- a/xen/arch/x86/hvm/vmx/vvmx.c<br>
+++ b/xen/arch/x86/hvm/vmx/vvmx.c<br>
@@ -649,11 +649,11 @@ static void nvmx_update_apic_access_address(struct vc=
pu *v)<br>
=C2=A0 =C2=A0 =C2=A0if ( ctrl &amp; SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES=
 )<br>
=C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p2m_type_t p2mt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long apic_gpfn;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gfn_t apic_gfn;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct page_info *apic_pg;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 apic_gpfn =3D get_vvmcs(v, APIC_ACCESS_ADDR) &=
gt;&gt; PAGE_SHIFT;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 apic_pg =3D get_page_from_gfn(v-&gt;domain, ap=
ic_gpfn, &amp;p2mt, P2M_ALLOC);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 apic_gfn =3D gaddr_to_gfn(get_vvmcs(v, APIC_AC=
CESS_ADDR));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 apic_pg =3D get_page_from_gfn(v-&gt;domain, ap=
ic_gfn, &amp;p2mt, P2M_ALLOC);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ASSERT(apic_pg &amp;&amp; !p2m_is_paging(=
p2mt));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__vmwrite(APIC_ACCESS_ADDR, page_to_maddr=
(apic_pg));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0put_page(apic_pg);<br>
@@ -670,11 +670,11 @@ static void nvmx_update_virtual_apic_address(struct v=
cpu *v)<br>
=C2=A0 =C2=A0 =C2=A0if ( ctrl &amp; CPU_BASED_TPR_SHADOW )<br>
=C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p2m_type_t p2mt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long vapic_gpfn;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gfn_t vapic_gfn;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct page_info *vapic_pg;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 vapic_gpfn =3D get_vvmcs(v, VIRTUAL_APIC_PAGE_=
ADDR) &gt;&gt; PAGE_SHIFT;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 vapic_pg =3D get_page_from_gfn(v-&gt;domain, v=
apic_gpfn, &amp;p2mt, P2M_ALLOC);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vapic_gfn =3D gaddr_to_gfn(get_vvmcs(v, VIRTUA=
L_APIC_PAGE_ADDR));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 vapic_pg =3D get_page_from_gfn(v-&gt;domain, v=
apic_gfn, &amp;p2mt, P2M_ALLOC);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ASSERT(vapic_pg &amp;&amp; !p2m_is_paging=
(p2mt));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__vmwrite(VIRTUAL_APIC_PAGE_ADDR, page_to=
_maddr(vapic_pg));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0put_page(vapic_pg);<br>
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c<br>
index 9363e9bd96..e3462f8a77 100644<br>
--- a/xen/arch/x86/mm.c<br>
+++ b/xen/arch/x86/mm.c<br>
@@ -2052,7 +2052,7 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentr=
y_t nl1e,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p2m_query_t q =3D l1e_get_f=
lags(nl1e) &amp; _PAGE_RW ?<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0P2M_ALLOC | P2M_UNSHARE : P2M_ALLOC;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 page =3D get_page_from_gfn(pg_do=
m, l1e_get_pfn(nl1e), &amp;p2mt, q);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 page =3D get_page_from_gfn(pg_do=
m, _gfn(l1e_get_pfn(nl1e)), &amp;p2mt, q);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( p2m_is_paged(p2mt) )<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
@@ -3223,7 +3223,8 @@ long do_mmuext_op(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( paging_mode_refcounts(=
pg_owner) )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 page =3D get_page_from_gfn(pg_ow=
ner, op.arg1.mfn, NULL, P2M_ALLOC);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 page =3D get_page_from_gfn(pg_ow=
ner, _gfn(op.arg1.mfn), NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0P2M_ALLOC);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( unlikely(!page) )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D -EINVA=
L;<br>
@@ -3288,7 +3289,8 @@ long do_mmuext_op(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( paging_mode_refcounts(=
pg_owner) )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 page =3D get_page_from_gfn(pg_ow=
ner, op.arg1.mfn, NULL, P2M_ALLOC);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 page =3D get_page_from_gfn(pg_ow=
ner, _gfn(op.arg1.mfn), NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0P2M_ALLOC);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( unlikely(!page) )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gdprintk(XENL=
OG_WARNING,<br>
@@ -3504,7 +3506,8 @@ long do_mmuext_op(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case MMUEXT_CLEAR_PAGE:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 page =3D get_page_from_gfn(pg_ow=
ner, op.arg1.mfn, &amp;p2mt, P2M_ALLOC);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 page =3D get_page_from_gfn(pg_ow=
ner, _gfn(op.arg1.mfn), &amp;p2mt,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0P2M_ALLOC);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( unlikely(p2mt !=3D p2m=
_ram_rw) &amp;&amp; page )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0put_page(page=
);<br>
@@ -3532,7 +3535,7 @@ long do_mmuext_op(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct page_info *src_page,=
 *dst_page;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 src_page =3D get_page_from_gfn(p=
g_owner, op.arg2.src_mfn, &amp;p2mt,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 src_page =3D get_page_from_gfn(p=
g_owner, _gfn(op.arg2.src_mfn), &amp;p2mt,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 P=
2M_ALLOC);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( unlikely(p2mt !=3D p2m=
_ram_rw) &amp;&amp; src_page )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
@@ -3548,7 +3551,7 @@ long do_mmuext_op(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dst_page =3D get_page_from_gfn(p=
g_owner, op.arg1.mfn, &amp;p2mt,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dst_page =3D get_page_from_gfn(p=
g_owner, _gfn(op.arg1.mfn), &amp;p2mt,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 P=
2M_ALLOC);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( unlikely(p2mt !=3D p2m=
_ram_rw) &amp;&amp; dst_page )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
@@ -3636,7 +3639,8 @@ long do_mmu_update(<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0struct mmu_update req;<br>
=C2=A0 =C2=A0 =C2=A0void *va =3D NULL;<br>
-=C2=A0 =C2=A0 unsigned long gpfn, gmfn, mfn;<br>
+=C2=A0 =C2=A0 unsigned long gpfn, mfn;<br>
+=C2=A0 =C2=A0 gfn_t gfn;<br>
=C2=A0 =C2=A0 =C2=A0struct page_info *page;<br>
=C2=A0 =C2=A0 =C2=A0unsigned int cmd, i =3D 0, done =3D 0, pt_dom;<br>
=C2=A0 =C2=A0 =C2=A0struct vcpu *curr =3D current, *v =3D curr;<br>
@@ -3749,8 +3753,8 @@ long do_mmu_update(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D -EINVAL;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0req.ptr -=3D cmd;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gmfn =3D req.ptr &gt;&gt; PAGE_S=
HIFT;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 page =3D get_page_from_gfn(pt_ow=
ner, gmfn, &amp;p2mt, P2M_ALLOC);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gfn =3D gaddr_to_gfn(req.ptr);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 page =3D get_page_from_gfn(pt_ow=
ner, gfn, &amp;p2mt, P2M_ALLOC);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( unlikely(!page) || p2m=
t !=3D p2m_ram_rw )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
@@ -3758,7 +3762,7 @@ long do_mmu_update(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0put_page(page);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( p2m_is_p=
aged(p2mt) )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p2m_=
mem_paging_populate(pt_owner, gmfn);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p2m_=
mem_paging_populate(pt_owner, gfn_x(gfn));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0rc =3D -ENOENT;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c<br>
index a00a3c1bff..3b2aac8804 100644<br>
--- a/xen/arch/x86/mm/p2m.c<br>
+++ b/xen/arch/x86/mm/p2m.c<br>
@@ -2718,7 +2718,7 @@ int p2m_add_foreign(struct domain *tdom, unsigned lon=
g fgfn,<br>
=C2=A0 =C2=A0 =C2=A0 * Take a refcnt on the mfn. NB: following supported fo=
r foreign mapping:<br>
=C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0ram_rw | ram_logdirty | ram_ro | =
paging_out.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 page =3D get_page_from_gfn(fdom, fgfn, &amp;p2mt, P2M_ALLOC)=
;<br>
+=C2=A0 =C2=A0 page =3D get_page_from_gfn(fdom, _gfn(fgfn), &amp;p2mt, P2M_=
ALLOC);<br>
=C2=A0 =C2=A0 =C2=A0if ( !page ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !p2m_is_ram(p2mt) || p2m_is_shared(p2mt)=
 || p2m_is_hole(p2mt) )<br>
=C2=A0 =C2=A0 =C2=A0{<br>
diff --git a/xen/arch/x86/mm/shadow/hvm.c b/xen/arch/x86/mm/shadow/hvm.c<br=
>
index 4cc75916b8..9275ba476c 100644<br>
--- a/xen/arch/x86/mm/shadow/hvm.c<br>
+++ b/xen/arch/x86/mm/shadow/hvm.c<br>
@@ -313,15 +313,15 @@ const struct x86_emulate_ops hvm_shadow_emulator_ops =
=3D {<br>
=C2=A0static mfn_t emulate_gva_to_mfn(struct vcpu *v, unsigned long vaddr,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct sh_emulate_ctxt *sh_ctx=
t)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 unsigned long gfn;<br>
+=C2=A0 =C2=A0 gfn_t gfn;<br>
=C2=A0 =C2=A0 =C2=A0struct page_info *page;<br>
=C2=A0 =C2=A0 =C2=A0mfn_t mfn;<br>
=C2=A0 =C2=A0 =C2=A0p2m_type_t p2mt;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t pfec =3D PFEC_page_present | PFEC_write_access=
;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Translate the VA to a GFN. */<br>
-=C2=A0 =C2=A0 gfn =3D paging_get_hostmode(v)-&gt;gva_to_gfn(v, NULL, vaddr=
, &amp;pfec);<br>
-=C2=A0 =C2=A0 if ( gfn =3D=3D gfn_x(INVALID_GFN) )<br>
+=C2=A0 =C2=A0 gfn =3D _gfn(paging_get_hostmode(v)-&gt;gva_to_gfn(v, NULL, =
vaddr, &amp;pfec));<br>
+=C2=A0 =C2=A0 if ( gfn_eq(gfn, INVALID_GFN) )<br>
=C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0x86_emul_pagefault(pfec, vaddr, &amp;sh_c=
txt-&gt;ctxt);<br>
<br>
diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c<br>
index 3a3c15890b..4f3f438614 100644<br>
--- a/xen/arch/x86/physdev.c<br>
+++ b/xen/arch/x86/physdev.c<br>
@@ -229,7 +229,8 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(voi=
d) arg)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EINVAL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 page =3D get_page_from_gfn(current-&gt;domain,=
 info.gmfn, NULL, P2M_ALLOC);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 page =3D get_page_from_gfn(current-&gt;domain,=
 _gfn(info.gmfn),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, P2M_ALLOC);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( !page )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( !get_page_type(page, PGT_writable_pa=
ge) )<br>
diff --git a/xen/arch/x86/pv/descriptor-tables.c b/xen/arch/x86/pv/descript=
or-tables.c<br>
index 8b2d55fc2e..7e8f41d3fd 100644<br>
--- a/xen/arch/x86/pv/descriptor-tables.c<br>
+++ b/xen/arch/x86/pv/descriptor-tables.c<br>
@@ -112,7 +112,7 @@ long pv_set_gdt(struct vcpu *v, unsigned long *frames, =
unsigned int entries)<br>
=C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct page_info *page;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 page =3D get_page_from_gfn(d, frames[i], NULL,=
 P2M_ALLOC);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 page =3D get_page_from_gfn(d, _gfn(frames[i]),=
 NULL, P2M_ALLOC);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( !page )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( !get_page_type(page, PGT_seg_desc_pa=
ge) )<br>
@@ -209,7 +209,6 @@ int compat_set_gdt(XEN_GUEST_HANDLE_PARAM(uint) frame_l=
ist,<br>
=C2=A0long do_update_descriptor(uint64_t pa, uint64_t desc)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0struct domain *currd =3D current-&gt;domain;<br>
-=C2=A0 =C2=A0 unsigned long gmfn =3D pa &gt;&gt; PAGE_SHIFT;<br>
=C2=A0 =C2=A0 =C2=A0unsigned long mfn;<br>
=C2=A0 =C2=A0 =C2=A0unsigned int=C2=A0 offset;<br>
=C2=A0 =C2=A0 =C2=A0struct desc_struct *gdt_pent, d;<br>
@@ -220,7 +219,7 @@ long do_update_descriptor(uint64_t pa, uint64_t desc)<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0*(uint64_t *)&amp;d =3D desc;<br>
<br>
-=C2=A0 =C2=A0 page =3D get_page_from_gfn(currd, gmfn, NULL, P2M_ALLOC);<br=
>
+=C2=A0 =C2=A0 page =3D get_page_from_gfn(currd, gaddr_to_gfn(pa), NULL, P2=
M_ALLOC);<br>
=C2=A0 =C2=A0 =C2=A0if ( (((unsigned int)pa % sizeof(struct desc_struct)) !=
=3D 0) ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !page ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !check_descriptor(currd, &amp;d) )<br>
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.=
c<br>
index f73ea4a163..a529ebcc3f 100644<br>
--- a/xen/arch/x86/pv/emul-priv-op.c<br>
+++ b/xen/arch/x86/pv/emul-priv-op.c<br>
@@ -760,12 +760,12 @@ static int write_cr(unsigned int reg, unsigned long v=
al,<br>
=C2=A0 =C2=A0 =C2=A0case 3: /* Write CR3 */<br>
=C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct domain *currd =3D curr-&gt;domain;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long gfn;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gfn_t gfn;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct page_info *page;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int rc;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gfn =3D !is_pv_32bit_domain(currd)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ? xen_cr3_to_pfn(val) : c=
ompat_cr3_to_pfn(val);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gfn =3D _gfn(!is_pv_32bit_domain(currd)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ? xen_cr3_to_pfn(val) : c=
ompat_cr3_to_pfn(val));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0page =3D get_page_from_gfn(currd, gfn, NU=
LL, P2M_ALLOC);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( !page )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
diff --git a/xen/arch/x86/pv/mm.c b/xen/arch/x86/pv/mm.c<br>
index f5ea00ca4e..c9ad1152b4 100644<br>
--- a/xen/arch/x86/pv/mm.c<br>
+++ b/xen/arch/x86/pv/mm.c<br>
@@ -106,7 +106,7 @@ bool pv_map_ldt_shadow_page(unsigned int offset)<br>
=C2=A0 =C2=A0 =C2=A0if ( unlikely(!(l1e_get_flags(gl1e) &amp; _PAGE_PRESENT=
)) )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
<br>
-=C2=A0 =C2=A0 page =3D get_page_from_gfn(currd, l1e_get_pfn(gl1e), NULL, P=
2M_ALLOC);<br>
+=C2=A0 =C2=A0 page =3D get_page_from_gfn(currd, _gfn(l1e_get_pfn(gl1e)), N=
ULL, P2M_ALLOC);<br>
=C2=A0 =C2=A0 =C2=A0if ( unlikely(!page) )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
<br>
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c<br>
index 9471d89022..d967e49432 100644<br>
--- a/xen/arch/x86/traps.c<br>
+++ b/xen/arch/x86/traps.c<br>
@@ -795,7 +795,7 @@ int guest_wrmsr_xen(struct vcpu *v, uint32_t idx, uint6=
4_t val)<br>
=C2=A0 =C2=A0 =C2=A0case 0: /* Write hypercall page */<br>
=C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *hypercall_page;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long gmfn =3D val &gt;&gt; PAGE_SHIFT=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gfn_t gfn =3D gaddr_to_gfn(val);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int page_index =3D val &amp; (PA=
GE_SIZE - 1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct page_info *page;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p2m_type_t t;<br>
@@ -808,7 +808,7 @@ int guest_wrmsr_xen(struct vcpu *v, uint32_t idx, uint6=
4_t val)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return X86EMUL_EXCEPTION;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 page =3D get_page_from_gfn(d, gmfn, &amp;t, P2=
M_ALLOC);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 page =3D get_page_from_gfn(d, gfn, &amp;t, P2M=
_ALLOC);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( !page || !get_page_type(page, PGT_wr=
itable_page) )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
@@ -817,13 +817,14 @@ int guest_wrmsr_xen(struct vcpu *v, uint32_t idx, uin=
t64_t val)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( p2m_is_paging(t) )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p2m_mem_paging_pop=
ulate(d, gmfn);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p2m_mem_paging_pop=
ulate(d, gfn_x(gfn));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return X86EMU=
L_RETRY;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gdprintk(XENLOG_WARNING,<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;Bad GMFN %lx (MFN %#&quot;PRI_mfn&quot;) to MSR %08x\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0gmfn, mfn_x(page ? page_to_mfn(page) : INVALID_MFN), base);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;Bad GMFN %#&quot;PRI_gfn&quot; (MFN %#&quot;PRI_mfn&quot;) to MSR =
%08x\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0gfn_x(gfn), mfn_x(page ? page_to_mfn(page) : INVALID_MFN),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0base);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return X86EMUL_EXCEPTION;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
diff --git a/xen/common/domain.c b/xen/common/domain.c<br>
index d6650f0656..5e3c05b96c 100644<br>
--- a/xen/common/domain.c<br>
+++ b/xen/common/domain.c<br>
@@ -1250,7 +1250,7 @@ int map_vcpu_info(struct vcpu *v, unsigned long gfn, =
unsigned offset)<br>
=C2=A0 =C2=A0 =C2=A0if ( (v !=3D current) &amp;&amp; !(v-&gt;pause_flags &a=
mp; VPF_down) )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
<br>
-=C2=A0 =C2=A0 page =3D get_page_from_gfn(d, gfn, NULL, P2M_ALLOC);<br>
+=C2=A0 =C2=A0 page =3D get_page_from_gfn(d, _gfn(gfn), NULL, P2M_ALLOC);<b=
r>
=C2=A0 =C2=A0 =C2=A0if ( !page )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
<br>
diff --git a/xen/common/event_fifo.c b/xen/common/event_fifo.c<br>
index c49f446754..71a6f673b2 100644<br>
--- a/xen/common/event_fifo.c<br>
+++ b/xen/common/event_fifo.c<br>
@@ -358,7 +358,7 @@ static const struct evtchn_port_ops evtchn_port_ops_fif=
o =3D<br>
=C2=A0 =C2=A0 =C2=A0.print_state=C2=A0 =C2=A0=3D evtchn_fifo_print_state,<b=
r>
=C2=A0};<br>
<br>
-static int map_guest_page(struct domain *d, uint64_t gfn, void **virt)<br>
+static int map_guest_page(struct domain *d, gfn_t gfn, void **virt)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0struct page_info *p;<br>
<br>
@@ -419,7 +419,7 @@ static int setup_control_block(struct vcpu *v)<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
-static int map_control_block(struct vcpu *v, uint64_t gfn, uint32_t offset=
)<br>
+static int map_control_block(struct vcpu *v, gfn_t gfn, uint32_t offset)<b=
r>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0void *virt;<br>
=C2=A0 =C2=A0 =C2=A0unsigned int i;<br>
@@ -505,7 +505,7 @@ int evtchn_fifo_init_control(struct evtchn_init_control=
 *init_control)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0struct domain *d =3D current-&gt;domain;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t vcpu_id;<br>
-=C2=A0 =C2=A0 uint64_t gfn;<br>
+=C2=A0 =C2=A0 gfn_t gfn;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t offset;<br>
=C2=A0 =C2=A0 =C2=A0struct vcpu *v;<br>
=C2=A0 =C2=A0 =C2=A0int rc;<br>
@@ -513,7 +513,7 @@ int evtchn_fifo_init_control(struct evtchn_init_control=
 *init_control)<br>
=C2=A0 =C2=A0 =C2=A0init_control-&gt;link_bits =3D EVTCHN_FIFO_LINK_BITS;<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0vcpu_id =3D init_control-&gt;vcpu;<br>
-=C2=A0 =C2=A0 gfn=C2=A0 =C2=A0 =C2=A0=3D init_control-&gt;control_gfn;<br>
+=C2=A0 =C2=A0 gfn=C2=A0 =C2=A0 =C2=A0=3D _gfn(init_control-&gt;control_gfn=
);<br>
=C2=A0 =C2=A0 =C2=A0offset=C2=A0 =3D init_control-&gt;offset;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if ( vcpu_id &gt;=3D d-&gt;max_vcpus || !d-&gt;vcpu[vcp=
u_id] )<br>
@@ -569,7 +569,7 @@ int evtchn_fifo_init_control(struct evtchn_init_control=
 *init_control)<br>
=C2=A0 =C2=A0 =C2=A0return rc;<br>
=C2=A0}<br>
<br>
-static int add_page_to_event_array(struct domain *d, unsigned long gfn)<br=
>
+static int add_page_to_event_array(struct domain *d, gfn_t gfn)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0void *virt;<br>
=C2=A0 =C2=A0 =C2=A0unsigned int slot;<br>
@@ -619,7 +619,7 @@ int evtchn_fifo_expand_array(const struct evtchn_expand=
_array *expand_array)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EOPNOTSUPP;<br>
<br>
=C2=A0 =C2=A0 =C2=A0spin_lock(&amp;d-&gt;event_lock);<br>
-=C2=A0 =C2=A0 rc =3D add_page_to_event_array(d, expand_array-&gt;array_gfn=
);<br>
+=C2=A0 =C2=A0 rc =3D add_page_to_event_array(d, _gfn(expand_array-&gt;arra=
y_gfn));<br>
=C2=A0 =C2=A0 =C2=A0spin_unlock(&amp;d-&gt;event_lock);<br>
<br>
=C2=A0 =C2=A0 =C2=A0return rc;<br>
diff --git a/xen/common/memory.c b/xen/common/memory.c<br>
index 987395fbb3..e02733dba0 100644<br>
--- a/xen/common/memory.c<br>
+++ b/xen/common/memory.c<br>
@@ -1365,7 +1365,7 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE=
_PARAM(void) arg)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return rc;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 page =3D get_page_from_gfn(d, xrfp.gpfn, NULL,=
 P2M_ALLOC);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 page =3D get_page_from_gfn(d, _gfn(xrfp.gpfn),=
 NULL, P2M_ALLOC);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( page )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D guest_physmap_remove=
_page(d, _gfn(xrfp.gpfn),<br>
@@ -1636,7 +1636,7 @@ int check_get_page_from_gfn(struct domain *d, gfn_t g=
fn, bool readonly,<br>
=C2=A0 =C2=A0 =C2=A0p2m_type_t p2mt;<br>
=C2=A0 =C2=A0 =C2=A0struct page_info *page;<br>
<br>
-=C2=A0 =C2=A0 page =3D get_page_from_gfn(d, gfn_x(gfn), &amp;p2mt, q);<br>
+=C2=A0 =C2=A0 page =3D get_page_from_gfn(d, gfn, &amp;p2mt, q);<br>
<br>
=C2=A0#ifdef CONFIG_HAS_MEM_PAGING<br>
=C2=A0 =C2=A0 =C2=A0if ( p2m_is_paging(p2mt) )<br>
diff --git a/xen/common/tmem_xen.c b/xen/common/tmem_xen.c<br>
index bf7b14f79a..72cba7f10c 100644<br>
--- a/xen/common/tmem_xen.c<br>
+++ b/xen/common/tmem_xen.c<br>
@@ -52,7 +52,7 @@ static inline void *cli_get_page(xen_pfn_t cmfn, mfn_t *p=
cli_mfn,<br>
=C2=A0 =C2=A0 =C2=A0p2m_type_t t;<br>
=C2=A0 =C2=A0 =C2=A0struct page_info *page;<br>
<br>
-=C2=A0 =C2=A0 page =3D get_page_from_gfn(current-&gt;domain, cmfn, &amp;t,=
 P2M_ALLOC);<br>
+=C2=A0 =C2=A0 page =3D get_page_from_gfn(current-&gt;domain, _gfn(cmfn), &=
amp;t, P2M_ALLOC);<br>
=C2=A0 =C2=A0 =C2=A0if ( !page || t !=3D p2m_ram_rw )<br>
=C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( page )<br>
diff --git a/xen/include/asm-arm/p2m.h b/xen/include/asm-arm/p2m.h<br>
index 7c67806056..5e598a0b37 100644<br>
--- a/xen/include/asm-arm/p2m.h<br>
+++ b/xen/include/asm-arm/p2m.h<br>
@@ -278,7 +278,7 @@ struct page_info *p2m_get_page_from_gfn(struct domain *=
d, gfn_t gfn,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p2=
m_type_t *t);<br>
<br>
=C2=A0static inline struct page_info *get_page_from_gfn(<br>
-=C2=A0 =C2=A0 struct domain *d, unsigned long gfn, p2m_type_t *t, p2m_quer=
y_t q)<br>
+=C2=A0 =C2=A0 struct domain *d, gfn_t gfn, p2m_type_t *t, p2m_query_t q)<b=
r>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0mfn_t mfn;<br>
=C2=A0 =C2=A0 =C2=A0p2m_type_t _t;<br>
@@ -289,7 +289,7 @@ static inline struct page_info *get_page_from_gfn(<br>
=C2=A0 =C2=A0 =C2=A0 * not auto-translated.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0if ( unlikely(d !=3D dom_xen) )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return p2m_get_page_from_gfn(d, _gfn(gfn), t);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return p2m_get_page_from_gfn(d, gfn, t);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if ( !t )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0t =3D &amp;_t;<br>
@@ -300,7 +300,7 @@ static inline struct page_info *get_page_from_gfn(<br>
=C2=A0 =C2=A0 =C2=A0 * DOMID_XEN see 1-1 RAM. The p2m_type is based on the =
type of the<br>
=C2=A0 =C2=A0 =C2=A0 * page.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 mfn =3D _mfn(gfn);<br>
+=C2=A0 =C2=A0 mfn =3D _mfn(gfn_x(gfn));<br>
=C2=A0 =C2=A0 =C2=A0page =3D mfn_to_page(mfn);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if ( !mfn_valid(mfn) || !get_page(page, d) )<br>
diff --git a/xen/include/asm-x86/p2m.h b/xen/include/asm-x86/p2m.h<br>
index d08c595887..db1ec37610 100644<br>
--- a/xen/include/asm-x86/p2m.h<br>
+++ b/xen/include/asm-x86/p2m.h<br>
@@ -489,18 +489,21 @@ struct page_info *p2m_get_page_from_gfn(struct p2m_do=
main *p2m, gfn_t gfn,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p2=
m_query_t q);<br>
<br>
=C2=A0static inline struct page_info *get_page_from_gfn(<br>
-=C2=A0 =C2=A0 struct domain *d, unsigned long gfn, p2m_type_t *t, p2m_quer=
y_t q)<br>
+=C2=A0 =C2=A0 struct domain *d, gfn_t gfn, p2m_type_t *t, p2m_query_t q)<b=
r>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0struct page_info *page;<br>
+=C2=A0 =C2=A0 mfn_t mfn;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if ( paging_mode_translate(d) )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return p2m_get_page_from_gfn(p2m_get_hostp2m(d=
), _gfn(gfn), t, NULL, q);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return p2m_get_page_from_gfn(p2m_get_hostp2m(d=
), gfn, t, NULL, q);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Non-translated guests see 1-1 RAM / MMIO mappings ev=
erywhere */<br>
=C2=A0 =C2=A0 =C2=A0if ( t )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*t =3D likely(d !=3D dom_io) ? p2m_ram_rw=
 : p2m_mmio_direct;<br>
-=C2=A0 =C2=A0 page =3D mfn_to_page(_mfn(gfn));<br>
-=C2=A0 =C2=A0 return mfn_valid(_mfn(gfn)) &amp;&amp; get_page(page, d) ? p=
age : NULL;<br>
+<br>
+=C2=A0 =C2=A0 mfn =3D _mfn(gfn_x(gfn));<br>
+=C2=A0 =C2=A0 page =3D mfn_to_page(mfn);<br>
+=C2=A0 =C2=A0 return mfn_valid(mfn) &amp;&amp; get_page(page, d) ? page : =
NULL;<br>
=C2=A0}<br>
<br>
=C2=A0/* General conversion function from mfn to gfn */<br>
-- <br>
2.11.0<br>
<br>
<br>
_______________________________________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org" target=3D"_blank">Xen-dev=
el@lists.xenproject.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer" target=3D"_blank">https://lists.xenproject.org/mailman/listinfo=
/xen-devel</a></blockquote></div>

--00000000000003261c057a7a7dd7--


--===============5895847932531094769==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5895847932531094769==--
