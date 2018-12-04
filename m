From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC 09/16] xen/arm: p2m: Introduce a function to
 resolve translation fault
Date: Tue, 4 Dec 2018 11:13:39 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1812041113330.527@sstabellini-ThinkPad-X260>
References: <20181008183352.16291-1-julien.grall@arm.com>
 <20181008183352.16291-10-julien.grall@arm.com>
 <alpine.DEB.2.10.1811021531060.18518@sstabellini-ThinkPad-X260>
 <ecb491ab-313d-de21-bc97-6e578aa6df77@arm.com>
 <alpine.DEB.2.10.1811050934140.18518@sstabellini-ThinkPad-X260>
 <21a4b3d5-b054-f215-2839-2a9f8fbaa01a@arm.com>
 <bada26b6-ca13-35eb-30aa-77356f114e4d@arm.com>
 <alpine.DEB.2.10.1811121533510.8259@sstabellini-ThinkPad-X260>
 <ab2327ac-166c-b067-7fad-dc0ab24465c3@arm.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1116671542-1543950820=:527"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <ab2327ac-166c-b067-7fad-dc0ab24465c3@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, andre.przywara@linaro.org, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1116671542-1543950820=:527
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 4 Dec 2018, Julien Grall wrote:
> Hi Stefano,
> 
> On 11/12/18 11:36 PM, Stefano Stabellini wrote:
> > On Mon, 12 Nov 2018, Julien Grall wrote:
> > > Hi Stefano,
> > > 
> > > On 11/6/18 2:20 PM, Julien Grall wrote:
> > > > On 05/11/2018 17:56, Stefano Stabellini wrote:
> > > > > On Mon, 5 Nov 2018, Julien Grall wrote:
> > > > > > On 02/11/2018 23:27, Stefano Stabellini wrote:
> > > > > > > On Mon, 8 Oct 2018, Julien Grall wrote:
> > > > > > > 
> > > > > > > > +    /*
> > > > > > > > +     * Now that the work on the entry is done, set the valid
> > > > > > > > bit to
> > > > > > > > prevent
> > > > > > > > +     * another fault on that entry.
> > > > > > > > +     */
> > > > > > > > +    resolved = true;
> > > > > > > > +    entry.p2m.valid = 1;
> > > > > > > > +
> > > > > > > > +    p2m_write_pte(table + offsets[level], entry,
> > > > > > > > p2m->clean_pte);
> > > > > > > > +
> > > > > > > > +    /*
> > > > > > > > +     * No need to flush the TLBs as the modified entry had the
> > > > > > > > valid bit
> > > > > > > > +     * unset.
> > > > > > > > +     */
> > > > > > > > +
> > > > > > > > +out_unmap:
> > > > > > > > +    unmap_domain_page(table);
> > > > > > > > +
> > > > > > > > +out:
> > > > > > > > +    p2m_write_unlock(p2m);
> > > > > > > > +
> > > > > > > > +    return resolved;
> > > > > > > > +}
> > > > > > > > +
> > > > > > > >     static inline int p2m_insert_mapping(struct domain *d,
> > > > > > > >                                          gfn_t start_gfn,
> > > > > > > >                                          unsigned long nr,
> > > > > 
> > > > > 
> > > > > We probably want to update the comment on top of the call to
> > > > > p2m_resolve_translation_fault:
> > > > 
> > > > Whoops. I will fix it.
> > > 
> > > Looking at this again. I think the comment on top of the call to
> > > p2m_resolve_translation_fault still makes sense. Feel free to suggest an
> > > update of the comment if you think it is not enough.
> > 
> >          /*
> >           * The PT walk may have failed because someone was playing with
> >           * the Stage-2 page table or because the valid bit was left
> >           * unset to track memory accesses. In these cases, we want to
> >           * return to the guest.
> >           */
> 
> Thank you for the suggestion. Thinking a bit more,  I would not be surprised
> we decide to expand p2m_resolve_translation_fault in the future. So I decided
> to go for a more generic comment to avoid stale comment:
> 
>        /*
>     	* First check if the translation fault can be resolved by the
> 	* P2M subsystem. If that's the case nothing else to do.

OK
--8323329-1116671542-1543950820=:527
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1116671542-1543950820=:527--
