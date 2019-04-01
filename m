From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3] xen-block: scale sector based quantities
 correctly
Date: Mon, 1 Apr 2019 17:54:44 +0100
Message-ID: <20190401165444.GI1420__2954.83866227499$1554137762$gmane$org@perard.uk.xensource.com>
References: <20190401121719.27208-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Gs7N=SD=citrix.com=prvs=98749c841=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hB0Cx-0004hp-4M
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2019 16:54:51 +0000
Content-Disposition: inline
In-Reply-To: <20190401121719.27208-1-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBcHIgMDEsIDIwMTkgYXQgMDE6MTc6MTlQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoZSBYZW4gYmxraWYgcHJvdG9jb2wgcmVxdWlyZXMgdGhhdCBzZWN0b3IgYmFzZWQg
cXVhbnRpdGllcyBzaG91bGQgYmUKPiBpbnRlcnByZXRlZCBzdHJpY3RseSBhcyBtdWx0aXBsZXMg
b2YgNTEyIGJ5dGVzLiBTcGVjaWZpY2FsbHk6Cj4gCj4gImZpcnN0X3NlY3QgYW5kIGxhc3Rfc2Vj
dCBpbiBibGtpZl9yZXF1ZXN0X3NlZ21lbnQsIGFzIHdlbGwgYXMKPiBzZWN0b3JfbnVtYmVyIGlu
IGJsa2lmX3JlcXVlc3QsIGFyZSBhbHdheXMgZXhwcmVzc2VkIGluIDUxMi1ieXRlIHVuaXRzLiIK
PiAKPiBDb21taXQgZmNhYjJiNDY0ZTA2ICJ4ZW46IGFkZCBoZWFkZXIgYW5kIGJ1aWxkIGRhdGFw
bGFuZS94ZW4tYmxvY2suYyIKPiBpbmNvcnJlY3RseSBtb2RpZmllZCBiZWhhdmlvdXIgdG8gdXNl
IHRoZSBibG9jayBkZXZpY2UgbG9naWNhbF9ibG9ja19zaXplCj4gcHJvcGVydHkgYXMgdGhlIHNj
YWxlLCBpbnN0ZWFkIG9mIGNvcnJlY3RseSBzaGlmdGluZyB2YWx1ZXMgYnkgdGhlCj4gaGFyZGNv
ZGVkIEJEUlZfU0VDVE9SX0JJVFMgKGFuZCBoZW5jZSBzY2FsaW5nIHRoZW0gdG8gNTEyIGJ5dGUg
dW5pdHMpLgo+IFRoaXMgcGF0Y2ggdW5kb2VzIHRoYXQgY2hhbmdlIGFuZCByZXN0b3JlcyBjb21w
bGlhbmNlIHdpdGggdGhlIHNwZWMuCj4gCj4gRnVydGhlcm1vcmUsIHRoaXMgcGF0Y2ggYWxzbyBy
ZXN0b3JlcyB0aGUgb3JpZ2luYWwgeGVuX2Rpc2sgYmVoYXZpb3VyCj4gb2YgYWR2ZXJ0aXppbmcg
YSBoYXJkY29kZWQgJ3NlY3Rvci1zaXplJyB2YWx1ZSBvZiA1MTIgaW4geGVuc3RvcmUgYW5kCj4g
c2NhbGluZyAnc2VjdG9ycycgYWNjb3JkaW5nbHkuIFRoZSByZWFsaXplKCkgbWV0aG9kIGlzIGFs
c28gbW9kaWZpZWQgdG8KPiBmYWlsIGlmIGxvZ2ljYWxfYmxvY2tfc2l6ZSBpcyBzZXQgdG8gYW55
dGhpbmcgb3RoZXIgdGhhbiA1MTIuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxw
YXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBBbnRob255IFBFUkFSRCA8YW50
aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KClRoYW5rcywKCi0tIApBbnRob255IFBFUkFSRAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
