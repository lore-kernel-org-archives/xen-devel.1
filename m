From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH qemu-xen-traditional] xen/pt: allow QEMU to
 request MSI unmasking at bind time
Date: Tue, 9 Oct 2018 14:55:39 +0100
Message-ID: <23484.45915.156520.714628@mariner.uk.xensource.com>
References: <1527058885.8186.68.camel@infradead.org>
 <1529314520-79691-1-git-send-email-andraprs@amazon.com>
 <20180618114352.xelerr457ev2e5kj@mac>	<1529570276822.28578@amazon.com>
 <1533032534.16128.19.camel@amazon.co.uk>	<1537173602617.52049@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=giki=mv=citrix.com=prvs=813edc9a4=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1g9sUB-00082k-Us
 for xen-devel@lists.xenproject.org; Tue, 09 Oct 2018 13:55:43 +0000
In-Reply-To: <1537173602617.52049@amazon.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Paraschiv, Andra-Irina" <andraprs@amazon.com>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Woodhouse,
 David" <dwmw@amazon.co.uk>, "roger.pau@citrix.com" <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiA+SWFuLCBhbnkgb2JqZWN0aW9ucz8KClNvcnJ5IGZvciBkcm9wcGluZyB0aGlzLiAgSXQncyBi
ZWVuIGEgd2hpbGUhCgo+ID4+ID4gV2hlbiBhIE1TSSBpbnRlcnJ1cHQgaXMgYm91bmQgdG8gYSBn
dWVzdCB1c2luZwo+ID4+ID4geGNfZG9tYWluX3VwZGF0ZV9tc2lfaXJxIChYRU5fRE9NQ1RMX2Jp
bmRfcHRfaXJxKSB0aGUgaW50ZXJydXB0Cj4gPj4gPiBpcyBsZWZ0IG1hc2tlZCBieSBkZWZhdWx0
Lgo+ID4+ID4KPiA+PiA+IFRoaXMgY2F1c2VzIHByb2JsZW1zIHdpdGggZ3Vlc3RzIHRoYXQgZmly
c3QgY29uZmlndXJlCj4gPj4gPiBpbnRlcnJ1cHRzIGFuZCBjbGVhbiB0aGUgcGVyLWVudHJ5IE1T
SVggdGFibGUgbWFzayBiaXQgYW5kCj4gPj4gPiBhZnRlcndhcmRzIGVuYWJsZSBNU0lYIGdsb2Jh
bGx5LiBJbiBzdWNoIHNjZW5hcmlvIHRoZSBYZW4KPiA+PiA+IGludGVybmFsIG1zaXh0YmwgaGFu
ZGxlcnMgd291bGQgbm90IGRldGVjdCB0aGUgdW5tYXNraW5nIG9mCj4gPj4gPiBNU0lYIGVudHJp
ZXMgYmVjYXVzZSB2ZWN0b3JzIGFyZSBub3QgeWV0IHJlZ2lzdGVyZWQgc2luY2UgTVNJWAo+ID4+
ID4gaXMgbm90IGVuYWJsZWQsIGFuZCB2ZWN0b3JzIHdvdWxkIGJlIGxlZnQgbWFza2VkLgo+ID4+
ID4KPiA+PiA+IEludHJvZHVjZSBhIG5ldyBmbGFnIGluIHRoZSBnZmxhZ3MgZmllbGQgdG8gc2ln
bmFsIFhlbiB3aGV0aGVyCj4gPj4gPiBhIE1TSSBpbnRlcnJ1cHQgc2hvdWxkIGJlIHVubWFza2Vk
IGFmdGVyIGJlaW5nIGJvdW5kLgo+ID4+ID4KPiA+PiA+IFRoaXMgYWxzbyByZXF1aXJlcyB0byB0
cmFjayB0aGUgbWFzayByZWdpc3RlciBmb3IgTVNJCj4gPj4gPiBpbnRlcnJ1cHRzLCBzbyBRRU1V
IGNhbiBhbHNvIG5vdGlmeSB0byBYZW4gd2hldGhlciB0aGUgTVNJCj4gPj4gPiBpbnRlcnJ1cHQg
c2hvdWxkIGJlIGJvdW5kIG1hc2tlZCBvciB1bm1hc2tlZAoKSSBzZWFyY2hlZCBteSBlbWFpbCBh
cmNoaXZlcyBidXQgSSBoYXZlbid0IGJlZW4gYWJsZSB0byBmaW5kIGEgY29weSBvZgp0aGUgYWN0
dWFsIHBhdGNoLiAgV2FzIGl0IGV2ZXIgc2VudCB0byBtZSA/CgpBbHNvLCBxZW11LXRyYWQgaXMg
cXVpdGUgZGVlcGx5IGZyb3plbi4gIEknZCBsaWtlIGFuIGV4cGxhbmF0aW9uIG9mCnRoZSBwcmFj
dGljYWwgaW1wYWN0IG9mIHRoaXMgYnVnLCBhbmQgdGhlIHVzZSBjYXNlcyB3aGVyZSB0aGUgZml4
IGlzCm5lZWRlZCwgdG8ganVzdGlmeSB0aGUgY2hhbmdlLiAgU29ycnkgdG8gYmUgYXdrd2FyZC4K
ClJlZ2FyZHMsCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
