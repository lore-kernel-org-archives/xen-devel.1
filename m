From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v2 03/10] libxl: Clean up
 userlookup_helper_getpw* helper
Date: Wed, 12 Dec 2018 15:26:31 +0000
Message-ID: <23569.10407.403233.48606@mariner.uk.xensource.com>
References: <20181206150252.30766-1-george.dunlap@citrix.com>
 <20181206150252.30766-3-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AgIX=OV=citrix.com=prvs=8770bfd16=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gX6PL-00033k-5T
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 15:26:43 +0000
In-Reply-To: <20181206150252.30766-3-george.dunlap@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

R2VvcmdlIER1bmxhcCB3cml0ZXMgKCJbUEFUQ0ggdjIgMDMvMTBdIGxpYnhsOiBDbGVhbiB1cCB1
c2VybG9va3VwX2hlbHBlcl9nZXRwdyogaGVscGVyIik6Cj4gQnJpbmcgY29udmVudGlvbnMgbW9y
ZSBpbiBsaW5lIHdpdGggbGlieGxfX3hzX3JlYWRfY2hlY2tlZCgpOgo+IC0gSWYgZm91bmQsIHJl
dHVybiAwIGFuZCBzZXQgcG9pbnRlciB0byBub24tTlVMTAo+IC0gSWYgbm90IGZvdW5kLCByZXR1
cm4gMCBhbmQgc2V0IHBvaW50ZXIgdG8gTlVMTAo+IC0gT24gZXJyb3IsIHJldHVybiBsaWJ4bC1z
dHlsZSBlcnJvciBudW1iZXIuCj4gCj4gVXBkYXRlIGRvY3VtZW50YXRpb24gdG8gbWF0Y2guCi4u
Lgo+ICAjZGVmaW5lIERFRklORV9VU0VSTE9PS1VQX0hFTFBFUihOQU1FLFNQRUNfVFlQRSxTVFJV
Q1ROQU1FLFNZU0NPTkYpICAgICBcCj4gICAgICBzdGF0aWMgaW50IHVzZXJsb29rdXBfaGVscGVy
XyMjTkFNRShsaWJ4bF9fZ2MgKmdjLCAgICAgICAgICAgICAgICAgIFwKPiBAQCAtODMsNyArODks
NyBAQCBzdGF0aWMgaW50IGxpYnhsX19jcmVhdGVfcWVtdV9sb2dmaWxlKGxpYnhsX19nYyAqZ2Ms
IGNoYXIgKm5hbWUpCj4gICAgICAgICAgc3RydWN0IFNUUlVDVE5BTUUgKnJlc3VsdHAgPSBOVUxM
OyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKCmdpdCBkaWZmIGhhcyBleGNlbGxlZCBp
dHNlbGYgaW4gY2hvaWNlIG9mIGhlYWRpbmcgbGluZSwgaGFzbid0IGl0ID8KCj4gQEAgLTE0Miwx
NCArMTQ3LDE0IEBAIHN0YXRpYyBpbnQgbGlieGxfX2RvbWFpbl9nZXRfZGV2aWNlX21vZGVsX3Vp
ZChsaWJ4bF9fZ2MgKmdjLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICZ1c2VyX3B3YnVmLCAmdXNlcl9iYXNlKTsKPiAgICAgIGlmIChyZXQgPCAwKQo+ICAgICAg
ICAgIHJldHVybiByZXQ7Cj4gLSAgICBpZiAocmV0ID4gMCkgewo+ICsgICAgaWYgKHVzZXJfYmFz
ZSkgewoKSSB3b3VsZCBwcmVmZXIgdG8gYWxzbzoKCiAgLSAgICBpZiAocmV0IDwgMCkKICArICAg
IGlmIChyZXQpCiAgICAgICAgICAgcmV0dXJuIHJldDsKCndoaWNoIGlzIG1vcmUgY29udmVudGlv
bmFsIGZvciByYyBhbmQgbWlnaHQgcmVkdWNlIHRoZSBpbXBhY3Qgb2YgYnVncwp3aGVyZSB0aGUg
ZnVuY3Rpb24gcmV0dXJuZWQgYSBwb3NpdGl2ZS4gIChUd2ljZS4pCgpXaXRoIG9yIHdpdGhvdXQg
dGhhdCBjaGFuZ2UsCgpBY2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJp
eC5jb20+CgpUaGFua3MgZm9yIHRoZSBjbGVhbnVwIQoKSWFuLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
