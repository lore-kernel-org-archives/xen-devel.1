From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 0/3] xen/arm: Inject an exception to the
 guest rather than crashing it
Date: Tue, 30 Jan 2018 11:21:01 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1801301110180.11958@sstabellini-ThinkPad-X260>
References: <20180130161433.6910-1-julien.grall@arm.com>
 <d948cb7b-6c0b-ef3f-b95a-5e0c9c8f7065@citrix.com>
 <864d6a7f-00c7-5ef5-51f0-e7f74b35ca70@arm.com>
 <b6abd6f2-92cf-8bb4-2d96-681a198fb375@citrix.com>
 <381dfde4-bf8e-0008-3c41-a7f8b143b721@arm.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-253457304-1517339557=:11958"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <381dfde4-bf8e-0008-3c41-a7f8b143b721@arm.com>
Content-ID: <alpine.DEB.2.10.1801301113181.11958@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, sstabellini@kernel.org, andre.przywara@linaro.org, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-253457304-1517339557=:11958
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1801301113182.11958@sstabellini-ThinkPad-X260>

On Tue, 30 Jan 2018, Julien Grall wrote:
> Hi,
> 
> On 30/01/18 18:29, Andrew Cooper wrote:
> > On 30/01/18 17:00, Julien Grall wrote:
> > > 
> > > 
> > > On 30/01/18 16:38, Andrew Cooper wrote:
> > > > On 30/01/18 16:14, Julien Grall wrote:
> > > > > Hi all,
> > > > > 
> > > > > This small series replaces all call to domain_crash_synchronous by
> > > > > injecting
> > > > > an exception to the guest.
> > > > > 
> > > > > This will result to a nicer trace from the guest (no need to
> > > > > manually walk
> > > > > the stack) and give a chance to the guest to give a bit more
> > > > > information on
> > > > > what it was doing.
> > > > > 
> > > > > Cheers,
> > > > > 
> > > > > Julien Grall (3):
> > > > >     xen/arm: io: Distinguish unhandled IO from aborted one
> > > > >     xen/arm: Don't crash domain on bad MMIO emulation
> > > > >     xen/arm: Don't crash the domain on invalid HVC immediate
> > > > 
> > > > Thanks.
> > > > 
> > > > I don't feel qualified to review these, but some notes.
> > > > 
> > > > Patch 1.  s/avodi/avoid/ in the commit message
> > > > 
> > > > Patches 2 and 3.  You probably want to convert the printks to
> > > > gdprintk()s, otherwise guests can choke up the ratelimited log.  Doing
> > > > so will also mean that the vcpu will be identified consistently, which
> > > > it isn't currently.
> > > We didn't use g*printk because it would be more confusing to print the
> > > current vCPU in some cases (e.g when accessing the re-distributor of
> > > another vCPU) or does not matter (e.g for ITS).
> > 
> > In the former case, you'd want to print both current, and the target
> > vcpu.  The latter still matters what current is if something goes wrong.
> > 
> > We have plenty of similar cases in x86, but at the point you are
> > printing an diagnostic message, ignoring current is almost always the
> > wrong think to do.
> 
> I will look at it on another series.
> 
> > 
> > > 
> > > The problem with the debug version is those information are actually
> > > quite useful in non-debug build. We found quite a few issues thanks to
> > > them.
> > > 
> > > I think it would make more sense for Xen to provide per-guest
> > > ratelimited than hiding those messages in non-debug build.
> > 
> > Per guest is quite a lot more complicated than global, and would still
> > require a global limit to prevent a concerted attack from multiple
> > guests to avoid DoSing the system.
> > 
> > Debug vs unilateral is your prerogative as a maintainer, but as you've
> > said yourself, the are used for debugging purposes, which proves my point.
> 
> So on x86, you always request the user to reproduce it with debug build
> enable?
> 
> Stefano, what's your opinion here?

I think it would be great to have per-guest rate limiting.

On ARM, it would be impossible to ask users to repro with debug enabled,
given that many deployments are embedded (set-top boxes, etc).

I think it is OK to keep the XENLOG_DEBUG, they should be filtered out
by loglvl. But we need to be careful about the others. We might want to
convert the XENLOG_WARNING in traps.c to XENLOG_DEBUG: they are warning
about guests misbehaving, but from the hypervisor point of view, it's not
a problem, guests can shoot themselves if they want to; it's OK.
--8323329-253457304-1517339557=:11958
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-253457304-1517339557=:11958--
