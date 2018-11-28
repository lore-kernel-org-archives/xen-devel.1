From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 02/18] xen: introduce new 'XenBus' and
 'XenDevice' object hierarchy
Date: Wed, 28 Nov 2018 17:10:01 +0000
Message-ID: <20181128171001.GC14786@perard.uk.xensource.com>
References: <20181121151211.15997-1-paul.durrant@citrix.com>
 <20181121151211.15997-3-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9c/F=OH=citrix.com=prvs=8631c8a8c=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gS3Lj-0004ff-9y
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 17:10:07 +0000
Content-Disposition: inline
In-Reply-To: <20181121151211.15997-3-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBOb3YgMjEsIDIwMTggYXQgMDM6MTE6NTVQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IGRpZmYgLS1naXQgYS9ody94ZW4veGVuLWJ1cy5jIGIvaHcveGVuL3hlbi1idXMuYwo+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uZGVkZTJkOTE0YQo+IC0t
LSAvZGV2L251bGwKPiArKysgYi9ody94ZW4veGVuLWJ1cy5jCj4gQEAgLTAsMCArMSwxMjUgQEAK
PiArLyoKPiArICogQ29weXJpZ2h0IChjKSBDaXRyaXggU3lzdGVtcyBJbmMuCj4gKyAqIEFsbCBy
aWdodHMgcmVzZXJ2ZWQuCgpZb3UgcHJvYmFibHkgc2hvdWxkIGluY2x1ZGU6CiAgVGhpcyB3b3Jr
IGlzIGxpY2Vuc2VkIHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdQTCwgdmVyc2lvbiAyIG9y
IGxhdGVyLgogIFNlZSB0aGUgQ09QWUlORyBmaWxlIGluIHRoZSB0b3AtbGV2ZWwgZGlyZWN0b3J5
LgoKQXMgdGhpcyBzZWVtcyB0byBiZSBhIGJvaWxlcnBsYXRlIHVzZWQgaW4gcmVjZW50IG5ldyBm
aWxlcywgdGhlcmUgYXJlCm90aGVyIHNpbWlsYWlyIGJvaWxlcnBsYXRlcy4KCkFsc28sIEkgdGhp
bmsgdGhlIGNvcHlyaWdodCBsaW5lIHNob3VsZCBpbmNsdWRlIGEgeWVhci4KCj4gK3ZvaWQgeGVu
X2J1c19pbml0KHZvaWQpCj4gK3sKPiArICAgIERldmljZVN0YXRlICpkZXYgPSBxZGV2X2NyZWF0
ZShOVUxMLCBUWVBFX1hFTl9CUklER0UpOwo+ICsKPiArICAgIHFidXNfY3JlYXRlKFRZUEVfWEVO
X0JVUywgZGV2LCBOVUxMKTsKPiArICAgIHFkZXZfaW5pdF9ub2ZhaWwoZGV2KTsKCldpbGwgd2Ug
bmVlZCBhIGhvdHBsdWcgaGFuZGxlciBmb3IgdGhpcyBidXMsIGxpa2UgaXQgaXMgZG9uZSB3aXRo
ClRZUEVfWEVOU1lTQlVTPwoKClRoZSByZXN0IGxvb2tzIGdvb2QsClRoYW5rcywKCi0tIApBbnRo
b255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
