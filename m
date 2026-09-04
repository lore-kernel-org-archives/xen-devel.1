Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D6FC79F80
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 09:34:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408061.1640777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2QJJ-0007p0-4W; Fri, 04 Sep 2026 09:34:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408061.1640777; Fri, 04 Sep 2026 09:34:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2QJJ-0007ot-1k; Fri, 04 Sep 2026 09:34:13 +0000
Received: by outflank-mailman (input) for mailman id 1408061;
 Fri, 04 Sep 2026 09:34:11 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a06bc4a637000c4f3@swg.vates.tech>)
 id 1x2QJH-0007on-Gt
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 09:34:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2QJG-00FgcY-Pg
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 11:34:10 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a06bc4a637000c4f3@swg.vates.tech>)
 id 6a9a9084-8faa-0a2a0a5109dd-0a2a450298a0-44
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 11:34:10 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a06bc4a637000c4f3@swg.vates.tech>)
 id 6a9a9092-6ca4-0a2a45020019-b9ff1c23af71-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 11:34:10 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a06bc4a637000c4f3.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 04 Sep 2026 09:34:04 +0000
Received: from l14 (areims-651-1-80-194.w90-18.abo.wanadoo.fr [90.18.187.194])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 08E2F839EC;
 Fri,  4 Sep 2026 11:34:04 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=ZhX4EDNIARcb8Zbx+r+dJ/oX+jhrQpz7grwjIaOmJ6I=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=rcp+M/lOv3UklJupfHaP51ZgUKgoxy53lk+0nSuFMnBvikWBBf8/wcqsO4xmRLyjTwhYFwREc
 9sZvrx7fOh6NnQ8MG8YjueU9DwLX+xUKFUUGomwNHnhqX2BR1UyPOtjrJlNNAERcezXpXvdcGIG
 Mg8dF5V0uNDTZU/XhHNoAJezdLRNp4Qjk5UduBsHACndVen+BG/i1w3n4thJvJJ07xQm3vhLwRp
 LPufJV8awBQMKHU2GDDvs9H5GdDA0yGAP9+HDzMi5hQcrSH/GOFVBmaawP4kIr/PWc9wGVrTP89
 mai9b6zthSYIHNhoUPuJnitGvoyEJlTkSaDqENVBuTFg==
X-Zone-Loop: 5a9a9e85e6eaf96390b19eeefac478a68e8c99480998
x-campaign-type: default
x-transaction-id: 9f619beb-d758-4c96-b549-7f1b729655df
x-swg-uid: 01-3ce68425-65b8-4ac0-88f4-743cc9e7b5ed
X-Mailer: Sweego
Message-ID:
 <1788514444.8631fc262581453bbf619ec5b2062170.1a06bc4a637000c4f3@vates.tech>
x-swg-bid: 1788514444.8631fc262581453bbf619ec5b2062170.1a06bc4a637000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 4 Sep 2026 11:34:03 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Julian Vetter <julian.vetter@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v5 09/11] x86/dmop: Add XEN_DMOP_{,un}bind_pt_msi_irq
References: <1788444605.8631fc262581453bbf619ec5b2062170.1a0679afc0d000c4f3@vates.tech>
 <1788444859.8631fc262581453bbf619ec5b2062170.1a0679edb8f000c4f3@vates.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1788444859.8631fc262581453bbf619ec5b2062170.1a0679edb8f000c4f3@vates.tech>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.3656.11dda1aec1cb4d89.1a06bc4a3c6.89ab1ff4e9f21543=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788514444230
X-purgate-ID: tlsNG-720697/1788514450-F14AE2AC-B8522344/0/0
X-purgate-type: clean
X-purgate-size: 8118

