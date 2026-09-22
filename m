Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6344C9830C
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 13:18:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429458.1652827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9MrF-0005jE-IO; Wed, 23 Sep 2026 13:17:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429458.1652827; Wed, 23 Sep 2026 13:17:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9MrF-0005j7-Ff; Wed, 23 Sep 2026 13:17:57 +0000
Received: by outflank-mailman (input) for mailman id 1429458;
 Tue, 22 Sep 2026 19:23:17 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jxgao@google.com>) id 1x965F-0008Dm-7S
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 19:23:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x965E-00BJ8k-0X
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 21:23:16 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jxgao@google.com>)
 id 6ab2d574-e002-0a2a0a5209dd-0a2a4506af6a-46
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 21:23:15 +0200
Received: from [209.85.167.42] (helo=mail-lf1-f42.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jxgao@google.com>)
 id 6ab2d5a3-195a-0a2a45060019-d155a72a8d3d-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 21:23:15 +0200
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5b778bdb5b8so1468e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 12:23:15 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1790104995; cv=none;
        d=google.com; s=arc-20260327;
        b=RmsE4dXmwTZMIPuu37Dc5HUZZ+93N0rkeRAQS3rh2vW3bjTn8D6bXImQkAseIaw57w
         ZKz794xUCPAB0T/z6NFCNQMaMIyih5aMed7VKWWTHouLF0y6YI0h4blcmcnbO+1w0dQb
         lQcChmwdjRKOoDIPkQ5Y1G9lV1Gce19FCuaFHBhYDaHZiKAC29K/IFUZgOFKCjWtnJUb
         9Vzh7Xpj9dCXu/PRUAj33V3iskHR18DqKdjFiTKnepSaG6mPyfUPRzAGVRwBMuRX2FUI
         xvJhFrAbH5UJVHLRuloRF6+3GzjEgu0Yp1USepyKgl9XL/Iz0eTpmy4N+iPYV3r5Hk7B
         z8Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bWXycRkvEhooYynfgtJMUHspQSrP76XAP+DtRk1GwMY=;
        fh=fArzXL4qjM1+Yv+HbKRwNCrID3Jf4eyIGmfeu0lRqsw=;
        b=e/cVoYJAj/21FPH92o0gzrliAv1RYLi4sdRgTMGXL+ru716Hcr67yAnv1FDbefqCsW
         FTRf1GNrBOW43SR5iu0sTJvap9NuxQTWR5SjRbGPaEGBLhzeKPRYam877ulEzKKPsVLh
         3vd8XkMDbuhQzE8HY7gsEd2DT/2KL8iVwhMnLSlJrte0YeIB/e7o5VbbuRTVyqF3HBZS
         2W6pvFq4ztiko+ptkRHDZ0vFgjsrcnJ1A5EI3yg1Yx2wXGqaPqiP3f6x8GnXIaSdprEX
         XXeRmE6MnbfErGhGKyBxcYiz2SpG55MITiZ9sMp+sOxwBNPsB2klNnXbmA6ERGAk34aL
         wEUQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790104995; x=1790709795; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bWXycRkvEhooYynfgtJMUHspQSrP76XAP+DtRk1GwMY=;
        b=q0tV4/sPqAUD2VJNJJGEjfaAGb/ssRfjz2QyuSpZw3vE9UOj2y/syPuCfXnyqrvxo2
         0zSjgUKI/mcIvofxVuuizs2cY4mlRlGERqOtgHUl7+bcBK3cub60G4Ry3HPIcFvU9yI2
         OzA6vH/3zStowi/z6D9M1UBN6QgV0eDNUjKIh5zJ2SvggR9QRfOQ2rKdSz0vK5hld948
         JwNKfjRWdYX+wHiBknAoFG0tgcYwH7WvSt5mN8FWGGJJnpqj3jRB+8iIv7ggum4X1rQU
         l/wEvLowCOnS9v+MAKLpMp04Y8fLL52LcWVVdbJ5Tervq3m06nanqfFluTB4h+eOO31f
         8/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790104995; x=1790709795;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bWXycRkvEhooYynfgtJMUHspQSrP76XAP+DtRk1GwMY=;
        b=l4u1PSgh+Q01R1uBL7wljEAzAgu3Yl24Q7+UUSoV9x10Uo5cpVkCRO9GMSFw0Z2Jbv
         +12aG5Oxgvgbv9pD9cx+qjfCBhuC5V0yw8ex0/UitCUcQboACU7tETradBaU3RxAQVZN
         FY6XCB2Z1X9Tfyu774GLwO1vdBV8sDG4YTwgdn6nLH7Z51/cRF09Xwzhb0CnXH3nuO79
         vHNScQpZzk5tEo5gotEi5av4rwzo8rKszDgZ3k9DpKkKOpXL+8klSiKFFMf+eGLbB5vE
         EreJPLwPxbvxNL+serV4QCbBpFk1ptcomEgbSI9WMqAYc+QibmFaoxjURg5HBIFUOik5
         G5WQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSEJhPTJLmj+sL7/7DYptkIhDx2gYTQT9LJBU0oFPUpyzKCCXFizn7Ljkw3+WiuxefR11VLDHZC4s=@lists.xenproject.org
