From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/3] [not-for-unstable] xen/arm: vgic-v3:
 Delay the initialization of the domain information
Date: Tue, 25 Sep 2018 13:45:53 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1809251342040.15006@sstabellini-ThinkPad-X260>
References: <20180904192153.17210-1-julien.grall@arm.com>
 <20180904192153.17210-2-julien.grall@arm.com>
 <d6a3666c-0e8d-1707-f0de-b7a5ad1ba11a@arm.com>
 <0da3032f-9257-4ee2-7cb5-cabe0d12bdcc@citrix.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-632860659-1537908237=:15006"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=498c=mh=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1g4uDV-00045Q-0M
 for xen-devel@lists.xenproject.org; Tue, 25 Sep 2018 20:45:57 +0000
In-Reply-To: <0da3032f-9257-4ee2-7cb5-cabe0d12bdcc@citrix.com>
Content-ID: <alpine.DEB.2.10.1809251344230.15006@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org, shameerali.kolothum.thodi@huawei.com, andre.przywara@arm.com
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-632860659-1537908237=:15006
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1809251344231.15006@sstabellini-ThinkPad-X260>

On Tue, 4 Sep 2018, Andrew Cooper wrote:
> On 04/09/18 20:35, Julien Grall wrote:
> > Hi,
> >
> > On 09/04/2018 08:21 PM, Julien Grall wrote:
> >> A follow-up patch will require to know the number of vCPUs when
> >> initializating the vGICv3 domain structure. However this information is
> >> not available at domain creation. This is only known once
> >> XEN_DOMCTL_max_vpus is called for that domain.
> >>
> >> In order to get the max vCPUs around, delay the domain part of the vGIC
> >> v3 initialization until the first vCPU of the domain is initialized.
> >>
> >> Signed-off-by: Julien Grall <julien.grall@arm.com>
> >>
> >> ---
> >>
> >> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> >>
> >> This is nasty but I can't find a better way for Xen 4.11 and older. This
> >> is not necessary for unstable as the number of vCPUs is known at domain
> >> creation.
> >>
> >> Andrew, I have CCed you to know whether you have a better idea where to
> >> place this call on Xen 4.11 and older.
> >
> > I just noticed that d->max_vcpus is initialized after
> > arch_domain_create. So without this patch on Xen 4.12, it will not work.
> >
> > This is getting nastier because arch_domain_init is the one initialize
> > the value returned by dom0_max_vcpus. So I am not entirely sure what
> > to do here.
> 
> The positioning after arch_domain_create() is unfortunate, but I
> couldn’t manage better with ARM's current behaviour and Jan's insistence
> that the allocation of d->vcpu was common.  I'd prefer if the dependency
> could be broken and the allocation moved earlier.
> 
> One option might be to have an arch_check_domainconfig() (or similar?)
> which is called very early on and can sanity check the values, including
> cross-checking the vgic and max_vcpus settings?  It could even be
> responsible for mutating XEN_DOMCTL_CONFIG_GIC_NATIVE into the correct
> real value.
> 
> As for your patch here, its a gross hack, but its probably the best
> which can be done.

*Sighs*
If that is what we have to do, it is as ugly as hell, but that is what
we'll do.

My only suggestion to marginally improve it would be instead of:

> +    if ( v->vcpu_id == 0 )
> +    {
> +        rc = vgic_v3_real_domain_init(d);
> +        if ( rc )
> +            return rc;
> +    }

to check on d->arch.vgic.rdist_regions instead:

      if ( d->arch.vgic.rdist_regions == NULL )
      {
         // initialize domain

--8323329-632860659-1537908237=:15006
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-632860659-1537908237=:15006--
