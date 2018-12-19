From: Manuel Bouyer <bouyer@antioche.eu.org>
Subject: Re: Xen 4.11.1 panic
Date: Wed, 19 Dec 2018 14:28:39 +0100
Message-ID: <20181219132839.GB6935@mail.soc.lip6.fr>
References: <20181218221904.GA1461@antioche.eu.org>
 <5C1A26150200007800207693@prv1-mh.provo.novell.com>
 <20181219115516.GA19518@mail.soc.lip6.fr>
 <5C1A3F92020000780020778D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tunJ=O4=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1gZbu4-0002oV-6U
 for xen-devel@lists.xenproject.org; Wed, 19 Dec 2018 13:28:48 +0000
Content-Disposition: inline
In-Reply-To: <5C1A3F92020000780020778D@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBEZWMgMTksIDIwMTggYXQgMDU6NTQ6NDJBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE5LjEyLjE4IGF0IDEyOjU1LCA8Ym91eWVyQGFudGlvY2hlLmV1Lm9yZz4g
d3JvdGU6Cj4gPiBPbiBXZWQsIERlYyAxOSwgMjAxOCBhdCAwNDowNTo1N0FNIC0wNzAwLCBKYW4g
QmV1bGljaCB3cm90ZToKPiA+PiBJbiBhbnkgZXZlbnQsIGJvdGggQW5kcmV3IGFuZCBJIG11c3Qg
aGF2ZSBvdmVybG9va2VkIHRoZSBvbmUKPiA+PiBjcnVjaWFsIHBsYWNlIGR1ZSB0byB3aGljaCB0
aGUgYXNzZXJ0aW9uIGlzIGluZGVlZCB3cm9uZyBmcm9tCj4gPj4gcHV0X3BhZ2VfZnJvbV9sMmUo
KToKPiA+PiAKPiA+PiAgICAgICAgIGludCByYyA9IF9wdXRfcGFnZV90eXBlKHBnLCBmYWxzZSwg
bWZuX3RvX3BhZ2UoX21mbihwZm4pKSk7Cj4gPj4gCj4gPj4gTm90IGFsbG93aW5nIGZvciBwcmVl
bXB0aW9uIHRoZXJlIGlzIGZpbmUgaWYgdGhlIEwyRSBpcyBwb2ludGluZyB0bwo+ID4+IGFuIEwx
IHRhYmxlLCBidXQgaXMgbm93IHdyb25nIGlmIHRoZSBMMkUgcG9pbnRzIHRvIGFub3RoZXIgTDIs
Cj4gPj4gd2hpY2ggc3VyZWx5IGlzIHRoZSBjYXNlIHdoZW4geW91IHNlZSB0aGUgYXNzZXJ0aW9u
IHRyaWdnZXIuCj4gPiAKPiA+IFNob3VsZCB3ZSBqdXN0IGNoYW5nZSBmYWxzZSB0byB0cnVlIGhl
cmUsIG9yIHNob3VsZCB0aGUgY2FzZXMgYWJvdmUgYmUgCj4gPiBoYW5kbGVkIGRpZmZlcmVudGx5
ID8KPiAKPiBTd2l0Y2hpbmcgZnJvbSBmYWxzZSB0byB0cnVlIGhlcmUgaXMganVzdCB0aGUgaW5p
dGlhbCBwYXJ0IG9mIHRoZQo+IG5lY2Vzc2FyeSBjaGFuZ2UgLSBpZiB5b3UgZGlkIGp1c3QgdGhp
cywgeW91J2QgZW5kIHVwIGhpdHRpbmcKPiB0aGUgQVNTRVJUKCkgcmlnaHQgYWZ0ZXIgdGhlIGxp
bmUgYWJvdmUuIFRoZXJlJ3MgcXVpdGUgYSBiaXQKPiBtb3JlIHRvIGl0LCBhbmQgaXQgbmVlZHMg
dG8gYmUgZG9uZSBwcmV0dHkgY2FyZWZ1bGx5LgoKT0ssIHNvIEknbGwgd2FpdCBmb3IgYSBtb3Jl
IGNvbXBsZXRlIHBhdGNoIDopCgotLSAKTWFudWVsIEJvdXllciA8Ym91eWVyQGFudGlvY2hlLmV1
Lm9yZz4KICAgICBOZXRCU0Q6IDI2IGFucyBkJ2V4cGVyaWVuY2UgZmVyb250IHRvdWpvdXJzIGxh
IGRpZmZlcmVuY2UKLS0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
