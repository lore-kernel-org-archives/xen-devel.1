From: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH net-next 00/22] net: fix return type of
 ndo_start_xmit function
Date: Fri, 21 Sep 2018 09:33:24 +0800
Message-ID: <83d29681-b008-9b1f-5961-e23f0174d5f4__15634.0975001969$1537493571$gmane$org@huawei.com>
References: <20180920123306.14772-1-yuehaibing@huawei.com>
 <20180920.085055.1188796939437872993.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hfhm=md=huawei.com=yuehaibing@srs-us1.protection.inumbo.net>)
 id 1g3AKG-0004lf-HH
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 01:33:44 +0000
In-Reply-To: <20180920.085055.1188796939437872993.davem@davemloft.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Miller <davem@davemloft.net>
Cc: dmitry.tarnyagin@lockless.no, madalin.bucur@nxp.com, linux-mips@linux-mips.org, linux@armlinux.org.uk, pantelis.antoniou@gmail.com, kys@microsoft.com, t.sailer@alumni.ethz.ch, dev@openvswitch.org, f.fainelli@gmail.com, arvid.brodin@alten.se, michal.simek@xilinx.com, pshelar@ovn.org, m-karicheri2@ti.com, xen-devel@lists.xenproject.org, jreuter@yaina.de, sammy@sammy.net, grygorii.strashko@ti.com, w-kwok2@ti.com, haiyangz@microsoft.com, steve.glendinning@shawell.net, linux-can@vger.kernel.org, claudiu.manoil@nxp.com, paul.durrant@citrix.com, mkl@pengutronix.de, linux-hams@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, wei.liu2@citrix.com, nico@fluxnic.net, netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, ralf@linux-mips.org, leoyang.li@nxp.com, hsweeten@visionengravers.com, wg@grandegger.com, devel@linuxdriv
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOC85LzIwIDIzOjUwLCBEYXZpZCBNaWxsZXIgd3JvdGU6Cj4gRnJvbTogWXVlSGFpYmlu
ZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgo+IERhdGU6IFRodSwgMjAgU2VwIDIwMTggMjA6MzI6
NDQgKzA4MDAKPiAKPj4gVGhlIG1ldGhvZCBuZG9fc3RhcnRfeG1pdCgpIGlzIGRlZmluZWQgYXMg
cmV0dXJuaW5nIGFuICduZXRkZXZfdHhfdCcsCj4+IHdoaWNoIGlzIGEgdHlwZWRlZiBmb3IgYW4g
ZW51bSB0eXBlLCBzbyBtYWtlIHN1cmUgdGhlIGltcGxlbWVudGF0aW9uIGluCj4+IHRoaXMgZHJp
dmVyIGhhcyByZXR1cm5zICduZXRkZXZfdHhfdCcgdmFsdWUsIGFuZCBjaGFuZ2UgdGhlIGZ1bmN0
aW9uCj4+IHJldHVybiB0eXBlIHRvIG5ldGRldl90eF90Lgo+IAo+IEkgd291bGQgYWR2aXNlIHlv
dSBub3QgdG8gc2VuZCBzbyBtYW55IG9mIHRoZXNlIGNoYW5nZXMgYXMgYSBncm91cC4KPiAKPiBJ
ZiBvbmUgb2YgdGhlIHBhdGNoZXMgbmVlZHMgZmVlZGJhY2sgYWRkcmVzc2VkLCB3aGljaCBpcyBh
bHJlYWR5IHRoZQo+IGNhc2UsIHlvdSB3aWxsIGhhdmUgdG8gcmVzdWJtaXQgdGhlIGVudGlyZSBz
ZXJpZXMgYWxsIG92ZXIgYWdhaW4gd2l0aAo+IHRoZSBmaXhlcy4KPiAKClllcywgSSB3aWxsIHNl
bmQgaXQgc2VwYXJhdGVseSBhZnRlciB0ZXN0IGFuZCByZXZpZXcgYWdhaW4uCgpUaGFuayB5b3Ug
Zm9yIHlvdXIgYWR2aWNlLgoKPiAuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
