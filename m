From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen,x86: introduce tcg_errata
Date: Fri, 26 Jan 2018 09:17:22 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1801260916510.11958@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1801251035430.11958@sstabellini-ThinkPad-X260>
 <62646f15-19de-e626-4a65-4e8dc2fc0025@citrix.com>
 <alpine.DEB.2.10.1801251057591.11958@sstabellini-ThinkPad-X260>
 <d527f024-f383-8812-0475-ba101f95becf@citrix.com>
 <5A6B19CF02000078001A2B37@prv-mh.provo.novell.com>
 <59150e93-f83b-18da-8d7a-0da477d36e6f@citrix.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1748776813-1516987043=:11958"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <59150e93-f83b-18da-8d7a-0da477d36e6f@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <JBeulich@suse.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1748776813-1516987043=:11958
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 26 Jan 2018, Andrew Cooper wrote:
> On 26/01/18 11:06, Jan Beulich wrote:
> >>>> On 25.01.18 at 21:04, <andrew.cooper3@citrix.com> wrote:
> >> On 25/01/18 19:43, Stefano Stabellini wrote:
> >>> On Thu, 25 Jan 2018, Andrew Cooper wrote:
> >>>> On 25/01/18 18:37, Stefano Stabellini wrote:
> >>>>> The TCG emulator in QEMU is not good enough to pass the the tests in
> >>>>> stub_selftest. Detect if Xen is running on TCG early, then drop the
> >>>>> tests if it is the case.
> >>>>>
> >>>>> Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
> >>>> I'm still opposed to this change.  The selftests demonstrate that TCG
> >>>> doesn't work for an architectural area we depend, and simply pretending
> >>>> its not buggy isn't ok.  If this were a piece of real hardware, it would
> >>>> be blacklisted in a similar fashion to XSA-9.
> >>>> I still haven't seen a convincing enough usecase to cause Xen to
> >>>> proactively look for Qemu in all cases including release builds on real
> >>>> hardware.
> >>> Testing is a very good use case.
> >> Testing is good. I approve of testing.
> >>
> >> The problem is that what you are doing here is using a broken testing
> >> tool and instead of fixing the tool, you're bodging Xen to pro-actively
> >> search for your broken testing tool in all cases including release
> >> builds, and ignore one of Xen's safety checks.
> > What about a slightly different approach: Instead of skipping the
> > tests, issue a bright warning (along the lines of the sync_console
> > one) if the tests fail (remember that they're carried out in debug
> > builds only anyway). That'll allow people to use Xen in such an
> > environment, but makes them aware that their testing results may
> > be meaningless. And this wouldn't require probing whether we're
> > running on that qemu emulator.
> 
> That seems reasonable.  IIRC, there is already infrastructure for adding
> extra warning text.

It is a good suggestion, I'll submit a patch to do that.
--8323329-1748776813-1516987043=:11958
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1748776813-1516987043=:11958--
