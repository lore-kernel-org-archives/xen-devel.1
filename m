From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 1/2] makefile: add support for
 *_defconfig targets
Date: Wed, 15 May 2019 19:07:57 +0000
Message-ID: <87bm038rjn.fsf@epam.com>
References: <20190514184552.25100-1-volodymyr_babchuk@epam.com>
 <5CDBBEB5020000780022F176@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UN9r=TP=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hQzG1-0006Rw-43
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 19:08:05 +0000
In-Reply-To: <5CDBBEB5020000780022F176@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <Andrii_Anisov@epam.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
List-Id: xen-devel@lists.xenproject.org

CkhlbGxvIEphbiwKCkphbiBCZXVsaWNoIHdyaXRlczoKCj4+Pj4gT24gMTQuMDUuMTkgYXQgMjA6
NDUsIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4gd3JvdGU6Cj4+IC0tLSBhL3hlbi9NYWtl
ZmlsZQo+PiArKysgYi94ZW4vTWFrZWZpbGUKPj4gQEAgLTI2OSw2ICsyNjksOSBAQCBrY29uZmln
IDo9IHNpbGVudG9sZGNvbmZpZyBvbGRjb25maWcgY29uZmlnIG1lbnVjb25maWcgZGVmY29uZmln
IFwKPj4gICQoa2NvbmZpZyk6Cj4+ICAJJChNQUtFKSAtZiAkKEJBU0VESVIpL3Rvb2xzL2tjb25m
aWcvTWFrZWZpbGUua2NvbmZpZyBBUkNIPSQoQVJDSCkgU1JDQVJDSD0kKFNSQ0FSQ0gpIEhPU1RD
Qz0iJChIT1NUQ0MpIiBIT1NUQ1hYPSIkKEhPU1RDWFgpIiAkQAo+Cj4gU28gdGhlIHJ1bGUgeW91
IGFkZCBtYXRjaGVzIHRoaXMgb25lLiBJcyB0aGVyZSBhIHJlYXNvbiAuLi4KPgo+PiArJV9kZWZj
b25maWc6Cj4KPiAuLi4gd2h5IHlvdSBjYW4ndCBzaW1wbHkgYWRkIHRoaXMgdG8gdGhlIGtjb25m
aWcgdmFyaWFibGUgc2V0IGEgZmV3Cj4gbGluZXMgdXA/IE9oIC0gbmV3ZXIgbWFrZSBkb2Vzbid0
IGxpa2UgbWl4aW5nIHBhdHRlcm4gYW5kCj4gbm9uLXBhdHRlcm4gcnVsZXMuClllcywgbXkgZmly
c3QgaW50ZW50aW9uIHdhcyB0byBhZGQgdGhpcyBydWxlIHRvIHRoZSBrY29uZmlnIHZhcmlhYmxl
LgpTYWRseSBtYWtlIGRvZXMgbm90IGFsbG93cyB0aGlzCgo+IFBlcmhhcHMgd29ydGggYSBicmll
ZiBjb21tZW50LCB0byBqdXN0aWZ5IHRoZQo+IHJlZHVuZGFuY3k/ClN1cmUsIHdpbGwgYWRkIGlu
IHRoZSBuZXh0IHZlcnNpb24uCgo+IE9yIGFsdGVybmF0aXZlbHksIGhvdyBhYm91dCB1c2luZyAk
KHdpbGRjYXJkICkKPiBpbnN0ZWFkIG9mIGEgcGF0dGVybiBydWxlLCB0aHVzIHJlamVjdGluZyBp
bnZhbGlkIHRhcmdldHMgcmlnaHQgYXdheSwKPiByYXRoZXIgdGhhbiBkZWZlcnJpbmcgdG8gdGhl
IHJlY3Vyc2l2ZSBtYWtlIHRvIG5vdGljZSB0aGUgZXJyb3I/CkkgY29uc2lkZXJlZCB0aGlzLCBi
dXQgSSBjYW4ndCBzZWUgaG93ICQod2lsZGNhcmQgKSBjYW4gYmUgdXNlZC4KQUZBSUssICQod2ls
ZGNhcmQgKSBleHBlY3RzIHRvIGZpbmQgYSBmaWxlLCBtYXRjaGluZyB0aGUgd2lsZGNhcmQuCkJ1
dCAlX2RlZmNvbmZpZyBpcyB0aGUgcGhvbnkgcnVsZSwgc28gSSBjYW4ndCBpbWFnaW5lIGhvdyB0
byB1c2UKJCh3aWxkY2FyZCApIGluIHRoaXMgY2FzZS4KCk9uIG90aGVyIGhhbmQsIGZvbGxvd2lu
ZyBydWxlIGNoZWNrcyB0aGUgcHJlc2VuY2Ugb2YgcmVxdWlyZWQgX2RlZmNvbmZpZyBmaWxlOgoK
JV9kZWZjb25maWc6IGFyY2gvJChTUkNBUkNIKS9jb25maWdzLyVfZGVmY29uZmlnCgpTbywgSSBj
YW4gZG8gaW4gdGhpcyB3YXkgaWYgeW91IHdpc2guCgpCVFcsIEknbGwgYWRkIC5QSE9OWTogJV9k
ZWZjb25maWcgaW4gdGhlIG5leHQgdmVyc2lvbi4KCi0tCkJlc3QgcmVnYXJkcywgVm9sb2R5bXly
IEJhYmNodWsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
