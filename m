From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH 5/6] x86: remove defunct
 init/load/save_msr() hvm_funcs
Date: Mon, 11 Mar 2019 17:47:28 +0000
Message-ID: <33af4d1ba34d464b9937db0ff4c21cc7@AMSPEX02CL02.citrite.net>
References: <20190107120258.17897-1-paul.durrant@citrix.com>
 <20190107120258.17897-6-paul.durrant@citrix.com>
 <5C829D50020000780021CC67@prv1-mh.provo.novell.com>
 <1ac0ae156eeb4de783ef5d495e157ecd@AMSPEX02CL02.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TKYa=RO=citrix.com=prvs=96668afeb=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1h3P1Q-00074q-Kw
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 17:47:32 +0000
In-Reply-To: <1ac0ae156eeb4de783ef5d495e157ecd@AMSPEX02CL02.citrite.net>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, 'xen-devel' <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFBhdWwgRHVycmFudAo+IFNlbnQ6
IDExIE1hcmNoIDIwMTkgMTc6NDYKPiBUbzogJ0phbiBCZXVsaWNoJyA8SkJldWxpY2hAc3VzZS5j
b20+Cj4gQ2M6IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBSb2dl
ciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgV2VpIExpdQo+IDx3ZWkubGl1MkBj
aXRyaXguY29tPjsgeGVuLWRldmVsIDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+Cj4g
U3ViamVjdDogUkU6IFtQQVRDSCA1LzZdIHg4NjogcmVtb3ZlIGRlZnVuY3QgaW5pdC9sb2FkL3Nh
dmVfbXNyKCkgaHZtX2Z1bmNzCj4gCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4g
RnJvbTogSmFuIEJldWxpY2ggW21haWx0bzpKQmV1bGljaEBzdXNlLmNvbV0KPiA+IFNlbnQ6IDA4
IE1hcmNoIDIwMTkgMTY6NTAKPiA+IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRy
aXguY29tPgo+ID4gQ2M6IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+
OyBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgV2VpIExpdQo+ID4gPHdl
aS5saXUyQGNpdHJpeC5jb20+OyB4ZW4tZGV2ZWwgPHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZz4KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggNS82XSB4ODY6IHJlbW92ZSBkZWZ1bmN0IGlu
aXQvbG9hZC9zYXZlX21zcigpIGh2bV9mdW5jcwo+ID4KPiA+ID4+PiBPbiAwNy4wMS4xOSBhdCAx
MzowMiwgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPiB3cm90ZToKPiA+ID4gQEAgLTE0NzIsMTAg
KzE0NjgsNyBAQCBzdGF0aWMgaW50IGh2bV9sb2FkX2NwdV9tc3JzKHN0cnVjdCBkb21haW4gKmQs
IGh2bV9kb21haW5fY29udGV4dF90ICpoKQo+ID4gPiAgICAgICAgICAgICAgcmV0dXJuIC1FT1BO
T1RTVVBQOwo+ID4gPiAgICAgIC8qIENoZWNraW5nIGZpbmlzaGVkICovCj4gPiA+Cj4gPiA+IC0g
ICAgaWYgKCBodm1fZnVuY3MubG9hZF9tc3IgKQo+ID4gPiAtICAgICAgICBlcnIgPSBodm1fZnVu
Y3MubG9hZF9tc3IodiwgY3R4dCk7Cj4gPiA+IC0KPiA+ID4gLSAgICBmb3IgKCBpID0gMDsgIWVy
ciAmJiBpIDwgY3R4dC0+Y291bnQ7ICsraSApCj4gPiA+ICsgICAgZm9yICggaSA9IDA7IGkgPCBj
dHh0LT5jb3VudDsgKytpICkKPiA+ID4gICAgICB7Cj4gPiA+ICAgICAgICAgIHN3aXRjaCAoIGN0
eHQtPm1zcltpXS5pbmRleCApCj4gPiA+ICAgICAgICAgIHsKPiA+Cj4gPiBlcnIgY2FuIGJlY29t
ZSBzZXQgdG8gbm9uLXplcm8gaW4gdGhlIGxvb3AgYm9keSBmdXJ0aGVyIGRvd24gZnJvbSBoZXJl
LAo+ID4gc28gSSBkb24ndCB0aGluayB5b3Ugc2hvdWxkIGFsdGVyIHRoZSBsb29wIGhlYWRlci4K
PiAKPiBUcnVlLiBCYWlsaW5nIGVhcmx5IGlzIGEgY2hhbmdlIG9mIHNlbWFudGljLCBzbyBJJ2xs
IGRyb3AgdGhlIGNoZWNrLgoKICAgICAgIF4gTm90Cgo+IAo+ICAgUGF1bAo+IAo+ID4KPiA+IEph
bgo+ID4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
