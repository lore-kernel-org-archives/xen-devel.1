From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [Notes for xen summit 2018 design session] Process
 changes: is the 6 monthly release Cadence too short, Security Process, ...
Date: Thu, 5 Jul 2018 12:00:40 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1807051153570.13502@sstabellini-ThinkPad-X260>
References: <0920C595-DA2C-4C5E-B713-40ADB616CC93@citrix.com>
 <60433E7B-455A-45C9-8A6A-B26F5BD8F115@citrix.com>
 <20180705174804.viq3iq2sbfc3xicw@doug-macbook.localdomain>
 <2E77ABE1-55D1-4FD1-8DC4-718F2C702B06@citrix.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-2048878605-1530816972=:13502"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rw7e=jv=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1fb9Uk-0000R9-Kl
 for xen-devel@lists.xenproject.org; Thu, 05 Jul 2018 19:00:46 +0000
In-Reply-To: <2E77ABE1-55D1-4FD1-8DC4-718F2C702B06@citrix.com>
Content-ID: <alpine.DEB.2.10.1807051156440.13502@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <George.Dunlap@citrix.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, "advisory-board@lists.xenproject.org" <advisory-board@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>, Rich Persaud <persaur@gmail.com>, "committers@xenproject.org" <committers@xenproject.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2048878605-1530816972=:13502
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1807051156441.13502@sstabellini-ThinkPad-X260>

On Thu, 5 Jul 2018, George Dunlap wrote:
> >> Again, there was a sense that some of the issues we are seeing could be solved if we had better 
> >> CI capability: in other words, some of the issues we were seeing could be resolved by
> >> * Better CI capability as suggested in the Release Cadence discussion
> >> * Improving some of the internal working practices of the security team
> >> * Before we commit to a change (such as improved batching), we should try them first informally. 
> >>   E.g. the security team could try and work towards more predictable dates for batches vs. a 
> >>   concrete process change
> > 
> > My feeling on CI is clear in this thread and other threads. But I think
> > what would help OSSTEST bottlenecks if we do better at separating up
> > different parts of the testing process into more parallel tasks that
> > also provide feedback to the contributor faster. I'll obviously never
> > suggest the GitHub/GitLab PR/MR model to a ML driven project because I
> > wouldn't survive the hate mail but there is something that those models
> > do provide.
> 
> FWIW we (IanJ, Wei, Roger, Anthony and I) just had a fairly extended discussion about this in our team meeting today, and everyone basically agreed that there are some things about the web-based PR model that are *really* nice:
> 
> 1. Effective tracking of submission state — open / assigned to a reviewer / merged / rejected
> 2. Automation 
> 3. Not having to marshal git commits into email, and then marshal them back into git commits again
> 
> On the other hand, the general consensus, from people who had used such websites “in anger” (as they say here in the UK) was that they really didn’t like the way that reviews worked.  Email was seen as:
> 1. Much more convenient for giving feedback and having discussions
> 2. Easier for people to “listen in” on other people’s reviews
> 3. More accessible for posterity
> 
> In the end we generally agreed that it was an idea worth thinking about more.  Not sure how the wider community feels, but there are at least a decent cohort who wouldn’t send you hate mail. :-)

A properly run patchwork instance is supposed to be able to give us many
of the benefits of the web PR model while retaining the benefits of the
ML based model.

For instance, at Xen Summit we discussed the possibility of running
automated tests on submitted patch series, before they are even
reviewed. The purpose is to free up reviewers' time. Obviously, we don't
need web PRs to enable this, given that both the Linux kernel and QEMU
already have something along those lines, however, we do need a way to
recognize patch series submissions and run something in response to
them. I don't know what Intel is using for the Linux kernel but maybe it
is something based on patchworks? We had an action item to get in touch
with them and ask.

Of course, if we don't even have the test bandwidth to do releases,
testing un-reviewed patch series is not really a priority right now.
However, these tests wouldn't be done on OSSTest, they could be done
with the aforementioned GitLab infrastructure; they are independent.
--8323329-2048878605-1530816972=:13502
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-2048878605-1530816972=:13502--
