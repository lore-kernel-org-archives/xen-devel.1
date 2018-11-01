From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: remove size limit of privcmd-buf
 mapping interface
Date: Thu, 1 Nov 2018 17:27:18 +0100
Message-ID: <12dd8625-2cad-f156-8bae-487e909af412__904.869489795779$1541089571$gmane$org@suse.com>
References: <20181101123307.8424-1-jgross@suse.com>
 <5BDB0B240200007800142507@prv1-mh.provo.novell.com>
 <b64f7fa4-a553-bcb4-6051-c91080642b8e@suse.com>
 <5BDB20AB020000780014251B@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=4oi9=nm=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gIFoY-0004VC-PF
 for xen-devel@lists.xenproject.org; Thu, 01 Nov 2018 16:27:22 +0000
In-Reply-To: <5BDB20AB020000780014251B@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, sstabellini@kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMTEvMjAxOCAxNjo1MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPiAxMS8wMS8xOCAzOjIzIFBNID4+Pgo+PiBPbiAwMS8xMS8yMDE4
IDE1OjE4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4gMTEvMDEvMTggMTozNCBQTSA+Pj4KPj4+PiBDdXJyZW50bHkgdGhlIHNpemUgb2Yg
aHlwZXJjYWxsIGJ1ZmZlcnMgYWxsb2NhdGVkIHZpYQo+Pj4+IC9kZXYveGVuL2h5cGVyY2FsbCBp
cyBsaW1pdGVkIHRvIGEgZGVmYXVsdCBvZiA2NCBtZW1vcnkgcGFnZXMuIEZvciBsaXZlCj4+Pj4g
bWlncmF0aW9uIG9mIGd1ZXN0cyB0aGlzIG1pZ2h0IGJlIHRvbyBzbWFsbCBhcyB0aGUgcGFnZSBk
aXJ0eSBiaXRtYXNrCj4+Pj4gbmVlZHMgdG8gYmUgc2l6ZWQgYWNjb3JkaW5nIHRvIHRoZSBzaXpl
IG9mIHRoZSBndWVzdC4gVGhpcyBtZWFucwo+Pj4+IG1pZ3JhdGluZyBhIDhHQiBzaXplZCBndWVz
dCBpcyBhbHJlYWR5IGV4aGF1c3RpbmcgdGhlIGRlZmF1bHQgYnVmZmVyCj4+Pj4gc2l6ZSBmb3Ig
dGhlIGRpcnR5IGJpdG1hcC4KPj4+Pgo+Pj4+IFRoZXJlIGlzIG5vIHNlbnNpYmxlIHdheSB0byBz
ZXQgYSBzYW5lIGxpbWl0LCBzbyBqdXN0IHJlbW92ZSBpdAo+Pj4+IGNvbXBsZXRlbHkuIFRoZSBk
ZXZpY2Ugbm9kZSdzIHVzYWdlIGlzIGxpbWl0ZWQgdG8gcm9vdCBhbnl3YXksIHNvIHRoZXJlCj4+
Pj4gaXMgbm8gYWRkaXRpb25hbCBET1Mgc2NlbmFyaW8gYWRkZWQgYnkgYWxsb3dpbmcgdW5saW1p
dGVkIGJ1ZmZlcnMuCj4+Pgo+Pj4gQnV0IGlzIHRoaXMgc2V0dGluZyBvZiBwZXJtaXNzaW9ucyB3
aGF0IHdlIHdhbnQgbG9uZyB0ZXJtPyBXaGF0IGFib3V0IGEKPj4+IGRlLXByaXZpbGVnZWQgcWVt
dSwgd2hpY2ggc3RpbGwgbmVlZHMgdG8gYmUgYWJsZSB0byBpc3N1ZSBhdCBsZWFzdCBkbS1vcAo+
Pj4gaHlwZXJjYWxscz8KPj4KPj4gV291bGRuJ3QgdGhhdCBxZW11IGhhdmUgb3BlbmVkIHRoZSBu
b2RlIHdoaWxlIHN0aWxsIGJlaW5nIHByaXZpbGVnZWQ/Cj4gCj4gUG9zc2libHksIGJ1dCBob3cg
ZG9lcyB0aGlzIGhlbHA/IEFzIHNvb24gYXMgaXQncyB1bnByaXZpbGVnZWQgaXQgbXVzdCBub3QK
PiBiZSBhYmxlIHRvIGhvZyByZXNvdXJjZXMgYW55bW9yZS4KPiAKPiBBbnl3YXksIHdpdGggQW5k
cmV3J3MgcmVwbHkgbXkgcG9pbnQgbWF5IGJlIGlycmVsZXZhbnQsIGJ1dCBJIGhhdmUgdG8KPiBh
ZG1pdCBJJ20gbm90IGVudGlyZWx5IHN1cmUuCgpJIGd1ZXNzIHdlIHdhbnQgWGVuIHRvb2xzIHRv
IGNsb3NlIC9kZXYveGVuL2h5cGVyY2FsbCAob3IgbW9yZSBwcmVjaXNlOgpkb24ndCBkdXAyKCkg
aXQpIHdoZW4gcWVtdSBpcyBkZS1wcml2aWxlZ2luZyBpdHNlbGYuIFRoaXMgd2lsbCBtYWtlIGl0
CnZlcnkgY2xlYXIgdGhhdCBpdCBjYW4ndCBob2cgbWVtb3J5IHZpYSBtbWFwKCkuCgpXaGVuIHlv
dSBhcmUgZmluZSB3aXRoIHRoYXQgSSdsbCBzZW5kIGEgWGVuIHBhdGNoIGZvciB0aGlzLgoKCkp1
ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
