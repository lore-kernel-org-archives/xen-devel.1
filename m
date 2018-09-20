From: Haiyang Zhang <haiyangz@microsoft.com>
Subject: Re: [PATCH net-next 17/22] hv_netvsc: fix return type
 of ndo_start_xmit function
Date: Thu, 20 Sep 2018 14:40:20 +0000
Message-ID: <BN6PR21MB016115A6ACD7D2685DC0070DCA130__23471.5408449576$1537458726$gmane$org@BN6PR21MB0161.namprd21.prod.outlook.com>
References: <20180920123306.14772-1-yuehaibing@huawei.com>
 <20180920123306.14772-18-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3tze=mc=microsoft.com=haiyangz@srs-us1.protection.inumbo.net>)
 id 1g3082-00085a-Go
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 14:40:26 +0000
In-Reply-To: <20180920123306.14772-18-yuehaibing@huawei.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: YueHaibing <yuehaibing@huawei.com>, "davem@davemloft.net" <davem@davemloft.net>, "dmitry.tarnyagin@lockless.no" <dmitry.tarnyagin@lockless.no>, "wg@grandegger.com" <wg@grandegger.com>, "mkl@pengutronix.de" <mkl@pengutronix.de>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, "hsweeten@visionengravers.com" <hsweeten@visionengravers.com>, "madalin.bucur@nxp.com" <madalin.bucur@nxp.com>, "pantelis.antoniou@gmail.com" <pantelis.antoniou@gmail.com>, "claudiu.manoil@nxp.com" <claudiu.manoil@nxp.com>, "leoyang.li@nxp.com" <leoyang.li@nxp.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "sammy@sammy.net" <sammy@sammy.net>, "ralf@linux-mips.org" <ralf@linux-mips.org>, "nico@fluxnic.net" <nico@fluxnic.net>, "steve.glendinning@shawell.net" <steve.glendinning@shawell.net>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "grygorii.strashko@ti.com" <grygorii.strashko@ti.com>
Cc: "dev@openvswitch.org" <dev@openvswitch.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-can@vger.kernel.org" <linux-can@vger.kernel.org>, "devel@linuxdriverproject.org" <devel@linuxdriverproject.org>, "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: xen-devel@lists.xenproject.org

Cgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogWXVlSGFpYmluZyA8eXVlaGFp
YmluZ0BodWF3ZWkuY29tPgo+IFNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgMjAsIDIwMTggODoz
MyBBTQo+IFRvOiBkYXZlbUBkYXZlbWxvZnQubmV0OyBkbWl0cnkudGFybnlhZ2luQGxvY2tsZXNz
Lm5vOwo+IHdnQGdyYW5kZWdnZXIuY29tOyBta2xAcGVuZ3V0cm9uaXguZGU7IG1pY2hhbC5zaW1l
a0B4aWxpbnguY29tOwo+IGhzd2VldGVuQHZpc2lvbmVuZ3JhdmVycy5jb207IG1hZGFsaW4uYnVj
dXJAbnhwLmNvbTsKPiBwYW50ZWxpcy5hbnRvbmlvdUBnbWFpbC5jb207IGNsYXVkaXUubWFub2ls
QG54cC5jb207IGxlb3lhbmcubGlAbnhwLmNvbTsKPiBsaW51eEBhcm1saW51eC5vcmcudWs7IHNh
bW15QHNhbW15Lm5ldDsgcmFsZkBsaW51eC1taXBzLm9yZzsKPiBuaWNvQGZsdXhuaWMubmV0OyBz
dGV2ZS5nbGVuZGlubmluZ0BzaGF3ZWxsLm5ldDsgZi5mYWluZWxsaUBnbWFpbC5jb207Cj4gZ3J5
Z29yaWkuc3RyYXNoa29AdGkuY29tOyB3LWt3b2syQHRpLmNvbTsgbS1rYXJpY2hlcmkyQHRpLmNv
bTsKPiB0LnNhaWxlckBhbHVtbmkuZXRoei5jaDsganJldXRlckB5YWluYS5kZTsgS1kgU3Jpbml2
YXNhbiA8a3lzQG1pY3Jvc29mdC5jb20+Owo+IEhhaXlhbmcgWmhhbmcgPGhhaXlhbmd6QG1pY3Jv
c29mdC5jb20+OyB3ZWkubGl1MkBjaXRyaXguY29tOwo+IHBhdWwuZHVycmFudEBjaXRyaXguY29t
OyBhcnZpZC5icm9kaW5AYWx0ZW4uc2U7IHBzaGVsYXJAb3ZuLm9yZwo+IENjOiBsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnOyBuZXRkZXZAdmdlci5rZXJuZWwub3JnOyBsaW51eC0KPiBjYW5A
dmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxp
bnV4cHBjLQo+IGRldkBsaXN0cy5vemxhYnMub3JnOyBsaW51eC1taXBzQGxpbnV4LW1pcHMub3Jn
OyBsaW51eC1vbWFwQHZnZXIua2VybmVsLm9yZzsKPiBsaW51eC1oYW1zQHZnZXIua2VybmVsLm9y
ZzsgZGV2ZWxAbGludXhkcml2ZXJwcm9qZWN0Lm9yZzsgbGludXgtCj4gdXNiQHZnZXIua2VybmVs
Lm9yZzsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBkZXZAb3BlbnZzd2l0Y2gub3Jn
Owo+IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KPiBTdWJqZWN0OiBbUEFUQ0gg
bmV0LW5leHQgMTcvMjJdIGh2X25ldHZzYzogZml4IHJldHVybiB0eXBlIG9mIG5kb19zdGFydF94
bWl0Cj4gZnVuY3Rpb24KPiAKPiBUaGUgbWV0aG9kIG5kb19zdGFydF94bWl0KCkgaXMgZGVmaW5l
ZCBhcyByZXR1cm5pbmcgYW4gJ25ldGRldl90eF90Jywgd2hpY2ggaXMKPiBhIHR5cGVkZWYgZm9y
IGFuIGVudW0gdHlwZSwgc28gbWFrZSBzdXJlIHRoZSBpbXBsZW1lbnRhdGlvbiBpbiB0aGlzIGRy
aXZlciBoYXMKPiByZXR1cm5zICduZXRkZXZfdHhfdCcgdmFsdWUsIGFuZCBjaGFuZ2UgdGhlIGZ1
bmN0aW9uIHJldHVybiB0eXBlIHRvIG5ldGRldl90eF90Lgo+IAo+IEZvdW5kIGJ5IGNvY2NpbmVs
bGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29t
Pgo+IC0tLQo+ICBkcml2ZXJzL25ldC9oeXBlcnYvbmV0dnNjX2Rydi5jIHwgMTAgKysrKysrKy0t
LQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9oeXBlcnYvbmV0dnNjX2Rydi5jIGIvZHJpdmVycy9u
ZXQvaHlwZXJ2L25ldHZzY19kcnYuYwo+IGluZGV4IDNhZjZkOGQuLjA1NmM0NzIgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9uZXQvaHlwZXJ2L25ldHZzY19kcnYuYwo+ICsrKyBiL2RyaXZlcnMvbmV0
L2h5cGVydi9uZXR2c2NfZHJ2LmMKPiBAQCAtNTExLDcgKzUxMSw4IEBAIHN0YXRpYyBpbnQgbmV0
dnNjX3ZmX3htaXQoc3RydWN0IG5ldF9kZXZpY2UgKm5ldCwgc3RydWN0Cj4gbmV0X2RldmljZSAq
dmZfbmV0ZGV2LAo+ICAJcmV0dXJuIHJjOwo+ICB9Cj4gCj4gLXN0YXRpYyBpbnQgbmV0dnNjX3N0
YXJ0X3htaXQoc3RydWN0IHNrX2J1ZmYgKnNrYiwgc3RydWN0IG5ldF9kZXZpY2UgKm5ldCkKPiAr
c3RhdGljIG5ldGRldl90eF90Cj4gK25ldHZzY19zdGFydF94bWl0KHN0cnVjdCBza19idWZmICpz
a2IsIHN0cnVjdCBuZXRfZGV2aWNlICpuZXQpCj4gIHsKPiAgCXN0cnVjdCBuZXRfZGV2aWNlX2Nv
bnRleHQgKm5ldF9kZXZpY2VfY3R4ID0gbmV0ZGV2X3ByaXYobmV0KTsKPiAgCXN0cnVjdCBodl9u
ZXR2c2NfcGFja2V0ICpwYWNrZXQgPSBOVUxMOyBAQCAtNTI4LDggKzUyOSwxMSBAQAo+IHN0YXRp
YyBpbnQgbmV0dnNjX3N0YXJ0X3htaXQoc3RydWN0IHNrX2J1ZmYgKnNrYiwgc3RydWN0IG5ldF9k
ZXZpY2UgKm5ldCkKPiAgCSAqLwo+ICAJdmZfbmV0ZGV2ID0gcmN1X2RlcmVmZXJlbmNlX2JoKG5l
dF9kZXZpY2VfY3R4LT52Zl9uZXRkZXYpOwo+ICAJaWYgKHZmX25ldGRldiAmJiBuZXRpZl9ydW5u
aW5nKHZmX25ldGRldikgJiYKPiAtCSAgICAhbmV0cG9sbF90eF9ydW5uaW5nKG5ldCkpCj4gLQkJ
cmV0dXJuIG5ldHZzY192Zl94bWl0KG5ldCwgdmZfbmV0ZGV2LCBza2IpOwo+ICsJICAgICFuZXRw
b2xsX3R4X3J1bm5pbmcobmV0KSkgewo+ICsJCXJldCA9IG5ldHZzY192Zl94bWl0KG5ldCwgdmZf
bmV0ZGV2LCBza2IpOwo+ICsJCWlmIChyZXQpCj4gKwkJCXJldHVybiBORVRERVZfVFhfQlVTWTsK
CkZvciBlcnJvciBjYXNlLCBwbGVhc2UganVzdCByZXR1cm4gTkVUREVWX1RYX09LLiBXZSBhcmUg
bm90IHN1cmUgaWYgdGhlIAplcnJvciBjYW4gZ28gYXdheSBhZnRlciByZXRyeWluZywgcmV0dXJu
aW5nIE5FVERFVl9UWF9CVVNZIG1heSBjYXVzZSAKaW5maW5pdGUgcmV0cnkgZnJvbSB0aGUgdXBw
ZXIgbGF5ZXIuCgpUaGFua3MsCi0gSGFpeWFuZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
