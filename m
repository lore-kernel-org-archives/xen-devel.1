From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [OSSTEST PATCH] README.hardware-acquisition
Date: Thu, 1 Nov 2018 10:50:38 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1811010926550.7220@sstabellini-ThinkPad-X260>
References: <20181030161326.17879-1-ian.jackson@eu.citrix.com>
 <CAFLBxZabx3rG1t8C+6p-+kojxq1WNOqEXn23GyB+w0OgjDYLiQ@mail.gmail.com>
 <CAFLBxZYyKbw3L0p+a9FbLiHy3icSOTPG+Dndk+L1eZjnxaufaA@mail.gmail.com>
 <alpine.DEB.2.10.1810311138360.7220@sstabellini-ThinkPad-X260>
 <CAFLBxZZtiPxCw8Pz4+3JN81ENjzms+qnQEhHBcbJs9FxEP_QXA@mail.gmail.com>
 <FE9A527C-599E-4644-9F89-D3C51E719F60@citrix.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1376700852-1541089755=:7220"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=6kmy=nm=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gIH7C-0004kO-CL
 for xen-devel@lists.xenproject.org; Thu, 01 Nov 2018 17:50:42 +0000
In-Reply-To: <FE9A527C-599E-4644-9F89-D3C51E719F60@citrix.com>
Content-ID: <alpine.DEB.2.10.1811011039500.7220@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth@citrix.com>
Cc: "Artem_Mygaiev@epam.com" <Artem_Mygaiev@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <dunlapg@umich.edu>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>, "infra@xenproject.org" <infra@xenproject.org>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1376700852-1541089755=:7220
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1811011039501.7220@sstabellini-ThinkPad-X260>

On Thu, 1 Nov 2018, Lars Kurth wrote:
> ﻿On 01/11/2018, 11:30, "George Dunlap" <dunlapg@umich.edu> wrote:
> 
>     On Wed, Oct 31, 2018 at 6:46 PM Stefano Stabellini
>     <sstabellini@kernel.org> wrote:
>     > > > ---
>     > > > + Baremetal boot from Debian stable or stable-backports:
>     > > >
>     > > > In order to avoid cross-compilation, Osstest must be able to install a
>     > > > bare-metal system on the host itself in order to build Linux and Xen
>     > > > test binaries for that host. At the moment osstest uses Debian for
>     > > > this, and there is no facility in osstest for building custom kernels
>     > > > for this purpose.  As such, a suitable Linux kernel binary which can
>     > > > boot baremetal on the proposed hardware must be available from Debian
>     > > > (at least `stable', or, if that is not possible, `stable-backports').
>     > > > Osstest cannot install using a patched version of Linux, or one built
>     > > > from a particular git branch, or some such.  If the required kernel is
>     > > > not available in Debian, the vendor should ideally work with the
>     > > > Debian project to ensure and validate that Debian stable-backports
>     > > > kernel binaries boot on the proposed hardware.  Alternately, the
>     > > > vendor can work with the community to implement the necessary
>     > > > functionality within osstest to enable it to build custom kernels for
>     > > > build installs, or use alternate distributions which have better
>     > > > baremetal support for the hardware.
>     >
>     > If we want to grow Xen on ARM testing in OSSTest for embedded boards, I
>     > think that requiring Debian kernel support is unrealistic,
>     
>     You keep using the word "requirement" as though it's an active choice
>     that is being made.  This is a checklist for what kind of hardware can
>     currently be integrated into the XenProject test lab; it is not a
>     policy document or a design document.  As such, it should reflect the
>     situation as it exists at the moment, not how we would like it to be,
>     or how we think it may be at some point in the future.  At the moment,
>     only kind of hardware which can actually be integrated is one on which
>     Debian will boot; so this is listed as a criterion.  There's no point
>     buying hardware which only boots on the XenProject Linux tree until
>     osstest can actually boot such hardware.
>     
>     It also includes pointers for how to change the situation.  If and
>     when the situation changes, we can change the document.

It looks like this thread wasn't the right one to raise my concerns
about embedded testing in OSSTests. If this doc is just describing what
the situation is today, then, of course, Ian should go ahead and commit
it as is. He knows best what the situation is like.

FYI I have been talking with Ian about sending Xilinx MPSoC boards to
the COLO for OSSTests usage for a while now. Ian wrote that he would
send "a checklist for OSSTests hardware". When I saw this email I
thought that this was it, and I interpreted it as requirements.


> I agree with George and Ian. The document describes what is possible now. Part of the rationale for this document, is to enable Ian to off-load more responsibility related to adding machines to OSSTEST to Credativ (from procurement to putting machines into service). This will free up some of Ian's time to focus on development work. The project pays for the service by Credativ by the hour: to manage costs we need to ensure that we don't blow the allocated hours budget (which already happened once this year). Anything which does not work with OSSTEST out-of-the box or cannot work because there is no OSSTEST support will very quickly burn through the project's support budget. Thus, we need to define boundaries to avoid running up costs for tickets in the order of several thousands of USD.
> 
> If we want to increase Arm testing, the necessary functionality has to be implemented in OSSTEST. I don’t think you can expect Ian to implement such functionality in OSSTEST, given all the other work which is already on his plate: although I believe Ian stated several times that he would help someone else to do this.
 
Unfortunately, looking at my schedule, I am unable to provide help on
this front in the foreseeable feature :-(
--8323329-1376700852-1541089755=:7220
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1376700852-1541089755=:7220--
