From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/6] x86emul: fix FMA scalar operand sizes
Date: Mon, 3 Sep 2018 17:43:39 +0100
Message-ID: <4e2e1950-e2ee-3a6c-b227-8072d227d699@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5B86AB9002000078001E31E3@prv1-mh.provo.novell.com>
 <5B86AC5602000078001E31ED@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wisl=lr=citrix.com=prvs=7772440c6=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fwrx4-0004Ke-0Y
 for xen-devel@lists.xenproject.org; Mon, 03 Sep 2018 16:43:46 +0000
In-Reply-To: <5B86AC5602000078001E31ED@prv1-mh.provo.novell.com>
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
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMDgvMTggMTU6MjMsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEZNQSBpbnNucywgb3RoZXIg
dGhhbiB0aGUgZWFybGllciBBVlggYWRkaXRpb25zLCBkb24ndCB1c2UgdGhlIGxvdwo+IG9wY29k
ZSBiaXQgdG8gZGlzdGluZ3Vpc2ggYmV0d2VlbiBzaW5nbGUgYW5kIGRvdWJsZSB2ZWN0b3IgZWxl
bWVudHMuCgpJIHRoaW5rIEkndmUgd29ya2VkIG91dCB3aHkgIm90aGVyIHRoYW4gdGhlIiBpcyBz
byB3ZWlyZCB0byByZWFkIGFzIGEKbmF0aXZlIHNwZWFrZXIgaGVyZS7CoCBJIHRoaW5rIHlvdSBt
ZWFuICJ1bmxpa2UgdGhlIiBpbiB0aGlzIGNvbnRleHQuCgo+IFdoaWxlIHRoZSBkaWZmZXJlbmNl
IGlzIGJlbmlnbiBmb3IgcGFja2VkIGZsYXZvcnMsIHRoZSBzY2FsYXIgb25lcwo+IG5lZWQgdG8g
dXNlIFZFWC5XIGhlcmUuIE9kZGx5IGVub3VnaCB0aGUgdGFibGUgZW50cmllcyBkaWRuJ3QgZXZl
biB1c2UKPiBzaW1kX3NjYWxhcl9mcCwgYnV0IHVuaWZvcm1seSB1c2VkIHNpbWRfcGFja2VkX2Zw
IChpbXBseWluZyB0aGUKPiBkaXN0aW5jdGlvbiB3YXMgYnkgW1ZFWC1lbmNvZGVkXSBvcGNvZGUg
cHJlZml4KS4KCldhcyB0aGlzIGEgYnVnIGluIHRoZSBGTUEgcGF0Y2ggdGhlbj8KCj4KPiBTcGxp
dCBzaW1kX3NjYWxhcl9mcCBpbnRvIHNpbWRfc2NhbGFyX29wYyBhbmQgc2ltZF9zY2FsYXJfdmV4
dywgYW5kCj4gY29ycmVjdCAKCk1pc3NpbmcgdGhlIHJlc3Qgb2YgdGhlIHNlbnRlbmNlP8KgICh2
MSB3YXMgc2ltaWxhcikKCj4KPiBBbHNvIGNvcnJlY3QgdGhlIHNjYWxhciBpbnNuIGNvbW1lbnRz
ICh0aGV5IG9ubHkgZXZlciB1c2UgWE1NIHJlZ2lzdGVycwo+IGFzIG9wZXJhbmRzKS4KPgo+IFNp
Z25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkFzIGZvciB0aGUg
Y29kZSBjb250ZW50LCBSZXZpZXdlZC1ieTogQW5kcmV3IENvb3Blcgo8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