---=Part.3656.11dda1aec1cb4d89.1a06bc4a3c6.89ab1ff4e9f21543=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 03, 2026 at 04:14:07PM +0200, Julian Vetter wrote:
> Add two device-model ops that bind / unbind a passthrough interrupt to a
> guest MSI from the raw MSI message (address + data) the guest
> programmed=2E Xen decodes the message itself via pt_irq_bind_msi(), so t=
he
> emulator needs no knowledge of the MSI layout and, in particular,
> extended (15-bit) destination IDs are handled without emulator changes=
=2E
>=20
> The MSI-X table base is passed as a guest-physical address=2E Fields are
> named msg_addr / msg_data / pirq, and the flag is
> XEN_DMOP_MSI_BIND_UNMASKED=2E The unbind op only requires a valid pirq
> mapping, not current IRQ permission, so an emulator can remove a binding
> even after the device has been deassigned=2E
>=20
> With this in place, PT_IRQ_TYPE_MSI is removed from
> XEN_DOMCTL_{,un}bind_pt_irq (returns -EINVAL) and from
> pt_irq_create_bind()=2E libxc's xc_domain_{update,unbind}_msi_irq() and
> vPCI already funnel through pt_irq_bind_msi()=2E This is an incompatible
> change for device models still using the domctl sub-case (noted in
> CHANGELOG=2Emd and public/domctl=2Eh)=2E

"Incompatible" you say? Is there any patch for QEMU that I missed?

