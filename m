From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v1 1/2] x86/mm: Add mem access rights to NPT
Date: Wed, 30 May 2018 05:29:22 -0600
Message-ID: <5B0E8B1202000078001C6F4F@prv1-mh.provo.novell.com>
References: <1526037083-29920-1-git-send-email-aisaila@bitdefender.com>
 <5AFEF17C02000078001C4210@prv1-mh.provo.novell.com>
 <98b0d49b-07ba-1703-e25e-ceae271038fe@bitdefender.com>
 <5B03E7A702000078001C48B4@prv1-mh.provo.novell.com>
 <1526996127.25123.3.camel@bitdefender.com>
 <5B041ECB02000078001C4B3D@prv1-mh.provo.novell.com>
 <1527671092.25123.9.camel@bitdefender.com>
 <5B0E744002000078001C6E56@prv1-mh.provo.novell.com>
 <1527679210.25123.20.camel@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1527679210.25123.20.camel@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: aisaila@bitdefender.com, Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, tamas@tklengyel.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjA1LjE4IGF0IDEzOjIwLCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IE9uIE1pLCAyMDE4LTA1LTMwIGF0IDAzOjUyIC0wNjAwLCBKYW4gQmV1bGljaCB3cm90ZToK
Pj4gPgo+PiA+ID4KPj4gPiA+ID4KPj4gPiA+ID4gT24gMzAuMDUuMTggYXQgMTE6MDQsIDxhaXNh
aWxhQGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4+ID4gU29ycnkgZm9yIHRoZSBtaXN1bmRlcnN0
YW5kaW5nLCBJIHdhbnRlZCB0byBjbGFyaWZ5IGlmIHRoZSA1OTo1Ngo+PiA+IGJpdHMKPj4gPiBh
cmUgZnVsbHkgb2sgdG8gYmUgdXNlZCBvciBpZiBub3QgdGhlbiB3aGVyZSBzaG91bGQgSSB1c2Ug
NCBiaXRzIHRvCj4+ID4gc3RvcmUgdGhlIG1lbSBhY2Nlc3MgaW5mbz8KPj4gSSB0aG91Z2h0IEkg
aGFkIHN1ZmZpY2llbnRseSBleHBsYWluZWQgdGhpcyAtIHlvdSBoYXZlIHR3byBvcHRpb25zOgo+
PiAxKSBNYWtlIHN1cmUgKHZpYSBzb21lIHByZXJlcSBwYXRjaChlcykpIGJpdCA1OSBoYXMgbm8g
b3RoZXIgdXNlLCBhbmQKPj4gICAgdGhlbiB1c2UgNTk6NTYuCj4+IDIpIFVzZSBhbm90aGVyIHJh
bmdlIHRoYXQncyBwcm92YWJseSBoYXZpbmcgbm8gb3RoZXIgdXNlLCBlLmcuCj4+ICAgIDU4OjU1
Lgo+IEkndmUgY2hlY2tlZCBhbmQgYml0cyA0MDo1MiBhcmUgZGVmaW5lZCBpbiBhc20vcGFnZS5o
IGZvciBwYWdlIGZsYWdzLgoKNDA6NTI/IEhhcmRseS4KCj4gSSd2ZSB0cmllZCBiaXRzIDUzOjU2
IGFuZCB0aGVyZSB3aGVyZSBzb21lIHByb2JsZW1zIHdpdGggdGhlIGd1ZXN0IG5vdAo+IHN0YXJ0
aW5nIG9yIHRoZSBpbWFnZSBmcmVlemluZywKCldlbGwsIHlvdSdsbCBoYXZlIHRvIGV4cGxhaW4g
dGhpcyAocGVyaGFwcyBqdXN0IHRvIHlvdXJzZWxmKS4KCj4gYml0cyA2MiBhbmQgNjMgYXJlIG5v
dCBmcmVlIHNvIDU5OjU2IGlzCj4gdGhlIG9ubHkgc3BhY2UgdG8gYmUgdXNlZCBmb3IgdGhpcyBw
dXJwb3NlIGFuZCBpcyBzZWVtcyB0byBmdW5jdGlvbgo+IGNvcnJlY3RseS4KCldlbGwgLSBhcyBz
YWlkIGJlZm9yZSwgYml0IDU5IGlzIG5vdCBhdmFpbGFibGUgZm9yIHVzZSB3aXRob3V0IHNvbWUK
cHJlcmVxIHdvcmsuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
