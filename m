From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen: use hvc console for dom0
Date: Tue, 27 Feb 2018 12:03:08 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1802271159070.4239__4932.14665116302$1519761719$gmane$org@sstabellini-ThinkPad-X260>
References: <20180226110822.13787-1-jgross@suse.com>
 <0d8bdda5-faef-41da-344a-644b5c3d6006@epam.com>
 <58e94cc9-9b09-d6b7-3122-fb4c83e97926@suse.com>
 <b57092b4-e740-e1f8-3885-a817bb7d4e70@arm.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1944649226-1519761789=:4239"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=bhja=fv=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1eqlSx-00043B-34
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2018 20:03:11 +0000
In-Reply-To: <b57092b4-e740-e1f8-3885-a817bb7d4e70@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, linux-kernel@vger.kernel.org, jbeulich@suse.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1944649226-1519761789=:4239
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 27 Feb 2018, Julien Grall wrote:
> Hi,
> 
> On 26/02/18 12:32, Juergen Gross wrote:
> > On 26/02/18 13:06, Andrii Anisov wrote:
> > > Hello Juergen,
> > > 
> > > 
> > > On 26.02.18 13:08, Juergen Gross wrote:
> > > > Today the hvc console is added as a preferred console for pv domUs
> > > > only. As this requires a boot parameter for getting dom0 messages per
> > > > default add it for dom0, too.
> > > > 
> > > > Signed-off-by: Juergen Gross <jgross@suse.com>
> > > > ---
> > > >    arch/x86/xen/enlighten_pv.c | 4 +++-
> > > >    1 file changed, 3 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
> > > Is this something x86 specific? Could it be a generic approach?
> > 
> > In case ARM wants something similar I guess the test for
> > xen_initial_domain() should be dropped in xen_early_init().
> I am pretty sure we discussed to remove !xen_initial_domain() for Arm in the
> past. But I don't remember why the patch was not sent to remove it.
> 
> Anyway, I guess this should be fine to have hvc as a preferred console for the
> initial domain as well.

Usually, Dom0 has access to several physical UARTs and/or VGA, making
this patch less obviously desirable. I think that for Dom0 the best
behavior would be to add "hvc0" as first console rather than last
console, so that if the user specified something else, this call won't
interfere with it.
--8323329-1944649226-1519761789=:4239
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1944649226-1519761789=:4239--