X-Gm-Message-State: AFuF++kUtfCJzhf2RBxoMjSllejYJH/LfRJgF+wzhbY1bOlUmdQHMzK9
	iqDoVSIUc23fIcl+WkStzra6avmSOD0+hc4jX319r5VAsN35W3fHE5khl5boXcWQtgrslw4UzpP
	1qAA3bakS6E0y8gLM+DURteGRZN4KKKJrYAVy4Qik
X-Gm-Gg: AYBFou00FGmvo62JCZ+5GvXAuqTBcnyfJ5qO8Ph1M1dd4aFcyiQdH+h/xkkqn5K4su2
	KwYih5ozOuMRxvqnEgszJoQMt67h8Q+Kb3S8bwC1SihtkghH/NkGvCtwIiCsid3UBjee0AOWsVA
	jJhPAYPZsx5POV7xf8vdb/bevN6o8FsHp0WtGJFUKomxPxWFzeSf/Y+PMOV1CZWYLXgksyHXQCW
	mGuQ7EXOb5cNIeWi5x2efoL52quZ316w/jDQTgWk6oQXKTZvk9bwHTUF9X2mYovXMOaEfaEwl4f
	i/MRgSy0ZFZ1LaOOROMYaaHXFs8wQ8lB1PNf0VWj3+nIdZdZcMbrAn2nFVqEr9YGm/rDQDr8Rd4
	+o81WeUDxOsE/RYVJ7yCT1jl/VL99LgMw5MCnxR/C
X-Received: by 2002:a05:6512:1301:b0:5ae:b726:5f1f with SMTP id
 2adb3069b0e04-5b8d8848194mr29002e87.8.1790104994064; Tue, 22 Sep 2026
 12:23:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260916115159.1938195-1-aik@amd.com> <20260916115159.1938195-18-aik@amd.com>
