From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 0/3] x86: S3 resume adjustments
Date: Sun, 15 Apr 2018 14:08:31 +0100
Message-ID: <dff5dbde-0eea-c626-22dd-c8192927f9da@citrix.com>
References: <5AD0993002000078001BB0D0@prv1-mh.provo.novell.com>
 <0bfe793f-272c-a98c-95eb-ee75f5ee6218@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=0gin=he=citrix.com=prvs=6365dd825=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1f7hOU-0007dk-SS
 for xen-devel@lists.xenproject.org; Sun, 15 Apr 2018 13:08:34 +0000
In-Reply-To: <0bfe793f-272c-a98c-95eb-ee75f5ee6218@invisiblethingslab.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Simon Gaiser <simon@invisiblethingslab.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDQvMTggMDY6NDksIFNpbW9uIEdhaXNlciB3cm90ZToKPiBKYW4gQmV1bGljaDoKPj4g
MTogY29ycmVjdCBvcmRlcmluZyBvZiBvcGVyYXRpb25zIGR1cmluZyBTMyByZXN1bWUKPj4gMjog
c3VwcHJlc3MgQlRJIG1pdGlnYXRpb25zIGFyb3VuZCBTMyBzdXNwZW5kL3Jlc3VtZQo+PiAzOiBj
aGVjayBmZWF0dXJlIGZsYWdzIGFmdGVyIHJlc3VtZQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+Cj4+IFNpbW9uLCBjb3VsZCB5b3UgZ2l2ZSB0
aGlzIGEgdHJ5IHBsZWFzZT8KPiBCYWNrcG9ydGVkIHRvIDQuOCBpdCB3b3JrcyBmaW5lIHdpdGgg
dGhlIHR3byBmaXhlcyBJIHNlbnQgZWFybGllci4KPgo+IEkgbm93IGFsc28gdHJpZWQgc3RhZ2lu
Zy4gUmVzdW1lIGlzIGJyb2tlbiBldmVuIHdpdGhvdXQgSUJSUy9JQlBCLiBJdAo+IHBhbmljcyBh
Ym91dCBhIGRvdWJsZSBmYXVsdCBzb21ld2hlcmUgYWZ0ZXIgaXQgc3RhcnRzIHRvIGVuYWJsZSB0
aGUKPiBub24tYm9vdCBDUFVzLiBTaW5jZSB0aGUgSUJSUy9JUEJQIHByb2JsZW0gaGFwcGVucyBi
ZWZvcmUgdGhhdCBwb2ludCBJCj4gY291bGQgdGVzdCB0aGUgcGF0Y2hlcyBhbnl3YXkuIFdpdGgg
dGhlbSBpdCBnZXRzIGFnYWluIHRvIHRoZSBwb2ludAo+IHdoZXJlIGl0IGRvdWJsZSBmYXVsdHMu
IFNvIHRoZSBwYXRjaGVzIGFyZSBtb3N0IGxpa2VseSBmaW5lLgo+Cj4gSSBkaWRuJ3QgcmVhbGx5
IGxvb2tlZCB5ZXQgYXQgdGhlIGNhdXNlIG9mIHRoZSBkb3VibGUgZmF1bHQuCgpEbyB5b3UgYXQg
bGVhc3QgaGF2ZSB0aGUgY3Jhc2ggbG9nIGZyb20gdGhlIGF0dGVtcHQ/Cgp+QW5kcmV3Cgo+Cj4g
U2ltb24KPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
