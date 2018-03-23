From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: X86 Community Call - Wed Apr 11,
 14:00 - 15:00 UTC - Call for Agenda Items
Date: Fri, 23 Mar 2018 10:04:33 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1803231004250.12360@sstabellini-ThinkPad-X260>
References: <DAA777E6-B987-454D-9EFA-153391163E36@citrix.com>
 <911906d032394b138a8fc00dfc6f8ddf@AMSPEX02CL03.citrite.net>
 <20180322115517.do5fzd7qvnaxrge5@MacBook-Pro-de-Roger.local>
 <929bad70-55a1-342a-e370-8352fa5f6ee6@arm.com>
 <AD4D119F-D928-4513-8CA7-12716AB711D0@citrix.com>
 <alpine.DEB.2.10.1803221549241.12360@sstabellini-ThinkPad-X260>
 <20180323094343.kxidyqj42vuk7x4a@MacBook-Pro-de-Roger.local>
 <67816c2fc5b44ee9951beb1db723d49d@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-336539605-1521824674=:12360"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <67816c2fc5b44ee9951beb1db723d49d@AMSPEX02CL03.citrite.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Daniel Kiper <daniel.kiper@oracle.com>, =?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <royger@freebsd.org>, Christopher Clark <christopher.w.clark@gmail.com>, "Ji,
 John" <john.ji@intel.com>, Rich Persaud <persaur@gmail.com>, "xen-devel@lists.xensource.com" <xen-devel@lists.xensource.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich' <JBeulich@suse.com>, "committers@xenproject.org" <committers@xenproject.org>, Janakarajan Natarajan <jnataraj@amd.com>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-336539605-1521824674=:12360
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 23 Mar 2018, Paul Durrant wrote:
> > -----Original Message-----
> > From: Roger Pau Monné [mailto:royger@gmail.com] On Behalf Of Roger Pau
> > Monné
> > Sent: 23 March 2018 09:44
> > To: Stefano Stabellini <sstabellini@kernel.org>
> > Cc: Lars Kurth <lars.kurth@citrix.com>; Juergen Gross <jgross@suse.com>; Ji,
> > John <john.ji@intel.com>; xen-devel@lists.xensource.com; Wei Liu
> > <wei.liu2@citrix.com>; Tamas K Lengyel <tamas@tklengyel.com>; Andrew
> > Cooper <Andrew.Cooper3@citrix.com>; Daniel Kiper
> > <daniel.kiper@oracle.com>; Christopher Clark
> > <christopher.w.clark@gmail.com>; Rich Persaud <persaur@gmail.com>;
> > Janakarajan Natarajan <jnataraj@amd.com>; Julien Grall
> > <julien.grall@arm.com>; Paul Durrant <Paul.Durrant@citrix.com>;
> > committers@xenproject.org; Jan Beulich' <JBeulich@suse.com>; Brian
> > Woods <brian.woods@amd.com>
> > Subject: Re: [Xen-devel] X86 Community Call - Wed Apr 11, 14:00 - 15:00 UTC
> > - Call for Agenda Items
> > 
> > On Thu, Mar 22, 2018 at 03:51:11PM -0700, Stefano Stabellini wrote:
> > > On Thu, 22 Mar 2018, Lars Kurth wrote:
> > > > ﻿On 22/03/2018, 14:49, "Julien Grall" <julien.grall@arm.com> wrote:
> > > >
> > > >     >> -----
> > > >     >>
> > > >     >> I think we need to discuss PCI emulation and our future direction.
> > Our current hybrid with QEMU is becoming increasingly problematic.
> > > >     >
> > > >     > +1
> > > >
> > > >     I think it would be worth for Stefano and I to join this discussion.
> > > >     Ideally, we want to use a common solution between Arm and x86.
> > > >
> > > >     Not sure the time will fit for Stefano thought.
> > > >
> > > > It's at 7am Pacific, which is a little early for Stefano. I can't really move the
> > call: it was quite hard to agree a time-slot.
> > > > But we could aim to schedule this discussion for say 7:30 or 7:45, which
> > makes this easier for Stefano
> > >
> > > Yes, indeed it is very early for Stefano :-)
> > >
> > > But I can do 7:30-7:45 for once.
> > >
> > > In general, for things that interest both x86 and Arm, and PCI
> > > passthrough is a great example, I think it would be best to organize
> > > topic specific calls (that I would love push to 8AM or later ;-)
> > 
> > This is probably going to be a big topic, so I agree that a separate
> > call with a dedicated agenda might be better.
> > 
> 
> Yes, and it may be prudent to reserve some time for a design session at summit, if relevant folks will be there.

+1

--8323329-336539605-1521824674=:12360
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-336539605-1521824674=:12360--
