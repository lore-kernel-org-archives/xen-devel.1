From: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 5/9] drm/xen/xen_drm_front_gem.c: Convert to
 use vm_insert_range
Date: Mon, 19 Nov 2018 04:29:29 -0800
Message-ID: <20181119122929.GA394__49195.6169870265$1542630495$gmane$org@bombadil.infradead.org>
References: <20181115154912.GA27969@jordon-HP-15-Notebook-PC>
 <ed294bea-bf07-6a4d-51ec-9e7082703b61@gmail.com>
 <CAFqt6zZ_FnWg2K3Lh=-1KFOk1XteHnroua6QzJrKo+khZTgieg@mail.gmail.com>
 <c76fc2fa-d08b-7db3-5693-d9c303cd7126@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <c76fc2fa-d08b-7db3-5693-d9c303cd7126@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: Michal Hocko <mhocko@suse.com>, oleksandr_andrushchenko@epam.com, airlied@linux.ie, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, xen-devel@lists.xen.org, Linux-MM <linux-mm@kvack.org>, Souptick Joarder <jrdr.linux@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBOb3YgMTksIDIwMTggYXQgMDE6MDI6NDZQTSArMDIwMCwgT2xla3NhbmRyIEFuZHJ1
c2hjaGVua28gd3JvdGU6Cj4gT24gMTEvMTkvMTggMTI6NDIgUE0sIFNvdXB0aWNrIEpvYXJkZXIg
d3JvdGU6Cj4gPiBPbiBNb24sIE5vdiAxOSwgMjAxOCBhdCAzOjIyIFBNIE9sZWtzYW5kciBBbmRy
dXNoY2hlbmtvCj4gPiA8YW5kcjIwMDBAZ21haWwuY29tPiB3cm90ZToKPiA+ID4gPiAtICAgICB1
bnNpZ25lZCBsb25nIGFkZHIgPSB2bWEtPnZtX3N0YXJ0Owo+ID4gPiA+IC0gICAgIGludCBpOwo+
ID4gPiA+ICsgICAgIGludCBlcnI7Cj4gPiA+IEkgd291bGQgbG92ZSB0byBrZWVwIHJldCwgbm90
IGVycgo+ID4gU3VyZSwgd2lsbCBhZGQgaXQgaW4gdjIuCj4gPiBCdXQgSSB0aGluaywgZXJyIGlz
IG1vcmUgYXBwcm9wcmlhdGUgaGVyZS4KPiAKPiBJIHVzZWQgInJldCIgdGhyb3VnaG91dCB0aGUg
ZHJpdmVyLCBzbyB0aGlzIGlzIGp1c3QgdG8gcmVtYWluIGNvbnNpc3RlbnQ6Cj4gCj4gZ3JlcCAt
cm53IGVyciBkcml2ZXJzL2dwdS9kcm0veGVuLyB8IHdjIC1sCj4gMAo+IGdyZXAgLXJudyByZXQg
ZHJpdmVycy9ncHUvZHJtL3hlbi8gfCB3YyAtbAo+IDIwNAoKSXQncyB5b3VyIGRyaXZlciwgc28g
dGhhdCdzIGZpbmUuICBUaGUgcmVhc29uIHdlIGNob3NlICdlcnInIG92ZXIgJ3JldCcKaXMgdGhh
dCB0aGVyZSdzIGEgaGlzdG9yeSBvZiBlcnJubyB2cyBWTV9GQVVMVF94eHggY29kZSBjb25mdXNp
b24gaW4KdGhpcyBhcmVhLiAgTmFtaW5nIGEgdmFyaWFibGUgJ2VycicgbWFrZXMgaXQgY2xlYXIg
dGhpcyBpcyBhbiBlcnJubyBhbmQKbm90IGEgdm1fZmF1bHRfdC4KCj4gPiA+IFdpdGggdGhlIGFi
b3ZlIGZpeGVkLAo+ID4gPiAKPiA+ID4gUmV2aWV3ZWQtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hl
bmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KClRoYW5rcy4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
