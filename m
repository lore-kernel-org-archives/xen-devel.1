From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH net-next 19/22] net: plip: fix return type of
 ndo_start_xmit function
Date: Thu, 20 Sep 2018 20:33:03 +0800
Message-ID: <20180920123306.14772-20-yuehaibing__40923.5948617153$1537452468$gmane$org@huawei.com>
References: <20180920123306.14772-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=6zv5=mc=huawei.com=yuehaibing@srs-us1.protection.inumbo.net>)
 id 1g2yOD-0003Vi-F9
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 12:49:01 +0000
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
bmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL25ldC9wbGlwL3BsaXAuYyB8
IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9wbGlwL3BsaXAuYyBiL2RyaXZlcnMvbmV0L3BsaXAv
cGxpcC5jCmluZGV4IGZlYjkyZWMuLjBiMzU0ZTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L3Bs
aXAvcGxpcC5jCisrKyBiL2RyaXZlcnMvbmV0L3BsaXAvcGxpcC5jCkBAIC0xNDYsNyArMTQ2LDcg
QEAKIHN0YXRpYyB2b2lkIHBsaXBfaW50ZXJydXB0KHZvaWQgKmRldl9pZCk7CiAKIC8qIEZ1bmN0
aW9ucyBmb3IgREVWIG1ldGhvZHMgKi8KLXN0YXRpYyBpbnQgcGxpcF90eF9wYWNrZXQoc3RydWN0
IHNrX2J1ZmYgKnNrYiwgc3RydWN0IG5ldF9kZXZpY2UgKmRldik7CitzdGF0aWMgbmV0ZGV2X3R4
X3QgcGxpcF90eF9wYWNrZXQoc3RydWN0IHNrX2J1ZmYgKnNrYiwgc3RydWN0IG5ldF9kZXZpY2Ug
KmRldik7CiBzdGF0aWMgaW50IHBsaXBfaGFyZF9oZWFkZXIoc3RydWN0IHNrX2J1ZmYgKnNrYiwg
c3RydWN0IG5ldF9kZXZpY2UgKmRldiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBzaG9ydCB0eXBlLCBjb25zdCB2b2lkICpkYWRkciwKIAkJCSAgICBjb25zdCB2b2lkICpz
YWRkciwgdW5zaWduZWQgbGVuKTsKQEAgLTk2Miw3ICs5NjIsNyBAQCBzdGF0aWMgX19iZTE2IHBs
aXBfdHlwZV90cmFucyhzdHJ1Y3Qgc2tfYnVmZiAqc2tiLCBzdHJ1Y3QgbmV0X2RldmljZSAqZGV2
KQogCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJm5sLT5sb2NrLCBmbGFncyk7CiB9CiAKLXN0YXRp
YyBpbnQKK3N0YXRpYyBuZXRkZXZfdHhfdAogcGxpcF90eF9wYWNrZXQoc3RydWN0IHNrX2J1ZmYg
KnNrYiwgc3RydWN0IG5ldF9kZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3QgbmV0X2xvY2FsICpubCA9
IG5ldGRldl9wcml2KGRldik7Ci0tIAoxLjguMy4xCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
