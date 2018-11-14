From: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH RFC 2/6] mm: convert PG_balloon to PG_offline
Date: Wed, 14 Nov 2018 14:23:21 -0800
Message-ID: <20181114222321.GB1784__46120.9056470127$1542234141$gmane$org@bombadil.infradead.org>
References: <20181114211704.6381-1-david@redhat.com>
 <20181114211704.6381-3-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hjuv=nz=infradead.org=willy@srs-us1.protection.inumbo.net>)
 id 1gN3ZH-0001HT-6V
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 22:23:27 +0000
Content-Disposition: inline
In-Reply-To: <20181114211704.6381-3-david@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>
Cc: Michal Hocko <mhocko@suse.com>, linux-doc@vger.kernel.org, linux-mm@kvack.org, Alexander Duyck <alexander.h.duyck@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Jonathan Corbet <corbet@lwn.net>, "Michael S. Tsirkin" <mst@redhat.com>, Pavel Tatashin <pasha.tatashin@oracle.com>, David Rientjes <rientjes@google.com>, xen-devel@lists.xenproject.org, Alexey Dobriyan <adobriyan@gmail.com>, linux-pm@vger.kernel.org, Mike Rapoport <rppt@linux.vnet.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, Christian Hansen <chansen3@cisco.com>, linux-kernel@vger.kernel.org, Miles Chen <miles.chen@mediatek.com>, linux-fsdevel@vger.kernel.org, devel@linuxdriverproject.org, Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBOb3YgMTQsIDIwMTggYXQgMTA6MTc6MDBQTSArMDEwMCwgRGF2aWQgSGlsZGVuYnJh
bmQgd3JvdGU6Cj4gUmVuYW1lIFBHX2JhbGxvb24gdG8gUEdfb2ZmbGluZS4gVGhpcyBpcyBhbiBp
bmRpY2F0b3IgdGhhdCB0aGUgcGFnZSBpcwo+IGxvZ2ljYWxseSBvZmZsaW5lLCB0aGUgY29udGVu
dCBzdGFsZSBhbmQgdGhhdCBpdCBzaG91bGQgbm90IGJlIHRvdWNoZWQKPiAoZS5nLiBhIGh5cGVy
dmlzb3Igd291bGQgaGF2ZSB0byBhbGxvY2F0ZSBiYWNraW5nIHN0b3JhZ2UgaW4gb3JkZXIgZm9y
IHRoZQo+IGd1ZXN0IHRvIGR1bXAgYW4gdW51c2VkIHBhZ2UpLiAgV2UgY2FuIHRoZW4gZS5nLiBl
eGNsdWRlIHN1Y2ggcGFnZXMgZnJvbQo+IGR1bXBzLgo+IAo+IEluIGZvbGxvd2luZyBwYXRjaGVz
LCB3ZSB3aWxsIG1ha2UgdXNlIG9mIHRoaXMgYml0IGFsc28gaW4gb3RoZXIgYmFsbG9vbgo+IGRy
aXZlcnMuICBXaGlsZSBhdCBpdCwgZG9jdW1lbnQgUEdUQUJMRS4KClRoYW5rIHlvdSBmb3IgZG9j
dW1lbnRpbmcgUEdUQUJMRS4gIEkgZGlkbid0IHJlYWxpc2UgSSBhbHNvIGhhZCB0aGlzCmRvY3Vt
ZW50IHRvIHVwZGF0ZSB3aGVuIEkgYWRkZWQgUEdUQUJMRS4KCj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9hZG1pbi1ndWlkZS9tbS9wYWdlbWFwLnJzdAo+IEBAIC03OCw2ICs3OCw4IEBAIG51bWJlciBv
ZiB0aW1lcyBhIHBhZ2UgaXMgbWFwcGVkLgo+ICAgICAgMjMuIEJBTExPT04KPiAgICAgIDI0LiBa
RVJPX1BBR0UKPiAgICAgIDI1LiBJRExFCj4gKyAgICAyNi4gUEdUQUJMRQo+ICsgICAgMjcuIE9G
RkxJTkUKClNvIHRoZSBvZmZsaW5lICp1c2VyKiBiaXQgaXMgbmV3IC4uLiBldmVuIHRob3VnaCB0
aGUgKmtlcm5lbCogYml0Cmp1c3QgcmVuYW1lcyB0aGUgYmFsbG9vbiBiaXQuICBJJ20gbm90IHN1
cmUgaG93IEkgZmVlbCBhYm91dCB0aGlzLgpJJ20gZ29pbmcgdG8gdGhpbmsgYWJvdXQgaXQgc29t
ZSBtb3JlLiAgQ291bGQgeW91IHNoYXJlIHlvdXIgZGVjaXNpb24KcHJvY2VzcyB3aXRoIHVzPwoK
SSBoYXZlIG5vIG9iamVjdGlvbiB0byByZW5hbWluZyB0aGUgYmFsbG9vbiBiaXQgaW5zaWRlIHRo
ZSBrZXJuZWw7IEkKdGhpbmsgdGhhdCdzIGEgd2lzZSBpZGVhLiAgSSdtIGp1c3Qgbm90IHN1cmUg
d2hldGhlciB3ZSBzaG91bGQgcmVuYW1lCnRoZSB1c2VyIGJhbGxvb24gYml0IHJhdGhlciB0aGFu
IGFkZGluZyBhIG5ldyBiaXQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
