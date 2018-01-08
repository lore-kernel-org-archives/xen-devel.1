From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 22/22] vixen: dom0 builder support
Date: Mon, 8 Jan 2018 10:03:36 +0000
Message-ID: <20180108100336.zvdcuh7xmin7ad4y@MacBook-Pro-de-Roger.local>
References: <1515279277-16301-1-git-send-email-aliguori@amzn.com>
 <1515279277-16301-23-git-send-email-aliguori@amzn.com>
 <20180107090216.ferp3uppuns4s5bi@MacBook-Pro-de-Roger.local>
 <CA+aC4kt-y9+vP6rrXjNbBVepmknyuWVfUe5QZ1hNG1bASgQ+fQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=q3al=ed=citrix.com=prvs=539ca8c7b=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eYUHW-00059i-Ax
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 10:03:50 +0000
Content-Disposition: inline
In-Reply-To: <CA+aC4kt-y9+vP6rrXjNbBVepmknyuWVfUe5QZ1hNG1bASgQ+fQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony Liguori <anthony@codemonkey.ws>
Cc: Anthony Liguori <aliguori@amzn.com>, Wei Liu <wei.liu2@citrix.com>, Matt Wilson <msw@amazon.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan =?iso-8859-1?Q?H=2E_Sch=F6nherr?= <jschoenh@amazon.de>, Anthony Liguori <aliguori@amazon.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gU3VuLCBKYW4gMDcsIDIwMTggYXQgMDc6NTI6MjZBTSAtMDgwMCwgQW50aG9ueSBMaWd1b3Jp
IHdyb3RlOgo+IE9uIFN1biwgSmFuIDcsIDIwMTggYXQgMTowMiBBTSwgUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4gT24gU2F0LCBKYW4gMDYsIDIwMTgg
YXQgMDI6NTQ6MzdQTSAtMDgwMCwgQW50aG9ueSBMaWd1b3JpIHdyb3RlOgo+ID4+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvc2V0dXAuYyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCj4gPj4gaW5k
ZXggMWI4OTg0NC4uYzQ5ZWVlYSAxMDA2NDQKPiA+PiAtLS0gYS94ZW4vYXJjaC94ODYvc2V0dXAu
Ywo+ID4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCj4gPj4gQEAgLTY2Myw2ICs2NjMsOCBA
QCB2b2lkIF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hlbih1bnNpZ25lZCBsb25nIG1iaV9wKQo+
ID4+ICAgICAgICAgIC5zdG9wX2JpdHMgPSAxCj4gPj4gICAgICB9Owo+ID4+ICAgICAgc3RydWN0
IHhlbl9hcmNoX2RvbWFpbmNvbmZpZyBjb25maWcgPSB7IC5lbXVsYXRpb25fZmxhZ3MgPSAwIH07
Cj4gPj4gKyAgICB4ZW5fcGZuX3Qgc3RvcmVfbWZuID0gMCwgY29uc29sZV9tZm4gPSAwOwo+ID4+
ICsgICAgdWludDMyX3Qgc3RvcmVfZXZ0Y2huID0gMCwgY29uc29sZV9ldnRjaG4gPSAwOwo+ID4+
Cj4gPj4gICAgICAvKiBDcml0aWNhbCByZWdpb24gd2l0aG91dCBJRFQgb3IgVFNTLiAgQW55IGZh
dWx0IGlzIGRlYWRseSEgKi8KPiA+Pgo+ID4+IEBAIC0xNTk1LDYgKzE1OTcsOSBAQCB2b2lkIF9f
aW5pdCBub3JldHVybiBfX3N0YXJ0X3hlbih1bnNpZ25lZCBsb25nIG1iaV9wKQo+ID4+ICAgICAg
ICAgIGNvbmZpZy5lbXVsYXRpb25fZmxhZ3MgPSBYRU5fWDg2X0VNVV9MQVBJQ3xYRU5fWDg2X0VN
VV9JT0FQSUM7Cj4gPj4gICAgICB9Cj4gPj4KPiA+PiArICAgIGlmICggaXNfdml4ZW4oKSApCj4g
Pj4gKyAgICAgICAgY29uZmlnLmVtdWxhdGlvbl9mbGFncyA9IFhFTl9YODZfRU1VX1BJVDsKPiA+
Cj4gPiBEb21VcyBzaG91bGQgbm90IGhhdmUgYW4gZW11bGF0ZWQgUElULCB0aGF0J3Mgb25seSBm
b3IgRG9tMCBQVi4KPiAKPiBVbmZvcnR1bmF0ZWx5LCB0aGV5IGRvIG5lZWQgYW4gZW11bGF0ZWQg
UElULiAgVW50aWwgUFZIIGdvdCBtZXJnZWQsIGFuCj4gZW11bGF0ZWQgUElUCj4gd2FzIGFsd2F5
cyBwcmVzZW50IGZvciBEb21VcyBhbmQgMi42LjIxIGVyYSBrZXJuZWxzIHVzZSB0aGUgUElUIGZv
cgo+IFRTQyBjYWxpYnJhdGlvbi4KPiBJZiBhIFBJVCBpc24ndCBwcmVzZW50LCB0aGVuIHRoZXkg
aGFuZyBkdXJpbmcgZWFybHkgYm9vdC4KCklzIHRoaXMgc29tZXRoaW5nIHRoYXQgb25seSBhZmZl
Y3RzIDIuNi4yMT8gSSd2ZSBjZXJ0YWlubHkgdGVzdGVkCmRpZmZlcmVudCBvbGQgZGlzdHJvcyB0
aGF0IHVzZSAyLjYuMTggYW5kIHRoZXkgYWxsIHdvcmsganVzdCBmaW5lCndpdGhvdXQgYSBQSVQu
CgpEbyB5b3Uga25vdyB3aGVyZSBjYW4gSSBmaW5kIG9uZSBvZiB0aG9zZSBrZXJuZWxzPwoKVGhh
bmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
