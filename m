From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/5] x86: split out cpuid objects and helpers
Date: Fri, 25 May 2018 12:23:19 +0200
Message-ID: <20180525102319.copcy37kvaur7dbc@MacBook-Pro-de-Roger.local>
References: <20180524160522.757-1-wei.liu2@citrix.com>
 <20180524160522.757-3-wei.liu2@citrix.com>
 <20180525094104.5ogk4qzcya5pfucc@MacBook-Pro-de-Roger.local>
 <20180525094912.zkwalyemsuutue2s@citrix.com>
 <423ecd50-46ba-1e0e-be05-48942b5f7cfa@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ifz/=im=citrix.com=prvs=676f710cf=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fM9sg-0000Wy-LP
 for xen-devel@lists.xenproject.org; Fri, 25 May 2018 10:23:30 +0000
Content-Disposition: inline
In-Reply-To: <423ecd50-46ba-1e0e-be05-48942b5f7cfa@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, sergey.dyasli@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXkgMjUsIDIwMTggYXQgMTE6MDE6MThBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyNS8wNS8xOCAxMDo0OSwgV2VpIExpdSB3cm90ZToKPiA+IE9uIEZyaSwgTWF5
IDI1LCAyMDE4IGF0IDExOjQxOjA0QU0gKzAyMDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4g
Pj4gT24gVGh1LCBNYXkgMjQsIDIwMTggYXQgMDU6MDU6MTlQTSArMDEwMCwgV2VpIExpdSB3cm90
ZToKPiA+Pj4gVGhleSBhcmUgbW92ZWQgdG8gYSBuZXcgaGVhZGVyIHdoaWNoIGlzIGdvaW5nIHRv
IGJlIGNvbnN1bWVkIGJ5IGJvdGgKPiA+Pj4gdGhlIGh5cGVydmlzb3IgYW5kIHRvb2xzdGFjay4K
PiA+Pj4KPiA+Pj4gQ3JlYXRlIGEgbmV3IGRpcmVjdG9yeSBmb3IgdGhpcyBraW5kIG9mIGhlYWRl
cnMgaW4gYW50aWNpcGF0aW9uIG9mCj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXnRoYXQ/Cj4gPj4+IG1vcmUgd2ls
bCBjb21lLgo+ID4+Pgo+ID4+PiBObyBmdW5jdGlvbmFsIGNoYW5nZS4KPiA+Pj4KPiA+Pj4gU2ln
bmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiA+Pj4gLS0tCj4gPj4+
IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gPj4+IENjOiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+ID4+Pgo+ID4+PiBBbnkgc3VnZ2VzdGlv
biBvbiB0aGUgZGlyZWN0b3J5IG5hbWU/Cj4gPj4+IC0tLQo+ID4+PiAgeGVuL2luY2x1ZGUvYXNt
LXg4Ni9hcmNoLXNoYXJlZC9jcHVpZC5oIHwgMjEzICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCj4gPj4+ICB4ZW4vaW5jbHVkZS9hc20teDg2L2NwdWlkLmggICAgICAgICAgICAgfCAy
MTAgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4+IEkgd291bGQgaGF2ZSBwbGFj
ZWQgdGhvc2UgaW5zaWRlIG9mOgo+ID4+Cj4gPj4geGVuL2luY2x1ZGUvcHVibGljL2FyY2gteDg2
L2NwdWlkLmgKPiA+Pgo+ID4+IFByb3RlY3RlZCB3aXRoIGEgI2lmIGRlZmluZWQoX19YRU5fXykg
fHwgZGVmaW5lZChfX1hFTl9UT09MU19fKT8KPiA+Pgo+ID4gSSBlbnZpc2lvbiB0aGlzIGlzIGdv
aW5nIHRvIGdyb3cgaW50byBsaWJjcHVpZCBvciBzb21ldGhpbmcsIGp1c3QgbGlrZQo+ID4gbGli
ZWxmLgo+IAo+IEkgd2FzIGFjdHVhbGx5IGNvbnNpZGVyaW5nIG1ha2luZyBhIGxpYng4NiBvciBl
cXVpdmFsZW50LsKgIEF0IHRoZQo+IG1pbmltdW0sIHdlJ2xsIG5lZWQgYSBzaW1pbGFyIHNwbGl0
IGZvciB0aGUgTVNSIGNvZGUuCj4gCj4gQWxzbywgbWFraW5nIHN0cnVjdCB7Y3B1aWQsbXNyfV9w
b2xpY3kgYXZhaWxhYmxlIHRvIHRoZSBlbXVsYXRpb24gY29kZQo+IHdpbGwgZHJvcCB0aGUgY29k
ZSB2b2x1bWUgbWFzc2l2ZWx5LCBhbmQgaGFzIGJlZW4gb24gbXkgVE9ETyBsaXN0IGZvciBhZ2Vz
Lgo+IAo+ID4gQWxzbyB0aGlzIGlzbid0IHNvbWUgc29ydCBvZiBpbnRlcmZhY2UgYmV0d2VlbiBI
ViBhbmQgdG9vbHN0YWNrIC0tIHRoZQo+ID4gaW50ZXJmYWNlIHdvcmtzIG9uIHNlcmlhbGlzZWQg
ZGF0YS4gUHV0dGluZyB0aGUgaW50ZXJuYWwgcmVwcmVzZW50YXRpb24KPiA+IGluIHB1YmxpYyBo
ZWFkZXIgd291bGQgYmUgd3JvbmcuCj4gCj4gKzEKPiAKPiBXZSBoYXBwZW4gdG8gd2FudCB0byBz
aGFyZSBzb21lIGNvZGUgYmV0d2VlbiBYZW4gYW5kIGxpYnhjLCBidXQgaXQKPiBkb2Vzbid0IHdh
bnQgdG8gYmUgaW4gYW55IGtpbmQgb2YgcHVibGljIGludGVyZmFjZS4KCk1heWJlIHhlbi9jb21t
b24vbGlieDg2PwoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
