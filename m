From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 3/5] drivers/video: Drop framebuffer size
 constraints
Date: Thu,  9 May 2019 21:48:54 +0200
Message-ID: <3126f6f2fa19be61319ea922243fddd7ae87e958.1557431250.git-series.marmarek@invisiblethingslab.com>
References: <cover.1ff4fbcf3cedbe34db420b46be69328b299f325e.1557431250.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q/9x=TJ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hOp2U-00066q-Bt
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 19:49:10 +0000
In-Reply-To: <cover.1ff4fbcf3cedbe34db420b46be69328b299f325e.1557431250.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <cover.1ff4fbcf3cedbe34db420b46be69328b299f325e.1557431250.git-series.marmarek@invisiblethingslab.com>
References: <cover.1ff4fbcf3cedbe34db420b46be69328b299f325e.1557431250.git-series.marmarek@invisiblethingslab.com>
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
dGhpbmdzbGFiLmNvbT4KU3VnZ2VzdGVkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+CkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgot
LS0KQ2M6IE9sYWYgSGVyaW5nIDxvbGFmQGFlcGZsZS5kZT4KLS0tCiB4ZW4vZHJpdmVycy92aWRl
by9sZmIuYyB8IDEwIC0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy92aWRlby9sZmIuYyBiL3hlbi9kcml2ZXJzL3ZpZGVv
L2xmYi5jCmluZGV4IDA0NzVhNjguLjUwMjIxOTUgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL3Zp
ZGVvL2xmYi5jCisrKyBiL3hlbi9kcml2ZXJzL3ZpZGVvL2xmYi5jCkBAIC0xMCw5ICsxMCw2IEBA
CiAjaW5jbHVkZSAibGZiLmgiCiAjaW5jbHVkZSAiZm9udC5oIgogCi0jZGVmaW5lIE1BWF9YUkVT
IDE5MDAKLSNkZWZpbmUgTUFYX1lSRVMgMTIwMAotCiBzdHJ1Y3QgbGZiX3N0YXR1cyB7CiAgICAg
c3RydWN0IGxmYl9wcm9wIGxmYnA7CiAKQEAgLTE0NiwxMyArMTQzLDYgQEAgdm9pZCBsZmJfY2Fy
cmlhZ2VfcmV0dXJuKHZvaWQpCiAKIGludCBfX2luaXQgbGZiX2luaXQoc3RydWN0IGxmYl9wcm9w
ICpsZmJwKQogewotICAgIGlmICggbGZicC0+d2lkdGggPiBNQVhfWFJFUyB8fCBsZmJwLT5oZWln
aHQgPiBNQVhfWVJFUyApCi0gICAgewotICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcgIkNv
dWxkbid0IGluaXRpYWxpemUgYSAldXgldSBmcmFtZWJ1ZmZlciBlYXJseS5cbiIsCi0gICAgICAg
ICAgICAgICBsZmJwLT53aWR0aCwgbGZicC0+aGVpZ2h0KTsKLSAgICAgICAgcmV0dXJuIC1FSU5W
QUw7Ci0gICAgfQotCiAgICAgbGZiLmxmYnAgPSAqbGZicDsKIAogICAgIGxmYi5sYnVmID0geG1h
bGxvY19ieXRlcyhsZmIubGZicC5ieXRlc19wZXJfbGluZSk7Ci0tIApnaXQtc2VyaWVzIDAuOS4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
