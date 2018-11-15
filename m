From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH RFC 3/6] kexec: export PG_offline to
 VMCOREINFO
Date: Thu, 15 Nov 2018 12:52:13 +0100
Message-ID: <20181115115213.GE26448__27199.028680525$1542282667$gmane$org@zn.tnic>
References: <20181114211704.6381-1-david@redhat.com>
 <20181114211704.6381-4-david@redhat.com>
 <20181115061923.GA3971@dhcp-128-65.nay.redhat.com>
 <20181115111023.GC26448@zn.tnic>
 <4aa5d39d-a923-87de-d646-70b9cbfe62f0@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=gyhb=n2=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1gNGC6-0002va-Ck
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 11:52:22 +0000
Content-Disposition: inline
In-Reply-To: <4aa5d39d-a923-87de-d646-70b9cbfe62f0@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>
Cc: Michal Hocko <mhocko@suse.com>, Arnd Bergmann <arnd@arndb.de>, Baoquan He <bhe@redhat.com>, linux-doc@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, devel@linuxdriverproject.org, Andrew Morton <akpm@linux-foundation.org>, Dave Young <dyoung@redhat.com>, Omar Sandoval <osandov@fb.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Lianbo Jiang <lijiang@redhat.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMTUsIDIwMTggYXQgMTI6MjA6NDBQTSArMDEwMCwgRGF2aWQgSGlsZGVuYnJh
bmQgd3JvdGU6Cj4gU29ycnkgdG8gc2F5LCBidXQgdGhhdCBpcyB0aGUgY3VycmVudCBwcmFjdGlj
ZSB3aXRob3V0IHdoaWNoCj4gbWFrZWR1bXBmaWxlIHdvdWxkIG5vdCBiZSBhYmxlIHRvIHdvcmsg
YXQgYWxsLiAoZXhjbHVkZSB1c2VyIHBhZ2VzLAo+IGV4Y2x1ZGUgcGFnZSBjYWNoZSwgZXhjbHVk
ZSBidWRkeSBwYWdlcykuIExldCdzIG5vdCByZWludmVudCB0aGUgd2hlZWwKPiBoZXJlLiBUaGlz
IGlzIGhvdyBkdW1waW5nIHdvcmtzIGZvcmV2ZXIuCgpTb3JyeSwgYnV0ICJ3ZSd2ZSBhbHdheXMg
ZG9uZSB0aGlzIGluIHRoZSBwYXN0IiBkb2Vzbid0IG1ha2UgaXQgYmV0dGVyLgoKPiBJIGRvbid0
IHNlZSBob3cgdGhlcmUgc2hvdWxkIGJlICJzZXQgb2YgcGFnZXMgd2hpY2ggZG8gbm90IGhhdmUK
PiBQR19vZmZsaW5lIi4KCkl0IGRvZXNuJ3QgaGF2ZSB0byBiZSBhIHNldCBvZiBwYWdlcy4gVGhp
bmsgYSAobW1jb25maWcgcGVyaGFwcykgcmVnaW9uCndoaWNoIHRoZSBrZHVtcCBrZXJuZWwgc2hv
dWxkIGNvbXBsZXRlbHkgc2tpcCBiZWNhdXNlIHBva2luZyBpbiBpdCBpbgp0aGUga2R1bXAga2Vy
bmVsLCBjYXVzZXMgYWxsIGtpbmRzIG9mIGhhdm9jIGxpa2UgbWFjaGluZSBjaGVja3MuIGV0Yy4K
V2UndmUgaGFkIGFuZCBzdGlsbCBoYXZlIG9uZSBpc3N1ZSBsaWtlIHRoYXQuCgpCdXQgbGV0IG1l
IGNsYXJpZnkgbXkgbm90ZTogSSBkb24ndCB3YW50IHRvIGJlIGRpc2N1c3Npbmcgd2l0aCB5b3Ug
dGhlCmRlc2lnbiBvZiBtYWtlZHVtcGZpbGUgYW5kIGhvdyBpdCBzaG91bGQgb3Igc2hvdWxkIG5v
dCB3b3JrIC0gdGhhdCBzaGlwCmhhcyBhbHJlYWR5IHNhaWxlZC4gQXBwYXJlbnRseSB0aGVyZSBh
cmUgdmFsaWQgcmVhc29ucyB0byBkbyBpdCB0aGlzCndheS4KCkkgd2FzICpzaW1wbHkqIHN0YXRp
bmcgdGhhdCBpdCBmZWVscyB3cm9uZyB0byBleHBvcnQgbW0gZmxhZ3MgbGlrZSB0aGF0LgoKQnV0
IGFzIEkgc2FpZCBhbHJlYWR5LCB0aGF0IGlzIG1tIGd1eXMnIGNhbGwgYW5kIGxvb2tpbmcgYXQg
aG93IHdlJ3JlCmFscmVhZHkgZXhwb3J0aW5nIGEgYnVuY2ggb2Ygc3R1ZmYgaW4gdGhlIHZtY29y
ZWluZm8gLSBpbmNsdWRpbmcgb3RoZXIKbW0gZmxhZ3MgLSBJIGd1ZXNzIG9uZSBtb3JlIGZsYWcg
ZG9lc24ndCBtYXR0ZXIgYW55bW9yZS4KCi0tIApSZWdhcmRzL0dydXNzLAogICAgQm9yaXMuCgpH
b29kIG1haWxpbmcgcHJhY3RpY2VzIGZvciA0MDA6IGF2b2lkIHRvcC1wb3N0aW5nIGFuZCB0cmlt
IHRoZSByZXBseS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
