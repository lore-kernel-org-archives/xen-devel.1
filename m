From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 7/8] xen/x86/efi: Verify dom0 kernel with
 SHIM_LOCK protocol in efi_multiboot2()
Date: Thu, 28 Jun 2018 07:48:06 -0600
Message-ID: <5B34E71602000078001CEE1D@prv1-mh.provo.novell.com>
References: <1529418946-30114-1-git-send-email-daniel.kiper@oracle.com>
 <1529418946-30114-8-git-send-email-daniel.kiper@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=8/s5=jo=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fYXHO-0006Ot-6P
 for xen-devel@lists.xenproject.org; Thu, 28 Jun 2018 13:48:10 +0000
In-Reply-To: <1529418946-30114-8-git-send-email-daniel.kiper@oracle.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Daniel Kiper <daniel.kiper@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas.k.lengyel@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjA2LjE4IGF0IDE2OjM1LCA8ZGFuaWVsLmtpcGVyQG9yYWNsZS5jb20+IHdyb3Rl
Ogo+IEBAIC00MzUsNiArNDM5LDE4IEBAIF9fZWZpNjRfbWIyX3N0YXJ0Ogo+ICAgICAgICAgIGNt
b3ZlICAgTUIyX2VmaTY0X2loKCVyY3gpLCVyZGkKPiAgICAgICAgICBqZSAgICAgIC5MZWZpX21i
Ml9uZXh0X3RhZwo+ICAKPiArICAgICAgICAvKgo+ICsgICAgICAgICAqIEdldCBkb20wIGtlcm5l
bCBtb2R1bGUgc3RydWN0IGFkZHJlc3MgZnJvbSBNdWx0aWJvb3QyCj4gKyAgICAgICAgICogaW5m
b3JtYXRpb24gYW5kIGlnbm9yZSB0aGUgcmVzdCBvZiBtb2R1bGVzLgo+ICsgICAgICAgICAqLwo+
ICsgICAgICAgIGNtcGwgICAgJE1VTFRJQk9PVDJfVEFHX1RZUEVfTU9EVUxFLE1CMl90YWdfdHlw
ZSglcmN4KQo+ICsgICAgICAgIGpuZSAgICAgLkxlZmlfbWIyX2VuZAo+ICsKPiArICAgICAgICB0
ZXN0ICAgICVyMTRkLCVyMTRkCj4gKyAgICAgICAgY21vdnogICAlZWN4LCVyMTRkCj4gKyAgICAg
ICAgam1wICAgICAuTGVmaV9tYjJfbmV4dF90YWcKPiArCj4gKy5MZWZpX21iMl9lbmQ6CgpFc3Bl
Y2lhbGx5IGhlcmUsIGJ1dCBwZXJoYXBzIGFsc28gYXBwbGljYWJsZSB0byBvdGhlciBodW5rczog
RGVzcGl0ZQpzdXJyb3VuZGluZyBjb2RlIGJlaW5nIGxpa2UgdGhpcywgY2FuIHdlIHBsZWFzZSBz
dG9wIHRoZSBiYWQgaGFiaXQgb2YKbm90IGhhdmluZyBibGFua3MgYWZ0ZXIgdGhlIGNvbW1hcyBp
biBpbnNuIG9wZXJhbmQgbGlzdHM/CgpBbHNvIHBlcnNvbmFsbHkgSSdkIHByZWZlciBpZiB5b3Ug
dXBwZXJjYXNlZCB0aGUgZCBpbiBEb20wIGV2ZXJ5d2hlcmUKLSB3ZSBjb21tb25seSB1c2Ugc29t
ZXRoaW5nIGxpa2UgZCVkIG9yIG90aGVyd2lzZSBEb20lZCAob3IgRG9tVSkuCgpXaXRoIHRoZXNl
IHB1cmVseSBtZWNoYW5pY2FsIHRoaW5ncyB0YWtlbiBjYXJlIG9mCkFja2VkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
