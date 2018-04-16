From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Subject: Re: [PATCH v1] xen: Fix emfn calculation in
 init_domheap_pages()
Date: Mon, 16 Apr 2018 15:20:37 +0300
Message-ID: <CAPD2p-=pO-8cbvqfDvZprqzFKkV69XP0N=xM=CkDA4RvtQEEDQ@mail.gmail.com>
References: <1523878152-13818-1-git-send-email-olekstysh@gmail.com>
 <5AD48E7002000078001BBA6A@prv1-mh.provo.novell.com>
 <5AD48F1002000078001BBA84@suse.com>
 <29b86f1f-4653-42f6-db6a-3f8750a8db40@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=5cp6=hf=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1f837g-0005jg-6k
 for xen-devel@lists.xenproject.org; Mon, 16 Apr 2018 12:20:40 +0000
Received: by mail-it0-x243.google.com with SMTP id 85-v6so8634466iti.4
 for <xen-devel@lists.xenproject.org>; Mon, 16 Apr 2018 05:20:38 -0700 (PDT)
In-Reply-To: <29b86f1f-4653-42f6-db6a-3f8750a8db40@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBcHIgMTYsIDIwMTggYXQgMjo1NiBQTSwgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPiB3cm90ZToKPiBPbiAxNi8wNC8xOCAxMzo1NCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4+IE9uIDE2LjA0LjE4IGF0IDEzOjUyLCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Pj4+
Pj4gT24gMTYuMDQuMTggYXQgMTM6MjksIDxvbGVrc3R5c2hAZ21haWwuY29tPiB3cm90ZToKPj4+
PiBGcm9tOiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5j
b20+Cj4+Pj4KPj4+PiBUaGUgImVuZCIgYWRkcmVzcyBtdXN0IGJlIHJvdW5kZWQgZG93biBiZWZv
cmUgc2hpZnRpbmcsCj4+Pj4gb3RoZXJ3aXNlIHdlIHdpbGwgaW5zZXJ0IHdyb25nIHBhZ2UgcmFu
Z2UgdG8gYSBoZWFwIGlmIGFkZHJlc3MgaXNuJ3QKPj4+PiBwYWdlIGFsaWduZWQuCj4+Pj4KPj4+
PiBJdCBzZWVtcyB0aGF0IGEgY29weS1wYXN0ZSBtaXN0YWtlIHRvb2sgcGxhY2UgaW4gdGhlIGZv
bGxvd2luZyBjb21taXQ6Cj4+Pj4gMGMxMjk3MmUzNGIyMGEyNmYyYjQyMDQ0Yjk4YmYxMmRiN2Vk
NjJiNgo+Pj4+IHhlbi9tbTogU3dpdGNoIHNvbWUgb2YgcGFnZV9hbGxvYy5jIHRvIHR5cGVzYWZl
IE1GTgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtz
YW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgo+Pj4KPj4+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+Cj4+Cj4+IE9oLCBhbmQgQ2MgSsO8cmdlbi4KPgo+IFRoYW5r
cywganVzdCBzYXcgaXQgbXlzZWxmLiA6LSkKPgo+IFJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPgo+Cj4gSnVlcmdlbgoKVGhhbmsgeW91LgoKCi0tIApS
ZWdhcmRzLAoKT2xla3NhbmRyIFR5c2hjaGVua28KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
