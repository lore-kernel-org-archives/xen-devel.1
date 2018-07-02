From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH RFC] tools/libxl: Switch Arm guest type to
 PVH
Date: Mon, 2 Jul 2018 10:18:17 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1807021013570.23811@sstabellini-ThinkPad-X260>
References: <20180625130814.29771-1-julien.grall@arm.com>
 <20180625131956.ehoocvdnaser3rfn@citrix.com>
 <8c3d0d5c-3953-3514-54b7-4cf4896b5df2@arm.com>
 <20180625162839.3l3njsov75tvwacj@mac.bytemobile.com>
 <23345.6832.106103.997622@mariner.uk.xensource.com>
 <20180626064917.wasgl6de6x6o3toi@mac.bytemobile.com>
 <cd3006a9-0ee4-ffc6-dccc-fe47d64c6a58@arm.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1622506955-1530551898=:23811"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <cd3006a9-0ee4-ffc6-dccc-fe47d64c6a58@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: sstabellini@kernel.org, Wei Liu <wei.liu2@citrix.com>, andrew.cooper3@citrix.com, xen-devel@lists.xen.org, Ian Jackson <ian.jackson@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1622506955-1530551898=:23811
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 2 Jul 2018, Julien Grall wrote:
> On 06/26/2018 07:49 AM, Roger Pau Monné wrote:
> > On Mon, Jun 25, 2018 at 05:39:12PM +0100, Ian Jackson wrote:
> > > Roger Pau Monné writes ("Re: [PATCH RFC] tools/libxl: Switch Arm guest
> > > type to PVH"):
> > > > IMO I would remove the 'type' option from xl.cfg (so that it's
> > > > basically ignored) in the ARM case and force it internally to PVH (if
> > > > that's the best route for current ARM guests).
> > > 
> > > What about libvirt users ?  I haven't seen what a libvirt Xen ARM
> > > guest config looks like but we need to meak sure that existing guests
> > > don't break.
> > 
> > For livbirt (or users of libxl library) we could force the type to
> > pvh, regardless of the value set by the client, but I guess that would
> > make adding types later on quite complicated.
> 
> I am fairly confident we will never have PV guest on Arm. So one solution
> would be to alias PV to PVH for Arm. This still give us the liberty to add
> more guest type in the future.
> 
> Any opinions?

Roger, what is the plan for x86? Wasn't there an idea to silently and
transparently "upgrade" PV guests to PVH when possible (when hardware
support is available)?

If that is the case, basically we could do the same for ARM. We could
have an hardware features check, that would always return true on ARM
because without virtualization extensions Xen cannot even boot, then
upgrade PV to PVH. On x86 the upgrade would only happen when the
required features are present.
--8323329-1622506955-1530551898=:23811
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1622506955-1530551898=:23811--
