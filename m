From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH net-next 06/22] net: wiznet: fix return type of
 ndo_start_xmit function
Date: Thu, 20 Sep 2018 20:32:50 +0800
Message-ID: <20180920123306.14772-7-yuehaibing__35281.5727507279$1537452492$gmane$org@huawei.com>
References: <20180920123306.14772-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=6zv5=mc=huawei.com=yuehaibing@srs-us1.protection.inumbo.net>)
 id 1g2yNd-0003Pp-0j
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 12:48:25 +0000
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
bmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL25ldC9ldGhlcm5ldC93aXpu
ZXQvdzUxMDAuYyB8IDIgKy0KIGRyaXZlcnMvbmV0L2V0aGVybmV0L3dpem5ldC93NTMwMC5jIHwg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvd2l6bmV0L3c1MTAwLmMgYi9kcml2ZXJz
L25ldC9ldGhlcm5ldC93aXpuZXQvdzUxMDAuYwppbmRleCAyYmRmYjM5Li5kOGJhNTEyIDEwMDY0
NAotLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC93aXpuZXQvdzUxMDAuYworKysgYi9kcml2ZXJz
L25ldC9ldGhlcm5ldC93aXpuZXQvdzUxMDAuYwpAQCAtODM1LDcgKzgzNSw3IEBAIHN0YXRpYyB2
b2lkIHc1MTAwX3R4X3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQogCXc1MTAwX3R4X3Nr
Yihwcml2LT5uZGV2LCBza2IpOwogfQogCi1zdGF0aWMgaW50IHc1MTAwX3N0YXJ0X3R4KHN0cnVj
dCBza19idWZmICpza2IsIHN0cnVjdCBuZXRfZGV2aWNlICpuZGV2KQorc3RhdGljIG5ldGRldl90
eF90IHc1MTAwX3N0YXJ0X3R4KHN0cnVjdCBza19idWZmICpza2IsIHN0cnVjdCBuZXRfZGV2aWNl
ICpuZGV2KQogewogCXN0cnVjdCB3NTEwMF9wcml2ICpwcml2ID0gbmV0ZGV2X3ByaXYobmRldik7
CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3dpem5ldC93NTMwMC5jIGIvZHJp
dmVycy9uZXQvZXRoZXJuZXQvd2l6bmV0L3c1MzAwLmMKaW5kZXggNTZhZTU3My4uODBmZGJmZiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvd2l6bmV0L3c1MzAwLmMKKysrIGIvZHJp
dmVycy9uZXQvZXRoZXJuZXQvd2l6bmV0L3c1MzAwLmMKQEAgLTM2NSw3ICszNjUsNyBAQCBzdGF0
aWMgdm9pZCB3NTMwMF90eF90aW1lb3V0KHN0cnVjdCBuZXRfZGV2aWNlICpuZGV2KQogCW5ldGlm
X3dha2VfcXVldWUobmRldik7CiB9CiAKLXN0YXRpYyBpbnQgdzUzMDBfc3RhcnRfdHgoc3RydWN0
IHNrX2J1ZmYgKnNrYiwgc3RydWN0IG5ldF9kZXZpY2UgKm5kZXYpCitzdGF0aWMgbmV0ZGV2X3R4
X3QgdzUzMDBfc3RhcnRfdHgoc3RydWN0IHNrX2J1ZmYgKnNrYiwgc3RydWN0IG5ldF9kZXZpY2Ug
Km5kZXYpCiB7CiAJc3RydWN0IHc1MzAwX3ByaXYgKnByaXYgPSBuZXRkZXZfcHJpdihuZGV2KTsK
IAotLSAKMS44LjMuMQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
