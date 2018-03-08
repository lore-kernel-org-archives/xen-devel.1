From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 3/6] xen/x86: support per-domain flag for
	xpti
Date: Thu, 08 Mar 2018 05:49:49 -0700
Message-ID: <5AA13F7D02000078001AFCB3@prv-mh.provo.novell.com>
References: <20180302081403.16953-1-jgross@suse.com>
 <20180302081403.16953-4-jgross@suse.com>
 <5AA11BDE02000078001AFB92@suse.com>
 <a0e3b93a-0111-bfb0-fb9e-ff736769fe7e@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=bbjo=f6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1etuzc-0004Qq-Qj
 for xen-devel@lists.xenproject.org; Thu, 08 Mar 2018 12:49:56 +0000
In-Reply-To: <a0e3b93a-0111-bfb0-fb9e-ff736769fe7e@suse.com>
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
Cc: andrew.cooper3@citrix.com, Dario Faggioli <dfaggioli@suse.com>, wei.liu2@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjAzLjE4IGF0IDEyOjMwLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAw
OC8wMy8xOCAxMToxNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDAyLjAzLjE4IGF0IDA5
OjE0LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+ICtzdGF0aWMgaW50IHBhcnNlX3hwdGko
Y29uc3QgY2hhciAqcykKPj4+ICt7Cj4+PiArICAgIGludCByYyA9IDA7Cj4+PiArCj4+PiArICAg
IHN3aXRjaCAoIHBhcnNlX2Jvb2wocywgTlVMTCkgKQo+Pj4gKyAgICB7Cj4+PiArICAgIGNhc2Ug
MDoKPj4+ICsgICAgICAgIG9wdF94cHRpID0gWFBUSV9PRkY7Cj4+PiArICAgICAgICBicmVhazsK
Pj4+ICsgICAgY2FzZSAxOgo+Pj4gKyAgICAgICAgb3B0X3hwdGkgPSBYUFRJX09OOwo+Pj4gKyAg
ICAgICAgYnJlYWs7Cj4+PiArICAgIGRlZmF1bHQ6Cj4+PiArICAgICAgICBpZiAoICFzdHJjbXAo
cywgImRlZmF1bHQiKSApCj4+IAo+PiBUaGlzIHdhbnRzIHRvIGFsc28gYmUgbWVudGlvbmVkIGlu
IHRoZSBjb21tYW5kIGxpbmUgZG9jLgo+IAo+IFV1aCwgdGhpcyB3YXMgYSBjb3B5LWFuZC1wYXN0
ZSByZXN1bHQgZnJvbSBteSBhbHRlcm5hdGl2ZSBYUFRJIGFwcHJvYWNoLgo+IEknbGwganVzdCBk
cm9wIHRoYXQgdmFsdWUuCgpJJ20gbm90IHN1cmUgdGhhdCdzIHRoZSBiZXN0IHJvdXRlIChhbmQg
SSBkaWQgaW50ZW50aW9uYWxseSBub3QgYXNrIGZvcgp5b3UgZG9pbmcgc28pOiBJbiBjYXNlcyB3
aGVyZSB5b3UgY2FuJ3QgZWRpdCB0aGUgcHJlLWJ1aWx0IGNvbW1hbmQKbGluZSBvcHRpb25zIChs
aWtlIGUuZy4gdGhvc2UgcmVhZCBieSB4ZW4uZWZpIGZyb20gdGhlIGNvbmZpZyBmaWxlKSwgaXQK
aXMgcXVpdGUgdXNlZnVsIHRvIGJlIGFibGUgdG8gb3ZlcnJpZGUgd2hhdCBtYXkgYmUgdGhlcmUg
YmFjayB0byB0aGUKZGVmYXVsdC4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
