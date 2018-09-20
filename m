From: Haiyang Zhang <haiyangz@microsoft.com>
Subject: Re: [PATCH net-next 17/22] hv_netvsc: fix return type
 of ndo_start_xmit function
Date: Thu, 20 Sep 2018 14:50:23 +0000
Message-ID: <BN6PR21MB016180C794F26A279345A17FCA130__15113.7170535096$1537458727$gmane$org@BN6PR21MB0161.namprd21.prod.outlook.com>
References: <20180920123306.14772-1-yuehaibing@huawei.com>
 <20180920123306.14772-18-yuehaibing@huawei.com>
 <20180920074341.3acef75c@xeon-e3>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3tze=mc=microsoft.com=haiyangz@srs-us1.protection.inumbo.net>)
 id 1g30Hk-0000gc-5q
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 14:50:28 +0000
In-Reply-To: <20180920074341.3acef75c@xeon-e3>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stephen Hemminger <stephen@networkplumber.org>, YueHaibing <yuehaibing@huawei.com>
Cc: "dmitry.tarnyagin@lockless.no" <dmitry.tarnyagin@lockless.no>, "madalin.bucur@nxp.com" <madalin.bucur@nxp.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "pantelis.antoniou@gmail.com" <pantelis.antoniou@gmail.com>, KY Srinivasan <kys@microsoft.com>, "t.sailer@alumni.ethz.ch" <t.sailer@alumni.ethz.ch>, "dev@openvswitch.org" <dev@openvswitch.org>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "arvid.brodin@alten.se" <arvid.brodin@alten.se>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, "pshelar@ovn.org" <pshelar@ovn.org>, "m-karicheri2@ti.com" <m-karicheri2@ti.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "jreuter@yaina.de" <jreuter@yaina.de>, "sammy@sammy.net" <sammy@sammy.net>, "grygorii.strashko@ti.com" <grygorii.strashko@ti.com>, "w-kwok2@ti.com" <w-kwok2@ti.com>st
List-Id: xen-devel@lists.xenproject.org

Cgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogU3RlcGhlbiBIZW1taW5nZXIg
PHN0ZXBoZW5AbmV0d29ya3BsdW1iZXIub3JnPgo+IFNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIg
MjAsIDIwMTggMTA6NDQgQU0KPiBUbzogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29t
Pgo+IENjOiBkYXZlbUBkYXZlbWxvZnQubmV0OyBkbWl0cnkudGFybnlhZ2luQGxvY2tsZXNzLm5v
Owo+IHdnQGdyYW5kZWdnZXIuY29tOyBta2xAcGVuZ3V0cm9uaXguZGU7IG1pY2hhbC5zaW1la0B4
aWxpbnguY29tOwo+IGhzd2VldGVuQHZpc2lvbmVuZ3JhdmVycy5jb207IG1hZGFsaW4uYnVjdXJA
bnhwLmNvbTsKPiBwYW50ZWxpcy5hbnRvbmlvdUBnbWFpbC5jb207IGNsYXVkaXUubWFub2lsQG54
cC5jb207IGxlb3lhbmcubGlAbnhwLmNvbTsKPiBsaW51eEBhcm1saW51eC5vcmcudWs7IHNhbW15
QHNhbW15Lm5ldDsgcmFsZkBsaW51eC1taXBzLm9yZzsKPiBuaWNvQGZsdXhuaWMubmV0OyBzdGV2
ZS5nbGVuZGlubmluZ0BzaGF3ZWxsLm5ldDsgZi5mYWluZWxsaUBnbWFpbC5jb207Cj4gZ3J5Z29y
aWkuc3RyYXNoa29AdGkuY29tOyB3LWt3b2syQHRpLmNvbTsgbS1rYXJpY2hlcmkyQHRpLmNvbTsK
PiB0LnNhaWxlckBhbHVtbmkuZXRoei5jaDsganJldXRlckB5YWluYS5kZTsgS1kgU3Jpbml2YXNh
biA8a3lzQG1pY3Jvc29mdC5jb20+Owo+IEhhaXlhbmcgWmhhbmcgPGhhaXlhbmd6QG1pY3Jvc29m
dC5jb20+OyB3ZWkubGl1MkBjaXRyaXguY29tOwo+IHBhdWwuZHVycmFudEBjaXRyaXguY29tOyBh
cnZpZC5icm9kaW5AYWx0ZW4uc2U7IHBzaGVsYXJAb3ZuLm9yZzsKPiBkZXZAb3BlbnZzd2l0Y2gu
b3JnOyBsaW51eC1taXBzQGxpbnV4LW1pcHMub3JnOyB4ZW4tCj4gZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmc7IG5ldGRldkB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5v
cmc7Cj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtY2FuQHZnZXIua2VybmVs
Lm9yZzsKPiBkZXZlbEBsaW51eGRyaXZlcnByb2plY3Qub3JnOyBsaW51eC1oYW1zQHZnZXIua2Vy
bmVsLm9yZzsgbGludXgtCj4gb21hcEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4cHBjLWRldkBsaXN0
cy5vemxhYnMub3JnOyBsaW51eC1hcm0tCj4ga2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBT
dWJqZWN0OiBSZTogW1BBVENIIG5ldC1uZXh0IDE3LzIyXSBodl9uZXR2c2M6IGZpeCByZXR1cm4g
dHlwZSBvZgo+IG5kb19zdGFydF94bWl0IGZ1bmN0aW9uCj4gCj4gT24gVGh1LCAyMCBTZXAgMjAx
OCAyMDozMzowMSArMDgwMAo+IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4gd3Jv
dGU6Cj4gPiBpbnQgbmV0dnNjX3N0YXJ0X3htaXQoc3RydWN0IHNrX2J1ZmYgKnNrYiwgc3RydWN0
IG5ldF9kZXZpY2UgKm5ldCkKPiA+ICAJICovCj4gPiAgCXZmX25ldGRldiA9IHJjdV9kZXJlZmVy
ZW5jZV9iaChuZXRfZGV2aWNlX2N0eC0+dmZfbmV0ZGV2KTsKPiA+ICAJaWYgKHZmX25ldGRldiAm
JiBuZXRpZl9ydW5uaW5nKHZmX25ldGRldikgJiYKPiA+IC0JICAgICFuZXRwb2xsX3R4X3J1bm5p
bmcobmV0KSkKPiA+IC0JCXJldHVybiBuZXR2c2NfdmZfeG1pdChuZXQsIHZmX25ldGRldiwgc2ti
KTsKPiA+ICsJICAgICFuZXRwb2xsX3R4X3J1bm5pbmcobmV0KSkgewo+ID4gKwkJcmV0ID0gbmV0
dnNjX3ZmX3htaXQobmV0LCB2Zl9uZXRkZXYsIHNrYik7Cj4gPiArCQlpZiAocmV0KQo+ID4gKwkJ
CXJldHVybiBORVRERVZfVFhfQlVTWTsKPiA+ICsJfQo+IAo+IFNvcnJ5LCB0aGUgbmV3IGNvZGUg
aXMgd3JvbmcuIEl0IHdpbGwgZmFsbCB0aHJvdWdoIGlmIHJldCA9PSAwIChORVRERVZfVFhfT0sp
Cj4gUGxlYXNlIHJldmlldyBhbmQgdGVzdCB5b3VyIHBhdGNoZXMuCgpQbHVzIGNvbnNpZGVyYXRp
b24gb2YgLS0gRm9yIGVycm9yIGNhc2UsIHBsZWFzZSBqdXN0IHJldHVybiBORVRERVZfVFhfT0su
IFdlIAphcmUgbm90IHN1cmUgaWYgdGhlIGVycm9yIGNhbiBnbyBhd2F5IGFmdGVyIHJldHJ5aW5n
LCByZXR1cm5pbmcgTkVUREVWX1RYX0JVU1kgCm1heSBjYXVzZSBpbmZpbml0ZSByZXRyeSBmcm9t
IHRoZSB1cHBlciBsYXllci4KClNvLCBsZXQncyBqdXN0IGFsd2F5cyByZXR1cm4gTkVUREVWX1RY
X09LIGxpa2UgdGhpczoKCQluZXR2c2NfdmZfeG1pdChuZXQsIHZmX25ldGRldiwgc2tiKTsKCQly
ZXR1cm4gTkVUREVWX1RYX09LOwoKVGhhbmtzLAotIEhhaXlhbmcKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
