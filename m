From: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH net-next 17/22] hv_netvsc: fix return type
 of ndo_start_xmit function
Date: Fri, 21 Sep 2018 09:37:50 +0800
Message-ID: <b9b170c4-caba-928e-4c6f-eb51cb5e4707__19817.231121897$1537493809$gmane$org@huawei.com>
References: <20180920123306.14772-1-yuehaibing@huawei.com>
 <20180920123306.14772-18-yuehaibing@huawei.com>
 <20180920074341.3acef75c@xeon-e3>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hfhm=md=huawei.com=yuehaibing@srs-us1.protection.inumbo.net>)
 id 1g3AOM-00051M-Cq
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 01:37:58 +0000
In-Reply-To: <20180920074341.3acef75c@xeon-e3>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: dmitry.tarnyagin@lockless.no, madalin.bucur@nxp.com, linux-mips@linux-mips.org, linux@armlinux.org.uk, pantelis.antoniou@gmail.com, kys@microsoft.com, t.sailer@alumni.ethz.ch, dev@openvswitch.org, f.fainelli@gmail.com, arvid.brodin@alten.se, michal.simek@xilinx.com, pshelar@ovn.org, m-karicheri2@ti.com, xen-devel@lists.xenproject.org, jreuter@yaina.de, sammy@sammy.net, grygorii.strashko@ti.com, w-kwok2@ti.com, haiyangz@microsoft.com, steve.glendinning@shawell.net, linux-can@vger.kernel.org, claudiu.manoil@nxp.com, paul.durrant@citrix.com, mkl@pengutronix.de, linux-hams@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, wei.liu2@citrix.com, nico@fluxnic.net, netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, ralf@linux-mips.org, leoyang.li@nxp.com, hsweeten@visionengravers.com, wg@grandegger.com, devel@linuxdriv
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOC85LzIwIDIyOjQzLCBTdGVwaGVuIEhlbW1pbmdlciB3cm90ZToKPiBPbiBUaHUsIDIw
IFNlcCAyMDE4IDIwOjMzOjAxICswODAwCj4gWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWku
Y29tPiB3cm90ZToKPiAKPj4gVGhlIG1ldGhvZCBuZG9fc3RhcnRfeG1pdCgpIGlzIGRlZmluZWQg
YXMgcmV0dXJuaW5nIGFuICduZXRkZXZfdHhfdCcsCj4+IHdoaWNoIGlzIGEgdHlwZWRlZiBmb3Ig
YW4gZW51bSB0eXBlLCBzbyBtYWtlIHN1cmUgdGhlIGltcGxlbWVudGF0aW9uIGluCj4+IHRoaXMg
ZHJpdmVyIGhhcyByZXR1cm5zICduZXRkZXZfdHhfdCcgdmFsdWUsIGFuZCBjaGFuZ2UgdGhlIGZ1
bmN0aW9uCj4+IHJldHVybiB0eXBlIHRvIG5ldGRldl90eF90Lgo+Pgo+PiBGb3VuZCBieSBjb2Nj
aW5lbGxlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdl
aS5jb20+Cj4+IC0tLQo+PiAgZHJpdmVycy9uZXQvaHlwZXJ2L25ldHZzY19kcnYuYyB8IDEwICsr
KysrKystLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9oeXBlcnYvbmV0dnNjX2Rydi5jIGIv
ZHJpdmVycy9uZXQvaHlwZXJ2L25ldHZzY19kcnYuYwo+PiBpbmRleCAzYWY2ZDhkLi4wNTZjNDcy
IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL25ldC9oeXBlcnYvbmV0dnNjX2Rydi5jCj4+ICsrKyBi
L2RyaXZlcnMvbmV0L2h5cGVydi9uZXR2c2NfZHJ2LmMKPj4gQEAgLTUxMSw3ICs1MTEsOCBAQCBz
dGF0aWMgaW50IG5ldHZzY192Zl94bWl0KHN0cnVjdCBuZXRfZGV2aWNlICpuZXQsIHN0cnVjdCBu
ZXRfZGV2aWNlICp2Zl9uZXRkZXYsCj4+ICAJcmV0dXJuIHJjOwo+PiAgfQo+PiAgCj4+IC1zdGF0
aWMgaW50IG5ldHZzY19zdGFydF94bWl0KHN0cnVjdCBza19idWZmICpza2IsIHN0cnVjdCBuZXRf
ZGV2aWNlICpuZXQpCj4+ICtzdGF0aWMgbmV0ZGV2X3R4X3QKPj4gK25ldHZzY19zdGFydF94bWl0
KHN0cnVjdCBza19idWZmICpza2IsIHN0cnVjdCBuZXRfZGV2aWNlICpuZXQpCj4+ICB7Cj4+ICAJ
c3RydWN0IG5ldF9kZXZpY2VfY29udGV4dCAqbmV0X2RldmljZV9jdHggPSBuZXRkZXZfcHJpdihu
ZXQpOwo+PiAgCXN0cnVjdCBodl9uZXR2c2NfcGFja2V0ICpwYWNrZXQgPSBOVUxMOwo+PiBAQCAt
NTI4LDggKzUyOSwxMSBAQCBzdGF0aWMgaW50IG5ldHZzY19zdGFydF94bWl0KHN0cnVjdCBza19i
dWZmICpza2IsIHN0cnVjdCBuZXRfZGV2aWNlICpuZXQpCj4+ICAJICovCj4+ICAJdmZfbmV0ZGV2
ID0gcmN1X2RlcmVmZXJlbmNlX2JoKG5ldF9kZXZpY2VfY3R4LT52Zl9uZXRkZXYpOwo+PiAgCWlm
ICh2Zl9uZXRkZXYgJiYgbmV0aWZfcnVubmluZyh2Zl9uZXRkZXYpICYmCj4+IC0JICAgICFuZXRw
b2xsX3R4X3J1bm5pbmcobmV0KSkKPj4gLQkJcmV0dXJuIG5ldHZzY192Zl94bWl0KG5ldCwgdmZf
bmV0ZGV2LCBza2IpOwo+PiArCSAgICAhbmV0cG9sbF90eF9ydW5uaW5nKG5ldCkpIHsKPj4gKwkJ
cmV0ID0gbmV0dnNjX3ZmX3htaXQobmV0LCB2Zl9uZXRkZXYsIHNrYik7Cj4+ICsJCWlmIChyZXQp
Cj4+ICsJCQlyZXR1cm4gTkVUREVWX1RYX0JVU1k7Cj4+ICsJfQo+IAo+IFNvcnJ5LCB0aGUgbmV3
IGNvZGUgaXMgd3JvbmcuIEl0IHdpbGwgZmFsbCB0aHJvdWdoIGlmIHJldCA9PSAwIChORVRERVZf
VFhfT0spCj4gUGxlYXNlIHJldmlldyBhbmQgdGVzdCB5b3VyIHBhdGNoZXMuCgpJJ20gc29ycnkg
Zm9yIHRoaXMsIHdpbGwgY29ycmVjdCBpdCBhcyBIYWl5YW5nJ3Mgc3VnZ2VzdGlvbi4KCj4gCj4g
Lgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
