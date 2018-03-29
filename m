From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Make coverity results public
Date: Thu, 29 Mar 2018 09:58:46 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1803290956300.15200@sstabellini-ThinkPad-X260>
References: <20180328133337.xlzb7vqwr4dflnlu@MacBook-Pro-de-Roger.local>
 <51636480-c21c-4f93-d2f7-0f3349f3b023@citrix.com>
 <CAF3u54DfcrUWn6hhVhQVe9xW38LRYbxTU=vjnKiW1F97MSHCDQ@mail.gmail.com>
 <20180329082952.qjhd4ms3x2v66hfe@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-480749283-1522342727=:15200"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sost=gt=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1f1asz-0004ej-9n
 for xen-devel@lists.xenproject.org; Thu, 29 Mar 2018 16:58:49 +0000
In-Reply-To: <20180329082952.qjhd4ms3x2v66hfe@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@gmail.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-480749283-1522342727=:15200
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 29 Mar 2018, Roger Pau Monné wrote:
> On Thu, Mar 29, 2018 at 12:30:25AM +0000, Julien Grall wrote:
> > (sorry for the formatting)
> > 
> > On Wed, 28 Mar 2018, 21:48 George Dunlap, <george.dunlap@citrix.com> wrote:
> > 
> > > On 03/28/2018 02:33 PM, Roger Pau Monné wrote:
> > > > Hello,
> > > >
> > > > According to the contribution guidelines document [0] the coverity
> > > > database of issues is private, which makes it hard for new people to
> > > > see issues. IMO it makes no sense to keep the result private anymore:
> > > >
> > > >  - They have been audited for plenty of time by different people
> > > >    that currently has access to the database.
> > > >  - Anyone can reproduce the same results by forking Xen on github and
> > > >    sending a build to coverity for analysis AFAICT.
> > > >
> > > > On the plus side, having the database open would allow us the
> > > > following:
> > > >
> > > >  - Coverity reports could be sent to xen-devel, so anyone could pick
> > > >    and fix new issues.
> > > >  - Newcomers could use coverity in order to find small size tasks to
> > > >    work on.
> > >
> > > In general, +1 from me.  But Stefano, was there some special
> > > circumstance for the ARM Coverity runs?
> > >
> > 
> > We don't control what is tested on the ARM coverity. This was setup on a
> > testing branch by EPAM, so they are putting their patches and update
> > manually.
> > 
> > If we want to open that coverity then we need to track staging and have
> > automatic push.
> > 
> > Otherwise it will be near to impossible to know if the failure is because
> > of staging or their patches.
> 
> I don't know much about Coverity, but I guess the results from the ARM
> scan are separated from the x86 ones?
> 
> Can't we just open the x86 results?
> 
> Or in the worse case, can we just ignore the ARM results if they are
> not useful?

Yes, there are basically two separate coverity instances: the one we
have been talking about and that Andrew was about to open up, which is
x86 only, and the one ran by EPAM, which is ARM only.

Let's take a step at a time and open up the x86 coverity instance first.
Then, we'll figure out what to do about the ARM instance.
--8323329-480749283-1522342727=:15200
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-480749283-1522342727=:15200--
