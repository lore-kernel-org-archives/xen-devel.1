From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH net-next 15/22] net: hamradio: fix return type
 of ndo_start_xmit function
Date: Thu, 20 Sep 2018 20:32:59 +0800
Message-ID: <20180920123306.14772-16-yuehaibing__37437.3500505046$1537452466$gmane$org@huawei.com>
References: <20180920123306.14772-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=6zv5=mc=huawei.com=yuehaibing@srs-us1.protection.inumbo.net>)
 id 1g2yO1-0003TM-Pj
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 12:48:49 +0000
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
bmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL25ldC9oYW1yYWRpby9iYXlj
b21fZXBwLmMgfCAzICsrLQogZHJpdmVycy9uZXQvaGFtcmFkaW8vZG1hc2NjLmMgICAgIHwgNCAr
Ky0tCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL25ldC9oYW1yYWRpby9iYXljb21fZXBwLmMgYi9kcml2ZXJzL25l
dC9oYW1yYWRpby9iYXljb21fZXBwLmMKaW5kZXggMWU2MmQwMC4uZjRjZWNjZiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9uZXQvaGFtcmFkaW8vYmF5Y29tX2VwcC5jCisrKyBiL2RyaXZlcnMvbmV0L2hh
bXJhZGlvL2JheWNvbV9lcHAuYwpAQCAtNzcyLDcgKzc3Miw4IEBAIHN0YXRpYyB2b2lkIGVwcF9i
aChzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCiAgKiA9PT09PT09PT09PT09PT09PT09PT0gbmV0
d29yayBkcml2ZXIgaW50ZXJmYWNlID09PT09PT09PT09PT09PT09PT09PT09PT0KICAqLwogCi1z
dGF0aWMgaW50IGJheWNvbV9zZW5kX3BhY2tldChzdHJ1Y3Qgc2tfYnVmZiAqc2tiLCBzdHJ1Y3Qg
bmV0X2RldmljZSAqZGV2KQorc3RhdGljIG5ldGRldl90eF90CitiYXljb21fc2VuZF9wYWNrZXQo
c3RydWN0IHNrX2J1ZmYgKnNrYiwgc3RydWN0IG5ldF9kZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3Qg
YmF5Y29tX3N0YXRlICpiYyA9IG5ldGRldl9wcml2KGRldik7CiAKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbmV0L2hhbXJhZGlvL2RtYXNjYy5jIGIvZHJpdmVycy9uZXQvaGFtcmFkaW8vZG1hc2NjLmMK
aW5kZXggY2RlNDEyMC4uMjc5ODg3MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvaGFtcmFkaW8v
ZG1hc2NjLmMKKysrIGIvZHJpdmVycy9uZXQvaGFtcmFkaW8vZG1hc2NjLmMKQEAgLTIzOSw3ICsy
MzksNyBAQCBzdHJ1Y3Qgc2NjX2luZm8gewogc3RhdGljIGludCBzY2Nfb3BlbihzdHJ1Y3QgbmV0
X2RldmljZSAqZGV2KTsKIHN0YXRpYyBpbnQgc2NjX2Nsb3NlKHN0cnVjdCBuZXRfZGV2aWNlICpk
ZXYpOwogc3RhdGljIGludCBzY2NfaW9jdGwoc3RydWN0IG5ldF9kZXZpY2UgKmRldiwgc3RydWN0
IGlmcmVxICppZnIsIGludCBjbWQpOwotc3RhdGljIGludCBzY2Nfc2VuZF9wYWNrZXQoc3RydWN0
IHNrX2J1ZmYgKnNrYiwgc3RydWN0IG5ldF9kZXZpY2UgKmRldik7CitzdGF0aWMgbmV0ZGV2X3R4
X3Qgc2NjX3NlbmRfcGFja2V0KHN0cnVjdCBza19idWZmICpza2IsIHN0cnVjdCBuZXRfZGV2aWNl
ICpkZXYpOwogc3RhdGljIGludCBzY2Nfc2V0X21hY19hZGRyZXNzKHN0cnVjdCBuZXRfZGV2aWNl
ICpkZXYsIHZvaWQgKnNhKTsKIAogc3RhdGljIGlubGluZSB2b2lkIHR4X29uKHN0cnVjdCBzY2Nf
cHJpdiAqcHJpdik7CkBAIC05MjEsNyArOTIxLDcgQEAgc3RhdGljIGludCBzY2NfaW9jdGwoc3Ry
dWN0IG5ldF9kZXZpY2UgKmRldiwgc3RydWN0IGlmcmVxICppZnIsIGludCBjbWQpCiB9CiAKIAot
c3RhdGljIGludCBzY2Nfc2VuZF9wYWNrZXQoc3RydWN0IHNrX2J1ZmYgKnNrYiwgc3RydWN0IG5l
dF9kZXZpY2UgKmRldikKK3N0YXRpYyBuZXRkZXZfdHhfdCBzY2Nfc2VuZF9wYWNrZXQoc3RydWN0
IHNrX2J1ZmYgKnNrYiwgc3RydWN0IG5ldF9kZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3Qgc2NjX3By
aXYgKnByaXYgPSBkZXYtPm1sX3ByaXY7CiAJdW5zaWduZWQgbG9uZyBmbGFnczsKLS0gCjEuOC4z
LjEKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
