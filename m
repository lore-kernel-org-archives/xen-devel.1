From: Milan Boberic <milanboberic94@gmail.com>
Subject: Re: Xen optimization
Date: Thu, 11 Oct 2018 14:17:54 +0200
Message-ID: <CADJ6SV0_5fSi1YkDYGGSEra4JDPDgu0ZnBfJwsEtv9UY7r6j_A@mail.gmail.com>
References: <CADJ6SV1__ZWDhGWoW7u=W54zG1STSnchkg0enyQoPyEB9YGXPg@mail.gmail.com>
 <995da0578f0953662536edabb5807fd76ca4d8ce.camel@suse.com>
 <CADJ6SV1yDBptrcaoqUPChtnXTmvhbzj-AAv2FDN2LCMyTipc-A@mail.gmail.com>
 <CAENZ-+=mWFnJ-4OFK+bjb4rimNNB_x4qHFVAbTM1mFd2Sg7s3g@mail.gmail.com>
 <CADJ6SV1Mdnjyd8oEcB4ZCZKuR0LkJ82GCf5s1+AwgASe8vLMWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zb/w=mx=gmail.com=milanboberic94@srs-us1.protection.inumbo.net>)
 id 1gAZuq-0004cD-JE
 for xen-devel@lists.xenproject.org; Thu, 11 Oct 2018 12:18:08 +0000
Received: by mail-lf1-x143.google.com with SMTP id d4-v6so6509553lfa.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Oct 2018 05:18:07 -0700 (PDT)
In-Reply-To: <CADJ6SV1Mdnjyd8oEcB4ZCZKuR0LkJ82GCf5s1+AwgASe8vLMWg@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Meng Xu <xumengpanda@gmail.com>
Cc: xen-devel@lists.xenproject.org, julien.grall@arm.com, sstabellini@kernel.org, andrii_anisov@epam.com, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

SSBtaXN1bmRlcnN0b29kIHRoZSBwYXNzdGhyb3VnaCBjb25jZXB0LCBpdCBvbmx5IGFsbG93cyBn
dWVzdCBkb21haW4KdG8gdXNlIGNlcnRhaW4gaW50ZXJydXB0cyBhbmQgbWVtb3J5LiBJcyB0aGVy
ZSBhcmUgd2F5IHRvIHNvbWVob3cKcm91dGUgaW50ZXJydXB0IGZyb20gZG9tVSAoYmFyZS1tZXRh
bCBhcHApIHRvIGh3PwpPbiBUaHUsIE9jdCAxMSwgMjAxOCBhdCA5OjM2IEFNIE1pbGFuIEJvYmVy
aWMgPG1pbGFuYm9iZXJpYzk0QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIE9jdCAxMCwg
MjAxOCBhdCA2OjQxIFBNIE1lbmcgWHUgPHh1bWVuZ3BhbmRhQGdtYWlsLmNvbT4gd3JvdGU6Cj4g
Pgo+ID4gVGhlIGppdHRlciBtYXkgY29tZSBmcm9tIFhlbiBvciB0aGUgT1MgaW4gZG9tMC4KPiA+
IEl0IHdpbGwgYmUgdXNlZnVsIHRvIGtub3cgd2hhdCBpcyB0aGUgaml0dGVyIGlmIHlvdSBydW4g
dGhlIHRlc3Qgb24gUGV0YUxpbnV4Lgo+ID4gKEl0J3MgdW5kZXJzdGFuZGFibGUgdGhlIGppdHRl
ciBpcyBnb25lIHdpdGhvdXQgT1MuIEl0IGlzIGFsc28gY29tbW9uCj4gPiB0aGF0IE9TIGludHJv
ZHVjZXMgdmFyaW91cyBpbnRlcmZlcmVuY2VzLikKPgo+IEhpIE1lbmcsCj4gd2VsbC4uLiBJJ20g
dXNpbmcgYmFyZS1tZXRhbCBhcHBsaWNhdGlvbiBhbmQgSSBuZWVkIGl0IGV4Y2x1c2l2ZWx5IHRv
Cj4gYmUgcmFuIG9uIG9uZSBDUFUgYXMgZG9tVSAoZ3Vlc3QpIHdpdGhvdXQgT1MgKGFuZCBJJ20g
bm90IHN1cmUgaG93Cj4gd291bGQgSSBtYWtlIHRoZSBzYW1lIGFwcCB0byBiZSByYW4gb24gUGV0
YUxpbnV4IGRvbTAgOkQgaGFoYSkuCj4gSXMgdGhlcmUgYSBjaGFuY2UgdGhhdCBQZXRhTGludXgg
YXMgZG9tMCBpcyBjcmVhdGluZyB0aGlzIGppdHRlciBhbmQKPiBob3c/IElzIHRoZXJlIGEgd2F5
IG9mIGRlY3JlYXNpbmcgaXQ/Cj4KPiBZZXMsIHRoZXJlIGFyZSBubyBwcmludHMuCj4KPiBJJ20g
bm90IHN1cmUgYWJvdXQgdGhpcyB0aW1lciBpbnRlcnJ1cHQgcGFzc3Rocm91Z2ggYmVjYXVzZSBJ
IGRpZG4ndAo+IGZpbmQgYW55IGV4YW1wbGUgb2YgaXQsIGluIGF0dGFjaG1lbnQgSSBpbmNsdWRl
ZCB4ZW4tb3ZlcmxheS5kdHNpIGZpbGUKPiB3aGljaCBJIGVkaXRlZCB0byBhZGQgcGFzc3Rocm91
Z2gsIGluIGVhcmxpZXIgcmVwbGllcyB0aGVyZSBhcmUKPiBiYXJlLW1ldGFsIGNvbmZpZ3VyYXRp
b24gZmlsZS4gSXQgd291bGQgYmUgaGVscGZ1bCB0byBrbm93IGlmIHRob3NlCj4gc2V0dGluZyBh
cmUgY29ycmVjdC4gSWYgdGhleSBhcmUgbm90IGNvcnJlY3QgaXQgd291bGQgZXhwbGFpbiB0aGUK
PiBqaXR0ZXIuCj4KPiBUaGFua3MgaW4gYWR2YW5jZSwgTWlsYW4gQm9iZXJpYyEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
