From: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH] tboot: Avoid recursive fault in early boot
 panic with tboot
Date: Mon, 16 Jul 2018 17:38:31 -0400
Message-ID: <CAKf6xpsHhBUK6TSa=gxn_264ZOPX7HMEEKxq3mZAbJqetZkNCA@mail.gmail.com>
References: <20180716115902.5138-1-jandryuk@gmail.com>
 <5B4C8E0F02000078001D45EE@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B4C8E0F02000078001D45EE@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org, Gang Wei <gang.wei@intel.com>, Shane Wang <shane.wang@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKdWwgMTYsIDIwMTggYXQgODoyMiBBTSwgSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1
c2UuY29tPiB3cm90ZToKPj4+PiBPbiAxNi4wNy4xOCBhdCAxMzo1OSwgPGphbmRyeXVrQGdtYWls
LmNvbT4gd3JvdGU6Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni90Ym9vdC5jCj4+ICsrKyBiL3hlbi9h
cmNoL3g4Ni90Ym9vdC5jCj4+IEBAIC0zOTEsNyArMzkxLDEyIEBAIHZvaWQgdGJvb3Rfc2h1dGRv
d24odWludDMyX3Qgc2h1dGRvd25fdHlwZSkKPj4gICAgICAgICAgdGJvb3RfZ2VuX3hlbmhlYXBf
aW50ZWdyaXR5KGdfdGJvb3Rfc2hhcmVkLT5zM19rZXksICZ4ZW5oZWFwX21hYyk7Cj4+ICAgICAg
fQo+Pgo+PiAtICAgIHdyaXRlX3B0YmFzZShpZGxlX3ZjcHVbMF0pOwo+PiArICAgIC8qIER1cmlu
ZyBlYXJseSBib290LCB3ZSBjYW4gYmUgY2FsbGVkIGJ5IHBhbmljIGJlZm9yZSBpZGxlX3ZjcHVb
MF0gaXMKPj4gKyAgICAgKiBzZXR1cCwgYnV0IGluIHRoYXQgY2FzZSB3ZSBkb24ndCBuZWVkIHRv
IGNoYW5nZSBwYWdlIHRhYmxlcy4gKi8KPj4gKyAgICBpZiAoIGlkbGVfdmNwdVswXSAhPSBJTlZB
TElEX1ZDUFUgKQo+PiArICAgIHsKPj4gKyAgICAgICAgd3JpdGVfcHRiYXNlKGlkbGVfdmNwdVsw
XSk7Cj4+ICsgICAgfQo+Cj4gVGhlcmUgYXJlIHR3byBzdHlsZSBpc3N1ZXMgaGVyZTogVGhlIGNv
bW1lbnQgd2FudHMgdG8gYmUgcHJvcGVybHkKPiBmb3JtYXR0ZWQsIGFuZCB0aGUgYnJhY2VzIHdh
bnQgdG8gYmUgZHJvcHBlZC4KPgo+IEFsc28gcGxlYXNlIGhvbm9yIHBhdGNoIHN1Ym1pc3Npb24g
cnVsZXMgLSB0aGV5IGdldCBzZW50IF90b18gdGhlCj4gbGlzdCwgd2l0aCBtYWludGFpbmVycyBf
Y2NfLWVkLgoKT2suICBTb3JyeSBmb3IgYWxsIHRoZSBlcnJvcnMgYW5kIHRoYW5rcyBmb3IgdGhl
IHBvaW50ZXJzLgoKUmVnYXJkcywKSmFzb24KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
