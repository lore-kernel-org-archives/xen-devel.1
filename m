From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v5 09/10] xen: add per-platform defaults for
 NR_CPUS
Date: Tue, 5 Jun 2018 18:55:23 +0100
Message-ID: <bc2bd8a0-db76-d67b-9e6d-c8187e2980b9@arm.com>
References: <alpine.DEB.2.10.1806041020340.23991@sstabellini-ThinkPad-X260>
 <1528133051-924-9-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1528133051-924-9-git-send-email-sstabellini@kernel.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: artem_mygaiev@epam.com, lars.kurth@citrix.com, andrii_anisov@epam.com, andrew.cooper3@citrix.com, dfaggioli@suse.com, JBeulich@suse.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

SGkgU3RlZmFubywKCk9uIDA0LzA2LzE4IDE4OjI0LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6
Cj4gQWRkIHNwZWNpZmljIHBlci1wbGF0Zm9ybSBkZWZhdWx0cyBmb3IgTlJfQ1BVUy4gTm90ZSB0
aGF0IHRoZSBvcmRlciBvZgo+IHRoZSBkZWZhdWx0cyBtYXR0ZXI6IHRoZXkgbmVlZCB0byBnbyBm
aXJzdCwgb3RoZXJ3aXNlIHRoZSBnZW5lcmljCj4gZGVmYXVsdHMgd2lsbCBiZSBhcHBsaWVkLgo+
IAo+IFRoaXMgaXMgZG9uZSBzbyB0aGF0IFhlbiBidWlsZHMgY3VzdG9taXplZCBmb3IgYSBzcGVj
aWZpYyBoYXJkd2FyZQo+IHBsYXRmb3JtIGNhbiBoYXZlIHRoZSByaWdodCBOUl9DUFVTIG51bWJl
ci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtl
cm5lbC5vcmc+Cj4gQ0M6IEpCZXVsaWNoQHN1c2UuY29tCj4gQ0M6IGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20KPiAtLS0KPiAgIHhlbi9hcmNoL0tjb25maWcgfCA0ICsrKysKPiAgIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvS2NvbmZp
ZyBiL3hlbi9hcmNoL0tjb25maWcKPiBpbmRleCBjZjBhY2I3Li5lZDhmM2Q4IDEwMDY0NAo+IC0t
LSBhL3hlbi9hcmNoL0tjb25maWcKPiArKysgYi94ZW4vYXJjaC9LY29uZmlnCj4gQEAgLTMsNiAr
MywxMCBAQCBjb25maWcgTlJfQ1BVUwo+ICAgCWludCAiTWF4aW11bSBudW1iZXIgb2YgcGh5c2lj
YWwgQ1BVcyIKPiAgIAlyYW5nZSAxIDQwOTUKPiAgIAlkZWZhdWx0ICIyNTYiIGlmIFg4Ngo+ICsJ
ZGVmYXVsdCAiMTI4IiBpZiBBUk0gJiYgQUxMCgpJIHdvdWxkIGRyb3AgdGhpcyBoYXMgdGhpcyBp
cyBjb3ZlciBieSAiaWYgQVJNIiBiZWxvdy4KCj4gKwlkZWZhdWx0ICI4IiBpZiBBUk0gJiYgUkNB
UjMKPiArCWRlZmF1bHQgIjQiIGlmIEFSTSAmJiBRRU1VCj4gKwlkZWZhdWx0ICI0IiBpZiBBUk0g
JiYgTVBTT0MKPiAgIAlkZWZhdWx0ICIxMjgiIGlmIEFSTQo+ICAgCS0tLWhlbHAtLS0KPiAgIAkg
IFNwZWNpZmllcyB0aGUgbWF4aW11bSBudW1iZXIgb2YgcGh5c2ljYWwgQ1BVcyB3aGljaCBYZW4g
d2lsbCBzdXBwb3J0Lgo+IAoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
