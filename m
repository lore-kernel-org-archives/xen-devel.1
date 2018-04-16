From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v1] xen: Fix emfn calculation in
 init_domheap_pages()
Date: Mon, 16 Apr 2018 13:56:49 +0200
Message-ID: <29b86f1f-4653-42f6-db6a-3f8750a8db40@suse.com>
References: <1523878152-13818-1-git-send-email-olekstysh@gmail.com>
 <5AD48E7002000078001BBA6A@prv1-mh.provo.novell.com>
 <5AD48F1002000078001BBA84@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=dujn=hf=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f82kh-0003Cc-L5
 for xen-devel@lists.xenproject.org; Mon, 16 Apr 2018 11:56:55 +0000
In-Reply-To: <5AD48F1002000078001BBA84@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, olekstysh@gmail.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMDQvMTggMTM6NTQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE2LjA0LjE4IGF0
IDEzOjUyLCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Pj4+PiBPbiAxNi4wNC4xOCBhdCAx
MzoyOSwgPG9sZWtzdHlzaEBnbWFpbC5jb20+IHdyb3RlOgo+Pj4gRnJvbTogT2xla3NhbmRyIFR5
c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgo+Pj4KPj4+IFRoZSAiZW5k
IiBhZGRyZXNzIG11c3QgYmUgcm91bmRlZCBkb3duIGJlZm9yZSBzaGlmdGluZywKPj4+IG90aGVy
d2lzZSB3ZSB3aWxsIGluc2VydCB3cm9uZyBwYWdlIHJhbmdlIHRvIGEgaGVhcCBpZiBhZGRyZXNz
IGlzbid0Cj4+PiBwYWdlIGFsaWduZWQuCj4+Pgo+Pj4gSXQgc2VlbXMgdGhhdCBhIGNvcHktcGFz
dGUgbWlzdGFrZSB0b29rIHBsYWNlIGluIHRoZSBmb2xsb3dpbmcgY29tbWl0Ogo+Pj4gMGMxMjk3
MmUzNGIyMGEyNmYyYjQyMDQ0Yjk4YmYxMmRiN2VkNjJiNgo+Pj4geGVuL21tOiBTd2l0Y2ggc29t
ZSBvZiBwYWdlX2FsbG9jLmMgdG8gdHlwZXNhZmUgTUZOCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTog
T2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgo+Pgo+
PiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IE9oLCBh
bmQgQ2MgSsO8cmdlbi4KClRoYW5rcywganVzdCBzYXcgaXQgbXlzZWxmLiA6LSkKClJlbGVhc2Ut
YWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
