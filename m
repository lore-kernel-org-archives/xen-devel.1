From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 2/8] mm: convert PG_balloon to PG_offline
Date: Mon, 19 Nov 2018 17:06:12 +0100
Message-ID: <94387ebe-9fb3-9471-9fb3-b66abf899a3f__8744.14157956398$1542643518$gmane$org@redhat.com>
References: <20181119101616.8901-1-david@redhat.com>
 <20181119101616.8901-3-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Bx+7=N6=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1gOm4G-00048a-7p
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 16:06:32 +0000
In-Reply-To: <20181119101616.8901-3-david@redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-mm@kvack.org
Cc: Michal Hocko <mhocko@suse.com>, linux-doc@vger.kernel.org, pv-drivers@vmware.com, Alexander Duyck <alexander.h.duyck@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Jonathan Corbet <corbet@lwn.net>, "Michael S. Tsirkin" <mst@redhat.com>, Pavel Tatashin <pasha.tatashin@oracle.com>, Matthew Wilcox <willy@infradead.org>, Konstantin Khlebnikov <koct9i@gmail.com>, David Rientjes <rientjes@google.com>, xen-devel@lists.xenproject.org, Alexey Dobriyan <adobriyan@gmail.com>, linux-pm@vger.kernel.org, Mike Rapoport <rppt@linux.vnet.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, Kazuhito Hagio <k-hagio@ab.jp.nec.com>, Christian Hansen <chansen3@cisco.com>, kexec-ml <kexec@lists.infradead.org>, linux-kernel@vger.kernel.org, Miles Chen <miles.chen@mediatek.com>, linux-fsdevel@vger.kernel.org, devel@linuxdriverproject.org, Naoya
List-Id: xen-devel@lists.xenproject.org

PiAgCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvcGFnZS1mbGFncy5oIGIvaW5jbHVkZS9s
aW51eC9wYWdlLWZsYWdzLmgKPiBpbmRleCA1MGNlMWJkZGFmNTYuLmY5MWRhM2QwYTY3ZSAxMDA2
NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3BhZ2UtZmxhZ3MuaAo+ICsrKyBiL2luY2x1ZGUvbGlu
dXgvcGFnZS1mbGFncy5oCj4gQEAgLTY3MCw3ICs2NzAsNyBAQCBQQUdFRkxBR19GQUxTRShEb3Vi
bGVNYXApCj4gICNkZWZpbmUgUEFHRV9UWVBFX0JBU0UJMHhmMDAwMDAwMAo+ICAvKiBSZXNlcnZl
CQkweDAwMDAwMDdmIHRvIGNhdGNoIHVuZGVyZmxvd3Mgb2YgcGFnZV9tYXBjb3VudCAqLwo+ICAj
ZGVmaW5lIFBHX2J1ZGR5CTB4MDAwMDAwODAKPiAtI2RlZmluZSBQR19iYWxsb29uCTB4MDAwMDAx
MDAKPiArI2RlZmluZSBQR19vZmZsaW5lCTB4MDAwMDAxMDAKPiAgI2RlZmluZSBQR19rbWVtY2cJ
MHgwMDAwMDIwMAo+ICAjZGVmaW5lIFBHX3RhYmxlCTB4MDAwMDA0MDAKPiAgCj4gQEAgLTcwMCwx
MCArNzAwLDEzIEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBfX0NsZWFyUGFnZSMjdW5h
bWUoc3RydWN0IHBhZ2UgKnBhZ2UpCVwKPiAgUEFHRV9UWVBFX09QUyhCdWRkeSwgYnVkZHkpCj4g
IAo+ICAvKgo+IC0gKiBQYWdlQmFsbG9vbigpIGlzIHRydWUgZm9yIHBhZ2VzIHRoYXQgYXJlIG9u
IHRoZSBiYWxsb29uIHBhZ2UgbGlzdAo+IC0gKiAoc2VlIG1tL2JhbGxvb25fY29tcGFjdGlvbi5j
KS4KPiArICogUGFnZU9mZmxpbmUoKSBpbmRpY2F0ZXMgdGhhdCB0aGUgcGFnZXMgaXMgbG9naWNh
bGx5IG9mZmxpbmUgYWx0aG91Z2ggdGhlCgpzL3BhZ2VzL3BhZ2UvCgo6KQoKCi0tIAoKVGhhbmtz
LAoKRGF2aWQgLyBkaGlsZGVuYgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
