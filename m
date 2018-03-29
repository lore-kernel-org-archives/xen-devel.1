From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 5/7] xen/x86: disable global pages for
 domains with XPTI active
Date: Thu, 29 Mar 2018 07:12:44 -0600
Message-ID: <5ABD026C02000078001B7352@prv1-mh.provo.novell.com>
References: <20180327090704.28646-1-jgross@suse.com>
 <20180327090704.28646-6-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=fhp7=gt=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f1XMG-0002SL-ND
 for xen-devel@lists.xenproject.org; Thu, 29 Mar 2018 13:12:48 +0000
In-Reply-To: <20180327090704.28646-6-jgross@suse.com>
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

Pj4+IE9uIDI3LjAzLjE4IGF0IDExOjA3LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBJbnN0
ZWFkIG9mIGZsdXNoaW5nIHRoZSBUTEIgZnJvbSBnbG9iYWwgcGFnZXMgd2hlbiBzd2l0Y2hpbmcg
YWRkcmVzcwo+IHNwYWNlcyB3aXRoIFhQVEkgYmVpbmcgYWN0aXZlIGp1c3QgZGlzYWJsZSBnbG9i
YWwgcGFnZXMgdmlhICVjcjQKPiBjb21wbGV0ZWx5IHdoZW4gYSBkb21haW4gc3ViamVjdCB0byBY
UFRJIGlzIGFjdGl2ZS4gVGhpcyBhdm9pZHMgdGhlCj4gbmVlZCBmb3IgZXh0cmEgVExCIGZsdXNo
ZXMgYXMgbG9hZGluZyAlY3IzIHdpbGwgcmVtb3ZlIGFsbCBUTEIKPiBlbnRyaWVzLgo+IAo+IElu
IG9yZGVyIHRvIGF2b2lkIHN0YXRlcyB3aXRoIGNyMy9jcjQgaGF2aW5nIGluY29uc2lzdGVudCB2
YWx1ZXMKPiAoZS5nLiBnbG9iYWwgcGFnZXMgYmVpbmcgYWN0aXZhdGVkIHdoaWxlIGNyMyBhbHJl
YWR5IHNwZWNpZmllcyBhIFhQVEkKPiBhZGRyZXNzIHNwYWNlKSBtb3ZlIGxvYWRpbmcgb2YgdGhl
IG5ldyBjcjQgdmFsdWUgdG8gd3JpdGVfcHRiYXNlKCkKPiAoYWN0dWFsbHkgdG8gd3JpdGVfY3Iz
X2NyNCgpIGNhbGxlZCBieSB3cml0ZV9wdGJhc2UoKSkuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