In-Reply-To: <20260916115159.1938195-18-aik@amd.com>
From: Jianxiong Gao <jxgao@google.com>
Date: Tue, 22 Sep 2026 12:22:45 -0700
X-Gm-Features: AcwNN1UxkcAsiONLLRx4-Onp4JXfCAvcJEHnQ3RWuM6d-nkITizrfWrwxkArT4o
Message-ID: <CAMGD6P38zYT8FzkFHoaKNEL0tVErK7G+ZLPMzgazAmVoMcD=yQ@mail.gmail.com>
Subject: Re: [RFC PATCH kernel 17/17] x86/sev: Flush IOMMU TLB for trusted devices
To: Alexey Kardashevskiy <aik@amd.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-pci@vger.kernel.org, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ashish Kalra <ashish.kalra@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Bjorn Helgaas <bhelgaas@google.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jini Susan George <jinisusan.george@amd.com>, 
	Kees Cook <kees@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Nikunj A Dadhania <nikunj@amd.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Eric Biggers <ebiggers@kernel.org>, 
	Kim Phillips <kim.phillips@amd.com>, Joerg Roedel <jroedel@suse.de>, 
	Ethan Nelson-Moore <enelsonmoore@gmail.com>, "Tycho Andersen (AMD)" <tycho@kernel.org>, 
	Liam Merwick <liam.merwick@oracle.com>, Michael Kerrisk <mtk.manpages@gmail.com>, 
	Suresh Siddha <suresh.b.siddha@intel.com>, Xiaotian Feng <dfeng@redhat.com>, 
	Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>, Andi Kleen <ak@linux.intel.com>, 
	Kiryl Shutsemau <kas@kernel.org>, Tony Luck <tony.luck@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Xu Yilun <yilun.xu@linux.intel.com>, 
	=?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>, 
	Jonathan Cameron <jic23@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>, Ian Campbell <ian.campbell@citrix.com>, 
	Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>, Petr Tesarik <ptesarik@suse.com>, 
	David Howells <dhowells@redhat.com>, Haavard Skinnemoen <hskinnemoen@atmel.com>, 
	Kenji Kaneshige <kaneshige.kenji@jp.fujitsu.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Christian Marangi <ansuelsmth@gmail.com>, Dave Jiang <dave.jiang@intel.com>, 
	Michael Kelley <mhklinux@outlook.com>, Ilias Stamatis <ilstam@amazon.com>, 
	Sumanth Korikkar <sumanthk@linux.ibm.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Toshi Kani <toshi.kani@hp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Vinod Koul <vkoul@kernel.org>, Jiang Liu <jiang.liu@linux.intel.com>, 
	Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, Palmer Dabbelt <palmerdabbelt@google.com>, 
	linux-coco@lists.linux.dev, xen-devel@lists.xenproject.org, 
	iommu@lists.linux.dev, linux-mm@kvack.org, aik@ozlabs.ru, 
	Santosh Shukla <santosh.shukla@amd.com>, "Pratik R . Sampat" <prsampat@amd.com>, 
	Scott Soule Cheloha <scott.cheloha@amd.com>, Ackerley Tng <ackerleytng@google.com>, 
	Fuad Tabba <tabba@google.com>, Darwin Guo <darwinguo@google.com>, Shruti <shrutiss@google.com>, 
	Saurabh Singh <saurabhsinghs@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-16d1c6/1790104995-1FACA77B-F67446D3/0/0
X-purgate-type: clean
X-purgate-size: 13449

