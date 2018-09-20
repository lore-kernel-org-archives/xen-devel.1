From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next 00/22] net: fix return type of
 ndo_start_xmit function
Date: Thu, 20 Sep 2018 08:50:55 -0700 (PDT)
Message-ID: <20180920.085055.1188796939437872993.davem__44639.0454228551$1537458603$gmane$org@davemloft.net>
References: <20180920123306.14772-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zyev=mc=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1g31EM-0005l6-E3
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 15:51:02 +0000
In-Reply-To: <20180920123306.14772-1-yuehaibing@huawei.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: yuehaibing@huawei.com
Cc: dmitry.tarnyagin@lockless.no, madalin.bucur@nxp.com, linux-mips@linux-mips.org, linux@armlinux.org.uk, pantelis.antoniou@gmail.com, kys@microsoft.com, t.sailer@alumni.ethz.ch, dev@openvswitch.org, f.fainelli@gmail.com, arvid.brodin@alten.se, michal.simek@xilinx.com, pshelar@ovn.org, m-karicheri2@ti.com, xen-devel@lists.xenproject.org, jreuter@yaina.de, sammy@sammy.net, grygorii.strashko@ti.com, w-kwok2@ti.com, haiyangz@microsoft.com, steve.glendinning@shawell.net, linux-can@vger.kernel.org, claudiu.manoil@nxp.com, paul.durrant@citrix.com, mkl@pengutronix.de, linux-hams@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, wei.liu2@citrix.com, nico@fluxnic.net, netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, ralf@linux-mips.org, leoyang.li@nxp.com, hsweeten@visionengravers.com, wg@grandegger.com, devel@linuxdriv
List-Id: xen-devel@lists.xenproject.org

RnJvbTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgpEYXRlOiBUaHUsIDIwIFNl
cCAyMDE4IDIwOjMyOjQ0ICswODAwCgo+IFRoZSBtZXRob2QgbmRvX3N0YXJ0X3htaXQoKSBpcyBk
ZWZpbmVkIGFzIHJldHVybmluZyBhbiAnbmV0ZGV2X3R4X3QnLAo+IHdoaWNoIGlzIGEgdHlwZWRl
ZiBmb3IgYW4gZW51bSB0eXBlLCBzbyBtYWtlIHN1cmUgdGhlIGltcGxlbWVudGF0aW9uIGluCj4g
dGhpcyBkcml2ZXIgaGFzIHJldHVybnMgJ25ldGRldl90eF90JyB2YWx1ZSwgYW5kIGNoYW5nZSB0
aGUgZnVuY3Rpb24KPiByZXR1cm4gdHlwZSB0byBuZXRkZXZfdHhfdC4KCkkgd291bGQgYWR2aXNl
IHlvdSBub3QgdG8gc2VuZCBzbyBtYW55IG9mIHRoZXNlIGNoYW5nZXMgYXMgYSBncm91cC4KCklm
IG9uZSBvZiB0aGUgcGF0Y2hlcyBuZWVkcyBmZWVkYmFjayBhZGRyZXNzZWQsIHdoaWNoIGlzIGFs
cmVhZHkgdGhlCmNhc2UsIHlvdSB3aWxsIGhhdmUgdG8gcmVzdWJtaXQgdGhlIGVudGlyZSBzZXJp
ZXMgYWxsIG92ZXIgYWdhaW4gd2l0aAp0aGUgZml4ZXMuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
