From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v5 03/16] xen/arm: mm: Use gaddr_to_gfn
 rather than _gfn(paddr_to_pfn(...))
Date: Tue, 20 Mar 2018 08:33:03 +0000
Message-ID: <a3c07a68-1067-2f01-2897-a190e4bdb928@arm.com>
References: <20180314182009.14274-1-julien.grall@arm.com>
 <20180314182009.14274-4-julien.grall@arm.com>
 <CAFLBxZZ+vvqF=t=uJ63MQvSmeUJuTc_zg68GYGAY=nyvU4hJLw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAFLBxZZ+vvqF=t=uJ63MQvSmeUJuTc_zg68GYGAY=nyvU4hJLw@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <dunlapg@umich.edu>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

SGkgR2VvcmdlLAoKT24gMDMvMTUvMjAxOCAwNDoxNSBQTSwgR2VvcmdlIER1bmxhcCB3cm90ZToK
PiBPbiBXZWQsIE1hciAxNCwgMjAxOCBhdCA2OjE5IFBNLCAgPGp1bGllbi5ncmFsbEBhcm0uY29t
PiB3cm90ZToKPj4gRnJvbTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4K
Pj4gVGhlIGNvbnN0cnVjdGlvbiBfZ2ZuKHBhZGRyX3RvX3BmbiguLi4pKSBjYW4gYmUgc2ltcGxp
ZmllZCBieSB1c2luZwo+PiBnYWRkcl90b19nZm4uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gCj4gTm90IHN1cmUgaWYgInNpbXBsaWZp
ZWQiIGlzIHRoZSByaWdodCB3b3JkIGhlcmUgKGFuZCBpbiB0aGUgcHJldmlvdXMKPiBwYXRjaCk7
IHNpbXBsaWZpZWQgaW1wbGllcyBmZXdlciBzdGVwcyBpbiB0aGUgY2FsY3VsYXRpb24sIGJ1dCBp
dAo+IGxvb2tzIGxpa2UgdGhlIHN0ZXBzIHNvIGZhciBhcmUgaWRlbnRpY2FsLiAgVXNpbmcgYSBt
YWNybyByYXRoZXIgdGhhbgo+IGhhbmQtY29kaW5nIHN0dWZmIGlzIGNsZWFuZXIgYW5kIG1vcmUg
bWFpbnRhaW5hYmxlOyBkb24ndCB0aGluayBpdAo+IHJlYWxseSBuZWVkcyB0byBiZSBqdXN0aWZp
ZWQuCgpJIGNhbiBkcm9wIHRoZSBqdXN0aWZpY2F0aW9uIGluIGJvdGggcGF0Y2hlcy4KCj4gCj4g
SW4gYW55IGNhc2U6Cj4gCj4gUmV2aWV3ZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5s
YXBAY2l0cml4LmNvbT4KClRoYW5rIHlvdSEKCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
