From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 5/5] drivers/video: use vlfb_info consistently
Date: Thu,  9 May 2019 21:48:56 +0200
Message-ID: <1b867212c9a027fdbd7ec9d48c57011ab7b931cc.1557431250.git-series.marmarek@invisiblethingslab.com>
References: <cover.1ff4fbcf3cedbe34db420b46be69328b299f325e.1557431250.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q/9x=TJ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hOp2X-00067n-IL
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 19:49:13 +0000
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

dmxmYl9pbmZvIGlzIGFuIGFsaWFzIGZvciB2Z2FfY29uc29sZV9pbmZvLnUudmVzYV9sZmIsIHNv
IHRoaXMgY2hhbmdlIGlzCnB1cmVseSBjb3NtZXRpYy4gQnV0IHVzaW5nIHRoZSBzYW1lIG5hbWUg
aGVscHMgcmVhZGluZyB0aGUgY29kZS4KClNpZ25lZC1vZmYtYnk6IE1hcmVrIE1hcmN6eWtvd3Nr
aS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KQWNrZWQtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQogeGVuL2RyaXZlcnMv
dmlkZW8vdmVzYS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvdmlkZW8vdmVzYS5jIGIveGVuL2Ry
aXZlcnMvdmlkZW8vdmVzYS5jCmluZGV4IGYwN2QyOTMuLmU5OTE4YTcgMTAwNjQ0Ci0tLSBhL3hl
bi9kcml2ZXJzL3ZpZGVvL3Zlc2EuYworKysgYi94ZW4vZHJpdmVycy92aWRlby92ZXNhLmMKQEAg
LTQ5LDcgKzQ5LDcgQEAgdm9pZCBfX2luaXQgdmVzYV9lYXJseV9pbml0KHZvaWQpCiB7CiAgICAg
dW5zaWduZWQgaW50IHZyYW1fdm1vZGU7CiAKLSAgICB2Z2FfY29tcGF0ID0gISh2Z2FfY29uc29s
ZV9pbmZvLnUudmVzYV9sZmIuZ2JsX2NhcHMgJiAyKTsKKyAgICB2Z2FfY29tcGF0ID0gISh2bGZi
X2luZm8uZ2JsX2NhcHMgJiAyKTsKIAogICAgIGlmICggKHZsZmJfaW5mby5iaXRzX3Blcl9waXhl
bCA8IDgpIHx8ICh2bGZiX2luZm8uYml0c19wZXJfcGl4ZWwgPiAzMikgKQogICAgICAgICByZXR1
cm47Ci0tIApnaXQtc2VyaWVzIDAuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
