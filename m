From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [RFC 4/4] HACK libxl_exec: Check QEMU status via
 QMP instead of xenstore
Date: Tue, 27 Mar 2018 11:36:00 +0100
Message-ID: <23226.7824.260388.684497@mariner.uk.xensource.com>
References: <20180326183401.17249-1-anthony.perard@citrix.com>
 <20180326183401.17249-5-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=2rlr=gr=citrix.com=prvs=617832343=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1f0lxU-0007QI-Pf
 for xen-devel@lists.xenproject.org; Tue, 27 Mar 2018 10:36:04 +0000
In-Reply-To: <20180326183401.17249-5-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1JGQyA0LzRdIEhBQ0sgbGlieGxfZXhlYzogQ2hlY2sg
UUVNVSBzdGF0dXMgdmlhIFFNUCBpbnN0ZWFkIG9mIHhlbnN0b3JlIik6Cj4gVGhpcyBwYXRoIGlz
IG1vcmUgb2YgYSBwcm9mIG9mIGNvbmNlcHQgcmVhdGhlciB0aGFuIGEgcGF0Y2ggYXMgdGhpcwo+
IHdvdWxkIGJyZWFrIHFlbXUtdHJhZC4KLi4uCj4gRm9yIGxpYnhsLCB0aGUgb25seSB3YXkgdG8g
ZmluZCBvdXQgaWYgcWVtdSBpcyByZWFkeSBvbiBtaWdyYXRlL3Jlc3RvcmUsCj4gaXQgaXMgdG8g
Y29ubmVjdCB0byB0aGUgUU1QIHNvY2tldCBhbmQgcnVuICJxdWVyeS1zdGF0dXMiLgo+IAo+IFRo
aXMgcGF0Y2ggc3VjY2VlZCBpbiBpbXBsZW1lbnRpbmcgdGhhdCwgYnV0IFFNUCBkb2Vzbid0IGZp
dCB3ZWxsIHdpdGgKPiB0aGUgbGlieGxfX2V2XyogaW5mcmFzdHJ1Y3R1cmUuIE9uZSBtYWluIGlz
c3VlIHdvdWxkIGJlIHFtcF9vcGVuKCksIGl0Cj4gdHJpZXMgdG8gY29ubmVjdCB0byB0aGUgUU1Q
IHNvY2tldCBkdXJpbmcgNSBzZWNvbmRzIHdpdGhvdXQgZXZlciBnaXZpbmcKPiBiYWNrIHRoZSBo
YW5kIHRvIGxpYnhsLgoKVGhlcmUgYXJlIHR3byBwcm9ibGVtcyBoZXJlLCBJIHRoaW5rLiAgVGhl
IGZpcnN0IG9uZSBpcyBhbiBpbnRlcm5hbApsaWJ4bCBhcGkgaXNzdWU6IGllLCB0aGF0IHRoZSBs
aWJ4bCBxbXAgY29kZSBkb2VzIG5vdCBoYXZlIHRoZSBwcm9wZXIKY2FsbGJhY2stc3R5bGUgQVBJ
LiAgVGhhdCBjYW4gYmUgZml4ZWQgaW5zaWRlIGxpYnhsLCBhbHRob3VnaCBpdCdzCnByb2JhYmx5
IGFubm95aW5nLgoKVGhlIHNlY29uZCBpcyB0aGF0IEFGQUlDVCB0aGVyZSBpcyBubyB3YXkgb3Ro
ZXIgdGhhbiB4ZW5zdG9yZSB0byBnZXQgYQpub3RpZmljYXRpb24gb2YgYW55IGtpbmQgd2hlbiBx
ZW11IGlzIHJlYWR5LiAgU28gdGhlIG9ubHkgcG9zc2libGUKYXBwcm9hY2ggaXMgcG9sbGluZy4g
IFRoYXQncyBwcmV0dHkgbmFzdHkuICBJIGhhdmVuJ3QgbG9va2VkIGF0IHRoZQpxZW11IGNvZGUg
aW4gZGV0YWlsIHRvIGNoZWNrIGlmIHRoaXMgaXMgcmVhbGx5IHRydWUuICBQZXJoYXBzIGxvb2tp
bmcKYXQgbGlidmlydCB3b3VsZCBnaXZlIHVzIGEgY2x1ZS4uLgoKSWFuLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
