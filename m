From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] xen/pt: Fix a xen passthrough failure
Date: Mon, 3 Dec 2018 14:12:58 +0000
Message-ID: <f056b5d1-02c2-2ee7-3e37-bc5e4869f0cb@citrix.com>
References: <20181203050438.6034-1-yan.y.zhao@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rGkI=OM=citrix.com=prvs=868a16509=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gTp0k-0001LP-1a
 for xen-devel@lists.xenproject.org; Mon, 03 Dec 2018 14:15:46 +0000
In-Reply-To: <20181203050438.6034-1-yan.y.zhao@intel.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Zhao Yan <yan.y.zhao@intel.com>, anthony.perard@citrix.com, sstabellini@kernel.org, roger.pau@citrix.com, JBeulich@suse.com, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMTIvMjAxOCAwNTowNCwgWmhhbyBZYW4gd3JvdGU6Cj4gRm9yIHNvbWUgcGNpIGRldmlj
ZSwgZXZlbiBpdHMgUENJX0lOVEVSUlVQVF9QSU4gaXMgbm90IDAsIGl0IGFjdHVhbGx5Cj4gZG9l
c24ndCBzdXBwb3J0IElOVHggbW9kZSwgc28gaXRzIG1hY2hpbmUgaXJxIHJlYWQgZnJvbSBob3N0
IHN5c2ZzIGlzIDAuCj4gSW4gdGhhdCBjYXNlLCByZXBvcnQgUENJX0lOVEVSUlVQVF9QSU4gYXMg
MCB0byBndWVzdCBhbmQgbGV0IHBhc3N0aHJvdWdoCj4gY29udGludWUuCgpXaGF0IGNhdXNlcyB0
aGlzIHByb2JsZW0/wqAgSXQgaXQgYSBub24tUENJIGNvbXBsaWFudCBkZXZpY2U/wqAgSXMgaXQg
YQpkZXZpY2Ugd2hpY2ggaGFzIGxlZ2FjeSBsaW5lcyBwcm9oaWJpdGVkPwoKfkFuZHJldwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
