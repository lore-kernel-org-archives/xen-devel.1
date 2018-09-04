From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4] x86/hvm: remove default ioreq server
 (again)
Date: Tue, 04 Sep 2018 04:22:15 -0600
Message-ID: <5B8E5CD702000078001E50ED@prv1-mh.provo.novell.com>
References: <20180903164627.33226-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qfrq=ls=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fx8TW-0007EE-Uw
 for xen-devel@lists.xenproject.org; Tue, 04 Sep 2018 10:22:22 +0000
In-Reply-To: <20180903164627.33226-1-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjA5LjE4IGF0IDE4OjQ2LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IE15IHJlY2VudCBwYXRjaCBbMV0gdG8gcWVtdS14ZW4tdHJhZGl0aW9uYWwgcmVtb3ZlcyB0
aGUgbGFzdCB1c2Ugb2YgdGhlCj4gJ2RlZmF1bHQnIGlvcmVxIHNlcnZlciBpbiBYZW4uIChUaGlz
IGlzIGEgY2F0Y2gtYWxsIGlvcmVxIHNlcnZlciB0aGF0IGlzCj4gdXNlZCBpZiBubyBleHBsaWNp
dGx5IHJlZ2lzdGVyZWQgSS9PIHJhbmdlIGlzIHRhcmdldHRlZCkuCj4gCj4gVGhpcyBwYXRjaCBj
YW4gYmUgYXBwbGllZCBvbmNlIHRoYXQgcGF0Y2ggaXMgY29tbWl0dGVkLCB0byByZW1vdmUgdGhl
Cj4gKD4xMDAgbGluZXMgb2YpIHJlZHVuZGFudCBjb2RlIGluIFhlbi4KPiAKPiBUaGUgcHJldmlv
dXMgdmVyc2lvbiBvZiB0aGlzIHBhdGNoIGNhdXNlZCBhIFFFTVUgYnVpbGQgZmFpbHVyZS4gVGhp
cyBoYXMKPiBiZWVuIGZpeGVkIGJ5IGV4dGVuZGluZyB0aGUgI2lmZGVmIGFyb3VuZCBkZXByZWNh
dGVkIEhWTV9QQVJBTSBkZWNsYXJhdGlvbnMKPiB0byBfX1hFTl9UT09MU19fIGFzIHdlbGwgYXMg
X19YRU5fXy4KPiAKPiBOT1RFOiBUaGUgcmVtb3ZhbCBvZiB0aGUgc3BlY2lhbCBjYXNlIGZvciBI
Vk1fUEFSQU1fRE1fRE9NQUlOIGluCj4gICAgICAgaHZtX2FsbG93X3NldF9wYXJhbSgpIGlzIG5v
dCBkaXJlY3RseSByZWxhdGVkIHRvIHJlbW92YWwgb2YKPiAgICAgICBkZWZhdWx0IGlvcmVxIHNl
cnZlcnMuIEl0IGNvdWxkIGhhdmUgYmVlbiBjbGVhbmVkIHVwIGF0IGFueSB0aW1lCj4gICAgICAg
YWZ0ZXIgY29tbWl0IDlhNDIyYzAzICJ4ODYvaHZtOiBzdG9wIHBhc3NpbmcgZXhwbGljaXQgZG9t
aWQgdG8KPiAgICAgICBodm1fY3JlYXRlX2lvcmVxX3NlcnZlcigpIi4gSXQgaXMgbm93IGFkZGVk
IHRvIHRoZSBuZXcKPiAgICAgICBkZXByZWNhdGVkIHNldHMgaW50cm9kdWNlZCBieSB0aGlzIHBh
dGNoLgo+IAo+IFsxXSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwv
eGVuLWRldmVsLzIwMTgtMDgvbXNnMDAyNzAuaHRtbCAKPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVs
IER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
