From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 03/15] xen/arm: Introduce helpers to
 clear/flags flags in HCR_EL2
Date: Tue, 14 Aug 2018 14:49:59 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1808141448330.15066@sstabellini-ThinkPad-X260>
References: <20180716172712.20294-1-julien.grall@arm.com>
 <20180716172712.20294-4-julien.grall@arm.com>
 <alpine.DEB.2.10.1808141345410.15066@sstabellini-ThinkPad-X260>
 <4c0f6e56-7d17-8e3d-3146-1c043d489eb8@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pgrk=k5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1fphCV-0003YF-2e
 for xen-devel@lists.xenproject.org; Tue, 14 Aug 2018 21:50:03 +0000
In-Reply-To: <4c0f6e56-7d17-8e3d-3146-1c043d489eb8@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien.grall@linaro.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAxNCBBdWcgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gMDgvMTQvMjAxOCAwOTo0NiBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4g
T24gTW9uLCAxNiBKdWwgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiBBIGNvdXBsZSBv
ZiBwbGFjZXMgaW4gdGhlIGNvZGUgd2lsbCBuZWVkIHRvIGNsZWFyL3NldCBmbGFncyBpbiBIQ1Jf
RUwyCj4gPiA+IGZvciBhIGdpdmVuIHZDUFUgYW5kIHRoZW4gcmVwbGljYXRlIGludG8gdGhlIGhh
cmR3YXJlLiBJbnRyb2R1Y2UKPiA+ID4gaGVscGVycyBhbmQgcmVwbGFjZSBvcGVuLWNvZGVkIHZl
cnNpb24uCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5n
cmFsbEBsaW5hcm8ub3JnPgo+ID4gCj4gPiBUaGUgbWFjcm9zIGxvb2sgZ29vZCwgYnV0IEkgZ3Jl
cHBlZCBmb3IgdGhlbSBpbiB5b3VyIHNlcmllcyBhbmQgdGhlcmUKPiA+IGFyZSBubyBtb3JlIGNh
bGxlcnMuIFdoYXQgcGxhY2VzIGFyZSB5b3UgcmVmZXJyaW5nIHRvIHRoYXQgdGhleSB3aWxsCj4g
PiBuZWVkIHRoZW0/Cj4gCj4gSSBzcGxpdCBzb21lIG9mIG15IHdvcmsgaW4gMiBwYXJ0IHRvIHJl
ZHVjZSB0aGUgc2l6ZSBvZiB0aGUgc2VyaWVzLiBUaGlzIHdpbGwKPiBiZSB1c2VkIGluIGFub3Ro
ZXIgc2VyaWVzIHdoZXJlIHVwZGF0aW5nIEhDUiBmb3IgdHJhcHBpbmcgVFRCUi9TQ1RMUiogd2ls
bCBiZQo+IGR5bmFtaWMuCj4gCj4gQWx0aG91Z2ggaW4gZ2VuZXJhbCwgdGhpcyBpcyBhbiBpbXBy
b3ZlbWVudCBjb21wYXJlIHRvIHRoZSBjdXJyZW50IGNvZGUgYXMgaXQKPiBtYWtlcyBjbGVhciB3
aGF0IG5lZWRzIHRvIGJlIHVwZGF0ZWQgd2hlbiBtb2RpZnlpbmcgSENSLgoKWWVzLCBpdCBpcywg
YnV0IG5vcm1hbGx5IEkgd291bGQgb25seSBpbnRyb2R1Y2UgdmNwdV9oY3Jfc2V0X2ZsYWdzIGlu
CnRoaXMgc2VyaWVzLCBiZWNhdXNlIHZjcHVfaGNyX2NsZWFyX2ZsYWdzIGlzIGxlZnQgY29tcGxl
dGVseSB1bnVzZWQ/CgpJIGFsc28gZG9uJ3QgbWluZCBpbnRyb2R1Y2luZyBpdCBhbnl3YXkgaWYg
eW91IGhhdmUgYSBzZXJpZXMgY29taW5nLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
