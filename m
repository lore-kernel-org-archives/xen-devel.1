From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 3/3] xen-init-dom0: set Dom0 UUID if
 requested
Date: Wed, 14 Nov 2018 20:44:50 +0000
Message-ID: <20181114204450.4vwkrd6x4isaltk7@zion.uk.xensource.com>
References: <20181114181732.19013-1-wei.liu2@citrix.com>
 <20181114181732.19013-4-wei.liu2@citrix.com>
 <CAKf6xpu-H6ibB0G3k6c2-piR009QAAQhSyDxyUCeiDsaD8rycw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=effe=nz=citrix.com=prvs=849cc1f13=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gN22G-0000i2-5P
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 20:45:16 +0000
Content-Disposition: inline
In-Reply-To: <CAKf6xpu-H6ibB0G3k6c2-piR009QAAQhSyDxyUCeiDsaD8rycw@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: sergey.dyasli@citrix.com, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, edvin.torok@citrix.com, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBOb3YgMTQsIDIwMTggYXQgMDM6MTY6NDlQTSAtMDUwMCwgSmFzb24gQW5kcnl1ayB3
cm90ZToKWy4uLl0KPiA+ICBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCj4gPiAgewo+
ID4gICAgICBpbnQgcmM7Cj4gPiAtICAgIHN0cnVjdCB4c19oYW5kbGUgKnhzaDsKPiA+ICsgICAg
c3RydWN0IHhzX2hhbmRsZSAqeHNoID0gTlVMTDsKPiA+ICsgICAgeGNfaW50ZXJmYWNlICp4Y2gg
PSBOVUxMOwo+ID4gICAgICBjaGFyICpkb21uYW1lX3N0cmluZyA9IE5VTEwsICpkb21pZF9zdHJp
bmcgPSBOVUxMOwo+ID4gKyAgICBsaWJ4bF91dWlkIHV1aWQ7Cj4gPgo+ID4gICAgICB4c2ggPSB4
c19vcGVuKDApOwo+ID4gICAgICBpZiAoIXhzaCkgewo+ID4gICAgICAgICAgZnByaW50ZihzdGRl
cnIsICJjYW5ub3Qgb3BlbiB4ZW5zdG9yZSBjb25uZWN0aW9uXG4iKTsKPiA+IC0gICAgICAgIGV4
aXQoMSk7Cj4gPiArICAgICAgICByYyA9IDE7Cj4gPiArICAgICAgICBnb3RvIG91dDsKPiA+ICsg
ICAgfQo+ID4gKwo+ID4gKyAgICB4Y2ggPSB4Y19pbnRlcmZhY2Vfb3BlbihOVUxMLCBOVUxMLCAw
KTsKPiA+ICsgICAgaWYgKCF4Y2gpIHsKPiA+ICsgICAgICAgIGZwcmludGYoc3RkZXJyLCAieGNf
aW50ZXJmYWNlX29wZW4oKSBmYWlsZWRcbiIpOwo+ID4gKyAgICAgICAgcmMgPSAxOwo+IAo+IERv
IHlvdSB3YW50IGEgZ290byBvdXQgaGVyZT8KClllcyBJIGRvLiBHb29kIGNhdGNoIQoKV2VpLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
