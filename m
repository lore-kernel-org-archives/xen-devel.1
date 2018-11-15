From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH RFC 3/6] kexec: export PG_offline to
 VMCOREINFO
Date: Thu, 15 Nov 2018 12:10:23 +0100
Message-ID: <20181115111023.GC26448__36930.9694775895$1542280180$gmane$org@zn.tnic>
References: <20181114211704.6381-1-david@redhat.com>
 <20181114211704.6381-4-david@redhat.com>
 <20181115061923.GA3971@dhcp-128-65.nay.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=gyhb=n2=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1gNFXj-0006lr-To
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 11:10:39 +0000
Content-Disposition: inline
In-Reply-To: <20181115061923.GA3971@dhcp-128-65.nay.redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dave Young <dyoung@redhat.com>
Cc: Michal Hocko <mhocko@suse.com>, Arnd Bergmann <arnd@arndb.de>, Baoquan He <bhe@redhat.com>, linux-doc@vger.kernel.org, linux-pm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, devel@linuxdriverproject.org, Andrew Morton <akpm@linux-foundation.org>, Omar Sandoval <osandov@fb.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Lianbo Jiang <lijiang@redhat.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMTUsIDIwMTggYXQgMDI6MTk6MjNQTSArMDgwMCwgRGF2ZSBZb3VuZyB3cm90
ZToKPiBJdCB3b3VsZCBiZSBnb29kIHRvIGNvcHkgc29tZSBiYWNrZ3JvdW5kIGluZm8gZnJvbSBj
b3ZlciBsZXR0ZXIgdG8gdGhlCj4gcGF0Y2ggZGVzY3JpcHRpb24gc28gdGhhdCB3ZSBjYW4gZ2V0
IGJldHRlciB1bmRlcnN0YW5kaW5nIHdoeSB0aGlzIGlzCj4gbmVlZGVkIG5vdy4KPiAKPiBCVFcs
IExpYW5ibyBpcyB3b3JraW5nIG9uIGEgZG9jdW1lbnRhdGlvbiBvZiB0aGUgdm1jb3JlaW5mbyBl
eHBvcnRlZAo+IGZpZWxkcy4gQ2NpbmcgaGltIHNvIHRoYXQgaGUgaXMgYXdhcmUgb2YgdGhpcy4K
PiAKPiBBbHNvIGNjIEJvcmlzLCAgYWx0aG91Z2ggSSBkbyBub3Qgd2FudCB0aGUgZG9jIGNoYW5n
ZXMgYmxvY2tzIHRoaXMKPiBoZSBtaWdodCBoYXZlIGRpZmZlcmVudCBvcGluaW9uIDopCgpZZWFo
LCBteSBpbml0aWFsIHJlYWN0aW9uIGlzIHRoYXQgZXhwb3J0aW5nIGFuIG1tLWludGVybmFsIGZs
YWcgdG8KdXNlcnNwYWNlIGlzIGEgbm8tbm8uCgpXaGF0IHdvdWxkIGJlIGJldHRlciwgSU1ITywg
aXMgaGF2aW5nIGEgZ2VuZXJhbCBtZXRob2Qgb2YgdGVsbGluZyB0aGUKa2R1bXAga2VybmVsIC0g
bWF5YmUgcmFuZ2VzIG9mIHBoeXNpY2FsIGFkZHJlc3NlcyAtIHdoaWNoIHRvIHNraXAuCgpCZWNh
dXNlIHRoZSBtb21lbnQgdGhlcmUncyBhIHNldCBvZiBwYWdlcyB3aGljaCBkbyBub3QgaGF2ZSBQ
R19vZmZsaW5lCnNldCBidXQga2R1bXAgd291bGQgc3RpbGwgbGlrZSB0byBza2lwLCB0aGlzIGJy
ZWFrcy4KCkJ1dCB0aGF0J3MgbW0gZ3V5cycgY2FsbC4KCi0tIApSZWdhcmRzL0dydXNzLAogICAg
Qm9yaXMuCgpHb29kIG1haWxpbmcgcHJhY3RpY2VzIGZvciA0MDA6IGF2b2lkIHRvcC1wb3N0aW5n
IGFuZCB0cmltIHRoZSByZXBseS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
