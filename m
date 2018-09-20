From: Stephen Hemminger <stephen@networkplumber.org>
Subject: Re: [PATCH net-next 17/22] hv_netvsc: fix return type
 of ndo_start_xmit function
Date: Thu, 20 Sep 2018 07:43:41 -0700
Message-ID: <20180920074341.3acef75c__20994.1643559889$1537454561$gmane$org@xeon-e3>
References: <20180920123306.14772-1-yuehaibing@huawei.com>
 <20180920123306.14772-18-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=q1yk=mc=networkplumber.org=stephen@srs-us1.protection.inumbo.net>)
 id 1g30BN-0008HL-PJ
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 14:43:53 +0000
Received: by mail-pf1-x444.google.com with SMTP id k19-v6so4492192pfi.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Sep 2018 07:43:51 -0700 (PDT)
In-Reply-To: <20180920123306.14772-18-yuehaibing@huawei.com>
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

T24gVGh1LCAyMCBTZXAgMjAxOCAyMDozMzowMSArMDgwMApZdWVIYWliaW5nIDx5dWVoYWliaW5n
QGh1YXdlaS5jb20+IHdyb3RlOgoKPiBUaGUgbWV0aG9kIG5kb19zdGFydF94bWl0KCkgaXMgZGVm
aW5lZCBhcyByZXR1cm5pbmcgYW4gJ25ldGRldl90eF90JywKPiB3aGljaCBpcyBhIHR5cGVkZWYg
Zm9yIGFuIGVudW0gdHlwZSwgc28gbWFrZSBzdXJlIHRoZSBpbXBsZW1lbnRhdGlvbiBpbgo+IHRo
aXMgZHJpdmVyIGhhcyByZXR1cm5zICduZXRkZXZfdHhfdCcgdmFsdWUsIGFuZCBjaGFuZ2UgdGhl
IGZ1bmN0aW9uCj4gcmV0dXJuIHR5cGUgdG8gbmV0ZGV2X3R4X3QuCj4gCj4gRm91bmQgYnkgY29j
Y2luZWxsZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdl
aS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbmV0L2h5cGVydi9uZXR2c2NfZHJ2LmMgfCAxMCArKysr
KysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2h5cGVydi9uZXR2c2NfZHJ2LmMgYi9kcml2
ZXJzL25ldC9oeXBlcnYvbmV0dnNjX2Rydi5jCj4gaW5kZXggM2FmNmQ4ZC4uMDU2YzQ3MiAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL25ldC9oeXBlcnYvbmV0dnNjX2Rydi5jCj4gKysrIGIvZHJpdmVy
cy9uZXQvaHlwZXJ2L25ldHZzY19kcnYuYwo+IEBAIC01MTEsNyArNTExLDggQEAgc3RhdGljIGlu
dCBuZXR2c2NfdmZfeG1pdChzdHJ1Y3QgbmV0X2RldmljZSAqbmV0LCBzdHJ1Y3QgbmV0X2Rldmlj
ZSAqdmZfbmV0ZGV2LAo+ICAJcmV0dXJuIHJjOwo+ICB9Cj4gIAo+IC1zdGF0aWMgaW50IG5ldHZz
Y19zdGFydF94bWl0KHN0cnVjdCBza19idWZmICpza2IsIHN0cnVjdCBuZXRfZGV2aWNlICpuZXQp
Cj4gK3N0YXRpYyBuZXRkZXZfdHhfdAo+ICtuZXR2c2Nfc3RhcnRfeG1pdChzdHJ1Y3Qgc2tfYnVm
ZiAqc2tiLCBzdHJ1Y3QgbmV0X2RldmljZSAqbmV0KQo+ICB7Cj4gIAlzdHJ1Y3QgbmV0X2Rldmlj
ZV9jb250ZXh0ICpuZXRfZGV2aWNlX2N0eCA9IG5ldGRldl9wcml2KG5ldCk7Cj4gIAlzdHJ1Y3Qg
aHZfbmV0dnNjX3BhY2tldCAqcGFja2V0ID0gTlVMTDsKPiBAQCAtNTI4LDggKzUyOSwxMSBAQCBz
dGF0aWMgaW50IG5ldHZzY19zdGFydF94bWl0KHN0cnVjdCBza19idWZmICpza2IsIHN0cnVjdCBu
ZXRfZGV2aWNlICpuZXQpCj4gIAkgKi8KPiAgCXZmX25ldGRldiA9IHJjdV9kZXJlZmVyZW5jZV9i
aChuZXRfZGV2aWNlX2N0eC0+dmZfbmV0ZGV2KTsKPiAgCWlmICh2Zl9uZXRkZXYgJiYgbmV0aWZf
cnVubmluZyh2Zl9uZXRkZXYpICYmCj4gLQkgICAgIW5ldHBvbGxfdHhfcnVubmluZyhuZXQpKQo+
IC0JCXJldHVybiBuZXR2c2NfdmZfeG1pdChuZXQsIHZmX25ldGRldiwgc2tiKTsKPiArCSAgICAh
bmV0cG9sbF90eF9ydW5uaW5nKG5ldCkpIHsKPiArCQlyZXQgPSBuZXR2c2NfdmZfeG1pdChuZXQs
IHZmX25ldGRldiwgc2tiKTsKPiArCQlpZiAocmV0KQo+ICsJCQlyZXR1cm4gTkVUREVWX1RYX0JV
U1k7Cj4gKwl9CgpTb3JyeSwgdGhlIG5ldyBjb2RlIGlzIHdyb25nLiBJdCB3aWxsIGZhbGwgdGhy
b3VnaCBpZiByZXQgPT0gMCAoTkVUREVWX1RYX09LKQpQbGVhc2UgcmV2aWV3IGFuZCB0ZXN0IHlv
dXIgcGF0Y2hlcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
