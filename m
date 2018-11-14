From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 10/18] xen/arm: Implement GIC suspend/resume
 functions (gicv2 only)
Date: Wed, 14 Nov 2018 14:18:12 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1811141410250.302@sstabellini-ThinkPad-X260>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <1542022244-22977-11-git-send-email-mirela.simonovic@aggios.com>
 <746b0ad8-4ce1-dfaf-eadc-939657426900@arm.com>
 <ed9f3dc5-7f91-6d49-ee09-b362afcee5b0@aggios.com>
 <64d1c6ba-de67-4757-5be6-2390286eb60e@arm.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1603898237-1542233452=:302"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <64d1c6ba-de67-4757-5be6-2390286eb60e@arm.com>
Content-ID: <alpine.DEB.2.10.1811141411010.302@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xen.org, dm@aggios.com, saeed.nowshadi@xilinx.com, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, stefano.stabellini@xilinx.com, Mirela Simonovic <mirela.simonovic@aggios.com>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1603898237-1542233452=:302
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1811141411011.302@sstabellini-ThinkPad-X260>

On Wed, 14 Nov 2018, Julien Grall wrote:
> > > >   @@ -1319,6 +1341,129 @@ static void gicv2_do_LPI(unsigned int lpi)
> > > >       BUG();
> > > >   }
> > > >   +static void gicv2_alloc_context(struct gicv2_context *gc)
> > > > +{
> > > 
> > > Is it necessary to allocate them at boot? Can we make them static or
> > > allocate them when we suspend?
> > > 
> > 
> > We need to allocate dynamically because the size of allocated data depends
> > on the number of irq lines, which is not known at the compile time.
> 
> Well you know the upper bound. Why can't you use the upper bound?
> 
> > Alternative is to allocate on suspend, but I believe it is better to do this
> > when the system boots.
> 
> Why is it better?

I'll reply here also to your other point because they are related:

> Suspend/resume is not a critical feature in common case. So I would
> prefer if we disable it when we can't alloc memory.


It is true that suspend/resume is not a critical feature for the common
case, but proceeding as "normal" when a memory allocation fails is not a
good idea: if the hypervisor is so low in memory as to fail in an
allocation like this one, it is not going to be able to work right. In
no other cases in Xen we continue on memory allocation failures, even
for less-critical features.

I suggest that we either allocate statically using the upper bound as
you suggested, although it leads to some memory being wasted. Or, and
this is my favorite option, we allocate it dynamically but we return a
proper error on memory allocation failures. We should at the very
least print an error.

I would prefer if it is done at boot time so that the user can figure
out that their configuration is wrong and fix it straight away, but it
could also be done at suspend time. Better to fail reliably early,
rather than failing unpredictably later.
--8323329-1603898237-1542233452=:302
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1603898237-1542233452=:302--
