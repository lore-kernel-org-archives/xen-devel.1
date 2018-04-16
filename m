From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v1] xen: Fix emfn calculation in
 init_domheap_pages()
Date: Mon, 16 Apr 2018 05:54:56 -0600
Message-ID: <5AD48F1002000078001BBA84@prv1-mh.provo.novell.com>
References: <1523878152-13818-1-git-send-email-olekstysh@gmail.com>
 <5AD48E7002000078001BBA6A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ulgz=hf=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f82il-00033Z-2R
 for xen-devel@lists.xenproject.org; Mon, 16 Apr 2018 11:54:55 +0000
In-Reply-To: <5AD48E7002000078001BBA6A@prv1-mh.provo.novell.com>
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
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, oleksandr_tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjA0LjE4IGF0IDEzOjUyLCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Pj4+
IE9uIDE2LjA0LjE4IGF0IDEzOjI5LCA8b2xla3N0eXNoQGdtYWlsLmNvbT4gd3JvdGU6Cj4+IEZy
b206IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4K
Pj4gCj4+IFRoZSAiZW5kIiBhZGRyZXNzIG11c3QgYmUgcm91bmRlZCBkb3duIGJlZm9yZSBzaGlm
dGluZywKPj4gb3RoZXJ3aXNlIHdlIHdpbGwgaW5zZXJ0IHdyb25nIHBhZ2UgcmFuZ2UgdG8gYSBo
ZWFwIGlmIGFkZHJlc3MgaXNuJ3QKPj4gcGFnZSBhbGlnbmVkLgo+PiAKPj4gSXQgc2VlbXMgdGhh
dCBhIGNvcHktcGFzdGUgbWlzdGFrZSB0b29rIHBsYWNlIGluIHRoZSBmb2xsb3dpbmcgY29tbWl0
Ogo+PiAwYzEyOTcyZTM0YjIwYTI2ZjJiNDIwNDRiOThiZjEyZGI3ZWQ2MmI2Cj4+IHhlbi9tbTog
U3dpdGNoIHNvbWUgb2YgcGFnZV9hbGxvYy5jIHRvIHR5cGVzYWZlIE1GTgo+PiAKPj4gU2lnbmVk
LW9mZi1ieTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0u
Y29tPgo+IAo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpP
aCwgYW5kIENjIErDvHJnZW4uCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
