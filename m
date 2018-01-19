From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/6] x86: move invocations of
	hvm_flush_guest_tlbs()
Date: Fri, 19 Jan 2018 17:00:31 +0000
Message-ID: <0bb36516-753f-f159-e3f0-0b69cc06a4a5@citrix.com>
References: <5A62238B02000078001A0768@prv-mh.provo.novell.com>
 <5A6224C302000078001A0788@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=rwd1=eo=citrix.com=prvs=5503b2e3b=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ecaPu-00064v-0i
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2018 17:25:26 +0000
In-Reply-To: <5A6224C302000078001A0788@prv-mh.provo.novell.com>
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

T24gMTkvMDEvMTggMTY6MDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFRoZWlyIG5lZWQgaXMgbm90
IHRpZWQgdG8gdGhlIGFjdHVhbCBmbHVzaGluZyBvZiBUTEJzLCBidXQgdGhlIHRpY2tpbmcKPiBv
ZiB0aGUgVExCIGNsb2NrLiBNYWtlIHRoaXMgbW9yZSBvYnZpb3VzIGJ5IGZvbGRpbmcgdGhlIHR3
byBpbnZvY2F0aW9ucwo+IGludG8gYSBzaW5nbGUgb25lIGluIHByZV9mbHVzaCgpLgo+Cj4gQWxz
byBkZWZlciB0aGUgbGF0Y2hpbmcgb2YgQ1I0IGluIHdyaXRlX2NyMygpIHVudGlsIGFmdGVyIHBy
ZV9mbHVzaCgpCj4gKGFuZCBoZW5jZSBpbXBsaWNpdGx5IHVudGlsIGFmdGVyIElSUXMgYXJlIG9m
ZiksIG1ha2luZyBvcGVyYXRpb24KPiBzZXF1ZW5jZSB0aGUgc2FtZSBpbiBib3RoIGNhc2VzIChl
bGltaW5hdGluZyB0aGUgdGhlb3JldGljYWwgcmlzayBvZgo+IHByZV9mbHVzaCgpIGFsdGVyaW5n
IENSNCkuIFRoaXMgdGhlbiBhbHNvIGltcHJvdmVzIHJlZ2lzdGVyIGFsbG9jYXRpb24sCj4gYXMg
dGhlIGNvbXBpbGVyIGRvZXNuJ3QgbmVlZCB0byB1c2UgYSBjYWxsZWUtc2F2ZWQgcmVnaXN0ZXIg
Zm9yICJjcjQiCj4gYW55bW9yZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
