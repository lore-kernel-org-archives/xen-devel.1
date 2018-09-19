From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [OSSTEST PATCH] make-flight: Test with
 `sched=credit'
Date: Wed, 19 Sep 2018 11:59:28 +0100
Message-ID: <20180919105928.mklq4asx5rbll52a@zion.uk.xensource.com>
References: <20180919105720.20099-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wwm0=mb=citrix.com=prvs=79313d28f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g2aCi-0002yQ-Vd
 for xen-devel@lists.xenproject.org; Wed, 19 Sep 2018 10:59:33 +0000
Content-Disposition: inline
In-Reply-To: <20180919105720.20099-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <JBeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBTZXAgMTksIDIwMTggYXQgMTE6NTc6MjBBTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gVGhlIGRlZmF1bHQgaW4geGVuLXVuc3RhYmxlI3N0YWdpbmcgaXMgc29vbiB0byBiZSBz
Y2hlZD1jcmVkaXQyLiAgVGhhdAo+IGxlYXZlcyBvc3N0ZXN0IG5vdCB0ZXN0aW5nIGNyZWRpdDEg
YXQgYWxsLgo+IAo+IEFkZCBhIGpvYiB0aGF0IGRvZXMgdGhpcy4gIEl0J3MgYSBjb3B5IG9mIHRo
ZSAtY3JlZGl0MiBqb2IuICAoSXQncwo+IGEgcHJldHR5IG51Z2F0b3J5IHRlc3QgYnV0IGl0IHdp
bGwgcHJvYmFibHkgZG8uKQo+IAo+IFdlIGNhbGwgdGhlIHRlc3QgLWNyZWRpdDEsIGFsdGhvdWdo
IHRoZSBYZW4gcGFyYW1ldGVyIGlzID1jcmVkaXQuCj4gCj4gSSBoYXZlIHZlcmlmaWVkIHdpdGgg
c3RhbmRhbG9uZS1nZW5lcmF0ZS1kdW1wLWZsaWdodC1ydW52YXJzIHRoYXQgdGhlCj4gZWZmZWN0
IGlzIHRvIGFkZCB0aGUgYXBwcm9wcmlhdGVseSBtdXRhdGVkIGNvcHkgb2YgdGhlIGNyZWRpdDIg
am9iIHRvCj4gZXZlcnkgZmxpZ2h0LiAgVGhlIG11dGF0aW9ucyBhcmUgc29sZWx5IHRoZSBzY2hl
ZD0gcGFyYW1ldGVyIGFuZCB0aGUKPiBqb2IgbmFtZS4KPiAKPiBDQzogR2VvcmdlIER1bmxhcCA8
Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgo+IENDOiBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xp
QHN1c2UuY29tPgo+IENDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+Cj4gQ0M6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gQ0M6IFdlaSBMaXUgPHdl
aS5saXUyQGNpdHJpeC5jb20+Cj4gQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz4KPiBDQzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFj
bGUuY29tPgo+IENDOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBJ
YW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBXZWkg
TGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
