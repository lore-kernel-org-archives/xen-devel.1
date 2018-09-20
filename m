From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH net-next 11/22] net: faraday: fix return type of
 ndo_start_xmit function
Date: Thu, 20 Sep 2018 20:32:55 +0800
Message-ID: <20180920123306.14772-12-yuehaibing__1047.83734209395$1537452495$gmane$org@huawei.com>
References: <20180920123306.14772-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=6zv5=mc=huawei.com=yuehaibing@srs-us1.protection.inumbo.net>)
 id 1g2yNr-0003Rh-RW
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 12:48:39 +0000
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
ZXRkZXZfdHhfdCcsCndoaWNoIGlzIGEgdHlwZWRlZiBmb3IgYW4gZW51bSB0eXBlLCBidXQgdGhl
IGltcGxlbWVudGF0aW9uIGluIHRoaXMKZHJpdmVyIHJldHVybnMgYW4gJ2ludCcuCgpGb3VuZCBi
eSBjb2NjaW5lbGxlLgoKU2lnbmVkLW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3
ZWkuY29tPgotLS0KIGRyaXZlcnMvbmV0L2V0aGVybmV0L2ZhcmFkYXkvZnRnbWFjMTAwLmMgfCA0
ICsrLS0KIGRyaXZlcnMvbmV0L2V0aGVybmV0L2ZhcmFkYXkvZnRtYWMxMDAuYyAgfCA3ICsrKyst
LS0KIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2ZhcmFkYXkvZnRnbWFjMTAwLmMgYi9kcml2
ZXJzL25ldC9ldGhlcm5ldC9mYXJhZGF5L2Z0Z21hYzEwMC5jCmluZGV4IGQ4ZWFkN2UuLjRkNjcz
MjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2ZhcmFkYXkvZnRnbWFjMTAwLmMK
KysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvZmFyYWRheS9mdGdtYWMxMDAuYwpAQCAtNzEyLDgg
KzcxMiw4IEBAIHN0YXRpYyBib29sIGZ0Z21hYzEwMF9wcmVwX3R4X2NzdW0oc3RydWN0IHNrX2J1
ZmYgKnNrYiwgdTMyICpjc3VtX3ZsYW4pCiAJcmV0dXJuIHNrYl9jaGVja3N1bV9oZWxwKHNrYikg
PT0gMDsKIH0KIAotc3RhdGljIGludCBmdGdtYWMxMDBfaGFyZF9zdGFydF94bWl0KHN0cnVjdCBz
a19idWZmICpza2IsCi0JCQkJICAgICBzdHJ1Y3QgbmV0X2RldmljZSAqbmV0ZGV2KQorc3RhdGlj
IG5ldGRldl90eF90IGZ0Z21hYzEwMF9oYXJkX3N0YXJ0X3htaXQoc3RydWN0IHNrX2J1ZmYgKnNr
YiwKKwkJCQkJICAgICBzdHJ1Y3QgbmV0X2RldmljZSAqbmV0ZGV2KQogewogCXN0cnVjdCBmdGdt
YWMxMDAgKnByaXYgPSBuZXRkZXZfcHJpdihuZXRkZXYpOwogCXN0cnVjdCBmdGdtYWMxMDBfdHhk
ZXMgKnR4ZGVzLCAqZmlyc3Q7CmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9mYXJh
ZGF5L2Z0bWFjMTAwLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9mYXJhZGF5L2Z0bWFjMTAwLmMK
aW5kZXggYTExOTdkMy4uNTcwY2FlYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQv
ZmFyYWRheS9mdG1hYzEwMC5jCisrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L2ZhcmFkYXkvZnRt
YWMxMDAuYwpAQCAtNjM0LDggKzYzNCw4IEBAIHN0YXRpYyB2b2lkIGZ0bWFjMTAwX3R4X2NvbXBs
ZXRlKHN0cnVjdCBmdG1hYzEwMCAqcHJpdikKIAkJOwogfQogCi1zdGF0aWMgaW50IGZ0bWFjMTAw
X3htaXQoc3RydWN0IGZ0bWFjMTAwICpwcml2LCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiLAotCQkJIGRt
YV9hZGRyX3QgbWFwKQorc3RhdGljIG5ldGRldl90eF90IGZ0bWFjMTAwX3htaXQoc3RydWN0IGZ0
bWFjMTAwICpwcml2LCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiLAorCQkJCSBkbWFfYWRkcl90IG1hcCkK
IHsKIAlzdHJ1Y3QgbmV0X2RldmljZSAqbmV0ZGV2ID0gcHJpdi0+bmV0ZGV2OwogCXN0cnVjdCBm
dG1hYzEwMF90eGRlcyAqdHhkZXM7CkBAIC0xMDE2LDcgKzEwMTYsOCBAQCBzdGF0aWMgaW50IGZ0
bWFjMTAwX3N0b3Aoc3RydWN0IG5ldF9kZXZpY2UgKm5ldGRldikKIAlyZXR1cm4gMDsKIH0KIAot
c3RhdGljIGludCBmdG1hYzEwMF9oYXJkX3N0YXJ0X3htaXQoc3RydWN0IHNrX2J1ZmYgKnNrYiwg
c3RydWN0IG5ldF9kZXZpY2UgKm5ldGRldikKK3N0YXRpYyBuZXRkZXZfdHhfdAorZnRtYWMxMDBf
aGFyZF9zdGFydF94bWl0KHN0cnVjdCBza19idWZmICpza2IsIHN0cnVjdCBuZXRfZGV2aWNlICpu
ZXRkZXYpCiB7CiAJc3RydWN0IGZ0bWFjMTAwICpwcml2ID0gbmV0ZGV2X3ByaXYobmV0ZGV2KTsK
IAlkbWFfYWRkcl90IG1hcDsKLS0gCjEuOC4zLjEKCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
