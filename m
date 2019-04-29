From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v3 2/4] x86/mem_sharing: introduce and use
 page_lock_memshr instead of page_lock
Date: Mon, 29 Apr 2019 17:42:15 +0100
Message-ID: <7e73e556-764b-a7b6-b142-2457b8dac418@citrix.com>
References: <20190426172138.14669-1-tamas@tklengyel.com>
 <20190426172138.14669-2-tamas@tklengyel.com>
 <5CC715D7020000780022A158@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uN3R=S7=citrix.com=prvs=015486667=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hL9ME-0007ah-2r
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 16:42:22 +0000
In-Reply-To: <5CC715D7020000780022A158@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gNC8yOS8xOSA0OjE4IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAyNi4wNC4xOSBh
dCAxOToyMSwgPHRhbWFzQHRrbGVuZ3llbC5jb20+IHdyb3RlOgo+PiBQYXRjaCBjZjRiMzBkY2Ew
YSAiQWRkIGRlYnVnIGNvZGUgdG8gZGV0ZWN0IGlsbGVnYWwgcGFnZV9sb2NrIGFuZCBwdXRfcGFn
ZV90eXBlCj4+IG9yZGVyaW5nIiBhZGRlZCBleHRyYSBzYW5pdHkgY2hlY2tpbmcgdG8gcGFnZV9s
b2NrL3BhZ2VfdW5sb2NrIGZvciBkZWJ1ZyBidWlsZHMKPj4gd2l0aCB0aGUgYXNzdW1wdGlvbiB0
aGF0IG5vIGh5cGVydmlzb3IgcGF0aCBldmVyIGxvY2tzIHR3byBwYWdlcyBhdCBvbmNlLgo+Pgo+
PiBUaGlzIGFzc3VtcHRpb24gZG9lc24ndCBob2xkIGR1cmluZyBtZW1vcnkgc2hhcmluZyBzbyB3
ZSBpbnRyb2R1Y2Ugc2VwYXJhdGUKPj4gZnVuY3Rpb25zLCBwYWdlX2xvY2tfbWVtc2hyIGFuZCBw
YWdlX3VubG9ja19tZW1zaHIsIHRvIGJlIHVzZWQgZXhjbHVzaXZlbHkKPj4gaW4gdGhlIG1lbW9y
eSBzaGFyaW5nIHN1YnN5c3RlbS4KPiAKPiBDb21wbGV0ZWx5IGJ5cGFzc2luZyB0aGVzZSBjaGVj
a3MgbG9va3MgdW5kZXNpcmFibGUgdG8gbWUsIHRvCj4gYmUgaG9uZXN0LiBPdG9oIGFzIGRpc2N1
c3NlZCBtZW0tc2hhcmluZyBpcyBhYnVzaW5nIHRoZSBsb2NrCj4gYW55d2F5LgoKSSdtIG5vdCBz
dXJlIHdoYXQgeW91IG1lYW4gYnkgImFidXNpbmciOyB3b3VsZCBpdCBiZSBhbnkgZGlmZmVyZW50
IGlmCnBhZ2Vfc3RydWN0KCkgaGFkIGEgc3BpbmxvY2sgZWxlbWVudCBjYWxsZWQgInBhZ2VfbG9j
ayIsIHRoYXQgd2FzIG9ubHkKdXNlZCBieSBQViBndWVzdHM/CgogLUdlb3JnZQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
