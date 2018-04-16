From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v1] xen: Fix emfn calculation in
 init_domheap_pages()
Date: Mon, 16 Apr 2018 05:52:16 -0600
Message-ID: <5AD48E7002000078001BBA6A@prv1-mh.provo.novell.com>
References: <1523878152-13818-1-git-send-email-olekstysh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1523878152-13818-1-git-send-email-olekstysh@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: olekstysh@gmail.com
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, oleksandr_tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjA0LjE4IGF0IDEzOjI5LCA8b2xla3N0eXNoQGdtYWlsLmNvbT4gd3JvdGU6Cj4g
RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
Pgo+IAo+IFRoZSAiZW5kIiBhZGRyZXNzIG11c3QgYmUgcm91bmRlZCBkb3duIGJlZm9yZSBzaGlm
dGluZywKPiBvdGhlcndpc2Ugd2Ugd2lsbCBpbnNlcnQgd3JvbmcgcGFnZSByYW5nZSB0byBhIGhl
YXAgaWYgYWRkcmVzcyBpc24ndAo+IHBhZ2UgYWxpZ25lZC4KPiAKPiBJdCBzZWVtcyB0aGF0IGEg
Y29weS1wYXN0ZSBtaXN0YWtlIHRvb2sgcGxhY2UgaW4gdGhlIGZvbGxvd2luZyBjb21taXQ6Cj4g
MGMxMjk3MmUzNGIyMGEyNmYyYjQyMDQ0Yjk4YmYxMmRiN2VkNjJiNgo+IHhlbi9tbTogU3dpdGNo
IHNvbWUgb2YgcGFnZV9hbGxvYy5jIHRvIHR5cGVzYWZlIE1GTgo+IAo+IFNpZ25lZC1vZmYtYnk6
IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4KClJl
dmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
