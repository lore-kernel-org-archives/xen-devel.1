From: "Jan Beulich" <jbeulich@suse.com>
Subject: Re: [PATCH] xen: remove size limit of privcmd-buf
 mapping interface
Date: Thu, 01 Nov 2018 09:50:03 -0600
Message-ID: <5BDB20AB020000780014251B__33084.4561024152$1541087348$gmane$org@prv1-mh.provo.novell.com>
References: <20181101123307.8424-1-jgross@suse.com>
 <5BDB0B240200007800142507@prv1-mh.provo.novell.com>
 <b64f7fa4-a553-bcb4-6051-c91080642b8e@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mjq2=nm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gIFEV-0000qT-U2
 for xen-devel@lists.xenproject.org; Thu, 01 Nov 2018 15:50:07 +0000
In-Reply-To: <b64f7fa4-a553-bcb4-6051-c91080642b8e@suse.com>
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
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, sstabellini@kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4gMTEvMDEvMTggMzoyMyBQTSA+Pj4K
Pk9uIDAxLzExLzIwMTggMTU6MTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBKdWVyZ2VuIEdy
b3NzIDxqZ3Jvc3NAc3VzZS5jb20+IDExLzAxLzE4IDE6MzQgUE0gPj4+Cj4+PiBDdXJyZW50bHkg
dGhlIHNpemUgb2YgaHlwZXJjYWxsIGJ1ZmZlcnMgYWxsb2NhdGVkIHZpYQo+Pj4gL2Rldi94ZW4v
aHlwZXJjYWxsIGlzIGxpbWl0ZWQgdG8gYSBkZWZhdWx0IG9mIDY0IG1lbW9yeSBwYWdlcy4gRm9y
IGxpdmUKPj4+IG1pZ3JhdGlvbiBvZiBndWVzdHMgdGhpcyBtaWdodCBiZSB0b28gc21hbGwgYXMg
dGhlIHBhZ2UgZGlydHkgYml0bWFzawo+Pj4gbmVlZHMgdG8gYmUgc2l6ZWQgYWNjb3JkaW5nIHRv
IHRoZSBzaXplIG9mIHRoZSBndWVzdC4gVGhpcyBtZWFucwo+Pj4gbWlncmF0aW5nIGEgOEdCIHNp
emVkIGd1ZXN0IGlzIGFscmVhZHkgZXhoYXVzdGluZyB0aGUgZGVmYXVsdCBidWZmZXIKPj4+IHNp
emUgZm9yIHRoZSBkaXJ0eSBiaXRtYXAuCj4+Pgo+Pj4gVGhlcmUgaXMgbm8gc2Vuc2libGUgd2F5
IHRvIHNldCBhIHNhbmUgbGltaXQsIHNvIGp1c3QgcmVtb3ZlIGl0Cj4+PiBjb21wbGV0ZWx5LiBU
aGUgZGV2aWNlIG5vZGUncyB1c2FnZSBpcyBsaW1pdGVkIHRvIHJvb3QgYW55d2F5LCBzbyB0aGVy
ZQo+Pj4gaXMgbm8gYWRkaXRpb25hbCBET1Mgc2NlbmFyaW8gYWRkZWQgYnkgYWxsb3dpbmcgdW5s
aW1pdGVkIGJ1ZmZlcnMuCj4+IAo+PiBCdXQgaXMgdGhpcyBzZXR0aW5nIG9mIHBlcm1pc3Npb25z
IHdoYXQgd2Ugd2FudCBsb25nIHRlcm0/IFdoYXQgYWJvdXQgYQo+PiBkZS1wcml2aWxlZ2VkIHFl
bXUsIHdoaWNoIHN0aWxsIG5lZWRzIHRvIGJlIGFibGUgdG8gaXNzdWUgYXQgbGVhc3QgZG0tb3AK
Pj4gaHlwZXJjYWxscz8KPgo+V291bGRuJ3QgdGhhdCBxZW11IGhhdmUgb3BlbmVkIHRoZSBub2Rl
IHdoaWxlIHN0aWxsIGJlaW5nIHByaXZpbGVnZWQ/CgpQb3NzaWJseSwgYnV0IGhvdyBkb2VzIHRo
aXMgaGVscD8gQXMgc29vbiBhcyBpdCdzIHVucHJpdmlsZWdlZCBpdCBtdXN0IG5vdApiZSBhYmxl
IHRvIGhvZyByZXNvdXJjZXMgYW55bW9yZS4KCkFueXdheSwgd2l0aCBBbmRyZXcncyByZXBseSBt
eSBwb2ludCBtYXkgYmUgaXJyZWxldmFudCwgYnV0IEkgaGF2ZSB0bwphZG1pdCBJJ20gbm90IGVu
dGlyZWx5IHN1cmUuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
