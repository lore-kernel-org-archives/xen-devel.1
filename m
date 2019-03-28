From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 4/6] xen: don't free percpu areas during
 suspend
Date: Thu, 28 Mar 2019 02:03:30 -0600
Message-ID: <5C9C7FD202000078002225AB@prv1-mh.provo.novell.com>
References: <20190318131155.29450*1*jgross@suse.com>
 <20190318131155.29450*5*jgross@suse.com>
 <e10c14cd*54ac*8d8c*2d5c*db4adbd39d07@citrix.com>
 <aac2efca-8024-485a-4b8f-8565341c305c@suse.com>
 <5C9BA70E02000078002223A3@suse.com>
 <3067f146-bfc4-1f00-64bf-5750b6486ee1@suse.com>
 <29b8365e-2cae-fec6-0bff-46d014800d80@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r6Gf=R7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h9Q0d-0002pg-Vy
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2019 08:03:36 +0000
In-Reply-To: <29b8365e-2cae-fec6-0bff-46d014800d80@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjAzLjE5IGF0IDA3OjU5LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAy
Ny8wMy8yMDE5IDE3OjUyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBPbiAyNy8wMy8yMDE5IDE3
OjM4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDI3LjAzLjE5IGF0IDE3OjE4LCA8amdy
b3NzQHN1c2UuY29tPiB3cm90ZToKPj4+PiBPbiAyNy8wMy8yMDE5IDE2OjU1LCBBbmRyZXcgQ29v
cGVyIHdyb3RlOgo+Pj4+PiBPbiAxOC8wMy8yMDE5IDEzOjExLCBKdWVyZ2VuIEdyb3NzIHdyb3Rl
Ogo+Pj4+Pj4gSW5zdGVhZCBvZiBmcmVlaW5nIHBlcmNwdSBhcmVhcyBkdXJpbmcgc3VzcGVuZCBh
bmQgYWxsb2NhdGluZyB0aGVtCj4+Pj4+PiBhZ2FpbiB3aGVuIHJlc3VtaW5nIGtlZXAgdGhlbS4g
T25seSBmcmVlIGFuIGFyZWEgaW4gY2FzZSBhIGNwdSBkaWRuJ3QKPj4+Pj4+IGNvbWUgdXAgYWdh
aW4gd2hlbiByZXN1bWluZy4KPj4+Pj4+Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdy
b3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+Pj4+Cj4+Pj4+IEhtbSAtIHRoaXMgaXMgc2xpZ2h0bHkg
cHJvYmxlbWF0aWMsIGdpdmVuIHRoZSBkdWFsIG5hdHVyZSBvZiB0aGlzIGNvZGUuCj4+Pj4+Cj4+
Pj4+IEkgYWdyZWUgdGhhdCBpdCB0aGlzIGNoYW5nZSBpcyBiZW5lZmljaWFsIGZvciB0aGUgc3Vz
cGVuZCBjYXNlLCBidXQgaXQKPj4+Pj4gaXMgYSBwcm9ibGVtIHdoZW4gd2UgYXJlIHBhcmtpbmcg
YW4gaW5kaXZpZHVhbCBDUFUgZm9yIHNtdD0wIG9yCj4+Pj4+IHhlbi1ocHRvb2wgcmVhc29ucy4K
Pj4+Pj4KPj4+Pj4gRG8gd2UgaGF2ZSBhbnkgaGludCB3ZSBjYW4gdXNlIHdoZW4gdGFraW5nIHRo
ZSBDUFUgZG93biBhcyB0byB3aGV0aGVyCj4+Pj4+IHdlJ3JlIGV4cGVjdGluZyBpdCB0byBjb21l
IHN0cmFpZ2h0IGJhY2sgdXAgYWdhaW4/Cj4+Pj4KPj4+PiBEaWQgeW91IGxvb2sgaW50byB0aGUg
cGF0Y2g/IEkgZGlkIHRoaXMgYnkgdGVzdGluZyBzeXN0ZW1fc3RhdGUuCj4+Pgo+Pj4gSSB0aGlu
ayB0aGVyZSdzIGEgd2lkZXIgcHJvYmxlbSBoZXJlOiBlbmFibGVfbm9uYm9vdF9jcHVzKCkKPj4+
IG9ubHkgYnJpbmdzIGJhY2sgdXAgdGhlIENQVXMgdGhhdCB3ZXJlIHByZXZpb3VzbHkgb25saW5l
Lgo+Pj4gUGFya2VkIG9uZXMgd291bGQgYmUgbGVmdCBhbG9uZSwgeWV0IGFmdGVyIHJlc3VtZSB0
aGV5J2QKPj4+IG5lZWQgdG8gYmUgcHV0IGJhY2sgaW50byBwYXJrZWQgc3RhdGUuCj4+IAo+PiBJ
IGNhbiBhZGQgdGhhdCBoYW5kbGluZyBpbiB0aGUgcmVzcGluIG9mIHRoZSBzZXJpZXMuCj4gCj4g
TG9va2luZyBkZWVwZXIgaW50byB0aGF0IG1lc3MgSSBiZWxpZXZlIHRoYXQgc2hvdWxkIGJlIGEg
c2VyaWVzIG9mIGl0cwo+IG93bi4gQ3B1IHBhcmtpbmcgbmVlZHMgdG8gYmUgaGFuZGxlZCBmb3Ig
Y3B1IGhvdHBsdWcgYW5kIGNvcmUgcGFya2luZwo+IChYRU5QRl9jb3JlX3BhcmtpbmcpLCB0b28u
CgpXaGF0IGlzc3VlIGRvIHlvdSBzZWUgZm9yIENQVSBob3RwbHVnPyBjcHVfdXBfaGVscGVyKCkg
aGFzCmJlZW4gbW9kaWZpZWQgYnkgdGhlIHBhcmtpbmcgc2VyaWVzLgoKRm9yIGNvcmUgcGFya2lu
ZyBJIHdvbmRlciB3aGV0aGVyIGNvcmVfcGFya2luZ19oZWxwZXIoKQpzaG91bGRuJ3QsIGZpcnN0
IG9mIGFsbCwgaW52b2tlIGNwdV97dXAsZG93bn1faGVscGVyKCkuIFRoaXMKd291bGRuJ3QgYmUg
ZW5vdWdoLCB0aG91Z2ggLSB0aGUgcG9saWN5IGhvb2tzIG5lZWQgdG8gaG9ub3IKb3B0X3NtdCBh
cyB3ZWxsLgoKQXMgdG8gdGhpcyB3YW50aW5nIHRvIGJlIGEgcGF0Y2ggLyBzZXJpZXMgb2YgaXRz
IG93biAtIEkgZG9uJ3QKbWluZCwgYnV0IHByZWZlcmFibHkgaXQgd291bGQgY29tZSBhaGVhZCBv
ZiB5b3VyIGNoYW5nZXMKaGVyZSwgc28gdGhhdCBpdCBjYW4gYmUgYmFja3BvcnRlZCBpbmRlcGVu
ZGVudGx5IGFuZAooc3VmZmljaWVudGx5KSBlYXNpbHkgKHVubGVzcyBvZiBjb3Vyc2UgdGhlcmUn
cyByZWFsbHkgbm8KY29sbGlzaW9uIGJldHdlZW4gdGhlIHR3bykuCgpKYW4KCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