> libxendevicemodel gains xendevicemodel_{,un}bind_pt_msi_irq() (map
> version VERS_1=2E5)=2E
>=20
> Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
> ---
> diff --git a/CHANGELOG=2Emd b/CHANGELOG=2Emd
> index aa1a777dd4=2E=2E76f5d06c91 100644
> --- a/CHANGELOG=2Emd
> +++ b/CHANGELOG=2Emd
> @@ -34,6 +34,9 @@ The format is based on [Keep a Changelog](https://keep=
achangelog=2Ecom/en/1=2E0=2E0/)
>   - On x86:
>     - Enable pf-fixup option by default for PVH dom0=2E
>     - The libxenguest bzImage loader now uses the system liblz4 library=
=2E
> +   - XEN_DOMCTL_{,un}bind_pt_irq no longer accept PT_IRQ_TYPE_MSI, devi=
ce
> +     models must bind passthrough MSIs via the new
> +     XEN_DMOP_{,un}bind_pt_msi_irq, which carry the raw MSI message=2E
> =20
>  ### Added
>   - Support for per-domain Xenstore quota in C xenstored (includes
> @@ -47,6 +50,9 @@ The format is based on [Keep a Changelog](https://keep=
achangelog=2Ecom/en/1=2E0=2E0/)
>     - Support for CPIO microcode in discrete multiboot modules=2E
>     - Introduce get-core-temp command to xenpm to query CPU temperatures=
 on
>       Intel platforms=2E
> +   - XEN_DMOP_{,un}bind_pt_msi_irq for binding passthrough MSIs from th=
e raw
> +     guest MSI message, enabling extended (15-bit) destination IDs for =
HVM
> +     guests whose device models opt in=2E

Also:
  - Introduce xendevicemodel_{,un}bind_pt_msi_irq() stable ABI as
    replacement of the unstable xc_domain_{update,unbind}_msi_irq()=2E
?

>   - On Arm:
>     - Support for guest suspend and resume to/from RAM via vPSCI=2E
> diff --git a/tools/include/xendevicemodel=2Eh b/tools/include/xendevicem=
odel=2Eh
> index 227e7fd810=2E=2E698d719119 100644
> --- a/tools/include/xendevicemodel=2Eh
> +++ b/tools/include/xendevicemodel=2Eh
> @@ -375,6 +375,36 @@ int xendevicemodel_nr_vcpus(
>   */
>  int xendevicemodel_restrict(xendevicemodel_handle *dmod, domid_t domid)=
;
> =20
> +/**
> + * This function binds a passthrough interrupt to a guest MSI, describe=
d by the
> + * raw MSI message (address and data) the guest programmed=2E Xen decod=
es the
> + * message itself, so the caller does not need to interpret it=2E
> + *
> + * @parm dmod a handle to an open devicemodel interface=2E
> + * @parm domid the domain id to be serviced=2E
> + * @parm pirq the pass-through IRQ (pirq)=2E
> + * @parm msg_addr the MSI message address, as programmed by the guest=
=2E
> + * @parm msg_data the MSI message data, as programmed by the guest=2E
> + * @parm gtable the MSI-X table base guest-physical address, or 0 for p=
lain MSI=2E
> + * @parm unmasked if non-zero, leave the IRQ unmasked after binding=2E
> + * @return 0 on success, -1 on failure=2E
> + */
> +int xendevicemodel_bind_pt_msi_irq(
> +    xendevicemodel_handle *dmod, domid_t domid, uint32_t pirq,
> +    uint64_t msg_addr, uint32_t msg_data, uint64_t gtable, int unmasked=
);

"gtable" I fell like it could have a better name=2E "guest table" feels a
bit generic and not really describing what the parameter is about=2E So is
a name like "msix_table" or "msix_base" or maybe "table_addr" since we
are in the context of msi or something a bit more descriptive? I'm not
completely sure what the MSI-X table is, so there's maybe another name
that would better described what the value is=2E If you still think
"gtable" is good enough, so be it=2E

Next, "unmasked", this one sound like it should be a `bool`, not an `int`=
=2E

> +
> +/**
> + * This function unbinds a passthrough interrupt previously bound with
> + * xendevicemodel_bind_pt_msi_irq=2E
> + *
> + * @parm dmod a handle to an open devicemodel interface=2E
> + * @parm domid the domain id to be serviced=2E
> + * @parm pirq the pass-through IRQ (pirq)=2E
> + * @return 0 on success, -1 on failure=2E
> + */
> +int xendevicemodel_unbind_pt_msi_irq(
> +    xendevicemodel_handle *dmod, domid_t domid, uint32_t pirq);

One last think on the header, could you move both prototype to just
after "xendevicemodel_inject_msi()" ? It feels like that would be a
slightly better placement within the header=2E

>  #endif /* XENDEVICEMODEL_H */
> =20
>  /*
> diff --git a/tools/libs/devicemodel/core=2Ec b/tools/libs/devicemodel/co=
re=2Ec
> index 8e619eeb0a=2E=2E274a8eb28b 100644
> --- a/tools/libs/devicemodel/core=2Ec
> +++ b/tools/libs/devicemodel/core=2Ec
> @@ -645,6 +645,44 @@ int xendevicemodel_nr_vcpus(
>      return 0;
>  }
> =20
> +int xendevicemodel_bind_pt_msi_irq(
> +    xendevicemodel_handle *dmod, domid_t domid, uint32_t pirq,
> +    uint64_t msg_addr, uint32_t msg_data, uint64_t gtable, int unmasked=
)
> +{
> +    struct xen_dm_op op;
> +    struct xen_dm_op_bind_pt_msi_irq *data;
> +
> +    memset(&op, 0, sizeof(op));
> +
> +    op=2Eop =3D XEN_DMOP_bind_pt_msi_irq;

This memset and first assignment can be replaced by:

    struct xen_dm_op op =3D {
      =2Eop =3D XEN_DMOP_bind_pt_msi_irq,
    };

;-)

> +    data =3D &op=2Eu=2Ebind_pt_msi_irq;
> +
> +    data->pirq =3D pirq;
> +    data->msg_data =3D msg_data;
> +    data->msg_addr =3D msg_addr;
> +    data->gtable =3D gtable;
> +    if ( unmasked )
> +        data->flags |=3D XEN_DMOP_MSI_BIND_UNMASKED;

That "data" variable feel a bit useless, and badly name (arguments or
parameters would have been a more descriptive)=2E I know that how the rest
of the file is styled, but I'd like to propose something a bit cleaner
and initialise the struct with all the values:

    struct xen_dm_op op =3D {
      =2Eop =3D XEN_DMOP_bind_pt_msi_irq,
      =2Eu=2Ebind_pt_msi_irq =3D {
        =2Epirq =3D pirq,
        =2Emsg_data =3D msg_data,
        =2Emsg_addr =3D msg_addr,
        =2Egtable =3D gtable,
        =2Eflags =3D unmasked ? XEN_DMOP_MSI_BIND_UNMASKED : 0,
      }
    };

There's already quite a few use of this way of initialising the
parameters of an hypercall in the different libraries=2E

> +
> +    return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
> +}
> +
> +int xendevicemodel_unbind_pt_msi_irq(
> +    xendevicemodel_handle *dmod, domid_t domid, uint32_t pirq)
> +{
> +    struct xen_dm_op op;
> +    struct xen_dm_op_unbind_pt_msi_irq *data;
> +
> +    memset(&op, 0, sizeof(op));
> +
> +    op=2Eop =3D XEN_DMOP_unbind_pt_msi_irq;
> +    data =3D &op=2Eu=2Eunbind_pt_msi_irq;
> +
> +    data->pirq =3D pirq;
> +
> +    return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
> +}

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.3656.11dda1aec1cb4d89.1a06bc4a3c6.89ab1ff4e9f21543=---

