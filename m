From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Make coverity results public
Date: Wed, 28 Mar 2018 10:15:36 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1803281014090.15200@sstabellini-ThinkPad-X260>
References: <20180328133337.xlzb7vqwr4dflnlu@MacBook-Pro-de-Roger.local>
 <20180328134938.zoa6fa7pblek4mxx@citrix.com>
 <3ea2f1ff-8234-95ad-a4bb-aac89cda9125@citrix.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-443120996-1522257343=:15200"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=yb8v=gs=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1f1Efp-0007jv-4D
 for xen-devel@lists.xenproject.org; Wed, 28 Mar 2018 17:15:45 +0000
In-Reply-To: <3ea2f1ff-8234-95ad-a4bb-aac89cda9125@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-443120996-1522257343=:15200
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 28 Mar 2018, George Dunlap wrote:
> On 03/28/2018 02:49 PM, Wei Liu wrote:
> > On Wed, Mar 28, 2018 at 02:33:37PM +0100, Roger Pau Monné wrote:
> >> Hello,
> >>
> >> According to the contribution guidelines document [0] the coverity
> >> database of issues is private, which makes it hard for new people to
> >> see issues. IMO it makes no sense to keep the result private anymore:
> >>
> >>  - They have been audited for plenty of time by different people
> >>    that currently has access to the database.
> >>  - Anyone can reproduce the same results by forking Xen on github and
> >>    sending a build to coverity for analysis AFAICT.
> >>
> >> On the plus side, having the database open would allow us the
> >> following:
> >>
> >>  - Coverity reports could be sent to xen-devel, so anyone could pick
> >>    and fix new issues.
> >>  - Newcomers could use coverity in order to find small size tasks to
> >>    work on.
> >>
> > 
> > +1 for making it public.
> > 
> > It used to be the case that people had access manually forward issues to
> > new comers. It was not fun for anyone involved.
> > 
> > The way the current policy is written makes it only theoretically
> > possible for new comers to access the results (note the signed by PGP
> > key in a part of the strong set of web of trust), but is more likely to
> > be impossible in practice.
> 
> NB that as I understand the term, "strong set" has a meaning generally
> the opposite of what you'd expect in this context: that is, trusting the
> "strong set", by including everyone that can be transitively included,
> is relatively weak from a security point of view.
> 
> For anyone outside of old-school hacking communities (like Debian,
> Linux, &c), this is likely to be a significant barrier to entry.  On the
> other hand, the more communities insist on this sort of thing, the less
> of a barrier it will become. :-)
> 
> In any case, I think the barrier is moot at this point, and should be
> taken down.

I started a thread recently among committers and the agreement was to
open up the results. Andrew volunteered but the one time I reminded him
to do it on IRC, Coverity was offline. Please go ahead and open up the
results now.
--8323329-443120996-1522257343=:15200
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-443120996-1522257343=:15200--
