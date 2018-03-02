From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 2/2] x86/xpti: don't map stack guard pages
Date: Fri, 02 Mar 2018 09:10:24 -0700
Message-ID: <5A99858002000078001ADF38@prv-mh.provo.novell.com>
References: <5A996DF202000078001ADD10@prv-mh.provo.novell.com>
 <5A996F3302000078001ADD40@suse.com>
 <4a2caefc-4ad7-7e23-37aa-a500f118f879@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=z0cn=fy=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ernGL-00054B-Qv
 for xen-devel@lists.xenproject.org; Fri, 02 Mar 2018 16:10:25 +0000
In-Reply-To: <4a2caefc-4ad7-7e23-37aa-a500f118f879@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjAzLjE4IGF0IDE2OjQzLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAw
Mi8wMy8xOCAxNTozNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9t
bS5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS5jCj4+IEBAIC01NTc2LDYgKzU1NzYsMTQgQEAg
dm9pZCBtZW1ndWFyZF91bmd1YXJkX3N0YWNrKHZvaWQgKnApCj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBTVEFDS19TSVpFIC0gUFJJTUFSWV9TVEFDS19TSVpFIC0gSVNUX01BWCAqIFBB
R0VfU0laRSk7Cj4+ICB9Cj4+ICAKPj4gK2Jvb2wgbWVtZ3VhcmRfaXNfc3RhY2tfZ3VhcmRfcGFn
ZSh1bnNpZ25lZCBsb25nIGFkZHIpCj4+ICt7Cj4+ICsgICAgYWRkciAmPSBTVEFDS19TSVpFIC0g
MTsKPj4gKwo+PiArICAgIHJldHVybiBhZGRyID49IElTVF9NQVggKiBQQUdFX1NJWkUgJiYKPj4g
KyAgICAgICAgICAgYWRkciA8IFNUQUNLX1NJWkUgLSBQUklNQVJZX1NUQUNLX1NJWkU7Cj4+ICt9
Cj4+ICsKPiAKPiBXaGF0IGFib3V0IG1ha2luZyB1c2Ugb2YgbWVtZ3VhcmRfaXNfc3RhY2tfZ3Vh
cmRfcGFnZSgpIGluCj4gbWVtZ3VhcmRfW3VuXWd1YXJkX3N0YWNrKCkgPwoKSSB3YXMgY29uc2lk
ZXJpbmcgdGhpcyBhcyBhIGZvbGxvdy11cCBzdGVwLgoKPiBUaGlzIHdvdWxkIGF0IG9uY2UgZW5z
dXJlIHRoZSBvdGhlciB1bnVzZWQKPiBwYWdlcyB3b24ndCBiZSBhY2Nlc3NlZCBhY2NpZGVudGFs
bHkgc29tZXdoZXJlLgoKSSBkb24ndCB1bmRlcnN0YW5kIHRoaXMgcGFydCwgdGhvdWdoLgoKSmFu
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
