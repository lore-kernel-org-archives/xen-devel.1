From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/3] xen/cpu: Distinguish "cpu already in
 that state" in cpu_{up, down}()
Date: Wed, 03 Apr 2019 02:49:23 -0600
Message-ID: <5CA47393020000780022427A@prv1-mh.provo.novell.com>
References: <1554235048-3373-1-git-send-email-andrew.cooper3@citrix.com>
 <1554235048-3373-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1554235048-3373-2-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjA0LjE5IGF0IDIxOjU3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQWxsIG1ldGhvZHMgb2YgcXVlcnlpbmcgdGhlIG9ubGluZSBzdGF0ZSBvZiBhIENQVSBh
cmUgcmFjeSB3aXRob3V0IHRoZSBob3RwbHVnCj4gbG9jayBoZWxkLCB3aGljaCBjYW4gbGVhZCB0
byBhIFRPQ1RPVSByYWNlIHRyeWluZyB0byBvbmxpbmUgb3Igb2ZmbGluZSBDUFVzLgo+IAo+IERp
c3Rpbmd1aXNoIHRoaXMgY2FzZSB3aXRoIC1FRVhJU1QgcmF0aGVyIHRoYW4gLUVJTlZBTCwgc28g
dGhlIGNhbGxlciBjYW4gdGFrZQo+IG90aGVyIGFjdGlvbnMgaWYgbmVjZXNzYXJ5Lgo+IAo+IFdo
aWxlIGFkanVzdGluZyB0aGlzLCByZXdvcmsgdGhlIGNvZGUgc2xpZ2h0bHkgdG8gZm9sZCB0aGUg
ZXhpdCBwYXRocywgd2hpY2gKPiByZXN1bHRzIGluIGEgbWlub3IgcmVkdWN0aW9uIGluIGNvbXBp
bGVkIGNvZGUgc2l6ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
