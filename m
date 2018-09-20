From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH net-next 00/22] net: fix return type of
 ndo_start_xmit function
Date: Thu, 20 Sep 2018 12:04:58 -0500
Message-ID: <46f95cf9-8f8f-e3ab-3142-947faeee9fa9__21921.3796234273$1537463091$gmane$org@ti.com>
References: <20180920123306.14772-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qqlw=mc=ti.com=grygorii.strashko@srs-us1.protection.inumbo.net>)
 id 1g32Ov-0004E8-1Q
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 17:06:01 +0000
In-Reply-To: <20180920123306.14772-1-yuehaibing@huawei.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: YueHaibing <yuehaibing@huawei.com>, davem@davemloft.net, dmitry.tarnyagin@lockless.no, wg@grandegger.com, mkl@pengutronix.de, michal.simek@xilinx.com, hsweeten@visionengravers.com, madalin.bucur@nxp.com, pantelis.antoniou@gmail.com, claudiu.manoil@nxp.com, leoyang.li@nxp.com, linux@armlinux.org.uk, sammy@sammy.net, ralf@linux-mips.org, nico@fluxnic.net, steve.glendinning@shawell.net, f.fainelli@gmail.com, w-kwok2@ti.com, m-karicheri2@ti.com, t.sailer@alumni.ethz.ch, jreuter@yaina.de, kys@microsoft.com, haiyangz@microsoft.com, wei.liu2@citrix.com, paul.durrant@citrix.com, arvid.brodin@alten.se, pshelar@ovn.org
Cc: dev@openvswitch.org, linux-mips@linux-mips.org, xen-devel@lists.xenproject.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-can@vger.kernel.org, devel@linuxdriverproject.org, linux-hams@vger.kernel.org, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwOS8yMC8yMDE4IDA3OjMyIEFNLCBZdWVIYWliaW5nIHdyb3RlOgo+IFRoZSBtZXRob2Qg
bmRvX3N0YXJ0X3htaXQoKSBpcyBkZWZpbmVkIGFzIHJldHVybmluZyBhbiAnbmV0ZGV2X3R4X3Qn
LAo+IHdoaWNoIGlzIGEgdHlwZWRlZiBmb3IgYW4gZW51bSB0eXBlLCBzbyBtYWtlIHN1cmUgdGhl
IGltcGxlbWVudGF0aW9uIGluCj4gdGhpcyBkcml2ZXIgaGFzIHJldHVybnMgJ25ldGRldl90eF90
JyB2YWx1ZSwgYW5kIGNoYW5nZSB0aGUgZnVuY3Rpb24KPiByZXR1cm4gdHlwZSB0byBuZXRkZXZf
dHhfdC4KPiAKCk1heSBiZSBJIG1pc3NlZCBzbXRoLCBidXQgaXQncyBhY2NlcHRhYmxlIHRvIHJl
cG9ydCBzdGFuZGFyZCBlcnJvciBjb2RlcyBmcm9tCi54bWl0KCkgY2FsbGJhY2sgYXMgcGVyIGRl
dl94bWl0X2NvbXBsZXRlKCkuCgotLSAKcmVnYXJkcywKLWdyeWdvcmlpCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
