From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH net-next 17/22] hv_netvsc: fix return type of
 ndo_start_xmit function
Date: Thu, 20 Sep 2018 20:33:01 +0800
Message-ID: <20180920123306.14772-18-yuehaibing__21704.9898616553$1537452466$gmane$org@huawei.com>
References: <20180920123306.14772-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=6zv5=mc=huawei.com=yuehaibing@srs-us1.protection.inumbo.net>)
 id 1g2yO9-0003Us-7T
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 12:48:57 +0000
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
bmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL25ldC9oeXBlcnYvbmV0dnNj
X2Rydi5jIHwgMTAgKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9oeXBlcnYvbmV0dnNjX2Ry
di5jIGIvZHJpdmVycy9uZXQvaHlwZXJ2L25ldHZzY19kcnYuYwppbmRleCAzYWY2ZDhkLi4wNTZj
NDcyIDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC9oeXBlcnYvbmV0dnNjX2Rydi5jCisrKyBiL2Ry
aXZlcnMvbmV0L2h5cGVydi9uZXR2c2NfZHJ2LmMKQEAgLTUxMSw3ICs1MTEsOCBAQCBzdGF0aWMg
aW50IG5ldHZzY192Zl94bWl0KHN0cnVjdCBuZXRfZGV2aWNlICpuZXQsIHN0cnVjdCBuZXRfZGV2
aWNlICp2Zl9uZXRkZXYsCiAJcmV0dXJuIHJjOwogfQogCi1zdGF0aWMgaW50IG5ldHZzY19zdGFy
dF94bWl0KHN0cnVjdCBza19idWZmICpza2IsIHN0cnVjdCBuZXRfZGV2aWNlICpuZXQpCitzdGF0
aWMgbmV0ZGV2X3R4X3QKK25ldHZzY19zdGFydF94bWl0KHN0cnVjdCBza19idWZmICpza2IsIHN0
cnVjdCBuZXRfZGV2aWNlICpuZXQpCiB7CiAJc3RydWN0IG5ldF9kZXZpY2VfY29udGV4dCAqbmV0
X2RldmljZV9jdHggPSBuZXRkZXZfcHJpdihuZXQpOwogCXN0cnVjdCBodl9uZXR2c2NfcGFja2V0
ICpwYWNrZXQgPSBOVUxMOwpAQCAtNTI4LDggKzUyOSwxMSBAQCBzdGF0aWMgaW50IG5ldHZzY19z
dGFydF94bWl0KHN0cnVjdCBza19idWZmICpza2IsIHN0cnVjdCBuZXRfZGV2aWNlICpuZXQpCiAJ
ICovCiAJdmZfbmV0ZGV2ID0gcmN1X2RlcmVmZXJlbmNlX2JoKG5ldF9kZXZpY2VfY3R4LT52Zl9u
ZXRkZXYpOwogCWlmICh2Zl9uZXRkZXYgJiYgbmV0aWZfcnVubmluZyh2Zl9uZXRkZXYpICYmCi0J
ICAgICFuZXRwb2xsX3R4X3J1bm5pbmcobmV0KSkKLQkJcmV0dXJuIG5ldHZzY192Zl94bWl0KG5l
dCwgdmZfbmV0ZGV2LCBza2IpOworCSAgICAhbmV0cG9sbF90eF9ydW5uaW5nKG5ldCkpIHsKKwkJ
cmV0ID0gbmV0dnNjX3ZmX3htaXQobmV0LCB2Zl9uZXRkZXYsIHNrYik7CisJCWlmIChyZXQpCisJ
CQlyZXR1cm4gTkVUREVWX1RYX0JVU1k7CisJfQogCiAJLyogV2Ugd2lsbCBhdG1vc3QgbmVlZCB0
d28gcGFnZXMgdG8gZGVzY3JpYmUgdGhlIHJuZGlzCiAJICogaGVhZGVyLiBXZSBjYW4gb25seSB0
cmFuc21pdCBNQVhfUEFHRV9CVUZGRVJfQ09VTlQgbnVtYmVyCi0tIAoxLjguMy4xCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
