From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v6 11/12] x86/microcode: Synchronize late
 microcode loading
Date: Fri, 15 Mar 2019 11:44:16 +0100 (CET)
Message-ID: <alpine.DEB.2.21.1903151140550.2055@nanos.tec.linutronix.de>
References: <1552291056-20286-1-git-send-email-chao.gao@intel.com>
 <1552291056-20286-12-git-send-email-chao.gao@intel.com>
 <20190313000751.GF11608@araj-mobl1.jf.intel.com>
 <20190313050241.GA24657@gao-cwp>
 <5C88B746020000780021DF4D@prv1-mh.provo.novell.com>
 <5C88B92F020000780021DF64@prv1-mh.provo.novell.com>
 <d55bb90e-5ca4-0544-be5f-bbd0168c060a@citrix.com>
 <20190314185712.GA20889@araj-mobl1.jf.intel.com>
 <alpine.DEB.2.21.1903141306180.1948@nanos.tec.linutronix.de>
 <c8c5efb3-2126-dd26-37a5-4dff263842b7@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2015375774-1552646662=:2055"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2VXQ=RS=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1h4kKF-0004vt-Op
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2019 10:44:31 +0000
In-Reply-To: <c8c5efb3-2126-dd26-37a5-4dff263842b7@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Borislav Petkov <bp@suse.de>, Wei Liu <wei.liu2@citrix.com>, "Raj,
 Ashok" <ashok.raj@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, "Mallick,
 Asit K" <asit.k.mallick@intel.com>, Peter Zijlstra <peterz@infradead.org>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Chao Gao <chao.gao@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2015375774-1552646662=:2055
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8BIT

On Fri, 15 Mar 2019, Andrew Cooper wrote:
> On 14/03/2019 20:25, Thomas Gleixner wrote:
> > On Thu, 14 Mar 2019, Raj, Ashok wrote:
> >> On Thu, Mar 14, 2019 at 12:39:46PM +0000, Andrew Cooper wrote:
> >>> On late load failure, we should dump enough information to work out
> >>> exactly what went on, to determine how best to proceed, but the server
> >>> is effectively lost to us.  On late load success, the proposed new
> >>> "version" replaces the current "version".
> >>>
> >>> And again - I reiterate the point that I think it is fine to have a
> >>> simplifying assumption that we don't have mixed stepping systems to
> >>> start with, presuming this is generally in line with Intel's support
> >>> statement.  If in practice we find mixed stepping systems which are
> >>> supported by an OEM/Intel, we can see about extending the logic.
> >> Checking with Asit he says it is in fact permitted to have 1 step behind
> >> even on a multi-socket system. One could be N and other N-1 should be 
> >> supported.
> > That turns into a total disaster if N has an issue fixed ant N-1 requires
> > microcode + software workaround.
> >
> > So if N is on the boot socket, then we fail to enable the workaround
> > because CPU0 has the 'Issue fixed' bit set.
> >
> > If N-1 is on the boot socket, then we go to do the workaround nevertheless
> > on N and that might dependend on the issue just be some pointless exercise
> > or even try to access some MSR which is not available.
> >
> > *Shudder*
> 
> Intel: Are you saying that Skylake (06-55-04) is supported in
> combination with Cascade Lake B0 (06-55-05) and/or Cascade Lake B1
> (06-55-06) ?
> 
> The most insidious problem is TSX_FORCE_ABORT between the two Cascade
> Lakes.  There really will be an asymmetric existence of an MSR required
> for use in one part of the system, and unavailable in the other part of
> the system.
> 
> To a certain degree, what is technically supported by Intel is also
> tempered by what the major OS/VMM vendors are willing to boot on, as
> that is ultimately what the customer is paying for.  When the steppings
> differed only by the errata fixed, and the silicon was otherwise
> identical from software's point of view, supporting a range of adjacent
> steppings seems entirely reasonable.

Sure, if the software does not have to worry about the differences then
supporting that is a no-brainer.

> In this case you've got 3 adjacent steppings, *all* of which offer
> different architecturally defined features, and will involve software
> changes to allow mixed systems to function in a safe way.

Let's not go there. We've seen the mess which other architectures created
with big/little CPUs which expose different feature sets.

Thanks,

	tglx
--8323329-2015375774-1552646662=:2055
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-2015375774-1552646662=:2055--
