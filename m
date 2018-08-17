From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [xen-unstable-smoke test] 126019: regressions - FAIL
Date: Fri, 17 Aug 2018 16:31:29 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1808171617120.16354@sstabellini-ThinkPad-X260>
References: <osstest-126019-mainreport@xen.org>
 <5B767D5902000078001DF3CA@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-325859147-1534548689=:16354"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=78fa=la=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1fqoDL-0001Wd-SA
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 23:31:31 +0000
In-Reply-To: <5B767D5902000078001DF3CA@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, osstest service owner <osstest-admin@xenproject.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-325859147-1534548689=:16354
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 17 Aug 2018, Jan Beulich wrote:
> >>> On 17.08.18 at 06:52, <osstest-admin@xenproject.org> wrote:
> > flight 126019 xen-unstable-smoke real [real]
> > http://logs.test-lab.xenproject.org/osstest/logs/126019/ 
> > 
> > Regressions :-(
> > 
> > Tests which did not succeed and are blocking,
> > including tests which could not be run:
> >  test-armhf-armhf-xl          12 guest-start              fail REGR. vs. 125923
> 
> Is anyone looking into this:
> 
> libxl: error: libxl_arm.c:124:libxl__arch_domain_save_config: Unexpected gic version 0
> 
> Looks like further fallout from 54ed251dc7.

Looking at 54ed251dc7, I think this line is wrong:

-    memcpy(config, &domctl.u.createdomain.arch, sizeof(*config));

the result is not copied back to the caller.

But I can see that the following should have fixed that already:

commit effed864104ad9bee3f72a2a7d9fb2146b8bf122
Author: Roger Pau Monné <roger.pau@citrix.com>
Date:   Fri Aug 17 13:59:35 2018 +0200

    libxc: copy back the result of XEN_DOMCTL_createdomain

--8323329-325859147-1534548689=:16354
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-325859147-1534548689=:16354--
