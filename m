From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 4/6] xen: don't free percpu areas during
 suspend
Date: Wed, 27 Mar 2019 10:38:38 -0600
Message-ID: <5C9BA70E02000078002223A3@prv1-mh.provo.novell.com>
References: <20190318131155.29450-1-jgross@suse.com>
 <20190318131155.29450-5-jgross@suse.com>
 <e10c14cd-54ac-8d8c-2d5c-db4adbd39d07@citrix.com>
 <aac2efca-8024-485a-4b8f-8565341c305c@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0tC/=R6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h9BZb-0006os-Qt
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 16:38:43 +0000
In-Reply-To: <aac2efca-8024-485a-4b8f-8565341c305c@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI3LjAzLjE5IGF0IDE3OjE4LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAy
Ny8wMy8yMDE5IDE2OjU1LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAxOC8wMy8yMDE5IDEz
OjExLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4gSW5zdGVhZCBvZiBmcmVlaW5nIHBlcmNwdSBh
cmVhcyBkdXJpbmcgc3VzcGVuZCBhbmQgYWxsb2NhdGluZyB0aGVtCj4+PiBhZ2FpbiB3aGVuIHJl
c3VtaW5nIGtlZXAgdGhlbS4gT25seSBmcmVlIGFuIGFyZWEgaW4gY2FzZSBhIGNwdSBkaWRuJ3QK
Pj4+IGNvbWUgdXAgYWdhaW4gd2hlbiByZXN1bWluZy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+IAo+PiBIbW0gLSB0aGlzIGlzIHNsaWdo
dGx5IHByb2JsZW1hdGljLCBnaXZlbiB0aGUgZHVhbCBuYXR1cmUgb2YgdGhpcyBjb2RlLgo+PiAK
Pj4gSSBhZ3JlZSB0aGF0IGl0IHRoaXMgY2hhbmdlIGlzIGJlbmVmaWNpYWwgZm9yIHRoZSBzdXNw
ZW5kIGNhc2UsIGJ1dCBpdAo+PiBpcyBhIHByb2JsZW0gd2hlbiB3ZSBhcmUgcGFya2luZyBhbiBp
bmRpdmlkdWFsIENQVSBmb3Igc210PTAgb3IKPj4geGVuLWhwdG9vbCByZWFzb25zLgo+PiAKPj4g
RG8gd2UgaGF2ZSBhbnkgaGludCB3ZSBjYW4gdXNlIHdoZW4gdGFraW5nIHRoZSBDUFUgZG93biBh
cyB0byB3aGV0aGVyCj4+IHdlJ3JlIGV4cGVjdGluZyBpdCB0byBjb21lIHN0cmFpZ2h0IGJhY2sg
dXAgYWdhaW4/Cj4gCj4gRGlkIHlvdSBsb29rIGludG8gdGhlIHBhdGNoPyBJIGRpZCB0aGlzIGJ5
IHRlc3Rpbmcgc3lzdGVtX3N0YXRlLgoKSSB0aGluayB0aGVyZSdzIGEgd2lkZXIgcHJvYmxlbSBo
ZXJlOiBlbmFibGVfbm9uYm9vdF9jcHVzKCkKb25seSBicmluZ3MgYmFjayB1cCB0aGUgQ1BVcyB0
aGF0IHdlcmUgcHJldmlvdXNseSBvbmxpbmUuClBhcmtlZCBvbmVzIHdvdWxkIGJlIGxlZnQgYWxv
bmUsIHlldCBhZnRlciByZXN1bWUgdGhleSdkCm5lZWQgdG8gYmUgcHV0IGJhY2sgaW50byBwYXJr
ZWQgc3RhdGUuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