On Wed, Sep 16, 2026 at 5:07 AM Alexey Kardashevskiy <aik@amd.com> wrote:
> +static int alloc_iommu_tlb_flush_ghcb_pages(void)
> +{
> +       unsigned int cpu;
> +       struct page *pg;
> +       void *p;
> +
> +       /*
> +        * Allocate per CPU pages while encrypted DMA is not happening ye=
t
> +        * and smashing is cheap.
> +        */
> +       for_each_possible_cpu(cpu) {
> +               if (per_cpu(iommu_tlb_flush_ghcb_page, cpu))
> +                       continue;
> +
> +               pg =3D alloc_pages_node(cpu_to_node(cpu), GFP_KERNEL, 0);
> +               if (!pg)
> +                       return -ENOMEM;
> +
> +               p =3D page_to_virt(pg);
> +               /* Trigger psmash in the host os now to avoid psmash race=
 later */
> +               snp_set_memory_shared((unsigned long)p, 1);
> +               snp_set_memory_private((unsigned long)p, 1);
> +               per_cpu(iommu_tlb_flush_ghcb_page, cpu) =3D p;
> +       }
> +
> +       return 0;
> +}
>
>  int sev_tio_op(u32 guest_rid, unsigned int op, u64 *fw_err, u64 *tdi_id)
>  {
> @@ -111,6 +142,24 @@ int sev_tio_op(u32 guest_rid, unsigned int op, u64 *=
fw_err, u64 *tdi_id)
>         struct ghcb *ghcb;
>         int ret;
>
> +       if (!(sev_hv_features & GHCB_HV_FT_SNP_SEV_TIO))
> +               return -EPERM;
> +
> +       if (op =3D=3D SVM_VMGEXIT_SEV_TIO_OP_RUN || op =3D=3D SVM_VMGEXIT=
_SEV_TIO_OP_STOP) {
> +               if (!(sev_hv_features & GHCB_HV_FT_SNP_IOMMU_TLB_FLUSH))
> +                       return -EPERM;
> +
> +               if (op =3D=3D SVM_VMGEXIT_SEV_TIO_OP_RUN) {
> +                       if (atomic_inc_return(&sev_tio_devices_num) =3D=
=3D 1) {
> +                               ret =3D alloc_iommu_tlb_flush_ghcb_pages(=
);
> +                               if (ret)
> +                                       return ret;
> +                       }
> +               } else if (atomic_dec_return(&sev_tio_devices_num) =3D=3D=
 0) {
> +                       /* Do cleanup or leave it like this? */
> +               }
> +       }

Hi Alexey,

When testing this series and accepting a locked TDI in the guest
(echo 1 > /sys/bus/pci/devices/.../tsm/accept), the guest immediately
terminates with 0x1:0xd (SEV_TERM_SET_LINUX, GHCB_TERM_IOMMUTLB_FLUSH).

In sev_tio_op(), sev_tio_devices_num is incremented from 0 to 1 before
alloc_iommu_tlb_flush_ghcb_pages() allocates and initializes the per-CPU
iommu_tlb_flush_ghcb_page buffers:

1. atomic_inc_return(&sev_tio_devices_num) sets sev_tio_devices_num =3D 1
   while iommu_tlb_flush_ghcb_page is still NULL on all CPUs.
2. alloc_iommu_tlb_flush_ghcb_pages() allocates p for cpu =3D 0 and calls
   snp_set_memory_shared((unsigned long)p, 1) to pre-smash the 2M page
   before per_cpu(iommu_tlb_flush_ghcb_page, cpu) is assigned (and before
   other CPUs' pages are allocated, in case this task is running on cpu > 0=
).
3. snp_set_memory_shared() -> __set_pages_state() sees
   atomic_read(&sev_tio_devices_num) !=3D 0 and calls ghcb_flush_iommu_tlb(=
).
4. ghcb_flush_iommu_tlb() reads this_cpu_read(iommu_tlb_flush_ghcb_page),
   gets NULL, and returns -ENOMEM.
5. __set_pages_state() treats the non-zero return as fatal and calls
   sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_IOMMUTLB_FLUSH).

Calling alloc_iommu_tlb_flush_ghcb_pages() before incrementing
sev_tio_devices_num avoids triggering ghcb_flush_iommu_tlb() while the
per-CPU pages are still being pre-smashed and initialized:

--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -150,13 +150,12 @@ int sev_tio_op(...)
             return -EPERM;

         if (op =3D=3D SVM_VMGEXIT_SEV_TIO_OP_RUN) {
-            if (atomic_inc_return(&sev_tio_devices_num) =3D=3D 1) {
-                ret =3D alloc_iommu_tlb_flush_ghcb_pages();
-                if (ret)
-                    return ret;
-            }
-        } else if (atomic_dec_return(&sev_tio_devices_num) =3D=3D 0) {
-            /* Do cleanup or leave it like this? */
+            ret =3D alloc_iommu_tlb_flush_ghcb_pages();
+            if (ret)
+                return ret;
+            atomic_inc(&sev_tio_devices_num);
+        } else {
+            atomic_dec_if_positive(&sev_tio_devices_num);
         }
     }

