From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH RFC v2 1/2] x86/emulate: Move
 hvmemul_linear_to_phys
Date: Mon, 4 Feb 2019 16:14:29 +0100
Message-ID: <20190204151429.j3co5qlaatqmjt5q@mac>
References: <20190111153657.13532-1-aisaila@bitdefender.com>
 <982cf63a-8062-5e96-3a6c-02cbc8bcc9fb@bitdefender.com>
 <4b350789912046acaa1dc73934835429@AMSPEX02CL03.citrite.net>
 <fb615746-d8c4-40b9-7d1c-37ad1818343f@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gWI9=QL=citrix.com=prvs=9315a7b1e=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gqfxD-0002j7-QD
 for xen-devel@lists.xenproject.org; Mon, 04 Feb 2019 15:14:35 +0000
Content-Disposition: inline
In-Reply-To: <fb615746-d8c4-40b9-7d1c-37ad1818343f@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: "tamas@tklengyel.com" <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, Paul Durrant <Paul.Durrant@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, 'Alexandru Stefan ISAILA' <aisaila@bitdefender.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBGZWIgMDQsIDIwMTkgYXQgMDI6MDA6NDBQTSArMDIwMCwgUmF6dmFuIENvam9jYXJ1
IHdyb3RlOgo+IE9uIDIvNC8xOSAxOjU1IFBNLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gPiA+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiA+IEZyb206IEFsZXhhbmRydSBTdGVmYW4gSVNB
SUxBIFttYWlsdG86YWlzYWlsYUBiaXRkZWZlbmRlci5jb21dCj4gPiA+IFNlbnQ6IDA0IEZlYnJ1
YXJ5IDIwMTkgMTE6MzcKPiA+ID4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+
ID4gPiBDYzogUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IGpiZXVsaWNo
QHN1c2UuY29tOyBBbmRyZXcKPiA+ID4gQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29t
PjsgV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT47IFJvZ2VyCj4gPiA+IFBhdSBNb25uZSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+OyByY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tOwo+ID4gPiB0
YW1hc0B0a2xlbmd5ZWwuY29tOyBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5j
b20+Cj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggUkZDIHYyIDEvMl0geDg2L2VtdWxhdGU6IE1v
dmUgaHZtZW11bF9saW5lYXJfdG9fcGh5cwo+ID4gPiAKPiA+ID4gUGluZywgYW55IHRob3VnaHRz
IG9uIHRoaXMgYXJlIGFwcHJlY2lhdGVkLgo+ID4gPiAKPiA+ID4gUmVnYXJkcywKPiA+ID4gQWxl
eAo+ID4gPiAKPiA+ID4gT24gMTEuMDEuMjAxOSAxNzozNywgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJ
TEEgd3JvdGU6Cj4gPiA+ID4gVGhpcyBpcyBkb25lIHNvIGh2bWVtdWxfbGluZWFyX3RvX3BoeXMo
KSBjYW4gYmUgY2FsbGVkIGZyb20KPiA+ID4gPiBodm1lbXVsX21hcF9saW5lYXJfYWRkcigpCj4g
PiA+ID4gCj4gPiAKPiA+IEkgaGF2ZSBubyBvYmplY3Rpb24gdG8gcHVyZSBjb2RlIG1vdmVtZW50
IGZvciB0aGlzIHB1cnBvc2UuIEkgY2VydGFpbmx5IHByZWZlciBpdCB0byBmb3J3YXJkIGRlY2xh
cmF0aW9uIG9mIHN0YXRpY3MuCj4gVGhhbmtzIGZvciB0aGUgcmVwbHkhCj4gCj4gV2UncmUgYWxz
byBhZnRlciB0aG91Z2h0cyBvbiB0aGUgd2hvbGUgc2VyaWVzIChyZXBseWluZyB0byB0aGlzIHNw
ZWNpZmljCj4gcGF0Y2ggaW5zdGVhZCBvZiB0aGUgY292ZXIgbGV0dGVyIHdhcyBhbiBhY2NpZGVu
dCkuCj4gCj4gV2UgZXhwZWN0IHRoZSBzZWNvbmQgcGF0Y2ggdG8gYmUgbW9yZSBjb250cm92ZXJz
aWFsIGFuZCBpbiBzb21lIG5lZWQgb2YKPiBkZXRhaWxlZCBzY3J1dGlueS4KCkkndmUgdGFrZW4g
YSBsb29rIGF0IHBhdGNoIDIgYW5kIHByb3ZpZGVkIHNvbWUgcmV2aWV3IGNvbW1lbnRzLCBzb3Jy
eQpmb3IgdGhlIGRlbGF5LiBLZWVwIGluIG1pbmQgd2UgYXJlIGluIHRoZSBtaWRkbGUgb2YgdGhl
IHJlbGVhc2UKcHJvY2VzcyBhbmQgbW9zdCBkZXZlbG9wZXJzIGFuZCByZXZpZXdlcnMgYXJlIGJ1
c3kgdHJ5aW5nIHRvIGZpeCBidWdzCm9yIHJldmlld2luZyBidWdmaXhlcy4KClRoYW5rcywgUm9n
ZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
