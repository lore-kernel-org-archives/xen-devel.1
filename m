From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH RFC 3/6] kexec: export PG_offline to
 VMCOREINFO
Date: Thu, 15 Nov 2018 13:11:02 +0100
Message-ID: <20181115121102.GP23831__24870.4707868912$1542283793$gmane$org@dhcp22.suse.cz>
References: <20181114211704.6381-1-david@redhat.com>
 <20181114211704.6381-4-david@redhat.com>
 <20181115061923.GA3971@dhcp-128-65.nay.redhat.com>
 <20181115111023.GC26448@zn.tnic>
 <4aa5d39d-a923-87de-d646-70b9cbfe62f0@redhat.com>
 <20181115115213.GE26448@zn.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q/3E=N2=kernel.org=mhocko@srs-us1.protection.inumbo.net>)
 id 1gNGUF-0004wJ-NQ
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 12:11:07 +0000
Content-Disposition: inline
In-Reply-To: <20181115115213.GE26448@zn.tnic>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Baoquan He <bhe@redhat.com>, linux-doc@vger.kernel.org, linux-pm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, devel@linuxdriverproject.org, Andrew Morton <akpm@linux-foundation.org>, Dave Young <dyoung@redhat.com>, Omar Sandoval <osandov@fb.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Lianbo Jiang <lijiang@redhat.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1IDE1LTExLTE4IDEyOjUyOjEzLCBCb3Jpc2xhdiBQZXRrb3Ygd3JvdGU6Cj4gT24gVGh1
LCBOb3YgMTUsIDIwMTggYXQgMTI6MjA6NDBQTSArMDEwMCwgRGF2aWQgSGlsZGVuYnJhbmQgd3Jv
dGU6Cj4gPiBTb3JyeSB0byBzYXksIGJ1dCB0aGF0IGlzIHRoZSBjdXJyZW50IHByYWN0aWNlIHdp
dGhvdXQgd2hpY2gKPiA+IG1ha2VkdW1wZmlsZSB3b3VsZCBub3QgYmUgYWJsZSB0byB3b3JrIGF0
IGFsbC4gKGV4Y2x1ZGUgdXNlciBwYWdlcywKPiA+IGV4Y2x1ZGUgcGFnZSBjYWNoZSwgZXhjbHVk
ZSBidWRkeSBwYWdlcykuIExldCdzIG5vdCByZWludmVudCB0aGUgd2hlZWwKPiA+IGhlcmUuIFRo
aXMgaXMgaG93IGR1bXBpbmcgd29ya3MgZm9yZXZlci4KPiAKPiBTb3JyeSwgYnV0ICJ3ZSd2ZSBh
bHdheXMgZG9uZSB0aGlzIGluIHRoZSBwYXN0IiBkb2Vzbid0IG1ha2UgaXQgYmV0dGVyLgo+IAo+
ID4gSSBkb24ndCBzZWUgaG93IHRoZXJlIHNob3VsZCBiZSAic2V0IG9mIHBhZ2VzIHdoaWNoIGRv
IG5vdCBoYXZlCj4gPiBQR19vZmZsaW5lIi4KPiAKPiBJdCBkb2Vzbid0IGhhdmUgdG8gYmUgYSBz
ZXQgb2YgcGFnZXMuIFRoaW5rIGEgKG1tY29uZmlnIHBlcmhhcHMpIHJlZ2lvbgo+IHdoaWNoIHRo
ZSBrZHVtcCBrZXJuZWwgc2hvdWxkIGNvbXBsZXRlbHkgc2tpcCBiZWNhdXNlIHBva2luZyBpbiBp
dCBpbgo+IHRoZSBrZHVtcCBrZXJuZWwsIGNhdXNlcyBhbGwga2luZHMgb2YgaGF2b2MgbGlrZSBt
YWNoaW5lIGNoZWNrcy4gZXRjLgo+IFdlJ3ZlIGhhZCBhbmQgc3RpbGwgaGF2ZSBvbmUgaXNzdWUg
bGlrZSB0aGF0Lgo+IAo+IEJ1dCBsZXQgbWUgY2xhcmlmeSBteSBub3RlOiBJIGRvbid0IHdhbnQg
dG8gYmUgZGlzY3Vzc2luZyB3aXRoIHlvdSB0aGUKPiBkZXNpZ24gb2YgbWFrZWR1bXBmaWxlIGFu
ZCBob3cgaXQgc2hvdWxkIG9yIHNob3VsZCBub3Qgd29yayAtIHRoYXQgc2hpcAo+IGhhcyBhbHJl
YWR5IHNhaWxlZC4gQXBwYXJlbnRseSB0aGVyZSBhcmUgdmFsaWQgcmVhc29ucyB0byBkbyBpdCB0
aGlzCj4gd2F5Lgo+IAo+IEkgd2FzICpzaW1wbHkqIHN0YXRpbmcgdGhhdCBpdCBmZWVscyB3cm9u
ZyB0byBleHBvcnQgbW0gZmxhZ3MgbGlrZSB0aGF0Lgo+IAo+IEJ1dCBhcyBJIHNhaWQgYWxyZWFk
eSwgdGhhdCBpcyBtbSBndXlzJyBjYWxsIGFuZCBsb29raW5nIGF0IGhvdyB3ZSdyZQo+IGFscmVh
ZHkgZXhwb3J0aW5nIGEgYnVuY2ggb2Ygc3R1ZmYgaW4gdGhlIHZtY29yZWluZm8gLSBpbmNsdWRp
bmcgb3RoZXIKPiBtbSBmbGFncyAtIEkgZ3Vlc3Mgb25lIG1vcmUgZmxhZyBkb2Vzbid0IG1hdHRl
ciBhbnltb3JlLgoKSSBhbSBub3QgZmFtaWxpYXIgd2l0aCBrZXhlYyB0byBqdWRnZSB0aGlzIHBh
cnRpY3VsYXIgcGF0Y2ggYnV0IHdlCmNhbm5vdCBzaW1wbHkgZGVmaW5lIGFueSByYW5nZSBmb3Ig
dGhlc2UgcGFnZXMgKHNhbWUgYXMgZm9yIGh3cG9pc29uCm9uZXMpIGJlY2F1c2UgdGhleSBjYW4g
YmUgYWxtb3N0IGFueXdoZXJlIGluIHRoZSBhdmFpbGFibGUgbWVtb3J5IHJhbmdlLgpUaGVuIHRo
ZXJlIGNhbiBiZSBjb3VudGxlc3Mgb2YgdGhlbS4gVGhlcmUgaXMgbm8gb3RoZXIgd2F5IHRvIHJ1
bGUgdGhlbQpvdXQgYnV0IHRvIGNoZWNrIHRoZSBwYWdlIHN0YXRlLgoKSSBhbSBub3QgcmVhbGx5
IHN1cmUgd2hhdCBpcyB0aGUgY29uY2VybiBoZXJlIGV4YWN0bHkuIEtkdW1wIGlzIHNvCmNsb3Ns
eSB0aWdodCB0byB0aGUgc3BlY2lmaWMga2VybmVsIHZlcnNpb24gdGhhdCB0aGUgYXBpIGV4cG9y
dGVkCnNwZWNpZmljYWxseSBmb3IgaXRzIHB1cnBvc2UgY2Fubm90IGJlIHNlcmlvdXNseSBjb25z
aWRlcmVkIGFuIEFCSS4KS2R1bXAgaGFzIHRvIGFkb3B0IGFsbCB0aGUgdGltZS4KLS0gCk1pY2hh
bCBIb2NrbwpTVVNFIExhYnMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
