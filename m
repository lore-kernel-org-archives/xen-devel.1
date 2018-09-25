From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/6] xen/vsprintf: Introduce %*pb[l] for
 printing bitmaps
Date: Tue, 25 Sep 2018 14:06:09 +0100
Message-ID: <e1719883-6217-722f-dba7-a8526b14f035@citrix.com>
References: <1536235696-31359-1-git-send-email-andrew.cooper3@citrix.com>
 <1536235696-31359-2-git-send-email-andrew.cooper3@citrix.com>
 <5B922BA702000078001E62D0@prv1-mh.provo.novell.com>
 <1c2ee3b3-9f7c-ab07-36bd-95103c93fb91@citrix.com>
 <5B9295CD02000078001E6723@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B9295CD02000078001E6723@prv1-mh.provo.novell.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Dario Faggioli <dfaggioli@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDkvMTggMTY6MTQsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBJcnJlc3BlY3RpdmUgb2Yg
d2hldGhlciB5b3UgdGhpbmsgaXQgaXMgYW1iaWd1b3VzIG9yIG5vdCwgSSBkb24ndCB2aWV3Cj4+
IHRoaXMgYXMgYSBnb29kIGVub3VnaCAocG90ZW50aWFsKSBpc3N1ZSB0byBkaXZlcmdlLgo+Pgo+
PiBGdXJ0aGVybW9yZSwgKGFuZCBtb3JlIGxpa2VseSB0byBzd2F5IHlvdXIgb3BpbmlvbiksIE4x
NTcwIGluZGljYXRlcwo+PiB0aGF0IHRoZSAnbCcgbGVuZ3RoIG1vZGlmaWVyIGlzIG9ubHkgYXBw
bGljYWJsZSBmb3IgdGhlIGRpb3V4WGNzCj4+IGNvbnZlcnNpb24gc3BlY2lmaWVycywgYW5kIGJv
dGggQ2xhbmcgYW5kIEdDQyBlbmZvcmNlIHRoaXMgd2l0aCAtV2Zvcm1hdC4KPj4KPj4gYW5kcmV3
Y29vcEBhbmRyZXdjb29wOi9sb2NhbC94ZW4uZ2l0L3hlbiQgY2xhbmctNi4wIC1XYWxsIC1XZXJy
b3IgLVdleHRyYSAKPj4gZm9vLmMgLW8gZm9vLm8KPj4gZm9vLmM6NzoyMjogZXJyb3I6IGxlbmd0
aCBtb2RpZmllciAnbCcgcmVzdWx0cyBpbiB1bmRlZmluZWQgYmVoYXZpb3Igb3Igbm8gCj4+IGVm
ZmVjdCB3aXRoICdwJyBjb252ZXJzaW9uIHNwZWNpZmllciBbLVdlcnJvciwtV2Zvcm1hdF0KPj4g
ICAgIHByaW50ZigiVGVzdGluZyAlbHBkXG4iLCBwdHIpOwo+PiAgICAgICAgICAgICAgICAgICAg
IH5efgo+PiAxIGVycm9yIGdlbmVyYXRlZC4KPiBZZWFoLCBJIHN0YXJ0ZWQgdG8gYmUgY29uY2Vy
bmVkIG9mIHRoaXMgaGFwcGVuaW5nIGFmdGVyIEkgaGFkIHNlbnQKPiB0aGUgcmVwbHkuIEdpdmVu
IHRoaXMgSSBndWVzcyB3ZSBoYXZlIG5vIChnb29kKSBjaG9pY2UgYmVzaWRlcyBnb2luZwo+IHRo
ZSBzdWZmaXggcm91dGUuCgpTbyBjYW4gSSB0YWtlIHRoaXMgYXMgYXQgbGVhc3QgYW4gYWNrP8Kg
IEN1cnJlbnRseSB0aGlzIHNlcmllcyBpcyBzdGFsbGVkLgoKfkFuZHJldwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
