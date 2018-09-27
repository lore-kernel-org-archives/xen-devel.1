From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/3] [not-for-unstable] xen/arm: vgic-v3:
 Delay the initialization of the domain information
Date: Thu, 27 Sep 2018 16:11:18 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1809271602450.11573@sstabellini-ThinkPad-X260>
References: <20180904192153.17210-1-julien.grall@arm.com>
 <20180904192153.17210-2-julien.grall@arm.com>
 <d6a3666c-0e8d-1707-f0de-b7a5ad1ba11a@arm.com>
 <0da3032f-9257-4ee2-7cb5-cabe0d12bdcc@citrix.com>
 <alpine.DEB.2.10.1809251342040.15006@sstabellini-ThinkPad-X260>
 <bdd02e05-75f3-e853-2700-ae51becd358f@arm.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-277536536-1538089415=:11573"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gmte=mj=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1g5fRN-0001lf-54
 for xen-devel@lists.xenproject.org; Thu, 27 Sep 2018 23:11:25 +0000
In-Reply-To: <bdd02e05-75f3-e853-2700-ae51becd358f@arm.com>
Content-ID: <alpine.DEB.2.10.1809271603530.11573@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, andre.przywara@arm.com, Stefano Stabellini <sstabellini@kernel.org>, shameerali.kolothum.thodi@huawei.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-277536536-1538089415=:11573
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1809271603531.11573@sstabellini-ThinkPad-X260>

On Wed, 26 Sep 2018, Julien Grall wrote:
> Hi Stefano,
> 
> On 09/25/2018 09:45 PM, Stefano Stabellini wrote:
> > On Tue, 4 Sep 2018, Andrew Cooper wrote:
> > > On 04/09/18 20:35, Julien Grall wrote:
> > > > Hi,
> > > > 
> > > > On 09/04/2018 08:21 PM, Julien Grall wrote:
> > > > > A follow-up patch will require to know the number of vCPUs when
> > > > > initializating the vGICv3 domain structure. However this information
> > > > > is
> > > > > not available at domain creation. This is only known once
> > > > > XEN_DOMCTL_max_vpus is called for that domain.
> > > > > 
> > > > > In order to get the max vCPUs around, delay the domain part of the
> > > > > vGIC
> > > > > v3 initialization until the first vCPU of the domain is initialized.
> > > > > 
> > > > > Signed-off-by: Julien Grall <julien.grall@arm.com>
> > > > > 
> > > > > ---
> > > > > 
> > > > > Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> > > > > 
> > > > > This is nasty but I can't find a better way for Xen 4.11 and older.
> > > > > This
> > > > > is not necessary for unstable as the number of vCPUs is known at
> > > > > domain
> > > > > creation.
> > > > > 
> > > > > Andrew, I have CCed you to know whether you have a better idea where
> > > > > to
> > > > > place this call on Xen 4.11 and older.
> > > > 
> > > > I just noticed that d->max_vcpus is initialized after
> > > > arch_domain_create. So without this patch on Xen 4.12, it will not work.
> > > > 
> > > > This is getting nastier because arch_domain_init is the one initialize
> > > > the value returned by dom0_max_vcpus. So I am not entirely sure what
> > > > to do here.
> > > 
> > > The positioning after arch_domain_create() is unfortunate, but I
> > > couldn’t manage better with ARM's current behaviour and Jan's insistence
> > > that the allocation of d->vcpu was common.  I'd prefer if the dependency
> > > could be broken and the allocation moved earlier.
> > > 
> > > One option might be to have an arch_check_domainconfig() (or similar?)
> > > which is called very early on and can sanity check the values, including
> > > cross-checking the vgic and max_vcpus settings?  It could even be
> > > responsible for mutating XEN_DOMCTL_CONFIG_GIC_NATIVE into the correct
> > > real value.
> > > 
> > > As for your patch here, its a gross hack, but its probably the best
> > > which can be done.
> > 
> > *Sighs*
> > If that is what we have to do, it is as ugly as hell, but that is what
> > we'll do.
> 
> This is the best we can do with the current code base. I think it would be
> worth reworking the code to make it nicer. I will add it in my TODO list.
> 
> > 
> > My only suggestion to marginally improve it would be instead of:
> > 
> > > +    if ( v->vcpu_id == 0 )
> > > +    {
> > > +        rc = vgic_v3_real_domain_init(d);
> > > +        if ( rc )
> > > +            return rc;
> > > +    }
> > 
> > to check on d->arch.vgic.rdist_regions instead:
> > 
> >        if ( d->arch.vgic.rdist_regions == NULL )
> >        {
> >           // initialize domain
> 
> I would prefer to keep v->vcpu_id == 0 just in case we end up to re-order the
> allocation in the future.

I was suggesting to check on (rdist_regions == NULL) exactly for
potential re-ordering, in case in the future we end up calling
vcpu_vgic_init differently and somehow vcpu_init(vcpu1) is done before
before vcpu_init(vcpu0). Ideally we would like a way to check that
vgic_v3_real_domain_init has been called before and I thought
rdist_regions == NULL could do just that...
--8323329-277536536-1538089415=:11573
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-277536536-1538089415=:11573--
