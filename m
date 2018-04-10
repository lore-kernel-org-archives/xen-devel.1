From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 5/9] xen/x86: disable global pages for
 domains with XPTI active
Date: Tue, 10 Apr 2018 03:16:23 -0600
Message-ID: <5ACC9D0702000078001B9D37@prv1-mh.provo.novell.com>
References: <20180410075843.6822-1-jgross@suse.com>
 <20180410075843.6822-6-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ay0c=g7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f5pO9-0005qa-EH
 for xen-devel@lists.xenproject.org; Tue, 10 Apr 2018 09:16:29 +0000
In-Reply-To: <20180410075843.6822-6-jgross@suse.com>
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
Cc: andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjA0LjE4IGF0IDA5OjU4LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBJbnN0
ZWFkIG9mIGZsdXNoaW5nIHRoZSBUTEIgZnJvbSBnbG9iYWwgcGFnZXMgd2hlbiBzd2l0Y2hpbmcg
YWRkcmVzcwo+IHNwYWNlcyB3aXRoIFhQVEkgYmVpbmcgYWN0aXZlIGp1c3QgZGlzYWJsZSBnbG9i
YWwgcGFnZXMgdmlhICVjcjQKPiBjb21wbGV0ZWx5IHdoZW4gYSBkb21haW4gc3ViamVjdCB0byBY
UFRJIGlzIGFjdGl2ZS4gVGhpcyBhdm9pZHMgdGhlCj4gbmVlZCBmb3IgZXh0cmEgVExCIGZsdXNo
ZXMgYXMgbG9hZGluZyAlY3IzIHdpbGwgcmVtb3ZlIGFsbCBUTEIKPiBlbnRyaWVzLgo+IAo+IElu
IG9yZGVyIHRvIGF2b2lkIHN0YXRlcyB3aXRoIGNyMy9jcjQgaGF2aW5nIGluY29uc2lzdGVudCB2
YWx1ZXMKPiAoZS5nLiBnbG9iYWwgcGFnZXMgYmVpbmcgYWN0aXZhdGVkIHdoaWxlIGNyMyBhbHJl
YWR5IHNwZWNpZmllcyBhIFhQVEkKPiBhZGRyZXNzIHNwYWNlKSBtb3ZlIGxvYWRpbmcgb2YgdGhl
IG5ldyBjcjQgdmFsdWUgdG8gd3JpdGVfcHRiYXNlKCkKPiAoYWN0dWFsbHkgdG8gc3dpdGNoX2Ny
M19jcjQoKSBjYWxsZWQgYnkgd3JpdGVfcHRiYXNlKCkpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
