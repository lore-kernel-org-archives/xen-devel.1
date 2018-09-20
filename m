From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH net-next 03/22] net: seeq: fix return type of
 ndo_start_xmit function
Date: Thu, 20 Sep 2018 20:32:47 +0800
Message-ID: <20180920123306.14772-4-yuehaibing__32679.6651389033$1537452496$gmane$org@huawei.com>
References: <20180920123306.14772-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=6zv5=mc=huawei.com=yuehaibing@srs-us1.protection.inumbo.net>)
 id 1g2yNU-0003Oq-05
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 12:48:16 +0000
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
bmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9zZWVx
L2V0aGVyMy5jICB8IDUgKysrLS0KIGRyaXZlcnMvbmV0L2V0aGVybmV0L3NlZXEvc2dpc2VlcS5j
IHwgMyArKy0KIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3NlZXEvZXRoZXIzLmMgYi9kcml2
ZXJzL25ldC9ldGhlcm5ldC9zZWVxL2V0aGVyMy5jCmluZGV4IGM1YmMxMjQuLmQxYmI3M2IgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3NlZXEvZXRoZXIzLmMKKysrIGIvZHJpdmVy
cy9uZXQvZXRoZXJuZXQvc2VlcS9ldGhlcjMuYwpAQCAtNzcsNyArNzcsOCBAQAogc3RhdGljIGlu
dAlldGhlcjNfcngoc3RydWN0IG5ldF9kZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IG1heGNudCk7
CiBzdGF0aWMgdm9pZAlldGhlcjNfdHgoc3RydWN0IG5ldF9kZXZpY2UgKmRldik7CiBzdGF0aWMg
aW50CWV0aGVyM19vcGVuIChzdHJ1Y3QgbmV0X2RldmljZSAqZGV2KTsKLXN0YXRpYyBpbnQJZXRo
ZXIzX3NlbmRwYWNrZXQgKHN0cnVjdCBza19idWZmICpza2IsIHN0cnVjdCBuZXRfZGV2aWNlICpk
ZXYpOworc3RhdGljIG5ldGRldl90eF90CWV0aGVyM19zZW5kcGFja2V0KHN0cnVjdCBza19idWZm
ICpza2IsCisJCQkJCSAgc3RydWN0IG5ldF9kZXZpY2UgKmRldik7CiBzdGF0aWMgaXJxcmV0dXJu
X3QgZXRoZXIzX2ludGVycnVwdCAoaW50IGlycSwgdm9pZCAqZGV2X2lkKTsKIHN0YXRpYyBpbnQJ
ZXRoZXIzX2Nsb3NlIChzdHJ1Y3QgbmV0X2RldmljZSAqZGV2KTsKIHN0YXRpYyB2b2lkCWV0aGVy
M19zZXRtdWx0aWNhc3RsaXN0IChzdHJ1Y3QgbmV0X2RldmljZSAqZGV2KTsKQEAgLTQ4MSw3ICs0
ODIsNyBAQCBzdGF0aWMgdm9pZCBldGhlcjNfdGltZW91dChzdHJ1Y3QgbmV0X2RldmljZSAqZGV2
KQogLyoKICAqIFRyYW5zbWl0IGEgcGFja2V0CiAgKi8KLXN0YXRpYyBpbnQKK3N0YXRpYyBuZXRk
ZXZfdHhfdAogZXRoZXIzX3NlbmRwYWNrZXQoc3RydWN0IHNrX2J1ZmYgKnNrYiwgc3RydWN0IG5l
dF9kZXZpY2UgKmRldikKIHsKIAl1bnNpZ25lZCBsb25nIGZsYWdzOwpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9uZXQvZXRoZXJuZXQvc2VlcS9zZ2lzZWVxLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9z
ZWVxL3NnaXNlZXEuYwppbmRleCA1NzM2OTFiLi43MGNjZTYzIDEwMDY0NAotLS0gYS9kcml2ZXJz
L25ldC9ldGhlcm5ldC9zZWVxL3NnaXNlZXEuYworKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9z
ZWVxL3NnaXNlZXEuYwpAQCAtNTc4LDcgKzU3OCw4IEBAIHN0YXRpYyBpbmxpbmUgaW50IHNnaXNl
ZXFfcmVzZXQoc3RydWN0IG5ldF9kZXZpY2UgKmRldikKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGlj
IGludCBzZ2lzZWVxX3N0YXJ0X3htaXQoc3RydWN0IHNrX2J1ZmYgKnNrYiwgc3RydWN0IG5ldF9k
ZXZpY2UgKmRldikKK3N0YXRpYyBuZXRkZXZfdHhfdAorc2dpc2VlcV9zdGFydF94bWl0KHN0cnVj
dCBza19idWZmICpza2IsIHN0cnVjdCBuZXRfZGV2aWNlICpkZXYpCiB7CiAJc3RydWN0IHNnaXNl
ZXFfcHJpdmF0ZSAqc3AgPSBuZXRkZXZfcHJpdihkZXYpOwogCXN0cnVjdCBocGMzX2V0aHJlZ3Mg
KmhyZWdzID0gc3AtPmhyZWdzOwotLSAKMS44LjMuMQoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
