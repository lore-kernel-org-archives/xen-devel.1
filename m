From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Radical proposal v2: Publish Amazon's verison now,
 Citrix's version soon
Date: Thu, 11 Jan 2018 08:56:17 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1801110853540.4603@sstabellini-ThinkPad-X260>
References: <4a587ed7-fa68-931a-dcbd-ea1570da1bdc@citrix.com>
 <alpine.DEB.2.10.1801100913130.4603@sstabellini-ThinkPad-X260>
 <5A572A81020000780019D8FC@prv-mh.provo.novell.com>
 <alpine.DEB.2.10.1801110817250.4603@sstabellini-ThinkPad-X260>
 <4b047cbf-f711-b326-6a76-6dbc52ca3911@citrix.com>
 <alpine.DEB.2.10.1801110832090.4603@sstabellini-ThinkPad-X260>
 <152C6CA8-A45D-457F-9AC0-6F731535E8C7@gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-241156044-1515689669=:4603"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <152C6CA8-A45D-457F-9AC0-6F731535E8C7@gmail.com>
Content-ID: <alpine.DEB.2.10.1801110855100.4603@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Rich Persaud <persaur@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Anthony Liguori <aliguori@amazon.com>, Doug Goldstein <cardoe@cardoe.com>, George Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, Committers <committers@xenproject.org>, Jan Beulich <JBeulich@suse.com>, "security@xen.org" <security@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-241156044-1515689669=:4603
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1801110855101.4603@sstabellini-ThinkPad-X260>

On Thu, 11 Jan 2018, Rich Persaud wrote:
> On Jan 11, 2018, at 11:36, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> >> On Thu, 11 Jan 2018, George Dunlap wrote:
> >>> On 01/11/2018 04:23 PM, Stefano Stabellini wrote:
> >>> On Thu, 11 Jan 2018, Jan Beulich wrote:
> >>>>>>> On 10.01.18 at 18:25, <sstabellini@kernel.org> wrote:
> >>>>>> On Wed, 10 Jan 2018, George Dunlap wrote:
> >>>>>> * Executive summary
> >>>>>> 
> >>>>>> - We've agreed on a "convergence" point for PV shim functionality that
> >>>>>>  covers as many users as possible:
> >>>>>> - 'HVM' functionality: boots in HVM mode, has support for Xen 3.4
> >>>>>>   event channels, &c, booted via 'sidecar'
> >>>>>> - 'PVH' functionality: boots in PVH mode, booted via toolstack
> >>>>>>   changes
> >>>>>> 
> >>>>>> - "Vixen" (the Amazon shim) and PVH shim (mostly developed by Citrix)
> >>>>>>  each cover some users and not others; neither one (yet) covers all
> >>>>>>  users
> >>>>> 
> >>>>> Sorry for being punctilious, but neither one can cover all users: there
> >>>>> are users without VT-x on their platform, and both approaches require
> >>>>> VT-x.
> >>>> 
> >>>> For the record, yesterday I've decided to make an attempt to
> >>>> create a very simplistic patch to deal with the issue in the
> >>>> hypervisor, ignoring (almost) all performance considerations
> >>>> (not all, because I didn't want to go the "disable caching" route).
> >>>> I've dealt with some of the to-be-expected early bugs, but I'm
> >>>> now debugging a host hang (note: not a triple fault apparently,
> >>>> as the box doesn't reboot, yet triple faults is what I would have
> >>>> expected to occur if anything is wrong here or missing).
> >>>> 
> >>>> I know that's late, and I have to admit that I don't understand
> >>>> myself why I didn't consider doing such earlier on, but the
> >>>> much increased pressure to get something like the shim out,
> >>>> which
> >>>> - doesn't address all cases
> >>>> - requires changes to how VMs are being created (which likely will
> >>>>  be a problem for various customers)
> >>>> - later will want those changes undone
> >>>> plus the pretty obvious impossibility to backport something like
> >>>> Andrew's (not yet complete) series to baselines as old as 3.2
> >>>> made it seem to me that some (measurable!) performance
> >>>> overhead can't be all that bad in the given situation.
> >>> 
> >>> Thank you for giving it a look! I completely agree with you on these
> >>> points. I think we should approach this problem with the assumption that
> >>> this is going to be the only long term solution to SP3, while Vixen (or
> >>> PVshim) incomplete stopgaps for now.
> >> 
> >> Well the pvshim is a feature for people who want to be able to eliminate
> >> all PV interfaces to the hypervisor whatsover for security / maintenance
> >> purposes.  I do agree a "proper" fix for PV would be good, assuming the
> >> overhead is lower than pvshim.
> > 
> > Why "assuming the overhead is lower than pvshim"? What if the overhead
> > is higher?  As I said, there are users that *cannot* deploy HVM because
> > it is not available to them.
> > 
> > In other words, PVshim is irrelevant to me because I cannot use it.
> 
> Would a “proper” PV fix (does this have a codename?) benefit stubdoms?  These are needed to isolate Qemu, e.g. on an HVM driver domain.  PVshim does not yet support driver domains.

Yes, good point. A "proper" fix should support stubdoms too. I think
that Jan's approach above should be able to cover them.
--8323329-241156044-1515689669=:4603
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-241156044-1515689669=:4603--
