From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC 2/6] mm: convert PG_balloon to PG_offline
Date: Wed, 14 Nov 2018 23:49:15 +0100
Message-ID: <b4668081-5aa3-d7f5-6880-d01c75cfc6ae__42141.2684875124$1542235686$gmane$org@redhat.com>
References: <20181114211704.6381-1-david@redhat.com>
 <20181114211704.6381-3-david@redhat.com>
 <20181114222321.GB1784@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zCq3=NZ=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1gN3yQ-0003TE-Eg
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 22:49:26 +0000
In-Reply-To: <20181114222321.GB1784@bombadil.infradead.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Michal Hocko <mhocko@suse.com>, linux-doc@vger.kernel.org, linux-mm@kvack.org, Alexander Duyck <alexander.h.duyck@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Jonathan Corbet <corbet@lwn.net>, "Michael S. Tsirkin" <mst@redhat.com>, Pavel Tatashin <pasha.tatashin@oracle.com>, David Rientjes <rientjes@google.com>, xen-devel@lists.xenproject.org, Alexey Dobriyan <adobriyan@gmail.com>, linux-pm@vger.kernel.org, Mike Rapoport <rppt@linux.vnet.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, Christian Hansen <chansen3@cisco.com>, linux-kernel@vger.kernel.org, Miles Chen <miles.chen@mediatek.com>, linux-fsdevel@vger.kernel.org, devel@linuxdriverproject.org, Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTQuMTEuMTggMjM6MjMsIE1hdHRoZXcgV2lsY294IHdyb3RlOgo+IE9uIFdlZCwgTm92IDE0
LCAyMDE4IGF0IDEwOjE3OjAwUE0gKzAxMDAsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+PiBS
ZW5hbWUgUEdfYmFsbG9vbiB0byBQR19vZmZsaW5lLiBUaGlzIGlzIGFuIGluZGljYXRvciB0aGF0
IHRoZSBwYWdlIGlzCj4+IGxvZ2ljYWxseSBvZmZsaW5lLCB0aGUgY29udGVudCBzdGFsZSBhbmQg
dGhhdCBpdCBzaG91bGQgbm90IGJlIHRvdWNoZWQKPj4gKGUuZy4gYSBoeXBlcnZpc29yIHdvdWxk
IGhhdmUgdG8gYWxsb2NhdGUgYmFja2luZyBzdG9yYWdlIGluIG9yZGVyIGZvciB0aGUKPj4gZ3Vl
c3QgdG8gZHVtcCBhbiB1bnVzZWQgcGFnZSkuICBXZSBjYW4gdGhlbiBlLmcuIGV4Y2x1ZGUgc3Vj
aCBwYWdlcyBmcm9tCj4+IGR1bXBzLgo+Pgo+PiBJbiBmb2xsb3dpbmcgcGF0Y2hlcywgd2Ugd2ls
bCBtYWtlIHVzZSBvZiB0aGlzIGJpdCBhbHNvIGluIG90aGVyIGJhbGxvb24KPj4gZHJpdmVycy4g
IFdoaWxlIGF0IGl0LCBkb2N1bWVudCBQR1RBQkxFLgo+IAo+IFRoYW5rIHlvdSBmb3IgZG9jdW1l
bnRpbmcgUEdUQUJMRS4gIEkgZGlkbid0IHJlYWxpc2UgSSBhbHNvIGhhZCB0aGlzCj4gZG9jdW1l
bnQgdG8gdXBkYXRlIHdoZW4gSSBhZGRlZCBQR1RBQkxFLgoKVGhhbmsgeW91IGZvciBsb29raW5n
IGludG8gdGhpcyA6KQoKPiAKPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9tbS9w
YWdlbWFwLnJzdAo+PiBAQCAtNzgsNiArNzgsOCBAQCBudW1iZXIgb2YgdGltZXMgYSBwYWdlIGlz
IG1hcHBlZC4KPj4gICAgICAyMy4gQkFMTE9PTgo+PiAgICAgIDI0LiBaRVJPX1BBR0UKPj4gICAg
ICAyNS4gSURMRQo+PiArICAgIDI2LiBQR1RBQkxFCj4+ICsgICAgMjcuIE9GRkxJTkUKPiAKPiBT
byB0aGUgb2ZmbGluZSAqdXNlciogYml0IGlzIG5ldyAuLi4gZXZlbiB0aG91Z2ggdGhlICprZXJu
ZWwqIGJpdAo+IGp1c3QgcmVuYW1lcyB0aGUgYmFsbG9vbiBiaXQuICBJJ20gbm90IHN1cmUgaG93
IEkgZmVlbCBhYm91dCB0aGlzLgo+IEknbSBnb2luZyB0byB0aGluayBhYm91dCBpdCBzb21lIG1v
cmUuICBDb3VsZCB5b3Ugc2hhcmUgeW91ciBkZWNpc2lvbgo+IHByb2Nlc3Mgd2l0aCB1cz8KCkJB
TExPT04gd2FzL2lzIGRvY3VtZW50ZWQgYXMKCiIyMyAtIEJBTExPT04KICAgIGJhbGxvb24gY29t
cGFjdGlvbiBwYWdlCiIKCmFuZCBvbmx5IGluY2x1ZGVzIGFsbCB2aXJ0aW8tYmFsbG9uIHBhZ2Vz
IGFmdGVyIHRoZSBub24tbHJ1IG1pZ3JhdGlvbgpmZWF0dXJlIGhhcyBiZWVuIGltcGxlbWVudGVk
IGZvciBiYWxsb29uZWQgcGFnZXMuIFNpbmNlIHRoZW4sIHRoaXMgZmxhZwpkb2VzIGJhc2ljYWxs
eSBubyBsb25nZXIgc3RhbmRzIGZvciB3aGF0IGl0IGFjdHVhbGx5IHdhcyBzdXBwb3NlZCB0byBk
by4KClRvIG5vdCBicmVhayB1YXBpIEkgZGVjaWRlZCB0byBub3QgcmVuYW1lIGl0IGJ1dCBpbnN0
ZWFkIHRvIGFkZCBhIG5ldyBmbGFnLgoKPiAKPiBJIGhhdmUgbm8gb2JqZWN0aW9uIHRvIHJlbmFt
aW5nIHRoZSBiYWxsb29uIGJpdCBpbnNpZGUgdGhlIGtlcm5lbDsgSQo+IHRoaW5rIHRoYXQncyBh
IHdpc2UgaWRlYS4gIEknbSBqdXN0IG5vdCBzdXJlIHdoZXRoZXIgd2Ugc2hvdWxkIHJlbmFtZQo+
IHRoZSB1c2VyIGJhbGxvb24gYml0IHJhdGhlciB0aGFuIGFkZGluZyBhIG5ldyBiaXQuCj4gCgpD
YW4gd2UgcmVuYW1lIHdpdGhvdXQgYnJlYWtpbmcgdWFwaT8KCi0tIAoKVGhhbmtzLAoKRGF2aWQg
LyBkaGlsZGVuYgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
