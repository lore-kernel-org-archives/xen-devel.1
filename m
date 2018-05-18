From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v1 2/2] hvm/svm: Enable EMUL_UNIMPLEMENTED
 events on svm
Date: Fri, 18 May 2018 21:22:46 +0300
Message-ID: <923f5535-8da6-f749-aee4-ca9322c1bc2a@bitdefender.com>
References: <1526037083-29920-1-git-send-email-aisaila@bitdefender.com>
 <1526037083-29920-2-git-send-email-aisaila@bitdefender.com>
 <5AFEF1F102000078001C4213@prv1-mh.provo.novell.com>
 <CABfawhn-V3fqL8RueJLCURy0VnSwbb3y0wMPs6uL548h+y9Unw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CABfawhn-V3fqL8RueJLCURy0VnSwbb3y0wMPs6uL548h+y9Unw@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <JBeulich@suse.com>
Cc: Alexandru Isaila <aisaila@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMTgvMjAxOCAwNzowMCBQTSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIEZyaSwg
TWF5IDE4LCAyMDE4IGF0IDk6MzIgQU0sIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4g
d3JvdGU6Cj4+Pj4+IE9uIDExLjA1LjE4IGF0IDEzOjExLCA8YWlzYWlsYUBiaXRkZWZlbmRlci5j
b20+IHdyb3RlOgo+Pj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBi
aXRkZWZlbmRlci5jb20+Cj4+Cj4+IEl0IHdvdWxkIGJlIGhlbHBmdWwgdG8ga25vdyB3aGV0aGVy
IHRoaXMgcGF0Y2ggZGVwZW5kcyBvbiBwYXRjaCAxIGluIGFueSB3YXkuCj4+IElmIGl0IGRvZXNu
J3QsIHdpdGggVGFtYXMnZXMgYWNrIHRoaXMgY291bGQgZ28gaW4gaW5kZXBlbmRlbnQgb2YgdGhl
IG90aGVyIG9uZS4KPj4gRm9yIGNvbnZleWluZyBzdWNoIGluZm9ybWF0aW9uIGEgY292ZXIgbGV0
dGVyIGlzIHVzdWFsbHkgaGVscGZ1bC4KPiAKPiBUaGUgdHdvIHR5cGVzIG9mIGV2ZW50cyBhcmUg
aW5kZXBlbmRlbnQsIHlvdSBjYW4gdHJpZ2dlciBlbXVsYXRpb24KPiB3aXRob3V0IG1lbV9hY2Nl
c3MgcmVzdHJpY3Rpb25zLCBhbHRob3VnaCB0aGF0IGlzIHRoZSBvbmUgbW9zdGx5IHVzZWQuCgpJ
bmRlZWQsIGl0IHVzdWFsbHkgb25seSBtYWtlcyBzZW5zZSB0byBlbXVsYXRlIGFuIGluc3RydWN0
aW9uIHRoYXQgaGFzCmNhdXNlZCBhIHBhZ2UgZmF1bHQgdm1fZXZlbnQgKHNvbWV0aGluZyB0aGF0
J3MgYWNjZXNzaW5nIGEgcmVzdHJpY3RlZApwYWdlKSwgYnV0IGl0IGlzIHBvc3NpYmxlIHRvIHNl
dCB0aGUgZW11bGF0ZSBmbGFnIHdoZW4gcmVwbHlpbmcgdG8gYSBDUgpvciBNU1Igd3JpdGUgZXZl
bnQuCgpXZSd2ZSB3YWl0ZWQgdGhpcyBsb25nIHRvIHNlbmQgdGhpcyBwYXRjaCBvdXQgYmVjYXVz
ZSBhdCBsZWFzdCBvdXIgdXNlCmNhc2VzIGFsd2F5cyBvbmx5IGludm9sdmUgZW11bGF0aW5nIGFz
IGEgcmVzcG9uc2UgdG8gcGFnZSBmYXVsdCBldmVudHMKKGZvciBNU1IgYW5kIENSIHdyaXRlcyB3
ZSBhcmUgb25seSBpbnRlcmVzdGVkIGluIGJlaW5nIGFibGUgdG8gZGVueSB0aGUKd3JpdGUpIC0g
YnV0IGZ1bmN0aW9uYWxseSB0aGVyZSdzIG5vIHJlYXNvbiB3aHkgdGhpcyBwYXRjaCBuZWVkcyB0
byB3YWl0CmZvciB0aGUgbWVtX2FjY2VzcyBvbmUuCgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
