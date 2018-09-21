From: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH net-next 17/22] hv_netvsc: fix return type
 of ndo_start_xmit function
Date: Fri, 21 Sep 2018 09:35:13 +0800
Message-ID: <1dfae517-640a-fa56-34e8-52964c29a15f__9864.43458027697$1537493659$gmane$org@huawei.com>
References: <20180920123306.14772-1-yuehaibing@huawei.com>
 <20180920123306.14772-18-yuehaibing@huawei.com>
 <20180920074341.3acef75c@xeon-e3>
 <BN6PR21MB016180C794F26A279345A17FCA130@BN6PR21MB0161.namprd21.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hfhm=md=huawei.com=yuehaibing@srs-us1.protection.inumbo.net>)
 id 1g3ALt-0004r1-JR
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 01:35:25 +0000
In-Reply-To: <BN6PR21MB016180C794F26A279345A17FCA130@BN6PR21MB0161.namprd21.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Haiyang Zhang <haiyangz@microsoft.com>, Stephen Hemminger <stephen@networkplumber.org>
Cc: "dmitry.tarnyagin@lockless.no" <dmitry.tarnyagin@lockless.no>, "madalin.bucur@nxp.com" <madalin.bucur@nxp.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "pantelis.antoniou@gmail.com" <pantelis.antoniou@gmail.com>, KY Srinivasan <kys@microsoft.com>, "t.sailer@alumni.ethz.ch" <t.sailer@alumni.ethz.ch>, "dev@openvswitch.org" <dev@openvswitch.org>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "arvid.brodin@alten.se" <arvid.brodin@alten.se>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, "pshelar@ovn.org" <pshelar@ovn.org>, "m-karicheri2@ti.com" <m-karicheri2@ti.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "jreuter@yaina.de" <jreuter@yaina.de>, "sammy@sammy.net" <sammy@sammy.net>, "grygorii.strashko@ti.com" <grygorii.strashko@ti.com>, "w-kwok2@ti.com" <w-kwok2@ti.com>st
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOC85LzIwIDIyOjUwLCBIYWl5YW5nIFpoYW5nIHdyb3RlOgo+IAo+IAo+PiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBTdGVwaGVuIEhlbW1pbmdlciA8c3RlcGhlbkBu
ZXR3b3JrcGx1bWJlci5vcmc+Cj4+IFNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgMjAsIDIwMTgg
MTA6NDQgQU0KPj4gVG86IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KPj4gQ2M6
IGRhdmVtQGRhdmVtbG9mdC5uZXQ7IGRtaXRyeS50YXJueWFnaW5AbG9ja2xlc3Mubm87Cj4+IHdn
QGdyYW5kZWdnZXIuY29tOyBta2xAcGVuZ3V0cm9uaXguZGU7IG1pY2hhbC5zaW1la0B4aWxpbngu
Y29tOwo+PiBoc3dlZXRlbkB2aXNpb25lbmdyYXZlcnMuY29tOyBtYWRhbGluLmJ1Y3VyQG54cC5j
b207Cj4+IHBhbnRlbGlzLmFudG9uaW91QGdtYWlsLmNvbTsgY2xhdWRpdS5tYW5vaWxAbnhwLmNv
bTsgbGVveWFuZy5saUBueHAuY29tOwo+PiBsaW51eEBhcm1saW51eC5vcmcudWs7IHNhbW15QHNh
bW15Lm5ldDsgcmFsZkBsaW51eC1taXBzLm9yZzsKPj4gbmljb0BmbHV4bmljLm5ldDsgc3RldmUu
Z2xlbmRpbm5pbmdAc2hhd2VsbC5uZXQ7IGYuZmFpbmVsbGlAZ21haWwuY29tOwo+PiBncnlnb3Jp
aS5zdHJhc2hrb0B0aS5jb207IHcta3dvazJAdGkuY29tOyBtLWthcmljaGVyaTJAdGkuY29tOwo+
PiB0LnNhaWxlckBhbHVtbmkuZXRoei5jaDsganJldXRlckB5YWluYS5kZTsgS1kgU3Jpbml2YXNh
biA8a3lzQG1pY3Jvc29mdC5jb20+Owo+PiBIYWl5YW5nIFpoYW5nIDxoYWl5YW5nekBtaWNyb3Nv
ZnQuY29tPjsgd2VpLmxpdTJAY2l0cml4LmNvbTsKPj4gcGF1bC5kdXJyYW50QGNpdHJpeC5jb207
IGFydmlkLmJyb2RpbkBhbHRlbi5zZTsgcHNoZWxhckBvdm4ub3JnOwo+PiBkZXZAb3BlbnZzd2l0
Y2gub3JnOyBsaW51eC1taXBzQGxpbnV4LW1pcHMub3JnOyB4ZW4tCj4+IGRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnOyBuZXRkZXZAdmdlci5rZXJuZWwub3JnOyBsaW51eC11c2JAdmdlci5rZXJu
ZWwub3JnOwo+PiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC1jYW5Admdlci5r
ZXJuZWwub3JnOwo+PiBkZXZlbEBsaW51eGRyaXZlcnByb2plY3Qub3JnOyBsaW51eC1oYW1zQHZn
ZXIua2VybmVsLm9yZzsgbGludXgtCj4+IG9tYXBAdmdlci5rZXJuZWwub3JnOyBsaW51eHBwYy1k
ZXZAbGlzdHMub3psYWJzLm9yZzsgbGludXgtYXJtLQo+PiBrZXJuZWxAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+PiBTdWJqZWN0OiBSZTogW1BBVENIIG5ldC1uZXh0IDE3LzIyXSBodl9uZXR2c2M6IGZp
eCByZXR1cm4gdHlwZSBvZgo+PiBuZG9fc3RhcnRfeG1pdCBmdW5jdGlvbgo+Pgo+PiBPbiBUaHUs
IDIwIFNlcCAyMDE4IDIwOjMzOjAxICswODAwCj4+IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVh
d2VpLmNvbT4gd3JvdGU6Cj4+PiBpbnQgbmV0dnNjX3N0YXJ0X3htaXQoc3RydWN0IHNrX2J1ZmYg
KnNrYiwgc3RydWN0IG5ldF9kZXZpY2UgKm5ldCkKPj4+ICAJICovCj4+PiAgCXZmX25ldGRldiA9
IHJjdV9kZXJlZmVyZW5jZV9iaChuZXRfZGV2aWNlX2N0eC0+dmZfbmV0ZGV2KTsKPj4+ICAJaWYg
KHZmX25ldGRldiAmJiBuZXRpZl9ydW5uaW5nKHZmX25ldGRldikgJiYKPj4+IC0JICAgICFuZXRw
b2xsX3R4X3J1bm5pbmcobmV0KSkKPj4+IC0JCXJldHVybiBuZXR2c2NfdmZfeG1pdChuZXQsIHZm
X25ldGRldiwgc2tiKTsKPj4+ICsJICAgICFuZXRwb2xsX3R4X3J1bm5pbmcobmV0KSkgewo+Pj4g
KwkJcmV0ID0gbmV0dnNjX3ZmX3htaXQobmV0LCB2Zl9uZXRkZXYsIHNrYik7Cj4+PiArCQlpZiAo
cmV0KQo+Pj4gKwkJCXJldHVybiBORVRERVZfVFhfQlVTWTsKPj4+ICsJfQo+Pgo+PiBTb3JyeSwg
dGhlIG5ldyBjb2RlIGlzIHdyb25nLiBJdCB3aWxsIGZhbGwgdGhyb3VnaCBpZiByZXQgPT0gMCAo
TkVUREVWX1RYX09LKQo+PiBQbGVhc2UgcmV2aWV3IGFuZCB0ZXN0IHlvdXIgcGF0Y2hlcy4KPiAK
PiBQbHVzIGNvbnNpZGVyYXRpb24gb2YgLS0gRm9yIGVycm9yIGNhc2UsIHBsZWFzZSBqdXN0IHJl
dHVybiBORVRERVZfVFhfT0suIFdlIAo+IGFyZSBub3Qgc3VyZSBpZiB0aGUgZXJyb3IgY2FuIGdv
IGF3YXkgYWZ0ZXIgcmV0cnlpbmcsIHJldHVybmluZyBORVRERVZfVFhfQlVTWSAKPiBtYXkgY2F1
c2UgaW5maW5pdGUgcmV0cnkgZnJvbSB0aGUgdXBwZXIgbGF5ZXIuCj4gCj4gU28sIGxldCdzIGp1
c3QgYWx3YXlzIHJldHVybiBORVRERVZfVFhfT0sgbGlrZSB0aGlzOgo+IAkJbmV0dnNjX3ZmX3ht
aXQobmV0LCB2Zl9uZXRkZXYsIHNrYik7Cj4gCQlyZXR1cm4gTkVUREVWX1RYX09LOwoKVGhhbmsg
eW91IGZvciByZXZpZXcuCgpXaWxsIGRvIHRoYXQgaW4gdjIuCgo+IAo+IFRoYW5rcywKPiAtIEhh
aXlhbmcKPiAKPiAuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
