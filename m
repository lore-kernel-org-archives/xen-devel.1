From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen: remove size limit of privcmd-buf
 mapping interface
Date: Fri, 02 Nov 2018 01:26:12 -0600
Message-ID: <5BDBFC1402000078001F7101__32535.4045293809$1541143566$gmane$org@prv1-mh.provo.novell.com>
References: <20181101123307.8424-1-jgross@suse.com>
 <5BDB0B240200007800142507@prv1-mh.provo.novell.com>
 <b64f7fa4-a553-bcb4-6051-c91080642b8e@suse.com>
 <5BDB20AB020000780014251B@suse.com>
 <12dd8625-2cad-f156-8bae-487e909af412@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wbrw=nn=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gITrS-0006tp-IJ
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 07:27:18 +0000
In-Reply-To: <12dd8625-2cad-f156-8bae-487e909af412@suse.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjExLjE4IGF0IDE3OjI3LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAw
MS8xMS8yMDE4IDE2OjUwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPiAxMS8wMS8xOCAzOjIzIFBNID4+Pgo+Pj4gT24gMDEvMTEvMjAxOCAx
NToxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+Pj4gSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPiAxMS8wMS8xOCAxOjM0IFBNID4+Pgo+Pj4+PiBDdXJyZW50bHkgdGhlIHNpemUgb2Yg
aHlwZXJjYWxsIGJ1ZmZlcnMgYWxsb2NhdGVkIHZpYQo+Pj4+PiAvZGV2L3hlbi9oeXBlcmNhbGwg
aXMgbGltaXRlZCB0byBhIGRlZmF1bHQgb2YgNjQgbWVtb3J5IHBhZ2VzLiBGb3IgbGl2ZQo+Pj4+
PiBtaWdyYXRpb24gb2YgZ3Vlc3RzIHRoaXMgbWlnaHQgYmUgdG9vIHNtYWxsIGFzIHRoZSBwYWdl
IGRpcnR5IGJpdG1hc2sKPj4+Pj4gbmVlZHMgdG8gYmUgc2l6ZWQgYWNjb3JkaW5nIHRvIHRoZSBz
aXplIG9mIHRoZSBndWVzdC4gVGhpcyBtZWFucwo+Pj4+PiBtaWdyYXRpbmcgYSA4R0Igc2l6ZWQg
Z3Vlc3QgaXMgYWxyZWFkeSBleGhhdXN0aW5nIHRoZSBkZWZhdWx0IGJ1ZmZlcgo+Pj4+PiBzaXpl
IGZvciB0aGUgZGlydHkgYml0bWFwLgo+Pj4+Pgo+Pj4+PiBUaGVyZSBpcyBubyBzZW5zaWJsZSB3
YXkgdG8gc2V0IGEgc2FuZSBsaW1pdCwgc28ganVzdCByZW1vdmUgaXQKPj4+Pj4gY29tcGxldGVs
eS4gVGhlIGRldmljZSBub2RlJ3MgdXNhZ2UgaXMgbGltaXRlZCB0byByb290IGFueXdheSwgc28g
dGhlcmUKPj4+Pj4gaXMgbm8gYWRkaXRpb25hbCBET1Mgc2NlbmFyaW8gYWRkZWQgYnkgYWxsb3dp
bmcgdW5saW1pdGVkIGJ1ZmZlcnMuCj4+Pj4KPj4+PiBCdXQgaXMgdGhpcyBzZXR0aW5nIG9mIHBl
cm1pc3Npb25zIHdoYXQgd2Ugd2FudCBsb25nIHRlcm0/IFdoYXQgYWJvdXQgYQo+Pj4+IGRlLXBy
aXZpbGVnZWQgcWVtdSwgd2hpY2ggc3RpbGwgbmVlZHMgdG8gYmUgYWJsZSB0byBpc3N1ZSBhdCBs
ZWFzdCBkbS1vcAo+Pj4+IGh5cGVyY2FsbHM/Cj4+Pgo+Pj4gV291bGRuJ3QgdGhhdCBxZW11IGhh
dmUgb3BlbmVkIHRoZSBub2RlIHdoaWxlIHN0aWxsIGJlaW5nIHByaXZpbGVnZWQ/Cj4+IAo+PiBQ
b3NzaWJseSwgYnV0IGhvdyBkb2VzIHRoaXMgaGVscD8gQXMgc29vbiBhcyBpdCdzIHVucHJpdmls
ZWdlZCBpdCBtdXN0IG5vdAo+PiBiZSBhYmxlIHRvIGhvZyByZXNvdXJjZXMgYW55bW9yZS4KPj4g
Cj4+IEFueXdheSwgd2l0aCBBbmRyZXcncyByZXBseSBteSBwb2ludCBtYXkgYmUgaXJyZWxldmFu
dCwgYnV0IEkgaGF2ZSB0bwo+PiBhZG1pdCBJJ20gbm90IGVudGlyZWx5IHN1cmUuCj4gCj4gSSBn
dWVzcyB3ZSB3YW50IFhlbiB0b29scyB0byBjbG9zZSAvZGV2L3hlbi9oeXBlcmNhbGwgKG9yIG1v
cmUgcHJlY2lzZToKPiBkb24ndCBkdXAyKCkgaXQpIHdoZW4gcWVtdSBpcyBkZS1wcml2aWxlZ2lu
ZyBpdHNlbGYuIFRoaXMgd2lsbCBtYWtlIGl0Cj4gdmVyeSBjbGVhciB0aGF0IGl0IGNhbid0IGhv
ZyBtZW1vcnkgdmlhIG1tYXAoKS4KPiAKPiBXaGVuIHlvdSBhcmUgZmluZSB3aXRoIHRoYXQgSSds
bCBzZW5kIGEgWGVuIHBhdGNoIGZvciB0aGlzLgoKSWYgdGhhdCBkb2Vzbid0IHByZXZlbnQgdGhl
IHByb2Nlc3MgZnJvbSBtYWtpbmcgdGhlIGh5cGVyY2FsbHMgaXQKaXMgcGVybWl0dGVkIHRvIGRv
IChJIGhhdmUgdG8gYWRtaXQgSSBkb24ndCByZWNhbGwgaWYgdGhlcmUgYXJlIGFueQpzdGlsbCBu
ZWVkZWQgYmVzaWRlcyB0aGUgZG1vcCBvbmVzKSwgc3VyZS4KCkphbgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
