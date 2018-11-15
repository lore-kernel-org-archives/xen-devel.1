From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC 3/6] kexec: export PG_offline to
 VMCOREINFO
Date: Thu, 15 Nov 2018 10:23:13 +0100
Message-ID: <685892a9-3a56-8e8c-dbe7-8b1159067a6b__15284.9965765656$1542273726$gmane$org@redhat.com>
References: <20181114211704.6381-1-david@redhat.com>
 <20181114211704.6381-4-david@redhat.com>
 <20181115061923.GA3971@dhcp-128-65.nay.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=kcc+=n2=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1gNDs0-0004Lh-Hk
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 09:23:28 +0000
In-Reply-To: <20181115061923.GA3971@dhcp-128-65.nay.redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dave Young <dyoung@redhat.com>
Cc: Michal Hocko <mhocko@suse.com>, Arnd Bergmann <arnd@arndb.de>, Baoquan He <bhe@redhat.com>, linux-pm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, Borislav Petkov <bp@alien8.de>, xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, devel@linuxdriverproject.org, Andrew Morton <akpm@linux-foundation.org>, Omar Sandoval <osandov@fb.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Lianbo Jiang <lijiang@redhat.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUuMTEuMTggMDc6MTksIERhdmUgWW91bmcgd3JvdGU6Cj4gSGkgRGF2aWQsCj4gCj4gT24g
MTEvMTQvMTggYXQgMTA6MTdwbSwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+IExldCdzIGV4
cG9ydCBQR19vZmZsaW5lIHZpYSBQQUdFX09GRkxJTkVfTUFQQ09VTlRfVkFMVUUsIHNvCj4+IG1h
a2VkdW1wZmlsZSBjYW4gZGlyZWN0bHkgc2tpcCBwYWdlcyB0aGF0IGFyZSBsb2dpY2FsbHkgb2Zm
bGluZSBhbmQgdGhlCj4+IGNvbnRlbnQgdGhlcmVmb3JlIHN0YWxlLgo+IAo+IEl0IHdvdWxkIGJl
IGdvb2QgdG8gY29weSBzb21lIGJhY2tncm91bmQgaW5mbyBmcm9tIGNvdmVyIGxldHRlciB0byB0
aGUKPiBwYXRjaCBkZXNjcmlwdGlvbiBzbyB0aGF0IHdlIGNhbiBnZXQgYmV0dGVyIHVuZGVyc3Rh
bmRpbmcgd2h5IHRoaXMgaXMKPiBuZWVkZWQgbm93LgoKWWVzLCB3aWxsIGFkZCBtb3JlIGRldGFp
bCEKCj4gCj4gQlRXLCBMaWFuYm8gaXMgd29ya2luZyBvbiBhIGRvY3VtZW50YXRpb24gb2YgdGhl
IHZtY29yZWluZm8gZXhwb3J0ZWQKPiBmaWVsZHMuIENjaW5nIGhpbSBzbyB0aGF0IGhlIGlzIGF3
YXJlIG9mIHRoaXMuCj4gCj4gQWxzbyBjYyBCb3JpcywgIGFsdGhvdWdoIEkgZG8gbm90IHdhbnQg
dGhlIGRvYyBjaGFuZ2VzIGJsb2NrcyB0aGlzCj4gaGUgbWlnaHQgaGF2ZSBkaWZmZXJlbnQgb3Bp
bmlvbiA6KQoKSSdsbCBiZSBoYXBweSB0byBoZWxwIHVwZGF0aW5nIGRvY3VtZW50YXRpb24gKG9y
IHVwZGF0aW5nIGl0IG15c2VsZiBpZgp0aGUgZG9jIHVwZGF0ZXMgZ28gaW4gZmlyc3QpLgoKLS0g
CgpUaGFua3MsCgpEYXZpZCAvIGRoaWxkZW5iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
