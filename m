From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86/mm: Add debug code to detect illegal
 page_lock and put_page_type ordering
Date: Wed, 24 Jan 2018 08:43:53 -0700
Message-ID: <5A68B7C902000078001A207E@prv-mh.provo.novell.com>
References: <20180124150222.8399-1-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=5p9l=et=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eeNDT-0007pg-Fv
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2018 15:43:59 +0000
In-Reply-To: <20180124150222.8399-1-george.dunlap@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI0LjAxLjE4IGF0IDE2OjAyLCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBUaGUgZml4IGZvciBYU0EtMjQyIGRlcGVuZHMgb24gdGhlIHNhbWUgY3B1IG5ldmVyIGNh
bGxpbmcKPiBfcHV0X3BhZ2VfdHlwZSgpIHdoaWxlIGhvbGRpbmcgYSBwYWdlX2xvY2soKSBmb3Ig
dGhhdCBwYWdlOyBkb2luZyBzbwo+IG1heSBjYXVzZSBhIGRlYWRsb2NrIHVuZGVyIHRoZSByaWdo
dCBjb25kaXRpb25zLgo+IAo+IEZ1cnRoZXJtb3JlLCBldmVuIGJlZm9yZSB0aGF0LCB0aGVyZSB3
YXMgbmV2ZXIgYW55IGRpc2NpcGxpbmUgZm9yIHRoZQo+IG9yZGVyIGluIHdoaWNoIHBhZ2UgbG9j
a3MgYXJlIGdyYWJiZWQ7IGlmIHRoZXJlIGFyZSBhbnkgcGF0aHMgdGhhdAo+IGdyYWIgdGhlIGxv
Y2tzIGZvciB0d28gZGlmZmVyZW50IHBhZ2VzIGF0IG9uY2UsIHdlIHJpc2sgY3JlYXRpbmcgdGhl
Cj4gY29uZGl0aW9ucyBmb3IgYSBkZWFkbG9jayB0byBvY2N1ci4KPiAKPiBUaGVzZSBhcmUgYmVs
aWV2ZWQgdG8gYmUgc2FmZSwgYmVjYXVzZSBpdCBpcyBiZWxpZXZlZCB0aGF0Ogo+IDEuIE5vIGh5
cGVydmlzb3IgcGF0aHMgZXZlciBsb2NrIHR3byBwYWdlcyBhdCBvbmNlLCBhbmQKPiAyLiBXZSBu
ZXZlciBjYWxsIF9wdXRfcGFnZV90eXBlKCkgb24gYSBwYWdlIHdoaWxlIGhvbGRpbmcgaXRzIHBh
Z2UgbG9jay4KPiAKPiBBZGQgYSBjaGVjayB0byBkZWJ1ZyBidWlsZHMgdG8gY2F0Y2ggYW55IHZp
b2xhdGlvbnMgb2YgdGhlc2UKPiBhc3N1bXBpdG9ucy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBHZW9y
Z2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Cj4gLS0tCj4gdjI6Cj4gLSBNYWtl
IHdyYXBwZXIgbWFjcm9zIHRvIGdldCByaWQgb2YgdWdseSAjaWZkZWZzCj4gLSBVc2UgImN1cnJl
bnRfbG9ja2VkX3BhZ2UqIiBwcmVmaXgKPiAtIFJld29yZCBjb21taXQgbWVzc2FnZQo+IAo+IE5C
IHRoaXMgZG9lc24ndCBhZGRyZXNzIEFuZHJldydzIGNvbW1lbnQgZnJvbSB2MSBhYm91dCBhZGRp
bmcgIm1vcmUKPiB0aGFuIGp1c3QgYSBkZWJ1ZyBjaGVjayIuICBJIHRoaW5rIHdlIHNob3VsZCBj
aGVjayBpbiB0aGUgQVNTRVJUKCkKPiB3aGlsZSB3ZSBkaXNjdXNzIGZ1dHVyZSBwb3RlbnRpYWwg
d29yaywgYW5kIG5vdCBsZXQgdGhlIGJlc3QgYmVjb21lCj4gdGhlIGVuZW15IG9mIHRoZSBnb29k
LgoKSSBhZ3JlZSwgYW5kIGhlbmNlCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+CnVubGVzcyBBbmRyZXcgcmVhbGx5IG1lYW5zIHRvIHZldG8gdGhpcyBnb2luZyBpbi4K
CkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
