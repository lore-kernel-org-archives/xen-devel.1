From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: [PATCH 1/5] xen/bitmap: fix bitmap_fill with zero-sized
 bitmap
Date: Mon,  6 May 2019 16:50:17 +0200
Message-ID: <e54979f9ce16c254c78e4a48e3e5c0eb223f6dac.1557154206.git-series.marmarek@invisiblethingslab.com>
References: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SrHI=TG=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hNf9Z-0004Lm-7r
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

V2hlbiBiaXRtYXBfZmlsbCguLi4sIDApIGlzIGNhbGxlZCwgZG8gbm90IHRyeSB0byB3cml0ZSBh
bnl0aGluZy4gQmVmb3JlCnRoaXMgcGF0Y2gsIGl0IHRyaWVkIHRvIHdyaXRlIGFsbW9zdCBMT05H
X01BWCwgc3VyZWx5IG92ZXJ3cml0aW5nCnNvbWV0aGluZy4KClNpZ25lZC1vZmYtYnk6IE1hcmVr
IE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4K
LS0tCkZvdW5kIHdoaWxlIGRlYnVnZ2luZyBmcmFtZWJ1ZmZlciBsb2NhdGVkIGFib3ZlIDRHQi4g
SW4gdGhhdCBjYXNlIDMyYml0CnZhcmlhYmxlIGZvciBpdCBvdmVyZmxvd3MgYW5kIGZyYW1lYnVm
ZmVyIGluaXRpYWxpemF0aW9uIHplcm9lZAp1bnJlbGF0ZWQgbWVtb3J5LiBTcGVjaWZpY2FsbHks
IGl0IGhpdCBtYmktPm1vZHNfY291bnQsIHNvIGxhdGVyIG9uCmJpdG1hcF9maWxsKG1vZHVsZV9t
YXAsIG1iaS0+bW9kc19jb3VudCkgaW4gX19zdGFydF94ZW4oKSBjcmFzaGVkLgotLS0KIHhlbi9p
bmNsdWRlL3hlbi9iaXRtYXAuaCB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vYml0bWFwLmggYi94ZW4vaW5jbHVkZS94
ZW4vYml0bWFwLmgKaW5kZXggZmUzYzcyMC4uMDQzMGMxYyAxMDA2NDQKLS0tIGEveGVuL2luY2x1
ZGUveGVuL2JpdG1hcC5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9iaXRtYXAuaApAQCAtMTI2LDYg
KzEyNiw4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBiaXRtYXBfZmlsbCh1bnNpZ25lZCBsb25nICpk
c3QsIGludCBuYml0cykKIAlzaXplX3QgbmxvbmdzID0gQklUU19UT19MT05HUyhuYml0cyk7CiAK
IAlzd2l0Y2ggKG5sb25ncykgeworCWNhc2UgMDoKKwkJYnJlYWs7CiAJZGVmYXVsdDoKIAkJbWVt
c2V0KGRzdCwgLTEsIChubG9uZ3MgLSAxKSAqIHNpemVvZih1bnNpZ25lZCBsb25nKSk7CiAJCS8q
IGZhbGwgdGhyb3VnaCAqLwotLSAKZ2l0LXNlcmllcyAwLjkuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
