From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/5] x86/hvm: Adjust hvmemul_rep_stos() to
 compile with -Wvla
Date: Tue, 25 Sep 2018 11:31:08 +0100
Message-ID: <859482e7-57a7-4cc9-8f39-b894e5ea2461@citrix.com>
References: <1537794003-30851-1-git-send-email-andrew.cooper3@citrix.com>
 <1537794003-30851-4-git-send-email-andrew.cooper3@citrix.com>
 <5BA8F1B102000078001EB3B3@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5BA8F1B102000078001EB3B3@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjQvMDkvMTggMTU6MTYsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDI0LjA5LjE4IGF0
IDE1OjAwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IEZvciBhdCBsZWFz
dCAiZ2NjIChVYnVudHUgNS40LjAtNnVidW50dTF+MTYuMDQuMTApIDUuNC4wIDIwMTYwNjA5Iiwg
dGhlCj4+IHR5cGVjYXN0IG9mIGJ1ZiB0cmlnZ2VycyBhIFZhcmlhYmxlIExlbmd0aCBBcnJheSB3
YXJuaW5nLgo+Pgo+PiBBbHRlciB0aGUgYXNtIGV4cHJlc3Npb24gdG8gYXZvaWQgdGhlIHR5cGVj
YXN0LCB3aGljaCBuZWNlc3NpdGF0ZXMgdGhlCj4+IGludHJvZHVjdGlvbiBvZiBhIG1lbW9yeSBj
bG9iYmVyIGFzIHRoZSBjb21waWxlciBjYW4gbm8gbG9uZ2VyIGlkZW50aWZ5Cj4+IHRoZSB0b3Rh
bCBxdWFudGl0eSBvZiB3cml0dGVuIG1lbW9yeS4KPiBJIGRpc2xpa2UgdGhpcywgYnV0IHdoYXQg
ZG8geW91IGRvLiBXb3VsZCBiZSBxdWl0ZSBoZWxwZnVsIHRob3VnaCB0bwo+IGhhdmUgYSBjb21t
ZW50IHRoZXJlLCBvciBlbHNlIEkgbWlnaHQgYmUgdGVtcHRlZCB0byB1bmRvIHRoZQo+IG1lbW9y
eSBjbG9iYmVyIGluIGEgY291cGxlIG9mIG1vbnRocy95ZWFycyB0aW1lLgoKT24gZnVydGhlciBp
bnZlc3RpZ2F0aW9uLCBpdHMgYWxsIHZlcnNpb25zIG9mIEdDQyBhbmQgQ2xhbmcgd2hlbiB1c2lu
ZwotV3ZsYS7CoCBJJ2xsIHR3ZWFrIHRoZSBjb21taXQgbWVzc2FnZSBzbyBpdCBkb2Vzbid0IHJl
YWQgYXMgaWYgaXQgbWlnaHQKYmUgYSBxdWlyayBpbiB0aGF0IHNwZWNpZmljIGNvbXBpbGVyLgoK
fkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
