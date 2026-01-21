Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E79C44501
	for <xen-devel@archiver.kernel.org>; Wed, 21 Jan 2026 09:25:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1209510.1521489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viUSF-0000Gz-1R; Wed, 21 Jan 2026 09:24:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209510.1521489; Wed, 21 Jan 2026 09:24:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viUSE-0000Gs-TS; Wed, 21 Jan 2026 09:24:46 +0000
Received: by outflank-mailman (input) for mailman id 1209510;
 Wed, 21 Jan 2026 09:24:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fb2Z=72=bounce.vates.tech=bounce-md_30504962.69709b59.v1-21f11a052a8b4be2bb0127288a1f1759@srs-se1.protection.inumbo.net>)
 id 1viUSC-0000G0-Sq
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 09:24:45 +0000
Received: from mail187-33.suw11.mandrillapp.com
 (mail187-33.suw11.mandrillapp.com [198.2.187.33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 047a298b-f6ab-11f0-b15e-2bf370ae4941;
 Wed, 21 Jan 2026 10:24:43 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-33.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4dwzL14QVxzBsTlVv
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jan 2026 09:24:41 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 21f11a052a8b4be2bb0127288a1f1759; Wed, 21 Jan 2026 09:24:41 +0000
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
X-Inumbo-ID: 047a298b-f6ab-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1768987481; x=1769257481;
	bh=cv2SMcAX98AyU28O0Hlj/72KU32pmfoNEhIbQqbLB/c=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=iY2yhbGae7poL6oTiVZZ7bzdD4pgQxblAWjitavkeRTekyaIArnzx2ftuAk6HLbJw
	 Mhdj/OC1lzJRt4YETYG/kLXWxfidOyIVn3yvlW/DmsodFOjx7uwdOU1VLlyx3AdODR
	 Fi0i17V66tSfKh/LMON9ZQlFl7fj9B21ilbk7wOEMDEVdeUumBtxlK5/UuJ57xw6Rk
	 4KBzUYLVOH9TxBhseDGPhRIhH8qeMkKzHQr0vPGRbTpsS5uyGbupODT0CJtxf+eZig
	 iourTPnCyfrZwCQk97RP3WJlYaLxe4DNpTUencgPNglIBZ6xhY0MpPSAV0UxEh9e2r
	 LNcJIiUJQdkpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1768987481; x=1769247981; i=teddy.astie@vates.tech;
	bh=cv2SMcAX98AyU28O0Hlj/72KU32pmfoNEhIbQqbLB/c=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=XU6OOZFT4s5SMR3iHsGA5GpEcN5dm2pbdYSgvrKkM7+bYo3Df7EWEXLDlr1E/XCO6
	 VLrSJkWWznWLXG1AhsqIg65w6v1qLk6vZNdm0VF4htRG5CcQ4TWBRz/BhYtRHqwVpZ
	 dSbi6KjazJa9v4p0P9AR+TPKrdXW348Lqkkvo/dPWQvBUeK7cZsO3KkDd0I93XBFr6
	 KDNS2Bb+f+crQ2ZeaY/WXhl/AwzoSmc1Ka95QwCtnRqfdM/mecX4JaB5aVVbsJkRLe
	 5q6qArkWWrHVLtIXKFvu1aMnGnuvRDVCg95NwhmjpYYY4/da84bxkE5Wo17zk4cVW1
	 CMvLEEykpY+Vw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PING][RFC=20PATCH=20v2]=20x86/hvm:=20Allow=20pre-enabling=20x2apic=20mode=20on=20BSP?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1768987480338
Message-Id: <33b95315-1c7c-4be7-872f-27e8b16efb5a@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Jan Beulich" <jbeulich@suse.com>, "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>, "Grygorii Strashko" <grygorii_strashko@epam.com>
References: <0cb4d1f91212a65baf924ed0ef825d8adb4b5423.1762958551.git.teddy.astie@vates.tech>
In-Reply-To: <0cb4d1f91212a65baf924ed0ef825d8adb4b5423.1762958551.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.21f11a052a8b4be2bb0127288a1f1759?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260121:md
Date: Wed, 21 Jan 2026 09:24:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 12/11/2025 =C3=A0 15:51, Teddy Astie a =C3=A9crit=C2=A0:
> Introduce a new option to start the BSP vCPU in x2APIC mode instead
> of xAPIC mode. Expose this in xl through a new "x2apic_mode" option.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> Cc: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Later on, we could consider with this option to use x2APIC ACPI
> tables instead of xAPIC ones.
> 
> There is also some room into introducing a new Kconfig option to
> only support x2apic mode, which would change how the "Xen default"
> would behave.
> 
> changed in v2:
>   - only pre-enable instead of forcing
>   - use domain builder to pre-enable instead of introducing a new domain =
creation flag
> 
> v1:
> - https://lore.kernel.org/xen-devel/d498a50f6187b362ac5da3c6a7a7c348f35dc=
4b3.1761761288.git.teddy.astie@vates.tech/
> ---
>   docs/man/xl.cfg.5.pod.in         | 16 ++++++++++++
>   tools/include/libxl.h            |  8 ++++++
>   tools/include/xenguest.h         |  4 +++
>   tools/libs/guest/xg_dom_x86.c    | 42 ++++++++++++++++++++++++++++++++
>   tools/libs/light/libxl_types.idl |  1 +
>   tools/libs/light/libxl_x86.c     |  4 +++
>   tools/xl/xl_parse.c              | 11 +++++++++
>   7 files changed, 86 insertions(+)
> 
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index ad1553c5e9..0f7a89fe92 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -3198,6 +3198,22 @@ option.
>   
>   If using this option is necessary to fix an issue, please report a bug.
>   
> +=3Ditem B<x2apic_mode=3D"MODE">
> +
> +Sets the x2apic mode of the domain. The valid values are as follows:
> +
> +=3Dover 4
> +
> +=3Ditem B<"default">
> +
> +Use default Xen LAPIC behavior.
> +
> +=3Ditem B<"pre_enable">
> +
> +Initially enable x2apic for the BSP of the domain.
> +
> +=3Dback
> +
>   =3Dback
>   
>   =3Dhead1 SEE ALSO
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index bc35e412da..9850e8aa41 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -1537,6 +1537,14 @@ void libxl_mac_copy(libxl_ctx *ctx, libxl_mac *dst=
, const libxl_mac *src);
>    */
>   #define LIBXL_HAVE_XEN_PLATFORM_PCI_BAR_UC
>   
> +/*
> + * LIBXL_HAVE_X2APIC_PREENABLE
> + *
> + * libxl_domain_build_info contains a boolean 'arch_x86.x2apic_preenable=
' field
> + * to initially set the BSP LAPIC in x2APIC mode.
> + */
> +#define LIBXL_HAVE_X2APIC_PREENABLE
> +
>   typedef char **libxl_string_list;
>   void libxl_string_list_dispose(libxl_string_list *sl);
>   int libxl_string_list_length(const libxl_string_list *sl);
> diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
> index c88958faa9..408a0c77e8 100644
> --- a/tools/include/xenguest.h
> +++ b/tools/include/xenguest.h
> @@ -223,6 +223,10 @@ struct xc_dom_image {
>       /* If unset disables the setup of the IOREQ pages. */
>       bool device_model;
>   
> +#if defined(__i386__) || defined(__x86_64__)
> +    bool preenable_x2apic; /* 1 makes x2APIC enabled initially, 0 keeps =
default Xen behavior */
> +#endif
> +
>       /* BIOS/Firmware passed to HVMLOADER */
>       struct xc_hvm_firmware_module system_firmware_module;
>   
> diff --git a/tools/libs/guest/xg_dom_x86.c b/tools/libs/guest/xg_dom_x86.=
c
> index a82b481a12..43ada5a6ac 100644
> --- a/tools/libs/guest/xg_dom_x86.c
> +++ b/tools/libs/guest/xg_dom_x86.c
> @@ -58,6 +58,9 @@
>   #define MTRR_TYPE_WRBACK     6
>   #define MTRR_DEF_TYPE_ENABLE (1u << 11)
>   
> +#define APIC_BASE_EXTD   (1UL << 10)
> +#define APIC_BASE_ENABLE (1UL << 11)
> +
>   #define SPECIALPAGE_PAGING   0
>   #define SPECIALPAGE_ACCESS   1
>   #define SPECIALPAGE_SHARING  2
> @@ -1131,6 +1134,45 @@ static int vcpu_hvm(struct xc_dom_image *dom)
>           }
>       }
>   
> +    if ( dom->preenable_x2apic )
> +    {
> +        struct {
> +            struct hvm_save_descriptor header_d;
> +            HVM_SAVE_TYPE(HEADER) header;
> +            struct hvm_save_descriptor lapic_d;
> +            HVM_SAVE_TYPE(LAPIC) lapic;
> +            struct hvm_save_descriptor end_d;
> +            HVM_SAVE_TYPE(END) end;
> +        } lapic =3D {
> +            .header_d =3D bsp_ctx.header_d,
> +            .header =3D bsp_ctx.header,
> +            .lapic_d.typecode =3D HVM_SAVE_CODE(LAPIC),
> +            .lapic_d.length =3D HVM_SAVE_LENGTH(LAPIC),
> +            .end_d =3D bsp_ctx.end_d,
> +            .end =3D bsp_ctx.end,
> +        };
> +        const HVM_SAVE_TYPE(LAPIC) *lapic_record =3D
> +            hvm_get_save_record(full_ctx, HVM_SAVE_CODE(LAPIC), 0);
> +
> +        if ( !lapic_record )
> +        {
> +            xc_dom_panic(dom->xch, XC_INTERNAL_ERROR,
> +                         "%s: unable to get LAPIC save record", __func__=
);
> +            goto out;
> +        }
> +
> +        memcpy(&lapic.lapic, lapic_record, sizeof(lapic.lapic));
> +
> +        lapic.lapic.apic_base_msr |=3D APIC_BASE_ENABLE | APIC_BASE_EXTD=
;
> +
> +        rc =3D xc_domain_hvm_setcontext(dom->xch, dom->guest_domid,
> +                                      (uint8_t *)&lapic, sizeof(lapic));
> +
> +        if ( rc !=3D 0 )
> +            xc_dom_panic(dom->xch, XC_INTERNAL_ERROR,
> +                         "%s: SETHVMCONTEXT failed (rc=3D%d)", __func__,=
 rc);
> +    }
> +
>       /*
>        * Loading the BSP context should be done in the last call to setco=
ntext,
>        * since each setcontext call will put all vCPUs down.
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_ty=
pes.idl
> index d64a573ff3..9fdf89d88b 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -738,6 +738,7 @@ libxl_domain_build_info =3D Struct("domain_build_info=
",[
>                                  ("arm_sci", libxl_arm_sci),
>                                 ])),
>       ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
> +                               ("x2apic_preenable", libxl_defbool)
>                                 ])),
>       # Alternate p2m is not bound to any architecture or guest type, as =
it is
>       # supported by x86 HVM and ARM support is planned.
> diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
> index 60d4e8661c..f9725f069a 100644
> --- a/tools/libs/light/libxl_x86.c
> +++ b/tools/libs/light/libxl_x86.c
> @@ -555,6 +555,9 @@ int libxl__arch_domain_init_hw_description(libxl__gc =
*gc,
>                                              libxl__domain_build_state *s=
tate,
>                                              struct xc_dom_image *dom)
>   {
> +    if (libxl_defbool_val(d_config->b_info.arch_x86.x2apic_preenable))
> +        dom->preenable_x2apic =3D true;
> +
>       return 0;
>   }
>   
> @@ -818,6 +821,7 @@ int libxl__arch_domain_build_info_setdefault(libxl__g=
c *gc,
>   {
>       libxl_defbool_setdefault(&b_info->acpi, true);
>       libxl_defbool_setdefault(&b_info->arch_x86.msr_relaxed, false);
> +    libxl_defbool_setdefault(&b_info->arch_x86.x2apic_preenable, false);
>       libxl_defbool_setdefault(&b_info->trap_unmapped_accesses, false);
>   
>       if (b_info->type =3D=3D LIBXL_DOMAIN_TYPE_HVM) {
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index af86d3186d..92bf9d2ad5 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -3040,6 +3040,17 @@ skip_usbdev:
>                       "WARNING: msr_relaxed will be removed in future ver=
sions.\n"
>                       "If it fixes an issue you are having please report =
to "
>                       "xen-devel@lists.xenproject.org.\n");
> +
> +    if (!xlu_cfg_get_string(config, "x2apic_mode", &buf, 1)) {
> +        if (!strcmp(buf, "pre_enable"))
> +            libxl_defbool_set(&b_info->arch_x86.x2apic_preenable, true);
> +        else if (!strcmp(buf, "default"))
> +            libxl_defbool_set(&b_info->arch_x86.x2apic_preenable, false)=
;
> +        else {
> +            fprintf(stderr, "Unknown x2apic mode \"%s\" specified\n", bu=
f);
> +            exit(EXIT_FAILURE);
> +        }
> +    }
>   
>       xlu_cfg_get_defbool(config, "vpmu", &b_info->vpmu, 0);
>   

I haven't received a feedback on this. Aside the eventual future use of 
x2APIC ACPI tables, are there objections for this patch ?


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



