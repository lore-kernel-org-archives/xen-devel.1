From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86: fix "xpti=" and "pv-l1tf=" yet again
Date: Tue, 11 Sep 2018 02:20:57 -0600
Message-ID: <5B977AE902000078001E708A@prv1-mh.provo.novell.com>
References: <5B7BED1B02000078001E063C@prv1-mh.provo.novell.com>
 <d17ea7a1-87db-0926-5ac9-cd6be3ef8523@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=zj+h=lz=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fzduw-0006lk-UC
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 08:21:02 +0000
In-Reply-To: <d17ea7a1-87db-0926-5ac9-cd6be3ef8523@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjA4LjE4IGF0IDE0OjM2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjEvMDgvMTggMTE6NDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBXaGlsZSBjb21t
aXQgMmEzYjM0ZWM0NyAoIng4Ni9zcGVjLWN0cmw6IFlldCBtb3JlIGZpeGVzIGZvciB4cHRpPQo+
PiBwYXJzaW5nIikgaW5kZWVkIGZpeGVkICJ4cHRpPWRvbTAiLCBpdCBicm9rZSAieHB0aT1uby1k
b20wIiwgaW4gdGhhdAo+PiB0aGlzIHRoZW4gYmVjYW1lIGVxdWl2YWxlbnQgdG8gInhwdGk9bm8i
Lgo+IAo+IFRoYXQgd2FzIGFjY2lkZW50YWwsIGJ1dCB0aGUgZW5kIHJlc3VsdCBpcyBjb25zaXN0
ZW50IHdpdGggb3RoZXIgb3B0aW9ucy4KPiAKPiBBcyB3aXRoIHNwZWMtY3RybCwgaWYgc29tZW9u
ZSB3YW50cyB0byBzdGFydCBtYWtpbmcgZmluZS1ncmFpbiBjb250cm9sLAo+IHRoZXkgc2hvdWxk
IHNwZWNpZnkgZXZlcnl0aGluZy4gIFRoZXJlIGlzIGEgcmVhc29uIHdoeSB0aGUKPiAKPiAqKldB
Uk5JTkc6IEFueSB1c2Ugb2YgdGhpcyBvcHRpb24gbWF5IGludGVyZmVyZSB3aXRoIGhldXJpc3Rp
Y3MuICBVc2UKPiB3aXRoIGV4dHJlbWUgY2FyZS4qKgo+IAo+IGRpc2NsYWltZXIgZXhpc3RzLgoK
SSd2ZSBsb29rZWQgYWdhaW46IFN1Y2ggYSBkaXNjbGFpbWVyIGRvZXMgbm90IGV4aXN0IGZvciB4
cHRpPSBub3IKcHYtbDF0Zj0sIGFuZCBpdCBzaG91bGRuJ3QsIGFzIHVzZSBvZiB0aGVzZSBvcHRp
b25zIGRvZXMgbm90IGluIGZhY3QKaW50ZXJmZXJlIHdpdGggYW55IChvdGhlcikgaGV1cmlzdGlj
cyAodGhleSdyZSBzZXBhcmF0ZSBvcHRpb25zIGZvcgpyZWFzb25zIGJleW9uZCBzeW50YXggaXNz
dWVzIHRoYXQgd291bGQgcmVzdWx0IGlmIHRoZXkgd2VyZSBmb2xkZWQKaW50byBzcGVjLWN0cmw9
ICkuCgpJZiB0aGUgc29sZSByZW1haW5pbmcgY2hhbmdlIHJlcXVlc3Qgd2FzIHRvIHNwbGl0IHRo
ZSB2YXJpYWJsZXMgaW50bwpzZXBhcmF0ZSBib29sZWFucywgSSBjYW4gZG8gdGhhdCAoYWx0aG91
Z2gsIGFzIHNhaWQsIEknbSBub3QKY29udmluY2VkIHRoaXMgaXMgaGVscGZ1bCkuIEJ1dCB0aGVy
ZSB3ZXJlIG90aGVyIG9wZW4gcG9pbnRzLCBhbmQKSSdkIHByZWZlciB0byBlaXRoZXIgY29tbWl0
IHYxIHdpdGggdGhlIG9uZSBjb3B5LWFuZC1wYXN0ZSBidWcKZml4ZWQsIG9yIHNlbmQgYSB2MiB3
aGljaCBoYXMgYSBjaGFuY2Ugb2YgYmVpbmcgYWNjZXB0ZWQgKGkuZS4Kd2l0aCBhbGwgb3BlbiBw
b2ludHMgYWRkcmVzc2VkIHZlcmJhbGx5IG9yIGJ5IGNvZGUgY2hhbmdlcykuCgpKYW4KCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
