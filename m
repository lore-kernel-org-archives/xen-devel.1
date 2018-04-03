From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: preparations for 4.9.2 and 4.7.5
Date: Tue, 3 Apr 2018 16:55:01 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1804031654330.6016@sstabellini-ThinkPad-X260>
References: <5A9EC2B002000078001AF157@prv-mh.provo.novell.com>
 <alpine.DEB.2.10.1803061121200.7316@sstabellini-ThinkPad-X260>
 <5A9FA44902000078001AF3AE@prv-mh.provo.novell.com>
 <alpine.DEB.2.10.1803111345570.23583@sstabellini-ThinkPad-X260>
 <b8564eac-ced8-66f7-d66d-69eb74ce7bcd@arm.com>
 <f82fd9c5-e0d7-8d62-1730-610661c1ebaa@arm.com>
 <alpine.DEB.2.10.1803141733580.13098@sstabellini-ThinkPad-X260>
 <alpine.DEB.2.10.1803151649180.8251@sstabellini-ThinkPad-X260>
 <f0bb1e5d-d4ff-1ce3-4fd9-bae59eeaa26e@arm.com>
 <alpine.DEB.2.10.1803160929540.15548@sstabellini-ThinkPad-X260>
 <81eb8430-e104-1f37-38ae-b9dffbf2f2cb@arm.com>
 <7e341de1-3e5b-66a4-fb1f-7673f92258fd@arm.com>
 <f0b1c2c1-4b6e-facb-81b4-a08ca3e790e1@arm.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1057138307-1522799702=:6016"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mrjv=gy=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1f3VlZ-0002vP-Ey
 for xen-devel@lists.xenproject.org; Tue, 03 Apr 2018 23:55:05 +0000
In-Reply-To: <f0b1c2c1-4b6e-facb-81b4-a08ca3e790e1@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, andre.przywara@linaro.org, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, nd@arm.com
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1057138307-1522799702=:6016
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 3 Apr 2018, Julien Grall wrote:
> Hi,
> 
> On 16/03/18 17:15, Julien Grall wrote:
> > 
> > 
> > On 16/03/2018 16:56, Julien Grall wrote:
> > > Hi Stefano,
> > > 
> > > On 16/03/2018 16:33, Stefano Stabellini wrote:
> > > > On Fri, 16 Mar 2018, Julien Grall wrote:
> > > > > Hi Stefano,
> > > > > 
> > > > > On 15/03/18 23:52, Stefano Stabellini wrote:
> > > > > > On Wed, 14 Mar 2018, Stefano Stabellini wrote:
> > > > > > > After looking at the test results, which are good for arm, and
> > > > > > > considering that master hasn't passed yet after 2 more days, I
> > > > > > > agree
> > > > > > > with Julien: I think we should not release 4.9.2 and 4.7.5 without
> > > > > > > the
> > > > > > > arm64 spectre patches. At this point, I'll proceed to backport the
> > > > > > > patches now.
> > > > > > 
> > > > > > Julien, Andre,
> > > > > > 
> > > > > > Please give a look at the following branches:
> > > > > > 
> > > > > > git://xenbits.xen.org/people/sstabellini/xen-unstable.git
> > > > > > staging-4.7-spectre
> > > > > > git://xenbits.xen.org/people/sstabellini/xen-unstable.git
> > > > > > staging-4.8-spectre
> > > > > > git://xenbits.xen.org/people/sstabellini/xen-unstable.git
> > > > > > staging-4.9-spectre
> > > > > 
> > > > > For all of the tree above, as I said yesterday, I clearly don't want
> > > > > to see
> > > > > the smccc framework backport for Xen 4.9 and older. This is a massive
> > > > > changes
> > > > > of the interface that is not necessary for spectre. My main concern is
> > > > > making
> > > > > SMC instruction available to the guest.
> > > > > 
> > > > > It would be just sufficient to emulate the few SMCCC function ID we
> > > > > care in
> > > > > do_trap_psci (function can be renamed).
> > > > > 
> > > > > This is also clearly wrong to backport coding style or code
> > > > > non-justified code
> > > > > movement (sysreg) just to please the cherry-pick.
> > > > > 
> > > > > I am also worry to bump the version of the emulated PSCI (0.2 -> 1.0)
> > > > > for
> > > > > those releases. Some guests may rely on a specific version and may now
> > > > > crashes.
> > > > > 
> > > > > Overall, the right way to support spectre in earlier releases is
> > > > > custom patch
> > > > > and only do minimal modification.
> > > > > 
> > > > > > git://xenbits.xen.org/people/sstabellini/xen-unstable.git
> > > > > > staging-4.10-spectre
> > > > > 
> > > > > The patches below should not be part of spectre nor backport to 4.10:
> > > > >    - 82e29c87dc7f4f2a7e2f111c3646479da21a910a "ARM: remove unneeded
> > > > > gic.h
> > > > > inclusions"
> > > > >    - 79563717c9dd5383abcf0ba94d813de9b42e3793 "xen/arm: psci: Prefix
> > > > > with
> > > > > static any functions not exported"
> > > > >    - 6d0e9b21b1f7213c1994cc2d636448ee2d5372c2 "xen/arm: vpsci: Update
> > > > > the
> > > > > return type for MIGRATE_INFO_TYPE"
> > > > > 
> > > > > The patches below should not be part of spectre but candidate to 4.10:
> > > > >    - c2d70f77cc7987be164cd87b76459782497fc540 "xen/arm: vpsci: Rework
> > > > > the logic
> > > > > to start AArch32 vCPU in Thumb mode"
> > > > > 
> > > > > You will also want to backport [1] which address a relaxation of the
> > > > > ARM_SMCCC_ARCH_WORKAROUND_1.
> > > > 
> > > > I understand your concerns, in that case could you please provide the
> > > > git branches?
> > > 
> > > That will have to wait when I have spare cycle. Most likely somewhere in
> > > April when I am done from the Xen 4.11 patches and back from holidays.
> > > 
> > > So It is probably the right time to put into contribution stakeholders who
> > > are using those Xen 4.* stable releases.
> > 
> > To be clear, for Xen 4.10 it is just a matter of dropping the 3 patches I
> > suggested. There are actually no clash with the current code.
> 
> Gentle ping. Is there anything blocking to get those patches in Xen 4.10?

Done! Thanks for the ping!
--8323329-1057138307-1522799702=:6016
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1057138307-1522799702=:6016--
