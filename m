From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v9 1/5] xen: introduce ptrdiff_t,
 fix uintptr_t
Date: Tue, 12 Feb 2019 07:59:29 -0700
Message-ID: <5C62DF510200007800215FED@prv1-mh.provo.novell.com>
References: <alpine.DEB.2.10.1902111631220.347@sstabellini-ThinkPad-X260>
 <1549934011-17624-1-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9SUj=QT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gtZX9-0000Tu-R0
 for xen-devel@lists.xenproject.org; Tue, 12 Feb 2019 14:59:39 +0000
In-Reply-To: <1549934011-17624-1-git-send-email-sstabellini@kernel.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjAyLjE5IGF0IDAyOjEzLCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3R5cGVzLmgKPiArKysgYi94ZW4vaW5jbHVkZS94ZW4v
dHlwZXMuaAo+IEBAIC01Miw3ICs1Miw4IEBAIHR5cGVkZWYgX191MzIgX19iZTMyOwo+ICB0eXBl
ZGVmIF9fdTY0IF9fbGU2NDsKPiAgdHlwZWRlZiBfX3U2NCBfX2JlNjQ7Cj4gIAo+IC10eXBlZGVm
IHVuc2lnbmVkIGludCBfX2F0dHJpYnV0ZV9fKChfX21vZGVfXyhfX3BvaW50ZXJfXykpKSB1aW50
cHRyX3Q7Cj4gK3R5cGVkZWYgdW5zaWduZWQgbG9uZyBfX2F0dHJpYnV0ZV9fKChfX21vZGVfXyhf
X3BvaW50ZXJfXykpKSB1aW50cHRyX3Q7CgpJIGRvbid0IHVuZGVyc3RhbmQgdGhpcyBjaGFuZ2U6
IFRoZSBtb2RlIGF0dHJpYnV0ZSBkaXNjYXJkcyBhbnkgd2lkdGgKYXNzb2NpYXRpb24gZGVyaXZl
ZCBmcm9tIHRoZSBzcGVjaWZpZWQgYmFzZSB0eXBlLgoKPiArdHlwZWRlZiBsb25nIHB0cmRpZmZf
dDsKCkZUUiBJJ20gdW5jb252aW5jZWQgb2YgdGhpcywgb3IgdGhlIG5lZWQgdG8gdXNlIHVpbnRw
dHJfdCBpbiB0aGUgZmlyc3QKcGxhY2UgaW4gdGhlIG1hY3JvcyB5b3UgaW50cm9kdWNlOiBUaGUg
ZW50aXJlIFVOSVggd29ybGQgaW1wbGllcwpzaXplb2YobG9uZykgPT0gc2l6ZW9mKHZvaWQqKSBh
ZmFpay4KCkJ1dCBpZiB3ZSByZWFsbHkgd2FudCB0byBoYXZlIHB0cmRpZmZfdCwgdGhlbiBJIHRo
aW5rIHdlIHNob3VsZCBlaXRoZXIKZm9sbG93IHRoZSB1aW50cHRyX3QgbW9kZWwgYW5kIHVzZSBh
dHRyaWJ1dGUoKG1vZGUoKSkpLCBvciB3ZSBzaG91bGQKbGV2ZXJhZ2UgdGhlIGNvbXBpbGVyJ3Mg
X19QVFJESUZGX1RZUEVfXyAoYW5kIHRoZW4gYWxzbwpfX1VJTlRQVFJfVFlQRV9fIGZvciB1aW50
cHRyX3QsIGF0IGxlYXN0IGlmIGF2YWlsYWJsZSAtIG5vdCBzdXJlIHdoYXQKaXRzIGF2YWlsYWJp
bGl0eSBkZXBlbmRzIG9uLCBidXQgaXQncyBjb25kaXRpb25hbCBpbiBnY2MncwpjX3N0ZGRlZl9j
cHBfYnVpbHRpbnMoKSkuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
