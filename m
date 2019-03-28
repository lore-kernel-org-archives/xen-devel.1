From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 01/12] xen: clang: Support correctly
 cross-compile
Date: Thu, 28 Mar 2019 04:56:20 -0600
Message-ID: <5C9CA85402000078002226AF@prv1-mh.provo.novell.com>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-2-julien.grall@arm.com>
 <5C9C9A22020000780022265A@prv1-mh.provo.novell.com>
 <22e51ded-0ca3-6832-dcc3-9849d782816c@citrix.com>
 <5C9CA1DA0200007800222683@prv1-mh.provo.novell.com>
 <e7e55dc3-0f64-78d7-6f0b-67a8da2453c0@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r6Gf=R7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h9Shz-0001m4-DR
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2019 10:56:31 +0000
In-Reply-To: <e7e55dc3-0f64-78d7-6f0b-67a8da2453c0@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, oleksandr_tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjAzLjE5IGF0IDExOjQzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjgvMDMvMjAxOSAxMDoyOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDI4
LjAzLjE5IGF0IDExOjE0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBV
c2luZyAtdGFyZ2V0IGlzIGZyb20gdGhlIENsYW5nIGluc3RydWN0aW9ucyBvbiBjcm9zcyBjb21w
aWxhdGlvbiwgd2hpY2gKPj4+IHNheSB0byBkbyBpdCB0aGlzIHdheS4gIGh0dHBzOi8vY2xhbmcu
bGx2bS5vcmcvZG9jcy9Dcm9zc0NvbXBpbGF0aW9uLmh0bWwgCj4+Pgo+Pj4gVGhlIHRhcmdldHMg
c3VwcG9ydGVkIHdpbGwgZGVwZW5kIG9uIHRoZSBjb25maWd1cmF0aW9uIENsYW5nIHdhcwo+Pj4g
Y29tcGlsZWQgd2l0aCwgYnV0IENsYW5nIHNwZWNpZmljYWxseSBvcHBvc2VzIEdDQydzIHdheSBv
ZiByZXF1aXJpbmcgdGhlCj4+PiB1c2VyIHRvIHJlY29tcGlsZSBmb3IgZXZlcnkgZGlmZmVyZW50
IHRhcmdldC4gIEl0IGlzIGV4cGVjdGVkIHRoYXQgYQo+Pj4gcGFja2FnZXIgb2YgY2xhbmcgd2ls
bCBlbmFibGUgYWxsIG9mIHRoZSBzdXBwb3J0ZWQgdGFyZ2V0cyBpbiB0aGUKPj4+IHBhY2thZ2Ug
dGhleSBkaXN0cmlidXRlLgo+PiBBcmUgeW91IHN1cmUgYSBkaXN0cm8gY2FyaW5nIGFib3V0LCBz
YXksIG9ubHkgeDg2IHdvdWxkIGluZGVlZAo+PiBlbmFibGUgQXJtIGFuZCBhbGwgc29ydHMgb2Yg
b3RoZXIgYXJjaGl0ZWN0dXJlcyBpbiB0aGUgY29tcGlsZXIsCj4+IGp1c3QgYmVjYXVzZSBpdCBj
YW4gYmUgZW5hYmxlZD8gSU9XIEkgYXNzdW1lIHRoZSBuZWVkIGZvciBhbgo+PiBvdmVycmlkZSB0
byB0aGUgc3lzdGVtIGRlZmF1bHQgY2xhbmcgYmluYXJpZXMgd291bGQgc3RpbGwgZXhpc3QuCj4g
Cj4gSSd2ZSBqdXN0IHRyaWVkLCBhbmQgVWJ1bnR1IDE2LjA0J3MgZGVmYXVsdCBjbGFuZy0zLjgg
aXMgcGVyZmVjdGx5IGhhcHB5Cj4gY29tcGlsaW5nIEFhcmNoNjQsIGFuZCBtYWtlcyBhIHN1aXRh
YmxlIGxvb2tpbmcgZWxmIG9iamVjdC4gIChJIGNhbid0Cj4gYWN0dWFsbHkgZGlzYXNzZW1ibGUg
aXQgYmVjYXVzZSBvYmpkdW1wIGNob2tlcywgYnV0IC50ZXh0IGlzIHRoZQo+IGV4cGVjdGVkIGxl
bmd0aCkKPiAKPiBBcyB0aGUgY3Jvc3MtY29tcGlsYXRpb24gZG9jdW1lbnRhdGlvbiBzdGF0ZXMs
IHRoaXMgaXMgYSBkZWxpYmVyYXRlCj4gZGVzaWduIGRlY2lzaW9uIHdoaWNoLCBhbW9uZ3N0IG90
aGVyIHRoaW5ncywgcHJldmVudHMgZGlzdHJvcyBmcm9tCj4gbmVlZGluZyB0byBtYWludGFpbiBw
ZXItYXJjaCBwYWNrYWdlcy4KCkFsbCB1bmRlcnN0b29kLCBqdXN0IHRoYXQgVWJ1bnR1IG1heSBu
b3QgYmUgYSBnb29kIGV4YW1wbGUsIGFzCnRoZXJlIGxvb2tzIHRvIGJlIFVidW50dSAxNi4wNCBm
b3IgNjQtYml0IEFybS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
