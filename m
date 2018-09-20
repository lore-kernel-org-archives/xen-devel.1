From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH net-next 01/22] net: micrel: fix return type of
 ndo_start_xmit function
Date: Thu, 20 Sep 2018 20:32:45 +0800
Message-ID: <20180920123306.14772-2-yuehaibing__28622.9457393803$1537452493$gmane$org@huawei.com>
References: <20180920123306.14772-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=6zv5=mc=huawei.com=yuehaibing@srs-us1.protection.inumbo.net>)
 id 1g2yNL-0003OE-Ce
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 12:48:07 +0000
In-Reply-To: <20180920123306.14772-1-yuehaibing@huawei.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: davem@davemloft.net, dmitry.tarnyagin@lockless.no, wg@grandegger.com, mkl@pengutronix.de, michal.simek@xilinx.com, hsweeten@visionengravers.com, madalin.bucur@nxp.com, pantelis.antoniou@gmail.com, claudiu.manoil@nxp.com, leoyang.li@nxp.com, linux@armlinux.org.uk, sammy@sammy.net, ralf@linux-mips.org, nico@fluxnic.net, steve.glendinning@shawell.net, f.fainelli@gmail.com, grygorii.strashko@ti.com, w-kwok2@ti.com, m-karicheri2@ti.com, t.sailer@alumni.ethz.ch, jreuter@yaina.de, kys@microsoft.com, haiyangz@microsoft.com, wei.liu2@citrix.com, paul.durrant@citrix.com, arvid.brodin@alten.se, pshelar@ovn.org
Cc: dev@openvswitch.org, linux-mips@linux-mips.org, xen-devel@lists.xenproject.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org, linux-can@vger.kernel.org, devel@linuxdriverproject.org, linux-hams@vger.kernel.org, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: xen-devel@lists.xenproject.org

VGhlIG1ldGhvZCBuZG9fc3RhcnRfeG1pdCgpIGlzIGRlZmluZWQgYXMgcmV0dXJuaW5nIGFuICdu
ZXRkZXZfdHhfdCcsCndoaWNoIGlzIGEgdHlwZWRlZiBmb3IgYW4gZW51bSB0eXBlLCBzbyBtYWtl
IHN1cmUgdGhlIGltcGxlbWVudGF0aW9uIGluCnRoaXMgZHJpdmVyIGhhcyByZXR1cm5zICduZXRk
ZXZfdHhfdCcgdmFsdWUsIGFuZCBjaGFuZ2UgdGhlIGZ1bmN0aW9uCnJldHVybiB0eXBlIHRvIG5l
dGRldl90eF90LgoKRm91bmQgYnkgY29jY2luZWxsZS4KClNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJp
bmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9taWNy
ZWwva3M4Njk1bmV0LmMgIHwgMiArLQogZHJpdmVycy9uZXQvZXRoZXJuZXQvbWljcmVsL2tzODg1
MV9tbGwuYyB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvbWljcmVsL2tzODY5
NW5ldC5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvbWljcmVsL2tzODY5NW5ldC5jCmluZGV4IGJk
NTFlMDUuLmI4ODFmNWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L21pY3JlbC9r
czg2OTVuZXQuYworKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9taWNyZWwva3M4Njk1bmV0LmMK
QEAgLTExNjQsNyArMTE2NCw3IEBAIHN0YXRpYyBpbnQga3M4Njk1X3BvbGwoc3RydWN0IG5hcGlf
c3RydWN0ICpuYXBpLCBpbnQgYnVkZ2V0KQogICoJc2tfYnVmZiBhbmQgYWRkcyBpdCB0byB0aGUg
VFggcmluZy4gSXQgdGhlbiBraWNrcyB0aGUgVFggRE1BCiAgKgllbmdpbmUgdG8gZW5zdXJlIHRy
YW5zbWlzc2lvbiBiZWdpbnMuCiAgKi8KLXN0YXRpYyBpbnQKK3N0YXRpYyBuZXRkZXZfdHhfdAog
a3M4Njk1X3N0YXJ0X3htaXQoc3RydWN0IHNrX2J1ZmYgKnNrYiwgc3RydWN0IG5ldF9kZXZpY2Ug
Km5kZXYpCiB7CiAJc3RydWN0IGtzODY5NV9wcml2ICprc3AgPSBuZXRkZXZfcHJpdihuZGV2KTsK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L21pY3JlbC9rczg4NTFfbWxsLmMgYi9k
cml2ZXJzL25ldC9ldGhlcm5ldC9taWNyZWwva3M4ODUxX21sbC5jCmluZGV4IDBlOTcxOWYuLjM1
ZjhjOWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L21pY3JlbC9rczg4NTFfbWxs
LmMKKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvbWljcmVsL2tzODg1MV9tbGwuYwpAQCAtMTAy
MSw5ICsxMDIxLDkgQEAgc3RhdGljIHZvaWQga3Nfd3JpdGVfcW11KHN0cnVjdCBrc19uZXQgKmtz
LCB1OCAqcGRhdGEsIHUxNiBsZW4pCiAgKiBzcGluX2xvY2tfaXJxc2F2ZSBpcyByZXF1aXJlZCBi
ZWNhdXNlIHR4IGFuZCByeCBzaG91bGQgYmUgbXV0dWFsIGV4Y2x1c2l2ZS4KICAqIFNvIHdoaWxl
IHR4IGlzIGluLXByb2dyZXNzLCBwcmV2ZW50IElSUSBpbnRlcnJ1cHQgZnJvbSBoYXBwZW5uaW5n
LgogICovCi1zdGF0aWMgaW50IGtzX3N0YXJ0X3htaXQoc3RydWN0IHNrX2J1ZmYgKnNrYiwgc3Ry
dWN0IG5ldF9kZXZpY2UgKm5ldGRldikKK3N0YXRpYyBuZXRkZXZfdHhfdCBrc19zdGFydF94bWl0
KHN0cnVjdCBza19idWZmICpza2IsIHN0cnVjdCBuZXRfZGV2aWNlICpuZXRkZXYpCiB7Ci0JaW50
IHJldHYgPSBORVRERVZfVFhfT0s7CisJbmV0ZGV2X3R4X3QgcmV0diA9IE5FVERFVl9UWF9PSzsK
IAlzdHJ1Y3Qga3NfbmV0ICprcyA9IG5ldGRldl9wcml2KG5ldGRldik7CiAKIAlkaXNhYmxlX2ly
cShuZXRkZXYtPmlycSk7Ci0tIAoxLjguMy4xCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
