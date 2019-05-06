From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: [PATCH 3/5] drivers/video: Drop framebuffer size
 constraints
Date: Mon,  6 May 2019 16:50:19 +0200
Message-ID: <a8bebd8db2727b8b95edcee613f39b90fa93daff.1557154206.git-series.marmarek@invisiblethingslab.com>
References: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SrHI=TG=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hNf9Z-0004Ln-8A
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 15:03:41 +0000
In-Reply-To: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
References: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGxpbWl0IDE5MDB4MTIwMCBkbyBub3QgbWF0Y2ggcmVhbCB3b3JsZCBkZXZpY2VzICgxOTAw
IGxvb2tzIGxpa2UgYQp0eXBvLCBzaG91bGQgYmUgMTkyMCkuIEJ1dCBpbiBwcmFjdGljZSB0aGUg
bGltaXRzIGFyZSBhcmJpdHJhcnkgYW5kIGRvCm5vdCBzZXJ2ZSBhbnkgcmVhbCBwdXJwb3NlLiBB
cyBkaXNjdXNzZWQgaW4gIkluY3JlYXNlIGZyYW1lYnVmZmVyIHNpemUKdG8gdG9kYXlzIHN0YW5k
YXJkcyIgdGhyZWFkLCBkcm9wIHRoZW0gY29tcGxldGVseS4KClRoaXMgZml4ZXMgZ3JhcGhpYyBj
b25zb2xlIG9uIGRldmljZSB3aXRoIDM4NDB4MjE2MCBuYXRpdmUgcmVzb2x1dGlvbi4KClNpZ25l
ZC1vZmYtYnk6IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxl
dGhpbmdzbGFiLmNvbT4KLS0tCkNjOiBPbGFmIEhlcmluZyA8b2xhZkBhZXBmbGUuZGU+Ci0tLQog
eGVuL2RyaXZlcnMvdmlkZW8vbGZiLmMgfCAxMCAtLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvdmlkZW8vbGZiLmMgYi94
ZW4vZHJpdmVycy92aWRlby9sZmIuYwppbmRleCAwNDc1YTY4Li41MDIyMTk1IDEwMDY0NAotLS0g
YS94ZW4vZHJpdmVycy92aWRlby9sZmIuYworKysgYi94ZW4vZHJpdmVycy92aWRlby9sZmIuYwpA
QCAtMTAsOSArMTAsNiBAQAogI2luY2x1ZGUgImxmYi5oIgogI2luY2x1ZGUgImZvbnQuaCIKIAot
I2RlZmluZSBNQVhfWFJFUyAxOTAwCi0jZGVmaW5lIE1BWF9ZUkVTIDEyMDAKLQogc3RydWN0IGxm
Yl9zdGF0dXMgewogICAgIHN0cnVjdCBsZmJfcHJvcCBsZmJwOwogCkBAIC0xNDYsMTMgKzE0Myw2
IEBAIHZvaWQgbGZiX2NhcnJpYWdlX3JldHVybih2b2lkKQogCiBpbnQgX19pbml0IGxmYl9pbml0
KHN0cnVjdCBsZmJfcHJvcCAqbGZicCkKIHsKLSAgICBpZiAoIGxmYnAtPndpZHRoID4gTUFYX1hS
RVMgfHwgbGZicC0+aGVpZ2h0ID4gTUFYX1lSRVMgKQotICAgIHsKLSAgICAgICAgcHJpbnRrKFhF
TkxPR19XQVJOSU5HICJDb3VsZG4ndCBpbml0aWFsaXplIGEgJXV4JXUgZnJhbWVidWZmZXIgZWFy
bHkuXG4iLAotICAgICAgICAgICAgICAgbGZicC0+d2lkdGgsIGxmYnAtPmhlaWdodCk7Ci0gICAg
ICAgIHJldHVybiAtRUlOVkFMOwotICAgIH0KLQogICAgIGxmYi5sZmJwID0gKmxmYnA7CiAKICAg
ICBsZmIubGJ1ZiA9IHhtYWxsb2NfYnl0ZXMobGZiLmxmYnAuYnl0ZXNfcGVyX2xpbmUpOwotLSAK
Z2l0LXNlcmllcyAwLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
