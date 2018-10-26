From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 04/44] x86emul: generalize vector length
 handling for AVX512/EVEX
Date: Fri, 26 Oct 2018 17:10:04 +0100
Message-ID: <9f09fd01-3945-c7ba-b3e3-87c9d2c799d4@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5BAA34B502000078001EB9B6@prv1-mh.provo.novell.com>
 <5BAA37E302000078001EB9E9@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=f8h9=ng=citrix.com=prvs=8302ac893=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gG4gZ-0007MN-IM
 for xen-devel@lists.xenproject.org; Fri, 26 Oct 2018 16:10:07 +0000
In-Reply-To: <5BAA37E302000078001EB9E9@prv1-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDkvMjAxOCAxNDoyOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVG8gYWxsb3cgZm9yIHNv
bWUgY29kZSBzaGFyaW5nIHdoZXJlIHBvc3NpYmxlLCBjb3B5IFZFWC5MIGludG8gRVZFWC5MUgo+
IGV2ZW4gZm9yIFZFWCAob3IgWE9QKSBlbmNvZGVkIGluc25zLiBNYWtlIG9wZXJhbmQgc2l6ZSBk
ZXRlcm1pbmF0aW9uCj4gdXNlIHRoaXMgcmlnaHQgYXdheSwgYXQgdGhlIHNhbWUgdGltZSBhZGRp
bmcgY29uc2lzdGVuY3kgY2hlY2tzIGZvciB0aGUKPiBFVkVYIHNjYWxhciBpbnNuIGNhc2VzICh0
aGUgbm9uLXNjYWxhciBvbmVzIGFyZW4ndCB1bmlmb3JtIGVub3VnaCBmb3IKPiB0aGUgY2hlY2tp
bmcgdG8gYmUgZG9uZSBpbiBhIGNlbnRyYWwgcGxhY2UgbGlrZSB0aGlzKS4KPgo+IE5vdGUgdGhh
dCB0aGUgYnJvYWRjYXN0IGNhc2UgaXMgbm90IGhhbmRsZWQgaGVyZSwgYnV0IHdpbGwgYmUgdGFr
ZW4gY2FyZQo+IG9mIGVsc2V3aGVyZSAoaW4ganVzdCBhIHNpbmdsZSBwbGFjZSByYXRoZXIgdGhh
biBhdCBsZWFzdCB0d28pLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgoKQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
