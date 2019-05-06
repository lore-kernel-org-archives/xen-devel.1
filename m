From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: [PATCH 5/5] drivers/video: use vlfb_info consistently
Date: Mon,  6 May 2019 16:50:21 +0200
Message-ID: <0463b8875424fc7be3d8ec5610d21439507af325.1557154206.git-series.marmarek@invisiblethingslab.com>
References: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SrHI=TG=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hNf9Z-0004M1-P2
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

dmxmYl9pbmZvIGlzIGFuIGFsaWFzIGZvciB2Z2FfY29uc29sZV9pbmZvLnUudmVzYV9sZmIsIHNv
IHRoaXMgY2hhbmdlIGlzCnB1cmVseSBjb3NtZXRpYy4gQnV0IHVzaW5nIHRoZSBzYW1lIG5hbWUg
aGVscHMgcmVhZGluZyB0aGUgY29kZS4KClNpZ25lZC1vZmYtYnk6IE1hcmVrIE1hcmN6eWtvd3Nr
aS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KLS0tCiB4ZW4vZHJp
dmVycy92aWRlby92ZXNhLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy92aWRlby92ZXNhLmMgYi94
ZW4vZHJpdmVycy92aWRlby92ZXNhLmMKaW5kZXggZjIyY2Y3Zi4uMzc2NzAyNCAxMDA2NDQKLS0t
IGEveGVuL2RyaXZlcnMvdmlkZW8vdmVzYS5jCisrKyBiL3hlbi9kcml2ZXJzL3ZpZGVvL3Zlc2Eu
YwpAQCAtNDQsNyArNDQsNyBAQCB2b2lkIF9faW5pdCB2ZXNhX2Vhcmx5X2luaXQodm9pZCkKIHsK
ICAgICB1bnNpZ25lZCBpbnQgdnJhbV92bW9kZTsKIAotICAgIHZnYV9jb21wYXQgPSAhKHZnYV9j
b25zb2xlX2luZm8udS52ZXNhX2xmYi5nYmxfY2FwcyAmIDIpOworICAgIHZnYV9jb21wYXQgPSAh
KHZsZmJfaW5mby5nYmxfY2FwcyAmIDIpOwogCiAgICAgaWYgKCAodmxmYl9pbmZvLmJpdHNfcGVy
X3BpeGVsIDwgOCkgfHwgKHZsZmJfaW5mby5iaXRzX3Blcl9waXhlbCA+IDMyKSApCiAgICAgICAg
IHJldHVybjsKLS0gCmdpdC1zZXJpZXMgMC45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
