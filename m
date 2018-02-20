From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/xpti: avoid copying L4 page table
 contents when possible
Date: Tue, 20 Feb 2018 01:56:14 -0700
Message-ID: <5A8BF0BE02000078001A9781@prv-mh.provo.novell.com>
References: <20180215125203.29794-1-jgross@suse.com>
 <5A8B107302000078001A9407@suse.com>
 <7470904a-a9a9-556f-a412-d7b73799cd08@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=wunw=fo=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eo3iq-0006ar-7f
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2018 08:56:24 +0000
In-Reply-To: <7470904a-a9a9-556f-a412-d7b73799cd08@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: andrew.cooper3@citrix.com, Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjAyLjE4IGF0IDE4OjE5LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAx
OS8wMi8xOCAxNzo1OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDE1LjAyLjE4IGF0IDEz
OjUyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni94ODZf
NjQvZW50cnkuUwo+Pj4gKysrIGIveGVuL2FyY2gveDg2L3g4Nl82NC9lbnRyeS5TCj4+PiBAQCAt
NDYsMTAgKzQ2LDEzIEBAIHJlc3RvcmVfYWxsX2d1ZXN0Ogo+Pj4gIC5McmFnX2NyM19zdGFydDoK
Pj4+ICAgICAgICAgIG1vdiAgIFZDUFVfY3IzKCVyYngpLCAlcjkKPj4+ICAgICAgICAgIEdFVF9T
VEFDS19FTkQoZHgpCj4+PiAtICAgICAgICBtb3YgICBTVEFDS19DUFVJTkZPX0ZJRUxEKHB2X2Ny
MykoJXJkeCksICVyZGkKPj4+ICsgICAgICAgIG1vdiAgIFNUQUNLX0NQVUlORk9fRklFTEQocHZf
Y3IzKSglcmR4KSwgJXJheAo+Pj4gKyAgICAgICAgY21wYiAgJDAsIFNUQUNLX0NQVUlORk9fRklF
TEQoY29weV9sNCkoJXJkeCkKPj4+ICsgICAgICAgIGplICAgIC5McmFnX2NvcHllbmQKPj4+ICsg
ICAgICAgIG1vdmIgICQwLCBTVEFDS19DUFVJTkZPX0ZJRUxEKGNvcHlfbDQpKCVyZHgpCj4+IAo+
PiBVc2UgJWJsIGluc3RlYWQgb2YgJDAgaW4gYm90aCBjYXNlcyAod2l0aCBhIGNvbW1lbnQpPwo+
IAo+IERvIHlvdSByZWFsbHkgdGhpbmsgd2Ugc2hvdWxkIGFkZCBzdWNoIGEgbWljcm8gb3B0aW1p
emF0aW9uIHJlbHlpbmcKPiBvbiB0aGUgdmNwdSBwb2ludGVyIGJlaW5nIGFsaWduZWQgdG8gcGFn
ZSBib3VuZGFyeT8gQW5kIGFyZSB5b3Ugc3VyZQo+IGFkZGluZyB0aGUgcmVnaXN0ZXIgZGVwZW5k
ZW5jeSBpc24ndCBodXJ0aW5nIG1vcmUgdGhhbiB3ZSB3aWxsIGdhaW4KPiBmcm9tIHNhdmluZyBh
biBpbnN0cnVjdGlvbiBieXRlPwoKV2VsbCwgYm90aCBvZiB3aGF0IHlvdSBzYXkgYXJlIHRoZSBw
cmVjaXNlIHJlYXNvbnMgd2h5IEkndmUKYXNrZWQgYSBxdWVzdGlvbiByYXRoZXIgdGhhbiBhc2tp
bmcgZm9yIHRoZSBjaGFuZ2UgdG8gYmUgZG9uZQp1bmNvbmRpdGlvbmFsbHkuIEknbSBub3QgcmVh
bGx5IHdvcnJpZWQgYWJvdXQgdGhlIHJlZ2lzdGVyCmRlcGVuZGVuY3kgLSAlcmJ4IGlzIGxvYWRl
ZCBzdWZmaWNpZW50bHkgbXVjaCBlYXJsaWVyLiBBbmQKdGhlIHN0cnVjdC12Y3B1LWlzLWFsaWdu
ZWQgYXNwZWN0IGlzIHdoeSBJIGRpZCBzdWdnZXN0IGFkZGluZwphIGNvbW1lbnQ7IEkgYXNzdW1l
IHlvdSByZWFsaXplIHdlIGNhbid0IGVhc2lseSBicmVhayB0aGF0CmFsaWdubWVudCwgaGVuY2Ug
SSBzZWUgbm8gc2lnbmlmaWNhbnQgcmlzayBoZXJlLiBCdXQgSSdtIG5vdApnb2luZyB0byBpbnNp
c3QsIGFuZCBJJ20gb3BlbiBmb3IgZnVydGhlciBjb3VudGVyIGFyZ3VtZW50cy4KCkphbgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
