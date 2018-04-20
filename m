From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: correct assertion in
 destroy_perdomain_mapping()
Date: Fri, 20 Apr 2018 16:42:38 +0100
Message-ID: <755d3609-f9f1-20a1-0ab6-979de2a41d94@citrix.com>
References: <5ADA014A02000078001BD11B@prv1-mh.provo.novell.com>
 <454ed889-4f81-728c-9234-75b3d71812e1@citrix.com>
 <5ADA06FC02000078001BD15F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sfiv=hj=citrix.com=prvs=641bd8182=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1f9YBN-0005WS-Ns
 for xen-devel@lists.xenproject.org; Fri, 20 Apr 2018 15:42:41 +0000
In-Reply-To: <5ADA06FC02000078001BD15F@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMDQvMTggMTY6MjcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDIwLjA0LjE4IGF0
IDE3OjIxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDIwLzA0LzE4
IDE2OjAzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IGh2bV9kb21haW5faW5pdGlhbGlzZSgpIG1h
eSBjYWxsIHRoaXMgd2l0aCBuciBiZWluZyB6ZXJvLCB3aGljaCB0cmlnZ2Vycwo+Pj4gdGhlICJk
b2VzIG5vdCBjcm9zcyBMMyBib3VuZGFyeSIgY2hlY2suCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiBJcyB0aGlzIHRoZSBjb3JyZWN0IGZp
eD8KPj4KPj4gSXRzIHVuY2xlYXIgd2hhdCB0aGUgY2FsbCB0byBjcmVhdGVfcGVyZG9tYWluX21h
cHBpbmcoKSBpcyBkb2luZywgYnV0IGl0Cj4+IGlzIHRoZSBzb2xlIGNhbGxlciB3aGljaCBwYXNz
ZXMgMC4KPj4KPj4gSSBwcmVzdW1lIGl0IGlzIHRvIGFsbG9jYXRlIGQtPmFyY2gucGVyZG9tYWlu
X2wzX3BnIGJ1dAo+PiBkZXN0cm95X3BlcmRvbWFpbl9tYXBwaW5nKCkgZG9lc24ndCBmcmVlIHRo
aXMgcGFnZSwgc28gSSd2ZSBnb3Qgbm8gaWRlYQo+PiB3aGF0IHRoZSBkZXN0cm95IGNhbGwgaXMg
dHJ5aW5nIHRvIGFjaGlldmUuCj4gQ2FsbGVycyBvZiB0aGlzIHBhaXIgb2YgZnVuY3Rpb25zIHNo
b3VsZCBub3QgYmUgY29uY2VybmVkIGFib3V0IHRoZWlyCj4gaW5uZXIgd29ya2luZ3M6IElmIHRo
ZSBjcmVhdGUgY2FsbCBzdWNjZWVkZWQsIHRoZSBkZXN0cm95IGZ1bmN0aW9uIHNob3VsZAo+IGJl
IGNhbGxlZCBmb3IgY2xlYW51cCwgZXZlbiBpZiB0aGF0J3MgX2N1cnJlbnRseV8gYSBuby1vcC4K
ClJpZ2h0LCBidXQgaXRzIHN0aWxsIG5vdCBjbGVhciB0aGF0IHBhc3NpbmcgMCAoZXZlbiB0byBj
cmVhdGUpIGlzIGEKbGVnaXRpbWF0ZSB0aGluZyB0byBkby4KCn5BbmRyZXcKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
