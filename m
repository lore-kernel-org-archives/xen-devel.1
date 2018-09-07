From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] tools: specifically enable VirtFS in Linux
 QEMU builds
Date: Fri, 7 Sep 2018 09:55:54 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1809070952330.14449@sstabellini-ThinkPad-X260>
References: <20180906120636.38754-1-paul.durrant@citrix.com>
 <alpine.DEB.2.10.1809061110360.14449@sstabellini-ThinkPad-X260>
 <e08f982ab0cc415c9a19d1cc40cd69ef@AMSPEX02CL03.citrite.net>
 <20180907145750.c7447dsjd7omk5ec@mac.bytemobile.com>
 <62c817eb-6ccd-1654-7c04-ff22cabcc5d8@citrix.com>
 <f8aee796e09b4dc3b3eb56acd67c300d@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1394005521-1536339355=:14449"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ggj+=lv=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1fyK32-0006ct-SV
 for xen-devel@lists.xenproject.org; Fri, 07 Sep 2018 16:55:56 +0000
In-Reply-To: <f8aee796e09b4dc3b3eb56acd67c300d@AMSPEX02CL03.citrite.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1394005521-1536339355=:14449
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 7 Sep 2018, Paul Durrant wrote:
> > -----Original Message-----
> > From: George Dunlap [mailto:george.dunlap@citrix.com]
> > Sent: 07 September 2018 16:26
> > To: Roger Pau Monne <roger.pau@citrix.com>; Paul Durrant
> > <Paul.Durrant@citrix.com>
> > Cc: 'Stefano Stabellini' <sstabellini@kernel.org>; Wei Liu
> > <wei.liu2@citrix.com>; Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>;
> > Andrew Cooper <Andrew.Cooper3@citrix.com>; Tim (Xen.org)
> > <tim@xen.org>; Julien Grall <julien.grall@arm.com>; Jan Beulich
> > <jbeulich@suse.com>; Ian Jackson <Ian.Jackson@citrix.com>; xen-
> > devel@lists.xenproject.org
> > Subject: Re: [Xen-devel] [PATCH] tools: specifically enable VirtFS in Linux
> > QEMU builds
> > 
> > On 09/07/2018 03:57 PM, Roger Pau Monné wrote:
> > > On Fri, Sep 07, 2018 at 08:35:11AM +0000, Paul Durrant wrote:
> > >>> -----Original Message-----
> > >>> From: Stefano Stabellini [mailto:sstabellini@kernel.org]
> > >>> Sent: 06 September 2018 19:12
> > >>> To: Paul Durrant <Paul.Durrant@citrix.com>
> > >>> Cc: xen-devel@lists.xenproject.org; Andrew Cooper
> > >>> <Andrew.Cooper3@citrix.com>; George Dunlap
> > >>> <George.Dunlap@citrix.com>; Ian Jackson <Ian.Jackson@citrix.com>;
> > Jan
> > >>> Beulich <jbeulich@suse.com>; Julien Grall <julien.grall@arm.com>;
> > Konrad
> > >>> Rzeszutek Wilk <konrad.wilk@oracle.com>; Stefano Stabellini
> > >>> <sstabellini@kernel.org>; Tim (Xen.org) <tim@xen.org>; Wei Liu
> > >>> <wei.liu2@citrix.com>
> > >>> Subject: Re: [PATCH] tools: specifically enable VirtFS in Linux QEMU
> > builds
> > >>>
> > >>> On Thu, 6 Sep 2018, Paul Durrant wrote:
> > >>>> 9pfs support has been a documented feature since Xen 4.9, but QEMU
> > will
> > >>>> not be built with backend support unless libcap and libattr dev
> > packages
> > >>>> are installed.
> > >>>>
> > >>>> This patch modifies the README to call out those packages as pre-
> > >>> requisites
> > >>>> for Linux builds and specifically enables VirtFS in the configure line
> > >>>> for QEMU so that an error message is displayed if they are missing.
> > >>>>
> > >>>> Signed-off-by: Paul Durrant <paul.durrant@citrix.com>
> > >>>
> > >>> Thank you, Paul!
> > >>
> > >> NP. I'm at the point of seriously considering a Windows frontend, which is
> > why I've been playing.
> > >>
> > >> BTW, as a heads-up... Before I realised QEMU was not building the
> > backend, I tried a modprobe of the Xen 9pfs transport module in a Linux
> > guest and immediately hit a kernel BUG (NULL ptr IIRC) which was apparently
> > down to the frontend expecting the backend to be present when its probe
> > routine is run, rather than deferring things until the backend goes into
> > InitWait (which is what a frontend generally should do). Also, it's non-obvious
> > why I have to explicitly modprobe anyway... Shouldn't the module get
> > demand-loaded when I run mount -t 9pfs blah?
> > >>
> > >>> Do we need to do anything for the configure stuff
> > >>> (AC_CHECK_LIB in tools/configure.ac)?
> > >>
> > >> That's certainly a reasonable belt'n'braces approach so that folks don't
> > have to wait until their tools build fails to find out what they need. I'll have a
> > look at that.
> > >
> > > IMO I don't think we should be duplicating the checks that QEMU
> > > configure already does in our configure script. The best option would
> > > be to run whatever external configure scripts there are together with
> > > our own configure script, but this is quite complicated because the
> > > qemu-dir might have to be fetched at the point where configure runs.
> > 
> > Not the least because the dependencies may change.  I think adding an
> > "--enable-9pfs" option which will pass on the requisite "--enable" to
> > qemu (such that qemu build will fail if the prereqs are not present)
> > makes the most sense.
> 
> I'd be happy with that if others are.

If QEMU changes the virtfs default to "enable", then this option will
become ineffective maybe without us even noticing. However, I guess we
prefer to deal with duplicate enable/disable options in QEMU and Xen,
rather than duplicate dependency checks which might be harder to keep
up-to-date in the long run?
--8323329-1394005521-1536339355=:14449
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1394005521-1536339355=:14449--
