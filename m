From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH net-next 21/22] l2tp: fix return type of
 ndo_start_xmit function
Date: Thu, 20 Sep 2018 20:33:05 +0800
Message-ID: <20180920123306.14772-22-yuehaibing__28283.3074489192$1537452466$gmane$org@huawei.com>
References: <20180920123306.14772-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=6zv5=mc=huawei.com=yuehaibing@srs-us1.protection.inumbo.net>)
 id 1g2yOH-0003WM-VH
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 12:49:05 +0000
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
bmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KLS0tCiBuZXQvbDJ0cC9sMnRwX2V0aC5jIHwgMyAr
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9uZXQvbDJ0cC9sMnRwX2V0aC5jIGIvbmV0L2wydHAvbDJ0cF9ldGguYwppbmRleCA4
YWFkYzRmLi40MTczY2IxIDEwMDY0NAotLS0gYS9uZXQvbDJ0cC9sMnRwX2V0aC5jCisrKyBiL25l
dC9sMnRwL2wydHBfZXRoLmMKQEAgLTc3LDcgKzc3LDggQEAgc3RhdGljIHZvaWQgbDJ0cF9ldGhf
ZGV2X3VuaW5pdChzdHJ1Y3QgbmV0X2RldmljZSAqZGV2KQogCSAqLwogfQogCi1zdGF0aWMgaW50
IGwydHBfZXRoX2Rldl94bWl0KHN0cnVjdCBza19idWZmICpza2IsIHN0cnVjdCBuZXRfZGV2aWNl
ICpkZXYpCitzdGF0aWMgbmV0ZGV2X3R4X3QKK2wydHBfZXRoX2Rldl94bWl0KHN0cnVjdCBza19i
dWZmICpza2IsIHN0cnVjdCBuZXRfZGV2aWNlICpkZXYpCiB7CiAJc3RydWN0IGwydHBfZXRoICpw
cml2ID0gbmV0ZGV2X3ByaXYoZGV2KTsKIAlzdHJ1Y3QgbDJ0cF9zZXNzaW9uICpzZXNzaW9uID0g
cHJpdi0+c2Vzc2lvbjsKLS0gCjEuOC4zLjEKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
