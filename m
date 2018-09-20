From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH net-next 13/22] net: xen-netback: fix return
 type of ndo_start_xmit function
Date: Thu, 20 Sep 2018 15:05:49 +0100
Message-ID: <20180920140549.xdowevpqjw45otjx__1228.85328387401$1537452376$gmane$org@zion.uk.xensource.com>
References: <20180920123306.14772-1-yuehaibing@huawei.com>
 <20180920123306.14772-14-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=1x7a=mc=citrix.com=prvs=794768bfb=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g2zbu-0001XJ-IM
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 14:07:14 +0000
Content-Disposition: inline
In-Reply-To: <20180920123306.14772-14-yuehaibing@huawei.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: YueHaibing <yuehaibing@huawei.com>
Cc: dmitry.tarnyagin@lockless.no, madalin.bucur@nxp.com, linux-mips@linux-mips.org, linux@armlinux.org.uk, pantelis.antoniou@gmail.com, kys@microsoft.com, t.sailer@alumni.ethz.ch, dev@openvswitch.org, f.fainelli@gmail.com, arvid.brodin@alten.se, michal.simek@xilinx.com, pshelar@ovn.org, m-karicheri2@ti.com, xen-devel@lists.xenproject.org, jreuter@yaina.de, sammy@sammy.net, grygorii.strashko@ti.com, w-kwok2@ti.com, haiyangz@microsoft.com, steve.glendinning@shawell.net, linux-can@vger.kernel.org, claudiu.manoil@nxp.com, paul.durrant@citrix.com, mkl@pengutronix.de, linux-hams@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, wei.liu2@citrix.com, nico@fluxnic.net, netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, ralf@linux-mips.org, leoyang.li@nxp.com, hsweeten@visionengravers.com, wg@grandegger.com, devel@linuxdriv
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBTZXAgMjAsIDIwMTggYXQgMDg6MzI6NTdQTSArMDgwMCwgWXVlSGFpYmluZyB3cm90
ZToKPiBUaGUgbWV0aG9kIG5kb19zdGFydF94bWl0KCkgaXMgZGVmaW5lZCBhcyByZXR1cm5pbmcg
YW4gJ25ldGRldl90eF90JywKPiB3aGljaCBpcyBhIHR5cGVkZWYgZm9yIGFuIGVudW0gdHlwZSwg
c28gbWFrZSBzdXJlIHRoZSBpbXBsZW1lbnRhdGlvbiBpbgo+IHRoaXMgZHJpdmVyIGhhcyByZXR1
cm5zICduZXRkZXZfdHhfdCcgdmFsdWUsIGFuZCBjaGFuZ2UgdGhlIGZ1bmN0aW9uCj4gcmV0dXJu
IHR5cGUgdG8gbmV0ZGV2X3R4X3QuCj4gCj4gRm91bmQgYnkgY29jY2luZWxsZS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+CgpBY2tlZC1ieTog
V2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
