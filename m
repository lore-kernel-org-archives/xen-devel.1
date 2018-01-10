From: Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH 2/2] xen/gntdev: Fix partial gntdev_mmap()
	cleanup
Date: Wed, 10 Jan 2018 09:11:17 +0000
Message-ID: <7b27b9ee-2c38-356c-14bd-b21db3a96960__13856.2638815076$1515575454$gmane$org@citrix.com>
References: <20180109121022.11467-1-ross.lagerwall@citrix.com>
 <20180109121022.11467-2-ross.lagerwall@citrix.com>
 <e2686907-2715-15e8-4cdf-3165903db3ee@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=phwf=ef=citrix.com=prvs=541394923=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1eZCQM-0002ve-QC
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2018 09:11:54 +0000
In-Reply-To: <e2686907-2715-15e8-4cdf-3165903db3ee@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMTAvMjAxOCAwMToyMiBBTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IAo+IAo+IE9u
IDAxLzA5LzIwMTggMDc6MTAgQU0sIFJvc3MgTGFnZXJ3YWxsIHdyb3RlOgo+PiBXaGVuIGNsZWFu
aW5nIHVwIGFmdGVyIGEgcGFydGlhbGx5IHN1Y2Nlc3NmdWwgZ250ZGV2X21tYXAoKSwgdW5tYXAg
dGhlCj4+IHN1Y2Nlc3NmdWxseSBtYXBwZWQgZ3JhbnQgcGFnZXMgb3RoZXJ3aXNlIFhlbiB3aWxs
IGtpbGwgdGhlIGRvbWFpbiBpZgo+PiBpbiBkZWJ1ZyBtb2RlIChBdHRlbXB0IHRvIGltcGxpY2l0
bHkgdW5tYXAgYSBncmFudGVkIFBURSkgb3IgTGludXggd2lsbAo+PiBraWxsIHRoZSBwcm9jZXNz
IGFuZCBlbWl0ICJCVUc6IEJhZCBwYWdlIG1hcCBpbiBwcm9jZXNzIiBpZiBYZW4gaXMgaW4KPj4g
cmVsZWFzZSBtb2RlLgo+Pgo+PiBUaGlzIGlzIG9ubHkgbmVlZGVkIHdoZW4gdXNlX3B0ZW1vZCBp
cyB0cnVlIGJlY2F1c2UgZ250ZGV2X3B1dF9tYXAoKQo+PiB3aWxsIHVubWFwIGdyYW50IHBhZ2Vz
IGl0c2VsZiB3aGVuIHVzZV9wdGVtb2QgaXMgZmFsc2UuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJv
c3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vyd2FsbEBjaXRyaXguY29tPgo+IAo+IFJldmlld2VkLWJ5
OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgo+IAo+IGFsdGhv
dWdoIEkgd29uZGVyIHdoZXRoZXIgaXQgbWF5IGJlIHBvc3NpYmxlIHRvIGhhdmUgZ250ZGV2X3B1
dF9tYXAoKSAKPiBmaWd1cmUgd2hldGhlciB0byB1bm1hcCB0aGUgcGFnZXMgaWYgdXNlX3B0ZW1v
ZCBpcyBzZXQuCgpJdCB3YXMgYSB3aGlsZSBzaW5jZSBJIHdyb3RlIHRoaXMgcGF0Y2gsIGJ1dCBJ
SVJDIHdoZW4gdXNlX3B0ZW1vZCBpcyAKc2V0LCBzdWNjZXNzZnVsbHkgbW1hcHBlZCBwYWdlcyBh
cmUgdW5tYXBwZWQgdmlhIHRoZSBtbXVfbm90aWZpZXIgCnJlbGVhc2UgY2FsbGJhY2suIFNvIGRv
aW5nIGl0IGluIGdudGRldl9wdXRfbWFwKCkgaXNuJ3QgcG9zc2libGUgd2l0aG91dCAKZnVydGhl
ciBjaGFuZ2VzLgoKLS0gClJvc3MgTGFnZXJ3YWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