On Wed, Sep 16, 2026 at 5:07=E2=80=AFAM Alexey Kardashevskiy <aik@amd.com> =
wrote:
>
> IOMMU performs RMP checks when SNP is enabled, the results are
> cached along with the IOMMU translations. When a VM lowers permission
> of a mapped page (moves to a lower VMPL level or from read+write to
> read-only or private to shared), the cached RMP check results require
> invalidation.
>
> At the moment the only way to invalidate IOMMU cache is the RMPUPDATE
> instruction which flushes all IOMMU TLBs. It is a host privileged
> instruction so a VM needs a way to ensure the host has done it.
> Note that the guest's RMPADJUST/PVALIDATE do not flush IOMMU TLBs.
>
> The host implements a new "IOMMU TLB Flush" VMGEXIT code which is
> advertised via bit#11 in the GHCB Hypervisor capabilities.
>
> Use RMPUPDATE in the following way:
> - allocate a page per VCPU (to allow lockless flushing);
> - When invalidation is needed, copy two patterns (A and B) to the page;
> - invalidate the page so the host can make it shared;
> - use new GHCB call to request RMPUPDATE on the host;
> - the host makes the page shared;
> - the host clears pattern A;
> - the host makes the page private again;
> - the host returns to the guest;
> - check if pattern A has changed and pattern B has not;
> - if the above failed, panic().
>
> The patterns are located far enough to not hit the same cache line to
> work with the cipher text hiding feature.
>
> The host can choose to not execute the request, WARN_ON if this
> is the case. Further patches will attempt to handle this in other way.
>
> Signed-off-by: Alexey Kardashevskiy <aik@amd.com>
> ---
>  arch/x86/include/asm/sev-common.h |  2 +
>  arch/x86/include/uapi/asm/svm.h   |  3 +
>  arch/x86/coco/sev/core.c          | 92 ++++++++++++++++++++
>  3 files changed, 97 insertions(+)
>
> diff --git a/arch/x86/include/asm/sev-common.h b/arch/x86/include/asm/sev=
-common.h
> index ff763c3c5d63..51abf8d061fa 100644
> --- a/arch/x86/include/asm/sev-common.h
> +++ b/arch/x86/include/asm/sev-common.h
> @@ -138,6 +138,7 @@ enum psc_op {
>  #define GHCB_HV_FT_SNP_AP_CREATION     BIT_ULL(1)
>  #define GHCB_HV_FT_SNP_MULTI_VMPL      BIT_ULL(5)
>  #define GHCB_HV_FT_SNP_SEV_TIO         BIT_ULL(7)
> +#define GHCB_HV_FT_SNP_IOMMU_TLB_FLUSH BIT_ULL(11)
>
>  /*
>   * SNP Page State Change NAE event
> @@ -210,6 +211,7 @@ struct snp_psc_desc {
>  #define GHCB_TERM_SECURE_TSC           10      /* Secure TSC initializat=
ion failed */
>  #define GHCB_TERM_SVSM_CA_REMAP_FAIL   11      /* SVSM is present but CA=
 could not be remapped */
>  #define GHCB_TERM_SAVIC_FAIL           12      /* Secure AVIC-specific f=
ailure */
> +#define GHCB_TERM_IOMMUTLB_FLUSH       13      /* IOMMUTLB flush failed =
for SEV-TIO device */
>
>  #define GHCB_RESP_CODE(v)              ((v) & GHCB_MSR_INFO_MASK)
>
> diff --git a/arch/x86/include/uapi/asm/svm.h b/arch/x86/include/uapi/asm/=
svm.h
> index 93597ad492bf..269050942c8e 100644
> --- a/arch/x86/include/uapi/asm/svm.h
> +++ b/arch/x86/include/uapi/asm/svm.h
> @@ -160,6 +160,8 @@
>  #define SVM_VMGEXIT_SEV_TIO_OP_UNBIND  1
>  #define SVM_VMGEXIT_SEV_TIO_OP_RUN     2
>  #define SVM_VMGEXIT_SEV_TIO_OP_STOP    3
> +#define SVM_VMGEXIT_IOMMU_TLB_FLUSH            0x80000022ull
> +#define SVM_VMGEXIT_IOMMU_TLB_FLUSH_NO_ACTION  1
>  #define SVM_VMGEXIT_HV_FEATURES                        0x8000fffdull
>  #define SVM_VMGEXIT_TERM_REQUEST               0x8000fffeull
>  #define SVM_VMGEXIT_TERM_REASON(reason_set, reason_code)       \
> @@ -285,6 +287,7 @@
>         { SVM_VMGEXIT_AP_CREATION,      "vmgexit_ap_creation" }, \
>         { SVM_VMGEXIT_SEV_TIO_GR,       "vmgexit_sev_tio_guest_request" }=
, \
>         { SVM_VMGEXIT_SEV_TIO_OP,       "vmgexit_sev_tio_op" }, \
> +       { SVM_VMGEXIT_IOMMU_TLB_FLUSH, "vmgexit_sev_tio_iommu_tlb_flush" =
}, \
>         { SVM_VMGEXIT_HV_FEATURES,      "vmgexit_hypervisor_feature" }, \
>         { SVM_EXIT_ERR,         "invalid_guest_state" }
>
> diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
> index ed0e4546d5e5..aa5a3abb4796 100644
> --- a/arch/x86/coco/sev/core.c
> +++ b/arch/x86/coco/sev/core.c
> @@ -44,6 +44,7 @@
>  #include <asm/cpuid/api.h>
>  #include <asm/cmdline.h>
>  #include <asm/msr.h>
> +#include <asm/archrandom.h>
>
>  #include "internal.h"
>
> @@ -103,6 +104,36 @@ static unsigned long snp_tsc_freq_khz __ro_after_ini=
t;
>
>  DEFINE_PER_CPU(struct sev_es_runtime_data*, runtime_data);
>  DEFINE_PER_CPU(struct sev_es_save_area *, sev_vmsa);
> +DEFINE_PER_CPU(u8 *, iommu_tlb_flush_ghcb_page);
> +static atomic_t sev_tio_devices_num;
> +
> +static int alloc_iommu_tlb_flush_ghcb_pages(void)
> +{
> +       unsigned int cpu;
> +       struct page *pg;
> +       void *p;
> +
> +       /*
> +        * Allocate per CPU pages while encrypted DMA is not happening ye=
t
> +        * and smashing is cheap.
> +        */
> +       for_each_possible_cpu(cpu) {
> +               if (per_cpu(iommu_tlb_flush_ghcb_page, cpu))
> +                       continue;
> +
> +               pg =3D alloc_pages_node(cpu_to_node(cpu), GFP_KERNEL, 0);
> +               if (!pg)
> +                       return -ENOMEM;
> +
> +               p =3D page_to_virt(pg);
> +               /* Trigger psmash in the host os now to avoid psmash race=
 later */
> +               snp_set_memory_shared((unsigned long)p, 1);
> +               snp_set_memory_private((unsigned long)p, 1);
> +               per_cpu(iommu_tlb_flush_ghcb_page, cpu) =3D p;
> +       }
> +
> +       return 0;
> +}
>
>  int sev_tio_op(u32 guest_rid, unsigned int op, u64 *fw_err, u64 *tdi_id)
>  {
> @@ -111,6 +142,24 @@ int sev_tio_op(u32 guest_rid, unsigned int op, u64 *=
fw_err, u64 *tdi_id)
>         struct ghcb *ghcb;
>         int ret;
>
> +       if (!(sev_hv_features & GHCB_HV_FT_SNP_SEV_TIO))
> +               return -EPERM;
> +
> +       if (op =3D=3D SVM_VMGEXIT_SEV_TIO_OP_RUN || op =3D=3D SVM_VMGEXIT=
_SEV_TIO_OP_STOP) {
> +               if (!(sev_hv_features & GHCB_HV_FT_SNP_IOMMU_TLB_FLUSH))
> +                       return -EPERM;
> +
> +               if (op =3D=3D SVM_VMGEXIT_SEV_TIO_OP_RUN) {
> +                       if (atomic_inc_return(&sev_tio_devices_num) =3D=
=3D 1) {
> +                               ret =3D alloc_iommu_tlb_flush_ghcb_pages(=
);
> +                               if (ret)
> +                                       return ret;
> +                       }
> +               } else if (atomic_dec_return(&sev_tio_devices_num) =3D=3D=
 0) {
> +                       /* Do cleanup or leave it like this? */
> +               }
> +       }
> +
>         /* __sev_get_ghcb() needs IRQs disabled because it uses per-CPU G=
HCB. */
>         guard(irqsave)();
>
> @@ -347,6 +396,42 @@ static int vmgexit_psc(struct ghcb *ghcb, struct snp=
_psc_desc *desc)
>         return ret;
>  }
>
> +static int ghcb_flush_iommu_tlb(struct ghcb *ghcb)
> +{
> +       /* AES encrypts with 16 byte blocks */
> +       unsigned long s1[BITS_TO_LONGS(128)], s2[BITS_TO_LONGS(128)];
> +       void *p =3D this_cpu_read(iommu_tlb_flush_ghcb_page), *p2;
> +       struct es_em_ctxt ctxt;
> +       int ret;
> +
> +       if (!p)
> +               return -ENOMEM;
> +
> +       /* Keep patterns apart far enough to not share the same cache lin=
e */
> +       p2 =3D (u8 *) p + 2048;
> +
> +       vc_ghcb_invalidate(ghcb);
> +
> +       BUILD_BUG_ON(ARRAY_SIZE(s1) !=3D 2);
> +       if (!rdrand_long(s1) || !rdrand_long(s1 + 1) ||
> +           !rdrand_long(s2) || !rdrand_long(s2 + 1))
> +               return -EFAULT;
> +
> +       memcpy(p, s1, sizeof(s1));
> +       memcpy(p2, s2, sizeof(s2));
> +
> +       pvalidate((unsigned long) p, RMP_PG_SIZE_4K, false);
> +       ret =3D sev_es_ghcb_hv_call(ghcb, &ctxt, SVM_VMGEXIT_IOMMU_TLB_FL=
USH, __pa(p), 0);
> +       pvalidate((unsigned long) p, RMP_PG_SIZE_4K, true);
> +
> +       /* Ensure that the host change is visible */
> +       smp_mb();
> +
> +       if (!memcmp(p, s1, sizeof(s1)) || memcmp(p2, s2, sizeof(s2)))
> +               return -EFAULT;
> +
> +       return 0;
> +}
>  static unsigned long __set_pages_state(struct snp_psc_desc *data, unsign=
ed long vaddr,
>                                        unsigned long vaddr_end, int op)
>  {
> @@ -404,6 +489,13 @@ static unsigned long __set_pages_state(struct snp_ps=
c_desc *data, unsigned long
>         if (!ghcb || vmgexit_psc(ghcb, data))
>                 sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_PSC);
>
> +       if (atomic_read(&sev_tio_devices_num)) {
> +               int ret =3D ghcb_flush_iommu_tlb(ghcb);
> +
> +               if (ret)
> +                       sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_IO=
MMUTLB_FLUSH);
> +       }
> +
>         __sev_put_ghcb(&state);
>
>         local_irq_restore(flags);
> --
> 2.55.0
>
>


--=20
Jianxiong Gao

